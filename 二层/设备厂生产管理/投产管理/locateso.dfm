object locateso_Form: Tlocateso_Form
  Left = 494
  Top = 101
  Width = 753
  Height = 477
  Caption = #38144#21806#35746#21333#26597#25214
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
    Top = 397
    Width = 737
    Height = 42
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      737
      42)
    object Button1: TButton
      Left = 537
      Top = 9
      Width = 90
      Height = 25
      Anchors = [akTop]
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 641
      Top = 9
      Width = 90
      Height = 25
      Anchors = [akTop]
      Cancel = True
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 737
    Height = 41
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 15
      Top = 15
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #38144#21806#35746#21333
    end
    object Edit1: TEdit
      Left = 70
      Top = 11
      Width = 157
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
    object BitBtn1: TBitBtn
      Left = 230
      Top = 9
      Width = 43
      Height = 25
      TabOrder = 1
      TabStop = False
      OnClick = BitBtn1Click
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
  end
  object Panel3: TPanel
    Left = 0
    Top = 217
    Width = 737
    Height = 180
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object DBGrid2: TDBGrid
      Left = 0
      Top = 0
      Width = 737
      Height = 180
      Align = alClient
      DataSource = DataSource2
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'PROD_CODE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRODUCT_NAME'
          Width = 122
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRODUCT_DESC'
          Width = 128
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantity'
          Title.Caption = #25968#37327
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIT_NAME'
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'complete_date'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'remark'
          Width = 133
          Visible = True
        end>
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 737
    Height = 176
    Align = alTop
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'sales_order'
        Title.Color = clRed
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sales_date'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'V_TYPE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = #22996#25176#37096#38376
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEPT_NAME'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = #30830#35748#20154#21592
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'remark'
        Width = 84
        Visible = True
      end>
  end
  object ADScp70: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.WZCP0070.sales_order, dbo.WZCP0070.sales_date, db' +
      'o.Data0034.DEPT_CODE, dbo.Data0034.DEPT_NAME, dbo.WZCP0070.produ' +
      'ce_deptptr,'#13#10'                      CASE WZCP0070.TYPE WHEN 1 THE' +
      'N '#39#23545#22806#38144#21806#39' WHEN 2 THEN '#39#20869#37096#22996#25176#39' END AS V_TYPE, dbo.Data0010.ABBR_NAM' +
      'E, dbo.Data0005.EMPLOYEE_NAME, '#13#10'                      Data0034_' +
      '1.DEPT_NAME AS '#22996#25176#37096#38376', dbo.WZCP0070.remark, Data0005_1.EMPLOYEE_NA' +
      'ME AS '#30830#35748#20154#21592', dbo.WZCP0070.rkey'#13#10'FROM         dbo.WZCP0070 INNER J' +
      'OIN'#13#10'                      dbo.Data0034 ON dbo.WZCP0070.produce_' +
      'deptptr = dbo.Data0034.RKEY INNER JOIN'#13#10'                      db' +
      'o.Data0005 ON dbo.WZCP0070.ent_user_ptr = dbo.Data0005.RKEY LEFT' +
      ' OUTER JOIN'#13#10'                      dbo.Data0005 AS Data0005_1 ON' +
      ' dbo.WZCP0070.CONF_BY_EMPL_PTR = Data0005_1.RKEY LEFT OUTER JOIN' +
      #13#10'                      dbo.Data0034 AS Data0034_1 ON dbo.WZCP00' +
      '70.entrust_deptptr = Data0034_1.RKEY LEFT OUTER JOIN'#13#10'          ' +
      '            dbo.Data0010 ON dbo.WZCP0070.customer_ptr = dbo.Data' +
      '0010.RKEY'#13#10'WHERE     (dbo.WZCP0070.status = :v_s)'
    IndexFieldNames = 'sales_order'
    Parameters = <
      item
        Name = 'v_s'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end>
    Left = 240
    Top = 144
    object ADScp70sales_order: TStringField
      DisplayLabel = #38144#21806#35746#21333
      FieldName = 'sales_order'
      Size = 12
    end
    object ADScp70sales_date: TDateTimeField
      DisplayLabel = #35746#21333#26085#26399
      FieldName = 'sales_date'
    end
    object ADScp70DEPT_CODE: TStringField
      DisplayLabel = #21046#36896#37096#38376#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADScp70DEPT_NAME: TStringField
      DisplayLabel = #21046#36896#37096#38376
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADScp70V_TYPE: TStringField
      DisplayLabel = #35746#21333#31867#22411
      FieldName = 'V_TYPE'
      ReadOnly = True
      Size = 8
    end
    object ADScp70ABBR_NAME: TStringField
      DisplayLabel = #23458#25143#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADScp70EMPLOYEE_NAME: TStringField
      DisplayLabel = #36755#20837#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADScp70remark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 50
    end
    object ADScp70rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADScp70DSDesigner: TStringField
      FieldName = #30830#35748#20154#21592
      Size = 16
    end
    object ADScp70DSDesigner2: TStringField
      FieldName = #22996#25176#37096#38376
      Size = 30
    end
    object ADScp70produce_deptptr: TIntegerField
      FieldName = 'produce_deptptr'
    end
  end
  object ADScp71: TADODataSet
    AutoCalcFields = False
    Connection = DM.ADOConnection1
    Filter = 'ctrl = 0 '
    Filtered = True
    BeforeOpen = ADScp71BeforeOpen
    CommandText = 
      'SELECT     dbo.Data0008.PROD_CODE, dbo.Data0008.PRODUCT_NAME, db' +
      'o.Data0008.PRODUCT_DESC, dbo.WZCP0071.quantity, dbo.WZCP0071.com' +
      'plete_date,    '#13#10'dbo.WZCP0071.remark, dbo.Data0002.UNIT_NAME, db' +
      'o.WZCP0071.rkey,data0008.rkey as rkey08,'#13#10'case when dbo.Data0008' +
      '.if_control=1 then case when csi_ptr= :uptr1 then 1-1 else 1 end' +
      ' else 1-1 end as ctrl'#13#10'FROM         dbo.WZCP0071 INNER JOIN'#13#10'dbo' +
      '.Data0008 ON dbo.WZCP0071.prod_ptr = dbo.Data0008.RKEY INNER JOI' +
      'N'#13#10'dbo.Data0002 ON dbo.Data0008.unit_ptr = dbo.Data0002.RKEY lef' +
      't join '#13#10'(SELECT     CSI_PTR, PROC_PTR FROM dbo.WZCP0100 WHERE (' +
      'CSI_PTR = :uptr2 )) AS cp100 on dbo.Data0008.RKEY = cp100.proc_p' +
      'tr '#13#10'where WZCP0071.so_ptr=:rkey'
    Parameters = <
      item
        Name = 'uptr1'
        DataType = ftInteger
        Value = 0
      end
      item
        Name = 'uptr2'
        DataType = ftInteger
        Value = 0
      end
      item
        Name = 'rkey'
        DataType = ftInteger
        Value = 0
      end>
    Left = 239
    Top = 333
    object ADScp71PROD_CODE: TStringField
      DisplayLabel = #20135#21697#20195#30721
      FieldName = 'PROD_CODE'
      Size = 25
    end
    object ADScp71PRODUCT_NAME: TStringField
      DisplayLabel = #20135#21697#21517#31216
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADScp71PRODUCT_DESC: TStringField
      DisplayLabel = #20135#21697#35268#26684
      FieldName = 'PRODUCT_DESC'
      Size = 200
    end
    object ADScp71complete_date: TDateTimeField
      DisplayLabel = #23436#24037#26085#26399
      FieldName = 'complete_date'
    end
    object ADScp71remark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 50
    end
    object ADScp71UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object ADScp71rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADScp71rkey08: TIntegerField
      FieldName = 'rkey08'
      ReadOnly = True
    end
    object ADScp71quantity: TFloatField
      FieldName = 'quantity'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADScp70
    OnDataChange = DataSource1DataChange
    Left = 200
    Top = 144
  end
  object DataSource2: TDataSource
    AutoEdit = False
    DataSet = ADScp71
    OnDataChange = DataSource2DataChange
    Left = 160
    Top = 332
  end
end
