object Form_supp: TForm_supp
  Left = 326
  Top = 160
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20379#24212#21830#25628#32034
  ClientHeight = 453
  ClientWidth = 425
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
    Left = 7
    Top = 21
    Width = 83
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #20379#24212#21830#20195#30721':'
  end
  object RadioGroup1: TRadioGroup
    Left = 279
    Top = 0
    Width = 145
    Height = 48
    Caption = #26597#25214#23383#27573
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #20195#30721
      #21517#31216)
    TabOrder = 5
    OnClick = RadioGroup1Click
  end
  object Edit1: TEdit
    Left = 90
    Top = 17
    Width = 158
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = DBGrid1KeyDown
  end
  object BitBtn1: TBitBtn
    Left = 250
    Top = 15
    Width = 25
    Height = 25
    Hint = #21047#26032
    ParentShowHint = False
    ShowHint = True
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
    Left = 129
    Top = 421
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 3
  end
  object Button2: TButton
    Left = 209
    Top = 421
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 4
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 50
    Width = 425
    Height = 361
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
        FieldName = 'CODE'
        Title.Caption = #20379#24212#21830#20195#30721
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUPPLIER_NAME'
        Title.Caption = #20379#24212#21830#22995#21517
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbr_name'
        Width = 70
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 312
    Top = 417
  end
  object ADOQuery1: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      '  Data0023.RKEY,'
      '  Data0023.CODE,abbr_name,'
      '  Data0023.SUPPLIER_NAME,'
      'data0023.currency_ptr'
      'FROM'
      '  Data0023'
      'ORDER BY'
      '  Data0023.CODE')
    Left = 344
    Top = 416
    object ADOQuery1RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQuery1CODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object ADOQuery1abbr_name: TStringField
      DisplayLabel = #31616#20889
      FieldName = 'abbr_name'
      Size = 10
    end
    object ADOQuery1SUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 40
    end
    object ADOQuery1currency_ptr: TIntegerField
      FieldName = 'currency_ptr'
    end
  end
end
