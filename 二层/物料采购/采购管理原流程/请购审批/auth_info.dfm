object Form3: TForm3
  Left = 309
  Top = 179
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #23457#25209#20449#24687
  ClientHeight = 273
  ClientWidth = 545
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 545
    Height = 225
    Align = alTop
    DataSource = DM.DataSource4
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'USER_ID'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USER_FULL_NAME'
        Width = 151
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'auth_flag'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'auth_date'
        Width = 132
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ranking'
        Width = 72
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 254
    Top = 237
    Width = 75
    Height = 25
    Caption = #20851#38381
    ModalResult = 1
    TabOrder = 0
  end
end
