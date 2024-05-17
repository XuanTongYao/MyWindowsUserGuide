
@echo off
chcp 65001

@REM 参数1是盘符,参数2是分类文件夹
SET Drive=%1
SET Type=%2
cd %~dp0
echo "正在安装OBS"

@REM 搜索第一个exe文件并安装
FOR %%i IN ("*.exe") DO (
    SET InstallFile=%%i
    goto :findsuc
)
echo 安装包缺失
pause
EXIT

:findsuc
echo %InstallFile%
@REM 静默安装
"%InstallFile%" /S /D=%Drive%:\ProgramFiles\%Type%"\OBS"

EXIT

