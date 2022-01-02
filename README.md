# CMake find_package() stops working when CMAKE_SYSTEM_NAME=iOS

This repository contains an [MCVE](https://stackoverflow.com/help/minimal-reproducible-example) for the CMake issue described in:

* https://discourse.cmake.org/t/find-package-stops-working-when-cmake-system-name-ios/4609
* https://gitlab.kitware.com/cmake/cmake/-/issues/23041

## How to run?

Execute `./build.sh` on a macOS computer and watch the output.  
You'll see that removing `-D CMAKE_SYSTEM_NAME="iOS"` from CMake's invocation fixes the problem.

## Expected output

```
-- The C compiler identification is AppleClang 11.0.0.11000033
-- The CXX compiler identification is AppleClang 11.0.0.11000033
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working C compiler: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Check for working CXX compiler: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
It works!!!
-- Configuring done
-- Generating done
-- Build files have been written to: /Users/benoit/Git/cmake-findpackage-ios-bug/build
```

Notice the `It works!!!` message.

## Actual output

```
-- The C compiler identification is AppleClang 11.0.0.11000033
-- The CXX compiler identification is AppleClang 11.0.0.11000033
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working C compiler: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Check for working CXX compiler: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
CMake Error at CMakeLists.txt:5 (find_package):
  By not providing "FindThePackage.cmake" in CMAKE_MODULE_PATH this project
  has asked CMake to find a package configuration file provided by
  "ThePackage", but CMake did not find one.

  Could not find a package configuration file provided by "ThePackage" with
  any of the following names:

    ThePackageConfig.cmake
    thepackage-config.cmake

  Add the installation prefix of "ThePackage" to CMAKE_PREFIX_PATH or set
  "ThePackage_DIR" to a directory containing one of the above files.  If
  "ThePackage" provides a separate development package or SDK, be sure it has
  been installed.


-- Configuring incomplete, errors occurred!
```