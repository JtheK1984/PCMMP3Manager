unit PCM.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxPCdxBarPopupMenu, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, Data.DB, cxDBData, Vcl.ComCtrls,
  Vcl.ToolWin, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  PCM.Functions, cxPC,
  PCM.Functions.ChangePW,
  PCM.Functions.Appinfo, dxSkinsCore, dxSkinBasic, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinOffice2019Black, dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray,
  dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringtime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxContainer, cxGroupBox, cxLocalization,
  dxNavBarCollns, cxClasses, dxNavBarBase, dxNavBar,
  PCMMP3Manager.Modul.B_Optionen,
  PCM.Benutzerverwaltung,
  PCMMP3Manager.Modul.C_MP3, dxBarBuiltInMenu, Vcl.Menus, Vcl.ExtCtrls,FireDac.Stan.Param,
  System.UITypes, dxSkinWXI;


type
  Tfrm_PCM_Main = class(TForm)
    nb_main: TdxNavBar;
    nb_Optionen: TdxNavBarGroup;
    nb_Vokabeln: TdxNavBarGroup;
    nb_Programm: TdxNavBarGroup;
    nbi_User: TdxNavBarItem;
    nbi_Vokabeldetail: TdxNavBarItem;
    nbi_Systeminfo: TdxNavBarItem;
    nb_Programminfo: TdxNavBarItem;
    nbi_Beenden: TdxNavBarItem;
    nb_mainGroup1: TdxNavBarGroup;
    nb_Passwortchange: TdxNavBarItem;
    nb_Abmelden: TdxNavBarItem;
    loc_Lang: TcxLocalizer;
    nb_mainItem1: TdxNavBarItem;
    lafCtrl_Main: TcxLookAndFeelController;
    pnl_Design: TcxGroupBox;
    pcmain: TcxPageControl;
    TrayIcon1: TTrayIcon;
    PopupMenu1: TPopupMenu;
    ppmbtn_Konfiguration: TMenuItem;
    N1: TMenuItem;
    ppmbtn_Contacts: TMenuItem;
    N2: TMenuItem;
    Systeminfo1: TMenuItem;
    Programminfo1: TMenuItem;
    N6: TMenuItem;
    Abmelden1: TMenuItem;
    Beenden1: TMenuItem;
    Benutzerverwaltung1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure nbi_BeendenClick(Sender: TObject);
    procedure nb_ProgramminfoClick(Sender: TObject);
    procedure nbi_SysteminfoClick(Sender: TObject);

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDeactivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure Abmelden;
    procedure nb_AbmeldenClick(Sender: TObject);
    procedure nb_PasswortchangeClick(Sender: TObject);
    procedure nb_mainItem1Click(Sender: TObject);
    procedure nbi_VokabeldetailClick(Sender: TObject);
    procedure ppmbtn_KonfigurationClick(Sender: TObject);
    procedure ppmbtn_ContactsClick(Sender: TObject);
    procedure Systeminfo1Click(Sender: TObject);
    procedure Programminfo1Click(Sender: TObject);
    procedure Abmelden1Click(Sender: TObject);
    procedure Beenden1Click(Sender: TObject);
    procedure nbi_UserClick(Sender: TObject);
    procedure Benutzerverwaltung1Click(Sender: TObject);

  private
    { Private-Deklarationen }
    FfrmModulBenutzer: array of Tfrm_User;
    FfrmModulConfig: array of Tfrm_config;
    FfrmModulMP3: array of Tfrm_Mp3;
    FfrmModulSysinfo: array of Tfrm_PCM_System;
    FfrmModulAppinfo: array of Tfrm_PCM_InfoApp;
//    FfrmModulChangePW: array of TfrM_PCM_ChangePW;
    procedure InitializeRights;
    procedure AddTabsheet(APageControl: TcxPAgeCOntrol; ACaption: string;ATag: Integer);
    function CheckTabExist(sTabName: String) : integer;
  public
    { Public-Deklarationen }
  end;

var
  frm_PCM_Main: Tfrm_PCM_Main;
  bAbmelden: Boolean;





implementation

{$R *.dfm}

uses  PCM.Data,
      PCM.Functions.Login;



function Tfrm_PCM_Main.CheckTabExist(sTabName: String) : integer;
var
  iCount: Integer;
begin
  Result := -1;
  for iCount := 0 to pcMain.PageCount -1 do
  begin
    if pcMain.Pages[iCount].Name = sTabName then
    begin
      Result := iCount;
      Break;
    end;
  end;
end;
procedure Tfrm_PCM_Main.Abmelden1Click(Sender: TObject);
begin
  Abmelden;
end;
procedure Tfrm_PCM_Main.AddTabsheet(APageControl: TcxPAgeControl; ACaption: string;ATag: Integer);
var
  ts_Create: TcxTabSheet;
begin
  ts_Create:= TcxTabSheet.Create(APageControl);
  ts_Create.Caption:= ACaption;
  ts_Create.Name:= 'tshModul_' + IntToStr(ATag);
  ts_Create.Tag:= ATag;
  ts_Create.PageIndex:= ATag;
  ts_Create.PageControl:= APageControl;
end;
procedure Tfrm_PCM_Main.Beenden1Click(Sender: TObject);
begin
  dm_PCM.bclose:= true;
  Application.Terminate;
end;
procedure Tfrm_PCM_Main.Benutzerverwaltung1Click(Sender: TObject);
begin
  nbi_UserClick(SELF);
  WindowState:= TWindowState.wsMaximized;
  SetForegroundWindow(frm_PCM_main.Handle);
end;

procedure Tfrm_PCM_Main.InitializeRights;
begin
  dm_PCM.InitializeRights;
  if (dm_PCM.int_mp3Right = 0) then
  begin
    nb_Vokabeln.Visible:= false;
  end;
  // Benutzervervaltung
  if (dm_PCM.int_optionenRecht = 0) then
  begin
    nb_Optionen.Visible:= false;
  end;
end;
procedure Tfrm_PCM_Main.Abmelden;
begin
  bAbmelden := True;
  Hide;
  Show;
  InitializeRights;
end;
procedure Tfrm_PCM_Main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  WriteLog(PCM_Logname,'Programm beendet',0);
  dm_PCM.bclose:= true
end;
procedure Tfrm_PCM_Main.FormDeactivate(Sender: TObject);
begin
  dm_PCM.bclose:= true
end;
procedure Tfrm_PCM_Main.FormDestroy(Sender: TObject);
begin
  dm_PCM.bclose:= true
end;
procedure Tfrm_PCM_Main.FormHide(Sender: TObject);
begin
  dm_PCM.bclose:= true
end;
procedure Tfrm_PCM_Main.FormShow(Sender: TObject);
var
  iIndex: integer;
begin
  TrayIcon1.hint:= PCM_Programmname;
  if not dm_PCM.ReadServerAdress then
  begin
    Application.Terminate;
  end
  else begin
      try
      loc_lang.LoadFromFile(GetEnvironmentVariable('LOCALAPPDATA') + '\PCM\cxLocalLang.ini');
      loc_lang.LanguageIndex := 1;
    except
      on e:Exception do
      begin
        MessageDlg('Sprachdatei kann nicht geladen werden.', mtWarning, [mbOk], 0);
      end
    end;


    if dm_PCM.bStyle then
    begin
      iIndex:= CheckTabExist('tshModul_2');
      if iIndex <> -1 then
      begin
        pcMain.ActivePageIndex:= iIndex;
        Screen.Cursor:= crDefault;
      end
      else begin
        AddTabsheet(pcMain,'Konfiguration',2);
        SetLength(FfrmModulConfig, Length(FfrmModulConfig) +1);
        FfrmModulConfig[High(FfrmModulConfig)] := Tfrm_Config.Create(Self);
        FfrmModulConfig[High(FfrmModulConfig)].BorderStyle := bsNone;
        FfrmModulConfig[High(FfrmModulConfig)].ALign:= ALCLient;
        FfrmModulConfig[High(FfrmModulConfig)].Parent :=  pcMain.Pages[pcMain.PageCount -1 ];
        FfrmModulConfig[High(FfrmModulConfig)].Show;
        pcMain.ActivePageIndex:= pcMain.PageCount -1;
      end;
    end
    else begin
      dm_PCM.bNewLiceneCheck:= false;
      dm_PCM.CheckLizenzNew;
      if dm_PCM.bNewLiceneCheck = false then
        Application.Terminate;
      if not bAbmelden then
        dm_PCM.bLogin := dm_pcm.Autologin
      else
        dm_PCM.bLogin := false;
      if not dm_PCM.bLogin then
      begin
//        Application.CreateForm(Tfrm_PCM_Functions, frm_PCM_Functions);
        Application.CreateForm(Tfrm_PCM_Login, frm_PCM_Login);
        dm_PCM.bLogin := frm_pcm_login.Login_User;
        frm_PCM_Login.Free;
//        frm_PCM_Functions.Free;
      end;
      if not dm_PCM.bLogin then
      begin
        Application.Terminate;
        exit;
      end;
      InitializeRights;
      bAbmelden:= False;
      dm_PCM.bclose:= false;
      WriteLog(PCM_Logname,'Programm gestartet',0);
      Caption:= PCM_Programmname;
      TrayIcon1.popupmenu:= PopupMenu1;
      if dm_PCM.bDemo then
        Caption:=PCM_Programmname + ' - Demolizenz gültig bis ' + DateTostr(dm_PCM.dtGueltig);
    end;
  end;
end;
procedure Tfrm_PCM_Main.nbi_BeendenClick(Sender: TObject);
begin
  dm_PCM.bclose:= true;
  Application.Terminate;
end;
procedure Tfrm_PCM_Main.nbi_SysteminfoClick(Sender: TObject);
var
  iIndex: integer;
begin
  iIndex:= CheckTabExist('tshModul_9');
  if iIndex <> -1 then
  begin
    pcMain.ActivePageIndex:= iIndex;
    Screen.Cursor:= crDefault;
  end
  else begin
    AddTabsheet(pcMain,'Systeminformation',9);
    SetLength(FfrmModulSysinfo, Length(FfrmModulSysinfo) +1);
    FfrmModulSysinfo[High(FfrmModulSysinfo)] := Tfrm_PCM_System.Create(Self);
    FfrmModulSysinfo[High(FfrmModulSysinfo)].BorderStyle := bsNone;
    FfrmModulSysinfo[High(FfrmModulSysinfo)].ALign:= ALCLient;
    FfrmModulSysinfo[High(FfrmModulSysinfo)].Parent :=  pcMain.Pages[pcMain.PageCount -1 ];
    pcMain.ActivePageIndex:= pcMain.PageCount -1;
    FfrmModulSysinfo[High(FfrmModulSysinfo)].Show;
    pcMain.ActivePage.ImageIndex:= 21;
  end;
end;
procedure Tfrm_PCM_Main.nbi_UserClick(Sender: TObject);
var
  iIndex: integer;
begin
  iIndex:= CheckTabExist('tshModul_1');
  if iIndex <> -1 then
  begin
    pcMain.ActivePageIndex:= iIndex;
    Screen.Cursor:= crDefault;
  end
  else begin
    AddTabsheet(pcMain,'Benutzerverwaltung',1);
    SetLength(FfrmModulBenutzer, Length(FfrmModulBenutzer) +1);
    FfrmModulBenutzer[High(FfrmModulBenutzer)] := Tfrm_User.Create(Self);
    FfrmModulBenutzer[High(FfrmModulBenutzer)].BorderStyle := bsNone;
    FfrmModulBenutzer[High(FfrmModulBenutzer)].ALign:= ALCLient;
    FfrmModulBenutzer[High(FfrmModulBenutzer)].Parent :=  pcMain.Pages[pcMain.PageCount -1 ];
    FfrmModulBenutzer[High(FfrmModulBenutzer)].Show;
    pcMain.ActivePageIndex:= pcMain.PageCount -1;
    pcMain.ActivePage.ImageIndex:= 1;
  end;
end;

procedure Tfrm_PCM_Main.nbi_VokabeldetailClick(Sender: TObject);
var
  iIndex: integer;
begin
  iIndex:= CheckTabExist('tshModul_3');
  if iIndex <> -1 then
  begin
    pcMain.ActivePageIndex:= iIndex;
    Screen.Cursor:= crDefault;
  end
  else begin
    AddTabsheet(pcMain,'MP3-Tag Editor',3);
    SetLength(FfrmModulMP3, Length(FfrmModulMP3) +1);
    FfrmModulMP3[High(FfrmModulMP3)] := Tfrm_mp3.Create(Self);
    FfrmModulMP3[High(FfrmModulMP3)].BorderStyle := bsNone;
    FfrmModulMP3[High(FfrmModulMP3)].ALign:= ALCLient;
    FfrmModulMP3[High(FfrmModulMP3)].Parent :=  pcMain.Pages[pcMain.PageCount -1 ];
    FfrmModulMP3[High(FfrmModulMP3)].Show;
    pcMain.ActivePageIndex:= pcMain.PageCount -1;
    pcMain.ActivePage.ImageIndex:= 86;
  end;
end;
procedure Tfrm_PCM_Main.nb_AbmeldenClick(Sender: TObject);
begin
  Abmelden;
end;
procedure Tfrm_PCM_Main.nb_mainItem1Click(Sender: TObject);
var
  iIndex: integer;
begin
  iIndex:= CheckTabExist('tshModul_2');
  if iIndex <> -1 then
  begin
    pcMain.ActivePageIndex:= iIndex;
    Screen.Cursor:= crDefault;
  end
  else begin
    AddTabsheet(pcMain,'Konfiguration',2);
    SetLength(FfrmModulConfig, Length(FfrmModulConfig) +1);
    FfrmModulConfig[High(FfrmModulConfig)] := Tfrm_Config.Create(Self);
    FfrmModulConfig[High(FfrmModulConfig)].BorderStyle := bsNone;
    FfrmModulConfig[High(FfrmModulConfig)].ALign:= ALCLient;
    FfrmModulConfig[High(FfrmModulConfig)].Parent :=  pcMain.Pages[pcMain.PageCount -1 ];
    FfrmModulConfig[High(FfrmModulConfig)].Show;
    pcMain.ActivePageIndex:= pcMain.PageCount -1;
    pcMain.ActivePage.ImageIndex:= 2;
  end;
end;
procedure Tfrm_PCM_Main.nb_PasswortchangeClick(Sender: TObject);
begin
  frM_PCM_ChangePW.ShowModal;
end;
procedure Tfrm_PCM_Main.nb_ProgramminfoClick(Sender: TObject);
var
  iIndex: integer;
begin
  iIndex:= CheckTabExist('tshModul_10');
  if iIndex <> -1 then
  begin
    pcMain.ActivePageIndex:= iIndex;
    Screen.Cursor:= crDefault;
  end
  else begin
    AddTabsheet(pcMain,'Programminfo',10);
    SetLength(FfrmModulAppinfo, Length(FfrmModulAppinfo) +1);
    FfrmModulAppinfo[High(FfrmModulAppinfo)] := Tfrm_PCM_InfoApp.Create(Self);
    FfrmModulAppinfo[High(FfrmModulAppinfo)].BorderStyle := bsNone;
    FfrmModulAppinfo[High(FfrmModulAppinfo)].ALign:= ALCLient;
    FfrmModulAppinfo[High(FfrmModulAppinfo)].Parent :=  pcMain.Pages[pcMain.PageCount -1 ];
    pcMain.ActivePageIndex:= pcMain.PageCount -1;
    FfrmModulAppinfo[High(FfrmModulAppinfo)].Show;
    pcMain.ActivePage.ImageIndex:= 7;
  end;
end;
procedure Tfrm_PCM_Main.ppmbtn_ContactsClick(Sender: TObject);
begin
  nbi_VokabeldetailClick(Self);
  WindowState:= TWindowState.wsMaximized;
  SetForegroundWindow(frm_PCM_main.Handle);
end;
procedure Tfrm_PCM_Main.ppmbtn_KonfigurationClick(Sender: TObject);
begin
  nb_mainItem1Click(SELF);
  WindowState:= TWindowState.wsMaximized;
  SetForegroundWindow(frm_PCM_main.Handle);
end;
procedure Tfrm_PCM_Main.Programminfo1Click(Sender: TObject);
begin
  nb_ProgramminfoClick(SELF);
  WindowState:= TWindowState.wsMaximized;
  SetForegroundWindow(frm_PCM_main.Handle);
end;
procedure Tfrm_PCM_Main.Systeminfo1Click(Sender: TObject);
begin
  nbi_SysteminfoClick(SELF);
  WindowState:= TWindowState.wsMaximized;
  SetForegroundWindow(frm_PCM_main.Handle);
end;

end.
