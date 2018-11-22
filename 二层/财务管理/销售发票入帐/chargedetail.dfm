object Frm_chargedetail: TFrm_chargedetail
  Left = 415
  Top = 211
  Width = 929
  Height = 471
  Caption = #25910#27454#26126#32454
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PanelTOP: TPanel
    Left = 0
    Top = 0
    Width = 913
    Height = 36
    Align = alTop
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 3
      Top = 2
      Width = 68
      Height = 33
      Caption = #36864#20986
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
    end
    object BitBtn2: TBitBtn
      Left = 74
      Top = 4
      Width = 57
      Height = 31
      Hint = #23548#20986#25968#25454#21040'Excel'
      Caption = #23548#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BitBtn2Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DADADADADADA
        DADAADADADADADADADADDADADADADAD00000000000000006666007777777706E
        EF0AA0E6666606EEF0ADDA0E66606EEF060AADA0E606EEF0000DDADA006EEF0A
        DADAADAD06EEF00DADADDAD06EEF0670DADAAD06EEF0E6670DADD06EEF0A0E66
        70DA0FFFF0ADA0EEEE0D00000ADADA00000AADADADADADADADAD}
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 36
    Width = 913
    Height = 396
    Align = alClient
    DataSource = DataSource1
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'REFERENCE_NO'
        Title.Color = clRed
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TDATE'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'v_ttype'
        ReadOnly = False
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'v_status114'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AMOUNT'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dz_amount'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXCHANGE_RATE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VOUCHER'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'v_status'
        ReadOnly = False
        Title.Caption = #20973#35777#29366#24577
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbrname15'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BANK_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REMARK'
        Width = 317
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 139
    Top = 342
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'INV_PTR'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.Data0114.REFERENCE_NO, dbo.Data0105.VOUCHER, dbo.' +
        'Data0105.STATUS, dbo.Data0114.RKEY, dbo.Data0114.TDATE, dbo.Data' +
        '0114.REMARK, '
      
        '                      dbo.Data0114.STATUS AS status114, dbo.Data' +
        '0001.CURR_CODE, dbo.Data0001.CURR_NAME, dbo.Data0114.EXCHANGE_RA' +
        'TE, dbo.Data0128.BANK_NAME, '
      
        '                      dbo.Data0114.TTYPE, dbo.Data0114.AMOUNT, d' +
        'bo.Data0128.BAL_AMOUNT, dbo.Data0114.AMOUNT - dbo.Data0114.DEBIT' +
        '_AMOUNT AS dz_amount, '
      
        '                      dbo.Data0015.WAREHOUSE_CODE, dbo.Data0015.' +
        'ABBR_NAME AS abbrname15,'
      
        '                      case data0114.ttype when 1 then '#39#29616#38134#25910#27454#39'  wh' +
        'en 2 then '#39#39044#25910#24080#27454#39'   when 5 then '#39#36716#24080#25910#27454#39
      '                      end as v_ttype,   case data0105.status'
      
        '                      when 0 then '#39#26410#23457#26680#39'  when 1  then '#39#20250#35745#24050#23457#39' whe' +
        'n 2  then '#39#20027#31649#24050#23457#39
      
        '                      when 3  then '#39#24050#30331#24080#39'  when 4  then '#39#20986#32435#24050#23457#39' wh' +
        'en 5 then '#39#34987#20316#24223#39' '
      
        '                      end as v_status, case data0114.status  whe' +
        'n 1  then '#39#26377#25928#30340#39'  when 2 then '#39#24050#28165#31639#39' '
      '                      when 3 then '#39#24050#21462#28040#39' end as v_status114,'
      
        '                      dbo.Data0005.EMPLOYEE_NAME, dbo.Data0114.D' +
        'EBIT_AMOUNT, '
      
        '                      ROUND(dbo.Data0114.AMOUNT * dbo.Data0114.E' +
        'XCHANGE_RATE, 2) AS stand_amount'
      'FROM         dbo.Data0114 INNER JOIN'
      
        '                      dbo.Data0001 ON dbo.Data0114.CURRECY_PTR =' +
        ' dbo.Data0001.RKEY INNER JOIN'
      
        '                      dbo.Data0115 ON dbo.Data0114.RKEY = dbo.Da' +
        'ta0115.SRCE_PTR LEFT OUTER JOIN'
      
        '                      dbo.Data0105 ON dbo.Data0114.RKEY = dbo.Da' +
        'ta0105.SOURCE_PTR'
      '                     and Data0105.TRANS_TYPE = 6 LEFT OUTER JOIN'
      
        '                      dbo.Data0128 ON dbo.Data0114.BANK_PTR = db' +
        'o.Data0128.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0015 ON dbo.Data0114.warehouse_ptr' +
        ' = dbo.Data0015.RKEY inner join data0005'
      '                     on dbo.Data0114.EMPL_PTR=data0005.rkey '
      'where data0115.INV_PTR=:INV_PTR')
    Left = 171
    Top = 341
    object ADOQuery1REFERENCE_NO: TStringField
      DisplayLabel = #31080#25454#32534#21495
      FieldName = 'REFERENCE_NO'
      Size = 10
    end
    object ADOQuery1VOUCHER: TStringField
      DisplayLabel = #20973#35777#32534#21495
      FieldName = 'VOUCHER'
      Size = 12
    end
    object ADOQuery1STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object ADOQuery1RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQuery1TDATE: TDateTimeField
      DisplayLabel = #31080#25454#26085#26399
      FieldName = 'TDATE'
    end
    object ADOQuery1REMARK: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REMARK'
      Size = 60
    end
    object ADOQuery1status114: TWordField
      FieldName = 'status114'
    end
    object ADOQuery1CURR_CODE: TStringField
      DisplayLabel = #36135#24065#20195#30721
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADOQuery1CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object ADOQuery1EXCHANGE_RATE: TFloatField
      DisplayLabel = #27719#29575
      FieldName = 'EXCHANGE_RATE'
    end
    object ADOQuery1BANK_NAME: TStringField
      DisplayLabel = #29616#37329#38134#34892
      FieldName = 'BANK_NAME'
      Size = 30
    end
    object ADOQuery1TTYPE: TWordField
      FieldName = 'TTYPE'
    end
    object ADOQuery1AMOUNT: TFloatField
      DisplayLabel = #21457#31080#37329#39069
      FieldName = 'AMOUNT'
    end
    object ADOQuery1BAL_AMOUNT: TFloatField
      FieldName = 'BAL_AMOUNT'
    end
    object ADOQuery1dz_amount: TFloatField
      DisplayLabel = #21040#36134#37329#39069
      FieldName = 'dz_amount'
      ReadOnly = True
    end
    object ADOQuery1WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ADOQuery1abbrname15: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'abbrname15'
      Size = 10
    end
    object ADOQuery1v_ttype: TStringField
      DisplayLabel = #31080#25454#31867#22411
      FieldName = 'v_ttype'
      ReadOnly = True
      Size = 8
    end
    object ADOQuery1v_status: TStringField
      FieldName = 'v_status'
      ReadOnly = True
      Size = 8
    end
    object ADOQuery1v_status114: TStringField
      DisplayLabel = #31080#25454#29366#24577
      FieldName = 'v_status114'
      ReadOnly = True
      Size = 6
    end
    object ADOQuery1DEBIT_AMOUNT: TFloatField
      FieldName = 'DEBIT_AMOUNT'
    end
    object ADOQuery1stand_amount: TFloatField
      FieldName = 'stand_amount'
      ReadOnly = True
    end
    object ADOQuery1EMPLOYEE_NAME: TStringField
      DisplayLabel = #25805#20316#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
  end
end
