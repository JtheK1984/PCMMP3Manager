echo "Kopiere Datei ins Setupverzeichnis 32-Bit"
copy /y /v Win32\Release\PCMMP3Manager.exe "e:\Inno\Setupfiles\Programme\PCMMP3Manager"
copy /y /v Win32\Release\PCMMP3Manager.DE "e:\Inno\Setupfiles\Programme\PCMMP3Manager"
copy /y /v Win32\Release\PCMMP3Manager.EN "e:\Inno\Setupfiles\Programme\PCMMP3Manager"
echo "Kopiere Datei ins Setupverzeichnis 64-Bit"
copy /y /v Win64\Release\PCMMP3Manager.exe "e:\Inno\Setupfiles\Programme\PCMMP3Manager_x64"
copy /y /v Win64\Release\PCMMP3Manager.DE "e:\Inno\Setupfiles\Programme\PCMMP3Manager_x64"
copy /y /v Win64\Release\PCMMP3Manager.EN "e:\Inno\Setupfiles\Programme\PCMMP3Manager_x64"

echo "Kopiere Doku ins Setupverzeichnis"
copy /y /v PCMMP3Manager.docx "e:\Inno\Setupfiles\Programme\PCMMP3Manager"
copy /y /v PCMMP3Manager.pdf "e:\Inno\Setupfiles\Programme\PCMMP3Manager"
copy /y /v PCMMP3Manager.htm "e:\Inno\Setupfiles\Programme\PCMMP3Manager"

echo "Demolizenz erstellen"
call "E:\Inno\Setupfiles\Programme\PCMLizenzgenerator\PCMLizenzgenerator.exe" /PCM-MP3Manager /1.0 /E:\Inno\Setupfiles\Programme\PCMMP3Manager
