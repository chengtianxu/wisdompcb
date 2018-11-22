inherited frmEdit_Mod496: TfrmEdit_Mod496
  Caption = #39046#26009#21333#26032#22686'/'#20462#25913
  ClientHeight = 578
  ClientWidth = 1051
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  ExplicitWidth = 1067
  ExplicitHeight = 617
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 1051
    Height = 578
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 1051
    ExplicitHeight = 578
    inherited pnl1: TPanel
      Width = 1049
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 1049
      inherited btnSave: TBitBtn
        OnClick = btnSaveClick
      end
      inherited btnClose: TBitBtn
        OnClick = btnCloseClick
      end
    end
    inherited pnl2: TPanel
      Width = 1049
      Height = 543
      ExplicitLeft = 1
      ExplicitTop = 34
      ExplicitWidth = 1049
      ExplicitHeight = 543
      object pnl3: TPanel
        Left = 1
        Top = 1
        Width = 1047
        Height = 120
        Align = alTop
        TabOrder = 0
        object lbl1: TLabel
          Left = 16
          Top = 16
          Width = 48
          Height = 13
          Caption = #30003#39046#21333#21495
        end
        object lbl2: TLabel
          Left = 16
          Top = 40
          Width = 48
          Height = 13
          Caption = #30003#35831#26085#26399
        end
        object lbl3: TLabel
          Left = 40
          Top = 65
          Width = 24
          Height = 13
          Caption = #22791#27880
        end
        object lbl4: TLabel
          Left = 440
          Top = 57
          Width = 24
          Height = 13
          Caption = #24037#21378
        end
        object lbl5: TLabel
          Left = 416
          Top = 32
          Width = 48
          Height = 13
          Caption = #23457#25209#27969#31243
        end
        object lbl6: TLabel
          Left = 416
          Top = 5
          Width = 48
          Height = 13
          Caption = #30003#35831#37096#38376
        end
        object lbl7: TLabel
          Left = 416
          Top = 85
          Width = 48
          Height = 13
          Caption = #37197#26009#21333#21495
        end
        object lbl8: TLabel
          Left = 30
          Top = 88
          Width = 310
          Height = 13
          Caption = '*'#25552#31034#65306#21487#22312#22791#27880#20013#27880#26126#20351#29992#29289#26009#30340#37096#38376','#20134#21487#28857#20987#25353#38062#36873#21462
        end
        object edt_Dept: TRKeyRzBtnEdit
          Left = 470
          Top = 2
          Width = 121
          Height = 21
          Text = ''
          TabOrder = 0
          OnExit = edt_DeptExit
          ButtonKind = bkFind
          AltBtnWidth = 15
          ButtonWidth = 15
          OnButtonClick = edt_DeptButtonClick
          DataSource = ds268
          DataSourceField = 'dept_ptr'
          DispalyTableName = 'data0034'
          DisplaytextField = 'dept_code'
          DisplayRetKeyField = 'rkey'
          DisplayNoteField = 'dept_name'
          DisplayPickID = '1'
          DisplayModID = 496
          ForceOnFocus = True
        end
        object edt_Audit: TRKeyRzBtnEdit
          Left = 470
          Top = 29
          Width = 121
          Height = 21
          Text = ''
          TabOrder = 1
          ButtonKind = bkFind
          AltBtnWidth = 15
          ButtonWidth = 15
          OnButtonClick = edt_AuditButtonClick
          DataSource = ds268
          DataSourceField = 'auth_ptr'
          DispalyTableName = 'data0094'
          DisplaytextField = 'code'
          DisplayRetKeyField = 'rkey'
          DisplayNoteField = 'PURCHASE_APPROV_DESC'
          DisplayPickID = '2'
          DisplayModID = 496
          ForceOnFocus = True
        end
        object edt_WH: TRKeyRzBtnEdit
          Left = 470
          Top = 54
          Width = 121
          Height = 21
          Text = ''
          TabOrder = 2
          OnChange = edt_WHChange
          ButtonKind = bkFind
          AltBtnWidth = 15
          ButtonWidth = 15
          DataSource = ds268
          DataSourceField = 'warehouse_ptr'
          DispalyTableName = 'data0015'
          DisplaytextField = 'ABBR_NAME'
          DisplayRetKeyField = 'rkey'
          DisplayPickID = '3'
          DisplayModID = 496
          ForceOnFocus = True
        end
        object edt_PBillNo: TRKeyRzBtnEdit
          Left = 470
          Top = 81
          Width = 121
          Height = 21
          Text = ''
          TabOrder = 3
          ButtonKind = bkFind
          AltBtnWidth = 15
          ButtonWidth = 15
          OnButtonClick = edt_PBillNoButtonClick
          DataSource = ds268
          DataSourceField = 'CUT_NO'
          DispalyTableName = 'data0492'
          DisplaytextField = 'cut_no'
          DisplayRetKeyField = 'rkey'
          DisplayPickID = '4'
          DisplayModID = 496
          ForceOnFocus = True
        end
        object edt_remark: TRKeyRzBtnEdit
          Left = 70
          Top = 61
          Width = 291
          Height = 21
          Text = ''
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          ButtonKind = bkFind
          AltBtnWidth = 15
          ButtonWidth = 15
          OnButtonClick = edt_remarkButtonClick
          DataSource = ds268
          DataSourceField = 'reference'
          DisplayModID = 0
          ForceOnFocus = True
        end
      end
      object pnl4: TPanel
        Left = 1
        Top = 121
        Width = 1047
        Height = 421
        Align = alClient
        TabOrder = 1
        object eh468: TDBGridEh
          Left = 1
          Top = 1
          Width = 1045
          Height = 419
          Align = alClient
          AutoFitColWidths = True
          DataSource = ds468
          DynProps = <>
          PopupMenu = pm468
          TabOrder = 0
          OnCellClick = eh468CellClick
          OnColEnter = eh468ColEnter
          OnColExit = eh468ColExit
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'INV_PART_NUMBER'
              Footers = <>
              ReadOnly = True
              Title.Caption = #26448#26009#32534#30721
              Width = 93
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'INV_PART_DESCRIPTION'
              Footers = <>
              ReadOnly = True
              Title.Caption = #26448#26009#21517#31216'/'#35268#26684
              Width = 172
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'QUAN_BOM'
              Footers = <>
              Title.Caption = #30003#39046#25968#37327
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'VENDOR'
              Footers = <>
              ReadOnly = True
              Title.Caption = #20379#24212#21830
              Width = 69
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'unit_name'
              Footers = <>
              ReadOnly = True
              Title.Caption = #21333#20301
              Width = 57
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'PRINTIT'
              Footers = <>
              KeyList.Strings = (
                'Y'
                'N')
              PickList.Strings = (
                #26222#36890#24211#23384
                'VMI'#24211#23384)
              ReadOnly = True
              Title.Caption = #26159#21542'VMI'
              Width = 51
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'control_name'
              Footers = <>
              ReadOnly = True
              Title.Caption = #25511#21046#39033#30446
              Width = 76
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'standards'
              Footers = <>
              ReadOnly = True
              Title.Caption = #39046#26009#26631#20934
              Width = 93
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'remark'
              Footers = <>
              ReadOnly = True
              Title.Caption = #22791#27880
              Width = 212
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'ExReason'
              Footers = <>
              Title.Caption = #36229#39046#29702#30001
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
  end
  object edt_BillNo: TRKeyRzBtnEdit
    Left = 71
    Top = 44
    Width = 121
    Height = 21
    Text = ''
    TabOrder = 2
    ButtonKind = bkFind
    ButtonVisible = False
    AltBtnWidth = 15
    ButtonWidth = 15
    DataSource = ds268
    DataSourceField = 'number'
    DisplayModID = 0
    ForceOnFocus = True
  end
  object dtpReqDate: TDateTimePicker
    Left = 71
    Top = 69
    Width = 161
    Height = 21
    Date = 42653.677781921290000000
    Format = 'yyyy-MM-dd hh:MM:ss'
    Time = 42653.677781921290000000
    TabOrder = 1
  end
  object cds268: TClientDataSet
    Aggregates = <>
    CommandText = 'select  * from data0268 '#13#10'where 1=1'
    FilterOptions = [foCaseInsensitive]
    Params = <>
    Left = 616
    Top = 48
  end
  object ds268: TDataSource
    DataSet = cds268
    Left = 664
    Top = 48
  end
  object cds468: TClientDataSet
    Aggregates = <>
    CommandText = 'select  * from data0468 where 1=1'#13#10
    Params = <>
    Left = 624
    Top = 288
  end
  object ds468: TDataSource
    DataSet = cds468
    Left = 680
    Top = 288
  end
  object cdsLookUp17: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT  d17.rkey, d17.INV_PART_NUMBER, d17.INV_PART_DESCRIPTION,' +
      'd02.rkey as rkey02,d2.unit_name,d136.rkey as rkey136,d136.contro' +
      'l_name  '#13#10'FROM  dbo.Data0468 d468   '#13#10'left JOIN  dbo.Data0017 d1' +
      '7  ON d468.INVENT_PTR = d17.RKEY  '#13#10'left join Data0002 d2 on d17' +
      '.STOCK_UNIT_PTR=d2.rkey  '#13#10'inner join   data0136 d136 on d468.co' +
      'ntrol_ptr=d136.rkey  '#13#10'where  d468.flow_no=0'
    Params = <>
    Left = 504
    Top = 200
  end
  object pm468: TPopupMenu
    OnPopup = pm468Popup
    Left = 840
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
  object cds04: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 800
    Top = 40
  end
  object cdstemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 816
    Top = 288
  end
end
