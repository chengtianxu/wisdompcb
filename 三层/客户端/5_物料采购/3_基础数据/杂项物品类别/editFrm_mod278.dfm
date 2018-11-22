inherited frmEdit_mod278: TfrmEdit_mod278
  Caption = #28155#21152
  ClientHeight = 175
  ClientWidth = 373
  ExplicitWidth = 389
  ExplicitHeight = 214
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 373
    Height = 175
    ExplicitWidth = 373
    ExplicitHeight = 175
    inherited pnl1: TPanel
      Width = 371
      ExplicitWidth = 371
      inherited btnSave: TBitBtn
        OnClick = btnSaveClick
      end
      inherited btnClose: TBitBtn
        OnClick = btnCloseClick
      end
    end
    inherited pnl2: TPanel
      Width = 371
      Height = 140
      ExplicitWidth = 371
      ExplicitHeight = 140
      object lbl4: TLabel
        Left = 71
        Top = 53
        Width = 48
        Height = 13
        Caption = #31867#21035#21517#31216
      end
      object edt_TName: TRKeyRzBtnEdit
        Left = 125
        Top = 50
        Width = 146
        Height = 21
        Text = ''
        TabOrder = 0
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds75
        DataSourceField = 'Description'
        DisplayModID = 0
        ForceOnFocus = True
      end
    end
  end
  object ds75: TDataSource
    DataSet = cds75
    Left = 280
    Top = 40
  end
  object cds75: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from data0362'
    Params = <>
    Left = 321
    Top = 40
  end
end
