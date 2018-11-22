object frmUpdatePrice: TfrmUpdatePrice
  Left = 261
  Top = 175
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20462#25913#21333#20215'/'#31246#29575
  ClientHeight = 321
  ClientWidth = 487
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 48
    Height = 12
    Caption = #20135#21697#32534#30721
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 8
    Top = 49
    Width = 48
    Height = 12
    Caption = #20135#21697#21517#31216
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 8
    Top = 83
    Width = 48
    Height = 12
    Caption = #20135#21697#35268#26684
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 8
    Top = 116
    Width = 48
    Height = 12
    Caption = #35746#21333#25968#37327
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 8
    Top = 150
    Width = 60
    Height = 12
    Caption = #21333#20215'('#21547#31246')'
    FocusControl = DBEdit5
  end
  object Label6: TLabel
    Left = 8
    Top = 184
    Width = 30
    Height = 12
    Caption = #31246#29575'%'
    FocusControl = DBEdit6
  end
  object Label7: TLabel
    Left = 8
    Top = 217
    Width = 48
    Height = 12
    Caption = #23436#24037#26085#26399
    FocusControl = DBEdit7
  end
  object Label8: TLabel
    Left = 8
    Top = 251
    Width = 24
    Height = 12
    Caption = #22791#27880
    FocusControl = DBEdit8
  end
  object DBEdit1: TDBEdit
    Left = 73
    Top = 11
    Width = 244
    Height = 20
    Color = clScrollBar
    DataField = 'PROD_CODE'
    DataSource = DataSource1
    Enabled = False
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 73
    Top = 45
    Width = 300
    Height = 20
    Color = clScrollBar
    DataField = 'PRODUCT_NAME'
    DataSource = DataSource1
    Enabled = False
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 73
    Top = 79
    Width = 350
    Height = 20
    Color = clScrollBar
    DataField = 'PRODUCT_desc'
    DataSource = DataSource1
    Enabled = False
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 73
    Top = 112
    Width = 124
    Height = 20
    Color = clScrollBar
    DataField = 'quantity'
    DataSource = DataSource1
    Enabled = False
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 3
  end
  object DBEdit5: TDBEdit
    Left = 73
    Top = 146
    Width = 136
    Height = 20
    DataField = 'price'
    DataSource = DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 4
  end
  object DBEdit6: TDBEdit
    Left = 73
    Top = 179
    Width = 64
    Height = 20
    DataField = 'tax_rate'
    DataSource = DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 5
  end
  object DBEdit7: TDBEdit
    Left = 73
    Top = 213
    Width = 220
    Height = 20
    Color = clScrollBar
    DataField = 'complete_date'
    DataSource = DataSource1
    Enabled = False
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 6
  end
  object DBEdit8: TDBEdit
    Left = 73
    Top = 247
    Width = 400
    Height = 20
    Color = clScrollBar
    DataField = 'remark'
    DataSource = DataSource1
    Enabled = False
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 7
  end
  object btnOK: TBitBtn
    Left = 136
    Top = 286
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 8
    OnClick = btnOKClick
    Kind = bkOK
  end
  object btnCancel: TBitBtn
    Left = 280
    Top = 286
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 9
    Kind = bkCancel
  end
  object DataSource1: TDataSource
    DataSet = DM.ADO71_2
    Left = 328
    Top = 16
  end
end
