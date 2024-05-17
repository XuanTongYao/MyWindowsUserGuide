
@echo off
chcp 65001
cd %~dp0
@REM 参数1是盘符,参数2是分类文件夹,参数3是下载安装包选项

IF /I "%3" EQU "Y" (
    echo "下载balenaEtcher安装包中"
    @echo off
    powershell -Command "$url = 'https://github.com/balena-io/etcher/releases/download/v1.18.11/balenaEtcher-Portable-1.18.11.exe'; $output = '.\'; $filename = [System.IO.Path]::GetFileName($url); $fullOutputPath = Join-Path -Path $output -ChildPath $filename; $webclient = New-Object System.Net.WebClient; $webclient.DownloadFile($url, $fullOutputPath)"
    EXIT
) 
SET Drive=%1
SET Type=%2
echo "正在安装balenaEtcher"

@REM 复制当前目录所有文件
xcopy ".\" "%Drive%:\ProgramFiles\%Type%\balenaEtcher\" /v /i /s /e /y

@REM 删除install.bat
del "%Drive%:\ProgramFiles\%Type%\balenaEtcher\install.bat" /f /q


@REM 是否进行特殊配置,参数1: 盘符
IF EXIST config.bat (
    start "balenaEtcher" /wait Config.bat %Drive%
)

EXIT
