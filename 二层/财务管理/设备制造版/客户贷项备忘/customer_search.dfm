object Form_customer: TForm_customer
  Left = 334
  Top = 219
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
  object Splitter1: TSplitter
    Left = 0
    Top = 0
    Width = 403
    Height = 33
    Cursor = crArrow
    Align = alTop
  end
  object Label1: TLabel
    Left = 56
    Top = 9
    Width = 52
    Height = 13
    Alignment = taRightJustify
    Caption = #23458#25143#20195#30721
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
    Width = 403
    Height = 340
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
        FieldName = 'CUST_CODE'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUSTOMER_NAME'
        Width = 224
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'base_to_other'
        ReadOnly = False
        Width = 52
        Visible = True
      end>
  end
  object MaskEdit1: TMaskEdit
    Left = 117
    Top = 4
    Width = 153
    Height = 21
    TabOrder = 0
    OnChange = MaskEdit1Change
    OnKeyDown = DBGrid1KeyDown
  end
  object BitBtn2: TBitBtn
    Left = 275
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
    Top = 373
    Width = 403
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
      ModalResult = 1
      TabOrder = 0
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
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 304
    Top = 379
  end
  object ADOQuery1: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'select data0010.rkey,CUST_CODE, CUSTOMER_NAME'#13#10', CURR_CODE, CURR' +
      '_NAME, base_to_other,'#13#10'NET_PAY, ACC_REC_PTR,CURRENCY_PTR,'#13#10'abbr_' +
      'name'#13#10'from data0010 inner join data0001'#13#10'on CURRENCY_PTR=data000' +
      '1.rkey'#13#10
    Parameters = <>
    Left = 336
    Top = 376
    object ADOQuery1rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery1CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADOQuery1CUSTOMER_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object ADOQuery1ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADOQuery1ACC_REC_PTR: TIntegerField
      FieldName = 'ACC_REC_PTR'
    end
    object ADOQuery1CURR_CODE: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADOQuery1CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object ADOQuery1NET_PAY: TSmallintField
      FieldName = 'NET_PAY'
    end
    object ADOQuery1CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object ADOQuery1base_to_other: TFloatField
      DisplayLabel = #27719#29575
      FieldName = 'base_to_other'
    end
  end
end
