inherited FrmShip_Mod353: TFrmShip_Mod353
  Caption = #35013#36816#21040#20379#24212#21830
  ClientHeight = 368
  ClientWidth = 506
  Font.Height = -13
  Font.Name = #23435#20307
  OnClose = FormClose
  ExplicitWidth = 514
  ExplicitHeight = 402
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl1: TPanel
    Width = 506
    ExplicitWidth = 506
    inherited btnSave: TBitBtn
      OnClick = btnSaveClick
    end
    inherited btnClose: TBitBtn
      OnClick = btnCloseClick
    end
  end
  inherited pnl2: TPanel
    Width = 506
    Height = 338
    ExplicitWidth = 506
    ExplicitHeight = 338
    object Label8: TLabel
      Left = 83
      Top = 236
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = ' '#36864#36135#22791#27880':'
    end
    object Label6: TLabel
      Left = 83
      Top = 203
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = ' '#35013#36816#26041#27861':'
    end
    object Label7: TLabel
      Left = 102
      Top = 177
      Width = 47
      Height = 13
      Alignment = taRightJustify
      Caption = '  '#21333#20301':'
    end
    object Label5: TLabel
      Left = 83
      Top = 151
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = ' '#36864#36135#25968#37327':'
    end
    object Label4: TLabel
      Left = 96
      Top = 122
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = ' '#20379#24212#21830':'
    end
    object Label3: TLabel
      Left = 76
      Top = 92
      Width = 73
      Height = 13
      Alignment = taRightJustify
      Caption = '  '#29289#21697#31867#21035':'
    end
    object Label2: TLabel
      Left = 83
      Top = 63
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = ' '#29289#21697#35268#26684':'
    end
    object Label1: TLabel
      Left = 83
      Top = 34
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = ' '#29289#21697#21517#31216':'
    end
    object DBText1: TDBText
      Left = 296
      Top = 122
      Width = 65
      Height = 17
      DataField = 'ABBR_NAME'
      DataSource = ds23
    end
    object RKeyRzBtnEdit1: TRKeyRzBtnEdit
      Left = 155
      Top = 31
      Width = 121
      Height = 21
      Text = ''
      Color = clBtnFace
      Ctl3D = True
      Enabled = False
      ParentCtl3D = False
      TabOrder = 0
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DataSource = ds235
      DataSourceField = 'goods_name'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object RKeyRzBtnEdit2: TRKeyRzBtnEdit
      Left = 155
      Top = 60
      Width = 121
      Height = 21
      Text = ''
      Color = clBtnFace
      Ctl3D = True
      Enabled = False
      ParentCtl3D = False
      TabOrder = 1
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DataSource = ds235
      DataSourceField = 'goods_guige'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object RKeyRzBtnEdit3: TRKeyRzBtnEdit
      Left = 155
      Top = 89
      Width = 121
      Height = 21
      Text = ''
      Color = clBtnFace
      Ctl3D = True
      Enabled = False
      ParentCtl3D = False
      TabOrder = 2
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DataSource = ds235
      DataSourceField = 'goods_type'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object RKeyRzBtnEdit4: TRKeyRzBtnEdit
      Left = 155
      Top = 119
      Width = 121
      Height = 21
      Text = ''
      Color = clBtnFace
      Ctl3D = True
      Enabled = False
      ParentCtl3D = False
      TabOrder = 3
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DataSource = ds23
      DataSourceField = 'code'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object RKeyRzBtnEdit5: TRKeyRzBtnEdit
      Left = 155
      Top = 148
      Width = 121
      Height = 21
      Text = ''
      Color = clBtnFace
      Enabled = False
      TabOrder = 4
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DataSource = ds209
      DataSourceField = 'QUANTITY'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object RKeyRzBtnEdit6: TRKeyRzBtnEdit
      Left = 155
      Top = 174
      Width = 121
      Height = 21
      Text = ''
      Color = clBtnFace
      Enabled = False
      TabOrder = 5
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DataSource = ds235
      DataSourceField = 'unit_ptr'
      DispalyTableName = 'data0002'
      DisplaytextField = 'UNIT_NAME'
      DisplayRetKeyField = 'rkey'
      DisplayModID = 50
      ForceOnFocus = True
    end
    object RzButtonEdit1: TRzButtonEdit
      Left = 155
      Top = 201
      Width = 121
      Height = 21
      Text = ''
      TabOrder = 6
      OnKeyPress = RzButtonEdit1KeyPress
      ButtonKind = bkFind
      AltBtnWidth = 15
      ButtonWidth = 15
      OnButtonClick = RzButtonEdit1ButtonClick
    end
    object DBMemo1: TDBMemo
      Left = 155
      Top = 236
      Width = 134
      Height = 72
      DataField = 'remark'
      DataSource = ds209
      TabOrder = 7
    end
  end
  object cds209: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 16
    Top = 128
  end
  object cds235: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 16
    Top = 184
  end
  object cds72: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 16
    Top = 240
  end
  object ds209: TDataSource
    DataSet = cds209
    Left = 72
    Top = 128
  end
  object ds235: TDataSource
    DataSet = cds235
    Left = 72
    Top = 184
  end
  object ds72: TDataSource
    DataSet = cds72
    Left = 72
    Top = 240
  end
  object cds210: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 16
    Top = 288
  end
  object ds210: TDataSource
    DataSet = cds210
    Left = 72
    Top = 288
  end
  object ds23: TDataSource
    DataSet = cds23
    Left = 416
    Top = 160
  end
  object cds23: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 360
    Top = 160
  end
end
