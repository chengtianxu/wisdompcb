object frmCPInfo: TfrmCPInfo
  Left = 343
  Top = 106
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #25628#32034#20135#21697
  ClientHeight = 418
  ClientWidth = 403
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
  object Label1: TLabel
    Left = 64
    Top = 8
    Width = 60
    Height = 13
    Caption = #20135#21697#32534#21495#65306
  end
  object Edit1: TEdit
    Left = 128
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
  end
  object BitBtn2: TBitBtn
    Left = 251
    Top = 6
    Width = 25
    Height = 25
    Hint = #21047#26032
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 48
    Width = 401
    Height = 321
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'MANU_PART_NUMBER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_DESC'
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 96
    Top = 384
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 216
    Top = 384
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 4
  end
  object DataSource1: TDataSource
    DataSet = AQery50
    OnDataChange = DataSource1DataChange
    Left = 80
    Top = 120
  end
  object AQery50: TADOQuery
    Connection = DM.Conn
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'SELECT RKEY, manu_PART_NUMBER, manu_PART_DESC'
      'FROM Data0025'
      'where parent_ptr is null')
    Left = 120
    Top = 120
    object AQery50RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object AQery50MANU_PART_NUMBER: TStringField
      DisplayLabel = #20135#21697#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object AQery50MANU_PART_DESC: TStringField
      DisplayLabel = #20135#21697#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
  end
end
