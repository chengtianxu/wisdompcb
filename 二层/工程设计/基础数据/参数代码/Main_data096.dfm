object frmMain_data096: TfrmMain_data096
  Left = 280
  Top = 220
  Width = 564
  Height = 475
  Caption = #24037#31243#21442#25968#35774#23450
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
    Left = 445
    Top = 41
    Width = 103
    Height = 376
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
      Top = 120
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 417
    Width = 548
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
    Width = 548
    Height = 41
    Align = alTop
    TabOrder = 2
    object label_Key_Field: TLabel
      Left = 8
      Top = 16
      Width = 105
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #26597#25214#65306#21517#31216
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 445
    Height = 376
    Align = alClient
    DataSource = dsMaster
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 3
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
        FieldName = 'PARAMETER_NAME'
        Title.Caption = #21442#25968#21517#31216
        Width = 151
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'parameter_desc'
        Title.Caption = #25551#36848
        Width = 178
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'category'
        Title.Caption = #21442#25968#31867#21035
        Width = 93
        Visible = True
      end>
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
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select M.rkey,M.PARAMETER_NAME,M.parameter_desc,M.data_type,M.Bo' +
      'mPriceType,'#13#10'M.spec_rkey,M.sequence_no,M.category_ptr,case M.cat' +
      'egory_ptr when 2'#13#10'then '#39#20840#23616#21442#25968#39' when 3 then '#39#21046#31243#21442#25968#39' end as category' +
      #13#10' from Data0278 M'#13#10'order by M.rkey'
    Parameters = <>
    Left = 112
    Top = 104
    object adsMasterrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object adsMasterPARAMETER_NAME: TStringField
      FieldName = 'PARAMETER_NAME'
      Size = 10
    end
    object adsMasterparameter_desc: TStringField
      FieldName = 'parameter_desc'
    end
    object adsMasterdata_type: TWordField
      FieldName = 'data_type'
    end
    object adsMasterspec_rkey: TStringField
      FieldName = 'spec_rkey'
      FixedChar = True
      Size = 2
    end
    object adsMastersequence_no: TSmallintField
      FieldName = 'sequence_no'
    end
    object adsMastercategory_ptr: TIntegerField
      FieldName = 'category_ptr'
    end
    object adsMastercategory: TStringField
      FieldName = 'category'
      Size = 8
    end
    object intgrfldMasterBomPriceType: TIntegerField
      FieldName = 'BomPriceType'
    end
  end
  object dsMaster: TDataSource
    DataSet = adsMaster
    Left = 152
    Top = 104
  end
end
