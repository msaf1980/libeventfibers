#!/bin/bash

CC=gcc
LD=gcc
BUILD_TYPE=Debug
EIO=
CFLAGS=

for i in "$@"
do
	case $i in
		clang)
			CC=clang
			LD=clang
			;;
		gcc)
			CC=gcc
			LD=gcc
			;;
		deb*)
			BUILD_TYPE=Debug
			;;
		rel*)
			BUILD_TYPE=RelWithDebInfo
			;;
		+valgrind)
			VALGRIND="-DWANT_VALGRIND=TRUE"
			;;
		cov*)
			CC=gcc
			LD=gcc
			CFLAGS="$CFLAGS -fprofile-arcs -ftest-coverage"
			;;
		*)
			echo "Unknown option: $i"
			exit
			;;
esac
done

if [ -d build ] ; then
        rm -rf build
fi
mkdir build

pushd build

export LD
export CC
export CFLAGS

echo cmake -DCMAKE_BUILD_TYPE=$BUILD_TYPE $VALGRIND ..
echo
cmake -DCMAKE_BUILD_TYPE=$BUILD_TYPE $VALGRIND ..
echo

make
echo

popd
