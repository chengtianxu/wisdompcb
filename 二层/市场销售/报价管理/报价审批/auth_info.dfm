object Form_authinfo: TForm_authinfo
  Left = 232
  Top = 308
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #23457#25209#20449#24687
  ClientHeight = 316
  ClientWidth = 513
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 208
    Top = 280
    Width = 75
    Height = 25
    Caption = #20851#38381
    ModalResult = 2
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 513
    Height = 273
    Align = alTop
    DataSource = dm.DataSource5
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'USER_ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USER_FULL_NAME'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ranking'
        Visible = True
      end
      item
        Expanded = False
        FieldName = #23457#25209#29366#24577
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'auth_date'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'auth_flag'
        Width = 60
        Visible = True
      end>
  end
end
