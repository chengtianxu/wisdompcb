object Form3: TForm3
  Left = 344
  Top = 236
  Width = 917
  Height = 574
  Caption = #25910#36135#26126#32454#26597#35810
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 909
    Height = 46
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 204
      Top = 16
      Width = 88
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #36865#36135#21333#21495
    end
    object Label2: TLabel
      Left = 421
      Top = 16
      Width = 66
      Height = 12
      Caption = '  '#37329#39069#21512#35745':'
    end
    object Button1: TButton
      Left = 4
      Top = 11
      Width = 64
      Height = 25
      Caption = #20851#38381
      ModalResult = 1
      TabOrder = 1
    end
    object Edit1: TEdit
      Left = 298
      Top = 12
      Width = 121
      Height = 20
      TabOrder = 0
      OnChange = Edit1Change
    end
    object GroupBox2: TGroupBox
      Left = 604
      Top = 0
      Width = 259
      Height = 38
      Caption = #26085#26399#33539#22260
      TabOrder = 2
      object Label8: TLabel
        Left = 2
        Top = 17
        Width = 24
        Height = 12
        Caption = ' '#20174':'
      end
      object Label9: TLabel
        Left = 130
        Top = 17
        Width = 24
        Height = 12
        Alignment = taRightJustify
        Caption = ' '#21040':'
      end
      object dtpk1: TDateTimePicker
        Left = 30
        Top = 13
        Width = 97
        Height = 20
        Date = 37600.000000000000000000
        Time = 37600.000000000000000000
        TabOrder = 0
        OnCloseUp = dtpk1Exit
        OnExit = dtpk1Exit
      end
      object DTPk2: TDateTimePicker
        Left = 156
        Top = 13
        Width = 97
        Height = 20
        Date = 37600.000000000000000000
        Time = 37600.000000000000000000
        TabOrder = 1
        OnCloseUp = dtpk1Exit
        OnExit = dtpk1Exit
      end
    end
    object Button3: TButton
      Left = 143
      Top = 11
      Width = 75
      Height = 25
      Caption = #34920#26684#21015#35774#32622
      PopupMenu = PopupMenu1
      TabOrder = 3
      OnClick = Button3Click
    end
    object Edit2: TEdit
      Left = 493
      Top = 12
      Width = 83
      Height = 20
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 4
    end
    object Button2: TButton
      Left = 68
      Top = 11
      Width = 75
      Height = 25
      Caption = #23548#20986#25968#25454
      TabOrder = 5
      OnClick = Button2Click
    end
  end
  object DBGrid1: TDBGridEh
    Left = 0
    Top = 46
    Width = 909
    Height = 482
    Align = alClient
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = GB2312_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -12
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    FrozenCols = 3
    PopupMenu = PopupMenu2
    TabOrder = 1
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'DELIVER_NUMBER'
        Footers = <>
        ReadOnly = True
        Width = 86
      end
      item
        EditButtons = <>
        FieldName = 'ABBR_NAME'
        Footers = <>
        ReadOnly = True
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_NUMBER'
        Footers = <>
        ReadOnly = True
        Width = 76
      end
      item
        EditButtons = <>
        FieldName = 'STANDARD'
        Footers = <>
        ReadOnly = True
        Width = 92
      end
      item
        EditButtons = <>
        FieldName = 'UNIT_NAME'
        Footers = <>
        ReadOnly = True
        Width = 32
      end
      item
        EditButtons = <>
        FieldName = 'rece_quantity'
        Footers = <>
        Width = 52
      end
      item
        EditButtons = <>
        FieldName = 'RETURN_QTY'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'reject_qty'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'price'
        Footers = <>
        Width = 40
      end
      item
        EditButtons = <>
        FieldName = 'pattern_money'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'MIN_MONEY'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'ENG_MONEY'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'TOTAL_MONEY'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'SHIP_DATE'
        Footers = <>
        Width = 57
      end
      item
        EditButtons = <>
        FieldName = 'REMARK'
        Footers = <>
        ReadOnly = True
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'SHIP_NAME'
        Footers = <>
        ReadOnly = True
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'EMPLOYEE_NAME'
        Footers = <>
        ReadOnly = True
        Width = 62
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_DESC'
        Footers = <>
        ReadOnly = True
        Width = 93
      end
      item
        EditButtons = <>
        FieldName = 'AREA_SQM'
        Footers = <>
        Width = 53
      end
      item
        EditButtons = <>
        FieldName = 'AREA_SQF'
        Footers = <>
        Width = 52
      end
      item
        EditButtons = <>
        FieldName = 'LAYER'
        Footers = <>
        Width = 31
      end
      item
        EditButtons = <>
        FieldName = 'THINK'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'MIN_aperture'
        Footers = <>
        Width = 53
      end
      item
        EditButtons = <>
        FieldName = 'epiboly_number'
        Footers = <>
        ReadOnly = True
        Width = 98
      end
      item
        EditButtons = <>
        FieldName = 'DEPT_NAME'
        Footers = <>
        ReadOnly = True
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'QUANTITY'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'REQ_DATE'
        Footers = <>
        Width = 62
      end
      item
        EditButtons = <>
        FieldName = 'v_status'
        Footers = <>
        ReadOnly = False
        Width = 51
      end>
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 528
    Width = 909
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 192
    Top = 144
  end
  object ADOQuery1: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterScroll = ADOQuery1AfterScroll
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 38657d
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 38684d
      end>
    SQL.Strings = (
      'SELECT dbo.WZDATA303.DELIVER_NUMBER, dbo.WZDATA303.SHIP_NAME, '
      '      dbo.WZDATA303.SHIP_DATE, dbo.WZDATA300.epiboly_number,'
      
        '      dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC' +
        ','
      '      dbo.WZDATA301.UNIT_NAME, dbo.WZDATA301.STANDARD,'
      
        '      dbo.WZDATA301.AREA_SQM, dbo.WZDATA301.AREA_SQF, dbo.WZDATA' +
        '301.LAYER, '
      '      dbo.WZDATA301.THINK, dbo.WZDATA301.MIN_aperture, '
      '      dbo.WZDATA301.REQ_DATE, dbo.WZDATA304.rece_quantity, '
      '      dbo.WZDATA304.REMARK, dbo.Data0005.EMPLOYEE_NAME, '
      
        '      dbo.Data0023.ABBR_NAME, dbo.Data0034.DEPT_NAME, dbo.WZDATA' +
        '301.QUANTITY, '
      
        '      dbo.WZDATA304.price, dbo.WZDATA304.pattern_money, wzdata30' +
        '4.reject_qty,'
      '      dbo.WZDATA304.MIN_MONEY, dbo.WZDATA304.ENG_MONEY, '
      '      dbo.WZDATA304.TOTAL_MONEY, wzdata304.RETURN_QTY,'
      '      v_status ='
      '      CASE dbo.WZDATA303.STATUS'
      '       WHEN 3 THEN '#39#24050#23457#26680#39
      '       WHEN 4 THEN '#39#24050#35760#24080#39
      '       WHEN 5 THEN '#39#24050#20184#27454#39
      '      END'
      'FROM dbo.WZDATA304 INNER JOIN'
      '      dbo.WZDATA303 ON '
      '      dbo.WZDATA304.DELIVER_PTR = dbo.WZDATA303.RKEY INNER JOIN'
      '      dbo.WZDATA300 ON '
      '      dbo.WZDATA303.EPIBOLY_PTR = dbo.WZDATA300.rkey INNER JOIN'
      '      dbo.WZDATA301 ON '
      '      dbo.WZDATA304.EPILIST_PTR = dbo.WZDATA301.RKEY INNER JOIN'
      '      dbo.Data0025 ON '
      '      dbo.WZDATA301.CUSTPART_PTR = dbo.Data0025.RKEY INNER JOIN'
      
        '      dbo.Data0005 ON dbo.WZDATA303.EMPL_PTR = dbo.Data0005.RKEY' +
        ' INNER JOIN'
      
        '      dbo.Data0034 ON dbo.WZDATA300.dept_ptr = dbo.Data0034.RKEY' +
        ' INNER JOIN'
      '      dbo.Data0023 ON dbo.WZDATA303.SUPP_PTR = dbo.Data0023.RKEY'
      'WHERE (dbo.WZDATA303.STATUS <> 1) and'
      '      (dbo.WZDATA303.STATUS <> 2)  and'
      '      (dbo.WZDATA303.STATUS <> 6)  and'
      '      (WZDATA303.SHIP_DATE>=:dtpk1) and'
      '      (WZDATA303.SHIP_DATE<=:dtpk2)'
      'order by  DELIVER_NUMBER')
    Left = 272
    Top = 144
    object ADOQuery1DELIVER_NUMBER: TStringField
      DisplayLabel = #36865#36135#21333#21495
      DisplayWidth = 20
      FieldName = 'DELIVER_NUMBER'
      Size = 15
    end
    object ADOQuery1SHIP_NAME: TStringField
      DisplayLabel = #36865#36135#20154#21592
      DisplayWidth = 16
      FieldName = 'SHIP_NAME'
    end
    object ADOQuery1SHIP_DATE: TDateTimeField
      DisplayLabel = #36865#36135#26085#26399
      DisplayWidth = 14
      FieldName = 'SHIP_DATE'
    end
    object ADOQuery1epiboly_number: TStringField
      DisplayLabel = #22806#21457#32534#21495
      DisplayWidth = 18
      FieldName = 'epiboly_number'
      Size = 15
    end
    object ADOQuery1STANDARD: TStringField
      DisplayLabel = #35268#26684
      DisplayWidth = 36
      FieldName = 'STANDARD'
      Size = 30
    end
    object ADOQuery1UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      DisplayWidth = 13
      FieldName = 'UNIT_NAME'
      Size = 10
    end
    object ADOQuery1AREA_SQM: TBCDField
      DisplayLabel = #24179#26041#31859
      DisplayWidth = 12
      FieldName = 'AREA_SQM'
      Precision = 6
    end
    object ADOQuery1AREA_SQF: TBCDField
      DisplayLabel = #24179#26041#33521#23610
      DisplayWidth = 11
      FieldName = 'AREA_SQF'
      Precision = 6
    end
    object ADOQuery1LAYER: TWordField
      DisplayLabel = #23618#25968
      DisplayWidth = 12
      FieldName = 'LAYER'
    end
    object ADOQuery1THINK: TBCDField
      DisplayLabel = #26495#21402
      DisplayWidth = 7
      FieldName = 'THINK'
      Precision = 4
      Size = 2
    end
    object ADOQuery1MIN_aperture: TBCDField
      DisplayLabel = #26368#23567#23380#24452
      DisplayWidth = 13
      FieldName = 'MIN_aperture'
      Precision = 5
      Size = 3
    end
    object ADOQuery1REQ_DATE: TDateTimeField
      DisplayLabel = #38656#27714#26085#26399
      DisplayWidth = 22
      FieldName = 'REQ_DATE'
    end
    object ADOQuery1rece_quantity: TIntegerField
      DisplayLabel = #25509#25910#25968#37327
      DisplayWidth = 13
      FieldName = 'rece_quantity'
    end
    object ADOQuery1REMARK: TStringField
      DisplayLabel = #22791#27880
      DisplayWidth = 60
      FieldName = 'REMARK'
      Size = 50
    end
    object ADOQuery1EMPLOYEE_NAME: TStringField
      DisplayLabel = #25910#36135#20154#21592
      DisplayWidth = 19
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADOQuery1ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830#31616#31216
      DisplayWidth = 13
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADOQuery1DEPT_NAME: TStringField
      DisplayLabel = #22806#21457#24037#24207
      DisplayWidth = 36
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADOQuery1QUANTITY: TIntegerField
      DisplayLabel = #22806#21457#25968#37327
      DisplayWidth = 12
      FieldName = 'QUANTITY'
    end
    object ADOQuery1price: TBCDField
      DisplayLabel = #21333#20215
      FieldName = 'price'
      Precision = 10
    end
    object ADOQuery1pattern_money: TBCDField
      DisplayLabel = #27169#20855#36153
      FieldName = 'pattern_money'
      Precision = 8
      Size = 2
    end
    object ADOQuery1MIN_MONEY: TBCDField
      DisplayLabel = #26368#20302#25910#36153
      FieldName = 'MIN_MONEY'
      Precision = 8
      Size = 2
    end
    object ADOQuery1ENG_MONEY: TBCDField
      DisplayLabel = #24037#31243#36153
      FieldName = 'ENG_MONEY'
      Precision = 8
      Size = 2
    end
    object ADOQuery1TOTAL_MONEY: TBCDField
      DisplayLabel = #37329#39069#23567#35745
      FieldName = 'TOTAL_MONEY'
      Precision = 8
      Size = 3
    end
    object ADOQuery1v_status: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'v_status'
      ReadOnly = True
      Size = 6
    end
    object ADOQuery1MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOQuery1MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADOQuery1reject_qty: TIntegerField
      DisplayLabel = #25253#24223#25968#37327
      FieldName = 'reject_qty'
    end
    object ADOQuery1RETURN_QTY: TIntegerField
      DisplayLabel = #36864#36135#25968#37327
      FieldName = 'RETURN_QTY'
    end
  end
  object PopupMenu1: TPopupMenu
    AutoHotkeys = maManual
    Left = 192
    Top = 112
    object N1: TMenuItem
      Caption = #36865#36135#21333#21495
      Checked = True
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #20379#24212#21830#31616#31216
      Checked = True
      OnClick = N1Click
    end
    object N3: TMenuItem
      Caption = #26412#21378#32534#21495
      Checked = True
      OnClick = N1Click
    end
    object N4: TMenuItem
      Caption = #35268#26684
      Checked = True
      OnClick = N1Click
    end
    object N7: TMenuItem
      Caption = #21333#20301
      Checked = True
      OnClick = N1Click
    end
    object N6: TMenuItem
      Caption = #25509#25910#25968#37327
      Checked = True
      OnClick = N1Click
    end
    object N18: TMenuItem
      Caption = #36864#36135#25968#37327
      Checked = True
      OnClick = N1Click
    end
    object N28: TMenuItem
      Caption = #25253#24223#25968#37327
      Checked = True
      OnClick = N1Click
    end
    object N5: TMenuItem
      Caption = #21333#20215
      Checked = True
      OnClick = N1Click
    end
    object N8: TMenuItem
      Caption = #27169#20855#36153
      Checked = True
      OnClick = N1Click
    end
    object N9: TMenuItem
      Caption = #26368#20302#25910#36153
      Checked = True
      OnClick = N1Click
    end
    object N10: TMenuItem
      Caption = #24037#31243#36153
      Checked = True
      OnClick = N1Click
    end
    object N11: TMenuItem
      Caption = #23567#35745#37329#39069
      Checked = True
      OnClick = N1Click
    end
    object N13: TMenuItem
      Caption = #36865#36135#26085#26399
      Checked = True
      OnClick = N1Click
    end
    object N15: TMenuItem
      Caption = #22791#27880
      Checked = True
      OnClick = N1Click
    end
    object N12: TMenuItem
      Caption = #36865#36135#20154#21592
      Checked = True
      OnClick = N1Click
    end
    object N16: TMenuItem
      Caption = #25910#36135#20154#21592
      Checked = True
      OnClick = N1Click
    end
    object N17: TMenuItem
      Caption = #23458#25143#22411#21495
      Checked = True
      OnClick = N1Click
    end
    object N19: TMenuItem
      Caption = #24179#26041#31859
      Checked = True
      OnClick = N1Click
    end
    object N20: TMenuItem
      Caption = #24179#26041#33521#23610
      Checked = True
      OnClick = N1Click
    end
    object N21: TMenuItem
      Caption = #23618#25968
      Checked = True
      OnClick = N1Click
    end
    object N22: TMenuItem
      Caption = #26495#21402
      Checked = True
      OnClick = N1Click
    end
    object N23: TMenuItem
      Caption = #26368#23567#23380#24452
      Checked = True
      OnClick = N1Click
    end
    object N25: TMenuItem
      Caption = #22806#21457#32534#21495
      Checked = True
      OnClick = N1Click
    end
    object N24: TMenuItem
      Caption = #22806#21457#24037#24207
      Checked = True
      OnClick = N1Click
    end
    object N26: TMenuItem
      Caption = #22806#21457#25968#37327
      Checked = True
      OnClick = N1Click
    end
    object N14: TMenuItem
      Caption = #38656#27714#26085#26399
      Checked = True
      OnClick = N1Click
    end
    object N27: TMenuItem
      Caption = #29366#24577
      Checked = True
      OnClick = N1Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 296
    Top = 256
    object N29: TMenuItem
      Caption = #20923#32467#21015
      OnClick = N29Click
    end
    object N30: TMenuItem
      Caption = #21462#28040#20923#32467
      OnClick = N30Click
    end
  end
end
