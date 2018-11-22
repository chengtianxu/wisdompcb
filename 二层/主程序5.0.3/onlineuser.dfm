object Form_onlineuser: TForm_onlineuser
  Left = 269
  Top = 174
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #24403#21069#22312#32447#29992#25143
  ClientHeight = 493
  ClientWidth = 534
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 157
    Top = 13
    Width = 52
    Height = 13
    Alignment = taRightJustify
    Caption = #30331#20837#32534#21495
  end
  object Label2: TLabel
    Left = 396
    Top = 13
    Width = 72
    Height = 13
    Alignment = taRightJustify
    Caption = #24403#21069#29992#25143#25968':'
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 40
    Width = 532
    Height = 391
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'USER_LOGIN_NAME'
        Title.Color = clRed
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USER_FULL_NAME'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMPUTER'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NETWORK_ID'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOGIN_IN_TIME'
        Width = 153
        Visible = True
      end>
  end
  object Edit1: TEdit
    Left = 211
    Top = 9
    Width = 121
    Height = 21
    TabOrder = 1
    OnChange = Edit1Change
  end
  object Button1: TButton
    Left = 136
    Top = 456
    Width = 75
    Height = 25
    Caption = #24377#20986#29992#25143
    Enabled = False
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 224
    Top = 456
    Width = 75
    Height = 25
    Caption = #21047#26032
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 312
    Top = 456
    Width = 75
    Height = 25
    Caption = #20851#38381
    ModalResult = 2
    TabOrder = 4
  end
  object Edit2: TEdit
    Left = 474
    Top = 10
    Width = 57
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 5
  end
  object ADS73: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    AfterOpen = ADS73AfterOpen
    CommandText = 
      'SELECT RKEY, USER_FULL_NAME, USER_LOGIN_NAME, NETWORK_ID, COMPUT' +
      'ER, LOGIN_IN_TIME'#13#10'FROM Data0073'#13#10'WHERE COMPUTER <>'#39#39
    IndexFieldNames = 'USER_LOGIN_NAME'
    Parameters = <>
    Left = 32
    Top = 136
    object ADS73RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADS73USER_FULL_NAME: TStringField
      DisplayLabel = #29992#25143#21517#31216
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object ADS73USER_LOGIN_NAME: TStringField
      DisplayLabel = #30331#20837#32534#21495
      FieldName = 'USER_LOGIN_NAME'
      Size = 15
    end
    object ADS73NETWORK_ID: TStringField
      DisplayLabel = 'IP'#22320#22336
      FieldName = 'NETWORK_ID'
      Size = 15
    end
    object ADS73COMPUTER: TStringField
      DisplayLabel = #30005#33041#21517
      FieldName = 'COMPUTER'
      Size = 30
    end
    object ADS73LOGIN_IN_TIME: TDateTimeField
      DisplayLabel = #30331#20837#26102#38388
      FieldName = 'LOGIN_IN_TIME'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADS73
    OnDataChange = DataSource1DataChange
    Left = 72
    Top = 136
  end
  object PopupMenu1: TPopupMenu
    Left = 136
    Top = 120
    object N1: TMenuItem
      Caption = #24377#20986#35813#29992#25143
      Enabled = False
      OnClick = Button1Click
    end
  end
end
