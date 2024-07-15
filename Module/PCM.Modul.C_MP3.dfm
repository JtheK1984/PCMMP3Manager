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
  OnActivate = FormActivate
  OnShow = FormShow
  TextHeight = 13
  object grpbx_right: TcxGroupBox
    Left = 0
    Top = 0
    Align = alClient
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    TabOrder = 0
    Height = 922
    Width = 1195
    object pc_main: TcxPageControl
      Left = 3
      Top = 3
      Width = 1189
      Height = 916
      Align = alClient
      TabOrder = 0
      Properties.ActivePage = ts_mp3
      Properties.CustomButtons.Buttons = <>
      Properties.Images = dm_PCM.imglst_16x16
      Properties.TabSlants.Kind = skCutCorner
      Properties.TabWidth = 150
      ClientRectBottom = 910
      ClientRectLeft = 2
      ClientRectRight = 1183
      ClientRectTop = 28
      object ts_mp3: TcxTabSheet
        Caption = 'automatische MP3-Tags'
        ImageIndex = 89
        object grpbx_Mp3: TcxGroupBox
          Left = 0
          Top = 63
          Align = alTop
          Caption = 'Einstellungen'
          Style.BorderStyle = ebsFlat
          TabOrder = 0
          Height = 82
          Width = 1181
          object chkbx_Album: TcxDBCheckBox
            Left = 615
            Top = 22
            Caption = 'Album nicht '#252'berschreiben'
            DataBinding.DataField = 'Album'
            DataBinding.DataSource = ds_MP3
            ParentBackground = False
            ParentColor = False
            Properties.OnChange = btn_SaveClick
            Style.Color = clWindowFrame
            Style.TransparentBorder = False
            TabOrder = 3
            Transparent = True
          end
          object chkbx_Albumartist: TcxDBCheckBox
            Left = 215
            Top = 22
            Caption = 'Albuminterpret nicht '#252'berschreiben'
            DataBinding.DataField = 'Albuminterpret'
            DataBinding.DataSource = ds_MP3
            ParentBackground = False
            ParentColor = False
            Style.Color = clWindowFrame
            Style.TransparentBorder = False
            TabOrder = 1
            Transparent = True
          end
          object chkbx_Artist: TcxDBCheckBox
            Left = 8
            Top = 22
            Caption = 'Interpret nicht '#252'berschreiben'
            DataBinding.DataField = 'Interpret'
            DataBinding.DataSource = ds_MP3
            ParentBackground = False
            ParentColor = False
            Style.Color = clWindowFrame
            Style.TransparentBorder = False
            TabOrder = 0
            Transparent = True
          end
          object chkbx_Composer: TcxDBCheckBox
            Left = 215
            Top = 47
            Caption = 'Komponist nicht '#252'berschreiben'
            DataBinding.DataField = 'Komponist'
            DataBinding.DataSource = ds_MP3
            ParentBackground = False
            ParentColor = False
            Style.Color = clWindowFrame
            Style.TransparentBorder = False
            TabOrder = 6
            Transparent = True
          end
          object chkbx_Genre: TcxDBCheckBox
            Left = 792
            Top = 22
            Caption = 'Genre nicht '#252'berschreiben'
            DataBinding.DataField = 'Genre'
            DataBinding.DataSource = ds_MP3
            ParentBackground = False
            ParentColor = False
            Style.Color = clWindowFrame
            Style.TransparentBorder = False
            TabOrder = 4
            Transparent = True
          end
          object chkbx_Title: TcxDBCheckBox
            Left = 8
            Top = 47
            Caption = 'Titel nicht '#252'berschreiben'
            DataBinding.DataField = 'Titel'
            DataBinding.DataSource = ds_MP3
            ParentBackground = False
            ParentColor = False
            Style.Color = clWindowFrame
            Style.TransparentBorder = False
            TabOrder = 5
            Transparent = True
          end
          object chkbx_Year: TcxDBCheckBox
            Left = 448
            Top = 22
            Caption = 'Jahr nicht '#252'berschreiben'
            DataBinding.DataField = 'Jahr'
            DataBinding.DataSource = ds_MP3
            ParentBackground = False
            ParentColor = False
            Style.Color = clWindowFrame
            Style.TransparentBorder = False
            TabOrder = 2
            Transparent = True
          end
        end
        object grpbx_Mp3Status: TcxGroupBox
          Left = 0
          Top = 145
          Align = alClient
          Caption = 'Status'
          Style.BorderStyle = ebsFlat
          TabOrder = 1
          Height = 737
          Width = 1181
          object btn_Convert: TcxButton
            Left = 3
            Top = 15
            Width = 1175
            Height = 25
            Align = alTop
            Caption = 'MP3 Verzeichnis w'#228'hlen'
            TabOrder = 0
            OnClick = btn_ConvertClick
          end
          object mem_mp3: TcxMemo
            Left = 3
            Top = 40
            Align = alClient
            Lines.Strings = (
              'Bitte Verzeichnis w'#228'hlen...')
            TabOrder = 1
            Height = 688
            Width = 1175
          end
        end
        object brdckCtrl_mp3: TdxBarDockControl
          Left = 0
          Top = 0
          Width = 1181
          Height = 63
          Align = dalTop
          BarManager = brmgr_main
        end
      end
    end
  end
  object qry_mp3: TFDQuery
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
  object ds_MP3: TDataSource
    DataSet = qry_mp3
    Left = 828
    Top = 32
  end
  object brmgr_main: TdxBarManager
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
    object tb_Main: TdxBar
      Caption = 'Custom 1'
      CaptionButtons = <>
      DockControl = brdckCtrl_mp3
      DockedDockControl = brdckCtrl_mp3
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
