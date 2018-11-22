object frmDSPickList: TfrmDSPickList
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #36873#25321
  ClientHeight = 495
  ClientWidth = 577
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inline dgF1: TdgF
    Left = 0
    Top = 0
    Width = 577
    Height = 454
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 577
    ExplicitHeight = 454
    inherited pnl1: TPanel
      Width = 577
      ExplicitLeft = -1
      ExplicitTop = -5
      ExplicitWidth = 577
      inherited bvl1: TBevel
        Width = 19
        ExplicitWidth = 19
      end
      inherited btnExit: TBitBtn
        OnClick = dgF1btnExitClick
      end
      inherited btnSelect: TBitBtn
        Visible = False
      end
      inherited edtFilter: TLabeledEdit
        Left = 400
        EditLabel.ExplicitLeft = 357
        EditLabel.ExplicitTop = 10
        OnKeyPress = dgF1edtFilterKeyPress
        ExplicitLeft = 400
      end
    end
    inherited pnl2: TPanel
      Width = 577
      Height = 402
      ExplicitWidth = 577
      ExplicitHeight = 402
      inherited dgF: TDBGridEh
        Width = 575
        Height = 400
        OnDblClick = dgF1dgFDblClick
      end
    end
    inherited stat1: TStatusBar
      Top = 435
      Width = 577
      ExplicitTop = 435
      ExplicitWidth = 577
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 454
    Width = 577
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnOK: TButton
      Left = 152
      Top = 6
      Width = 75
      Height = 25
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object btnCancel: TButton
      Left = 312
      Top = 6
      Width = 75
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
end
