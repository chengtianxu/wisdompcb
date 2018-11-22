object frmOUT: TfrmOUT
  Left = 451
  Top = 267
  Width = 668
  Height = 461
  Caption = #26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 652
    Height = 41
    Align = alTop
    TabOrder = 0
    object btn1: TBitBtn
      Left = 2
      Top = 4
      Width = 75
      Height = 33
      Caption = #36864#20986
      ModalResult = 2
      TabOrder = 0
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
    object btn2: TBitBtn
      Left = 78
      Top = 4
      Width = 75
      Height = 33
      Caption = #23548#20986
      TabOrder = 1
      OnClick = btn2Click
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
  object pnl2: TPanel
    Left = 0
    Top = 41
    Width = 652
    Height = 381
    Align = alClient
    TabOrder = 1
    object dbOUT: TDBGridEh
      Left = 1
      Top = 1
      Width = 650
      Height = 379
      Align = alClient
      DataSource = ds1
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = 'employeecode'
          Footers = <>
          ReadOnly = True
          Width = 76
        end
        item
          EditButtons = <>
          FieldName = 'chinesename'
          Footers = <>
          ReadOnly = True
          Width = 65
        end
        item
          EditButtons = <>
          FieldName = 'departmentname'
          Footers = <>
          ReadOnly = True
          Width = 113
        end
        item
          EditButtons = <>
          FieldName = 'position_item'
          Footers = <>
          ReadOnly = True
          Width = 105
        end
        item
          EditButtons = <>
          FieldName = 'ondutytime'
          Footers = <>
          ReadOnly = True
          Width = 76
        end
        item
          EditButtons = <>
          FieldName = 'maxdate'
          Footers = <>
          Width = 89
        end>
    end
  end
  object ds1: TDataSource
    DataSet = DM1.qryOUt
    Left = 464
    Top = 257
  end
end
