@echo OFF
 :begin
 REM 删除前端文件及文件夹
 DEL /f /s /q ".\node_modules\*.*"
 RD /s /q ".\node_modules"
 REM 删除前端IDE缓存文件夹
 FOR /d /r ".\" %%b in (.idea,.vscode,.arts,dist) do rd /s /q "%%b"
 ECHO 【处理完毕，按任意键退出】
 PAUSE>NUL
 EXIT
 GOTO BEGIN