object Form1: TForm1
  Left = 420
  Top = 354
  Width = 275
  Height = 145
  Caption = 'RptFrm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RvProject1: TRvProject
    Engine = RvSystem1
    Left = 16
    Top = 16
  end
  object RvSystem1: TRvSystem
    TitleSetup = 'Output Options'
    TitleStatus = 'Report Status'
    TitlePreview = 'Report Preview'
    SystemSetups = [ssAllowCopies, ssAllowCollate, ssAllowDuplex, ssAllowDestPreview, ssAllowDestPrinter, ssAllowDestFile, ssAllowPrinterSetup, ssAllowPreviewSetup]
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.FormState = wsMaximized
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'ReportPrinter Report'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    Left = 48
    Top = 16
  end
  object RvDataSetConnection1: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = ADOQRept
    Left = 16
    Top = 56
  end
  object ADOQRept: TADOQuery
    Connection = DM.ADOCnn
    OnCalcFields = ADOQReptCalcFields
    Parameters = <
      item
        Name = 'vrkey'
        DataType = ftSmallint
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT Data0105.VOUCHER, Data0105.ATTACHED, Data0105.FYEAR, Data' +
        '0105.PERIOD, '
      
        '      Data0106.DESCRIPTION, Data0103.GL_ACC_NUMBER, Data0103.GL_' +
        'DESCRIPTION, '
      '      Data0001.CURR_CODE, Data0001.EXCH_RATE, Data0106.D_C, '
      '      Data0106.AMOUNT'
      'FROM Data0105 INNER JOIN'
      
        '      Data0106 ON Data0105.RKEY = Data0106.GL_HEADER_PTR INNER J' +
        'OIN'
      
        '      Data0103 ON Data0106.GL_ACCT_NO_PTR = Data0103.RKEY INNER ' +
        'JOIN'
      '      Data0001 ON Data0106.CURR_PTR = Data0001.RKEY'
      'where Data0105.rkey=:vrkey')
    Left = 48
    Top = 56
    object ADOQReptVOUCHER: TStringField
      FieldName = 'VOUCHER'
      FixedChar = True
      Size = 12
    end
    object ADOQReptATTACHED: TSmallintField
      FieldName = 'ATTACHED'
    end
    object ADOQReptFYEAR: TIntegerField
      FieldName = 'FYEAR'
    end
    object ADOQReptPERIOD: TSmallintField
      FieldName = 'PERIOD'
    end
    object ADOQReptDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 100
    end
    object ADOQReptGL_ACC_NUMBER: TStringField
      FieldName = 'GL_ACC_NUMBER'
      FixedChar = True
      Size = 18
    end
    object ADOQReptGL_DESCRIPTION: TStringField
      FieldName = 'GL_DESCRIPTION'
      Size = 50
    end
    object ADOQReptCURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADOQReptEXCH_RATE: TFloatField
      FieldName = 'EXCH_RATE'
    end
    object ADOQReptD_C: TStringField
      FieldName = 'D_C'
      FixedChar = True
      Size = 1
    end
    object ADOQReptAMOUNT: TBCDField
      FieldName = 'AMOUNT'
      Precision = 18
      Size = 2
    end
    object ADOQReptDAmount: TFloatField
      FieldKind = fkCalculated
      FieldName = 'DAmount'
      Calculated = True
    end
    object ADOQReptCAmount: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CAmount'
      Calculated = True
    end
  end
end
