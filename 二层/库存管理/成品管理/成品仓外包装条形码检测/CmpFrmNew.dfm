object frmCmpNew: TfrmCmpNew
  Left = 237
  Top = 200
  Width = 704
  Height = 454
  Caption = #21326#20026#26465#30721#21305#37197
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 16
    Top = 86
    Width = 80
    Height = 15
    Caption = #26412#21378#26631#31614'ID'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 296
    Top = 86
    Width = 96
    Height = 15
    Caption = #21326#20026#26631#31614#26465#30721
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
  end
  object lblNote: TLabel
    Left = 16
    Top = 342
    Width = 265
    Height = 67
    AutoSize = False
    Caption = '              '
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -24
    Font.Name = #40657#20307
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object lbl3: TLabel
    Left = 152
    Top = 90
    Width = 39
    Height = 13
    Caption = #25968#25454#24211
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object lbl4: TLabel
    Left = 456
    Top = 90
    Width = 39
    Height = 13
    Caption = #25968#25454#24211
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object lbl6: TLabel
    Left = 272
    Top = 320
    Width = 100
    Height = 23
    Caption = #24050#32463#21305#37197#65306
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
  end
  object lblShiJiPiPei: TLabel
    Left = 368
    Top = 318
    Width = 82
    Height = 33
    AutoSize = False
    Caption = '0'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
  end
  object lbl5: TLabel
    Left = 16
    Top = 139
    Width = 160
    Height = 15
    Caption = '                    '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
  end
  object lbl7: TLabel
    Left = 296
    Top = 139
    Width = 160
    Height = 15
    Caption = '                    '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
  end
  object lbl8: TLabel
    Left = 488
    Top = 20
    Width = 64
    Height = 15
    Caption = #21305#37197#31665#25968
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
  end
  object edtOutID: TEdit
    Left = 16
    Top = 110
    Width = 241
    Height = 23
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #40657#20307
    Font.Style = []
    ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
    ParentFont = False
    TabOrder = 0
    OnKeyPress = edtOutIDKeyPress
  end
  object edtHWID: TEdit
    Left = 296
    Top = 110
    Width = 265
    Height = 23
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #40657#20307
    Font.Style = []
    ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
    ParentFont = False
    TabOrder = 1
    OnKeyPress = edtHWIDKeyPress
  end
  object grp1: TGroupBox
    Left = 16
    Top = 14
    Width = 465
    Height = 65
    Caption = #21305#37197#36873#39033
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object cbxcmpZQ: TCheckBox
      Left = 280
      Top = 32
      Width = 57
      Height = 17
      TabStop = False
      Caption = #21608#26399
      Checked = True
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #40657#20307
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 0
    end
    object cbxcmpBB: TCheckBox
      Left = 192
      Top = 32
      Width = 65
      Height = 17
      TabStop = False
      Caption = #29256#26412
      Checked = True
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #40657#20307
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 1
    end
    object cbxcmpSL: TCheckBox
      Left = 120
      Top = 32
      Width = 73
      Height = 17
      TabStop = False
      Caption = #25968#37327
      Checked = True
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #40657#20307
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 2
    end
    object cbxcmpKHDDH: TCheckBox
      Left = 8
      Top = 32
      Width = 97
      Height = 17
      TabStop = False
      Caption = #23458#25143#35746#21333#21495
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #40657#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object cbxcmpKHXH: TCheckBox
      Left = 360
      Top = 31
      Width = 97
      Height = 17
      TabStop = False
      Caption = #23458#25143#22411#21495
      Checked = True
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #40657#20307
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 4
    end
  end
  object eh1: TDBGridEh
    Left = 16
    Top = 161
    Width = 241
    Height = 145
    DataSource = dsour
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'CMpName'
        Footers = <>
        Title.Caption = #23545#27604#39033#30446
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'CmpValue'
        Footers = <>
        Title.Caption = #20540
        Width = 150
      end>
  end
  object eh2: TDBGridEh
    Left = 296
    Top = 161
    Width = 265
    Height = 145
    DataSource = dsHW
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'CMpName'
        Footers = <>
        Title.Caption = #23545#27604#39033#30446
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'CmpValue'
        Footers = <>
        Title.Caption = #20540
        Width = 150
      end>
  end
  object btnClear: TButton
    Left = 16
    Top = 313
    Width = 105
    Height = 25
    Caption = #28165#38500
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    TabStop = False
    OnClick = btnClearClick
  end
  object btn2: TButton
    Left = 144
    Top = 313
    Width = 105
    Height = 25
    Caption = #26597#30475#35760#24405
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    TabStop = False
    OnClick = btn2Click
  end
  object cbbOurIDRegion: TComboBox
    Left = 200
    Top = 86
    Width = 57
    Height = 21
    Style = csDropDownList
    ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 7
    Text = #19996#33694
    OnChange = cbbOurIDRegionChange
    Items.Strings = (
      #19996#33694
      #28145#22323
      #24535#28009)
  end
  object cbbHWIDRegion: TComboBox
    Left = 504
    Top = 86
    Width = 57
    Height = 21
    Style = csDropDownList
    ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 8
    Text = #19996#33694
    OnChange = cbbHWIDRegionChange
    Items.Strings = (
      #19996#33694
      #28145#22323
      #24535#28009)
  end
  object btnReset: TButton
    Left = 470
    Top = 309
    Width = 75
    Height = 25
    Caption = #37325#26469
    TabOrder = 9
    OnClick = btnResetClick
  end
  object btn1: TButton
    Left = 400
    Top = 363
    Width = 153
    Height = 25
    Caption = #23548#20837#26032'ASN'#21040#25968#25454#24211
    TabOrder = 10
    OnClick = btn1Click
  end
  object cbbExcelVer: TComboBox
    Left = 288
    Top = 363
    Width = 97
    Height = 21
    Style = csDropDownList
    ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 11
    Text = 'Excel2003'
    Items.Strings = (
      'Excel2003'
      'Excel2007')
  end
  object vl1: TValueListEditor
    Left = 160
    Top = 448
    Width = 417
    Height = 172
    Strings.Strings = (
      'Barcode=PKG ID('#31665#21517')'
      'PONumber=PO'#21495
      'PCSpercarton=QTY('#32534#30721#25968#37327')'
      'Itemcode=PN('#29289#26009#32534#30721')'
      'ItemRevision=Rev('#32534#30721#29256#26412')'
      'MPN=MPN('#21378#21830#35268#26684')'
      'ItemDesc=itemDescCn('#21326#20026#23545#22806#20013#25991#25551#36848')'
      'code09=-1'
      'barcode09=09'#30721
      'vendorcode=MFG CODE('#21378#21830#20195#30721')'
      'companycode=-1'
      'inspectflag=-1'
      'restrictflag=-1'
      'ROHS=RoHS('#29615#20445#26631#35782')'
      'SuppCode=-1'
      'VendorLotNumber=M'#65294'Lot('#20379#24212#21830#21046#36896#25209#27425')'
      'CountryofOrigin='#21407#20135#22320#20449#24687
      'ProductionDate=DATE('#21046#36896#26085#26399')'
      'Remarks=Remark('#22791#27880#29305#27530#20449#24687')'
      'UOM='#21333#20301#65288'PCS/SET/M'#31561#65289
      'PoLineNum=-1'
      'ShipmentNum=-1'
      'ItemDescEn=itemDescEn('#21326#20026#23545#22806#33521#25991#25551#36848')'
      'lawinspectionflag=-1'
      'HW_M=Model('#21326#20026#23545#22806#22411#21495')'
      'SN_TN=-1')
    TabOrder = 12
    Visible = False
    ColWidths = (
      122
      272)
  end
  object seCmpNum: TSpinEdit
    Left = 489
    Top = 44
    Width = 74
    Height = 22
    MaxValue = 9999
    MinValue = 1
    TabOrder = 13
    Value = 1
  end
  object btnChuKu: TButton
    Left = 568
    Top = 40
    Width = 65
    Height = 25
    Caption = #20986#24211
    Enabled = False
    TabOrder = 14
    OnClick = btnChuKuClick
  end
  object btn3: TButton
    Left = 570
    Top = 77
    Width = 63
    Height = 25
    Caption = #30331#24405
    TabOrder = 15
    Visible = False
  end
  object cbx1: TCheckBox
    Left = 576
    Top = 152
    Width = 89
    Height = 17
    Caption = #21305#37197#36135#21333
    Checked = True
    State = cbChecked
    TabOrder = 16
    OnClick = cbx1Click
  end
  object edtShipNo: TEdit
    Left = 576
    Top = 176
    Width = 89
    Height = 21
    Enabled = False
    ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
    TabOrder = 17
    OnKeyPress = edtShipNoKeyPress
  end
  object cdsOur: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 144
    Top = 177
    object strngfldcds1HWPO: TStringField
      FieldName = 'CMpName'
      Size = 30
    end
    object strngfldcds1CmpValue: TStringField
      FieldName = 'CmpValue'
      Size = 30
    end
  end
  object cdsHW: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 424
    Top = 185
    object strngfld1: TStringField
      FieldName = 'CMpName'
      Size = 30
    end
    object strngfld2: TStringField
      FieldName = 'CmpValue'
      Size = 30
    end
  end
  object dsour: TDataSource
    DataSet = cdsOur
    Left = 208
    Top = 177
  end
  object dsHW: TDataSource
    DataSet = cdsHW
    Left = 480
    Top = 185
  end
  object conOurIDReg: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 96
    Top = 177
  end
  object conHWIDRegion: TADOConnection
    LoginPrompt = False
    Left = 384
    Top = 185
  end
  object conExcel: TADOConnection
    KeepConnection = False
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.ACE.OLEDB.12.0'
    Left = 200
    Top = 355
  end
  object adsExcel: TADODataSet
    Connection = conExcel
    CursorType = ctStatic
    Parameters = <>
    Left = 248
    Top = 355
  end
  object ads736: TADODataSet
    Connection = dm1.con1
    CursorType = ctStatic
    CommandText = 'select * from data0736 where 1=0'
    Parameters = <>
    Left = 304
    Top = 355
  end
  object dlgOpen1: TOpenDialog
    Left = 344
    Top = 355
  end
end
