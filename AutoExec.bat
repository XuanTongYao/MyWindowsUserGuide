@echo off
chcp 65001

cd %~dp0

IF NOT EXIST "7z2301-extra\x64\7za.exe" (
    echo "检测不到7-zip解压缩,安装软件时可能出现异常"
)

SET Drive=%1
IF "%1"=="" (
    echo "---装机自动配置脚本---"
    echo "自动配置文件夹结构并安装必备软件工具等"
    echo "不支持无人值守"
    echo "安装软件的过程中由于权限问题可能会要求手动点击确认"
    echo ""
    echo "!!!"
    echo "请确保所选 盘符 无ProgramFiles文件夹, 且ProgramFiles文件夹内无重要文件,否则后果自负"
    echo "!!!"
    echo ""
    SET /P Drive="请输入盘符> "
)
IF NOT EXIST %Drive%: (
    echo "所选盘符不存在"
    pause
    EXIT
)

set /P I1="要安装系统软件吗? Y/N  (Y:是  N:否) > "
set /P I2="要安装常用工具吗? Y/N  (Y:是  N:否) > "
set /P I3="要安装个人推荐软件吗? Y/N  (Y:是  N:否) > "
set /P I4="要复制文档吗? Y/N  (Y:是  N:否) > "

echo "静默安装时不需要点击下一步等操作，适合不需要设置安装选项(选择性组件等)的软件"
set /P SI="是否使用静默安装? Y/N  (Y:是  N:否) > "

start "创建文件夹结构" /wait CreatDIR.bat %Drive%
IF /I %I1% EQU Y (
    start "安装系统软件" /wait Deploy_SysSup.bat %Drive% %SI%
)
IF /I %I2% EQU Y (
    start "安装工具软件" /wait Deploy_TOOL.bat %Drive% %SI%
)
IF /I %I3% EQU Y (
    start "安装个人推荐软件" /wait Deploy_RecommendApp.bat %Drive% %SI%
)
IF /I %I4% EQU Y (
    start "复制文档" /wait Deploy_Doc.bat %Drive%
)






