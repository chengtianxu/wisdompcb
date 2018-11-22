inherited FrmReturn_Mod02: TFrmReturn_Mod02
  Caption = 'FrmReturn_Mod02'
  ClientHeight = 308
  ClientWidth = 349
  OldCreateOrder = True
  Position = poDesktopCenter
  OnClose = FormClose
  ExplicitWidth = 365
  ExplicitHeight = 346
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 349
    Height = 308
    ExplicitWidth = 349
    ExplicitHeight = 308
    inherited pnl1: TPanel
      Width = 347
      ExplicitWidth = 347
      inherited btnSave: TBitBtn
        OnClick = btnSaveClick
      end
      inherited btnClose: TBitBtn
        OnClick = btnCloseClick
      end
    end
    inherited pnl2: TPanel
      Width = 347
      Height = 273
      ExplicitWidth = 347
      ExplicitHeight = 273
      object Label2: TLabel
        Left = 80
        Top = 31
        Width = 48
        Height = 13
        Caption = #21333#20301#20195#30721
      end
      object Label3: TLabel
        Left = 80
        Top = 72
        Width = 48
        Height = 13
        Caption = #21333#20301#21517#31216
      end
      object ded_code: TEdit
        Left = 144
        Top = 28
        Width = 153
        Height = 21
        TabOrder = 0
      end
      object ded_name: TEdit
        Left = 144
        Top = 69
        Width = 153
        Height = 21
        TabOrder = 1
      end
      object dcb_pro: TCheckBox
        Left = 80
        Top = 128
        Width = 97
        Height = 17
        Caption = #29983#20135#21333#20301
        TabOrder = 2
      end
      object dcb_pur: TCheckBox
        Left = 80
        Top = 179
        Width = 97
        Height = 17
        Caption = #37319#36141#21333#20301
        TabOrder = 3
      end
      object dcb_save: TCheckBox
        Left = 183
        Top = 128
        Width = 97
        Height = 17
        Caption = #23384#36135#21333#20301
        TabOrder = 4
      end
      object dcb_sell: TCheckBox
        Left = 183
        Top = 179
        Width = 97
        Height = 17
        Caption = #25253#20215#21333#20301
        TabOrder = 5
      end
    end
  end
  object cds_02: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 72
  end
end
