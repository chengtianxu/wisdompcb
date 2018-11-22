object Form_Employee: TForm_Employee
  Left = 337
  Top = 179
  AutoScroll = False
  Caption = #26597#25214#38599#21592
  ClientHeight = 410
  ClientWidth = 382
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
  object Label1: TLabel
    Left = 16
    Top = 17
    Width = 63
    Height = 13
    Alignment = taRightJustify
    Caption = #38599#21592#20195#21495':'
  end
  object SpeedButton1: TSpeedButton
    Left = 210
    Top = 11
    Width = 25
    Height = 25
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000120B0000120B00001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
      DADABFBFBDADADADADADDADADBFADADADADAADADAD000DADADADDADAD0FBF0DA
      DADAADAD0F7FBF0DADADDAD0F7F87BF0DADAAD0F7F87BFB70DADD0F7F87BFB78
      80DA000F87BFB78880ADDAD00BFB78880ADAADADA0B7888740ADDADADA088804
      440AADADADA000A04440DADADADADADA0440ADADADADADADA00D}
    OnClick = SpeedButton1Click
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 45
    Width = 382
    Height = 324
    Align = alBottom
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
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'employee_name'
        Title.Caption = #38599#21592#21517#31216
        Width = 242
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 369
    Width = 382
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Button1: TButton
      Left = 112
      Top = 10
      Width = 75
      Height = 25
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 192
      Top = 10
      Width = 75
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object Edit1: TEdit
    Left = 83
    Top = 13
    Width = 122
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = DBGrid1KeyDown
  end
  object RadioGroup1: TRadioGroup
    Left = 239
    Top = 1
    Width = 138
    Height = 40
    Caption = #26597#25214#23383#27573
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #20195#30721
      #21517#31216)
    TabOrder = 3
    OnClick = RadioGroup1Click
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 32
    Top = 365
  end
  object ADOQuery1: TADOStoredProc
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    ProcedureName = 'ep066;1'
    Parameters = <>
    Left = 64
    Top = 366
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
