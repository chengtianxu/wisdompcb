object QueryPick_BOM: TQueryPick_BOM
  Left = 703
  Top = 198
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #36873#25321'BOM'
  ClientHeight = 504
  ClientWidth = 632
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 632
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 48
      Top = 13
      Width = 39
      Height = 13
      Caption = #25628#32034#65306
    end
    object Edit1: TEdit
      Left = 128
      Top = 9
      Width = 161
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
    object CheckBox1: TCheckBox
      Left = 360
      Top = 11
      Width = 57
      Height = 17
      Caption = #20840#36873
      TabOrder = 1
      OnClick = CheckBox1Click
    end
  end
  object Eh1: TDBGridEh
    Left = 0
    Top = 41
    Width = 632
    Height = 417
    Align = alTop
    DataSource = DS_pickitem
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = Eh1KeyDown
    OnTitleClick = Eh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'isselected'
        Footers = <>
        Title.Caption = #36873#25321
        Width = 50
      end
      item
        EditButtons = <>
        FieldName = 'rkey'
        Footers = <>
        Title.Caption = #32534#21495
        Visible = False
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'PROD_CODE'
        Footers = <>
        ReadOnly = True
        Title.Caption = #20135#21697#32534#30721
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'PRODUCT_NAME'
        Footers = <>
        ReadOnly = True
        Title.Caption = #20135#21697#21517#31216
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'part_name'
        Footers = <>
        ReadOnly = True
        Title.Caption = 'BOM'#21517#31216
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'EMPLOYEE_NAME'
        Footers = <>
        Title.Caption = #24037#31243#23457#26680#20154
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'auth_date'
        Footers = <>
        Title.Caption = #23457#26680#26085#26399
        Width = 110
      end
      item
        EditButtons = <>
        FieldName = 'user3_ptr'
        Footers = <>
        Title.Caption = #21019#24314#20154
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'auth3_date'
        Footers = <>
        Title.Caption = #21019#24314#26085#26399
        Width = 110
      end
      item
        EditButtons = <>
        FieldName = 'user2_ptr'
        Footers = <>
        Title.Caption = #29289#25511#23457#26680#20154
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'auth2_date'
        Footers = <>
        Title.Caption = #29289#25511#23457#26680#26085#26399
        Width = 110
      end>
  end
  object Button1: TButton
    Left = 176
    Top = 465
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 2
  end
  object Button2: TButton
    Left = 344
    Top = 465
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 3
  end
  object ADS_pickitem: TADODataSet
    Connection = DM.ADOConn1
    CursorType = ctStatic
    AfterOpen = ADS_pickitemAfterOpen
    CommandText = 
      'declare  @isselected bit '#13#10'select   @isselected=0'#13#10'select   @iss' +
      'elected as isselected,dbo.wzcp0494.rkey, dbo.Data0008.PROD_CODE,' +
      ' dbo.Data0008.PRODUCT_NAME, '#13#10'         dbo.wzcp0494.part_name, d' +
      'bo.Data0005.EMPLOYEE_NAME, dbo.wzcp0494.auth_date, '#13#10'         d5' +
      '_2.EMPLOYEE_NAME AS user3_ptr, dbo.wzcp0494.auth3_date,d5_3.EMPL' +
      'OYEE_NAME AS user2_ptr,wzcp0494.auth2_date'#13#10'FROM         dbo.wzc' +
      'p0494 INNER JOIN'#13#10'                      dbo.Data0008 ON dbo.wzcp' +
      '0494.part_ptr = dbo.Data0008.RKEY INNER JOIN'#13#10'                  ' +
      '    dbo.Data0005 ON dbo.wzcp0494.user_ptr = dbo.Data0005.RKEY le' +
      'ft JOIN'#13#10'                      dbo.Data0005 AS d5_3 ON wzcp0494.' +
      'user2_ptr = d5_3.RKEY LEFT OUTER JOIN'#13#10'                      dbo' +
      '.Data0005 AS d5_2 ON wzcp0494.user3_ptr = d5_2.RKEY'#13#10'WHERE     (' +
      'dbo.wzcp0494.status IN (0, 1))'
    Parameters = <>
    Left = 48
    Top = 280
    object ADS_pickitemisselected: TBooleanField
      FieldName = 'isselected'
    end
    object ADS_pickitemrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADS_pickitemPROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      Size = 25
    end
    object ADS_pickitemPRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADS_pickitempart_name: TStringField
      FieldName = 'part_name'
    end
    object ADS_pickitemEMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADS_pickitemauth_date: TDateTimeField
      FieldName = 'auth_date'
    end
    object ADS_pickitemuser3_ptr: TStringField
      FieldName = 'user3_ptr'
      Size = 16
    end
    object ADS_pickitemauth3_date: TDateTimeField
      FieldName = 'auth3_date'
    end
    object ADS_pickitemuser2_ptr: TStringField
      FieldName = 'user2_ptr'
      Size = 16
    end
    object ADS_pickitemauth2_date: TDateTimeField
      FieldName = 'auth2_date'
    end
  end
  object DSP_pickitem: TDataSetProvider
    DataSet = ADS_pickitem
    Left = 96
    Top = 280
  end
  object CDS_pickitem: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 144
    Top = 280
    object CDS_pickitemisselected: TBooleanField
      FieldName = 'isselected'
    end
    object CDS_pickitemrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object CDS_pickitemPROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      Size = 25
    end
    object CDS_pickitemPRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object CDS_pickitempart_name: TStringField
      FieldName = 'part_name'
    end
    object CDS_pickitemEMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object CDS_pickitemauth_date: TDateTimeField
      FieldName = 'auth_date'
    end
    object CDS_pickitemuser3_ptr: TStringField
      FieldName = 'user3_ptr'
      Size = 16
    end
    object CDS_pickitemauth3_date: TDateTimeField
      FieldName = 'auth3_date'
    end
    object CDS_pickitemuser2_ptr: TStringField
      FieldName = 'user2_ptr'
      Size = 16
    end
    object CDS_pickitemauth2_date: TDateTimeField
      FieldName = 'auth2_date'
    end
  end
  object DS_pickitem: TDataSource
    DataSet = CDS_pickitem
    Left = 192
    Top = 280
  end
end
