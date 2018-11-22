object Form3: TForm3
  Left = 228
  Top = 159
  Width = 820
  Height = 528
  Caption = #36864#36135#35013#36816#35760#24405#26597#35810
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 812
    Height = 479
    Align = alClient
    DataSource = DM.DataSource2
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'INV_PART_NUMBER'
        Title.Caption = #26448#26009#20195#30721
        Width = 152
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_PART_DESCRIPTION'
        Title.Caption = #26448#26009#25551#36848
        Width = 206
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Title.Caption = #35013#36816#21592#24037
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTITY'
        Title.Caption = #36864#36135#25968#37327
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRICE'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAX_2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_NAME'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tran_date'
        Title.Caption = #36864#36135#26085#26399
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Title.Caption = #20379#24212#21830
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXCHANGE_RATE'
        Width = 67
        Visible = True
      end>
  end
  object Memo1: TMemo
    Left = 91
    Top = 24
    Width = 614
    Height = 393
    Lines.Strings = (
      
        'SELECT     TOP 100 PERCENT dbo.Data0095.QUANTITY, dbo.Data0095.S' +
        'HIPPING_METHOD,'
      'dbo.Data0022.RKEY, dbo.Data0017.INV_PART_NUMBER,'
      'dbo.Data0017.INV_PART_DESCRIPTION, dbo.Data0005.EMPLOYEE_NAME,'
      'dbo.Data0095.TRAN_DATE,dbo.Data0095.REFERENCE_NUMBER,'
      'dbo.Data0022.QUANTITY AS rece_quan, dbo.Data0022.TDATE,'
      ' dbo.Data0023.ABBR_NAME,dbo.Data0023.CONTACT_NAME_1,'
      'dbo.Data0023.BILLING_ADDRESS_1, dbo.Data0023.CODE,'
      ' dbo.Data0095.RKEY AS rkey95,dbo.Data0071.QUAN_ORD,'
      'dbo.Data0071.PRICE AS p_price, dbo.Data0022.PRICE,'
      ' dbo.Data0023.SUPPLIER_NAME,dbo.Data0002.UNIT_NAME,'
      'dbo.Data0071.CONVERSION_FACTOR, dbo.Data0070.PO_NUMBER,'
      
        'dbo.Data0070.PO_DATE,dbo.Data0456.TTYPE, dbo.Data0001.CURR_NAME,' +
        ' '
      'dbo.Data0022.TAX_2,data0022.EXCHANGE_RATE'
      'FROM         dbo.Data0002 INNER JOIN'
      'dbo.Data0023 INNER JOIN'
      'dbo.Data0095 INNER JOIN'
      
        'dbo.Data0017 ON dbo.Data0095.INVT_PTR = dbo.Data0017.RKEY INNER ' +
        'JOIN'
      
        'dbo.Data0005 ON dbo.Data0095.TRAN_BY = dbo.Data0005.RKEY INNER J' +
        'OIN'
      
        'dbo.Data0022 ON dbo.Data0095.SRCE_PTR = dbo.Data0022.RKEY INNER ' +
        'JOIN'
      
        'dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY ON dbo.' +
        'Data0023.RKEY = '
      'dbo.Data0456.SUPP_PTR ON '
      'dbo.Data0002.RKEY = dbo.Data0022.LOCATION_PTR_FROM INNER JOIN'
      
        'dbo.Data0001 ON dbo.Data0022.CURRENCY_PTR = dbo.Data0001.RKEY LE' +
        'FT OUTER JOIN'
      'dbo.Data0071 LEFT OUTER JOIN'
      
        'dbo.Data0070 ON dbo.Data0071.PO_PTR = dbo.Data0070.RKEY ON dbo.D' +
        'ata0022.SOURCE_PTR = '
      'dbo.Data0071.RKEY'
      'WHERE     (dbo.Data0095.TRAN_TP = 21) AND'
      '          (dbo.Data0095.TRAN_DATE >= @star_date) and'
      '          (dbo.Data0095.TRAN_DATE <= @end_date)'
      'ORDER BY dbo.Data0095.TRAN_DATE'
      ' ')
    ReadOnly = True
    TabOrder = 1
    Visible = False
  end
  object MainMenu1: TMainMenu
    Left = 600
    Top = 32
    object N1: TMenuItem
      Caption = #25805#20316
      object Excel1: TMenuItem
        Caption = #23548#20986#25968#25454#21040'Excel'
        OnClick = Excel1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object N4: TMenuItem
        Caption = #20851#38381
        ShortCut = 16465
        OnClick = N4Click
      end
    end
    object N2: TMenuItem
      Caption = #36807#28388
      object N5: TMenuItem
        Caption = #25353#20379#24212#21830
        OnClick = N5Click
      end
      object N6: TMenuItem
        Caption = #25353#26448#26009#20195#30721
        OnClick = N6Click
      end
      object N7: TMenuItem
        Caption = #25353#35013#36816#20154#21592
        OnClick = N7Click
      end
      object N10: TMenuItem
        Caption = #26085#26399
        OnClick = N10Click
      end
      object N9: TMenuItem
        Caption = #20840#37096
        OnClick = N9Click
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 568
    Top = 32
    object N8: TMenuItem
      Caption = #37325#21360#36864#36135#35013#36816#21333
      OnClick = N8Click
    end
  end
end
