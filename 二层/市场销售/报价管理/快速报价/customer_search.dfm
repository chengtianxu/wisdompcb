object Form_customer: TForm_customer
  Left = 233
  Top = 177
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #23458#25143#20195#30721#25628#32034
  ClientHeight = 490
  ClientWidth = 514
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 514
    Height = 36
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 96
      Top = 12
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #23458#25143#20195#30721
    end
    object Edit1: TEdit
      Left = 150
      Top = 8
      Width = 161
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
      OnKeyDown = DBGrid1KeyDown
    end
    object BitBtn1: TBitBtn
      Left = 319
      Top = 5
      Width = 26
      Height = 26
      Hint = #21047#26032
      ParentShowHint = False
      ShowHint = True
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
    object RadioGroup1: TRadioGroup
      Left = 352
      Top = 2
      Width = 151
      Height = 34
      Caption = #26597#25214#26041#24335
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #21069#26041#19968#33268
        #27169#31946#26597#25214)
      TabOrder = 2
      OnClick = RadioGroup1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 449
    Width = 514
    Height = 41
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      514
      41)
    object Button1: TButton
      Left = 165
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 257
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 36
    Width = 514
    Height = 413
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CUST_CODE'
        Title.Color = clRed
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUSTOMER_NAME'
        Width = 230
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_NAME'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALES_REP_NAME'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LANGUAGE_FLAG'
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = ads10
    Left = 64
    Top = 256
  end
  object ads10: TADODataSet
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT dbo.Data0010.CUST_CODE, dbo.Data0010.CUSTOMER_NAME, '#13#10'   ' +
      '   dbo.Data0001.CURR_NAME, data0010.LANGUAGE_FLAG,'#13#10'      dbo.Da' +
      'ta0005.EMPLOYEE_NAME as SALES_REP_NAME'#13#10'FROM dbo.Data0010 INNER ' +
      'JOIN'#13#10'      dbo.Data0001 ON dbo.Data0010.CURRENCY_PTR = dbo.Data' +
      '0001.RKEY INNER JOIN'#13#10'      dbo.Data0005 ON dbo.Data0010.SALES_R' +
      'EP_PTR = dbo.Data0005.RKEY'#13#10'where '#13#10'        CUSTOMER_TYPE <>4 an' +
      'd'#13#10'        data0010.cust_code like :custcode'
    IndexFieldNames = 'CUST_CODE'
    Parameters = <
      item
        Name = 'custcode'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = '%'
      end>
    Left = 96
    Top = 256
    object ads10CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ads10CUSTOMER_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object ads10CURR_NAME: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_NAME'
    end
    object ads10SALES_REP_NAME: TStringField
      DisplayLabel = #38144#21806#20195#34920
      FieldName = 'SALES_REP_NAME'
    end
    object ads10LANGUAGE_FLAG: TStringField
      DisplayLabel = #24320#21333
      FieldName = 'LANGUAGE_FLAG'
      FixedChar = True
      Size = 1
    end
  end
end
