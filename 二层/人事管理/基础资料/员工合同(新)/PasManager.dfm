object frmManager: TfrmManager
  Left = 199
  Top = 118
  Width = 1060
  Height = 679
  Caption = #32463#29702#32423#20197#19978
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1044
    Height = 41
    Align = alTop
    TabOrder = 0
    object btnQuit: TBitBtn
      Left = 2
      Top = 3
      Width = 73
      Height = 34
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
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 525
    Height = 600
    Align = alLeft
    TabOrder = 1
    DesignSize = (
      525
      600)
    object Label1: TLabel
      Left = 6
      Top = 10
      Width = 222
      Height = 13
      Caption = #32463#29702'/'#21103#32463#29702#23558#21040#26399#21512#21516' '#25552#21069#21322#24180#26174#31034
    end
    object dbManager: TDBGridEh
      Left = 1
      Top = 21
      Width = 523
      Height = 578
      Align = alBottom
      DataSource = DM.DataSource5
      FooterColor = clWindow
      FooterFont.Charset = ANSI_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -13
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = 'employeecode'
          Footers = <>
          Width = 57
        end
        item
          EditButtons = <>
          FieldName = 'chinesename'
          Footers = <>
          Width = 58
        end
        item
          EditButtons = <>
          FieldName = 'departmentname'
          Footers = <>
          Width = 76
        end
        item
          EditButtons = <>
          FieldName = 'PositionName'
          Footers = <>
          Width = 53
        end
        item
          EditButtons = <>
          FieldName = 'code'
          Footers = <>
          Width = 88
        end
        item
          EditButtons = <>
          FieldName = 'ondutytime'
          Footers = <>
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'startdate'
          Footers = <>
          Width = 81
        end
        item
          EditButtons = <>
          FieldName = 'probationdate'
          Footers = <>
          Width = 75
        end
        item
          EditButtons = <>
          FieldName = 'enddate'
          Footers = <>
          Width = 87
        end
        item
          EditButtons = <>
          FieldName = 'workage'
          Footers = <>
          Width = 57
        end
        item
          EditButtons = <>
          FieldName = 'contracttype'
          Footers = <>
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'statusname'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'remark'
          Footers = <>
          Width = 235
        end>
    end
    object btnManager: TBitBtn
      Left = 434
      Top = 3
      Width = 75
      Height = 27
      Anchors = [akTop, akRight]
      Caption = #23548#20986
      TabOrder = 1
      OnClick = btnManagerClick
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
  object Panel3: TPanel
    Left = 525
    Top = 41
    Width = 519
    Height = 600
    Align = alClient
    TabOrder = 2
    DesignSize = (
      519
      600)
    object Label2: TLabel
      Left = 6
      Top = 10
      Width = 196
      Height = 13
      Caption = #24635'/'#21103#24635#23558#21040#26399#21512#21516' '#25552#21069#19968#24180#26174#31034
    end
    object dbTopManager: TDBGridEh
      Left = 1
      Top = 21
      Width = 517
      Height = 578
      Align = alBottom
      DataSource = DM.DataSource6
      FooterColor = clWindow
      FooterFont.Charset = ANSI_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -13
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = 'employeecode'
          Footers = <>
          Width = 63
        end
        item
          EditButtons = <>
          FieldName = 'chinesename'
          Footers = <>
          Width = 65
        end
        item
          EditButtons = <>
          FieldName = 'departmentname'
          Footers = <>
          Width = 86
        end
        item
          EditButtons = <>
          FieldName = 'PositionName'
          Footers = <>
          Width = 69
        end
        item
          EditButtons = <>
          FieldName = 'code'
          Footers = <>
          Width = 86
        end
        item
          EditButtons = <>
          FieldName = 'ondutytime'
          Footers = <>
          Width = 74
        end
        item
          EditButtons = <>
          FieldName = 'startdate'
          Footers = <>
          Width = 88
        end
        item
          EditButtons = <>
          FieldName = 'probationdate'
          Footers = <>
          Width = 86
        end
        item
          EditButtons = <>
          FieldName = 'enddate'
          Footers = <>
          Width = 87
        end
        item
          EditButtons = <>
          FieldName = 'workage'
          Footers = <>
          Width = 49
        end
        item
          EditButtons = <>
          FieldName = 'contracttype'
          Footers = <>
          Width = 71
        end
        item
          EditButtons = <>
          FieldName = 'statusname'
          Footers = <>
          Width = 43
        end
        item
          EditButtons = <>
          FieldName = 'remark'
          Footers = <>
          Width = 256
        end>
    end
    object btnTopManager: TBitBtn
      Left = 432
      Top = 2
      Width = 75
      Height = 27
      Anchors = [akTop]
      Caption = #23548#20986
      TabOrder = 1
      OnClick = btnTopManagerClick
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
end
