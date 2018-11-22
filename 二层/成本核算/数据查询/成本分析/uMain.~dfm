object frmMain: TfrmMain
  Left = 369
  Top = 168
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #25104#26412#20998#26512
  ClientHeight = 449
  ClientWidth = 488
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object vprev: TLabel
    Left = 389
    Top = 12
    Width = 7
    Height = 13
    Visible = False
  end
  object Label1: TLabel
    Left = 141
    Top = 13
    Width = 65
    Height = 13
    Caption = #20250#35745#24180#24230#65306
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 43
    Width = 478
    Height = 321
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'no'
        Title.Caption = #24207#21495
        Width = 32
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'fm_date'
        Title.Alignment = taCenter
        Title.Caption = #26680#31639#26399#24320#22987#26085#26399
        Width = 127
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'end_date'
        Title.Alignment = taCenter
        Title.Caption = #26680#31639#26399#25130#27490#26085#26399
        Width = 115
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'closed_date'
        Title.Alignment = taCenter
        Title.Caption = #22788#29702#26102#38388
        Width = 169
        Visible = True
      end>
  end
  object BitBtn2: TBitBtn
    Left = 136
    Top = 376
    Width = 75
    Height = 24
    Caption = #26597#30475
    TabOrder = 2
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
    Left = 256
    Top = 376
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 3
    OnClick = BitBtn3Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
      F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
      000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
      338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
      45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
      3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
      F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
      000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
      338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
      4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
      8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
      333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
      0000}
    NumGlyphs = 2
  end
  object SpinEdit1: TSpinEdit
    Left = 207
    Top = 8
    Width = 90
    Height = 22
    MaxValue = 0
    MinValue = 2000
    TabOrder = 0
    Value = 0
    OnChange = SpinEdit1Change
  end
  object DataSource1: TDataSource
    DataSet = Qery451
    Left = 224
    Top = 160
  end
  object Qery451: TADOQuery
    Connection = DM.Conn
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'vY'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Select (SELECT COUNT(*)'
      '          FROM data0451 a'
      '          WHERE a.rkey <= data0451.rkey) AS no,'
      'data0451.rkey,data0451.fm_date,data0451.end_date,'
      
        'data0451.actual_fm_date,data0451.actual_end_date,data0451.closed' +
        '_date'
      'from data0451'
      'WHERE (YEAR(ACTUAL_FM_DATE) = :vY)'
      'order by data0451.fm_date,data0451.end_date')
    Left = 280
    Top = 160
    object Qery451no: TIntegerField
      FieldName = 'no'
      ReadOnly = True
    end
    object Qery451rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object Qery451fm_date: TDateTimeField
      FieldName = 'fm_date'
    end
    object Qery451end_date: TDateTimeField
      FieldName = 'end_date'
    end
    object Qery451actual_fm_date: TDateTimeField
      FieldName = 'actual_fm_date'
    end
    object Qery451actual_end_date: TDateTimeField
      FieldName = 'actual_end_date'
    end
    object Qery451closed_date: TDateTimeField
      FieldName = 'closed_date'
    end
  end
end
