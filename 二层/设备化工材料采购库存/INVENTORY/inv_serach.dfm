object form_inv: Tform_inv
  Left = 229
  Top = 148
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #24211#23384#21407#26448#26009#25628#32034
  ClientHeight = 453
  ClientWidth = 556
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
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
    Left = 57
    Top = 13
    Width = 87
    Height = 13
    Alignment = taRightJustify
    Caption = '    '#29289#26009#32534#30721':'
  end
  object Edit1: TEdit
    Left = 152
    Top = 9
    Width = 210
    Height = 22
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = DBGrid1KeyDown
  end
  object BitBtn1: TBitBtn
    Left = 368
    Top = 8
    Width = 25
    Height = 25
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
  object Button1: TButton
    Left = 183
    Top = 422
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 2
  end
  object Button2: TButton
    Left = 263
    Top = 422
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 3
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 36
    Width = 557
    Height = 381
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = GB2312_CHARSET
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
        FieldName = 'INV_PART_NUMBER'
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inv_name'
        Width = 151
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inv_description'
        Width = 250
        Visible = True
      end>
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    ParamCheck = False
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      '  data0017.RKEY ,INV_PART_NUMBER,inv_name,inv_description,'
      '  GROUP_NAME,GROUP_DESC,data0017.group_ptr'
      
        'FROM Data0017 inner join data0496 on data0017.group_ptr=data0496' +
        '.rkey'
      ''
      'ORDER BY INV_PART_NUMBER')
    Left = 448
    Top = 422
    object ADOQuery1RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQuery1INV_PART_NUMBER: TStringField
      DisplayLabel = #29289#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADOQuery1inv_name: TStringField
      DisplayLabel = #29289#26009#21517#31216
      FieldName = 'inv_name'
      Size = 30
    end
    object ADOQuery1inv_description: TStringField
      DisplayLabel = #29289#26009#35268#26684
      FieldName = 'inv_description'
      Size = 70
    end
    object ADOQuery1GROUP_NAME: TStringField
      FieldName = 'GROUP_NAME'
      Size = 10
    end
    object ADOQuery1GROUP_DESC: TStringField
      FieldName = 'GROUP_DESC'
      Size = 30
    end
    object ADOQuery1group_ptr: TIntegerField
      FieldName = 'group_ptr'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 408
    Top = 422
  end
end
