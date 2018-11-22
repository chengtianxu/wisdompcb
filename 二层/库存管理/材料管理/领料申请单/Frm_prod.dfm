object Prod_frm: TProd_frm
  Left = 303
  Top = 133
  BorderStyle = bsSingle
  Caption = #36873#25321#37197#26009#21333#21495
  ClientHeight = 507
  ClientWidth = 700
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
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
    Width = 700
    Height = 39
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 22
      Top = 11
      Width = 62
      Height = 13
      AutoSize = False
      Caption = #37197#26009#21333#21495
    end
    object Edit1: TEdit
      Left = 90
      Top = 6
      Width = 129
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
    object GroupBox2: TGroupBox
      Left = 378
      Top = 1
      Width = 260
      Height = 36
      Caption = #25237#20135#26085#26399
      TabOrder = 1
      object Label2: TLabel
        Left = 11
        Top = 16
        Width = 20
        Height = 13
        Alignment = taRightJustify
        Caption = #20174':'
      end
      object Label3: TLabel
        Left = 137
        Top = 17
        Width = 20
        Height = 13
        Alignment = taRightJustify
        Caption = #21040':'
      end
      object DateTimePicker1: TDateTimePicker
        Left = 32
        Top = 12
        Width = 94
        Height = 21
        Date = 37566.000000000000000000
        Time = 37566.000000000000000000
        TabOrder = 0
        OnExit = DateTimePicker1Exit
      end
      object DateTimePicker2: TDateTimePicker
        Left = 157
        Top = 12
        Width = 97
        Height = 21
        Date = 37566.000000000000000000
        Time = 37566.000000000000000000
        TabOrder = 1
        OnExit = DateTimePicker1Exit
      end
    end
  end
  object Grd1: TDBGridEh
    Left = 0
    Top = 39
    Width = 700
    Height = 423
    Align = alTop
    DataSource = DataSource1
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
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
        Title.Caption = #37197#26009#21333#21495
        Width = 79
      end
      item
        EditButtons = <>
        FieldName = 'SO_NO'
        Footers = <>
        Title.Caption = #38144#21806#35746#21333#21495
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_NUMBER'
        Footers = <>
        Title.Caption = #26412#21378#32534#21495
        Width = 95
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_DESC'
        Footers = <>
        Title.Caption = #23458#25143#22411#21495
        Width = 104
      end
      item
        EditButtons = <>
        FieldName = 'ISSUE_DATE'
        Footers = <>
        Title.Caption = #25237#20135#26085#26399
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = #25237#20135#31867#22411
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'ISSUED_QTY'
        Footers = <>
        Title.Caption = #25237#20135#25968#37327
        Width = 57
      end
      item
        EditButtons = <>
        FieldName = 'A'#26495#22359#25968
        Footers = <>
        Width = 52
      end
      item
        EditButtons = <>
        FieldName = 'B'#26495#22359#25968
        Footers = <>
        Width = 52
      end>
  end
  object BitBtn1: TBitBtn
    Left = 216
    Top = 473
    Width = 75
    Height = 25
    Caption = #30830#23450
    Default = True
    ModalResult = 1
    TabOrder = 2
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
  object BitBtn2: TBitBtn
    Left = 375
    Top = 473
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 3
    Kind = bkClose
  end
  object ADO492: TADOQuery
    Connection = DM.ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.data0492.CUT_NO, dbo.data0492.SO_NO, dbo.Data0025' +
        '.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC, '
      
        'data0492.ISSUE_DATE,case data0492.TTYPE when 0 then '#39#27491#24120#25237#20135#39' when ' +
        '1 then '#39#34917#26009#25237#20135#39
      
        'when 2 then '#39'MRB'#37325#25237#39' when 3 then '#39'MRB'#36820#20462#39' when 4 then '#39#25353#26009#21495#25237#20135#39' end ' +
        #25237#20135#31867#22411','
      'dbo.data0492.ISSUED_QTY, '
      
        '                      dbo.data0492.PANEL_1_QTY  as A'#26495#22359#25968', dbo.dat' +
        'a0492.PANEL_2_QTY as B'#26495#22359#25968
      'FROM         dbo.data0492 INNER JOIN'
      
        '                      dbo.Data0025 ON dbo.data0492.BOM_PTR = dbo' +
        '.Data0025.RKEY'
      'WHERE     (dbo.data0492.TSTATUS IN (0, 2)) AND '
      'data0492.TTYPE <>3 and'
      
        '(dbo.data0492.ISSUE_DATE >= :dtpk1) AND (dbo.data0492.ISSUE_DATE' +
        ' <= :dtpk2)')
    Left = 264
    Top = 232
    object ADO492CUT_NO: TStringField
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object ADO492SO_NO: TStringField
      FieldName = 'SO_NO'
      FixedChar = True
      Size = 12
    end
    object ADO492MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADO492MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ADO492ISSUE_DATE: TDateTimeField
      FieldName = 'ISSUE_DATE'
    end
    object ADO492DSDesigner: TStringField
      FieldName = #25237#20135#31867#22411
      ReadOnly = True
      Size = 10
    end
    object ADO492ISSUED_QTY: TIntegerField
      FieldName = 'ISSUED_QTY'
    end
    object ADO492A: TIntegerField
      FieldName = 'A'#26495#22359#25968
    end
    object ADO492B: TIntegerField
      FieldName = 'B'#26495#22359#25968
    end
  end
  object DataSource1: TDataSource
    DataSet = ADO492
    OnDataChange = DataSource1DataChange
    Left = 296
    Top = 232
  end
end
