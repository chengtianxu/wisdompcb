object Qry: TQry
  Left = 303
  Top = 194
  Width = 559
  Height = 329
  Caption = #25104#21697#20986#20179#26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 18
    Top = 218
    Width = 68
    Height = 13
    AutoSize = False
    Caption = #20837#20179#26085#26399#20174
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 251
    Top = 216
    Width = 13
    Height = 13
    Caption = #21040
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object GroupBox6: TGroupBox
    Left = 1
    Top = 13
    Width = 290
    Height = 190
    Caption = #26597#35810#26465#20214#23450#20041
    TabOrder = 0
    object Label8: TLabel
      Left = 125
      Top = 33
      Width = 60
      Height = 13
      AutoSize = False
      Caption = #20986#20179#21333#21495
    end
    object edtValue: TEdit
      Left = 116
      Top = 54
      Width = 125
      Height = 21
      TabOrder = 0
      OnChange = edtValueChange
    end
    object Button3: TButton
      Left = 123
      Top = 151
      Width = 62
      Height = 25
      Caption = #22686#21152
      Enabled = False
      TabOrder = 1
      OnClick = Button3Click
    end
    object ListBox3: TListBox
      Left = 10
      Top = 40
      Width = 103
      Height = 145
      ItemHeight = 13
      TabOrder = 2
      OnClick = ListBox3Click
    end
    object StaticText7: TStaticText
      Left = 10
      Top = 23
      Width = 103
      Height = 17
      Alignment = taCenter
      AutoSize = False
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = #26465#20214#39033#30446
      Color = clGrayText
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 3
    end
    object Button4: TButton
      Left = 203
      Top = 151
      Width = 62
      Height = 25
      Caption = #28165#38500
      TabOrder = 4
      OnClick = Button4Click
    end
    object RadioGroup3: TRadioGroup
      Left = 125
      Top = 85
      Width = 140
      Height = 48
      Caption = #26465#20214
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #31561#20110' ='
        #30456#20284' like')
      TabOrder = 5
    end
  end
  object StaticText2: TStaticText
    Left = 291
    Top = 17
    Width = 258
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BevelInner = bvLowered
    BevelOuter = bvNone
    Caption = #24050#23450#20041#30340#26465#20214
    Color = clGrayText
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindow
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 1
  end
  object SGrid1: TStringGrid
    Left = 298
    Top = 35
    Width = 247
    Height = 170
    ColCount = 3
    DefaultRowHeight = 19
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
    PopupMenu = PopupMenu1
    ScrollBars = ssHorizontal
    TabOrder = 2
    OnSelectCell = SGrid1SelectCell
    ColWidths = (
      67
      174
      2)
  end
  object Button1: TButton
    Left = 167
    Top = 249
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 303
    Top = 249
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 4
  end
  object dtpk1: TDateTimePicker
    Left = 90
    Top = 214
    Width = 150
    Height = 21
    Date = 40622.000000000000000000
    Time = 40622.000000000000000000
    TabOrder = 5
  end
  object dtpk2: TDateTimePicker
    Left = 275
    Top = 215
    Width = 150
    Height = 21
    Date = 40622.999988425930000000
    Time = 40622.999988425930000000
    TabOrder = 6
  end
  object PopupMenu1: TPopupMenu
    Left = 496
    Top = 160
    object N1: TMenuItem
      Caption = #21024#38500
      OnClick = N1Click
    end
  end
end
