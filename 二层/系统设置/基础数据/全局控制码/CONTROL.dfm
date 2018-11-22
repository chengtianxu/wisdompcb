object Form1: TForm1
  Left = 242
  Top = 120
  Width = 710
  Height = 584
  Anchors = [akLeft, akTop, akRight, akBottom]
  Caption = #25511#21046#21495#30721
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 702
    Height = 31
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 312
      Top = 10
      Width = 32
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Label1'
    end
    object BitBtn1: TBitBtn
      Left = 1
      Top = 1
      Width = 55
      Height = 29
      Hint = #21462#28040
      Caption = #36864#20986
      ParentShowHint = False
      ShowHint = True
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
    object Edit1: TEdit
      Left = 352
      Top = 6
      Width = 121
      Height = 21
      TabOrder = 1
      OnChange = Edit1Change
    end
  end
  object BitBtn2: TBitBtn
    Left = 57
    Top = 1
    Width = 55
    Height = 29
    Caption = #21047#26032
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = BitBtn2Click
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
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 31
    Width = 702
    Height = 519
    Align = alClient
    DataSource = DM.DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'SEED_MEAN'
        Footers = <>
        Title.Caption = #25551#36848
        Title.Color = clRed
        Title.SortIndex = 1
        Title.SortMarker = smUpEh
        Width = 150
      end
      item
        EditButtons = <>
        FieldName = 'seed_flag1'
        Footers = <>
        Tag = 1
        Title.Caption = #26631#35760
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'SEED_VALUE'
        Footers = <>
        Tag = 1
        Title.Caption = #21442#32771#20540
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'table_name'
        Footers = <>
        Tag = 1
        Title.Caption = #34920#21517
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'CONTROL_NO_LENGTH'
        Footers = <>
        Tag = 1
        Title.Caption = #21442#32771#20540#26368#22823#38271#24230
        Width = 100
      end>
  end
  object PopupMenu1: TPopupMenu
    Left = 226
    Top = 113
    object N1: TMenuItem
      Caption = #32534#36753
      OnClick = N1Click
    end
  end
end
