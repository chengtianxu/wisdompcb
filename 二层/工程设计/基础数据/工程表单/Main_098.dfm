object frmMain_098: TfrmMain_098
  Left = 341
  Top = 161
  Width = 470
  Height = 439
  Caption = #24037#31243#34920#21333#31649#29702
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
    Left = 359
    Top = 41
    Width = 103
    Height = 352
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    object btnNew: TButton
      Left = 14
      Top = 74
      Width = 75
      Height = 25
      Caption = #26032#22686
      TabOrder = 0
      OnClick = btnNewClick
    end
    object btnEdit: TButton
      Left = 14
      Top = 120
      Width = 75
      Height = 25
      Caption = #32534#36753
      TabOrder = 1
      OnClick = btnEditClick
    end
    object btnDelete: TButton
      Left = 14
      Top = 258
      Width = 75
      Height = 25
      Caption = #21024#38500
      TabOrder = 2
      OnClick = btnDeleteClick
    end
    object Button4: TButton
      Left = 14
      Top = 212
      Width = 75
      Height = 25
      Caption = #26597#30475
      TabOrder = 3
      OnClick = Button4Click
    end
    object btnRefresh: TButton
      Left = 14
      Top = 28
      Width = 75
      Height = 25
      Caption = #21047#26032
      TabOrder = 4
      OnClick = btnRefreshClick
    end
    object btnCopy: TButton
      Left = 14
      Top = 166
      Width = 75
      Height = 25
      Caption = #22797#21046
      TabOrder = 5
      OnClick = N3Click
    end
    object Button2: TButton
      Left = 14
      Top = 304
      Width = 75
      Height = 25
      Caption = #20851#38381
      TabOrder = 6
      OnClick = Button2Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 359
    Height = 352
    Align = alClient
    DataSource = dsMaster
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = btnEditClick
    OnKeyPress = DBGrid1KeyPress
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ENG_TABLE_NAME'
        Title.Alignment = taCenter
        Title.Caption = #34920#21333#21517#31216
        Title.Color = clRed
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENG_TABLE_DESC'
        Title.Alignment = taCenter
        Title.Caption = #25551#36848
        Width = 182
        Visible = True
      end>
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 393
    Width = 462
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
    Width = 462
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
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
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
      Caption = #22797#21046
      OnClick = N3Click
    end
    object N6: TMenuItem
      Caption = #26816#26597
      OnClick = N6Click
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
    CommandText = 'select * from Data0280'
    Parameters = <>
    Left = 112
    Top = 104
  end
  object dsMaster: TDataSource
    DataSet = adsMaster
    Left = 152
    Top = 104
  end
  object adsData0282: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select * from data0282 where eng_table_ptr=:value'#13#10'order by Row_' +
      'index,Col'
    Parameters = <
      item
        Name = 'value'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 112
    Top = 184
  end
  object aqTmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 176
    Top = 184
  end
end
