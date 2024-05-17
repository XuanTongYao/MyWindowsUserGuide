
@echo off
chcp 65001

@REM 参数1是盘符,参数2是分类文件夹
SET Drive=%1
SET Type=%2
cd %~dp0
echo "正在安装rufus"

@REM 复制当前目录所有文件
xcopy ".\" "%Drive%:\ProgramFiles\%Type%\rufus\" /v /i /s /e /y

@REM 删除install.bat
del "%Drive%:\ProgramFiles\%Type%\rufus\install.bat" /f /q

EXIT

