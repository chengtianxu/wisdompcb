object Form_invtype: TForm_invtype
  Left = 300
  Top = 182
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26448#26009#31867#21035#25628#32034
  ClientHeight = 474
  ClientWidth = 667
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 169
    Top = 9
    Width = 166
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = DBGrid1KeyDown
  end
  object BitBtn1: TBitBtn
    Left = 342
    Top = 8
    Width = 25
    Height = 25
    Hint = #21047#26032
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
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
  object Button1: TButton
    Left = 260
    Top = 436
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 3
  end
  object Button2: TButton
    Left = 468
    Top = 436
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 4
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 37
    Width = 665
    Height = 388
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'GROUP_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GROUP_DESC'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inv_group_desc'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INSPECT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHELF_LIFE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CATALOG_NUM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AVL_FLAG'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = #31867#22411
        Visible = True
      end>
  end
  object rg1: TRadioGroup
    Left = 2
    Top = -1
    Width = 161
    Height = 34
    BiDiMode = bdLeftToRight
    Columns = 2
    Ctl3D = True
    ItemIndex = 0
    Items.Strings = (
      #20195#30721
      #21517#31216)
    ParentBiDiMode = False
    ParentCtl3D = False
    TabOrder = 5
    OnClick = rg1Click
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    OnDataChange = DataSource1DataChange
    Left = 388
    Top = 435
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'SELECT   Data0496.RKEY, Data0496.GROUP_NAME, data0496.if_flag,'
      
        '         Data0496.GROUP_DESC, Data0496.ttype, data0496.mask_inv_' +
        'number,'
      
        '         Data0019.inv_group_name,Data0019.inv_group_desc, Data04' +
        '96.INSPECT, '
      
        'Data0496.SHELF_LIFE, Data0496.CATALOG_NUM, Data0496.AVL_FLAG,dat' +
        'a0496.Rkey595,'
      'case Data0496.ttype when '#39'P'#39' then '#39#30452#25509#26448#26009#39' else '#39#38388#25509#26448#26009#39' end as '#31867#22411
      'FROM     Data0019 INNER JOIN'
      '         Data0496 ON Data0019.rkey = Data0496.group_ptr'
      'order by '
      ' data0496.group_name')
    Left = 424
    Top = 436
    object ADOQuery1RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQuery1GROUP_NAME: TStringField
      DisplayLabel = #31867#21035#20195#30721
      FieldName = 'GROUP_NAME'
      Size = 10
    end
    object ADOQuery1if_flag: TWordField
      FieldName = 'if_flag'
    end
    object ADOQuery1GROUP_DESC: TStringField
      DisplayLabel = #31867#21035#21517#31216
      FieldName = 'GROUP_DESC'
      Size = 30
    end
    object ADOQuery1ttype: TStringField
      FieldName = 'ttype'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1mask_inv_number: TStringField
      FieldName = 'mask_inv_number'
      Size = 25
    end
    object ADOQuery1inv_group_name: TStringField
      FieldName = 'inv_group_name'
    end
    object ADOQuery1inv_group_desc: TStringField
      DisplayLabel = #32452#21035#21517#31216
      FieldName = 'inv_group_desc'
      Size = 40
    end
    object ADOQuery1INSPECT: TWideStringField
      DisplayLabel = #26159#21542#26816#39564
      FieldName = 'INSPECT'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1SHELF_LIFE: TSmallintField
      DisplayLabel = #20445#23384#26399#22825#25968
      FieldName = 'SHELF_LIFE'
    end
    object ADOQuery1CATALOG_NUM: TWideStringField
      DisplayLabel = #29615#20445#27979#35797
      FieldName = 'CATALOG_NUM'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1AVL_FLAG: TWideStringField
      DisplayLabel = #35748#21487#20379#24212#21830
      FieldName = 'AVL_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1DSDesigner: TStringField
      FieldName = #31867#22411
      ReadOnly = True
      Size = 8
    end
    object ADOQuery1Rkey595: TIntegerField
      FieldName = 'Rkey595'
    end
  end
end
