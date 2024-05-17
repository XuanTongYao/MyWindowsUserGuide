@echo off
chcp 65001

echo "---自动下载脚本---"
echo "该脚本会下载软件安装包"
echo "部分安装包可能会报毒"
echo "不能保证下载链接内的文件绝对安全，后果自负"
echo "按任意键继续"
pause

FOR /r "软件包" %%i IN (*install.bat) DO (
    start "" /wait "%%i" foobar SysSup Y
)

