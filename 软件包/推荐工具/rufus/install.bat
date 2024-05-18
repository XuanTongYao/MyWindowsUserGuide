
@echo off
chcp 65001
cd %~dp0
@REM 参数1是盘符,参数2是分类文件夹,参数3是下载安装包选项

IF /I "%3" EQU "Y" (
    echo "下载rufus安装包中"
    powershell -Command "$url = 'https://github.com/pbatard/rufus/releases/download/v4.4/rufus-4.4p.exe';$filename = [System.IO.Path]::GetFileName($url);Invoke-WebRequest -Uri $url -OutFile $filename"
    EXIT
) 
SET Drive=%1
SET Type=%2
echo "正在安装rufus"

@REM 复制当前目录所有文件
xcopy ".\" "%Drive%:\ProgramFiles\%Type%\rufus\" /v /i /s /e /y

@REM 删除install.bat
del "%Drive%:\ProgramFiles\%Type%\rufus\install.bat" /f /q


@REM 是否进行特殊配置,参数1: 盘符
IF EXIST config.bat (
    start "rufus" /wait Config.bat %Drive%
)

EXIT
