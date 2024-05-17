@echo off
chcp 65001

FOR %%i IN ("*.zip") DO (
    SET ZipFile=%%i
    goto :findsuc
)
echo 安装包缺失
pause
EXIT

@REM 释放文件
:findsuc
"..\..\..\7z2301-extra\x64\7za.exe" x -o"..\..\..\Test" -y "%ZipFile%"

@REM 特殊配置,参数1: 盘符
IF EXIST config.bat (
    start "{0}" /wait Config.bat %Drive%
)

EXIT