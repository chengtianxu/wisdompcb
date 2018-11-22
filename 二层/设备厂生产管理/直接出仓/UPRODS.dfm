object ProdS_Form: TProdS_Form
  Left = 502
  Top = 185
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20135#21697#24211#23384#26597#25214
  ClientHeight = 415
  ClientWidth = 355
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 81
    Top = 12
    Width = 52
    Height = 13
    Caption = #20135#21697#32534#30721
  end
  object Button1: TButton
    Left = 96
    Top = 375
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 0
  end
  object Button2: TButton
    Left = 192
    Top = 375
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 137
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 2
    OnChange = Edit1Change
  end
  object DBGrid1: TDBGrid
    Left = 1
    Top = 44
    Width = 353
    Height = 321
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'PROD_CODE'
        Title.Color = clRed
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRODUCT_NAME'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCATION'
        Title.Caption = #20179#24211#21517#31216
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qty_on_hand'
        ReadOnly = False
        Width = 61
        Visible = True
      end>
  end
  object BitBtn2: TBitBtn
    Left = 268
    Top = 6
    Width = 29
    Height = 28
    Hint = #21047#26032
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    TabStop = False
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
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 40
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'SELECT dbo.Data0008.PROD_CODE, dbo.Data0008.PRODUCT_NAME, '
      
        '      dbo.Data0016.LOCATION, dbo.Data0002.UNIT_NAME, dbo.WZCP000' +
        '1.qty_on_hand, '
      '      dbo.WZCP0001.location_ptr, dbo.WZCP0001.proc_ptr,'
      '      dbo.Data0016.code'
      'FROM dbo.Data0008 INNER JOIN'
      
        '      dbo.WZCP0001 ON dbo.Data0008.RKEY = dbo.WZCP0001.proc_ptr ' +
        'INNER JOIN'
      
        '      dbo.Data0002 ON dbo.Data0008.unit_ptr = dbo.Data0002.RKEY ' +
        'INNER JOIN'
      
        '      dbo.Data0016 ON dbo.WZCP0001.location_ptr = dbo.Data0016.R' +
        'KEY'
      ''
      'where WZCP0001.qty_on_hand>0')
    Left = 8
    object ADOQuery1PROD_CODE: TStringField
      DisplayLabel = #20135#21697#20195#30721
      DisplayWidth = 20
      FieldName = 'PROD_CODE'
    end
    object ADOQuery1PRODUCT_NAME: TStringField
      DisplayLabel = #20135#21697#21517#31216
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADOQuery1LOCATION: TStringField
      DisplayLabel = #20179#24211
      FieldName = 'LOCATION'
      Size = 10
    end
    object ADOQuery1UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object ADOQuery1qty_on_hand: TBCDField
      DisplayLabel = #24403#21069#24211#23384
      FieldName = 'qty_on_hand'
      Precision = 10
      Size = 3
    end
    object ADOQuery1location_ptr: TIntegerField
      FieldName = 'location_ptr'
    end
    object ADOQuery1proc_ptr: TIntegerField
      FieldName = 'proc_ptr'
    end
    object ADOQuery1code: TStringField
      FieldName = 'code'
      FixedChar = True
      Size = 5
    end
  end
end
