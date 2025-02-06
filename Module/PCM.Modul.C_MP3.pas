unit PCM.Modul.C_MP3;

interface

uses
  {$Region Uses}
  {$IFDEF WIN64}
    {$I Skins.inc}
    dxSkinsForm, dxSkinsdxBarPainter, dxSkinscxPCPainter,
  {$ELSE}
    {$I Skins.inc}
    dxSkinsForm, dxSkinsdxBarPainter, dxSkinscxPCPainter,
  {$ENDIF}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxBarBuiltInMenu, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, Vcl.Menus, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, dxBar, cxClasses, System.ImageList,
  Vcl.ImgList, cxImageList, cxMaskEdit, cxDropDownEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxGrid, Vcl.StdCtrls, cxRadioGroup, cxCheckBox, cxTextEdit, cxLabel,
  cxButtons, dxGDIPlusClasses, cxImage, cxGroupBox, cxPC,inifiles, Vcl.Themes,system.UITypes,
  cxMemo, cxProgressBar, cxDBEdit, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,Vcl.FileCtrl,TagsLibrary;
  {$EndRegion Uses}
type
  {$Region Type}
  Tfrm_MP3 = class(TForm)
    brdckCtrl_mp3: TdxBarDockControl;
    brmgr_main: TdxBarManager;
    btn_Cancel: TdxBarLargeButton;
    btn_Convert: TcxButton;
    btn_Save: TdxBarLargeButton;
    chkbx_Album: TcxDBCheckBox;
    chkbx_Albumartist: TcxDBCheckBox;
    chkbx_Artist: TcxDBCheckBox;
    chkbx_Composer: TcxDBCheckBox;
    chkbx_Genre: TcxDBCheckBox;
    chkbx_Title: TcxDBCheckBox;
    chkbx_Year: TcxDBCheckBox;
    ds_MP3: TDataSource;
    grpbx_Mp3: TcxGroupBox;
    grpbx_Mp3Status: TcxGroupBox;
    grpbx_right: TcxGroupBox;
    mem_mp3: TcxMemo;
    pc_main: TcxPageControl;
    qry_mp3: TFDQuery;
    tb_Main: TdxBar;
    ts_mp3: TcxTabSheet;
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_ConvertClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SetButtonsEnabledVisible(DataSet: TDataSet);
  private
    { Private-Deklarationen }
    Procedure Setbuttons;
  public
    { Public-Deklarationen }
    Tags: TTags;
  end;
  {$EndRegion Type}
var
  frm_MP3: Tfrm_MP3;

implementation

{$R *.dfm}

uses  PCM.Main,
      PCM.Data,
      PCM.Functions.Synch.Wait,
      PCM.Strings;

////////////////////////////////////////////////////////////////////////////////
// Hilfsfunktionen                                                            //
////////////////////////////////////////////////////////////////////////////////
{$Region Helperfunctions}
procedure Tfrm_MP3.SetButtons;
begin
  if dm_PCM.imp3 >= 2 then
  begin
    // MP3
    btn_Save.Enabled := qry_mp3.State in [dsInsert, dsEdit];
    btn_Cancel.Enabled := qry_mp3.State in [dsInsert, dsEdit];
  end;
end;
procedure Tfrm_MP3.SetButtonsEnabledVisible(DataSet: TDataSet);
begin
  Setbuttons;
end;
{$EndRegion Helperfunctions}
////////////////////////////////////////////////////////////////////////////////
// Buttons                                                                    //
////////////////////////////////////////////////////////////////////////////////
{$Region Buttonfunctions}
procedure Tfrm_MP3.btn_CancelClick(Sender: TObject);
begin
  qry_mp3.Cancel;
end;
procedure Tfrm_MP3.btn_ConvertClick(Sender: TObject);
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
  if SelectDirectory(rs_PCMMP3Manger_MP3Verzeichnis, '' ,sPfadMP3) then
  begin
    mem_mp3.Clear;
    bFileTrue:=(FindFirst(sPfadMP3+'\' + lowercase('*.mp3'),faAnyFile,datei)=0);
    sFilelist := TStringList.Create;
    try
      GetFilesInDirectory(sPfadMP3,lowercase('*.mp3'),sFilelist,true);
    finally
      iFileCount:= sFilelist.Count;
      FreeAndnIl(sFilelist);
    end;

    Application.ProcessMessages;
    ShowWaitForm(TForm(Self), PWideChar(rs_PCMMP3Manger_MP3Tags), iFileCount,ClientWidth, Height);
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
        mem_mp3.lines.Add(rs_PCMMP3Manger_MP3DateiHinweis1 + datei.name + rs_PCMMP3Manger_MP3DateiHinweis2);
      except
        mem_mp3.lines.Add(rs_PCMMP3Manger_MP3DateiFehler1 + datei.name + rs_PCMMP3Manger_MP3DateiFehler2);
      end;
      sPFad:= sPfadMP3+'\'+datei.name;

      Tags.Clear;
      if not chkbx_Artist.Checked then
        Tags.SetTag('ARTIST', sInterPret);

      if not chkbx_Title.Checked then
        Tags.SetTag('TITLE', sTitel);

      if not chkbx_Album.Checked then
        Tags.SetTag('ALBUM', 'unbekanntes Album');

      if not chkbx_Albumartist.Checked then
        Tags.SetTag('ALBUMARTIST', sInterPret);

      if not chkbx_Composer.Checked then
        Tags.SetTag('COMPOSER', sInterPret);

      if not chkbx_Year.Checked then
        Tags.SetTag('YEAR', '');

      if not chkbx_Genre.Checked then
        Tags.SetTag('GENRE', 'other');

      Error := Tags.SaveToFile(sPFad);
      if Error <> TAGSLIBRARY_SUCCESS then begin
        mem_mp3.lines.Add(rs_PCMMP3Manger_MP3DateiFehler1 + datei.name + rs_PCMMP3Manger_MP3DateiFehler3 + TagsLibraryErrorCode2String(Error));
      end;
      sl.Clear;
      sl.Free;
      Tags.Free;
      bFileTrue := (FindNext(datei)=0);
      Application.ProcessMessages;
    end;
    CloseWaitForm;
    FindClose(datei);
    MessageDlg(rs_PCMMP3Manger_MP3DateiEdit1 + inttostr(iFileCount) + rs_PCMMP3Manger_MP3DateiEdit2,mtInformation,[mbok],0);
  end;
end;
procedure Tfrm_MP3.btn_SaveClick(Sender: TObject);
begin
  if qry_mp3.State in [dsInsert, dsEdit] then
  begin
    qry_mp3.Post;
  end;
end;
{$EndRegion Buttonfunctions}
////////////////////////////////////////////////////////////////////////////////
// Formfunktionen                                                             //
////////////////////////////////////////////////////////////////////////////////
{$Region Formfunktionen}
procedure Tfrm_MP3.FormActivate(Sender: TObject);
begin
  FormShow(Self);
end;
procedure Tfrm_MP3.FormShow(Sender: TObject);
  Procedure OPendata;
  begin
    qry_mp3.Open;
  end;
  procedure InitializeRights;
  begin
    // MP3 Tags
    if (dm_PCM.imp3 = 1) then
    begin
      chkbx_Artist.Enabled:= false;
      chkbx_Title.Enabled:= false;
      chkbx_Albumartist.Enabled:= false;
      chkbx_Composer.Enabled:= false;
      chkbx_Year.Enabled:= false;
      chkbx_Album.Enabled:= false;
      chkbx_Genre.Enabled:= false;
    end;
    // MP3 Tags
    if (dm_PCM.imp3 >= 2) then
    begin
      chkbx_Artist.Enabled:= true;
      chkbx_Title.Enabled:= true;
      chkbx_Albumartist.Enabled:= true;
      chkbx_Composer.Enabled:= true;
      chkbx_Year.Enabled:= true;
      chkbx_Album.Enabled:= true;
      chkbx_Genre.Enabled:= true;
    end;
  end;
begin
  OPendata;
  InitializeRights;
  Setbuttons;
end;
{$EndRegion Formfunktionen}
end.

