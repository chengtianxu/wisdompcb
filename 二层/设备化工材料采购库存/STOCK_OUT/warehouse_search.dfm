object FrmWhouse: TFrmWhouse
  Left = 378
  Top = 180
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20179#24211#25628#32034
  ClientHeight = 400
  ClientWidth = 429
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
  DesignSize = (
    429
    400)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 65
    Top = 12
    Width = 60
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#20179#24211#25628#32034':'
  end
  object Edit1: TEdit
    Left = 128
    Top = 8
    Width = 161
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = Edit1KeyDown
  end
  object BitBtn1: TBitBtn
    Left = 294
    Top = 7
    Width = 24
    Height = 23
    Hint = #21047#26032
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
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
    Top = 35
    Width = 425
    Height = 326
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
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
        FieldName = 'WAREHOUSE_CODE'
        Title.Caption = #20179#24211#20195#30721
        Width = 125
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WAREHOUSE_NAME'
        Title.Caption = #20179#24211#21517#31216
        Width = 277
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 138
    Top = 368
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #30830#23450
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 218
    Top = 368
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 4
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 328
    Top = 363
  end
  object ADOQuery1: TADOQuery
    Connection = MainForm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'SELECT  RKEY, WAREHOUSE_CODE , WAREHOUSE_NAME '
      'FROM  Data0015 ORDER BY  WAREHOUSE_CODE')
    Left = 360
    Top = 363
    object ADOQuery1RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQuery1WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ADOQuery1WAREHOUSE_NAME: TStringField
      FieldName = 'WAREHOUSE_NAME'
      Size = 70
    end
  end
end
