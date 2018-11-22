inherited Remark_mod73: TRemark_mod73
  Caption = #30830#35748#35760#20107#26412
  ClientHeight = 289
  ClientWidth = 505
  ExplicitWidth = 521
  ExplicitHeight = 327
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 505
    Height = 289
    ExplicitWidth = 505
    ExplicitHeight = 289
    inherited pnl1: TPanel
      Width = 503
      ExplicitWidth = 503
      inherited btnSave: TBitBtn
        ModalResult = 1
        Visible = False
        OnClick = btnSaveClick
      end
      inherited btnClose: TBitBtn
        Visible = False
        OnClick = btnCloseClick
      end
    end
    inherited pnl2: TPanel
      Width = 503
      Height = 254
      ExplicitWidth = 503
      ExplicitHeight = 254
      object Memo1: TMemo
        Left = 1
        Top = 1
        Width = 501
        Height = 252
        Align = alClient
        Lines.Strings = (
          '')
        TabOrder = 0
      end
    end
  end
end
