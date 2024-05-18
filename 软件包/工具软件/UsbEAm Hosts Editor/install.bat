
@echo off
chcp 65001
cd %~dp0
@REM 参数1是盘符,参数2是分类文件夹,参数3是下载安装包选项

IF /I "%3" EQU "Y" (
    echo "下载UsbEAm Hosts Editor安装包中"
    powershell -Command "$url = 'https://down-load.lanrar.com/file/?BmACPFxtUGEHDldvATRQPFVqAjoCCANyC25XFFNOAW1SclZJADIOKVNxV3JUIAZCAT8CbgIpBGkLfgQiUXtXZQYoAmNcMlAqBytXaAElUHdVaQJuAjEDZAtTVzhTawE9UmVWMwBsDmhTMFc3VDcGPgF9AmECLgQ7CzgEMVE0V2AGNAJiXDNQIgchV3EBaFBjVT8CNQJvAy4LPFdnUyABMFJnVi4AOw5uUzFXYFQ4BjYBPwJiAj8ENgs1BDZRbFdkBmACbFxkUGAHMldnAWVQZ1VtAmMCOQM5C2lXMFM2ATBSN1Y1AHMOIFNsV3FUJgZyASgCYgIvBG8LaAQ/UTlXbgY0AmdcMlA8B3dXdQE8UDxVagJhAmADMAs7V2BTOgE5UmVWNwBoDmpTM1cvVC4GIQE9AmsCKgQ7Cz0ENVE8V2MGPwJiXDVQPAdiVzkBc1AkVX8CcAJgAzALOldkUzsBM1JkVjEAZQ5pUzJXJ1R1Bm4BKwI6AmwENgs/BCxRPFdjBjQCe1wzUDYHYVcvAWRQYg==';$filename = [System.IO.Path]::GetFileName($url);Invoke-WebRequest -Uri $url -OutFile $filename"
    EXIT
) 
SET Drive=%1
SET Type=%2
echo "正在安装UsbEAm Hosts Editor"

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
    "%InstallFile%" /S /D=%Drive%:\ProgramFiles\%Type%"\UsbEAm Hosts Editor"
) ELSE (
    IF EXIST 123.txt (
        %7zaPath% x -o"%Drive%:\ProgramFiles\%Type%\UsbEAm Hosts Editor" -p"123" -y "%ZipFile%"
    ) ELSE (
        %7zaPath% x -o"%Drive%:\ProgramFiles\%Type%\UsbEAm Hosts Editor" -y "%ZipFile%"
    )
)


@REM 是否进行特殊配置,参数1: 盘符
IF EXIST config.bat (
    start "UsbEAm Hosts Editor" /wait Config.bat %Drive%
)

EXIT
