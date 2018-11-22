inherited Editfrm_Mod086: TEditfrm_Mod086
  Caption = #39069#22806#20215#26684#31867#21035
  ClientHeight = 266
  ClientWidth = 525
  OnClose = FormClose
  ExplicitWidth = 541
  ExplicitHeight = 304
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 525
    Height = 266
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 525
    ExplicitHeight = 266
    inherited pnl1: TPanel
      Width = 523
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 523
      inherited btnSave: TBitBtn
        OnClick = btnSaveClick
      end
    end
    inherited pnl2: TPanel
      Width = 523
      Height = 231
      ExplicitLeft = 1
      ExplicitTop = 34
      ExplicitWidth = 523
      ExplicitHeight = 231
      object Label1: TLabel
        Left = 121
        Top = 44
        Width = 28
        Height = 13
        Caption = #31867#21035':'
      end
      object Label2: TLabel
        Left = 97
        Top = 92
        Width = 52
        Height = 13
        Caption = #24635#36134#36134#30446':'
      end
      object Label3: TLabel
        Left = 155
        Top = 121
        Width = 3
        Height = 13
      end
      object dcb_pro: TCheckBox
        Left = 155
        Top = 140
        Width = 97
        Height = 17
        Caption = #23545#27492#31867#21035#24449#31246
        TabOrder = 0
      end
      object dcb_pur: TCheckBox
        Left = 155
        Top = 179
        Width = 209
        Height = 17
        Caption = #20801#35768#22312#31867#21035#20013#35760#20323#37329
        TabOrder = 1
      end
      object RkyType: TEdit
        Left = 171
        Top = 41
        Width = 153
        Height = 21
        TabOrder = 2
      end
      object RkyAccount: TEdit
        Left = 171
        Top = 89
        Width = 230
        Height = 21
        TabOrder = 3
      end
    end
  end
  object cds_86: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 72
  end
end
