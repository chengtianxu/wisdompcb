object FrmProInfo: TFrmProInfo
  Left = 346
  Top = 232
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #29983#20135#21333
  ClientHeight = 432
  ClientWidth = 759
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object label1: TLabel
    Left = 16
    Top = 161
    Width = 52
    Height = 13
    Caption = #26448#26009#32534#30721
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object BitBtn2: TBitBtn
    Left = 67
    Top = 3
    Width = 64
    Height = 30
    Hint = #23548#20986#24403#21069'BOM'
    Caption = #23548#20986
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
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
  object BitBtn1: TBitBtn
    Left = 3
    Top = 3
    Width = 64
    Height = 30
    Hint = #36864#20986
    Caption = #20851#38381
    ParentShowHint = False
    ShowHint = False
    TabOrder = 1
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
    Left = 4
    Top = 40
    Width = 749
    Height = 105
    DataSource = DM.DS492
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CUT_NO'
        Title.Caption = #29983#20135#21333#21495
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ISSUED_QTY'
        Title.Caption = #25237#20135#25968#37327
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ISSUE_DATE'
        Title.Caption = #25237#20135#26085#26399
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SCH_COMPL_DATE'
        Title.Caption = #23436#24037#26085#26399
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'v_ttype'
        Title.Caption = #25237#20135#31867#22411
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'v_status'
        Title.Caption = #29983#20135#29366#24577
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEPT_NAME'
        Title.Caption = #37096#38376#21517#31216
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PLANNED_QTY'
        Title.Caption = #35746#21333#25968#37327
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Title.Caption = #25237#20135#21592#24037
        Width = 104
        Visible = True
      end>
  end
  object edt_1: TEdit
    Left = 72
    Top = 156
    Width = 121
    Height = 21
    TabOrder = 3
    OnChange = edt_1Change
  end
  object dgh_grd1: TDBGridEh
    Left = 4
    Top = 184
    Width = 749
    Height = 241
    DataSource = DM.DS468
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnTitleClick = dgh_grd1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'INV_PART_NUMBER'
        Footers = <>
        Title.Caption = #26448#26009#32534#30721
        Width = 91
      end
      item
        EditButtons = <>
        FieldName = 'INV_NAME'
        Footers = <>
        Title.Caption = #26448#26009#21517#31216
        Width = 98
      end
      item
        EditButtons = <>
        FieldName = 'INV_DESCRIPTION'
        Footers = <>
        Title.Caption = #26448#26009#35268#26684
        Width = 125
      end
      item
        EditButtons = <>
        FieldName = 'number'
        Footers = <>
        Title.Caption = #39046#26009#21333#21495
        Width = 74
      end
      item
        EditButtons = <>
        FieldName = 'employee_name'
        Footers = <>
        Title.Caption = #30003#39046#20154#21592
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'QUAN_ON_HAND'
        Footers = <>
        Title.Caption = #24403#21069#24211#23384
        Width = 54
      end
      item
        EditButtons = <>
        FieldName = 'QUAN_BOM'
        Footers = <>
        Title.Caption = #37197#39069#25968#37327
        Width = 54
      end
      item
        EditButtons = <>
        FieldName = 'QUAN_ISSUED'
        Footers = <>
        Title.Caption = #24050#21457#25918#25968#37327
        Width = 66
      end
      item
        EditButtons = <>
        FieldName = 'UNIT_NAME'
        Footers = <>
        Title.Caption = #21333#20301#21517#31216
        Width = 55
      end
      item
        EditButtons = <>
        FieldName = #31867#22411
        Footers = <>
        Width = 43
      end
      item
        EditButtons = <>
        FieldName = #29366#24577
        Footers = <>
        Width = 35
      end
      item
        EditButtons = <>
        FieldName = 'VENDOR'
        Footers = <>
        Title.Caption = #22791#27880
      end>
  end
end
