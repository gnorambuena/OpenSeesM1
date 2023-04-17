# Building OpenSees and OpenSeesPy for Apple M1 (aarch)

This guide will help you build OpenSees and OpenSeesPy for the Apple M1 (aarch) architecture using two scripts: `build_m1.sh` and `install_openseespy_m1.sh`.

## Prerequisites

- Make sure you have [Homebrew](https://brew.sh/) installed on your system.

## Steps

1. Clone the GitHub repository containing the `build_m1.sh` and `install_openseespy_m1.sh` scripts.
    `git clone https://github.com/gnorambuena/OpenSeesM1.git`

2. Navigate to the directory containing the scripts.

    `cd OpenSeesM1`

3. Give the scripts executable permissions:

   `chmod +x build_m1.sh install_openseespy_m1.sh`

4. Run the `build_m1.sh` script to build OpenSees, OpenSeesMP, and OpenSeesSP:

    `./build_m1.sh`

This script will install the required dependencies, build the MUMPS library, and build OpenSees, OpenSeesMP, and OpenSeesSP.

5. After the `build_m1.sh` script has successfully completed, run the `install_openseespy_m1.sh` script to copy OpenSeesPy. This step will copy the files `opensees.so` and `openseespy.dylib` to the installed packages directory of the current Python interpreter:

    `./install_openseespy_m1.sh`


This script will build the OpenSeesPy target and move the required files to the appropriate location, making OpenSeesPy available for use in Python.

6. Verify that OpenSeesPy is installed correctly by running the following command in your terminal:

    `python3 -c "import openseespy; print('OpenSeesPy installed successfully!')"`


If the installation was successful, you should see the message "OpenSeesPy installed successfully!" printed in your terminal.

Now you have successfully built and installed OpenSees and OpenSeesPy for the Apple M1 (aarch) architecture.


