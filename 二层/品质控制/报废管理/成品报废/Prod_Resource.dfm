object FrmProdResource: TFrmProdResource
  Left = 308
  Top = 173
  BorderStyle = bsSingle
  Caption = #26597#25214#29983#20135#36164#28304
  ClientHeight = 470
  ClientWidth = 379
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  DesignSize = (
    379
    470)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 87
    Top = 13
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #37096#38376#20195#30721':'
  end
  object Edit1: TEdit
    Left = 148
    Top = 9
    Width = 78
    Height = 21
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 0
    OnChange = Edit1Change
  end
  object BitBtn1: TBitBtn
    Left = 231
    Top = 8
    Width = 25
    Height = 24
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
    Width = 378
    Height = 386
    Anchors = [akLeft, akTop, akBottom]
    DataSource = DataSource2
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
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
        FieldName = 'dept_code'
        ReadOnly = True
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dept_name'
        ReadOnly = True
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ctype'
        Visible = True
      end>
  end
  object BitBtn2: TBitBtn
    Left = 98
    Top = 436
    Width = 75
    Height = 27
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
    Left = 202
    Top = 436
    Width = 75
    Height = 27
    Anchors = [akLeft, akBottom]
    Caption = #21462#28040
    TabOrder = 4
    OnClick = BitBtn3Click
    Kind = bkCancel
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery1
    OnDataChange = DataSource2DataChange
    Left = 128
    Top = 168
  end
  object ADOQuery1: TADOQuery
    Connection = FrmMain.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select rkey,dept_code,dept_name,'
      'case ttype when 4 then '#39#34892#25919#37096#38376#39
      'else '#39#29983#20135#24037#24207#39
      'end as ctype'
      'from data0034 '
      'where'
      ' ttype<>2 and ttype<>3 '
      'ORDER by ttype,dept_code')
    Left = 96
    Top = 168
    object ADOQuery1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery1dept_code: TStringField
      DisplayLabel = #37096#38376#20195#30721
      FieldName = 'dept_code'
      Size = 10
    end
    object ADOQuery1dept_name: TStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'dept_name'
      Size = 30
    end
    object ADOQuery1ctype: TStringField
      DisplayLabel = #24615#36136
      FieldName = 'ctype'
      ReadOnly = True
      Size = 8
    end
  end
end
