object Prod_Form: TProd_Form
  Left = 292
  Top = 139
  Width = 696
  Height = 554
  Caption = #36873#25321#29983#20135#21333#21495
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
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
    Width = 680
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
    Width = 680
    Height = 423
    Align = alTop
    DataSource = DM.DS4
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = Grd1DblClick
    OnKeyDown = Grd1KeyDown
    OnTitleClick = Grd1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'CUT_NO'
        Footers = <>
        Title.Caption = #29983#20135#21333#21495
        Width = 79
      end
      item
        EditButtons = <>
        FieldName = 'TTYPE'
        Footers = <>
        Title.Caption = #25237#20135#31867#22411
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'PROD_CODE'
        Footers = <>
        Title.Caption = #20135#21697#20195#30721
        Width = 95
      end
      item
        EditButtons = <>
        FieldName = 'PRODUCT_NAME'
        Footers = <>
        Title.Caption = #20135#21697#21517#31216
        Width = 94
      end
      item
        EditButtons = <>
        FieldName = 'PRODUCT_DESC'
        Footers = <>
        Title.Caption = #20135#21697#35268#26684
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'PR_GRP_CODE'
        Footers = <>
        Title.Caption = #20135#21697#32452#21035#20195#30721
        Width = 93
      end
      item
        EditButtons = <>
        FieldName = 'PRODUCT_GROUP_NAME'
        Footers = <>
        Title.Caption = #20135#21697#32452#21035#21517#31216
        Width = 86
      end
      item
        EditButtons = <>
        FieldName = 'DEPT_NAME'
        Footers = <>
        Title.Caption = #37096#38376#21517#31216
        Width = 68
      end
      item
        EditButtons = <>
        FieldName = 'sales_order'
        Footers = <>
        Title.Caption = #38144#21806#35746#21333
        Width = 75
      end
      item
        EditButtons = <>
        FieldName = 'sales_date'
        Footers = <>
        Title.Caption = #35746#21333#26085#26399
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'ISSUED_QTY'
        Footers = <>
        Title.Caption = #25237#20135#25968#37327
      end
      item
        EditButtons = <>
        FieldName = 'ISSUE_DATE'
        Footers = <>
        Title.Caption = #25237#20135#26085#26399
      end
      item
        EditButtons = <>
        FieldName = 'EMPLOYEE_NAME'
        Footers = <>
        Title.Caption = #25237#20135#20154#21592
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
