set(CMAKE_SYSTEM_NAME Windows)
set(CMAKE_HOST_WIN32 True)
set(CMAKE_CROSS_COMPILING False)
set(CMAKE_SYSTEM_PROCESSOR  "x86_64")
set(CMAKE_SHARED_LIBS OFF)
set(CMAKE_EXE_LINKER_FLAGS "-mwindows -static -static-libgcc -static-libstdc++")
set(CMAKE_FIND_ROOT_PATH /usr/bin)
set(CMAKE_C_COMPILER x86_64-w64-mingw32-gcc)
set(CMAKE_CXX_COMPILER x86_64-w64-mingw32-g++)
set(CMAKE_RC_COMPILER  x86_64-w64-mingw32-windres)
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)
