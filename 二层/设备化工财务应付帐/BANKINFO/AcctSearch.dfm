object FrmAcctSearch: TFrmAcctSearch
  Left = 272
  Top = 166
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #24635#24080#24080#30446#25628#32034
  ClientHeight = 453
  ClientWidth = 443
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
  object Splitter1: TSplitter
    Left = 0
    Top = 0
    Width = 443
    Height = 35
    Cursor = crVSplit
    Align = alTop
  end
  object Label1: TLabel
    Left = 82
    Top = 12
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = '     '#31185#30446#32534#30721':'
  end
  object Panel1: TPanel
    Left = 0
    Top = 412
    Width = 443
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object Button1: TButton
      Left = 131
      Top = 10
      Width = 75
      Height = 25
      Caption = #30830#23450
      ModalResult = 1
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
  object Edit1: TEdit
    Left = 151
    Top = 8
    Width = 162
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 35
    Width = 443
    Height = 377
    Align = alLeft
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
    Columns = <
      item
        Expanded = False
        FieldName = 'gl_acc_number'
        Title.Caption = #31185#30446#32534#30721
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'gl_description'
        Title.Caption = #31185#30446#21517#31216
        Width = 240
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'type'
        Title.Caption = #31867#22411
        Width = 54
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 317
    Top = 9
    Width = 22
    Height = 21
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
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 331
    Top = 416
  end
  object ADOQuery1: TADOQuery
    Connection = FrmMain.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = ADOQuery1CalcFields
    Parameters = <>
    SQL.Strings = (
      'select rkey,gl_acc_number,gl_description,db_cr from data0103'
      'where has_child=0'
      'order by gl_acc_number')
    Left = 360
    Top = 416
    object ADOQuery1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery1gl_description: TStringField
      FieldName = 'gl_description'
      FixedChar = True
      Size = 30
    end
    object ADOQuery1db_cr: TStringField
      FieldName = 'db_cr'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1ttype: TStringField
      FieldKind = fkCalculated
      FieldName = 'type'
      Calculated = True
    end
    object ADOQuery1gl_acc_number: TStringField
      FieldName = 'gl_acc_number'
      FixedChar = True
      Size = 18
    end
  end
end
