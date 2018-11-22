object FrmCustSearch: TFrmCustSearch
  Left = 308
  Top = 176
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #23458#25143#25628#32034
  ClientHeight = 414
  ClientWidth = 403
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
    Left = 60
    Top = 15
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #23458#25143#20195#30721':'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 40
    Width = 403
    Height = 333
    Align = alBottom
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'cust_code'
        Title.Caption = #23458#25143#20195#21495
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'customer_name'
        Title.Caption = #23458#25143#21517#31216
        Width = 279
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 373
    Width = 403
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Button1: TButton
      Left = 125
      Top = 10
      Width = 75
      Height = 25
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 205
      Top = 10
      Width = 75
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object MaskEdit1: TMaskEdit
    Left = 122
    Top = 10
    Width = 153
    Height = 21
    TabOrder = 0
    OnChange = MaskEdit1Change
    OnKeyDown = DBGrid1KeyDown
  end
  object BitBtn2: TBitBtn
    Left = 286
    Top = 8
    Width = 25
    Height = 25
    Hint = #21047#26032
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    TabStop = False
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
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    OnDataChange = DataSource1DataChange
    Left = 32
    Top = 376
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select rkey,cust_code,customer_name,CUSTOMER_TYPE,'
      'INVOICE_NOTE_PAD_PTR,DO_SMOOTHING,COD_FLAG'
      ' from data0010 order by cust_code')
    Left = 64
    Top = 376
    object ADOQuery1rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery1cust_code: TStringField
      FieldName = 'cust_code'
      Size = 10
    end
    object ADOQuery1customer_name: TStringField
      FieldName = 'customer_name'
      Size = 100
    end
    object ADOQuery1CUSTOMER_TYPE: TIntegerField
      FieldName = 'CUSTOMER_TYPE'
    end
    object ADOQuery1INVOICE_NOTE_PAD_PTR: TIntegerField
      FieldName = 'INVOICE_NOTE_PAD_PTR'
    end
    object ADOQuery1DO_SMOOTHING: TWordField
      FieldName = 'DO_SMOOTHING'
    end
    object ADOQuery1COD_FLAG: TStringField
      FieldName = 'COD_FLAG'
      FixedChar = True
      Size = 1
    end
  end
end
