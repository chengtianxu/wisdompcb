object Detail_Form: TDetail_Form
  Left = 346
  Top = 185
  Width = 869
  Height = 528
  Caption = #39046#26009#26126#32454#26597#30475
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 861
    Height = 49
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 303
      Top = 22
      Width = 63
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #26448#26009#32534#30721
    end
    object BitBtn3: TBitBtn
      Left = 82
      Top = 10
      Width = 75
      Height = 30
      Hint = #21047#26032#25968#25454
      Caption = #21047#26032
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BitBtn3Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADABFBFBDADADADADADDADADBFADADADADAADADAD000DADADADDADAD0FBF0DA
        DADAADAD0F7FBF0DADADDAD0F7F87BF0DADAAD0F7F87BFB70DADD0F7F87BFB78
        80DA000F87BFB78880ADDAD00BFB78880ADAADADA0B7888740ADDADADA088804
        440AADADADA000A04440DADADADADADA0440ADADADADADADA00D}
    end
    object BitBtn1: TBitBtn
      Left = 6
      Top = 10
      Width = 75
      Height = 30
      Cursor = crHandPoint
      Hint = #36864#20986
      Caption = #36864#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
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
    object BitBtn4: TBitBtn
      Left = 158
      Top = 10
      Width = 75
      Height = 30
      Hint = #23548#20986#25968#25454'Excel'
      Caption = #23548#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BitBtn4Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DADADADADADA
        DADAADADADADADADADADDADADADADAD00000000000000006666007777777706E
        EF0AA0E6666606EEF0ADDA0E66606EEF060AADA0E606EEF0000DDADA006EEF0A
        DADAADAD06EEF00DADADDAD06EEF0670DADAAD06EEF0E6670DADD06EEF0A0E66
        70DA0FFFF0ADA0EEEE0D00000ADADA00000AADADADADADADADAD}
    end
    object Edit1: TEdit
      Left = 372
      Top = 18
      Width = 122
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 49
    Width = 861
    Height = 403
    Align = alClient
    DataSource = DM.DataSource2
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGridEh1DrawColumnCell
    OnKeyDown = DBGridEh1KeyDown
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'INV_PART_NUMBER'
        Footers = <>
        Title.Caption = #26448#26009#32534#30721
        Width = 74
      end
      item
        EditButtons = <>
        FieldName = 'INV_NAME'
        Footers = <>
        Title.Caption = #26448#26009#21517#31216
        Width = 73
      end
      item
        EditButtons = <>
        FieldName = 'INV_DESCRIPTION'
        Footers = <>
        Title.Caption = #26448#26009#35268#26684
        Width = 78
      end
      item
        EditButtons = <>
        FieldName = 'number'
        Footers = <>
        Title.Caption = #39046#26009#21333#21495
        Width = 73
      end
      item
        EditButtons = <>
        FieldName = 'QUAN_ON_HAND'
        Footers = <>
        Title.Caption = #24403#21069#24211#23384
        Width = 61
      end
      item
        EditButtons = <>
        FieldName = 'QUAN_BOM'
        Footers = <>
        Title.Caption = #37197#39069#25968#37327
        Width = 61
      end
      item
        EditButtons = <>
        FieldName = 'QUAN_ISSUED'
        Footers = <>
        Title.Caption = #24050#21457#25918#25968#37327
        Width = 77
      end
      item
        EditButtons = <>
        FieldName = 'UNIT_NAME'
        Footers = <>
        Title.Caption = #21333#20301#21517#31216
        Width = 58
      end
      item
        EditButtons = <>
        FieldName = #31867#22411
        Footers = <>
        Width = 56
      end
      item
        EditButtons = <>
        FieldName = #29366#24577
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'VENDOR'
        Footers = <>
        Title.Caption = #22791#27880
        Width = 153
      end
      item
        EditButtons = <>
        FieldName = 'STATUS'
        Footers = <>
        Visible = False
      end>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 452
    Width = 861
    Height = 45
    Align = alBottom
    Caption = #29366#24577
    TabOrder = 2
    object CheckBox3: TCheckBox
      Tag = 3
      Left = 235
      Top = 15
      Width = 69
      Height = 17
      Caption = #34987#36864#22238
      Checked = True
      State = cbChecked
      TabOrder = 3
      OnClick = CheckBox0Click
    end
    object CheckBox2: TCheckBox
      Tag = 2
      Left = 149
      Top = 15
      Width = 69
      Height = 17
      Caption = #24453#30830#35748
      Checked = True
      State = cbChecked
      TabOrder = 2
      OnClick = CheckBox0Click
    end
    object CheckBox1: TCheckBox
      Tag = 1
      Left = 78
      Top = 15
      Width = 69
      Height = 17
      Caption = #20851#38381
      Checked = True
      State = cbChecked
      TabOrder = 1
      OnClick = CheckBox0Click
    end
    object CheckBox0: TCheckBox
      Left = 9
      Top = 15
      Width = 69
      Height = 17
      Caption = #26377#25928
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = CheckBox0Click
    end
  end
end
