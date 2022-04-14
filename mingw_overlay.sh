#!/usr/bin/sh

RELEASE_TYPE=Release
MAKE=mingw32-make

if [[ ! -d build ]]; then
	mkdir build
fi

if [[ -d build/fltk ]]; then
	cd build/fltk/
	git pull
	cd build
else
	cd build && git clone https://github.com/fltk/fltk.git
	mkdir fltk/build && cd fltk/build 
	cmake \
		-D CMAKE_BUILD_TYPE=${RELEASE_TYPE} \
		-G "MinGW Makefiles" \
		-D CMAKE_TOOLCHAIN_FILE=../../toolchain.cmake \
		-D FLTK_BUILD_TEST=OFF \
		-D FLTK_BUILD_EXAMPLES=OFF \
		-D OPTION_USE_SYSTEM_ZLIB=OFF  \
		-D OPTION_USE_SYSTEM_LIBPNG=OFF \
		-D OPTION_USE_SYSTEM_LIBJPEG=OFF \
		-D OPTION_USE_GL=False \
		..

	cp ../../../resources/fltk/config.h .
fi

${MAKE}

cd ../../..

if [[ -d build/kv3 ]]; then
	cd build/kv3/
	git pull
	cd build
else
	mkdir build/kv3

	cd build && git clone https://github.com/markjolesen/kv3.git

	cp -r ../resources/icons build/kv3

	echo 'Icon=kasoverb_logo_64x64.svg' >> kv3/resources/desktop/kv3.desktop

	cat ../resources/src/CMakeLists.txt >> kv3/CMakeLists.txt

	cd kv3 && mkdir build && cd build

	FLTK_DIR=../../fltk/build cmake \
		-G "MinGW Makefiles" \
		-D CMAKE_TOOLCHAIN_FILE=../../toolchain.cmake \
		-D CMAKE_CXX_FLAGS_INIT='-I ../../../../../resources/icons -D BRANIND_KV3_ICON -D BRANDING_KV3_LABEL=\"KasoVerb\"' \
		-D CMAKE_BUILD_TYPE=${RELEASE_TYPE} \
		..
fi

${MAKE}
