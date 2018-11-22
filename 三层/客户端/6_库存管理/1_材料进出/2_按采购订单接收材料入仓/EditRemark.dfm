inherited frmEditRemark: TfrmEditRemark
  Caption = #20462#25913#22791#27880
  ClientHeight = 283
  ClientWidth = 440
  ExplicitWidth = 448
  ExplicitHeight = 310
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 440
    Height = 283
    ExplicitWidth = 649
    ExplicitHeight = 254
    inherited pnl1: TPanel
      Width = 438
      ExplicitWidth = 647
      inherited btnSave: TBitBtn
        OnClick = btnSaveClick
      end
      inherited btnClose: TBitBtn
        OnClick = btnCloseClick
      end
    end
    inherited pnl2: TPanel
      Width = 438
      Height = 248
      ExplicitWidth = 647
      ExplicitHeight = 219
      object Label1: TLabel
        Left = 32
        Top = 19
        Width = 64
        Height = 32
        Caption = #21407#20379#24212#21830#13#10#29983#20135#25209#21495
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 30
        Top = 65
        Width = 64
        Height = 16
        Caption = #29615#20445#26631#35782
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 30
        Top = 96
        Width = 64
        Height = 16
        Caption = #35814#32454#20301#32622
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 60
        Top = 192
        Width = 32
        Height = 16
        Caption = #22791#27880
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 30
        Top = 129
        Width = 64
        Height = 16
        Caption = #25253#20851#21333#21495
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 12
        Top = 160
        Width = 80
        Height = 16
        Caption = #21333#20301#37325#37327'KG'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Edit1: TEdit
        Left = 100
        Top = 28
        Width = 199
        Height = 21
        TabOrder = 0
      end
      object Edit2: TEdit
        Left = 100
        Top = 62
        Width = 199
        Height = 21
        TabOrder = 1
      end
      object Edit3: TEdit
        Left = 100
        Top = 93
        Width = 199
        Height = 21
        TabOrder = 2
      end
      object Edit4: TEdit
        Left = 100
        Top = 125
        Width = 199
        Height = 21
        TabOrder = 3
      end
      object Edit5: TEdit
        Left = 99
        Top = 156
        Width = 199
        Height = 21
        TabOrder = 4
      end
      object Edit6: TEdit
        Left = 97
        Top = 192
        Width = 304
        Height = 21
        MaxLength = 50
        TabOrder = 5
      end
    end
  end
end
