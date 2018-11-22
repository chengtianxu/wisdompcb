inherited frmMain_Mod38OutToDept: TfrmMain_Mod38OutToDept
  Caption = #32534#30721#26448#26009#21457#25918#21040#37096#38376
  ClientHeight = 486
  ClientWidth = 740
  Position = poMainFormCenter
  OnClose = FormClose
  ExplicitWidth = 756
  ExplicitHeight = 525
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 740
    Height = 486
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 740
    ExplicitHeight = 486
    inherited pnl1: TPanel
      Width = 738
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 738
      inherited btnSave: TBitBtn
        OnClick = btnSaveClick
      end
      inherited btnClose: TBitBtn
        OnClick = btnCloseClick
      end
    end
    inherited pnl2: TPanel
      Width = 738
      Height = 451
      ExplicitLeft = 1
      ExplicitTop = 34
      ExplicitWidth = 738
      ExplicitHeight = 451
      object pnl4: TPanel
        Left = 1
        Top = 1
        Width = 736
        Height = 128
        Align = alTop
        TabOrder = 0
        object lbl1: TLabel
          Left = 23
          Top = 8
          Width = 65
          Height = 13
          Caption = #39046#26009#21333#21495#65306
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl2: TLabel
          Left = 59
          Top = 36
          Width = 39
          Height = 13
          Caption = #24037#21378#65306
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl3: TLabel
          Left = 35
          Top = 63
          Width = 65
          Height = 13
          Caption = #39046#26009#37096#38376#65306
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl4: TLabel
          Left = 35
          Top = 91
          Width = 60
          Height = 13
          Caption = #39046#26009#20154#21592#65306
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbl5: TLabel
          Left = 268
          Top = 9
          Width = 60
          Height = 13
          Caption = #20986#20179#21333#21495#65306
        end
        object lbl6: TLabel
          Left = 292
          Top = 35
          Width = 36
          Height = 13
          Caption = #22791#27880#65306
        end
        object edtDept: TRKeyRzBtnEdit
          Left = 94
          Top = 59
          Width = 121
          Height = 21
          Text = ''
          TabOrder = 0
          OnExit = edtDeptExit
          ButtonKind = bkFind
          AltBtnWidth = 15
          ButtonWidth = 15
          OnButtonClick = edtDeptButtonClick
          DataSource = ds457
          DataSourceField = 'dept_ptr'
          DispalyTableName = 'data0034'
          DisplaytextField = 'Dept_code'
          DisplayRetKeyField = 'rkey'
          DisplayNoteField = 'dept_name'
          DisplayPickID = '1'
          DisplayModID = 38
          ForceOnFocus = True
        end
        object edtReqMan: TRKeyRzBtnEdit
          Left = 94
          Top = 86
          Width = 121
          Height = 21
          Text = ''
          TabOrder = 1
          OnExit = edtReqManExit
          ButtonKind = bkFind
          AltBtnWidth = 15
          ButtonWidth = 15
          OnButtonClick = edtReqManButtonClick
          DataSource = ds457
          DataSourceField = 'RECD_BY'
          DispalyTableName = 'data0005'
          DisplaytextField = 'empl_code'
          DisplayRetKeyField = 'rkey'
          DisplayNoteField = 'employee_name'
          DisplayPickID = '2'
          DisplayModID = 38
          ForceOnFocus = True
        end
        object chkPrt: TCheckBox
          Left = 472
          Top = 6
          Width = 97
          Height = 17
          Caption = #20445#23384#21518#25171#21360
          TabOrder = 2
        end
        object edtOutBillNo: TRKeyRzBtnEdit
          Left = 326
          Top = 6
          Width = 121
          Height = 21
          Text = ''
          Color = clBtnFace
          Enabled = False
          TabOrder = 3
          ButtonKind = bkFind
          ButtonVisible = False
          AltBtnWidth = 15
          ButtonWidth = 15
          DataSource = ds457
          DataSourceField = 'GON_NUMBER'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object edtRemark: TRKeyRzBtnEdit
          Left = 326
          Top = 33
          Width = 369
          Height = 21
          Text = ''
          TabOrder = 4
          ButtonKind = bkFind
          ButtonVisible = False
          AltBtnWidth = 15
          ButtonWidth = 15
          DataSource = ds457
          DataSourceField = 'Cut_NO'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object edtReqBillNo: TRKeyRzBtnEdit
          Left = 95
          Top = 5
          Width = 121
          Height = 21
          Text = ''
          TabOrder = 5
          ButtonKind = bkFind
          ButtonVisible = False
          AltBtnWidth = 15
          ButtonWidth = 15
          DataSource = ds457
          DataSourceField = 'REF_NUMBER'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object edtWH: TRKeyRzBtnEdit
          Left = 95
          Top = 32
          Width = 121
          Height = 21
          Text = ''
          TabOrder = 6
          OnExit = edtWHExit
          ButtonKind = bkFind
          AltBtnWidth = 15
          ButtonWidth = 15
          OnButtonClick = edtWHButtonClick
          DataSource = ds457
          DataSourceField = 'warehouse_ptr'
          DispalyTableName = 'data0015'
          DisplaytextField = 'warehouse_code'
          DisplayRetKeyField = 'rkey'
          DisplayNoteField = 'abbr_name'
          DisplayPickID = '0'
          DisplayModID = 38
          ForceOnFocus = True
        end
      end
      object Panel1: TPanel
        Left = 1
        Top = 129
        Width = 736
        Height = 321
        Align = alClient
        TabOrder = 1
        object eh207: TDBGridEh
          Left = 1
          Top = 1
          Width = 734
          Height = 319
          Align = alClient
          DataSource = ds207
          DynProps = <>
          PopupMenu = pm207
          ReadOnly = True
          TabOrder = 0
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'INV_PART_NUMBER'
              Footers = <>
              Title.Caption = #29289#26009#32534#30721
              Width = 93
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'INV_NAME'
              Footers = <>
              Title.Caption = #29289#26009#21517#31216
              Width = 102
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'INV_DESCRIPTION'
              Footers = <>
              Title.Caption = #29289#26009#35268#26684
              Width = 264
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'rohs'
              Footers = <>
              Title.Caption = #29615#20445#26631#35782
              Width = 69
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'UNIT_NAME'
              Footers = <>
              Title.Caption = #21457#25918#21333#20301
              Width = 80
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'QUANTITY'
              Footers = <>
              Title.Caption = #21457#25918#25968#37327
              Width = 77
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
  end
  object ds457: TDataSource
    DataSet = cds457
    Left = 656
    Top = 104
  end
  object ds207: TDataSource
    DataSet = cds207
    Left = 328
    Top = 264
  end
  object cds457: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 616
    Top = 104
  end
  object cds207: TClientDataSet
    Aggregates = <>
    CommandText = 
      ' select d.INV_PART_NUMBER as '#26448#26009#32534#30721',d.INV_NAME as '#26448#26009#21517#31216' ,d.INV_PART' +
      '_DESCRIPTION as '#26448#26009#35268#26684', b.rohs as '#29615#20445#26631#35782'  ,'#13#10' c.UNIT_NAME as '#21457#25918#21333#20301',a.' +
      'QUANTITY as '#21457#25918#25968#37327#13#10' from data0207  a'#13#10' inner join Data0022 b  on ' +
      'a.D0022_PTR=b.RKEY'#13#10' inner join data0017 d  on a.INVENTORY_PTR=d' +
      '.RKEY'#13#10'  inner join Data0002 c on  d.STOCK_UNIT_PTR=c.rkey'#13#10' whe' +
      're a.rkey=0'
    Params = <>
    Left = 288
    Top = 264
  end
  object pm207: TPopupMenu
    Left = 472
    Top = 208
    object mniAdd: TMenuItem
      Caption = #26032#22686
      OnClick = mniAddClick
    end
    object mniDel: TMenuItem
      Caption = #21024#38500
      OnClick = mniDelClick
    end
  end
  object cdsLookUp17: TClientDataSet
    Aggregates = <>
    CommandText = 
      ' select  d17.rkey , d17.INV_PART_NUMBER,d17.INV_NAME,d17.INV_PAR' +
      'T_DESCRIPTION,d02.UNIT_NAME,d22.rohs'#13#10' from Data0207 d207 '#13#10' inn' +
      'er join data0017 d17 on d207.INVENTORY_PTR=d17.RKEY'#13#10' inner join' +
      ' Data0002 d02 on d17.STOCK_UNIT_PTR=d02.RKEY'#13#10' inner join DATA00' +
      '22 d22  on d207.D0022_PTR=d22.RKEY'#13#10' where d207.RKEY=0'
    Params = <>
    Left = 96
    Top = 200
  end
  object cdstemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 648
    Top = 16
  end
  object frxrprt1: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42677.473382002320000000
    ReportOptions.LastChange = 42677.473382002320000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 488
    Top = 104
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object qry1: TADOQuery
    ConnectionString = 
      'FILE NAME=C:\Program Files\Common Files\System\Ole DB\Data Links' +
      '\8.112.udl'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        '  select  a.INVENTORY_PTR,a.DEPT_PTR,    d.INV_PART_NUMBER   ,d.' +
        'INV_NAME   ,d.INV_DESCRIPTION  , b.rohs  ,'
      ' c.UNIT_NAME ,a.QUANTITY  '
      ' from data0207  a'
      ' inner join Data0022 b  on a.D0022_PTR=b.RKEY'
      ' inner join data0017 d  on a.INVENTORY_PTR=d.RKEY'
      '  inner join Data0002 c on  d.STOCK_UNIT_PTR=c.rkey'
      ' where a.rkey=0')
    Left = 160
    Top = 256
    object qry1INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object qry1INV_NAME: TStringField
      FieldName = 'INV_NAME'
      Size = 30
    end
    object qry1rohs: TStringField
      FieldName = 'rohs'
      Size = 10
    end
    object qry1UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object qry1QUANTITY: TBCDField
      FieldName = 'QUANTITY'
      Precision = 19
    end
    object qry1INVENTORY_PTR: TIntegerField
      FieldName = 'INVENTORY_PTR'
    end
    object qry1DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object qry1INV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
  end
end
