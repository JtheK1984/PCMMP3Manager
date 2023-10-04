echo "Kopiere Datei ins Setupverzeichnis"
copy /y /v Win32\Release\PCMMp3Manager.exe "e:\Inno\Setupfiles\Programme\PCMMp3Manager"
copy /y /v Win32\Release\PCMMp3Manager.exe "e:\Inno\Setupfiles\Programme\PCMMp3Manager_x64"

echo "Demolizenz erstellen"
call "E:\Inno\Setupfiles\Programme\PCMLizenzgenerator\PCMLizenzgenerator.exe" /PCM-Mp3Manager /1.6 /E:\Inno\Setupfiles\Programme\PCMMp3Manager
