object Form1: TForm1
  Left = 539
  Top = 367
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26448#26009#20998#32452
  ClientHeight = 406
  ClientWidth = 512
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bar1: TStatusBar
    Left = 0
    Top = 387
    Width = 512
    Height = 19
    Panels = <>
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 390
    Height = 387
    Align = alLeft
    DataSource = DataSource1
    Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = editClick
    OnKeyPress = FormKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'inv_group_name'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inv_group_desc'
        Visible = True
      end>
  end
  object bitbtn1: TBitBtn
    Left = 416
    Top = 253
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Hint = #36864#20986
    Caption = #20851#38381
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = bitbtn1Click
    OnKeyPress = FormKeyPress
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 416
    Top = 63
    Width = 75
    Height = 25
    Hint = #26032#22686
    Caption = #26032#22686
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = addClick
    OnKeyPress = FormKeyPress
  end
  object BitBtn3: TBitBtn
    Left = 416
    Top = 108
    Width = 75
    Height = 25
    Caption = #32534#36753
    TabOrder = 4
    OnClick = editClick
    OnKeyPress = FormKeyPress
  end
  object BitBtn4: TBitBtn
    Left = 416
    Top = 152
    Width = 75
    Height = 25
    Caption = #21024#38500
    TabOrder = 5
    OnClick = deleteClick
    OnKeyPress = FormKeyPress
  end
  object bitbtn5: TBitBtn
    Left = 416
    Top = 200
    Width = 75
    Height = 25
    Caption = #23548#20986'EXCEL'
    TabOrder = 6
    OnClick = bitbtn5Click
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 398
    Top = 336
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 468
    Top = 336
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
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    AfterDelete = ADOTable1AfterDelete
    OnDeleteError = ADOTable1DeleteError
    OnPostError = ADOTable1PostError
    IndexFieldNames = 'inv_group_name'
    TableName = 'data0019'
    Left = 432
    Top = 336
    object ADOTable1rkey: TIntegerField
      FieldName = 'rkey'
    end
    object ADOTable1inv_group_name: TStringField
      DisplayLabel = #32452#21035#20195#30721
      FieldName = 'inv_group_name'
    end
    object ADOTable1inv_group_desc: TStringField
      DisplayLabel = #32452#21035#21517#31216
      FieldName = 'inv_group_desc'
      Size = 40
    end
    object ADOTable1Rkey595: TIntegerField
      FieldName = 'Rkey595'
    end
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 432
    Top = 304
  end
end
