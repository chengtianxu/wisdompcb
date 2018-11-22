object Form_Bank: TForm_Bank
  Left = 397
  Top = 190
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #29616#37329#24080#25143#25628#32034
  ClientHeight = 432
  ClientWidth = 407
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
    Width = 407
    Height = 36
    Cursor = crArrow
    Align = alTop
  end
  object Label1: TLabel
    Left = 48
    Top = 14
    Width = 104
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #29616#37329#24080#25143#21517#31216':'
  end
  object Edit1: TEdit
    Left = 154
    Top = 10
    Width = 119
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
  end
  object BitBtn1: TBitBtn
    Left = 273
    Top = 10
    Width = 24
    Height = 22
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 36
    Width = 407
    Height = 360
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyPress = DBGrid1KeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'bank_name'
        Title.Alignment = taCenter
        Title.Caption = #38134#34892#21517#31216
        Width = 199
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'curr_name'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'base_to_other'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bal_amount'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 396
    Width = 407
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object Button1: TButton
      Left = 127
      Top = 6
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 207
      Top = 6
      Width = 75
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = Adodata0128
    Left = 288
    Top = 397
  end
  object Adodata0128: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select data0128.rkey,bank_name,bank_current_check,'
      'data0128.gl_acct_ptr,currency_ptr,bal_amount,'
      'data0001.curr_code,data0001.curr_name,'
      'data0001.base_to_other'
      'from data0128 inner join data0001'
      'on data0128.currency_ptr=data0001.rkey')
    Left = 320
    Top = 398
    object Adodata0128rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object Adodata0128bank_name: TStringField
      FieldName = 'bank_name'
      Size = 30
    end
    object Adodata0128bank_current_check: TStringField
      FieldName = 'bank_current_check'
      FixedChar = True
      Size = 10
    end
    object Adodata0128gl_acct_ptr: TIntegerField
      FieldName = 'gl_acct_ptr'
    end
    object Adodata0128currency_ptr: TIntegerField
      FieldName = 'currency_ptr'
    end
    object Adodata0128bal_amount: TFloatField
      DisplayLabel = #24403#21069#20313#39069
      FieldName = 'bal_amount'
    end
    object Adodata0128curr_code: TStringField
      FieldName = 'curr_code'
      Size = 5
    end
    object Adodata0128curr_name: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'curr_name'
    end
    object Adodata0128base_to_other: TFloatField
      DisplayLabel = #27719#29575
      FieldName = 'base_to_other'
    end
  end
end
