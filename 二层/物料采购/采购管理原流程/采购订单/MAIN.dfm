object Form1: TForm1
  Left = 214
  Top = 169
  Width = 815
  Height = 545
  Caption = #37319#36141#21333#31649#29702':'
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  DesignSize = (
    799
    507)
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 0
    Width = 799
    Height = 37
    Cursor = crArrow
    Align = alTop
  end
  object Label6: TLabel
    Left = 151
    Top = 13
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = #20379#24212#21830':'
  end
  object Label7: TLabel
    Left = 302
    Top = 13
    Width = 91
    Height = 13
    Caption = '             '
  end
  object SpeedButton1: TSpeedButton
    Left = 696
    Top = 4
    Width = 51
    Height = 28
    Anchors = [akTop, akRight]
    Caption = #23548#20837#25968#25454
    Flat = True
    OnClick = N17Click
  end
  object SpeedButton2: TSpeedButton
    Left = 749
    Top = 4
    Width = 54
    Height = 28
    Anchors = [akTop, akRight]
    Caption = #20445#30041#21495#30721
    Flat = True
    OnClick = SpeedButton2Click
  end
  object BitBtn1: TBitBtn
    Left = 3
    Top = 5
    Width = 46
    Height = 27
    Cursor = crHandPoint
    Caption = #36864#20986
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    TabStop = False
    OnClick = BitBtn1Click
    NumGlyphs = 2
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 37
    Width = 799
    Height = 410
    Align = alClient
    DataSource = DM.DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    TabOrder = 1
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    OnKeyPress = DBGrid1KeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'po_number'
        Title.Caption = #37319#36141#21333#21495#30721
        Title.Color = cl3DLight
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'supp_abbrname'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ware_name'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_REV_NO'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'employee_name'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'po_date'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'in_out'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'v_status'
        Title.Caption = #29366#24577
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'v_type'
        Title.Caption = #31867#22411
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'if_print'
        Title.Caption = #26159#21542#25171#21360
        Width = 64
        Visible = True
      end>
  end
  object Bar1: TStatusBar
    Left = 0
    Top = 488
    Width = 799
    Height = 19
    Panels = <>
    SimpleText = #25628#32034':'
  end
  object Edit1: TEdit
    Left = 197
    Top = 9
    Width = 74
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Edit1Click
    OnExit = Edit1Exit
  end
  object BitBtn2: TBitBtn
    Left = 273
    Top = 7
    Width = 25
    Height = 25
    TabOrder = 4
    TabStop = False
    OnClick = BitBtn2Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
      333333777777777F33333330B00000003333337F7777777F3333333000000000
      333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
      333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
      03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
      03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
      3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
      333333333377F7F33333333333330F03333333333337F7F33333333333330B03
      3333333333373733333333333333303333333333333373333333}
    NumGlyphs = 2
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 447
    Width = 799
    Height = 41
    Align = alBottom
    Caption = #29366#24577
    TabOrder = 5
    object Label8: TLabel
      Left = 570
      Top = 18
      Width = 20
      Height = 13
      Alignment = taRightJustify
      Caption = #20174':'
    end
    object Label9: TLabel
      Left = 689
      Top = 18
      Width = 20
      Height = 13
      Alignment = taRightJustify
      Caption = #21040':'
    end
    object CheckBox7: TCheckBox
      Left = 504
      Top = 16
      Width = 61
      Height = 17
      Caption = #24050#23436#25104
      TabOrder = 6
      OnClick = CheckBox1Click
    end
    object CheckBox1: TCheckBox
      Left = 19
      Top = 16
      Width = 60
      Height = 17
      Caption = #24453#23457#26680
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = CheckBox1Click
    end
    object CheckBox2: TCheckBox
      Left = 88
      Top = 16
      Width = 61
      Height = 17
      Caption = #34987#36864#22238
      Checked = True
      State = cbChecked
      TabOrder = 1
      OnClick = CheckBox1Click
    end
    object CheckBox3: TCheckBox
      Left = 157
      Top = 16
      Width = 61
      Height = 17
      Caption = #24050#20445#30041
      TabOrder = 2
      OnClick = CheckBox1Click
    end
    object CheckBox4: TCheckBox
      Left = 226
      Top = 16
      Width = 62
      Height = 17
      Caption = #24050#26242#32531
      TabOrder = 3
      OnClick = CheckBox1Click
    end
    object CheckBox5: TCheckBox
      Left = 296
      Top = 16
      Width = 60
      Height = 17
      Caption = #24050#23457#26680
      TabOrder = 4
      OnClick = CheckBox1Click
    end
    object CheckBox6: TCheckBox
      Left = 434
      Top = 16
      Width = 61
      Height = 17
      Caption = #24050#25910#36135
      TabOrder = 5
      OnClick = CheckBox1Click
    end
    object dtpk1: TDateTimePicker
      Left = 593
      Top = 14
      Width = 93
      Height = 21
      Date = 37600.000000000000000000
      Time = 37600.000000000000000000
      TabOrder = 7
      OnCloseUp = dtpk1CloseUp
      OnExit = dtpk1Exit
    end
    object DTPk2: TDateTimePicker
      Left = 709
      Top = 14
      Width = 96
      Height = 21
      Date = 37600.000000000000000000
      Time = 37600.000000000000000000
      TabOrder = 8
      OnCloseUp = dtpk1CloseUp
      OnExit = dtpk1Exit
    end
    object CheckBox8: TCheckBox
      Left = 365
      Top = 16
      Width = 64
      Height = 17
      Caption = #26410#25552#20132
      Checked = True
      State = cbChecked
      TabOrder = 9
      OnClick = CheckBox1Click
    end
  end
  object ComboBox1: TComboBox
    Left = 621
    Top = 8
    Width = 73
    Height = 21
    Hint = #25353#37319#36141#22320#28857#36807#28388
    Style = csDropDownList
    Anchors = [akTop, akRight]
    ItemHeight = 13
    ItemIndex = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    Text = #20840#37096
    OnChange = ComboBox1Change
    Items.Strings = (
      #22269#20869
      #22269#22806
      #20840#37096)
  end
  object ComboBox2: TComboBox
    Left = 532
    Top = 8
    Width = 87
    Height = 21
    Hint = #25353#24037#21378#36807#28388
    Style = csDropDownList
    Anchors = [akTop, akRight]
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnChange = ComboBox1Change
  end
  object BitBtn3: TBitBtn
    Left = 50
    Top = 5
    Width = 46
    Height = 27
    Cursor = crHandPoint
    Caption = #21047#26032
    TabOrder = 9
    OnClick = BitBtn3Click
  end
  object ComboBox3: TComboBox
    Left = 442
    Top = 8
    Width = 85
    Height = 21
    Hint = #25353#37319#36141#21592#36807#28388
    Style = csDropDownList
    Anchors = [akTop, akRight]
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnChange = ComboBox3Change
    OnKeyDown = ComboBox3KeyDown
  end
  object BitBtn4: TBitBtn
    Left = 97
    Top = 5
    Width = 46
    Height = 27
    Cursor = crHandPoint
    Hint = #21040#26399#26410#20132#36135#25968#25454#26597#35810'...'
    Caption = #26597#35810
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    OnClick = BitBtn4Click
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 88
    Top = 120
    object N1: TMenuItem
      Caption = #26032#24314
      object N14: TMenuItem
        Caption = #29983#20135#29289#26009#37319#36141#23450#21333
        OnClick = N14Click
      end
      object N15: TMenuItem
        Caption = #38750#29983#20135#29289#26009#37319#36141#23450#21333
        OnClick = N15Click
      end
    end
    object N16: TMenuItem
      Caption = #23548#20837#25968#25454
      object N17: TMenuItem
        Caption = #26469#33258'PR'#37319#36141#35831#27714
        OnClick = N17Click
      end
    end
    object N2: TMenuItem
      Caption = #32534#36753
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #26816#26597
      OnClick = N3Click
    end
    object N21: TMenuItem
      Caption = #25552#20132#23457#26680
      OnClick = N21Click
    end
    object N22: TMenuItem
      Caption = #21462#28040#23457#26680
      OnClick = N22Click
    end
    object N18: TMenuItem
      Caption = #20132#36135#35760#20107#26412
      OnClick = N18Click
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object N7: TMenuItem
      Caption = #26242#32531#37319#36141#23450#21333
      OnClick = N7Click
    end
    object N8: TMenuItem
      Caption = #21457#25918#37319#36141#23450#21333
      OnClick = N8Click
    end
    object N9: TMenuItem
      Caption = #21462#28040#37319#36141#23450#21333
      OnClick = N9Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N10: TMenuItem
      Caption = #32467#26463#37319#36141#23450#21333
      OnClick = N10Click
    end
    object N11: TMenuItem
      Caption = #37325#26032#21551#21160#37319#36141#23450#21333
      OnClick = N11Click
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object N19: TMenuItem
      Caption = #23457#25209#20449#24687
      OnClick = N19Click
    end
    object N12: TMenuItem
      Caption = #25910#36135#20449#24687
      OnClick = N12Click
    end
    object N20: TMenuItem
      Caption = #21457#36865#37038#20214
      Visible = False
      OnClick = N20Click
    end
    object N13: TMenuItem
      Caption = #21333#29420#25171#21360#25253#34920
      OnClick = N13Click
    end
    object N23: TMenuItem
      Caption = #36830#32493#25171#21360#25253#34920
      OnClick = N23Click
    end
    object N24: TMenuItem
      Caption = #37319#36141#35746#21333#21464#21160#35760#24405
      OnClick = N24Click
    end
  end
end
