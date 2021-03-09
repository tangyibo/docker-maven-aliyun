# docker-maven-aliyun镜像制作

## 一、项目介绍

maven的docker镜像，使用阿里云代理

## 二、软件版本

maven3.6.3+openjdk8


## 三、使用说明

- 镜像拉取

```
docker pull inrgihc/maven-aliyun:3.6.3-jdk-8
```

- maven打包

```
cd project_dir/
docker run -it --rm \
	--name my-maven-project \
	-v ~/.m2:/opt/maven/localRepository \
	-v "$PWD":/usr/src/mymaven \
	-w /usr/src/mymaven \
  inrgihc/maven-aliyun:3.6.3-jdk-8 mvn clean package -DskipTests
```

## 四、引用项目

https://gitee.com/inrgihc/dbswitch
