object FrmEmpl: TFrmEmpl
  Left = 337
  Top = 140
  AutoScroll = False
  Caption = #26597#25214#38599#21592
  ClientHeight = 455
  ClientWidth = 368
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'ËÎÌו'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 0
    Width = 368
    Height = 37
    Cursor = crVSplit
    Align = alTop
  end
  object Label1: TLabel
    Left = 35
    Top = 12
    Width = 98
    Height = 13
    Alignment = taRightJustify
    Caption = '    '#38599#21592#20195#21495#65306
  end
  object SpeedButton1: TSpeedButton
    Left = 269
    Top = 7
    Width = 25
    Height = 25
    Hint = #21047#26032
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000120B0000120B00001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
      DADABFBFBDADADADADADDADADBFADADADADAADADAD000DADADADDADAD0FBF0DA
      DADAADAD0F7FBF0DADADDAD0F7F87BF0DADAAD0F7F87BFB70DADD0F7F87BFB78
      80DA000F87BFB78880ADDAD00BFB78880ADAADADA0B7888740ADDADADA088804
      440AADADADA000A04440DADADADADADA0440ADADADADADADA00D}
    ParentShowHint = False
    ShowHint = True
    OnClick = SpeedButton1Click
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 37
    Width = 368
    Height = 377
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'ËÎÌו'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'empl_code'
        Title.Caption = #38599#21592#20195#21495
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'employee_name'
        Title.Caption = #38599#21592#21517#31216
        Width = 226
        Visible = True
      end>
  end
  object Edit1: TEdit
    Left = 139
    Top = 8
    Width = 122
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = DBGrid1KeyDown
  end
  object Panel1: TPanel
    Left = 0
    Top = 414
    Width = 368
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Button1: TButton
      Left = 115
      Top = 10
      Width = 75
      Height = 25
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 195
      Top = 10
      Width = 75
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 64
    Top = 296
  end
  object ADOQuery1: TADOStoredProc
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    ProcedureName = 'ep066;1'
    Parameters = <>
    Left = 96
    Top = 296
    object ADOQuery1rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery1empl_code: TStringField
      FieldName = 'empl_code'
      Size = 6
    end
    object ADOQuery1employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
  end
end
