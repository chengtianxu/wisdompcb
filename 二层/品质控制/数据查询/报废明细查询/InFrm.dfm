object frmIN: TfrmIN
  Left = 436
  Top = 246
  Width = 660
  Height = 413
  Caption = #20869#23618#39044#25253#24223#20449#24687
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 644
    Height = 41
    Align = alTop
    TabOrder = 0
    object btn1: TBitBtn
      Left = 3
      Top = 5
      Width = 75
      Height = 33
      Caption = #20851#38381
      ModalResult = 2
      TabOrder = 0
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        0400000000007800000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFF0FFFFFF
        FFFFFFFF00FFFFFFFFFFFFF030FFFFFFFFFFFF0330FFFFFFFFFF003330000000
        0FFFF03330FF0FFFFFFFF03300FF0FFFF4FFF03330FF0FFF44FFF03330FF0FF4
        4444F03330FF0F444444F03330FF0FF44444F0330FFF0FFF44FFF030FFFF0FFF
        F4FFF00FFFFF0FFFFFFFF00000000FFFFFFF}
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 41
    Width = 644
    Height = 333
    Align = alClient
    TabOrder = 1
    object ehIN: TDBGridEh
      Left = 1
      Top = 1
      Width = 642
      Height = 331
      Align = alClient
      DataSource = dsIN
      FooterColor = clWindow
      FooterFont.Charset = ANSI_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -13
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = 'MANU_PART_NUMBER'
          Footers = <>
          Width = 127
        end
        item
          EditButtons = <>
          FieldName = 'REJ_CODE'
          Footers = <>
          Width = 63
        end
        item
          EditButtons = <>
          FieldName = 'REJECT_DESCRIPTION'
          Footers = <>
          Width = 116
        end
        item
          EditButtons = <>
          FieldName = 'QTY_REJECT'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'PANELS'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'WORK_ORDER_NUMBER'
          Footers = <>
          Width = 137
        end>
    end
  end
  object adsIN: TADODataSet
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    CommandText = 
      ';WITH CTE as'#13#10'('#13#10#9'SELECT D489.SOURCE_PTR FROM Data0489 D489 WHER' +
      'E D489.WO_PTR = :OUT06'#13#10#9'UNION ALL'#9#13#10#9'SELECT D489.SOURCE_PTR FRO' +
      'M Data0489 D489 '#13#10#9#9#9'INNER JOIN CTE'#9'ON CTE.SOURCE_PTR = D489.WO_' +
      'PTR'#13#10') '#13#10'SELECT D25.MANU_PART_NUMBER,D58.QTY_REJECT'#13#10#9',D58.PANEL' +
      'S,D39.REJ_CODE,D39.REJECT_DESCRIPTION,D06.WORK_ORDER_NUMBER'#13#10'FRO' +
      'M Data0058IN D58 INNER JOIN '#13#10#9#9#9'CTE ON D58.WO_PTR = CTE.SOURCE_' +
      'PTR LEFT JOIN '#13#10#9#9#9'Data0006 D06 ON D58.WO_PTR = D06.RKEY LEFT JO' +
      'IN '#13#10#9#9#9'Data0025 D25 ON D06.BOM_PTR = D25.RKEY LEFT JOIN  '#13#10#9#9#9'D' +
      'ata0039 D39 ON D39.RKEY = D58.REJECT_PTR'
    Parameters = <
      item
        Name = 'OUT06'
        DataType = ftString
        Size = 1
        Value = '0'
      end>
    Left = 352
    Top = 273
    object adsINMANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object adsINQTY_REJECT: TFloatField
      DisplayLabel = 'PCS'#25968#37327
      FieldName = 'QTY_REJECT'
    end
    object adsINPANELS: TIntegerField
      DisplayLabel = 'PANEL'#25968#37327
      FieldName = 'PANELS'
    end
    object adsINREJ_CODE: TStringField
      DisplayLabel = #32570#38519#20195#30721
      FieldName = 'REJ_CODE'
      Size = 5
    end
    object adsINREJECT_DESCRIPTION: TStringField
      DisplayLabel = #32570#38519#21517#31216
      FieldName = 'REJECT_DESCRIPTION'
      Size = 30
    end
    object adsINWORK_ORDER_NUMBER: TStringField
      DisplayLabel = #20316#19994#21333#21495
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
  end
  object dsIN: TDataSource
    DataSet = adsIN
    Left = 400
    Top = 273
  end
end
