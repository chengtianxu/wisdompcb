object Form_deptinfo: TForm_deptinfo
  Left = 266
  Top = 205
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #37096#38376#23457#25209#20449#24687
  ClientHeight = 303
  ClientWidth = 514
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'ËÎÌו'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 514
    Height = 265
    Align = alTop
    DataSource = dm.DataSource5
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'ËÎÌו'
    TitleFont.Style = []
    OnKeyDown = FormKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'DEPT_NAME'
        Width = 125
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'auth_flag'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'auth_date'
        Width = 163
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 214
    Top = 275
    Width = 75
    Height = 25
    Caption = #20851#38381
    ModalResult = 1
    TabOrder = 1
  end
end
