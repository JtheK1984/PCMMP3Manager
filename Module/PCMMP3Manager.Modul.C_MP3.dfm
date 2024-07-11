object frm_MP3: Tfrm_MP3
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frm_MP3'
  ClientHeight = 922
  ClientWidth = 1195
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 13
  object pnl_right: TcxGroupBox
    Left = 0
    Top = 0
    Align = alClient
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    TabOrder = 0
    Height = 922
    Width = 1195
    object cxPageControl2: TcxPageControl
      Left = 2
      Top = 2
      Width = 1191
      Height = 918
      Align = alClient
      TabOrder = 0
      Properties.ActivePage = cxTabSheet2
      Properties.CustomButtons.Buttons = <>
      Properties.Images = dm_PCM.imglst_16x16
      Properties.TabSlants.Kind = skCutCorner
      Properties.TabWidth = 150
      ClientRectBottom = 918
      ClientRectRight = 1191
      ClientRectTop = 25
      object cxTabSheet2: TcxTabSheet
        Caption = 'automatische MP3-Tags'
        ImageIndex = 86
        object cxGroupBox12: TcxGroupBox
          Left = 0
          Top = 58
          Align = alTop
          Caption = 'Einstellungen'
          Style.BorderStyle = ebsFlat
          TabOrder = 0
          Height = 82
          Width = 1191
          object cbx_Album: TcxDBCheckBox
            Left = 615
            Top = 22
            Caption = 'Album nicht '#252'berschreiben'
            DataBinding.DataField = 'Album'
            DataBinding.DataSource = dsMP3
            ParentBackground = False
            ParentColor = False
            Properties.OnChange = btn_SaveClick
            Style.Color = clWindowFrame
            Style.TransparentBorder = False
            TabOrder = 3
            Transparent = True
          end
          object cbx_Albumartist: TcxDBCheckBox
            Left = 215
            Top = 22
            Caption = 'Albuminterpret nicht '#252'berschreiben'
            DataBinding.DataField = 'Albuminterpret'
            DataBinding.DataSource = dsMP3
            ParentBackground = False
            ParentColor = False
            Style.Color = clWindowFrame
            Style.TransparentBorder = False
            TabOrder = 1
            Transparent = True
          end
          object cbx_Artist: TcxDBCheckBox
            Left = 8
            Top = 22
            Caption = 'Interpret nicht '#252'berschreiben'
            DataBinding.DataField = 'Interpret'
            DataBinding.DataSource = dsMP3
            ParentBackground = False
            ParentColor = False
            Style.Color = clWindowFrame
            Style.TransparentBorder = False
            TabOrder = 0
            Transparent = True
          end
          object cbx_Composer: TcxDBCheckBox
            Left = 215
            Top = 47
            Caption = 'Komponist nicht '#252'berschreiben'
            DataBinding.DataField = 'Komponist'
            DataBinding.DataSource = dsMP3
            ParentBackground = False
            ParentColor = False
            Style.Color = clWindowFrame
            Style.TransparentBorder = False
            TabOrder = 6
            Transparent = True
          end
          object cbx_Genre: TcxDBCheckBox
            Left = 792
            Top = 22
            Caption = 'Genre nicht '#252'berschreiben'
            DataBinding.DataField = 'Genre'
            DataBinding.DataSource = dsMP3
            ParentBackground = False
            ParentColor = False
            Style.Color = clWindowFrame
            Style.TransparentBorder = False
            TabOrder = 4
            Transparent = True
          end
          object cbx_Title: TcxDBCheckBox
            Left = 8
            Top = 47
            Caption = 'Titel nicht '#252'berschreiben'
            DataBinding.DataField = 'Titel'
            DataBinding.DataSource = dsMP3
            ParentBackground = False
            ParentColor = False
            Style.Color = clWindowFrame
            Style.TransparentBorder = False
            TabOrder = 5
            Transparent = True
          end
          object cbx_Year: TcxDBCheckBox
            Left = 448
            Top = 22
            Caption = 'Jahr nicht '#252'berschreiben'
            DataBinding.DataField = 'Jahr'
            DataBinding.DataSource = dsMP3
            ParentBackground = False
            ParentColor = False
            Style.Color = clWindowFrame
            Style.TransparentBorder = False
            TabOrder = 2
            Transparent = True
          end
        end
        object cxGroupBox13: TcxGroupBox
          Left = 0
          Top = 140
          Align = alClient
          Caption = 'Status'
          Style.BorderStyle = ebsFlat
          TabOrder = 1
          Height = 753
          Width = 1191
          object Button1: TcxButton
            Left = 2
            Top = 18
            Width = 1187
            Height = 25
            Align = alTop
            Caption = 'MP3 Verzeichnis w'#228'hlen'
            TabOrder = 0
            OnClick = Button1Click
          end
          object Memomp3: TcxMemo
            Left = 2
            Top = 43
            Align = alClient
            Lines.Strings = (
              'Bitte Verzeichnis w'#228'hlen...')
            TabOrder = 1
            Height = 708
            Width = 1187
          end
        end
        object dxBarDockControl1: TdxBarDockControl
          Left = 0
          Top = 0
          Width = 1191
          Height = 58
          Align = dalTop
          BarManager = dxBarManager1
        end
      end
    end
  end
  object qmp3: TFDQuery
    AfterOpen = SetButtonsEnabledVisible
    AfterInsert = SetButtonsEnabledVisible
    AfterEdit = SetButtonsEnabledVisible
    AfterPost = SetButtonsEnabledVisible
    AfterCancel = SetButtonsEnabledVisible
    AfterDelete = SetButtonsEnabledVisible
    AfterScroll = SetButtonsEnabledVisible
    Connection = dm_PCM.con_PCM
    SQL.Strings = (
      'SELECT '
      'Interpret,'
      'Albuminterpret,'
      'Jahr,'
      'Album,'
      'Genre,'
      'Titel,'
      'Komponist,'
      'Pfad FROM mp3_konfiguration'
      ''
      '')
    Left = 776
    Top = 32
  end
  object dsMP3: TDataSource
    DataSet = qmp3
    Left = 828
    Top = 32
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.LargeImages = dm_PCM.imglst_32x32
    NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 632
    Top = 408
    PixelsPerInch = 96
    object dxBarManager1Bar1: TdxBar
      Caption = 'Custom 1'
      CaptionButtons = <>
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1304
      FloatTop = 2
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btn_Save'
        end
        item
          Visible = True
          ItemName = 'btn_Cancel'
        end>
      OneOnRow = True
      Row = 0
      ShowMark = False
      SizeGrip = False
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = False
    end
    object btn_Save: TdxBarLargeButton
      Caption = '&Speichern'
      Category = 0
      Enabled = False
      Hint = 'Speichern'
      Visible = ivAlways
      OnClick = btn_SaveClick
      AutoGrayScale = False
      LargeImageIndex = 12
      Width = 125
    end
    object btn_Cancel: TdxBarLargeButton
      Caption = '&Abbrechen'
      Category = 0
      Enabled = False
      Hint = 'Abbrechen'
      Visible = ivAlways
      OnClick = btn_CancelClick
      AutoGrayScale = False
      LargeImageIndex = 0
      Width = 125
    end
  end
end
