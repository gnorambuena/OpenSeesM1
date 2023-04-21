#!/bin/bash

# Copy OpenSeesPy.dylib 
cp ./build/lib/OpenSeesPy.dylib ./build/lib/opensees.so

# Get the site-packages directory of the current Python
site_packages=$(python3 -c "import site; print(site.getsitepackages()[0])")

# Create directory
mkdir "$site_packages"/openseespy
# copy opensees.so and openseespy.dylib to the site-packages directory
cp ./build/lib/opensees.so "$site_packages"/openseespy
cp ./build/lib/OpenSeesPy.dylib "$site_packages"/openseespy

echo "OpenSeesPy successfully installed on $site_packages/openseespy"
