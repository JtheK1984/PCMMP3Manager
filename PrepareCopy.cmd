echo "Kopiere Datei ins Setupverzeichnis"
copy /y /v Win32\Release\PCMMp3Manager.exe "e:\Inno\Setupfiles\Programme\PCMMp3Manager"
copy /y /v Win64\Release\PCMMp3Manager.exe "e:\Inno\Setupfiles\Programme\PCMMp3Manager_x64"

copy /y /v Win64\Release\PCMMp3Manager.DE "e:\Inno\Setupfiles\Programme\PCMMp3Manager_x64"
copy /y /v Win64\Release\PCMMp3Manager.EN "e:\Inno\Setupfiles\Programme\PCMMp3Manager_x64"

copy /y /v "PCMMp3Manager.docx" "e:\Inno\Setupfiles\Programme\PCMMp3Manager"
copy /y /v "PCMMp3Manager.pdf" "e:\Inno\Setupfiles\Programme\PCMMp3Manager"
copy /y /v "PCMMp3Manager.htm" "e:\Inno\Setupfiles\Programme\PCMMp3Manager"

echo "Demolizenz erstellen"
call "E:\Inno\Setupfiles\Programme\PCMLizenzgenerator\PCMLizenzgenerator.exe" /PCM-Mp3Manager /1.6 /E:\Inno\Setupfiles\Programme\PCMMp3Manager
