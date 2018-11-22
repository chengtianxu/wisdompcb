object Form1: TForm1
  Left = 329
  Top = 218
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20135#21697#20998#31867
  ClientHeight = 401
  ClientWidth = 617
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poScreenCenter
  ScreenSnap = True
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDblClick = FormDblClick
  PixelsPerInch = 96
  TextHeight = 13
  object db_ptr: TLabel
    Left = 400
    Top = 336
    Width = 7
    Height = 13
    Visible = False
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 390
    Height = 401
    Align = alLeft
    DataSource = DM.DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
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
        FieldName = 'PR_GRP_CODE'
        Width = 129
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRODUCT_GROUP_NAME'
        Width = 238
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 480
    Top = 96
    Width = 75
    Height = 25
    Caption = #26032#22686
    TabOrder = 0
    OnClick = addClick
  end
  object Button2: TButton
    Left = 480
    Top = 144
    Width = 75
    Height = 25
    Caption = #32534#36753
    TabOrder = 2
    OnClick = editClick
  end
  object Button3: TButton
    Left = 480
    Top = 192
    Width = 75
    Height = 25
    Caption = #21024#38500
    TabOrder = 3
    OnClick = deleteClick
  end
  object Button4: TButton
    Left = 480
    Top = 240
    Width = 75
    Height = 25
    Caption = #20851#38381
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 480
    Top = 280
    Width = 75
    Height = 25
    Caption = #26597#25214
    TabOrder = 5
    OnClick = Button5Click
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 480
    Top = 32
    object add: TMenuItem
      Caption = #26032#22686
      OnClick = addClick
    end
    object edit: TMenuItem
      Caption = #32534#36753
      OnClick = editClick
    end
    object delete: TMenuItem
      Caption = #21024#38500
      OnClick = deleteClick
    end
  end
end
