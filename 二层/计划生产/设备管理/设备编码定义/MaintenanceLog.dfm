object Frm_MaintenanceLog: TFrm_MaintenanceLog
  Left = 380
  Top = 154
  Width = 979
  Height = 563
  Caption = #35774#22791#32500#20462#26085#24535
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 971
    Height = 41
    Align = alTop
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 6
      Top = 6
      Width = 57
      Height = 29
      Caption = #36864#20986
      TabOrder = 0
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
    object BitBtn2: TBitBtn
      Left = 63
      Top = 6
      Width = 57
      Height = 29
      Caption = #23548#20986
      TabOrder = 1
      OnClick = BitBtn2Click
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
  end
  object DBGrd: TDBGridEh
    Left = 0
    Top = 41
    Width = 971
    Height = 488
    Align = alClient
    DataSource = DM.DataSource2
    FooterColor = clWindow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'NUMBER'
        Footers = <>
        Title.Caption = #25925#38556#30003#35831#32534#21495
        Width = 88
      end
      item
        EditButtons = <>
        FieldName = 'FASSET_CODE'
        Footers = <>
        Title.Caption = #35774#22791#32534#30721
        Width = 82
      end
      item
        EditButtons = <>
        FieldName = 'FASSET_NAME'
        Footers = <>
        Title.Caption = #35774#22791#21517#31216
        Width = 99
      end
      item
        EditButtons = <>
        FieldName = 'FASSET_DESC'
        Footers = <>
        Title.Caption = #35268#26684#22411#21495
        Width = 92
      end
      item
        EditButtons = <>
        FieldName = 'DEPT_NAME'
        Footers = <>
        Title.Caption = #25152#22312#37096#38376
        Width = 86
      end
      item
        EditButtons = <>
        FieldName = 'PLACE'
        Footers = <>
        Title.Caption = #35774#22791#20351#29992#22320#28857
        Width = 98
      end
      item
        EditButtons = <>
        FieldName = 'failure_date'
        Footers = <>
        Title.Caption = #25925#38556#26085#26399
        Width = 108
      end
      item
        EditButtons = <>
        FieldName = 'EMPLOYEE_NAME'
        Footers = <>
        Title.Caption = #36755#20837#20154#21592
        Width = 79
      end
      item
        EditButtons = <>
        FieldName = 'ent_date'
        Footers = <>
        Title.Caption = #36755#20837#26085#26399
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'referring_date'
        Footers = <>
        Title.Caption = #25552#20132#26085#26399
      end
      item
        EditButtons = <>
        FieldName = 'failure_circs'
        Footers = <>
        Title.Caption = #25925#38556#24773#20917#35828#26126
        Width = 200
      end
      item
        EditButtons = <>
        FieldName = 'disposal_empl'
        Footers = <>
        Title.Caption = #21463#29702#20154#21592
      end
      item
        EditButtons = <>
        FieldName = 'disposal_date'
        Footers = <>
        Title.Caption = #21463#29702#26085#26399
      end
      item
        EditButtons = <>
        FieldName = 'maintain_empl'
        Footers = <>
        Title.Caption = #21442#19982#32500#20462#20154#21592
        Width = 219
      end
      item
        EditButtons = <>
        FieldName = 'maintain_text'
        Footers = <>
        Title.Caption = #32500#20462#35760#24405#35828#26126
        Width = 200
      end
      item
        EditButtons = <>
        FieldName = 'complete_date'
        Footers = <>
        Title.Caption = #23436#24037#26085#26399
        Width = 96
      end
      item
        EditButtons = <>
        FieldName = 'validate_empl'
        Footers = <>
        Title.Caption = #39564#25910#20154#21592
        Width = 78
      end
      item
        EditButtons = <>
        FieldName = 'validate_date'
        Footers = <>
        Title.Caption = #39564#25910#26085#26399
        Width = 111
      end>
  end
end
