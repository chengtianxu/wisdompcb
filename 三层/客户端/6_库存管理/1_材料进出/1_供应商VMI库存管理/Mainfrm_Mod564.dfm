inherited frmMain_Mod564: TfrmMain_Mod564
  Caption = 'frmMain_Mod564'
  ClientHeight = 383
  Menu = MainMenu1
  ExplicitWidth = 793
  ExplicitHeight = 429
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Height = 383
    TabOrder = 1
    ExplicitHeight = 383
    inherited pnlDisplayMain: TPanel
      Height = 383
      ExplicitHeight = 383
      inherited pnlChildMain: TPanel
        Height = 381
        ExplicitHeight = 381
        inherited pnlEhMainDisplay: TPanel
          Height = 350
          ExplicitHeight = 350
          inherited ehMain: TDBGridEh
            Height = 348
            Visible = False
          end
        end
        inherited pnlTopOperator: TPanel
          Visible = False
        end
      end
    end
  end
  object StaticText1: TStaticText [1]
    Left = 28
    Top = 88
    Width = 532
    Height = 52
    Caption = #20805#20998#21033#29992#26448#26009#20943#23569#25104#26412#65281
    Color = cl3DLight
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -48
    Font.Name = #23435#20307
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 0
  end
  object MainMenu1: TMainMenu
    Left = 420
    Top = 32
    object N1: TMenuItem
      Caption = #36864#20986#31243#24207
    end
    object N2: TMenuItem
      Tag = 1
      Caption = #26448#26009#20837#24211
      object N13: TMenuItem
        Caption = 'VMI'#20837#24211#31649#29702
      end
      object N3: TMenuItem
        Tag = 2
        Caption = #25353'PO'#20837#24211
        Visible = False
      end
      object N12: TMenuItem
        Caption = #30452#25509#20837#24211
        Visible = False
      end
    end
    object N4: TMenuItem
      Tag = 3
      Caption = #26448#26009#20986#24211
      object N5: TMenuItem
        Tag = 4
        Caption = #26448#26009#39046#26009#20986#20179
        Visible = False
      end
      object N6: TMenuItem
        Tag = 5
        Caption = #20379#24212#21830#36864#36135#20986#20179
      end
      object N11: TMenuItem
        Caption = #20379#24212#21830#36864#36135#23457#26680
      end
    end
    object N7: TMenuItem
      Tag = 6
      Caption = #26448#26009#26597#35810
      object N8: TMenuItem
        Tag = 7
        Caption = #20837#24211#26597#35810
      end
      object N9: TMenuItem
        Tag = 8
        Caption = #20986#24211#26597#35810
      end
      object N10: TMenuItem
        Tag = 9
        Caption = #24211#23384#26597#35810
      end
    end
    object N14: TMenuItem
      Caption = #26448#26009#25130#25968
    end
  end
end
