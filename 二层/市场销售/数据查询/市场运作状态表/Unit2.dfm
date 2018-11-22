object Form2: TForm2
  Left = 396
  Top = 187
  Width = 311
  Height = 474
  Caption = #23458#25143#26597#25214
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 14
    Top = 13
    Width = 65
    Height = 13
    Caption = #23458#25143#20195#30721#65306
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 40
    Width = 303
    Height = 361
    DataSource = FrmMain.DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'cust_code'
        Title.Alignment = taCenter
        Title.Caption = #23458#25143#20195#30721
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbr_name'
        Title.Alignment = taCenter
        Title.Caption = #23458#25143#31616#31216
        Width = 186
        Visible = True
      end>
  end
  object Edit1: TEdit
    Left = 78
    Top = 10
    Width = 121
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
  end
  object BitBtn1: TBitBtn
    Left = 80
    Top = 416
    Width = 60
    Height = 23
    Caption = #30830#23450
    TabOrder = 2
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 172
    Top = 416
    Width = 60
    Height = 23
    Caption = #21462#28040
    TabOrder = 3
    Kind = bkNo
  end
end
