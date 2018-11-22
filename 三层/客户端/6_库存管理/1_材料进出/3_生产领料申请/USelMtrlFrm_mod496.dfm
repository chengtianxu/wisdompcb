inherited FrmSelMaterial_mod496: TFrmSelMaterial_mod496
  Caption = 'FrmSelMtrl_mod496'
  ClientHeight = 470
  ClientWidth = 658
  OnCreate = FormCreate
  ExplicitTop = 8
  ExplicitWidth = 674
  ExplicitHeight = 509
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl1: TPanel
    Width = 658
    ExplicitWidth = 658
    object lbl1: TLabel [0]
      Left = 26
      Top = 16
      Width = 24
      Height = 13
      Caption = #24037#21378
      Visible = False
    end
    inherited edtFilter: TLabeledEdit
      Left = 384
      EditLabel.ExplicitLeft = 341
      EditLabel.ExplicitTop = 18
      OnKeyDown = edtFilterKeyDown
      ExplicitLeft = 384
    end
    object cbbWH: TComboBox
      Left = 56
      Top = 14
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 1
      OnChange = cbbWHChange
    end
  end
  inherited pnl2: TPanel
    Top = 429
    Width = 658
    ExplicitTop = 429
    ExplicitWidth = 658
    inherited btnOK: TButton
      Left = 352
      ExplicitLeft = 352
    end
    inherited btnCancelPick: TButton
      Left = 128
      ExplicitLeft = 128
    end
  end
  inherited pnl3: TPanel
    Width = 658
    Height = 388
    ExplicitWidth = 658
    ExplicitHeight = 388
    inherited eh1: TDBGridEh
      Width = 656
      Height = 386
    end
  end
  inherited cdsPick: TClientDataSet
    ReadOnly = False
    Left = 416
    Top = 72
  end
  inherited dsPick: TDataSource
    Left = 472
    Top = 72
  end
  object cdstemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 288
    Top = 232
  end
end
