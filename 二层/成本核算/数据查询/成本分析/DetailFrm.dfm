object Frm_detail: TFrm_detail
  Left = 197
  Top = 160
  Width = 924
  Height = 480
  Caption = #26126#32454#26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 916
    Height = 41
    Align = alTop
    TabOrder = 0
    object SpeedButton4: TSpeedButton
      Left = 41
      Top = 5
      Width = 30
      Height = 30
      Hint = #23558#25968#25454#36755#20986#21040'EXCEL'#25991#20214#20013
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DADADADADADA
        DADAADADADADADADADADDADADADADAD00000000000000006666007777777706E
        EF0AA0E6666606EEF0ADDA0E66606EEF060AADA0E606EEF0000DDADA006EEF0A
        DADAADAD06EEF00DADADDAD06EEF0670DADAAD06EEF0E6670DADD06EEF0A0E66
        70DA0FFFF0ADA0EEEE0D00000ADADA00000AADADADADADADADAD}
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton4Click
    end
    object SpeedButton1: TSpeedButton
      Left = 8
      Top = 5
      Width = 30
      Height = 30
      Hint = #36864#20986
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        0400000000007800000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFF0FFFFFF
        FFFFFFFF00FFFFFFFFFFFFF030FFFFFFFFFFFF0330FFFFFFFFFF003330000000
        0FFFF03330FF0FFFFFFFF03300FF0FFFF4FFF03330FF0FFF44FFF03330FF0FF4
        4444F03330FF0F444444F03330FF0FF44444F0330FFF0FFF44FFF030FFFF0FFF
        F4FFF00FFFFF0FFFFFFFF00000000FFFFFFF}
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 41
    Width = 916
    Height = 405
    Align = alClient
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    FooterRowCount = 1
    SumList.Active = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGridEh1KeyDown
    Columns = <
      item
        EditButtons = <>
        FieldName = 'SALES_ORDER'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_NUMBER'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_DESC'
        Footers = <>
        Width = 244
      end
      item
        EditButtons = <>
        FieldName = 'CUST_CODE'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'QUAN_SHP'
        Footer.FieldName = 'QUAN_SHP'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #25351#27966#31867#22411
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'DATE_ASSIGN'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'EMPLOYEE_NAME'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'PO_NUMBER'
        Footers = <>
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 232
    Top = 112
  end
  object ADODataSet1: TADODataSet
    Connection = DM.Conn
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.Data0060.SALES_ORDER, dbo.Data0097.PO_NUMBER, dbo' +
      '.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC, dbo.Dat' +
      'a0064.DATE_ASSIGN, '#13#10'                      dbo.Data0052.QUAN_SHP' +
      ', dbo.Data0010.CUST_CODE, dbo.Data0005.EMPLOYEE_NAME, '#13#10'        ' +
      '              CASE assign_type WHEN 0 THEN '#39#27491#24120#25351#27966#39' WHEN 1 THEN '#39#36864 +
      #36135#25351#27966#39' END AS '#25351#27966#31867#22411#13#10'FROM         dbo.Data0052 INNER JOIN'#13#10'        ' +
      '              dbo.Data0064 ON dbo.Data0052.SO_SHP_PTR = dbo.Data' +
      '0064.RKEY INNER JOIN'#13#10'                      dbo.Data0060 ON dbo.' +
      'Data0064.SO_PTR = dbo.Data0060.RKEY INNER JOIN'#13#10'                ' +
      '      dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0025.' +
      'RKEY INNER JOIN'#13#10'                      dbo.Data0097 ON dbo.Data0' +
      '060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY INNER JOIN'#13#10'         ' +
      '             dbo.Data0010 ON dbo.Data0060.CUSTOMER_PTR = dbo.Dat' +
      'a0010.RKEY INNER JOIN'#13#10'                      dbo.Data0005 ON dbo' +
      '.Data0064.ENT_EMPL_PTR = dbo.Data0005.RKEY'#13#10'WHERE    1=1'
    Parameters = <>
    Left = 368
    Top = 128
    object ADODataSet1SALES_ORDER: TStringField
      DisplayLabel = #38144#21806#35746#21333
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ADODataSet1PO_NUMBER: TStringField
      DisplayLabel = #21512#21516#21495
      FieldName = 'PO_NUMBER'
      Size = 32
    end
    object ADODataSet1MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADODataSet1MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ADODataSet1DATE_ASSIGN: TDateTimeField
      DisplayLabel = #25351#27966#26085#26399
      FieldName = 'DATE_ASSIGN'
    end
    object ADODataSet1QUAN_SHP: TFloatField
      DisplayLabel = #20986#20179#25968#37327
      FieldName = 'QUAN_SHP'
    end
    object ADODataSet1CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADODataSet1EMPLOYEE_NAME: TStringField
      DisplayLabel = #25351#27966#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADODataSet1DSDesigner: TStringField
      FieldName = #25351#27966#31867#22411
      ReadOnly = True
      Size = 8
    end
  end
end
