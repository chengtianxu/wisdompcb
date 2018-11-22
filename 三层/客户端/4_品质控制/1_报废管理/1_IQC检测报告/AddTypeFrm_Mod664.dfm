inherited frmAddType_Mod664: TfrmAddType_Mod664
  Left = 480
  Top = 352
  Caption = #32465#23450#39033#30446
  ClientHeight = 190
  ClientWidth = 315
  OnDestroy = FormDestroy
  ExplicitLeft = 480
  ExplicitTop = 352
  ExplicitWidth = 331
  ExplicitHeight = 228
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 315
    Height = 190
    ExplicitWidth = 315
    ExplicitHeight = 190
    inherited pnl1: TPanel
      Width = 313
      ExplicitWidth = 313
      inherited btnSave: TBitBtn
        OnClick = btnSaveClick
      end
      inherited btnClose: TBitBtn
        ModalResult = 2
      end
    end
    inherited pnl2: TPanel
      Width = 313
      Height = 155
      ExplicitLeft = 2
      ExplicitTop = 39
      ExplicitWidth = 313
      ExplicitHeight = 155
      object Label1: TLabel
        Left = 30
        Top = 48
        Width = 48
        Height = 13
        Caption = #26448#26009#31867#22411
      end
      object Label2: TLabel
        Left = 53
        Top = 94
        Width = 24
        Height = 13
        Caption = #25253#34920
      end
      object edtType: TEdit
        Left = 92
        Top = 45
        Width = 139
        Height = 21
        TabOrder = 0
        OnExit = edtTypeExit
      end
      object btnType: TBitBtn
        Left = 232
        Top = 41
        Width = 33
        Height = 30
        Glyph.Data = {
          EE000000424DEE000000000000007600000028000000100000000F0000000100
          04000000000078000000130B0000130B00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888800000888880000080F000888880F00080F000888880F0008000000080000
          000800F000000F00000800F000800F00000800F000800F000008800000000000
          0088880F00080F000888880000080000088888800088800088888880F08880F0
          888888800088800088888888888888888888}
        TabOrder = 1
        OnClick = btnTypeClick
      end
      object cbbReport: TComboBox
        Left = 92
        Top = 91
        Width = 145
        Height = 21
        TabOrder = 2
      end
    end
  end
end
