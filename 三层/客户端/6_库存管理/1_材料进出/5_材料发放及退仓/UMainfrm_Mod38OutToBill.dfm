inherited frmMain_Mod38OutToBill: TfrmMain_Mod38OutToBill
  Caption = #32534#30721#26448#26009#21457#25918#21040#37197#26009#21333
  ClientHeight = 529
  ClientWidth = 1045
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 1061
  ExplicitHeight = 568
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 1045
    Height = 529
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 1045
    ExplicitHeight = 529
    inherited pnl1: TPanel
      Width = 1043
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 1043
      inherited btnSave: TBitBtn
        OnClick = btnSaveClick
      end
      inherited btnClose: TBitBtn
        OnClick = btnCloseClick
      end
    end
    inherited pnl2: TPanel
      Width = 1043
      Height = 494
      ExplicitLeft = 1
      ExplicitTop = 34
      ExplicitWidth = 1043
      ExplicitHeight = 494
      object pnl3: TPanel
        Left = 1
        Top = 1
        Width = 1041
        Height = 115
        Align = alTop
        TabOrder = 0
        object lbl4: TLabel
          Left = 302
          Top = 60
          Width = 65
          Height = 13
          Caption = #39046#26009#20154#21592#65306
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
        object lbl5: TLabel
          Left = 302
          Top = 9
          Width = 60
          Height = 13
          Caption = #20986#20179#21333#21495#65306
        end
        object lbl6: TLabel
          Left = 326
          Top = 35
          Width = 36
          Height = 13
          Caption = #22791#27880#65306
        end
        object Label1: TLabel
          Left = 35
          Top = 89
          Width = 60
          Height = 13
          Caption = #37197#26009#21333#21495#65306
        end
        object edtWH: TRKeyRzBtnEdit
          Left = 93
          Top = 33
          Width = 121
          Height = 21
          Text = ''
          TabOrder = 0
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
        object edtReqBillNo: TRKeyRzBtnEdit
          Left = 93
          Top = 5
          Width = 121
          Height = 21
          Text = ''
          TabOrder = 1
          ButtonKind = bkFind
          ButtonVisible = False
          AltBtnWidth = 15
          ButtonWidth = 15
          DataSource = ds457
          DataSourceField = 'REF_NUMBER'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object edtOutBillNo: TRKeyRzBtnEdit
          Left = 360
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
          Left = 360
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
          Left = 93
          Top = 60
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
          DisplaytextField = 'Dept_code'
          DisplayRetKeyField = 'rkey'
          DisplayNoteField = 'dept_name'
          DisplayPickID = '1'
          DisplayModID = 38
          ForceOnFocus = True
        end
        object edtReqMan: TRKeyRzBtnEdit
          Left = 360
          Top = 57
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
          Left = 497
          Top = 5
          Width = 97
          Height = 17
          Caption = #20445#23384#21518#25171#21360
          TabOrder = 6
        end
        object edtPBillNo: TEdit
          Left = 93
          Top = 87
          Width = 121
          Height = 21
          TabOrder = 7
          OnChange = edtPBillNoChange
        end
      end
      object pnl4: TPanel
        Left = 1
        Top = 116
        Width = 1041
        Height = 156
        Align = alClient
        TabOrder = 1
        object eh468: TDBGridEh
          Left = 1
          Top = 1
          Width = 1039
          Height = 154
          Align = alClient
          DataSource = ds468
          DynProps = <>
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          PopupMenu = pm468
          ReadOnly = True
          TabOrder = 0
          OnDblClick = eh468DblClick
          OnTitleClick = eh468TitleClick
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'CUT_NO'
              Footers = <>
              Title.Caption = #37197#26009#21333#21495
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'INV_PART_NUMBER'
              Footers = <>
              Title.Caption = #26448#26009#32534#30721
              Width = 91
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'INV_NAME'
              Footers = <>
              Title.Caption = #26448#26009#21517#31216
              Width = 100
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'INV_DESCRIPTION'
              Footers = <>
              Title.Caption = #26448#26009#35268#26684
              Width = 216
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'status'
              Footers = <>
              KeyList.Strings = (
                '0'
                '1')
              PickList.Strings = (
                #26377#25928
                #26080#25928)
              Title.Caption = #29366#24577
              Width = 48
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'QUAN_BOM'
              Footers = <>
              Title.Caption = #37197#39069#25968#37327
              Width = 57
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'quan_alloc'
              Footers = <>
              Title.Caption = #24050#20998#37197#25968#37327
              Width = 63
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'QUAN_ISSUED'
              Footers = <>
              Title.Caption = #24050#21457#25918#25968#37327
              Width = 87
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'UNIT_NAME'
              Footers = <>
              Title.Caption = #37197#39069#21333#20301
              Width = 59
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'quan_on_hand'
              Footers = <>
              Title.Caption = #26377#25928#24211#23384
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'sotck_type'
              Footers = <>
              Title.Caption = #24211#23384#31867#22411
              Width = 58
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'ISSUE_DATE'
              Footers = <>
              Title.Caption = #25237#20135#26085#26399
              Width = 84
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'VENDOR'
              Footers = <>
              Title.Caption = #22791#27880
              Width = 150
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'abbr_name'
              Footers = <>
              Title.Caption = #20379#24212#21830#31616#31216
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object pnl5: TPanel
        Left = 1
        Top = 272
        Width = 1041
        Height = 221
        Align = alBottom
        TabOrder = 2
        object eh207: TDBGridEh
          Left = 1
          Top = 1
          Width = 1039
          Height = 219
          Align = alClient
          DataSource = ds207
          DynProps = <>
          PopupMenu = pm207
          ReadOnly = True
          TabOrder = 0
          OnDblClick = eh207DblClick
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'INV_PART_NUMBER'
              Footers = <>
              Title.Caption = #26448#26009#32534#30721
              Width = 60
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'INV_NAME'
              Footers = <>
              Title.Caption = #26448#26009#21517#31216
              Width = 114
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'INV_DESCRIPTION'
              Footers = <>
              Title.Caption = #26448#26009#35268#26684
              Width = 202
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'rohs'
              Footers = <>
              Title.Caption = #29615#20445#26631#35782
              Width = 65
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'UNIT_NAME'
              Footers = <>
              Title.Caption = #21457#25918#21333#20301
              Width = 58
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'quantity'
              Footers = <>
              Title.Caption = #21457#25918#25968#37327
              Width = 64
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'ABBR_NAME'
              Footers = <>
              Title.Caption = #20379#24212#21830
              Width = 68
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'SUPPLIER2'
              Footers = <>
              Title.Caption = #21407#20379#24212#21830
              Width = 56
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
  end
  object cdstemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 616
    Top = 8
  end
  object cds457: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 608
    Top = 96
  end
  object ds457: TDataSource
    DataSet = cds457
    Left = 656
    Top = 96
  end
  object pm468: TPopupMenu
    OnPopup = pm468Popup
    Left = 392
    Top = 184
    object mniSend: TMenuItem
      Caption = #21457#25918
      OnClick = mniSendClick
    end
    object mniSended: TMenuItem
      Caption = #21457#25918#23436#27605
      OnClick = mniSendedClick
    end
    object mniReSet: TMenuItem
      Caption = #37325#26032#29983#25928
      OnClick = mniReSetClick
    end
    object mniSendToBom: TMenuItem
      Caption = #25353#20998#37197#21457#25918
      OnClick = mniSendToBomClick
    end
    object mniCancelSendToBom: TMenuItem
      Caption = #21462#28040#25353#20998#37197#21457#25918
      OnClick = mniCancelSendToBomClick
    end
  end
  object cdsLookUp17: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select  d17.RKEY as rkey17,  d17.INV_PART_NUMBER,d17.INV_NAME,d1' +
      '7.INV_DESCRIPTION,'#13#10'd22.rohs,d02.UNIT_NAME,d23.ABBR_NAME ,d22.SU' +
      'PPLIER2 '#13#10'from Data0207 d207 '#13#10'inner join data0017 d17 on d207.I' +
      'NVENTORY_PTR=d17.RKEY'#13#10'inner join Data0022 d22 on d207.D0022_PTR' +
      '=d22.rkey'#13#10'inner join Data0002 d02 on d22.LOCATION_PTR_FROM=d02.' +
      'RKEY '#13#10'INNER JOIN dbo.Data0456 d456 ON d22.GRN_PTR = d456.RKEY '#13 +
      #10'inner join Data0023 d23 on d456.SUPP_PTR = d23.RKEY'#13#10'where d207' +
      '.GON_PTR =0 '
    Params = <>
    Left = 184
    Top = 384
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
    Left = 256
    Top = 400
  end
  object ds207: TDataSource
    DataSet = cds207
    Left = 304
    Top = 400
  end
  object ds468: TDataSource
    DataSet = cds468
    Left = 248
    Top = 208
  end
  object cds468: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT TOP 100 PERCENT Data0468.CUT_NO, Data0468.INVENT_PTR, Dat' +
      'a0468.RKEY, '#13#10'      Data0468.STATUS,  Data0017.STOCK_UNIT_PTR, D' +
      'ata0017.INV_PART_NUMBER, '#13#10'     Data0017.INV_NAME, Data0017.INV_' +
      'DESCRIPTION, Data0468.QUAN_BOM, data0023.abbr_name,'#13#10'     Data04' +
      '68.QUAN_ISSUED, Data0002.UNIT_NAME, data0002.UNIT_CODE, data0492' +
      '.ISSUE_DATE,'#13#10'data0017.quan_on_hand-data0017.QUAN_ASSIGN as quan' +
      '_on_hand,data0468.quan_alloc, data0468.VENDOR,'#13#10'data0468.quan_al' +
      'loc as alloc,case data0468.PRINTIT when '#39'N'#39' then '#39'VMI'#24211#23384#39' else '#39#26222 +
      #36890#24211#23384#39' end as sotck_type'#13#10'FROM data0492 INNER JOIN'#13#10'      Data0468' +
      ' ON data0492.CUT_NO = Data0468.CUT_NO INNER JOIN'#13#10'      Data0002' +
      ' INNER JOIN'#13#10'      Data0017 ON Data0002.RKEY = Data0017.STOCK_UN' +
      'IT_PTR ON '#13#10'      Data0468.INVENT_PTR = Data0017.RKEY left join ' +
      'data0023'#13#10'on data0468.supplier_ptr=data0023.rkey'#13#10'WHERE (Data046' +
      '8.DEPT_PTR = :rkey34) AND '#13#10'               (data0492.WHOUSE_PTR ' +
      '= :wh_ptr) And'#13#10'              (Data0468.STATUS = 0) AND '#13#10'      ' +
      '        (data0492.Con_Flag = 2) and'#13#10'              (data0468.inv' +
      'ent_or=0)'#13#10'order by Data0468.CUT_NO'
    Filtered = True
    Params = <
      item
        DataType = ftUnknown
        Name = 'rkey34'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'wh_ptr'
        ParamType = ptUnknown
      end>
    Left = 208
    Top = 208
  end
  object pm207: TPopupMenu
    Left = 424
    Top = 384
    object mniDel2: TMenuItem
      Caption = #21024#38500
      OnClick = mniDel2Click
    end
  end
  object qry1: TADOQuery
    ConnectionString = 
      'FILE NAME=C:\Program Files\Common Files\System\Ole DB\Data Links' +
      '\8.112.udl'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select  d17.RKEY as rkey17,  d17.INV_PART_NUMBER,d17.INV_NAME,d1' +
        '7.INV_PART_DESCRIPTION,'
      
        'd22.rohs,d02.UNIT_NAME,d23.ABBR_NAME ,d22.SUPPLIER2 ,d207.quanti' +
        'ty'
      'from Data0207 d207 '
      'inner join data0017 d17 on d207.INVENTORY_PTR=d17.RKEY'
      'inner join Data0022 d22 on d207.D0022_PTR=d22.rkey'
      'inner join Data0002 d02 on d22.LOCATION_PTR_FROM=d02.RKEY '
      'INNER JOIN dbo.Data0456 d456 ON d22.GRN_PTR = d456.RKEY '
      'inner join Data0023 d23 on d456.SUPP_PTR = d23.RKEY'
      'where d207.GON_PTR =0 ')
    Left = 112
    Top = 448
    object atncfldqry1rkey17: TAutoIncField
      FieldName = 'rkey17'
      ReadOnly = True
    end
    object strngfldqry1INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object strngfldqry1INV_NAME: TStringField
      FieldName = 'INV_NAME'
      Size = 30
    end
    object strngfldqry1INV_PART_DESCRIPTION: TStringField
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object strngfldqry1rohs: TStringField
      FieldName = 'rohs'
      Size = 10
    end
    object strngfldqry1UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object strngfldqry1ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object strngfldqry1SUPPLIER2: TStringField
      FieldName = 'SUPPLIER2'
      Size = 30
    end
    object qry1quantity: TBCDField
      FieldName = 'quantity'
      Precision = 19
    end
  end
  object frxrprt1: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42698.413274062500000000
    ReportOptions.LastChange = 42698.413274062500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 752
    Top = 64
    Datasets = <>
    Variables = <>
    Style = <>
  end
end
