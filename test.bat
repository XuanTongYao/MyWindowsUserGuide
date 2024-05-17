SET 7zaPath="..\\..\\..\\7z2301-extra\\x64\\7za.exe"

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
    "%InstallFile%" {1} {2}=%Drive%:\ProgramFiles\%Type%"\{0}"
) ELSE (
    IF EXIST 123.txt (
        %7zaPath% x -o"%Drive%:\ProgramFiles\%Type%\{0}" -p"123" -y "%ZipFile%"
    ) ELSE (
        %7zaPath% x -o"%Drive%:\ProgramFiles\%Type%\{0}" -y "%ZipFile%"
    )
)

