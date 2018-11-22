inherited frmSel235Material_Mod38: TfrmSel235Material_Mod38
  Caption = 'frmSel235Material_Mod38'
  ClientHeight = 537
  ClientWidth = 622
  OnCreate = FormCreate
  ExplicitWidth = 638
  ExplicitHeight = 576
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl1: TPanel
    Width = 622
    ExplicitWidth = 622
    object lbl1: TLabel [0]
      Left = 26
      Top = 14
      Width = 28
      Height = 13
      Caption = #24037#21378':'
    end
    inherited edtFilter: TLabeledEdit
      Left = 320
      EditLabel.ExplicitLeft = 277
      EditLabel.ExplicitTop = 15
      ExplicitLeft = 320
    end
    object cbbWH: TComboBox
      Left = 60
      Top = 14
      Width = 129
      Height = 21
      Style = csDropDownList
      TabOrder = 1
      OnChange = cbbWHChange
    end
  end
  inherited pnl2: TPanel
    Top = 496
    Width = 622
    ExplicitTop = 496
    ExplicitWidth = 622
    inherited btnOK: TButton
      Top = 6
      ExplicitTop = 6
    end
    inherited btnCancelPick: TButton
      Left = 269
      ExplicitLeft = 269
    end
  end
  inherited pnl3: TPanel
    Width = 622
    Height = 455
    ExplicitWidth = 622
    ExplicitHeight = 455
    inherited eh1: TDBGridEh
      Width = 620
      Height = 453
    end
  end
  inherited cdsPick: TClientDataSet
    ReadOnly = False
    Left = 384
    Top = 216
  end
  inherited dsPick: TDataSource
    Left = 440
    Top = 216
  end
  object cdstemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 304
    Top = 96
  end
end
