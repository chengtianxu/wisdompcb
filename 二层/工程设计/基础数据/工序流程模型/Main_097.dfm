object frmMain_097: TfrmMain_097
  Left = 250
  Top = 149
  Width = 549
  Height = 485
  Caption = #26234#33021#27969#31243#35774#35745#27169#22411
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 438
    Top = 41
    Width = 103
    Height = 398
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    object btnNew: TButton
      Left = 16
      Top = 78
      Width = 75
      Height = 25
      Caption = #26032#22686
      TabOrder = 0
      OnClick = btnNewClick
    end
    object btnEdit: TButton
      Left = 16
      Top = 124
      Width = 75
      Height = 25
      Caption = #32534#36753
      TabOrder = 1
      OnClick = btnEditClick
    end
    object btnDelete: TButton
      Left = 16
      Top = 217
      Width = 75
      Height = 25
      Caption = #21024#38500
      TabOrder = 2
      OnClick = btnDeleteClick
    end
    object Button4: TButton
      Left = 16
      Top = 264
      Width = 75
      Height = 25
      Caption = #20851#38381
      TabOrder = 3
      OnClick = Button4Click
    end
    object btnRefresh: TButton
      Left = 16
      Top = 32
      Width = 75
      Height = 25
      Caption = #21047#26032
      TabOrder = 4
      OnClick = btnRefreshClick
    end
    object Button1: TButton
      Left = 16
      Top = 170
      Width = 75
      Height = 25
      Caption = #22797#21046
      TabOrder = 5
      OnClick = Button1Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 438
    Height = 398
    Align = alClient
    DataSource = dsMaster
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = N6Click
    OnKeyPress = DBGrid1KeyPress
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ENG_FLOW_NAME'
        Title.Alignment = taCenter
        Title.Caption = #27169#22411#21517#31216
        Title.Color = clRed
        Width = 133
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENG_FLOW_DESC'
        Title.Alignment = taCenter
        Title.Caption = #25551#36848
        Width = 215
        Visible = True
      end>
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 439
    Width = 541
    Height = 19
    Panels = <
      item
        Text = #25628#32034#65306
        Width = 50
      end
      item
        Width = 150
      end
      item
        Width = 100
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 541
    Height = 41
    Align = alTop
    TabOrder = 3
    object label_Key_Field: TLabel
      Left = 8
      Top = 16
      Width = 105
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #26597#25214#65306#34920#21333#21517#31216
    end
    object edtKeyValue: TEdit
      Left = 120
      Top = 8
      Width = 169
      Height = 21
      TabOrder = 0
      OnChange = edtKeyValueChange
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 240
    Top = 112
    object N1: TMenuItem
      Caption = #26032#22686
      OnClick = btnNewClick
    end
    object N2: TMenuItem
      Caption = #32534#36753
      OnClick = btnEditClick
    end
    object N6: TMenuItem
      Caption = #26816#26597
      OnClick = N6Click
    end
    object N3: TMenuItem
      Caption = #22797#21046
      Visible = False
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object N4: TMenuItem
      Caption = #21024#38500
      OnClick = btnDeleteClick
    end
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 64
    Top = 104
  end
  object adsMaster: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from data0504'#13#10'order by Eng_FLOw_Name'
    Parameters = <>
    Left = 112
    Top = 104
  end
  object dsMaster: TDataSource
    DataSet = adsMaster
    Left = 152
    Top = 104
  end
  object ADOStoredProc1: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'Copy_Eng_Flow;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@rkey_Org'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ModName'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@ModDesc'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@rKey_New'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 248
    Top = 160
  end
end
