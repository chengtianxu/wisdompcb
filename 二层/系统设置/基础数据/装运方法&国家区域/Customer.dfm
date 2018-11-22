object Form_Customer: TForm_Customer
  Left = 235
  Top = 169
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #23458#25143#25628#32034
  ClientHeight = 463
  ClientWidth = 408
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 64
    Top = 20
    Width = 52
    Height = 13
    Caption = #23458#25143#20195#30721
  end
  object Edit1: TEdit
    Left = 126
    Top = 14
    Width = 171
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
  end
  object btn1: TBitBtn
    Left = 304
    Top = 10
    Width = 30
    Height = 25
    TabOrder = 1
    OnClick = btn1Click
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
  object btn2: TButton
    Left = 120
    Top = 424
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 2
    OnClick = btn2Click
  end
  object btn3: TButton
    Left = 208
    Top = 424
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 3
    OnClick = btn3Click
  end
  object DBGridEh1: TDBGridEh
    Left = 6
    Top = 48
    Width = 395
    Height = 361
    DataSource = ds1
    FooterColor = clWindow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 4
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGridEh1DblClick
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'CUST_CODE'
        Footers = <>
        Title.Caption = #23458#25143#20195#30721
        Title.Color = clRed
        Title.SortIndex = 1
        Title.SortMarker = smUpEh
      end
      item
        EditButtons = <>
        FieldName = 'CUSTOMER_NAME'
        Footers = <>
        Title.Caption = #23458#25143#21517#31216
        Width = 280
      end>
  end
  object ds1: TDataSource
    DataSet = ds10
    Left = 272
    Top = 128
  end
  object ds10: TADODataSet
    Active = True
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select RKEY, CUST_CODE, CUSTOMER_NAME from Data0010'#13#10'where cust_' +
      'code like '#39'%'#39' +:code +'#39'%'#39
    Parameters = <
      item
        Name = 'code'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    Left = 288
    Top = 176
    object ds10RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ds10CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ds10CUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
  end
end
