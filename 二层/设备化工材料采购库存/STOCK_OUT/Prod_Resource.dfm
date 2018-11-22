object FrmProdResource: TFrmProdResource
  Left = 240
  Top = 134
  AutoScroll = False
  Caption = #26597#25214#37096#38376
  ClientHeight = 367
  ClientWidth = 404
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 0
    Width = 404
    Height = 33
    Cursor = crArrow
    Align = alTop
  end
  object Label1: TLabel
    Left = 113
    Top = 11
    Width = 48
    Height = 13
    Alignment = taRightJustify
    Caption = '    '#20195#21495#65306
  end
  object Edit1: TEdit
    Left = 163
    Top = 7
    Width = 105
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = Edit1KeyDown
  end
  object BitBtn1: TBitBtn
    Left = 270
    Top = 8
    Width = 22
    Height = 21
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
    Width = 404
    Height = 299
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
    OnKeyPress = DBGrid1KeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'dept_code'
        Title.Caption = #36164#28304#20195#21495
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dept_name'
        Title.Caption = #36164#28304#21517#31216
        Width = 199
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ctype'
        Title.Caption = #31867#21035
        Width = 62
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 332
    Width = 404
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object Button1: TButton
      Left = 125
      Top = 7
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 205
      Top = 7
      Width = 75
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 176
    Top = 120
  end
  object ADOQuery1: TADOQuery
    Connection = MainForm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    OnCalcFields = ADOQuery1CalcFields
    Parameters = <>
    SQL.Strings = (
      'select rkey,dept_code,dept_name,ttype'
      'from data0034 '
      'where ((ttype=1 or ttype=2)'
      'and active_flag<>1'
      'and is_cost_dept=1) or ttype=4'
      'ORDER by ttype,dept_code')
    Left = 144
    Top = 120
    object ADOQuery1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery1dept_code: TStringField
      FieldName = 'dept_code'
      Size = 10
    end
    object ADOQuery1dept_name: TStringField
      FieldName = 'dept_name'
      Size = 30
    end
    object ADOQuery1ttype: TStringField
      FieldName = 'ttype'
      Size = 1
    end
    object ADOQuery1ctype: TStringField
      FieldKind = fkCalculated
      FieldName = 'ctype'
      Calculated = True
    end
  end
end
