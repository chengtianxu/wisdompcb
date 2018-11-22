object FAcctSearch: TFAcctSearch
  Left = 239
  Top = 154
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20250#35745#31185#30446#26597#25214
  ClientHeight = 515
  ClientWidth = 521
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 0
    Width = 521
    Height = 37
    Cursor = crArrow
    Align = alTop
  end
  object Label1: TLabel
    Left = 80
    Top = 12
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #31185#30446#20195#30721':'
  end
  object Edit1: TEdit
    Left = 142
    Top = 8
    Width = 162
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
  end
  object BitBtn1: TBitBtn
    Left = 308
    Top = 7
    Width = 25
    Height = 25
    Hint = #21047#26032
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
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
  object Button2: TButton
    Left = 275
    Top = 482
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 2
  end
  object Button1: TButton
    Left = 147
    Top = 482
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 3
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 37
    Width = 521
    Height = 435
    Align = alTop
    DataSource = DataSource1
    Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'GL_ACC_NUMBER'
        Title.Color = clRed
        Width = 123
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'description_2'
        Width = 260
        Visible = True
      end
      item
        Expanded = False
        FieldName = #31867#22411
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = #22806#24065#26680#31639
        Width = 63
        Visible = True
      end>
  end
  object RadioGroup1: TRadioGroup
    Left = 343
    Top = 0
    Width = 166
    Height = 35
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #21069#26041#19968#33268
      #27169#31946#26597#25214)
    TabOrder = 5
  end
  object DataSource1: TDataSource
    DataSet = Qry
    OnDataChange = DataSource1DataChange
    Left = 219
    Top = 208
  end
  object Qry: TADOQuery
    Connection = DM.Conn
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'vlen'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 4
      end>
    SQL.Strings = (
      
        'SELECT dbo.Data0103.RKEY, dbo.Data0103.CURR_TP, dbo.Data0103.CUR' +
        'R_PTR,'
      
        '      CASE data0103.db_cr WHEN '#39'D'#39' THEN '#39#20511#26041#39' WHEN '#39'C'#39' THEN '#39#36151#26041#39' ' +
        'END AS '#31867#22411','
      '      case data0103.curr_tp when 0 then '#39#19981#26680#31639#39
      '                            when 1 then '#39#26680#31639#39
      '                            when 2 then '#39#26680#31639#21333#19968#39
      '      end  as '#22806#24065#26680#31639','
      '      Data0103.GL_ACC_NUMBER,'
      'case when data0103_2.GL_DESCRIPTION is not null then'
      '  data0103_2.GL_DESCRIPTION+'#39'-'#39'+'
      '  data0103_1.GL_DESCRIPTION+'#39'-'#39'+data0103.GL_DESCRIPTION'
      'else'
      ' case when data0103_1.GL_DESCRIPTION is not null then'
      '   data0103_1.GL_DESCRIPTION+'#39'-'#39'+data0103.GL_DESCRIPTION'
      '  else data0103.GL_DESCRIPTION'
      '  end  '
      'end as description_2'
      'FROM dbo.Data0103 Data0103_2 RIGHT OUTER JOIN'
      '      dbo.Data0103 Data0103_1 ON '
      '      Data0103_2.RKEY = Data0103_1.PARENT_PTR RIGHT OUTER JOIN'
      '      dbo.Data0103 ON Data0103_1.RKEY = dbo.Data0103.PARENT_PTR'
      'where len(dbo.Data0103.gl_acc_number)<=:vlen'
      'order by dbo.Data0103.gl_acc_number')
    Left = 256
    Top = 208
    object QryRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object QryCURR_TP: TWordField
      FieldName = 'CURR_TP'
    end
    object QryCURR_PTR: TIntegerField
      FieldName = 'CURR_PTR'
    end
    object QryDSDesigner: TStringField
      FieldName = #31867#22411
      ReadOnly = True
      Size = 4
    end
    object QryDSDesigner2: TStringField
      FieldName = #22806#24065#26680#31639
      ReadOnly = True
      Size = 8
    end
    object QryGL_ACC_NUMBER: TStringField
      DisplayLabel = #31185#30446#20195#30721
      FieldName = 'GL_ACC_NUMBER'
      Size = 18
    end
    object Qrydescription_2: TStringField
      DisplayLabel = #31185#30446#21517#31216
      FieldName = 'description_2'
      ReadOnly = True
      Size = 152
    end
  end
end
