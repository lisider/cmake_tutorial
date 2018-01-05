PROJECT(main)
CMAKE_MINIMUM_REQUIRED(VERSION 2.6)

INCLUDE_DIRECTORIES(inc)
ADD_COMPILE_OPTIONS(-g)
#ADD_COMPILE_OPTIONS(-g -lhello)


#会自动维护 运行时链接

##链接目录
#link_directories("/home/suweishuai/pro/test/cmake/cmake_5/lib/")
LINK_DIRECTORIES("/home/suweishuai/pro/test/cmake/cmake_5/lib/")

##链接文件
#LINK_LIBRARIES("/home/suweishuai/pro/test/cmake/cmake_5/lib/libhello.so")



ADD_SUBDIRECTORY(lib)  #这个是添加一个子目录 ,告诉 要进入这个目录去分析 CMakeLists.txt

AUX_SOURCE_DIRECTORY(. DIR_SRCS)
ADD_EXECUTABLE(main ${DIR_SRCS})
#target_link_libraries(main -lhello)  
#target_link_libraries(main hello)  
target_link_libraries(main  hello) #告诉 除了main 还有一个模块,这个模块并不知道在哪里
