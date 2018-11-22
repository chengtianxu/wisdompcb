inherited frmSelUser_mod67: TfrmSelUser_mod67
  Caption = 'frmSelUser_mod67'
  ClientHeight = 513
  ClientWidth = 585
  ExplicitWidth = 601
  ExplicitHeight = 552
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl1: TPanel
    Width = 585
  end
  inherited pnl2: TPanel
    Top = 472
    Width = 585
    ExplicitTop = 359
    inherited btnOK: TButton
      Top = 6
      ExplicitTop = 6
    end
  end
  inherited pnl3: TPanel
    Width = 585
    Height = 431
    ExplicitHeight = 318
    inherited eh1: TDBGridEh
      Width = 583
      Height = 429
      ReadOnly = False
    end
  end
  inherited cdsPick: TClientDataSet
    ReadOnly = False
    Left = 320
    Top = 112
  end
  inherited dsPick: TDataSource
    Left = 376
    Top = 112
  end
end
