This is script for automatic download and build of the compilers.
It is simple to use:

$ sh start.sh

By default it downloads the latest gcc into ~/Downloads directory, unpacks
sources, builds gcc in the /tmp directory and installs it into the /opt
directory.

You can change all the paths, versions and build options in the settings.sh
file.

Now the script cat build native versions of gcc and llvm compilers. In the file
success_builds you can see all successfully tested build configurations.
