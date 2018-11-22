object FrmCustPart: TFrmCustPart
  Left = 298
  Top = 145
  AutoScroll = False
  Caption = #36873#25321#20135#21697#22411#21495
  ClientHeight = 493
  ClientWidth = 442
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 0
    Width = 442
    Height = 44
    Cursor = crArrow
    Align = alTop
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 44
    Width = 442
    Height = 408
    Align = alClient
    DataSource = DataSource1
    FixedColor = clSilver
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'manu_part_number'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'manu_part_desc'
        Width = 179
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bath_former'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qty_on_hand'
        Title.Alignment = taRightJustify
        Title.Caption = #24211#23384#25968#37327
        Width = 68
        Visible = True
      end>
  end
  object Edit1: TEdit
    Left = 200
    Top = 10
    Width = 113
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
    OnChange = Edit1Change
    OnClick = Edit1Click
  end
  object BitBtn3: TBitBtn
    Left = 315
    Top = 11
    Width = 23
    Height = 22
    Hint = #26597#25214#23458#25143#32534#21495
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
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
  object Panel1: TPanel
    Left = 0
    Top = 452
    Width = 442
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object Button1: TButton
      Left = 131
      Top = 10
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 211
      Top = 10
      Width = 75
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object RadioGroup1: TRadioGroup
    Left = 26
    Top = 2
    Width = 170
    Height = 31
    Caption = #26597#25214
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #26412#21378#32534#21495
      #23458#25143#22411#21495)
    TabOrder = 4
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    OnDataChange = DataSource1DataChange
    Left = 192
    Top = 119
  end
  object ADOQuery1: TADOQuery
    Connection = FrmMain.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    ParamCheck = False
    Parameters = <>
    SQL.Strings = (
      'select'
      ' rkey,manu_part_number,manu_part_desc,'
      ' qty_on_hand,'
      ' case data0025.ttype'
      ' when 0 then '#39#25209#37327#39' when 1 then '#39#26679#26495#39
      ' end as bath_former'
      'from  data0025'
      'where data0025.PARENT_PTR is null'
      ''
      'order by manu_part_number')
    Left = 112
    Top = 138
    object ADOQuery1rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery1manu_part_number: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'manu_part_number'
    end
    object ADOQuery1manu_part_desc: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'manu_part_desc'
      Size = 40
    end
    object ADOQuery1bath_former: TStringField
      DisplayLabel = #37327#20135'/'#26679#26495
      FieldName = 'bath_former'
      ReadOnly = True
      Size = 4
    end
    object ADOQuery1qty_on_hand: TIntegerField
      FieldName = 'qty_on_hand'
    end
  end
end
