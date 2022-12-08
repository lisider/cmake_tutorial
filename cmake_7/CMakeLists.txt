## 目标名称
PROJECT(main)

##最小版本限制
CMAKE_MINIMUM_REQUIRED(VERSION 2.6)

##编译问题
INCLUDE_DIRECTORIES(src/module1)
INCLUDE_DIRECTORIES(src/module2)
ADD_COMPILE_OPTIONS(-g)

## 链接目录问题
#LINK_DIRECTORIES("/home/suweishuai/pro/test/cmake/cmake_mutil2/src/")

## 子目录1问题
AUX_SOURCE_DIRECTORY(src/module1 MODULE1) #把 src/module1 目录 中的所有 文件 赋值给 MODULE1
ADD_LIBRARY(module1_lib ${MODULE1}) #在这一层添加库

## 子目录2问题
AUX_SOURCE_DIRECTORY(src/module2 MODULE2) #把 src/module2 目录 中的所有 文件 赋值给 MODULE2
ADD_LIBRARY(module2_lib ${MODULE2}) #在这一层添加库

## main file 问题
AUX_SOURCE_DIRECTORY(. DIR_SRCS)
ADD_EXECUTABLE(main ${DIR_SRCS}  )


## 链接档问题
TARGET_LINK_LIBRARIES( main module1_lib module2_lib)
