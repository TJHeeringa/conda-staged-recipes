#!/bin/sh

if test "$CONDA_BUILD_CROSS_COMPILATION" = "1"
then
  CMAKE_ARGS="${CMAKE_ARGS} -DQT_HOST_PATH=${BUILD_PREFIX}"
fi

cmake -LAH -G "Ninja" \
  -DCMAKE_PREFIX_PATH=${PREFIX} \
  -DCMAKE_FIND_FRAMEWORK=LAST \
  -DCMAKE_INSTALL_RPATH:STRING=${PREFIX}/lib \
  -DCMAKE_UNITY_BUILD=OFF -DCMAKE_UNITY_BUILD_BATCH_SIZE=32 \
  -DCMAKE_MESSAGE_LOG_LEVEL=STATUS \
  -DQT_HOST_PATH=${PREFIX} \
  -DFEATURE_quick3d_assimp=OFF \
  -B build ${CMAKE_ARGS} .
cmake --build build --target install
