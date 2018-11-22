object frmView: TfrmView
  Left = 374
  Top = 167
  Width = 798
  Height = 651
  Caption = #26597#30475
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = #24494#36719#38597#40657
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 21
  object lbl1: TLabel
    Left = 34
    Top = 62
    Width = 80
    Height = 21
    Caption = #23458#25143#21517#31216#65306
  end
  object lbl3: TLabel
    Left = 403
    Top = 140
    Width = 80
    Height = 21
    Caption = #23457#26680#26102#38388#65306
  end
  object lbl4: TLabel
    Left = 403
    Top = 103
    Width = 64
    Height = 21
    Caption = #23457#26680#20154#65306
  end
  object lbl5: TLabel
    Left = 403
    Top = 28
    Width = 96
    Height = 21
    Caption = #20986#24211#25805#20316#20154#65306
  end
  object lbl6: TLabel
    Left = 403
    Top = 65
    Width = 80
    Height = 21
    Caption = #20986#24211#26102#38388#65306
  end
  object lbl7: TLabel
    Left = 403
    Top = 404
    Width = 80
    Height = 21
    Caption = #23454#38469#36153#29992#65306
  end
  object lbl8: TLabel
    Left = 403
    Top = 366
    Width = 48
    Height = 21
    Caption = #31665#25968#65306
  end
  object lbl9: TLabel
    Left = 34
    Top = 410
    Width = 84
    Height = 21
    Caption = #23454#38469#37325'(KG):'
  end
  object lbl10: TLabel
    Left = 34
    Top = 372
    Width = 80
    Height = 21
    Caption = #37038#23492#29289#21697#65306
  end
  object lbl11: TLabel
    Left = 34
    Top = 24
    Width = 80
    Height = 21
    Caption = #24555#36882#21333#21495#65306
  end
  object lbl12: TLabel
    Left = 34
    Top = 101
    Width = 80
    Height = 21
    Caption = #24555#36882#20844#21496#65306
  end
  object lbl13: TLabel
    Left = 34
    Top = 140
    Width = 64
    Height = 21
    Caption = #30003#35831#20154#65306
  end
  object lbl14: TLabel
    Left = 34
    Top = 178
    Width = 80
    Height = 21
    Caption = #30003#35831#37096#38376#65306
  end
  object lbl15: TLabel
    Left = 34
    Top = 217
    Width = 80
    Height = 21
    Caption = #21019#24314#26102#38388#65306
  end
  object lbl16: TLabel
    Left = 34
    Top = 256
    Width = 64
    Height = 21
    Caption = #25910#36135#20154#65306
  end
  object lbl17: TLabel
    Left = 34
    Top = 294
    Width = 80
    Height = 21
    Caption = #25910#36135#22320#22336#65306
  end
  object lbl18: TLabel
    Left = 34
    Top = 333
    Width = 80
    Height = 21
    Caption = #25910#36135#30005#35805#65306
  end
  object lbl20: TLabel
    Left = 403
    Top = 328
    Width = 80
    Height = 21
    Caption = #37038#23492#22791#27880#65306
  end
  object lbl23: TLabel
    Left = 403
    Top = 291
    Width = 112
    Height = 21
    Caption = #23454#20307#23384#21333#26102#38388#65306
  end
  object lbl24: TLabel
    Left = 403
    Top = 253
    Width = 96
    Height = 21
    Caption = #23454#20307#23384#21333#20154#65306
  end
  object lbl25: TLabel
    Left = 403
    Top = 216
    Width = 112
    Height = 21
    Caption = #24635#32463#29702#23457#26102#38388#65306
  end
  object lbl26: TLabel
    Left = 403
    Top = 178
    Width = 80
    Height = 21
    Caption = #24635#32463#29702#23457#65306
  end
  object lbl2: TLabel
    Left = 34
    Top = 446
    Width = 36
    Height = 21
    Caption = #22791#27880':'
  end
  object edtBillNO: TDBEdit
    Left = 130
    Top = 24
    Width = 233
    Height = 29
    DataField = 'BillNO'
    DataSource = frmMain.ds817
    ReadOnly = True
    TabOrder = 0
  end
  object edtCustName: TDBEdit
    Left = 130
    Top = 62
    Width = 233
    Height = 29
    DataField = 'CustName'
    DataSource = frmMain.ds817
    ReadOnly = True
    TabOrder = 1
  end
  object edtTrantNote: TDBEdit
    Left = 130
    Top = 100
    Width = 233
    Height = 29
    DataField = 'TranName'
    DataSource = frmMain.ds817
    ReadOnly = True
    TabOrder = 2
  end
  object edtcusername: TDBEdit
    Left = 130
    Top = 138
    Width = 233
    Height = 29
    DataField = 'cusername'
    DataSource = frmMain.ds817
    ReadOnly = True
    TabOrder = 3
  end
  object edtDEPT_NAME: TDBEdit
    Left = 130
    Top = 176
    Width = 233
    Height = 29
    DataField = 'DEPT_NAME'
    DataSource = frmMain.ds817
    ReadOnly = True
    TabOrder = 4
  end
  object edtCTime: TDBEdit
    Left = 130
    Top = 214
    Width = 233
    Height = 29
    DataField = 'CTime'
    DataSource = frmMain.ds817
    ReadOnly = True
    TabOrder = 5
  end
  object edtToUser: TDBEdit
    Left = 130
    Top = 252
    Width = 233
    Height = 29
    DataField = 'ToUser'
    DataSource = frmMain.ds817
    ReadOnly = True
    TabOrder = 6
  end
  object edtToAddress: TDBEdit
    Left = 130
    Top = 290
    Width = 233
    Height = 29
    DataField = 'ToAddress'
    DataSource = frmMain.ds817
    ReadOnly = True
    TabOrder = 7
  end
  object edtToPhone: TDBEdit
    Left = 130
    Top = 328
    Width = 233
    Height = 29
    DataField = 'ToPhone'
    DataSource = frmMain.ds817
    ReadOnly = True
    TabOrder = 8
  end
  object edtItems: TDBEdit
    Left = 130
    Top = 366
    Width = 233
    Height = 29
    DataField = 'Items'
    DataSource = frmMain.ds817
    ReadOnly = True
    TabOrder = 9
  end
  object edtRealWeight: TDBEdit
    Left = 130
    Top = 404
    Width = 233
    Height = 29
    DataField = 'RealWeight'
    DataSource = frmMain.ds817
    ReadOnly = True
    TabOrder = 10
  end
  object edtPackCount: TDBEdit
    Left = 522
    Top = 362
    Width = 233
    Height = 29
    DataField = 'PackCount'
    DataSource = frmMain.ds817
    ReadOnly = True
    TabOrder = 11
  end
  object edtStockPassName: TDBEdit
    Left = 522
    Top = 24
    Width = 233
    Height = 29
    DataField = 'StockPassName'
    DataSource = frmMain.ds817
    ReadOnly = True
    TabOrder = 12
  end
  object edtStockPassTime: TDBEdit
    Left = 522
    Top = 61
    Width = 233
    Height = 29
    DataField = 'StockPassTime'
    DataSource = frmMain.ds817
    ReadOnly = True
    TabOrder = 13
  end
  object dbedtfstPassName: TDBEdit
    Left = 522
    Top = 99
    Width = 233
    Height = 29
    DataField = 'fstPassName'
    DataSource = frmMain.ds817
    ReadOnly = True
    TabOrder = 14
  end
  object dbedtFstPassTime: TDBEdit
    Left = 522
    Top = 136
    Width = 233
    Height = 29
    DataField = 'FstPassTime'
    DataSource = frmMain.ds817
    ReadOnly = True
    TabOrder = 15
  end
  object dbedtSecPassName: TDBEdit
    Left = 522
    Top = 174
    Width = 233
    Height = 29
    DataField = 'SecPassName'
    DataSource = frmMain.ds817
    ReadOnly = True
    TabOrder = 16
  end
  object dbedtSecPassTime: TDBEdit
    Left = 522
    Top = 212
    Width = 233
    Height = 29
    DataField = 'SecPassTime'
    DataSource = frmMain.ds817
    ReadOnly = True
    TabOrder = 17
  end
  object edtBillSaveName: TDBEdit
    Left = 522
    Top = 249
    Width = 233
    Height = 29
    DataField = 'BillSaveName'
    DataSource = frmMain.ds817
    ReadOnly = True
    TabOrder = 18
  end
  object edtBillSaveTime: TDBEdit
    Left = 522
    Top = 287
    Width = 233
    Height = 29
    DataField = 'BillSaveTime'
    DataSource = frmMain.ds817
    ReadOnly = True
    TabOrder = 19
  end
  object edtTrantNote1: TDBEdit
    Left = 522
    Top = 324
    Width = 233
    Height = 29
    DataField = 'TrantNote'
    DataSource = frmMain.ds817
    ReadOnly = True
    TabOrder = 20
  end
  object edtRealMoney: TDBEdit
    Left = 522
    Top = 400
    Width = 233
    Height = 29
    DataField = 'RealMoney'
    DataSource = frmMain.ds817
    ReadOnly = True
    TabOrder = 21
  end
  object btn1: TButton
    Left = 346
    Top = 563
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 22
    OnClick = btn1Click
  end
  object grp1: TGroupBox
    Left = 32
    Top = 488
    Width = 729
    Height = 57
    Caption = #23457#25209#24847#35265
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = #24494#36719#38597#40657
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 23
    Visible = False
    object rbOK: TRadioButton
      Left = 208
      Top = 24
      Width = 73
      Height = 17
      Caption = #21516#24847
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TabStop = True
    end
    object rbNO: TRadioButton
      Left = 438
      Top = 24
      Width = 73
      Height = 17
      Caption = #19981#21516#24847
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
  object dbmmoTrantNote: TDBMemo
    Left = 128
    Top = 440
    Width = 625
    Height = 41
    DataField = 'TrantNote'
    DataSource = frmMain.ds817
    TabOrder = 24
  end
end
