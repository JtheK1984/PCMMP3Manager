call "C:\Program Files (x86)\Embarcadero\Studio\23.0\bin\rsvars.bat"
echo "Build erstellen"
msbuild E:/Projekte/Windows/PCMMP3Manager/PCMMP3Manager.dproj /t:Clean;Build;Localize;CompressWin32 /p:config=Release /p:platform=Win32
msbuild E:/Projekte/Windows/PCMMP3Manager/PCMMP3Manager.dproj /t:Clean;Build;Localize;CompressWin64 /p:config=Release /p:platform=Win64

echo "Kopiere Datei ins Setupverzeichnis 32-Bit"
copy /y /v E:\Projekte\Windows\PCMMP3Manager\Win32\Release\PCMMP3Manager.exe "e:\Inno\Setupfiles\Programme\PCMMP3Manager"
copy /y /v E:\Projekte\Windows\PCMMP3Manager\Win32\Release\PCMMP3Manager.DE "e:\Inno\Setupfiles\Programme\PCMMP3Manager"
copy /y /v E:\Projekte\Windows\PCMMP3Manager\Win32\Release\PCMMP3Manager.EN "e:\Inno\Setupfiles\Programme\PCMMP3Manager"

echo "Kopiere Datei ins Setupverzeichnis 64-Bit"
copy /y /v E:\Projekte\Windows\PCMMP3Manager\Win64\Release\PCMMP3Manager.exe "e:\Inno\Setupfiles\Programme\PCMMP3Manager_x64"
copy /y /v E:\Projekte\Windows\PCMMP3Manager\Win64\Release\PCMMP3Manager.DE "e:\Inno\Setupfiles\Programme\PCMMP3Manager_x64"
copy /y /v E:\Projekte\Windows\PCMMP3Manager\Win64\Release\PCMMP3Manager.EN "e:\Inno\Setupfiles\Programme\PCMMP3Manager_x64"

echo "Kopiere Doku ins Setupverzeichnis"
copy /y /v E:\Projekte\Windows\PCMMP3Manager\PCMMP3Manager.docx "e:\Inno\Setupfiles\Programme\PCMMP3Manager"
copy /y /v E:\Projekte\Windows\PCMMP3Manager\PCMMP3Manager.pdf "e:\Inno\Setupfiles\Programme\PCMMP3Manager"
copy /y /v E:\Projekte\Windows\PCMMP3Manager\PCMMP3Manager.htm "e:\Inno\Setupfiles\Programme\PCMMP3Manager"

echo "Demolizenz erstellen"
call "E:\Inno\Setupfiles\Programme\PCMLizenzgenerator\PCMLizenzgenerator.exe" /PCM-MP3Manager /1.0 /E:\Inno\Setupfiles\Programme\PCMMP3Manager_x64
