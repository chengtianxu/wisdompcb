object Form6: TForm6
  Left = 309
  Top = 179
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #23457#25209#20449#24687
  ClientHeight = 316
  ClientWidth = 497
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
    Left = 2
    Top = 235
    Width = 85
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#25552#20132#21463#29702#26085#26399
  end
  object Label2: TLabel
    Left = 124
    Top = 235
    Width = 85
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#25552#20132#23457#25209#26085#26399
  end
  object Label3: TLabel
    Left = 251
    Top = 235
    Width = 78
    Height = 13
    Alignment = taRightJustify
    Caption = #25552#20132#23457#25209#20154#21592
  end
  object Label4: TLabel
    Left = 366
    Top = 235
    Width = 85
    Height = 13
    Caption = ' '#26368#21518#23457#25209#26085#26399
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 497
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
        Width = 73
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
    Left = 206
    Top = 288
    Width = 75
    Height = 25
    Caption = #20851#38381
    ModalResult = 1
    TabOrder = 0
    OnKeyDown = FormKeyDown
  end
  object DBEdit1: TDBEdit
    Left = 7
    Top = 253
    Width = 118
    Height = 21
    Color = cl3DLight
    DataField = 'ent_date'
    DataSource = DM.DataSource1
    ReadOnly = True
    TabOrder = 2
  end
  object DBEdit2: TDBEdit
    Left = 130
    Top = 253
    Width = 113
    Height = 21
    Color = cl3DLight
    DataField = 'auth_date'
    DataSource = DM.DataSource1
    ReadOnly = True
    TabOrder = 3
  end
  object Edit1: TEdit
    Left = 247
    Top = 253
    Width = 121
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 4
  end
  object DBEdit3: TDBEdit
    Left = 372
    Top = 253
    Width = 121
    Height = 21
    Color = cl3DLight
    DataField = 'edited_date'
    DataSource = DM.DataSource1
    ReadOnly = True
    TabOrder = 5
  end
end
