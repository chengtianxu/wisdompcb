object QueryPick_Demand: TQueryPick_Demand
  Left = 444
  Top = 160
  Width = 860
  Height = 556
  Caption = 'BOM'#24635#38656#27714
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 852
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label2: TLabel
      Left = 288
      Top = 13
      Width = 39
      Height = 13
      Caption = #25628#32034#65306
    end
    object BitEsc: TBitBtn
      Left = 6
      Top = 2
      Width = 70
      Height = 30
      Cursor = crHandPoint
      Hint = #36864#20986
      Caption = #36864#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BitEscClick
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
    object BitBtn3: TBitBtn
      Left = 92
      Top = 2
      Width = 70
      Height = 30
      Hint = #21047#26032#25968#25454
      Caption = #21047#26032
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
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
    object BitBtn4: TBitBtn
      Left = 178
      Top = 2
      Width = 70
      Height = 30
      Hint = #23548#20986#25968#25454'Excel'
      Caption = #23548#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
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
      Left = 352
      Top = 9
      Width = 161
      Height = 21
      TabOrder = 3
      OnChange = Edit1Change
    end
  end
  object Eh1: TDBGridEh
    Left = 0
    Top = 41
    Width = 852
    Height = 491
    Align = alClient
    DataSource = DM.ds1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnTitleClick = Eh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'INV_PART_NUMBER'
        Footers = <>
        ReadOnly = True
        Title.Caption = #26448#26009#20195#30721
        Title.Color = clRed
        Title.SortIndex = 1
        Title.SortMarker = smUpEh
        Width = 150
      end
      item
        EditButtons = <>
        FieldName = 'INV_NAME'
        Footers = <>
        ReadOnly = True
        Title.Caption = #26448#26009#21517#31216
        Width = 130
      end
      item
        EditButtons = <>
        FieldName = 'INV_DESCRIPTION'
        Footers = <>
        ReadOnly = True
        Title.Caption = #26448#26009#35215#26684
        Width = 130
      end
      item
        EditButtons = <>
        FieldName = 'QUAN_ON_HAND'
        Footers = <>
        ReadOnly = False
        Title.Caption = #24403#21069#24211#23384
      end
      item
        EditButtons = <>
        FieldName = 'stdqty'
        Footers = <>
        ReadOnly = False
        Title.Caption = #24635#25968#37327
        Width = 85
      end
      item
        EditButtons = <>
        FieldName = 'app_qty'
        Footers = <>
        ReadOnly = False
        Title.Caption = #30003#35831#39046#26009#24635#25968#37327
        Width = 106
      end
      item
        EditButtons = <>
        FieldName = 'con_qty'
        Footers = <>
        ReadOnly = False
        Title.Caption = #24050#32463#28040#32791#24635#25968#37327
        Width = 112
      end
      item
        EditButtons = <>
        FieldName = 'quan_assign'
        Footers = <>
        ReadOnly = False
        Title.Caption = #24050#20998#37197#24635#25968#37327
        Width = 100
      end>
  end
end
