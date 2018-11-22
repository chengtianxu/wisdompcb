object Form3: TForm3
  Left = 423
  Top = 139
  Width = 931
  Height = 532
  Caption = #25910#36135#26126#32454#26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 915
    Height = 39
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      915
      39)
    object Label1: TLabel
      Left = 204
      Top = 16
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #36865#36135#21333#21495
    end
    object Label2: TLabel
      Left = 421
      Top = 15
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #20837#20179#31867#22411
    end
    object Button1: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = #20851#38381
      ModalResult = 1
      TabOrder = 1
    end
    object Button2: TButton
      Left = 88
      Top = 8
      Width = 75
      Height = 25
      Caption = #23548#20986#25968#25454
      TabOrder = 2
      OnClick = Button2Click
    end
    object Edit1: TEdit
      Left = 265
      Top = 12
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
    object GroupBox2: TGroupBox
      Left = 642
      Top = 0
      Width = 259
      Height = 38
      Anchors = [akTop, akRight]
      Caption = #26085#26399#33539#22260
      TabOrder = 3
      object Label8: TLabel
        Left = 6
        Top = 17
        Width = 20
        Height = 13
        Alignment = taRightJustify
        Caption = #20174':'
      end
      object Label9: TLabel
        Left = 127
        Top = 17
        Width = 27
        Height = 13
        Alignment = taRightJustify
        Caption = ' '#21040':'
      end
      object dtpk1: TDateTimePicker
        Left = 30
        Top = 13
        Width = 97
        Height = 21
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
        Height = 21
        Date = 37600.000000000000000000
        Time = 37600.000000000000000000
        TabOrder = 1
        OnCloseUp = dtpk1Exit
        OnExit = dtpk1Exit
      end
    end
    object ComboBox1: TComboBox
      Left = 477
      Top = 10
      Width = 108
      Height = 21
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ItemHeight = 13
      ParentFont = False
      TabOrder = 4
      OnChange = ComboBox1Change
      Items.Strings = (
        #25152#26377
        #32534#30721#20837#24211
        #26434#39033#20837#24211
        #30452#25509#20837#24211
        #35843#25320#20837#20179
        'VMI'#20837#24211
        #26434#39033#30452#20837)
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 39
    Width = 915
    Height = 455
    Align = alClient
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'GRN_NUMBER'
        Title.Color = clRed
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DELIVER_NUMBER'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_NUMBER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_PART_NUMBER'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_NAME'
        Width = 141
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_DESCRIPTION'
        Width = 142
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTITY'
        ReadOnly = False
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRICE'
        ReadOnly = False
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAX_2'
        ReadOnly = False
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbr_warehouse'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'v_type'
        Title.Caption = #20837#20179#31867#22411
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ship_DATE'
        ReadOnly = False
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_NAME'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'exch_rate'
        ReadOnly = False
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BARCODE_ID'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXPIRE_DATE'
        ReadOnly = False
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rohs'
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 528
    Top = 456
  end
  object ADOQuery1: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      ' select Stuff_Mesh.GRN_NUMBER, Stuff_Mesh.DELIVER_NUMBER, '
      '      Stuff_Mesh.INV_PART_NUMBER, Stuff_Mesh.INV_NAME, '
      
        '      Stuff_Mesh.INV_DESCRIPTION, Stuff_Mesh.QUANTITY, Stuff_Mes' +
        'h.PRICE, '
      '      Stuff_Mesh.TAX_2, Stuff_Mesh.ABBR_NAME, '
      
        '      Stuff_Mesh.ABBR_NAME AS abbr_warehouse, Stuff_Mesh.EMPLOYE' +
        'E_NAME, '
      
        '      Stuff_Mesh.ship_DATE, Stuff_Mesh.CURR_NAME, Stuff_Mesh.BAR' +
        'CODE_ID, '
      
        '      Stuff_Mesh.EXPIRE_DATE, Stuff_Mesh.TTYPE, Stuff_Mesh.PO_NU' +
        'MBER, '
      
        '      Stuff_Mesh.exch_rate, Stuff_Mesh.rohs,case Stuff_Mesh.ttyp' +
        'e'
      '      when 1 then '#39#32534#30721#20837#24211#39' when  2 then '#39#26434#39033#20837#24211#39
      '      when 3 then '#39#30452#25509#20837#24211#39'  when 4 then '#39#35843#25320#20837#20179#39' '
      '      when 5 then '#39'VMI'#20837#24211#39'   when 6 then '#39#26434#39033#30452#20837#39'  end as v_type'
      'from (  '
      'SELECT dbo.Data0456.GRN_NUMBER, dbo.Data0456.DELIVER_NUMBER, '
      '      dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, '
      
        '      dbo.Data0017.INV_DESCRIPTION, dbo.Data0022.QUANTITY, dbo.D' +
        'ata0022.PRICE, '
      '      dbo.Data0022.TAX_2, dbo.Data0023.ABBR_NAME, '
      
        '      dbo.Data0015.ABBR_NAME AS abbr_warehouse, dbo.Data0005.EMP' +
        'LOYEE_NAME, '
      
        '      dbo.Data0456.ship_DATE, dbo.Data0001.CURR_NAME, dbo.Data00' +
        '22.BARCODE_ID, '
      
        '      dbo.Data0022.EXPIRE_DATE, dbo.Data0456.TTYPE, dbo.Data0070' +
        '.PO_NUMBER, '
      
        '      dbo.Data0456.exch_rate, dbo.Data0022.rohs,case data0456.tt' +
        'ype'
      '      when 1 then '#39#32534#30721#20837#24211#39' when  2 then '#39#26434#39033#20837#24211#39
      '      when 3 then '#39#30452#25509#20837#24211#39'  when 4 then '#39#35843#25320#20837#20179#39' '
      '      when 5 then '#39'VMI'#20837#24211#39'    when 6 then '#39#26434#39033#30452#20837#39'   end as v_type'
      'FROM dbo.Data0022 INNER JOIN'
      
        '      dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR = dbo.Data0017.' +
        'RKEY INNER JOIN'
      
        '      dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY I' +
        'NNER JOIN'
      
        '      dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY ' +
        'INNER JOIN'
      
        '      dbo.Data0015 ON dbo.Data0456.warehouse_ptr = dbo.Data0015.' +
        'RKEY INNER JOIN'
      
        '      dbo.Data0005 ON dbo.Data0456.CREATE_BY = dbo.Data0005.RKEY' +
        ' INNER JOIN'
      '      dbo.Data0001 ON '
      
        '      dbo.Data0456.currency_ptr = dbo.Data0001.RKEY LEFT OUTER J' +
        'OIN'
      '      dbo.Data0070 ON dbo.Data0456.PO_PTR = dbo.Data0070.RKEY  '
      '    union '
      '    select dbo.Data0456.GRN_NUMBER,dbo.Data0456.DELIVER_NUMBER,'
      '       null,dbo.Data0235.goods_name,'
      
        '       dbo.Data0235.goods_guige,dbo.Data0235.QUAN_RECD, dbo.Data' +
        '0235.unit_price*(1-dbo.Data0235.state_tax/100),'
      '       dbo.Data0235.state_tax,dbo.Data0023.ABBR_NAME, '
      
        '       dbo.Data0015.ABBR_NAME AS abbr_warehouse,dbo.Data0005.EMP' +
        'LOYEE_NAME, '
      
        '       dbo.Data0456.ship_DATE,dbo.Data0001.CURR_NAME,dbo.Data023' +
        '5.REF_NUMBER, '
      
        '       dbo.Data0235.DATE_RECD,dbo.Data0456.TTYPE,dbo.Data0070.PO' +
        '_NUMBER, '
      
        '       dbo.Data0456.exch_rate,dbo.Data0235.rohs,case data0456.tt' +
        'ype'
      '       when 1 then '#39#32534#30721#20837#24211#39' when  2 then '#39#26434#39033#20837#24211#39
      
        '       when 3 then '#39#30452#25509#20837#24211#39'  when 4 then '#39#35843#25320#20837#20179#39'  when 5 then '#39'VMI'#20837 +
        #24211#39' '
      '        when 6 then '#39#26434#39033#30452#20837#39'     end as v_type'
      'from dbo.Data0235 INNER JOIN'
      
        #9'  dbo.Data0456 ON dbo.Data0235.GRN_PTR = dbo.Data0456.RKEY INNE' +
        'R JOIN'
      
        #9'  dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY INN' +
        'ER JOIN'
      
        #9'  dbo.Data0015 ON dbo.Data0456.warehouse_ptr = dbo.Data0015.RKE' +
        'Y INNER JOIN'
      
        #9'  dbo.Data0005 ON dbo.Data0456.CREATE_BY = dbo.Data0005.RKEY IN' +
        'NER JOIN'
      
        #9'  dbo.Data0001 ON dbo.Data0456.currency_ptr = dbo.Data0001.RKEY' +
        ' LEFT OUTER JOIN'
      #9'  dbo.Data0070 ON dbo.Data0456.PO_PTR = dbo.Data0070.RKEY '
      ')  as Stuff_Mesh '
      
        'where Stuff_Mesh.SHIP_DATE>=:dtpk1 and Stuff_Mesh.SHIP_DATE<=:dt' +
        'pk2')
    Left = 560
    Top = 456
    object ADOQuery1GRN_NUMBER: TStringField
      DisplayLabel = #20837#24211#21333#21495
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object ADOQuery1DELIVER_NUMBER: TStringField
      DisplayLabel = #36865#36135#21333#21495
      FieldName = 'DELIVER_NUMBER'
      Size = 15
    end
    object ADOQuery1INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADOQuery1INV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ADOQuery1INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      DisplayWidth = 30
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ADOQuery1QUANTITY: TBCDField
      DisplayLabel = #25509#25910#25968#37327
      FieldName = 'QUANTITY'
      Precision = 9
      Size = 3
    end
    object ADOQuery1TAX_2: TBCDField
      DisplayLabel = #31246#29575'%'
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object ADOQuery1abbr_warehouse: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'abbr_warehouse'
      Size = 10
    end
    object ADOQuery1ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADOQuery1CURR_NAME: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_NAME'
    end
    object ADOQuery1EMPLOYEE_NAME: TStringField
      DisplayLabel = #25910#36135#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADOQuery1ship_DATE: TDateTimeField
      DisplayLabel = #25910#36135#26085#26399
      FieldName = 'ship_DATE'
    end
    object ADOQuery1BARCODE_ID: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'BARCODE_ID'
      Size = 50
    end
    object ADOQuery1EXPIRE_DATE: TDateTimeField
      DisplayLabel = #26377#25928#26399
      FieldName = 'EXPIRE_DATE'
    end
    object ADOQuery1TTYPE: TWordField
      FieldName = 'TTYPE'
    end
    object ADOQuery1PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#35746#21333
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object ADOQuery1exch_rate: TBCDField
      DisplayLabel = #27719#29575
      FieldName = 'exch_rate'
      Precision = 12
      Size = 8
    end
    object ADOQuery1rohs: TStringField
      DisplayLabel = #29615#20445#26631#35782
      FieldName = 'rohs'
      Size = 10
    end
    object ADOQuery1v_type: TStringField
      FieldName = 'v_type'
      ReadOnly = True
      Size = 8
    end
    object ADOQuery1PRICE: TBCDField
      DisplayLabel = #21333#20215'('#19981#21547#31246')'
      FieldName = 'PRICE'
      Precision = 15
      Size = 6
    end
  end
end
