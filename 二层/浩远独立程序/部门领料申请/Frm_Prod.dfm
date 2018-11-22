object Prod_Form: TProd_Form
  Left = 341
  Top = 134
  Width = 696
  Height = 554
  Caption = #36873#25321#29983#20135#21333#21495
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 34
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 22
      Top = 11
      Width = 62
      Height = 13
      AutoSize = False
      Caption = #29983#20135#21333#21495
    end
    object Edit1: TEdit
      Left = 90
      Top = 6
      Width = 129
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
  end
  object Grd1: TDBGridEh
    Left = 0
    Top = 34
    Width = 688
    Height = 423
    Align = alTop
    DataSource = DM.DS4
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = Grd1DblClick
    OnKeyDown = Grd1KeyDown
    OnTitleClick = Grd1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = #37197#26009#21333#21495
        Footers = <>
        Width = 84
      end
      item
        EditButtons = <>
        FieldName = #26412#27425#25237#20135#25968
        Footers = <>
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = #26412#21378#32534#21495
        Footers = <>
        Width = 89
      end
      item
        EditButtons = <>
        FieldName = #23458#25143#22411#21495
        Footers = <>
        Width = 98
      end
      item
        EditButtons = <>
        FieldName = #38144#21806#35746#21333#21495
        Footers = <>
        Width = 81
      end
      item
        EditButtons = <>
        FieldName = #23458#25143#35746#21333#21495
        Footers = <>
        Width = 97
      end
      item
        EditButtons = <>
        FieldName = #23458#25143#20195#30721
        Footers = <>
        Width = 55
      end
      item
        EditButtons = <>
        FieldName = #23458#25143#31616#31216
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #35746#21333#25968#37327
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #24050#25237#20135#25968#37327
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #35746#21333#26085#26399
        Footers = <>
      end>
  end
  object BitBtn2: TBitBtn
    Left = 375
    Top = 481
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 2
    Kind = bkClose
  end
  object BitBtn1: TBitBtn
    Left = 216
    Top = 481
    Width = 75
    Height = 25
    Caption = #30830#23450
    Default = True
    ModalResult = 1
    TabOrder = 3
    OnClick = BitBtn1Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
end
