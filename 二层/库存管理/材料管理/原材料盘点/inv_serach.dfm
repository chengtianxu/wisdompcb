object form_inv: Tform_inv
  Left = 229
  Top = 148
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #24211#23384#21407#26448#26009#25628#32034
  ClientHeight = 481
  ClientWidth = 556
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'ËÎÌו'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 68
    Top = 19
    Width = 63
    Height = 13
    Alignment = taRightJustify
    Caption = #26448#26009#20195#30721':'
  end
  object Edit1: TEdit
    Left = 139
    Top = 15
    Width = 210
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = DBGrid1KeyDown
  end
  object BitBtn1: TBitBtn
    Left = 355
    Top = 12
    Width = 25
    Height = 25
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
    Left = 183
    Top = 448
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 3
  end
  object Button2: TButton
    Left = 263
    Top = 448
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 4
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 50
    Width = 557
    Height = 390
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'ËÎÌו'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'INV_PART_NUMBER'
        Title.Caption = #21407#26448#26009#20195#30721
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_PART_DESCRIPTION'
        Title.Caption = #26448#26009#21517#31216#35268#26684
        Width = 301
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'manufacturer_name'
        Title.Caption = #21046#36896#21830#21517#31216
        Width = 101
        Visible = True
      end>
  end
  object RadioGroup1: TRadioGroup
    Left = 394
    Top = 0
    Width = 156
    Height = 50
    Caption = #26597#25214#23383#27573
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #20195#30721
      #21517#31216)
    TabOrder = 5
    OnClick = RadioGroup1Click
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
      '  Data0017.RKEY ,'
      '  Data0017.INV_PART_NUMBER ,'
      '  Data0017.INV_PART_DESCRIPTION ,'
      '  manufacturer_name,data0017.GROUP_PTR,'
      '  data0496.group_name,data0496.group_desc'
      'FROM'
      '  Data0017 inner join data0496 on'
      '  data0017.group_ptr=data0496.rkey'
      'WHERE'
      '  Data0017.P_M = '#39'P'#39
      'ORDER BY'
      '  INV_PART_NUMBER')
    Left = 440
    Top = 446
    object ADOQuery1RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQuery1INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
    end
    object ADOQuery1INV_PART_DESCRIPTION: TStringField
      FieldName = 'INV_PART_DESCRIPTION'
      Size = 100
    end
    object ADOQuery1manufacturer_name: TStringField
      FieldName = 'manufacturer_name'
      FixedChar = True
    end
    object ADOQuery1GROUP_PTR: TIntegerField
      FieldName = 'GROUP_PTR'
    end
    object ADOQuery1group_name: TStringField
      FieldName = 'group_name'
      Size = 10
    end
    object ADOQuery1group_desc: TStringField
      FieldName = 'group_desc'
      Size = 30
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 408
    Top = 446
  end
end
