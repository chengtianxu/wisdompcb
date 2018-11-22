object frmEdit_Data0278: TfrmEdit_Data0278
  Left = 260
  Top = 247
  BorderStyle = bsDialog
  Caption = #24037#31243#21442#25968
  ClientHeight = 386
  ClientWidth = 686
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 686
    Height = 386
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 32
      Width = 60
      Height = 13
      Caption = #21517'   '#31216#65306
    end
    object Label2: TLabel
      Left = 224
      Top = 32
      Width = 60
      Height = 13
      Caption = #25551'   '#36848#65306
    end
    object Label4: TLabel
      Left = 424
      Top = 96
      Width = 60
      Height = 13
      Caption = #24207'   '#21495#65306
    end
    object Label6: TLabel
      Left = 24
      Top = 56
      Width = 60
      Height = 13
      Caption = #21333'   '#20301#65306
    end
    object Label7: TLabel
      Left = 424
      Top = 64
      Width = 65
      Height = 13
      Caption = #25968#25454#31867#22411#65306
    end
    object Label8: TLabel
      Left = 24
      Top = 94
      Width = 65
      Height = 13
      Caption = #35745#31639#20844#24335#65306
    end
    object spdBtnUnit: TSpeedButton
      Left = 186
      Top = 56
      Width = 23
      Height = 22
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        04000000000078000000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888800000888880000080F000888880F00080F000888880F0008000000080000
        000800F000000F00000800F000800F00000800F000800F000008800000000000
        0088880F00080F000888880000080000088888800088800088888880F08880F0
        888888800088800088888888888888888888}
      OnClick = spdBtnUnitClick
    end
    object Label9: TLabel
      Left = 24
      Top = 184
      Width = 60
      Height = 13
      Caption = #25104'   '#21592#65306
    end
    object DBEdit1: TDBEdit
      Left = 88
      Top = 24
      Width = 121
      Height = 21
      DataField = 'PARAMETER_NAME'
      DataSource = dsUpdate
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 288
      Top = 24
      Width = 321
      Height = 21
      DataField = 'PARAMETER_DESC'
      DataSource = dsUpdate
      TabOrder = 1
    end
    object DBEdit4: TDBEdit
      Left = 488
      Top = 88
      Width = 121
      Height = 21
      DataField = 'SEQUENCE_NO'
      DataSource = dsUpdate
      TabOrder = 2
    end
    object DBEdit5: TDBEdit
      Left = 88
      Top = 56
      Width = 97
      Height = 21
      Color = clGradientInactiveCaption
      DataField = 'UNIT_PTR'
      DataSource = dsUpdate
      ReadOnly = True
      TabOrder = 3
    end
    object dbcomboxDataType: TDBComboBox
      Left = 488
      Top = 56
      Width = 121
      Height = 21
      DataField = 'DATA_TYPE'
      DataSource = dsUpdate
      ItemHeight = 13
      Items.Strings = (
        #25968#23383#22411
        #23383#31526#22411)
      TabOrder = 4
      OnChange = dbcomboxDataTypeChange
    end
    object DBEdit6: TDBEdit
      Left = 88
      Top = 86
      Width = 321
      Height = 21
      DataField = 'PARAMETER_INFO'
      DataSource = dsUpdate
      TabOrder = 5
    end
    object DBCheckBox1: TDBCheckBox
      Left = 424
      Top = 174
      Width = 137
      Height = 17
      Caption = #19981#26174#31034#22312'M.I.'#19978
      DataField = 'STATUS'
      DataSource = dsUpdate
      TabOrder = 6
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBCheckBox7: TDBCheckBox
      Left = 424
      Top = 198
      Width = 137
      Height = 17
      Caption = #19981#26174#31034#22312#20316#19994#21333#19978
      DataField = 'status1'
      DataSource = dsUpdate
      TabOrder = 7
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBCheckBox8: TDBCheckBox
      Left = 424
      Top = 222
      Width = 161
      Height = 17
      Caption = #19981#26174#31034#22312#37197#26009#21333#19978
      DataField = 'STATUS2'
      DataSource = dsUpdate
      TabOrder = 8
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBCheckBox9: TDBCheckBox
      Left = 424
      Top = 246
      Width = 209
      Height = 17
      Caption = #20316#20026'MI'#21442#25968#26102#35201#27714#24517#39035#36755#20837
      DataField = 'STATUS3'
      DataSource = dsUpdate
      TabOrder = 9
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBCheckBox10: TDBCheckBox
      Left = 424
      Top = 270
      Width = 257
      Height = 17
      Caption = #20316#20026'MI'#21442#25968#26102#22312#22797#21046#26723#26696#26102#19981#22797#21046#26412#21442#25968
      DataField = 'STATUS4'
      DataSource = dsUpdate
      TabOrder = 10
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object btnSave: TButton
      Left = 200
      Top = 344
      Width = 75
      Height = 25
      Caption = #30830#23450'(&Y)'
      TabOrder = 11
      OnClick = btnSaveClick
    end
    object Button1: TButton
      Left = 328
      Top = 344
      Width = 75
      Height = 25
      Caption = #21462#28040'(&C)'
      ModalResult = 2
      TabOrder = 12
    end
    object DBCheckBox2: TDBCheckBox
      Left = 424
      Top = 294
      Width = 153
      Height = 17
      Caption = #25253#20215#21442#25968
      DataField = 'QUOTE_FLAG'
      DataSource = dsUpdate
      TabOrder = 13
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object GroupBox1: TGroupBox
      Left = 304
      Top = 115
      Width = 305
      Height = 51
      Caption = #25968#25454#22823#23567#33539#22260
      TabOrder = 14
      object Label10: TLabel
        Left = 10
        Top = 23
        Width = 39
        Height = 13
        Caption = #26368#23567#20540
      end
      object Label11: TLabel
        Left = 162
        Top = 23
        Width = 39
        Height = 13
        Caption = #26368#22823#20540
      end
      object DBEdit7: TDBEdit
        Left = 55
        Top = 19
        Width = 94
        Height = 21
        DataField = 'min_value'
        DataSource = dsUpdate
        TabOrder = 0
      end
      object DBEdit8: TDBEdit
        Left = 207
        Top = 19
        Width = 94
        Height = 21
        DataField = 'max_value'
        DataSource = dsUpdate
        TabOrder = 1
      end
    end
    object ehDBGrid_Sub1: TDBGridEh
      Left = 88
      Top = 181
      Width = 320
      Height = 138
      DataSource = dsUpdate_Sub
      FooterColor = clWindow
      FooterFont.Charset = ANSI_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -13
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking]
      PopupMenu = PopupMenu1
      TabOrder = 15
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnTitleClick = ehDBGrid_Sub1TitleClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'SEQUENCE_NO'
          Footers = <>
          ReadOnly = True
          Title.Caption = #24207#21495
          Width = 81
        end
        item
          EditButtons = <>
          FieldName = 'TVALUE'
          Footers = <>
          Title.Caption = #21442#25968#20540
        end>
    end
    object dbchkQUOTE_FLAG: TDBCheckBox
      Left = 424
      Top = 315
      Width = 89
      Height = 17
      Caption = 'RFQ'#21442#25968
      DataField = 'RFQMiParam'
      DataSource = dsUpdate
      TabOrder = 16
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dbchkQUOTE_FLAG1: TDBCheckBox
      Left = 528
      Top = 315
      Width = 89
      Height = 17
      Caption = 'RFQ'#24517#22635
      DataField = 'RFQMustParam'
      DataSource = dsUpdate
      TabOrder = 17
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object grp1: TGroupBox
      Left = 88
      Top = 112
      Width = 201
      Height = 49
      Caption = #21442#25968#31867#22411
      TabOrder = 18
      object rbGolb: TRadioButton
        Left = 8
        Top = 20
        Width = 73
        Height = 17
        Caption = #20840#23616#21442#25968
        TabOrder = 0
      end
      object rbDept: TRadioButton
        Left = 96
        Top = 20
        Width = 73
        Height = 17
        Caption = #21046#31243#21442#25968
        TabOrder = 1
      end
    end
    object cbxBp: TCheckBox
      Left = 424
      Top = 336
      Width = 97
      Height = 17
      Caption = 'BOM'#25253#20215#21442#25968
      TabOrder = 19
      OnClick = cbxBpClick
    end
    object cbxBomPrice: TComboBox
      Left = 527
      Top = 334
      Width = 122
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 20
      Text = 'BOM'#25253#20215#20840#23616#21442#25968
      Items.Strings = (
        'BOM'#25253#20215#20840#23616#21442#25968
        'BOM'#25253#20215#38144#21806#21442#25968)
    end
  end
  object adsUpdate: TADODataSet
    Connection = frmMain_data096.ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterScroll = adsUpdateAfterScroll
    OnNewRecord = adsUpdateNewRecord
    CommandText = 'select * from data0278 where parameter_name=:KeyName'
    Parameters = <
      item
        Name = 'KeyName'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    Left = 8
    Top = 240
    object adsUpdateRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object adsUpdatePARAMETER_NAME: TStringField
      FieldName = 'PARAMETER_NAME'
      OnValidate = adsUpdatePARAMETER_NAMEValidate
      FixedChar = True
      Size = 10
    end
    object adsUpdatePARAMETER_DESC: TStringField
      FieldName = 'PARAMETER_DESC'
      FixedChar = True
    end
    object adsUpdateCATEGORY_PTR: TIntegerField
      FieldName = 'CATEGORY_PTR'
      OnGetText = adsUpdateCATEGORY_PTRGetText
    end
    object adsUpdateUNIT_PTR: TIntegerField
      FieldName = 'UNIT_PTR'
      OnGetText = adsUpdateUNIT_PTRGetText
    end
    object adsUpdateDATA_TYPE: TWordField
      FieldName = 'DATA_TYPE'
      OnGetText = adsUpdateDATA_TYPEGetText
      OnSetText = adsUpdateDATA_TYPESetText
    end
    object adsUpdatePROTECTION_FLAG: TWordField
      FieldName = 'PROTECTION_FLAG'
    end
    object adsUpdateSTATUS: TWordField
      FieldName = 'STATUS'
    end
    object adsUpdatestatus1: TWordField
      FieldName = 'status1'
    end
    object adsUpdateSTATUS2: TWordField
      FieldName = 'STATUS2'
    end
    object adsUpdateSTATUS3: TWordField
      FieldName = 'STATUS3'
    end
    object adsUpdatePARAMETER_INFO: TStringField
      FieldName = 'PARAMETER_INFO'
      FixedChar = True
      Size = 80
    end
    object adsUpdatePARAMETER_DOC_FLAG: TWordField
      FieldName = 'PARAMETER_DOC_FLAG'
    end
    object adsUpdateSEQUENCE_NO: TSmallintField
      FieldName = 'SEQUENCE_NO'
    end
    object adsUpdateQUOTE_FLAG: TStringField
      FieldName = 'QUOTE_FLAG'
      FixedChar = True
      Size = 1
    end
    object adsUpdatePRODUCTION_FLAG: TIntegerField
      FieldName = 'PRODUCTION_FLAG'
    end
    object adsUpdateProd_Unit_base: TStringField
      FieldName = 'Prod_Unit_base'
      FixedChar = True
      Size = 1
    end
    object adsUpdateSPEC_RKEY: TStringField
      FieldName = 'SPEC_RKEY'
      FixedChar = True
      Size = 2
    end
    object adsUpdateSTATUS4: TWordField
      FieldName = 'STATUS4'
    end
    object adsUpdatemin_value: TFloatField
      FieldName = 'min_value'
    end
    object adsUpdatemax_value: TFloatField
      FieldName = 'max_value'
    end
    object adsUpdateRFQMiParam: TBooleanField
      FieldName = 'RFQMiParam'
    end
    object adsUpdateRFQMustParam: TBooleanField
      FieldName = 'RFQMustParam'
    end
    object intgrfldUpdateBomPriceType: TIntegerField
      FieldName = 'BomPriceType'
    end
  end
  object dsUpdate: TDataSource
    DataSet = adsUpdate
    Left = 48
    Top = 240
  end
  object adsUpdate_Sub: TADODataSet
    Connection = frmMain_data096.ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    BeforeInsert = adsUpdate_SubBeforeInsert
    BeforeEdit = adsUpdate_SubBeforeEdit
    BeforePost = adsUpdate_SubBeforePost
    BeforeDelete = adsUpdate_SubBeforeDelete
    OnNewRecord = adsUpdate_SubNewRecord
    CommandText = 'select * from data0338 where parameter_ptr=:KeyValue'
    Parameters = <
      item
        Name = 'KeyValue'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 8
    Top = 272
    object adsUpdate_Subrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object adsUpdate_SubPARAMETER_PTR: TIntegerField
      FieldName = 'PARAMETER_PTR'
    end
    object adsUpdate_SubSEQUENCE_NO: TSmallintField
      FieldName = 'SEQUENCE_NO'
    end
    object adsUpdate_SubTVALUE: TStringField
      FieldName = 'TVALUE'
      Size = 30
    end
  end
  object dsUpdate_Sub: TDataSource
    DataSet = adsUpdate_Sub
    Left = 48
    Top = 272
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 320
    Top = 224
    object N2: TMenuItem
      Caption = #26032#22686
      OnClick = N2Click
    end
    object N1: TMenuItem
      Caption = #21024#38500
      OnClick = N1Click
    end
  end
end
