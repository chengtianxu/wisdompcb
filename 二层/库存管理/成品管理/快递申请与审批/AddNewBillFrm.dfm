object frmAddNewBill: TfrmAddNewBill
  Left = 386
  Top = 204
  Width = 685
  Height = 527
  Caption = #26032#24314#24555#36882
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 328
    Top = 43
    Width = 60
    Height = 13
    Caption = #24555#36882#21333#21495#65306
  end
  object lbl2: TLabel
    Left = 56
    Top = 86
    Width = 60
    Height = 13
    Caption = #36816#36153#31867#22411#65306
  end
  object lbl3: TLabel
    Left = 328
    Top = 85
    Width = 65
    Height = 13
    Caption = #22659#22806'/'#22659#20869#65306
  end
  object lbl4: TLabel
    Left = 56
    Top = 44
    Width = 60
    Height = 13
    Caption = #24555#36882#20844#21496#65306
  end
  object lbl5: TLabel
    Left = 56
    Top = 146
    Width = 60
    Height = 13
    Caption = #37038#23492#29289#21697#65306
  end
  object lbl6: TLabel
    Left = 56
    Top = 185
    Width = 60
    Height = 13
    Caption = #39044#20272#37325#37327#65306
  end
  object lbl7: TLabel
    Left = 56
    Top = 224
    Width = 60
    Height = 13
    Caption = #39044#20272#37329#39069#65306
  end
  object lbl8: TLabel
    Left = 57
    Top = 314
    Width = 60
    Height = 13
    Caption = #22791#27880#35828#26126#65306
  end
  object lbl9: TLabel
    Left = 328
    Top = 146
    Width = 60
    Height = 13
    Caption = #23545#26041#20154#21517#65306
  end
  object lbl10: TLabel
    Left = 328
    Top = 185
    Width = 60
    Height = 13
    Caption = #32852#31995#30005#35805#65306
  end
  object lbl11: TLabel
    Left = 328
    Top = 224
    Width = 60
    Height = 13
    Caption = #23545#26041#22320#22336#65306
  end
  object btn3: TSpeedButton
    Left = 574
    Top = 141
    Width = 35
    Height = 22
    Caption = #21382#21490
    OnClick = btn3Click
  end
  object lbl12: TLabel
    Left = 328
    Top = 114
    Width = 60
    Height = 13
    Caption = #23458#25143#21517#31216#65306
  end
  object lbl13: TLabel
    Left = 78
    Top = 118
    Width = 36
    Height = 13
    Caption = #31665#25968#65306
  end
  object btn4: TSpeedButton
    Left = 577
    Top = 110
    Width = 23
    Height = 22
    Caption = '...'
    OnClick = btn4Click
  end
  object btn5: TSpeedButton
    Left = 578
    Top = 222
    Width = 23
    Height = 22
    Caption = '...'
    OnClick = btn5Click
  end
  object lbl14: TLabel
    Left = 72
    Top = 272
    Width = 36
    Height = 13
    Caption = #26102#25928#65306
  end
  object edtBillNO: TDBEdit
    Left = 392
    Top = 37
    Width = 200
    Height = 21
    DataField = 'BillNO'
    DataSource = frmMain.ds817
    TabOrder = 0
  end
  object dbrgrpOutDoor: TDBRadioGroup
    Left = 392
    Top = 71
    Width = 200
    Height = 34
    Columns = 2
    DataField = 'OutDoor'
    DataSource = frmMain.ds817
    Items.Strings = (
      #22659#20869
      #22659#22806)
    TabOrder = 1
    Values.Strings = (
      '0'
      '1')
  end
  object edtItems: TDBEdit
    Left = 120
    Top = 143
    Width = 200
    Height = 21
    DataField = 'Items'
    DataSource = frmMain.ds817
    TabOrder = 2
  end
  object edtTestWeight: TDBEdit
    Left = 120
    Top = 183
    Width = 200
    Height = 21
    DataField = 'TestWeight'
    DataSource = frmMain.ds817
    TabOrder = 3
  end
  object edtTestMoney: TDBEdit
    Left = 120
    Top = 223
    Width = 200
    Height = 21
    DataField = 'TestMoney'
    DataSource = frmMain.ds817
    TabOrder = 4
  end
  object btn1: TButton
    Left = 208
    Top = 432
    Width = 75
    Height = 25
    Caption = #20445#23384
    TabOrder = 5
    OnClick = btn1Click
  end
  object dbmmoTran: TDBMemo
    Left = 120
    Top = 313
    Width = 473
    Height = 89
    DataField = 'TrantNote'
    DataSource = frmMain.ds817
    TabOrder = 6
  end
  object dbrgrpPayType: TDBRadioGroup
    Left = 120
    Top = 70
    Width = 200
    Height = 34
    Columns = 2
    DataField = 'PayType'
    DataSource = frmMain.ds817
    Items.Strings = (
      #25105#21496#20184
      #23545#26041#20184)
    TabOrder = 7
    Values.Strings = (
      '0'
      '1')
  end
  object btn2: TButton
    Left = 368
    Top = 432
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 8
    OnClick = btn2Click
  end
  object edtItems1: TDBEdit
    Left = 392
    Top = 143
    Width = 177
    Height = 21
    DataField = 'ToUser'
    DataSource = frmMain.ds817
    TabOrder = 9
  end
  object edtTestWeight1: TDBEdit
    Left = 392
    Top = 183
    Width = 177
    Height = 21
    DataField = 'ToPhone'
    DataSource = frmMain.ds817
    TabOrder = 10
  end
  object edtTestMoney1: TDBEdit
    Left = 392
    Top = 223
    Width = 177
    Height = 21
    DataField = 'ToAddress'
    DataSource = frmMain.ds817
    TabOrder = 11
  end
  object edtToUser: TDBEdit
    Left = 392
    Top = 111
    Width = 177
    Height = 21
    DataField = 'CustName'
    DataSource = frmMain.ds817
    TabOrder = 12
  end
  object cbbtranname: TComboBox
    Left = 120
    Top = 40
    Width = 201
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 13
  end
  object dbedtItems: TDBEdit
    Left = 119
    Top = 113
    Width = 200
    Height = 21
    DataField = 'PackCount'
    DataSource = frmMain.ds817
    TabOrder = 14
  end
  object dbrgrpspeedtype: TDBRadioGroup
    Left = 120
    Top = 256
    Width = 329
    Height = 41
    Columns = 3
    DataField = 'speedtype'
    DataSource = frmMain.ds817
    Items.Strings = (
      #24403#26085#36798
      #27425#26085#36798
      #38548#26085#36798)
    TabOrder = 15
    Values.Strings = (
      '0'
      '1'
      '2')
  end
  object ads818: TADODataSet
    Connection = dm1.con1
    CommandText = 'select * from data0818'#13#10
    Parameters = <>
    Left = 344
    Top = 175
    object ads818TranCode: TStringField
      FieldName = 'TranCode'
      Size = 50
    end
    object ads818TranName: TStringField
      FieldName = 'TranName'
      Size = 250
    end
    object ads818TranEasyName: TStringField
      FieldName = 'TranEasyName'
      Size = 250
    end
  end
  object ds818: TDataSource
    DataSet = ads818
    Left = 384
    Top = 175
  end
end
