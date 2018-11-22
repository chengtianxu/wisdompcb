object frmMain_data095: TfrmMain_data095
  Left = 268
  Top = 188
  Width = 450
  Height = 439
  Caption = #24037#31243#21442#25968#31867#21035#24211
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 339
    Top = 41
    Width = 103
    Height = 352
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    object btnNew: TButton
      Left = 16
      Top = 75
      Width = 75
      Height = 25
      Caption = #26032#22686
      TabOrder = 0
      OnClick = btnNewClick
    end
    object btnEdit: TButton
      Left = 16
      Top = 118
      Width = 75
      Height = 25
      Caption = #32534#36753
      TabOrder = 1
      OnClick = btnEditClick
    end
    object btnDelete: TButton
      Left = 16
      Top = 164
      Width = 75
      Height = 25
      Caption = #21024#38500
      TabOrder = 2
      OnClick = btnDeleteClick
    end
    object Button4: TButton
      Left = 16
      Top = 216
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
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 339
    Height = 352
    Align = alClient
    DataSource = dsMaster
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyPress = DBGrid1KeyPress
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CATEGORY_NAME'
        Title.Alignment = taCenter
        Title.Caption = #31867#21035#21517#31216
        Title.Color = clRed
        Width = 129
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CATEGORY_DESC'
        Title.Alignment = taCenter
        Title.Caption = #31867#21035#25551#36848
        Width = 183
        Visible = True
      end>
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 393
    Width = 442
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
    Width = 442
    Height = 41
    Align = alTop
    TabOrder = 3
    object label_Key_Field: TLabel
      Left = 22
      Top = 13
      Width = 91
      Height = 13
      Alignment = taRightJustify
      Caption = #26597#25214#65306#31867#21035#21517#31216
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
    object N3: TMenuItem
      Caption = #26816#26597
      OnClick = DBGrid1DblClick
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
    LockType = ltBatchOptimistic
    OnNewRecord = adsMasterNewRecord
    CommandText = 'select * from Data0277'
    Parameters = <>
    Left = 112
    Top = 104
  end
  object dsMaster: TDataSource
    DataSet = adsMaster
    Left = 152
    Top = 104
  end
end
