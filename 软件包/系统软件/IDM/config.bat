@echo off
chcp 65001
setlocal EnableDelayedExpansion

SET Drive=%1
cd %~dp0
echo "正在配置IDM"

@REM 转换大写
for %%i in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)  do call set Drive=%%Drive:%%i=%%i%%

echo "启动IDM初始化后请从任务栏退出IDM"
"%Drive%:\ProgramFiles\SysSup\IDM\IDMan.exe"

Config.reg

reg add HKEY_CURRENT_USER\Software\DownloadManager /v LocalPathW /t REG_NONE /d "%Drive%:\DOWNLOAD\常规" /f
reg add HKEY_CURRENT_USER\Software\DownloadManager\FoldersTree\压缩包 /v pathW /t REG_NONE /d "%Drive%:\DOWNLOAD\压缩包" /f
reg add HKEY_CURRENT_USER\Software\DownloadManager\FoldersTree\可执行文件 /v pathW /t REG_NONE /d "%Drive%:\DOWNLOAD\可执行文件" /f
reg add HKEY_CURRENT_USER\Software\DownloadManager\FoldersTree\图片 /v pathW /t REG_NONE /d "%Drive%:\DOWNLOAD\图片" /f
reg add HKEY_CURRENT_USER\Software\DownloadManager\FoldersTree\文档 /v pathW /t REG_NONE /d "%Drive%:\DOWNLOAD\文档" /f
reg add HKEY_CURRENT_USER\Software\DownloadManager\FoldersTree\视频 /v pathW /t REG_NONE /d "%Drive%:\DOWNLOAD\视频" /f
reg add HKEY_CURRENT_USER\Software\DownloadManager\FoldersTree\镜像 /v pathW /t REG_NONE /d "%Drive%:\DOWNLOAD\镜像" /f
reg add HKEY_CURRENT_USER\Software\DownloadManager\FoldersTree\音频 /v pathW /t REG_NONE /d "%Drive%:\DOWNLOAD\音频" /f

reg delete HKEY_CURRENT_USER\Software\DownloadManager\FoldersTree\Compressed /f
reg delete HKEY_CURRENT_USER\Software\DownloadManager\FoldersTree\Documents /f
reg delete HKEY_CURRENT_USER\Software\DownloadManager\FoldersTree\Music /f
reg delete HKEY_CURRENT_USER\Software\DownloadManager\FoldersTree\Programs /f
reg delete HKEY_CURRENT_USER\Software\DownloadManager\FoldersTree\Video /f

EXIT