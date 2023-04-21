#!/bin/bash

# Save the current working directory
initial_directory=$(pwd)

# Update brew and install required packages
echo "Updating brew and installing required packages..."
brew update
brew install cmake gcc open-mpi scalapack python@3.9 conan@1.54.0 hdf5
echo "Finished updating brew and installing packages."

# Create build_m1 directory and change to it
mkdir build_m1
cd build_m1

# Clone and build mumps
echo "Cloning mumps repository..."
git clone https://github.com/OpenSees/mumps.git
cd mumps
echo "Finished cloning mumps repository."

echo "Building mumps..."
mkdir build
cd build

# Save mumps/build directory to a variable
mumps_dir=$(pwd)

cmake .. -Darith=d
cmake --build . --config Release --parallel 4
echo "Finished building mumps."

# Return to the initial directory
cd "$initial_directory"

# Create build directory and change to it
mkdir build
cd build

# Install required packages with conan
conan install .. --build missing

# Configure cmake with the required flags and paths
cmake .. -DMUMPS_DIR="$mumps_dir" -DOPENMPI=TRUE -DSCALAPACK_LIBRARIES="$(brew --cellar scalapack)/$(brew list --versions scalapack | awk '{print $2}')/lib/libscalapack.dylib"

# Build the OpenSees target
echo "Building OpenSees target..."
cmake --build . --config Release --target OpenSees --parallel 4
echo "Finished building OpenSees target."

# Build the OpenSeesPy target
echo "Building OpenSeesPy target..."
cmake --build . --config Release --target OpenSeesPy
echo "Finished building OpenSeesPy target."

# Build the OpenSeesMP target
echo "Building OpenSeesMP target..."
cmake --build . --config Release --target OpenSeesMP
echo "Finished building OpenSeesMP target."

# Build the OpenSeesSP target
echo "Building OpenSeesSP target..."
cmake --build . --config Release --target OpenSeesSP
echo "Finished building OpenSeesSP target."

