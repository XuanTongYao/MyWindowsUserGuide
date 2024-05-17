@echo off
chcp 65001

SET Drive=%1
IF "%1"=="" (
    echo "---自动安装系统工具脚本---"
    echo "该脚本会自动安装系统工具"
    echo "前提是已经生成过文件夹目录"
    echo "请确保ProgramFiles文件夹内无重要文件,否则后果自负"
    SET /P Drive="请输入盘符"
)
IF NOT EXIST %Drive%: (
    echo "所选盘符不存在"
    pause
    EXIT
)

FOR /r "软件包\系统软件" %%i IN (*install.bat) DO (
    start "" /wait "%%i" %Drive% SysSup
)

echo "系统软件安装完成"
pause
EXIT