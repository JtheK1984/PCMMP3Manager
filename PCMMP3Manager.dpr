program PCMMP3Manager;

uses
  inifiles,
  NtTranslator,
  System.SysUtils,
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  uwvLoader,
  PCM.Helper,
  Windows,
  PCM.Main in 'PCM.Main.pas' {frm_PCM_Main},
  PCM.Data in 'PCM.Data.pas' {dm_PCM: TDataModule},
  PCM.Modul.C_MP3 in 'Module\PCM.Modul.C_MP3.pas' {frm_MP3},
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
  ReadMemoryStream in 'Helper\ReadMemoryStream.pas',
  PCM.splash in 'PCM.splash.pas' {SplashScreen},
  PCMMP3Manager.dxSettings in 'PCMMP3Manager.dxSettings.pas',
  PCM.Mp3Manager.Strings in 'Module\PCM.Mp3Manager.Strings.pas';

{$R *.res}

{$IFDEF WIN64}
  {$R 'Versioninfo64.res'}
{$else}
  {$R 'Versioninfo32.res'}
{$ENDIF}

{$SetPEOptFlags IMAGE_DLLCHARACTERISTICS_TERMINAL_SERVER_AWARE}
{$SetPEFlags IMAGE_FILE_REMOVABLE_RUN_FROM_SWAP or IMAGE_FILE_NET_RUN_FROM_SWAP or IMAGE_FILE_LARGE_ADDRESS_AWARE}

var
  {$Region var}
  ifini: TIniFile;
  
  slocale: String;
  {$EndRegion var}
begin
  {$Region Begin}
  Checkinis;
  ifini:=TIniFile.create(GetEnvironmentVariable('LOCALAPPDATA') + '\PCM\PCM.ini');
  slocale:=ifini.ReadString('PCMMP3Manager','Language','de');
  ifini.Free;
  GlobalWebView2Loader                := TWVLoader.Create(nil);
  GlobalWebView2Loader.UserDataFolder := GetEnvironmentVariable('LOCALAPPDATA') + '\PCM\CustomCache';
  GlobalWebView2Loader.StartWebView2;
  Application.Initialize;
  {$IFDEF WIN64}
  Application.Title:= 'PCM - MP3Manager 64-Bit';
  {$else}
  Application.Title:= 'PCM - MP3Manager 32-Bit';
  {$ENDIF}
  TNtTranslator.SetNew(slocale,[],'de');
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tdm_PCM, dm_PCM);
  Application.CreateForm(Tfrm_PCM_Main, frm_PCM_Main);
  Application.Run;
  {$EndRegion Begin}
end.
