object FrmQry: TFrmQry
  Left = 398
  Top = 155
  Width = 694
  Height = 318
  Caption = #26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 56
    Top = 268
    Width = 497
    Height = 13
    AutoSize = False
    Caption = '(select rkey from datadepartment)'
    Visible = False
  end
  object GroupBox6: TGroupBox
    Left = -3
    Top = 0
    Width = 689
    Height = 257
    Caption = #26597#35810#26465#20214#23450#20041
    TabOrder = 0
    object lbl_field: TLabel
      Left = 151
      Top = 33
      Width = 146
      Height = 15
      AutoSize = False
      Caption = #31867#22411
    end
    object lbl_f: TLabel
      Left = 157
      Top = 150
      Width = 33
      Height = 13
      AutoSize = False
      Caption = #20174':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object lbl_t: TLabel
      Left = 157
      Top = 180
      Width = 13
      Height = 13
      Caption = #21040
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object rg_sign: TRadioGroup
      Left = 147
      Top = 72
      Width = 150
      Height = 57
      Caption = #26465#20214
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #31561#20110' ='
        #22823#20110' >'
        #23567#20110' <'
        #20171#20110#21306#38388)
      TabOrder = 5
      Visible = False
      OnClick = rg_signClick
    end
    object rg_condi: TRadioGroup
      Left = 147
      Top = 73
      Width = 142
      Height = 40
      Caption = #26465#20214
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #31934#30830#26597#25214' '
        #27169#31946#26597#25214)
      TabOrder = 8
    end
    object rg_yesno: TRadioGroup
      Left = 147
      Top = 80
      Width = 142
      Height = 41
      Caption = #26465#20214
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #26159' '
        #21542)
      TabOrder = 9
    end
    object edtValue: TEdit
      Left = 147
      Top = 50
      Width = 132
      Height = 21
      TabOrder = 0
    end
    object btn_add: TButton
      Left = 149
      Top = 206
      Width = 62
      Height = 25
      Caption = #22686#21152
      TabOrder = 1
      OnClick = btn_addClick
    end
    object lst_fields: TListBox
      Left = 10
      Top = 41
      Width = 135
      Height = 184
      ItemHeight = 13
      TabOrder = 2
      OnClick = lst_fieldsClick
    end
    object StaticText7: TStaticText
      Left = 10
      Top = 23
      Width = 135
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
    object btn_del: TButton
      Left = 235
      Top = 206
      Width = 62
      Height = 25
      Caption = #28165#38500
      TabOrder = 4
      OnClick = btn_delClick
    end
    object dtp_f: TDateTimePicker
      Left = 147
      Top = 50
      Width = 142
      Height = 21
      Date = 40780.667675590280000000
      Time = 40780.667675590280000000
      TabOrder = 6
    end
    object cbb_rank: TComboBox
      Left = 147
      Top = 50
      Width = 141
      Height = 21
      ItemHeight = 13
      TabOrder = 7
      Visible = False
      Items.Strings = (
        #25163#26426#36890#23380#26495
        #25163#26426#26495
        #26222#36890#26495
        #20809#26495
        '')
    end
    object btn_qry: TBitBtn
      Left = 286
      Top = 48
      Width = 22
      Height = 23
      TabOrder = 10
      Visible = False
      OnClick = btn_qryClick
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        04000000000078000000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888800000888880000080F000888880F00080F000888880F0008000000080000
        000800F000000F00000800F000800F00000800F000800F000008800000000000
        0088880F00080F000888880000080000088888800088800088888880F08880F0
        888888800088800088888888888888888888}
    end
    object StaticText2: TStaticText
      Left = 311
      Top = 23
      Width = 362
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
      TabOrder = 11
    end
    object sg1: TStringGrid
      Left = 312
      Top = 48
      Width = 352
      Height = 175
      ColCount = 3
      DefaultRowHeight = 19
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
      PopupMenu = PopupMenu1
      ScrollBars = ssHorizontal
      TabOrder = 12
      ColWidths = (
        87
        250
        3)
    end
    object dtp1: TDateTimePicker
      Left = 184
      Top = 145
      Width = 107
      Height = 21
      Date = 39878.000000000000000000
      Time = 39878.000000000000000000
      TabOrder = 13
      Visible = False
    end
    object dtp2: TDateTimePicker
      Left = 184
      Top = 178
      Width = 107
      Height = 21
      Date = 39878.000000000000000000
      Time = 39878.000000000000000000
      TabOrder = 14
      Visible = False
    end
  end
  object btn_OK: TButton
    Left = 47
    Top = 260
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 1
  end
  object btn_cancel: TButton
    Left = 191
    Top = 260
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 2
    OnClick = btn_cancelClick
  end
  object PopupMenu1: TPopupMenu
    Left = 456
    Top = 91
    object N1: TMenuItem
      Caption = #21024#38500
      OnClick = N1Click
    end
  end
end
