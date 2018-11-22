object Frm_WkP: TFrm_WkP
  Left = 349
  Top = 137
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #36873#25321#36131#20219#37096#38376
  ClientHeight = 497
  ClientWidth = 519
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 519
    Height = 49
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 17
      Top = 20
      Width = 33
      Height = 13
      Caption = #26597#35810':'
    end
    object edtKeyValue: TEdit
      Left = 113
      Top = 16
      Width = 169
      Height = 21
      TabOrder = 0
      OnChange = edtKeyValueChange
    end
    object RadioGroup1: TRadioGroup
      Left = 340
      Top = 8
      Width = 169
      Height = 33
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        #20840#37096
        #30456#20851#24037#24207)
      TabOrder = 1
      OnClick = RadioGroup1Click
    end
    object BitBtn3: TBitBtn
      Left = 297
      Top = 15
      Width = 33
      Height = 25
      TabOrder = 2
      OnClick = BitBtn3Click
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
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 49
    Width = 519
    Height = 407
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = BitBtn1Click
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'dept_code'
        Width = 226
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dept_name'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'typeNm'
        Title.Caption = #31867#21035#21517#31216
        Width = 111
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 456
    Width = 519
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 80
      Top = 8
      Width = 75
      Height = 25
      Caption = #30830#23450
      Default = True
      TabOrder = 0
      OnClick = BitBtn1Click
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
    object BitBtn2: TBitBtn
      Left = 344
      Top = 8
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'SELECT  rkey,DEPT_CODE, DEPT_NAME, CASE WHEN TTYPE = 1 THEN '#39#24037#24207#39
      '                     WHEN TTYPE = 4 THEN '#39#37096#38376#39
      
        '                    WHEN ttype = 5  THEN '#39#29677#32452#39' END AS typeNm,ttyp' +
        'e FROM Data0034 where TTYPE in (1,4,5) order by ttype,dept_code')
    Left = 128
    Top = 176
    object ADOQuery1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery1dept_code: TStringField
      DisplayLabel = #24037#24207#20195#30721
      FieldName = 'dept_code'
      Size = 10
    end
    object ADOQuery1dept_name: TStringField
      DisplayLabel = #24037#24207#21517#31216
      FieldName = 'dept_name'
      Size = 30
    end
    object ADOQuery1typeNm: TStringField
      FieldName = 'typeNm'
      ReadOnly = True
      Size = 4
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 192
    Top = 176
  end
end
