object FrmQry: TFrmQry
  Left = 304
  Top = 286
  Width = 727
  Height = 330
  Caption = #26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
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
      Caption = #35838#31243#32534#21495
    end
    object edt_Value: TEdit
      Left = 155
      Top = 50
      Width = 132
      Height = 21
      TabOrder = 4
      Visible = False
    end
    object btn_add: TButton
      Left = 197
      Top = 142
      Width = 62
      Height = 25
      Caption = #22686#21152
      TabOrder = 7
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
      TabOrder = 0
    end
    object btn_del: TButton
      Left = 197
      Top = 182
      Width = 64
      Height = 25
      Caption = #28165#38500
      TabOrder = 8
      OnClick = btn_delClick
    end
    object cbb1: TComboBox
      Left = 157
      Top = 50
      Width = 141
      Height = 21
      ItemHeight = 13
      TabOrder = 5
      Visible = False
      Items.Strings = (
        #25163#26426#36890#23380#26495
        #25163#26426#26495
        #26222#36890#26495
        #20809#26495
        '')
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
      TabOrder = 1
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
      TabOrder = 3
      ColWidths = (
        87
        250
        3)
    end
    object rg_condi: TRadioGroup
      Left = 155
      Top = 81
      Width = 142
      Height = 40
      Caption = #26465#20214
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #31934#30830#26597#25214' '
        #27169#31946#26597#25214)
      TabOrder = 6
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
  end
  object PopupMenu1: TPopupMenu
    Left = 456
    Top = 91
    object N1: TMenuItem
      Caption = #21024#38500
    end
  end
  object qry_temp: TADOQuery
    Connection = DM.con
    Parameters = <>
    Left = 621
    Top = 160
  end
end
