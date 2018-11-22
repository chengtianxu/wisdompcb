inherited frmEditRemark_Mod564: TfrmEditRemark_Mod564
  Caption = #20462#25913#22791#27880
  ClientHeight = 283
  ClientWidth = 488
  ExplicitWidth = 496
  ExplicitHeight = 310
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 488
    Height = 283
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 480
    ExplicitHeight = 254
    inherited pnl1: TPanel
      Width = 486
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 478
      inherited btnSave: TBitBtn
        OnClick = btnSaveClick
      end
      inherited btnClose: TBitBtn
        OnClick = btnCloseClick
      end
    end
    inherited pnl2: TPanel
      Width = 486
      Height = 248
      ExplicitLeft = 1
      ExplicitTop = 34
      ExplicitWidth = 478
      ExplicitHeight = 219
      object Label2: TLabel
        Left = 25
        Top = 17
        Width = 76
        Height = 19
        Caption = #29615#20445#26631#35782
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -19
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 15
        Top = 64
        Width = 96
        Height = 38
        Caption = '   '#22791#27880#13#10'('#35814#32454#20301#32622')'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -19
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 15
        Top = 144
        Width = 96
        Height = 38
        Caption = '   '#22791#27880#13#10'('#29305#21035#35201#27714')'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -19
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Edit1: TEdit
        Left = 109
        Top = 16
        Width = 312
        Height = 21
        TabOrder = 0
      end
      object Memo1: TMemo
        Left = 110
        Top = 47
        Width = 311
        Height = 74
        MaxLength = 30
        TabOrder = 1
      end
      object Memo2: TMemo
        Left = 110
        Top = 132
        Width = 311
        Height = 74
        MaxLength = 50
        TabOrder = 2
      end
    end
  end
end
