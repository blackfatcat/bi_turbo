@REM Creates the windows build files using VS26 build tools and generates all example projects

IF NOT EXIST "build" mkdir "build"
cd build

cmake --preset "Windows Debug" -DBT_STANDALONE=OFF ..\CMakeLists.txt

PAUSE