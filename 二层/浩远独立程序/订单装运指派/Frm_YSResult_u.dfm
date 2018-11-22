object Frm_YSResult: TFrm_YSResult
  Left = 410
  Top = 191
  BorderStyle = bsSingle
  Caption = #39044#25910#26597#35810
  ClientHeight = 450
  ClientWidth = 688
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 35
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 177
      Top = 10
      Width = 40
      Height = 13
      Alignment = taRightJustify
      Caption = #23458#25143'PO'
    end
    object BitBtn1: TBitBtn
      Left = 3
      Top = 2
      Width = 58
      Height = 31
      Hint = #36864#20986
      Caption = #36864#20986
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      TabStop = False
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
    object Edit1: TEdit
      Left = 222
      Top = 6
      Width = 126
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
    object BitBtn2: TBitBtn
      Left = 65
      Top = 2
      Width = 58
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
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 35
    Width = 688
    Height = 415
    Align = alClient
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGridEh1KeyDown
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'PO_NUMBER'
        Footers = <>
        Width = 133
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_NUMBER'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #39044#25910#26412#24065#24635#37329#39069
        Footers = <>
        Width = 107
      end
      item
        EditButtons = <>
        FieldName = #39044#25910#24635#21487#20986#36135
        Footers = <>
        Width = 104
      end
      item
        EditButtons = <>
        FieldName = #24050#20986#36135
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #24403#21069#21487#20986#36135
        Footers = <>
      end>
  end
  object ADOQuery1: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'SELECT Data0097.PO_NUMBER,Data0025.MANU_PART_NUMBER,derivedtbl_1' +
        '.amount AS '#39044#25910#26412#24065#24635#37329#39069',derivedtbl_1.qty AS '#39044#25910#24635#21487#20986#36135', '
      
        '       SUM(dbo.Data0060.PARTS_SHIPPED) AS '#24050#20986#36135', derivedtbl_1.qty ' +
        '- SUM(Data0060.PARTS_SHIPPED) AS '#24403#21069#21487#20986#36135
      'FROM   Data0060 INNER JOIN'
      
        '       Data0025 ON Data0060.CUST_PART_PTR = Data0025.RKEY INNER ' +
        'JOIN'
      
        '       Data0097 ON Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY I' +
        'NNER JOIN'
      
        '       Data0010 ON Data0060.CUSTOMER_PTR = Data0010.RKEY LEFT OU' +
        'TER JOIN'
      '       (SELECT Data0152.PO_NUMBER,Data0152.MANU_PART_NUMBER,'
      '        SUM(Data0114.AMOUNT * Data0114.EXCHANGE_RATE) AS amount,'
      '        SUM(Data0152.all_shipqty) AS qty'
      
        '        FROM   Data0114  INNER JOIN Data0152 ON Data0152.srce_pt' +
        'r=Data0114.rkey'
      
        '        WHERE  TTYPE = 2 GROUP BY Data0152.PO_NUMBER,Data0152.MA' +
        'NU_PART_NUMBER) AS derivedtbl_1 '
      
        '                ON Data0097.PO_NUMBER = derivedtbl_1.PO_NUMBER A' +
        'ND Data0025.MANU_PART_NUMBER = derivedtbl_1.MANU_PART_NUMBER'
      'WHERE  (Data0010.COD_FLAG = '#39'Y'#39')')
    Left = 520
    Top = 112
    object ADOQuery1PO_NUMBER: TStringField
      DisplayLabel = #23458#25143'PO'
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ADOQuery1MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOQuery1DSDesigner: TFloatField
      FieldName = #39044#25910#26412#24065#24635#37329#39069
      ReadOnly = True
    end
    object ADOQuery1DSDesigner2: TIntegerField
      FieldName = #39044#25910#24635#21487#20986#36135
      ReadOnly = True
    end
    object ADOQuery1DSDesigner3: TFloatField
      FieldName = #24050#20986#36135
      ReadOnly = True
    end
    object ADOQuery1DSDesigner4: TFloatField
      FieldName = #24403#21069#21487#20986#36135
      ReadOnly = True
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 480
    Top = 112
  end
end
