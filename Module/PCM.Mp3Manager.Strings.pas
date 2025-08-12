unit PCM.Mp3Manager.Strings;

interface

uses
  {$Region uses}
  Classes,
  SysUtils,
  Windows;
  {$EndRegion uses}
// allgemein
resourcestring
  rs_general_BTN_Ok = '&Ok';
  rs_general_BTN_Cancel = '&Abbrechen';
  rs_general_BTN_Yes = '&Ja';
  rs_general_BTN_No = '&Nein';
  rs_general_Save = 'Speichern';
  rs_general_Bezeichnung = 'Bezeichnung:';
  rs_general_Suche = 'Suche';
  rs_General_Formload = 'Formular wird geladen';  // neue Unit
  rs_General_Ende = 'Das Programm wird beendet.';
  rs_PCM_ChooseModul = 'Bitte Modul wählen'; // neue Unit
  rs_PCM_Modulliste_verstecken = 'Modulliste verstecken';
  rs_PCM_Modulliste_anzeigen = 'Modulliste anzeigen';
  rs_PCM_Benutzerverwaltung ='Benutzerverwaltung';  // neue Unit
  rs_PCM_Konfiguration = 'Konfiguration'; // neue Unit
  rs_PCM_Design = 'Design'; // neue Unit
  rs_PCM_Systeminformation = 'Systeminformation'; // neue Unit
  rs_PCM_Programminfo = 'Programminfo'; // neue Unit
  rs_PCM_Handbuch = 'Handbuch';                      // neue Unit
  rs_PCM_Start = 'Programm gestartet'; // neue Unit
  rs_PCM_Beenden = 'Programm beendet'; // neue Unit
  rs_PCMMediacenter_Musikplayer = 'Musikplayer';
  rs_PCMMediacenter_Webradio = 'Webradio';
  rs_PCMMediacenter_Videoplayer = 'Videoplayer';
  rs_PCMMediacenter_Fotos = 'Fotos';
  rs_PCMMP3Manger_MP3Verzeichnis = 'MP3-Verzeichnis auswählen';
  rs_PCMMP3Manger_MP3Tags = 'MP3-Tags bearbeiten';
  rs_PCMMP3Manger_MP3DateiHinweis1 = 'Hinweis:  Datei ';
  rs_PCMMP3Manger_MP3DateiHinweis2 = ' wird geändert';
  rs_PCMMP3Manger_MP3DateiFehler1 = 'Fehler:  Datei ';
  rs_PCMMP3Manger_MP3DateiFehler2 = ' kann nicht geändert werden. Grund: Falsche Konvention';
  rs_PCMMP3Manger_MP3DateiFehler3 = ' kann nicht geändert werden. Grund: ';
  rs_PCMMP3Manger_MP3DateiEdit1 = 'Es wurden ';
  rs_PCMMP3Manger_MP3DateiEdit2 = ' Dateien editiert';
type
  {$Region type}
  TResourceStringID = Pointer;

  TResOriginalStrings = class(TStringList)
  public
    constructor Create;
  end;
  {$EndRegion type}
var
  {$Region var}
  FResOriginalStrings: TResOriginalStrings = nil;
  FResStrings: TStringList = nil;
  FUseResCache: Boolean = true;
  {$EndRegion var}
Const
  {$Region const}
  SetNone = 0;
  SetRead = 1;
  SetReadWrite = 2;
  SetComplete = 3;
  {$EndRegion const}
// Deklarationen
{$Region Deklarationen}
procedure initNewLanguage(locale: LCID);
procedure CreateResStringLists;
procedure DestroyResStringLists;
procedure ClearResourceStrings;
function GetResourceString(AResString: TResourceStringID): string;
{$EndRegion Deklarationen}
implementation
// Deklarationen
{$Region Prozeduren}
constructor TResOriginalStrings.Create;
begin
  inherited Create;
  CaseSensitive := True;
end;
procedure ClearResourceStrings;
begin
  if FResStrings <> nil then
    FResStrings.Clear;
  if FResOriginalStrings <> nil then
    FResOriginalStrings.Clear;
end;
procedure CreateResStringLists;
begin
  FResOriginalStrings := TResOriginalStrings.Create;
  FResStrings := TStringList.Create;
end;
procedure DestroyResStringLists;
begin
  FreeAndNil(FResOriginalStrings);
  FreeAndNil(FResStrings);
end;
function GetResOriginalStringIndex(AResString: TResourceStringID): Integer;
begin
  Result := FResOriginalStrings.IndexOfObject(TObject(AResString));
end;
procedure SetResourceString(AResString: TResourceStringID; const Value: string);
var
  AIndex: Integer;
begin
  AIndex := GetResOriginalStringIndex(AResString);
  if AIndex <> -1 then
    FResStrings[AIndex] := Value
  else
  begin
    FResOriginalStrings.AddObject(LoadResString(AResString), TObject(AResString));
    FResStrings.Add(Value);
  end;
end;
function GetResourceString(AResString: TResourceStringID): string;
var
  AIndex: Integer;
begin
  if FUseResCache then
  begin
    AIndex := GetResOriginalStringIndex(AResString);
    if AIndex <> -1 then
    begin
      Result := FResStrings[AIndex]
    end
    else
    begin
      Result := LoadResString(AResString);
      SetResourceString(AResString, Result);
    end;
  end
  else
    Result := LoadResString(AResString);
end;
procedure initNewLanguage(locale: LCID);
begin
  ClearResourceStrings;
end;
{$EndRegion Prozeduren}
initialization
  CreateResStringLists;
finalization
  DestroyResStringLists;
end.
