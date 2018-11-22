inherited frmMain_Mod38OtherMtlOutToDept: TfrmMain_Mod38OtherMtlOutToDept
  Caption = #26434#29289#26448#26009#21457#25918#21040#37096#38376
  ClientHeight = 459
  ClientWidth = 898
  OnClose = FormClose
  ExplicitWidth = 914
  ExplicitHeight = 498
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 898
    Height = 459
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 898
    ExplicitHeight = 459
    inherited pnl1: TPanel
      Width = 896
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 896
      inherited btnSave: TBitBtn
        OnClick = btnSaveClick
        ExplicitLeft = -5
        ExplicitTop = 5
      end
      inherited btnClose: TBitBtn
        OnClick = btnCloseClick
      end
    end
    inherited pnl2: TPanel
      Width = 896
      Height = 424
      ExplicitLeft = 1
      ExplicitTop = 34
      ExplicitWidth = 896
      ExplicitHeight = 424
      object pnl5: TPanel
        Left = 1
        Top = 1
        Width = 894
        Height = 117
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
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
          Width = 65
          Height = 13
          Caption = #20986#20179#21333#21495#65306
        end
        object lbl6: TLabel
          Left = 292
          Top = 35
          Width = 39
          Height = 13
          Caption = #22791#27880#65306
        end
        object edtReqBillNo: TRKeyRzBtnEdit
          Left = 94
          Top = 4
          Width = 119
          Height = 21
          Text = ''
          TabOrder = 0
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
          Left = 94
          Top = 31
          Width = 121
          Height = 21
          Text = ''
          TabOrder = 1
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
        object edtOutBillNo: TRKeyRzBtnEdit
          Left = 328
          Top = 6
          Width = 121
          Height = 21
          Text = ''
          Color = clBtnFace
          Enabled = False
          TabOrder = 2
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
          Left = 328
          Top = 33
          Width = 369
          Height = 21
          Text = ''
          TabOrder = 3
          ButtonKind = bkFind
          ButtonVisible = False
          AltBtnWidth = 15
          ButtonWidth = 15
          DataSource = ds457
          DataSourceField = 'Cut_NO'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object edtDept: TRKeyRzBtnEdit
          Left = 94
          Top = 58
          Width = 121
          Height = 21
          Text = ''
          TabOrder = 4
          OnExit = edtDeptExit
          ButtonKind = bkFind
          AltBtnWidth = 15
          ButtonWidth = 15
          OnButtonClick = edtDeptButtonClick
          DataSource = ds457
          DataSourceField = 'dept_ptr'
          DispalyTableName = 'data0034'
          DisplaytextField = 'dept_code'
          DisplayRetKeyField = 'rkey'
          DisplayNoteField = 'dept_name'
          DisplayPickID = '1'
          DisplayModID = 38
          ForceOnFocus = True
        end
        object edtReqMan: TRKeyRzBtnEdit
          Left = 94
          Top = 85
          Width = 121
          Height = 21
          Text = ''
          TabOrder = 5
          OnExit = edtReqManExit
          ButtonKind = bkFind
          AltBtnWidth = 15
          ButtonWidth = 15
          OnButtonClick = edtReqManButtonClick
          DataSource = ds457
          DataSourceField = 'Recd_By'
          DispalyTableName = 'data0005'
          DisplaytextField = 'empl_code'
          DisplayRetKeyField = 'rkey'
          DisplayNoteField = 'employee_name'
          DisplayPickID = '2'
          DisplayModID = 38
          ForceOnFocus = True
        end
      end
      object pnl3: TPanel
        Left = 1
        Top = 118
        Width = 894
        Height = 305
        Align = alClient
        TabOrder = 1
        object eh208: TDBGridEh
          Left = 1
          Top = 1
          Width = 892
          Height = 303
          Align = alClient
          DataSource = ds208
          DynProps = <>
          PopupMenu = pm208
          ReadOnly = True
          TabOrder = 0
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'goods_name'
              Footers = <>
              Title.Caption = #26448#26009#21517#31216
              Width = 145
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'goods_guige'
              Footers = <>
              Title.Caption = #26448#26009#35268#26684
              Width = 238
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'goods_type'
              Footers = <>
              Title.Caption = #31867#22411
              Width = 96
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'rohs'
              Footers = <>
              Title.Caption = #29615#20445#26631#35782
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'UNIT_NAME'
              Footers = <>
              Title.Caption = #21457#25918#21333#20301
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'QUANTITY'
              Footers = <>
              Title.Caption = #21457#25918#25968#37327
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object chkPrt: TCheckBox
        Left = 512
        Top = 6
        Width = 97
        Height = 17
        Caption = #20445#23384#21518#25171#21360
        TabOrder = 2
      end
    end
  end
  object ds457: TDataSource
    DataSet = cds457
    Left = 656
    Top = 104
  end
  object ds208: TDataSource
    DataSet = cds208
    Left = 216
    Top = 296
  end
  object cds457: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 616
    Top = 104
  end
  object cds208: TClientDataSet
    Aggregates = <>
    CommandText = 
      ' select  b.goods_name ,b.goods_guige  ,b.goods_type  , b.rohs   ' +
      ','#13#10' c.UNIT_NAME ,a.QUANTITY '#13#10' from data0208  a'#13#10' inner join Dat' +
      'a0235 b  on a.SOURCE_PTR=b.RKEY'#13#10' inner join Data0002 c on b.uni' +
      't_ptr=c.rkey'#13#10' where a.rkey=0'
    Params = <>
    Left = 176
    Top = 296
  end
  object pm208: TPopupMenu
    Left = 544
    Top = 200
    object mniAdd: TMenuItem
      Caption = #26032#22686
      OnClick = mniAddClick
    end
    object mniDel: TMenuItem
      Caption = #21024#38500
      OnClick = mniDelClick
    end
  end
  object cdsLookUp235: TClientDataSet
    Aggregates = <>
    CommandText = 
      ' select b.rkey , b.goods_name ,b.goods_guige   ,  '#13#10'   b.goods_t' +
      'ype  , b.rohs   ,    '#13#10'  c.UNIT_NAME   '#13#10'  from data0208  a     ' +
      '          '#13#10'  inner join Data0235 b  on a.SOURCE_PTR=b.RKEY '#13#10'  ' +
      'inner join Data0002 c on b.unit_ptr=c.rkey '#13#10'  where a.rkey=0'
    Params = <>
    Left = 176
    Top = 224
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
    Left = 712
    Top = 48
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
      
        ' select  a,source, b.goods_name ,b.goods_guige  ,b.goods_type  ,' +
        ' b.rohs   ,'
      ' c.UNIT_NAME ,a.QUANTITY '
      ' from data0208  a'
      ' inner join Data0235 b  on a.SOURCE_PTR=b.RKEY'
      ' inner join Data0002 c on b.unit_ptr=c.rkey'
      ' where a.rkey=0')
    Left = 96
    Top = 296
    object qry1goods_name: TStringField
      FieldName = 'goods_name'
      Size = 60
    end
    object qry1goods_guige: TStringField
      FieldName = 'goods_guige'
      Size = 200
    end
    object qry1goods_type: TStringField
      FieldName = 'goods_type'
    end
    object qry1rohs: TStringField
      FieldName = 'rohs'
      Size = 10
    end
    object qry1UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object qry1QUANTITY: TFloatField
      FieldName = 'QUANTITY'
    end
  end
end
