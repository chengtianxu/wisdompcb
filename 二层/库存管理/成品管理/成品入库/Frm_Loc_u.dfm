object Frm_Loc: TFrm_Loc
  Left = 428
  Top = 206
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #22320#28857#25628#32034
  ClientHeight = 420
  ClientWidth = 421
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  DesignSize = (
    421
    420)
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 0
    Width = 421
    Height = 33
    Cursor = crArrow
    Align = alTop
  end
  object Label1: TLabel
    Left = 36
    Top = 12
    Width = 80
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#20179#24211#20195#30721':'
  end
  object Label2: TLabel
    Left = 49
    Top = 340
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Anchors = [akLeft, akBottom]
    Caption = #23384#25918#20301#32622':'
  end
  object Edit1: TEdit
    Left = 120
    Top = 8
    Width = 153
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
  end
  object BitBtn1: TBitBtn
    Left = 277
    Top = 6
    Width = 25
    Height = 25
    Hint = #21047#26032
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
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
    Width = 421
    Height = 288
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = #23435#20307
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CODE'
        Title.Alignment = taCenter
        Title.Caption = #20179#24211#20195#30721
        Width = 168
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCATION'
        Title.Alignment = taCenter
        Title.Caption = #20179#24211#21517#31216
        Width = 219
        Visible = True
      end>
  end
  object EdtLoc: TEdit
    Left = 112
    Top = 336
    Width = 201
    Height = 21
    Anchors = [akLeft, akBottom]
    MaxLength = 20
    TabOrder = 3
  end
  object BitBtn2: TBitBtn
    Left = 216
    Top = 376
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 4
    Kind = bkCancel
  end
  object BitBtn3: TBitBtn
    Left = 80
    Top = 376
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 5
    Kind = bkOK
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 328
    Top = 384
  end
  object ADOQuery1: TADOQuery
    Connection = DM.con1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'SELECT RKEY,CODE,LOCATION,relationOrder from data0016')
    Left = 360
    Top = 384
    object ADOQuery1RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQuery1CODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object ADOQuery1LOCATION: TStringField
      FieldName = 'LOCATION'
    end
    object ADOQuery1relationOrder: TBooleanField
      FieldName = 'relationOrder'
    end
  end
end
