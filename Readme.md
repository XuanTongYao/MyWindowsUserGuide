# Windows 装机配置脚本

这个项目的作用就是在安装原版 Windows 系统后，自动化地创建一系列文件夹帮助文件分类，并自动安装部署软件等。

项目同时收集了一些非常实用的软件整理成[表格](实用软件整理表格.md)，以及官方网站下载地址等。(非常常见的软件不在表内)

自动化过程由.bat 批处理脚本进行。

## 如何使用

### 用户相关

打开命令行窗口，运行以下指令:

1. 如果未下载安装包请先下载软件包中的安装包`.\Download.bat`

2. 运行自动化脚本`.\AutoExec.bat`根据提示选择相应选项

3. 如果你想单独运行每个自动化脚本可以参考各个配置的说明。

### 开发者相关

如果你对项目内提供的软件以及下载地址不满意，可以考虑自行更改项目的一些文件：

[下载地址](./软件包/下载地址.toml)存储了软件的下载地址

[软件列表](./软件包/软件列表.toml)存储了软件列表，配合自动生成脚本`AutoGenerate.py`使用。

运行自动生成脚本`python AutoGenerate.py`从**软件列表**中读取软件安装包相关信息，并在软件包文件夹中创建相关文件夹，以及各个软件的自动安装脚本，读取**下载地址**嵌入到软件安装脚本中，以便使用`Download.bat`

如果要在软件安装脚本运行后自动进行自定义配置，可在对应软件文件夹下创建你的自定义配置脚本**config.bat**

## 文件夹结构配置

在所选盘符下创建下面的文件夹：

`.\CreatDIR.bat`

1. 存放下载的文件
   <details>
   <summary>DOWNLOAD</summary>

   - 可执行文件
   - 压缩包
   - 文档
   - 视频
   - 音频
   - 图片
   - 镜像
   - 常规

   </details>

2. 存放输出的文件(发布，视频导出等)

   OUT

3. 存放应用程序文件(最好别带空格)
   <details>
   <summary>ProgramFiles</summary>

   - APP (常规程序)
   - GAMES (游戏)
   - SysSup (系统软件默认应用)
   - TOOL (小工具)
   - Develop (开发)

   </details>

4. 存放资源文件(美术、音频、模型、库等)
   <details>
   <summary>SOURCE</summary>

   - Model
   - - Building
   - - Character
   - - Environment
   - - Furniture
   - - Weapon
   - - Daily (日用品)
   - - Other
   - Texture
   - Sound
   - Image
   - Lib
   - Other

   </details>

5. 存放学习文件
   <details>
   <summary>STUDY</summary>

   - 离线文档
   - - 说明书
   - - 电子
   - - 程序设计
   - 教材资料
   - 奇思妙想
   - 笔记

   </details>

6. 存放项目文件
   <details>
   <summary>PROJECTS</summary>

   - Blender
   - Program
   - - Minecraft
   - - Android
   - - QT
   - - Cpp
   - - Rust
   - - Python
   - - Web
   - Electronics
   - - SystemVerilog
   - - VerilogHDL
   - - STM32
   - - ESP32
   - - Arduino
   - Github
   - UE
   - Unity3D
   - Video
   - Other

   </details>

7. 文件交换区(FTP, SMB)

   SWAP

8. 公共文件交换区

   SWAP_PUBLIC

9. 存放录屏文件

   录屏素材

10. 存档文件

    ARCHIVE

## 软件安装配置

完整的软件列表请查询[实用软件整理表格](实用软件整理表格.md)

### 常用系统软件

自动部署到"ProgramFiles\SysSup" 默认打开格式需要手动设置

`.\Deploy_SysSup.bat`

### 常用工具软件

自动部署到"ProgramFiles\TOOL"启动方式需要手动设置

`.\Deploy_TOOL.bat`

### 个人推荐工具

自动部署到"ProgramFiles\TOOL"启动方式需要手动设置

`.\Deploy_MyTOOL.bat`

### 常用软件

没有自动部署脚本，自行查找表格内资源，自行下载
