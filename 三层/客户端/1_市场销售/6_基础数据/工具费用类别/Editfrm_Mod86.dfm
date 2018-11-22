inherited Editfrm_Mod086: TEditfrm_Mod086
  Caption = #39069#22806#20215#26684#31867#21035
  ClientHeight = 243
  ClientWidth = 472
  OnClose = FormClose
  ExplicitWidth = 488
  ExplicitHeight = 281
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 472
    Height = 243
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 472
    ExplicitHeight = 243
    inherited pnl1: TPanel
      Width = 470
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 470
      inherited btnSave: TBitBtn
        OnClick = btnSaveClick
      end
      inherited btnClose: TBitBtn
        OnClick = btnCloseClick
      end
    end
    inherited pnl2: TPanel
      Width = 470
      Height = 208
      ExplicitLeft = 1
      ExplicitTop = 34
      ExplicitWidth = 470
      ExplicitHeight = 208
      object Label2: TLabel
        Left = 80
        Top = 31
        Width = 24
        Height = 13
        Caption = #31867#21035
      end
      object Label3: TLabel
        Left = 80
        Top = 72
        Width = 48
        Height = 13
        Caption = #24635#36134#36134#30446
      end
      object Label1: TLabel
        Left = 88
        Top = 96
        Width = 3
        Height = 13
      end
      object dcb_pro: TCheckBox
        Left = 80
        Top = 128
        Width = 97
        Height = 17
        Caption = #23545#27492#31867#21035#24449#31246
        TabOrder = 0
      end
      object dcb_pur: TCheckBox
        Left = 80
        Top = 151
        Width = 201
        Height = 17
        Caption = #20801#35768#22312#31867#21035#20013#35760#20323#37329
        TabOrder = 1
      end
      object ded_code: TEdit
        Left = 144
        Top = 28
        Width = 153
        Height = 21
        TabOrder = 2
      end
    end
  end
  object RzButtonEdit1: TRzButtonEdit
    Left = 145
    Top = 103
    Width = 200
    Height = 21
    Text = ''
    TabOrder = 1
    OnKeyPress = RzButtonEdit1KeyPress
    ButtonKind = bkFind
    AltBtnWidth = 15
    ButtonWidth = 15
    OnButtonClick = RzButtonEdit1ButtonClick
  end
  object cds_86: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 72
  end
  object cds86: TDataSource
    DataSet = cds_86
    Left = 40
    Top = 136
  end
end
