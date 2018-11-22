object FrmInvSearch: TFrmInvSearch
  Left = 229
  Top = 148
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #24211#23384#21407#26448#26009#25628#32034
  ClientHeight = 453
  ClientWidth = 478
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 0
    Width = 478
    Height = 33
    Cursor = crArrow
    Align = alTop
  end
  object Label1: TLabel
    Left = 93
    Top = 15
    Width = 51
    Height = 13
    Alignment = taRightJustify
    Caption = #26448#26009#20195#21495':'
  end
  object Edit1: TEdit
    Left = 152
    Top = 11
    Width = 210
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = DBGrid1KeyDown
  end
  object BitBtn1: TBitBtn
    Left = 368
    Top = 8
    Width = 25
    Height = 25
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 33
    Width = 478
    Height = 379
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
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'INV_PART_NUMBER'
        Title.Caption = #26448#26009#20195#21495
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_PART_DESCRIPTION'
        Title.Caption = #21407#26448#26009#25551#36848
        Width = 301
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 412
    Width = 478
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object Button1: TButton
      Left = 147
      Top = 10
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 227
      Top = 10
      Width = 75
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object ADOQuery1: TADOQuery
    Connection = MainForm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    ParamCheck = False
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      '  Data0017.RKEY ,'
      '  Data0017.INV_PART_NUMBER ,'
      '  Data0017.INV_PART_DESCRIPTION, '
      '  Data0017.STD_COST, '
      '  Data0002.unit_code'
      'FROM'
      '  Data0017,data0002'
      'WHERE'
      '  Data0017.P_M = '#39'P'#39
      'and data0017.stock_unit_ptr=data0002.rkey'
      'ORDER BY'
      '  INV_PART_NUMBER')
    Left = 440
    Top = 416
    object ADOQuery1RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQuery1INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
    end
    object ADOQuery1INV_PART_DESCRIPTION: TStringField
      FieldName = 'INV_PART_DESCRIPTION'
      Size = 40
    end
    object ADOQuery1unit_code: TStringField
      FieldName = 'unit_code'
      Size = 5
    end
    object ADOQuery1STD_COST: TFloatField
      FieldName = 'STD_COST'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 408
    Top = 416
  end
end
