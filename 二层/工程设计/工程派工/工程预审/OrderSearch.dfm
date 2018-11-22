object Frm_OderSearch: TFrm_OderSearch
  Left = 301
  Top = 126
  Width = 642
  Height = 500
  Caption = #24037#31243#35746#21333#25628#32034
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 4
    Top = 8
    Width = 79
    Height = 13
    Caption = #30830#35748#26085#26399' '#20174':'
  end
  object Label3: TLabel
    Left = 187
    Top = 8
    Width = 20
    Height = 13
    Caption = #21040':'
  end
  object Label1: TLabel
    Left = 347
    Top = 8
    Width = 52
    Height = 13
    Alignment = taRightJustify
    Caption = #26412#21378#32534#21495
  end
  object dtpk1: TDateTimePicker
    Left = 85
    Top = 3
    Width = 96
    Height = 21
    Date = 38847.000000000000000000
    Time = 38847.000000000000000000
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 0
    OnCloseUp = dtpk1Exit
    OnExit = dtpk1Exit
  end
  object dtpk2: TDateTimePicker
    Left = 211
    Top = 3
    Width = 96
    Height = 21
    Date = 38847.000000000000000000
    Time = 38847.000000000000000000
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 1
    OnCloseUp = dtpk1Exit
    OnExit = dtpk1Exit
  end
  object Edit1: TEdit
    Left = 404
    Top = 4
    Width = 177
    Height = 21
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 2
    OnChange = Edit1Change
  end
  object BtnBrush: TBitBtn
    Left = 582
    Top = 3
    Width = 26
    Height = 22
    Hint = #21047#26032#25968#25454
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = BtnBrushClick
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 35
    Width = 634
    Height = 377
    Align = alBottom
    DataSource = DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = ANSI_CHARSET
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
        FieldName = 'MANU_PART_NUMBER'
        Title.Caption = #26412#21378#32534#21495
        Width = 154
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_DESC'
        Title.Caption = #23458#25143#22411#21495
        Width = 153
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'order_qty'
        Title.Caption = #35746#21333#25968#37327
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONF_DATE'
        Title.Caption = #30830#35748#26085#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'str_status'
        Title.Caption = #29366#24577
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 412
    Width = 634
    Height = 54
    Align = alBottom
    TabOrder = 5
    object Button1: TButton
      Left = 199
      Top = 14
      Width = 75
      Height = 25
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 379
      Top = 14
      Width = 75
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 520
    Top = 416
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
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
      
        'SELECT dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DES' +
        'C,'
      
        '       dbo.DATA0538.curr_date,dbo.DATA0538.CUST_PART_PTR,dbo.DAT' +
        'A0538.STATUS,'
      'case DATA0538.STATUS when 0 then '#39#39044#23457#24453#20998#37197#39'when 1 then '#39#24453#39044#23457#39
      'when 2 then '#39#39044#23457#24320#22987#39'when 3 then '#39#39044#23457#32467#26463#39'when 4 then '#39'CAM'#24102#29702#39
      'when 5 then '#39'CAM'#24320#22987#39'when 6 then '#39'CAM'#32467#26463#39'when 7 then '#39'QAE'#24320#22987#39
      
        'when 8 then '#39'QAE'#32467#26463#39'when 9 then '#39'CAM'#36864#22238#39'when 10 then '#39'QAE'#36864#22238#39'end as' +
        ' str_status,'
      
        'dbo.DATA0538.order_qty,dbo.DATA0538.CONF_DATE,dbo.DATA0538.so_ol' +
        'dnew,'
      
        'dbo.DATA0538.YSZP_USER_PTR,dbo.DATA0538.YSZP_DATE,dbo.DATA0538.Y' +
        'S_USER_PTR,'
      
        'dbo.DATA0538.YS_STAR_DATE,dbo.DATA0538.YS_EDN_DATE,dbo.DATA0538.' +
        'YS_EQ_STATUS,'
      
        'dbo.DATA0538.YS_EQ_STAR,dbo.DATA0538.YS_EQ_END,dbo.DATA0538.CAMZ' +
        'P_USER_PTR,'
      
        'dbo.DATA0538.CAMZP_DATE,dbo.DATA0538.CAM_USER_PTR,dbo.DATA0538.C' +
        'AM_STAR_DATE,'
      
        'dbo.DATA0538.CAM_EDN_DATE,dbo.DATA0538.CAM_EQ_STATUS,dbo.DATA053' +
        '8.CAM_EQ_STAR,'
      
        'dbo.DATA0538.CAM_EQ_END,dbo.DATA0538.CAM_SENDBACK,dbo.DATA0538.Q' +
        'AE_USER_PTR,'
      
        'dbo.DATA0538.QAE_STAR_DATE,dbo.DATA0538.QAE_END_DATE,dbo.DATA053' +
        '8.QAE_SENDBACK, '
      #9#9'dbo.Data0005.EMPLOYEE_NAME AS E_NAME1, '
      
        '       Data0005_1.EMPLOYEE_NAME AS E_NAME2, Data0005_2.EMPLOYEE_' +
        'NAME AS E_NAME3, Data0005_4.EMPLOYEE_NAME AS E_NAME5, '
      
        '       Data0005_3.EMPLOYEE_NAME AS E_NAME4,data0008.PROD_CODE,da' +
        'ta0008.PRODUCT_NAME'
      'FROM  dbo.DATA0538 INNER JOIN'
      
        '      dbo.Data0025 ON dbo.DATA0538.CUST_PART_PTR = dbo.Data0025.' +
        'RKEY left JOIN'
      
        '      dbo.Data0005 ON dbo.DATA0538.YSZP_USER_PTR = dbo.Data0005.' +
        'RKEY left JOIN'
      
        '      dbo.Data0005 AS Data0005_1 ON dbo.DATA0538.YS_USER_PTR = D' +
        'ata0005_1.RKEY left JOIN'
      
        '      dbo.Data0005 AS Data0005_2 ON dbo.DATA0538.CAMZP_USER_PTR ' +
        '= Data0005_2.RKEY left JOIN'
      
        '      dbo.Data0005 AS Data0005_3 ON dbo.DATA0538.CAM_USER_PTR = ' +
        'Data0005_3.RKEY left JOIN'
      
        '      dbo.Data0005 AS Data0005_4 ON dbo.DATA0538.QAE_USER_PTR = ' +
        'Data0005_4.RKEY left join'
      
        '      dbo.data0008 on data0025.PROD_CODE_PTR=data0008.Rkey left ' +
        'join'
      
        '      dbo.data0010 on data0025.CUSTOMER_PTR=data0010.Rkey left j' +
        'oin'
      '      dbo.data0015 on data0025.PROD_ROUTE_PTR=data0015.Rkey'
      
        'where (data0538.conf_date>=:dtpk1) and(data0538.conf_date<=:dtpk' +
        '2)'
      '      and (data0538.status=0)'
      ''
      '')
    Left = 580
    Top = 414
    object ADOQuery1MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOQuery1MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ADOQuery1curr_date: TDateTimeField
      FieldName = 'curr_date'
    end
    object ADOQuery1CUST_PART_PTR: TIntegerField
      FieldName = 'CUST_PART_PTR'
    end
    object ADOQuery1STATUS: TWordField
      FieldName = 'STATUS'
    end
    object ADOQuery1str_status: TStringField
      FieldName = 'str_status'
      ReadOnly = True
      Size = 10
    end
    object ADOQuery1order_qty: TIntegerField
      FieldName = 'order_qty'
    end
    object ADOQuery1CONF_DATE: TDateTimeField
      FieldName = 'CONF_DATE'
    end
    object ADOQuery1so_oldnew: TStringField
      FieldName = 'so_oldnew'
      Size = 50
    end
    object ADOQuery1YSZP_USER_PTR: TIntegerField
      FieldName = 'YSZP_USER_PTR'
    end
    object ADOQuery1YSZP_DATE: TDateTimeField
      FieldName = 'YSZP_DATE'
    end
    object ADOQuery1YS_USER_PTR: TIntegerField
      FieldName = 'YS_USER_PTR'
    end
    object ADOQuery1YS_STAR_DATE: TDateTimeField
      FieldName = 'YS_STAR_DATE'
    end
    object ADOQuery1YS_EDN_DATE: TDateTimeField
      FieldName = 'YS_EDN_DATE'
    end
    object ADOQuery1YS_EQ_STATUS: TWordField
      FieldName = 'YS_EQ_STATUS'
    end
    object ADOQuery1YS_EQ_STAR: TDateTimeField
      FieldName = 'YS_EQ_STAR'
    end
    object ADOQuery1YS_EQ_END: TDateTimeField
      FieldName = 'YS_EQ_END'
    end
    object ADOQuery1CAMZP_USER_PTR: TIntegerField
      FieldName = 'CAMZP_USER_PTR'
    end
    object ADOQuery1CAMZP_DATE: TDateTimeField
      FieldName = 'CAMZP_DATE'
    end
    object ADOQuery1CAM_USER_PTR: TIntegerField
      FieldName = 'CAM_USER_PTR'
    end
    object ADOQuery1CAM_STAR_DATE: TDateTimeField
      FieldName = 'CAM_STAR_DATE'
    end
    object ADOQuery1CAM_EDN_DATE: TDateTimeField
      FieldName = 'CAM_EDN_DATE'
    end
    object ADOQuery1CAM_EQ_STATUS: TWordField
      FieldName = 'CAM_EQ_STATUS'
    end
    object ADOQuery1CAM_EQ_STAR: TDateTimeField
      FieldName = 'CAM_EQ_STAR'
    end
    object ADOQuery1CAM_EQ_END: TDateTimeField
      FieldName = 'CAM_EQ_END'
    end
    object ADOQuery1CAM_SENDBACK: TDateTimeField
      FieldName = 'CAM_SENDBACK'
    end
    object ADOQuery1QAE_USER_PTR: TIntegerField
      FieldName = 'QAE_USER_PTR'
    end
    object ADOQuery1QAE_STAR_DATE: TDateTimeField
      FieldName = 'QAE_STAR_DATE'
    end
    object ADOQuery1QAE_END_DATE: TDateTimeField
      FieldName = 'QAE_END_DATE'
    end
    object ADOQuery1QAE_SENDBACK: TDateTimeField
      FieldName = 'QAE_SENDBACK'
    end
    object ADOQuery1E_NAME1: TStringField
      FieldName = 'E_NAME1'
      Size = 16
    end
    object ADOQuery1E_NAME2: TStringField
      FieldName = 'E_NAME2'
      Size = 16
    end
    object ADOQuery1E_NAME3: TStringField
      FieldName = 'E_NAME3'
      Size = 16
    end
    object ADOQuery1E_NAME5: TStringField
      FieldName = 'E_NAME5'
      Size = 16
    end
    object ADOQuery1E_NAME4: TStringField
      FieldName = 'E_NAME4'
      Size = 16
    end
    object ADOQuery1PROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object ADOQuery1PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
  end
end
