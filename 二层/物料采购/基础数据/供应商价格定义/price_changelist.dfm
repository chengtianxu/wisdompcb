object Form4: TForm4
  Left = 206
  Top = 169
  Width = 746
  Height = 528
  Caption = #20215#26684#21464#21160#35760#24405
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 730
    Height = 37
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label4: TLabel
      Left = 170
      Top = 11
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #26448#26009#31867#22411
    end
    object Label1: TLabel
      Left = 147
      Top = 11
      Width = 73
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #26448#26009#32534#30721
    end
    object Label2: TLabel
      Left = 404
      Top = 12
      Width = 65
      Height = 13
      Alignment = taRightJustify
      Caption = #26356#25913#26085#26399#20174
    end
    object Label3: TLabel
      Left = 571
      Top = 13
      Width = 17
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #21040
    end
    object Button1: TButton
      Left = 10
      Top = 6
      Width = 60
      Height = 25
      Caption = #20851#38381
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 76
      Top = 6
      Width = 61
      Height = 25
      Caption = #23548#20986'Excel'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Edit1: TEdit
      Left = 227
      Top = 8
      Width = 129
      Height = 21
      TabOrder = 2
      OnChange = Edit1Change
    end
    object dtpk1: TDateTimePicker
      Left = 472
      Top = 8
      Width = 93
      Height = 21
      Date = 38595.000000000000000000
      Time = 38595.000000000000000000
      TabOrder = 3
      OnExit = dtpk1Exit
    end
    object dtpk2: TDateTimePicker
      Left = 592
      Top = 8
      Width = 93
      Height = 21
      Date = 38595.000000000000000000
      Time = 38595.000000000000000000
      TabOrder = 4
      OnExit = dtpk1Exit
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 37
    Width = 730
    Height = 453
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 1
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = #20215#26684#21464#21160#26126#32454
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 722
        Height = 425
        Align = alClient
        DataSource = DataSource1
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnKeyDown = DBGrid1KeyDown
        OnTitleClick = DBGrid1TitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'INV_PART_NUMBER'
            Width = 122
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'INV_PART_DESCRIPTION'
            Width = 138
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'old_price'
            ReadOnly = False
            Width = 52
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'new_price'
            ReadOnly = False
            Width = 54
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'change_price'
            Width = 57
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'change_rate'
            Width = 67
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMPLOYEE_NAME'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'reason'
            Width = 140
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sys_longdate'
            ReadOnly = False
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'GROUP_NAME'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'GROUP_DESC'
            Width = 92
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'abbr_name'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CURR_CODE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'unit_code'
            Visible = True
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = #24179#22343#20215#26684#21464#21160
      ImageIndex = 1
      object DBGrid2: TDBGrid
        Left = 0
        Top = 0
        Width = 722
        Height = 425
        Align = alClient
        DataSource = DataSource2
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnKeyDown = DBGrid2KeyDown
        OnTitleClick = DBGrid2TitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'GROUP_NAME'
            ReadOnly = False
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'GROUP_DESC'
            ReadOnly = False
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'old_price'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'new_price'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'avg_changeprice'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'change_rate'
            Visible = True
          end>
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = ado328
    Left = 176
    Top = 296
  end
  object ADS_AVG328: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT TOP 100 PERCENT dbo.Data0496.GROUP_NAME, dbo.Data0496.GRO' +
      'UP_DESC, '#13#10'      ROUND(AVG(dbo.data0328.old_price * dbo.Data0001' +
      '.BASE_TO_OTHER), 2)    AS old_price, '#13#10'      ROUND(AVG(dbo.data0' +
      '328.new_price * dbo.Data0001.BASE_TO_OTHER), 2)  AS new_price, '#13 +
      #10'      ROUND(AVG(dbo.data0328.new_price * dbo.Data0001.BASE_TO_O' +
      'THER - '#13#10'                             dbo.data0328.old_price * d' +
      'bo.Data0001.BASE_TO_OTHER), 2) AS avg_changeprice, '#13#10#13#10'      cas' +
      'e when avg((data0328.old_price * Data0001.BASE_TO_OTHER) )<>0 th' +
      'en '#13#10'      ROUND(AVG(((data0328.new_price * Data0001.BASE_TO_OTH' +
      'ER - data0328.old_price * Data0001.BASE_TO_OTHER) * 100) )'#13#10'    ' +
      '  / avg((data0328.old_price * Data0001.BASE_TO_OTHER) ), 2) else' +
      ' 100 end AS change_rate'#13#10#13#10'FROM dbo.data0328 INNER JOIN'#13#10'      d' +
      'bo.Data0028 ON dbo.data0328.price_ptr = dbo.Data0028.RKEY INNER ' +
      'JOIN'#13#10'      dbo.Data0017 ON dbo.Data0028.INVENTORY_PTR = dbo.Dat' +
      'a0017.RKEY INNER JOIN'#13#10'      dbo.Data0001 ON dbo.Data0028.CURREN' +
      'CY_PTR = dbo.Data0001.RKEY INNER JOIN'#13#10'      dbo.Data0496 ON dbo' +
      '.Data0017.GROUP_PTR = dbo.Data0496.RKEY'#13#10'WHERE '#13#10'data0328.sys_lo' +
      'ngdate>=:dtpk1 and data0328.sys_longdate<=:dtpk2'#13#10'GROUP BY dbo.D' +
      'ata0496.GROUP_NAME, dbo.Data0496.GROUP_DESC'#13#10'ORDER BY dbo.Data04' +
      '96.GROUP_NAME'
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 39083d
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 39448d
      end>
    Left = 208
    Top = 344
    object ADS_AVG328GROUP_NAME: TStringField
      DisplayLabel = #26448#26009#31867#22411
      FieldName = 'GROUP_NAME'
      Size = 10
    end
    object ADS_AVG328GROUP_DESC: TStringField
      DisplayLabel = #31867#22411#21517#31216
      FieldName = 'GROUP_DESC'
      Size = 30
    end
    object ADS_AVG328old_price: TFloatField
      DisplayLabel = #21407#24179#22343#20215#26684
      FieldName = 'old_price'
      ReadOnly = True
    end
    object ADS_AVG328new_price: TFloatField
      DisplayLabel = #26032#24179#22343#20215#26684' '
      FieldName = 'new_price'
      ReadOnly = True
    end
    object ADS_AVG328avg_changeprice: TFloatField
      DisplayLabel = #24179#22343#21464#21160#37329#39069
      FieldName = 'avg_changeprice'
      ReadOnly = True
    end
    object ADS_AVG328change_rate: TFloatField
      DisplayLabel = #24179#22343#21464#21160#29575'%'
      FieldName = 'change_rate'
      ReadOnly = True
    end
  end
  object DataSource2: TDataSource
    DataSet = ADS_AVG328
    Left = 176
    Top = 344
  end
  object ado328: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT Data0496.GROUP_NAME, Data0496.GROUP_DESC,'#13#10'      Data0017' +
      '.INV_PART_NUMBER, Data0017.INV_PART_DESCRIPTION,'#13#10'      Data0023' +
      '.CODE, data0328.old_price,data0023.abbr_name,'#13#10'      data0328.ne' +
      'w_price, data0328.sys_longdate, data0328.reason,'#13#10'      Data0005' +
      '.EMPLOYEE_NAME,'#13#10'      data0328.new_price-data0328.old_price as ' +
      'change_price,'#13#10'      case when data0328.old_price<>0 then round(' +
      '(data0328.new_price-data0328.old_price)*100/data0328.old_price,2' +
      ')'#13#10'      else 100 end '#13#10'      as change_rate,Data0001.CURR_CODE,' +
      'data0002.unit_code'#13#10'FROM Data0017 INNER JOIN'#13#10'      Data0028 ON ' +
      'Data0017.RKEY = Data0028.INVENTORY_PTR INNER JOIN'#13#10'      data032' +
      '8 ON Data0028.RKEY = data0328.price_ptr INNER JOIN'#13#10'      Data04' +
      '96 ON Data0017.GROUP_PTR = Data0496.RKEY INNER JOIN'#13#10'      Data0' +
      '023 ON Data0028.SUPPLIER_PTR = Data0023.RKEY INNER JOIN'#13#10'      D' +
      'ata0005 ON data0328.user_ptr = Data0005.RKEY INNER JOIN'#13#10'      d' +
      'bo.Data0001 ON dbo.Data0028.CURRENCY_PTR = dbo.Data0001.RKEY INN' +
      'ER JOIN'#13#10'      dbo.Data0002 ON dbo.Data0028.PURCHASE_UNIT_PTR = ' +
      'dbo.Data0002.RKEY'#13#10'where data0328.sys_longdate>=:dtpk1 and data0' +
      '328.sys_longdate<=:dtpk2'#13#10
    IndexFieldNames = 'sys_longdate'
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 39083d
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 39448d
      end>
    Left = 209
    Top = 296
    object ado328GROUP_NAME: TStringField
      DisplayLabel = #31867#22411#20195#30721
      FieldName = 'GROUP_NAME'
      Size = 10
    end
    object ado328GROUP_DESC: TStringField
      DisplayLabel = #31867#22411#21517#31216
      FieldName = 'GROUP_DESC'
      Size = 30
    end
    object ado328INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ado328INV_PART_DESCRIPTION: TStringField
      DisplayLabel = #21517#31216#35268#26684
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object ado328CODE: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'CODE'
      Size = 10
    end
    object ado328old_price: TFloatField
      DisplayLabel = #26087#20215#26684
      FieldName = 'old_price'
    end
    object ado328abbr_name: TStringField
      DisplayLabel = #20379#24212#21830#31616#31216
      FieldName = 'abbr_name'
      Size = 10
    end
    object ado328new_price: TFloatField
      DisplayLabel = #26032#20215#26684
      FieldName = 'new_price'
    end
    object ado328sys_longdate: TDateTimeField
      DisplayLabel = #26356#25913#26085#26399
      FieldName = 'sys_longdate'
    end
    object ado328reason: TStringField
      DisplayLabel = #26356#25913#21407#22240
      FieldName = 'reason'
      Size = 50
    end
    object ado328EMPLOYEE_NAME: TStringField
      DisplayLabel = #26356#25913#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ado328change_price: TFloatField
      DisplayLabel = #21464#21160#37329#39069
      FieldName = 'change_price'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object ado328change_rate: TFloatField
      DisplayLabel = #21464#21160#27604#20363'%'
      FieldName = 'change_rate'
      ReadOnly = True
    end
    object ado328CURR_CODE: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ado328unit_code: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'unit_code'
      Size = 5
    end
  end
end
