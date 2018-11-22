object Form4: TForm4
  Left = 276
  Top = 221
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #29616#26377#20379#24212#21830#20449#24687
  ClientHeight = 294
  ClientWidth = 522
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 522
    Height = 245
    Align = alTop
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = FormKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_NAME'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRICE_1'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LEAD_TIME'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAX_2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'avl_type'
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 223
    Top = 257
    Width = 71
    Height = 26
    Caption = #20851#38381
    ModalResult = 1
    TabOrder = 1
    OnKeyDown = FormKeyDown
  end
  object DataSource1: TDataSource
    DataSet = DM.ADO28
    Left = 208
    Top = 88
  end
end
