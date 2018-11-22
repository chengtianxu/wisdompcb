object FrmDefectsLib: TFrmDefectsLib
  Left = 240
  Top = 134
  BorderStyle = bsSingle
  Caption = #26597#25214#21697#36136#32570#38519#24211
  ClientHeight = 425
  ClientWidth = 359
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnShow = FormShow
  DesignSize = (
    359
    425)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 85
    Top = 17
    Width = 52
    Height = 13
    Alignment = taRightJustify
    Caption = #32570#38519#20195#30721
  end
  object Edit1: TEdit
    Left = 139
    Top = 13
    Width = 86
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
  end
  object BitBtn1: TBitBtn
    Left = 230
    Top = 12
    Width = 25
    Height = 23
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
    Top = 40
    Width = 358
    Height = 339
    Anchors = [akLeft, akTop, akBottom]
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = BitBtn2Click
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'REJ_CODE'
        Title.Caption = #32570#38519#20195#30721
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REJECT_DESCRIPTION'
        Title.Caption = #32570#38519#21517#31216
        Width = 227
        Visible = True
      end>
  end
  object BitBtn2: TBitBtn
    Left = 88
    Top = 388
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #30830#23450
    Default = True
    TabOrder = 3
    OnClick = BitBtn2Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object BitBtn3: TBitBtn
    Left = 192
    Top = 388
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #21462#28040
    TabOrder = 4
    OnClick = BitBtn3Click
    Kind = bkCancel
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    OnDataChange = DataSource1DataChange
    Left = 176
    Top = 120
  end
  object ADOQuery1: TADOQuery
    Connection = FrmMain.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select data0039.*'
      'From '
      'data0039'
      'where reject_defect_flag='#39'R'#39
      'order by REJ_CODE')
    Left = 144
    Top = 120
    object ADOQuery1RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQuery1REJ_CODE: TStringField
      FieldName = 'REJ_CODE'
      FixedChar = True
      Size = 5
    end
    object ADOQuery1REJECT_DESCRIPTION: TStringField
      FieldName = 'REJECT_DESCRIPTION'
      FixedChar = True
      Size = 30
    end
    object ADOQuery1REJECT_DEFECT_FLAG: TStringField
      FieldName = 'REJECT_DEFECT_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1GRAPHIC_PATH: TStringField
      FieldName = 'GRAPHIC_PATH'
      FixedChar = True
      Size = 80
    end
  end
end
