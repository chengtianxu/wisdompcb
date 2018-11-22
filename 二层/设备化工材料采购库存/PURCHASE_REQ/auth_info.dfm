object Form6: TForm6
  Left = 309
  Top = 179
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #23457#25209#20449#24687
  ClientHeight = 314
  ClientWidth = 483
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
  object Label1: TLabel
    Left = 11
    Top = 235
    Width = 85
    Height = 13
    Caption = ' '#25552#20132#23457#25209#26085#26399
  end
  object Label2: TLabel
    Left = 123
    Top = 235
    Width = 85
    Height = 13
    Caption = ' '#26368#21518#23457#25209#26085#26399
  end
  object Label3: TLabel
    Left = 236
    Top = 235
    Width = 85
    Height = 13
    Caption = ' '#25552#20132#37319#36141#26085#26399
  end
  object Label4: TLabel
    Left = 360
    Top = 232
    Width = 92
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#25552#20132#37319#36141#20154#21592':'
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 483
    Height = 225
    Align = alTop
    DataSource = DM.DataSource5
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
        FieldName = 'USER_ID'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USER_FULL_NAME'
        Width = 156
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'auth_flag'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'auth_date'
        Width = 82
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
    Left = 204
    Top = 284
    Width = 75
    Height = 25
    Caption = #20851#38381
    ModalResult = 1
    TabOrder = 0
    OnKeyDown = FormKeyDown
  end
  object DBEdit1: TDBEdit
    Left = 16
    Top = 251
    Width = 102
    Height = 21
    Color = cl3DLight
    DataField = 'ent_date'
    DataSource = DM.DataSource1
    ReadOnly = True
    TabOrder = 2
  end
  object DBEdit2: TDBEdit
    Left = 128
    Top = 251
    Width = 102
    Height = 21
    Color = cl3DLight
    DataField = 'edited_date'
    DataSource = DM.DataSource1
    ReadOnly = True
    TabOrder = 3
  end
  object DBEdit3: TDBEdit
    Left = 243
    Top = 251
    Width = 102
    Height = 21
    Color = cl3DLight
    DataField = 'auth_date'
    DataSource = DM.DataSource1
    ReadOnly = True
    TabOrder = 4
  end
  object Edit1: TEdit
    Left = 365
    Top = 251
    Width = 99
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 5
  end
end
