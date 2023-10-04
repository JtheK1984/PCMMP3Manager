program PCMMP3Manager;

uses
  Vcl.Forms,
  PCM.Main in 'PCM.Main.pas' {frm_PCM_Main},
  Vcl.Themes,
  Vcl.Styles,
  inifiles,
  System.SysUtils,
  PCM.Data in 'PCM.Data.pas' {dm_PCM: TDataModule},
  PCMMP3Manager.Modul.B_Optionen in 'Module\PCMMP3Manager.Modul.B_Optionen.pas' {frm_Config},
  PCMMP3Manager.Modul.C_MP3 in 'Module\PCMMP3Manager.Modul.C_MP3.pas' {frm_MP3},
  TagsLibrary in 'Helper\TagsLibrary.pas',
  Musepack in 'Helper\Musepack.pas',
  WAVPackfile in 'Helper\WAVPackfile.pas',
  WAVTagLibrary in 'Helper\WAVTagLibrary.pas',
  WMATagLibrary in 'Helper\WMATagLibrary.pas',
  OggVorbisAndOpusTagLibrary in 'Helper\OggVorbisAndOpusTagLibrary.pas',
  MP4TagLibrary in 'Helper\MP4TagLibrary.pas',
  BufferedStream in 'Helper\BufferedStream.pas',
  ID3v2Library in 'Helper\ID3v2Library.pas',
  ID3v1Library in 'Helper\ID3v1Library.pas',
  FlacTagLibrary in 'Helper\FlacTagLibrary.pas',
  APEv2Library in 'Helper\APEv2Library.pas',
  ReadMemoryStream in 'Helper\ReadMemoryStream.pas';

{$R *.res}
var
  iniFile: TIniFile;
  sStyle: String;
begin
  iniFile:=TIniFile.create(GetEnvironmentVariable('LOCALAPPDATA') + '\PCM\PCM.ini');
  sStyle:= iniFile.ReadString('PCMMP3Manager','Style','Windows');
  iniFile.Free;
  Application.Initialize;
  TStyleManager.TrySetStyle(sStyle);
  {$IFDEF WIN64}
  Application.Title:= 'PCM - MP3 Manager 64-Bit';
  {$else}
  Application.Title:= 'PCM - MP3 Manager 32-Bit';
  {$ENDIF}
  Application.MainFormOnTaskbar := true;
  Application.CreateForm(Tdm_PCM,dm_PCM);
  Application.CreateForm(Tfrm_PCM_Main, frm_PCM_Main);
//  Application.CreateForm(Tfrm_PCM_Functions, frm_PCM_Functions);
//  Application.CreateForm(Tfrm_PCM_Lizenz, frm_PCM_Lizenz);

  Application.Run;
end.
