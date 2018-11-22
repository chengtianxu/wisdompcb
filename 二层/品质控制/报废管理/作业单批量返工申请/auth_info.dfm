object Form_authinfo: TForm_authinfo
  Left = 267
  Top = 219
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #23457#25209#20449#24687
  ClientHeight = 269
  ClientWidth = 642
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
    Width = 642
    Height = 273
    Align = alTop
    DataSource = DM.DataSource2
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
        FieldName = 'rkey203'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'dept_ptr'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'dept_name'
        Title.Caption = #35780#23457#37096#38376
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'user_ptr'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'employee_name'
        Title.Caption = #35780#23457#29992#25143
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'auth_date'
        Title.Caption = #35780#23457#26085#26399
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PUTH_INFO'
        Title.Caption = #35780#23457#22791#27880
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'seq_no'
        Title.Caption = #23457#25209#39034#24207
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'auth_flag'
        Title.Caption = #26159#21542#20026#24403#21069#23457#25209#37096#38376
        Visible = True
      end>
  end
end
