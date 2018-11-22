object Frm_AudInf: TFrm_AudInf
  Left = 281
  Top = 193
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #23457#25209#20449#24687
  ClientHeight = 274
  ClientWidth = 621
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 621
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
    OnKeyDown = FormKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'user_id'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'user_full_name'
        Width = 123
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
        Width = 119
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ranking'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'remark'
        Width = 160
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 262
    Top = 245
    Width = 75
    Height = 25
    Caption = #20851#38381
    ModalResult = 1
    TabOrder = 0
    OnKeyDown = FormKeyDown
  end
end
