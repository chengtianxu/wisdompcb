object Form1: TForm1
  Left = 140
  Top = 151
  Width = 815
  Height = 555
  Caption = #37319#36141#21333#25171#21360
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
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 0
    Width = 807
    Height = 37
    Cursor = crArrow
    Align = alTop
  end
  object Label6: TLabel
    Left = 96
    Top = 13
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = #20379#24212#21830':'
  end
  object Label7: TLabel
    Left = 266
    Top = 13
    Width = 7
    Height = 13
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 7
    Width = 30
    Height = 27
    Cursor = crHandPoint
    TabOrder = 0
    TabStop = False
    OnClick = BitBtn1Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
      F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
      000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
      338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
      45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
      3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
      F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
      000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
      338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
      4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
      8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
      333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
      0000}
    NumGlyphs = 2
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 37
    Width = 807
    Height = 434
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
        Width = 139
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'supp_abbrname'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ware_name'
        Width = 68
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
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'po_date'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'in_out'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'v_status'
        Title.Caption = #29366#24577
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'v_type'
        Title.Caption = #31867#22411
        Width = 84
        Visible = True
      end>
  end
  object Bar1: TStatusBar
    Left = 0
    Top = 509
    Width = 807
    Height = 19
    Panels = <>
    SimpleText = #25628#32034':'
  end
  object Edit1: TEdit
    Left = 149
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
    Left = 230
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
    Top = 471
    Width = 807
    Height = 38
    Align = alBottom
    Caption = #29366#24577
    TabOrder = 5
    object Label8: TLabel
      Left = 508
      Top = 15
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = '   '#20174':'
    end
    object Label9: TLabel
      Left = 637
      Top = 15
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = '   '#21040':'
    end
    object CheckBox1: TCheckBox
      Left = 11
      Top = 13
      Width = 63
      Height = 17
      Caption = #24453#23457#26680
      TabOrder = 0
      OnClick = CheckBox1Click
    end
    object CheckBox2: TCheckBox
      Left = 74
      Top = 13
      Width = 70
      Height = 17
      Caption = #34987#36864#22238
      TabOrder = 1
      OnClick = CheckBox1Click
    end
    object CheckBox3: TCheckBox
      Left = 138
      Top = 13
      Width = 70
      Height = 17
      Caption = #24050#20445#30041
      TabOrder = 2
      OnClick = CheckBox1Click
    end
    object CheckBox4: TCheckBox
      Left = 202
      Top = 13
      Width = 67
      Height = 17
      Caption = #24050#26242#32531
      TabOrder = 3
      OnClick = CheckBox1Click
    end
    object CheckBox5: TCheckBox
      Left = 265
      Top = 13
      Width = 68
      Height = 17
      Caption = #24050#23457#26680
      Checked = True
      State = cbChecked
      TabOrder = 4
      OnClick = CheckBox1Click
    end
    object CheckBox6: TCheckBox
      Left = 393
      Top = 13
      Width = 69
      Height = 17
      Caption = #24050#25910#36135
      TabOrder = 5
      OnClick = CheckBox1Click
    end
    object CheckBox7: TCheckBox
      Left = 457
      Top = 13
      Width = 69
      Height = 17
      Caption = #24050#23436#25104
      TabOrder = 6
      OnClick = CheckBox1Click
    end
    object dtpk1: TDateTimePicker
      Left = 554
      Top = 11
      Width = 97
      Height = 21
      Date = 37600.000000000000000000
      Time = 37600.000000000000000000
      TabOrder = 7
      OnCloseUp = dtpk1CloseUp
      OnExit = dtpk1Exit
    end
    object DTPk2: TDateTimePicker
      Left = 681
      Top = 11
      Width = 97
      Height = 21
      Date = 37600.000000000000000000
      Time = 37600.000000000000000000
      TabOrder = 8
      OnCloseUp = dtpk1CloseUp
      OnExit = dtpk1Exit
    end
    object CheckBox8: TCheckBox
      Left = 329
      Top = 13
      Width = 64
      Height = 17
      Caption = #26410#25552#20132
      TabOrder = 9
      OnClick = CheckBox1Click
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 384
    Top = 152
    object N3: TMenuItem
      Caption = #26816#26597
      OnClick = N3Click
    end
    object N1: TMenuItem
      Caption = #26631#35782#24050#25171#21360
      OnClick = N1Click
    end
    object N13: TMenuItem
      Caption = #25171#21360#25253#34920
      OnClick = N13Click
    end
  end
end
