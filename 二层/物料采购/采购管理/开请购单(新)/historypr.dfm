object Frm_historypr: TFrm_historypr
  Left = 480
  Top = 254
  Width = 838
  Height = 387
  Caption = #21382#21490#35831#36141#26126#32454#26368#36817'15'#31508
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 830
    Height = 319
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = #35831#36141#21333#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = #35831#36141#20154#21592
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = #35831#36141#26085#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = #35831#36141#25968#37327
        Visible = True
      end
      item
        Expanded = False
        FieldName = #21333#20301
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = #35831#36141#21407#22240
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = #29305#21035#35201#27714
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = #26159#21542#32039#24613
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20379#24212#21830
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = #29366#24577
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 319
    Width = 830
    Height = 41
    Align = alBottom
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 352
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = #20851#38381
      ModalResult = 2
      TabOrder = 0
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
    object BtnExcel: TBitBtn
      Left = 28
      Top = 2
      Width = 60
      Height = 30
      Caption = #23548#20986
      TabOrder = 1
      OnClick = BtnExcelClick
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
  object DataSource1: TDataSource
    DataSet = ads69
    Left = 408
    Top = 32
  end
  object ads69: TADODataSet
    Connection = DM.ADOCon
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT     TOP (15) dbo.Data0068.PO_REQ_NUMBER as '#35831#36141#21333#21495', '#13#10'dbo.Da' +
      'ta0005.EMPLOYEE_NAME as '#35831#36141#20154#21592', dbo.Data0068.REQ_DATE as '#35831#36141#26085#26399','#13#10' d' +
      'bo.Data0069.QUANTITY as '#35831#36141#25968#37327', dbo.Data0002.UNIT_NAME as '#21333#20301', '#13#10'  ' +
      '                    dbo.Data0069.reason as '#35831#36141#21407#22240', dbo.Data0069.ex' +
      'tra_req as '#29305#21035#35201#27714','#13#10' dbo.Data0069.IF_urgency as '#26159#21542#32039#24613', dbo.Data0023' +
      '.ABBR_NAME as '#20379#24212#21830', '#13#10'                      CASE data0068.status ' +
      'WHEN 1 THEN '#39#24453#23457#25209#39' WHEN 2 THEN '#39#24453#37319#36141#39' WHEN 3 THEN '#39#24050#25209#20934#39' WHEN 4 THE' +
      'N '#39#34987#36864#22238#39' WHEN 5 THEN '#39#24050#25764#28040#39' WHEN 6 THEN '#39#24050#22788#29702#39#13#10'                   ' +
      '    WHEN 7 THEN '#39#26410#25552#20132#39' END AS '#29366#24577#13#10'FROM         dbo.Data0069 INNER' +
      ' JOIN'#13#10'                      dbo.Data0068 ON dbo.Data0069.PURCH_' +
      'REQ_PTR = dbo.Data0068.RKEY INNER JOIN'#13#10'                      db' +
      'o.Data0017 ON dbo.Data0069.INVT_PTR = dbo.Data0017.RKEY INNER JO' +
      'IN'#13#10'                      dbo.Data0005 ON dbo.Data0068.REQ_BY = ' +
      'dbo.Data0005.RKEY INNER JOIN'#13#10'                      dbo.Data0002' +
      ' ON dbo.Data0069.UNIT_PTR = dbo.Data0002.RKEY LEFT OUTER JOIN'#13#10' ' +
      '                     dbo.Data0023 ON dbo.Data0069.SUPP_PTR = dbo' +
      '.Data0023.RKEY'#13#10'where Data0069.INVT_PTR = :rkey17'#13#10'ORDER BY dbo.' +
      'Data0068.REQ_DATE DESC'
    Parameters = <
      item
        Name = 'rkey17'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 448
    Top = 32
  end
end
