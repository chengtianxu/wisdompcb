object Form_Custmer: TForm_Custmer
  Left = 347
  Top = 163
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #23458#25143#25628#32034
  ClientHeight = 429
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
    Left = 15
    Top = 20
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
    Top = 47
    Width = 402
    Height = 346
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
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'customer_name'
        Title.Caption = #23458#25143#21517#31216
        Width = 278
        Visible = True
      end>
  end
  object MaskEdit1: TMaskEdit
    Left = 83
    Top = 15
    Width = 153
    Height = 21
    TabOrder = 0
    OnChange = MaskEdit1Change
    OnKeyDown = DBGrid1KeyDown
  end
  object BitBtn2: TBitBtn
    Left = 241
    Top = 13
    Width = 25
    Height = 25
    Hint = #21047#26032
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
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
  object Button1: TButton
    Left = 115
    Top = 398
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 3
  end
  object Button2: TButton
    Left = 195
    Top = 398
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 4
  end
  object RadioGroup1: TRadioGroup
    Left = 270
    Top = 0
    Width = 132
    Height = 46
    Caption = #26597#25214#23383#27573
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #20195#30721
      #21517#31216)
    TabOrder = 5
    OnClick = RadioGroup1Click
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 295
    Top = 370
  end
  object ADODataSet1: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT rkey,cust_code,customer_name,INVOICE_NOTE_PAD_PTR,DO_SMOO' +
      'THING,COD_FLAG'#13#10'FROM data0010 '#13#10'WHERE  Data0010.CREDIT_RATING<> ' +
      '3 ORDER BY cust_code'
    Parameters = <>
    Left = 360
    Top = 368
    object ADODataSet1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADODataSet1cust_code: TStringField
      FieldName = 'cust_code'
      Size = 10
    end
    object ADODataSet1customer_name: TStringField
      FieldName = 'customer_name'
      Size = 100
    end
    object ADODataSet1INVOICE_NOTE_PAD_PTR: TIntegerField
      FieldName = 'INVOICE_NOTE_PAD_PTR'
    end
    object ADODataSet1DO_SMOOTHING: TWordField
      FieldName = 'DO_SMOOTHING'
    end
    object ADODataSet1COD_FLAG: TStringField
      FieldName = 'COD_FLAG'
      FixedChar = True
      Size = 1
    end
  end
end
