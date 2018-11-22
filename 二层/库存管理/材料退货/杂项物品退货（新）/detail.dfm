object Frm_detail: TFrm_detail
  Left = 221
  Top = 231
  Width = 1003
  Height = 563
  Caption = #36864#36135#26126#32454
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
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 995
    Height = 529
    Align = alClient
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGridEh1KeyDown
    Columns = <
      item
        EditButtons = <>
        FieldName = 'goods_name'
        Footers = <>
        Title.Caption = #29289#21697#21517#31216
        Width = 131
      end
      item
        EditButtons = <>
        FieldName = 'goods_guige'
        Footers = <>
        Title.Caption = #29289#21697#35268#26684
        Width = 203
      end
      item
        EditButtons = <>
        FieldName = 'goods_type'
        Footers = <>
        Title.Caption = #29289#21697#31867#21035
        Width = 76
      end
      item
        EditButtons = <>
        FieldName = 'ABBR_NAME'
        Footers = <>
        Title.Caption = #20379#24212#21830#21517#31216
        Width = 107
      end
      item
        EditButtons = <>
        FieldName = 'v_state'
        Footers = <>
        Title.Caption = #29366#24577
      end
      item
        EditButtons = <>
        FieldName = 'QUANTITY'
        Footers = <>
        Title.Caption = #35013#36816#25968#37327
        Width = 54
      end
      item
        EditButtons = <>
        FieldName = 'UNIT_NAME'
        Footers = <>
        Title.Caption = #21333#20301
        Width = 52
      end
      item
        EditButtons = <>
        FieldName = 'TDATE'
        Footers = <>
        Title.Caption = #36864#36135#26085#26399
        Width = 139
      end
      item
        EditButtons = <>
        FieldName = 'Expr1'
        Footers = <>
        Title.Caption = #36864#36135#20154#21592
        Width = 54
      end
      item
        EditButtons = <>
        FieldName = 'shipping_method'
        Footers = <>
        Title.Caption = #35013#36816#26041#24335
        Width = 56
      end
      item
        EditButtons = <>
        FieldName = 'tran_date'
        Footers = <>
        Title.Caption = #35013#36816#26102#38388
        Width = 136
      end
      item
        EditButtons = <>
        FieldName = 'EMPLOYEE_NAME'
        Footers = <>
        Title.Caption = #35013#36816#20154
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'CODE'
        Footers = <>
        Title.Caption = #25298#25910#20195#30721
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'REJECT_DESCRIPTION'
        Footers = <>
        Title.Caption = #25298#25910#21407#22240
        Width = 107
      end
      item
        EditButtons = <>
        FieldName = 'remark'
        Footers = <>
        Title.Caption = #36864#36135#22791#27880
        Width = 226
      end>
  end
  object ADS209: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.Data0235.goods_name, dbo.Data0235.goods_guige, db' +
      'o.Data0235.goods_type, dbo.Data0023.ABBR_NAME, dbo.Data0235.quan' +
      '_to_ship, '#13#10'                      dbo.Data0209.QUANTITY, dbo.Dat' +
      'a0002.UNIT_NAME, dbo.Data0209.TDATE, dbo.Data0005.EMPLOYEE_NAME ' +
      'AS Expr1, dbo.Data0209.remark, '#13#10'                      dbo.Data0' +
      '209.shipping_method, dbo.Data0209.tran_date,case dbo.Data0209.st' +
      'atus when '#39'1'#39' then '#39#24050#35013#36816#39' when '#39'0'#39' then '#39#26410#35013#36816#39' end  as '#39'v_state'#39','#13 +
      #10'                       tran_by.EMPLOYEE_NAME, dbo.Data0076.CODE' +
      ', dbo.Data0076.REJECT_DESCRIPTION'#13#10'FROM         dbo.Data0209 INN' +
      'ER JOIN'#13#10'                      dbo.Data0235 ON dbo.Data0209.SRCE' +
      '_PTR = dbo.Data0235.RKEY INNER JOIN'#13#10'                      dbo.D' +
      'ata0005 ON dbo.Data0209.EMPL_PTR = dbo.Data0005.RKEY left JOIN'#13#10 +
      '                     dbo.Data0005 AS tran_by ON dbo.Data0209.tra' +
      'n_by_userptr = tran_by.RKEY INNER JOIN'#13#10'                      db' +
      'o.Data0076 ON dbo.Data0209.GL_HDR_PTR = dbo.Data0076.RKEY INNER ' +
      'JOIN'#13#10'                      dbo.Data0002 ON dbo.Data0235.unit_pt' +
      'r = dbo.Data0002.RKEY INNER JOIN'#13#10'                      dbo.Data' +
      '0456 ON dbo.Data0235.GRN_PTR = dbo.Data0456.RKEY INNER JOIN'#13#10'   ' +
      '                   dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.D' +
      'ata0023.RKEY'#13#10
    Parameters = <>
    Left = 384
    Top = 208
    object ADS209goods_name: TStringField
      FieldName = 'goods_name'
      Size = 60
    end
    object ADS209goods_guige: TStringField
      FieldName = 'goods_guige'
      Size = 200
    end
    object ADS209goods_type: TStringField
      FieldName = 'goods_type'
    end
    object ADS209ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object ADS209QUANTITY: TFloatField
      FieldName = 'QUANTITY'
    end
    object ADS209UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object ADS209TDATE: TDateTimeField
      FieldName = 'TDATE'
    end
    object ADS209Expr1: TStringField
      FieldName = 'Expr1'
      Size = 16
    end
    object ADS209remark: TWideStringField
      FieldName = 'remark'
      Size = 50
    end
    object ADS209shipping_method: TWideStringField
      FieldName = 'shipping_method'
    end
    object ADS209v_state: TStringField
      FieldName = 'v_state'
      ReadOnly = True
      Size = 6
    end
    object ADS209tran_date: TDateTimeField
      FieldName = 'tran_date'
    end
    object ADS209EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADS209CODE: TStringField
      FieldName = 'CODE'
      Size = 5
    end
    object ADS209REJECT_DESCRIPTION: TStringField
      FieldName = 'REJECT_DESCRIPTION'
      Size = 30
    end
  end
  object DataSource1: TDataSource
    DataSet = ADS209
    Left = 328
    Top = 232
  end
end
