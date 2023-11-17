unit PCMMP3Manager.Modul.C_MP3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxBarBuiltInMenu, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBasic,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinOffice2019Black, dxSkinOffice2019Colorful,
  dxSkinOffice2019DarkGray, dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringtime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinTheBezier, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxContainer, cxEdit, Vcl.Menus, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, dxBar, cxClasses, System.ImageList,
  Vcl.ImgList, cxImageList, cxMaskEdit, cxDropDownEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxGrid, Vcl.StdCtrls, cxRadioGroup, cxCheckBox, cxTextEdit, cxLabel,
  cxButtons, dxGDIPlusClasses, cxImage, cxGroupBox, cxPC,inifiles, Vcl.Themes,system.UITypes,
  cxMemo, cxProgressBar, cxDBEdit, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,Vcl.FileCtrl,TagsLibrary, dxSkinWXI;

type
  Tfrm_MP3 = class(TForm)
    pnl_right: TcxGroupBox;
    cxPageControl2: TcxPageControl;
    cxTabSheet2: TcxTabSheet;
    cxGroupBox12: TcxGroupBox;
    cbx_Album: TcxDBCheckBox;
    cbx_Albumartist: TcxDBCheckBox;
    cbx_Artist: TcxDBCheckBox;
    cbx_Composer: TcxDBCheckBox;
    cbx_Genre: TcxDBCheckBox;
    cbx_Title: TcxDBCheckBox;
    cbx_Year: TcxDBCheckBox;
    cxGroupBox13: TcxGroupBox;
    Button1: TcxButton;
    Memomp3: TcxMemo;
    qmp3: TFDQuery;
    dsMP3: TDataSource;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    btn_Save: TdxBarLargeButton;
    btn_Cancel: TdxBarLargeButton;
    dxBarDockControl1: TdxBarDockControl;
    procedure SetButtonsEnabledVisible(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private-Deklarationen }
    Procedure OPendata;
    Procedure InitializeRights;
    Procedure Setbuttons;
  public
    { Public-Deklarationen }
    Tags: TTags;
  end;

var
  frm_MP3: Tfrm_MP3;

implementation

{$R *.dfm}

uses  PCM.Main,
      PCM.Data,
      PCM.Functions.Synch.Wait;

Procedure Tfrm_MP3.OPendata;
begin
  qmp3.Open;
end;
procedure Tfrm_MP3.InitializeRights;
begin
  // MP3 Tags
  if (dm_PCM.int_mp3Right = 1) then
  begin
    cbx_Artist.Enabled:= false;
    cbx_Title.Enabled:= false;
    cbx_Albumartist.Enabled:= false;
    cbx_Composer.Enabled:= false;
    cbx_Year.Enabled:= false;
    cbx_Album.Enabled:= false;
    cbx_Genre.Enabled:= false;
  end;
  // MP3 Tags
  if (dm_PCM.int_mp3Right >= 2) then
  begin
    cbx_Artist.Enabled:= true;
    cbx_Title.Enabled:= true;
    cbx_Albumartist.Enabled:= true;
    cbx_Composer.Enabled:= true;
    cbx_Year.Enabled:= true;
    cbx_Album.Enabled:= true;
    cbx_Genre.Enabled:= true;
  end;
end;
procedure Tfrm_MP3.SetButtons;
begin
  if dm_PCM.int_mp3Right >= 2 then
  begin
    // MP3
    btn_Save.Enabled := qmp3.State in [dsInsert, dsEdit];
    btn_Cancel.Enabled := qmp3.State in [dsInsert, dsEdit];
  end;

end;
procedure Tfrm_MP3.btn_SaveClick(Sender: TObject);
begin
  if qmp3.State in [dsInsert, dsEdit] then
  begin
    qmp3.Post;
  end;
end;
procedure Tfrm_MP3.SetButtonsEnabledVisible(DataSet: TDataSet);
begin
  Setbuttons;
end;
procedure Tfrm_MP3.Button1Click(Sender: TObject);
  procedure GetFilesInDirectory(ADirectory: string; AMask: String; AList: TStrings; ARekursiv: Boolean);
  var
    SR: TSearchRec;
  begin
    if (ADirectory<>'') and (ADirectory[length(ADirectory)]<>'\') then
      ADirectory:=ADirectory+'\';

    if (FindFirst(ADirectory+AMask,faAnyFile-faDirectory,SR)=0) then begin
        repeat
        if (SR.Name<>'.') and (SR.Name<>'..') and (SR.Attr<>faDirectory) then
            AList.Add(ADirectory+SR.Name)
        until FindNext(SR)<>0;
      FindClose(SR);
    end;

    if ARekursiv then
      if (FindFirst(ADirectory+'*.mp3',faDirectory,SR)=0) then
        begin
        repeat
          if (SR.Name<>'.') and (SR.Name<>'..') then
              GetFilesInDirectory(ADirectory+SR.Name,AMask,AList,True);
        until FindNext(SR)<>0;
        FindClose(SR);
      end;
  end;


var
  sl: TStrings;
  error: integer;
  sPFad: string;
  iFileCount: integer;
  sPfadMP3: string;
  datei : tSearchRec;
  sFilelist: Tstringlist;
  bFileTrue : Boolean;
  sFilename,sInterpret,sTitel: string;
begin
  if SelectDirectory('MP3 Verzeichnis auswählen', '' ,sPfadMP3) then
  begin
    Memomp3.Clear;
    bFileTrue:=(FindFirst(sPfadMP3+'\' + lowercase('*.mp3'),faAnyFile,datei)=0);
    sFilelist := TStringList.Create;
    try
      GetFilesInDirectory(sPfadMP3,lowercase('*.mp3'),sFilelist,true);
    finally
      iFileCount:= sFilelist.Count;
      FreeAndnIl(sFilelist);
    end;

    Application.ProcessMessages;
    ShowWaitForm(TForm(Self), PWideChar('Kontakte importieren'), iFileCount,ClientWidth, Height);
    while bFileTrue do
    begin
      WaitFormStep;
      Tags:= TTags.Create;
      sl:= TStringList.Create;
      sl.delimiter := ';';
      sFilename := StringReplace(datei.name,' - ',';',[rfReplaceAll,rfIgnoreCase]);
      sFilename := StringReplace(sFilename,' ','..',[rfReplaceAll,rfIgnoreCase]);
      sl.DelimitedText := sFilename;
      sInterpret := StringReplace(sl.Strings[0],'..',' ',[rfReplaceAll,rfIgnoreCase]);
      try
        sTitel := StringReplace(sl.Strings[1],'..',' ',[rfReplaceAll,rfIgnoreCase]);
        sTitel := StringReplace(sTitel,'.mp3','',[rfReplaceAll,rfIgnoreCase]);
        Memomp3.lines.Add('Hinweis:  Datei ' + datei.name + ' wird geändert');
      except
        Memomp3.lines.Add('Fehler:  Datei ' + datei.name + ' kann nicht geändert werden. Grund: Falsche Konvention');
      end;
      sPFad:= sPfadMP3+'\'+datei.name;

      Tags.Clear;
      if not cbx_Artist.Checked then
        Tags.SetTag('ARTIST', sInterPret);

      if not cbx_Title.Checked then
        Tags.SetTag('TITLE', sTitel);

      if not cbx_Album.Checked then
        Tags.SetTag('ALBUM', 'unbekanntes Album');

      if not cbx_Albumartist.Checked then
        Tags.SetTag('ALBUMARTIST', sInterPret);

      if not cbx_Composer.Checked then
        Tags.SetTag('COMPOSER', sInterPret);

      if not cbx_Year.Checked then
        Tags.SetTag('YEAR', '');

      if not cbx_Genre.Checked then
        Tags.SetTag('GENRE', 'other');

      Error := Tags.SaveToFile(sPFad);
      if Error <> TAGSLIBRARY_SUCCESS then begin
        Memomp3.lines.Add('Fehler:  Datei ' + datei.name + ' kann nicht geändert werden. Grund: '+ TagsLibraryErrorCode2String(Error));
      end;
      sl.Clear;
      sl.Free;
      Tags.Free;
      bFileTrue := (FindNext(datei)=0);
      Application.ProcessMessages;
    end;
    CloseWaitForm;
    FindClose(datei);
    ShowMessage('Es wurden ' + inttostr(iFileCount) + ' Dateien editiert');
  end;
end;
procedure Tfrm_MP3.FormShow(Sender: TObject);
begin
  OPendata;
  InitializeRights;
  Setbuttons;
end;

procedure Tfrm_MP3.btn_CancelClick(Sender: TObject);
begin
  qMp3.Cancel;
end;

end.

