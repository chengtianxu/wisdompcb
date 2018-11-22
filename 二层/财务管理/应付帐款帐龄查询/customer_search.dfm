object Form_customer: TForm_customer
  Left = 341
  Top = 168
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20379#24212#21830#25628#32034
  ClientHeight = 522
  ClientWidth = 542
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
  object Splitter1: TSplitter
    Left = 0
    Top = 0
    Width = 542
    Height = 33
    Cursor = crArrow
    Align = alTop
  end
  object Label1: TLabel
    Left = 83
    Top = 9
    Width = 65
    Height = 13
    Alignment = taRightJustify
    Caption = #20379#24212#21830#20195#30721
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 33
    Width = 542
    Height = 448
    Align = alClient
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
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CODE'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'supplier_NAME'
        Width = 226
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAX_ID_NUMBER'
        Title.Caption = #20184#27454#26041#24335
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANALYSIS_CODE1'
        Title.Caption = #31080#25454#31181#31867
        Width = 127
        Visible = True
      end>
  end
  object MaskEdit1: TMaskEdit
    Left = 157
    Top = 4
    Width = 153
    Height = 21
    TabOrder = 0
    OnChange = MaskEdit1Change
    OnKeyDown = DBGrid1KeyDown
  end
  object BitBtn2: TBitBtn
    Left = 315
    Top = 4
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
  object Panel1: TPanel
    Left = 0
    Top = 481
    Width = 542
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object Button1: TButton
      Left = 195
      Top = 10
      Width = 75
      Height = 25
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 275
      Top = 10
      Width = 75
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 304
    Top = 379
  end
  object ADOQuery1: TADODataSet
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'select data0023.rkey,CODE,supplier_NAME,abbr_name,CURR_CODE,'#13#10'  ' +
      '     CURR_NAME,BASE_TO_OTHER,PAYMENT_TERMS,'#13#10'       ACC_PAYABLE_' +
      'PTR,CURRENCY_PTR,TAX_ID_NUMBER,ANALYSIS_CODE1'#13#10'from data0023 inn' +
      'er join data0001 on CURRENCY_PTR=data0001.rkey'#13#10#13#10
    Parameters = <>
    Left = 336
    Top = 376
    object ADOQuery1rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery1CODE: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'CODE'
      Size = 10
    end
    object ADOQuery1supplier_NAME: TStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldName = 'supplier_NAME'
      Size = 100
    end
    object ADOQuery1abbr_name: TStringField
      FieldName = 'abbr_name'
      Size = 10
    end
    object ADOQuery1CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADOQuery1CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object ADOQuery1BASE_TO_OTHER: TFloatField
      FieldName = 'BASE_TO_OTHER'
    end
    object ADOQuery1PAYMENT_TERMS: TSmallintField
      FieldName = 'PAYMENT_TERMS'
    end
    object ADOQuery1ACC_PAYABLE_PTR: TIntegerField
      FieldName = 'ACC_PAYABLE_PTR'
    end
    object ADOQuery1CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object ADOQuery1TAX_ID_NUMBER: TStringField
      FieldName = 'TAX_ID_NUMBER'
    end
    object ADOQuery1ANALYSIS_CODE1: TStringField
      FieldName = 'ANALYSIS_CODE1'
    end
  end
end
