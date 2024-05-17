
@echo off
chcp 65001

@REM 参数1是盘符,参数2是分类文件夹
SET Drive=%1
SET Type=%2
cd %~dp0
echo "正在安装EditPlus"

FOR %%i IN (*.zip *.rar *.7z) DO (
    SET ZipFile=%%i
    goto :findsuc
)
echo 安装包缺失
pause
EXIT

@REM 检测是否有密码并释放文件
:findsuc
IF EXIST 123.txt (
    "..\..\..\7z2301-extra\x64\7za.exe" x -o"%Drive%:\ProgramFiles\%Type%\EditPlus" -p"123" -y "%ZipFile%"
) ELSE (
    "..\..\..\7z2301-extra\x64\7za.exe" x -o"%Drive%:\ProgramFiles\%Type%\EditPlus" -y "%ZipFile%"
)

@REM 特殊配置,参数1: 盘符
IF EXIST config.bat (
    start "EditPlus" /wait Config.bat %Drive%
)

EXIT

