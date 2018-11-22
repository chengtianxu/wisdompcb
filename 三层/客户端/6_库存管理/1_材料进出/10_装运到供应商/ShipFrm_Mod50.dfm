inherited FrmShip_Mod50: TFrmShip_Mod50
  Caption = #35013#36816#21040#20379#24212#21830
  ClientHeight = 378
  ClientWidth = 453
  OnClose = FormClose
  ExplicitWidth = 461
  ExplicitHeight = 412
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl1: TPanel
    Width = 453
    ExplicitWidth = 453
    inherited btnSave: TBitBtn
      OnClick = btnSaveClick
    end
    inherited btnClose: TBitBtn
      OnClick = btnCloseClick
    end
  end
  inherited pnl2: TPanel
    Width = 453
    Height = 348
    ExplicitWidth = 453
    ExplicitHeight = 348
    object Label1: TLabel
      Left = 84
      Top = 21
      Width = 67
      Height = 13
      Alignment = taRightJustify
      Caption = ' '#21407#26448#26009#20195#30721':'
    end
    object Label2: TLabel
      Left = 123
      Top = 48
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = #25551#36848':'
    end
    object Label3: TLabel
      Left = 99
      Top = 75
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #24037#21378#20195#30721':'
    end
    object Label9: TLabel
      Left = 99
      Top = 103
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #24037#21378#21517#31216':'
    end
    object Label4: TLabel
      Left = 84
      Top = 131
      Width = 67
      Height = 13
      Alignment = taRightJustify
      Caption = ' '#20379#24212#21830#20195#30721':'
    end
    object Label10: TLabel
      Left = 84
      Top = 159
      Width = 67
      Height = 13
      Alignment = taRightJustify
      Caption = ' '#20379#24212#21830#21517#31216':'
    end
    object Label5: TLabel
      Left = 99
      Top = 186
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #36864#36135#25968#37327':'
    end
    object Label11: TLabel
      Left = 99
      Top = 213
      Width = 52
      Height = 13
      Caption = #36864#36135#21407#22240':'
    end
    object Label6: TLabel
      Left = 96
      Top = 239
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = ' '#35013#36816#26041#27861':'
    end
    object Label7: TLabel
      Left = 123
      Top = 268
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = #22791#27880':'
    end
    object RKeyRzBtnEdit1: TRKeyRzBtnEdit
      Left = 157
      Top = 18
      Width = 200
      Height = 21
      Text = ''
      Color = clBtnFace
      Enabled = False
      TabOrder = 0
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DataSource = ds22
      DataSourceField = 'INVENTORY_PTR'
      DispalyTableName = 'data0017'
      DisplaytextField = 'INV_PART_NUMBER'
      DisplayRetKeyField = 'rkey'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object RKeyRzBtnEdit2: TRKeyRzBtnEdit
      Left = 157
      Top = 45
      Width = 200
      Height = 21
      Text = ''
      Color = clBtnFace
      Enabled = False
      TabOrder = 1
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DataSource = ds22
      DataSourceField = 'INVENTORY_PTR'
      DispalyTableName = 'data0017'
      DisplaytextField = 'INV_PART_DESCRIPTION'
      DisplayRetKeyField = 'rkey'
      DisplayModID = 50
      ForceOnFocus = True
    end
    object RKeyRzBtnEdit3: TRKeyRzBtnEdit
      Left = 157
      Top = 72
      Width = 200
      Height = 21
      Text = ''
      Color = clBtnFace
      Enabled = False
      TabOrder = 2
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DataSource = ds15
      DataSourceField = 'WAREHOUSE_CODE'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object RKeyRzBtnEdit4: TRKeyRzBtnEdit
      Left = 157
      Top = 100
      Width = 200
      Height = 21
      Text = ''
      Color = clBtnFace
      Enabled = False
      TabOrder = 3
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DataSource = ds15
      DataSourceField = 'warehouse_name'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object RKeyRzBtnEdit5: TRKeyRzBtnEdit
      Left = 157
      Top = 128
      Width = 200
      Height = 21
      Text = ''
      Color = clBtnFace
      Ctl3D = True
      Enabled = False
      ParentCtl3D = False
      TabOrder = 4
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DataSource = ds23
      DataSourceField = 'code'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object RKeyRzBtnEdit6: TRKeyRzBtnEdit
      Left = 157
      Top = 156
      Width = 200
      Height = 21
      Text = ''
      Color = clBtnFace
      Ctl3D = True
      Enabled = False
      ParentCtl3D = False
      TabOrder = 5
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DataSource = ds23
      DataSourceField = 'ABBR_NAME'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object RKeyRzBtnEdit7: TRKeyRzBtnEdit
      Left = 157
      Top = 183
      Width = 200
      Height = 21
      Text = ''
      Color = clBtnFace
      Ctl3D = True
      Enabled = False
      ParentCtl3D = False
      TabOrder = 6
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DataSource = ds96
      DataSourceField = 'QUAN_REJD'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object RKeyRzBtnEdit8: TRKeyRzBtnEdit
      Left = 157
      Top = 210
      Width = 200
      Height = 21
      Text = ''
      Color = clBtnFace
      Ctl3D = True
      Enabled = False
      ParentCtl3D = False
      TabOrder = 7
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DataSource = ds96
      DataSourceField = 'REJ_PTR'
      DispalyTableName = 'data0076'
      DisplaytextField = 'reject_description'
      DisplayRetKeyField = 'rkey'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object RzButtonEdit1: TRzButtonEdit
      Left = 157
      Top = 237
      Width = 200
      Height = 21
      Text = ''
      TabOrder = 8
      OnKeyPress = RzButtonEdit1KeyPress
      ButtonKind = bkFind
      AltBtnWidth = 15
      ButtonWidth = 15
      OnButtonClick = RzButtonEdit1ButtonClick
    end
    object DBMemo1: TDBMemo
      Left = 157
      Top = 265
      Width = 200
      Height = 72
      DataField = 'REFERENCE_NUMBER'
      DataSource = ds96
      TabOrder = 9
    end
  end
  object cds96: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 16
    Top = 128
  end
  object ds96: TDataSource
    DataSet = cds96
    Left = 72
    Top = 128
  end
  object cds22: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 16
    Top = 184
  end
  object ds22: TDataSource
    DataSet = cds22
    Left = 72
    Top = 184
  end
  object cds71: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 16
    Top = 225
  end
  object ds71: TDataSource
    DataSet = cds71
    Left = 72
    Top = 225
  end
  object cds210: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 273
  end
  object ds210: TDataSource
    DataSet = cds210
    Left = 80
    Top = 273
  end
  object cds23: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 360
    Top = 160
  end
  object ds23: TDataSource
    DataSet = cds23
    Left = 416
    Top = 160
  end
  object cds15: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 360
    Top = 232
  end
  object ds15: TDataSource
    DataSet = cds15
    Left = 416
    Top = 232
  end
end
