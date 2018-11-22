object frmMain_167: TfrmMain_167
  Left = 337
  Top = 141
  Width = 581
  Height = 492
  Caption = #25253#20215#35268#21017#35774#32622'-'
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
    Left = 462
    Top = 41
    Width = 103
    Height = 396
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    object btnNew: TButton
      Left = 16
      Top = 120
      Width = 75
      Height = 25
      Caption = #26032#22686
      TabOrder = 0
      OnClick = btnNewClick
    end
    object btnEdit: TButton
      Left = 16
      Top = 166
      Width = 75
      Height = 25
      Caption = #32534#36753
      TabOrder = 1
      OnClick = btnEditClick
    end
    object btnDelete: TButton
      Left = 16
      Top = 258
      Width = 75
      Height = 25
      Caption = #21024#38500
      TabOrder = 2
      OnClick = btnDeleteClick
    end
    object Button4: TButton
      Left = 16
      Top = 304
      Width = 75
      Height = 25
      Caption = #20851#38381
      TabOrder = 3
      OnClick = Button4Click
    end
    object btnRefresh: TButton
      Left = 16
      Top = 74
      Width = 75
      Height = 25
      Caption = #21047#26032
      TabOrder = 4
      OnClick = btnRefreshClick
    end
    object Button1: TButton
      Left = 16
      Top = 212
      Width = 75
      Height = 25
      Caption = #26597#30475
      TabOrder = 5
      OnClick = N5Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 462
    Height = 396
    Align = alClient
    DataSource = dsMaster
    ImeName = #20013#25991' ('#31616#20307') - '#29579#30721#20116#31508#22411'86'#29256
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
        FieldName = 'ADDER_NAME'
        Title.Alignment = taCenter
        Title.Caption = #21517#31216
        Title.Color = clRed
        Width = 172
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CalcMode'
        Title.Alignment = taCenter
        Title.Caption = #35745#31639#27169#24335
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FeeType'
        Title.Alignment = taCenter
        Title.Caption = #36153#29992#31867#21035
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = #26159#21542#26377#25928
        Width = 65
        Visible = True
      end>
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 437
    Width = 565
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
    Width = 565
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
      ImeName = #20013#25991' ('#31616#20307') - '#29579#30721#20116#31508#22411'86'#29256
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
    object N5: TMenuItem
      Caption = #26597#30475
      OnClick = N5Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N6: TMenuItem
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
    OnCalcFields = adsMasterCalcFields
    OnNewRecord = adsMasterNewRecord
    CommandText = 
      'select *,'#13#10'case activeflag when 0 then '#39#21542#39' '#13#10'when 1 then '#39#26159#39' end' +
      ' as '#39#26159#21542#26377#25928#39#13#10'from data0348'#13#10'order by data0348.adder_name'
    Parameters = <>
    Left = 112
    Top = 104
    object adsMasterRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object adsMasterTTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object adsMasterADDER_NAME: TStringField
      FieldName = 'ADDER_NAME'
    end
    object adsMasterFORMULA: TMemoField
      FieldName = 'FORMULA'
      BlobType = ftMemo
    end
    object adsMasterSELECTED: TSmallintField
      FieldName = 'SELECTED'
    end
    object adsMasterPCENTS: TWordField
      FieldName = 'PCENTS'
    end
    object adsMasterMIN_VALUE: TMemoField
      FieldName = 'MIN_VALUE'
      BlobType = ftMemo
    end
    object adsMasterMAX_VALUE: TMemoField
      FieldName = 'MAX_VALUE'
      BlobType = ftMemo
    end
    object adsMasterDFT_SELECTED: TWordField
      FieldName = 'DFT_SELECTED'
    end
    object adsMasterSPEC_RKEY: TStringField
      FieldName = 'SPEC_RKEY'
      Size = 1
    end
    object adsMasterFeeType: TStringField
      FieldKind = fkCalculated
      FieldName = 'FeeType'
      Size = 30
      Calculated = True
    end
    object adsMasterCalcMode: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcMode'
      Size = 30
      Calculated = True
    end
    object adsMasterActiveFlag: TBooleanField
      FieldName = 'ActiveFlag'
    end
    object adsMasterrate_margin: TBCDField
      FieldName = 'rate_margin'
      Precision = 6
      Size = 2
    end
    object adsMasterDSDesigner: TStringField
      FieldName = #26159#21542#26377#25928
      ReadOnly = True
      Size = 2
    end
  end
  object dsMaster: TDataSource
    DataSet = adsMaster
    Left = 152
    Top = 104
  end
  object aqTmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 48
    Top = 192
  end
end
