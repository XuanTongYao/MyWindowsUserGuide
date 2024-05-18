
@echo off
chcp 65001
cd %~dp0
@REM 参数1是盘符,参数2是分类文件夹,参数3是下载安装包选项

IF /I "%3" EQU "Y" (
    echo "下载PotPlayer安装包中"
    powershell -Command "$url = 'https://t1.daumcdn.net/potplayer/PotPlayer/Version/Latest/PotPlayerSetup64.exe';$filename = [System.IO.Path]::GetFileName($url);Invoke-WebRequest -Uri $url -OutFile $filename"
    EXIT
) 
SET Drive=%1
SET Type=%2
echo "正在安装PotPlayer"

SET 7zaPath="..\..\..\7z2301-extra\x64\7za.exe"

FOR %%i IN (*.zip *.rar *.7z *.exe) DO (
    SET SetupFile=%%i
    goto :findsuc
)
echo 安装包缺失
pause
EXIT

@REM 检测是否有密码并释放文件
:findsuc

IF /I ".exe" EQU "%~xSetupFile" (
    echo %InstallFile%
    @REM 静默安装
    "%InstallFile%" /S /D=%Drive%:\ProgramFiles\%Type%"\PotPlayer"
) ELSE (
    IF EXIST 123.txt (
        %7zaPath% x -o"%Drive%:\ProgramFiles\%Type%\PotPlayer" -p"123" -y "%ZipFile%"
    ) ELSE (
        %7zaPath% x -o"%Drive%:\ProgramFiles\%Type%\PotPlayer" -y "%ZipFile%"
    )
)


@REM 是否进行特殊配置,参数1: 盘符
IF EXIST config.bat (
    start "PotPlayer" /wait Config.bat %Drive%
)

EXIT
