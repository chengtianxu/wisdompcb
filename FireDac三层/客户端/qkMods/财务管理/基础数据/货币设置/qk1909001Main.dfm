inherited frmqk1909001Main: Tfrmqk1909001Main
  Caption = 'frmqk1909001Main'
  ClientHeight = 660
  ClientWidth = 1009
  ExplicitWidth = 1025
  ExplicitHeight = 699
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlbase: TPanel
    Width = 1009
    Height = 660
    ExplicitWidth = 1009
    ExplicitHeight = 660
    inherited pnlbaseforGrid: TPanel
      Width = 1007
      Height = 658
      ExplicitWidth = 1007
      ExplicitHeight = 658
      inherited pnlbaseGrid: TPanel
        Width = 836
        Height = 632
        ExplicitWidth = 836
        ExplicitHeight = 632
        inherited eh1: TDBGridEh
          Width = 329
          Height = 630
          Align = alLeft
          PopupMenu = pmMain
        end
        object pnl1: TPanel
          Left = 330
          Top = 1
          Width = 505
          Height = 630
          Align = alClient
          ParentColor = True
          TabOrder = 1
          object lbl2: TLabel
            Left = 72
            Top = 64
            Width = 144
            Height = 16
            Caption = #22522#20934#36135#24065'('#26412#20301#24065')'#65306
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object lbl3: TLabel
            Left = 72
            Top = 103
            Width = 65
            Height = 13
            Caption = #36135#24065#20195#30721#65306
          end
          object lbl4: TLabel
            Left = 72
            Top = 137
            Width = 65
            Height = 13
            Caption = #36135#24065#21517#31216#65306
          end
          object lbl6: TLabel
            Left = 72
            Top = 171
            Width = 65
            Height = 13
            Caption = #35760#36134#27719#29575#65306
          end
          object lbl7: TLabel
            Left = 72
            Top = 205
            Width = 65
            Height = 13
            Caption = #35760#36134#27719#29575#65306
          end
          object lbl8: TLabel
            Left = 72
            Top = 239
            Width = 65
            Height = 13
            Caption = #25253#20215#27719#29575#65306
          end
          object lbl9: TLabel
            Left = 72
            Top = 273
            Width = 65
            Height = 13
            Caption = #25253#20215#27719#29575#65306
          end
          object lblBaseCurr: TLabel
            Left = 216
            Top = 64
            Width = 8
            Height = 16
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object lbl5: TLabel
            Left = 72
            Top = 307
            Width = 65
            Height = 13
            Caption = #26356#26032#26102#38388#65306
          end
          object edtCurr_Code: TRzDBEdit
            Left = 152
            Top = 100
            Width = 150
            Height = 21
            DataSource = ds1
            DataField = 'Curr_Code'
            ReadOnly = True
            BiDiMode = bdRightToLeft
            Color = clInfoBk
            ParentBiDiMode = False
            TabOrder = 0
          end
          object edtCurr_ChsName: TRzDBEdit
            Left = 152
            Top = 134
            Width = 150
            Height = 21
            DataSource = ds1
            DataField = 'Curr_ChsName'
            ReadOnly = True
            BiDiMode = bdRightToLeft
            Color = clInfoBk
            ParentBiDiMode = False
            TabOrder = 1
          end
          object edtRateTobase: TRzDBEdit
            Left = 152
            Top = 168
            Width = 150
            Height = 21
            DataSource = ds1
            DataField = 'RateTobase'
            ReadOnly = True
            BiDiMode = bdRightToLeft
            Color = clInfoBk
            ParentBiDiMode = False
            TabOrder = 2
          end
          object edtBaseToRate: TRzDBEdit
            Left = 152
            Top = 202
            Width = 150
            Height = 21
            DataSource = ds1
            DataField = 'BaseToRate'
            ReadOnly = True
            BiDiMode = bdRightToLeft
            Color = clInfoBk
            ParentBiDiMode = False
            TabOrder = 3
          end
          object edtPrice_RateToBase: TRzDBEdit
            Left = 152
            Top = 236
            Width = 150
            Height = 21
            DataSource = ds1
            DataField = 'Price_RateToBase'
            ReadOnly = True
            BiDiMode = bdRightToLeft
            Color = clInfoBk
            ParentBiDiMode = False
            TabOrder = 4
          end
          object edtPrice_RateTobase1: TRzDBEdit
            Left = 152
            Top = 270
            Width = 150
            Height = 21
            DataSource = ds1
            DataField = 'Price_basetoRate'
            ReadOnly = True
            BiDiMode = bdRightToLeft
            Color = clInfoBk
            ParentBiDiMode = False
            TabOrder = 5
          end
          object edt1: TRzEdit
            Left = 308
            Top = 168
            Width = 139
            Height = 21
            Text = ''
            BiDiMode = bdRightToLeft
            Color = clInfoBk
            ParentBiDiMode = False
            ReadOnly = True
            TabOrder = 6
          end
          object edt3: TRzEdit
            Left = 308
            Top = 202
            Width = 139
            Height = 21
            Text = ''
            BiDiMode = bdRightToLeft
            Color = clInfoBk
            ParentBiDiMode = False
            ReadOnly = True
            TabOrder = 7
          end
          object edt4: TRzEdit
            Left = 308
            Top = 236
            Width = 139
            Height = 21
            Text = ''
            BiDiMode = bdRightToLeft
            Color = clInfoBk
            ParentBiDiMode = False
            ReadOnly = True
            TabOrder = 8
          end
          object edt5: TRzEdit
            Left = 308
            Top = 270
            Width = 139
            Height = 21
            Text = ''
            BiDiMode = bdRightToLeft
            Color = clInfoBk
            ParentBiDiMode = False
            ReadOnly = True
            TabOrder = 9
          end
          object edtPrice_RateTobase2: TRzDBEdit
            Left = 152
            Top = 304
            Width = 150
            Height = 21
            DataSource = ds1
            DataField = 'TDate'
            ReadOnly = True
            BiDiMode = bdRightToLeft
            Color = clInfoBk
            ParentBiDiMode = False
            TabOrder = 10
          end
        end
      end
      inherited pnlTop: TPanel
        Width = 1005
        ExplicitWidth = 1005
        inherited lblModID: TLabel
          Left = 948
          ExplicitLeft = 948
        end
      end
      inherited pnlWhere: TPanel
        Height = 632
        ExplicitHeight = 632
      end
    end
  end
  inherited mt1: TFDMemTable
    AfterScroll = mt1AfterScroll
  end
end
