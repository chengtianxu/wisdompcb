object Form5: TForm5
  Left = 497
  Top = 172
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #38144#21806#23450#21333#25628#32034
  ClientHeight = 530
  ClientWidth = 841
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 37
    Top = 14
    Width = 52
    Height = 13
    Alignment = taRightJustify
    Caption = #38144#21806#35746#21333
  end
  object Edit1: TEdit
    Left = 98
    Top = 9
    Width = 162
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = DBGrid1KeyDown
  end
  object BitBtn1: TBitBtn
    Left = 265
    Top = 7
    Width = 25
    Height = 25
    Hint = #21047#26032
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    TabStop = False
    OnClick = BitBtn1Click
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
    Top = 40
    Width = 835
    Height = 441
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'SALES_ORDER'
        Title.Caption = #38144#21806#35746#21333#21495#30721
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Title.Caption = #23458#25143
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_NUMBER'
        Title.Caption = #23458#25143#35746#21333#21495#30721
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_NUMBER'
        Title.Caption = #26412#21378#32534#21495
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_DESC'
        Title.Caption = #23458#25143#22411#21495
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'spwang'
        Title.Caption = #29366#24577
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PARTS_ORDERED'
        Title.Caption = #25968#37327
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORIG_SCHED_SHIP_DATE'
        Title.Caption = #35745#21010#20132#26399
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SCH_DATE'
        Title.Caption = #22238#22797#20132#26399
        Width = 86
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 334
    Top = 497
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 3
  end
  object Button2: TButton
    Left = 414
    Top = 497
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 4
  end
  object RadioGroup1: TRadioGroup
    Left = 320
    Top = 0
    Width = 268
    Height = 40
    Caption = #36807#28388#23383#27573
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      #38144#21806#35746#21333
      #23458#25143#35746#21333
      #26412#21378#32534#21495)
    TabOrder = 5
    OnClick = RadioGroup1Click
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 505
    Top = 485
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'SELECT Data0060.RKEY, Data0060.SALES_ORDER, Data0010.ABBR_NAME,'
      '      Data0097.PO_NUMBER, Data0025.MANU_PART_NUMBER,'
      '      Data0025.MANU_PART_DESC, Data0060.STATUS, '#39#26377#25928#30340#39' AS spwang,'
      
        '      Data0060.PROD_REL,data0060.PARTS_ORDERED,data0060.ORIG_SCH' +
        'ED_SHIP_DATE,'
      'data0060.SCH_DATE'
      'FROM Data0060 INNER JOIN'
      
        '      Data0010 ON Data0060.CUSTOMER_PTR = Data0010.RKEY INNER JO' +
        'IN'
      '      Data0097 ON'
      '      Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY INNER JOIN'
      '      Data0025 ON dbo.Data0060.CUST_PART_PTR = Data0025.RKEY'
      'WHERE (dbo.Data0060.STATUS = 1) AND'
      
        '      (dbo.Data0060.PROD_REL = '#39'2'#39')  and (dbo.Data0060.ISSUED_QT' +
        'Y = 0)'
      ' order by data0060.sales_order')
    Left = 536
    Top = 485
  end
end
