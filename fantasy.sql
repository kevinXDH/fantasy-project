/*
 Navicat Premium Data Transfer

 Source Server         : lwk-master
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : 43.143.103.115:3301
 Source Schema         : fantasy

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 29/09/2022 09:48:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL,
  `cid` int NOT NULL DEFAULT 0,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标题',
  `star` int NULL DEFAULT 0 COMMENT '点赞',
  `sort` int NULL DEFAULT 0 COMMENT '排序',
  `content` varchar(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '内容',
  `cover_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '封面图',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文章内容图',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` int NULL DEFAULT 0 COMMENT '是否删除;0未删除 1 删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '博客表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES (1, 1, 1, 'Java 19 正式发布，改善多线程、并发编程难度', 9, 0, 'Java 19 在数分钟前正式发布，这是一个非 LTS（长期支持）版本。该版本的七项功能包括结构化并发、记录模式、外部函数和内存 API 的预览，以及对开源 Linux/RISC-V 指令集架构 (ISA) 的支持。\r\n\r\n新特性\r\nJEP 405 Record Patterns (预览)\r\nJEP 422 Linux/RISC-V Port\r\nJEP 424 Foreign Function & Memory API (预览)\r\nJEP 425 Virtual Threads (预览)\r\nJEP 426 Vector API (第四次孵化)\r\nJEP 427 Pattern Matching for switch (第三次预览)\r\nJEP 428 Structured Concurrency (孵化)\r\n\r\nJEP 405 Record Patterns\r\n这是对Java 17正式生效的Record Class的增强。JEP 405让记录模式和类型模式可以嵌套，以实现强大的、可声明的、可组合的数据处理形式。\r\n\r\nJEP 422 Linux/RISC-V Port\r\n由于 RISC-V 指令集架构的硬件越来越多，从Java 19开始提供相应架构的端口。\r\nRISC-V是一个免费和开源的 RISC 指令集架构 (ISA)，最初由加州大学伯克利分校设计，现在在RISC-V International的赞助下合作开发。它已经被广泛的语言工具链支持。随着 RISC-V 硬件的日益普及，JDK 的移植将是有价值的。\r\n\r\nJEP 424 Foreign Function & Memory API\r\n通过该特性，Java 程序可以通过 API 与 Java 运行时之外的代码和数据进行互操作。通过有效地调用外部函数（即JVM之外的代码）和安全地访问外部内存（即不受 JVM 管理的内存），API 使 Java 程序能够调用 native 库并处理 native 数据，比使用JNI更加安全。这个JEP并不是第一次预览，从JDK 14开始陆续相关的特性都经过孵化和预览，本次是对以往的相关预览特性的改进。', 'https://img-blog.csdnimg.cn/img_convert/fffc410f4fcbba67bedf689210c96e36.png', NULL, '2022-09-21 21:45:12', '2022-09-27 22:06:40', 1);
INSERT INTO `blog` VALUES (2, 1, 4, 'Python基础知识点总结', 56, 0, '一、开发环境搭建\r\n1.1 Python解释器的安装\r\nPython解释器的安装\r\n1.2 集成开发环境PyCharm安装\r\n集成开发环境PyCharm安装\r\n\r\n二、基本语法元素\r\nPython语言基本语法元素\r\n2.1 程序的格式框架\r\n  程序的格式框架，即段落格式，是Python语法的一部分，可以提高代码的可读性和可维护性。\r\n2.1.1 缩进\r\n  Python语言采用严格的缩进来表示程序逻辑。也就是我们所说的Python程序间的包含与层次关系。一般代码不要求缩进，顶行编写且不留空白。在if、while、for、def、class等保留字所在完整语句后通过英文的“:”结尾并在之后行进行缩进，表明后续代码与紧邻无缩进语句的所属关系。\r\n  缩进可以用Tab键实现，也可以用多个空格实现（一般是4个空格），但两者不能混用。建议采用4个空格方式书写代码。\r\n2.1.2 注释\r\n  注释是代码中的辅助性文字，会被编译器或解释器略去，不被计算机执行，一般用于程序员对代码的说明。Python语言中使用“#”表示一行注释的开始。注释可以在一行中任意位置通过“#”开始，其后面的本行内容被当作注释，而之前的内容依然是Python执行程序的一部分。\r\n注释的作用：\r\n注释一般用于在代码中标明作者和版权信息\r\n解释代码原理和用途\r\n通过注释单行代码辅助程序调试。\r\n2.2 语法元素的名称\r\n  Python语言的基本单位是单词，少部分单词是Python语言规定的，被称为保留字。大部分单词是用户自己定义的，通过命名过程形成了变量或函数，用来代表数据或代码，称为标识符。\r\n\r\n2.2.1 变量\r\n  变量是保存和表示数据值的一种语法元素，变量的值是可以改变的，通过赋值运算符“=”方式被修改。Python语言中，变量可以随时命名、随时赋值、随时使用。', 'https://img-blog.csdnimg.cn/8d12d781a83b4bd8b1400d2ee35ddc0e.jpeg?x-oss-process=image/resize,m_fixed,h_300,image/format,png', NULL, '2022-09-07 21:46:16', NULL, 0);
INSERT INTO `blog` VALUES (3, 1, 5, '基于Java+SpringBoot+vue学生学习平台详细设计实现', 222, 0, '在Internet高速发展的今天,我们生活的各个领域都涉及到计算机的应用,其中包括学习平台的网络应用,在外国学习平台已经是很普遍的方式,不过国内的管理平台可能还处于起步阶段。学习平台具有学习信息管理功能的选择。学习平台采用java技术,基于springboot框架,mysql数据库进行开发,实现了首页,个人中心,学生管理,教师管理,课程信息管理,类型管理,作业信息管理,资料信息管理,签到信息管理,成绩统计管理,学生作业管理,试卷管理,试题管理,校园论坛,系统管理等内容进行管理,本系统具有良好的兼容性和适应性,为用户提供更多的学习信息,也提供了良好的平台,从而提高系统的核心竞争力。\n本次设计任务是要设计一个学习平台,通过这个系统能够满足学习信息的管理及学生和教师的学习管理功能。系统的主要功能包括首页,个人中心,学生管理,教师管理,课程信息管理,类型管理,作业信息管理,资料信息管理,签到信息管理,成绩统计管理,学生作业管理,试卷管理,试题管理,校园论坛,系统管理等功能。\n管理员可以根据系统给定的账号进行登录,登录后可以进入学习平台,对学习平台所有模块进行管理。包括查看和修改自己的个人信息以及登录密码。\n该系统为每一个用户都分配了一个用户账号,用户通过账号的登录可以在系统中查看学习信息及对个人信息进行修改等功能。\n\n开发环境\n开发语言：Java\n框架：springboot\nJDK版本：JDK1.8\n服务器：tomcat7\n数据库：mysql 5.7;一定要5.7版本;\n数据库工具：Navicat11\n开发软件：eclipse/myeclipse/idea\nMaven包：Maven3.3.9\n浏览器：谷歌浏览器\n\n功能介绍\n学习平台的功能分为管理员,学生和教师三个部分,系统的主要功能包括首页,个人中心,学生管理,教师管理,课程信息管理,类型管理,作业信息管理,资料信息管理,签到信息管理,成绩统计管理,学生作业管理,试卷管理,试题管理,校园论坛,系统管理等内容。任何用户只要进入平台不需登录也可浏览到的信息,后台管理是针对已登录的用户看到满意的学习信息而设计的。\n1、一般用户的功能及权限\n所谓一般用户就是指还没有注册的过客,他们可以浏览主页面上的信息。但如果要进入后台进行信息管理时,要登录注册,只有注册成功才有的权限。\n2、管理员的功能及权限\n用户信息的添加和管理,学习详细信息的添加和管理,文档信息的添加和管理以及平台信息管理,这些都是管理员的功能。\n这个系统的功能结构设计如图所示。\r\n', 'https://img-blog.csdnimg.cn/7cb15e14e1004e3e8dcf87becf6eb16f.png', NULL, '2022-09-17 21:46:22', NULL, 0);
INSERT INTO `blog` VALUES (4, 1, 3, 'vue自适应布局（各种浏览器，分辨率）', 90, 0, '公司内部一直有大屏的需求，也一直再做，中途也踩了一些坑，但是没有认真的来总结下。\n\n首先项目中，做过移动端的适配，也有现在的大屏需求，中间都离不开不一个单位rem，自适应看起来就很麻烦，不过无惧困难，困难才会看到你说，哟，厉害了，我闪~，下面慢慢聊来。\n\n浅析rem\n首先rem是css单位，相比于px固定的像素单位，rem更加的灵活，还有现在也比较好的vm。如果从未了解过，可以先过过眼\n\nrem自适应。CSS3的REM设置字体大小\n\nfont size of the root element.\n\n简单来说，rem就是根据html元素的字体大小来计算单位的。我们的需求就是说，根据不同的分辨率，我们元素的大小能够有所对应的变化，在视觉上能够做到很舒服的效果。想想我们在做pc端的时候，一般都是中间固定比如1200px像素，然后最小1200px，两边留白，这样我们无论放大缩小都不会影响效果。但是现在移动端各种屏幕的出现，适应性就更加的强烈。根据分辨率的不同让html的字体大小变化，我们在页面中写rem，由于rem是相对于根元素字体大小来计算的，那么就可以实现自适应的效果。\n\n移动端自适应——手淘flexible\n熟悉移动端的自适应方案的朋友对 rem 适应方案，肯定不陌生，最出名的就是阿里的 lib-flexible 方案。\n\n原理：flexible就是根据不同的屏幕算出html的font-size，通过js来动态写meta标签。\n\n事实上他做了这几样事情：\n\n动态改写<meta>标签\n给<html>元素添加data-dpr属性，并且动态改写data-dpr的值\n给<html>元素添加font-size属性，并且动态改写font-size的值\n比如我们在做移动端的时候，经常拿到的设计稿是640px或者750px。自己项目中就是640px，以此为例，自己在项目中为了计算方便，所以给html根元素设置的字体大小是100px，也就是在640px下面。这里注意，我们给html设置100px，这个是字体哦，所以最好在body设置一下字体大小。 ', 'https://img-blog.csdnimg.cn/6a3107a7d21f47fb950d4d2bc51df34c.gif?x-oss-process=image/resize,m_fixed,h_300,image/format,png', NULL, '2022-09-22 21:46:25', NULL, 0);
INSERT INTO `blog` VALUES (5, 1, 2, '《算法和数据结构》算法篇', 2, 0, '什么是算法？\r\n\r\n算法是解决特定问题求解步骤的描述，在计算机中表现为指令的有限序列，并且每条指令表示一个或多个操作。\r\n\r\n简单来说，就是我们解决某一问题所使用的技巧和方法。\r\n\r\n一个问题可以由多个算法解决，一个算法也不可能具有通解所有问题的能力。\r\n\r\n \r\n\r\n算法的特征：\r\n\r\n输入：算法具有零个或多个输入；\r\n输出：算法至少有一个或多个输出。（打印形式、返回一个或多个值）\r\n有穷性：算法执行有限步骤之后，自动结束而不会无限循环，并且每一个步骤在可接受的时间内完成。\r\n确定性：算法的每一个步骤都具有确定的含义，不会出现二义性。 算法在一定条件下，只有一条执行路径，相同的输入只能有唯一的输出结果。\r\n可行性：算法的每一步都必须是可行的，每一步都能通过执行有限次数完成。\r\n \r\n\r\n算法设计的要求：\r\n\r\n　　1、正确性的四个层次；\r\n\r\n　　　　层次一：算法程序无语法错误；\r\n\r\n　　　　层次二：算法程序对合法输入能够产生满足要求的输出；\r\n\r\n　　　　层次三：算法程序对于非法输入能够产出满足要求的说明；\r\n\r\n　　　　层次三：算法程序对于故意刁难的测试输入都能满足要求的输出结果；\r\n\r\n　　2、可读性；这里所说的可读性指的是，既要方便自己阅读修改，又要便于他人阅读用以沟通交流；\r\n\r\n　　3、健壮性；在遇到具有刁难性的输入时，保持算法的功能；\r\n\r\n　　4、时间效率高和存储量低；算法的最终目的就是追求尽可能短的时间达成效果以及对于计算机的负担尽可能的低.', 'https://img-blog.csdnimg.cn/4890ad1559c14900a85119368281925a.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBA6Iux6ZuE5ZOq6YeM5Ye65p2l,size_20,color_FFFFFF,t_70,g_se,x_16', NULL, '2022-09-02 21:46:29', NULL, 0);
INSERT INTO `blog` VALUES (6, 1, 6, '计算机网络（一）概述', 555, 0, '计算机网络技术课程是计算机应用专业特别是网络工程施工和管理方向、物联网技术应用技术专业的核心基础课程之一，是一门必修课。下面我们来介绍一下这个课程。\r\n\r\n一、定义\r\n\r\n计算机网络就是通过光缆、电缆、电话线或无线通讯将两台以上的计算机互连起来的集合。包括广域网、城域网和局域网。\r\n\r\n局域网的类型很多，若按网络使用的传输介质分类，可分为有线网和无线网；若按网络拓扑结构分类，可分为总线型、星型、环型、树型、混合型等；若按传输介质所使用的访问控制方法分类，又可分为以太网、令牌环网、FDDI网和无线局域网等。其中，以太网是当前应用最普遍的局域网技术。\r\n\r\n局域网由网络硬件（包括网络服务器、网络工作站、网络打印机、网卡、网络互联设备等）和网络传输介质，以及网络软件所组成。\r\n\r\n局域网通常是分布在一个有限地理范围内的网络系统，一般所涉及的地理范围只有几公里。局域网专用性非常强，具有比较稳定和规范的拓扑结构。决定局域网特性的四个主要技术是：拓扑结构、传输介质、介质访问控制方法、链路距离。\r\n\r\n二、常见的局域网拓朴结构\r\n\r\n1、星形结构\r\n\r\n这种结构的网络是各工作站以星形方式连接起来的，网中的每一个节点设备都以中防节为中心，通过连接线与中心 节点相连，如果一个工作站需要传输数据，它首先必须通过中心节点。由于在这种结构的网络系统中，中心节点是控制中心，任意两个节点间的通信最多只需两步，所以，能够传输速度快，并且网络构形简单、建网容易、便于控制和管理。但这种网络系统，网络可靠性低，网络共享能力差，并且一旦中心节点出现故障则导致全网瘫痪。\r\n\r\n2、树形结构\r\n\r\n树形结构网络是天然的分级结构，又被称为分级的集中式网络。其特点是网络成本低，结构比较简单。在网络中，任意两个节点之间不产生回路，每个链路都支持双向传输，并且，网络中节点扩充方便、灵活，寻查链路路径比较简单。但在这种结构网络系统中，除叶节点及其相连的链路外，任何一个工作站或链路产生故障会影响整个网络系统的正常运行。\r\n\r\n3、总线形结构\r\n\r\n总线形结构网络是将各个节点设备和一根总线相连。网络中所有的节点工作站都是通过总线进行信息传输的。作为总线的通信连线可以是同轴电缆、双绞线，也可以是扁平电线。在总线结构中，作为数据通信必经的总线的负载能量是有限度的，这是由通信媒体本身的物理性能决定的。所以，总线结构网络中工作站节点的个数是有限制的，如果工作站节点的个数超出总线负载能量，就需要延长总线的长度，并加入相当数量的附加转接部件，使总线负载达到容量要求。总线形结构网络简单、灵活，可扩充性能好。所以，进行节点设备的插入与拆卸非常方便。另外，总线结构网络可靠性高、网络节点间响应速度快、共享资源能力强、设备投入量少、成本低、安装使用方便，当某个工作站节点出现故障时，对整个网络系统影响小。因此，总线结构网络是最普遍使用的一种网络。但是由于所有的工作站通信均通过一条共用的总线，所以，实时性较差。\r\n\r\n4、环形结构\r\n\r\n环形结构是网络中各节点通过一条首尾相连的通信链路连接起来的一个闭合环形结构网。环形结构网络的结构也比较简单，系统中各工作站地位相等。系统中通信设备和线路比较节省。在网中信息设有固定方向单向流动，两个工作站节点之间仅有一条通路，系统中无信道选择问题；某个结点的故障将导致物理瘫痪。环网中，由于环路是封闭的，所以不便于搁充，系统响应延时长，且信息传输效率相对较低。环形网络有单环和双环，双环稳定性较好，适合于搭建规模较大的跨区域的校园网、城域网。', 'https://img-blog.csdnimg.cn/ed0a4788e4274c83ba1c8aad441311c1.png?x-oss-process=image/resize,m_fixed,h_150', NULL, '2022-09-04 21:46:34', NULL, 0);
INSERT INTO `blog` VALUES (7, 1, 7, '软件开发基本流程', 13, 0, '软件开发必须符合某些程序和技术规范开发。软件开发团队的每一个成员都遵循统一的规范来设计，开发，测试和沟通。才可以提高开发的效率。以下是软件开发流程八个步骤：\r\n\r\n1、软件开发的第一个过程是对项目开发的分析和确定。主要是软件开发商所确定项目开发后，需要和需求方讨论确定需求方软件开发的目标和具体需求。\r\n\r\n2、接下来就是需求分析。此步骤也是确定正常实施软件开发的具体想法的阶段。在确定软件开发可以进行后，对客户的需要实现的软件功能进行详细的分析。同时要考虑开发过程中可能出现的变化，制定需求变更计划，随时应对特殊情况的发生，保证软件开发过程的顺利进行。\r\n\r\n3、接下来就是软件设计。要根据上一阶段的软件功能需求分析结果进行设计，涉及到软件设计框架结构、软件系统模块和软件系统的数据库，主要分为总体设计和详细设计两部分。\r\n\r\n4、接下来就是编程的实施步骤。编程也是基于软件的设计，软件设计的所有部分都是通过计算机程序代码实现的。编程由统一规范的程序书写规则，保证了软件程序的可理解性。\r\n\r\n5、接下来的就是步骤软件测试。也就是客户软件按照设计用编程代码实现后，也就是软件程序。完成后，需要修改书面的程序，形成整体框架，功能为单元，组装，系统三个阶段测试，程序的正确性，客户要求功能的充分性，以确定软件是否满足开发要求，这也是一个发现问题、纠正问题的过程。6、软件开发是通过以上核心环节完成的。接下来就在软件开发之后满足了客户的要求，软件系统交给了客户，并向客户交付软件安装程序、数据库的数据字典、《用户安装手册》、《用户使用指南》、需求报告、设计报告、测试报告等文档，指导客户安装软件及安装技巧。提醒客户关注软件的运行状态、环境、服务器及相关中间件的检测和注意事项，了解客户软件的实际操作方法、使用流程等问题，实现合同规定的任务。\r\n\r\n7、用户接受开发交付的软件开发后，实际操作运行测试。达到满意的结果后，对开发出来的软件进行验收。\r\n\r\n8、定制开发的软件通常需要提供售后服务，维护软件，或者根据用户的新需求修改应用软件程序，不断满足客户的实际需求。', 'https://img-blog.csdnimg.cn/2019021410442386.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl8zODQwNDg5OQ==,size_16,color_FFFFFF,t_70', NULL, '2022-09-09 21:46:37', NULL, 0);
INSERT INTO `blog` VALUES (8, 1, 8, 'c语言入门这一篇就够了-学习笔记', 666, 0, '一、C语言的结构\r\n1、Hello world\r\n简单来说，一个C程序就是由若干头文件和函数组成。\r\n\r\n#include<stdio.h>    //包含头文件\r\nint  main(){\r\n    printf(\"Hello World\");  \r\n    return 0;\r\n}\r\n\r\n#include <stdio.h>就是一条预处理命令，它的作用是通知C语言编译系统在对C程序进行正式编译之前需做一些预处理工作。\r\n函数就是实现代码逻辑的一个小的单元。\r\n注：在最新的C标准中，main函数前的类型为int而不是void。\r\n2、主函数\r\n一个C程序有且只有一个主函数，即main函数。主函数就是C语言中的唯一入口。\r\n3、编写规范\r\n1.一个说明或一个语句占一行，例如：包含头文件、一个可执行语句结束都需要换行；\r\n2.函数体内的语句要有明显缩进，通常以按一下Tab键为一个缩进；\r\n3.括号要成对写，如果需要删除的话也要成对删除；\r\n4.当一句可执行语句结束的时候末尾需要有分号；\r\n5.代码中所有符号均为英文半角符号。\r\n4、注释\r\n#include<stdio.h>    //包含头文件\r\nint  main(){\r\n    printf(\"Hello World\");  \r\n    return 0;\r\n}\r\n\r\n如上面两种注释//和 /**/。\r\n5、标识符\r\n编程时给变量或者函数起的名字就是标识符，就好比我们慕课网的每一位童鞋都有姓名，姓名就是这位童鞋的标识符。C语言的标识符是不可以随便起名字的，必须遵守一定的规则。\r\nC 语言规定，标识符可以是字母(A～Z，a～z)、数字(0～9)、下划线_组成的字符串，并且第一个字符必须是字母或下划线。在使用标识符时还有注意以下几点：\r\n1.标识符的长度最好不要超过8位，因为在某些版本的C中规定标识符前8位有效，当两个标识符前8位相同时，则被认为是同一个标识符。\r\n2.标识符是严格区分大小写的。例如Imooc和imooc 是两个不同的标识符。\r\n3.标识符最好选择有意义的英文单词组成做到\"见名知意\"，不要使用中文。\r\n4.标识符不能是C语言的关键字。\r\n6、基本数据类型\r\n在我们玩游戏的时候，游戏中的角色是有类型的，有敏捷型、力量型、法术型等等。同样C语言中的数据也是有类型的，C语言中，数据类型可分为：基本数据类型，构造数据类型，指针类型，空类型四大类。', 'https://img-blog.csdnimg.cn/img_convert/5d1daf29466eb5f9b82fb8df5680ca7f.png', NULL, '2022-08-10 21:46:40', NULL, 0);
INSERT INTO `blog` VALUES (9, 1, 9, '软件测试人员必备的60个测试工具，果断收藏了！', 53, 0, '测试管理工具\r\n1，TestDirector(大而全)\r\n\r\n2，jira(简单好用)\r\n\r\n3，Quality Center(复杂，收费)\r\n\r\n4，禅道（简单好用）\r\n\r\n5，bugzilla(功能简单)\r\n\r\n6，svn(代码和文档管理工具)\r\n\r\n7，vss类似svn\r\n\r\n8，git，同svn，但是多分支管理比svn好\r\n\r\n9，Note（大而全，费用太贵）\r\n\r\n10，CQ(ClearQuest-IBM产品-大而全)\r\n性能测试工具\r\n1，loadrunner，大而全，要学精通还是有点难度，重量级工具\r\n\r\n2，jmeter 基于java平台的性能开源测试工具，其实也很强大，而且比较好用\r\n\r\n3，Web bench 一个简单的web基准指标测试工具\r\n\r\n4，Load UI，一款开源的压力测试工具，支持图形化\r\n\r\n5，httperf 一款高性能的web性能测试工具\r\n\r\n6，Siege 一款开源的压力和指标测试工具\r\n\r\n7、Gatling\r\n\r\n前两种是比较常用的\r\n\r\nC/S自动化工具\r\n1，qtp (录制回放和脚本编辑)，用到的是vb语言\r\n\r\n2，winrunner IBM产品类似qtp\r\n\r\n3，autoit 在窗口定位上做到很不错\r\n\r\n白盒测试工具\r\n1，jtest java语言的单元测试框架\r\n\r\n2，JUnit 验证java的工具\r\n\r\n3，cppunit 跨平台的c++单元测试框架\r\n\r\n4，gtest 跨平台的c++单元测试框架\r\n\r\n5，PhpUnit Php\r\n\r\n6，BoundsChecker C++,Delphi API和OLE错误检查、指针和泄露错误检查、内存错误检查\r\n\r\n7，TrueTime C++,Java,Visual Basic 代码运行效率检查、组件性能的分析\r\n\r\n代码扫描工具\r\n1，Coverity源代码静态分析工具\r\n\r\n2，cppcheck c++静态扫描工具\r\n\r\n3，gcover代码覆盖率工具\r\n\r\n4，findbugs：基于字节码分析，大量使用数据流分析技术，侧重运行时错误检测，如空指针引用等\r\n\r\n5，SonarLint\r\n\r\n6，TscanCode\r\n\r\n持续集成工具\r\n1，jenkins\r\n\r\n2，Hudson\r\n\r\n网络测试工具\r\n1，思博伦 目前流行的一款网络自动化测试商用平台了(而且能够完全顶替loadrunner)，基本上能够满足所有的网络产品测试需求了，不过很贵\r\n\r\n2，Ixia，也是对网络设备进行性能和压力测试工的平台\r\n\r\n3，wireshark 数据包抓取分析和回放测试工具\r\n\r\n4，tc 网络丢包和试验模拟工具，非常好用\r\n\r\n5，iperf 用来测试tcp和udp的网络质量\r\n\r\n6，tcpping工具工作在 TCP 层，通过发送伪造的 TCP SYN 包并侦听来自服务器或中间设备返回的 SYN/ACK 或 RST\r\n\r\napp自动化工具\r\n1，appium 这个应该算是目前最流行的基于app的自动化测试框架了\r\n\r\n2，instruments ios平台下的自动化测试框架，用java语言写的\r\n\r\n3，uiautomator安卓自动化测试框架，基本上支持安卓的所有事件操作\r\n\r\n4，Monkey 安卓自带的测试工具\r\n\r\n5，Monkey Runner Monkey改进版，支持自己编写脚本测试，用Python语言\r\n\r\n6，Robotium 一款国外的Android自动化测试框架，用法比较简单.', 'https://img-blog.csdnimg.cn/20210504204054606.png', NULL, '2022-08-18 21:46:44', NULL, 0);
INSERT INTO `blog` VALUES (10, 1, 10, '【吐血整理】Java项目源码分享', 76, 0, '大家好，又见面了，我是你们的朋友jay。\r\n\r\n\r\n源码下载（实例一）：\r\njsp开发完整的博研图书馆后台管理系统，不使用框架开发的，太完美了\r\n 源码下载（实例二）：\r\njavaWeb图书馆管理系统源码mysql版本\r\n 源码下载（实例三）\r\nGitHub – uboger/LibraryManager: JAVA GUI 图书馆管理系统\r\n 源码下载（实例四）：\r\njava swing开发企业人事管理系统源代码下载\r\n\r\n\r\n源码下载（实例一）：java swing开发网络聊天室群聊系统,基于java多线程socket编程\r\n 源码下载（实例二）：\r\njava swing开发大猫聊天室源码，简单易懂，适合java swing初学者\r\n 源码下载（实例三）：\r\njava websocket开发简单聊天室系统，实现群聊与一对一单人聊天案例\r\n 源码下载（实例四）：\r\njsp开发简单聊天室demo-分享\r\n\r\n\r\n源码下载（一）：\r\njava通讯录实现了添加删除和查找功能\r\n 源码下载（二）：\r\nJAVA版通讯录管理系统课程设计源码\r\n 源码下载（三）：\r\nJava Swing界面.完美设计通讯录..有需要的下\r\n\r\n\r\n源码下载（一）：\r\nJAVA坦克大战+源代码（适合初学者）\r\n 源码下载（二）：\r\nGitHub – wangzhengyi/TankWar: 用J2SE写的一个坦克大战小游戏，巩固一下java基础\r\n\r\n\r\n源码下载（一）：\r\n俄罗斯方块 JAVA版\r\n 源码下载（二）：\r\nGitHub – FieldSoft-HelloClyde/Tetris-Swing: Swing编写的俄罗斯方块\r\n 源码下载（三）：\r\njava swing开发的俄罗斯方块游戏，包含完整代码+详细注释\r\n\r\n\r\n源码下载（一）：\r\nJava实践（十一）——五子棋\r\n 源码下载（二）：\r\njava swing开发的五子棋小游戏源码\r\n 源码下载（三）：\r\njava swing开发单机版五子棋源代码下载\r\n 源码下载（四）：\r\nJava五子棋算法和代码\r\n\r\n\r\n源码下载（一）：Java实践（十二）——中国象棋\r\n\r\n\r\n源码下载（实例一）：\r\nJAVA贪吃蛇源代码\r\n 源码下载（实例二）：\r\njava swing编写的3个小游戏程序源码，俄罗斯方块，贪吃蛇和坦克大战\r\n 源码下载（实例三）：\r\njava贪吃蛇源代码 、 java贪吃蛇源代码.', 'https://img-blog.csdnimg.cn/img_convert/521d234d845eb0c9b3a42ff00aeacbe6.png', NULL, '2022-09-03 21:46:50', NULL, 0);
INSERT INTO `blog` VALUES (11, 1, 1, 'JAVA小白 编程练习500题 超详细!!!带答案!!!持续更新中~', 321, 0, '练习题:通过代码编写，输出一句话：“我要开始学习JAVA了，今天又是知识量满满的一天~”\r\npackage cn.cxy.exec;\r\n\r\npublic class TestPrint {\r\n    public static void main(String[] args) {\r\n        System.out.println(\"我要开始学习JAVA了，今天又是知识量满满的一天~\");\r\n    }\r\n}\r\n\r\n练习题：打印个人信息案例，将一个人的一些个人信息打印输出\r\n练习题：拼接打印：输出：XXX：这是我学习JAVA的第X年，我的期望薪资是XXX\r\n练习题：定义两个整数，计算这两个整数加减乘除运算的结果，并把结果打印到控制台\r\n练习题：预测身高案例：\r\n练习题：逻辑判断\r\n练习题：最优选择\r\n练习题: 接收用户输入的3个整数,并将它们的最大值作为结果输出\r\n练习题：接收用户输入的数据，判断是奇数还是偶数\r\n练习题：输入数字1~7，输出对应星期几\r\n练习题: BMI 指数测试 BMI = 体重 (kg) / 身高² (m)\r\n练习题：最优选择2\r\n练习题：求数字的绝对值\r\n练习题：求指定两个数的最大公约数和最小公倍数\r\n练习题：银行收入计算\r\n练习题：求税后工资问题\r\n练习题: 手机选号:根据用户输入的手机号来确认用户实际支付的价格\r\n练习题: 获取邮箱名字\r\n练习题 : 分别通过for循环/While循环/do-While循环写一个死循环\r\n练习题: 鸡兔同笼问题(穷举法)\r\n练习题:商品录入系统\r\n练习题:求数字阶乘(for循环版)\r\n练习题:多次生成随机数,并打印第一次出现大于0.999 时的次数与生成的随机数\r\n练习题:打印100以内除了尾数为3,5,7的所有数\r\n练习题:求质数:接收用户输入的数字,判断是否为质数\r\n练习题:接收用户输入的数字,判断在此范围内质数的个数\r\n练习题:生成一个顺序数组,将这个数组的元素打乱顺序后输出\r\n练习题:打印全三角形\r\n练习题：模拟双色球生成案例\r\n练习题:求任意自然数各位数之和\r\n练习题:求任意数组中所有元素的最大值\r\n练习题:求1000以内的完数\r\n练习题： 随机数组的归并问题\r\n练习题：遍历二维数组打油诗\r\n练习题:求猴子大王\r\n练习题:斐波那契问题\r\n练习题:古典问题：生兔兔问题\r\n练习题:打印水仙花数\r\n练习题：面向对象 封装百分制分数', 'https://img-blog.csdnimg.cn/2019121810082198.png?x-oss-process&#61;image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly90aGlua3dvbi5ibG9nLmNzZG4ubmV0,size_16,color_FFFFFF,t_70', NULL, '2022-09-08 21:46:54', NULL, 0);
INSERT INTO `blog` VALUES (12, 1, 1, 'Java学习路线总结，搬砖工逆袭Java架构师', 42, 0, '一、JavaSE\r\n\r\n1、Java基础\r\nJava学习路线总结（思维导图篇）\r\n【Java基础知识 1】Java入门级概述\r\n【Java基础知识 2】配置java环境变量\r\n【Java基础知识 3】为何要配置环境变量？\r\n【Java基础知识 4】秒懂数组拷贝，感知新境界\r\n【Java基础知识 5】装箱和拆箱\r\n【Java基础知识 6】Java异常详解\r\n【Java基础知识 7】toString()、String.valueOf、(String)强转\r\n【Java基础知识 8】String、StringBuilder、StringBuffer详解\r\n【Java基础知识 9】序列化与反序列化\r\n【Java基础知识 10】Java IO流详解\r\n【Java基础知识 11】Java泛型详解\r\n【Java基础知识 12】Java枚举详解\r\n【Java基础知识 13】Java注解详解\r\n【Java基础知识 14】Java动态代理\r\n【Java基础知识 15】Java反射机制\r\n【Java基础知识 16】java内部类详解\r\n【Java基础知识 17】聊一聊同步代码块\r\n【深入理解Java】一篇文章带你彻底吃透Java NIO\r\n\r\n2、Java学习路线视频系列\r\n\r\n2、java集合\r\n\r\n3、Java多线程\r\n\r\n4、Java8新特性\r\n\r\n5、Java代码实例\r\n\r\n二、javaweb\r\n\r\n三、数据库\r\n\r\n四、Spring + SpringMVC + MyBatis\r\n\r\n五、Spring Boot\r\n\r\n六、各种中间件技术\r\n\r\n七、数据结构与算法\r\n\r\n八、JVM\r\n\r\n九、设计模式\r\n\r\n十、Linux\r\n\r\n十一、SpringCloud\r\n\r\n十二、JavaScript\r\n\r\n十三、Vue\r\n\r\n十四、计算机网络\r\n\r\n十五、性能调优\r\n\r\n十六、系统设计\r\n\r\n十七、各种技术的相关源码分析\r\n\r\n十八、计算机理论\r\n\r\n十九、读书笔记\r\n\r\n1、重构 改善既有代码的设计\r\n\r\n2、【编写高质量代码：改善Java程序的151个建议】\r\n\r\n3、深入理解Java虚拟机\r\n\r\n二十、高频面试题', 'https://img-blog.csdnimg.cn/2019121810082198.png?x-oss-process&#61;image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly90aGlua3dvbi5ibG9nLmNzZG4ubmV0,size_16,color_FFFFFF,t_70', NULL, '2022-09-11 21:46:58', NULL, 0);
INSERT INTO `blog` VALUES (13, 1, 1, 'java怎么更新', 22, 0, 'java怎么更新\r\n\r\njava的升级有三种。\r\n\r\n另一方面，使用java控制面板升级当前安装的java :\r\n\r\n1 )、开始-选择所有程序；\r\n\r\n2 )、选择Java，找到check for update；\r\n\r\n3 )、点击check for update升级即可；\r\n\r\n或：\r\n\r\n以管理员身份打开cnd并选择javacpl.exe； 打开Java控制面板，依次单击【更新】-【立即更新】，如果希望自动更新程序，可以选中【自动检查更新】。\r\n\r\n二、使用网络检查java版本，下载最新版。\r\n\r\n1、打开浏览器，用搜索引擎搜索【Java】。\r\n\r\n2、进入Java官网【有Java吗？ 】。\r\n\r\n3、进入网页后点击【验证Java版本】。\r\n\r\n4、然后出现，正在验证安装。 检测计算机的Java。\r\n\r\n5、检查完成后，可以看到Java版本。 单击Version 8 Update 65新版本Version 8 Update 66下载按钮，获取计算机的推荐Java版本。\r\n\r\n6、下载并安装最新版本的Java后，验证Java版本时会说：“恭喜！ 已安装推荐的Java版本。\r\n\r\n三、卸载当前安装版本，然后返回官网下载最新版本，重新安装即可。', 'https://img-blog.csdnimg.cn/2019121810082198.png?x-oss-process&#61;image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly90aGlua3dvbi5ibG9nLmNzZG4ubmV0,size_16,color_FFFFFF,t_70', NULL, '2022-09-13 21:47:01', NULL, 0);
INSERT INTO `blog` VALUES (14, 1, 1, 'Java SE 和 Java EE 的区别', 84, 0, 'Java SE：\r\n\r\nJava SE 是Java平台标准版的简称（Java Platform, Standard Edition） (also known as Java 2 Platform) ，用于开发和部署桌面、服务器以及嵌入设备和实时环境中的Java应用程序。Java SE包括用于开发Java Web服务的类库，同时，Java SE为Java EE提供了基础。\r\nJava SE（Java Platform, Standard Edition，Java标准版）就是基于JDK和JRE的。\r\n\r\nJava EE：\r\n\r\nJava EE，Java 平台企业版（Java Platform Enterprise Edition） ， 是 Sun 公司为企业级应用推出的标准平台，用来开发B/S架构软件。多用于企业级开发，包括web开发等等。也叫J2EE。\r\n\r\n企业版本帮助开发和部署可移植、健壮、可伸缩且安全的服务器端 Java 应用程序。Java EE 是在 Java SE 的基础上构建的，它提供 Web 服务、组件模型、管理和通信 API，可以用来实现企业级的面向服务体系结构（service-oriented architecture，SOA）和 Web 2.0 应用程序。\r\n\r\nJava EE是一种利用Java2平台来简化企业解决方案的开发、部署和管理相关的复杂问题的体系结构。J2EE技术的基础就是核心Java平台或Java SE，Java EE不仅巩固了标准版中的许多优点，例如“编写一次、随处运行”的特性、方便存取数据库的JDBC API、CORBA技术以及能够在Internet应用中保护数据的安全模式等等，同时还提供了对 EJB（EnterpriseJavaBeans）、Java Servlets API、JSP（Java Server Pages）以及XML技术的全面支持。其最终目的就是成为一个能够使企业开发者大幅缩短投放市场时间的体系结构。\r\n\r\nJava EE体系结构提供中间层集成框架用来满足无需太多费用而又需要高可用性、高可靠性以及可扩展性的应用的需求。通过提供统一的开发平台，J2EE降低了开发多层应用的费用和复杂性，同时提供对现有应用程序集成强有力支持，完全支持EJB，有良好的向导支持打包和部署应用，添加目录支持，增强了安全机制，提高了性能。', 'https://img-blog.csdnimg.cn/2019121810082198.png?x-oss-process&#61;image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly90aGlua3dvbi5ibG9nLmNzZG4ubmV0,size_16,color_FFFFFF,t_70', NULL, '2022-09-11 21:47:05', NULL, 0);
INSERT INTO `blog` VALUES (23, 2, 0, '7777777', 0, 0, '66666', '666666', '', '2022-09-28 13:17:22', '2022-09-28 13:20:22', 1);
INSERT INTO `blog` VALUES (24, 2, 0, 'dsdsad', 0, 0, 'asdasd', 'sadasdas', '', '2022-09-28 13:21:54', '2022-09-28 13:22:17', 1);
INSERT INTO `blog` VALUES (25, 2, 0, 'dasdsa', 0, 0, 'dsad', 'asdasd', '', '2022-09-28 13:29:54', '2022-09-28 13:36:44', 1);
INSERT INTO `blog` VALUES (26, 2, 0, 'vue教程', 0, 0, 'xxxxxxxxxxxxxxxxxxx', 'https://v2.cn.vuejs.org/images/logo.svg', '', '2022-09-28 13:54:59', '2022-09-28 13:55:45', 1);
INSERT INTO `blog` VALUES (27, 2, 0, 'vue教程', 0, 0, 'xxxxxxxxxxxxxxxxxxx', 'https://v2.cn.vuejs.org/images/logo.svg', '', '2022-09-28 13:57:27', '2022-09-28 20:57:35', 1);
INSERT INTO `blog` VALUES (28, 2, 0, 'dasddasdas', 0, 0, 'dasdas', 'asdda', '', '2022-09-28 16:16:11', '2022-09-28 16:16:54', 1);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `sort` int NULL DEFAULT 0 COMMENT '排序',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` int NULL DEFAULT 0 COMMENT '是否删除;0未删除 1 删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Java', 0, '2022-09-20 16:22:25', '2022-09-20 16:22:27', 0);
INSERT INTO `category` VALUES (2, '算法', 0, '2022-09-20 16:22:39', '2022-09-20 16:22:41', 0);
INSERT INTO `category` VALUES (3, '前端', 0, '2022-09-20 16:22:56', '2022-09-20 16:22:58', 0);
INSERT INTO `category` VALUES (4, 'Python', 0, '2022-09-20 16:23:25', '2022-09-20 16:23:28', 0);
INSERT INTO `category` VALUES (5, '后端', 0, '2022-09-20 16:23:50', '2022-09-20 16:23:52', 0);
INSERT INTO `category` VALUES (6, '网络', 0, NULL, NULL, 0);
INSERT INTO `category` VALUES (7, '软件开发', 0, NULL, NULL, 0);
INSERT INTO `category` VALUES (8, 'C语言', 0, NULL, NULL, 0);
INSERT INTO `category` VALUES (9, '工具', 0, NULL, NULL, 0);
INSERT INTO `category` VALUES (10, '项目源码', 0, NULL, NULL, 0);
INSERT INTO `category` VALUES (11, '前沿技术', 0, NULL, NULL, 0);
INSERT INTO `category` VALUES (12, 'OpenHarmony', 0, NULL, NULL, 0);
INSERT INTO `category` VALUES (13, '人工智能', 0, NULL, NULL, 0);
INSERT INTO `category` VALUES (14, '微信开发', 0, NULL, NULL, 0);
INSERT INTO `category` VALUES (15, '企业应用', 0, NULL, NULL, 0);
INSERT INTO `category` VALUES (16, '建站系统', 0, NULL, NULL, 0);
INSERT INTO `category` VALUES (17, '手机/移动开发', 0, NULL, NULL, 0);
INSERT INTO `category` VALUES (18, '服务器应用', 0, NULL, NULL, 0);
INSERT INTO `category` VALUES (19, '数据库相关', 0, NULL, NULL, 0);
INSERT INTO `category` VALUES (20, '游戏/娱乐', 0, NULL, NULL, 0);

-- ----------------------------
-- Table structure for comment_blog
-- ----------------------------
DROP TABLE IF EXISTS `comment_blog`;
CREATE TABLE `comment_blog`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `bid` int NOT NULL,
  `uid` int NOT NULL,
  `content` varchar(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内容',
  `star` int NULL DEFAULT NULL COMMENT '点赞',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` int NULL DEFAULT 0 COMMENT '是否删除;0未删除 1 删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '博客评论表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comment_blog
-- ----------------------------
INSERT INTO `comment_blog` VALUES (1, 1, 1, '很不错啊', 1, '2022-09-17 23:30:15', NULL, 0);
INSERT INTO `comment_blog` VALUES (2, 2, 2, '666666', 0, '2022-09-16 23:30:36', NULL, 0);
INSERT INTO `comment_blog` VALUES (4, 1, 1, '写的很好', NULL, '2022-09-25 23:39:28', '2022-09-25 23:39:28', 0);
INSERT INTO `comment_blog` VALUES (5, 8, 1, '666', NULL, '2022-09-26 00:10:18', '2022-09-26 00:10:18', 0);
INSERT INTO `comment_blog` VALUES (6, 8, 1, '我觉得不行', NULL, '2022-09-26 09:33:11', '2022-09-26 09:33:11', 0);
INSERT INTO `comment_blog` VALUES (7, 1, 2, '6666', NULL, '2022-09-26 14:24:15', '2022-09-26 14:24:15', 0);
INSERT INTO `comment_blog` VALUES (8, 1, 20, '可以', NULL, '2022-09-28 00:12:17', '2022-09-28 00:12:17', 0);
INSERT INTO `comment_blog` VALUES (9, 4, 21, '666', NULL, '2022-09-28 08:38:05', '2022-09-28 08:38:05', 0);
INSERT INTO `comment_blog` VALUES (10, 7, 23, '很有帮助', NULL, '2022-09-28 12:25:51', '2022-09-28 12:25:51', 0);
INSERT INTO `comment_blog` VALUES (11, 7, 23, '收藏下来以后参考', NULL, '2022-09-28 12:26:13', '2022-09-28 12:26:13', 0);
INSERT INTO `comment_blog` VALUES (12, 10, 23, '牛的 这波分享直接起飞', NULL, '2022-09-28 12:30:45', '2022-09-28 12:30:45', 0);
INSERT INTO `comment_blog` VALUES (13, 2, 23, 'nb', NULL, '2022-09-28 15:21:09', '2022-09-28 15:21:09', 0);
INSERT INTO `comment_blog` VALUES (14, 27, 24, '这功能确实不错', NULL, '2022-09-28 15:22:30', '2022-09-28 15:22:30', 0);
INSERT INTO `comment_blog` VALUES (15, 4, 1, 'dsadas', NULL, '2022-09-28 16:17:36', '2022-09-28 16:17:36', 0);
INSERT INTO `comment_blog` VALUES (16, 4, 1, '666', NULL, '2022-09-28 20:57:51', '2022-09-28 20:57:51', 0);

-- ----------------------------
-- Table structure for comment_resource
-- ----------------------------
DROP TABLE IF EXISTS `comment_resource`;
CREATE TABLE `comment_resource`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `rid` int NOT NULL COMMENT '资源id',
  `uid` int NOT NULL,
  `content` varchar(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '内容',
  `star` int NULL DEFAULT 0 COMMENT '点赞',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` int NULL DEFAULT 0 COMMENT '是否删除;0未删除 1 删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '资源评论表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comment_resource
-- ----------------------------
INSERT INTO `comment_resource` VALUES (1, 1, 1, '棒！', 4, '2022-09-24 12:35:52', NULL, 0);
INSERT INTO `comment_resource` VALUES (2, 1, 2, '太强了！', 4, '2022-09-24 12:39:52', NULL, 0);
INSERT INTO `comment_resource` VALUES (3, 1, 1, '网站访问成功', 4, '2022-09-24 13:35:52', NULL, 0);
INSERT INTO `comment_resource` VALUES (4, 1, 1, '感谢分享', 4, '2022-09-25 12:35:52', NULL, 0);
INSERT INTO `comment_resource` VALUES (5, 2, 3, '太强了！', 6, '2022-09-20 09:39:52', NULL, 0);
INSERT INTO `comment_resource` VALUES (6, 2, 2, '网站访问成功', 4, '2022-09-21 17:35:52', NULL, 0);
INSERT INTO `comment_resource` VALUES (7, 2, 1, '感谢分享', 0, '2022-09-25 12:35:52', NULL, 0);
INSERT INTO `comment_resource` VALUES (8, 3, 3, '太强了！', 6, '2022-09-20 09:39:52', NULL, 0);
INSERT INTO `comment_resource` VALUES (9, 3, 2, '网站访问成功', 4, '2022-09-21 17:35:52', NULL, 0);
INSERT INTO `comment_resource` VALUES (10, 3, 1, '感谢分享', 0, '2022-09-25 12:35:52', NULL, 0);
INSERT INTO `comment_resource` VALUES (11, 4, 1, '太强了！', 6, '2022-09-20 09:39:52', NULL, 0);
INSERT INTO `comment_resource` VALUES (12, 4, 2, '网站访问成功', 47, '2022-09-21 17:35:52', NULL, 0);
INSERT INTO `comment_resource` VALUES (13, 4, 1, '感谢分享', 33, '2022-09-25 12:35:52', NULL, 0);
INSERT INTO `comment_resource` VALUES (14, 5, 3, '太强了！', 6, '2022-09-20 09:39:52', NULL, 0);
INSERT INTO `comment_resource` VALUES (15, 5, 3, '网站访问成功', 24, '2022-09-21 17:35:52', NULL, 0);
INSERT INTO `comment_resource` VALUES (16, 5, 1, '感谢分享', 20, '2022-09-25 12:35:52', NULL, 0);
INSERT INTO `comment_resource` VALUES (17, 6, 3, '太强了！', 61, '2022-09-20 09:39:52', NULL, 0);
INSERT INTO `comment_resource` VALUES (18, 6, 2, '网站访问成功', 4, '2022-09-21 17:35:52', NULL, 0);
INSERT INTO `comment_resource` VALUES (19, 6, 1, '感谢分享', 10, '2022-09-25 12:35:52', NULL, 0);
INSERT INTO `comment_resource` VALUES (20, 8, 3, '太强了', 6, '2022-09-20 09:39:52', NULL, 0);
INSERT INTO `comment_resource` VALUES (21, 8, 2, '网站访问成功', 4, '2022-09-21 17:35:52', NULL, 0);
INSERT INTO `comment_resource` VALUES (22, 8, 3, '感谢分享', 30, '2022-09-25 12:35:52', NULL, 0);
INSERT INTO `comment_resource` VALUES (23, 9, 3, '太强了！', 66, '2022-09-20 09:39:52', NULL, 0);
INSERT INTO `comment_resource` VALUES (24, 9, 2, '网站访问成功', 4, '2022-09-21 17:35:52', NULL, 0);
INSERT INTO `comment_resource` VALUES (25, 9, 1, '感谢分享', 10, '2022-09-25 12:35:52', '2022-09-27 23:32:26', 1);
INSERT INTO `comment_resource` VALUES (26, 10, 3, '太强了！', 56, '2022-09-20 09:39:52', NULL, 0);
INSERT INTO `comment_resource` VALUES (27, 10, 2, '网站访问成功', 4, '2022-09-21 17:35:52', NULL, 0);
INSERT INTO `comment_resource` VALUES (28, 10, 1, '感谢分享', 30, '2022-09-25 12:35:52', NULL, 0);
INSERT INTO `comment_resource` VALUES (29, 11, 3, '太强了！', 46, '2022-09-20 09:39:52', NULL, 0);
INSERT INTO `comment_resource` VALUES (30, 11, 2, '网站访问成功', 14, '2022-09-21 17:35:52', NULL, 0);
INSERT INTO `comment_resource` VALUES (31, 11, 1, '感谢分享', 10, '2022-09-25 12:35:52', NULL, 0);
INSERT INTO `comment_resource` VALUES (32, 12, 3, '太强了！', 36, '2022-09-20 09:39:52', NULL, 0);
INSERT INTO `comment_resource` VALUES (33, 12, 2, '网站访问成功', 24, '2022-09-21 17:35:52', NULL, 0);
INSERT INTO `comment_resource` VALUES (34, 12, 1, '感谢分享', 30, '2022-09-25 12:35:52', NULL, 0);
INSERT INTO `comment_resource` VALUES (35, 7, 2, '太强了！', 16, '2022-09-20 09:39:52', NULL, 0);
INSERT INTO `comment_resource` VALUES (36, 7, 2, '网站访问成功', 4, '2022-09-21 17:35:52', NULL, 0);
INSERT INTO `comment_resource` VALUES (37, 7, 1, '感谢分享', 20, '2022-09-25 12:35:52', NULL, 0);
INSERT INTO `comment_resource` VALUES (41, 1, 1, '🐖🐕🐱🐍', 0, '2022-09-25 22:53:56', '2022-09-25 22:53:56', 0);
INSERT INTO `comment_resource` VALUES (42, 3, 1, '该资源很不错，可以学到很多', 0, '2022-09-25 22:56:32', '2022-09-25 22:56:32', 0);
INSERT INTO `comment_resource` VALUES (43, 3, 1, '666666', 0, '2022-09-25 22:58:56', '2022-09-25 22:58:56', 0);
INSERT INTO `comment_resource` VALUES (44, 5, 1, '666', 0, '2022-09-25 23:00:45', '2022-09-25 23:00:45', 0);
INSERT INTO `comment_resource` VALUES (45, 5, 1, '火钳留名', 0, '2022-09-25 23:02:16', '2022-09-25 23:02:16', 0);
INSERT INTO `comment_resource` VALUES (46, 39, 1, '火前留名', 0, '2022-09-25 23:02:28', '2022-09-25 23:02:28', 0);
INSERT INTO `comment_resource` VALUES (47, 41, 1, '大苏打大大', 0, '2022-09-25 23:03:36', '2022-09-27 23:30:24', 1);
INSERT INTO `comment_resource` VALUES (48, 13, 1, '666', 0, '2022-09-25 23:04:00', '2022-09-25 23:04:00', 0);
INSERT INTO `comment_resource` VALUES (49, 23, 1, '第一次知道这个', 0, '2022-09-25 23:04:35', '2022-09-25 23:04:35', 0);
INSERT INTO `comment_resource` VALUES (50, 15, 1, '666', 0, '2022-09-25 23:05:05', '2022-09-27 23:32:53', 1);
INSERT INTO `comment_resource` VALUES (51, 16, 1, '666', 0, '2022-09-25 23:05:13', '2022-09-25 23:05:13', 0);
INSERT INTO `comment_resource` VALUES (52, 68, 1, '666', 0, '2022-09-26 13:15:31', '2022-09-26 13:15:31', 0);
INSERT INTO `comment_resource` VALUES (53, 2, 1, '666', 0, '2022-09-26 18:21:15', '2022-09-27 23:30:16', 1);
INSERT INTO `comment_resource` VALUES (54, 57, 20, '666不错呀', 0, '2022-09-28 00:10:56', '2022-09-28 00:12:27', 1);
INSERT INTO `comment_resource` VALUES (55, 58, 21, '666', 0, '2022-09-28 08:37:15', '2022-09-28 08:40:50', 1);
INSERT INTO `comment_resource` VALUES (56, 17, 23, '666~老铁', 0, '2022-09-28 12:22:18', '2022-09-28 12:22:18', 0);
INSERT INTO `comment_resource` VALUES (57, 9, 23, '锵锵锵', 0, '2022-09-28 12:29:55', '2022-09-28 12:29:55', 0);
INSERT INTO `comment_resource` VALUES (58, 4, 24, '不错不错', 0, '2022-09-28 15:24:22', '2022-09-28 15:24:22', 0);
INSERT INTO `comment_resource` VALUES (59, 14, 24, '这直接扫盲', 0, '2022-09-28 15:25:24', '2022-09-28 15:25:24', 0);
INSERT INTO `comment_resource` VALUES (60, 29, 24, '学完直接大厂', 0, '2022-09-28 15:25:38', '2022-09-28 15:25:38', 0);
INSERT INTO `comment_resource` VALUES (61, 4, 1, '666', 0, '2022-09-28 16:11:00', '2022-09-28 16:11:00', 0);
INSERT INTO `comment_resource` VALUES (62, 11, 25, '看了 有长进了\n', 0, '2022-09-28 21:10:51', '2022-09-28 21:10:51', 0);

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL COMMENT '用户id',
  `cid` int NOT NULL COMMENT '分类id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标签',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '链接',
  `star` int NULL DEFAULT NULL COMMENT '收藏数',
  `sort` int NULL DEFAULT 0 COMMENT '排序',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` int NULL DEFAULT 0 COMMENT '是否删除;0未删除 1 删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '资源表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES (1, 1, 1, 'Java全栈知识体系', '构建体系-告别碎片化学习，帮助你构筑你自己的知识体系；全栈开发-以Java开发为背景，全栈开发，DevOps', '包含: Java 基础, Java 部分源码, JVM, Spring, Spring Boot, Spring Cloud, 数据库原理, MySQL, ElasticSearch, MongoDB, Docker, k8s, CI&CD, Linux, DevOps, 分布式, 中间件, 开发工具, Git, IDE, 源码阅读，读书笔记, 开源项目。', '[Java,后端]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/img/1625490041959-1625490033(1).jpg', 'https://www.pdai.tech/', 148, 0, '2021-01-01 21:27:19', NULL, 0);
INSERT INTO `resource` VALUES (2, 1, 2, 'LeetCode', '海量技术面试题库,拥有算法、数据结构、系统设计等 1000+题目,帮助你高效提升编程技能,轻松拿下世界 IT 名企 Dream Offer', '\r\n力扣（LeetCode）是领扣网络旗下专注于程序员技术成长和企业技术人才服务的品牌。源自美国硅谷，力扣为全球程序员提供了专业的IT技术职业化提升平台，有效帮助程序员实现快速进步和长期成长。 此外，力扣（LeetCode）致力于解决程序员技术评估、培训、职业匹配的痛点，逐步引领互联网技术求职和招聘迈向专业化。 刷力扣，让你顺利进大厂。', '[算法,Java]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/img/1609917529228-下载 (1).jpeg', 'https://leetcode-cn.com/', 75, 0, '2021-02-04 21:27:32', NULL, 0);
INSERT INTO `resource` VALUES (3, 1, 1, 'RuoYi', '基于 SpringBoot、Shiro、Mybatis 的权限后台管理系统，快速构建web应用程序', 'RuoYi 是一个后台管理系统，基于经典技术组合（Spring Boot、Apache Shiro、MyBatis、Thymeleaf）主要目的让开发者注重专注业务，降低技术难度，从而节省人力成本，缩短项目周期，提高软件安全质量。', '[Java,后端]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/img/1620918857703-ruoyi-logo.png', 'http://doc.ruoyi.vip/', 72, 0, '2021-03-18 21:27:42', NULL, 0);
INSERT INTO `resource` VALUES (4, 1, 3, '前端学习路线', '一个帮助新手、初级、中级前端开发者不断精进学习的网站，前端学习路上，不再迷茫~', '功能：1. 点击卡片可以进入到具体的页面，查看学习资料 2. 提供路线图下载的功能 3. 路线根据学习阶段进行了分级，可以查看每个阶段应该掌握的技术点 4. 可以关闭标签的标注', '[前端,Java]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/cloudbase-cms/upload/2021-02-05/wpd5cu8cpudb38hjy3rckjaxwg3c4ixj_.png', 'https://objtube.github.io/front-end-roadmap/', 1029, 0, '2021-04-16 21:27:49', NULL, 0);
INSERT INTO `resource` VALUES (5, 1, 4, 'Python-100-Days', 'GitHub 超 10w star 的 Python 教程，100 天从新手到大师', '推荐初学者值得一看的 python 教程，划分一百天来讲解 python，包含了 python 各个知识面以及能做的方向。虽然作者还在更新中，个人感觉挺好的。', '[Python]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/img/1619601568076-下載.jfif', 'https://github.com/jackfrued/Python-100-Days', 22, 0, '2021-05-06 21:27:57', NULL, 0);
INSERT INTO `resource` VALUES (6, 1, 5, 'Alibaba Java 技术图谱', '一个适合新手的Java学习平台', 'Alibaba Java 由“Java课程专家组”倾力打造的行业权威图谱，11个知识点 ，近千课时，体验场景练习上手更快。从新手入门，到高级工程师进阶，从理论学习，到实践应用，一张图谱讲透Java ！ 限时免费学。', '[后端,Java]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/img/1623153754756-1622525082527-1621410278059-TB1qNVdXlGw3KVjSZFDXXXWEpXa-620-620.png', 'https://developer.aliyun.com/graph/java', 573, 0, '2021-06-16 21:28:07', NULL, 0);
INSERT INTO `resource` VALUES (7, 1, 6, '计算机网络视频课', '中科大郑烇老师全套《计算机网络》课程，细节又透彻。', '该教程是中科大郑烇老师本人在B站上传的课程，课程内容根据《计算机网络（自顶向下方法 第7版，James F.Kurose，Keith W.Ross）》展开，十分推荐!', '[网络]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/img/1616682669107-下载.jfif', 'https://www.bilibili.com/video/BV1JV411t7ow', 112, 0, '2021-07-17 21:28:15', NULL, 0);
INSERT INTO `resource` VALUES (8, 2, 7, 'HBuilder (X)', 'HBuilder是当前最快的HTML开发工具,强大的代码助手帮你快速完成开发', 'HBuilder (X)，简称HX，是轻如编辑器、强IDE的合体版本，他令我们爱不释手，希望你也会喜欢上这款免费工具。', '[软件开发,前端]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/img/1626856542174-1626856533(1).jpg', 'https://www.dcloud.io/hbuilderx.html', 35, 0, '2021-08-29 21:28:23', NULL, 0);
INSERT INTO `resource` VALUES (9, 1, 8, 'CNote', 'C 语言入门教程', '「CNote」一份涵盖大部分学习 C 语言所需要掌握的核心知识，致力于打造最易懂的 C语言入门教程，让天下没有难学的 C语言。（包含C语言教程、C语言精华文章）', '[C语言,算法]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/img/1636120645666-C.png', 'https://github.com/coderit666/CNote', 685, 0, '2021-09-09 21:28:29', NULL, 0);
INSERT INTO `resource` VALUES (10, 2, 9, 'Iconfont 矢量图标库', '国内功能强大且图标丰富的矢量图标库，提供矢量图标下载、在线存储、格式转换等功能。阿里巴巴体验团队倾力打造，设计和前端开发的便捷工具。', 'iconfont-国内功能很强大且图标内容很丰富的矢量图标库，提供矢量图标下载、在线存储、格式转换等功能。阿里巴巴体验团队倾力打造，设计和前端开发的便捷工具', '[工具,前端]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/img/TB1_oz6GVXXXXaFXpXXJDFnIXXX-64-64.jpg', 'https://www.iconfont.cn/', 131, 0, '2021-10-01 21:28:38', NULL, 0);
INSERT INTO `resource` VALUES (11, 1, 10, 'Java 源码教程项目汇总', '官方整理的顶级 Java 源码教程项目', 'GItHub 无法访问可用码云仓库：https://gitee.com/liyupi/free-programming-resources/tree/main/%E9%A1%B9%E7%9B%AE%E5%AE%9E%E6%88%98#Java%E4%BB%A3%E7%A0%81%E5%90%88%E9%9B%86', '[项目源码,Java]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/img/1615623130528-logo(5).png', 'https://github.com/liyupi/free-programming-resources/tree/main/%E9%A1%B9%E7%9B%AE%E5%AE%9E%E6%88%98#Java%E4%BB%A3%E7%A0%81%E5%90%88%E9%9B%86', 244, 0, '2021-11-11 21:28:48', NULL, 0);
INSERT INTO `resource` VALUES (12, 1, 1, 'JavaGuide', 'GitHub 10w star 的「Java学习+面试指南」，涵盖大部分 Java 程序员所需要掌握的核心知识。', '非常全面清晰的 Java 学习和面试指南，准备 Java 面试，首选 JavaGuide！', '[Java,后端]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/img/1610720462558-javaguide.png', 'https://github.com/Snailclimb/JavaGuide', 68, 0, '2021-12-14 21:29:08', NULL, 0);
INSERT INTO `resource` VALUES (13, 2, 1, 'CodeGym', '在线 Java 语言编程课程， 其中 80% 的内容基于实践。', '互联网上有关 Java 语言的好书数不胜数，但书本知识不会让你成为一名程序员。要学习 Java 语言并成为一名程序员，你需要大量编写代码。 CodeGym 是一门在线 Java 语言编程课程，其中 80% 的内容为实践。这就是成为一名真正的 Java 开发人员所需要的东西。', '[Java]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/cloudbase-cms/upload/2021-02-13/2q5onwdg48xni7s5crml6mj1yiwhriav_.png', 'https://codegym.cc/zh/', 169, 0, '2022-01-02 21:29:22', NULL, 0);
INSERT INTO `resource` VALUES (14, 1, 1, 'Java工程师进阶知识完全扫盲', '内容涵盖高并发、分布式、高可用、微服务、海量数据处理等', 'Java 工程师进阶知识完全扫盲', '[Java,项目源码]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/img/1629909798635-icon.png', 'https://doocs.github.io/advanced-java', 69, 0, '2022-01-14 21:29:27', NULL, 0);
INSERT INTO `resource` VALUES (15, 1, 1, 'kuangstudy', '免费课程网站，目前已提供java零基础到企业项目实战的完整java学习路线', '该资源为一个附带论坛的视频教程网站，目前已上架从零基础到企业项目实战的java学习完整路线（还包括数据库和前端的完整学习资源）。除去学习体系外的精品课，所有学习视频全部免费。相关讲义下载和课堂示例代码需要虚拟货币购买，可以通过支付一定金额开通会员获得（视频本身完全免费）', '[Java]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/img/1620652531170-83bb511365da513c55aa3d1958524f3b7db40684.jpg@128w_128h_1o.webp', 'https://www.kuangstudy.com', 18, 0, '2022-01-28 21:29:32', NULL, 0);
INSERT INTO `resource` VALUES (16, 2, 20, '魔方栈', '优美而强大的网页魔方', 'gitee地址：https://huazhechen.gitee.io/cuber', '[游戏]', 'https://t8.baidu.com/it/u=3417929119,1420479483&fm=218&app=126&size=f242,150&n=0&f=JPEG&fmt=auto?s=50B480722CF57696079C936E0300A061&sec=1664211600&t=90c40908a376f037cfae606a9c15e877', 'https://huazhechen.gitee.io/cuber', 23, 0, '2022-02-04 21:29:38', NULL, 0);
INSERT INTO `resource` VALUES (17, 1, 19, 'PDManer', 'PDManer元数建模，是一款多操作系统开源免费的桌面版关系数据库模型建模工具', 'PDManer元数建模，是一款多操作系统开源免费的桌面版关系数据库模型建模工具，相对于PowerDesigner，他具备界面简洁美观，操作简单，上手容易等特点。支持Windows,Mac,Linux等操作系统，也能够支持国产操作系统', '[数据库,Java]', 'https://portrait.gitee.com/uploads/avatars/namespace/643/1931553_robergroup_1578991317.png', 'https://gitee.com/robergroup/pdmaner/releases', 685, 0, '2022-02-08 21:29:48', NULL, 0);
INSERT INTO `resource` VALUES (18, 1, 19, 'mybatis-plus', 'Mybatis 增强工具包 - 只做增强不做改变，简化CRUD操作', 'gitee地址：https://gitee.com/baomidou/mybatis-plus', '[数据库,Java]', 'https://img2.baidu.com/it/u=2641425490,4043885404&fm=253&fmt=auto&app=138&f=PNG?w=500&h=364', 'https://gitee.com/baomidou/mybatis-plus', 222, 0, '2022-02-28 21:29:55', NULL, 0);
INSERT INTO `resource` VALUES (19, 2, 18, 'GoView', '一个基于 Vue、Datav、Echart 框架的 \" 数据大屏项目 \"', 'GoView 是一个高效的拖拽式低代码数据可视化开发平台，将图表或页面元素封装为基础组件，无需编写代码即可制作数据大屏，减少心智负担。', '[服务器,Vue]', 'https://t9.baidu.com/it/u=483287887,1741175797&fm=218&app=126&size=f242,150&n=0&f=PNG?s=C9D58346C6362D94214FD311030050D9&sec=1664211600&t=237d8f3b782e6a16d0110c34fca96c9d', 'https://gitee.com/MTrun/go-view', 12, 0, '2022-03-01 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (20, 1, 17, 'OSChina Android', '开源中国官方App客户端开源代码。', '新版相关代码集中在**“net.oschina.app.improve”**包中，其他包中代码将逐步清理。', '[移动开发,Android]', 'https://portrait.gitee.com/uploads/avatars/namespace/0/1_oschina_1620785990.png', 'https://gitee.com/oschina/android-app', 51, 0, '2022-03-02 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (21, 3, 17, 'QtScrcpy', 'Android实时投屏软件', 'QtScrcpy 可以通过 USB / 网络连接Android设备，并进行显示和控制。无需root权限。\r\n\r\n同时支持 GNU/Linux ，Windows 和 MacOS 三大主流桌面平台。', '[移动开发,Android]', 'https://portrait.gitee.com/uploads/avatars/user/469/1407554_Barryda_1578950760.png!avatar60', 'https://gitee.com/Barryda/QtScrcpy#qtscrcpy', 77, 0, '2022-03-07 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (22, 1, 17, '萤火商城', '萤火商城V2.0，是2021年全新推出的一款轻量级、高性能、前后端分离的电商系统', '萤火商城V2.0，是2021年全新推出的一款轻量级、高性能、前后端分离的电商系统，支持微信小程序 + H5+ 公众号 + APP，前后端源码完全开源，看见及所得，完美支持二次开发，可学习可商用，让您快速搭建个性化独立商城。', '[移动开发,Android,商城]', 'https://portrait.gitee.com/uploads/avatars/namespace/755/2267426_xany_1578991730.png', 'https://gitee.com/xany/yoshop2.0-uniapp', 88, 0, '2022-03-09 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (23, 3, 16, '微同商城', '减少重复造轮子，开源微信小程序商城', '减少重复造轮子，开源微信小程序商城（前后端开源：uniapp+Java），拼团、秒杀、优惠券、积分购物、直播卖货、分销等功能。快速搭建一个属于自己的微信小程序商城。', '[建站系统]', 'https://portrait.gitee.com/uploads/avatars/user/402/1207345_fuyang_lipengjun_1578946188.png!avatar60', 'https://fly2you.cn/', 101, 0, '2022-03-10 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (24, 1, 16, 'MCMS', '完整开源的Java CMS！基于SpringBoot 2架构，前端基于vue、element ui。', '很多人说铭飞是大天朝国唯一完整开源的J2EE系统！团队希望看到更多的优秀好用的开源系统，我们一直会努力下去！', '[建站系统,Java]', 'https://portrait.gitee.com/uploads/avatars/user/180/542665_mingSoft_1578927126.png!avatar60', 'https://gitee.com/mingSoft/MCMS', 142, 0, '2022-03-18 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (25, 3, 16, 'CRMEB', '码云开源项目php语言排名前三的开源GVP项目！', 'CRMEB技术团队（官网：www.crmeb.com)历经6年时间匠心之作！系统采用前后端分离技术，基于TP6+Uni-app框架开发；客户移动端采用uni-app开发，管理后台前端使用iviewUI开发。系统支持微信公众号端、微信小程序端、H5端、PC端多端账号同步，可快速打包生成APP。', '[建站系统,Java]', 'https://portrait.gitee.com/uploads/avatars/namespace/665/1996229_ZhongBangKeJi_1609921752.png!avatar100', 'https://gitee.com/ZhongBangKeJi/CRMEB', 145, 0, '2022-03-20 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (26, 1, 2, '图解算法数据结构', '帮助你在算法学习的道路上扬帆起航', '「图解算法数据结构」 面向算法初学者、求职者设计，配合剑指 Offer 系列题解，开展各类专题讲解，旨在帮助读者全面地学习算法与数据结构的核心知识。', '[算法,数据结构,教程]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/img/1621483996177-Leetbook_图解算法数据结构_300x400.jpg', 'https://leetcode-cn.com/leetbook/detail/illustration-of-algorithm/', 19, 0, '2022-03-21 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (27, 1, 2, '300分钟搞定数据结构与算法', '结合力扣刷题总结写的一本数据结构与算法书（在线阅读）', '不管是什么方向的伙伴们面试的一大头疼点一定是算法了吧，这本书结合着力扣刷题看了还不错，希望对大家在算法方面有帮助提升。', '[数据结构,算法,书籍]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/img/1621216178600-300分钟搞定数据结构与算法.png', 'https://www.kancloud.cn/alex_wsc/dataalg', 26, 0, '2022-03-29 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (28, 3, 2, 'algorithm-base', '立志用动画将晦涩难懂的算法说的通俗易懂!', '专门为刚开始刷题的同学准备的算法基地，没有最细只有更细。', '[算法,GitHub,图解]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/img/1619371340119-37890807.jpg', 'https://github.com/chefyuan/algorithm-base', 113, 0, '2022-04-01 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (29, 1, 2, 'LeetCode算法全解', '多种编程语言实现 LeetCode、《剑指 Offer（第 2 版）》、《程序员面试金典（第 6 版）》题解', 'LeetCode算法全解', '[算法,LeetCode,GitHub]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/img/1645248000722-440513', 'https://github.com/doocs/leetcode', 56, 0, '2022-04-05 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (30, 3, 3, 'JavaScript Guidebook', 'JavaScript 知识图谱：ECMAScript、DOM、BOM、HTML5、计算机网络', '完整体系 根据官方文档及社区建设构建尽可能实用的知识体系，宏观掌握技术体系;深度分析 尽览社区精品技术文章，将最受业界欢迎的使用方法收录其中;开发指南 体系化整理，随时查阅具体技术细节，方便前端开发者日常开发', '[前端,书籍]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/img/1623556955290-favicon.png', 'https://tsejx.github.io/javascript-guidebook/', 41, 0, '2022-04-09 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (31, 1, 3, '深入理解Vue.js实战', '本书全面介绍 Vue.js 框架的出现、设计和使用，结合实战让读者更深入理解 Vue.js 框架，掌握使用方法。', '本书全面介绍 Vue.js 框架的出现、设计和使用，结合实战让读者更深入理解 Vue.js 框架，掌握使用方法。', '[前端,Vue]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/img/1623222495519-1200px-Vue.js_Logo_2.svg (1).png', 'http://www.godbasin.com/vue-ebook/', 66, 0, '2022-04-11 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (32, 1, 3, '33-js-concepts', '每个 JavaScript 工程师都应懂的33个概念', '每个 JavaScript 工程师都应懂的33个概念', '[前端,教程]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/img/1617286017484-33_js_concepts.jpg', 'https://github.com/stephentian/33-js-concepts', 77, 0, '2022-04-16 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (33, 1, 3, 'uiverse.io', '非常有创意的UI样式', '非常有创意的UI样式', '[前端,CSS]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/img/1637041443155-QQ截图20211116134338.png', 'https://cssbuttons.io/buttons', 62, 0, '2022-04-19 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (34, 1, 4, 'FreeAIHub', 'FreeAIHub 交互式文档在线学习编程', '一群崇尚开源文化，热爱学习的小伙伴，深信人类正走进人工智能的美好时代，许多奇妙的事情正在这个时代下发生。我们在努力将AI时代最需要的能力，整理制作出路线图和课程，通过在线互动式的学习，免费、公开、平等地分享给每个想要奋力进入人工智能时代的人。', '[Python,人工智能]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/img/1614267813376-freeai.png', 'https://www.freeaihub.com/', 134, 0, '2022-04-21 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (35, 1, 4, 'Python 简明教程', '短小精湛、久负盛名的 Python 入门教程 —— 《Python 简明教程》，英文原名《A Byte of Python》', '《A Byte of Python》https://python.swaroopch.com/ 《Python 简明教程》https://learnku.com/docs/byte-of-python/2018', '[Python,书籍]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/img/1621419955706-111.png', 'https://learnku.com/docs/byte-of-python/2018', 12, 0, '2022-04-24 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (36, 1, 4, '莫烦Python', '汇集 Python 基础、人工智能、数据处理等学习教程', '\r\n机器学习 的教程方面, 汇集了很多近些年来比较流行的 python 模块教程. 而且对于没有机器学习背景的朋友们, 我也专门制作了 有趣的机器学习. 让你对机器学习的每种方法都有迅速地理解. 对于已经入门了的同学们, 有趣的机器学习 也是一个提升自己应用机器学习的好地方, 因为里面同时也介绍了很多种机器学习的技巧方法, 大大帮助提升学习效果。', '[Python,视频,人工智能]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/img/1610814093581-tab_icon.png', 'https://mofanpy.com/', 45, 0, '2022-04-29 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (37, 1, 4, 'Python123', '让编程更简单，提供更好的编程学习体验！', '\r\nPython123 是面向新工科教学需求的计算机类基础课程教学辅助平台。Python123 向合作教师与高校提供精品教学资源、全系列课程内容、全流程教学工具，支撑课程教学管理、练习、考试、教学研究等实际需求，为国家级、省部级一流课程提供教学研究数据支撑。', '[Python,视频]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/cloudbase-cms/upload/2021-01-24/3b2mremh2ajy5ig4tab72epnpwn4dsq5_.jpg', 'https://python123.io/', 55, 0, '2022-05-01 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (38, 1, 4, 'python数据分析视频', '集合了 python 大部分数据分析的视频讲解和习题', '集合了 python 大部分数据分析的视频讲解和习题', '[Python,数据分析]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/img/1610812433642-src=http _ku.90sjimg.com_element_origin_min_pic_00_85_77_1156e9e346a018f.jpg&refer=http _ku.90sjimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg.jpg', 'https://shimo.im/docs/36pykCPH6XCjKJcv/read', 69, 0, '2022-05-05 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (39, 1, 5, 'Docker 从入门到实践', '学习和理解 Docker 技术，并进行 DevOps 实战', '本书既适用于具备基础 Linux 知识的 Docker 初学者，也希望可供理解原理和实现的高级用户参考。同时，书中给出的实践案例，可供在进行实际部署时借鉴。', '[后端,书籍,教程]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/img/1621332004478-index.png', 'https://vuepress.mirror.docker-practice.com/', 72, 0, '2022-05-09 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (40, 1, 5, '凤凰架构', '教你构建可靠的大型分布式系统', '\r\n这是一部以“如何构建一套可靠的分布式大型软件系统”为叙事主线的开源文档，是一幅帮助开发人员整理现代软件架构各条分支中繁多知识点的技能地图。', '[后端,书籍,Java]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/img/1623449970878-凤凰logo.png', 'https://icyfenix.cn/', 97, 0, '2022-05-10 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (41, 1, 5, 'JVM底层原理', 'JVM 底层原理最全知识总结', 'JVM 底层原理最全知识总结', '[后端,Java,JVM]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/img/1620398927455-jvm-jre-jdk1.png', 'https://github.com/doocs/jvm', 21, 0, '2022-05-15 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (42, 1, 6, '图解HTTP', '全面系统的介绍HTTP协议', '提取码：9fv0', '[网络,书籍]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/img/1630047628436-s27283822.jpg', 'https://pan.baidu.com/s/1znL-3U7sGXDGWyVioWOmIg', 3, 0, '2022-05-17 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (43, 1, 6, '计算机网络微课堂', '计算机网络相关的微课，用形象生动的动画演示抽象的概念，推荐~', '计算机网络相关的微课，用形象生动的动画演示抽象的概念，推荐~', '[网络,教程]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/img/1610723201750-01.png', 'https://www.bilibili.com/video/BV1c4411d7jb', 23, 0, '2022-05-20 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (44, 1, 6, '《计网-自顶向下方法》', '（原书第6版）', '\r\n提取码：1234', '[网络,书籍]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/img/1628757957023-QQ截图20210812164232.jpg', 'https://pan.baidu.com/s/1np1eede2hgaFpK2tZ29PBw', 19, 0, '2022-05-25 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (45, 1, 7, '蓝湖', '无缝衔接产品、设计、研发流程，降低沟通成本，缩短开发周期，提高工作效率', '无缝衔接产品、设计、研发流程，降低沟通成本，缩短开发周期，提高工作效率', '[软件开发,产品设计]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/img/1626679859412-1626679830(1).jpg', 'https://lanhuapp.com/?home', 14, 0, '2022-05-30 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (46, 1, 7, 'ffmpeg', 'Fmpeg 是领先的多媒体框架', '\r\n能够解码、编码、转码、混合、解密、流媒体、过滤和播放人类和机器创造的几乎所有东西。', '[软件开发,框架]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/img/1626516426861-src=http___git.oschina.net_uploads_1_1_oschina-org.png_1524465517&refer=http___git.oschina.jfif', 'https://gitee.com/mirrors/ffmpeg', 13, 0, '2022-06-01 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (47, 1, 7, 'Bugly', '腾讯Bugly', '为移动开发者提供专业的异常上报和运营统计，帮助开发者快速发现并解决异常，同时掌握产品运营动态，及时跟进用户反馈。', '[软件开发,Android,IOS]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/img/1626769629456-1626769608(1).jpg', 'https://bugly.qq.com/v2/', 11, 0, '2022-06-05 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (48, 1, 8, 'C Primer Plus(第6版)(中文版)', '非扫描版', '\r\n(NEW)普拉达-(Stephen-Prata)-C-Primer-Plus(第6版)(中文版)', '[C语言,书籍]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/img/1637584410968-1.jpg', 'https://oj8k.lanzoui.com/iyIESws9eng', 42, 0, '2022-06-09 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (49, 1, 8, 'C++教程', '黑马出品，C++ 教程，从 0 到 1 入门编程，学习编程不再难', '本教程分为7个阶段，涵盖基础入门到实战项目。', '[C语言,教程,视频]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/img/1610806145104-bilibili.jpg', 'https://www.bilibili.com/video/BV1et411b73Z', 34, 0, '2022-06-10 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (50, 1, 8, 'C语言网', '在线使用', 'C语言网(Dotcpp.com)奉行“学练同步，知行合一”的学习理念，希望大家都能理论与动手一起加强！拒绝理论派！', '[C语言]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/img/1619066472769-下载 (2).jfif', 'https://www.dotcpp.com/', 32, 0, '2022-06-12 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (51, 1, 8, 'C语言入门教程', '阮一峰老师的C语言教程', '阮一峰老师的C语言教程', '[C语言,教程]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/img/1627009954747-下载 (2).jfif', 'https://wangdoc.com/clang/index.html', 14, 0, '2022-06-15 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (52, 1, 9, 'ZDZN文档教程', '各种编程语言和脚本的速查表', '各种编程语言和脚本的速查表', '[工具,文档]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/img/1620733536847-favicon.png', 'https://doc.zdzn.net/', 54, 0, '2022-06-19 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (53, 1, 9, '程序员的工具箱', '集成大量开发必备在线工具', '\r\n在线工具 - 程序员的工具箱', '[工具综合,门户\r\n]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/img/1610542315479-002819v0Gaydtvy2P4y03G_144x144.png', 'https://tool.lu/', 67, 0, '2022-06-24 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (54, 1, 9, '宝塔Linux面板', '新手使用Linux服务器比较友好的面板，网站式管理', '新手使用Linux服务器比较友好的面板，网站式管理', '[工具,开发平台,Linux]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/img/1611123961435-微信图片_20210120142545.png', 'https://www.bt.cn/', 56, 0, '2022-06-30 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (55, 1, 9, 'CODELF', '变量命名神器', 'A search tool helps dev to solve the naming things problem.', '[工具,效率]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/cloudbase-cms/upload/2021-01-14/7ejgmgjoqvuupqk21lx6jl16ffhajqu8_.png', '`https://github.com/unbug/codelf', 45, 0, '2022-07-01 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (56, 1, 9, '鸠摩搜书', '电子书搜索引擎，有多种格式可供下载', '可以找到很多免费的电子书', '[工具,书籍,搜索引擎]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/img/1610815122821-apple-114.png', 'https://www.jiumodiary.com/', 68, 0, '2022-07-04 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (57, 1, 10, '50个js案例及源码', '50天用JavaScript完成50个web项目，我学到了什么?', '50天用JavaScript完成50个web项目，我学到了什么?', '[项目源码,Javascript,网页]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/img/1628735705308-logo-b.d865fc97[1].svg', 'https://segmentfault.com/a/1190000040481518', 128, 0, '2022-07-05 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (58, 1, 10, 'GitHub', '全球最大的软件项目托管平台，发现优质开源项目', '全球最大的代码托管平台，也是程序员的交友社区。作为开源代码库以及版本控制系统，Github 拥有超过900万开发者用户。随着越来越多的应用程序转移到了云上，Github已经成为了管理软件开发以及发现已有代码的首选方法。', '[项目源码,GitHub]', 'https://636f-codenav-8grj8px727565176-1256524210.tcb.qcloud.la/img/1610896059065-9919.png', 'https://github.com/', 1053, 0, '2022-07-06 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (59, 1, 11, 'iot-dc3 ', 'DC3 是基于 Spring Cloud 的开源可分布式物联网 (IOT) 平台', 'DC3 是基于 Spring Cloud 的开源可分布式物联网 (IOT) 平台,用于快速开发、部署物联设备接入项目,是一整套物联系统解决方案。', '[前沿技术,java]', 'https://t7.baidu.com/it/u=2978380947,2442156544&fm=173&app=49&size=f242,150&n=0&f=JPEG&fmt=auto?s=B21B30C64BA3BD59565E50900300D08B&sec=1664211600&t=84bb6d4489860d78cfb5a0059ed80d3c', 'https://gitee.com/pnoker/iot-dc3', 124, 0, '2022-07-08 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (60, 1, 11, 'GuiLite', '4千行，仅头文件，全平台 GUI库；适用于：物联网、嵌入式、单片机、桌面应用。', ' 即使是C语言的初学者，也可以很快掌握GUI-lite；代码只使用C++的基本特性（类和虚函数），选择C++语言，能让代码体积更小，更易阅读。', '[前沿技术,c++]', 'https://static.oschina.net/uploads/logo/guilite_scTw9.png', 'https://gitee.com/idea4good/GuiLite', 89, 0, '2022-07-09 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (61, 1, 11, 'dgiot', ' 轻量级物联网开源平台，30分钟快速部署，千万级设备承载、电信级稳定性。', '数字化需求日益增长与企业缺钱缺人缺经验的矛盾日益突出，为此dgiot坚持代码开源，产品免费，持续改善物联网服务性价比  ', '[前沿技术,IOT]', 'https://doc.dgiotcloud.cn/img/logo.png', 'https://gitee.com/dgiiot/dgiot', 21, 0, '2022-07-10 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (62, 1, 12, 'knowledge', '本仓库的样例都是基于智能家居，从客厅到卧室，从中控到sensor，开发者可以体验各种家居的开发样例.', '小孩放学了，做作业的时间到，窗帘、护眼灯自动打开，关掉电视和扫地机，给小孩一个安静舒适的学习环境；碰到学习难题，可以随时请求你的远程指导。', '[OpenHarn,JavaScript]', 'https://t9.baidu.com/it/u=3619739918,3087952486&fm=218&app=126&size=f242,150&n=0&f=JPEG&fmt=auto?s=BE8A702357507DCA0C5CD5C60100C0B1&sec=1664211600&t=ab637a992aacf09fc55b40ce833b5a33', 'https://gitee.com/openharmony-sig/knowledge_demo_smart_home', 77, 0, '2022-07-11 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (63, 1, 13, 'Paddle', ' PaddlePaddle (PArallel Distributed Deep LEarning 并行分布式深度学习)是百度研发的深度学习平台', '飞桨(PaddlePaddle)以百度多年的深度学习技术研究和业务应用为基础，是中国首个自主研发、功能完备、 开源开放的产业级深度学习平台，集深度学习核心训练和推理框架、基础模型库、端到端开发套件和丰富的工具组件于一体.', '[人工智能,python]', 'https://dss0.bdstatic.com/-0U0bnSm1A5BphGlnYG/tam-ogel/4f49df8f371b8c0e692720d498d09005_121_121.jpg', 'https://gitee.com/paddlepaddle/Paddle', 66, 0, '2022-07-12 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (64, 1, 13, 'mindspore', 'MindSpore is a new open source deep learning training/inference framework that could be used for mobile, edge and cloud scenarios.', 'MindSpore是一种适用于端边云场景的新型开源深度学习训练/推理框架。 MindSpore提供了友好的设计和高效的执行，旨在提升数据科学家和算法工程师的开发体验，并为Ascend AI处理器提供原生支持，以及软硬件协同优化。', '[人工智能,python]', 'https://t8.baidu.com/it/u=2854977822,1527224131&fm=74&app=80&size=f256,256&n=0&f=JPEG&fmt=auto?sec=1664211600&t=bac0f61a7681fe1d7d7ec456d171a62b', 'https://gitee.com/mindspore/mindspore', 55, 0, '2022-07-13 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (65, 1, 13, 'EasyPR', 'EasyPR是一个中文的开源车牌识别系统，其目标是成为一个简单、高效、准确的车牌识别引擎。', 'EasyPR是一个开源的中文车牌识别系统，其目标是成为一个简单、高效、准确的非限制场景(unconstrained situation)下的车牌识别库。', '[人工智能,c++]', 'https://t7.baidu.com/it/u=2683742943,4225610736&fm=218&app=126&size=f242,150&n=0&f=JPEG&fmt=auto?s=1E25F904081089D4CE12F08703002099&sec=1664211600&t=c4eaabfe0d054fed45ce18a89596155f', 'https://gitee.com/liuruoze/EasyPR ', 54, 0, '2022-07-14 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (66, 1, 14, 'WxJava', 'WxJava - 微信开发 Java SDK，支持微信支付、开放平台、公众号、企业号/企业微信、小程序等的后端开发', '阅读源码的同学请注意，本SDK为简化代码编译时加入了lombok支持，如果不了解lombok的话，请先学习下相关知识，比如可以阅读此文章；', '[微信开发,java]', 'https://static.oschina.net/uploads/logo/weixin-java-tools-new_wOfj1.jpeg', 'https://gitee.com/binary/weixin-java-tools', 45, 0, '2022-08-01 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (67, 1, 14, 'jeewx', 'Jeewx是一款开源、免费的微信管家系统，2014年荣获CSDN开发商大会第一名', 'Jeewx实现了微信公众号、支付窗、微信企业号、小程序等触点的基础管理功能，集成了Oauth2.0、扩展业务、工具箱、报表等实用模块，强大的代码生成器，便于用户二次开发。', '[微信开发,java]', 'https://img1.baidu.com/it/u=3361636817,1038955663&fm=253&fmt=auto&app=138&f=PNG?w=433&h=312', 'https://gitee.com/jeecg/jeewx', 33, 0, '2022-08-06 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (68, 1, 14, 'SmartWx_old1', '微信公众号的web管理工具 本项目采用springmvc+layui实现。', '本项目是一个完整的微信公众号web操作版，直接编译即可运行。让用户不再用关心微信的底层接口，直接使用页面进行操作，简单方便。 包括服务器绑定、文本管理、图文管理、菜单管理、粉丝管理、群发消息等.', '[微信开发,java]', 'https://img1.baidu.com/it/u=3361636817,1038955663&fm=253&fmt=auto&app=138&f=PNG?w=433&h=312', 'https://gitee.com/qingfengtaizi/wxmp', 22, 0, '2022-08-09 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (69, 1, 15, '华夏ERP', '华夏ERP基于SpringBoot框架和SaaS模式，立志为中小企业提供开源好用的ERP软件', '主要模块有零售管理、采购管理、销售管理、仓库管理、财务管理、报表查询、系统管理等。支持预付款、收入支出、仓库调拨、组装拆卸、订单等特色功能。', '[企业应用,java]', 'https://ms.bdimg.com/pacific/0/pic/-1457912828_-862056654.png?x=0&y=0&h=150&w=242&vh=150.00&vw=242.00&oh=150.00&ow=242.00', 'https://gitee.com/jishenghua/JSH_ERP', 65, 0, '2022-08-10 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (70, 1, 15, 'oasys', '办公自动化（OA）是面向组织的日常运作和管理，员工及管理者使用频率最高的应用系统，极大提高公司的办公效率。', 'oasys是一个OA办公自动化系统，使用Maven进行项目管理，基于springboot框架开发的项目，mysql底层数据库，前端采用freemarker模板引擎，Bootstrap作为前端UI框架，集成了jpa、mybatis等框架。', '[企业应用,java]', 'https://fc1tn.baidu.com/it/u=3124765057,1562770796&fm=202&mola=new&crop=v1', 'https://gitee.com/aaluoxiang/oa_system', 45, 0, '2022-08-17 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (71, 1, 15, '赤龙ERP', '赤龙ERP旨在研发一款免费开源、业务闭环、灵活稳定的企业级ERP系统。实现真正的财务业务一体化；从计划预算、订单、出入库，到发票、收付款，再到凭证、分录、总账，实现对管理流、信息流、数据流的全方位管控。', '赤龙ERP旨在研发一款免费开源、业务闭环、灵活稳定的企业级ERP系统。实现真正的财务业务一体化；从计划预算、订单、出入库，到发票、收付款，再到凭证、分录、总账，实现对管理流、信息流、数据流的全方位管控。', '[企业应用,java]', 'https://t7.baidu.com/it/u=1819363294,57106203&fm=218&app=126&size=f242,150&n=0&f=PNG?s=00D5E93284C9C1094854F0DC0300C0B1&sec=1664211600&t=f8fcb8df1454c852b80814473897390a', 'https://gitee.com/redragon/redragon-erp', 19, 0, '2022-08-29 21:30:00', NULL, 0);
INSERT INTO `resource` VALUES (72, 20, 2, 'test666', 'dsad', 'dsad', '[dsa,  dsa,  dsa]', 'https://fantasy-1305765455.cos.ap-shanghai.myqcloud.com/image/f73416c77a064863a02fabe78de43445_%E9%92%A2%E9%93%81%E4%BE%A03.jpg', 'sssss@qq.com', NULL, 0, '2022-09-28 00:11:33', '2022-09-28 00:11:49', 1);
INSERT INTO `resource` VALUES (73, 21, 3, 'test', 'test', 'test', '[java, 666]', 'https://fantasy-1305765455.cos.ap-shanghai.myqcloud.com/image/fa78293168ed4c5985ae77e3171a991a_%E9%92%A2%E9%93%81%E4%BE%A02.jpg', 'www.baidu.com', NULL, 0, '2022-09-28 08:39:57', '2022-09-28 08:39:57', 0);
INSERT INTO `resource` VALUES (74, 1, 2, '4343', 'dad', 'ddad', '[dasd, dsad]', 'https://fantasy-1305765455.cos.ap-shanghai.myqcloud.com/image/d98b5e3a6268418eb5f392246b0c063d_%E9%92%A2%E9%93%81%E4%BE%A02.jpg', '42343424', NULL, 0, '2022-09-28 16:17:17', '2022-09-28 16:17:17', 0);
INSERT INTO `resource` VALUES (75, 25, 4, '科大讯飞', '科大讯飞开源工作组，主要将核心框架、工具或数据等项目以商业化友好的License进行开源，加入讯飞开源请大胆联系我们', 'iFLearner是一个强大且轻量的联邦学习框架，提供了一种基于数据隐私安全保护的计算框架， 主要针对深度学习场景下的联邦建模。其安全底层支持同态加密、秘密共享、差分隐私等多种加密技术， 算法层支持各类深度学习网络模型，并且同时支持Tensorflow、Mxnet、Pytorch等主流框架。', '[Go, Python]', 'https://fantasy-1305765455.cos.ap-shanghai.myqcloud.com/image/c5b4cbff3e06449a85fde088c771c0da_iFLearner%E6%A1%86%E6%9E%B6%E8%AE%BE%E8%AE%A1.png.jpg', 'https://gitee.com/iflytek', NULL, 0, '2022-09-28 21:17:07', '2022-09-28 21:17:07', 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'https://fantasy-1305765455.cos.ap-shanghai.myqcloud.com/avatar/default_avatar.jpg' COMMENT '头像',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` int NULL DEFAULT 0 COMMENT '是否删除;0未删除 1 删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '超级管理员', 'jay', 'chou', '666777', 'super@qq.com', 'https://fantasy-1305765455.cos.ap-shanghai.myqcloud.com/avatar/jay-fantasy.jpg', '2022-09-24 00:27:09', '2022-09-28 20:59:19', 0);
INSERT INTO `user` VALUES (2, 'jay666', 'admin', 'admin', '13986571765', 'xdh20010326@163.com', 'https://fantasy-1305765455.cos.ap-shanghai.myqcloud.com/avatar/93ad297253a74e3db80f1b3d41bcfb5c_%E9%92%A2%E9%93%81%E4%BE%A03.jpg', '2022-09-08 00:23:54', '2022-09-28 13:51:37', 0);
INSERT INTO `user` VALUES (3, '你好世界', 'admin666', '777777', '3333', '24245777', 'https://fantasy-1305765455.cos.ap-shanghai.myqcloud.com/avatar/default_avatar.jpg', '2022-09-20 23:47:36', '2022-09-23 11:04:53', 0);
INSERT INTO `user` VALUES (17, '测试账号', 'test', 'test', NULL, NULL, 'https://fantasy-1305765455.cos.ap-shanghai.myqcloud.com/avatar/default_avatar.jpg', '2022-09-25 21:29:29', '2022-09-26 13:05:42', 0);
INSERT INTO `user` VALUES (18, '933888bd-bac0', 'lrj', '123456', NULL, NULL, 'https://fantasy-1305765455.cos.ap-shanghai.myqcloud.com/avatar/default_avatar.jpg', '2022-09-26 19:04:36', '2022-09-26 19:04:36', 0);
INSERT INTO `user` VALUES (19, '0da0e8e4-feab', 'xie', '2654153573', NULL, NULL, 'https://fantasy-1305765455.cos.ap-shanghai.myqcloud.com/avatar/default_avatar.jpg', '2022-09-27 11:51:40', '2022-09-27 11:51:40', 0);
INSERT INTO `user` VALUES (20, '6d16a3b8-2793', 'xiedinghong', '666', NULL, NULL, 'https://fantasy-1305765455.cos.ap-shanghai.myqcloud.com/avatar/default_avatar.jpg', '2022-09-28 00:08:28', '2022-09-28 00:08:28', 0);
INSERT INTO `user` VALUES (21, '666', 'test1', 'test1', NULL, NULL, 'https://fantasy-1305765455.cos.ap-shanghai.myqcloud.com/avatar/default_avatar.jpg', '2022-09-28 08:36:23', '2022-09-28 08:37:46', 0);
INSERT INTO `user` VALUES (22, 'd0f313dc-47ad', 'zhangsan', '111111', NULL, NULL, 'https://fantasy-1305765455.cos.ap-shanghai.myqcloud.com/avatar/default_avatar.jpg', '2022-09-28 10:33:37', '2022-09-28 10:33:37', 0);
INSERT INTO `user` VALUES (23, '敢敢', 'Shirley', '123456', '15827827309', NULL, 'https://fantasy-1305765455.cos.ap-shanghai.myqcloud.com/avatar/default_avatar.jpg', '2022-09-28 10:58:43', '2022-09-28 12:26:55', 0);
INSERT INTO `user` VALUES (24, '阿瑶', 'ztx', '123456', '15827827309', NULL, 'https://fantasy-1305765455.cos.ap-shanghai.myqcloud.com/avatar/default_avatar.jpg', '2022-09-28 15:21:36', '2022-09-28 15:23:13', 0);
INSERT INTO `user` VALUES (25, '酱酱妮妮', 'Danny', '123456', '13866668888', NULL, 'https://fantasy-1305765455.cos.ap-shanghai.myqcloud.com/avatar/409e9aeccedd4c50a7f6068ee453357d_j1.jpg', '2022-09-28 21:08:34', '2022-09-28 21:10:02', 0);

-- ----------------------------
-- Table structure for user_star
-- ----------------------------
DROP TABLE IF EXISTS `user_star`;
CREATE TABLE `user_star`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int NULL DEFAULT NULL,
  `rid` int NULL DEFAULT 0,
  `bid` int NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `deleted` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 231 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_star
-- ----------------------------
INSERT INTO `user_star` VALUES (246, 1, 58, 0, '2022-09-28 21:01:58', '2022-09-28 21:01:58', 0);
INSERT INTO `user_star` VALUES (247, 25, 6, 0, '2022-09-28 21:08:51', '2022-09-28 21:08:51', 0);
INSERT INTO `user_star` VALUES (248, 25, 13, 0, '2022-09-28 21:09:02', '2022-09-28 21:09:02', 0);
INSERT INTO `user_star` VALUES (249, 25, 11, 0, '2022-09-28 21:09:05', '2022-09-28 21:09:05', 0);

SET FOREIGN_KEY_CHECKS = 1;
