object frmUpdatePrice: TfrmUpdatePrice
  Left = 417
  Top = 262
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20462#25913#21333#20215'/'#31246#29575
  ClientHeight = 293
  ClientWidth = 440
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
    Caption = #24037#31243#32534#30721
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 8
    Top = 50
    Width = 48
    Height = 12
    Caption = #20135#21697#21517#31216
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 8
    Top = 84
    Width = 48
    Height = 12
    Caption = #35746#21333#25968#37327
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 8
    Top = 119
    Width = 60
    Height = 12
    Caption = #21333#20215'('#21547#31246')'
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 8
    Top = 153
    Width = 42
    Height = 12
    Caption = #31246#29575'(%)'
    FocusControl = DBEdit5
  end
  object Label6: TLabel
    Left = 8
    Top = 188
    Width = 48
    Height = 12
    Caption = #23436#24037#26085#26399
    FocusControl = DBEdit6
  end
  object Label7: TLabel
    Left = 8
    Top = 222
    Width = 24
    Height = 12
    Caption = #22791#27880
    FocusControl = DBEdit7
  end
  object DBEdit1: TDBEdit
    Left = 72
    Top = 13
    Width = 134
    Height = 20
    Color = clScrollBar
    DataField = 'PROD_CODE'
    DataSource = DataSource1
    Enabled = False
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 72
    Top = 47
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
    Left = 72
    Top = 82
    Width = 124
    Height = 20
    Color = clScrollBar
    DataField = 'quantity'
    DataSource = DataSource1
    Enabled = False
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 72
    Top = 116
    Width = 136
    Height = 20
    DataField = 'price'
    DataSource = DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 3
  end
  object DBEdit5: TDBEdit
    Left = 72
    Top = 151
    Width = 64
    Height = 20
    DataField = 'tax_rate'
    DataSource = DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 4
  end
  object DBEdit6: TDBEdit
    Left = 72
    Top = 185
    Width = 220
    Height = 20
    Color = clScrollBar
    DataField = 'complete_date'
    DataSource = DataSource1
    Enabled = False
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 5
  end
  object DBEdit7: TDBEdit
    Left = 72
    Top = 220
    Width = 350
    Height = 20
    Color = clScrollBar
    DataField = 'remark'
    DataSource = DataSource1
    Enabled = False
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 6
  end
  object btnOK: TBitBtn
    Left = 104
    Top = 256
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 7
    OnClick = btnOKClick
    Kind = bkOK
  end
  object btnCancel: TBitBtn
    Left = 248
    Top = 256
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 8
    Kind = bkCancel
  end
  object DataSource1: TDataSource
    DataSet = DM.ADO71_2
    Left = 312
    Top = 96
  end
end
