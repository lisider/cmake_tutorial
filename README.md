## cmake

```c
交叉编译系统 生成器
可以生成 在其他 平台,例如 win 上跑的 vs 工程
```

---


## 工程实例

- cmake_1

```c

告诉我们 一个cmake 工程可以少到什么程度


```

- cmake_2

```c

做了一个有意义的工程

```

- cmake_3

```c

修改了 cmake_2 的工程,让 工程更规范

```

- cmake_4

```c

修改了 cmake_3 的工程, 使用了 变量,更加通用

```

- cmake_5

```c

一个有 子目录的工程的处理方式1

```

- cmake_6

```c

一个有 子目录的工程的处理方式2,有别于 cmak_5

```


- 最少的 CMakeLists.txt 可以少到什么程度

```c
可以 cat /dev/null > CMakeLists.txt
然后cmake ,没有任何问题,会生成一 个 编译系统
```

---

- cmake 的 工程 与 编译隔离

```c
cmake 原生支持 工程与编译隔离
在工程内
mkdir build;cd build;cmake ..
```







---

## 使用规则



```c


在cmake 选项中
最需要关注的是
cmake-buildsystem


cmake 的 编译系统 (和 make 的编译系统不一样)

cmake 的目标 是生成 make编译系统

所以cmake 里面肯定有 目标 ,cmake 兼容了各个平台,所以把目标也提高了一个层次

基于CMake的构建系统被组织为一组高级逻辑目标。
每个目标对应于一个可执行文件或库，或者是一个包含自定义命令的自定义目标。
目标之间的依赖关系在构建系统中表示，以确定构建顺序和响应变化的再生规则。



目标

add_library(xxx xxx.c)

add_executable(yyy yyy.c)

目标依赖关系

target_link_libraries(yyy xxx)



编译时 头文件路径

INCLUDE_DIRECTORIES(inc)


编译时 选项
ADD_COMPILE_OPTIONS(-g)


链接时路径(一个是文件,一个是路径,如果是选择路径,还需要维护 链接时选项 )

LINK_DIRECTORIES("/home/suweishuai/pro/test/cmake/cmake_link/lib/")
LINK_LIBRARIES("/home/suweishuai/pro/test/cmake/cmake_link/lib/libhello.so")


链接时选项(任选一个)

ADD_COMPILE_OPTIONS(-lhello)

target_link_libraries(main hello)
target_link_libraries(main -lhello)
target_link_libraries(main  libhello.so)



```

