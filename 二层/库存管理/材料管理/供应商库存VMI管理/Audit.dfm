object Form_Audit: TForm_Audit
  Left = 226
  Top = 109
  Width = 1000
  Height = 560
  Caption = #20462#25913#23457#26680
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
    Width = 992
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      992
      41)
    object Label1: TLabel
      Left = 266
      Top = 14
      Width = 60
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #20986#20179#21333#21495
    end
    object BitBtn1: TBitBtn
      Left = 6
      Top = 5
      Width = 55
      Height = 29
      Cursor = crHandPoint
      Hint = #36864#20986
      Caption = #36864#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TabStop = False
      OnClick = BitBtn1Click
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
      Left = 333
      Top = 10
      Width = 121
      Height = 21
      TabOrder = 1
      OnChange = Edit1Change
    end
    object GroupBox2: TGroupBox
      Left = 733
      Top = 0
      Width = 259
      Height = 38
      Anchors = [akTop, akRight]
      Caption = #26085#26399#33539#22260
      TabOrder = 2
      object Label8: TLabel
        Left = 243
        Top = 209
        Width = 20
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #20174':'
      end
      object Label9: TLabel
        Left = 131
        Top = 17
        Width = 20
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #21040':'
      end
      object dtpk1: TDateTimePicker
        Left = 30
        Top = 13
        Width = 97
        Height = 21
        Date = 37600.000000000000000000
        Time = 37600.000000000000000000
        TabOrder = 0
        OnCloseUp = dtpk1CloseUp
        OnExit = dtpk1CloseUp
      end
      object DTPk2: TDateTimePicker
        Left = 156
        Top = 13
        Width = 97
        Height = 21
        Date = 37600.000000000000000000
        Time = 37600.000000000000000000
        TabOrder = 1
        OnCloseUp = dtpk1CloseUp
        OnExit = dtpk1CloseUp
      end
    end
    object BitBtn3: TBitBtn
      Left = 62
      Top = 5
      Width = 55
      Height = 29
      Hint = #21047#26032#25968#25454
      Caption = #21047#26032
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BitBtn3Click
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
    object BitBtn2: TBitBtn
      Left = 454
      Top = 8
      Width = 30
      Height = 26
      Hint = #21047#26032#25968#25454
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = BitBtn2Click
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
    object Button2: TButton
      Left = 117
      Top = 5
      Width = 61
      Height = 29
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = #25253#34920#23450#20041
      TabOrder = 5
      OnClick = Button2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 388
    Width = 992
    Height = 145
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object DBGrid3: TDBGrid
      Left = 0
      Top = 0
      Width = 992
      Height = 145
      Align = alClient
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'DESCRIPTION'
          Width = 129
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GUI_GE'
          Width = 163
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPTION2'
          Width = 82
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIT_NAME'
          Width = 54
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QUAN_RECD'
          Width = 73
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LOCATION'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REF_NUMBER'
          Width = 108
          Visible = True
        end>
    end
    object DBGrid2: TDBGrid
      Left = 0
      Top = 0
      Width = 992
      Height = 145
      Align = alClient
      DataSource = DataSource2
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = PopupMenu2
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'inv_part_number'
          Title.Caption = #26448#26009#32534#30721
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'inv_name'
          Title.Caption = #26448#26009#21517#31216
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantity'
          Title.Caption = #21457#25918#25968#37327
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'rtn_quantity'
          Title.Caption = #36864#22238#25968#37327
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tax_price'
          Title.Caption = #21547#31246#20215#26684
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tax_2'
          Title.Caption = #31246#29575
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quan_on_hand'
          Title.Caption = #24211#23384#25968#37327
          Visible = True
        end>
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 992
    Height = 347
    Align = alClient
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'gon_number'
        Title.Caption = #20986#20179#21333#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'stype'
        Title.Caption = #20986#20179#31867#22411
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sstatus'
        Title.Caption = #29366#24577
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'create_date'
        Title.Caption = #21019#24314#26085#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ref_number'
        Title.Caption = #22791#27880
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'warehouse_code'
        Title.Caption = #24037#21378#20195#30721
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'warehouse_name'
        Title.Caption = #24037#21378#21517#31216
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'employee_name'
        Title.Caption = #21019#24314#20154#21592
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'employee_name_1'
        Title.Caption = #39046#26009#20154#21592
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'code'
        Title.Caption = #20379#24212#21830#20195#30721
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'supplier_name'
        Title.Caption = #20379#24212#21830#21517#31216
        Visible = True
      end>
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 72
    Top = 136
    object N5: TMenuItem
      Caption = #23457#26680#20986#24211
      OnClick = N5Click
    end
    object N6: TMenuItem
      Caption = #36864#20179#25171#21360
      OnClick = N1Click
    end
  end
  object DataSource1: TDataSource
    DataSet = ADS148
    Left = 536
    Top = 464
  end
  object DataSource2: TDataSource
    DataSet = ADO149
    Left = 560
    Top = 128
  end
  object ADO149: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select data0149.rkey,data0149.quantity,data0149.rtn_quantity,dat' +
        'a0149.tax_price,data0149.tax_2,'
      
        'data0149.d0134_ptr,data0017.inv_part_number,data0017.inv_name,da' +
        'ta0134.quan_on_hand'
      'from data0149 inner join '
      'data0017 on data0149.inventory_ptr=data0017.rkey inner join'
      'data0134 on data0149.d0134_ptr=data0134.rkey '
      'where data0149.gon_ptr=:rkey')
    Left = 576
    Top = 448
    object ADO149quantity: TBCDField
      FieldName = 'quantity'
      Precision = 14
    end
    object ADO149rtn_quantity: TBCDField
      FieldName = 'rtn_quantity'
      Precision = 14
    end
    object ADO149tax_price: TBCDField
      FieldName = 'tax_price'
      Precision = 12
      Size = 3
    end
    object ADO149tax_2: TBCDField
      FieldName = 'tax_2'
      Precision = 4
      Size = 2
    end
    object ADO149d0134_ptr: TIntegerField
      FieldName = 'd0134_ptr'
    end
    object ADO149inv_part_number: TStringField
      FieldName = 'inv_part_number'
      Size = 25
    end
    object ADO149inv_name: TStringField
      FieldName = 'inv_name'
      Size = 30
    end
    object ADO149quan_on_hand: TBCDField
      FieldName = 'quan_on_hand'
      Precision = 19
    end
    object ADO149rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
  end
  object ADS148: TADODataSet
    Active = True
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select data0724.rkey,data0724.gon_number,data0724.ttype,data0724' +
      '.status,'#13#10'case data0724.ttype'#13#10'when 0 then '#39#36864#36135#20986#20179#39#13#10'when 1 then '#39 +
      #39046#26009#20986#20179#39' end as stype,'#13#10'case data0724.status'#13#10'when 0 then '#39#26410#20986#24211#39#13#10'wh' +
      'en 1 then '#39#24050#20986#24211#39' end as sstatus,'#13#10'data0724.create_date,data0724.r' +
      'ef_number,'#13#10'data0015.warehouse_code,data0015.warehouse_name,'#13#10'da' +
      'ta0005.employee_name ,data0005_1.employee_name employee_name_1,'#13 +
      #10'data0023.code,data0023.supplier_name'#13#10'from data0724 inner join'#13 +
      #10'data0015 on data0724.warehouse_ptr=data0015.rkey inner join'#13#10'da' +
      'ta0023 on data0724.supplier_ptr=data0023.rkey inner join'#13#10'data00' +
      '05 on data0724.create_by=data0005.rkey inner join'#13#10'data0005 as d' +
      'ata0005_1 on data0724.recd_by=data0005_1.rkey'#13#10'where data0724.cr' +
      'eate_date>=:dtpk1 and data0724.create_date<=:dtpk2  and  data072' +
      '4.ttype=0'
    IndexFieldNames = 'gon_number'
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
    Left = 616
    Top = 128
    object ADS148rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADS148gon_number: TStringField
      FieldName = 'gon_number'
      Size = 10
    end
    object ADS148ttype: TSmallintField
      FieldName = 'ttype'
    end
    object ADS148status: TWordField
      FieldName = 'status'
    end
    object ADS148stype: TStringField
      FieldName = 'stype'
      ReadOnly = True
      Size = 8
    end
    object ADS148sstatus: TStringField
      FieldName = 'sstatus'
      ReadOnly = True
      Size = 6
    end
    object ADS148create_date: TDateTimeField
      FieldName = 'create_date'
    end
    object ADS148ref_number: TStringField
      FieldName = 'ref_number'
      Size = 50
    end
    object ADS148warehouse_code: TStringField
      FieldName = 'warehouse_code'
      Size = 5
    end
    object ADS148warehouse_name: TStringField
      FieldName = 'warehouse_name'
      Size = 70
    end
    object ADS148employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object ADS148employee_name_1: TStringField
      FieldName = 'employee_name_1'
      Size = 16
    end
    object ADS148code: TStringField
      FieldName = 'code'
      Size = 10
    end
    object ADS148supplier_name: TStringField
      FieldName = 'supplier_name'
      Size = 100
    end
  end
  object ADOQuery1: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select quan_on_hand,data0134.quantity'
      
        'from data0134 inner join data0149 on data0134.rkey=data0149.d013' +
        '4_ptr '
      'where data0149.rkey=:rkey')
    Left = 536
    object ADOQuery1quan_on_hand: TBCDField
      FieldName = 'quan_on_hand'
      Precision = 19
    end
    object ADOQuery1quantity: TBCDField
      FieldName = 'quantity'
      Precision = 19
    end
  end
  object PopupMenu2: TPopupMenu
    OnPopup = PopupMenu2Popup
    Left = 296
    Top = 444
    object N1: TMenuItem
      Caption = #20462#25913#25968#37327
      OnClick = N6Click
    end
  end
end
