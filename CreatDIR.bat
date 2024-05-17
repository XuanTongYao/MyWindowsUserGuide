@echo off
chcp 65001

SET Drive=%1
IF "%1"=="" (
    echo "---自动创建文件夹结构脚本---"
    echo "该脚本会自动在所选盘符建立一系列文件夹"
    echo "用于存放下载文件、应用程序、资源文件等"
    SET /P Drive="请输入盘符"
)
IF NOT EXIST %Drive%: (
    echo "所选盘符不存在"
    pause
    EXIT
)

cd /d %Drive%:\

mkdir "DOWNLOAD"
mkdir "DOWNLOAD\可执行文件"
mkdir "DOWNLOAD\压缩包"
mkdir "DOWNLOAD\文档"
mkdir "DOWNLOAD\视频"
mkdir "DOWNLOAD\音频"
mkdir "DOWNLOAD\图片"
mkdir "DOWNLOAD\镜像"
mkdir "DOWNLOAD\常规"
echo "下载文件夹创建完成"

mkdir "OUT"
echo "输出文件夹创建完成"

mkdir "ProgramFiles"
mkdir "ProgramFiles\APP"
mkdir "ProgramFiles\GAMES"
mkdir "ProgramFiles\SysSup"
mkdir "ProgramFiles\TOOL"
mkdir "ProgramFiles\Develop"
echo "应用程序文件夹创建完成"

mkdir "SOURCE"
mkdir "SOURCE\Model"
mkdir "SOURCE\Model\Building"
mkdir "SOURCE\Model\Character"
mkdir "SOURCE\Model\Environment"
mkdir "SOURCE\Model\Furniture"
mkdir "SOURCE\Model\Weapon"
mkdir "SOURCE\Model\Daily"
mkdir "SOURCE\Model\Other"
mkdir "SOURCE\Textures"
mkdir "SOURCE\Sound"
mkdir "SOURCE\Image"
mkdir "SOURCE\Lib"
mkdir "SOURCE\Other"
echo "资源文件夹创建完成"

mkdir "STUDY"
mkdir "STUDY\离线文档"
mkdir "STUDY\离线文档\说明书"
mkdir "STUDY\离线文档\电子"
mkdir "STUDY\离线文档\程序设计"
mkdir "STUDY\教材资料"
mkdir "STUDY\奇思妙想"
mkdir "STUDY\笔记"
echo "学习文件夹创建完成"

mkdir "PROJECTS"
mkdir "PROJECTS\Blender"
mkdir "PROJECTS\Program"
mkdir "PROJECTS\Program\Minecraft"
mkdir "PROJECTS\Program\Android"
mkdir "PROJECTS\Program\QT"
mkdir "PROJECTS\Program\Cpp"
mkdir "PROJECTS\Program\Rust"
mkdir "PROJECTS\Program\Python"
mkdir "PROJECTS\Program\Web"
mkdir "PROJECTS\Electronics"
mkdir "PROJECTS\Electronics\SystemVerilog"
mkdir "PROJECTS\Electronics\VerilogHDL"
mkdir "PROJECTS\Electronics\STM32"
mkdir "PROJECTS\Electronics\ESP32"
mkdir "PROJECTS\Electronics\Arduino"
mkdir "PROJECTS\Github"
mkdir "PROJECTS\UE"
mkdir "PROJECTS\Unity3D"
mkdir "PROJECTS\Video"
mkdir "PROJECTS\Other"
echo "工作文件夹创建完成"

mkdir "SWAP"
echo "文件交换区创建完成"

mkdir "SWAP_PUBLIC"
echo "公共文件交换区创建完成"

mkdir "录屏素材"
echo "录屏文件文件夹创建完成"

pause
EXIT