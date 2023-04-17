#!/bin/bash

# Get the site-packages directory of the current Python
site_packages=$(python3 -c "import site; print(site.getsitepackages()[0])")

# copy opensees.so and openseespy.dylib to the site-packages directory
cp ./lib/opensees.so "$site_packages"
cp ./lib/OpenSeesPy.dylib "$site_packages"

echo "OpenSeesPy successfully installed on $site_packages"
