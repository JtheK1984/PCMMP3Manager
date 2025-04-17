object frm_MP3: Tfrm_MP3
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frm_MP3'
  ClientHeight = 600
  ClientWidth = 1000
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnActivate = FormActivate
  OnShow = FormShow
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 1000
    Height = 600
    Align = alClient
    TabOrder = 0
    AutoSize = True
    LayoutLookAndFeel = dm_PCM.dxLayoutSkinLookAndFeel1
    ExplicitWidth = 1195
    ExplicitHeight = 922
    object chkbx_Album: TcxDBCheckBox
      Left = 526
      Top = 104
      AutoSize = False
      Caption = 'Album nicht '#252'berschreiben'
      DataBinding.DataField = 'Album'
      DataBinding.DataSource = ds_MP3
      ParentBackground = False
      ParentColor = False
      Properties.OnChange = btn_SaveClick
      Style.Color = clWindowFrame
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 4
      Transparent = True
      Height = 17
      Width = 146
    end
    object chkbx_Albumartist: TcxDBCheckBox
      Left = 194
      Top = 104
      AutoSize = False
      Caption = 'Albuminterpret nicht '#252'berschreiben'
      DataBinding.DataField = 'Albuminterpret'
      DataBinding.DataSource = ds_MP3
      ParentBackground = False
      ParentColor = False
      Style.Color = clWindowFrame
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 2
      Transparent = True
      Height = 17
      Width = 160
    end
    object chkbx_Artist: TcxDBCheckBox
      Left = 28
      Top = 104
      AutoSize = False
      Caption = 'Interpret nicht '#252'berschreiben'
      DataBinding.DataField = 'Interpret'
      DataBinding.DataSource = ds_MP3
      ParentBackground = False
      ParentColor = False
      Style.Color = clWindowFrame
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 1
      Transparent = True
      Height = 17
      Width = 160
    end
    object chkbx_Composer: TcxDBCheckBox
      Left = 194
      Top = 127
      AutoSize = False
      Caption = 'Komponist nicht '#252'berschreiben'
      DataBinding.DataField = 'Komponist'
      DataBinding.DataSource = ds_MP3
      ParentBackground = False
      ParentColor = False
      Style.Color = clWindowFrame
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 7
      Transparent = True
      Height = 17
      Width = 160
    end
    object chkbx_Genre: TcxDBCheckBox
      Left = 678
      Top = 104
      AutoSize = False
      Caption = 'Genre nicht '#252'berschreiben'
      DataBinding.DataField = 'Genre'
      DataBinding.DataSource = ds_MP3
      ParentBackground = False
      ParentColor = False
      Style.Color = clWindowFrame
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 5
      Transparent = True
      Height = 17
      Width = 160
    end
    object chkbx_Title: TcxDBCheckBox
      Left = 28
      Top = 127
      AutoSize = False
      Caption = 'Titel nicht '#252'berschreiben'
      DataBinding.DataField = 'Titel'
      DataBinding.DataSource = ds_MP3
      ParentBackground = False
      ParentColor = False
      Style.Color = clWindowFrame
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 6
      Transparent = True
      Height = 17
      Width = 160
    end
    object chkbx_Year: TcxDBCheckBox
      Left = 360
      Top = 104
      AutoSize = False
      Caption = 'Jahr nicht '#252'berschreiben'
      DataBinding.DataField = 'Jahr'
      DataBinding.DataSource = ds_MP3
      ParentBackground = False
      ParentColor = False
      Style.Color = clWindowFrame
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 3
      Transparent = True
      Height = 17
      Width = 160
    end
    object btn_Convert: TcxButton
      Left = 28
      Top = 174
      Width = 944
      Height = 25
      Caption = 'MP3 Verzeichnis w'#228'hlen'
      TabOrder = 8
      OnClick = btn_ConvertClick
    end
    object mem_mp3: TcxMemo
      Left = 28
      Top = 205
      Lines.Strings = (
        'Bitte Verzeichnis w'#228'hlen...')
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 9
      Height = 367
      Width = 944
    end
    object brdckCtrl_mp3: TdxBarDockControl
      Left = 19
      Top = 25
      Width = 962
      Height = 58
      Align = dalNone
      BarManager = brmgr_main
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avClient
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = -1
    end
    object dxLayoutGroup3: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'automatische MP3-Tags'
      ItemIndex = 2
      Index = 0
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'brdckCtrl_mp3'
      CaptionOptions.Visible = False
      Control = brdckCtrl_mp3
      ControlOptions.AutoColor = True
      ControlOptions.OriginalHeight = 58
      ControlOptions.OriginalWidth = 1191
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup4: TdxLayoutGroup
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Einstellungen'
      LayoutDirection = ldHorizontal
      Index = 1
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignHorz = ahLeft
      AlignVert = avClient
      CaptionOptions.Text = 'chkbx_Artist'
      CaptionOptions.Visible = False
      Control = chkbx_Artist
      ControlOptions.OriginalHeight = 17
      ControlOptions.OriginalWidth = 160
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignHorz = ahLeft
      AlignVert = avClient
      CaptionOptions.Text = 'chkbx_Albumartist'
      CaptionOptions.Visible = False
      Control = chkbx_Albumartist
      ControlOptions.OriginalHeight = 17
      ControlOptions.OriginalWidth = 160
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignHorz = ahLeft
      AlignVert = avClient
      CaptionOptions.Text = 'chkbx_Year'
      CaptionOptions.Visible = False
      Control = chkbx_Year
      ControlOptions.OriginalHeight = 17
      ControlOptions.OriginalWidth = 160
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'chkbx_Album'
      CaptionOptions.Visible = False
      Control = chkbx_Album
      ControlOptions.OriginalHeight = 17
      ControlOptions.OriginalWidth = 146
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignHorz = ahLeft
      AlignVert = avClient
      CaptionOptions.Text = 'chkbx_Genre'
      CaptionOptions.Visible = False
      Control = chkbx_Genre
      ControlOptions.OriginalHeight = 17
      ControlOptions.OriginalWidth = 160
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup11
      AlignHorz = ahLeft
      AlignVert = avClient
      CaptionOptions.Text = 'chkbx_Title'
      CaptionOptions.Visible = False
      Control = chkbx_Title
      ControlOptions.OriginalHeight = 17
      ControlOptions.OriginalWidth = 160
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup11
      AlignHorz = ahLeft
      AlignVert = avClient
      CaptionOptions.Text = 'chkbx_Composer'
      CaptionOptions.Visible = False
      Control = chkbx_Composer
      ControlOptions.OriginalHeight = 17
      ControlOptions.OriginalWidth = 160
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup9: TdxLayoutGroup
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'Status'
      Index = 2
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutGroup9
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'btn_Convert'
      CaptionOptions.Visible = False
      Control = btn_Convert
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 1187
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutGroup9
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'mem_mp3'
      CaptionOptions.Visible = False
      Control = mem_mp3
      ControlOptions.OriginalHeight = 708
      ControlOptions.OriginalWidth = 1187
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup1: TdxLayoutGroup
      Parent = dxLayoutGroup4
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Group'
      ItemIndex = 1
      ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup2: TdxLayoutGroup
      Parent = dxLayoutGroup1
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Group'
      ItemIndex = 3
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup11: TdxLayoutGroup
      Parent = dxLayoutGroup1
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Group'
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
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
