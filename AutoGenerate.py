# 软件包目录安装脚本自动生成脚本
# 对于exe类型的安装包 使用静默安装的方式直接安装
# 对于zip类型的安装包 使用7z解压的方式安装
# 对于portable类型的安装包 复制目录内所有文件到目标目录进行安装

from os import listdir, mkdir
from os.path import dirname
from os.path import realpath
from toml import load

ThisPath = dirname(realpath(__file__))

静默安装参数 = [
    "/S",
    "/SILENT",
]

路径设置参数 = [
    "/D",
    "/DIR",
]

分类映射表 = {
    "SysSup": "系统软件",
    "TOOL": "工具软件",
    "RecommendApp": "推荐工具",
    "APP": "常用软件",
}

# Portable软件安装代码
P_Code = """
@REM 复制当前目录所有文件
xcopy ".\\" "%Drive%:\ProgramFiles\%Type%\{0}\\" /v /i /s /e /y

@REM 删除install.bat
del "%Drive%:\ProgramFiles\%Type%\{0}\install.bat" /f /q
"""
# 压缩包与exe安装代码
ZipAndExe_Code = """
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
"""

InstallScript_Template = """
@echo off
chcp 65001
cd %~dp0
@REM 参数1是盘符,参数2是分类文件夹,参数3是下载安装包选项

IF /I "%3" EQU "Y" (
    echo "下载{0}安装包中"
    powershell -Command "$url = '{2}';$filename = [System.IO.Path]::GetFileName($url);Invoke-WebRequest -Uri $url -OutFile $filename"
    EXIT
) 
SET Drive=%1
SET Type=%2
echo "正在安装{0}"
{1}

@REM 是否进行特殊配置,参数1: 盘符
IF EXIST config.bat (
    start "{0}" /wait Config.bat %Drive%
)

EXIT
"""

DocumentScript_Template = """
@echo off
chcp 65001

@REM 参数1是盘符
SET Drive=%1
cd %~dp0
echo "正在复制{0}"

xcopy ".\\" "%Drive%:\STUDY\Document\{0}\\" /v /i /s /e /y

@REM 删除copy.bat
del "%Drive%:\STUDY\Document\{0}\copy.bat" /f /q

EXIT
"""

软件列表 = load(f"{ThisPath}/软件包/软件列表.toml")
下载链接 = load(f"{ThisPath}/软件包/下载链接.toml")
文档列表 = listdir("离线文档包")

assert type(下载链接) is dict

for Type, Info in 软件列表.items():
    assert type(Type) is str
    assert type(Info) is dict
    AppList = Info.get("AppList")
    for AppInfo in AppList:
        Name: str = AppInfo.get("Name", "Name缺失")
        InstallType: str = AppInfo.get("InstallType", "portable")
        SetupArg: str = 静默安装参数[AppInfo.get("SetupArg", 0)]
        PathArg: str = 路径设置参数[AppInfo.get("PathArg", 0)]
        PathDownLink: str = 下载链接.get(Name, "foobar")
        PackagePath = f"{ThisPath}/软件包/{分类映射表[Type]}/{Name}"
        try:
            mkdir(f"{PackagePath}")
        except FileExistsError:
            pass

        InstallCode = ""
        if InstallType == "exe" or InstallType == "zip":
            InstallCode = ZipAndExe_Code.format(Name, SetupArg, PathArg)
        elif InstallType == "portable":
            InstallCode = P_Code.format(Name)

        with open(f"{PackagePath}/install.bat", "w", encoding="UTF8") as InstallScript:
            InstallScript.write(
                InstallScript_Template.format(Name, InstallCode, PathDownLink)
            )

for Name in 文档列表:
    PackagePath = f"{ThisPath}/离线文档包/{Name}"
    with open(f"{PackagePath}/copy.bat", "w", encoding="UTF8") as CopyScript:
        CopyScript.write(DocumentScript_Template.format(Name))
