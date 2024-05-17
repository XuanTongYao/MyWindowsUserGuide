@echo off
chcp 65001

SET Drive=%1
IF "%1"=="" (
    echo "---自动复制文档脚本---"
    echo "该脚本会自动复制文档到X:\STUDY\Document目录下"
    echo "X为你选中的盘符"
    echo "请确保文件夹内无重要文件,否则后果自负"
    SET /P Drive="请输入盘符"
)
IF NOT EXIST %Drive%: (
    echo "所选盘符不存在"
    pause
    EXIT
)

FOR /r "离线文档包" %%i IN (*copy.bat) DO (
    start "" /wait "%%i" %Drive%
)

echo "离线文档复制完成"
pause
EXIT