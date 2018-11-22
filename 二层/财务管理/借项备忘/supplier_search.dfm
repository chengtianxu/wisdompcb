object Form_supp: TForm_supp
  Left = 326
  Top = 160
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20379#24212#21830#25628#32034
  ClientHeight = 453
  ClientWidth = 426
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 0
    Width = 426
    Height = 36
    Cursor = crArrow
    Align = alTop
  end
  object Label1: TLabel
    Left = 218
    Top = 13
    Width = 39
    Height = 13
    Alignment = taRightJustify
    Caption = #25353#20195#30721':'
  end
  object Edit1: TEdit
    Left = 260
    Top = 9
    Width = 109
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = DBGrid1KeyDown
  end
  object BitBtn1: TBitBtn
    Left = 375
    Top = 5
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
  object Button1: TButton
    Left = 129
    Top = 421
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 2
  end
  object Button2: TButton
    Left = 209
    Top = 421
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 3
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 36
    Width = 426
    Height = 376
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'CODE'
        Title.Caption = #20379#24212#21830#20195#30721
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUPPLIER_NAME'
        Title.Caption = #20379#24212#21830#22995#21517
        Width = 192
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'curr_name'
        Width = 115
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 412
    Width = 426
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 5
    object Button3: TButton
      Left = 118
      Top = 10
      Width = 75
      Height = 25
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object Button4: TButton
      Left = 215
      Top = 10
      Width = 76
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object RadioGroup1: TRadioGroup
    Left = 11
    Top = 0
    Width = 166
    Height = 34
    Caption = #26597#25214#26041#24335
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #25353#20195#21495
      #25353#21517#31216)
    TabOrder = 6
    OnClick = RadioGroup1Click
  end
  object DataSource1: TDataSource
    DataSet = ADOData0023
    Left = 72
    Top = 416
  end
  object ADOData0023: TADOQuery
    Connection = dm.ACt
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    ParamCheck = False
    Parameters = <>
    SQL.Strings = (
      'SELECT data0023.RKEY,CODE,SUPPLIER_NAME,DISCOUNT,DISCOUNT_DAYS,'
      'DISCOUNT2,DISCOUNT2_DAYS,PAYMENT_TERMS,currency_ptr,abbr_name,'
      'data0001.curr_code,data0001.curr_name,'
      'data0001.BASE_TO_OTHER,data0023.ACC_PAYABLE_PTR'
      'FROM  Data0023 inner join data0001'
      'on data0023.currency_ptr=data0001.rkey'
      'ORDER BY CODE')
    Left = 40
    Top = 416
    object ADOData0023RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOData0023CODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object ADOData0023SUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object ADOData0023DISCOUNT: TFloatField
      FieldName = 'DISCOUNT'
    end
    object ADOData0023DISCOUNT_DAYS: TSmallintField
      FieldName = 'DISCOUNT_DAYS'
    end
    object ADOData0023DISCOUNT2: TFloatField
      FieldName = 'DISCOUNT2'
    end
    object ADOData0023DISCOUNT2_DAYS: TSmallintField
      FieldName = 'DISCOUNT2_DAYS'
    end
    object ADOData0023PAYMENT_TERMS: TSmallintField
      FieldName = 'PAYMENT_TERMS'
    end
    object ADOData0023currency_ptr: TIntegerField
      FieldName = 'currency_ptr'
    end
    object ADOData0023abbr_name: TStringField
      FieldName = 'abbr_name'
      Size = 10
    end
    object ADOData0023curr_code: TStringField
      FieldName = 'curr_code'
      Size = 5
    end
    object ADOData0023curr_name: TStringField
      DisplayLabel = #20184#27454#36135#24065
      FieldName = 'curr_name'
    end
    object ADOData0023BASE_TO_OTHER: TFloatField
      FieldName = 'BASE_TO_OTHER'
    end
    object ADOData0023ACC_PAYABLE_PTR: TIntegerField
      FieldName = 'ACC_PAYABLE_PTR'
    end
  end
end
