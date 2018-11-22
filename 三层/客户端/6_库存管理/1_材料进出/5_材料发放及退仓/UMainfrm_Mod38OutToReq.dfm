inherited frmMain_Mod38OutToReq: TfrmMain_Mod38OutToReq
  Caption = #32534#30721#26448#26009#21457#25918#21040#39046#26009#21333
  ClientHeight = 514
  ClientWidth = 1010
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 1026
  ExplicitHeight = 553
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 1010
    Height = 514
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 1010
    ExplicitHeight = 514
    inherited pnl1: TPanel
      Width = 1008
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 1008
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
      Width = 1008
      Height = 479
      ExplicitLeft = 1
      ExplicitTop = 34
      ExplicitWidth = 1008
      ExplicitHeight = 479
      object pnl3: TPanel
        Left = 1
        Top = 1
        Width = 1006
        Height = 96
        Align = alTop
        TabOrder = 0
        object lbl4: TLabel
          Left = 298
          Top = 64
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
        object lbl3: TLabel
          Left = 21
          Top = 63
          Width = 60
          Height = 13
          Caption = #39046#26009#37096#38376#65306
        end
        object lbl2: TLabel
          Left = 45
          Top = 36
          Width = 36
          Height = 13
          Caption = #24037#21378#65306
        end
        object lbl1: TLabel
          Left = 16
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
          Left = 297
          Top = 9
          Width = 60
          Height = 13
          Caption = #20986#20179#21333#21495#65306
        end
        object lbl6: TLabel
          Left = 321
          Top = 35
          Width = 36
          Height = 13
          Caption = #22791#27880#65306
        end
        object lbl7: TLabel
          Left = 200
          Top = 8
          Width = 3
          Height = 13
        end
        object edtWH: TRKeyRzBtnEdit
          Left = 79
          Top = 33
          Width = 121
          Height = 21
          Text = ''
          Color = clBtnFace
          Enabled = False
          TabOrder = 0
          ButtonKind = bkFind
          ButtonVisible = False
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
          Left = 78
          Top = 5
          Width = 122
          Height = 21
          Text = ''
          OEMConvert = True
          TabOrder = 1
          OnExit = edtReqBillNoExit
          ButtonKind = bkFind
          AltBtnWidth = 15
          ButtonWidth = 15
          OnButtonClick = edtReqBillNoButtonClick
          DataSource = ds457
          DataSourceField = 'REF_NUMBER'
          DisplaytextField = 'number'
          DisplayRetKeyField = 'rkey'
          DisplayPickID = '4'
          DisplayModID = 38
          ForceOnFocus = True
        end
        object edtOutBillNo: TRKeyRzBtnEdit
          Left = 353
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
          Left = 353
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
          Left = 79
          Top = 60
          Width = 121
          Height = 21
          Text = ''
          Color = clBtnFace
          Enabled = False
          TabOrder = 4
          ButtonKind = bkFind
          ButtonVisible = False
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
          Left = 353
          Top = 60
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
          Left = 480
          Top = 5
          Width = 97
          Height = 17
          Caption = #20445#23384#21518#25171#21360
          TabOrder = 6
        end
        object chkClose: TCheckBox
          Left = 583
          Top = 5
          Width = 139
          Height = 17
          Caption = #21457#25918#21518#20851#38381#30003#35831#21333
          TabOrder = 7
        end
        object btnAutoSend: TButton
          Left = 647
          Top = 65
          Width = 75
          Height = 25
          Caption = #33258#21160#21457#25918
          TabOrder = 8
          OnClick = btnAutoSendClick
        end
        object btnGoClose: TButton
          Left = 206
          Top = 4
          Width = 74
          Height = 23
          Caption = #30452#25509#20851#38381
          TabOrder = 9
          OnClick = btnGoCloseClick
        end
      end
      object pnl4: TPanel
        Left = 1
        Top = 97
        Width = 1006
        Height = 203
        Align = alClient
        TabOrder = 1
        object eh468: TDBGridEh
          Left = 1
          Top = 1
          Width = 1004
          Height = 201
          Align = alClient
          DataSource = ds468
          DynProps = <>
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          PopupMenu = pm468
          ReadOnly = True
          TabOrder = 0
          OnDblClick = eh468DblClick
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'INV_PART_NUMBER'
              Footers = <>
              Title.Caption = #26448#26009#32534#30721
              Width = 105
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'INV_NAME'
              Footers = <>
              Title.Caption = #26448#26009#21517#31216
              Width = 141
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'INV_DESCRIPTION'
              Footers = <>
              Title.Caption = #26448#26009#35268#26684
              Width = 257
            end
            item
              DblClickNextVal = True
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
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'QUAN_BOM'
              Footers = <>
              Title.Caption = #30003#35831#25968#37327
              Width = 65
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'quan_alloc'
              Footers = <>
              Title.Caption = #24050#20998#37197#25968#37327
              Width = 67
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'QUAN_ISSUED'
              Footers = <>
              Title.Caption = #21457#25918#25968#37327
              Width = 64
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'UNIT_NAME'
              Footers = <>
              Title.Caption = #24211#23384#21333#20301
              Width = 63
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'sotck_type'
              Footers = <>
              Title.Caption = #24211#23384#31867#22411
              Width = 59
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'quan_on_hand'
              Footers = <>
              Title.Caption = #26377#25928#24211#23384
              Width = 57
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'VENDOR'
              Footers = <>
              Title.Caption = #20379#24212#21830
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object pnl5: TPanel
        Left = 1
        Top = 300
        Width = 1006
        Height = 178
        Align = alBottom
        TabOrder = 2
        object eh207: TDBGridEh
          Left = 1
          Top = 1
          Width = 1004
          Height = 176
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
              Title.Caption = #26448#26009#32534#30721
              Width = 94
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'INV_NAME'
              Footers = <>
              Title.Caption = #26448#26009#21517#31216
              Width = 134
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'INV_DESCRIPTION'
              Footers = <>
              Title.Caption = #26448#26009#35268#26684
              Width = 247
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'rohs'
              Footers = <>
              Title.Caption = #29615#20445#26631#35782
              Width = 63
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'UNIT_NAME'
              Footers = <>
              Title.Caption = #21457#25918#21333#20301
              Width = 62
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'QUANTITY'
              Footers = <>
              Title.Caption = #21457#25918#25968#37327
              Width = 62
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'ABBR_NAME'
              Footers = <>
              Title.Caption = #20379#24212#21830
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'SUPPLIER2'
              Footers = <>
              Title.Caption = #21407#20379#24212#21830
              Width = 68
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
    Left = 723
    Top = 8
  end
  object cds457: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 731
    Top = 72
  end
  object ds457: TDataSource
    DataSet = cds457
    Left = 763
    Top = 104
  end
  object pm468: TPopupMenu
    OnPopup = pm468Popup
    Left = 448
    Top = 160
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
    object mniReBackReq: TMenuItem
      Caption = #36864#22238#39046#26009#30003#35831#21333
      OnClick = mniReBackReqClick
    end
    object mniPrt: TMenuItem
      Caption = #23548#20986#39046#26009#26126#32454
      OnClick = mniPrtClick
    end
  end
  object qry1: TADOQuery
    ConnectionString = 
      'FILE NAME=C:\Program Files\Common Files\System\Ole DB\Data Links' +
      '\8.112.udl'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select   d17.INV_PART_NUMBER   ,d17.INV_NAME    ,d17.INV_PART_DE' +
        'SCRIPTION   ,'
      
        'd22.rohs  ,d02.UNIT_NAME  ,d207.QUANTITY ,d23.ABBR_NAME , d22.SU' +
        'PPLIER2   '
      'from Data0207 d207 '
      'inner join data0017 d17 on d207.INVENTORY_PTR=d17.RKEY'
      'inner join Data0022 d22 on d207.D0022_PTR=d22.rkey'
      'inner join Data0002 d02 on d22.LOCATION_PTR_FROM=d02.RKEY '
      'INNER JOIN dbo.Data0456 d456 ON d22.GRN_PTR = d456.RKEY '
      'inner join Data0023 d23 on d456.SUPP_PTR = d23.RKEY'
      'where d207.GON_PTR =0 ')
    Left = 272
    Top = 432
    object qry1INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object qry1INV_NAME: TStringField
      FieldName = 'INV_NAME'
      Size = 30
    end
    object qry1INV_PART_DESCRIPTION: TStringField
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
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
    object qry1ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object qry1SUPPLIER2: TStringField
      FieldName = 'SUPPLIER2'
      Size = 30
    end
  end
  object cdsLookUp17: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select  d17.RKEY as rkey17,  d17.INV_PART_NUMBER,d17.INV_NAME,d1' +
      '7.INV_PART_DESCRIPTION,'#13#10'd22.rohs,d02.UNIT_NAME,d23.ABBR_NAME ,d' +
      '22.SUPPLIER2 '#13#10'from Data0207 d207 '#13#10'inner join data0017 d17 on d' +
      '207.INVENTORY_PTR=d17.RKEY'#13#10'inner join Data0022 d22 on d207.D002' +
      '2_PTR=d22.rkey'#13#10'inner join Data0002 d02 on d22.LOCATION_PTR_FROM' +
      '=d02.RKEY '#13#10'INNER JOIN dbo.Data0456 d456 ON d22.GRN_PTR = d456.R' +
      'KEY '#13#10'inner join Data0023 d23 on d456.SUPP_PTR = d23.RKEY'#13#10'where' +
      ' d207.GON_PTR =0 '
    Params = <>
    Left = 336
    Top = 376
  end
  object cds207: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select   d17.INV_PART_NUMBER   ,d17.INV_NAME    ,d17.INV_PART_DE' +
      'SCRIPTION   ,'#13#10'd22.rohs  ,d02.UNIT_NAME  ,d207.QUANTITY ,d23.ABB' +
      'R_NAME , d22.SUPPLIER2   '#13#10'from Data0207 d207 '#13#10'inner join data0' +
      '017 d17 on d207.INVENTORY_PTR=d17.RKEY'#13#10'inner join Data0022 d22 ' +
      'on d207.D0022_PTR=d22.rkey'#13#10'inner join Data0002 d02 on d22.LOCAT' +
      'ION_PTR_FROM=d02.RKEY '#13#10'INNER JOIN dbo.Data0456 d456 ON d22.GRN_' +
      'PTR = d456.RKEY '#13#10'inner join Data0023 d23 on d456.SUPP_PTR = d23' +
      '.RKEY'#13#10'where d207.GON_PTR =0 '
    Params = <>
    Left = 451
    Top = 376
  end
  object ds207: TDataSource
    DataSet = cds207
    Left = 523
    Top = 371
  end
  object ds468: TDataSource
    DataSet = cds468
    Left = 208
    Top = 200
  end
  object cds468: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT TOP 100 PERCENT Data0268.number, Data0468.INVENT_PTR, Dat' +
      'a0468.RKEY, '#13#10'case when  Data0468.STATUS=1 then '#39#26377#25928#39' else '#39#26080#25928#39' e' +
      'nd as type , Data0468.STATUS,Data0017.STOCK_UNIT_PTR, Data0017.I' +
      'NV_PART_NUMBER, '#13#10'Data0017.INV_NAME, Data0017.INV_DESCRIPTION, D' +
      'ata0468.QUAN_BOM, '#13#10'Data0468.QUAN_ISSUED, Data0002.UNIT_NAME, da' +
      'ta0002.UNIT_CODE, data0468.VENDOR, '#13#10'data0017.quan_on_hand-data0' +
      '017.QUAN_ASSIGN as quan_on_hand,data0468.quan_alloc,'#13#10'data0468.q' +
      'uan_alloc as alloc,case data0468.PRINTIT when '#39'N'#39' then '#39'VMI'#24211#23384#39' e' +
      'lse '#39#26222#36890#24211#23384#39' end as sotck_type'#13#10'FROM data0268 INNER JOIN'#13#10'Data0468' +
      ' ON data0268.rkey = Data0468.flow_no INNER JOIN'#13#10'Data0002 INNER ' +
      'JOIN'#13#10'Data0017 ON Data0002.RKEY = Data0017.STOCK_UNIT_PTR ON '#13#10'D' +
      'ata0468.INVENT_PTR = Data0017.RKEY'#13#10'WHERE (Data0468.flow_no =-1)' +
      ' AND'#13#10'(Data0468.STATUS = 0) AND'#13#10'(data0268.status = 2) and'#13#10'(dat' +
      'a0468.invent_or=0)'#13#10'order by Data0268.number'
    Params = <>
    Left = 168
    Top = 200
  end
  object pm207: TPopupMenu
    Left = 696
    Top = 384
    object mniDel2: TMenuItem
      Caption = #21024#38500
      OnClick = mniDel2Click
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
    ReportOptions.CreateDate = 42699.406500416670000000
    ReportOptions.LastChange = 42699.406500416670000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 832
    Top = 64
    Datasets = <>
    Variables = <>
    Style = <>
  end
end
