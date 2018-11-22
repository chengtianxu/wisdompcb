object frmAuditDetail: TfrmAuditDetail
  Left = 244
  Top = 268
  Width = 359
  Height = 321
  Caption = #23457#26680#21015#34920
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 351
    Height = 290
    Align = alClient
    TabOrder = 0
    object eh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 349
      Height = 288
      Align = alClient
      DataSource = ds1
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = #23457#26680#39034#24207
          Footers = <>
          Width = 58
        end
        item
          EditButtons = <>
          FieldName = #23457#26680#20154
          Footers = <>
          Width = 75
        end
        item
          EditButtons = <>
          FieldName = #23457#26680#26085#26399
          Footers = <>
          Width = 170
        end>
    end
  end
  object ds1: TDataSource
    DataSet = qry1
    Left = 464
    Top = 208
  end
  object qry1: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select ranking '#23457#26680#39034#24207', b.USER_FULL_NAME '#23457#26680#20154', APP_DATE '#23457#26680#26085#26399
      'from data0491 a '
      'inner join data0073 b on a.csi_ptr=b.RKEY'
      'where  a.MO_PTR=:rkey')
    Left = 552
    Top = 216
    object wrdfldqry1DSDesigner: TWordField
      FieldName = #23457#26680#39034#24207
    end
    object strngfldqry1DSDesigner2: TStringField
      FieldName = #23457#26680#20154
      Size = 30
    end
    object dtmfldqry1DSDesigner3: TDateTimeField
      FieldName = #23457#26680#26085#26399
    end
  end
end
