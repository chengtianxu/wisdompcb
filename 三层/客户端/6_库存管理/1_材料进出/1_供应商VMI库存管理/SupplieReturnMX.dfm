inherited frmSupplieReturnMX: TfrmSupplieReturnMX
  Caption = #20379#24212#21830#36864#36135#26126#32454
  ClientHeight = 233
  ClientWidth = 662
  ExplicitWidth = 678
  ExplicitHeight = 272
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 662
    Height = 233
    ExplicitWidth = 662
    ExplicitHeight = 233
    inherited pnl1: TPanel
      Width = 660
      ExplicitWidth = 660
      inherited btnSave: TBitBtn
        OnClick = btnSaveClick
      end
      inherited btnClose: TBitBtn
        OnClick = btnCloseClick
      end
    end
    inherited pnl2: TPanel
      Width = 660
      Height = 198
      ExplicitTop = 34
      ExplicitWidth = 660
      ExplicitHeight = 198
      object Label4: TLabel
        Left = 32
        Top = 12
        Width = 70
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #20986#20179#21333#21495#65306
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 32
        Top = 42
        Width = 70
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #26448#26009#32534#30721#65306
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 42
        Top = 72
        Width = 60
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #20379#24212#21830#65306
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 57
        Top = 103
        Width = 45
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #24037#21378#65306
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 450
        Top = 12
        Width = 70
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #20837#24211#24635#25968#65306
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 8
        Top = 164
        Width = 94
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #26412#27425#36864#36135#25968#37327#65306
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 450
        Top = 42
        Width = 70
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #36864#36135#25968#37327#65306
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 254
        Top = 164
        Width = 45
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #22791#27880#65306
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 448
        Top = 72
        Width = 72
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #22312#24211#25968#37327#65306
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 475
        Top = 103
        Width = 45
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #31246#29575#65306
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 229
        Top = 134
        Width = 70
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #21547#31246#20215#26684#65306
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 32
        Top = 134
        Width = 70
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #36864#26009#20154#21592#65306
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Edit8: TEdit
        Left = 96
        Top = 160
        Width = 121
        Height = 21
        TabOrder = 0
        OnExit = Edit8Exit
        OnKeyPress = Edit8KeyPress
      end
      object Edit9: TEdit
        Left = 296
        Top = 130
        Width = 121
        Height = 21
        TabOrder = 1
        OnKeyPress = Edit9KeyPress
      end
      object Edit10: TEdit
        Left = 296
        Top = 159
        Width = 340
        Height = 21
        TabOrder = 2
      end
      object Edit2: TEdit
        Left = 97
        Top = 68
        Width = 320
        Height = 21
        ReadOnly = True
        TabOrder = 3
      end
      object Edit4: TEdit
        Left = 515
        Top = 8
        Width = 121
        Height = 21
        ReadOnly = True
        TabOrder = 4
      end
      object Edit5: TEdit
        Left = 515
        Top = 38
        Width = 121
        Height = 21
        ReadOnly = True
        TabOrder = 5
      end
      object Edit11: TEdit
        Left = 96
        Top = 8
        Width = 121
        Height = 21
        ReadOnly = True
        TabOrder = 6
      end
      object Edit12: TEdit
        Left = 95
        Top = 130
        Width = 96
        Height = 21
        ReadOnly = True
        TabOrder = 7
      end
      object BitBtn2: TBitBtn
        Tag = 1
        Left = 191
        Top = 129
        Width = 26
        Height = 25
        Glyph.Data = {
          EE000000424DEE000000000000007600000028000000100000000F0000000100
          04000000000078000000130B0000130B00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888800000888880000080F000888880F00080F000888880F0008000000080000
          000800F000000F00000800F000800F00000800F000800F000008800000000000
          0088880F00080F000888880000080000088888800088800088888880F08880F0
          888888800088800088888888888888888888}
        TabOrder = 8
        OnClick = BitBtn2Click
      end
    end
  end
  object Edit1: TEdit
    Left = 96
    Top = 68
    Width = 321
    Height = 21
    ReadOnly = True
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 97
    Top = 132
    Width = 320
    Height = 21
    ReadOnly = True
    TabOrder = 2
  end
  object Edit6: TEdit
    Left = 515
    Top = 101
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 4
  end
  object Edit7: TEdit
    Left = 515
    Top = 132
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 3
  end
  object cds724: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 264
    Top = 48
  end
  object cds149: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 320
    Top = 48
  end
  object cds134: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 368
    Top = 48
  end
  object cds04: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 408
    Top = 48
  end
end
