object Form2: TForm2
  Left = 356
  Top = 191
  Width = 328
  Height = 440
  Caption = #23458#25143#26597#25214
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 60
    Height = 13
    Caption = #23458#25143#20195#30721#65306
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 40
    Width = 313
    Height = 337
    DataSource = Form1.DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'cust_code'
        Title.Alignment = taCenter
        Title.Caption = #23458#25143#20195#30721
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbr_name'
        Title.Alignment = taCenter
        Title.Caption = #23458#25143#31616#31216
        Width = 166
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
    Left = 88
    Top = 384
    Width = 60
    Height = 23
    TabOrder = 2
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 176
    Top = 384
    Width = 60
    Height = 23
    TabOrder = 3
    Kind = bkNo
  end
end
