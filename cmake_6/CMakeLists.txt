## 目标名称
PROJECT(main)

##最小版本限制
CMAKE_MINIMUM_REQUIRED(VERSION 2.6) 


##编译问题
INCLUDE_DIRECTORIES(inc)
ADD_COMPILE_OPTIONS(-g)

## 链接目录问题
#LINK_DIRECTORIES("/home/suweishuai/pro/test/cmake/cmake_mutil2/src/")

## 子目录问题
AUX_SOURCE_DIRECTORY(src SRC) #把 src 目录 中的所有 文件 赋值给 SRC 
ADD_LIBRARY(src_lib ${SRC}) #在这一层添加库

## main file 问题
AUX_SOURCE_DIRECTORY(. DIR_SRCS)
ADD_EXECUTABLE(main ${DIR_SRCS}  )


## 链接档问题
TARGET_LINK_LIBRARIES( main src_lib )
