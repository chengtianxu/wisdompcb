object Form_customer: TForm_customer
  Left = 233
  Top = 177
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #23458#25143#20195#30721#25628#32034
  ClientHeight = 489
  ClientWidth = 436
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 436
    Height = 36
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 11
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #23458#25143#20195#30721
    end
    object Edit1: TEdit
      Left = 78
      Top = 8
      Width = 161
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
      OnKeyDown = DBGrid1KeyDown
    end
    object BitBtn1: TBitBtn
      Left = 239
      Top = 5
      Width = 26
      Height = 26
      Hint = #21047#26032
      ParentShowHint = False
      ShowHint = True
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
    object RadioGroup1: TRadioGroup
      Left = 272
      Top = 2
      Width = 151
      Height = 34
      Caption = #26597#25214#26041#24335
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #21069#26041#19968#33268
        #27169#31946#26597#25214)
      TabOrder = 2
      OnClick = RadioGroup1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 448
    Width = 436
    Height = 41
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      436
      41)
    object Button1: TButton
      Left = 134
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 212
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 36
    Width = 436
    Height = 412
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
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
        Title.Color = clRed
        Width = 129
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUSTOMER_NAME'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'abbr_name'
        Width = 177
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = ads10
    Left = 64
    Top = 256
  end
  object ads10: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT dbo.Data0010.CUST_CODE, dbo.Data0010.CUSTOMER_NAME, '#13#10'   ' +
      '      data0010.abbr_name'#13#10'FROM dbo.Data0010 '#13#10'order  by cust_cod' +
      'e'#13#10
    IndexFieldNames = 'CUST_CODE'
    Parameters = <>
    Left = 96
    Top = 256
    object ads10CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ads10CUSTOMER_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object ads10abbr_name: TStringField
      DisplayLabel = #23458#25143#31616#31216
      FieldName = 'abbr_name'
      Size = 10
    end
  end
end
