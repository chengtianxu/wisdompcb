inherited frm_EquiMainAnal: Tfrm_EquiMainAnal
  Left = 207
  Top = 123
  Width = 1122
  Height = 706
  Caption = 'frm_EquiMainAnal'
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  inherited dxStatusBar1: TdxStatusBar
    Top = 650
    Width = 1114
  end
  inherited cxTabControl1: TcxTabControl
    Width = 1114
    Height = 611
    ClientRectBottom = 611
    ClientRectRight = 1114
    inherited Panel3: TPanel
      Width = 1114
      Height = 606
      inherited Panel2: TPanel
        Left = 994
        Height = 602
        inherited RzToolbar1: TRzToolbar
          Height = 602
          RowHeight = 26
          ToolbarControls = (
            Button1)
          inherited Button1: TButton
            Top = 3
          end
        end
      end
      inherited Panel4: TPanel
        Width = 994
        Height = 602
        inherited Panel5: TPanel
          Top = 394
          Width = 994
          Height = 208
          object PF0: TPanel
            Left = 626
            Top = 177
            Width = 569
            Height = 35
            BevelOuter = bvNone
            TabOrder = 0
            object PF0_Find: TSpeedButton
              Left = 526
              Top = 8
              Width = 25
              Height = 25
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000
                00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FF0000CE0094FF0000CE000000FF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000CE0094FF0000
                FF0000CE000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FF0000CE0094FF0000FF0000CE000000FF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FF0000000000000000000000000000000094FF0000FF0000CE0000
                00FF00FFFF00FFFF00FFFF00FFFF00FF848484000000CE9400CE9400CE940094
                63299463290000000000CE000000FF00FFFF00FFFF00FFFF00FFFF00FF848484
                ADB5ADFFCE29FFCE29FFCE29FFCE29CE9400CE9400946329000000FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FF848484FFFF94FFFF94FFFF94FFCE94FFCE29FF
                CE29CE9400CE9400000000FF00FFFF00FFFF00FFFF00FFFF00FF848484FFCE94
                FFFF94FFFF94FFFF94FFFF94FFFF94FFCE29FFCE29CE9400946329000000FF00
                FFFF00FFFF00FFFF00FF848484FFCE94FFFFCEFFFFCEFFFFCEFFFF94FFFF94FF
                FF94FFCE29CE9400CE9400000000FF00FFFF00FFFF00FFFF00FF848484FFCE94
                FFFFFFFFFFFFFFFFCEFFFFCEFFFF94FFFF94FFCE94FFCE29CE9400000000FF00
                FFFF00FFFF00FFFF00FF848484ADB5ADFFFFFFFFFFFFFFFFFFFFFFCEFFFFCEFF
                FF94FFFF94FFCE29CE9400000000FF00FFFF00FFFF00FFFF00FFFF00FF848484
                FFCE94FFFFFFFFFFFFFFFFFFFFFFCEFFFF94FFFF94FFCE29000000FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FF848484ADB5ADFFCE94FFFFFFFFFFFFFFFFCEFF
                FF94FFCE94CE9429000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                848484848484ADB5ADFFCE94FFCE94FFCE94848484848484FF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF84848484848484848484
                8484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              OnClick = BtFindClick
            end
            object GroupBox9: TGroupBox
              Left = 107
              Top = 0
              Width = 341
              Height = 35
              Align = alLeft
              Caption = #25925#38556#26085#26399
              TabOrder = 0
              object Label10: TLabel
                Left = 174
                Top = 17
                Width = 12
                Height = 12
                Caption = #21040
              end
              object Label11: TLabel
                Left = 7
                Top = 17
                Width = 12
                Height = 12
                Caption = #20174
              end
              object PF0_dteEnd: TDateTimePicker
                Left = 190
                Top = 13
                Width = 88
                Height = 21
                Date = 41500.000000000000000000
                Format = 'yyyy-MM-dd '
                Time = 41500.000000000000000000
                TabOrder = 0
                OnChange = PF0_dteEndChange
              end
              object PF0_dteBegin: TDateTimePicker
                Left = 21
                Top = 13
                Width = 88
                Height = 21
                Date = 41500.580699502320000000
                Format = 'yyyy-MM-dd'
                Time = 41500.580699502320000000
                DateFormat = dfLong
                TabOrder = 1
                OnChange = PF0_dteBeginChange
              end
              object PF0_dteBeginTime: TDateTimePicker
                Left = 110
                Top = 13
                Width = 60
                Height = 21
                Date = 41500.333333333340000000
                Format = 'HH:mm'
                Time = 41500.333333333340000000
                DateMode = dmUpDown
                Kind = dtkTime
                TabOrder = 2
                OnChange = PF0_dteBeginChange
              end
              object PF0_dteEndTime: TDateTimePicker
                Left = 279
                Top = 13
                Width = 60
                Height = 21
                Date = 41500.333333333340000000
                Format = 'HH:mm'
                Time = 41500.333333333340000000
                DateMode = dmUpDown
                Kind = dtkTime
                TabOrder = 3
                OnChange = PF0_dteEndChange
              end
            end
            object GroupBox10: TGroupBox
              Left = 0
              Top = 0
              Width = 107
              Height = 35
              Align = alLeft
              Caption = #31579#36873#24037#21378
              TabOrder = 1
              object PF0_cbx: TComboBox
                Left = 4
                Top = 11
                Width = 101
                Height = 20
                Style = csDropDownList
                ItemHeight = 12
                TabOrder = 0
                OnChange = PF0_cbxChange
              end
            end
            object GroupBox11: TGroupBox
              Left = 448
              Top = 0
              Width = 74
              Height = 35
              Align = alLeft
              Caption = #38388#38548#26102#38388
              TabOrder = 2
              object Label12: TLabel
                Left = 45
                Top = 15
                Width = 12
                Height = 12
                Caption = #22825
              end
              object PF0_Edit_Day: TEdit
                Left = 6
                Top = 13
                Width = 36
                Height = 20
                TabOrder = 0
                OnChange = PF0_Edit_DayChange
                OnKeyPress = Edit1KeyPress
              end
            end
          end
          object PF1: TPanel
            Left = 619
            Top = 155
            Width = 570
            Height = 35
            BevelOuter = bvNone
            TabOrder = 1
            object SpeedButton1: TSpeedButton
              Left = 526
              Top = 8
              Width = 25
              Height = 25
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000
                00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FF0000CE0094FF0000CE000000FF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000CE0094FF0000
                FF0000CE000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FF0000CE0094FF0000FF0000CE000000FF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FF0000000000000000000000000000000094FF0000FF0000CE0000
                00FF00FFFF00FFFF00FFFF00FFFF00FF848484000000CE9400CE9400CE940094
                63299463290000000000CE000000FF00FFFF00FFFF00FFFF00FFFF00FF848484
                ADB5ADFFCE29FFCE29FFCE29FFCE29CE9400CE9400946329000000FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FF848484FFFF94FFFF94FFFF94FFCE94FFCE29FF
                CE29CE9400CE9400000000FF00FFFF00FFFF00FFFF00FFFF00FF848484FFCE94
                FFFF94FFFF94FFFF94FFFF94FFFF94FFCE29FFCE29CE9400946329000000FF00
                FFFF00FFFF00FFFF00FF848484FFCE94FFFFCEFFFFCEFFFFCEFFFF94FFFF94FF
                FF94FFCE29CE9400CE9400000000FF00FFFF00FFFF00FFFF00FF848484FFCE94
                FFFFFFFFFFFFFFFFCEFFFFCEFFFF94FFFF94FFCE94FFCE29CE9400000000FF00
                FFFF00FFFF00FFFF00FF848484ADB5ADFFFFFFFFFFFFFFFFFFFFFFCEFFFFCEFF
                FF94FFFF94FFCE29CE9400000000FF00FFFF00FFFF00FFFF00FFFF00FF848484
                FFCE94FFFFFFFFFFFFFFFFFFFFFFCEFFFF94FFFF94FFCE29000000FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FF848484ADB5ADFFCE94FFFFFFFFFFFFFFFFCEFF
                FF94FFCE94CE9429000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                848484848484ADB5ADFFCE94FFCE94FFCE94848484848484FF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF84848484848484848484
                8484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              OnClick = BtFindClick
            end
            object GroupBox12: TGroupBox
              Left = 107
              Top = 0
              Width = 341
              Height = 35
              Align = alLeft
              Caption = #25925#38556#26085#26399
              TabOrder = 0
              object Label14: TLabel
                Left = 174
                Top = 17
                Width = 12
                Height = 12
                Caption = #21040
              end
              object Label15: TLabel
                Left = 7
                Top = 17
                Width = 12
                Height = 12
                Caption = #20174
              end
              object PF1_dteEnd: TDateTimePicker
                Left = 190
                Top = 13
                Width = 88
                Height = 21
                Date = 41500.000000000000000000
                Format = 'yyyy-MM-dd '
                Time = 41500.000000000000000000
                TabOrder = 0
                OnChange = PF1_dteEndChange
              end
              object PF1_dteBegin: TDateTimePicker
                Left = 21
                Top = 13
                Width = 88
                Height = 21
                Date = 41500.580699502320000000
                Format = 'yyyy-MM-dd'
                Time = 41500.580699502320000000
                DateFormat = dfLong
                TabOrder = 1
                OnChange = PF1_dteBeginChange
              end
              object PF1_dteBeginTime: TDateTimePicker
                Left = 110
                Top = 13
                Width = 60
                Height = 21
                Date = 41500.333333333340000000
                Format = 'HH:mm'
                Time = 41500.333333333340000000
                DateMode = dmUpDown
                Kind = dtkTime
                TabOrder = 2
                OnChange = PF1_dteBeginChange
              end
              object PF1_dteEndTime: TDateTimePicker
                Left = 279
                Top = 13
                Width = 60
                Height = 21
                Date = 41500.333333333340000000
                Format = 'HH:mm'
                Time = 41500.333333333340000000
                DateMode = dmUpDown
                Kind = dtkTime
                TabOrder = 3
                OnChange = PF1_dteEndChange
              end
            end
            object GroupBox13: TGroupBox
              Left = 0
              Top = 0
              Width = 107
              Height = 35
              Align = alLeft
              Caption = #31579#36873#24037#21378
              TabOrder = 1
              object PF1_cbx: TComboBox
                Left = 4
                Top = 11
                Width = 101
                Height = 20
                Style = csDropDownList
                ItemHeight = 12
                TabOrder = 0
                OnChange = PF1_cbxChange
              end
            end
            object GroupBox14: TGroupBox
              Left = 448
              Top = 0
              Width = 74
              Height = 35
              Align = alLeft
              Caption = #38388#38548#26102#38388
              TabOrder = 2
              object Label16: TLabel
                Left = 45
                Top = 15
                Width = 12
                Height = 12
                Caption = #22825
              end
              object PF1_Edit_Day: TEdit
                Left = 6
                Top = 13
                Width = 36
                Height = 20
                TabOrder = 0
                OnChange = PF1_Edit_DayChange
                OnKeyPress = Edit1KeyPress
              end
            end
          end
          object PF2: TPanel
            Left = 604
            Top = 118
            Width = 569
            Height = 35
            BevelOuter = bvNone
            TabOrder = 2
            object PF2_Find: TSpeedButton
              Left = 526
              Top = 8
              Width = 25
              Height = 25
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000
                00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FF0000CE0094FF0000CE000000FF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000CE0094FF0000
                FF0000CE000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FF0000CE0094FF0000FF0000CE000000FF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FF0000000000000000000000000000000094FF0000FF0000CE0000
                00FF00FFFF00FFFF00FFFF00FFFF00FF848484000000CE9400CE9400CE940094
                63299463290000000000CE000000FF00FFFF00FFFF00FFFF00FFFF00FF848484
                ADB5ADFFCE29FFCE29FFCE29FFCE29CE9400CE9400946329000000FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FF848484FFFF94FFFF94FFFF94FFCE94FFCE29FF
                CE29CE9400CE9400000000FF00FFFF00FFFF00FFFF00FFFF00FF848484FFCE94
                FFFF94FFFF94FFFF94FFFF94FFFF94FFCE29FFCE29CE9400946329000000FF00
                FFFF00FFFF00FFFF00FF848484FFCE94FFFFCEFFFFCEFFFFCEFFFF94FFFF94FF
                FF94FFCE29CE9400CE9400000000FF00FFFF00FFFF00FFFF00FF848484FFCE94
                FFFFFFFFFFFFFFFFCEFFFFCEFFFF94FFFF94FFCE94FFCE29CE9400000000FF00
                FFFF00FFFF00FFFF00FF848484ADB5ADFFFFFFFFFFFFFFFFFFFFFFCEFFFFCEFF
                FF94FFFF94FFCE29CE9400000000FF00FFFF00FFFF00FFFF00FFFF00FF848484
                FFCE94FFFFFFFFFFFFFFFFFFFFFFCEFFFF94FFFF94FFCE29000000FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FF848484ADB5ADFFCE94FFFFFFFFFFFFFFFFCEFF
                FF94FFCE94CE9429000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                848484848484ADB5ADFFCE94FFCE94FFCE94848484848484FF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF84848484848484848484
                8484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              OnClick = BtFindClick
            end
            object GroupBox15: TGroupBox
              Left = 107
              Top = 0
              Width = 341
              Height = 35
              Align = alLeft
              Caption = #25925#38556#26085#26399
              TabOrder = 0
              object Label17: TLabel
                Left = 174
                Top = 17
                Width = 12
                Height = 12
                Caption = #21040
              end
              object Label18: TLabel
                Left = 7
                Top = 17
                Width = 12
                Height = 12
                Caption = #20174
              end
              object PF2_dteEnd: TDateTimePicker
                Left = 190
                Top = 13
                Width = 88
                Height = 21
                Date = 41500.000000000000000000
                Format = 'yyyy-MM-dd '
                Time = 41500.000000000000000000
                TabOrder = 0
                OnChange = PF2_dteEndChange
              end
              object PF2_dteBegin: TDateTimePicker
                Left = 21
                Top = 13
                Width = 88
                Height = 21
                Date = 41500.580699502320000000
                Format = 'yyyy-MM-dd'
                Time = 41500.580699502320000000
                DateFormat = dfLong
                TabOrder = 1
                OnChange = PF2_dteBeginChange
              end
              object PF2_dteBeginTime: TDateTimePicker
                Left = 110
                Top = 13
                Width = 60
                Height = 21
                Date = 41500.333333333340000000
                Format = 'HH:mm'
                Time = 41500.333333333340000000
                DateMode = dmUpDown
                Kind = dtkTime
                TabOrder = 2
                OnChange = PF2_dteBeginChange
              end
              object PF2_dteEndTime: TDateTimePicker
                Left = 279
                Top = 13
                Width = 60
                Height = 21
                Date = 41500.333333333340000000
                Format = 'HH:mm'
                Time = 41500.333333333340000000
                DateMode = dmUpDown
                Kind = dtkTime
                TabOrder = 3
                OnChange = PF2_dteEndChange
              end
            end
            object GroupBox16: TGroupBox
              Left = 0
              Top = 0
              Width = 107
              Height = 35
              Align = alLeft
              Caption = #31579#36873#24037#21378
              TabOrder = 1
              object PF2_cbx: TComboBox
                Left = 4
                Top = 11
                Width = 101
                Height = 20
                Style = csDropDownList
                ItemHeight = 12
                TabOrder = 0
                OnChange = PF2_cbxChange
              end
            end
            object GroupBox17: TGroupBox
              Left = 448
              Top = 0
              Width = 74
              Height = 35
              Align = alLeft
              Caption = #25925#38556#32791#26102
              TabOrder = 2
              object Label19: TLabel
                Left = 46
                Top = 15
                Width = 24
                Height = 12
                Caption = #23567#26102
              end
              object PF2_Edit_H: TEdit
                Left = 6
                Top = 13
                Width = 36
                Height = 20
                TabOrder = 0
                OnChange = PF2_Edit_HChange
                OnKeyPress = Edit1KeyPress
              end
            end
          end
          object PF3: TPanel
            Left = 21
            Top = 185
            Width = 570
            Height = 35
            BevelOuter = bvNone
            TabOrder = 3
            object PF3_Find: TSpeedButton
              Left = 526
              Top = 8
              Width = 25
              Height = 25
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000
                00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FF0000CE0094FF0000CE000000FF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000CE0094FF0000
                FF0000CE000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FF0000CE0094FF0000FF0000CE000000FF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FF0000000000000000000000000000000094FF0000FF0000CE0000
                00FF00FFFF00FFFF00FFFF00FFFF00FF848484000000CE9400CE9400CE940094
                63299463290000000000CE000000FF00FFFF00FFFF00FFFF00FFFF00FF848484
                ADB5ADFFCE29FFCE29FFCE29FFCE29CE9400CE9400946329000000FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FF848484FFFF94FFFF94FFFF94FFCE94FFCE29FF
                CE29CE9400CE9400000000FF00FFFF00FFFF00FFFF00FFFF00FF848484FFCE94
                FFFF94FFFF94FFFF94FFFF94FFFF94FFCE29FFCE29CE9400946329000000FF00
                FFFF00FFFF00FFFF00FF848484FFCE94FFFFCEFFFFCEFFFFCEFFFF94FFFF94FF
                FF94FFCE29CE9400CE9400000000FF00FFFF00FFFF00FFFF00FF848484FFCE94
                FFFFFFFFFFFFFFFFCEFFFFCEFFFF94FFFF94FFCE94FFCE29CE9400000000FF00
                FFFF00FFFF00FFFF00FF848484ADB5ADFFFFFFFFFFFFFFFFFFFFFFCEFFFFCEFF
                FF94FFFF94FFCE29CE9400000000FF00FFFF00FFFF00FFFF00FFFF00FF848484
                FFCE94FFFFFFFFFFFFFFFFFFFFFFCEFFFF94FFFF94FFCE29000000FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FF848484ADB5ADFFCE94FFFFFFFFFFFFFFFFCEFF
                FF94FFCE94CE9429000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                848484848484ADB5ADFFCE94FFCE94FFCE94848484848484FF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF84848484848484848484
                8484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              OnClick = BtFindClick
            end
            object GroupBox18: TGroupBox
              Left = 107
              Top = 0
              Width = 341
              Height = 35
              Align = alLeft
              Caption = #25925#38556#26085#26399
              TabOrder = 0
              object Label20: TLabel
                Left = 174
                Top = 17
                Width = 12
                Height = 12
                Caption = #21040
              end
              object Label21: TLabel
                Left = 7
                Top = 17
                Width = 12
                Height = 12
                Caption = #20174
              end
              object PF3_dteEnd: TDateTimePicker
                Left = 190
                Top = 13
                Width = 88
                Height = 21
                Date = 41500.000000000000000000
                Format = 'yyyy-MM-dd '
                Time = 41500.000000000000000000
                TabOrder = 0
                OnChange = PF3_dteEndChange
              end
              object PF3_dteBegin: TDateTimePicker
                Left = 21
                Top = 13
                Width = 88
                Height = 21
                Date = 41500.580699502320000000
                Format = 'yyyy-MM-dd'
                Time = 41500.580699502320000000
                DateFormat = dfLong
                TabOrder = 1
                OnChange = PF3_dteBeginChange
              end
              object PF3_dteBeginTime: TDateTimePicker
                Left = 110
                Top = 13
                Width = 60
                Height = 21
                Date = 41500.333333333340000000
                Format = 'HH:mm'
                Time = 41500.333333333340000000
                DateMode = dmUpDown
                Kind = dtkTime
                TabOrder = 2
                OnChange = PF3_dteBeginChange
              end
              object PF3_dteEndTime: TDateTimePicker
                Left = 279
                Top = 13
                Width = 60
                Height = 21
                Date = 41500.333333333340000000
                Format = 'HH:mm'
                Time = 41500.333333333340000000
                DateMode = dmUpDown
                Kind = dtkTime
                TabOrder = 3
                OnChange = PF3_dteEndChange
              end
            end
            object GroupBox19: TGroupBox
              Left = 0
              Top = 0
              Width = 107
              Height = 35
              Align = alLeft
              Caption = #31579#36873#24037#21378
              TabOrder = 1
              object PF3_cbx: TComboBox
                Left = 4
                Top = 11
                Width = 101
                Height = 20
                Style = csDropDownList
                ItemHeight = 12
                TabOrder = 0
                OnChange = PF3_cbxChange
              end
            end
            object GroupBox20: TGroupBox
              Left = 448
              Top = 0
              Width = 74
              Height = 35
              Align = alLeft
              Caption = #20572#26426#26102#38388
              TabOrder = 2
              object Label22: TLabel
                Left = 46
                Top = 15
                Width = 24
                Height = 12
                Caption = #23567#26102
              end
              object PF3_Edit_H: TEdit
                Left = 6
                Top = 13
                Width = 36
                Height = 20
                TabOrder = 0
                OnChange = PF3_Edit_HChange
                OnKeyPress = Edit1KeyPress
              end
            end
          end
          object PF4: TPanel
            Left = 473
            Top = 44
            Width = 721
            Height = 35
            BevelOuter = bvNone
            TabOrder = 4
            object GroupBox21: TGroupBox
              Left = 107
              Top = 0
              Width = 341
              Height = 35
              Align = alLeft
              Caption = #25925#38556#26085#26399
              TabOrder = 0
              object Label23: TLabel
                Left = 174
                Top = 17
                Width = 12
                Height = 12
                Caption = #21040
              end
              object Label24: TLabel
                Left = 7
                Top = 17
                Width = 12
                Height = 12
                Caption = #20174
              end
              object PF4_dteEnd: TDateTimePicker
                Left = 190
                Top = 13
                Width = 88
                Height = 21
                Date = 41500.000000000000000000
                Format = 'yyyy-MM-dd '
                Time = 41500.000000000000000000
                TabOrder = 0
                OnChange = PF4_dteEndChange
              end
              object PF4_dteBegin: TDateTimePicker
                Left = 21
                Top = 13
                Width = 88
                Height = 21
                Date = 41500.580699502320000000
                Format = 'yyyy-MM-dd'
                Time = 41500.580699502320000000
                DateFormat = dfLong
                TabOrder = 1
                OnChange = PF4_dteBeginChange
              end
              object PF4_dteBeginTime: TDateTimePicker
                Left = 110
                Top = 13
                Width = 60
                Height = 21
                Date = 41500.333333333340000000
                Format = 'HH:mm'
                Time = 41500.333333333340000000
                DateMode = dmUpDown
                Kind = dtkTime
                TabOrder = 2
                OnChange = PF4_dteBeginChange
              end
              object PF4_dteEndTime: TDateTimePicker
                Left = 279
                Top = 13
                Width = 60
                Height = 21
                Date = 41500.333333333340000000
                Format = 'HH:mm'
                Time = 41500.333333333340000000
                DateMode = dmUpDown
                Kind = dtkTime
                TabOrder = 3
                OnChange = PF4_dteEndChange
              end
            end
            object GroupBox22: TGroupBox
              Left = 0
              Top = 0
              Width = 107
              Height = 35
              Align = alLeft
              Caption = #31579#36873#24037#21378
              TabOrder = 1
              object PF4_cbx: TComboBox
                Left = 4
                Top = 11
                Width = 101
                Height = 20
                Style = csDropDownList
                ItemHeight = 12
                TabOrder = 0
                OnChange = PF4_cbxChange
              end
            end
            object GroupBox23: TGroupBox
              Left = 522
              Top = 0
              Width = 73
              Height = 35
              Align = alLeft
              Caption = #20572#26426#26102#38388
              TabOrder = 2
              object Label25: TLabel
                Left = 46
                Top = 15
                Width = 24
                Height = 12
                Caption = #23567#26102
              end
              object PF4_Edit_H: TEdit
                Left = 6
                Top = 13
                Width = 36
                Height = 20
                TabOrder = 0
                OnChange = PF4_Edit_HChange
                OnKeyPress = Edit1KeyPress
              end
            end
            object GroupBox24: TGroupBox
              Left = 448
              Top = 0
              Width = 74
              Height = 35
              Align = alLeft
              Caption = #38388#38548#26102#38388
              TabOrder = 3
              object Label26: TLabel
                Left = 45
                Top = 15
                Width = 12
                Height = 12
                Caption = #22825
              end
              object PF4_Edit_Day: TEdit
                Left = 6
                Top = 13
                Width = 36
                Height = 20
                TabOrder = 0
                OnChange = PF4_Edit_DayChange
                OnKeyPress = Edit1KeyPress
              end
            end
            object GroupBox25: TGroupBox
              Left = 595
              Top = 0
              Width = 74
              Height = 35
              Align = alLeft
              Caption = #20445#20859#36798#25104#29575
              TabOrder = 4
              object Label27: TLabel
                Left = 55
                Top = 15
                Width = 6
                Height = 12
                Caption = '%'
              end
              object PF4_Edit_A: TEdit
                Left = 6
                Top = 13
                Width = 46
                Height = 20
                TabOrder = 0
                OnChange = PF4_cbxChange
                OnKeyPress = Edit1KeyPress
              end
            end
            object Panel18: TPanel
              Left = 669
              Top = 0
              Width = 37
              Height = 35
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 5
              object PF4_Find: TSpeedButton
                Left = 12
                Top = 8
                Width = 25
                Height = 25
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000
                  00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FF0000CE0094FF0000CE000000FF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000CE0094FF0000
                  FF0000CE000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FF0000CE0094FF0000FF0000CE000000FF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FF0000000000000000000000000000000094FF0000FF0000CE0000
                  00FF00FFFF00FFFF00FFFF00FFFF00FF848484000000CE9400CE9400CE940094
                  63299463290000000000CE000000FF00FFFF00FFFF00FFFF00FFFF00FF848484
                  ADB5ADFFCE29FFCE29FFCE29FFCE29CE9400CE9400946329000000FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF848484FFFF94FFFF94FFFF94FFCE94FFCE29FF
                  CE29CE9400CE9400000000FF00FFFF00FFFF00FFFF00FFFF00FF848484FFCE94
                  FFFF94FFFF94FFFF94FFFF94FFFF94FFCE29FFCE29CE9400946329000000FF00
                  FFFF00FFFF00FFFF00FF848484FFCE94FFFFCEFFFFCEFFFFCEFFFF94FFFF94FF
                  FF94FFCE29CE9400CE9400000000FF00FFFF00FFFF00FFFF00FF848484FFCE94
                  FFFFFFFFFFFFFFFFCEFFFFCEFFFF94FFFF94FFCE94FFCE29CE9400000000FF00
                  FFFF00FFFF00FFFF00FF848484ADB5ADFFFFFFFFFFFFFFFFFFFFFFCEFFFFCEFF
                  FF94FFFF94FFCE29CE9400000000FF00FFFF00FFFF00FFFF00FFFF00FF848484
                  FFCE94FFFFFFFFFFFFFFFFFFFFFFCEFFFF94FFFF94FFCE29000000FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF848484ADB5ADFFCE94FFFFFFFFFFFFFFFFCEFF
                  FF94FFCE94CE9429000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  848484848484ADB5ADFFCE94FFCE94FFCE94848484848484FF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF84848484848484848484
                  8484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = BtFindClick
              end
            end
          end
          object PF5: TPanel
            Left = 7
            Top = 177
            Width = 666
            Height = 35
            BevelOuter = bvNone
            TabOrder = 5
            object GroupBox26: TGroupBox
              Left = 107
              Top = 0
              Width = 341
              Height = 35
              Align = alLeft
              Caption = #25925#38556#26085#26399
              TabOrder = 0
              object Label28: TLabel
                Left = 174
                Top = 17
                Width = 12
                Height = 12
                Caption = #21040
              end
              object Label29: TLabel
                Left = 7
                Top = 17
                Width = 12
                Height = 12
                Caption = #20174
              end
              object PF5_dteEnd: TDateTimePicker
                Left = 190
                Top = 13
                Width = 88
                Height = 21
                Date = 41500.000000000000000000
                Format = 'yyyy-MM-dd '
                Time = 41500.000000000000000000
                TabOrder = 0
                OnChange = PF5_dteEndChange
              end
              object PF5_dteBegin: TDateTimePicker
                Left = 21
                Top = 13
                Width = 88
                Height = 21
                Date = 41500.580699502320000000
                Format = 'yyyy-MM-dd'
                Time = 41500.580699502320000000
                DateFormat = dfLong
                TabOrder = 1
                OnChange = PF5_dteBeginChange
              end
              object PF5_dteBeginTime: TDateTimePicker
                Left = 110
                Top = 13
                Width = 60
                Height = 21
                Date = 41500.333333333340000000
                Format = 'HH:mm'
                Time = 41500.333333333340000000
                DateMode = dmUpDown
                Kind = dtkTime
                TabOrder = 2
                OnChange = PF5_dteBeginChange
              end
              object PF5_dteEndTime: TDateTimePicker
                Left = 279
                Top = 13
                Width = 60
                Height = 21
                Date = 41500.333333333340000000
                Format = 'HH:mm'
                Time = 41500.333333333340000000
                DateMode = dmUpDown
                Kind = dtkTime
                TabOrder = 3
                OnChange = PF5_dteEndChange
              end
            end
            object GroupBox27: TGroupBox
              Left = 0
              Top = 0
              Width = 107
              Height = 35
              Align = alLeft
              Caption = #31579#36873#24037#21378
              TabOrder = 1
              object PF5_cbx: TComboBox
                Left = 4
                Top = 11
                Width = 101
                Height = 20
                Style = csDropDownList
                ItemHeight = 12
                TabOrder = 0
                OnChange = PF5_cbxChange
              end
            end
            object GroupBox29: TGroupBox
              Left = 448
              Top = 0
              Width = 74
              Height = 35
              Align = alLeft
              Caption = #38388#38548#26102#38388
              TabOrder = 2
              object Label31: TLabel
                Left = 45
                Top = 15
                Width = 12
                Height = 12
                Caption = #22825
              end
              object PF5_Edit_Day: TEdit
                Left = 6
                Top = 13
                Width = 36
                Height = 20
                TabOrder = 0
                OnChange = PF5_Edit_DayChange
                OnKeyPress = Edit1KeyPress
              end
            end
            object GroupBox30: TGroupBox
              Left = 522
              Top = 0
              Width = 73
              Height = 35
              Align = alLeft
              Caption = #20445#20859#36798#25104#29575
              TabOrder = 3
              object Label32: TLabel
                Left = 55
                Top = 15
                Width = 6
                Height = 12
                Caption = '%'
              end
              object PF5_Edit_A: TEdit
                Left = 6
                Top = 13
                Width = 46
                Height = 20
                TabOrder = 0
                OnChange = PF5_cbxChange
                OnKeyPress = Edit1KeyPress
              end
            end
            object Panel19: TPanel
              Left = 595
              Top = 0
              Width = 37
              Height = 35
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 4
              object PF5_Find: TSpeedButton
                Left = 12
                Top = 8
                Width = 25
                Height = 25
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000
                  00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FF0000CE0094FF0000CE000000FF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000CE0094FF0000
                  FF0000CE000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FF0000CE0094FF0000FF0000CE000000FF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FF0000000000000000000000000000000094FF0000FF0000CE0000
                  00FF00FFFF00FFFF00FFFF00FFFF00FF848484000000CE9400CE9400CE940094
                  63299463290000000000CE000000FF00FFFF00FFFF00FFFF00FFFF00FF848484
                  ADB5ADFFCE29FFCE29FFCE29FFCE29CE9400CE9400946329000000FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF848484FFFF94FFFF94FFFF94FFCE94FFCE29FF
                  CE29CE9400CE9400000000FF00FFFF00FFFF00FFFF00FFFF00FF848484FFCE94
                  FFFF94FFFF94FFFF94FFFF94FFFF94FFCE29FFCE29CE9400946329000000FF00
                  FFFF00FFFF00FFFF00FF848484FFCE94FFFFCEFFFFCEFFFFCEFFFF94FFFF94FF
                  FF94FFCE29CE9400CE9400000000FF00FFFF00FFFF00FFFF00FF848484FFCE94
                  FFFFFFFFFFFFFFFFCEFFFFCEFFFF94FFFF94FFCE94FFCE29CE9400000000FF00
                  FFFF00FFFF00FFFF00FF848484ADB5ADFFFFFFFFFFFFFFFFFFFFFFCEFFFFCEFF
                  FF94FFFF94FFCE29CE9400000000FF00FFFF00FFFF00FFFF00FFFF00FF848484
                  FFCE94FFFFFFFFFFFFFFFFFFFFFFCEFFFF94FFFF94FFCE29000000FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF848484ADB5ADFFCE94FFFFFFFFFFFFFFFFCEFF
                  FF94FFCE94CE9429000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  848484848484ADB5ADFFCE94FFCE94FFCE94848484848484FF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF84848484848484848484
                  8484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = BtFindClick
              end
            end
          end
          object PF6: TPanel
            Left = 56
            Top = 89
            Width = 1149
            Height = 35
            BevelOuter = bvNone
            TabOrder = 6
            object GroupBox28: TGroupBox
              Left = 107
              Top = 0
              Width = 341
              Height = 35
              Align = alLeft
              Caption = #38599#21592#24320#22987#26102#38388
              TabOrder = 0
              object Label30: TLabel
                Left = 174
                Top = 17
                Width = 12
                Height = 12
                Caption = #21040
              end
              object Label33: TLabel
                Left = 7
                Top = 17
                Width = 12
                Height = 12
                Caption = #20174
              end
              object PF6_dteEnd: TDateTimePicker
                Left = 190
                Top = 13
                Width = 88
                Height = 21
                Date = 41500.000000000000000000
                Format = 'yyyy-MM-dd '
                Time = 41500.000000000000000000
                TabOrder = 0
                OnChange = PF6_dteEndChange
              end
              object PF6_dteBegin: TDateTimePicker
                Left = 21
                Top = 13
                Width = 88
                Height = 21
                Date = 41500.580699502320000000
                Format = 'yyyy-MM-dd'
                Time = 41500.580699502320000000
                DateFormat = dfLong
                TabOrder = 1
                OnChange = PF6_dteBeginChange
              end
              object PF6_dteBeginTime: TDateTimePicker
                Left = 110
                Top = 13
                Width = 60
                Height = 21
                Date = 41500.333333333340000000
                Format = 'HH:mm'
                Time = 41500.333333333340000000
                DateMode = dmUpDown
                Kind = dtkTime
                TabOrder = 2
                OnChange = PF6_dteBeginChange
              end
              object PF6_dteEndTime: TDateTimePicker
                Left = 279
                Top = 13
                Width = 60
                Height = 21
                Date = 41500.333333333340000000
                Format = 'HH:mm'
                Time = 41500.333333333340000000
                DateMode = dmUpDown
                Kind = dtkTime
                TabOrder = 3
                OnChange = PF6_dteEndChange
              end
            end
            object GroupBox31: TGroupBox
              Left = 0
              Top = 0
              Width = 107
              Height = 35
              Align = alLeft
              Caption = #31579#36873#24037#21378
              TabOrder = 1
              object PF6_cbx: TComboBox
                Left = 4
                Top = 11
                Width = 101
                Height = 20
                Style = csDropDownList
                ItemHeight = 12
                TabOrder = 0
                OnClick = CheckBox1Click
              end
            end
            object GroupBox35: TGroupBox
              Left = 448
              Top = 0
              Width = 339
              Height = 35
              Align = alLeft
              Caption = ' '
              TabOrder = 2
              object CheckBox1: TCheckBox
                Left = 5
                Top = 15
                Width = 111
                Height = 15
                Caption = #26597#35810'"'#24033#26597#28857#26816'"'
                TabOrder = 0
                OnClick = CheckBox1Click
              end
              object CheckBox2: TCheckBox
                Left = 116
                Top = 14
                Width = 112
                Height = 16
                BiDiMode = bdRightToLeft
                Caption = #26597#35810'"'#39044#38450#32500#25252'"'
                ParentBiDiMode = False
                TabOrder = 1
                OnClick = CheckBox1Click
              end
              object CheckBox3: TCheckBox
                Left = 226
                Top = 14
                Width = 112
                Height = 16
                Caption = #26597#35810'"'#32791#26448#26356#25442'"'
                TabOrder = 2
                OnClick = CheckBox1Click
              end
            end
            object GroupBox36: TGroupBox
              Left = 787
              Top = 0
              Width = 74
              Height = 35
              Align = alLeft
              Caption = #38599#21592#24037#20316#26102#38388
              TabOrder = 3
              object Label37: TLabel
                Left = 46
                Top = 15
                Width = 24
                Height = 12
                Caption = #23567#26102
              end
              object PF6_Edit_H: TEdit
                Left = 6
                Top = 13
                Width = 36
                Height = 20
                TabOrder = 0
                OnChange = PF6_Edit_HChange
                OnKeyPress = Edit1KeyPress
              end
            end
            object Panel17: TPanel
              Left = 861
              Top = 0
              Width = 37
              Height = 35
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 4
              object SpeedButton4: TSpeedButton
                Left = 12
                Top = 8
                Width = 25
                Height = 25
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000
                  00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FF0000CE0094FF0000CE000000FF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000CE0094FF0000
                  FF0000CE000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FF0000CE0094FF0000FF0000CE000000FF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FF0000000000000000000000000000000094FF0000FF0000CE0000
                  00FF00FFFF00FFFF00FFFF00FFFF00FF848484000000CE9400CE9400CE940094
                  63299463290000000000CE000000FF00FFFF00FFFF00FFFF00FFFF00FF848484
                  ADB5ADFFCE29FFCE29FFCE29FFCE29CE9400CE9400946329000000FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF848484FFFF94FFFF94FFFF94FFCE94FFCE29FF
                  CE29CE9400CE9400000000FF00FFFF00FFFF00FFFF00FFFF00FF848484FFCE94
                  FFFF94FFFF94FFFF94FFFF94FFFF94FFCE29FFCE29CE9400946329000000FF00
                  FFFF00FFFF00FFFF00FF848484FFCE94FFFFCEFFFFCEFFFFCEFFFF94FFFF94FF
                  FF94FFCE29CE9400CE9400000000FF00FFFF00FFFF00FFFF00FF848484FFCE94
                  FFFFFFFFFFFFFFFFCEFFFFCEFFFF94FFFF94FFCE94FFCE29CE9400000000FF00
                  FFFF00FFFF00FFFF00FF848484ADB5ADFFFFFFFFFFFFFFFFFFFFFFCEFFFFCEFF
                  FF94FFFF94FFCE29CE9400000000FF00FFFF00FFFF00FFFF00FFFF00FF848484
                  FFCE94FFFFFFFFFFFFFFFFFFFFFFCEFFFF94FFFF94FFCE29000000FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF848484ADB5ADFFCE94FFFFFFFFFFFFFFFFCEFF
                  FF94FFCE94CE9429000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  848484848484ADB5ADFFCE94FFCE94FFCE94848484848484FF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF84848484848484848484
                  8484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = BtFindClick
              end
            end
          end
          object PF9: TPanel
            Left = 19
            Top = 103
            Width = 506
            Height = 35
            BevelOuter = bvNone
            TabOrder = 7
            object GroupBox33: TGroupBox
              Left = 107
              Top = 0
              Width = 341
              Height = 35
              Align = alLeft
              Caption = #38599#21592#24320#22987#26102#38388
              TabOrder = 0
              object Label35: TLabel
                Left = 174
                Top = 17
                Width = 12
                Height = 12
                Caption = #21040
              end
              object Label36: TLabel
                Left = 7
                Top = 17
                Width = 12
                Height = 12
                Caption = #20174
              end
              object PF9_dteEnd: TDateTimePicker
                Left = 190
                Top = 13
                Width = 88
                Height = 21
                Date = 41500.000000000000000000
                Format = 'yyyy-MM-dd '
                Time = 41500.000000000000000000
                TabOrder = 0
                OnChange = PF9_dteEndChange
              end
              object PF9_dteBegin: TDateTimePicker
                Left = 21
                Top = 13
                Width = 88
                Height = 21
                Date = 41500.580699502320000000
                Format = 'yyyy-MM-dd'
                Time = 41500.580699502320000000
                DateFormat = dfLong
                TabOrder = 1
                OnChange = PF9_dteBeginChange
              end
              object PF9_dteBeginTime: TDateTimePicker
                Left = 110
                Top = 13
                Width = 60
                Height = 21
                Date = 41500.333333333340000000
                Format = 'HH:mm'
                Time = 41500.333333333340000000
                DateMode = dmUpDown
                Kind = dtkTime
                TabOrder = 2
                OnChange = PF9_dteBeginChange
              end
              object PF9_dteEndTime: TDateTimePicker
                Left = 279
                Top = 13
                Width = 60
                Height = 21
                Date = 41500.333333333340000000
                Format = 'HH:mm'
                Time = 41500.333333333340000000
                DateMode = dmUpDown
                Kind = dtkTime
                TabOrder = 3
                OnChange = PF9_dteEndChange
              end
            end
            object GroupBox34: TGroupBox
              Left = 0
              Top = 0
              Width = 107
              Height = 35
              Align = alLeft
              Caption = #31579#36873#24037#21378
              TabOrder = 1
              object PF9_cbx: TComboBox
                Left = 4
                Top = 11
                Width = 101
                Height = 20
                Style = csDropDownList
                ItemHeight = 12
                TabOrder = 0
                OnChange = PF9_cbxChange
              end
            end
            object Panel21: TPanel
              Left = 448
              Top = 0
              Width = 37
              Height = 35
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 2
              object SpeedButton3: TSpeedButton
                Left = 12
                Top = 8
                Width = 25
                Height = 25
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000
                  00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FF0000CE0094FF0000CE000000FF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000CE0094FF0000
                  FF0000CE000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FF0000CE0094FF0000FF0000CE000000FF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FF0000000000000000000000000000000094FF0000FF0000CE0000
                  00FF00FFFF00FFFF00FFFF00FFFF00FF848484000000CE9400CE9400CE940094
                  63299463290000000000CE000000FF00FFFF00FFFF00FFFF00FFFF00FF848484
                  ADB5ADFFCE29FFCE29FFCE29FFCE29CE9400CE9400946329000000FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF848484FFFF94FFFF94FFFF94FFCE94FFCE29FF
                  CE29CE9400CE9400000000FF00FFFF00FFFF00FFFF00FFFF00FF848484FFCE94
                  FFFF94FFFF94FFFF94FFFF94FFFF94FFCE29FFCE29CE9400946329000000FF00
                  FFFF00FFFF00FFFF00FF848484FFCE94FFFFCEFFFFCEFFFFCEFFFF94FFFF94FF
                  FF94FFCE29CE9400CE9400000000FF00FFFF00FFFF00FFFF00FF848484FFCE94
                  FFFFFFFFFFFFFFFFCEFFFFCEFFFF94FFFF94FFCE94FFCE29CE9400000000FF00
                  FFFF00FFFF00FFFF00FF848484ADB5ADFFFFFFFFFFFFFFFFFFFFFFCEFFFFCEFF
                  FF94FFFF94FFCE29CE9400000000FF00FFFF00FFFF00FFFF00FFFF00FF848484
                  FFCE94FFFFFFFFFFFFFFFFFFFFFFCEFFFF94FFFF94FFCE29000000FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF848484ADB5ADFFCE94FFFFFFFFFFFFFFFFCEFF
                  FF94FFCE94CE9429000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  848484848484ADB5ADFFCE94FFCE94FFCE94848484848484FF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF84848484848484848484
                  8484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = BtFindClick
              end
            end
          end
          object PF10: TPanel
            Left = 12
            Top = 81
            Width = 506
            Height = 35
            BevelOuter = bvNone
            TabOrder = 8
            object GroupBox5: TGroupBox
              Left = 107
              Top = 0
              Width = 341
              Height = 35
              Align = alLeft
              Caption = #38599#21592#24320#22987#26102#38388
              TabOrder = 0
              object Label34: TLabel
                Left = 174
                Top = 17
                Width = 12
                Height = 12
                Caption = #21040
              end
              object Label38: TLabel
                Left = 7
                Top = 17
                Width = 12
                Height = 12
                Caption = #20174
              end
              object PF10_dteEnd: TDateTimePicker
                Left = 190
                Top = 13
                Width = 88
                Height = 21
                Date = 41500.000000000000000000
                Format = 'yyyy-MM-dd '
                Time = 41500.000000000000000000
                TabOrder = 0
                OnChange = PF10_dteEndChange
              end
              object PF10_dteBegin: TDateTimePicker
                Left = 21
                Top = 13
                Width = 88
                Height = 21
                Date = 41500.580699502320000000
                Format = 'yyyy-MM-dd'
                Time = 41500.580699502320000000
                DateFormat = dfLong
                TabOrder = 1
                OnChange = PF10_dteBeginChange
              end
              object PF10_dteBeginTime: TDateTimePicker
                Left = 110
                Top = 13
                Width = 60
                Height = 21
                Date = 41500.333333333340000000
                Format = 'HH:mm'
                Time = 41500.333333333340000000
                DateMode = dmUpDown
                Kind = dtkTime
                TabOrder = 2
                OnChange = PF10_dteBeginChange
              end
              object PF10_dteEndTime: TDateTimePicker
                Left = 279
                Top = 13
                Width = 60
                Height = 21
                Date = 41500.333333333340000000
                Format = 'HH:mm'
                Time = 41500.333333333340000000
                DateMode = dmUpDown
                Kind = dtkTime
                TabOrder = 3
                OnChange = PF10_dteEndChange
              end
            end
            object GroupBox32: TGroupBox
              Left = 0
              Top = 0
              Width = 107
              Height = 35
              Align = alLeft
              Caption = #31579#36873#24037#21378
              TabOrder = 1
              object PF10_cbx: TComboBox
                Left = 4
                Top = 11
                Width = 101
                Height = 20
                Style = csDropDownList
                ItemHeight = 12
                TabOrder = 0
                OnChange = PF10_cbxChange
              end
            end
            object Panel22: TPanel
              Left = 448
              Top = 0
              Width = 37
              Height = 35
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 2
              object SpeedButton5: TSpeedButton
                Left = 12
                Top = 8
                Width = 25
                Height = 25
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000
                  00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FF0000CE0094FF0000CE000000FF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000CE0094FF0000
                  FF0000CE000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FF0000CE0094FF0000FF0000CE000000FF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FF0000000000000000000000000000000094FF0000FF0000CE0000
                  00FF00FFFF00FFFF00FFFF00FFFF00FF848484000000CE9400CE9400CE940094
                  63299463290000000000CE000000FF00FFFF00FFFF00FFFF00FFFF00FF848484
                  ADB5ADFFCE29FFCE29FFCE29FFCE29CE9400CE9400946329000000FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF848484FFFF94FFFF94FFFF94FFCE94FFCE29FF
                  CE29CE9400CE9400000000FF00FFFF00FFFF00FFFF00FFFF00FF848484FFCE94
                  FFFF94FFFF94FFFF94FFFF94FFFF94FFCE29FFCE29CE9400946329000000FF00
                  FFFF00FFFF00FFFF00FF848484FFCE94FFFFCEFFFFCEFFFFCEFFFF94FFFF94FF
                  FF94FFCE29CE9400CE9400000000FF00FFFF00FFFF00FFFF00FF848484FFCE94
                  FFFFFFFFFFFFFFFFCEFFFFCEFFFF94FFFF94FFCE94FFCE29CE9400000000FF00
                  FFFF00FFFF00FFFF00FF848484ADB5ADFFFFFFFFFFFFFFFFFFFFFFCEFFFFCEFF
                  FF94FFFF94FFCE29CE9400000000FF00FFFF00FFFF00FFFF00FFFF00FF848484
                  FFCE94FFFFFFFFFFFFFFFFFFFFFFCEFFFF94FFFF94FFCE29000000FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF848484ADB5ADFFCE94FFFFFFFFFFFFFFFFCEFF
                  FF94FFCE94CE9429000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  848484848484ADB5ADFFCE94FFCE94FFCE94848484848484FF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF84848484848484848484
                  8484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = BtFindClick
              end
            end
          end
          object PF7: TPanel
            Left = 5
            Top = 133
            Width = 505
            Height = 35
            BevelOuter = bvNone
            TabOrder = 9
            object GroupBox37: TGroupBox
              Left = 107
              Top = 0
              Width = 341
              Height = 35
              Align = alLeft
              Caption = #38599#21592#24320#22987#26102#38388
              TabOrder = 0
              object Label39: TLabel
                Left = 174
                Top = 17
                Width = 12
                Height = 12
                Caption = #21040
              end
              object Label40: TLabel
                Left = 7
                Top = 17
                Width = 12
                Height = 12
                Caption = #20174
              end
              object PF7_dteEnd: TDateTimePicker
                Left = 190
                Top = 13
                Width = 88
                Height = 21
                Date = 41500.000000000000000000
                Format = 'yyyy-MM-dd '
                Time = 41500.000000000000000000
                TabOrder = 0
                OnChange = PF7_dteEndChange
              end
              object PF7_dteBegin: TDateTimePicker
                Left = 21
                Top = 13
                Width = 88
                Height = 21
                Date = 41500.580699502320000000
                Format = 'yyyy-MM-dd'
                Time = 41500.580699502320000000
                DateFormat = dfLong
                TabOrder = 1
                OnChange = PF7_dteBeginChange
              end
              object PF7_dteBeginTime: TDateTimePicker
                Left = 110
                Top = 13
                Width = 60
                Height = 21
                Date = 41500.333333333340000000
                Format = 'HH:mm'
                Time = 41500.333333333340000000
                DateMode = dmUpDown
                Kind = dtkTime
                TabOrder = 2
                OnChange = PF7_dteBeginChange
              end
              object PF7_dteEndTime: TDateTimePicker
                Left = 279
                Top = 13
                Width = 60
                Height = 21
                Date = 41500.333333333340000000
                Format = 'HH:mm'
                Time = 41500.333333333340000000
                DateMode = dmUpDown
                Kind = dtkTime
                TabOrder = 3
                OnChange = PF7_dteEndChange
              end
            end
            object GroupBox38: TGroupBox
              Left = 0
              Top = 0
              Width = 107
              Height = 35
              Align = alLeft
              Caption = #31579#36873#24037#21378
              TabOrder = 1
              object PF7_cbx: TComboBox
                Left = 4
                Top = 11
                Width = 101
                Height = 20
                Style = csDropDownList
                ItemHeight = 12
                TabOrder = 0
                OnChange = PF7_cbxChange
              end
            end
            object Panel23: TPanel
              Left = 448
              Top = 0
              Width = 37
              Height = 35
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 2
              object SpeedButton6: TSpeedButton
                Left = 12
                Top = 8
                Width = 25
                Height = 25
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000
                  00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FF0000CE0094FF0000CE000000FF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000CE0094FF0000
                  FF0000CE000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FF0000CE0094FF0000FF0000CE000000FF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FF0000000000000000000000000000000094FF0000FF0000CE0000
                  00FF00FFFF00FFFF00FFFF00FFFF00FF848484000000CE9400CE9400CE940094
                  63299463290000000000CE000000FF00FFFF00FFFF00FFFF00FFFF00FF848484
                  ADB5ADFFCE29FFCE29FFCE29FFCE29CE9400CE9400946329000000FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF848484FFFF94FFFF94FFFF94FFCE94FFCE29FF
                  CE29CE9400CE9400000000FF00FFFF00FFFF00FFFF00FFFF00FF848484FFCE94
                  FFFF94FFFF94FFFF94FFFF94FFFF94FFCE29FFCE29CE9400946329000000FF00
                  FFFF00FFFF00FFFF00FF848484FFCE94FFFFCEFFFFCEFFFFCEFFFF94FFFF94FF
                  FF94FFCE29CE9400CE9400000000FF00FFFF00FFFF00FFFF00FF848484FFCE94
                  FFFFFFFFFFFFFFFFCEFFFFCEFFFF94FFFF94FFCE94FFCE29CE9400000000FF00
                  FFFF00FFFF00FFFF00FF848484ADB5ADFFFFFFFFFFFFFFFFFFFFFFCEFFFFCEFF
                  FF94FFFF94FFCE29CE9400000000FF00FFFF00FFFF00FFFF00FFFF00FF848484
                  FFCE94FFFFFFFFFFFFFFFFFFFFFFCEFFFF94FFFF94FFCE29000000FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF848484ADB5ADFFCE94FFFFFFFFFFFFFFFFCEFF
                  FF94FFCE94CE9429000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  848484848484ADB5ADFFCE94FFCE94FFCE94848484848484FF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF84848484848484848484
                  8484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = BtFindClick
              end
            end
          end
          object PF11: TPanel
            Left = 12
            Top = 170
            Width = 587
            Height = 35
            BevelOuter = bvNone
            TabOrder = 10
            object GroupBox39: TGroupBox
              Left = 107
              Top = 0
              Width = 341
              Height = 35
              Align = alLeft
              Caption = #38599#21592#24320#22987#26102#38388
              TabOrder = 0
              object Label41: TLabel
                Left = 174
                Top = 17
                Width = 12
                Height = 12
                Caption = #21040
              end
              object Label42: TLabel
                Left = 7
                Top = 17
                Width = 12
                Height = 12
                Caption = #20174
              end
              object PF11_dteEnd: TDateTimePicker
                Left = 190
                Top = 13
                Width = 88
                Height = 21
                Date = 41500.000000000000000000
                Format = 'yyyy-MM-dd '
                Time = 41500.000000000000000000
                TabOrder = 0
                OnChange = PF11_dteEndChange
              end
              object PF11_dteBegin: TDateTimePicker
                Left = 21
                Top = 13
                Width = 88
                Height = 21
                Date = 41500.580699502320000000
                Format = 'yyyy-MM-dd'
                Time = 41500.580699502320000000
                DateFormat = dfLong
                TabOrder = 1
                OnChange = PF11_dteBeginChange
              end
              object PF11_dteBeginTime: TDateTimePicker
                Left = 110
                Top = 13
                Width = 60
                Height = 21
                Date = 41500.333333333340000000
                Format = 'HH:mm'
                Time = 41500.333333333340000000
                DateMode = dmUpDown
                Kind = dtkTime
                TabOrder = 2
                OnChange = PF11_dteBeginChange
              end
              object PF11_dteEndTime: TDateTimePicker
                Left = 279
                Top = 13
                Width = 60
                Height = 21
                Date = 41500.333333333340000000
                Format = 'HH:mm'
                Time = 41500.333333333340000000
                DateMode = dmUpDown
                Kind = dtkTime
                TabOrder = 3
                OnChange = PF11_dteEndChange
              end
            end
            object GroupBox40: TGroupBox
              Left = 0
              Top = 0
              Width = 107
              Height = 35
              Align = alLeft
              Caption = #31579#36873#24037#21378
              TabOrder = 1
              object PF11_cbx: TComboBox
                Left = 4
                Top = 11
                Width = 101
                Height = 20
                Style = csDropDownList
                ItemHeight = 12
                TabOrder = 0
                OnChange = PF11_cbxChange
              end
            end
            object Panel24: TPanel
              Left = 522
              Top = 0
              Width = 36
              Height = 35
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 2
              object SpeedButton7: TSpeedButton
                Left = 12
                Top = 8
                Width = 25
                Height = 25
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000
                  00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FF0000CE0094FF0000CE000000FF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000CE0094FF0000
                  FF0000CE000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FF0000CE0094FF0000FF0000CE000000FF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FF0000000000000000000000000000000094FF0000FF0000CE0000
                  00FF00FFFF00FFFF00FFFF00FFFF00FF848484000000CE9400CE9400CE940094
                  63299463290000000000CE000000FF00FFFF00FFFF00FFFF00FFFF00FF848484
                  ADB5ADFFCE29FFCE29FFCE29FFCE29CE9400CE9400946329000000FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF848484FFFF94FFFF94FFFF94FFCE94FFCE29FF
                  CE29CE9400CE9400000000FF00FFFF00FFFF00FFFF00FFFF00FF848484FFCE94
                  FFFF94FFFF94FFFF94FFFF94FFFF94FFCE29FFCE29CE9400946329000000FF00
                  FFFF00FFFF00FFFF00FF848484FFCE94FFFFCEFFFFCEFFFFCEFFFF94FFFF94FF
                  FF94FFCE29CE9400CE9400000000FF00FFFF00FFFF00FFFF00FF848484FFCE94
                  FFFFFFFFFFFFFFFFCEFFFFCEFFFF94FFFF94FFCE94FFCE29CE9400000000FF00
                  FFFF00FFFF00FFFF00FF848484ADB5ADFFFFFFFFFFFFFFFFFFFFFFCEFFFFCEFF
                  FF94FFFF94FFCE29CE9400000000FF00FFFF00FFFF00FFFF00FFFF00FF848484
                  FFCE94FFFFFFFFFFFFFFFFFFFFFFCEFFFF94FFFF94FFCE29000000FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF848484ADB5ADFFCE94FFFFFFFFFFFFFFFFCEFF
                  FF94FFCE94CE9429000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  848484848484ADB5ADFFCE94FFCE94FFCE94848484848484FF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF84848484848484848484
                  8484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = BtFindClick
              end
            end
            object GroupBox41: TGroupBox
              Left = 448
              Top = 0
              Width = 74
              Height = 35
              Align = alLeft
              Caption = #37329#39069
              TabOrder = 3
              object Label43: TLabel
                Left = 46
                Top = 15
                Width = 6
                Height = 12
              end
              object PF11_Edit7: TEdit
                Left = 6
                Top = 14
                Width = 54
                Height = 20
                TabOrder = 0
                Text = '300'
                OnChange = PF11_Edit7Change
                OnKeyPress = Edit4KeyPress
              end
            end
          end
          object PF13: TPanel
            Left = 27
            Top = 111
            Width = 587
            Height = 35
            BevelOuter = bvNone
            TabOrder = 11
            object GroupBox42: TGroupBox
              Left = 107
              Top = 0
              Width = 341
              Height = 35
              Align = alLeft
              Caption = #38599#21592#24320#22987#26102#38388
              TabOrder = 0
              object Label44: TLabel
                Left = 174
                Top = 17
                Width = 12
                Height = 12
                Caption = #21040
              end
              object Label45: TLabel
                Left = 7
                Top = 17
                Width = 12
                Height = 12
                Caption = #20174
              end
              object PF13_dteEnd: TDateTimePicker
                Left = 190
                Top = 13
                Width = 88
                Height = 21
                Date = 41500.000000000000000000
                Format = 'yyyy-MM-dd '
                Time = 41500.000000000000000000
                TabOrder = 0
                OnChange = PF13_dteEndChange
              end
              object PF13_dteBegin: TDateTimePicker
                Left = 21
                Top = 13
                Width = 88
                Height = 21
                Date = 41500.580699502320000000
                Format = 'yyyy-MM-dd'
                Time = 41500.580699502320000000
                DateFormat = dfLong
                TabOrder = 1
                OnChange = PF13_dteBeginChange
              end
              object PF13_dteBeginTime: TDateTimePicker
                Left = 110
                Top = 13
                Width = 60
                Height = 21
                Date = 41500.333333333340000000
                Format = 'HH:mm'
                Time = 41500.333333333340000000
                DateMode = dmUpDown
                Kind = dtkTime
                TabOrder = 2
                OnChange = PF13_dteBeginChange
              end
              object PF13_dteEndTime: TDateTimePicker
                Left = 279
                Top = 13
                Width = 60
                Height = 21
                Date = 41500.333333333340000000
                Format = 'HH:mm'
                Time = 41500.333333333340000000
                DateMode = dmUpDown
                Kind = dtkTime
                TabOrder = 3
                OnChange = PF13_dteEndChange
              end
            end
            object GroupBox43: TGroupBox
              Left = 0
              Top = 0
              Width = 107
              Height = 35
              Align = alLeft
              Caption = #31579#36873#24037#21378
              TabOrder = 1
              object PF13_cbx: TComboBox
                Left = 4
                Top = 11
                Width = 101
                Height = 20
                Style = csDropDownList
                ItemHeight = 12
                TabOrder = 0
                OnChange = PF13_cbxChange
              end
            end
            object Panel25: TPanel
              Left = 522
              Top = 0
              Width = 36
              Height = 35
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 2
              object SpeedButton8: TSpeedButton
                Left = 12
                Top = 8
                Width = 25
                Height = 25
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000
                  00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FF0000CE0094FF0000CE000000FF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000CE0094FF0000
                  FF0000CE000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FF0000CE0094FF0000FF0000CE000000FF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FF0000000000000000000000000000000094FF0000FF0000CE0000
                  00FF00FFFF00FFFF00FFFF00FFFF00FF848484000000CE9400CE9400CE940094
                  63299463290000000000CE000000FF00FFFF00FFFF00FFFF00FFFF00FF848484
                  ADB5ADFFCE29FFCE29FFCE29FFCE29CE9400CE9400946329000000FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF848484FFFF94FFFF94FFFF94FFCE94FFCE29FF
                  CE29CE9400CE9400000000FF00FFFF00FFFF00FFFF00FFFF00FF848484FFCE94
                  FFFF94FFFF94FFFF94FFFF94FFFF94FFCE29FFCE29CE9400946329000000FF00
                  FFFF00FFFF00FFFF00FF848484FFCE94FFFFCEFFFFCEFFFFCEFFFF94FFFF94FF
                  FF94FFCE29CE9400CE9400000000FF00FFFF00FFFF00FFFF00FF848484FFCE94
                  FFFFFFFFFFFFFFFFCEFFFFCEFFFF94FFFF94FFCE94FFCE29CE9400000000FF00
                  FFFF00FFFF00FFFF00FF848484ADB5ADFFFFFFFFFFFFFFFFFFFFFFCEFFFFCEFF
                  FF94FFFF94FFCE29CE9400000000FF00FFFF00FFFF00FFFF00FFFF00FF848484
                  FFCE94FFFFFFFFFFFFFFFFFFFFFFCEFFFF94FFFF94FFCE29000000FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF848484ADB5ADFFCE94FFFFFFFFFFFFFFFFCEFF
                  FF94FFCE94CE9429000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  848484848484ADB5ADFFCE94FFCE94FFCE94848484848484FF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF84848484848484848484
                  8484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = BtFindClick
              end
            end
            object GroupBox44: TGroupBox
              Left = 448
              Top = 0
              Width = 74
              Height = 35
              Align = alLeft
              Caption = #37329#39069
              TabOrder = 3
              object Label46: TLabel
                Left = 46
                Top = 15
                Width = 6
                Height = 12
              end
              object PF13_Edit7: TEdit
                Left = 6
                Top = 14
                Width = 54
                Height = 20
                TabOrder = 0
                Text = '300'
                OnChange = PF13_Edit7Change
                OnKeyPress = Edit4KeyPress
              end
            end
          end
          object PF12: TPanel
            Left = 12
            Top = 155
            Width = 587
            Height = 35
            BevelOuter = bvNone
            TabOrder = 12
            object GroupBox45: TGroupBox
              Left = 107
              Top = 0
              Width = 341
              Height = 35
              Align = alLeft
              Caption = #38599#21592#24320#22987#26102#38388
              TabOrder = 0
              object Label47: TLabel
                Left = 174
                Top = 17
                Width = 12
                Height = 12
                Caption = #21040
              end
              object Label48: TLabel
                Left = 7
                Top = 17
                Width = 12
                Height = 12
                Caption = #20174
              end
              object PF12_dteEnd: TDateTimePicker
                Left = 190
                Top = 13
                Width = 88
                Height = 21
                Date = 41500.000000000000000000
                Format = 'yyyy-MM-dd '
                Time = 41500.000000000000000000
                TabOrder = 0
                OnChange = PF12_dteEndChange
              end
              object PF12_dteBegin: TDateTimePicker
                Left = 21
                Top = 13
                Width = 88
                Height = 21
                Date = 41500.580699502320000000
                Format = 'yyyy-MM-dd'
                Time = 41500.580699502320000000
                DateFormat = dfLong
                TabOrder = 1
                OnChange = PF12_dteBeginChange
              end
              object PF12_dteBeginTime: TDateTimePicker
                Left = 110
                Top = 13
                Width = 60
                Height = 21
                Date = 41500.333333333340000000
                Format = 'HH:mm'
                Time = 41500.333333333340000000
                DateMode = dmUpDown
                Kind = dtkTime
                TabOrder = 2
                OnChange = PF12_dteBeginChange
              end
              object PF12_dteEndTime: TDateTimePicker
                Left = 279
                Top = 13
                Width = 60
                Height = 21
                Date = 41500.333333333340000000
                Format = 'HH:mm'
                Time = 41500.333333333340000000
                DateMode = dmUpDown
                Kind = dtkTime
                TabOrder = 3
                OnChange = PF12_dteEndChange
              end
            end
            object GroupBox46: TGroupBox
              Left = 0
              Top = 0
              Width = 107
              Height = 35
              Align = alLeft
              Caption = #31579#36873#24037#21378
              TabOrder = 1
              object PF12_cbx: TComboBox
                Left = 4
                Top = 11
                Width = 101
                Height = 20
                Style = csDropDownList
                ItemHeight = 12
                TabOrder = 0
                OnChange = PF12_cbxChange
              end
            end
            object Panel27: TPanel
              Left = 522
              Top = 0
              Width = 36
              Height = 35
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 2
              object SpeedButton9: TSpeedButton
                Left = 12
                Top = 8
                Width = 25
                Height = 25
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000
                  00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FF0000CE0094FF0000CE000000FF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000CE0094FF0000
                  FF0000CE000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FF0000CE0094FF0000FF0000CE000000FF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FF0000000000000000000000000000000094FF0000FF0000CE0000
                  00FF00FFFF00FFFF00FFFF00FFFF00FF848484000000CE9400CE9400CE940094
                  63299463290000000000CE000000FF00FFFF00FFFF00FFFF00FFFF00FF848484
                  ADB5ADFFCE29FFCE29FFCE29FFCE29CE9400CE9400946329000000FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF848484FFFF94FFFF94FFFF94FFCE94FFCE29FF
                  CE29CE9400CE9400000000FF00FFFF00FFFF00FFFF00FFFF00FF848484FFCE94
                  FFFF94FFFF94FFFF94FFFF94FFFF94FFCE29FFCE29CE9400946329000000FF00
                  FFFF00FFFF00FFFF00FF848484FFCE94FFFFCEFFFFCEFFFFCEFFFF94FFFF94FF
                  FF94FFCE29CE9400CE9400000000FF00FFFF00FFFF00FFFF00FF848484FFCE94
                  FFFFFFFFFFFFFFFFCEFFFFCEFFFF94FFFF94FFCE94FFCE29CE9400000000FF00
                  FFFF00FFFF00FFFF00FF848484ADB5ADFFFFFFFFFFFFFFFFFFFFFFCEFFFFCEFF
                  FF94FFFF94FFCE29CE9400000000FF00FFFF00FFFF00FFFF00FFFF00FF848484
                  FFCE94FFFFFFFFFFFFFFFFFFFFFFCEFFFF94FFFF94FFCE29000000FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF848484ADB5ADFFCE94FFFFFFFFFFFFFFFFCEFF
                  FF94FFCE94CE9429000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  848484848484ADB5ADFFCE94FFCE94FFCE94848484848484FF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF84848484848484848484
                  8484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = BtFindClick
              end
            end
            object GroupBox47: TGroupBox
              Left = 448
              Top = 0
              Width = 74
              Height = 35
              Align = alLeft
              Caption = #37329#39069
              TabOrder = 3
              object Label49: TLabel
                Left = 46
                Top = 15
                Width = 6
                Height = 12
              end
              object PF12_Edit8: TEdit
                Left = 6
                Top = 14
                Width = 54
                Height = 20
                TabOrder = 0
                Text = '300'
                OnChange = PF12_Edit8Change
                OnKeyPress = Edit4KeyPress
              end
            end
          end
          object PF14: TPanel
            Left = 12
            Top = 170
            Width = 683
            Height = 35
            BevelOuter = bvNone
            TabOrder = 13
            object GroupBox48: TGroupBox
              Left = 107
              Top = 0
              Width = 341
              Height = 35
              Align = alLeft
              Caption = #21457#26009#26085#26399
              TabOrder = 0
              object Label50: TLabel
                Left = 174
                Top = 17
                Width = 12
                Height = 12
                Caption = #21040
              end
              object Label51: TLabel
                Left = 7
                Top = 17
                Width = 12
                Height = 12
                Caption = #20174
              end
              object PF14_dteEnd: TDateTimePicker
                Left = 190
                Top = 13
                Width = 88
                Height = 21
                Date = 41500.000000000000000000
                Format = 'yyyy-MM-dd '
                Time = 41500.000000000000000000
                TabOrder = 0
                OnChange = PF14_dteEndChange
              end
              object PF14_dteBegin: TDateTimePicker
                Left = 21
                Top = 13
                Width = 88
                Height = 21
                Date = 41500.580699502320000000
                Format = 'yyyy-MM-dd'
                Time = 41500.580699502320000000
                DateFormat = dfLong
                TabOrder = 1
                OnChange = PF14_dteBeginChange
              end
              object PF14_dteBeginTime: TDateTimePicker
                Left = 110
                Top = 13
                Width = 60
                Height = 21
                Date = 41500.333333333340000000
                Format = 'HH:mm'
                Time = 41500.333333333340000000
                DateMode = dmUpDown
                Kind = dtkTime
                TabOrder = 2
                OnChange = PF14_dteBeginChange
              end
              object PF14_dteEndTime: TDateTimePicker
                Left = 279
                Top = 13
                Width = 60
                Height = 21
                Date = 41500.333333333340000000
                Format = 'HH:mm'
                Time = 41500.333333333340000000
                DateMode = dmUpDown
                Kind = dtkTime
                TabOrder = 3
                OnChange = PF14_dteEndChange
              end
            end
            object GroupBox49: TGroupBox
              Left = 0
              Top = 0
              Width = 107
              Height = 35
              Align = alLeft
              Caption = #31579#36873#24037#21378
              TabOrder = 1
              object PF14_cbx: TComboBox
                Left = 4
                Top = 11
                Width = 101
                Height = 20
                Style = csDropDownList
                ItemHeight = 12
                TabOrder = 0
                OnChange = PF14_cbxChange
              end
            end
            object Panel26: TPanel
              Left = 595
              Top = 0
              Width = 37
              Height = 35
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 2
              object SpeedButton10: TSpeedButton
                Left = 12
                Top = 8
                Width = 25
                Height = 25
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000
                  00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FF0000CE0094FF0000CE000000FF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000CE0094FF0000
                  FF0000CE000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FF0000CE0094FF0000FF0000CE000000FF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FF0000000000000000000000000000000094FF0000FF0000CE0000
                  00FF00FFFF00FFFF00FFFF00FFFF00FF848484000000CE9400CE9400CE940094
                  63299463290000000000CE000000FF00FFFF00FFFF00FFFF00FFFF00FF848484
                  ADB5ADFFCE29FFCE29FFCE29FFCE29CE9400CE9400946329000000FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF848484FFFF94FFFF94FFFF94FFCE94FFCE29FF
                  CE29CE9400CE9400000000FF00FFFF00FFFF00FFFF00FFFF00FF848484FFCE94
                  FFFF94FFFF94FFFF94FFFF94FFFF94FFCE29FFCE29CE9400946329000000FF00
                  FFFF00FFFF00FFFF00FF848484FFCE94FFFFCEFFFFCEFFFFCEFFFF94FFFF94FF
                  FF94FFCE29CE9400CE9400000000FF00FFFF00FFFF00FFFF00FF848484FFCE94
                  FFFFFFFFFFFFFFFFCEFFFFCEFFFF94FFFF94FFCE94FFCE29CE9400000000FF00
                  FFFF00FFFF00FFFF00FF848484ADB5ADFFFFFFFFFFFFFFFFFFFFFFCEFFFFCEFF
                  FF94FFFF94FFCE29CE9400000000FF00FFFF00FFFF00FFFF00FFFF00FF848484
                  FFCE94FFFFFFFFFFFFFFFFFFFFFFCEFFFF94FFFF94FFCE29000000FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF848484ADB5ADFFCE94FFFFFFFFFFFFFFFFCEFF
                  FF94FFCE94CE9429000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  848484848484ADB5ADFFCE94FFCE94FFCE94848484848484FF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF84848484848484848484
                  8484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = BtFindClick
              end
            end
            object GroupBox50: TGroupBox
              Left = 448
              Top = 0
              Width = 74
              Height = 35
              Align = alLeft
              Caption = #21333#20215
              TabOrder = 3
              object Label52: TLabel
                Left = 46
                Top = 15
                Width = 6
                Height = 12
              end
              object P14_Edit7: TEdit
                Left = 6
                Top = 14
                Width = 54
                Height = 20
                TabOrder = 0
                Text = '300'
                OnChange = P14_Edit7Change
                OnKeyPress = Edit4KeyPress
              end
            end
            object GroupBox51: TGroupBox
              Left = 522
              Top = 0
              Width = 73
              Height = 35
              Align = alLeft
              Caption = #38388#38548#26102#38388
              TabOrder = 4
              object Label53: TLabel
                Left = 46
                Top = 15
                Width = 24
                Height = 12
                Caption = #23567#26102
              end
              object PF14_Edit8: TEdit
                Left = 6
                Top = 13
                Width = 36
                Height = 20
                TabOrder = 0
                OnChange = PF14_Edit8Change
                OnKeyPress = Edit1KeyPress
              end
            end
          end
          object PF15: TPanel
            Left = 499
            Top = 0
            Width = 683
            Height = 35
            BevelOuter = bvNone
            TabOrder = 14
            object GroupBox52: TGroupBox
              Left = 107
              Top = 0
              Width = 341
              Height = 35
              Align = alLeft
              Caption = #30003#35831#26085#26399
              TabOrder = 0
              object Label54: TLabel
                Left = 174
                Top = 17
                Width = 12
                Height = 12
                Caption = #21040
              end
              object Label55: TLabel
                Left = 7
                Top = 17
                Width = 12
                Height = 12
                Caption = #20174
              end
              object PF15_dteEnd: TDateTimePicker
                Left = 190
                Top = 13
                Width = 88
                Height = 21
                Date = 41500.000000000000000000
                Format = 'yyyy-MM-dd '
                Time = 41500.000000000000000000
                TabOrder = 0
                OnChange = PF15_dteEndChange
              end
              object PF15_dteBegin: TDateTimePicker
                Left = 21
                Top = 13
                Width = 88
                Height = 21
                Date = 41500.580699502320000000
                Format = 'yyyy-MM-dd'
                Time = 41500.580699502320000000
                DateFormat = dfLong
                TabOrder = 1
                OnChange = PF15_dteBeginChange
              end
              object PF15_dteBeginTime: TDateTimePicker
                Left = 110
                Top = 13
                Width = 60
                Height = 21
                Date = 41500.333333333340000000
                Format = 'HH:mm'
                Time = 41500.333333333340000000
                DateMode = dmUpDown
                Kind = dtkTime
                TabOrder = 2
                OnChange = PF15_dteBeginChange
              end
              object PF15_dteEndTime: TDateTimePicker
                Left = 279
                Top = 13
                Width = 60
                Height = 21
                Date = 41500.333333333340000000
                Format = 'HH:mm'
                Time = 41500.333333333340000000
                DateMode = dmUpDown
                Kind = dtkTime
                TabOrder = 3
                OnChange = PF15_dteEndChange
              end
            end
            object GroupBox53: TGroupBox
              Left = 0
              Top = 0
              Width = 107
              Height = 35
              Align = alLeft
              Caption = #31579#36873#24037#21378
              TabOrder = 1
              object PF15_cbx: TComboBox
                Left = 4
                Top = 11
                Width = 101
                Height = 20
                Style = csDropDownList
                ItemHeight = 12
                TabOrder = 0
                OnChange = PF15_cbxChange
              end
            end
            object Panel28: TPanel
              Left = 595
              Top = 0
              Width = 37
              Height = 35
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 2
              object SpeedButton11: TSpeedButton
                Left = 12
                Top = 8
                Width = 25
                Height = 25
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000
                  00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FF0000CE0094FF0000CE000000FF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000CE0094FF0000
                  FF0000CE000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FF0000CE0094FF0000FF0000CE000000FF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FF0000000000000000000000000000000094FF0000FF0000CE0000
                  00FF00FFFF00FFFF00FFFF00FFFF00FF848484000000CE9400CE9400CE940094
                  63299463290000000000CE000000FF00FFFF00FFFF00FFFF00FFFF00FF848484
                  ADB5ADFFCE29FFCE29FFCE29FFCE29CE9400CE9400946329000000FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF848484FFFF94FFFF94FFFF94FFCE94FFCE29FF
                  CE29CE9400CE9400000000FF00FFFF00FFFF00FFFF00FFFF00FF848484FFCE94
                  FFFF94FFFF94FFFF94FFFF94FFFF94FFCE29FFCE29CE9400946329000000FF00
                  FFFF00FFFF00FFFF00FF848484FFCE94FFFFCEFFFFCEFFFFCEFFFF94FFFF94FF
                  FF94FFCE29CE9400CE9400000000FF00FFFF00FFFF00FFFF00FF848484FFCE94
                  FFFFFFFFFFFFFFFFCEFFFFCEFFFF94FFFF94FFCE94FFCE29CE9400000000FF00
                  FFFF00FFFF00FFFF00FF848484ADB5ADFFFFFFFFFFFFFFFFFFFFFFCEFFFFCEFF
                  FF94FFFF94FFCE29CE9400000000FF00FFFF00FFFF00FFFF00FFFF00FF848484
                  FFCE94FFFFFFFFFFFFFFFFFFFFFFCEFFFF94FFFF94FFCE29000000FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF848484ADB5ADFFCE94FFFFFFFFFFFFFFFFCEFF
                  FF94FFCE94CE9429000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  848484848484ADB5ADFFCE94FFCE94FFCE94848484848484FF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF84848484848484848484
                  8484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = BtFindClick
              end
            end
            object GroupBox54: TGroupBox
              Left = 448
              Top = 0
              Width = 74
              Height = 35
              Align = alLeft
              Caption = #21333#20215
              TabOrder = 3
              object Label56: TLabel
                Left = 46
                Top = 15
                Width = 6
                Height = 12
              end
              object PF15_Edit7: TEdit
                Left = 6
                Top = 14
                Width = 54
                Height = 20
                TabOrder = 0
                Text = '300'
                OnChange = PF15_Edit7Change
                OnKeyPress = Edit4KeyPress
              end
            end
            object GroupBox55: TGroupBox
              Left = 522
              Top = 0
              Width = 73
              Height = 35
              Align = alLeft
              Caption = #38388#38548#26102#38388
              TabOrder = 4
              object Label57: TLabel
                Left = 46
                Top = 15
                Width = 24
                Height = 12
                Caption = #23567#26102
              end
              object PF15_Edit8: TEdit
                Left = 6
                Top = 13
                Width = 36
                Height = 20
                TabOrder = 0
                OnChange = PF15_Edit8Change
                OnKeyPress = Edit1KeyPress
              end
            end
          end
          object PF16: TPanel
            Left = 12
            Top = 44
            Width = 462
            Height = 35
            BevelOuter = bvNone
            TabOrder = 15
            object GroupBox57: TGroupBox
              Left = 0
              Top = 0
              Width = 107
              Height = 35
              Align = alLeft
              Caption = #31579#36873#24037#21378
              TabOrder = 0
              object PF16_cbx: TComboBox
                Left = 4
                Top = 11
                Width = 101
                Height = 20
                Style = csDropDownList
                ItemHeight = 12
                TabOrder = 0
                OnChange = PF16_cbxChange
              end
            end
            object Panel29: TPanel
              Left = 400
              Top = 0
              Width = 37
              Height = 35
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 1
              object SpeedButton12: TSpeedButton
                Left = 12
                Top = 8
                Width = 25
                Height = 25
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000
                  00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FF0000CE0094FF0000CE000000FF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000CE0094FF0000
                  FF0000CE000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FF0000CE0094FF0000FF0000CE000000FF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FF0000000000000000000000000000000094FF0000FF0000CE0000
                  00FF00FFFF00FFFF00FFFF00FFFF00FF848484000000CE9400CE9400CE940094
                  63299463290000000000CE000000FF00FFFF00FFFF00FFFF00FFFF00FF848484
                  ADB5ADFFCE29FFCE29FFCE29FFCE29CE9400CE9400946329000000FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF848484FFFF94FFFF94FFFF94FFCE94FFCE29FF
                  CE29CE9400CE9400000000FF00FFFF00FFFF00FFFF00FFFF00FF848484FFCE94
                  FFFF94FFFF94FFFF94FFFF94FFFF94FFCE29FFCE29CE9400946329000000FF00
                  FFFF00FFFF00FFFF00FF848484FFCE94FFFFCEFFFFCEFFFFCEFFFF94FFFF94FF
                  FF94FFCE29CE9400CE9400000000FF00FFFF00FFFF00FFFF00FF848484FFCE94
                  FFFFFFFFFFFFFFFFCEFFFFCEFFFF94FFFF94FFCE94FFCE29CE9400000000FF00
                  FFFF00FFFF00FFFF00FF848484ADB5ADFFFFFFFFFFFFFFFFFFFFFFCEFFFFCEFF
                  FF94FFFF94FFCE29CE9400000000FF00FFFF00FFFF00FFFF00FFFF00FF848484
                  FFCE94FFFFFFFFFFFFFFFFFFFFFFCEFFFF94FFFF94FFCE29000000FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF848484ADB5ADFFCE94FFFFFFFFFFFFFFFFCEFF
                  FF94FFCE94CE9429000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  848484848484ADB5ADFFCE94FFCE94FFCE94848484848484FF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF84848484848484848484
                  8484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = BtFindClick
              end
            end
            object GroupBox7: TGroupBox
              Left = 107
              Top = 0
              Width = 293
              Height = 35
              Align = alLeft
              Caption = #38599#21592#24037#20316#26376#20221
              TabOrder = 2
              object Label6: TLabel
                Left = 6
                Top = 17
                Width = 12
                Height = 12
                Caption = #20174
              end
              object Label7: TLabel
                Left = 109
                Top = 17
                Width = 12
                Height = 12
                Caption = #21040
              end
              object Label8: TLabel
                Left = 212
                Top = 17
                Width = 48
                Height = 12
                Caption = #26631#20934'('#22825')'
              end
              object PF16_dteBegin: TDateTimePicker
                Left = 19
                Top = 14
                Width = 88
                Height = 21
                Date = 41558.484247685180000000
                Time = 41558.484247685180000000
                TabOrder = 0
                OnCloseUp = PF16_dteBeginCloseUp
                OnChange = PF16_dteBeginChange
              end
              object PF16_Edit5: TEdit
                Left = 259
                Top = 14
                Width = 23
                Height = 20
                TabOrder = 1
                Text = '26'
                OnKeyPress = PF16_Edit5KeyPress
              end
              object PF16_dteEnd: TDateTimePicker
                Left = 122
                Top = 13
                Width = 88
                Height = 21
                Date = 41558.474678993060000000
                Time = 41558.474678993060000000
                TabOrder = 2
                OnCloseUp = PF16_dteEndCloseUp
                OnChange = PF16_dteEndChange
              end
            end
          end
          object PF17: TPanel
            Left = 27
            Top = 162
            Width = 351
            Height = 36
            BevelOuter = bvNone
            TabOrder = 16
            object Panel30: TPanel
              Left = 296
              Top = 0
              Width = 37
              Height = 36
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 0
              object SpeedButton13: TSpeedButton
                Left = 12
                Top = 8
                Width = 25
                Height = 25
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000
                  00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FF0000CE0094FF0000CE000000FF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000CE0094FF0000
                  FF0000CE000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FF0000CE0094FF0000FF0000CE000000FF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FF0000000000000000000000000000000094FF0000FF0000CE0000
                  00FF00FFFF00FFFF00FFFF00FFFF00FF848484000000CE9400CE9400CE940094
                  63299463290000000000CE000000FF00FFFF00FFFF00FFFF00FFFF00FF848484
                  ADB5ADFFCE29FFCE29FFCE29FFCE29CE9400CE9400946329000000FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF848484FFFF94FFFF94FFFF94FFCE94FFCE29FF
                  CE29CE9400CE9400000000FF00FFFF00FFFF00FFFF00FFFF00FF848484FFCE94
                  FFFF94FFFF94FFFF94FFFF94FFFF94FFCE29FFCE29CE9400946329000000FF00
                  FFFF00FFFF00FFFF00FF848484FFCE94FFFFCEFFFFCEFFFFCEFFFF94FFFF94FF
                  FF94FFCE29CE9400CE9400000000FF00FFFF00FFFF00FFFF00FF848484FFCE94
                  FFFFFFFFFFFFFFFFCEFFFFCEFFFF94FFFF94FFCE94FFCE29CE9400000000FF00
                  FFFF00FFFF00FFFF00FF848484ADB5ADFFFFFFFFFFFFFFFFFFFFFFCEFFFFCEFF
                  FF94FFFF94FFCE29CE9400000000FF00FFFF00FFFF00FFFF00FFFF00FF848484
                  FFCE94FFFFFFFFFFFFFFFFFFFFFFCEFFFF94FFFF94FFCE29000000FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF848484ADB5ADFFCE94FFFFFFFFFFFFFFFFCEFF
                  FF94FFCE94CE9429000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  848484848484ADB5ADFFCE94FFCE94FFCE94848484848484FF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF84848484848484848484
                  8484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = BtFindClick
              end
            end
            object GroupBox56: TGroupBox
              Left = 0
              Top = 0
              Width = 296
              Height = 36
              Align = alLeft
              Caption = #38599#21592#24037#20316#26376#20221
              TabOrder = 1
              object Label58: TLabel
                Left = 6
                Top = 17
                Width = 12
                Height = 12
                Caption = #20174
              end
              object Label59: TLabel
                Left = 109
                Top = 17
                Width = 12
                Height = 12
                Caption = #21040
              end
              object Label60: TLabel
                Left = 212
                Top = 17
                Width = 48
                Height = 12
                Caption = #26631#20934'('#22825')'
              end
              object PF17_dteBegin: TDateTimePicker
                Left = 19
                Top = 14
                Width = 88
                Height = 21
                Date = 41558.484247685180000000
                Time = 41558.484247685180000000
                TabOrder = 0
                OnCloseUp = PF17_dteBeginChange
                OnChange = PF17_dteBeginChange
              end
              object PF17_Edit7: TEdit
                Left = 259
                Top = 14
                Width = 23
                Height = 20
                TabOrder = 1
                Text = '26'
                OnKeyPress = PF16_Edit5KeyPress
              end
              object PF17_dteEnd: TDateTimePicker
                Left = 122
                Top = 13
                Width = 88
                Height = 21
                Date = 41558.474678993060000000
                Time = 41558.474678993060000000
                TabOrder = 2
                OnCloseUp = PF17_dteEndChange
                OnChange = PF17_dteEndChange
              end
            end
          end
          object PF18: TPanel
            Left = 19
            Top = 7
            Width = 506
            Height = 35
            BevelOuter = bvNone
            TabOrder = 17
            object GroupBox58: TGroupBox
              Left = 107
              Top = 0
              Width = 341
              Height = 35
              Align = alLeft
              Caption = #23436#24037#26085#26399
              TabOrder = 0
              object Label9: TLabel
                Left = 174
                Top = 17
                Width = 12
                Height = 12
                Caption = #21040
              end
              object Label61: TLabel
                Left = 7
                Top = 17
                Width = 12
                Height = 12
                Caption = #20174
              end
              object PF18_dteEnd: TDateTimePicker
                Left = 190
                Top = 13
                Width = 88
                Height = 21
                Date = 41500.000000000000000000
                Format = 'yyyy-MM-dd '
                Time = 41500.000000000000000000
                TabOrder = 0
                OnChange = PF18_dteEndChange
              end
              object PF18_dteBegin: TDateTimePicker
                Left = 21
                Top = 13
                Width = 88
                Height = 21
                Date = 41500.580699502320000000
                Format = 'yyyy-MM-dd'
                Time = 41500.580699502320000000
                DateFormat = dfLong
                TabOrder = 1
                OnChange = PF18_dteBeginChange
              end
              object PF18_dteBeginTime: TDateTimePicker
                Left = 110
                Top = 13
                Width = 60
                Height = 21
                Date = 41500.333333333340000000
                Format = 'HH:mm'
                Time = 41500.333333333340000000
                DateMode = dmUpDown
                Kind = dtkTime
                TabOrder = 2
                OnChange = PF18_dteBeginChange
              end
              object PF18_dteEndTime: TDateTimePicker
                Left = 279
                Top = 13
                Width = 60
                Height = 21
                Date = 41500.333333333340000000
                Format = 'HH:mm'
                Time = 41500.333333333340000000
                DateMode = dmUpDown
                Kind = dtkTime
                TabOrder = 3
                OnChange = PF18_dteEndChange
              end
            end
            object GroupBox59: TGroupBox
              Left = 0
              Top = 0
              Width = 107
              Height = 35
              Align = alLeft
              Caption = #31579#36873#24037#21378
              TabOrder = 1
              object PF18_cbx: TComboBox
                Left = 4
                Top = 11
                Width = 101
                Height = 20
                Style = csDropDownList
                ItemHeight = 12
                TabOrder = 0
                OnChange = PF18_cbxChange
              end
            end
            object Panel31: TPanel
              Left = 448
              Top = 0
              Width = 37
              Height = 35
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 2
              object SpeedButton14: TSpeedButton
                Left = 12
                Top = 8
                Width = 25
                Height = 25
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000
                  00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FF0000CE0094FF0000CE000000FF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000CE0094FF0000
                  FF0000CE000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FF0000CE0094FF0000FF0000CE000000FF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FF0000000000000000000000000000000094FF0000FF0000CE0000
                  00FF00FFFF00FFFF00FFFF00FFFF00FF848484000000CE9400CE9400CE940094
                  63299463290000000000CE000000FF00FFFF00FFFF00FFFF00FFFF00FF848484
                  ADB5ADFFCE29FFCE29FFCE29FFCE29CE9400CE9400946329000000FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF848484FFFF94FFFF94FFFF94FFCE94FFCE29FF
                  CE29CE9400CE9400000000FF00FFFF00FFFF00FFFF00FFFF00FF848484FFCE94
                  FFFF94FFFF94FFFF94FFFF94FFFF94FFCE29FFCE29CE9400946329000000FF00
                  FFFF00FFFF00FFFF00FF848484FFCE94FFFFCEFFFFCEFFFFCEFFFF94FFFF94FF
                  FF94FFCE29CE9400CE9400000000FF00FFFF00FFFF00FFFF00FF848484FFCE94
                  FFFFFFFFFFFFFFFFCEFFFFCEFFFF94FFFF94FFCE94FFCE29CE9400000000FF00
                  FFFF00FFFF00FFFF00FF848484ADB5ADFFFFFFFFFFFFFFFFFFFFFFCEFFFFCEFF
                  FF94FFFF94FFCE29CE9400000000FF00FFFF00FFFF00FFFF00FFFF00FF848484
                  FFCE94FFFFFFFFFFFFFFFFFFFFFFCEFFFF94FFFF94FFCE29000000FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF848484ADB5ADFFCE94FFFFFFFFFFFFFFFFCEFF
                  FF94FFCE94CE9429000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  848484848484ADB5ADFFCE94FFCE94FFCE94848484848484FF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF84848484848484848484
                  8484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = BtFindClick
              end
            end
          end
        end
        inherited Panel6: TPanel
          Height = 394
        end
        inherited cxPageControl2: TcxPageControl
          Width = 989
          Height = 394
          ActivePage = cxTabSheet2
          OnChange = cxPageControl2Change
          ClientRectBottom = 394
          ClientRectRight = 989
          inherited cxTabSheet0: TcxTabSheet
            Caption = #37325#22797#25925#38556#21517#31216#32500#20462
            inherited ToolBar2: TToolBar
              Height = 371
            end
            inherited DghMain: TDBGridEh
              Width = 989
              Height = 371
              Columns = <
                item
                  EditButtons = <>
                  FieldName = #19978#19968#27425#21333#21495
                  Footers = <>
                  Width = 93
                end
                item
                  EditButtons = <>
                  FieldName = #19978#19968#27425#26085#26399
                  Footers = <>
                  Width = 139
                end
                item
                  EditButtons = <>
                  FieldName = #25925#38556#26085#26399
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = #38599#21592
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = #35774#22791#21517#31216
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = #25925#38556#32791#26102
                  Footers = <>
                  Width = 78
                end
                item
                  EditButtons = <>
                  FieldName = #23454#38469#32500#20462#26102#38388
                  Footers = <>
                  Width = 80
                end
                item
                  EditButtons = <>
                  FieldName = #25925#38556#21517#31216
                  Footers = <>
                  Width = 128
                end
                item
                  EditButtons = <>
                  FieldName = #30003#35831#32534#21495
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = #24433#21709#31243#24230
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = #29366#24577
                  Footers = <>
                  Width = 42
                end
                item
                  EditButtons = <>
                  FieldName = #37096#38376#21517#31216
                  Footers = <>
                  Width = 85
                end
                item
                  EditButtons = <>
                  FieldName = #30003#25253#20154
                  Footers = <>
                  Width = 57
                end
                item
                  EditButtons = <>
                  FieldName = #24037#21378
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = #21463#29702#20154
                  Footers = <>
                  Width = 62
                end
                item
                  EditButtons = <>
                  FieldName = #23436#24037#20154#21592
                  Footers = <>
                  Width = 74
                end
                item
                  EditButtons = <>
                  FieldName = #35774#22791#32423#21035
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = #25552#20132#26085#26399
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = #32852#32476#20154
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = #32852#32476#20154#30005#35805
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = #25925#38556#35828#26126
                  Footers = <>
                  Width = 300
                end
                item
                  EditButtons = <>
                  FieldName = #21463#29702#26085#26399
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = #32500#20462#35760#24405
                  Footers = <>
                  Width = 200
                end
                item
                  EditButtons = <>
                  FieldName = #23436#24037#26085#26399
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = #39564#25910#35780#20215
                  Footers = <>
                  Width = 200
                end
                item
                  EditButtons = <>
                  FieldName = #24322#24120#31867#21035
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = #26631#20934#32500#20462#26102#38388
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = #36798#25104#29575
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = #25237#35785#20869#23481
                  Footers = <>
                  Width = 200
                end
                item
                  EditButtons = <>
                  FieldName = #36131#20219#23567#32452
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = #35774#22791#20195#30721
                  Footers = <>
                  Width = 122
                end>
            end
          end
          inherited cxTabSheet1: TcxTabSheet
            Caption = #37325#22797#35774#22791#21517#31216#32500#20462
            OnEnter = cxTabSheet2Enter
            object DghMain1: TDBGridEh
              Left = 0
              Top = 0
              Width = 989
              Height = 379
              Align = alClient
              DataSource = DataSource1
              EditActions = [geaCopyEh, geaSelectAllEh]
              FooterColor = clWindow
              FooterFont.Charset = GB2312_CHARSET
              FooterFont.Color = clWindowText
              FooterFont.Height = -12
              FooterFont.Name = #23435#20307
              FooterFont.Style = []
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
              PopupMenu = PopupMenu1
              SortLocal = True
              TabOrder = 0
              TitleFont.Charset = GB2312_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -12
              TitleFont.Name = #23435#20307
              TitleFont.Style = []
              OnDrawColumnCell = DghMainDrawColumnCell
              OnEnter = DghMain1Enter
              OnGetCellParams = DghMainGetCellParams
              OnKeyDown = DghMainKeyDown
              OnKeyPress = DghMainKeyPress
              OnTitleClick = DghMainTitleClick
              Columns = <
                item
                  EditButtons = <>
                  FieldName = #19978#19968#27425#21333#21495
                  Footers = <>
                  Width = 87
                end
                item
                  EditButtons = <>
                  FieldName = #19978#19968#27425#26085#26399
                  Footers = <>
                  Width = 103
                end
                item
                  EditButtons = <>
                  FieldName = #25925#38556#26085#26399
                  Footers = <>
                  Width = 104
                end
                item
                  EditButtons = <>
                  FieldName = #38599#21592
                  Footers = <>
                  Width = 276
                end
                item
                  EditButtons = <>
                  FieldName = #35774#22791#21517#31216
                  Footers = <>
                  Width = 170
                end
                item
                  EditButtons = <>
                  FieldName = #25925#38556#32791#26102
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = #23454#38469#32500#20462#26102#38388
                  Footers = <>
                  Width = 54
                end
                item
                  EditButtons = <>
                  FieldName = #25925#38556#21517#31216
                  Footers = <>
                  Width = 138
                end
                item
                  EditButtons = <>
                  FieldName = #30003#35831#32534#21495
                  Footers = <>
                  Width = 87
                end
                item
                  EditButtons = <>
                  FieldName = #24433#21709#31243#24230
                  Footers = <>
                  Width = 48
                end
                item
                  EditButtons = <>
                  FieldName = #29366#24577
                  Footers = <>
                  Width = 48
                end
                item
                  EditButtons = <>
                  FieldName = #37096#38376#21517#31216
                  Footers = <>
                  Width = 170
                end
                item
                  EditButtons = <>
                  FieldName = #30003#25253#20154
                  Footers = <>
                  Width = 92
                end
                item
                  EditButtons = <>
                  FieldName = #24037#21378
                  Footers = <>
                  Width = 59
                end
                item
                  EditButtons = <>
                  FieldName = #21463#29702#20154
                  Footers = <>
                  Width = 92
                end
                item
                  EditButtons = <>
                  FieldName = #23436#24037#20154#21592
                  Footers = <>
                  Width = 93
                end
                item
                  EditButtons = <>
                  FieldName = #35774#22791#32423#21035
                  Footers = <>
                  Width = 59
                end
                item
                  EditButtons = <>
                  FieldName = #25552#20132#26085#26399
                  Footers = <>
                  Width = 103
                end
                item
                  EditButtons = <>
                  FieldName = #32852#32476#20154
                  Footers = <>
                  Width = 59
                end
                item
                  EditButtons = <>
                  FieldName = #32852#32476#20154#30005#35805
                  Footers = <>
                  Width = 87
                end
                item
                  EditButtons = <>
                  FieldName = #25925#38556#35828#26126
                  Footers = <>
                  Width = 277
                end
                item
                  EditButtons = <>
                  FieldName = #21463#29702#26085#26399
                  Footers = <>
                  Width = 103
                end
                item
                  EditButtons = <>
                  FieldName = #32500#20462#35760#24405
                  Footers = <>
                  Width = 277
                end
                item
                  EditButtons = <>
                  FieldName = #23436#24037#26085#26399
                  Footers = <>
                  Width = 104
                end
                item
                  EditButtons = <>
                  FieldName = #39564#25910#35780#20215
                  Footers = <>
                  Width = 276
                end
                item
                  EditButtons = <>
                  FieldName = #24322#24120#31867#21035
                  Footers = <>
                  Width = 170
                end
                item
                  EditButtons = <>
                  FieldName = #26631#20934#32500#20462#26102#38388
                  Footers = <>
                  Width = 59
                end
                item
                  EditButtons = <>
                  FieldName = #36798#25104#29575
                  Footers = <>
                  Width = 93
                end
                item
                  EditButtons = <>
                  FieldName = #25237#35785#20869#23481
                  Footers = <>
                  Width = 277
                end
                item
                  EditButtons = <>
                  FieldName = #36131#20219#23567#32452
                  Footers = <>
                  Width = 114
                end
                item
                  EditButtons = <>
                  FieldName = #35774#22791#20195#30721
                  Footers = <>
                  Width = 115
                end>
            end
          end
          object cxTabSheet2: TcxTabSheet
            Hint = #29983#20135#20572#39039
            Caption = #36229#38271#25925#38556#20572#26426#26102#38388
            ImageIndex = 2
            ParentShowHint = False
            ShowHint = True
            object DghMain2: TDBGridEh
              Left = 0
              Top = 0
              Width = 989
              Height = 371
              Align = alClient
              DataSource = DataSource2
              EditActions = [geaCopyEh, geaSelectAllEh]
              FooterColor = clWindow
              FooterFont.Charset = GB2312_CHARSET
              FooterFont.Color = clWindowText
              FooterFont.Height = -12
              FooterFont.Name = #23435#20307
              FooterFont.Style = []
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
              PopupMenu = PopupMenu1
              SortLocal = True
              TabOrder = 0
              TitleFont.Charset = GB2312_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -12
              TitleFont.Name = #23435#20307
              TitleFont.Style = []
              OnDrawColumnCell = DghMainDrawColumnCell
              OnEnter = DghMain2Enter
              OnGetCellParams = DghMainGetCellParams
              OnKeyDown = DghMainKeyDown
              OnKeyPress = DghMainKeyPress
              OnTitleClick = DghMainTitleClick
              Columns = <
                item
                  EditButtons = <>
                  FieldName = #30003#35831#32534#21495
                  Footers = <>
                  Width = 81
                end
                item
                  EditButtons = <>
                  FieldName = #38599#21592
                  Footers = <>
                  Width = 277
                end
                item
                  EditButtons = <>
                  FieldName = #35774#22791#21517#31216
                  Footers = <>
                  Width = 172
                end
                item
                  EditButtons = <>
                  FieldName = #25925#38556#32791#26102
                  Footers = <>
                  Width = 73
                end
                item
                  EditButtons = <>
                  FieldName = #23454#38469#32500#20462#26102#38388
                  Footers = <>
                  Width = 69
                end
                item
                  EditButtons = <>
                  FieldName = #29366#24577
                  Footers = <>
                  Width = 42
                end
                item
                  EditButtons = <>
                  FieldName = #37096#38376#21517#31216
                  Footers = <>
                  Width = 80
                end
                item
                  EditButtons = <>
                  FieldName = #24037#21378
                  Footers = <>
                  Width = 59
                end
                item
                  EditButtons = <>
                  FieldName = #35774#22791#32423#21035
                  Footers = <>
                  Width = 54
                end
                item
                  EditButtons = <>
                  FieldName = #24433#21709#31243#24230
                  Footers = <>
                  Width = 48
                end
                item
                  EditButtons = <>
                  FieldName = #25552#20132#26085#26399
                  Footers = <>
                  Width = 104
                end
                item
                  EditButtons = <>
                  FieldName = #30003#25253#20154
                  Footers = <>
                  Width = 80
                end
                item
                  EditButtons = <>
                  FieldName = #32852#32476#20154
                  Footers = <>
                  Width = 59
                end
                item
                  EditButtons = <>
                  FieldName = #32852#32476#20154#30005#35805
                  Footers = <>
                  Width = 87
                end
                item
                  EditButtons = <>
                  FieldName = #25925#38556#26085#26399
                  Footers = <>
                  Width = 103
                end
                item
                  EditButtons = <>
                  FieldName = #25925#38556#35828#26126
                  Footers = <>
                  Width = 194
                end
                item
                  EditButtons = <>
                  FieldName = #21463#29702#26085#26399
                  Footers = <>
                  Width = 104
                end
                item
                  EditButtons = <>
                  FieldName = #21463#29702#20154
                  Footers = <>
                  Width = 92
                end
                item
                  EditButtons = <>
                  FieldName = #23436#24037#26085#26399
                  Footers = <>
                  Width = 103
                end
                item
                  EditButtons = <>
                  FieldName = #23436#24037#20154#21592
                  Footers = <>
                  Width = 93
                end
                item
                  EditButtons = <>
                  FieldName = #32500#20462#35760#24405
                  Footers = <>
                  Width = 276
                end
                item
                  EditButtons = <>
                  FieldName = #39564#25910#35780#20215
                  Footers = <>
                  Width = 277
                end
                item
                  EditButtons = <>
                  FieldName = #24322#24120#31867#21035
                  Footers = <>
                  Width = 170
                end
                item
                  EditButtons = <>
                  FieldName = #25925#38556#21517#31216
                  Footers = <>
                  Width = 277
                end
                item
                  EditButtons = <>
                  FieldName = #26631#20934#32500#20462#26102#38388
                  Footers = <>
                  Width = 59
                end
                item
                  EditButtons = <>
                  FieldName = #36798#25104#29575
                  Footers = <>
                  Width = 120
                end
                item
                  EditButtons = <>
                  FieldName = #35774#22791#20195#30721
                  Footers = <>
                  Width = 105
                end>
            end
          end
          object cxTabSheet3: TcxTabSheet
            Hint = #24433#21709#29983#20135#12289#20173#21487#29983#20135
            Caption = #36229#38271#32500#20462#26102#38388
            ImageIndex = 3
            ParentShowHint = False
            ShowHint = True
            object dghMain3: TDBGridEh
              Left = 0
              Top = 0
              Width = 989
              Height = 371
              Align = alClient
              DataSource = DataSource3
              EditActions = [geaCopyEh, geaSelectAllEh]
              FooterColor = clWindow
              FooterFont.Charset = GB2312_CHARSET
              FooterFont.Color = clWindowText
              FooterFont.Height = -12
              FooterFont.Name = #23435#20307
              FooterFont.Style = []
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
              PopupMenu = PopupMenu1
              SortLocal = True
              TabOrder = 0
              TitleFont.Charset = GB2312_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -12
              TitleFont.Name = #23435#20307
              TitleFont.Style = []
              OnDrawColumnCell = DghMainDrawColumnCell
              OnEnter = DghMain2Enter
              OnGetCellParams = DghMainGetCellParams
              OnKeyDown = DghMainKeyDown
              OnKeyPress = DghMainKeyPress
              OnTitleClick = DghMainTitleClick
              Columns = <
                item
                  EditButtons = <>
                  FieldName = #30003#35831#32534#21495
                  Footers = <>
                  Width = 81
                end
                item
                  EditButtons = <>
                  FieldName = #35774#22791#21517#31216
                  Footers = <>
                  Width = 172
                end
                item
                  EditButtons = <>
                  FieldName = #38599#21592
                  Footers = <>
                  Width = 277
                end
                item
                  EditButtons = <>
                  FieldName = #25925#38556#32791#26102
                  Footers = <>
                  Width = 75
                end
                item
                  EditButtons = <>
                  FieldName = #23454#38469#32500#20462#26102#38388
                  Footers = <>
                  Width = 73
                end
                item
                  EditButtons = <>
                  FieldName = #29366#24577
                  Footers = <>
                  Width = 42
                end
                item
                  EditButtons = <>
                  FieldName = #37096#38376#21517#31216
                  Footers = <>
                  Width = 80
                end
                item
                  EditButtons = <>
                  FieldName = #24037#21378
                  Footers = <>
                  Width = 59
                end
                item
                  EditButtons = <>
                  FieldName = #35774#22791#32423#21035
                  Footers = <>
                  Width = 55
                end
                item
                  EditButtons = <>
                  FieldName = #24433#21709#31243#24230
                  Footers = <>
                  Width = 48
                end
                item
                  EditButtons = <>
                  FieldName = #25552#20132#26085#26399
                  Footers = <>
                  Width = 103
                end
                item
                  EditButtons = <>
                  FieldName = #30003#25253#20154
                  Footers = <>
                  Width = 81
                end
                item
                  EditButtons = <>
                  FieldName = #32852#32476#20154
                  Footers = <>
                  Width = 59
                end
                item
                  EditButtons = <>
                  FieldName = #32852#32476#20154#30005#35805
                  Footers = <>
                  Width = 86
                end
                item
                  EditButtons = <>
                  FieldName = #25925#38556#26085#26399
                  Footers = <>
                  Width = 104
                end
                item
                  EditButtons = <>
                  FieldName = #25925#38556#35828#26126
                  Footers = <>
                  Width = 194
                end
                item
                  EditButtons = <>
                  FieldName = #21463#29702#26085#26399
                  Footers = <>
                  Width = 103
                end
                item
                  EditButtons = <>
                  FieldName = #21463#29702#20154
                  Footers = <>
                  Width = 92
                end
                item
                  EditButtons = <>
                  FieldName = #23436#24037#26085#26399
                  Footers = <>
                  Width = 104
                end
                item
                  EditButtons = <>
                  FieldName = #23436#24037#20154#21592
                  Footers = <>
                  Width = 92
                end
                item
                  EditButtons = <>
                  FieldName = #32500#20462#35760#24405
                  Footers = <>
                  Width = 277
                end
                item
                  EditButtons = <>
                  FieldName = #39564#25910#35780#20215
                  Footers = <>
                  Width = 277
                end
                item
                  EditButtons = <>
                  FieldName = #24322#24120#31867#21035
                  Footers = <>
                  Width = 170
                end
                item
                  EditButtons = <>
                  FieldName = #25925#38556#21517#31216
                  Footers = <>
                  Width = 277
                end
                item
                  EditButtons = <>
                  FieldName = #26631#20934#32500#20462#26102#38388
                  Footers = <>
                  Width = 59
                end
                item
                  EditButtons = <>
                  FieldName = #36798#25104#29575
                  Footers = <>
                  Width = 120
                end
                item
                  EditButtons = <>
                  FieldName = #35774#22791#20195#30721
                  Footers = <>
                  Width = 105
                end>
            end
            object GroupBox6: TGroupBox
              Left = 498
              Top = 318
              Width = 74
              Height = 35
              Caption = #37329#39069
              TabOrder = 1
              Visible = False
              object Label5: TLabel
                Left = 46
                Top = 15
                Width = 6
                Height = 12
              end
              object Edit4: TEdit
                Left = 6
                Top = 14
                Width = 54
                Height = 20
                TabOrder = 0
                Text = '300'
                OnChange = Edit4Change
                OnKeyPress = Edit4KeyPress
              end
            end
            object GroupBox8: TGroupBox
              Left = 580
              Top = 310
              Width = 107
              Height = 35
              Caption = #31579#36873#24037#21378
              TabOrder = 2
              Visible = False
              object ComboBox1: TComboBox
                Left = 6
                Top = 11
                Width = 101
                Height = 20
                Style = csDropDownList
                ItemHeight = 12
                TabOrder = 0
                OnChange = ComboBox1Change
              end
            end
            object GroupBox2: TGroupBox
              Left = 713
              Top = 310
              Width = 73
              Height = 35
              Caption = #20572#26426#26102#38388
              TabOrder = 3
              Visible = False
              object Label1: TLabel
                Left = 46
                Top = 15
                Width = 24
                Height = 12
                Caption = #23567#26102
              end
              object Edit1: TEdit
                Left = 6
                Top = 13
                Width = 36
                Height = 20
                TabOrder = 0
                OnChange = Edit1Change
                OnKeyPress = Edit1KeyPress
              end
            end
            object GroupBox3: TGroupBox
              Left = 831
              Top = 310
              Width = 74
              Height = 35
              Caption = #38388#38548#26102#38388
              TabOrder = 4
              Visible = False
              object Label4: TLabel
                Left = 45
                Top = 15
                Width = 12
                Height = 12
                Caption = #22825
              end
              object Edit2: TEdit
                Left = 6
                Top = 13
                Width = 36
                Height = 20
                TabOrder = 0
                OnChange = Edit2Change
                OnKeyPress = Edit1KeyPress
              end
            end
            object GroupBox4: TGroupBox
              Left = 942
              Top = 310
              Width = 73
              Height = 35
              Caption = #20445#20859#36798#25104#29575
              TabOrder = 5
              Visible = False
              object Label3: TLabel
                Left = 55
                Top = 15
                Width = 6
                Height = 12
                Caption = '%'
              end
              object Edit3: TEdit
                Left = 6
                Top = 13
                Width = 46
                Height = 20
                TabOrder = 0
                OnChange = Edit3Change
                OnKeyPress = Edit1KeyPress
              end
            end
            object Panel8: TPanel
              Left = 1032
              Top = 303
              Width = 37
              Height = 35
              BevelOuter = bvNone
              TabOrder = 6
              Visible = False
              object SpeedButton2: TSpeedButton
                Left = 12
                Top = 8
                Width = 25
                Height = 25
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000
                  00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FF0000CE0094FF0000CE000000FF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000CE0094FF0000
                  FF0000CE000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FF0000CE0094FF0000FF0000CE000000FF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FF0000000000000000000000000000000094FF0000FF0000CE0000
                  00FF00FFFF00FFFF00FFFF00FFFF00FF848484000000CE9400CE9400CE940094
                  63299463290000000000CE000000FF00FFFF00FFFF00FFFF00FFFF00FF848484
                  ADB5ADFFCE29FFCE29FFCE29FFCE29CE9400CE9400946329000000FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF848484FFFF94FFFF94FFFF94FFCE94FFCE29FF
                  CE29CE9400CE9400000000FF00FFFF00FFFF00FFFF00FFFF00FF848484FFCE94
                  FFFF94FFFF94FFFF94FFFF94FFFF94FFCE29FFCE29CE9400946329000000FF00
                  FFFF00FFFF00FFFF00FF848484FFCE94FFFFCEFFFFCEFFFFCEFFFF94FFFF94FF
                  FF94FFCE29CE9400CE9400000000FF00FFFF00FFFF00FFFF00FF848484FFCE94
                  FFFFFFFFFFFFFFFFCEFFFFCEFFFF94FFFF94FFCE94FFCE29CE9400000000FF00
                  FFFF00FFFF00FFFF00FF848484ADB5ADFFFFFFFFFFFFFFFFFFFFFFCEFFFFCEFF
                  FF94FFFF94FFCE29CE9400000000FF00FFFF00FFFF00FFFF00FFFF00FF848484
                  FFCE94FFFFFFFFFFFFFFFFFFFFFFCEFFFF94FFFF94FFCE29000000FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF848484ADB5ADFFCE94FFFFFFFFFFFFFFFFCEFF
                  FF94FFCE94CE9429000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  848484848484ADB5ADFFCE94FFCE94FFCE94848484848484FF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF84848484848484848484
                  8484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = BtFindClick
              end
            end
          end
          object cxTabSheet4: TcxTabSheet
            Caption = #20445#20859#19981#21040#20301
            ImageIndex = 4
            object dghMain4: TDBGridEh
              Left = 0
              Top = 0
              Width = 989
              Height = 358
              Align = alClient
              DataSource = DataSource4
              EditActions = [geaCopyEh, geaSelectAllEh]
              FooterColor = clWindow
              FooterFont.Charset = GB2312_CHARSET
              FooterFont.Color = clWindowText
              FooterFont.Height = -12
              FooterFont.Name = #23435#20307
              FooterFont.Style = []
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
              PopupMenu = PopupMenu1
              SortLocal = True
              TabOrder = 0
              TitleFont.Charset = GB2312_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -12
              TitleFont.Name = #23435#20307
              TitleFont.Style = []
              OnDrawColumnCell = DghMainDrawColumnCell
              OnEnter = DghMain3Enter
              OnGetCellParams = DghMainGetCellParams
              OnKeyDown = DghMainKeyDown
              OnKeyPress = DghMainKeyPress
              OnTitleClick = DghMainTitleClick
              Columns = <
                item
                  EditButtons = <>
                  FieldName = #35774#22791#21517#31216
                  Footers = <>
                  Width = 154
                end
                item
                  EditButtons = <>
                  FieldName = #38599#21592
                  Footers = <>
                  Width = 277
                end
                item
                  EditButtons = <>
                  FieldName = #25925#38556#32791#26102
                  Footers = <>
                  Width = 73
                end
                item
                  EditButtons = <>
                  FieldName = #23454#38469#32500#20462#26102#38388
                  Footers = <>
                  Width = 69
                end
                item
                  EditButtons = <>
                  FieldName = #20445#20859#23454#38469#23436#25104#26085#26399
                  Footers = <>
                  Width = 104
                end
                item
                  EditButtons = <>
                  FieldName = #32500#20462#23436#24037#26085#26399
                  Footers = <>
                  Width = 103
                end
                item
                  EditButtons = <>
                  FieldName = #24433#21709#31243#24230
                  Footers = <>
                  Width = 48
                end
                item
                  EditButtons = <>
                  FieldName = #37096#38376#20195#30721
                  Footers = <>
                  Width = 59
                end
                item
                  EditButtons = <>
                  FieldName = #37096#38376#21517#31216
                  Footers = <>
                  Width = 76
                end
                item
                  EditButtons = <>
                  FieldName = #24037#21378
                  Footers = <>
                  Width = 79
                end
                item
                  EditButtons = <>
                  FieldName = #20301#32622
                  Footers = <>
                  Width = 111
                end
                item
                  EditButtons = <>
                  FieldName = #35745#21010#20445#20859#26102#38388
                  Footers = <>
                  Width = 103
                end
                item
                  EditButtons = <>
                  FieldName = #20445#20859#21608#26399
                  Footers = <>
                  Width = 59
                end
                item
                  EditButtons = <>
                  FieldName = #24320#22987#20445#20859#26102#38388
                  Footers = <>
                  Width = 104
                end
                item
                  EditButtons = <>
                  FieldName = #20445#20859#28040#32791#26102#38388
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = #26631#20934#28040#32791#26102#38388
                  Footers = <>
                  Width = 75
                end
                item
                  EditButtons = <>
                  FieldName = #36798#25104#29575
                  Footers = <>
                  Width = 131
                end
                item
                  EditButtons = <>
                  FieldName = #30003#35831#32534#21495
                  Footers = <>
                  Width = 87
                end
                item
                  EditButtons = <>
                  FieldName = #29366#24577
                  Footers = <>
                  Width = 48
                end
                item
                  EditButtons = <>
                  FieldName = #25925#38556#35828#26126
                  Footers = <>
                  Width = 277
                end
                item
                  EditButtons = <>
                  FieldName = #39564#25910#35780#20215
                  Footers = <>
                  Width = 277
                end
                item
                  EditButtons = <>
                  FieldName = #21463#29702#26085#26399
                  Footers = <>
                  Width = 103
                end
                item
                  EditButtons = <>
                  FieldName = #32500#20462#35760#24405
                  Footers = <>
                  Width = 277
                end
                item
                  EditButtons = <>
                  FieldName = #24322#24120#31867#21035
                  Footers = <>
                  Width = 170
                end
                item
                  EditButtons = <>
                  FieldName = #26242#20572#23567#26102
                  Footers = <>
                  Width = 54
                end
                item
                  EditButtons = <>
                  FieldName = #38388#38548#22825
                  Footers = <>
                  Width = 59
                end
                item
                  EditButtons = <>
                  FieldName = #35774#22791#20195#30721
                  Footers = <>
                  Width = 110
                end>
            end
          end
          object cxTabSheet5: TcxTabSheet
            Caption = #20445#20859#19981#33391
            ImageIndex = 5
            object dghMain5: TDBGridEh
              Left = 0
              Top = 0
              Width = 989
              Height = 358
              Align = alClient
              DataSource = DataSource5
              EditActions = [geaCopyEh, geaSelectAllEh]
              FooterColor = clWindow
              FooterFont.Charset = GB2312_CHARSET
              FooterFont.Color = clWindowText
              FooterFont.Height = -12
              FooterFont.Name = #23435#20307
              FooterFont.Style = []
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
              PopupMenu = PopupMenu1
              SortLocal = True
              TabOrder = 0
              TitleFont.Charset = GB2312_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -12
              TitleFont.Name = #23435#20307
              TitleFont.Style = []
              OnDrawColumnCell = DghMainDrawColumnCell
              OnEnter = DghMain3Enter
              OnGetCellParams = DghMainGetCellParams
              OnKeyDown = DghMainKeyDown
              OnKeyPress = DghMainKeyPress
              OnTitleClick = DghMainTitleClick
              Columns = <
                item
                  EditButtons = <>
                  FieldName = #35774#22791#21517#31216
                  Footers = <>
                  Width = 154
                end
                item
                  EditButtons = <>
                  FieldName = #38599#21592
                  Footers = <>
                  Width = 277
                end
                item
                  EditButtons = <>
                  FieldName = #25925#38556#32791#26102
                  Footers = <>
                  Width = 62
                end
                item
                  EditButtons = <>
                  FieldName = #23454#38469#32500#20462#26102#38388
                  Footers = <>
                  Width = 53
                end
                item
                  EditButtons = <>
                  FieldName = #20445#20859#23454#38469#23436#25104#26085#26399
                  Footers = <>
                  Width = 104
                end
                item
                  EditButtons = <>
                  FieldName = #32500#20462#23436#24037#26085#26399
                  Footers = <>
                  Width = 103
                end
                item
                  EditButtons = <>
                  FieldName = #24322#24120#31867#21035
                  Footers = <>
                  Width = 170
                end
                item
                  EditButtons = <>
                  FieldName = #24433#21709#31243#24230
                  Footers = <>
                  Width = 48
                end
                item
                  EditButtons = <>
                  FieldName = #37096#38376#20195#30721
                  Footers = <>
                  Width = 59
                end
                item
                  EditButtons = <>
                  FieldName = #37096#38376#21517#31216
                  Footers = <>
                  Width = 76
                end
                item
                  EditButtons = <>
                  FieldName = #24037#21378
                  Footers = <>
                  Width = 79
                end
                item
                  EditButtons = <>
                  FieldName = #20301#32622
                  Footers = <>
                  Width = 111
                end
                item
                  EditButtons = <>
                  FieldName = #35745#21010#20445#20859#26102#38388
                  Footers = <>
                  Width = 103
                end
                item
                  EditButtons = <>
                  FieldName = #20445#20859#21608#26399
                  Footers = <>
                  Width = 59
                end
                item
                  EditButtons = <>
                  FieldName = #24320#22987#20445#20859#26102#38388
                  Footers = <>
                  Width = 104
                end
                item
                  EditButtons = <>
                  FieldName = #20445#20859#28040#32791#26102#38388
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = #26631#20934#28040#32791#26102#38388
                  Footers = <>
                  Width = 60
                end
                item
                  EditButtons = <>
                  FieldName = #36798#25104#29575
                  Footers = <>
                  Width = 131
                end
                item
                  EditButtons = <>
                  FieldName = #30003#35831#32534#21495
                  Footers = <>
                  Width = 86
                end
                item
                  EditButtons = <>
                  FieldName = #29366#24577
                  Footers = <>
                  Width = 48
                end
                item
                  EditButtons = <>
                  FieldName = #25925#38556#35828#26126
                  Footers = <>
                  Width = 277
                end
                item
                  EditButtons = <>
                  FieldName = #39564#25910#35780#20215
                  Footers = <>
                  Width = 277
                end
                item
                  EditButtons = <>
                  FieldName = #21463#29702#26085#26399
                  Footers = <>
                  Width = 104
                end
                item
                  EditButtons = <>
                  FieldName = #32500#20462#35760#24405
                  Footers = <>
                  Width = 277
                end
                item
                  EditButtons = <>
                  FieldName = #26242#20572#23567#26102
                  Footers = <>
                  Width = 53
                end
                item
                  EditButtons = <>
                  FieldName = #38388#38548#22825
                  Footers = <>
                  Width = 59
                end
                item
                  EditButtons = <>
                  FieldName = #35774#22791#20195#30721
                  Footers = <>
                  Width = 111
                end>
            end
          end
          object cxTabSheet9: TcxTabSheet
            Caption = #25805#20316#19981#33391
            ImageIndex = 8
            object dghMain9: TDBGridEh
              Left = 0
              Top = 0
              Width = 989
              Height = 358
              Align = alClient
              DataSource = DataSource9
              EditActions = [geaCopyEh, geaSelectAllEh]
              FooterColor = clWindow
              FooterFont.Charset = GB2312_CHARSET
              FooterFont.Color = clWindowText
              FooterFont.Height = -12
              FooterFont.Name = #23435#20307
              FooterFont.Style = []
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
              PopupMenu = PopupMenu1
              SortLocal = True
              TabOrder = 0
              TitleFont.Charset = GB2312_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -12
              TitleFont.Name = #23435#20307
              TitleFont.Style = []
              OnDrawColumnCell = DghMainDrawColumnCell
              OnEnter = DghMain3Enter
              OnGetCellParams = DghMainGetCellParams
              OnKeyDown = DghMainKeyDown
              OnKeyPress = DghMainKeyPress
              OnTitleClick = DghMainTitleClick
              Columns = <
                item
                  EditButtons = <>
                  FieldName = #30003#35831#32534#21495
                  Footers = <>
                  Width = 68
                end
                item
                  EditButtons = <>
                  FieldName = #35774#22791#21517#31216
                  Footers = <>
                  Width = 149
                end
                item
                  EditButtons = <>
                  FieldName = #38599#21592
                  Footers = <>
                  Width = 277
                end
                item
                  EditButtons = <>
                  FieldName = #25925#38556#32791#26102
                  Footers = <>
                  Width = 69
                end
                item
                  EditButtons = <>
                  FieldName = #23454#38469#32500#20462#26102#38388
                  Footers = <>
                  Width = 67
                end
                item
                  EditButtons = <>
                  FieldName = #37096#38376#20195#30721
                  Footers = <>
                  Width = 60
                end
                item
                  EditButtons = <>
                  FieldName = #37096#38376#21517#31216
                  Footers = <>
                  Width = 97
                end
                item
                  EditButtons = <>
                  FieldName = #20301#32622
                  Footers = <>
                  Width = 84
                end
                item
                  EditButtons = <>
                  FieldName = #24037#21378
                  Footers = <>
                  Width = 59
                end
                item
                  EditButtons = <>
                  FieldName = #29366#24577
                  Footers = <>
                  Width = 48
                end
                item
                  EditButtons = <>
                  FieldName = #24433#21709#31243#24230
                  Footers = <>
                  Width = 48
                end
                item
                  EditButtons = <>
                  FieldName = #25925#38556#35828#26126
                  Footers = <>
                  Width = 209
                end
                item
                  EditButtons = <>
                  FieldName = #39564#25910#35780#20215
                  Footers = <>
                  Width = 194
                end
                item
                  EditButtons = <>
                  FieldName = #21463#29702#26085#26399
                  Footers = <>
                  Width = 103
                end
                item
                  EditButtons = <>
                  FieldName = #32500#20462#35760#24405
                  Footers = <>
                  Width = 161
                end
                item
                  EditButtons = <>
                  FieldName = #23436#24037#26085#26399
                  Footers = <>
                  Width = 103
                end
                item
                  EditButtons = <>
                  FieldName = #26242#20572#23567#26102
                  Footers = <>
                  Width = 54
                end
                item
                  EditButtons = <>
                  FieldName = #24322#24120#31867#21035
                  Footers = <>
                  Width = 96
                end
                item
                  EditButtons = <>
                  FieldName = #35774#22791#20195#30721
                  Footers = <>
                  Width = 103
                end>
            end
          end
          object cxTabSheet10: TcxTabSheet
            Caption = #35774#35745#19981#33391
            ImageIndex = 9
            object dghMain10: TDBGridEh
              Left = 0
              Top = 0
              Width = 989
              Height = 358
              Align = alClient
              DataSource = DataSource10
              EditActions = [geaCopyEh, geaSelectAllEh]
              FooterColor = clWindow
              FooterFont.Charset = GB2312_CHARSET
              FooterFont.Color = clWindowText
              FooterFont.Height = -12
              FooterFont.Name = #23435#20307
              FooterFont.Style = []
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
              PopupMenu = PopupMenu1
              SortLocal = True
              TabOrder = 0
              TitleFont.Charset = GB2312_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -12
              TitleFont.Name = #23435#20307
              TitleFont.Style = []
              OnDrawColumnCell = DghMainDrawColumnCell
              OnEnter = DghMain3Enter
              OnGetCellParams = DghMainGetCellParams
              OnKeyDown = DghMainKeyDown
              OnKeyPress = DghMainKeyPress
              OnTitleClick = DghMainTitleClick
              Columns = <
                item
                  EditButtons = <>
                  FieldName = #30003#35831#32534#21495
                  Footers = <>
                  Width = 69
                end
                item
                  EditButtons = <>
                  FieldName = #35774#22791#21517#31216
                  Footers = <>
                  Width = 139
                end
                item
                  EditButtons = <>
                  FieldName = #38599#21592
                  Footers = <>
                  Width = 277
                end
                item
                  EditButtons = <>
                  FieldName = #25925#38556#32791#26102
                  Footers = <>
                  Width = 76
                end
                item
                  EditButtons = <>
                  FieldName = #23454#38469#32500#20462#26102#38388
                  Footers = <>
                  Width = 73
                end
                item
                  EditButtons = <>
                  FieldName = #37096#38376#20195#30721
                  Footers = <>
                  Width = 59
                end
                item
                  EditButtons = <>
                  FieldName = #37096#38376#21517#31216
                  Footers = <>
                  Width = 79
                end
                item
                  EditButtons = <>
                  FieldName = #20301#32622
                  Footers = <>
                  Width = 86
                end
                item
                  EditButtons = <>
                  FieldName = #24037#21378
                  Footers = <>
                  Width = 59
                end
                item
                  EditButtons = <>
                  FieldName = #29366#24577
                  Footers = <>
                  Width = 48
                end
                item
                  EditButtons = <>
                  FieldName = #24433#21709#31243#24230
                  Footers = <>
                  Width = 48
                end
                item
                  EditButtons = <>
                  FieldName = #25925#38556#35828#26126
                  Footers = <>
                  Width = 219
                end
                item
                  EditButtons = <>
                  FieldName = #39564#25910#35780#20215
                  Footers = <>
                  Width = 195
                end
                item
                  EditButtons = <>
                  FieldName = #21463#29702#26085#26399
                  Footers = <>
                  Width = 103
                end
                item
                  EditButtons = <>
                  FieldName = #32500#20462#35760#24405
                  Footers = <>
                  Width = 194
                end
                item
                  EditButtons = <>
                  FieldName = #23436#24037#26085#26399
                  Footers = <>
                  Width = 104
                end
                item
                  EditButtons = <>
                  FieldName = #26242#20572#23567#26102
                  Footers = <>
                  Width = 53
                end
                item
                  EditButtons = <>
                  FieldName = #24322#24120#31867#21035
                  Footers = <>
                  Width = 88
                end
                item
                  EditButtons = <>
                  FieldName = #35774#22791#20195#30721
                  Footers = <>
                  Width = 96
                end>
            end
          end
          object cxTabSheet6: TcxTabSheet
            Caption = #38599#21592#36229#38271#24037#20316#26102#38388
            ImageIndex = 6
            object dghMain6: TDBGridEh
              Left = 0
              Top = 0
              Width = 989
              Height = 371
              Align = alClient
              DataSource = DataSource6
              EditActions = [geaCopyEh, geaSelectAllEh]
              FooterColor = clWindow
              FooterFont.Charset = GB2312_CHARSET
              FooterFont.Color = clWindowText
              FooterFont.Height = -12
              FooterFont.Name = #23435#20307
              FooterFont.Style = []
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
              PopupMenu = PopupMenu1
              SortLocal = True
              TabOrder = 0
              TitleFont.Charset = GB2312_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -12
              TitleFont.Name = #23435#20307
              TitleFont.Style = []
              OnDrawColumnCell = DghMainDrawColumnCell
              OnEnter = DghMain3Enter
              OnGetCellParams = DghMainGetCellParams
              OnKeyDown = DghMainKeyDown
              OnKeyPress = DghMainKeyPress
              OnTitleClick = DghMainTitleClick
              Columns = <
                item
                  EditButtons = <>
                  FieldName = #30003#35831#32534#21495
                  Footers = <>
                  Width = 74
                end
                item
                  EditButtons = <>
                  FieldName = #35774#22791#21517#31216
                  Footers = <>
                  Width = 147
                end
                item
                  EditButtons = <>
                  FieldName = #38599#21592
                  Footers = <>
                  Width = 75
                end
                item
                  EditButtons = <>
                  FieldName = #38599#21592#24037#20316#26102#38388
                  Footers = <>
                  Width = 75
                end
                item
                  EditButtons = <>
                  FieldName = #29366#24577
                  Footers = <>
                  Width = 48
                end
                item
                  EditButtons = <>
                  FieldName = #37096#38376#21517#31216
                  Footers = <>
                  Width = 91
                end
                item
                  EditButtons = <>
                  FieldName = #30003#25253#20154
                  Footers = <>
                  Width = 55
                end
                item
                  EditButtons = <>
                  FieldName = #24037#21378
                  Footers = <>
                  Width = 59
                end
                item
                  EditButtons = <>
                  FieldName = #21463#29702#20154
                  Footers = <>
                  Width = 54
                end
                item
                  EditButtons = <>
                  FieldName = #23436#24037#20154#21592
                  Footers = <>
                  Width = 55
                end
                item
                  EditButtons = <>
                  FieldName = #35774#22791#32423#21035
                  Footers = <>
                  Width = 59
                end
                item
                  EditButtons = <>
                  FieldName = #24433#21709#31243#24230
                  Footers = <>
                  Width = 48
                end
                item
                  EditButtons = <>
                  FieldName = #25552#20132#26085#26399
                  Footers = <>
                  Width = 103
                end
                item
                  EditButtons = <>
                  FieldName = #32852#32476#20154
                  Footers = <>
                  Width = 49
                end
                item
                  EditButtons = <>
                  FieldName = #32852#32476#20154#30005#35805
                  Footers = <>
                  Width = 87
                end
                item
                  EditButtons = <>
                  FieldName = #25925#38556#35828#26126
                  Footers = <>
                  Width = 187
                end
                item
                  EditButtons = <>
                  FieldName = #21463#29702#26085#26399
                  Footers = <>
                  Width = 104
                end
                item
                  EditButtons = <>
                  FieldName = #32500#20462#35760#24405
                  Footers = <>
                  Width = 170
                end
                item
                  EditButtons = <>
                  FieldName = #23436#24037#26085#26399
                  Footers = <>
                  Width = 103
                end
                item
                  EditButtons = <>
                  FieldName = #39564#25910#35780#20215
                  Footers = <>
                  Width = 172
                end
                item
                  EditButtons = <>
                  FieldName = #24322#24120#31867#21035
                  Footers = <>
                  Width = 170
                end
                item
                  EditButtons = <>
                  FieldName = #23454#38469#32500#20462#26102#38388
                  Footers = <>
                  Width = 74
                end
                item
                  EditButtons = <>
                  FieldName = #24037#20316#26085#26399
                  Footers = <>
                  Width = 104
                end
                item
                  EditButtons = <>
                  FieldName = #24037#20316#21333#29366#24577
                  Footers = <>
                  Width = 59
                end
                item
                  EditButtons = <>
                  FieldName = #24320#22987#26102#38388
                  Footers = <>
                  Width = 103
                end
                item
                  EditButtons = <>
                  FieldName = #32467#26463#26102#38388
                  Footers = <>
                  Width = 104
                end
                item
                  EditButtons = <>
                  FieldName = #25925#38556#21517#31216
                  Footers = <>
                  Width = 182
                end
                item
                  EditButtons = <>
                  FieldName = #26631#20934#32500#20462#26102#38388
                  Footers = <>
                  Width = 77
                end
                item
                  EditButtons = <>
                  FieldName = #20013#36884#20241#24687#26102#38388
                  Footers = <>
                  Width = 74
                end
                item
                  EditButtons = <>
                  FieldName = #26242#20572#26102#38388
                  Footers = <>
                  Width = 53
                end
                item
                  EditButtons = <>
                  FieldName = #36798#25104#29575
                  Footers = <>
                  Width = 120
                end
                item
                  EditButtons = <>
                  FieldName = #25237#35785#20869#23481
                  Footers = <>
                  Width = 277
                end
                item
                  EditButtons = <>
                  FieldName = #22791#27880
                  Footers = <>
                  Width = 277
                end
                item
                  EditButtons = <>
                  FieldName = #36131#20219#23567#32452
                  Footers = <>
                  Width = 115
                end
                item
                  EditButtons = <>
                  FieldName = #26159#35774#22791#31867#22411
                  Footers = <>
                  Width = 66
                end
                item
                  EditButtons = <>
                  FieldName = #35774#22791#20195#30721
                  Footers = <>
                  Width = 109
                end>
            end
            object GroupBox1: TGroupBox
              Left = 624
              Top = 229
              Width = 348
              Height = 35
              Caption = #25925#38556#26085#26399
              TabOrder = 1
              Visible = False
              object Label13: TLabel
                Left = 176
                Top = 17
                Width = 12
                Height = 12
                Caption = #21040
              end
              object Label2: TLabel
                Left = 7
                Top = 17
                Width = 12
                Height = 12
                Caption = #20174
              end
              object dteEnd: TDateTimePicker
                Left = 190
                Top = 13
                Width = 88
                Height = 21
                Date = 41500.000000000000000000
                Format = 'yyyy-MM-dd '
                Time = 41500.000000000000000000
                TabOrder = 0
                OnChange = dteEndChange
              end
              object dteBegin: TDateTimePicker
                Left = 21
                Top = 13
                Width = 88
                Height = 21
                Date = 41500.580699502320000000
                Format = 'yyyy-MM-dd'
                Time = 41500.580699502320000000
                DateFormat = dfLong
                TabOrder = 1
                OnChange = dteBeginChange
              end
              object dteBeginTime: TDateTimePicker
                Left = 114
                Top = 13
                Width = 60
                Height = 21
                Date = 41500.333333333340000000
                Format = 'HH:mm'
                Time = 41500.333333333340000000
                DateMode = dmUpDown
                Kind = dtkTime
                TabOrder = 2
                OnChange = dteBeginChange
              end
              object dteEndTime: TDateTimePicker
                Left = 282
                Top = 13
                Width = 60
                Height = 21
                Date = 41500.333333333340000000
                Format = 'HH:mm'
                Time = 41500.333333333340000000
                DateMode = dmUpDown
                Kind = dtkTime
                TabOrder = 3
                OnChange = dteEndChange
              end
            end
          end
          object cxTabSheet7: TcxTabSheet
            Caption = #38599#21592#20154#22343#24037#26102
            ImageIndex = 7
            object Splitter1: TSplitter
              Left = 341
              Top = 0
              Width = 4
              Height = 358
            end
            object Panel9: TPanel
              Left = 0
              Top = 0
              Width = 341
              Height = 358
              Align = alLeft
              BevelOuter = bvNone
              Caption = 'Panel9'
              TabOrder = 0
              object dghMain7: TDBGridEh
                Left = 0
                Top = 0
                Width = 341
                Height = 358
                Align = alClient
                DataSource = DataSource7
                EditActions = [geaCopyEh, geaSelectAllEh]
                FooterColor = clWindow
                FooterFont.Charset = GB2312_CHARSET
                FooterFont.Color = clWindowText
                FooterFont.Height = -12
                FooterFont.Name = #23435#20307
                FooterFont.Style = []
                FooterRowCount = 1
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
                PopupMenu = PopupMenu1
                SortLocal = True
                TabOrder = 0
                TitleFont.Charset = GB2312_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -12
                TitleFont.Name = #23435#20307
                TitleFont.Style = []
                OnDrawColumnCell = DghMainDrawColumnCell
                OnEnter = DghMain3Enter
                OnGetCellParams = DghMainGetCellParams
                OnKeyDown = DghMainKeyDown
                OnKeyPress = DghMainKeyPress
                OnTitleClick = DghMainTitleClick
                Columns = <
                  item
                    EditButtons = <>
                    FieldName = #24037#21378
                    Footers = <>
                    Width = 59
                  end
                  item
                    EditButtons = <>
                    FieldName = #38599#21592#20195#30721
                    Footers = <>
                    Width = 59
                  end
                  item
                    EditButtons = <>
                    FieldName = #38599#21592
                    Footers = <>
                    Width = 87
                  end
                  item
                    EditButtons = <>
                    FieldName = #38599#21592#24037#20316#26102#38388
                    Footer.FieldName = #38599#21592#24037#20316#26102#38388
                    Footer.ValueType = fvtStaticText
                    Footers = <>
                    Width = 70
                  end>
              end
            end
            object Panel10: TPanel
              Left = 345
              Top = 0
              Width = 644
              Height = 358
              Align = alClient
              BevelOuter = bvNone
              Caption = 'Panel10'
              TabOrder = 1
              object dghMain8: TDBGridEh
                Left = 0
                Top = 0
                Width = 644
                Height = 358
                Align = alClient
                DataSource = DataSource8
                EditActions = [geaCopyEh, geaSelectAllEh]
                FooterColor = clWindow
                FooterFont.Charset = GB2312_CHARSET
                FooterFont.Color = clWindowText
                FooterFont.Height = -12
                FooterFont.Name = #23435#20307
                FooterFont.Style = []
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
                PopupMenu = PopupMenu1
                SortLocal = True
                TabOrder = 0
                TitleFont.Charset = GB2312_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -12
                TitleFont.Name = #23435#20307
                TitleFont.Style = []
                OnDrawColumnCell = DghMainDrawColumnCell
                OnEnter = DghMain3Enter
                OnGetCellParams = DghMainGetCellParams
                OnKeyDown = DghMainKeyDown
                OnKeyPress = DghMainKeyPress
                OnTitleClick = DghMainTitleClick
                Columns = <
                  item
                    EditButtons = <>
                    FieldName = #38599#21592#24037#20316#26102#38388
                    Footers = <>
                    Width = 76
                  end
                  item
                    EditButtons = <>
                    FieldName = #32500#20462#30003#35831#32534#21495
                    Footers = <>
                    Width = 86
                  end
                  item
                    EditButtons = <>
                    FieldName = #35745#21010#20445#20859#26102#38388
                    Footers = <>
                    Width = 104
                  end
                  item
                    EditButtons = <>
                    FieldName = #20445#20859#21608#26399
                    Footers = <>
                    Width = 59
                  end
                  item
                    EditButtons = <>
                    FieldName = #24037#20316#26085#26399
                    Footers = <>
                    Width = 103
                  end
                  item
                    EditButtons = <>
                    FieldName = #24320#22987#26102#38388
                    Footers = <>
                    Width = 104
                  end
                  item
                    EditButtons = <>
                    FieldName = #32467#26463#26102#38388
                    Footers = <>
                    Width = 103
                  end
                  item
                    EditButtons = <>
                    FieldName = #35774#22791#20195#30721
                    Footers = <>
                    Width = 98
                  end
                  item
                    EditButtons = <>
                    FieldName = #35774#22791#21517#31216
                    Footers = <>
                    Width = 168
                  end
                  item
                    EditButtons = <>
                    FieldName = #37096#38376#21517#31216
                    Footers = <>
                    Width = 83
                  end
                  item
                    EditButtons = <>
                    FieldName = #24037#21378
                    Footers = <>
                    Width = 61
                  end
                  item
                    EditButtons = <>
                    FieldName = #38599#21592#20195#30721
                    Footers = <>
                    Width = 59
                  end
                  item
                    EditButtons = <>
                    FieldName = #38599#21592
                    Footers = <>
                    Width = 92
                  end
                  item
                    EditButtons = <>
                    FieldName = #20013#36884#20241#24687#26102#38388
                    Footers = <>
                    Width = 54
                  end>
              end
            end
          end
          object cxTabSheet11: TcxTabSheet
            Caption = #36739#39640#32500#20462#25104#26412
            ImageIndex = 10
            object Splitter2: TSplitter
              Left = 554
              Top = 0
              Width = 4
              Height = 358
            end
            object Panel11: TPanel
              Left = 0
              Top = 0
              Width = 554
              Height = 358
              Align = alLeft
              BevelOuter = bvNone
              Caption = 'Panel9'
              TabOrder = 0
              object dghMain11: TDBGridEh
                Left = 0
                Top = 0
                Width = 554
                Height = 358
                Align = alClient
                DataSource = DataSource11
                EditActions = [geaCopyEh, geaSelectAllEh]
                FooterColor = clWindow
                FooterFont.Charset = GB2312_CHARSET
                FooterFont.Color = clWindowText
                FooterFont.Height = -12
                FooterFont.Name = #23435#20307
                FooterFont.Style = []
                FooterRowCount = 1
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
                PopupMenu = PopupMenu1
                SortLocal = True
                TabOrder = 0
                TitleFont.Charset = GB2312_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -12
                TitleFont.Name = #23435#20307
                TitleFont.Style = []
                OnDrawColumnCell = DghMainDrawColumnCell
                OnEnter = DghMain3Enter
                OnGetCellParams = DghMainGetCellParams
                OnKeyDown = DghMainKeyDown
                OnKeyPress = DghMainKeyPress
                OnTitleClick = DghMainTitleClick
                Columns = <
                  item
                    EditButtons = <>
                    FieldName = #32500#20462#21333#21333#21495
                    Footers = <>
                  end
                  item
                    EditButtons = <>
                    FieldName = #24037#20316#21333#21495
                    Footers = <>
                    Width = 62
                  end
                  item
                    EditButtons = <>
                    FieldName = #35774#22791#21517#31216
                    Footers = <>
                    Width = 149
                  end
                  item
                    EditButtons = <>
                    FieldName = #37329#39069'('#26412#24065#21547#31246')'
                    Footers = <>
                    Width = 78
                  end
                  item
                    EditButtons = <>
                    FieldName = #35774#22791#36131#20219#23567#32452
                    Footers = <>
                    Width = 76
                  end
                  item
                    EditButtons = <>
                    FieldName = #20351#29992#37096#38376
                    Footers = <>
                    Width = 59
                  end
                  item
                    EditButtons = <>
                    FieldName = #37096#38376#21517#31216
                    Footers = <>
                    Width = 68
                  end
                  item
                    EditButtons = <>
                    FieldName = #24037#21378
                    Footers = <>
                    Width = 59
                  end
                  item
                    EditButtons = <>
                    FieldName = #25925#38556#26085#26399
                    Footers = <>
                    Width = 91
                  end
                  item
                    EditButtons = <>
                    FieldName = #24037#20316#20219#21153#35828#26126
                    Footers = <>
                    Width = 89
                  end
                  item
                    EditButtons = <>
                    FieldName = #26045#24037#38431'/'#20107#19994#37096
                    Footers = <>
                    Width = 101
                  end
                  item
                    EditButtons = <>
                    FieldName = #21463#29702#20154
                    Footers = <>
                    Width = 71
                  end
                  item
                    EditButtons = <>
                    FieldName = #39564#25910#20154
                    Footers = <>
                    Width = 71
                  end
                  item
                    EditButtons = <>
                    FieldName = #21463#29702#26085#26399
                    Footers = <>
                    Width = 89
                  end
                  item
                    EditButtons = <>
                    FieldName = #35774#22791#32534#21495
                    Footers = <>
                    Width = 103
                  end>
              end
            end
            object Panel12: TPanel
              Left = 558
              Top = 0
              Width = 431
              Height = 358
              Align = alClient
              BevelOuter = bvNone
              Caption = 'Panel10'
              TabOrder = 1
              object dghMain11_1: TDBGridEh
                Left = 0
                Top = 0
                Width = 431
                Height = 358
                Align = alClient
                DataSource = DataSource11_1
                EditActions = [geaCopyEh, geaSelectAllEh]
                FooterColor = clWindow
                FooterFont.Charset = GB2312_CHARSET
                FooterFont.Color = clWindowText
                FooterFont.Height = -12
                FooterFont.Name = #23435#20307
                FooterFont.Style = []
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
                PopupMenu = PopupMenu1
                SortLocal = True
                TabOrder = 0
                TitleFont.Charset = GB2312_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -12
                TitleFont.Name = #23435#20307
                TitleFont.Style = []
                OnDrawColumnCell = DghMainDrawColumnCell
                OnEnter = DghMain3Enter
                OnGetCellParams = DghMainGetCellParams
                OnKeyDown = DghMainKeyDown
                OnKeyPress = DghMainKeyPress
                OnTitleClick = DghMainTitleClick
                Columns = <
                  item
                    EditButtons = <>
                    FieldName = #39046#26009#21333#21495
                    Footers = <>
                    Width = 59
                  end
                  item
                    EditButtons = <>
                    FieldName = #26448#26009#32534#30721
                    Footers = <>
                    Width = 110
                  end
                  item
                    EditButtons = <>
                    FieldName = #26448#26009#21517#31216'/'#35268#26684
                    Footers = <>
                    Width = 219
                  end
                  item
                    EditButtons = <>
                    FieldName = #21333#20301
                    Footers = <>
                    Width = 51
                  end
                  item
                    EditButtons = <>
                    FieldName = #30003#39046#25968#37327
                    Footers = <>
                    Width = 59
                  end
                  item
                    EditButtons = <>
                    FieldName = #24050#21457#25918#25968#37327
                    Footers = <>
                    Width = 60
                  end
                  item
                    EditButtons = <>
                    FieldName = #37329#39069'('#26412#24065#21547#31246')'
                    Footers = <>
                    Width = 85
                  end
                  item
                    EditButtons = <>
                    FieldName = #30003#35831#26085#26399
                    Footers = <>
                    Width = 104
                  end
                  item
                    EditButtons = <>
                    FieldName = #30003#39046#21592#24037
                    Footers = <>
                    Width = 92
                  end>
              end
            end
          end
          object cxTabSheet12: TcxTabSheet
            Caption = #36739#39640#20445#20859#25104#26412
            ImageIndex = 11
            object Splitter3: TSplitter
              Left = 554
              Top = 0
              Width = 4
              Height = 358
            end
            object Panel13: TPanel
              Left = 0
              Top = 0
              Width = 554
              Height = 358
              Align = alLeft
              BevelOuter = bvNone
              Caption = 'Panel9'
              TabOrder = 0
              object dghMain12: TDBGridEh
                Left = 0
                Top = 0
                Width = 554
                Height = 358
                Align = alClient
                DataSource = DataSource12
                EditActions = [geaCopyEh, geaSelectAllEh]
                FooterColor = clWindow
                FooterFont.Charset = GB2312_CHARSET
                FooterFont.Color = clWindowText
                FooterFont.Height = -12
                FooterFont.Name = #23435#20307
                FooterFont.Style = []
                FooterRowCount = 1
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
                PopupMenu = PopupMenu1
                SortLocal = True
                TabOrder = 0
                TitleFont.Charset = GB2312_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -12
                TitleFont.Name = #23435#20307
                TitleFont.Style = []
                OnDrawColumnCell = DghMainDrawColumnCell
                OnEnter = DghMain3Enter
                OnGetCellParams = DghMainGetCellParams
                OnKeyDown = DghMainKeyDown
                OnKeyPress = DghMainKeyPress
                OnTitleClick = DghMainTitleClick
                Columns = <
                  item
                    EditButtons = <>
                    FieldName = #35774#22791#21517#31216
                    Footers = <>
                    Width = 138
                  end
                  item
                    EditButtons = <>
                    FieldName = #20445#20859#26085#26399
                    Footers = <>
                    Width = 70
                  end
                  item
                    EditButtons = <>
                    FieldName = #20445#20859#21608#26399
                    Footers = <>
                    Width = 39
                  end
                  item
                    EditButtons = <>
                    FieldName = #24320#22987#20445#20859#26102#38388
                    Footers = <>
                    Visible = False
                    Width = 98
                  end
                  item
                    EditButtons = <>
                    FieldName = #32500#20462#21333#21333#21495
                    Footers = <>
                    Width = 74
                  end
                  item
                    EditButtons = <>
                    FieldName = #25925#38556#26085#26399
                    Footers = <>
                    Width = 74
                  end
                  item
                    EditButtons = <>
                    FieldName = #37329#39069'('#26412#24065#21547#31246')'
                    Footers = <>
                    Width = 78
                  end
                  item
                    EditButtons = <>
                    FieldName = #20351#29992#37096#38376
                    Footers = <>
                    Visible = False
                    Width = 59
                  end
                  item
                    EditButtons = <>
                    FieldName = #37096#38376#21517#31216
                    Footers = <>
                    Width = 86
                  end
                  item
                    EditButtons = <>
                    FieldName = #24037#21378
                    Footers = <>
                    Width = 63
                  end
                  item
                    EditButtons = <>
                    FieldName = #35774#22791#36131#20219#23567#32452
                    Footers = <>
                    Width = 79
                  end
                  item
                    EditButtons = <>
                    FieldName = #35774#22791#32534#21495
                    Footers = <>
                    Visible = False
                    Width = 114
                  end>
              end
            end
            object Panel14: TPanel
              Left = 558
              Top = 0
              Width = 431
              Height = 358
              Align = alClient
              BevelOuter = bvNone
              Caption = 'Panel10'
              TabOrder = 1
              object dghMain12_1: TDBGridEh
                Left = 0
                Top = 0
                Width = 431
                Height = 358
                Align = alClient
                DataSource = DataSource12_1
                EditActions = [geaCopyEh, geaSelectAllEh]
                FooterColor = clWindow
                FooterFont.Charset = GB2312_CHARSET
                FooterFont.Color = clWindowText
                FooterFont.Height = -12
                FooterFont.Name = #23435#20307
                FooterFont.Style = []
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
                PopupMenu = PopupMenu1
                SortLocal = True
                TabOrder = 0
                TitleFont.Charset = GB2312_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -12
                TitleFont.Name = #23435#20307
                TitleFont.Style = []
                OnDrawColumnCell = DghMainDrawColumnCell
                OnEnter = DghMain3Enter
                OnGetCellParams = DghMainGetCellParams
                OnKeyDown = DghMainKeyDown
                OnKeyPress = DghMainKeyPress
                OnTitleClick = DghMainTitleClick
                Columns = <
                  item
                    EditButtons = <>
                    FieldName = #39046#26009#21333#21495
                    Footers = <>
                    Width = 59
                  end
                  item
                    EditButtons = <>
                    FieldName = #26448#26009#32534#30721
                    Footers = <>
                    Width = 110
                  end
                  item
                    EditButtons = <>
                    FieldName = #26448#26009#21517#31216'/'#35268#26684
                    Footers = <>
                    Width = 219
                  end
                  item
                    EditButtons = <>
                    FieldName = #21333#20301
                    Footers = <>
                    Width = 51
                  end
                  item
                    EditButtons = <>
                    FieldName = #30003#39046#25968#37327
                    Footers = <>
                    Width = 59
                  end
                  item
                    EditButtons = <>
                    FieldName = #24050#21457#25918#25968#37327
                    Footers = <>
                    Width = 60
                  end
                  item
                    EditButtons = <>
                    FieldName = #37329#39069'('#26412#24065#21547#31246')'
                    Footers = <>
                    Width = 85
                  end
                  item
                    EditButtons = <>
                    FieldName = #30003#35831#26085#26399
                    Footers = <>
                    Width = 104
                  end
                  item
                    EditButtons = <>
                    FieldName = #30003#39046#21592#24037
                    Footers = <>
                    Width = 92
                  end>
              end
            end
          end
          object cxTabSheet13: TcxTabSheet
            Caption = #36739#39640#24037#31243#25104#26412
            ImageIndex = 12
            object Splitter4: TSplitter
              Left = 554
              Top = 0
              Width = 4
              Height = 379
            end
            object Panel15: TPanel
              Left = 0
              Top = 0
              Width = 554
              Height = 379
              Align = alLeft
              BevelOuter = bvNone
              Caption = 'Panel9'
              TabOrder = 0
              object dghMain13: TDBGridEh
                Left = 0
                Top = 0
                Width = 554
                Height = 379
                Align = alClient
                DataSource = DataSource13
                EditActions = [geaCopyEh, geaSelectAllEh]
                FooterColor = clWindow
                FooterFont.Charset = GB2312_CHARSET
                FooterFont.Color = clWindowText
                FooterFont.Height = -12
                FooterFont.Name = #23435#20307
                FooterFont.Style = []
                FooterRowCount = 1
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
                PopupMenu = PopupMenu1
                SortLocal = True
                TabOrder = 0
                TitleFont.Charset = GB2312_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -12
                TitleFont.Name = #23435#20307
                TitleFont.Style = []
                OnDrawColumnCell = DghMainDrawColumnCell
                OnEnter = DghMain3Enter
                OnGetCellParams = DghMainGetCellParams
                OnKeyDown = DghMainKeyDown
                OnKeyPress = DghMainKeyPress
                OnTitleClick = DghMainTitleClick
                Columns = <
                  item
                    EditButtons = <>
                    FieldName = #24037#20316#21333#21495
                    Footers = <>
                    Width = 70
                  end
                  item
                    EditButtons = <>
                    FieldName = #24037#20316#20219#21153#35828#26126
                    Footers = <>
                    Width = 101
                  end
                  item
                    EditButtons = <>
                    FieldName = #26045#24037#38431'/'#20107#19994#37096
                    Footers = <>
                    Width = 84
                  end
                  item
                    EditButtons = <>
                    FieldName = #32500#20462#21333#21333#21495
                    Footers = <>
                    Width = 73
                  end
                  item
                    EditButtons = <>
                    FieldName = #35774#22791#21517#31216
                    Footers = <>
                    Width = 114
                  end
                  item
                    EditButtons = <>
                    FieldName = #37329#39069'('#26412#24065#21547#31246')'
                    Footers = <>
                    Width = 80
                  end
                  item
                    EditButtons = <>
                    FieldName = #21463#29702#20154
                    Footers = <>
                    Width = 60
                  end
                  item
                    EditButtons = <>
                    FieldName = #39564#25910#20154
                    Footers = <>
                    Width = 169
                  end
                  item
                    EditButtons = <>
                    FieldName = #21463#29702#26085#26399
                    Footers = <>
                    Width = 104
                  end
                  item
                    EditButtons = <>
                    FieldName = #35774#22791#32534#21495
                    Footers = <>
                    Width = 114
                  end
                  item
                    EditButtons = <>
                    FieldName = #35774#22791#36131#20219#23567#32452
                    Footers = <>
                    Width = 78
                  end
                  item
                    EditButtons = <>
                    FieldName = #20351#29992#37096#38376
                    Footers = <>
                    Width = 59
                  end
                  item
                    EditButtons = <>
                    FieldName = #37096#38376#21517#31216
                    Footers = <>
                    Width = 85
                  end
                  item
                    EditButtons = <>
                    FieldName = #24037#21378
                    Footers = <>
                    Width = 59
                  end
                  item
                    EditButtons = <>
                    FieldName = #25925#38556#26085#26399
                    Footers = <>
                    Width = 94
                  end>
              end
            end
            object Panel16: TPanel
              Left = 558
              Top = 0
              Width = 431
              Height = 379
              Align = alClient
              BevelOuter = bvNone
              Caption = 'Panel10'
              TabOrder = 1
              object DBGridEh1: TDBGridEh
                Left = 0
                Top = 0
                Width = 431
                Height = 379
                Align = alClient
                DataSource = DataSource13_1
                EditActions = [geaCopyEh, geaSelectAllEh]
                FooterColor = clWindow
                FooterFont.Charset = GB2312_CHARSET
                FooterFont.Color = clWindowText
                FooterFont.Height = -12
                FooterFont.Name = #23435#20307
                FooterFont.Style = []
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
                PopupMenu = PopupMenu1
                SortLocal = True
                TabOrder = 0
                TitleFont.Charset = GB2312_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -12
                TitleFont.Name = #23435#20307
                TitleFont.Style = []
                OnDrawColumnCell = DghMainDrawColumnCell
                OnEnter = DghMain3Enter
                OnGetCellParams = DghMainGetCellParams
                OnKeyDown = DghMainKeyDown
                OnKeyPress = DghMainKeyPress
                OnTitleClick = DghMainTitleClick
                Columns = <
                  item
                    EditButtons = <>
                    FieldName = #39046#26009#21333#21495
                    Footers = <>
                    Width = 59
                  end
                  item
                    EditButtons = <>
                    FieldName = #26448#26009#32534#30721
                    Footers = <>
                    Width = 110
                  end
                  item
                    EditButtons = <>
                    FieldName = #26448#26009#21517#31216'/'#35268#26684
                    Footers = <>
                    Width = 219
                  end
                  item
                    EditButtons = <>
                    FieldName = #21333#20301
                    Footers = <>
                    Width = 51
                  end
                  item
                    EditButtons = <>
                    FieldName = #30003#39046#25968#37327
                    Footers = <>
                    Width = 59
                  end
                  item
                    EditButtons = <>
                    FieldName = #24050#21457#25918#25968#37327
                    Footers = <>
                    Width = 60
                  end
                  item
                    EditButtons = <>
                    FieldName = #37329#39069'('#26412#24065#21547#31246')'
                    Footers = <>
                    Width = 85
                  end
                  item
                    EditButtons = <>
                    FieldName = #30003#35831#26085#26399
                    Footers = <>
                    Width = 104
                  end
                  item
                    EditButtons = <>
                    FieldName = #30003#39046#21592#24037
                    Footers = <>
                    Width = 92
                  end>
              end
            end
          end
          object cxTabSheet14: TcxTabSheet
            Caption = #21516#35774#22791#22810#27425#39046#29992#21516#29289#26009
            ImageIndex = 13
            object dghMain14: TDBGridEh
              Left = 0
              Top = 0
              Width = 989
              Height = 358
              Align = alClient
              DataSource = DataSource14
              EditActions = [geaCopyEh, geaSelectAllEh]
              FooterColor = clWindow
              FooterFont.Charset = GB2312_CHARSET
              FooterFont.Color = clWindowText
              FooterFont.Height = -12
              FooterFont.Name = #23435#20307
              FooterFont.Style = []
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
              PopupMenu = PopupMenu1
              SortLocal = True
              TabOrder = 0
              TitleFont.Charset = GB2312_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -12
              TitleFont.Name = #23435#20307
              TitleFont.Style = []
              OnDrawColumnCell = DghMainDrawColumnCell
              OnEnter = DghMain3Enter
              OnGetCellParams = DghMainGetCellParams
              OnKeyDown = DghMainKeyDown
              OnKeyPress = DghMainKeyPress
              OnTitleClick = DghMainTitleClick
              Columns = <
                item
                  EditButtons = <>
                  FieldName = #24037#21378
                  Footers = <>
                  Width = 59
                end
                item
                  EditButtons = <>
                  FieldName = #30003#35831#21333#21495
                  Footers = <>
                  Width = 62
                end
                item
                  EditButtons = <>
                  FieldName = #21457#26009#26085#26399
                  Footers = <>
                end
                item
                  EditButtons = <>
                  FieldName = #35774#22791#32534#21495
                  Footers = <>
                  Width = 85
                end
                item
                  EditButtons = <>
                  FieldName = #35774#22791#21517#31216
                  Footers = <>
                  Width = 171
                end
                item
                  EditButtons = <>
                  FieldName = #21608#26399
                  Footers = <>
                  Width = 59
                end
                item
                  EditButtons = <>
                  FieldName = #20445#20859#35745#21010#26085#26399
                  Footers = <>
                  Width = 76
                end
                item
                  EditButtons = <>
                  FieldName = #32500#20462#21333#21495
                  Footers = <>
                  Width = 88
                end
                item
                  EditButtons = <>
                  FieldName = #26448#26009#32534#21495
                  Footers = <>
                  Width = 96
                end
                item
                  EditButtons = <>
                  FieldName = #26448#26009#21517#31216'/'#35268#26684
                  Footers = <>
                  Width = 196
                end
                item
                  EditButtons = <>
                  FieldName = #21333#20301
                  Footers = <>
                  Width = 41
                end
                item
                  EditButtons = <>
                  FieldName = #21457#26009#25968#37327
                  Footers = <>
                  Width = 53
                end
                item
                  EditButtons = <>
                  FieldName = #21333#20215
                  Footers = <>
                  Width = 154
                end>
            end
          end
          object cxTabSheet15: TcxTabSheet
            Caption = #37325#22797#29289#26009#39046#29992
            ImageIndex = 14
            object dghMain15: TDBGridEh
              Left = 0
              Top = 0
              Width = 989
              Height = 358
              Align = alClient
              DataSource = DataSource15
              EditActions = [geaCopyEh, geaSelectAllEh]
              FooterColor = clWindow
              FooterFont.Charset = GB2312_CHARSET
              FooterFont.Color = clWindowText
              FooterFont.Height = -12
              FooterFont.Name = #23435#20307
              FooterFont.Style = []
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
              PopupMenu = PopupMenu1
              SortLocal = True
              TabOrder = 0
              TitleFont.Charset = GB2312_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -12
              TitleFont.Name = #23435#20307
              TitleFont.Style = []
              OnDrawColumnCell = DghMainDrawColumnCell
              OnEnter = DghMain3Enter
              OnGetCellParams = DghMainGetCellParams
              OnKeyDown = DghMainKeyDown
              OnKeyPress = DghMainKeyPress
              OnTitleClick = DghMainTitleClick
              Columns = <
                item
                  EditButtons = <>
                  FieldName = #30003#39046#21333#21495
                  Footers = <>
                  Width = 59
                end
                item
                  EditButtons = <>
                  FieldName = #30003#35831#26085#26399
                  Footers = <>
                  Width = 70
                end
                item
                  EditButtons = <>
                  FieldName = #30003#39046#37096#38376
                  Footers = <>
                  Width = 59
                end
                item
                  EditButtons = <>
                  FieldName = #26448#26009#32534#21495
                  Footers = <>
                  Width = 97
                end
                item
                  EditButtons = <>
                  FieldName = #26448#26009#21517#31216#35268#26684
                  Footers = <>
                  Width = 171
                end
                item
                  EditButtons = <>
                  FieldName = #21333#20301
                  Footers = <>
                  Width = 40
                end
                item
                  EditButtons = <>
                  FieldName = #37096#38376#21517#31216
                  Footers = <>
                  Width = 94
                end
                item
                  EditButtons = <>
                  FieldName = #30003#35831#25968#37327
                  Footers = <>
                  Width = 59
                end
                item
                  EditButtons = <>
                  FieldName = #21457#26009#25968#37327
                  Footers = <>
                  Width = 61
                end
                item
                  EditButtons = <>
                  FieldName = #21333#20215
                  Footers = <>
                  Width = 186
                end
                item
                  EditButtons = <>
                  FieldName = #30003#39046#20154#20195#30721
                  Footers = <>
                  Width = 59
                end
                item
                  EditButtons = <>
                  FieldName = #30003#39046#21592#24037#21517#31216
                  Footers = <>
                  Width = 75
                end
                item
                  EditButtons = <>
                  FieldName = #23457#26680#29366#24577
                  Footers = <>
                  Width = 49
                end
                item
                  EditButtons = <>
                  FieldName = #24037#21378
                  Footers = <>
                  Width = 59
                end
                item
                  EditButtons = <>
                  FieldName = #31867#22411
                  Footers = <>
                  Width = 26
                end
                item
                  EditButtons = <>
                  FieldName = #32500#20462#21333#21333#21495
                  Footers = <>
                  Width = 90
                end
                item
                  EditButtons = <>
                  FieldName = #20445#20859#26085#26399
                  Footers = <>
                  Width = 76
                end
                item
                  EditButtons = <>
                  FieldName = #20445#20859#21608#26399
                  Footers = <>
                  Width = 59
                end
                item
                  EditButtons = <>
                  FieldName = #35774#22791#32534#21495
                  Footers = <>
                  Width = 86
                end
                item
                  EditButtons = <>
                  FieldName = #35774#22791#21517#31216
                  Footers = <>
                  Width = 144
                end
                item
                  EditButtons = <>
                  FieldName = #35774#22791#36131#20219#23567#32452
                  Footers = <>
                  Width = 76
                end
                item
                  EditButtons = <>
                  FieldName = #31354#35843#20107#19994#37096#24037#20316#21333#21495
                  Footers = <>
                  Width = 104
                end
                item
                  EditButtons = <>
                  FieldName = #24037#20316#37096#38376
                  Footers = <>
                  Width = 99
                end
                item
                  EditButtons = <>
                  FieldName = #24037#20316#20219#21153#21517#31216
                  Footers = <>
                  Width = 118
                end
                item
                  EditButtons = <>
                  FieldName = #24037#20316#20219#21153#35828#26126
                  Footers = <>
                  Width = 136
                end>
            end
          end
          object cxTabSheet16: TcxTabSheet
            Caption = #26376#20154#22343#24037#26102#32479#35745
            ImageIndex = 15
            object dghMain16: TDBGridEh
              Left = 0
              Top = 0
              Width = 989
              Height = 371
              Align = alClient
              DataSource = DataSource16
              EditActions = [geaCopyEh, geaSelectAllEh]
              FooterColor = clWindow
              FooterFont.Charset = GB2312_CHARSET
              FooterFont.Color = clWindowText
              FooterFont.Height = -12
              FooterFont.Name = #23435#20307
              FooterFont.Style = []
              FooterRowCount = 4
              FrozenCols = 1
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
              PopupMenu = PopupMenu1
              SortLocal = True
              TabOrder = 0
              TitleFont.Charset = GB2312_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -12
              TitleFont.Name = #23435#20307
              TitleFont.Style = []
              OnDrawColumnCell = dghMain16DrawColumnCell
              OnEnter = DghMain3Enter
              OnGetCellParams = DghMainGetCellParams
              OnKeyDown = DghMainKeyDown
              OnKeyPress = DghMainKeyPress
              OnTitleClick = DghMainTitleClick
            end
          end
          object cxTabSheet17: TcxTabSheet
            Caption = #31354#35843#20107#19994#37096#24037#26102#32479#35745
            ImageIndex = 16
            object dghMain17: TDBGridEh
              Left = 0
              Top = 0
              Width = 989
              Height = 358
              Align = alClient
              DataSource = DataSource17
              EditActions = [geaCopyEh, geaSelectAllEh]
              FooterColor = clWindow
              FooterFont.Charset = GB2312_CHARSET
              FooterFont.Color = clWindowText
              FooterFont.Height = -12
              FooterFont.Name = #23435#20307
              FooterFont.Style = []
              FooterRowCount = 4
              FrozenCols = 1
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
              PopupMenu = PopupMenu1
              SortLocal = True
              TabOrder = 0
              TitleFont.Charset = GB2312_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -12
              TitleFont.Name = #23435#20307
              TitleFont.Style = []
              OnDrawColumnCell = dghMain16DrawColumnCell
              OnEnter = DghMain3Enter
              OnGetCellParams = DghMainGetCellParams
              OnKeyDown = DghMainKeyDown
              OnKeyPress = DghMainKeyPress
              OnTitleClick = DghMainTitleClick
            end
          end
          object cxTabSheet18: TcxTabSheet
            Caption = #32500#20462#25237#35785
            ImageIndex = 17
            object dghMain18: TDBGridEh
              Left = 0
              Top = 0
              Width = 989
              Height = 371
              Align = alClient
              DataSource = DataSource18
              EditActions = [geaCopyEh, geaSelectAllEh]
              FooterColor = clWindow
              FooterFont.Charset = GB2312_CHARSET
              FooterFont.Color = clWindowText
              FooterFont.Height = -12
              FooterFont.Name = #23435#20307
              FooterFont.Style = []
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
              PopupMenu = PopupMenu1
              SortLocal = True
              TabOrder = 0
              TitleFont.Charset = GB2312_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -12
              TitleFont.Name = #23435#20307
              TitleFont.Style = []
              OnDrawColumnCell = DghMainDrawColumnCell
              OnEnter = DghMain3Enter
              OnGetCellParams = DghMainGetCellParams
              OnKeyDown = DghMainKeyDown
              OnKeyPress = DghMainKeyPress
              OnTitleClick = DghMainTitleClick
              Columns = <
                item
                  EditButtons = <>
                  FieldName = #30003#35831#32534#21495
                  Footers = <>
                  Width = 69
                end
                item
                  EditButtons = <>
                  FieldName = #35774#22791#20195#30721
                  Footers = <>
                  Width = 81
                end
                item
                  EditButtons = <>
                  FieldName = #35774#22791#21517#31216
                  Footers = <>
                  Width = 132
                end
                item
                  EditButtons = <>
                  FieldName = #29366#24577
                  Footers = <>
                  Width = 38
                end
                item
                  EditButtons = <>
                  FieldName = #25237#35785#20869#23481
                  Footers = <>
                  Width = 177
                end
                item
                  EditButtons = <>
                  FieldName = #37096#38376#21517#31216
                  Footers = <>
                  Width = 62
                end
                item
                  EditButtons = <>
                  FieldName = #30003#25253#20154
                  Footers = <>
                  Width = 58
                end
                item
                  EditButtons = <>
                  FieldName = #24037#21378
                  Footers = <>
                  Width = 44
                end
                item
                  EditButtons = <>
                  FieldName = #21463#29702#20154
                  Footers = <>
                  Width = 71
                end
                item
                  EditButtons = <>
                  FieldName = #23436#24037#20154#21592
                  Footers = <>
                  Width = 89
                end
                item
                  EditButtons = <>
                  FieldName = #35774#22791#32423#21035
                  Footers = <>
                  Width = 59
                end
                item
                  EditButtons = <>
                  FieldName = #24433#21709#31243#24230
                  Footers = <>
                  Width = 48
                end
                item
                  EditButtons = <>
                  FieldName = #25552#20132#26085#26399
                  Footers = <>
                  Width = 86
                end
                item
                  EditButtons = <>
                  FieldName = #32852#32476#20154
                  Footers = <>
                  Width = 60
                end
                item
                  EditButtons = <>
                  FieldName = #32852#32476#20154#30005#35805
                  Footers = <>
                  Width = 86
                end
                item
                  EditButtons = <>
                  FieldName = #25925#38556#35828#26126
                  Footers = <>
                  Width = 182
                end
                item
                  EditButtons = <>
                  FieldName = #21463#29702#26085#26399
                  Footers = <>
                  Width = 103
                end
                item
                  EditButtons = <>
                  FieldName = #32500#20462#35760#24405
                  Footers = <>
                  Width = 145
                end
                item
                  EditButtons = <>
                  FieldName = #23436#24037#26085#26399
                  Footers = <>
                  Width = 103
                end
                item
                  EditButtons = <>
                  FieldName = #39564#25910#35780#20215
                  Footers = <>
                  Width = 149
                end
                item
                  EditButtons = <>
                  FieldName = #24322#24120#31867#21035
                  Footers = <>
                  Width = 147
                end
                item
                  EditButtons = <>
                  FieldName = #23454#38469#32500#20462#26102#38388
                  Footers = <>
                  Width = 54
                end
                item
                  EditButtons = <>
                  FieldName = #25925#38556#21517#31216
                  Footers = <>
                  Width = 189
                end
                item
                  EditButtons = <>
                  FieldName = #26631#20934#32500#20462#26102#38388
                  Footers = <>
                  Width = 59
                end
                item
                  EditButtons = <>
                  FieldName = #36798#25104#29575
                  Footers = <>
                  Width = 77
                end
                item
                  EditButtons = <>
                  FieldName = #36131#20219#23567#32452
                  Footers = <>
                  Width = 66
                end
                item
                  EditButtons = <>
                  FieldName = #26159#35774#22791#31867#22411
                  Footers = <>
                  Width = 32
                end>
            end
          end
        end
      end
      inherited Panel7: TPanel
        Top = 602
        Width = 1114
      end
    end
    inherited Panel1: TPanel
      Width = 1114
    end
  end
  inherited dxBarManager: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    DockControlHeights = (
      0
      0
      39
      0)
    inherited dxBarManagerBar2: TdxBar
      ItemLinks = <
        item
          Visible = True
          ItemName = 'tblFind'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'tblExport'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'tblFirst'
        end
        item
          Visible = True
          ItemName = 'tblPrior'
        end
        item
          Visible = True
          ItemName = 'tblNext'
        end
        item
          Visible = True
          ItemName = 'tblLast'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'tblHelp'
        end
        item
          Visible = True
          ItemName = 'tblExit'
        end>
    end
    inherited tblAdd: TdxBarLargeButton
      ImageIndex = 3
    end
    inherited tblEdit: TdxBarLargeButton
      ImageIndex = 4
    end
    inherited tblReject: TdxBarLargeButton
      ImageIndex = 130
    end
    inherited tblCancelFilter: TdxBarLargeButton
      ImageIndex = 129
    end
    inherited tblFilter: TdxBarLargeButton
      ImageIndex = 128
    end
    inherited tblExpand: TdxBarLargeButton
      ImageIndex = 131
    end
  end
  inherited dtMain: TADODataSet
    CursorType = ctStatic
    CommandText = 
      'declare @TotalAmount dec(9,2),@SD datetime ,@ED Datetime set @To' +
      'talAmount=:TotalAmount set @SD=:SD set @ED=:ED'#13#10'select *from (se' +
      'lect * from (select '#13#10'DATA0567.RKEY DATA0567RKEY,'#13#10'DATA0567.NUMB' +
      'ER      AS ['#32500#20462#21333#21333#21495'],'#13#10'DATA0417.FASSET_CODE AS ['#35774#22791#20195#30721'], '#13#10'DATA0417.' +
      'FASSET_NAME AS ['#35774#22791#21517#31216'],             '#13#10'DATA0840.[LOCATION]  AS ['#35774#22791 +
      #36131#20219#23567#32452'],'#13#10'DATA0034.DEPT_CODE   AS ['#20351#29992#37096#38376'], '#13#10'DATA0034.DEPT_NAME   A' +
      'S ['#37096#38376#21517#31216'], '#13#10'DATA0015.ABBR_NAME   AS ['#24037#21378'],'#13#10'DATA0567.FAILURE_DATE' +
      '   ['#25925#38556#26085#26399'] ,'#13#10'NULL                    [DATA0835RKEY],'#13#10'NULL      ' +
      '              ['#24037#20316#21333#21495'],'#13#10'NULL                    ['#24037#20316#20219#21153#35828#26126'],'#13#10'null  ' +
      '                  ['#26045#24037#38431'/'#20107#19994#37096'],'#13#10'null                    ['#21463#29702#20154'],'#13#10'nu' +
      'll                    ['#39564#25910#20154'],'#13#10'null                    ['#21463#29702#26085#26399'],'#13#10' ' +
      '   (select sum(ROUND(dbo.Data0207.QUANTITY * dbo.Data0022.tax_pr' +
      'ice * dbo.Data0456.exch_rate, 4))       '#13#10#9'from data0207 join da' +
      'ta0022 on  data0022.rkey      = data0207.D0022_PTR '#13#10#9'JOIN Data0' +
      '456 ON  Data0022.GRN_PTR   = Data0456.RKEY'#13#10#9'join data0468 on  d' +
      'ata0207.D0468_ptr = Data0468.rkey'#13#10#9'join data0268 on  data0468.F' +
      'LOW_NO   = data0268.rkey and dbo.DATA0268.ttype = 2 and data0268' +
      '.status in(2,4)'#13#10#9'and data0268.[d567_ptr]=data0567.rkey)as['#37329#39069'('#26412#24065 +
      #21547#31246')]'#13#10'from data0567 join data0417  on data0417.rkey=data0567.FAS' +
      'SET_PTR'#13#10'INNER JOIN dbo.Data0015 ON dbo.data0417.warehouse_ptr =' +
      ' dbo.Data0015.RKEY '#13#10'INNER JOIN dbo.Data0034 ON dbo.data0417.dep' +
      't_ptr = dbo.Data0034.RKEY'#13#10'left join data0840 on  data0567.[d840' +
      '_ptr]=dbo.data0840.rkey'#13#10'where data0567.failure_date>=@SD and da' +
      'ta0567.failure_date<@ED'#13#10')as t1 where ['#37329#39069'('#26412#24065#21547#31246')]>@TotalAmount'#13#10'u' +
      'nion'#13#10'select * from (select '#13#10'null data0567rkey,'#13#10'null ['#32500#20462#21333#21333#21495'],'#13 +
      #10'null ['#35774#22791#32534#21495'], '#13#10'null ['#35774#22791#21517#31216'],             '#13#10'null ['#35774#22791#36131#20219#23567#32452'],'#13#10'null ' +
      '['#20351#29992#37096#38376'], '#13#10'null ['#37096#38376#21517#31216'], '#13#10'null ['#24037#21378'],'#13#10'null ['#25925#38556#26085#26399'],'#13#10'data0835.rkey' +
      ' [data0835rkey],'#13#10'data0835.WorkOrder ['#24037#20316#21333#21495'],'#13#10'data0835.WorkExpl ' +
      ' ['#24037#20316#20219#21153#35828#26126'],'#13#10'data0830.DeptName  ['#26045#24037#38431'/'#20107#19994#37096'],'#13#10'd73_2.USER_FULL_NAME ' +
      'as ['#21463#29702#20154'],'#13#10'd73_3.USER_FULL_NAME as ['#39564#25910#20154'],'#13#10'Data0835.AdmiTime ['#21463#29702 +
      #26085#26399'],'#13#10'    (select sum(ROUND(dbo.Data0207.QUANTITY * dbo.Data0022' +
      '.tax_price * dbo.Data0456.exch_rate, 4))       '#13#10#9'from data0207 ' +
      'join data0022 on  data0022.rkey      = data0207.D0022_PTR '#13#10#9'JOI' +
      'N Data0456 ON  Data0022.GRN_PTR   = Data0456.RKEY'#13#10#9'join data046' +
      '8 on  data0207.D0468_ptr = Data0468.rkey'#13#10#9'join data0268 on  dat' +
      'a0468.FLOW_NO   = data0268.rkey and dbo.DATA0268.ttype = 2 and d' +
      'ata0268.status in(2,4)'#13#10#9'and data0268.[d835_ptr]=data0835.rkey)a' +
      's['#37329#39069'('#26412#24065#21547#31246')]'#13#10'from data0835 join data0830 on data0835.Dept_ptr=da' +
      'ta0830.rkey'#13#10'join data0836 on data0835.Work_ptr=data0836.rkey'#13#10'j' +
      'oin data0073 on data0835.Applican=data0073.rkey'#13#10'left join data0' +
      '073 d73_2 on data0835.AdmiPeop=d73_2.rkey '#13#10'left join data0073 d' +
      '73_3 on data0835.AccePeop=d73_3.rkey '#13#10'where Data0835.AdmiTime>=' +
      '@SD and Data0835.AdmiTime<@ED'#13#10')as t1 where ['#37329#39069'('#26412#24065#21547#31246')]>@TotalAmo' +
      'unt)as t2'
    Parameters = <
      item
        Name = 'TotalAmount'
        DataType = ftFloat
        Size = -1
        Value = Null
      end
      item
        Name = 'SD'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'ED'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
  end
  inherited cdsMain: Tcds
    CommandText = 
      'if object_id('#39'tempdb..#bbb'#39') is not null     drop table #bbb'#13#10'se' +
      'lect isnull(cast(datediff(mi,data0567.ent_date,data0567.complete' +
      '_date)as  dec(12,2)) /60,0) ['#25925#38556#32791#26102'],'#13#10' d1.Number as '#19978#19968#27425#21333#21495' ,d1.fai' +
      'lure_date as '#19978#19968#27425#26085#26399' ,data0567.*,'#13#10'datediff(minute,d1.failure_date' +
      ',data0567.failure_date) as step into  #bbb '#13#10'from data0567 '#13#10'joi' +
      'n data0567 d1 on data0567.Fasset_ptr=d1.Fasset_ptr  and data0567' +
      '.D846_ptr=d1.D846_ptr and'#13#10'datediff(minute,d1.failure_date,data0' +
      '567.failure_date) between 0 and :DT  and data0567.rkey<>d1.rkey'#13 +
      #10'where data0567.failure_date>:SD and data0567.failure_date<=:ED'#13 +
      #10'and data0567.[STATUS]in(3,4) and d1.[STATUS]in(3,4)'#13#10'order by f' +
      'asset_ptr,failure_date'#13#10'select  *from( select '#13#10'#bbb.['#19978#19968#27425#21333#21495'],   ' +
      '      #bbb.['#19978#19968#27425#26085#26399'],'#13#10'#bbb.failure_date          ['#25925#38556#26085#26399'],NUMBER   ' +
      '                  ['#30003#35831#32534#21495'],'#13#10'data0417.FASSET_CODE       ['#35774#22791#20195#30721'],dat' +
      'a0417.FASSET_NAME       ['#35774#22791#21517#31216'],'#13#10'case #bbb.status when 0 then '#39#26410 +
      #25552#20132#39' when 1 then '#39#24453#21463#29702#39' when 2 then '#39#24050#21463#29702#39#13#10'                     wh' +
      'en 3 then '#39#24050#23436#24037#39' when 4 then '#39#24050#39564#25910#39' when 5 then '#39#34987#36864#22238#39' '#13#10'          ' +
      '           when 6 then '#39#24050#26242#20572#39' when 8 then '#39#39564#25910#36864#22238#39'  end as '#29366#24577','#13#10'Dat' +
      'a0034.DEPT_NAME        ['#37096#38376#21517#31216'],Data0005.EMPLOYEE_NAME    ['#30003#25253#20154'],'#13#10 +
      'data0015.abbr_name        ['#24037#21378'],    Data0005_1.EMPLOYEE_NAME  ['#21463#29702 +
      #20154'],'#13#10'Data0005_2.EMPLOYEE_NAME  ['#23436#24037#20154#21592'],#bbb.equipment_grade'#9'  ['#35774#22791 +
      #32423#21035'],'#13#10'failure_degree'#9'          ['#24433#21709#31243#24230'],referring_date            ' +
      '['#25552#20132#26085#26399'],'#13#10'CONTACT_NAME'#9'          ['#32852#32476#20154'],  CONTACT_PHONE'#9'          ' +
      '['#32852#32476#20154#30005#35805'],'#13#10'failure_circs'#9'          ['#25925#38556#35828#26126'],disposal_date'#9'         ' +
      ' ['#21463#29702#26085#26399'],'#13#10'maintain_text'#9'          ['#32500#20462#35760#24405'],complete_date'#9'         ' +
      ' ['#23436#24037#26085#26399'],'#13#10'validate_appraise'#9'      ['#39564#25910#35780#20215'],fail_type'#9'             ' +
      ' ['#24322#24120#31867#21035'],'#13#10'maintain_house'#9'          ['#23454#38469#32500#20462#26102#38388'],'#13#10'data0846.FaultName' +
      #9'      ['#25925#38556#21517#31216'],data0846.stdDate'#9'      ['#26631#20934#32500#20462#26102#38388'],'#13#10'['#25925#38556#32791#26102'],'#13#10'case wh' +
      'en data0846.stdDate>0 and #bbb.Staff_Sum_house>0 then'#13#10'data0846.' +
      'stdDate/#bbb.Staff_Sum_house else 0 end ['#36798#25104#29575'],'#13#10#39#25237#35785#20869#23481#39'=convert(v' +
      'archar(500),STUFF((SELECT '#39#65307#39' + remark from data0841'#13#10'       whe' +
      're data0841.D567_ptr=#bbb.rkey and Status_ptr=7'#13#10'       FOR XML ' +
      'PATH('#39#39')), 1, 1, '#39#39')),'#13#10#39#38599#21592#39'=convert(varchar(500),STUFF((SELECT ' +
      #39#65307#39' + data0005.EMPLOYEE_NAME from data0842 '#13#10'       join data000' +
      '5 on data0842.Empl_ptr=data0005.rkey'#13#10'       where data0842.Work' +
      '_ptr=#bbb.rkey '#13#10'       FOR XML PATH('#39#39')), 1, 1, '#39#39')),       '#13#10'd' +
      'ata0840.Location as     ['#36131#20219#23567#32452']'#13#10'from #bbb join   '#13#10'( select min(' +
      'step) as setp_4 ,Fasset_ptr,failure_date,d846_ptr from #bbb '#13#10'gr' +
      'oup by #bbb.Fasset_ptr,#bbb.failure_date,d846_ptr ) as b4'#13#10'on #b' +
      'bb.Fasset_ptr=b4.Fasset_ptr '#13#10'and #bbb.failure_date=b4.failure_d' +
      'ate '#13#10'and #bbb.step=b4.setp_4 and #bbb.d846_ptr=b4.d846_ptr'#13#10'joi' +
      'n data0417 on #bbb.FASSET_PTR=data0417.rkey and EquiType=1'#13#10'join' +
      '  Data0034 ON #bbb.DEPT_PTR = Data0034.RKEY '#13#10'join  Data0005 ON ' +
      '#bbb.EMPL_PTR = Data0005.RKEY '#13#10'left outer JOIN Data0005 AS Data' +
      '0005_1 ON #bbb.disposal_emplptr = Data0005_1.RKEY '#13#10'left outer j' +
      'oin Data0005 AS Data0005_2 ON #bbb.completion_emplptr=Data0005_2' +
      '.RKEY '#13#10'left outer join Data0015 ON #bbb.whouse_ptr=data0015.rke' +
      'y'#13#10'left join data0846 on data0846.rkey=#bbb.d846_ptr '#13#10'left join' +
      ' data0840 on #bbb.D840_ptr=data0840.rkey)as t1'#13#10
    Params = <
      item
        DataType = ftFloat
        Name = 'DT'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'SD'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'ED'
        ParamType = ptUnknown
      end>
    F_SQLSelectFrom = 
      'if object_id('#39'tempdb..#bbb'#39') is not null     drop table #bbb'#13#10'se' +
      'lect isnull(cast(datediff(mi,data0567.ent_date,data0567.complete' +
      '_date)as  dec(12,2)) /60,0) ['#25925#38556#32791#26102'],'#13#10' d1.Number as '#19978#19968#27425#21333#21495' ,d1.fai' +
      'lure_date as '#19978#19968#27425#26085#26399' ,data0567.*,'#13#10'datediff(minute,d1.failure_date' +
      ',data0567.failure_date) as step into  #bbb '#13#10'from data0567 '#13#10'joi' +
      'n data0567 d1 on data0567.Fasset_ptr=d1.Fasset_ptr  and data0567' +
      '.D846_ptr=d1.D846_ptr and'#13#10'datediff(minute,d1.failure_date,data0' +
      '567.failure_date) between 0 and :DT  and data0567.rkey<>d1.rkey'#13 +
      #10'where data0567.failure_date>:SD and data0567.failure_date<=:ED'#13 +
      #10'and data0567.[STATUS]in(3,4) and d1.[STATUS]in(3,4)'#13#10'order by f' +
      'asset_ptr,failure_date'#13#10'select  *from( select '#13#10'#bbb.['#19978#19968#27425#21333#21495'],   ' +
      '      #bbb.['#19978#19968#27425#26085#26399'],'#13#10'#bbb.failure_date          ['#25925#38556#26085#26399'],NUMBER   ' +
      '                  ['#30003#35831#32534#21495'],'#13#10'data0417.FASSET_CODE       ['#35774#22791#20195#30721'],dat' +
      'a0417.FASSET_NAME       ['#35774#22791#21517#31216'],'#13#10'case #bbb.status when 0 then '#39#26410 +
      #25552#20132#39' when 1 then '#39#24453#21463#29702#39' when 2 then '#39#24050#21463#29702#39#13#10'                     wh' +
      'en 3 then '#39#24050#23436#24037#39' when 4 then '#39#24050#39564#25910#39' when 5 then '#39#34987#36864#22238#39' '#13#10'          ' +
      '           when 6 then '#39#24050#26242#20572#39' when 8 then '#39#39564#25910#36864#22238#39'  end as '#29366#24577','#13#10'Dat' +
      'a0034.DEPT_NAME        ['#37096#38376#21517#31216'],Data0005.EMPLOYEE_NAME    ['#30003#25253#20154'],'#13#10 +
      'data0015.abbr_name        ['#24037#21378'],    Data0005_1.EMPLOYEE_NAME  ['#21463#29702 +
      #20154'],'#13#10'Data0005_2.EMPLOYEE_NAME  ['#23436#24037#20154#21592'],#bbb.equipment_grade'#9'  ['#35774#22791 +
      #32423#21035'],'#13#10'failure_degree'#9'          ['#24433#21709#31243#24230'],referring_date            ' +
      '['#25552#20132#26085#26399'],'#13#10'CONTACT_NAME'#9'          ['#32852#32476#20154'],  CONTACT_PHONE'#9'          ' +
      '['#32852#32476#20154#30005#35805'],'#13#10'failure_circs'#9'          ['#25925#38556#35828#26126'],disposal_date'#9'         ' +
      ' ['#21463#29702#26085#26399'],'#13#10'maintain_text'#9'          ['#32500#20462#35760#24405'],complete_date'#9'         ' +
      ' ['#23436#24037#26085#26399'],'#13#10'validate_appraise'#9'      ['#39564#25910#35780#20215'],fail_type'#9'             ' +
      ' ['#24322#24120#31867#21035'],'#13#10'maintain_house'#9'          ['#23454#38469#32500#20462#26102#38388'],'#13#10'data0846.FaultName' +
      #9'      ['#25925#38556#21517#31216'],data0846.stdDate'#9'      ['#26631#20934#32500#20462#26102#38388'],'#13#10'['#25925#38556#32791#26102'],'#13#10'case wh' +
      'en data0846.stdDate>0 and #bbb.Staff_Sum_house>0 then'#13#10'data0846.' +
      'stdDate/#bbb.Staff_Sum_house else 0 end ['#36798#25104#29575'],'#13#10#39#25237#35785#20869#23481#39'=convert(v' +
      'archar(500),STUFF((SELECT '#39#65307#39' + remark from data0841'#13#10'       whe' +
      're data0841.D567_ptr=#bbb.rkey and Status_ptr=7'#13#10'       FOR XML ' +
      'PATH('#39#39')), 1, 1, '#39#39')),'#13#10#39#38599#21592#39'=convert(varchar(500),STUFF((SELECT ' +
      #39#65307#39' + data0005.EMPLOYEE_NAME from data0842 '#13#10'       join data000' +
      '5 on data0842.Empl_ptr=data0005.rkey'#13#10'       where data0842.Work' +
      '_ptr=#bbb.rkey '#13#10'       FOR XML PATH('#39#39')), 1, 1, '#39#39')),       '#13#10'd' +
      'ata0840.Location as     ['#36131#20219#23567#32452']'#13#10'from #bbb join   '#13#10'( select min(' +
      'step) as setp_4 ,Fasset_ptr,failure_date,d846_ptr from #bbb '#13#10'gr' +
      'oup by #bbb.Fasset_ptr,#bbb.failure_date,d846_ptr ) as b4'#13#10'on #b' +
      'bb.Fasset_ptr=b4.Fasset_ptr '#13#10'and #bbb.failure_date=b4.failure_d' +
      'ate '#13#10'and #bbb.step=b4.setp_4 and #bbb.d846_ptr=b4.d846_ptr'#13#10'joi' +
      'n data0417 on #bbb.FASSET_PTR=data0417.rkey and EquiType=1'#13#10'join' +
      '  Data0034 ON #bbb.DEPT_PTR = Data0034.RKEY '#13#10'join  Data0005 ON ' +
      '#bbb.EMPL_PTR = Data0005.RKEY '#13#10'left outer JOIN Data0005 AS Data' +
      '0005_1 ON #bbb.disposal_emplptr = Data0005_1.RKEY '#13#10'left outer j' +
      'oin Data0005 AS Data0005_2 ON #bbb.completion_emplptr=Data0005_2' +
      '.RKEY '#13#10'left outer join Data0015 ON #bbb.whouse_ptr=data0015.rke' +
      'y'#13#10'left join data0846 on data0846.rkey=#bbb.d846_ptr '#13#10'left join' +
      ' data0840 on #bbb.D840_ptr=data0840.rkey)as t1'#13#10
    F_SQLOrderBy = 'order by t1.['#35774#22791#20195#30721'],t1.'#25925#38556#26085#26399
    object cdsMainCDSDesigner: TStringField
      FieldName = #19978#19968#27425#21333#21495
      Size = 15
    end
    object cdsMainCDSDesigner2: TDateTimeField
      FieldName = #19978#19968#27425#26085#26399
    end
    object cdsMainCDSDesigner38: TDateTimeField
      FieldName = #25925#38556#26085#26399
    end
    object cdsMainCDSDesigner5: TStringField
      FieldName = #35774#22791#21517#31216
      Size = 30
    end
    object cdsMainCDSDesigner24: TStringField
      FieldName = #25925#38556#21517#31216
      Size = 50
    end
    object cdsMainCDSDesigner3: TStringField
      FieldName = #30003#35831#32534#21495
      Size = 15
    end
    object cdsMainCDSDesigner4: TStringField
      FieldName = #35774#22791#20195#30721
    end
    object cdsMainCDSDesigner6: TStringField
      FieldName = #29366#24577
      ReadOnly = True
      Size = 8
    end
    object cdsMainCDSDesigner7: TStringField
      FieldName = #37096#38376#21517#31216
      Size = 30
    end
    object cdsMainCDSDesigner8: TStringField
      FieldName = #30003#25253#20154
      Size = 16
    end
    object cdsMainCDSDesigner9: TStringField
      FieldName = #24037#21378
      Size = 10
    end
    object cdsMainCDSDesigner10: TStringField
      FieldName = #21463#29702#20154
      Size = 16
    end
    object cdsMainCDSDesigner11: TStringField
      FieldName = #23436#24037#20154#21592
      Size = 16
    end
    object cdsMainCDSDesigner12: TStringField
      FieldName = #35774#22791#32423#21035
      Size = 10
    end
    object cdsMainCDSDesigner13: TStringField
      FieldName = #24433#21709#31243#24230
      Size = 8
    end
    object cdsMainCDSDesigner14: TDateTimeField
      FieldName = #25552#20132#26085#26399
    end
    object cdsMainCDSDesigner15: TStringField
      FieldName = #32852#32476#20154
      Size = 10
    end
    object cdsMainCDSDesigner16: TStringField
      FieldName = #32852#32476#20154#30005#35805
      Size = 15
    end
    object cdsMainCDSDesigner17: TStringField
      FieldName = #25925#38556#35828#26126
      Size = 200
    end
    object cdsMainCDSDesigner18: TDateTimeField
      FieldName = #21463#29702#26085#26399
    end
    object cdsMainCDSDesigner19: TStringField
      FieldName = #32500#20462#35760#24405
      Size = 200
    end
    object cdsMainCDSDesigner20: TDateTimeField
      FieldName = #23436#24037#26085#26399
    end
    object cdsMainCDSDesigner21: TStringField
      FieldName = #39564#25910#35780#20215
      Size = 50
    end
    object cdsMainCDSDesigner22: TStringField
      FieldName = #24322#24120#31867#21035
      Size = 30
    end
    object cdsMainCDSDesigner30: TBCDField
      FieldName = #25925#38556#32791#26102
      Precision = 16
      Size = 6
    end
    object cdsMainCDSDesigner23: TBCDField
      FieldName = #23454#38469#32500#20462#26102#38388
      Precision = 8
      Size = 2
    end
    object cdsMainCDSDesigner26: TBCDField
      FieldName = #26631#20934#32500#20462#26102#38388
      Precision = 9
      Size = 2
    end
    object cdsMainCDSDesigner27: TBCDField
      FieldName = #36798#25104#29575
      ReadOnly = True
      Precision = 20
      Size = 11
    end
    object cdsMainCDSDesigner25: TStringField
      FieldName = #38599#21592
      Size = 16
    end
    object cdsMainCDSDesigner28: TStringField
      FieldName = #25237#35785#20869#23481
      ReadOnly = True
      Size = 500
    end
    object cdsMainCDSDesigner29: TStringField
      FieldName = #36131#20219#23567#32452
    end
  end
  inherited dtRead: TADODataSet
    CursorType = ctStatic
    CommandText = 'select unusual_cate from data0043'
  end
  inherited pp_Report1: TppReport
    DataPipelineName = 'pp_DBPipeline1'
    inherited ppDetailBand1: TppDetailBand
      inherited ppDBText1: TppDBText
        DataPipelineName = 'pp_DBPipeline1'
      end
      inherited ppDBText2: TppDBText
        DataPipelineName = 'pp_DBPipeline1'
      end
    end
  end
  object DataSource3: TDataSource
    DataSet = cdsMain3
    Left = 110
    Top = 219
  end
  object cds0034: TClientDataSet
    Aggregates = <>
    CommandText = 'select DEPT_CODE,DEPT_NAME from data0034'#13#10
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 742
    Top = 309
    object cds0034DEPT_CODE: TStringField
      DisplayLabel = #37096#38376#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object cds0034DEPT_NAME: TStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
  end
  object cdsMain1: Tcds
    Aggregates = <>
    CommandText = 
      'if object_id('#39'tempdb..#bbb'#39') is not null drop table #bbb'#13#10'select' +
      ' isnull(cast(datediff(mi,data0567.ent_date,data0567.complete_dat' +
      'e)as  dec(12,2)) /60,0) ['#25925#38556#32791#26102'],'#13#10'd1.Number as '#19978#19968#27425#21333#21495' ,d1.failure_' +
      'date as '#19978#19968#27425#26085#26399' ,data0567.*,'#13#10'datediff(minute,d1.failure_date,data' +
      '0567.failure_date) as step into  #bbb '#13#10'from data0567 join data0' +
      '567 d1 on data0567.Fasset_ptr=d1.Fasset_ptr  and '#13#10'datediff(minu' +
      'te,d1.failure_date,data0567.failure_date) between 0 and :DT '#13#10'an' +
      'd data0567.rkey<>d1.rkey'#13#10'where data0567.failure_date>:SD and da' +
      'ta0567.failure_date<=:ED'#13#10'and data0567.[STATUS]in(3,4) and d1.[S' +
      'TATUS]in(3,4)'#13#10'order by fasset_ptr,failure_date'#13#10'select  *from( ' +
      'select '#13#10'#bbb.['#19978#19968#27425#21333#21495'],         #bbb.['#19978#19968#27425#26085#26399'],'#13#10'#bbb.failure_date ' +
      '         ['#25925#38556#26085#26399'],NUMBER                     ['#30003#35831#32534#21495'],'#13#10'data0417.FAS' +
      'SET_CODE       ['#35774#22791#20195#30721'],data0417.FASSET_NAME       ['#35774#22791#21517#31216'],'#13#10'case #' +
      'bbb.status when 0 then '#39#26410#25552#20132#39' when 1 then '#39#24453#21463#29702#39' when 2 then '#39#24050#21463#29702#39 +
      #13#10'                     when 3 then '#39#24050#23436#24037#39' when 4 then '#39#24050#39564#25910#39' when ' +
      '5 then '#39#34987#36864#22238#39' '#13#10'                     when 6 then '#39#24050#26242#20572#39' when 8 the' +
      'n '#39#39564#25910#36864#22238#39'  end as '#29366#24577','#13#10'Data0034.DEPT_NAME        ['#37096#38376#21517#31216'],Data0005.' +
      'EMPLOYEE_NAME    ['#30003#25253#20154'],'#13#10'data0015.abbr_name        ['#24037#21378'],    Data' +
      '0005_1.EMPLOYEE_NAME  ['#21463#29702#20154'],'#13#10'Data0005_2.EMPLOYEE_NAME  ['#23436#24037#20154#21592'],#' +
      'bbb.equipment_grade'#9'  ['#35774#22791#32423#21035'],'#13#10'failure_degree'#9'          ['#24433#21709#31243#24230'],r' +
      'eferring_date            ['#25552#20132#26085#26399'],'#13#10'CONTACT_NAME'#9'          ['#32852#32476#20154'], ' +
      ' CONTACT_PHONE'#9'          ['#32852#32476#20154#30005#35805'],'#13#10'failure_circs'#9'          ['#25925#38556#35828#26126 +
      '],disposal_date'#9'          ['#21463#29702#26085#26399'],'#13#10'maintain_text'#9'          ['#32500#20462#35760#24405 +
      '],complete_date'#9'          ['#23436#24037#26085#26399'],'#13#10'validate_appraise'#9'      ['#39564#25910#35780#20215 +
      '],fail_type'#9'              ['#24322#24120#31867#21035'],'#13#10'maintain_house'#9'          ['#23454#38469#32500 +
      #20462#26102#38388'],'#13#10'data0846.FaultName'#9'      ['#25925#38556#21517#31216'],data0846.stdDate'#9'      ['#26631 +
      #20934#32500#20462#26102#38388'],'#13#10'['#25925#38556#32791#26102'],'#13#10'case when data0846.stdDate>0 and #bbb.Staff_Su' +
      'm_house>0 then'#13#10'data0846.stdDate/#bbb.Staff_Sum_house else 0 end' +
      ' ['#36798#25104#29575'],'#13#10#39#25237#35785#20869#23481#39'=convert(varchar(500),STUFF((SELECT '#39#65307#39' + remark ' +
      'from data0841'#13#10'       where data0841.D567_ptr=#bbb.rkey and Stat' +
      'us_ptr=7'#13#10'       FOR XML PATH('#39#39')), 1, 1, '#39#39')),'#13#10#39#38599#21592#39'=convert(va' +
      'rchar(500),STUFF((SELECT '#39#65307#39' + data0005.EMPLOYEE_NAME from data0' +
      '842 '#13#10'       join data0005 on data0842.Empl_ptr=data0005.rkey'#13#10' ' +
      '      where data0842.Work_ptr=#bbb.rkey '#13#10'       FOR XML PATH('#39#39 +
      ')), 1, 1, '#39#39')),       '#13#10'data0840.Location as     ['#36131#20219#23567#32452']'#13#10'from #b' +
      'bb join   '#13#10'( select min(step) as setp_4 ,Fasset_ptr,failure_dat' +
      'e from #bbb '#13#10'group by #bbb.Fasset_ptr,#bbb.failure_date ) as b4' +
      #13#10'on #bbb.Fasset_ptr=b4.Fasset_ptr '#13#10'and #bbb.failure_date=b4.fa' +
      'ilure_date '#13#10'and #bbb.step=b4.setp_4'#13#10'join data0417 on #bbb.FASS' +
      'ET_PTR=data0417.rkey and EquiType=1'#13#10'join  Data0034 ON #bbb.DEPT' +
      '_PTR = Data0034.RKEY '#13#10'join  Data0005 ON #bbb.EMPL_PTR = Data000' +
      '5.RKEY '#13#10'left outer JOIN Data0005 AS Data0005_1 ON #bbb.disposal' +
      '_emplptr = Data0005_1.RKEY '#13#10'left outer join Data0005 AS Data000' +
      '5_2 ON #bbb.completion_emplptr=Data0005_2.RKEY '#13#10'left outer join' +
      ' Data0015 ON #bbb.whouse_ptr=data0015.rkey'#13#10'left join data0846 o' +
      'n data0846.rkey=#bbb.d846_ptr '#13#10'left join data0840 on #bbb.D840_' +
      'ptr=data0840.rkey)as t1'
    FilterOptions = [foCaseInsensitive]
    ObjectView = False
    Params = <
      item
        DataType = ftInteger
        Name = 'DT'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'SD'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'ED'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspMain'
    BeforeClose = cdsMainBeforeClose
    AfterInsert = cdsMainAfterInsert
    BeforeCancel = cdsMainBeforeCancel
    AfterCancel = cdsMainAfterCancel
    AfterDelete = cdsMainAfterDelete
    BeforeScroll = cdsMainBeforeScroll
    AfterScroll = cdsMainAfterScroll
    OnReconcileError = cdsMainReconcileError
    F_UKSaveNotEdit = False
    F_AutoNumb = False
    F_AutoSave = False
    F_SQLSelectFrom = 
      'if object_id('#39'tempdb..#bbb'#39') is not null drop table #bbb'#13#10'select' +
      ' isnull(cast(datediff(mi,data0567.ent_date,data0567.complete_dat' +
      'e)as  dec(12,2)) /60,0) ['#25925#38556#32791#26102'],'#13#10'd1.Number as '#19978#19968#27425#21333#21495' ,d1.failure_' +
      'date as '#19978#19968#27425#26085#26399' ,data0567.*,'#13#10'datediff(minute,d1.failure_date,data' +
      '0567.failure_date) as step into  #bbb '#13#10'from data0567 join data0' +
      '567 d1 on data0567.Fasset_ptr=d1.Fasset_ptr  and '#13#10'datediff(minu' +
      'te,d1.failure_date,data0567.failure_date) between 0 and :DT '#13#10'an' +
      'd data0567.rkey<>d1.rkey'#13#10'where data0567.failure_date>:SD and da' +
      'ta0567.failure_date<=:ED'#13#10'and data0567.[STATUS]in(3,4) and d1.[S' +
      'TATUS]in(3,4)'#13#10'order by fasset_ptr,failure_date'#13#10'select  *from( ' +
      'select '#13#10'#bbb.['#19978#19968#27425#21333#21495'],         #bbb.['#19978#19968#27425#26085#26399'],'#13#10'#bbb.failure_date ' +
      '         ['#25925#38556#26085#26399'],NUMBER                     ['#30003#35831#32534#21495'],'#13#10'data0417.FAS' +
      'SET_CODE       ['#35774#22791#20195#30721'],data0417.FASSET_NAME       ['#35774#22791#21517#31216'],'#13#10'case #' +
      'bbb.status when 0 then '#39#26410#25552#20132#39' when 1 then '#39#24453#21463#29702#39' when 2 then '#39#24050#21463#29702#39 +
      #13#10'                     when 3 then '#39#24050#23436#24037#39' when 4 then '#39#24050#39564#25910#39' when ' +
      '5 then '#39#34987#36864#22238#39' '#13#10'                     when 6 then '#39#24050#26242#20572#39' when 8 the' +
      'n '#39#39564#25910#36864#22238#39'  end as '#29366#24577','#13#10'Data0034.DEPT_NAME        ['#37096#38376#21517#31216'],Data0005.' +
      'EMPLOYEE_NAME    ['#30003#25253#20154'],'#13#10'data0015.abbr_name        ['#24037#21378'],    Data' +
      '0005_1.EMPLOYEE_NAME  ['#21463#29702#20154'],'#13#10'Data0005_2.EMPLOYEE_NAME  ['#23436#24037#20154#21592'],#' +
      'bbb.equipment_grade'#9'  ['#35774#22791#32423#21035'],'#13#10'failure_degree'#9'          ['#24433#21709#31243#24230'],r' +
      'eferring_date            ['#25552#20132#26085#26399'],'#13#10'CONTACT_NAME'#9'          ['#32852#32476#20154'], ' +
      ' CONTACT_PHONE'#9'          ['#32852#32476#20154#30005#35805'],'#13#10'failure_circs'#9'          ['#25925#38556#35828#26126 +
      '],disposal_date'#9'          ['#21463#29702#26085#26399'],'#13#10'maintain_text'#9'          ['#32500#20462#35760#24405 +
      '],complete_date'#9'          ['#23436#24037#26085#26399'],'#13#10'validate_appraise'#9'      ['#39564#25910#35780#20215 +
      '],fail_type'#9'              ['#24322#24120#31867#21035'],'#13#10'maintain_house'#9'          ['#23454#38469#32500 +
      #20462#26102#38388'],'#13#10'data0846.FaultName'#9'      ['#25925#38556#21517#31216'],data0846.stdDate'#9'      ['#26631 +
      #20934#32500#20462#26102#38388'],'#13#10'['#25925#38556#32791#26102'],'#13#10'case when data0846.stdDate>0 and #bbb.Staff_Su' +
      'm_house>0 then'#13#10'data0846.stdDate/#bbb.Staff_Sum_house else 0 end' +
      ' ['#36798#25104#29575'],'#13#10#39#25237#35785#20869#23481#39'=convert(varchar(500),STUFF((SELECT '#39#65307#39' + remark ' +
      'from data0841'#13#10'       where data0841.D567_ptr=#bbb.rkey and Stat' +
      'us_ptr=7'#13#10'       FOR XML PATH('#39#39')), 1, 1, '#39#39')),'#13#10#39#38599#21592#39'=convert(va' +
      'rchar(500),STUFF((SELECT '#39#65307#39' + data0005.EMPLOYEE_NAME from data0' +
      '842 '#13#10'       join data0005 on data0842.Empl_ptr=data0005.rkey'#13#10' ' +
      '      where data0842.Work_ptr=#bbb.rkey '#13#10'       FOR XML PATH('#39#39 +
      ')), 1, 1, '#39#39')),       '#13#10'data0840.Location as     ['#36131#20219#23567#32452']'#13#10'from #b' +
      'bb join   '#13#10'( select min(step) as setp_4 ,Fasset_ptr,failure_dat' +
      'e from #bbb '#13#10'group by #bbb.Fasset_ptr,#bbb.failure_date ) as b4' +
      #13#10'on #bbb.Fasset_ptr=b4.Fasset_ptr '#13#10'and #bbb.failure_date=b4.fa' +
      'ilure_date '#13#10'and #bbb.step=b4.setp_4'#13#10'join data0417 on #bbb.FASS' +
      'ET_PTR=data0417.rkey and EquiType=1'#13#10'join  Data0034 ON #bbb.DEPT' +
      '_PTR = Data0034.RKEY '#13#10'join  Data0005 ON #bbb.EMPL_PTR = Data000' +
      '5.RKEY '#13#10'left outer JOIN Data0005 AS Data0005_1 ON #bbb.disposal' +
      '_emplptr = Data0005_1.RKEY '#13#10'left outer join Data0005 AS Data000' +
      '5_2 ON #bbb.completion_emplptr=Data0005_2.RKEY '#13#10'left outer join' +
      ' Data0015 ON #bbb.whouse_ptr=data0015.rkey'#13#10'left join data0846 o' +
      'n data0846.rkey=#bbb.d846_ptr '#13#10'left join data0840 on #bbb.D840_' +
      'ptr=data0840.rkey)as t1'
    F_SQLOrderBy = 'order by t1.['#35774#22791#20195#30721'],t1.'#25925#38556#26085#26399
    Left = 56
    Top = 125
    object cdsMain1CDSDesigner: TStringField
      FieldName = #19978#19968#27425#21333#21495
      Size = 15
    end
    object cdsMain1CDSDesigner2: TDateTimeField
      FieldName = #19978#19968#27425#26085#26399
    end
    object cdsMain1CDSDesigner3: TDateTimeField
      FieldName = #25925#38556#26085#26399
    end
    object cdsMain1CDSDesigner6: TStringField
      FieldName = #35774#22791#21517#31216
      Size = 30
    end
    object cdsMain1CDSDesigner25: TStringField
      FieldName = #25925#38556#21517#31216
      Size = 50
    end
    object cdsMain1CDSDesigner4: TStringField
      FieldName = #30003#35831#32534#21495
      Size = 15
    end
    object cdsMain1CDSDesigner5: TStringField
      FieldName = #35774#22791#20195#30721
    end
    object cdsMain1CDSDesigner7: TStringField
      FieldName = #29366#24577
      ReadOnly = True
      Size = 8
    end
    object cdsMain1CDSDesigner8: TStringField
      FieldName = #37096#38376#21517#31216
      Size = 30
    end
    object cdsMain1CDSDesigner9: TStringField
      FieldName = #30003#25253#20154
      Size = 16
    end
    object cdsMain1CDSDesigner10: TStringField
      FieldName = #24037#21378
      Size = 10
    end
    object cdsMain1CDSDesigner11: TStringField
      FieldName = #21463#29702#20154
      Size = 16
    end
    object cdsMain1CDSDesigner12: TStringField
      FieldName = #23436#24037#20154#21592
      Size = 16
    end
    object cdsMain1CDSDesigner13: TStringField
      FieldName = #35774#22791#32423#21035
      Size = 10
    end
    object cdsMain1CDSDesigner14: TStringField
      FieldName = #24433#21709#31243#24230
      Size = 8
    end
    object cdsMain1CDSDesigner15: TDateTimeField
      FieldName = #25552#20132#26085#26399
    end
    object cdsMain1CDSDesigner16: TStringField
      FieldName = #32852#32476#20154
      Size = 10
    end
    object cdsMain1CDSDesigner17: TStringField
      FieldName = #32852#32476#20154#30005#35805
      Size = 15
    end
    object cdsMain1CDSDesigner18: TStringField
      FieldName = #25925#38556#35828#26126
      Size = 200
    end
    object cdsMain1CDSDesigner19: TDateTimeField
      FieldName = #21463#29702#26085#26399
    end
    object cdsMain1CDSDesigner20: TStringField
      FieldName = #32500#20462#35760#24405
      Size = 200
    end
    object cdsMain1CDSDesigner21: TDateTimeField
      FieldName = #23436#24037#26085#26399
    end
    object cdsMain1CDSDesigner22: TStringField
      FieldName = #39564#25910#35780#20215
      Size = 50
    end
    object cdsMain1CDSDesigner23: TStringField
      FieldName = #24322#24120#31867#21035
      Size = 30
    end
    object cdsMain1CDSDesigner31: TBCDField
      FieldName = #25925#38556#32791#26102
      Precision = 16
      Size = 6
    end
    object cdsMain1CDSDesigner24: TBCDField
      FieldName = #23454#38469#32500#20462#26102#38388
      Precision = 8
      Size = 2
    end
    object cdsMain1CDSDesigner30: TBCDField
      FieldName = #26631#20934#32500#20462#26102#38388
      Precision = 9
      Size = 2
    end
    object cdsMain1CDSDesigner26: TBCDField
      FieldName = #36798#25104#29575
      ReadOnly = True
      Precision = 20
      Size = 11
    end
    object cdsMain1CDSDesigner27: TStringField
      FieldName = #25237#35785#20869#23481
      ReadOnly = True
      Size = 500
    end
    object cdsMain1CDSDesigner29: TStringField
      FieldName = #36131#20219#23567#32452
    end
    object cdsMain1CDSDesigner28: TStringField
      FieldName = #38599#21592
      ReadOnly = True
      Size = 500
    end
  end
  object cdsMain2: Tcds
    Aggregates = <>
    CommandText = 
      'select * from ('#13#10'select NUMBER ['#30003#35831#32534#21495'],data0417.FASSET_CODE ['#35774#22791#20195#30721 +
      '],data0417.FASSET_NAME ['#35774#22791#21517#31216'],'#13#10'case data0567.status when 0 then' +
      ' '#39#26410#25552#20132#39' when 1 then '#39#24453#21463#29702#39' when 2 then '#39#24050#21463#29702#39#13#10#9#9#9#9#9' WHEN 3 THEN '#39#24050 +
      #23436#24037#39' WHEN 4 THEN '#39#24050#39564#25910#39' WHEN 5 THEN '#39#34987#36864#22238#39' '#13#10#9#9#9#9#9' WHEN 6 THEN '#39#24050#26242#20572 +
      #39' WHEN 8 THEN '#39#39564#25910#36864#22238#39'  END AS ['#29366#24577'],'#13#10'Data0034.DEPT_NAME       ['#37096#38376 +
      #21517#31216'],   data0015.abbr_name                ['#24037#21378'], '#13#10'data0567.equipm' +
      'ent_grade ['#35774#22791#32423#21035'],   data0567.failure_degree'#9'         ['#24433#21709#31243#24230'],'#13#10'da' +
      'ta0567.referring_date'#9' ['#25552#20132#26085#26399'],   Data0005.EMPLOYEE_NAME         ' +
      '   ['#30003#25253#20154'],'#13#10'data0567.CONTACT_NAME    ['#32852#32476#20154'],     data0567.CONTACT_' +
      'PHONE            ['#32852#32476#20154#30005#35805'],'#13#10'data0567.failure_date    ['#25925#38556#26085#26399'],   da' +
      'ta0567.failure_circs            ['#25925#38556#35828#26126'],'#13#10'data0567.disposal_date'#9 +
      ' ['#21463#29702#26085#26399'],   Data0005_1.EMPLOYEE_NAME as       ['#21463#29702#20154'],'#13#10'data0567.co' +
      'mplete_date'#9' ['#23436#24037#26085#26399'],   Data0005_2.EMPLOYEE_NAME as       ['#23436#24037#20154#21592'],' +
      #13#10'data0567.maintain_text'#9' ['#32500#20462#35760#24405'],   data0567.validate_appraise'#9' ' +
      '    ['#39564#25910#35780#20215'],'#13#10'data0567.fail_type'#9'     ['#24322#24120#31867#21035'],   data0567.maintain' +
      '_house           ['#23454#38469#32500#20462#26102#38388'],'#13#10'data0846.FaultName'#9'     ['#25925#38556#21517#31216'],   da' +
      'ta0846.stdDate'#9'                 ['#26631#20934#32500#20462#26102#38388'],'#13#10'isnull(cast(datediff(' +
      'mi,data0567.ent_date,data0567.complete_date)as  dec(12,2)) /60,0' +
      ') ['#25925#38556#32791#26102'],'#13#10#39#38599#21592#39'=convert(varchar(500),STUFF((SELECT '#39#65307#39' + data000' +
      '5.EMPLOYEE_NAME from data0842 '#13#10'       join data0005 on data0842' +
      '.Empl_ptr=data0005.rkey'#13#10'       where data0842.Work_ptr=data0567' +
      '.rkey FOR XML PATH('#39#39')), 1, 1, '#39#39')), '#13#10'case when data0846.stdDat' +
      'e>0 and data0567.Staff_Sum_house>0 then'#13#10'data0846.stdDate/data05' +
      '67.Staff_Sum_house else 0 end ['#36798#25104#29575']'#13#10'from data0567 '#13#10'join data04' +
      '17 on FASSET_PTR=data0417.rkey and EquiType=1'#13#10'join  Data0034 ON' +
      ' data0567.DEPT_PTR = Data0034.RKEY '#13#10'join  Data0005 ON EMPL_PTR ' +
      '= Data0005.RKEY '#13#10'left outer JOIN Data0005 AS Data0005_1 ON disp' +
      'osal_emplptr = Data0005_1.RKEY '#13#10'left outer join Data0005 AS Dat' +
      'a0005_2 ON completion_emplptr=Data0005_2.RKEY '#13#10'left outer join ' +
      'Data0015 ON whouse_ptr=data0015.rkey'#13#10'left join data0846 on data' +
      '0846.rkey=data0567.d846_ptr '#13#10'left join data0840 on data0567.D84' +
      '0_ptr=data0840.rkey'#13#10'where data0567.failure_date>:SD and data056' +
      '7.failure_date<=:ED'#13#10'and failure_degree='#39#29983#20135#20572#39039#39' '#13#10'and isnull(date' +
      'diff(ss,data0567.ent_date,data0567.complete_date) /3600,0)>= :DT' +
      ')as t1'
    FilterOptions = [foCaseInsensitive]
    ObjectView = False
    Params = <
      item
        DataType = ftDateTime
        Name = 'SD'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'ED'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'DT'
        ParamType = ptInput
        Value = 60
      end>
    ProviderName = 'dspMain'
    BeforeClose = cdsMainBeforeClose
    AfterInsert = cdsMainAfterInsert
    BeforeCancel = cdsMainBeforeCancel
    AfterCancel = cdsMainAfterCancel
    AfterDelete = cdsMainAfterDelete
    BeforeScroll = cdsMainBeforeScroll
    AfterScroll = cdsMainAfterScroll
    OnReconcileError = cdsMainReconcileError
    F_UKSaveNotEdit = False
    F_AutoNumb = False
    F_AutoSave = False
    F_SQLSelectFrom = 
      'select * from ('#13#10'select NUMBER ['#30003#35831#32534#21495'],data0417.FASSET_CODE ['#35774#22791#20195#30721 +
      '],data0417.FASSET_NAME ['#35774#22791#21517#31216'],'#13#10'case data0567.status when 0 then' +
      ' '#39#26410#25552#20132#39' when 1 then '#39#24453#21463#29702#39' when 2 then '#39#24050#21463#29702#39#13#10#9#9#9#9#9' WHEN 3 THEN '#39#24050 +
      #23436#24037#39' WHEN 4 THEN '#39#24050#39564#25910#39' WHEN 5 THEN '#39#34987#36864#22238#39' '#13#10#9#9#9#9#9' WHEN 6 THEN '#39#24050#26242#20572 +
      #39' WHEN 8 THEN '#39#39564#25910#36864#22238#39'  END AS ['#29366#24577'],'#13#10'Data0034.DEPT_NAME       ['#37096#38376 +
      #21517#31216'],   data0015.abbr_name                ['#24037#21378'], '#13#10'data0567.equipm' +
      'ent_grade ['#35774#22791#32423#21035'],   data0567.failure_degree'#9'         ['#24433#21709#31243#24230'],'#13#10'da' +
      'ta0567.referring_date'#9' ['#25552#20132#26085#26399'],   Data0005.EMPLOYEE_NAME         ' +
      '   ['#30003#25253#20154'],'#13#10'data0567.CONTACT_NAME    ['#32852#32476#20154'],     data0567.CONTACT_' +
      'PHONE            ['#32852#32476#20154#30005#35805'],'#13#10'data0567.failure_date    ['#25925#38556#26085#26399'],   da' +
      'ta0567.failure_circs            ['#25925#38556#35828#26126'],'#13#10'data0567.disposal_date'#9 +
      ' ['#21463#29702#26085#26399'],   Data0005_1.EMPLOYEE_NAME as       ['#21463#29702#20154'],'#13#10'data0567.co' +
      'mplete_date'#9' ['#23436#24037#26085#26399'],   Data0005_2.EMPLOYEE_NAME as       ['#23436#24037#20154#21592'],' +
      #13#10'data0567.maintain_text'#9' ['#32500#20462#35760#24405'],   data0567.validate_appraise'#9' ' +
      '    ['#39564#25910#35780#20215'],'#13#10'data0567.fail_type'#9'     ['#24322#24120#31867#21035'],   data0567.maintain' +
      '_house           ['#23454#38469#32500#20462#26102#38388'],'#13#10'data0846.FaultName'#9'     ['#25925#38556#21517#31216'],   da' +
      'ta0846.stdDate'#9'                 ['#26631#20934#32500#20462#26102#38388'],'#13#10'isnull(cast(datediff(' +
      'mi,data0567.ent_date,data0567.complete_date)as  dec(12,2)) /60,0' +
      ') ['#25925#38556#32791#26102'],'#13#10#39#38599#21592#39'=convert(varchar(500),STUFF((SELECT '#39#65307#39' + data000' +
      '5.EMPLOYEE_NAME from data0842 '#13#10'       join data0005 on data0842' +
      '.Empl_ptr=data0005.rkey'#13#10'       where data0842.Work_ptr=data0567' +
      '.rkey FOR XML PATH('#39#39')), 1, 1, '#39#39')), '#13#10'case when data0846.stdDat' +
      'e>0 and data0567.Staff_Sum_house>0 then'#13#10'data0846.stdDate/data05' +
      '67.Staff_Sum_house else 0 end ['#36798#25104#29575']'#13#10'from data0567 '#13#10'join data04' +
      '17 on FASSET_PTR=data0417.rkey and EquiType=1'#13#10'join  Data0034 ON' +
      ' data0567.DEPT_PTR = Data0034.RKEY '#13#10'join  Data0005 ON EMPL_PTR ' +
      '= Data0005.RKEY '#13#10'left outer JOIN Data0005 AS Data0005_1 ON disp' +
      'osal_emplptr = Data0005_1.RKEY '#13#10'left outer join Data0005 AS Dat' +
      'a0005_2 ON completion_emplptr=Data0005_2.RKEY '#13#10'left outer join ' +
      'Data0015 ON whouse_ptr=data0015.rkey'#13#10'left join data0846 on data' +
      '0846.rkey=data0567.d846_ptr '#13#10'left join data0840 on data0567.D84' +
      '0_ptr=data0840.rkey'#13#10'where data0567.failure_date>:SD and data056' +
      '7.failure_date<=:ED'#13#10'and failure_degree='#39#29983#20135#20572#39039#39' '#13#10'and isnull(date' +
      'diff(ss,data0567.ent_date,data0567.complete_date) /3600,0)>= :DT' +
      ')as t1'
    F_SQLOrderBy = 'order by t1.['#35774#22791#20195#30721'],t1.'#25925#38556#26085#26399
    Left = 56
    Top = 173
    object cdsMain2CDSDesigner: TStringField
      FieldName = #30003#35831#32534#21495
      Size = 15
    end
    object cdsMain2CDSDesigner2: TStringField
      FieldName = #35774#22791#20195#30721
    end
    object cdsMain2CDSDesigner3: TStringField
      FieldName = #35774#22791#21517#31216
      Size = 30
    end
    object cdsMain2CDSDesigner26: TBCDField
      FieldName = #25925#38556#32791#26102
      ReadOnly = True
      DisplayFormat = '0.00'
      Precision = 16
      Size = 6
    end
    object cdsMain2CDSDesigner22: TBCDField
      FieldName = #23454#38469#32500#20462#26102#38388
      Precision = 8
      Size = 2
    end
    object cdsMain2CDSDesigner4: TStringField
      FieldName = #29366#24577
      ReadOnly = True
      Size = 8
    end
    object cdsMain2CDSDesigner5: TStringField
      FieldName = #37096#38376#21517#31216
      Size = 30
    end
    object cdsMain2CDSDesigner6: TStringField
      FieldName = #24037#21378
      Size = 10
    end
    object cdsMain2CDSDesigner7: TStringField
      FieldName = #35774#22791#32423#21035
      Size = 10
    end
    object cdsMain2CDSDesigner8: TStringField
      FieldName = #24433#21709#31243#24230
      Size = 8
    end
    object cdsMain2CDSDesigner9: TDateTimeField
      FieldName = #25552#20132#26085#26399
    end
    object cdsMain2CDSDesigner10: TStringField
      FieldName = #30003#25253#20154
      Size = 16
    end
    object cdsMain2CDSDesigner11: TStringField
      FieldName = #32852#32476#20154
      Size = 10
    end
    object cdsMain2CDSDesigner12: TStringField
      FieldName = #32852#32476#20154#30005#35805
      Size = 15
    end
    object cdsMain2CDSDesigner13: TDateTimeField
      FieldName = #25925#38556#26085#26399
    end
    object cdsMain2CDSDesigner14: TStringField
      FieldName = #25925#38556#35828#26126
      Size = 200
    end
    object cdsMain2CDSDesigner15: TDateTimeField
      FieldName = #21463#29702#26085#26399
    end
    object cdsMain2CDSDesigner16: TStringField
      FieldName = #21463#29702#20154
      Size = 16
    end
    object cdsMain2CDSDesigner17: TDateTimeField
      FieldName = #23436#24037#26085#26399
    end
    object cdsMain2CDSDesigner18: TStringField
      FieldName = #23436#24037#20154#21592
      Size = 16
    end
    object cdsMain2CDSDesigner19: TStringField
      FieldName = #32500#20462#35760#24405
      Size = 200
    end
    object cdsMain2CDSDesigner20: TStringField
      FieldName = #39564#25910#35780#20215
      Size = 50
    end
    object cdsMain2CDSDesigner21: TStringField
      FieldName = #24322#24120#31867#21035
      Size = 30
    end
    object cdsMain2CDSDesigner23: TStringField
      FieldName = #25925#38556#21517#31216
      Size = 50
    end
    object cdsMain2CDSDesigner24: TBCDField
      FieldName = #26631#20934#32500#20462#26102#38388
      Precision = 9
      Size = 2
    end
    object cdsMain2CDSDesigner33: TBCDField
      FieldName = #36798#25104#29575
      ReadOnly = True
      Precision = 20
      Size = 11
    end
    object cdsMain2CDSDesigner25: TStringField
      FieldName = #38599#21592
      ReadOnly = True
      Size = 500
    end
  end
  object DataSource2: TDataSource
    DataSet = cdsMain2
    Left = 109
    Top = 171
  end
  object cdsMain3: Tcds
    Aggregates = <>
    CommandText = 
      'select * from ('#13#10'select NUMBER ['#30003#35831#32534#21495'],data0417.FASSET_CODE ['#35774#22791#20195#30721 +
      '],data0417.FASSET_NAME ['#35774#22791#21517#31216'],'#13#10'case data0567.status when 0 then' +
      ' '#39#26410#25552#20132#39' when 1 then '#39#24453#21463#29702#39' when 2 then '#39#24050#21463#29702#39#13#10#9#9#9#9#9' WHEN 3 THEN '#39#24050 +
      #23436#24037#39' WHEN 4 THEN '#39#24050#39564#25910#39' WHEN 5 THEN '#39#34987#36864#22238#39' '#13#10#9#9#9#9#9' WHEN 6 THEN '#39#24050#26242#20572 +
      #39' WHEN 8 THEN '#39#39564#25910#36864#22238#39'  END AS '#29366#24577','#13#10'Data0034.DEPT_NAME       ['#37096#38376#21517#31216 +
      '],   data0015.abbr_name                ['#24037#21378'], '#13#10'data0567.equipmen' +
      't_grade ['#35774#22791#32423#21035'],   data0567.failure_degree'#9'         ['#24433#21709#31243#24230'],'#13#10'data' +
      '0567.referring_date'#9' ['#25552#20132#26085#26399'],   Data0005.EMPLOYEE_NAME           ' +
      ' ['#30003#25253#20154'],'#13#10'data0567.CONTACT_NAME    ['#32852#32476#20154'],     data0567.CONTACT_PH' +
      'ONE            ['#32852#32476#20154#30005#35805'],'#13#10'data0567.failure_date    ['#25925#38556#26085#26399'],   data' +
      '0567.failure_circs            ['#25925#38556#35828#26126'],'#13#10'data0567.disposal_date'#9' [' +
      #21463#29702#26085#26399'],   Data0005_1.EMPLOYEE_NAME as       ['#21463#29702#20154'],'#13#10'data0567.comp' +
      'lete_date'#9' ['#23436#24037#26085#26399'],   Data0005_2.EMPLOYEE_NAME as       ['#23436#24037#20154#21592'],'#13#10 +
      'data0567.maintain_text'#9' ['#32500#20462#35760#24405'],   data0567.validate_appraise'#9'   ' +
      '  ['#39564#25910#35780#20215'],'#13#10'data0567.fail_type'#9'     ['#24322#24120#31867#21035'],   data0567.maintain_h' +
      'ouse           ['#23454#38469#32500#20462#26102#38388'],'#13#10'data0846.FaultName'#9'     ['#25925#38556#21517#31216'],   data' +
      '0846.stdDate'#9'                 ['#26631#20934#32500#20462#26102#38388'],'#13#10'isnull(cast(datediff(mi' +
      ',data0567.ent_date,data0567.complete_date)as  dec(12,2)) /60,0) ' +
      '['#25925#38556#32791#26102'],'#13#10#39#38599#21592#39'=convert(varchar(500),STUFF((SELECT '#39#65307#39' + data0005.' +
      'EMPLOYEE_NAME from data0842 '#13#10'       join data0005 on data0842.E' +
      'mpl_ptr=data0005.rkey'#13#10'       where data0842.Work_ptr=data0567.r' +
      'key FOR XML PATH('#39#39')), 1, 1, '#39#39')), '#13#10'case when data0846.stdDate>' +
      '0 and data0567.Staff_Sum_house>0 then'#13#10'data0846.stdDate/data0567' +
      '.Staff_Sum_house else 0 end ['#36798#25104#29575']'#13#10'from data0567 '#13#10'join data0417' +
      ' on FASSET_PTR=data0417.rkey and EquiType=1'#13#10'join  Data0034 ON d' +
      'ata0567.DEPT_PTR = Data0034.RKEY '#13#10'join  Data0005 ON EMPL_PTR = ' +
      'Data0005.RKEY '#13#10'left outer JOIN Data0005 AS Data0005_1 ON dispos' +
      'al_emplptr = Data0005_1.RKEY '#13#10'left outer join Data0005 AS Data0' +
      '005_2 ON completion_emplptr=Data0005_2.RKEY '#13#10'left outer join Da' +
      'ta0015 ON whouse_ptr=data0015.rkey'#13#10'left join data0846 on data08' +
      '46.rkey=data0567.d846_ptr '#13#10'left join data0840 on data0567.D840_' +
      'ptr=data0840.rkey'#13#10'where data0567.failure_date>:SD and data0567.' +
      'failure_date<=:ED'#13#10'and failure_degree in('#39#24433#21709#29983#20135#39','#39#29983#20135#20572#39039#39','#39#20173#21487#29983#20135#39') a' +
      'nd data0567.maintain_house>= :DT )as t1'
    FilterOptions = [foCaseInsensitive]
    ObjectView = False
    Params = <
      item
        DataType = ftDateTime
        Name = 'SD'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'ED'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'DT'
        ParamType = ptUnknown
        Value = 60
      end>
    ProviderName = 'dspMain'
    BeforeClose = cdsMainBeforeClose
    AfterInsert = cdsMainAfterInsert
    BeforeCancel = cdsMainBeforeCancel
    AfterCancel = cdsMainAfterCancel
    AfterDelete = cdsMainAfterDelete
    BeforeScroll = cdsMainBeforeScroll
    AfterScroll = cdsMainAfterScroll
    OnReconcileError = cdsMainReconcileError
    F_UKSaveNotEdit = False
    F_AutoNumb = False
    F_AutoSave = False
    F_SQLSelectFrom = 
      'select * from ('#13#10'select NUMBER ['#30003#35831#32534#21495'],data0417.FASSET_CODE ['#35774#22791#20195#30721 +
      '],data0417.FASSET_NAME ['#35774#22791#21517#31216'],'#13#10'case data0567.status when 0 then' +
      ' '#39#26410#25552#20132#39' when 1 then '#39#24453#21463#29702#39' when 2 then '#39#24050#21463#29702#39#13#10#9#9#9#9#9' WHEN 3 THEN '#39#24050 +
      #23436#24037#39' WHEN 4 THEN '#39#24050#39564#25910#39' WHEN 5 THEN '#39#34987#36864#22238#39' '#13#10#9#9#9#9#9' WHEN 6 THEN '#39#24050#26242#20572 +
      #39' WHEN 8 THEN '#39#39564#25910#36864#22238#39'  END AS '#29366#24577','#13#10'Data0034.DEPT_NAME       ['#37096#38376#21517#31216 +
      '],   data0015.abbr_name                ['#24037#21378'], '#13#10'data0567.equipmen' +
      't_grade ['#35774#22791#32423#21035'],   data0567.failure_degree'#9'         ['#24433#21709#31243#24230'],'#13#10'data' +
      '0567.referring_date'#9' ['#25552#20132#26085#26399'],   Data0005.EMPLOYEE_NAME           ' +
      ' ['#30003#25253#20154'],'#13#10'data0567.CONTACT_NAME    ['#32852#32476#20154'],     data0567.CONTACT_PH' +
      'ONE            ['#32852#32476#20154#30005#35805'],'#13#10'data0567.failure_date    ['#25925#38556#26085#26399'],   data' +
      '0567.failure_circs            ['#25925#38556#35828#26126'],'#13#10'data0567.disposal_date'#9' [' +
      #21463#29702#26085#26399'],   Data0005_1.EMPLOYEE_NAME as       ['#21463#29702#20154'],'#13#10'data0567.comp' +
      'lete_date'#9' ['#23436#24037#26085#26399'],   Data0005_2.EMPLOYEE_NAME as       ['#23436#24037#20154#21592'],'#13#10 +
      'data0567.maintain_text'#9' ['#32500#20462#35760#24405'],   data0567.validate_appraise'#9'   ' +
      '  ['#39564#25910#35780#20215'],'#13#10'data0567.fail_type'#9'     ['#24322#24120#31867#21035'],   data0567.maintain_h' +
      'ouse           ['#23454#38469#32500#20462#26102#38388'],'#13#10'data0846.FaultName'#9'     ['#25925#38556#21517#31216'],   data' +
      '0846.stdDate'#9'                 ['#26631#20934#32500#20462#26102#38388'],'#13#10'isnull(cast(datediff(mi' +
      ',data0567.ent_date,data0567.complete_date)as  dec(12,2)) /60,0) ' +
      '['#25925#38556#32791#26102'],'#13#10#39#38599#21592#39'=convert(varchar(500),STUFF((SELECT '#39#65307#39' + data0005.' +
      'EMPLOYEE_NAME from data0842 '#13#10'       join data0005 on data0842.E' +
      'mpl_ptr=data0005.rkey'#13#10'       where data0842.Work_ptr=data0567.r' +
      'key FOR XML PATH('#39#39')), 1, 1, '#39#39')), '#13#10'case when data0846.stdDate>' +
      '0 and data0567.Staff_Sum_house>0 then'#13#10'data0846.stdDate/data0567' +
      '.Staff_Sum_house else 0 end ['#36798#25104#29575']'#13#10'from data0567 '#13#10'join data0417' +
      ' on FASSET_PTR=data0417.rkey and EquiType=1'#13#10'join  Data0034 ON d' +
      'ata0567.DEPT_PTR = Data0034.RKEY '#13#10'join  Data0005 ON EMPL_PTR = ' +
      'Data0005.RKEY '#13#10'left outer JOIN Data0005 AS Data0005_1 ON dispos' +
      'al_emplptr = Data0005_1.RKEY '#13#10'left outer join Data0005 AS Data0' +
      '005_2 ON completion_emplptr=Data0005_2.RKEY '#13#10'left outer join Da' +
      'ta0015 ON whouse_ptr=data0015.rkey'#13#10'left join data0846 on data08' +
      '46.rkey=data0567.d846_ptr '#13#10'left join data0840 on data0567.D840_' +
      'ptr=data0840.rkey'#13#10'where data0567.failure_date>:SD and data0567.' +
      'failure_date<=:ED'#13#10'and failure_degree in('#39#24433#21709#29983#20135#39','#39#29983#20135#20572#39039#39','#39#20173#21487#29983#20135#39') a' +
      'nd data0567.maintain_house>= :DT )as t1'
    F_SQLOrderBy = 'order by t1.['#35774#22791#20195#30721'],t1.'#25925#38556#26085#26399
    Left = 57
    Top = 221
    object StringField1: TStringField
      FieldName = #30003#35831#32534#21495
      Size = 15
    end
    object StringField2: TStringField
      FieldName = #35774#22791#20195#30721
    end
    object StringField3: TStringField
      FieldName = #35774#22791#21517#31216
      Size = 30
    end
    object StringField4: TStringField
      FieldName = #29366#24577
      ReadOnly = True
      Size = 8
    end
    object StringField5: TStringField
      FieldName = #37096#38376#21517#31216
      Size = 30
    end
    object StringField6: TStringField
      FieldName = #24037#21378
      Size = 10
    end
    object StringField7: TStringField
      FieldName = #35774#22791#32423#21035
      Size = 10
    end
    object StringField8: TStringField
      FieldName = #24433#21709#31243#24230
      Size = 8
    end
    object DateTimeField1: TDateTimeField
      FieldName = #25552#20132#26085#26399
    end
    object StringField9: TStringField
      FieldName = #30003#25253#20154
      Size = 16
    end
    object StringField10: TStringField
      FieldName = #32852#32476#20154
      Size = 10
    end
    object StringField11: TStringField
      FieldName = #32852#32476#20154#30005#35805
      Size = 15
    end
    object DateTimeField2: TDateTimeField
      FieldName = #25925#38556#26085#26399
    end
    object StringField12: TStringField
      FieldName = #25925#38556#35828#26126
      Size = 200
    end
    object DateTimeField3: TDateTimeField
      FieldName = #21463#29702#26085#26399
    end
    object StringField13: TStringField
      FieldName = #21463#29702#20154
      Size = 16
    end
    object DateTimeField4: TDateTimeField
      FieldName = #23436#24037#26085#26399
    end
    object StringField14: TStringField
      FieldName = #23436#24037#20154#21592
      Size = 16
    end
    object StringField15: TStringField
      FieldName = #32500#20462#35760#24405
      Size = 200
    end
    object StringField16: TStringField
      FieldName = #39564#25910#35780#20215
      Size = 50
    end
    object StringField17: TStringField
      FieldName = #24322#24120#31867#21035
      Size = 30
    end
    object StringField18: TStringField
      FieldName = #38599#21592
      Size = 16
    end
    object cdsMain3CDSDesigner4: TBCDField
      FieldName = #25925#38556#32791#26102
      ReadOnly = True
      Precision = 16
      Size = 6
    end
    object BCDField1: TBCDField
      FieldName = #23454#38469#32500#20462#26102#38388
      Precision = 8
      Size = 2
    end
    object cdsMain3CDSDesigner: TStringField
      FieldName = #25925#38556#21517#31216
      Size = 50
    end
    object cdsMain3CDSDesigner2: TBCDField
      FieldName = #26631#20934#32500#20462#26102#38388
      Precision = 9
      Size = 2
    end
    object cdsMain3CDSDesigner3: TBCDField
      FieldName = #36798#25104#29575
      ReadOnly = True
      Precision = 20
      Size = 11
    end
  end
  object cds0015: TClientDataSet
    Aggregates = <>
    CommandText = 'select RKEY,WAREHOUSE_CODE,ABBR_NAME from data0015'#13#10
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 501
    Top = 312
    object cds0015RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
      Visible = False
    end
    object cds0015WAREHOUSE_CODE: TStringField
      DisplayLabel = #24037#21378#20195#30721
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object cds0015ABBR_NAME: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'ABBR_NAME'
      Size = 10
    end
  end
  object cds0417: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select data0417.rkey,rtrim(data0417.FASSET_CODE)FASSET_CODE,FASS' +
      'ET_NAME,FASSET_DESC,data0034.DEPT_CODE,data0034.DEPT_NAME'#13#10'from ' +
      'data0417 join data0034 on data0417.DEPT_PTR=data0034.rkey'#13#10'where' +
      ' data0417.active_flag not in (5,6)'#13#10'order by data0417. FASSET_CO' +
      'DE'
    FilterOptions = [foCaseInsensitive]
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 617
    Top = 310
    object cds0417FASSET_CODE: TStringField
      DisplayLabel = #35774#22791#20195#30721
      DisplayWidth = 20
      FieldName = 'FASSET_CODE'
    end
    object cds0417FASSET_NAME: TStringField
      DisplayLabel = #35774#22791#21517#31216
      DisplayWidth = 30
      FieldName = 'FASSET_NAME'
      Size = 30
    end
    object cds0417FASSET_DESC: TStringField
      DisplayLabel = #35774#22791#25551#36848
      FieldName = 'FASSET_DESC'
      Visible = False
      Size = 40
    end
    object cds0417rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
    object cds0417DEPT_CODE: TStringField
      DisplayLabel = #37096#38376#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object cds0417DEPT_NAME: TStringField
      DisplayLabel = #37096#38376#21517#31216
      DisplayWidth = 20
      FieldName = 'DEPT_NAME'
      Size = 30
    end
  end
  object cds840: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from data0840'
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 681
    Top = 310
    object cds840rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
    object cds840Location: TStringField
      DisplayLabel = #36131#20219#23567#32452
      FieldName = 'Location'
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsMain1
    Left = 109
    Top = 123
  end
  object cds0005: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select RKEY,EMPL_CODE,EMPLOYEE_NAME from data0005'#13#10'where ACTIVE_' +
      'FLAG='#39'Y'#39
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 561
    Top = 310
    object cds0005RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
      Visible = False
    end
    object cds0005EMPL_CODE: TStringField
      DisplayLabel = #38599#21592#20195#30721
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object cds0005EMPLOYEE_NAME: TStringField
      DisplayLabel = #38599#21592#21517#31216
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
  end
  object DataSource4: TDataSource
    DataSet = cdsMain4
    Left = 110
    Top = 267
  end
  object cdsMain4: Tcds
    Aggregates = <>
    CommandText = 
      'select * from (select '#13#10'data0417.FASSET_CODE   ['#35774#22791#20195#30721'],    data04' +
      '17.FASSET_NAME   ['#35774#22791#21517#31216'],'#13#10'Data0034.DEPT_CODE     ['#37096#38376#20195#30721'],    Data' +
      '0034.DEPT_NAME     ['#37096#38376#21517#31216'],'#13#10'data0417.LOCATION      ['#20301#32622'],        ' +
      'data0015.ABBR_NAME     ['#24037#21378'],'#13#10'data0831.PlanMainDate  ['#35745#21010#20445#20859#26102#38388'],da' +
      'ta0831.MainCycl'#9'     ['#20445#20859#21608#26399'],'#13#10'data0831.StarMainTime  ['#24320#22987#20445#20859#26102#38388'],da' +
      'ta0831.ActuCompTime  ['#20445#20859#23454#38469#23436#25104#26085#26399'],'#13#10'data0831.TimeCons'#9'   ['#20445#20859#28040#32791#26102#38388'],' +
      'data0831.StdTimeCons   ['#26631#20934#28040#32791#26102#38388'],'#13#10'data0831.TimeCons/data0831.Std' +
      'TimeCons ['#36798#25104#29575'],'#13#10'data0567.NUMBER        ['#30003#35831#32534#21495'],'#13#10'isnull(cast(dat' +
      'ediff(mi,data0567.ent_date,data0567.complete_date)as  dec(12,2))' +
      ' /60,0) ['#25925#38556#32791#26102'],'#13#10'case data0567.status when 0 then '#39#26410#25552#20132#39' when 1 t' +
      'hen '#39#24453#21463#29702#39' when 2 then '#39#24050#21463#29702#39#13#10'                     when 3 then '#39#24050 +
      #23436#24037#39' when 4 then '#39#24050#39564#25910#39' when 5 then '#39#34987#36864#22238#39' '#13#10'                     w' +
      'hen 6 then '#39#24050#26242#20572#39' when 8 then '#39#39564#25910#36864#22238#39'  end as ['#29366#24577'],'#13#10'data0567.fail' +
      'ure_degree'#9'  ['#24433#21709#31243#24230'],data0567.failure_circs'#9'  ['#25925#38556#35828#26126'], '#13#10'data0567.' +
      'validate_appraise['#39564#25910#35780#20215'],data0567.disposal_date'#9'  ['#21463#29702#26085#26399'],'#13#10'data05' +
      '67.maintain_text'#9'  ['#32500#20462#35760#24405'],data0567.complete_date'#9'  ['#32500#20462#23436#24037#26085#26399'], '#13#10'd' +
      'ata0567.stop_house'#9'      ['#26242#20572#23567#26102'],data0567.maintain_house  ['#23454#38469#32500#20462#26102#38388 +
      '], '#13#10'data0567.fail_type'#9'      ['#24322#24120#31867#21035'], '#13#10#39#38599#21592#39'=convert(varchar(500' +
      '),STUFF((SELECT '#39#65307#39' + data0005.EMPLOYEE_NAME from data0848 '#13#10'   ' +
      '    join data0005 on data0848.Empl_ptr=data0005.rkey'#13#10'       whe' +
      're data0848.Work_ptr=data0831.rkey FOR XML PATH('#39#39')), 1, 1, '#39#39'))' +
      ',          '#13#10'dateDiff(day, data0831.StarMainTime,data0567.dispos' +
      'al_date)['#38388#38548#22825']'#13#10'from data0417 '#13#10'join data0034 on data0417.DEPT_PT' +
      'R=data0034.rkey'#13#10'join data0567 on data0417.rkey=data0567.FASSET_' +
      'PTR and data0567.maintain_house>=:vMaintain_house '#13#10'and data0567' +
      '.failure_degree='#39#29983#20135#20572#39039#39#13#10' /*'#32500#20462'.'#23454#38469#32500#20462#26102#38388'>=2'#23567#26102'*/ '#13#10'join data0831 on d' +
      'ata0417.FASSET_CODE=data0831.DeviNumb  '#13#10'and dateDiff(day,data08' +
      '31.StarMainTime,data0567.disposal_date)between 0 and :vDisposal_' +
      'date'#13#10'join data0015 on data0417.warehouse_ptr=data0015.rkey'#13#10'whe' +
      're data0567.failure_date>:SD and data0567.failure_date<=:ED  '#13#10'a' +
      'nd data0831.TimeCons>0 and ( not data0831.TimeCons is null) '#13#10'an' +
      'd data0831.StdTimeCons>0 and ( not data0831.StdTimeCons is null)' +
      ' '#13#10'and cast(datediff(mi,data0567.ent_date,data0567.complete_date' +
      ')as  dec(12,2)) >0'#13#10' /*'#35774#22791#32500#20462'.'#21463#29702#26085#26399'-'#20445#20859#35745#21010'.'#24320#22987#20445#20859#26102#38388'<=30*/ )as t1'
    FilterOptions = [foCaseInsensitive]
    ObjectView = False
    Params = <
      item
        DataType = ftUnknown
        Name = 'vMaintain_house'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vDisposal_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ED'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspMain'
    BeforeClose = cdsMainBeforeClose
    AfterInsert = cdsMainAfterInsert
    BeforeCancel = cdsMainBeforeCancel
    AfterCancel = cdsMainAfterCancel
    AfterDelete = cdsMainAfterDelete
    BeforeScroll = cdsMainBeforeScroll
    AfterScroll = cdsMainAfterScroll
    OnReconcileError = cdsMainReconcileError
    F_UKSaveNotEdit = False
    F_AutoNumb = False
    F_AutoSave = False
    F_SQLSelectFrom = 
      'select * from (select '#13#10'data0417.FASSET_CODE   ['#35774#22791#20195#30721'],    data04' +
      '17.FASSET_NAME   ['#35774#22791#21517#31216'],'#13#10'Data0034.DEPT_CODE     ['#37096#38376#20195#30721'],    Data' +
      '0034.DEPT_NAME     ['#37096#38376#21517#31216'],'#13#10'data0417.LOCATION      ['#20301#32622'],        ' +
      'data0015.ABBR_NAME     ['#24037#21378'],'#13#10'data0831.PlanMainDate  ['#35745#21010#20445#20859#26102#38388'],da' +
      'ta0831.MainCycl'#9'     ['#20445#20859#21608#26399'],'#13#10'data0831.StarMainTime  ['#24320#22987#20445#20859#26102#38388'],da' +
      'ta0831.ActuCompTime  ['#20445#20859#23454#38469#23436#25104#26085#26399'],'#13#10'data0831.TimeCons'#9'   ['#20445#20859#28040#32791#26102#38388'],' +
      'data0831.StdTimeCons   ['#26631#20934#28040#32791#26102#38388'],'#13#10'data0831.TimeCons/data0831.Std' +
      'TimeCons ['#36798#25104#29575'],'#13#10'data0567.NUMBER        ['#30003#35831#32534#21495'],'#13#10'isnull(cast(dat' +
      'ediff(mi,data0567.ent_date,data0567.complete_date)as  dec(12,2))' +
      ' /60,0) ['#25925#38556#32791#26102'],'#13#10'case data0567.status when 0 then '#39#26410#25552#20132#39' when 1 t' +
      'hen '#39#24453#21463#29702#39' when 2 then '#39#24050#21463#29702#39#13#10'                     when 3 then '#39#24050 +
      #23436#24037#39' when 4 then '#39#24050#39564#25910#39' when 5 then '#39#34987#36864#22238#39' '#13#10'                     w' +
      'hen 6 then '#39#24050#26242#20572#39' when 8 then '#39#39564#25910#36864#22238#39'  end as ['#29366#24577'],'#13#10'data0567.fail' +
      'ure_degree'#9'  ['#24433#21709#31243#24230'],data0567.failure_circs'#9'  ['#25925#38556#35828#26126'], '#13#10'data0567.' +
      'validate_appraise['#39564#25910#35780#20215'],data0567.disposal_date'#9'  ['#21463#29702#26085#26399'],'#13#10'data05' +
      '67.maintain_text'#9'  ['#32500#20462#35760#24405'],data0567.complete_date'#9'  ['#32500#20462#23436#24037#26085#26399'], '#13#10'd' +
      'ata0567.stop_house'#9'      ['#26242#20572#23567#26102'],data0567.maintain_house  ['#23454#38469#32500#20462#26102#38388 +
      '], '#13#10'data0567.fail_type'#9'      ['#24322#24120#31867#21035'], '#13#10#39#38599#21592#39'=convert(varchar(500' +
      '),STUFF((SELECT '#39#65307#39' + data0005.EMPLOYEE_NAME from data0848 '#13#10'   ' +
      '    join data0005 on data0848.Empl_ptr=data0005.rkey'#13#10'       whe' +
      're data0848.Work_ptr=data0831.rkey FOR XML PATH('#39#39')), 1, 1, '#39#39'))' +
      ',          '#13#10'dateDiff(day, data0831.StarMainTime,data0567.dispos' +
      'al_date)['#38388#38548#22825']'#13#10'from data0417 '#13#10'join data0034 on data0417.DEPT_PT' +
      'R=data0034.rkey'#13#10'join data0567 on data0417.rkey=data0567.FASSET_' +
      'PTR and data0567.maintain_house>=:vMaintain_house '#13#10'and data0567' +
      '.failure_degree='#39#29983#20135#20572#39039#39#13#10' /*'#32500#20462'.'#23454#38469#32500#20462#26102#38388'>=2'#23567#26102'*/ '#13#10'join data0831 on d' +
      'ata0417.FASSET_CODE=data0831.DeviNumb  '#13#10'and dateDiff(day,data08' +
      '31.StarMainTime,data0567.disposal_date)between 0 and :vDisposal_' +
      'date'#13#10'join data0015 on data0417.warehouse_ptr=data0015.rkey'#13#10'whe' +
      're data0567.failure_date>:SD and data0567.failure_date<=:ED  '#13#10'a' +
      'nd data0831.TimeCons>0 and ( not data0831.TimeCons is null) '#13#10'an' +
      'd data0831.StdTimeCons>0 and ( not data0831.StdTimeCons is null)' +
      ' '#13#10'and cast(datediff(mi,data0567.ent_date,data0567.complete_date' +
      ')as  dec(12,2)) >0'#13#10' /*'#35774#22791#32500#20462'.'#21463#29702#26085#26399'-'#20445#20859#35745#21010'.'#24320#22987#20445#20859#26102#38388'<=30*/ )as t1'
    Left = 57
    Top = 269
    object cdsMain4CDSDesigner: TStringField
      FieldName = #35774#22791#20195#30721
    end
    object cdsMain4CDSDesigner2: TStringField
      FieldName = #35774#22791#21517#31216
      Size = 30
    end
    object cdsMain4CDSDesigner3: TStringField
      FieldName = #37096#38376#20195#30721
      Size = 10
    end
    object cdsMain4CDSDesigner4: TStringField
      FieldName = #37096#38376#21517#31216
      Size = 30
    end
    object cdsMain4CDSDesigner31: TStringField
      FieldName = #24037#21378
      Size = 10
    end
    object cdsMain4CDSDesigner5: TStringField
      FieldName = #20301#32622
      Size = 40
    end
    object cdsMain4CDSDesigner6: TDateTimeField
      FieldName = #35745#21010#20445#20859#26102#38388
    end
    object cdsMain4CDSDesigner7: TStringField
      FieldName = #20445#20859#21608#26399
      Size = 10
    end
    object cdsMain4CDSDesigner8: TDateTimeField
      FieldName = #24320#22987#20445#20859#26102#38388
    end
    object cdsMain4CDSDesigner24: TDateTimeField
      FieldName = #20445#20859#23454#38469#23436#25104#26085#26399
    end
    object cdsMain4CDSDesigner10: TBCDField
      FieldName = #20445#20859#28040#32791#26102#38388
      Precision = 10
      Size = 2
    end
    object cdsMain4CDSDesigner11: TBCDField
      FieldName = #26631#20934#28040#32791#26102#38388
      Precision = 9
      Size = 2
    end
    object cdsMain4CDSDesigner12: TBCDField
      FieldName = #36798#25104#29575
      ReadOnly = True
      OnGetText = cdsMain4CDSDesigner12GetText
      Precision = 22
      Size = 12
    end
    object cdsMain4CDSDesigner13: TStringField
      FieldName = #30003#35831#32534#21495
      Size = 15
    end
    object cdsMain4CDSDesigner14: TStringField
      FieldName = #29366#24577
      ReadOnly = True
      Size = 8
    end
    object cdsMain4CDSDesigner15: TStringField
      FieldName = #24433#21709#31243#24230
      Size = 8
    end
    object cdsMain4CDSDesigner16: TStringField
      FieldName = #25925#38556#35828#26126
      Size = 200
    end
    object cdsMain4CDSDesigner17: TStringField
      FieldName = #39564#25910#35780#20215
      Size = 50
    end
    object cdsMain4CDSDesigner18: TDateTimeField
      FieldName = #21463#29702#26085#26399
    end
    object cdsMain4CDSDesigner19: TStringField
      FieldName = #32500#20462#35760#24405
      Size = 200
    end
    object cdsMain4CDSDesigner25: TDateTimeField
      FieldName = #32500#20462#23436#24037#26085#26399
    end
    object cdsMain4CDSDesigner32: TStringField
      FieldName = #24322#24120#31867#21035
      Size = 30
    end
    object cdsMain4CDSDesigner21: TBCDField
      FieldName = #26242#20572#23567#26102
      Precision = 8
      Size = 2
    end
    object cdsMain4CDSDesigner20: TBCDField
      FieldName = #25925#38556#32791#26102
      ReadOnly = True
      Precision = 16
      Size = 6
    end
    object cdsMain4CDSDesigner22: TBCDField
      FieldName = #23454#38469#32500#20462#26102#38388
      Precision = 8
      Size = 2
    end
    object cdsMain4CDSDesigner23: TIntegerField
      FieldName = #38388#38548#22825
      ReadOnly = True
    end
    object cdsMain4CDSDesigner9: TStringField
      FieldName = #38599#21592
      ReadOnly = True
      Size = 500
    end
  end
  object cdsMain5: Tcds
    Aggregates = <>
    CommandText = 
      'select * from (select '#13#10'data0417.FASSET_CODE   ['#35774#22791#20195#30721'],'#13#10'data0417' +
      '.FASSET_NAME   ['#35774#22791#21517#31216'],'#13#10'Data0034.DEPT_CODE     ['#37096#38376#20195#30721'],'#13#10'Data0034' +
      '.DEPT_NAME     ['#37096#38376#21517#31216'],'#13#10'data0417.LOCATION      ['#20301#32622'],'#13#10'data0015.A' +
      'BBR_NAME     ['#24037#21378'],'#13#10'data0831.PlanMainDate  ['#35745#21010#20445#20859#26102#38388'],'#13#10'data0831.M' +
      'ainCycl'#9'   ['#20445#20859#21608#26399'],'#13#10'data0831.StarMainTime  ['#24320#22987#20445#20859#26102#38388'],'#13#10'data0831.A' +
      'ctuCompTime  ['#20445#20859#23454#38469#23436#25104#26085#26399'],'#13#10'data0831.TimeCons'#9'   ['#20445#20859#28040#32791#26102#38388'],'#13#10'data08' +
      '31.StdTimeCons   ['#26631#20934#28040#32791#26102#38388'],'#13#10'data0831.TimeCons/data0831.StdTimeCo' +
      'ns ['#36798#25104#29575'],'#13#10'data0567.NUMBER        ['#30003#35831#32534#21495'],'#13#10'case data0567.status ' +
      'when 0 then '#39#26410#25552#20132#39' when 1 then '#39#24453#21463#29702#39' when 2 then '#39#24050#21463#29702#39#13#10'         ' +
      '            when 3 then '#39#24050#23436#24037#39' when 4 then '#39#24050#39564#25910#39' when 5 then '#39#34987#36864#22238 +
      #39' '#13#10'                     when 6 then '#39#24050#26242#20572#39' when 8 then '#39#39564#25910#36864#22238#39'  e' +
      'nd as ['#29366#24577'],'#13#10'data0567.failure_degree'#9'  ['#24433#21709#31243#24230'],   '#13#10'data0567.fail' +
      'ure_circs'#9'  ['#25925#38556#35828#26126'], '#13#10'data0567.validate_appraise['#39564#25910#35780#20215'],   '#13#10'data' +
      '0567.disposal_date'#9'  ['#21463#29702#26085#26399'],'#13#10'data0567.maintain_text'#9'  ['#32500#20462#35760#24405'],'#13#10 +
      'data0567.complete_date'#9'  ['#32500#20462#23436#24037#26085#26399'], '#13#10'data0567.stop_house'#9'      [' +
      #26242#20572#23567#26102'],'#13#10'data0567.maintain_house'#9'  ['#23454#38469#32500#20462#26102#38388'], '#13#10'isnull(cast(datedi' +
      'ff(mi,data0567.ent_date,data0567.complete_date)as  dec(12,2)) /6' +
      '0,0) ['#25925#38556#32791#26102'],'#13#10'data0567.fail_type'#9'      ['#24322#24120#31867#21035'],   '#13#10#39#38599#21592#39'=convert(' +
      'varchar(500),STUFF((SELECT '#39#65307#39' + data0005.EMPLOYEE_NAME from dat' +
      'a0848 '#13#10'       join data0005 on data0848.Empl_ptr=data0005.rkey'#13 +
      #10'       where data0848.Work_ptr=data0831.rkey FOR XML PATH('#39#39')),' +
      ' 1, 1, '#39#39')), '#13#10'dateDiff(day,data0567.disposal_date, data0831.Sta' +
      'rMainTime)['#38388#38548#22825']        '#13#10'from data0417 '#13#10'join data0034 on data04' +
      '17.DEPT_PTR=data0034.rkey'#13#10'join data0831 on data0417.FASSET_CODE' +
      '=data0831.DeviNumb '#13#10'join data0567 on data0417.rkey=data0567.FAS' +
      'SET_PTR '#13#10'and data0567.fail_type='#39#20445#20859#19981#33391#39#13#10'join data0015 on data04' +
      '17.warehouse_ptr=data0015.rkey'#13#10'where data0567.failure_date>:SD ' +
      'and data0567.failure_date<=:ED'#13#10'and dateDiff(day,data0831.StarMa' +
      'inTime,data0567.disposal_date)between 0 and :vDisposal_date  '#13#10' ' +
      '/*'#35774#22791#32500#20462'.'#21463#29702#26085#26399'-'#20445#20859#35745#21010'.'#24320#22987#20445#20859#26102#38388'<=30*/ )as t1'
    FilterOptions = [foCaseInsensitive]
    ObjectView = False
    Params = <
      item
        DataType = ftDateTime
        Name = 'SD'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'ED'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'vDisposal_date'
        ParamType = ptInput
      end>
    ProviderName = 'dspMain'
    BeforeClose = cdsMainBeforeClose
    AfterInsert = cdsMainAfterInsert
    BeforeCancel = cdsMainBeforeCancel
    AfterCancel = cdsMainAfterCancel
    AfterDelete = cdsMainAfterDelete
    BeforeScroll = cdsMainBeforeScroll
    AfterScroll = cdsMainAfterScroll
    OnReconcileError = cdsMainReconcileError
    F_UKSaveNotEdit = False
    F_AutoNumb = False
    F_AutoSave = False
    F_SQLSelectFrom = 
      'select * from (select '#13#10'data0417.FASSET_CODE   ['#35774#22791#20195#30721'],'#13#10'data0417' +
      '.FASSET_NAME   ['#35774#22791#21517#31216'],'#13#10'Data0034.DEPT_CODE     ['#37096#38376#20195#30721'],'#13#10'Data0034' +
      '.DEPT_NAME     ['#37096#38376#21517#31216'],'#13#10'data0417.LOCATION      ['#20301#32622'],'#13#10'data0015.A' +
      'BBR_NAME     ['#24037#21378'],'#13#10'data0831.PlanMainDate  ['#35745#21010#20445#20859#26102#38388'],'#13#10'data0831.M' +
      'ainCycl'#9'   ['#20445#20859#21608#26399'],'#13#10'data0831.StarMainTime  ['#24320#22987#20445#20859#26102#38388'],'#13#10'data0831.A' +
      'ctuCompTime  ['#20445#20859#23454#38469#23436#25104#26085#26399'],'#13#10'data0831.TimeCons'#9'   ['#20445#20859#28040#32791#26102#38388'],'#13#10'data08' +
      '31.StdTimeCons   ['#26631#20934#28040#32791#26102#38388'],'#13#10'data0831.TimeCons/data0831.StdTimeCo' +
      'ns ['#36798#25104#29575'],'#13#10'data0567.NUMBER        ['#30003#35831#32534#21495'],'#13#10'case data0567.status ' +
      'when 0 then '#39#26410#25552#20132#39' when 1 then '#39#24453#21463#29702#39' when 2 then '#39#24050#21463#29702#39#13#10'         ' +
      '            when 3 then '#39#24050#23436#24037#39' when 4 then '#39#24050#39564#25910#39' when 5 then '#39#34987#36864#22238 +
      #39' '#13#10'                     when 6 then '#39#24050#26242#20572#39' when 8 then '#39#39564#25910#36864#22238#39'  e' +
      'nd as ['#29366#24577'],'#13#10'data0567.failure_degree'#9'  ['#24433#21709#31243#24230'],   '#13#10'data0567.fail' +
      'ure_circs'#9'  ['#25925#38556#35828#26126'], '#13#10'data0567.validate_appraise['#39564#25910#35780#20215'],   '#13#10'data' +
      '0567.disposal_date'#9'  ['#21463#29702#26085#26399'],'#13#10'data0567.maintain_text'#9'  ['#32500#20462#35760#24405'],'#13#10 +
      'data0567.complete_date'#9'  ['#32500#20462#23436#24037#26085#26399'], '#13#10'data0567.stop_house'#9'      [' +
      #26242#20572#23567#26102'],'#13#10'data0567.maintain_house'#9'  ['#23454#38469#32500#20462#26102#38388'], '#13#10'isnull(cast(datedi' +
      'ff(mi,data0567.ent_date,data0567.complete_date)as  dec(12,2)) /6' +
      '0,0) ['#25925#38556#32791#26102'],'#13#10'data0567.fail_type'#9'      ['#24322#24120#31867#21035'],   '#13#10#39#38599#21592#39'=convert(' +
      'varchar(500),STUFF((SELECT '#39#65307#39' + data0005.EMPLOYEE_NAME from dat' +
      'a0848 '#13#10'       join data0005 on data0848.Empl_ptr=data0005.rkey'#13 +
      #10'       where data0848.Work_ptr=data0831.rkey FOR XML PATH('#39#39')),' +
      ' 1, 1, '#39#39')), '#13#10'dateDiff(day,data0567.disposal_date, data0831.Sta' +
      'rMainTime)['#38388#38548#22825']        '#13#10'from data0417 '#13#10'join data0034 on data04' +
      '17.DEPT_PTR=data0034.rkey'#13#10'join data0831 on data0417.FASSET_CODE' +
      '=data0831.DeviNumb '#13#10'join data0567 on data0417.rkey=data0567.FAS' +
      'SET_PTR '#13#10'and data0567.fail_type='#39#20445#20859#19981#33391#39#13#10'join data0015 on data04' +
      '17.warehouse_ptr=data0015.rkey'#13#10'where data0567.failure_date>:SD ' +
      'and data0567.failure_date<=:ED'#13#10'and dateDiff(day,data0831.StarMa' +
      'inTime,data0567.disposal_date)between 0 and :vDisposal_date  '#13#10' ' +
      '/*'#35774#22791#32500#20462'.'#21463#29702#26085#26399'-'#20445#20859#35745#21010'.'#24320#22987#20445#20859#26102#38388'<=30*/ )as t1'
    Left = 57
    Top = 317
    object StringField21: TStringField
      FieldName = #35774#22791#20195#30721
    end
    object StringField22: TStringField
      FieldName = #35774#22791#21517#31216
      Size = 30
    end
    object StringField23: TStringField
      FieldName = #37096#38376#20195#30721
      Size = 10
    end
    object StringField24: TStringField
      FieldName = #37096#38376#21517#31216
      Size = 30
    end
    object StringField25: TStringField
      FieldName = #24037#21378
      Size = 10
    end
    object StringField26: TStringField
      FieldName = #20301#32622
      Size = 40
    end
    object DateTimeField8: TDateTimeField
      FieldName = #35745#21010#20445#20859#26102#38388
    end
    object StringField27: TStringField
      FieldName = #20445#20859#21608#26399
      Size = 10
    end
    object DateTimeField9: TDateTimeField
      FieldName = #24320#22987#20445#20859#26102#38388
    end
    object cdsMain5CDSDesigner2: TDateTimeField
      FieldName = #20445#20859#23454#38469#23436#25104#26085#26399
    end
    object BCDField7: TBCDField
      FieldName = #20445#20859#28040#32791#26102#38388
      Precision = 10
      Size = 2
    end
    object BCDField8: TBCDField
      FieldName = #26631#20934#28040#32791#26102#38388
      Precision = 9
      Size = 2
    end
    object BCDField9: TBCDField
      FieldName = #36798#25104#29575
      ReadOnly = True
      OnGetText = BCDField9GetText
      Precision = 22
      Size = 12
    end
    object StringField28: TStringField
      FieldName = #30003#35831#32534#21495
      Size = 15
    end
    object StringField29: TStringField
      FieldName = #29366#24577
      ReadOnly = True
      Size = 8
    end
    object StringField30: TStringField
      FieldName = #24433#21709#31243#24230
      Size = 8
    end
    object StringField31: TStringField
      FieldName = #25925#38556#35828#26126
      Size = 200
    end
    object StringField32: TStringField
      FieldName = #39564#25910#35780#20215
      Size = 50
    end
    object DateTimeField11: TDateTimeField
      FieldName = #21463#29702#26085#26399
    end
    object StringField33: TStringField
      FieldName = #32500#20462#35760#24405
      Size = 200
    end
    object cdsMain5CDSDesigner3: TDateTimeField
      FieldName = #32500#20462#23436#24037#26085#26399
    end
    object StringField34: TStringField
      FieldName = #24322#24120#31867#21035
      Size = 30
    end
    object BCDField10: TBCDField
      FieldName = #26242#20572#23567#26102
      Precision = 8
      Size = 2
    end
    object BCDField11: TBCDField
      FieldName = #23454#38469#32500#20462#26102#38388
      Precision = 8
      Size = 2
    end
    object cdsMain5CDSDesigner4: TBCDField
      FieldName = #25925#38556#32791#26102
      ReadOnly = True
      Precision = 16
      Size = 6
    end
    object IntegerField1: TIntegerField
      FieldName = #38388#38548#22825
      ReadOnly = True
    end
    object cdsMain5CDSDesigner: TStringField
      FieldName = #38599#21592
      ReadOnly = True
      Size = 500
    end
  end
  object DataSource5: TDataSource
    DataSet = cdsMain5
    Left = 110
    Top = 315
  end
  object DataSource6: TDataSource
    DataSet = cdsMain6
    Left = 110
    Top = 363
  end
  object cdsMain6: Tcds
    Aggregates = <>
    CommandText = 
      'select * from ('#13#10'select NUMBER               ['#30003#35831#32534#21495'],   data0417.' +
      'FASSET_CODE           ['#35774#22791#20195#30721'],'#13#10'data0417.FASSET_NAME        ['#35774#22791#21517#31216 +
      '],'#13#10'case data0567.status when 0 then '#39#26410#25552#20132#39' when 1 then '#39#24453#21463#29702#39' whe' +
      'n 2 then '#39#24050#21463#29702#39#13#10'                     when 3 then '#39#24050#23436#24037#39' when 4 th' +
      'en '#39#24050#39564#25910#39' when 5 then '#39#34987#36864#22238#39' '#13#10'                     when 6 then '#39#24050 +
      #26242#20572#39' when 8 then '#39#39564#25910#36864#22238#39'  end as ['#29366#24577'],'#13#10'Data0034.DEPT_NAME        ' +
      '  ['#37096#38376#21517#31216'],   Data0005.EMPLOYEE_NAME         ['#30003#25253#20154'],'#13#10'data0015.abbr' +
      '_name          ['#24037#21378'],       Data0005_1.EMPLOYEE_NAME as    ['#21463#29702#20154'],' +
      #13#10'Data0005_2.EMPLOYEE_NAME as ['#23436#24037#20154#21592'],   DATA0567.equipment_grade' +
      #9'     ['#35774#22791#32423#21035'],'#13#10'DATA0567.failure_degree'#9'    ['#24433#21709#31243#24230'],   DATA0567.re' +
      'ferring_date'#9'     ['#25552#20132#26085#26399'],'#13#10'DATA0567.CONTACT_NAME'#9'    ['#32852#32476#20154'],     ' +
      'DATA0567.CONTACT_PHONE'#9'     ['#32852#32476#20154#30005#35805'],'#13#10'DATA0567.failure_circs'#9'   ' +
      ' ['#25925#38556#35828#26126'],   DATA0567.disposal_date'#9'     ['#21463#29702#26085#26399'],'#13#10'DATA0567.maintai' +
      'n_text'#9'    ['#32500#20462#35760#24405'],   DATA0567.complete_date'#9'     ['#23436#24037#26085#26399'],'#13#10'DATA05' +
      '67.validate_appraise'#9'['#39564#25910#35780#20215'],   DATA0567.fail_type'#9'         ['#24322#24120#31867#21035 +
      '],'#13#10'DATA0567.maintain_house'#9'    ['#23454#38469#32500#20462#26102#38388'],'#13#10'Data0842.WorkDate    ' +
      '       ['#24037#20316#26085#26399'],   d5.EMPLOYEE_NAME               ['#38599#21592'],'#13#10'data0832.' +
      'MainexecStat       ['#24037#20316#21333#29366#24577'], Data0842.BeginTime             ['#24320#22987#26102#38388 +
      '],'#13#10'Data0842.EndTime            ['#32467#26463#26102#38388'],   data0846.FaultName    ' +
      '         ['#25925#38556#21517#31216'],'#13#10'data0846.stdDate'#9'        ['#26631#20934#32500#20462#26102#38388'],data0842.Tim' +
      'eRest             ['#20013#36884#20241#24687#26102#38388'],'#13#10'Data0842.WorkTime           ['#38599#21592#24037#20316#26102#38388 +
      '],Data0842.TimeCons             ['#26242#20572#26102#38388'],'#13#10'case when data0846.stdD' +
      'ate>0 and DATA0567.Staff_Sum_house>0 then'#13#10'data0846.stdDate/DATA' +
      '0567.Staff_Sum_house else 0 end ['#36798#25104#29575'],'#13#10'['#25237#35785#20869#23481']=convert(varchar(5' +
      '00),STUFF((SELECT '#39#65307#39' + remark from data0841'#13#10'       where data0' +
      '841.D567_ptr=data0567.rkey and Status_ptr=7'#13#10'       FOR XML PATH' +
      '('#39#39')), 1, 1, '#39#39')),'#13#10'Data0842.Remark             ['#22791#27880'],       data' +
      '0840.Location as['#36131#20219#23567#32452'],'#13#10'Data0417.EquiType           ['#26159#35774#22791#31867#22411']'#13#10'fr' +
      'om DATA0567'#13#10'join data0417 on DATA0567.FASSET_PTR=data0417.rkey'#13 +
      #10'join  Data0034 ON DATA0567.DEPT_PTR = Data0034.RKEY '#13#10'join  Dat' +
      'a0005 ON DATA0567.EMPL_PTR = Data0005.RKEY left outer JOIN'#13#10'    ' +
      '   Data0005 AS Data0005_1 ON DATA0567.disposal_emplptr = Data000' +
      '5_1.RKEY left outer join'#13#10'       Data0005 AS Data0005_2 ON Data0' +
      '567.completion_emplptr=Data0005_2.RKEY left outer join'#13#10'       D' +
      'ata0015 ON DATA0567.whouse_ptr=data0015.rkey'#13#10'left join Data0842' +
      ' on Data0842.[Work_ptr]=DATA0567.rkey '#13#10'left join data0005 d5 on' +
      ' Data0842.[Empl_ptr]=d5.rkey'#13#10'join data0832 on Data0842.[Status]' +
      '=data0832.rkey'#13#10'left join data0846 on data0846.rkey=DATA0567.d84' +
      '6_ptr '#13#10'left join data0840 on DATA0567.D840_ptr=data0840.rkey'#13#10'w' +
      'here Data0842.BeginTime>= :SD and Data0842.BeginTime<=:ED and Da' +
      'ta0842.WorkTime >=:vWorkTime'#13#10')W1 '
    FilterOptions = [foCaseInsensitive]
    ObjectView = False
    Params = <
      item
        DataType = ftDateTime
        Name = 'SD'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'ED'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'vWorkTime'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspMain'
    BeforeClose = cdsMainBeforeClose
    AfterInsert = cdsMainAfterInsert
    BeforeCancel = cdsMainBeforeCancel
    AfterCancel = cdsMainAfterCancel
    AfterDelete = cdsMainAfterDelete
    BeforeScroll = cdsMainBeforeScroll
    AfterScroll = cdsMainAfterScroll
    OnReconcileError = cdsMainReconcileError
    F_UKSaveNotEdit = False
    F_AutoNumb = False
    F_AutoSave = False
    F_SQLSelectFrom = 
      'select * from ('#13#10'select NUMBER               ['#30003#35831#32534#21495'],   data0417.' +
      'FASSET_CODE           ['#35774#22791#20195#30721'],'#13#10'data0417.FASSET_NAME        ['#35774#22791#21517#31216 +
      '],'#13#10'case data0567.status when 0 then '#39#26410#25552#20132#39' when 1 then '#39#24453#21463#29702#39' whe' +
      'n 2 then '#39#24050#21463#29702#39#13#10'                     when 3 then '#39#24050#23436#24037#39' when 4 th' +
      'en '#39#24050#39564#25910#39' when 5 then '#39#34987#36864#22238#39' '#13#10'                     when 6 then '#39#24050 +
      #26242#20572#39' when 8 then '#39#39564#25910#36864#22238#39'  end as ['#29366#24577'],'#13#10'Data0034.DEPT_NAME        ' +
      '  ['#37096#38376#21517#31216'],   Data0005.EMPLOYEE_NAME         ['#30003#25253#20154'],'#13#10'data0015.abbr' +
      '_name          ['#24037#21378'],       Data0005_1.EMPLOYEE_NAME as    ['#21463#29702#20154'],' +
      #13#10'Data0005_2.EMPLOYEE_NAME as ['#23436#24037#20154#21592'],   DATA0567.equipment_grade' +
      #9'     ['#35774#22791#32423#21035'],'#13#10'DATA0567.failure_degree'#9'    ['#24433#21709#31243#24230'],   DATA0567.re' +
      'ferring_date'#9'     ['#25552#20132#26085#26399'],'#13#10'DATA0567.CONTACT_NAME'#9'    ['#32852#32476#20154'],     ' +
      'DATA0567.CONTACT_PHONE'#9'     ['#32852#32476#20154#30005#35805'],'#13#10'DATA0567.failure_circs'#9'   ' +
      ' ['#25925#38556#35828#26126'],   DATA0567.disposal_date'#9'     ['#21463#29702#26085#26399'],'#13#10'DATA0567.maintai' +
      'n_text'#9'    ['#32500#20462#35760#24405'],   DATA0567.complete_date'#9'     ['#23436#24037#26085#26399'],'#13#10'DATA05' +
      '67.validate_appraise'#9'['#39564#25910#35780#20215'],   DATA0567.fail_type'#9'         ['#24322#24120#31867#21035 +
      '],'#13#10'DATA0567.maintain_house'#9'    ['#23454#38469#32500#20462#26102#38388'],'#13#10'Data0842.WorkDate    ' +
      '       ['#24037#20316#26085#26399'],   d5.EMPLOYEE_NAME               ['#38599#21592'],'#13#10'data0832.' +
      'MainexecStat       ['#24037#20316#21333#29366#24577'], Data0842.BeginTime             ['#24320#22987#26102#38388 +
      '],'#13#10'Data0842.EndTime            ['#32467#26463#26102#38388'],   data0846.FaultName    ' +
      '         ['#25925#38556#21517#31216'],'#13#10'data0846.stdDate'#9'        ['#26631#20934#32500#20462#26102#38388'],data0842.Tim' +
      'eRest             ['#20013#36884#20241#24687#26102#38388'],'#13#10'Data0842.WorkTime           ['#38599#21592#24037#20316#26102#38388 +
      '],Data0842.TimeCons             ['#26242#20572#26102#38388'],'#13#10'case when data0846.stdD' +
      'ate>0 and DATA0567.Staff_Sum_house>0 then'#13#10'data0846.stdDate/DATA' +
      '0567.Staff_Sum_house else 0 end ['#36798#25104#29575'],'#13#10'['#25237#35785#20869#23481']=convert(varchar(5' +
      '00),STUFF((SELECT '#39#65307#39' + remark from data0841'#13#10'       where data0' +
      '841.D567_ptr=data0567.rkey and Status_ptr=7'#13#10'       FOR XML PATH' +
      '('#39#39')), 1, 1, '#39#39')),'#13#10'Data0842.Remark             ['#22791#27880'],       data' +
      '0840.Location as['#36131#20219#23567#32452'],'#13#10'Data0417.EquiType           ['#26159#35774#22791#31867#22411']'#13#10'fr' +
      'om DATA0567'#13#10'join data0417 on DATA0567.FASSET_PTR=data0417.rkey'#13 +
      #10'join  Data0034 ON DATA0567.DEPT_PTR = Data0034.RKEY '#13#10'join  Dat' +
      'a0005 ON DATA0567.EMPL_PTR = Data0005.RKEY left outer JOIN'#13#10'    ' +
      '   Data0005 AS Data0005_1 ON DATA0567.disposal_emplptr = Data000' +
      '5_1.RKEY left outer join'#13#10'       Data0005 AS Data0005_2 ON Data0' +
      '567.completion_emplptr=Data0005_2.RKEY left outer join'#13#10'       D' +
      'ata0015 ON DATA0567.whouse_ptr=data0015.rkey'#13#10'left join Data0842' +
      ' on Data0842.[Work_ptr]=DATA0567.rkey '#13#10'left join data0005 d5 on' +
      ' Data0842.[Empl_ptr]=d5.rkey'#13#10'join data0832 on Data0842.[Status]' +
      '=data0832.rkey'#13#10'left join data0846 on data0846.rkey=DATA0567.d84' +
      '6_ptr '#13#10'left join data0840 on DATA0567.D840_ptr=data0840.rkey'#13#10'w' +
      'here Data0842.BeginTime>= :SD and Data0842.BeginTime<=:ED and Da' +
      'ta0842.WorkTime >=:vWorkTime'#13#10')W1 '
    Left = 57
    Top = 365
    object cdsMain6CDSDesigner: TStringField
      FieldName = #30003#35831#32534#21495
      Size = 15
    end
    object cdsMain6CDSDesigner2: TStringField
      FieldName = #35774#22791#20195#30721
    end
    object cdsMain6CDSDesigner3: TStringField
      FieldName = #35774#22791#21517#31216
      Size = 30
    end
    object cdsMain6CDSDesigner4: TStringField
      FieldName = #29366#24577
      ReadOnly = True
      Size = 8
    end
    object cdsMain6CDSDesigner5: TStringField
      FieldName = #37096#38376#21517#31216
      Size = 30
    end
    object cdsMain6CDSDesigner6: TStringField
      FieldName = #30003#25253#20154
      Size = 16
    end
    object cdsMain6CDSDesigner7: TStringField
      FieldName = #24037#21378
      Size = 10
    end
    object cdsMain6CDSDesigner8: TStringField
      FieldName = #21463#29702#20154
      Size = 16
    end
    object cdsMain6CDSDesigner9: TStringField
      FieldName = #23436#24037#20154#21592
      Size = 16
    end
    object cdsMain6CDSDesigner10: TStringField
      FieldName = #35774#22791#32423#21035
      Size = 10
    end
    object cdsMain6CDSDesigner11: TStringField
      FieldName = #24433#21709#31243#24230
      Size = 8
    end
    object cdsMain6CDSDesigner12: TDateTimeField
      FieldName = #25552#20132#26085#26399
    end
    object cdsMain6CDSDesigner13: TStringField
      FieldName = #32852#32476#20154
      Size = 10
    end
    object cdsMain6CDSDesigner14: TStringField
      FieldName = #32852#32476#20154#30005#35805
      Size = 15
    end
    object cdsMain6CDSDesigner15: TStringField
      FieldName = #25925#38556#35828#26126
      Size = 200
    end
    object cdsMain6CDSDesigner16: TDateTimeField
      FieldName = #21463#29702#26085#26399
    end
    object cdsMain6CDSDesigner17: TStringField
      FieldName = #32500#20462#35760#24405
      Size = 200
    end
    object cdsMain6CDSDesigner18: TDateTimeField
      FieldName = #23436#24037#26085#26399
    end
    object cdsMain6CDSDesigner19: TStringField
      FieldName = #39564#25910#35780#20215
      Size = 50
    end
    object cdsMain6CDSDesigner20: TStringField
      FieldName = #24322#24120#31867#21035
      Size = 30
    end
    object cdsMain6CDSDesigner21: TBCDField
      FieldName = #23454#38469#32500#20462#26102#38388
      Precision = 8
      Size = 2
    end
    object cdsMain6CDSDesigner22: TDateTimeField
      FieldName = #24037#20316#26085#26399
    end
    object cdsMain6CDSDesigner23: TStringField
      FieldName = #38599#21592
      Size = 16
    end
    object cdsMain6CDSDesigner24: TStringField
      FieldName = #24037#20316#21333#29366#24577
      Size = 10
    end
    object cdsMain6CDSDesigner25: TDateTimeField
      FieldName = #24320#22987#26102#38388
    end
    object cdsMain6CDSDesigner26: TDateTimeField
      FieldName = #32467#26463#26102#38388
    end
    object cdsMain6CDSDesigner27: TStringField
      FieldName = #25925#38556#21517#31216
      Size = 50
    end
    object cdsMain6CDSDesigner28: TBCDField
      FieldName = #26631#20934#32500#20462#26102#38388
      Precision = 9
      Size = 2
    end
    object cdsMain6CDSDesigner29: TBCDField
      FieldName = #20013#36884#20241#24687#26102#38388
      Precision = 8
      Size = 2
    end
    object cdsMain6CDSDesigner30: TBCDField
      FieldName = #38599#21592#24037#20316#26102#38388
      Precision = 5
      Size = 2
    end
    object cdsMain6CDSDesigner31: TBCDField
      FieldName = #26242#20572#26102#38388
      Precision = 8
      Size = 2
    end
    object cdsMain6CDSDesigner32: TBCDField
      FieldName = #36798#25104#29575
      ReadOnly = True
      Precision = 20
      Size = 11
    end
    object cdsMain6CDSDesigner33: TStringField
      FieldName = #25237#35785#20869#23481
      ReadOnly = True
      Size = 500
    end
    object cdsMain6CDSDesigner34: TStringField
      FieldName = #22791#27880
      Size = 200
    end
    object cdsMain6CDSDesigner35: TStringField
      FieldName = #36131#20219#23567#32452
    end
    object cdsMain6CDSDesigner36: TBooleanField
      FieldName = #26159#35774#22791#31867#22411
    end
  end
  object cds0043: TClientDataSet
    Aggregates = <>
    CommandText = 'select unusual_cate from data0043'
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 809
    Top = 312
    object cds0043unusual_cate: TWideStringField
      DisplayLabel = #24322#24120#31867#21035
      DisplayWidth = 30
      FieldName = 'unusual_cate'
      Size = 50
    end
  end
  object cdsMain7: Tcds
    Aggregates = <>
    CommandText = 
      'declare @SD datetime ,@ED datetime'#13#10'set @SD =:SD '#13#10'set @ED =:ED'#13 +
      #10'select * from '#13#10'(select Data0015.ABBR_NAME   ['#24037#21378'],Empl_ptr,Data' +
      '0005.EMPL_CODE  ['#38599#21592#20195#30721'],'#13#10' Data0005.EMPLOYEE_NAME  ['#38599#21592'],sum(WorkT' +
      'ime)as  ['#38599#21592#24037#20316#26102#38388'] from  '#13#10'(select Data0842.Empl_ptr,isnull(Data08' +
      '42.WorkTime,0)as[WorkTime],'#13#10'data0567.WHOUSE_PTR from Data0842'#13#10 +
      'join data0567 on Data0842.Work_ptr=data0567.rkey'#13#10'where Data0842' +
      '.BeginTime >=@SD  and Data0842.BeginTime <@ED'#13#10'union all'#13#10'select' +
      ' Data0848.Empl_ptr,isnull(Data0848.WorkTime,0)as[WorkTime],'#13#10'dbo' +
      '.DATA0417.warehouse_ptr as [WHOUSE_PTR] from Data0848'#13#10'join data' +
      '0831 on Data0848.Work_ptr=data0831.rkey'#13#10'join data0417 on data08' +
      '31.DeviNumb=data0417.FASSET_CODE'#13#10'where Data0848.BeginTime >=@SD' +
      '  and Data0848.BeginTime <@ED) as t1'#13#10'join Data0005 on t1.Empl_p' +
      'tr=Data0005.rkey'#13#10'join data0015 on t1.WHOUSE_PTR=data0015.rkey'#13#10 +
      'group by data0015.ABBR_NAME,t1.Empl_ptr,Data0005.EMPL_CODE, Data' +
      '0005.EMPLOYEE_NAME)as t2'
    FilterOptions = [foCaseInsensitive]
    ObjectView = False
    Params = <
      item
        DataType = ftDateTime
        Name = 'SD'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'ED'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspMain'
    AfterOpen = cdsMain7AfterOpen
    BeforeClose = cdsMainBeforeClose
    AfterClose = cdsMain7AfterClose
    AfterInsert = cdsMainAfterInsert
    BeforeCancel = cdsMainBeforeCancel
    AfterCancel = cdsMainAfterCancel
    AfterDelete = cdsMainAfterDelete
    BeforeScroll = cdsMainBeforeScroll
    AfterScroll = cdsMain7AfterScroll
    OnReconcileError = cdsMainReconcileError
    F_UKSaveNotEdit = False
    F_AutoNumb = False
    F_AutoSave = False
    F_SQLSelectFrom = 
      'declare @SD datetime ,@ED datetime'#13#10'set @SD =:SD '#13#10'set @ED =:ED'#13 +
      #10'select * from '#13#10'(select Data0015.ABBR_NAME   ['#24037#21378'],Empl_ptr,Data' +
      '0005.EMPL_CODE  ['#38599#21592#20195#30721'],'#13#10' Data0005.EMPLOYEE_NAME  ['#38599#21592'],sum(WorkT' +
      'ime)as  ['#38599#21592#24037#20316#26102#38388'] from  '#13#10'(select Data0842.Empl_ptr,isnull(Data08' +
      '42.WorkTime,0)as[WorkTime],'#13#10'data0567.WHOUSE_PTR from Data0842'#13#10 +
      'join data0567 on Data0842.Work_ptr=data0567.rkey'#13#10'where Data0842' +
      '.BeginTime >=@SD  and Data0842.BeginTime <@ED'#13#10'union all'#13#10'select' +
      ' Data0848.Empl_ptr,isnull(Data0848.WorkTime,0)as[WorkTime],'#13#10'dbo' +
      '.DATA0417.warehouse_ptr as [WHOUSE_PTR] from Data0848'#13#10'join data' +
      '0831 on Data0848.Work_ptr=data0831.rkey'#13#10'join data0417 on data08' +
      '31.DeviNumb=data0417.FASSET_CODE'#13#10'where Data0848.BeginTime >=@SD' +
      '  and Data0848.BeginTime <@ED) as t1'#13#10'join Data0005 on t1.Empl_p' +
      'tr=Data0005.rkey'#13#10'join data0015 on t1.WHOUSE_PTR=data0015.rkey'#13#10 +
      'group by data0015.ABBR_NAME,t1.Empl_ptr,Data0005.EMPL_CODE, Data' +
      '0005.EMPLOYEE_NAME)as t2'
    Left = 249
    Top = 125
    object cdsMain7CDSDesigner3: TStringField
      FieldName = #24037#21378
      Size = 10
    end
    object cdsMain7CDSDesigner: TStringField
      DisplayWidth = 10
      FieldName = #38599#21592#20195#30721
      Size = 10
    end
    object cdsMain7CDSDesigner2: TStringField
      DisplayWidth = 16
      FieldName = #38599#21592
      Size = 16
    end
    object cdsMain7CDSDesigner4: TBCDField
      DisplayWidth = 12
      FieldName = #38599#21592#24037#20316#26102#38388
      ReadOnly = True
      Precision = 32
      Size = 2
    end
    object cdsMain7Empl_ptr: TIntegerField
      FieldName = 'Empl_ptr'
      ReadOnly = True
    end
  end
  object DataSource7: TDataSource
    DataSet = cdsMain7
    Left = 302
    Top = 123
  end
  object cdsMain8: Tcds
    Aggregates = <>
    CommandText = 
      'select * from ( '#13'select TOP (100) PERCENT   NUMBER ['#32500#20462#30003#35831#32534#21495'], '#13'nu' +
      'll as ['#35745#21010#20445#20859#26102#38388'],null as ['#20445#20859#21608#26399'],'#13'data0417.FASSET_CODE ['#35774#22791#20195#30721'],data0' +
      '417.FASSET_NAME ['#35774#22791#21517#31216'],'#13'Data0034.DEPT_NAME '#37096#38376#21517#31216', data0015.abbr_n' +
      'ame '#24037#21378',Data0005.EMPL_CODE['#38599#21592#20195#30721'], '#13#10'Data0005.EMPLOYEE_NAME['#38599#21592'],Da' +
      'ta0842.WorkDate ['#24037#20316#26085#26399'],'#13#10'Data0842.BeginTime['#24320#22987#26102#38388'],Data0842.EndTi' +
      'me['#32467#26463#26102#38388'],'#13#10'Data0842.TimeRest['#20013#36884#20241#24687#26102#38388'],Data0842.WorkTime['#38599#21592#24037#20316#26102#38388'] '#13 +
      'from data0567 '#13'join data0417 on DATA0567.FASSET_PTR=data0417.rke' +
      'y'#13'join  Data0034 ON data0417.DEPT_PTR = Data0034.RKEY '#13#10'join  Da' +
      'ta0015 ON data0417.warehouse_ptr=data0015.rkey '#13'join data0842 on' +
      ' data0842.Work_ptr=data0567.rkey'#13#10'join  Data0005 ON data0842.EMP' +
      'L_PTR = Data0005.RKEY '#13#10'where data0842.EMPL_PTR=:vEMPL_PTR and B' +
      'eginTime >=:SD and BeginTime <:ED'#13#10'union all'#13#10'select TOP (100) P' +
      'ERCENT  null as ['#32500#20462#30003#35831#32534#21495'],'#13#10'data0831.PlanMainDate'#9'['#35745#21010#20445#20859#26102#38388'],data08' +
      '31.MainCycl'#9'['#20445#20859#21608#26399'],'#13#10'data0417.FASSET_CODE ['#35774#22791#20195#30721'],data0417.FASSET' +
      '_NAME ['#35774#22791#21517#31216'],'#13#10'Data0034.DEPT_NAME '#37096#38376#21517#31216', data0015.abbr_name '#24037#21378',Da' +
      'ta0005.EMPL_CODE['#38599#21592#20195#30721'], '#13#10'Data0005.EMPLOYEE_NAME['#38599#21592'],Data0848.Wo' +
      'rkDate ['#24037#20316#26085#26399'],'#13#10'Data0848.BeginTime['#24320#22987#26102#38388'],Data0848.EndTime['#32467#26463#26102#38388'],' +
      #13#10'Data0848.TimeRest['#20013#36884#20241#24687#26102#38388'],Data0848.WorkTime['#38599#21592#24037#20316#26102#38388'] '#13#10'from dat' +
      'a0831 join data0417 on data0831.DeviNumb=data0417.FASSET_CODE'#13#10'j' +
      'oin  Data0034 ON data0417.DEPT_PTR = Data0034.RKEY '#13#10'join  Data0' +
      '015 ON data0417.warehouse_ptr=data0015.rkey '#13'join Data0848 on Da' +
      'ta0848.Work_ptr=data0831.rkey'#13#10'join  Data0005 ON Data0848.EMPL_P' +
      'TR = Data0005.RKEY '#13#10'where Data0848.EMPL_PTR=:vEMPL_PTR and Begi' +
      'nTime >=:SD and BeginTime <:ED'#13#10'order by BeginTime,EMPL_CODE )as' +
      ' t1'
    FilterOptions = [foCaseInsensitive]
    ObjectView = False
    Params = <
      item
        DataType = ftInteger
        Name = 'vEMPL_PTR'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'SD'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'ED'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'vEMPL_PTR'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'SD'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'ED'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspMain'
    BeforeClose = cdsMainBeforeClose
    AfterInsert = cdsMainAfterInsert
    BeforeCancel = cdsMainBeforeCancel
    AfterCancel = cdsMainAfterCancel
    AfterDelete = cdsMainAfterDelete
    BeforeScroll = cdsMainBeforeScroll
    OnReconcileError = cdsMainReconcileError
    F_UKSaveNotEdit = False
    F_AutoNumb = False
    F_AutoSave = False
    F_SQLSelectFrom = 
      'select * from ( '#13'select TOP (100) PERCENT   NUMBER ['#32500#20462#30003#35831#32534#21495'], '#13'nu' +
      'll as ['#35745#21010#20445#20859#26102#38388'],null as ['#20445#20859#21608#26399'],'#13'data0417.FASSET_CODE ['#35774#22791#20195#30721'],data0' +
      '417.FASSET_NAME ['#35774#22791#21517#31216'],'#13'Data0034.DEPT_NAME '#37096#38376#21517#31216', data0015.abbr_n' +
      'ame '#24037#21378',Data0005.EMPL_CODE['#38599#21592#20195#30721'], '#13#10'Data0005.EMPLOYEE_NAME['#38599#21592'],Da' +
      'ta0842.WorkDate ['#24037#20316#26085#26399'],'#13#10'Data0842.BeginTime['#24320#22987#26102#38388'],Data0842.EndTi' +
      'me['#32467#26463#26102#38388'],'#13#10'Data0842.TimeRest['#20013#36884#20241#24687#26102#38388'],Data0842.WorkTime['#38599#21592#24037#20316#26102#38388'] '#13 +
      'from data0567 '#13'join data0417 on DATA0567.FASSET_PTR=data0417.rke' +
      'y'#13'join  Data0034 ON data0417.DEPT_PTR = Data0034.RKEY '#13#10'join  Da' +
      'ta0015 ON data0417.warehouse_ptr=data0015.rkey '#13'join data0842 on' +
      ' data0842.Work_ptr=data0567.rkey'#13#10'join  Data0005 ON data0842.EMP' +
      'L_PTR = Data0005.RKEY '#13#10'where data0842.EMPL_PTR=:vEMPL_PTR and B' +
      'eginTime >=:SD and BeginTime <:ED'#13#10'union all'#13#10'select TOP (100) P' +
      'ERCENT  null as ['#32500#20462#30003#35831#32534#21495'],'#13#10'data0831.PlanMainDate'#9'['#35745#21010#20445#20859#26102#38388'],data08' +
      '31.MainCycl'#9'['#20445#20859#21608#26399'],'#13#10'data0417.FASSET_CODE ['#35774#22791#20195#30721'],data0417.FASSET' +
      '_NAME ['#35774#22791#21517#31216'],'#13#10'Data0034.DEPT_NAME '#37096#38376#21517#31216', data0015.abbr_name '#24037#21378',Da' +
      'ta0005.EMPL_CODE['#38599#21592#20195#30721'], '#13#10'Data0005.EMPLOYEE_NAME['#38599#21592'],Data0848.Wo' +
      'rkDate ['#24037#20316#26085#26399'],'#13#10'Data0848.BeginTime['#24320#22987#26102#38388'],Data0848.EndTime['#32467#26463#26102#38388'],' +
      #13#10'Data0848.TimeRest['#20013#36884#20241#24687#26102#38388'],Data0848.WorkTime['#38599#21592#24037#20316#26102#38388'] '#13#10'from dat' +
      'a0831 join data0417 on data0831.DeviNumb=data0417.FASSET_CODE'#13#10'j' +
      'oin  Data0034 ON data0417.DEPT_PTR = Data0034.RKEY '#13#10'join  Data0' +
      '015 ON data0417.warehouse_ptr=data0015.rkey '#13'join Data0848 on Da' +
      'ta0848.Work_ptr=data0831.rkey'#13#10'join  Data0005 ON Data0848.EMPL_P' +
      'TR = Data0005.RKEY '#13#10'where Data0848.EMPL_PTR=:vEMPL_PTR and Begi' +
      'nTime >=:SD and BeginTime <:ED'#13#10'order by BeginTime,EMPL_CODE )as' +
      ' t1'
    Left = 249
    Top = 173
    object cdsMain8CDSDesigner: TStringField
      FieldName = #32500#20462#30003#35831#32534#21495
      ReadOnly = True
      Size = 15
    end
    object cdsMain8CDSDesigner2: TDateTimeField
      FieldName = #35745#21010#20445#20859#26102#38388
      ReadOnly = True
    end
    object cdsMain8CDSDesigner3: TStringField
      FieldName = #20445#20859#21608#26399
      ReadOnly = True
      Size = 10
    end
    object cdsMain8CDSDesigner4: TStringField
      FieldName = #35774#22791#20195#30721
      ReadOnly = True
    end
    object cdsMain8CDSDesigner5: TStringField
      FieldName = #35774#22791#21517#31216
      ReadOnly = True
      Size = 30
    end
    object cdsMain8CDSDesigner6: TStringField
      FieldName = #37096#38376#21517#31216
      ReadOnly = True
      Size = 30
    end
    object cdsMain8CDSDesigner7: TStringField
      FieldName = #24037#21378
      ReadOnly = True
      Size = 10
    end
    object cdsMain8CDSDesigner8: TStringField
      FieldName = #38599#21592#20195#30721
      ReadOnly = True
      Size = 10
    end
    object cdsMain8CDSDesigner9: TStringField
      FieldName = #38599#21592
      ReadOnly = True
      Size = 16
    end
    object cdsMain8CDSDesigner10: TDateTimeField
      FieldName = #24037#20316#26085#26399
      ReadOnly = True
    end
    object cdsMain8CDSDesigner11: TDateTimeField
      FieldName = #24320#22987#26102#38388
      ReadOnly = True
    end
    object cdsMain8CDSDesigner12: TDateTimeField
      FieldName = #32467#26463#26102#38388
      ReadOnly = True
    end
    object cdsMain8CDSDesigner13: TBCDField
      FieldName = #20013#36884#20241#24687#26102#38388
      ReadOnly = True
      Precision = 8
      Size = 2
    end
    object cdsMain8CDSDesigner14: TBCDField
      FieldName = #38599#21592#24037#20316#26102#38388
      ReadOnly = True
      Precision = 5
      Size = 2
    end
  end
  object DataSource8: TDataSource
    DataSet = cdsMain8
    Left = 302
    Top = 171
  end
  object DataSource9: TDataSource
    DataSet = cdsMain9
    Left = 302
    Top = 219
  end
  object cdsMain9: Tcds
    Aggregates = <>
    CommandText = 
      'select * from (select '#13#10'data0417.FASSET_CODE   ['#35774#22791#20195#30721'],'#13#10'data0417' +
      '.FASSET_NAME   ['#35774#22791#21517#31216'],'#13#10'Data0034.DEPT_CODE     ['#37096#38376#20195#30721'],'#13#10'Data0034' +
      '.DEPT_NAME     ['#37096#38376#21517#31216'],'#13#10'data0417.LOCATION      ['#20301#32622'],'#13#10'data0015.A' +
      'BBR_NAME     ['#24037#21378'],'#13#10'data0567.NUMBER        ['#30003#35831#32534#21495'],'#13#10'case data056' +
      '7.status when 0 then '#39#26410#25552#20132#39' when 1 then '#39#24453#21463#29702#39' when 2 then '#39#24050#21463#29702#39#13#10 +
      '                     when 3 then '#39#24050#23436#24037#39' when 4 then '#39#24050#39564#25910#39' when 5 ' +
      'then '#39#34987#36864#22238#39' '#13#10'                     when 6 then '#39#24050#26242#20572#39' when 8 then ' +
      #39#39564#25910#36864#22238#39'  end as ['#29366#24577'],'#13#10'data0567.failure_degree'#9'  ['#24433#21709#31243#24230'],   '#13#10'data' +
      '0567.failure_circs'#9'  ['#25925#38556#35828#26126'], '#13#10'data0567.validate_appraise['#39564#25910#35780#20215'],' +
      '   '#13#10'data0567.disposal_date'#9'  ['#21463#29702#26085#26399'],'#13#10'data0567.maintain_text'#9'  ' +
      '['#32500#20462#35760#24405'],'#13#10'data0567.complete_date'#9'  ['#23436#24037#26085#26399'], '#13#10'data0567.stop_house'#9 +
      '      ['#26242#20572#23567#26102'],'#13#10'data0567.maintain_house'#9'  ['#23454#38469#32500#20462#26102#38388'], '#13#10'data0567.fa' +
      'il_type'#9'      ['#24322#24120#31867#21035'],'#13#10'isnull(cast(datediff(mi,data0567.ent_date' +
      ',data0567.complete_date)as  dec(12,2)) /60,0) ['#25925#38556#32791#26102'],'#13#10#39#38599#21592#39'=conv' +
      'ert(varchar(500),STUFF((SELECT '#39#65307#39' + data0005.EMPLOYEE_NAME from' +
      ' data0842 '#13#10'       join data0005 on data0842.Empl_ptr=data0005.r' +
      'key'#13#10'       where data0842.Work_ptr=data0567.rkey FOR XML PATH('#39 +
      #39')), 1, 1, '#39#39'))    '#13#10'from data0417 '#13#10'join data0034 on data0417.D' +
      'EPT_PTR=data0034.rkey'#13#10'join data0567 on data0417.rkey=data0567.F' +
      'ASSET_PTR and data0567.fail_type='#39#25805#20316#19981#33391#39#13#10'join data0015 on data04' +
      '17.warehouse_ptr=data0015.rkey'#13#10'where data0567.failure_date>:SD ' +
      'and data0567.failure_date<=:ED  '#13#10')as t1'
    FilterOptions = [foCaseInsensitive]
    ObjectView = False
    Params = <
      item
        DataType = ftDateTime
        Name = 'SD'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'ED'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspMain'
    BeforeClose = cdsMainBeforeClose
    AfterInsert = cdsMainAfterInsert
    BeforeCancel = cdsMainBeforeCancel
    AfterCancel = cdsMainAfterCancel
    AfterDelete = cdsMainAfterDelete
    BeforeScroll = cdsMainBeforeScroll
    AfterScroll = cdsMainAfterScroll
    OnReconcileError = cdsMainReconcileError
    F_UKSaveNotEdit = False
    F_AutoNumb = False
    F_AutoSave = False
    F_SQLSelectFrom = 
      'select * from (select '#13#10'data0417.FASSET_CODE   ['#35774#22791#20195#30721'],'#13#10'data0417' +
      '.FASSET_NAME   ['#35774#22791#21517#31216'],'#13#10'Data0034.DEPT_CODE     ['#37096#38376#20195#30721'],'#13#10'Data0034' +
      '.DEPT_NAME     ['#37096#38376#21517#31216'],'#13#10'data0417.LOCATION      ['#20301#32622'],'#13#10'data0015.A' +
      'BBR_NAME     ['#24037#21378'],'#13#10'data0567.NUMBER        ['#30003#35831#32534#21495'],'#13#10'case data056' +
      '7.status when 0 then '#39#26410#25552#20132#39' when 1 then '#39#24453#21463#29702#39' when 2 then '#39#24050#21463#29702#39#13#10 +
      '                     when 3 then '#39#24050#23436#24037#39' when 4 then '#39#24050#39564#25910#39' when 5 ' +
      'then '#39#34987#36864#22238#39' '#13#10'                     when 6 then '#39#24050#26242#20572#39' when 8 then ' +
      #39#39564#25910#36864#22238#39'  end as ['#29366#24577'],'#13#10'data0567.failure_degree'#9'  ['#24433#21709#31243#24230'],   '#13#10'data' +
      '0567.failure_circs'#9'  ['#25925#38556#35828#26126'], '#13#10'data0567.validate_appraise['#39564#25910#35780#20215'],' +
      '   '#13#10'data0567.disposal_date'#9'  ['#21463#29702#26085#26399'],'#13#10'data0567.maintain_text'#9'  ' +
      '['#32500#20462#35760#24405'],'#13#10'data0567.complete_date'#9'  ['#23436#24037#26085#26399'], '#13#10'data0567.stop_house'#9 +
      '      ['#26242#20572#23567#26102'],'#13#10'data0567.maintain_house'#9'  ['#23454#38469#32500#20462#26102#38388'], '#13#10'data0567.fa' +
      'il_type'#9'      ['#24322#24120#31867#21035'],'#13#10'isnull(cast(datediff(mi,data0567.ent_date' +
      ',data0567.complete_date)as  dec(12,2)) /60,0) ['#25925#38556#32791#26102'],'#13#10#39#38599#21592#39'=conv' +
      'ert(varchar(500),STUFF((SELECT '#39#65307#39' + data0005.EMPLOYEE_NAME from' +
      ' data0842 '#13#10'       join data0005 on data0842.Empl_ptr=data0005.r' +
      'key'#13#10'       where data0842.Work_ptr=data0567.rkey FOR XML PATH('#39 +
      #39')), 1, 1, '#39#39'))    '#13#10'from data0417 '#13#10'join data0034 on data0417.D' +
      'EPT_PTR=data0034.rkey'#13#10'join data0567 on data0417.rkey=data0567.F' +
      'ASSET_PTR and data0567.fail_type='#39#25805#20316#19981#33391#39#13#10'join data0015 on data04' +
      '17.warehouse_ptr=data0015.rkey'#13#10'where data0567.failure_date>:SD ' +
      'and data0567.failure_date<=:ED  '#13#10')as t1'
    Left = 249
    Top = 221
    object cdsMain9CDSDesigner: TStringField
      FieldName = #35774#22791#20195#30721
    end
    object cdsMain9CDSDesigner2: TStringField
      FieldName = #35774#22791#21517#31216
      Size = 30
    end
    object cdsMain9CDSDesigner3: TStringField
      FieldName = #37096#38376#20195#30721
      Size = 10
    end
    object cdsMain9CDSDesigner4: TStringField
      FieldName = #37096#38376#21517#31216
      Size = 30
    end
    object cdsMain9CDSDesigner5: TStringField
      FieldName = #20301#32622
      Size = 40
    end
    object cdsMain9CDSDesigner6: TStringField
      FieldName = #24037#21378
      Size = 10
    end
    object cdsMain9CDSDesigner7: TStringField
      FieldName = #30003#35831#32534#21495
      Size = 15
    end
    object cdsMain9CDSDesigner8: TStringField
      FieldName = #29366#24577
      ReadOnly = True
      Size = 8
    end
    object cdsMain9CDSDesigner9: TStringField
      FieldName = #24433#21709#31243#24230
      Size = 8
    end
    object cdsMain9CDSDesigner10: TStringField
      FieldName = #25925#38556#35828#26126
      Size = 200
    end
    object cdsMain9CDSDesigner11: TStringField
      FieldName = #39564#25910#35780#20215
      Size = 50
    end
    object cdsMain9CDSDesigner12: TDateTimeField
      FieldName = #21463#29702#26085#26399
    end
    object cdsMain9CDSDesigner13: TStringField
      FieldName = #32500#20462#35760#24405
      Size = 200
    end
    object cdsMain9CDSDesigner14: TDateTimeField
      FieldName = #23436#24037#26085#26399
    end
    object cdsMain9CDSDesigner15: TBCDField
      FieldName = #26242#20572#23567#26102
      Precision = 8
      Size = 2
    end
    object cdsMain9CDSDesigner19: TBCDField
      FieldName = #25925#38556#32791#26102
      ReadOnly = True
      Precision = 16
      Size = 6
    end
    object cdsMain9CDSDesigner16: TBCDField
      FieldName = #23454#38469#32500#20462#26102#38388
      Precision = 8
      Size = 2
    end
    object cdsMain9CDSDesigner17: TStringField
      FieldName = #24322#24120#31867#21035
      Size = 30
    end
    object cdsMain9CDSDesigner18: TStringField
      FieldName = #38599#21592
      ReadOnly = True
      Size = 500
    end
  end
  object cdsMain10: Tcds
    Aggregates = <>
    CommandText = 
      'select * from (select '#13#10'data0417.FASSET_CODE   ['#35774#22791#20195#30721'],'#13#10'data0417' +
      '.FASSET_NAME   ['#35774#22791#21517#31216'],'#13#10'Data0034.DEPT_CODE     ['#37096#38376#20195#30721'],'#13#10'Data0034' +
      '.DEPT_NAME     ['#37096#38376#21517#31216'],'#13#10'data0417.LOCATION      ['#20301#32622'],'#13#10'data0015.A' +
      'BBR_NAME     ['#24037#21378'],'#13#10'data0567.NUMBER        ['#30003#35831#32534#21495'],'#13#10'case data056' +
      '7.status when 0 then '#39#26410#25552#20132#39' when 1 then '#39#24453#21463#29702#39' when 2 then '#39#24050#21463#29702#39#13#10 +
      '                     when 3 then '#39#24050#23436#24037#39' when 4 then '#39#24050#39564#25910#39' when 5 ' +
      'then '#39#34987#36864#22238#39' '#13#10'                     when 6 then '#39#24050#26242#20572#39' when 8 then ' +
      #39#39564#25910#36864#22238#39'  end as ['#29366#24577'],'#13#10'data0567.failure_degree'#9'  ['#24433#21709#31243#24230'],   '#13#10'data' +
      '0567.failure_circs'#9'  ['#25925#38556#35828#26126'], '#13#10'data0567.validate_appraise['#39564#25910#35780#20215'],' +
      '   '#13#10'data0567.disposal_date'#9'  ['#21463#29702#26085#26399'],'#13#10'data0567.maintain_text'#9'  ' +
      '['#32500#20462#35760#24405'],'#13#10'data0567.complete_date'#9'  ['#23436#24037#26085#26399'], '#13#10'data0567.stop_house'#9 +
      '      ['#26242#20572#23567#26102'],'#13#10'data0567.maintain_house'#9'  ['#23454#38469#32500#20462#26102#38388'], '#13#10'data0567.fa' +
      'il_type'#9'      ['#24322#24120#31867#21035'],'#13#10'isnull(cast(datediff(mi,data0567.ent_date' +
      ',data0567.complete_date)as  dec(12,2)) /60,0) ['#25925#38556#32791#26102'],'#13#10#39#38599#21592#39'=conv' +
      'ert(varchar(500),STUFF((SELECT '#39#65307#39' + data0005.EMPLOYEE_NAME from' +
      ' data0842 '#13#10'       join data0005 on data0842.Empl_ptr=data0005.r' +
      'key'#13#10'       where data0842.Work_ptr=data0567.rkey FOR XML PATH('#39 +
      #39')), 1, 1, '#39#39'))     '#13#10'from data0417 '#13#10'join data0034 on data0417.' +
      'DEPT_PTR=data0034.rkey'#13#10'join data0567 on data0417.rkey=data0567.' +
      'FASSET_PTR and data0567.fail_type='#39#35774#35745#19981#33391#39#13#10'join data0015 on data0' +
      '417.warehouse_ptr=data0015.rkey'#13#10'where data0567.failure_date>:SD' +
      ' and data0567.failure_date<=:ED  '#13#10')as t1'
    FilterOptions = [foCaseInsensitive]
    ObjectView = False
    Params = <
      item
        DataType = ftDateTime
        Name = 'SD'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'ED'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspMain'
    BeforeClose = cdsMainBeforeClose
    AfterInsert = cdsMainAfterInsert
    BeforeCancel = cdsMainBeforeCancel
    AfterCancel = cdsMainAfterCancel
    AfterDelete = cdsMainAfterDelete
    BeforeScroll = cdsMainBeforeScroll
    AfterScroll = cdsMainAfterScroll
    OnReconcileError = cdsMainReconcileError
    F_UKSaveNotEdit = False
    F_AutoNumb = False
    F_AutoSave = False
    F_SQLSelectFrom = 
      'select * from (select '#13#10'data0417.FASSET_CODE   ['#35774#22791#20195#30721'],'#13#10'data0417' +
      '.FASSET_NAME   ['#35774#22791#21517#31216'],'#13#10'Data0034.DEPT_CODE     ['#37096#38376#20195#30721'],'#13#10'Data0034' +
      '.DEPT_NAME     ['#37096#38376#21517#31216'],'#13#10'data0417.LOCATION      ['#20301#32622'],'#13#10'data0015.A' +
      'BBR_NAME     ['#24037#21378'],'#13#10'data0567.NUMBER        ['#30003#35831#32534#21495'],'#13#10'case data056' +
      '7.status when 0 then '#39#26410#25552#20132#39' when 1 then '#39#24453#21463#29702#39' when 2 then '#39#24050#21463#29702#39#13#10 +
      '                     when 3 then '#39#24050#23436#24037#39' when 4 then '#39#24050#39564#25910#39' when 5 ' +
      'then '#39#34987#36864#22238#39' '#13#10'                     when 6 then '#39#24050#26242#20572#39' when 8 then ' +
      #39#39564#25910#36864#22238#39'  end as ['#29366#24577'],'#13#10'data0567.failure_degree'#9'  ['#24433#21709#31243#24230'],   '#13#10'data' +
      '0567.failure_circs'#9'  ['#25925#38556#35828#26126'], '#13#10'data0567.validate_appraise['#39564#25910#35780#20215'],' +
      '   '#13#10'data0567.disposal_date'#9'  ['#21463#29702#26085#26399'],'#13#10'data0567.maintain_text'#9'  ' +
      '['#32500#20462#35760#24405'],'#13#10'data0567.complete_date'#9'  ['#23436#24037#26085#26399'], '#13#10'data0567.stop_house'#9 +
      '      ['#26242#20572#23567#26102'],'#13#10'data0567.maintain_house'#9'  ['#23454#38469#32500#20462#26102#38388'], '#13#10'data0567.fa' +
      'il_type'#9'      ['#24322#24120#31867#21035'],'#13#10'isnull(cast(datediff(mi,data0567.ent_date' +
      ',data0567.complete_date)as  dec(12,2)) /60,0) ['#25925#38556#32791#26102'],'#13#10#39#38599#21592#39'=conv' +
      'ert(varchar(500),STUFF((SELECT '#39#65307#39' + data0005.EMPLOYEE_NAME from' +
      ' data0842 '#13#10'       join data0005 on data0842.Empl_ptr=data0005.r' +
      'key'#13#10'       where data0842.Work_ptr=data0567.rkey FOR XML PATH('#39 +
      #39')), 1, 1, '#39#39'))     '#13#10'from data0417 '#13#10'join data0034 on data0417.' +
      'DEPT_PTR=data0034.rkey'#13#10'join data0567 on data0417.rkey=data0567.' +
      'FASSET_PTR and data0567.fail_type='#39#35774#35745#19981#33391#39#13#10'join data0015 on data0' +
      '417.warehouse_ptr=data0015.rkey'#13#10'where data0567.failure_date>:SD' +
      ' and data0567.failure_date<=:ED  '#13#10')as t1'
    Left = 249
    Top = 269
    object cdsMain10CDSDesigner: TStringField
      FieldName = #35774#22791#20195#30721
    end
    object cdsMain10CDSDesigner2: TStringField
      FieldName = #35774#22791#21517#31216
      Size = 30
    end
    object cdsMain10CDSDesigner3: TStringField
      FieldName = #37096#38376#20195#30721
      Size = 10
    end
    object cdsMain10CDSDesigner4: TStringField
      FieldName = #37096#38376#21517#31216
      Size = 30
    end
    object cdsMain10CDSDesigner5: TStringField
      FieldName = #20301#32622
      Size = 40
    end
    object cdsMain10CDSDesigner6: TStringField
      FieldName = #24037#21378
      Size = 10
    end
    object cdsMain10CDSDesigner7: TStringField
      FieldName = #30003#35831#32534#21495
      Size = 15
    end
    object cdsMain10CDSDesigner8: TStringField
      FieldName = #29366#24577
      ReadOnly = True
      Size = 8
    end
    object cdsMain10CDSDesigner9: TStringField
      FieldName = #24433#21709#31243#24230
      Size = 8
    end
    object cdsMain10CDSDesigner10: TStringField
      FieldName = #25925#38556#35828#26126
      Size = 200
    end
    object cdsMain10CDSDesigner11: TStringField
      FieldName = #39564#25910#35780#20215
      Size = 50
    end
    object cdsMain10CDSDesigner12: TDateTimeField
      FieldName = #21463#29702#26085#26399
    end
    object cdsMain10CDSDesigner13: TStringField
      FieldName = #32500#20462#35760#24405
      Size = 200
    end
    object cdsMain10CDSDesigner14: TDateTimeField
      FieldName = #23436#24037#26085#26399
    end
    object cdsMain10CDSDesigner15: TBCDField
      FieldName = #26242#20572#23567#26102
      Precision = 8
      Size = 2
    end
    object cdsMain10CDSDesigner19: TBCDField
      FieldName = #25925#38556#32791#26102
      ReadOnly = True
      Precision = 16
      Size = 6
    end
    object cdsMain10CDSDesigner16: TBCDField
      FieldName = #23454#38469#32500#20462#26102#38388
      Precision = 8
      Size = 2
    end
    object cdsMain10CDSDesigner17: TStringField
      FieldName = #24322#24120#31867#21035
      Size = 30
    end
    object cdsMain10CDSDesigner18: TStringField
      FieldName = #38599#21592
      ReadOnly = True
      Size = 500
    end
  end
  object DataSource10: TDataSource
    DataSet = cdsMain10
    Left = 302
    Top = 267
  end
  object cdsMain11: Tcds
    Aggregates = <>
    CommandText = 
      'declare @TotalAmount dec(9,2),@SD datetime ,@ED Datetime set @To' +
      'talAmount=:TotalAmount set @SD=:SD set @ED=:ED'#13#10'select *from (se' +
      'lect * from (select '#13#10'DATA0567.RKEY DATA0567RKEY,'#13#10'DATA0567.NUMB' +
      'ER      AS ['#32500#20462#21333#21333#21495'],'#13#10'DATA0417.FASSET_CODE AS ['#35774#22791#20195#30721'], '#13#10'DATA0417.' +
      'FASSET_NAME AS ['#35774#22791#21517#31216'],             '#13#10'DATA0840.[LOCATION]  AS ['#35774#22791 +
      #36131#20219#23567#32452'],'#13#10'DATA0034.DEPT_CODE   AS ['#20351#29992#37096#38376'], '#13#10'DATA0034.DEPT_NAME   A' +
      'S ['#37096#38376#21517#31216'], '#13#10'DATA0015.ABBR_NAME   AS ['#24037#21378'],'#13#10'DATA0567.FAILURE_DATE' +
      '   ['#25925#38556#26085#26399'] ,'#13#10'NULL                    [DATA0835RKEY],'#13#10'NULL      ' +
      '              ['#24037#20316#21333#21495'],'#13#10'NULL                    ['#24037#20316#20219#21153#35828#26126'],'#13#10'null  ' +
      '                  ['#26045#24037#38431'/'#20107#19994#37096'],'#13#10'null                    ['#21463#29702#20154'],'#13#10'nu' +
      'll                    ['#39564#25910#20154'],'#13#10'null                    ['#21463#29702#26085#26399'],'#13#10' ' +
      '   (select sum(ROUND(dbo.Data0207.QUANTITY * dbo.Data0022.tax_pr' +
      'ice * dbo.Data0456.exch_rate, 4))       '#13#10#9'from data0207 join da' +
      'ta0022 on  data0022.rkey      = data0207.D0022_PTR '#13#10#9'JOIN Data0' +
      '456 ON  Data0022.GRN_PTR   = Data0456.RKEY'#13#10#9'join data0468 on  d' +
      'ata0207.D0468_ptr = Data0468.rkey'#13#10#9'join data0268 on  data0468.F' +
      'LOW_NO   = data0268.rkey and dbo.DATA0268.ttype = 2 and data0268' +
      '.status in(2,4)'#13#10#9'and data0268.[d567_ptr]=data0567.rkey)as['#37329#39069'('#26412#24065 +
      #21547#31246')]'#13#10'from data0567 join data0417  on data0417.rkey=data0567.FAS' +
      'SET_PTR'#13#10'INNER JOIN dbo.Data0015 ON dbo.data0417.warehouse_ptr =' +
      ' dbo.Data0015.RKEY '#13#10'INNER JOIN dbo.Data0034 ON dbo.data0417.dep' +
      't_ptr = dbo.Data0034.RKEY'#13#10'left join data0840 on  data0567.[d840' +
      '_ptr]=dbo.data0840.rkey'#13#10'where data0567.failure_date>=@SD and da' +
      'ta0567.failure_date<@ED'#13#10')as t1 where ['#37329#39069'('#26412#24065#21547#31246')]>@TotalAmount'#13#10'u' +
      'nion'#13#10'select * from (select '#13#10'null data0567rkey,'#13#10'null ['#32500#20462#21333#21333#21495'],'#13 +
      #10'null ['#35774#22791#32534#21495'], '#13#10'null ['#35774#22791#21517#31216'],             '#13#10'null ['#35774#22791#36131#20219#23567#32452'],'#13#10'null ' +
      '['#20351#29992#37096#38376'], '#13#10'null ['#37096#38376#21517#31216'], '#13#10'null ['#24037#21378'],'#13#10'null ['#25925#38556#26085#26399'],'#13#10'data0835.rkey' +
      ' [data0835rkey],'#13#10'data0835.WorkOrder ['#24037#20316#21333#21495'],'#13#10'data0835.WorkExpl ' +
      ' ['#24037#20316#20219#21153#35828#26126'],'#13#10'data0830.DeptName  ['#26045#24037#38431'/'#20107#19994#37096'],'#13#10'd73_2.USER_FULL_NAME ' +
      'as ['#21463#29702#20154'],'#13#10'd73_3.USER_FULL_NAME as ['#39564#25910#20154'],'#13#10'Data0835.AdmiTime ['#21463#29702 +
      #26085#26399'],'#13#10'    (select sum(ROUND(dbo.Data0207.QUANTITY * dbo.Data0022' +
      '.tax_price * dbo.Data0456.exch_rate, 4))       '#13#10#9'from data0207 ' +
      'join data0022 on  data0022.rkey      = data0207.D0022_PTR '#13#10#9'JOI' +
      'N Data0456 ON  Data0022.GRN_PTR   = Data0456.RKEY'#13#10#9'join data046' +
      '8 on  data0207.D0468_ptr = Data0468.rkey'#13#10#9'join data0268 on  dat' +
      'a0468.FLOW_NO   = data0268.rkey and dbo.DATA0268.ttype = 2 and d' +
      'ata0268.status in(2,4)'#13#10#9'and data0268.[d835_ptr]=data0835.rkey)a' +
      's['#37329#39069'('#26412#24065#21547#31246')]'#13#10'from data0835 join data0830 on data0835.Dept_ptr=da' +
      'ta0830.rkey'#13#10'join data0836 on data0835.Work_ptr=data0836.rkey'#13#10'j' +
      'oin data0073 on data0835.Applican=data0073.rkey'#13#10'left join data0' +
      '073 d73_2 on data0835.AdmiPeop=d73_2.rkey '#13#10'left join data0073 d' +
      '73_3 on data0835.AccePeop=d73_3.rkey '#13#10'where Data0835.AdmiTime>=' +
      '@SD and Data0835.AdmiTime<@ED'#13#10')as t1 where ['#37329#39069'('#26412#24065#21547#31246')]>@TotalAmo' +
      'unt)as t2'
    FilterOptions = [foCaseInsensitive]
    ObjectView = False
    Params = <
      item
        DataType = ftFloat
        Name = 'TotalAmount'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'SD'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'ED'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspMain'
    BeforeClose = cdsMainBeforeClose
    AfterClose = cdsMain11AfterClose
    AfterInsert = cdsMainAfterInsert
    BeforeCancel = cdsMainBeforeCancel
    AfterCancel = cdsMainAfterCancel
    AfterDelete = cdsMainAfterDelete
    BeforeScroll = cdsMainBeforeScroll
    AfterScroll = cdsMain11AfterScroll
    OnReconcileError = cdsMainReconcileError
    F_UKSaveNotEdit = False
    F_AutoNumb = False
    F_AutoSave = False
    F_SQLSelectFrom = 
      'declare @TotalAmount dec(9,2),@SD datetime ,@ED Datetime set @To' +
      'talAmount=:TotalAmount set @SD=:SD set @ED=:ED'#13#10'select *from (se' +
      'lect * from (select '#13#10'DATA0567.RKEY DATA0567RKEY,'#13#10'DATA0567.NUMB' +
      'ER      AS ['#32500#20462#21333#21333#21495'],'#13#10'DATA0417.FASSET_CODE AS ['#35774#22791#20195#30721'], '#13#10'DATA0417.' +
      'FASSET_NAME AS ['#35774#22791#21517#31216'],             '#13#10'DATA0840.[LOCATION]  AS ['#35774#22791 +
      #36131#20219#23567#32452'],'#13#10'DATA0034.DEPT_CODE   AS ['#20351#29992#37096#38376'], '#13#10'DATA0034.DEPT_NAME   A' +
      'S ['#37096#38376#21517#31216'], '#13#10'DATA0015.ABBR_NAME   AS ['#24037#21378'],'#13#10'DATA0567.FAILURE_DATE' +
      '   ['#25925#38556#26085#26399'] ,'#13#10'NULL                    [DATA0835RKEY],'#13#10'NULL      ' +
      '              ['#24037#20316#21333#21495'],'#13#10'NULL                    ['#24037#20316#20219#21153#35828#26126'],'#13#10'null  ' +
      '                  ['#26045#24037#38431'/'#20107#19994#37096'],'#13#10'null                    ['#21463#29702#20154'],'#13#10'nu' +
      'll                    ['#39564#25910#20154'],'#13#10'null                    ['#21463#29702#26085#26399'],'#13#10' ' +
      '   (select sum(ROUND(dbo.Data0207.QUANTITY * dbo.Data0022.tax_pr' +
      'ice * dbo.Data0456.exch_rate, 4))       '#13#10#9'from data0207 join da' +
      'ta0022 on  data0022.rkey      = data0207.D0022_PTR '#13#10#9'JOIN Data0' +
      '456 ON  Data0022.GRN_PTR   = Data0456.RKEY'#13#10#9'join data0468 on  d' +
      'ata0207.D0468_ptr = Data0468.rkey'#13#10#9'join data0268 on  data0468.F' +
      'LOW_NO   = data0268.rkey and dbo.DATA0268.ttype = 2 and data0268' +
      '.status in(2,4)'#13#10#9'and data0268.[d567_ptr]=data0567.rkey)as['#37329#39069'('#26412#24065 +
      #21547#31246')]'#13#10'from data0567 join data0417  on data0417.rkey=data0567.FAS' +
      'SET_PTR'#13#10'INNER JOIN dbo.Data0015 ON dbo.data0417.warehouse_ptr =' +
      ' dbo.Data0015.RKEY '#13#10'INNER JOIN dbo.Data0034 ON dbo.data0417.dep' +
      't_ptr = dbo.Data0034.RKEY'#13#10'left join data0840 on  data0567.[d840' +
      '_ptr]=dbo.data0840.rkey'#13#10'where data0567.failure_date>=@SD and da' +
      'ta0567.failure_date<@ED'#13#10')as t1 where ['#37329#39069'('#26412#24065#21547#31246')]>@TotalAmount'#13#10'u' +
      'nion'#13#10'select * from (select '#13#10'null data0567rkey,'#13#10'null ['#32500#20462#21333#21333#21495'],'#13 +
      #10'null ['#35774#22791#32534#21495'], '#13#10'null ['#35774#22791#21517#31216'],             '#13#10'null ['#35774#22791#36131#20219#23567#32452'],'#13#10'null ' +
      '['#20351#29992#37096#38376'], '#13#10'null ['#37096#38376#21517#31216'], '#13#10'null ['#24037#21378'],'#13#10'null ['#25925#38556#26085#26399'],'#13#10'data0835.rkey' +
      ' [data0835rkey],'#13#10'data0835.WorkOrder ['#24037#20316#21333#21495'],'#13#10'data0835.WorkExpl ' +
      ' ['#24037#20316#20219#21153#35828#26126'],'#13#10'data0830.DeptName  ['#26045#24037#38431'/'#20107#19994#37096'],'#13#10'd73_2.USER_FULL_NAME ' +
      'as ['#21463#29702#20154'],'#13#10'd73_3.USER_FULL_NAME as ['#39564#25910#20154'],'#13#10'Data0835.AdmiTime ['#21463#29702 +
      #26085#26399'],'#13#10'    (select sum(ROUND(dbo.Data0207.QUANTITY * dbo.Data0022' +
      '.tax_price * dbo.Data0456.exch_rate, 4))       '#13#10#9'from data0207 ' +
      'join data0022 on  data0022.rkey      = data0207.D0022_PTR '#13#10#9'JOI' +
      'N Data0456 ON  Data0022.GRN_PTR   = Data0456.RKEY'#13#10#9'join data046' +
      '8 on  data0207.D0468_ptr = Data0468.rkey'#13#10#9'join data0268 on  dat' +
      'a0468.FLOW_NO   = data0268.rkey and dbo.DATA0268.ttype = 2 and d' +
      'ata0268.status in(2,4)'#13#10#9'and data0268.[d835_ptr]=data0835.rkey)a' +
      's['#37329#39069'('#26412#24065#21547#31246')]'#13#10'from data0835 join data0830 on data0835.Dept_ptr=da' +
      'ta0830.rkey'#13#10'join data0836 on data0835.Work_ptr=data0836.rkey'#13#10'j' +
      'oin data0073 on data0835.Applican=data0073.rkey'#13#10'left join data0' +
      '073 d73_2 on data0835.AdmiPeop=d73_2.rkey '#13#10'left join data0073 d' +
      '73_3 on data0835.AccePeop=d73_3.rkey '#13#10'where Data0835.AdmiTime>=' +
      '@SD and Data0835.AdmiTime<@ED'#13#10')as t1 where ['#37329#39069'('#26412#24065#21547#31246')]>@TotalAmo' +
      'unt)as t2'
    Left = 249
    Top = 317
    object cdsMain11DATA0567RKEY: TIntegerField
      FieldName = 'DATA0567RKEY'
      ReadOnly = True
    end
    object cdsMain11CDSDesigner: TStringField
      FieldName = #32500#20462#21333#21333#21495
      ReadOnly = True
      Size = 15
    end
    object cdsMain11CDSDesigner2: TStringField
      FieldName = #35774#22791#20195#30721
      ReadOnly = True
    end
    object cdsMain11CDSDesigner3: TStringField
      FieldName = #35774#22791#21517#31216
      ReadOnly = True
      Size = 30
    end
    object cdsMain11CDSDesigner4: TStringField
      FieldName = #35774#22791#36131#20219#23567#32452
      ReadOnly = True
    end
    object cdsMain11CDSDesigner5: TStringField
      FieldName = #20351#29992#37096#38376
      ReadOnly = True
      Size = 10
    end
    object cdsMain11CDSDesigner6: TStringField
      FieldName = #37096#38376#21517#31216
      ReadOnly = True
      Size = 30
    end
    object cdsMain11CDSDesigner7: TStringField
      FieldName = #24037#21378
      ReadOnly = True
      Size = 10
    end
    object cdsMain11CDSDesigner8: TDateTimeField
      FieldName = #25925#38556#26085#26399
      ReadOnly = True
    end
    object cdsMain11DATA0835RKEY: TIntegerField
      FieldName = 'DATA0835RKEY'
      ReadOnly = True
    end
    object cdsMain11CDSDesigner9: TStringField
      FieldName = #24037#20316#21333#21495
      ReadOnly = True
      Size = 15
    end
    object cdsMain11CDSDesigner10: TStringField
      FieldName = #24037#20316#20219#21153#35828#26126
      ReadOnly = True
      Size = 200
    end
    object cdsMain11CDSDesigner11: TStringField
      FieldName = #26045#24037#38431'/'#20107#19994#37096
      ReadOnly = True
      Size = 50
    end
    object cdsMain11CDSDesigner13: TStringField
      FieldName = #21463#29702#20154
      ReadOnly = True
      Size = 30
    end
    object cdsMain11CDSDesigner14: TStringField
      FieldName = #39564#25910#20154
      ReadOnly = True
      Size = 30
    end
    object cdsMain11CDSDesigner15: TDateTimeField
      FieldName = #21463#29702#26085#26399
      ReadOnly = True
    end
    object cdsMain11CDSDesigner16: TBCDField
      FieldName = #37329#39069'('#26412#24065#21547#31246')'
      ReadOnly = True
      Precision = 32
      Size = 8
    end
  end
  object DataSource11: TDataSource
    DataSet = cdsMain11
    Left = 302
    Top = 315
  end
  object cdsMain11_1: Tcds
    Aggregates = <>
    CommandText = 
      'select '#13#10'data0268.number               ['#39046#26009#21333#21495'],'#13#10'data0268.[DATE] ' +
      '              ['#30003#35831#26085#26399'],'#13#10'Data0017.INV_PART_NUMBER      ['#26448#26009#32534#30721'],'#13#10'Da' +
      'ta0017.INV_PART_DESCRIPTION ['#26448#26009#21517#31216'/'#35268#26684'],'#13#10'Data0468.QUAN_BOM       ' +
      '      ['#30003#39046#25968#37327'], '#13#10'Data0468.QUAN_ISSUED          ['#24050#21457#25918#25968#37327'],'#13#10'data0002' +
      '.unit_name            ['#21333#20301'],'#13#10'ROUND(dbo.Data0207.QUANTITY * dbo.D' +
      'ata0022.tax_price * dbo.Data0456.exch_rate, 4)['#37329#39069'('#26412#24065#21547#31246')],  '#13#10'dat' +
      'a0005.EMPLOYEE_NAME        ['#30003#39046#21592#24037']    '#13#10'from data0207 '#13#10'join data' +
      '0022 on  data0022.rkey      = data0207.D0022_PTR '#13#10'JOIN Data0456' +
      ' ON  Data0022.GRN_PTR   = Data0456.RKEY'#13#10'join data0468 on  data0' +
      '207.D0468_ptr = Data0468.rkey'#13#10'join data0268 on  data0468.FLOW_N' +
      'O   = data0268.rkey and dbo.DATA0268.ttype = 2 and data0268.stat' +
      'us in(2,4)'#13#10'join dbo.Data0017 ON dbo.Data0468.INVENT_PTR = dbo.D' +
      'ata0017.RKEY'#13#10'join data0002 on data0017.STOCK_UNIT_PTR=data0002.' +
      'rkey '#13#10'join data0005 on data0268.EMPL_PTR=data0005.rkey'#13#10'where d' +
      'ata0268.[d567_ptr]=:vd567_ptr'
    FilterOptions = [foCaseInsensitive]
    ObjectView = False
    Params = <
      item
        DataType = ftInteger
        Name = 'vd567_ptr'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspMain'
    BeforeClose = cdsMainBeforeClose
    AfterInsert = cdsMainAfterInsert
    BeforeCancel = cdsMainBeforeCancel
    AfterCancel = cdsMainAfterCancel
    AfterDelete = cdsMainAfterDelete
    BeforeScroll = cdsMainBeforeScroll
    AfterScroll = cdsMainAfterScroll
    OnReconcileError = cdsMainReconcileError
    F_UKSaveNotEdit = False
    F_AutoNumb = False
    F_AutoSave = False
    F_SQLSelectFrom = 
      'select '#13#10'data0268.number               ['#39046#26009#21333#21495'],'#13#10'data0268.[DATE] ' +
      '              ['#30003#35831#26085#26399'],'#13#10'Data0017.INV_PART_NUMBER      ['#26448#26009#32534#30721'],'#13#10'Da' +
      'ta0017.INV_PART_DESCRIPTION ['#26448#26009#21517#31216'/'#35268#26684'],'#13#10'Data0468.QUAN_BOM       ' +
      '      ['#30003#39046#25968#37327'], '#13#10'Data0468.QUAN_ISSUED          ['#24050#21457#25918#25968#37327'],'#13#10'data0002' +
      '.unit_name            ['#21333#20301'],'#13#10'ROUND(dbo.Data0207.QUANTITY * dbo.D' +
      'ata0022.tax_price * dbo.Data0456.exch_rate, 4)['#37329#39069'('#26412#24065#21547#31246')],  '#13#10'dat' +
      'a0005.EMPLOYEE_NAME        ['#30003#39046#21592#24037']    '#13#10'from data0207 '#13#10'join data' +
      '0022 on  data0022.rkey      = data0207.D0022_PTR '#13#10'JOIN Data0456' +
      ' ON  Data0022.GRN_PTR   = Data0456.RKEY'#13#10'join data0468 on  data0' +
      '207.D0468_ptr = Data0468.rkey'#13#10'join data0268 on  data0468.FLOW_N' +
      'O   = data0268.rkey and dbo.DATA0268.ttype = 2 and data0268.stat' +
      'us in(2,4)'#13#10'join dbo.Data0017 ON dbo.Data0468.INVENT_PTR = dbo.D' +
      'ata0017.RKEY'#13#10'join data0002 on data0017.STOCK_UNIT_PTR=data0002.' +
      'rkey '#13#10'join data0005 on data0268.EMPL_PTR=data0005.rkey'
    Left = 353
    Top = 317
    object cdsMain11_1CDSDesigner7: TStringField
      FieldName = #39046#26009#21333#21495
      Size = 10
    end
    object cdsMain11_1CDSDesigner: TStringField
      FieldName = #26448#26009#32534#30721
      Size = 25
    end
    object cdsMain11_1CDSDesigner2: TStringField
      FieldName = #26448#26009#21517#31216'/'#35268#26684
      ReadOnly = True
      Size = 100
    end
    object cdsMain11_1CDSDesigner3: TFloatField
      FieldName = #30003#39046#25968#37327
    end
    object cdsMain11_1CDSDesigner4: TFloatField
      FieldName = #24050#21457#25918#25968#37327
    end
    object cdsMain11_1CDSDesigner5: TStringField
      FieldName = #21333#20301
    end
    object cdsMain11_1CDSDesigner6: TBCDField
      FieldName = #37329#39069'('#26412#24065#21547#31246')'
      ReadOnly = True
      Precision = 32
      Size = 8
    end
    object cdsMain11_1CDSDesigner8: TDateTimeField
      FieldName = #30003#35831#26085#26399
    end
    object cdsMain11_1CDSDesigner9: TStringField
      FieldName = #30003#39046#21592#24037
      Size = 16
    end
  end
  object DataSource11_1: TDataSource
    DataSet = cdsMain11_1
    Left = 406
    Top = 315
  end
  object cdsMain12: Tcds
    Aggregates = <>
    CommandText = 
      'declare @TotalAmount dec(9,2),@SD datetime ,@ED Datetime'#13#10'set @T' +
      'otalAmount=:TotalAmount set @SD=:SD set @ED=:ED'#13#10'select * from (' +
      'select * from ( select  '#13#10'data0831.rkey data0831rkey,'#13#10'data0831.' +
      'PlanMainDate as['#20445#20859#26085#26399'],'#13#10'data0831.StarMainTime as['#24320#22987#20445#20859#26102#38388'],'#13#10'data0' +
      '831.MainCycl     as['#20445#20859#21608#26399'],'#13#10'null DATA0567RKEY,'#13#10'null   AS ['#32500#20462#21333#21333#21495 +
      '],'#13#10'null  AS ['#35774#22791#36131#20219#23567#32452'], '#13#10'data0417.FASSET_CODE  as ['#35774#22791#20195#30721'], '#13#10'data' +
      '0417.FASSET_NAME  as ['#35774#22791#21517#31216'], '#13#10'null ['#25925#38556#26085#26399'] ,            '#13#10'Data00' +
      '15.ABBR_NAME    AS ['#24037#21378'], '#13#10'Data0034.DEPT_CODE    as ['#20351#29992#37096#38376'], '#13#10'Da' +
      'ta0034.DEPT_NAME    as ['#37096#38376#21517#31216'],  '#13#10'(select sum(ROUND(dbo.Data0207' +
      '.QUANTITY * dbo.Data0022.tax_price * dbo.Data0456.exch_rate, 4))' +
      '       '#13#10#9'from data0207 '#13#10#9'join data0022 on  data0022.rkey      ' +
      '= data0207.D0022_PTR '#13#10#9'JOIN Data0456 ON  Data0022.GRN_PTR   = D' +
      'ata0456.RKEY'#13#10#9'join data0468 on  data0207.D0468_ptr = Data0468.r' +
      'key'#13#10#9'join data0268 on  data0468.FLOW_NO   = data0268.rkey and d' +
      'bo.DATA0268.ttype = 3 and data0268.status in(2,4)'#13#10#9'and data0268' +
      '.[d831_ptr]=data0831.rkey)as['#37329#39069'('#26412#24065#21547#31246')]/* */'#13#10'from data0831'#13#10'join' +
      ' data0417  on data0417.FASSET_CODE=data0831.DeviNumb'#13#10'INNER JOIN' +
      ' dbo.Data0015 ON dbo.data0417.warehouse_ptr = dbo.Data0015.RKEY ' +
      #13#10'INNER JOIN dbo.Data0034 ON dbo.data0417.dept_ptr = dbo.Data003' +
      '4.RKEY'#13#10'where data0831.StarMainTime>=@SD and data0831.StarMainTi' +
      'me<@ED)as t1'#13#10'where ['#37329#39069'('#26412#24065#21547#31246')]>=@TotalAmount'#13#10'union'#13#10'select * fr' +
      'om (select '#13#10'null data0831rkey,'#13#10'null['#20445#20859#26085#26399'],'#13#10'null['#24320#22987#20445#20859#26102#38388'],'#13#10'nul' +
      'l['#20445#20859#21608#26399'],'#13#10'DATA0567.RKEY DATA0567RKEY,'#13#10'DATA0567.NUMBER      AS [' +
      #32500#20462#21333#21333#21495'],'#13#10'DATA0840.[LOCATION]  AS ['#35774#22791#36131#20219#23567#32452'],'#13#10'DATA0417.FASSET_CODE' +
      ' AS ['#35774#22791#32534#21495'], '#13#10'DATA0417.FASSET_NAME AS ['#35774#22791#21517#31216'],             '#13#10'DATA' +
      '0567.FAILURE_DATE   ['#25925#38556#26085#26399'] ,'#13#10'DATA0015.ABBR_NAME   AS ['#24037#21378'],'#13#10'DAT' +
      'A0034.DEPT_CODE   AS ['#20351#29992#37096#38376'], '#13#10'DATA0034.DEPT_NAME   AS ['#37096#38376#21517#31216'], '#13 +
      #10'    (select sum(ROUND(dbo.Data0207.QUANTITY * dbo.Data0022.tax_' +
      'price * dbo.Data0456.exch_rate, 4))       '#13#10#9'from data0207 '#13#10#9'jo' +
      'in data0022 on  data0022.rkey      = data0207.D0022_PTR '#13#10#9'JOIN ' +
      'Data0456 ON  Data0022.GRN_PTR   = Data0456.RKEY'#13#10#9'join data0468 ' +
      'on  data0207.D0468_ptr = Data0468.rkey'#13#10#9'join data0268 on  data0' +
      '468.FLOW_NO   = data0268.rkey and dbo.DATA0268.ttype = 3 and dat' +
      'a0268.status in(2,4)'#13#10#9'and data0268.[d567_ptr]=data0567.rkey)as[' +
      #37329#39069'('#26412#24065#21547#31246')]'#13#10'from data0567 '#13#10'join data0417  on data0417.rkey=data0' +
      '567.FASSET_PTR'#13#10'INNER JOIN dbo.Data0015 ON dbo.data0417.warehous' +
      'e_ptr = dbo.Data0015.RKEY '#13#10'INNER JOIN dbo.Data0034 ON dbo.data0' +
      '417.dept_ptr = dbo.Data0034.RKEY'#13#10'left join data0840 on  data056' +
      '7.[d840_ptr]=dbo.data0840.rkey'#13#10'where data0567.failure_date>=@SD' +
      ' and data0567.failure_date<@ED'#13#10')as t1'#13#10'where ['#37329#39069'('#26412#24065#21547#31246')]>@TotalA' +
      'mount)as t2'
    FilterOptions = [foCaseInsensitive]
    ObjectView = False
    Params = <
      item
        DataType = ftFloat
        Name = 'TotalAmount'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'SD'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'ED'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspMain'
    BeforeClose = cdsMainBeforeClose
    AfterClose = cdsMain12AfterClose
    AfterInsert = cdsMainAfterInsert
    BeforeCancel = cdsMainBeforeCancel
    AfterCancel = cdsMainAfterCancel
    AfterDelete = cdsMainAfterDelete
    BeforeScroll = cdsMainBeforeScroll
    AfterScroll = cdsMain12AfterScroll
    OnReconcileError = cdsMainReconcileError
    F_UKSaveNotEdit = False
    F_AutoNumb = False
    F_AutoSave = False
    F_SQLSelectFrom = 
      'declare @TotalAmount dec(9,2),@SD datetime ,@ED Datetime'#13#10'set @T' +
      'otalAmount=:TotalAmount set @SD=:SD set @ED=:ED'#13#10'select * from (' +
      'select * from ( select  '#13#10'data0831.rkey data0831rkey,'#13#10'data0831.' +
      'PlanMainDate as['#20445#20859#26085#26399'],'#13#10'data0831.StarMainTime as['#24320#22987#20445#20859#26102#38388'],'#13#10'data0' +
      '831.MainCycl     as['#20445#20859#21608#26399'],'#13#10'null DATA0567RKEY,'#13#10'null   AS ['#32500#20462#21333#21333#21495 +
      '],'#13#10'null  AS ['#35774#22791#36131#20219#23567#32452'], '#13#10'data0417.FASSET_CODE  as ['#35774#22791#20195#30721'], '#13#10'data' +
      '0417.FASSET_NAME  as ['#35774#22791#21517#31216'], '#13#10'null ['#25925#38556#26085#26399'] ,            '#13#10'Data00' +
      '15.ABBR_NAME    AS ['#24037#21378'], '#13#10'Data0034.DEPT_CODE    as ['#20351#29992#37096#38376'], '#13#10'Da' +
      'ta0034.DEPT_NAME    as ['#37096#38376#21517#31216'],  '#13#10'(select sum(ROUND(dbo.Data0207' +
      '.QUANTITY * dbo.Data0022.tax_price * dbo.Data0456.exch_rate, 4))' +
      '       '#13#10#9'from data0207 '#13#10#9'join data0022 on  data0022.rkey      ' +
      '= data0207.D0022_PTR '#13#10#9'JOIN Data0456 ON  Data0022.GRN_PTR   = D' +
      'ata0456.RKEY'#13#10#9'join data0468 on  data0207.D0468_ptr = Data0468.r' +
      'key'#13#10#9'join data0268 on  data0468.FLOW_NO   = data0268.rkey and d' +
      'bo.DATA0268.ttype = 3 and data0268.status in(2,4)'#13#10#9'and data0268' +
      '.[d831_ptr]=data0831.rkey)as['#37329#39069'('#26412#24065#21547#31246')]/* */'#13#10'from data0831'#13#10'join' +
      ' data0417  on data0417.FASSET_CODE=data0831.DeviNumb'#13#10'INNER JOIN' +
      ' dbo.Data0015 ON dbo.data0417.warehouse_ptr = dbo.Data0015.RKEY ' +
      #13#10'INNER JOIN dbo.Data0034 ON dbo.data0417.dept_ptr = dbo.Data003' +
      '4.RKEY'#13#10'where data0831.StarMainTime>=@SD and data0831.StarMainTi' +
      'me<@ED)as t1'#13#10'where ['#37329#39069'('#26412#24065#21547#31246')]>=@TotalAmount'#13#10'union'#13#10'select * fr' +
      'om (select '#13#10'null data0831rkey,'#13#10'null['#20445#20859#26085#26399'],'#13#10'null['#24320#22987#20445#20859#26102#38388'],'#13#10'nul' +
      'l['#20445#20859#21608#26399'],'#13#10'DATA0567.RKEY DATA0567RKEY,'#13#10'DATA0567.NUMBER      AS [' +
      #32500#20462#21333#21333#21495'],'#13#10'DATA0840.[LOCATION]  AS ['#35774#22791#36131#20219#23567#32452'],'#13#10'DATA0417.FASSET_CODE' +
      ' AS ['#35774#22791#32534#21495'], '#13#10'DATA0417.FASSET_NAME AS ['#35774#22791#21517#31216'],             '#13#10'DATA' +
      '0567.FAILURE_DATE   ['#25925#38556#26085#26399'] ,'#13#10'DATA0015.ABBR_NAME   AS ['#24037#21378'],'#13#10'DAT' +
      'A0034.DEPT_CODE   AS ['#20351#29992#37096#38376'], '#13#10'DATA0034.DEPT_NAME   AS ['#37096#38376#21517#31216'], '#13 +
      #10'    (select sum(ROUND(dbo.Data0207.QUANTITY * dbo.Data0022.tax_' +
      'price * dbo.Data0456.exch_rate, 4))       '#13#10#9'from data0207 '#13#10#9'jo' +
      'in data0022 on  data0022.rkey      = data0207.D0022_PTR '#13#10#9'JOIN ' +
      'Data0456 ON  Data0022.GRN_PTR   = Data0456.RKEY'#13#10#9'join data0468 ' +
      'on  data0207.D0468_ptr = Data0468.rkey'#13#10#9'join data0268 on  data0' +
      '468.FLOW_NO   = data0268.rkey and dbo.DATA0268.ttype = 3 and dat' +
      'a0268.status in(2,4)'#13#10#9'and data0268.[d567_ptr]=data0567.rkey)as[' +
      #37329#39069'('#26412#24065#21547#31246')]'#13#10'from data0567 '#13#10'join data0417  on data0417.rkey=data0' +
      '567.FASSET_PTR'#13#10'INNER JOIN dbo.Data0015 ON dbo.data0417.warehous' +
      'e_ptr = dbo.Data0015.RKEY '#13#10'INNER JOIN dbo.Data0034 ON dbo.data0' +
      '417.dept_ptr = dbo.Data0034.RKEY'#13#10'left join data0840 on  data056' +
      '7.[d840_ptr]=dbo.data0840.rkey'#13#10'where data0567.failure_date>=@SD' +
      ' and data0567.failure_date<@ED'#13#10')as t1'#13#10'where ['#37329#39069'('#26412#24065#21547#31246')]>@TotalA' +
      'mount)as t2'
    Left = 249
    Top = 357
    object cdsMain12CDSDesigner: TDateTimeField
      FieldName = #20445#20859#26085#26399
    end
    object cdsMain12CDSDesigner9: TDateTimeField
      FieldName = #24320#22987#20445#20859#26102#38388
    end
    object cdsMain12CDSDesigner2: TStringField
      FieldName = #20445#20859#21608#26399
      Size = 10
    end
    object cdsMain12CDSDesigner3: TStringField
      FieldName = #35774#22791#20195#30721
    end
    object cdsMain12CDSDesigner4: TStringField
      FieldName = #35774#22791#21517#31216
      Size = 30
    end
    object cdsMain12CDSDesigner5: TStringField
      FieldName = #20351#29992#37096#38376
      Size = 10
    end
    object cdsMain12CDSDesigner6: TStringField
      FieldName = #37096#38376#21517#31216
      Size = 30
    end
    object cdsMain12CDSDesigner7: TStringField
      FieldName = #24037#21378
      Size = 10
    end
    object cdsMain12CDSDesigner8: TBCDField
      FieldName = #37329#39069'('#26412#24065#21547#31246')'
      ReadOnly = True
      Precision = 32
      Size = 8
    end
    object cdsMain12data0831rkey: TIntegerField
      FieldName = 'data0831rkey'
      ReadOnly = True
    end
    object cdsMain12DATA0567RKEY: TIntegerField
      FieldName = 'DATA0567RKEY'
      ReadOnly = True
    end
    object cdsMain12CDSDesigner10: TStringField
      FieldName = #32500#20462#21333#21333#21495
      ReadOnly = True
      Size = 15
    end
    object cdsMain12CDSDesigner11: TStringField
      FieldName = #35774#22791#36131#20219#23567#32452
      ReadOnly = True
    end
    object cdsMain12CDSDesigner12: TDateTimeField
      FieldName = #25925#38556#26085#26399
      ReadOnly = True
    end
  end
  object DataSource12: TDataSource
    DataSet = cdsMain12
    Left = 302
    Top = 355
  end
  object cdsMain12_1: Tcds
    Aggregates = <>
    CommandText = 
      'select '#13#10'data0268.number               ['#39046#26009#21333#21495'],'#13#10'data0268.[DATE] ' +
      '              ['#30003#35831#26085#26399'],'#13#10'Data0017.INV_PART_NUMBER      ['#26448#26009#32534#30721'],'#13#10'Da' +
      'ta0017.INV_PART_DESCRIPTION ['#26448#26009#21517#31216'/'#35268#26684'],'#13#10'Data0468.QUAN_BOM       ' +
      '      ['#30003#39046#25968#37327'], '#13#10'Data0468.QUAN_ISSUED          ['#24050#21457#25918#25968#37327'],'#13#10'data0002' +
      '.unit_name            ['#21333#20301'],'#13#10'ROUND(dbo.Data0207.QUANTITY * dbo.D' +
      'ata0022.tax_price * dbo.Data0456.exch_rate, 4)['#37329#39069'('#26412#24065#21547#31246')],  '#13#10'dat' +
      'a0005.EMPLOYEE_NAME        ['#30003#39046#21592#24037']    '#13#10'from data0207 '#13#10'join data' +
      '0022 on  data0022.rkey      = data0207.D0022_PTR '#13#10'JOIN Data0456' +
      ' ON  Data0022.GRN_PTR   = Data0456.RKEY'#13#10'join data0468 on  data0' +
      '207.D0468_ptr = Data0468.rkey'#13#10'join data0268 on  data0468.FLOW_N' +
      'O   = data0268.rkey and dbo.DATA0268.ttype = 2 and data0268.stat' +
      'us in(2,4)'#13#10'join dbo.Data0017 ON dbo.Data0468.INVENT_PTR = dbo.D' +
      'ata0017.RKEY'#13#10'join data0002 on data0017.STOCK_UNIT_PTR=data0002.' +
      'rkey '#13#10'join data0005 on data0268.EMPL_PTR=data0005.rkey'#13#10'where d' +
      'ata0268.D831_ptr=:vD831_ptr'
    FilterOptions = [foCaseInsensitive]
    ObjectView = False
    Params = <
      item
        DataType = ftInteger
        Name = 'vD831_ptr'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspMain'
    BeforeClose = cdsMainBeforeClose
    AfterInsert = cdsMainAfterInsert
    BeforeCancel = cdsMainBeforeCancel
    AfterCancel = cdsMainAfterCancel
    AfterDelete = cdsMainAfterDelete
    BeforeScroll = cdsMainBeforeScroll
    AfterScroll = cdsMainAfterScroll
    OnReconcileError = cdsMainReconcileError
    F_UKSaveNotEdit = False
    F_AutoNumb = False
    F_AutoSave = False
    F_SQLSelectFrom = 
      'select '#13#10'data0268.number               ['#39046#26009#21333#21495'],'#13#10'data0268.[DATE] ' +
      '              ['#30003#35831#26085#26399'],'#13#10'Data0017.INV_PART_NUMBER      ['#26448#26009#32534#30721'],'#13#10'Da' +
      'ta0017.INV_PART_DESCRIPTION ['#26448#26009#21517#31216'/'#35268#26684'],'#13#10'Data0468.QUAN_BOM       ' +
      '      ['#30003#39046#25968#37327'], '#13#10'Data0468.QUAN_ISSUED          ['#24050#21457#25918#25968#37327'],'#13#10'data0002' +
      '.unit_name            ['#21333#20301'],'#13#10'ROUND(dbo.Data0207.QUANTITY * dbo.D' +
      'ata0022.tax_price * dbo.Data0456.exch_rate, 4)['#37329#39069'('#26412#24065#21547#31246')],  '#13#10'dat' +
      'a0005.EMPLOYEE_NAME        ['#30003#39046#21592#24037']    '#13#10'from data0207 '#13#10'join data' +
      '0022 on  data0022.rkey      = data0207.D0022_PTR '#13#10'JOIN Data0456' +
      ' ON  Data0022.GRN_PTR   = Data0456.RKEY'#13#10'join data0468 on  data0' +
      '207.D0468_ptr = Data0468.rkey'#13#10'join data0268 on  data0468.FLOW_N' +
      'O   = data0268.rkey and dbo.DATA0268.ttype = 2 and data0268.stat' +
      'us in(2,4)'#13#10'join dbo.Data0017 ON dbo.Data0468.INVENT_PTR = dbo.D' +
      'ata0017.RKEY'#13#10'join data0002 on data0017.STOCK_UNIT_PTR=data0002.' +
      'rkey '#13#10'join data0005 on data0268.EMPL_PTR=data0005.rkey'#13#10
    Left = 353
    Top = 357
    object cdsMain12_1CDSDesigner: TStringField
      FieldName = #39046#26009#21333#21495
      Size = 10
    end
    object StringField40: TStringField
      FieldName = #26448#26009#32534#30721
      Size = 25
    end
    object StringField41: TStringField
      FieldName = #26448#26009#21517#31216'/'#35268#26684
      ReadOnly = True
      Size = 100
    end
    object FloatField1: TFloatField
      FieldName = #30003#39046#25968#37327
    end
    object FloatField2: TFloatField
      FieldName = #24050#21457#25918#25968#37327
    end
    object StringField42: TStringField
      FieldName = #21333#20301
    end
    object BCDField3: TBCDField
      FieldName = #37329#39069'('#26412#24065#21547#31246')'
      ReadOnly = True
      Precision = 32
      Size = 8
    end
    object cdsMain12_1CDSDesigner2: TDateTimeField
      FieldName = #30003#35831#26085#26399
    end
    object cdsMain12_1CDSDesigner3: TStringField
      FieldName = #30003#39046#21592#24037
      Size = 16
    end
  end
  object DataSource12_1: TDataSource
    DataSet = cdsMain12_1
    Left = 406
    Top = 355
  end
  object cdsMain13: Tcds
    Aggregates = <>
    CommandText = 
      'declare @TotalAmount dec(9,2),@SD datetime ,@ED Datetime set @To' +
      'talAmount=:TotalAmount set @SD=:SD set @ED=:ED'#13#10'select *from (se' +
      'lect * from (select data0835.rkey [data0835rkey],'#13#10'data0835.Work' +
      'Order ['#24037#20316#21333#21495'],'#13#10'data0835.WorkExpl  ['#24037#20316#20219#21153#35828#26126'],'#13#10'data0830.DeptName  ' +
      '['#26045#24037#38431'/'#20107#19994#37096'],'#13#10'data0835.AdmiTime  ['#21463#29702#26102#38388'],'#13#10'd73_2.USER_FULL_NAME as ' +
      '['#21463#29702#20154'],'#13#10'd73_3.USER_FULL_NAME as ['#39564#25910#20154'],'#13#10'Data0835.AdmiTime ['#21463#29702#26085#26399']' +
      ','#13#10'null data0567rkey,'#13#10'null ['#32500#20462#21333#21333#21495'],'#13#10'null ['#35774#22791#20195#30721'], '#13#10'null ['#35774#22791#21517#31216']' +
      ',             '#13#10'null ['#35774#22791#36131#20219#23567#32452'],'#13#10'null ['#20351#29992#37096#38376'], '#13#10'null ['#37096#38376#21517#31216'], '#13#10'nu' +
      'll ['#24037#21378'],'#13#10'null ['#25925#38556#26085#26399'],'#13#10'    (select sum(ROUND(dbo.Data0207.QUANT' +
      'ITY * dbo.Data0022.tax_price * dbo.Data0456.exch_rate, 4))      ' +
      ' '#13#10#9'from data0207 '#13#10#9'join data0022 on  data0022.rkey      = data' +
      '0207.D0022_PTR '#13#10#9'JOIN Data0456 ON  Data0022.GRN_PTR   = Data045' +
      '6.RKEY'#13#10#9'join data0468 on  data0207.D0468_ptr = Data0468.rkey'#13#10#9 +
      'join data0268 on  data0468.FLOW_NO   = data0268.rkey and dbo.DAT' +
      'A0268.ttype = 4 and data0268.status in(2,4)'#13#10#9'and data0268.[d835' +
      '_ptr]=data0835.rkey)as['#37329#39069'('#26412#24065#21547#31246')]'#13#10'from data0835 join data0830 on' +
      ' data0835.Dept_ptr=data0830.rkey'#13#10'join data0836 on data0835.Work' +
      '_ptr=data0836.rkey'#13#10'join data0073 on data0835.Applican=data0073.' +
      'rkey'#13#10'left join data0073 d73_2 on data0835.AdmiPeop=d73_2.rkey '#13 +
      #10'left join data0073 d73_3 on data0835.AccePeop=d73_3.rkey '#13#10'wher' +
      'e Data0835.AdmiTime>=@SD and Data0835.AdmiTime<@ED'#13#10')as t1 where' +
      ' ['#37329#39069'('#26412#24065#21547#31246')]>@TotalAmount'#13#10'union'#13#10'select * from (select NULL     ' +
      '               [DATA0835RKEY],'#13#10'NULL                    ['#24037#20316#21333#21495'],'#13 +
      #10'NULL                    ['#24037#20316#20219#21153#35828#26126'],'#13#10'null                    ['#26045#24037#38431 +
      '/'#20107#19994#37096'],'#13#10'null                    ['#21463#29702#26102#38388'],'#13#10'null                   ' +
      ' ['#21463#29702#20154'],'#13#10'null                    ['#39564#25910#20154'],'#13#10'null                   ' +
      ' ['#21463#29702#26085#26399'],'#13#10'DATA0567.RKEY DATA0567RKEY,'#13#10'DATA0567.NUMBER      AS [' +
      #32500#20462#21333#21333#21495'],'#13#10'DATA0417.FASSET_CODE AS ['#35774#22791#20195#30721'], '#13#10'DATA0417.FASSET_NAME ' +
      'AS ['#35774#22791#21517#31216'],             '#13#10'DATA0840.[LOCATION]  AS ['#35774#22791#36131#20219#23567#32452'],'#13#10'DATA' +
      '0034.DEPT_CODE   AS ['#20351#29992#37096#38376'], '#13#10'DATA0034.DEPT_NAME   AS ['#37096#38376#21517#31216'], '#13#10 +
      'DATA0015.ABBR_NAME   AS ['#24037#21378'],'#13#10'DATA0567.FAILURE_DATE   ['#25925#38556#26085#26399'] ,'#13 +
      #10'    (select sum(ROUND(dbo.Data0207.QUANTITY * dbo.Data0022.tax_' +
      'price * dbo.Data0456.exch_rate, 4))       '#13#10#9'from data0207 join ' +
      'data0022 on  data0022.rkey      = data0207.D0022_PTR '#13#10#9'JOIN Dat' +
      'a0456 ON  Data0022.GRN_PTR   = Data0456.RKEY'#13#10#9'join data0468 on ' +
      ' data0207.D0468_ptr = Data0468.rkey'#13#10#9'join data0268 on  data0468' +
      '.FLOW_NO   = data0268.rkey and dbo.DATA0268.ttype = 4 and data02' +
      '68.status in(2,4)'#13#10#9'and data0268.[d567_ptr]=data0567.rkey)as['#37329#39069'(' +
      #26412#24065#21547#31246')]'#13#10'from data0567 join data0417  on data0417.rkey=data0567.F' +
      'ASSET_PTR'#13#10'INNER JOIN dbo.Data0015 ON dbo.data0417.warehouse_ptr' +
      ' = dbo.Data0015.RKEY '#13#10'INNER JOIN dbo.Data0034 ON dbo.data0417.d' +
      'ept_ptr = dbo.Data0034.RKEY'#13#10'left join data0840 on  data0567.[d8' +
      '40_ptr]=dbo.data0840.rkey'#13#10'where data0567.failure_date>=@SD and ' +
      'data0567.failure_date<@ED'#13#10')as t1 where ['#37329#39069'('#26412#24065#21547#31246')]>@TotalAmount)' +
      'as t2'
    FilterOptions = [foCaseInsensitive]
    ObjectView = False
    Params = <
      item
        DataType = ftFloat
        Name = 'TotalAmount'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'SD'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'ED'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspMain'
    BeforeClose = cdsMainBeforeClose
    AfterClose = cdsMain13AfterClose
    AfterInsert = cdsMainAfterInsert
    BeforeCancel = cdsMainBeforeCancel
    AfterCancel = cdsMainAfterCancel
    AfterDelete = cdsMainAfterDelete
    BeforeScroll = cdsMainBeforeScroll
    AfterScroll = cdsMain13AfterScroll
    OnReconcileError = cdsMainReconcileError
    F_UKSaveNotEdit = False
    F_AutoNumb = False
    F_AutoSave = False
    F_SQLSelectFrom = 
      'declare @TotalAmount dec(9,2),@SD datetime ,@ED Datetime set @To' +
      'talAmount=:TotalAmount set @SD=:SD set @ED=:ED'#13#10'select *from (se' +
      'lect * from (select data0835.rkey [data0835rkey],'#13#10'data0835.Work' +
      'Order ['#24037#20316#21333#21495'],'#13#10'data0835.WorkExpl  ['#24037#20316#20219#21153#35828#26126'],'#13#10'data0830.DeptName  ' +
      '['#26045#24037#38431'/'#20107#19994#37096'],'#13#10'data0835.AdmiTime  ['#21463#29702#26102#38388'],'#13#10'd73_2.USER_FULL_NAME as ' +
      '['#21463#29702#20154'],'#13#10'd73_3.USER_FULL_NAME as ['#39564#25910#20154'],'#13#10'Data0835.AdmiTime ['#21463#29702#26085#26399']' +
      ','#13#10'null data0567rkey,'#13#10'null ['#32500#20462#21333#21333#21495'],'#13#10'null ['#35774#22791#20195#30721'], '#13#10'null ['#35774#22791#21517#31216']' +
      ',             '#13#10'null ['#35774#22791#36131#20219#23567#32452'],'#13#10'null ['#20351#29992#37096#38376'], '#13#10'null ['#37096#38376#21517#31216'], '#13#10'nu' +
      'll ['#24037#21378'],'#13#10'null ['#25925#38556#26085#26399'],'#13#10'    (select sum(ROUND(dbo.Data0207.QUANT' +
      'ITY * dbo.Data0022.tax_price * dbo.Data0456.exch_rate, 4))      ' +
      ' '#13#10#9'from data0207 '#13#10#9'join data0022 on  data0022.rkey      = data' +
      '0207.D0022_PTR '#13#10#9'JOIN Data0456 ON  Data0022.GRN_PTR   = Data045' +
      '6.RKEY'#13#10#9'join data0468 on  data0207.D0468_ptr = Data0468.rkey'#13#10#9 +
      'join data0268 on  data0468.FLOW_NO   = data0268.rkey and dbo.DAT' +
      'A0268.ttype = 4 and data0268.status in(2,4)'#13#10#9'and data0268.[d835' +
      '_ptr]=data0835.rkey)as['#37329#39069'('#26412#24065#21547#31246')]'#13#10'from data0835 join data0830 on' +
      ' data0835.Dept_ptr=data0830.rkey'#13#10'join data0836 on data0835.Work' +
      '_ptr=data0836.rkey'#13#10'join data0073 on data0835.Applican=data0073.' +
      'rkey'#13#10'left join data0073 d73_2 on data0835.AdmiPeop=d73_2.rkey '#13 +
      #10'left join data0073 d73_3 on data0835.AccePeop=d73_3.rkey '#13#10'wher' +
      'e Data0835.AdmiTime>=@SD and Data0835.AdmiTime<@ED'#13#10')as t1 where' +
      ' ['#37329#39069'('#26412#24065#21547#31246')]>@TotalAmount'#13#10'union'#13#10'select * from (select NULL     ' +
      '               [DATA0835RKEY],'#13#10'NULL                    ['#24037#20316#21333#21495'],'#13 +
      #10'NULL                    ['#24037#20316#20219#21153#35828#26126'],'#13#10'null                    ['#26045#24037#38431 +
      '/'#20107#19994#37096'],'#13#10'null                    ['#21463#29702#26102#38388'],'#13#10'null                   ' +
      ' ['#21463#29702#20154'],'#13#10'null                    ['#39564#25910#20154'],'#13#10'null                   ' +
      ' ['#21463#29702#26085#26399'],'#13#10'DATA0567.RKEY DATA0567RKEY,'#13#10'DATA0567.NUMBER      AS [' +
      #32500#20462#21333#21333#21495'],'#13#10'DATA0417.FASSET_CODE AS ['#35774#22791#20195#30721'], '#13#10'DATA0417.FASSET_NAME ' +
      'AS ['#35774#22791#21517#31216'],             '#13#10'DATA0840.[LOCATION]  AS ['#35774#22791#36131#20219#23567#32452'],'#13#10'DATA' +
      '0034.DEPT_CODE   AS ['#20351#29992#37096#38376'], '#13#10'DATA0034.DEPT_NAME   AS ['#37096#38376#21517#31216'], '#13#10 +
      'DATA0015.ABBR_NAME   AS ['#24037#21378'],'#13#10'DATA0567.FAILURE_DATE   ['#25925#38556#26085#26399'] ,'#13 +
      #10'    (select sum(ROUND(dbo.Data0207.QUANTITY * dbo.Data0022.tax_' +
      'price * dbo.Data0456.exch_rate, 4))       '#13#10#9'from data0207 join ' +
      'data0022 on  data0022.rkey      = data0207.D0022_PTR '#13#10#9'JOIN Dat' +
      'a0456 ON  Data0022.GRN_PTR   = Data0456.RKEY'#13#10#9'join data0468 on ' +
      ' data0207.D0468_ptr = Data0468.rkey'#13#10#9'join data0268 on  data0468' +
      '.FLOW_NO   = data0268.rkey and dbo.DATA0268.ttype = 4 and data02' +
      '68.status in(2,4)'#13#10#9'and data0268.[d567_ptr]=data0567.rkey)as['#37329#39069'(' +
      #26412#24065#21547#31246')]'#13#10'from data0567 join data0417  on data0417.rkey=data0567.F' +
      'ASSET_PTR'#13#10'INNER JOIN dbo.Data0015 ON dbo.data0417.warehouse_ptr' +
      ' = dbo.Data0015.RKEY '#13#10'INNER JOIN dbo.Data0034 ON dbo.data0417.d' +
      'ept_ptr = dbo.Data0034.RKEY'#13#10'left join data0840 on  data0567.[d8' +
      '40_ptr]=dbo.data0840.rkey'#13#10'where data0567.failure_date>=@SD and ' +
      'data0567.failure_date<@ED'#13#10')as t1 where ['#37329#39069'('#26412#24065#21547#31246')]>@TotalAmount)' +
      'as t2'
    Left = 249
    Top = 389
    object cdsMain13data0835rkey: TIntegerField
      FieldName = 'data0835rkey'
      ReadOnly = True
    end
    object cdsMain13CDSDesigner: TStringField
      FieldName = #24037#20316#21333#21495
      ReadOnly = True
      Size = 15
    end
    object cdsMain13CDSDesigner2: TStringField
      FieldName = #24037#20316#20219#21153#35828#26126
      ReadOnly = True
      Size = 200
    end
    object cdsMain13CDSDesigner3: TStringField
      FieldName = #26045#24037#38431'/'#20107#19994#37096
      ReadOnly = True
      Size = 50
    end
    object cdsMain13CDSDesigner5: TStringField
      FieldName = #21463#29702#20154
      ReadOnly = True
      Size = 30
    end
    object cdsMain13CDSDesigner6: TStringField
      FieldName = #39564#25910#20154
      ReadOnly = True
      Size = 30
    end
    object cdsMain13CDSDesigner7: TDateTimeField
      FieldName = #21463#29702#26085#26399
      ReadOnly = True
    end
    object cdsMain13data0567rkey: TIntegerField
      FieldName = 'data0567rkey'
      ReadOnly = True
    end
    object cdsMain13CDSDesigner8: TStringField
      FieldName = #32500#20462#21333#21333#21495
      ReadOnly = True
      Size = 15
    end
    object cdsMain13CDSDesigner9: TStringField
      FieldName = #35774#22791#20195#30721
      ReadOnly = True
    end
    object cdsMain13CDSDesigner10: TStringField
      FieldName = #35774#22791#21517#31216
      ReadOnly = True
      Size = 30
    end
    object cdsMain13CDSDesigner11: TStringField
      FieldName = #35774#22791#36131#20219#23567#32452
      ReadOnly = True
    end
    object cdsMain13CDSDesigner12: TStringField
      FieldName = #20351#29992#37096#38376
      ReadOnly = True
      Size = 10
    end
    object cdsMain13CDSDesigner13: TStringField
      FieldName = #37096#38376#21517#31216
      ReadOnly = True
      Size = 30
    end
    object cdsMain13CDSDesigner14: TStringField
      FieldName = #24037#21378
      ReadOnly = True
      Size = 10
    end
    object cdsMain13CDSDesigner15: TDateTimeField
      FieldName = #25925#38556#26085#26399
      ReadOnly = True
    end
    object cdsMain13CDSDesigner16: TBCDField
      FieldName = #37329#39069'('#26412#24065#21547#31246')'
      ReadOnly = True
      Precision = 32
      Size = 8
    end
  end
  object DataSource13: TDataSource
    DataSet = cdsMain13
    Left = 302
    Top = 387
  end
  object cdsMain13_1: Tcds
    Aggregates = <>
    CommandText = 
      'select '#13#10'data0268.number               ['#39046#26009#21333#21495'],'#13#10'data0268.[DATE] ' +
      '              ['#30003#35831#26085#26399'],'#13#10'Data0017.INV_PART_NUMBER      ['#26448#26009#32534#30721'],'#13#10'Da' +
      'ta0017.INV_PART_DESCRIPTION ['#26448#26009#21517#31216'/'#35268#26684'],'#13#10'Data0468.QUAN_BOM       ' +
      '      ['#30003#39046#25968#37327'], '#13#10'Data0468.QUAN_ISSUED          ['#24050#21457#25918#25968#37327'],'#13#10'data0002' +
      '.unit_name            ['#21333#20301'],'#13#10'ROUND(dbo.Data0207.QUANTITY * dbo.D' +
      'ata0022.tax_price * dbo.Data0456.exch_rate, 4)['#37329#39069'('#26412#24065#21547#31246')],  '#13#10'dat' +
      'a0005.EMPLOYEE_NAME        ['#30003#39046#21592#24037']    '#13#10'from data0207 '#13#10'join data' +
      '0022 on  data0022.rkey      = data0207.D0022_PTR '#13#10'JOIN Data0456' +
      ' ON  Data0022.GRN_PTR   = Data0456.RKEY'#13#10'join data0468 on  data0' +
      '207.D0468_ptr = Data0468.rkey'#13#10'join data0268 on  data0468.FLOW_N' +
      'O   = data0268.rkey and dbo.DATA0268.ttype = 2 and data0268.stat' +
      'us in(2,4)'#13#10'join dbo.Data0017 ON dbo.Data0468.INVENT_PTR = dbo.D' +
      'ata0017.RKEY'#13#10'join data0002 on data0017.STOCK_UNIT_PTR=data0002.' +
      'rkey '#13#10'join data0005 on data0268.EMPL_PTR=data0005.rkey'#13#10'where d' +
      'ata0268.D835_ptr=:vD835_ptr'
    FilterOptions = [foCaseInsensitive]
    ObjectView = False
    Params = <
      item
        DataType = ftInteger
        Name = 'vD835_ptr'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspMain'
    BeforeClose = cdsMainBeforeClose
    AfterInsert = cdsMainAfterInsert
    BeforeCancel = cdsMainBeforeCancel
    AfterCancel = cdsMainAfterCancel
    AfterDelete = cdsMainAfterDelete
    BeforeScroll = cdsMainBeforeScroll
    AfterScroll = cdsMainAfterScroll
    OnReconcileError = cdsMainReconcileError
    F_UKSaveNotEdit = False
    F_AutoNumb = False
    F_AutoSave = False
    F_SQLSelectFrom = 
      'select '#13#10'data0268.number               ['#39046#26009#21333#21495'],'#13#10'data0268.[DATE] ' +
      '              ['#30003#35831#26085#26399'],'#13#10'Data0017.INV_PART_NUMBER      ['#26448#26009#32534#30721'],'#13#10'Da' +
      'ta0017.INV_PART_DESCRIPTION ['#26448#26009#21517#31216'/'#35268#26684'],'#13#10'Data0468.QUAN_BOM       ' +
      '      ['#30003#39046#25968#37327'], '#13#10'Data0468.QUAN_ISSUED          ['#24050#21457#25918#25968#37327'],'#13#10'data0002' +
      '.unit_name            ['#21333#20301'],'#13#10'ROUND(dbo.Data0207.QUANTITY * dbo.D' +
      'ata0022.tax_price * dbo.Data0456.exch_rate, 4)['#37329#39069'('#26412#24065#21547#31246')],  '#13#10'dat' +
      'a0005.EMPLOYEE_NAME        ['#30003#39046#21592#24037']    '#13#10'from data0207 '#13#10'join data' +
      '0022 on  data0022.rkey      = data0207.D0022_PTR '#13#10'JOIN Data0456' +
      ' ON  Data0022.GRN_PTR   = Data0456.RKEY'#13#10'join data0468 on  data0' +
      '207.D0468_ptr = Data0468.rkey'#13#10'join data0268 on  data0468.FLOW_N' +
      'O   = data0268.rkey and dbo.DATA0268.ttype = 2 and data0268.stat' +
      'us in(2,4)'#13#10'join dbo.Data0017 ON dbo.Data0468.INVENT_PTR = dbo.D' +
      'ata0017.RKEY'#13#10'join data0002 on data0017.STOCK_UNIT_PTR=data0002.' +
      'rkey '#13#10'join data0005 on data0268.EMPL_PTR=data0005.rkey'
    Left = 353
    Top = 389
    object cdsMain13_1CDSDesigner: TStringField
      FieldName = #39046#26009#21333#21495
      Size = 10
    end
    object StringField39: TStringField
      FieldName = #26448#26009#32534#30721
      Size = 25
    end
    object StringField43: TStringField
      FieldName = #26448#26009#21517#31216'/'#35268#26684
      ReadOnly = True
      Size = 100
    end
    object FloatField3: TFloatField
      FieldName = #30003#39046#25968#37327
    end
    object FloatField4: TFloatField
      FieldName = #24050#21457#25918#25968#37327
    end
    object StringField44: TStringField
      FieldName = #21333#20301
    end
    object BCDField4: TBCDField
      FieldName = #37329#39069'('#26412#24065#21547#31246')'
      ReadOnly = True
      Precision = 32
      Size = 8
    end
    object cdsMain13_1CDSDesigner2: TDateTimeField
      FieldName = #30003#35831#26085#26399
    end
    object cdsMain13_1CDSDesigner3: TStringField
      FieldName = #30003#39046#21592#24037
      Size = 16
    end
  end
  object DataSource13_1: TDataSource
    DataSet = cdsMain13_1
    Left = 406
    Top = 387
  end
  object cdsMain14: Tcds
    Aggregates = <>
    CommandText = 
      'declare @price dec(9,2),@DiffMinu int,@SD datetime ,@ED Datetime' +
      #13#10'set @price=:price set @DiffMinu=:DiffMinu set @SD=:SD set @ED=' +
      ':ED'#13#10'if object_id('#39'tempdb..#TempDATA0831'#39') is not null     drop ' +
      'table #TempDATA0831'#13#10'if object_id('#39'tempdb..#TempDATA0268'#39') is no' +
      't null     drop table #TempDATA0268'#13#10'if object_id('#39'tempdb..#Temp' +
      'DATA0567'#39') is not null     drop table #TempDATA0567'#13#10'select DATA' +
      '0268.number['#30003#35831#21333#21495'],DATA0468.RKEY,DATA0468.INVENT_PTR,data0207.Tda' +
      'te['#21457#26009#26085#26399'], '#13#10'DATA0268.D835_ptr,DATA0268.D567_ptr,DATA0268.D831_pt' +
      'r,data0417.rkey as data0417rkey,'#13#10'data0417.FASSET_CODE['#35774#22791#20195#30721'],dat' +
      'a0417.FASSET_NAME['#35774#22791#21517#31216'],data0831.MainCycl['#21608#26399'],data0831.PlanMainD' +
      'ate['#20445#20859#35745#21010#26085#26399'],'#13#10'null ['#32500#20462#21333#21495'],Data0207.QUANTITY['#21457#26009#25968#37327'],data0015.ABBR_' +
      'NAME ['#24037#21378'],'#13#10'    (ROUND(dbo.Data0022.tax_price * dbo.Data0456.exc' +
      'h_rate, 4))['#21333#20215'] into  #TempDATA0831    '#13#10'    from data0207 '#13#10#9'JO' +
      'IN DATA0022 ON  DATA0022.RKEY      = DATA0207.D0022_PTR '#13#10#9'JOIN ' +
      'DATA0456 ON  DATA0022.GRN_PTR   = DATA0456.RKEY'#13#10#9'JOIN DATA0468 ' +
      'ON  DATA0207.D0468_PTR = DATA0468.RKEY'#13#10#9'JOIN DATA0268 ON  DATA0' +
      '468.FLOW_NO   = DATA0268.RKEY AND DATA0268.STATUS IN(2,4)'#13#10#9'join' +
      ' data0831 on  DATA0268.D831_ptr  = DATA0831.rkey'#13#10#9'join data0417' +
      ' on  data0831.DeviNumb  = data0417.FASSET_CODE'#13#10#9'join data0015 o' +
      'n  data0417.warehouse_ptr=data0015.rkey'#13#10#9'where data0207.Tdate >' +
      '=@SD and data0207.Tdate<@ED'#13#10'/*'#23558#20445#20859#35745#21010#20013#37325#22797#39046#29992#26448#26009#30340#35760#24405#25554#20837#20020#26102#34920'*/'#13#10'select * ' +
      'into #TempDATA0268 from '#9'#TempDATA0831'#13#10'where exists('#13#10#9'select *' +
      ' from #TempDATA0831 t1 where (t1.INVENT_PTR=#TempDATA0831.INVENT' +
      '_PTR) '#13#10#9'and (t1.data0417rkey=#TempDATA0831.data0417rkey)  and (' +
      't1.rkey<> #TempDATA0831.rkey)'#13#10#9'and (datediff(minute,t1.['#21457#26009#26085#26399'],#' +
      'TempDATA0831.['#21457#26009#26085#26399'])Between -@DiffMinu and @DiffMinu)'#13#10')'#13#10'and ['#21333 +
      #20215']>=@price'#13#10'ALTER TABLE #TempDATA0268  ALTER COLUMN ['#20445#20859#35745#21010#26085#26399']  [d' +
      'atetime] NULL  '#13#10'ALTER TABLE #TempDATA0268  ALTER COLUMN ['#21608#26399']  v' +
      'archar(10) NULL '#13#10'ALTER TABLE #TempDATA0268  ALTER COLUMN ['#32500#20462#21333#21495']' +
      '  varchar(30) NULL '#13#10'select DATA0268.number['#30003#35831#21333#21495'],DATA0468.RKEY,' +
      'DATA0468.INVENT_PTR,data0207.Tdate['#21457#26009#26085#26399'], '#13#10'DATA0268.D835_ptr,DA' +
      'TA0268.D567_ptr,DATA0268.D831_ptr,data0417.rkey as data0417rkey,' +
      #13#10'data0417.FASSET_CODE,data0417.FASSET_NAME,null ['#21608#26399'],null ['#20445#20859#35745#21010 +
      #26085#26399'],'#13#10'DATA0567.NUMBER ['#32500#20462#21333#21495'],Data0207.QUANTITY['#21457#26009#25968#37327'],data0015.AB' +
      'BR_NAME ['#24037#21378'],'#13#10'    (ROUND(dbo.Data0022.tax_price * dbo.Data0456.' +
      'exch_rate, 4))['#21333#20215'] into  #TempDATA0567    '#13#10'    from data0207 '#13#10 +
      #9'JOIN DATA0022 ON  DATA0022.RKEY      = DATA0207.D0022_PTR '#13#10#9'JO' +
      'IN DATA0456 ON  DATA0022.GRN_PTR   = DATA0456.RKEY'#13#10#9'JOIN DATA04' +
      '68 ON  DATA0207.D0468_PTR = DATA0468.RKEY'#13#10#9'JOIN DATA0268 ON  DA' +
      'TA0468.FLOW_NO   = DATA0268.RKEY AND DATA0268.STATUS IN(2,4)'#13#10#9'j' +
      'oin DATA0567 on  DATA0268.D567_ptr  = DATA0567.rkey'#13#10#9'join data0' +
      '417 on  DATA0567.FASSET_PTR  = data0417.rkey'#13#10#9'join data0015 on ' +
      ' data0417.warehouse_ptr=data0015.rkey'#13#10#9'where data0207.Tdate >=@' +
      'SD and data0207.Tdate<@ED'#13#10'/*'#23558#32500#20462#21333#20013#37325#22797#39046#29992#26448#26009#30340#35760#24405#25554#20837#20020#26102#34920'*/'#9#13#10'insert into' +
      ' #TempDATA0268'#9#13#10'select *   from '#9'#TempDATA0567'#13#10'where exists('#13#10 +
      #9'select * from #TempDATA0567 t1 where (t1.INVENT_PTR=#TempDATA05' +
      '67.INVENT_PTR) '#13#10#9'and (t1.data0417rkey=#TempDATA0567.data0417rke' +
      'y)  and (t1.rkey<> #TempDATA0567.rkey)'#13#10#9'and (datediff(minute,t1' +
      '.['#21457#26009#26085#26399'],#TempDATA0567.['#21457#26009#26085#26399'])Between -@DiffMinu and @DiffMinu)'#13#10 +
      ')'#13#10'and ['#21333#20215']>=@price'#13#10'select * from(select INV_PART_NUMBER ['#26448#26009#32534#21495']' +
      ',INV_PART_DESCRIPTION ['#26448#26009#21517#31216'/'#35268#26684'],data0002.unit_name '#21333#20301',#TempDATA0' +
      '268.* from #TempDATA0268 '#13#10'join data0017 on #TempDATA0268.INVENT' +
      '_PTR=data0017.rkey'#13#10'join data0002 on data0017.STOCK_UNIT_PTR=dat' +
      'a0002.rkey )as t1'
    FilterOptions = [foCaseInsensitive]
    ObjectView = False
    Params = <
      item
        DataType = ftFloat
        Name = 'price'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'DiffMinu'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'SD'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'ED'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspMain'
    BeforeClose = cdsMainBeforeClose
    AfterInsert = cdsMainAfterInsert
    BeforeCancel = cdsMainBeforeCancel
    AfterCancel = cdsMainAfterCancel
    AfterDelete = cdsMainAfterDelete
    BeforeScroll = cdsMainBeforeScroll
    AfterScroll = cdsMainAfterScroll
    OnReconcileError = cdsMainReconcileError
    F_UKSaveNotEdit = False
    F_AutoNumb = False
    F_AutoSave = False
    F_SQLSelectFrom = 
      'declare @price dec(9,2),@DiffMinu int,@SD datetime ,@ED Datetime' +
      #13#10'set @price=:price set @DiffMinu=:DiffMinu set @SD=:SD set @ED=' +
      ':ED'#13#10'if object_id('#39'tempdb..#TempDATA0831'#39') is not null     drop ' +
      'table #TempDATA0831'#13#10'if object_id('#39'tempdb..#TempDATA0268'#39') is no' +
      't null     drop table #TempDATA0268'#13#10'if object_id('#39'tempdb..#Temp' +
      'DATA0567'#39') is not null     drop table #TempDATA0567'#13#10'select DATA' +
      '0268.number['#30003#35831#21333#21495'],DATA0468.RKEY,DATA0468.INVENT_PTR,data0207.Tda' +
      'te['#21457#26009#26085#26399'], '#13#10'DATA0268.D835_ptr,DATA0268.D567_ptr,DATA0268.D831_pt' +
      'r,data0417.rkey as data0417rkey,'#13#10'data0417.FASSET_CODE['#35774#22791#20195#30721'],dat' +
      'a0417.FASSET_NAME['#35774#22791#21517#31216'],data0831.MainCycl['#21608#26399'],data0831.PlanMainD' +
      'ate['#20445#20859#35745#21010#26085#26399'],'#13#10'null ['#32500#20462#21333#21495'],Data0207.QUANTITY['#21457#26009#25968#37327'],data0015.ABBR_' +
      'NAME ['#24037#21378'],'#13#10'    (ROUND(dbo.Data0022.tax_price * dbo.Data0456.exc' +
      'h_rate, 4))['#21333#20215'] into  #TempDATA0831    '#13#10'    from data0207 '#13#10#9'JO' +
      'IN DATA0022 ON  DATA0022.RKEY      = DATA0207.D0022_PTR '#13#10#9'JOIN ' +
      'DATA0456 ON  DATA0022.GRN_PTR   = DATA0456.RKEY'#13#10#9'JOIN DATA0468 ' +
      'ON  DATA0207.D0468_PTR = DATA0468.RKEY'#13#10#9'JOIN DATA0268 ON  DATA0' +
      '468.FLOW_NO   = DATA0268.RKEY AND DATA0268.STATUS IN(2,4)'#13#10#9'join' +
      ' data0831 on  DATA0268.D831_ptr  = DATA0831.rkey'#13#10#9'join data0417' +
      ' on  data0831.DeviNumb  = data0417.FASSET_CODE'#13#10#9'join data0015 o' +
      'n  data0417.warehouse_ptr=data0015.rkey'#13#10#9'where data0207.Tdate >' +
      '=@SD and data0207.Tdate<@ED'#13#10'/*'#23558#20445#20859#35745#21010#20013#37325#22797#39046#29992#26448#26009#30340#35760#24405#25554#20837#20020#26102#34920'*/'#13#10'select * ' +
      'into #TempDATA0268 from '#9'#TempDATA0831'#13#10'where exists('#13#10#9'select *' +
      ' from #TempDATA0831 t1 where (t1.INVENT_PTR=#TempDATA0831.INVENT' +
      '_PTR) '#13#10#9'and (t1.data0417rkey=#TempDATA0831.data0417rkey)  and (' +
      't1.rkey<> #TempDATA0831.rkey)'#13#10#9'and (datediff(minute,t1.['#21457#26009#26085#26399'],#' +
      'TempDATA0831.['#21457#26009#26085#26399'])Between -@DiffMinu and @DiffMinu)'#13#10')'#13#10'and ['#21333 +
      #20215']>=@price'#13#10'ALTER TABLE #TempDATA0268  ALTER COLUMN ['#20445#20859#35745#21010#26085#26399']  [d' +
      'atetime] NULL  '#13#10'ALTER TABLE #TempDATA0268  ALTER COLUMN ['#21608#26399']  v' +
      'archar(10) NULL '#13#10'ALTER TABLE #TempDATA0268  ALTER COLUMN ['#32500#20462#21333#21495']' +
      '  varchar(30) NULL '#13#10'select DATA0268.number['#30003#35831#21333#21495'],DATA0468.RKEY,' +
      'DATA0468.INVENT_PTR,data0207.Tdate['#21457#26009#26085#26399'], '#13#10'DATA0268.D835_ptr,DA' +
      'TA0268.D567_ptr,DATA0268.D831_ptr,data0417.rkey as data0417rkey,' +
      #13#10'data0417.FASSET_CODE,data0417.FASSET_NAME,null ['#21608#26399'],null ['#20445#20859#35745#21010 +
      #26085#26399'],'#13#10'DATA0567.NUMBER ['#32500#20462#21333#21495'],Data0207.QUANTITY['#21457#26009#25968#37327'],data0015.AB' +
      'BR_NAME ['#24037#21378'],'#13#10'    (ROUND(dbo.Data0022.tax_price * dbo.Data0456.' +
      'exch_rate, 4))['#21333#20215'] into  #TempDATA0567    '#13#10'    from data0207 '#13#10 +
      #9'JOIN DATA0022 ON  DATA0022.RKEY      = DATA0207.D0022_PTR '#13#10#9'JO' +
      'IN DATA0456 ON  DATA0022.GRN_PTR   = DATA0456.RKEY'#13#10#9'JOIN DATA04' +
      '68 ON  DATA0207.D0468_PTR = DATA0468.RKEY'#13#10#9'JOIN DATA0268 ON  DA' +
      'TA0468.FLOW_NO   = DATA0268.RKEY AND DATA0268.STATUS IN(2,4)'#13#10#9'j' +
      'oin DATA0567 on  DATA0268.D567_ptr  = DATA0567.rkey'#13#10#9'join data0' +
      '417 on  DATA0567.FASSET_PTR  = data0417.rkey'#13#10#9'join data0015 on ' +
      ' data0417.warehouse_ptr=data0015.rkey'#13#10#9'where data0207.Tdate >=@' +
      'SD and data0207.Tdate<@ED'#13#10'/*'#23558#32500#20462#21333#20013#37325#22797#39046#29992#26448#26009#30340#35760#24405#25554#20837#20020#26102#34920'*/'#9#13#10'insert into' +
      ' #TempDATA0268'#9#13#10'select *   from '#9'#TempDATA0567'#13#10'where exists('#13#10 +
      #9'select * from #TempDATA0567 t1 where (t1.INVENT_PTR=#TempDATA05' +
      '67.INVENT_PTR) '#13#10#9'and (t1.data0417rkey=#TempDATA0567.data0417rke' +
      'y)  and (t1.rkey<> #TempDATA0567.rkey)'#13#10#9'and (datediff(minute,t1' +
      '.['#21457#26009#26085#26399'],#TempDATA0567.['#21457#26009#26085#26399'])Between -@DiffMinu and @DiffMinu)'#13#10 +
      ')'#13#10'and ['#21333#20215']>=@price'#13#10'select * from(select INV_PART_NUMBER ['#26448#26009#32534#21495']' +
      ',INV_PART_DESCRIPTION ['#26448#26009#21517#31216'/'#35268#26684'],data0002.unit_name '#21333#20301',#TempDATA0' +
      '268.* from #TempDATA0268 '#13#10'join data0017 on #TempDATA0268.INVENT' +
      '_PTR=data0017.rkey'#13#10'join data0002 on data0017.STOCK_UNIT_PTR=dat' +
      'a0002.rkey )as t1'
    Left = 529
    Top = 109
    object cdsMain14CDSDesigner13: TStringField
      FieldName = #24037#21378
      Size = 10
    end
    object cdsMain14CDSDesigner: TStringField
      FieldName = #30003#35831#21333#21495
      Size = 10
    end
    object cdsMain14CDSDesigner2: TDateTimeField
      FieldName = #21457#26009#26085#26399
    end
    object cdsMain14CDSDesigner3: TStringField
      FieldName = #35774#22791#20195#30721
    end
    object cdsMain14CDSDesigner4: TStringField
      FieldName = #35774#22791#21517#31216
      Size = 30
    end
    object cdsMain14CDSDesigner5: TStringField
      FieldName = #21608#26399
      Size = 10
    end
    object cdsMain14CDSDesigner6: TDateTimeField
      FieldName = #20445#20859#35745#21010#26085#26399
    end
    object cdsMain14CDSDesigner7: TStringField
      FieldName = #32500#20462#21333#21495
      Size = 21
    end
    object cdsMain14CDSDesigner10: TStringField
      FieldName = #26448#26009#32534#21495
      Size = 25
    end
    object cdsMain14CDSDesigner11: TStringField
      FieldName = #26448#26009#21517#31216'/'#35268#26684
      ReadOnly = True
      Size = 100
    end
    object cdsMain14CDSDesigner12: TStringField
      FieldName = #21333#20301
    end
    object cdsMain14CDSDesigner8: TBCDField
      FieldName = #21457#26009#25968#37327
      Precision = 19
    end
    object cdsMain14CDSDesigner9: TBCDField
      FieldName = #21333#20215
      Precision = 26
      Size = 12
    end
  end
  object DataSource14: TDataSource
    DataSet = cdsMain14
    Left = 614
    Top = 115
  end
  object cdsMain15: Tcds
    Aggregates = <>
    CommandText = 
      'if object_id('#39'tempdb..#TempDATA0207'#39') is not null     drop table' +
      ' #TempDATA0207'#13#10'declare @price dec(9,2),@DiffMinu int,@SD dateti' +
      'me ,@ED Datetime'#13#10'set @price=:price set @DiffMinu=:DiffMinu set ' +
      '@SD=:SD set @ED=:ED'#13#10'SELECT DATA0468.rkey,data0468.INVENT_PTR,'#13#10 +
      ' dbo.DATA0268.number    ['#30003#39046#21333#21495'],'#13#10' dbo.DATA0268.[DATE]    ['#30003#35831#26085#26399'],' +
      ' '#13#10' dbo.Data0034.DEPT_CODE ['#30003#39046#37096#38376'], '#13#10' dbo.Data0034.DEPT_NAME ['#37096#38376 +
      #21517#31216'], '#13#10' dbo.Data0005.EMPL_CODE ['#30003#39046#20154#20195#30721'], '#13#10' dbo.Data0005.EMPLOYEE' +
      '_NAME AS ['#30003#39046#21592#24037#21517#31216'], '#13#10' CASE WHEN data0268.status = 0 THEN '#39#24453#25552#20132#39' W' +
      'HEN data0268.status = 1 THEN '#39#24453#23457#26680#39'  '#13#10' WHEN data0268.status = 2 ' +
      'THEN '#39#24050#23457#26680#39' WHEN data0268.status  = 3 THEN '#39#34987#36864#22238#39'  '#13#10' WHEN data026' +
      '8.status = 4 THEN '#39#24050#21457#26009#39' END AS ['#23457#26680#29366#24577'],'#13#10' dbo.Data0015.ABBR_NAME ' +
      'AS ['#24037#21378'],'#13#10' case dbo.DATA0268.ttype when 2 then '#39#32500#20462#39' when 3 then ' +
      #39#32500#25252#39' when 4 then '#39#24037#31243#39' when 5 then '#39#20844#29992#39' end as ['#31867#22411'],'#13#10' dbo.data05' +
      '67.NUMBER as    ['#32500#20462#21333#21333#21495'],'#13#10' dbo.data0831.PlanMainDate ['#20445#20859#26085#26399'],'#13#10' d' +
      'bo.data0831.MainCycl     ['#20445#20859#21608#26399'],'#13#10' Case when dbo.DATA0268.TTYPE=' +
      '2 then(d17_2.FASSET_CODE) '#13#10'      when dbo.DATA0268.TTYPE=3 then' +
      '(data0831.DeviNumb) end as ['#35774#22791#20195#30721'], '#13#10' Case when dbo.DATA0268.TTY' +
      'PE=2 then(d17_2.FASSET_NAME) '#13#10'      when dbo.DATA0268.TTYPE=3 t' +
      'hen(d17_1.FASSET_NAME) end as ['#35774#22791#21517#31216'],   '#13#10' Case when dbo.DATA026' +
      '8.TTYPE=2 then(d17_2.DEPT_PTR) '#13#10'      when dbo.DATA0268.TTYPE=3' +
      ' then(d17_1.DEPT_PTR) end as DEPT_PTR,           '#13#10' data0840.[Lo' +
      'cation]    ['#35774#22791#36131#20219#23567#32452'],'#13#10' dbo.data0835.WorkOrder ['#31354#35843#20107#19994#37096#24037#20316#21333#21495'],'#13#10' dat' +
      'a0830.[DeptName]    ['#24037#20316#37096#38376'],'#13#10' Data0836.[WorkName]    ['#24037#20316#20219#21153#21517#31216'],'#13#10 +
      ' data0835.[WorkExpl]    ['#24037#20316#20219#21153#35828#26126'],'#13#10' Data0468.QUAN_BOM      ['#30003#35831#25968#37327 +
      '],'#13#10' Data0468.QUAN_ISSUED   ['#21457#26009#25968#37327'],'#13#10' (select sum(ROUND( dbo.Dat' +
      'a0022.tax_price * dbo.Data0456.exch_rate, 4))       '#13#10#9'from data' +
      '0207 '#13#10#9'join data0022 on  data0022.rkey      = data0207.D0022_PT' +
      'R '#13#10#9'JOIN Data0456 ON  Data0022.GRN_PTR   = Data0456.RKEY'#13#10#9'wher' +
      'e  data0207.D0468_ptr = Data0468.rkey'#13#10'   )as['#21333#20215'] '#13#10'  into #Temp' +
      'DATA0207'#13#10'from data0268'#13#10' join DATA0468 on DATA0468.FLOW_NO = DA' +
      'TA0268.RKEY '#13#10' INNER JOIN dbo.Data0034 ON dbo.DATA0268.dept_ptr ' +
      '= dbo.Data0034.RKEY and dbo.DATA0268.ttype in (2,3,4,5) /*2'#32500#20462';3'#32500 +
      #25252';4'#24037#31243';5'#20844#29992'*/'#13#10' INNER JOIN dbo.Data0005 ON dbo.DATA0268.EMPL_PTR =' +
      ' dbo.Data0005.RKEY '#13#10' INNER JOIN dbo.Data0015 ON dbo.DATA0268.wa' +
      'rehouse_ptr = dbo.Data0015.RKEY '#13#10' left join dbo.data0831 on DAT' +
      'A0268.[d831_ptr]=dbo.data0831.rkey '#13#10' left join data0417 d17_1 o' +
      'n d17_1.FASSET_CODE=data0831.DeviNumb '#13#10' left join dbo.data0567 ' +
      'on DATA0268.[d567_ptr]=dbo.data0567.rkey '#13#10' left join data0417 d' +
      '17_2 on d17_2.rkey=data0567.FASSET_PTR '#13#10' left join dbo.data0835' +
      ' on DATA0268.[d835_ptr]=dbo.data0835.rkey '#13#10' left join data0840 ' +
      'on  DATA0268.[d840_ptr]=dbo.data0840.rkey '#13#10' left join dbo.data0' +
      '830 on data0835.[Dept_ptr]=data0830.rkey  '#13#10' left join dbo.Data0' +
      '836 on data0835.[Work_ptr]=data0836.rkey  '#13#10' where dbo.DATA0268.' +
      '[DATE]>=@SD and dbo.DATA0268.[DATE]<@ED and data0268.status =4'#13#10 +
      ' select *  from (select INV_PART_NUMBER ['#26448#26009#32534#21495'],INV_PART_DESCRIPT' +
      'ION ['#26448#26009#21517#31216#35268#26684'],data0002.unit_name ['#21333#20301'],#TempDATA0207.* '#13#10' from '#9'#T' +
      'empDATA0207 '#13#10' join data0017 on data0017.rkey=#TempDATA0207.INVE' +
      'NT_PTR'#13#10' join data0002 on data0017.STOCK_UNIT_PTR=data0002.rkey ' +
      ' '#13#10'where exists('#13#10#9'select * from #TempDATA0207 t1 where (t1.INVE' +
      'NT_PTR=#TempDATA0207.INVENT_PTR) '#13#10#9'and (t1.rkey<> #TempDATA0207' +
      '.rkey)'#13#10#9'and (datediff(minute,t1.['#30003#35831#26085#26399'],#TempDATA0207.['#30003#35831#26085#26399'])Bet' +
      'ween -@DiffMinu and @DiffMinu)'#13#10')and ['#21333#20215']>@price)as t1'
    FilterOptions = [foCaseInsensitive]
    ObjectView = False
    Params = <
      item
        DataType = ftFloat
        Name = 'price'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'DiffMinu'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'SD'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'ED'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspMain'
    BeforeClose = cdsMainBeforeClose
    AfterInsert = cdsMainAfterInsert
    BeforeCancel = cdsMainBeforeCancel
    AfterCancel = cdsMainAfterCancel
    AfterDelete = cdsMainAfterDelete
    BeforeScroll = cdsMainBeforeScroll
    AfterScroll = cdsMainAfterScroll
    OnReconcileError = cdsMainReconcileError
    F_UKSaveNotEdit = False
    F_AutoNumb = False
    F_AutoSave = False
    F_SQLSelectFrom = 
      'if object_id('#39'tempdb..#TempDATA0207'#39') is not null     drop table' +
      ' #TempDATA0207'#13#10'declare @price dec(9,2),@DiffMinu int,@SD dateti' +
      'me ,@ED Datetime'#13#10'set @price=:price set @DiffMinu=:DiffMinu set ' +
      '@SD=:SD set @ED=:ED'#13#10'SELECT DATA0468.rkey,data0468.INVENT_PTR,'#13#10 +
      ' dbo.DATA0268.number    ['#30003#39046#21333#21495'],'#13#10' dbo.DATA0268.[DATE]    ['#30003#35831#26085#26399'],' +
      ' '#13#10' dbo.Data0034.DEPT_CODE ['#30003#39046#37096#38376'], '#13#10' dbo.Data0034.DEPT_NAME ['#37096#38376 +
      #21517#31216'], '#13#10' dbo.Data0005.EMPL_CODE ['#30003#39046#20154#20195#30721'], '#13#10' dbo.Data0005.EMPLOYEE' +
      '_NAME AS ['#30003#39046#21592#24037#21517#31216'], '#13#10' CASE WHEN data0268.status = 0 THEN '#39#24453#25552#20132#39' W' +
      'HEN data0268.status = 1 THEN '#39#24453#23457#26680#39'  '#13#10' WHEN data0268.status = 2 ' +
      'THEN '#39#24050#23457#26680#39' WHEN data0268.status  = 3 THEN '#39#34987#36864#22238#39'  '#13#10' WHEN data026' +
      '8.status = 4 THEN '#39#24050#21457#26009#39' END AS ['#23457#26680#29366#24577'],'#13#10' dbo.Data0015.ABBR_NAME ' +
      'AS ['#24037#21378'],'#13#10' case dbo.DATA0268.ttype when 2 then '#39#32500#20462#39' when 3 then ' +
      #39#32500#25252#39' when 4 then '#39#24037#31243#39' when 5 then '#39#20844#29992#39' end as ['#31867#22411'],'#13#10' dbo.data05' +
      '67.NUMBER as    ['#32500#20462#21333#21333#21495'],'#13#10' dbo.data0831.PlanMainDate ['#20445#20859#26085#26399'],'#13#10' d' +
      'bo.data0831.MainCycl     ['#20445#20859#21608#26399'],'#13#10' Case when dbo.DATA0268.TTYPE=' +
      '2 then(d17_2.FASSET_CODE) '#13#10'      when dbo.DATA0268.TTYPE=3 then' +
      '(data0831.DeviNumb) end as ['#35774#22791#20195#30721'], '#13#10' Case when dbo.DATA0268.TTY' +
      'PE=2 then(d17_2.FASSET_NAME) '#13#10'      when dbo.DATA0268.TTYPE=3 t' +
      'hen(d17_1.FASSET_NAME) end as ['#35774#22791#21517#31216'],   '#13#10' Case when dbo.DATA026' +
      '8.TTYPE=2 then(d17_2.DEPT_PTR) '#13#10'      when dbo.DATA0268.TTYPE=3' +
      ' then(d17_1.DEPT_PTR) end as DEPT_PTR,           '#13#10' data0840.[Lo' +
      'cation]    ['#35774#22791#36131#20219#23567#32452'],'#13#10' dbo.data0835.WorkOrder ['#31354#35843#20107#19994#37096#24037#20316#21333#21495'],'#13#10' dat' +
      'a0830.[DeptName]    ['#24037#20316#37096#38376'],'#13#10' Data0836.[WorkName]    ['#24037#20316#20219#21153#21517#31216'],'#13#10 +
      ' data0835.[WorkExpl]    ['#24037#20316#20219#21153#35828#26126'],'#13#10' Data0468.QUAN_BOM      ['#30003#35831#25968#37327 +
      '],'#13#10' Data0468.QUAN_ISSUED   ['#21457#26009#25968#37327'],'#13#10' (select sum(ROUND( dbo.Dat' +
      'a0022.tax_price * dbo.Data0456.exch_rate, 4))       '#13#10#9'from data' +
      '0207 '#13#10#9'join data0022 on  data0022.rkey      = data0207.D0022_PT' +
      'R '#13#10#9'JOIN Data0456 ON  Data0022.GRN_PTR   = Data0456.RKEY'#13#10#9'wher' +
      'e  data0207.D0468_ptr = Data0468.rkey'#13#10'   )as['#21333#20215'] '#13#10'  into #Temp' +
      'DATA0207'#13#10'from data0268'#13#10' join DATA0468 on DATA0468.FLOW_NO = DA' +
      'TA0268.RKEY '#13#10' INNER JOIN dbo.Data0034 ON dbo.DATA0268.dept_ptr ' +
      '= dbo.Data0034.RKEY and dbo.DATA0268.ttype in (2,3,4,5) /*2'#32500#20462';3'#32500 +
      #25252';4'#24037#31243';5'#20844#29992'*/'#13#10' INNER JOIN dbo.Data0005 ON dbo.DATA0268.EMPL_PTR =' +
      ' dbo.Data0005.RKEY '#13#10' INNER JOIN dbo.Data0015 ON dbo.DATA0268.wa' +
      'rehouse_ptr = dbo.Data0015.RKEY '#13#10' left join dbo.data0831 on DAT' +
      'A0268.[d831_ptr]=dbo.data0831.rkey '#13#10' left join data0417 d17_1 o' +
      'n d17_1.FASSET_CODE=data0831.DeviNumb '#13#10' left join dbo.data0567 ' +
      'on DATA0268.[d567_ptr]=dbo.data0567.rkey '#13#10' left join data0417 d' +
      '17_2 on d17_2.rkey=data0567.FASSET_PTR '#13#10' left join dbo.data0835' +
      ' on DATA0268.[d835_ptr]=dbo.data0835.rkey '#13#10' left join data0840 ' +
      'on  DATA0268.[d840_ptr]=dbo.data0840.rkey '#13#10' left join dbo.data0' +
      '830 on data0835.[Dept_ptr]=data0830.rkey  '#13#10' left join dbo.Data0' +
      '836 on data0835.[Work_ptr]=data0836.rkey  '#13#10' where dbo.DATA0268.' +
      '[DATE]>=@SD and dbo.DATA0268.[DATE]<@ED and data0268.status =4'#13#10 +
      ' select *  from (select INV_PART_NUMBER ['#26448#26009#32534#21495'],INV_PART_DESCRIPT' +
      'ION ['#26448#26009#21517#31216#35268#26684'],data0002.unit_name ['#21333#20301'],#TempDATA0207.* '#13#10' from '#9'#T' +
      'empDATA0207 '#13#10' join data0017 on data0017.rkey=#TempDATA0207.INVE' +
      'NT_PTR'#13#10' join data0002 on data0017.STOCK_UNIT_PTR=data0002.rkey ' +
      ' '#13#10'where exists('#13#10#9'select * from #TempDATA0207 t1 where (t1.INVE' +
      'NT_PTR=#TempDATA0207.INVENT_PTR) '#13#10#9'and (t1.rkey<> #TempDATA0207' +
      '.rkey)'#13#10#9'and (datediff(minute,t1.['#30003#35831#26085#26399'],#TempDATA0207.['#30003#35831#26085#26399'])Bet' +
      'ween -@DiffMinu and @DiffMinu)'#13#10')and ['#21333#20215']>@price)as t1'
    F_SQLOrderBy = 'order by ['#26448#26009#32534#21495'],['#30003#35831#26085#26399']'#9
    Left = 529
    Top = 165
    object cdsMain15CDSDesigner: TStringField
      FieldName = #26448#26009#32534#21495
      Size = 25
    end
    object cdsMain15CDSDesigner2: TStringField
      FieldName = #26448#26009#21517#31216#35268#26684
      ReadOnly = True
      Size = 100
    end
    object cdsMain15CDSDesigner3: TStringField
      FieldName = #21333#20301
    end
    object cdsMain15rkey: TIntegerField
      FieldName = 'rkey'
    end
    object cdsMain15INVENT_PTR: TIntegerField
      FieldName = 'INVENT_PTR'
    end
    object cdsMain15CDSDesigner4: TStringField
      FieldName = #30003#39046#21333#21495
      Size = 10
    end
    object cdsMain15CDSDesigner5: TDateTimeField
      FieldName = #30003#35831#26085#26399
    end
    object cdsMain15CDSDesigner6: TStringField
      FieldName = #30003#39046#37096#38376
      Size = 10
    end
    object cdsMain15CDSDesigner7: TStringField
      FieldName = #37096#38376#21517#31216
      Size = 30
    end
    object cdsMain15CDSDesigner8: TStringField
      FieldName = #30003#39046#20154#20195#30721
      Size = 10
    end
    object cdsMain15CDSDesigner9: TStringField
      FieldName = #30003#39046#21592#24037#21517#31216
      Size = 16
    end
    object cdsMain15CDSDesigner10: TStringField
      FieldName = #23457#26680#29366#24577
      Size = 6
    end
    object cdsMain15CDSDesigner11: TStringField
      FieldName = #24037#21378
      Size = 10
    end
    object cdsMain15CDSDesigner12: TStringField
      FieldName = #31867#22411
      Size = 4
    end
    object cdsMain15CDSDesigner13: TStringField
      FieldName = #32500#20462#21333#21333#21495
      Size = 15
    end
    object cdsMain15CDSDesigner14: TDateTimeField
      FieldName = #20445#20859#26085#26399
    end
    object cdsMain15CDSDesigner15: TStringField
      FieldName = #20445#20859#21608#26399
      Size = 10
    end
    object cdsMain15CDSDesigner16: TStringField
      FieldName = #35774#22791#20195#30721
    end
    object cdsMain15CDSDesigner17: TStringField
      FieldName = #35774#22791#21517#31216
      Size = 30
    end
    object cdsMain15DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object cdsMain15CDSDesigner18: TStringField
      FieldName = #35774#22791#36131#20219#23567#32452
    end
    object cdsMain15CDSDesigner19: TStringField
      FieldName = #31354#35843#20107#19994#37096#24037#20316#21333#21495
      Size = 15
    end
    object cdsMain15CDSDesigner20: TStringField
      FieldName = #24037#20316#37096#38376
      Size = 50
    end
    object cdsMain15CDSDesigner21: TStringField
      FieldName = #24037#20316#20219#21153#21517#31216
      Size = 50
    end
    object cdsMain15CDSDesigner22: TStringField
      FieldName = #24037#20316#20219#21153#35828#26126
      Size = 200
    end
    object cdsMain15CDSDesigner23: TFloatField
      FieldName = #30003#35831#25968#37327
    end
    object cdsMain15CDSDesigner24: TFloatField
      FieldName = #21457#26009#25968#37327
    end
    object cdsMain15CDSDesigner25: TBCDField
      FieldName = #21333#20215
      Precision = 32
      Size = 12
    end
  end
  object DataSource15: TDataSource
    DataSet = cdsMain15
    Left = 622
    Top = 171
  end
  object cdsMain16: Tcds
    Aggregates = <>
    CommandText = 
      'declare @sql varchar(8000),@SD datetime,@ED datetime'#13#10'set @SD=:S' +
      'D set @ED=:ED'#13#10#13#10'select * into #TempData0842_data0848 from ('#13#10#9's' +
      'elect TOP (100) PERCENT '#13#10#9'Case when ((datepart(HH,data0842.Begi' +
      'nTime)<8)and(datepart(HH,data0842.EndTime)>=8)and (data0842.DayS' +
      'hift=2))'#13#10#9'or((datepart(HH,data0842.BeginTime)<8)and(datepart(HH' +
      ',data0842.EndTime)<8)) '#13#10#9'then DateAdd(day,-1,dbo.data0842.WorkD' +
      'ate)else dbo.data0842.WorkDate  end as WorkDate, '#13#10#9'data0842.Wor' +
      'kTime,data0005.EMPLOYEE_NAME ,data0840.d015_ptr as WHOUSE_PTR'#13#10#9 +
      'from data0842 join data0005 on data0842.Empl_ptr=data0005.rkey'#13#10 +
      #9'join data0855 on data0842.Empl_ptr=data0855.D005_ptr'#13#10#9'join dat' +
      'a0840 on data0855.d840_ptr=data0840.rkey and data0840.OutsPrep=0' +
      ' and data0840.active=1'#13#10#9'where (DateAdd(day,1,dbo.data0842.WorkD' +
      'ate)>=@SD)and(DateAdd(day,-1,dbo.data0842.WorkDate)<=@ED) '#13#10#9'uni' +
      'on all'#13#10#9'select TOP (100) PERCENT '#13#10#9'Case when ((datepart(HH,dat' +
      'a0848.BeginTime)<8)and(datepart(HH,data0848.EndTime)>=8)and (dat' +
      'a0848.DayShift=2))'#13#10#9'or((datepart(HH,data0848.BeginTime)<8)and(d' +
      'atepart(HH,data0848.EndTime)<8)) '#13#10#9'then DateAdd(day,-1,dbo.data' +
      '0848.WorkDate)else dbo.data0848.WorkDate  end as WorkDate, '#13#10#9'da' +
      'ta0848.WorkTime,data0005.EMPLOYEE_NAME,data0840.d015_ptr as WHOU' +
      'SE_PTR '#13#10#9'from data0848 join data0005 on data0848.Empl_ptr=data0' +
      '005.rkey'#13#10#9'join data0831 on data0831.rkey=data0848.Work_ptr'#13#10#9'jo' +
      'in data0855 on data0848.Empl_ptr=data0855.D005_ptr'#13#10#9'join data08' +
      '40 on data0855.d840_ptr=data0840.rkey and data0840.OutsPrep=0 an' +
      'd data0840.active=1'#13#10#9'where (DateAdd(day,1,dbo.data0848.WorkDate' +
      ')>=@SD)and(DateAdd(day,-1,dbo.data0848.WorkDate)<=@ED)'#13#10#9'order b' +
      'y data0855.d840_ptr, data0855.rkey,data0848.WorkDate'#13#10')as t1'#13#10#13#10 +
      'select @sql=isnull(@sql+'#39','#39','#39#39')+EMPLOYEE_NAME from data0855 '#13#10'jo' +
      'in data0005 on data0855.d005_ptr=data0005.rkey'#13#10'where EMPLOYEE_N' +
      'AME in (select EMPLOYEE_NAME from #TempData0842_data0848 where W' +
      'orkDate>=@SD and WorkDate<=@ED )'#13#10'order by data0855.d840_ptr,dat' +
      'a0855.rkey'#13#10#13#10'set @sql='#39'select * from #TempData0842_data0848 '#39#13#10 +
      '+'#39' pivot (sum(WorkTime) for EMPLOYEE_NAME in ('#39'+@sql+'#39'))a'#39#13#10'+'#39' w' +
      'here WorkDate>='#39#13#10'+'#39#39#39#39'+CONVERT(varchar(100), @SD, 23)+'#39#39#39#39'+'#39' an' +
      'd  WorkDate<='#39'+'#39#39#39#39'+ CONVERT(varchar(100), @ED, 23)+'#39#39#39#39#13#10'exec(@' +
      'sql)'#13#10'drop table #TempData0842_data0848'
    FilterOptions = [foCaseInsensitive]
    ObjectView = False
    Params = <
      item
        DataType = ftDateTime
        Name = 'SD'
        ParamType = ptUnknown
        Value = '2013-1-1'
      end
      item
        DataType = ftDateTime
        Name = 'ED'
        ParamType = ptUnknown
        Value = '2013-12-1'
      end>
    ProviderName = 'dspMain'
    AfterOpen = cdsMain16AfterOpen
    BeforeClose = cdsMainBeforeClose
    AfterInsert = cdsMainAfterInsert
    BeforeCancel = cdsMainBeforeCancel
    AfterCancel = cdsMainAfterCancel
    AfterDelete = cdsMainAfterDelete
    BeforeScroll = cdsMainBeforeScroll
    AfterScroll = cdsMainAfterScroll
    OnReconcileError = cdsMainReconcileError
    F_UKSaveNotEdit = False
    F_AutoNumb = False
    F_AutoSave = False
    F_SQLSelectFrom = 
      'declare @sql varchar(8000),@SD datetime,@ED datetime'#13#10'set @SD=:S' +
      'D set @ED=:ED'#13#10'select * into #TempData0842_data0848 from ('#13#10'sele' +
      'ct TOP (100) PERCENT '#13#10'Case when ((datepart(HH,data0842.BeginTim' +
      'e)<8)and(datepart(HH,data0842.EndTime)>=8)and (data0842.DayShift' +
      '=2))'#13#10'or((datepart(HH,data0842.BeginTime)<8)and(datepart(HH,data' +
      '0842.EndTime)<8)) '#13#10'then DateAdd(day,-1,dbo.data0842.WorkDate)el' +
      'se dbo.data0842.WorkDate  end as WorkDate, '#13#10'data0842.WorkTime,d' +
      'ata0005.EMPLOYEE_NAME ,data0567.WHOUSE_PTR,data0855.d840_ptr,dat' +
      'a0855.rkey'#13#10'from data0842 join data0005 on data0842.Empl_ptr=dat' +
      'a0005.rkey'#13#10'join data0567 on data0567.rkey=data0842.Work_ptr'#13#10'jo' +
      'in data0855 on data0842.Empl_ptr=data0855.D005_ptr'#13#10'join data084' +
      '0 on data0855.d840_ptr=data0840.rkey and data0840.OutsPrep=0 and' +
      ' data0840.active=1'#13#10'where (DateAdd(day,-1,dbo.data0842.WorkDate)' +
      '>=@SD)and(DateAdd(day,1,dbo.data0842.WorkDate)<=@ED) '#13#10'order by ' +
      'data0855.d840_ptr,data0855.rkey, data0842.WorkDate'#13#10'union all'#13#10's' +
      'elect TOP (100) PERCENT '#13#10'Case when ((datepart(HH,data0848.Begin' +
      'Time)<8)and(datepart(HH,data0848.EndTime)>=8)and (data0848.DaySh' +
      'ift=2))'#13#10'or((datepart(HH,data0848.BeginTime)<8)and(datepart(HH,d' +
      'ata0848.EndTime)<8)) '#13#10'then DateAdd(day,-1,dbo.data0848.WorkDate' +
      ')else dbo.data0848.WorkDate  end as WorkDate, '#13#10'data0848.WorkTim' +
      'e,data0005.EMPLOYEE_NAME ,data0417.warehouse_ptr,data0855.d840_p' +
      'tr,data0855.rkey'#13#10'from data0848 join data0005 on data0848.Empl_p' +
      'tr=data0005.rkey'#13#10'join data0831 on data0831.rkey=data0848.Work_p' +
      'tr'#13#10'join data0417 on data0831.DeviNumb=data0417.FASSET_CODE'#13#10'joi' +
      'n data0855 on data0848.Empl_ptr=data0855.D005_ptr'#13#10'join data0840' +
      ' on data0855.d840_ptr=data0840.rkey and data0840.OutsPrep=0 and ' +
      'data0840.active=1'#13#10'where (DateAdd(day,-1,dbo.data0848.WorkDate)>' +
      '=@SD)and(DateAdd(day,1,dbo.data0848.WorkDate)<=@ED)'#13#10'order by da' +
      'ta0855.d840_ptr, data0855.rkey,data0848.WorkDate)as t1'#13#10#13#10'select' +
      ' @sql=isnull(@sql+'#39','#39','#39#39')+EMPLOYEE_NAME from #TempData0842_data0' +
      '848 '#13#10'where WorkDate>=@SD and WorkDate<=@ED'#13#10'group by d840_ptr,r' +
      'key ,EMPLOYEE_NAME  '#13#10'order by  d840_ptr ,rkey     '#13#10'set @sql='#39's' +
      'elect * from #TempData0842_data0848 '#39#13#10'+'#39' pivot (sum(WorkTime) f' +
      'or EMPLOYEE_NAME in ('#39'+@sql+'#39'))a'#39#13#10'+'#39' where WorkDate>='#39#13#10'+'#39#39#39#39'+C' +
      'ONVERT(varchar(100), @SD, 23)+'#39#39#39#39'+'#39' and  WorkDate<='#39'+'#39#39#39#39'+ CONV' +
      'ERT(varchar(100), @ED, 23)+'#39#39#39#39#13#10'exec(@sql)'#13#10'drop table #TempDat' +
      'a0842_data0848'
    Left = 529
    Top = 216
  end
  object DataSource16: TDataSource
    DataSet = cdsMain16
    Left = 598
    Top = 216
  end
  object cdsMain16_2: Tcds
    Aggregates = <>
    CommandText = 
      'declare @sql varchar(8000),@SD datetime,@ED datetime,@WHOUSE_PTR' +
      ' int'#13#10'set @SD=:SD  set @ED=:ED set @WHOUSE_PTR=:WHOUSE_PTR'#13#10'sele' +
      'ct @sql=isnull(@sql+'#39','#39','#39#39')+EMPLOYEE_NAME from V_0842_0848 '#13#10'whe' +
      're V_0842_0848.WorkDate>=@SD and V_0842_0848.WorkDate<=@ED and V' +
      '_0842_0848.WHOUSE_PTR= @WHOUSE_PTR'#13#10'group by EMPLOYEE_NAME      ' +
      '   '#13#10'set @sql='#39'select * from V_0842_0848 '#39#13#10'+'#39' pivot (sum(WorkTi' +
      'me) for EMPLOYEE_NAME in ('#39'+@sql+'#39'))a'#39#13#10'+'#39' where WorkDate>='#39#13#10'+'#39 +
      #39#39#39'+CONVERT(varchar(100), @SD, 23)+'#39#39#39#39'+'#39' and  WorkDate<='#39'+'#39#39#39#39#13 +
      #10'+ CONVERT(varchar(100), @ED, 23)+'#39#39#39#39'+'#39' and WHOUSE_PTR='#39'+ Cast(' +
      '@WHOUSE_PTR as varchar(10))'#13#10'select (@sql)'
    FilterOptions = [foCaseInsensitive]
    ObjectView = False
    Params = <
      item
        DataType = ftDateTime
        Name = 'SD'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'ED'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'WHOUSE_PTR'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspMain'
    BeforeClose = cdsMainBeforeClose
    AfterInsert = cdsMainAfterInsert
    BeforeCancel = cdsMainBeforeCancel
    AfterCancel = cdsMainAfterCancel
    AfterDelete = cdsMainAfterDelete
    BeforeScroll = cdsMainBeforeScroll
    AfterScroll = cdsMainAfterScroll
    OnReconcileError = cdsMainReconcileError
    F_UKSaveNotEdit = False
    F_AutoNumb = False
    F_AutoSave = False
    F_SQLSelectFrom = 
      'declare @sql varchar(8000),@SD datetime,@ED datetime,@WHOUSE_PTR' +
      ' int'#13#10'set @SD=:SD  set @ED=:ED set @WHOUSE_PTR=:WHOUSE_PTR'#13#10'sele' +
      'ct @sql=isnull(@sql+'#39','#39','#39#39')+EMPLOYEE_NAME from V_0842_0848 '#13#10'whe' +
      're V_0842_0848.WorkDate>=@SD and V_0842_0848.WorkDate<=@ED and V' +
      '_0842_0848.WHOUSE_PTR= @WHOUSE_PTR'#13#10'group by EMPLOYEE_NAME      ' +
      '   '#13#10'set @sql='#39'select * from V_0842_0848 '#39#13#10'+'#39' pivot (sum(WorkTi' +
      'me) for EMPLOYEE_NAME in ('#39'+@sql+'#39'))a'#39#13#10'+'#39' where WorkDate>='#39#13#10'+'#39 +
      #39#39#39'+CONVERT(varchar(100), @SD, 23)+'#39#39#39#39'+'#39' and  WorkDate<='#39'+'#39#39#39#39#13 +
      #10'+ CONVERT(varchar(100), @ED, 23)+'#39#39#39#39'+'#39' and WHOUSE_PTR='#39'+ Cast(' +
      '@WHOUSE_PTR as varchar(10))'#13#10'select (@sql)'
    Left = 744
    Top = 216
  end
  object cdsMain17: Tcds
    Aggregates = <>
    CommandText = 
      'declare @sql varchar(8000),@SD datetime,@ED datetime'#13#10'set @SD=:S' +
      'D set @ED=:ED'#13#10'select @sql=isnull(@sql+'#39','#39','#39#39')+EMPLOYEE_NAME fro' +
      'm V_0842_0848 '#13#10'where V_0842_0848.WorkDate>=@SD and V_0842_0848.' +
      'WorkDate<=@ED'#13#10'group by EMPLOYEE_NAME         '#13#10'set @sql='#39'select' +
      ' * from V_0842_0848 '#39#13#10'+'#39' pivot (sum(WorkTime) for EMPLOYEE_NAME' +
      ' in ('#39'+@sql+'#39'))a'#39#13#10'+'#39' where WorkDate>='#39#13#10'+'#39#39#39#39'+CONVERT(varchar(1' +
      '00), @SD, 23)+'#39#39#39#39'+'#39' and  WorkDate<='#39'+'#39#39#39#39'+ CONVERT(varchar(100)' +
      ', @ED, 23)+'#39#39#39#39#13#10'exec(@sql)'
    FilterOptions = [foCaseInsensitive]
    ObjectView = False
    Params = <
      item
        DataType = ftDateTime
        Name = 'SD'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'ED'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspMain'
    AfterOpen = cdsMain17AfterOpen
    BeforeClose = cdsMainBeforeClose
    AfterInsert = cdsMainAfterInsert
    BeforeCancel = cdsMainBeforeCancel
    AfterCancel = cdsMainAfterCancel
    AfterDelete = cdsMainAfterDelete
    BeforeScroll = cdsMainBeforeScroll
    AfterScroll = cdsMainAfterScroll
    OnReconcileError = cdsMainReconcileError
    F_UKSaveNotEdit = False
    F_AutoNumb = False
    F_AutoSave = False
    F_SQLSelectFrom = 
      'declare @sql varchar(8000),@SD datetime,@ED datetime'#13#10'set @SD=:S' +
      'D set @ED=:ED'#13#10'select @sql=isnull(@sql+'#39','#39','#39#39')+EMPLOYEE_NAME fro' +
      'm V_0842_0848 '#13#10'where V_0842_0848.WorkDate>=@SD and V_0842_0848.' +
      'WorkDate<=@ED'#13#10'group by EMPLOYEE_NAME         '#13#10'set @sql='#39'select' +
      ' * from V_0842_0848 '#39#13#10'+'#39' pivot (sum(WorkTime) for EMPLOYEE_NAME' +
      ' in ('#39'+@sql+'#39'))a'#39#13#10'+'#39' where WorkDate>='#39#13#10'+'#39#39#39#39'+CONVERT(varchar(1' +
      '00), @SD, 23)+'#39#39#39#39'+'#39' and  WorkDate<='#39'+'#39#39#39#39'+ CONVERT(varchar(100)' +
      ', @ED, 23)+'#39#39#39#39#13#10'exec(@sql)'
    Left = 529
    Top = 261
  end
  object DataSource17: TDataSource
    DataSet = cdsMain17
    Left = 582
    Top = 259
  end
  object cdsMain17_1: Tcds
    Aggregates = <>
    CommandText = 
      'declare @sql varchar(8000),@SD datetime,@ED datetime'#13#10'set @SD=:S' +
      'D  set @ED=:ED'#13#10'select @sql=isnull(@sql+'#39','#39','#39#39')+EMPLOYEE_NAME fr' +
      'om V_0837 '#13#10'where V_0837.WorkDate>=@SD and V_0837.WorkDate<=@ED'#13 +
      #10'group by EMPLOYEE_NAME         '#13#10'set @sql='#39'select * from V_0837' +
      ' '#39#13#10'+'#39' pivot (sum(WorkTime) for EMPLOYEE_NAME in ('#39'+@sql+'#39'))a'#39#13#10 +
      '+'#39' where WorkDate>='#39#13#10'+'#39#39#39#39'+CONVERT(varchar(100), @SD, 23)+'#39#39#39#39'+' +
      #39' and  WorkDate<='#39'+'#39#39#39#39'+ CONVERT(varchar(100), @ED, 23)+'#39#39#39#39#13#10'se' +
      'lect (@sql)'
    FilterOptions = [foCaseInsensitive]
    ObjectView = False
    Params = <
      item
        DataType = ftDateTime
        Name = 'SD'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'ED'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspMain'
    BeforeClose = cdsMainBeforeClose
    AfterInsert = cdsMainAfterInsert
    BeforeCancel = cdsMainBeforeCancel
    AfterCancel = cdsMainAfterCancel
    AfterDelete = cdsMainAfterDelete
    BeforeScroll = cdsMainBeforeScroll
    AfterScroll = cdsMainAfterScroll
    OnReconcileError = cdsMainReconcileError
    F_UKSaveNotEdit = False
    F_AutoNumb = False
    F_AutoSave = False
    F_SQLSelectFrom = 
      'declare @sql varchar(8000),@SD datetime,@ED datetime'#13#10'set @SD=:S' +
      'D set @ED=:ED'#13#10'select @sql=isnull(@sql+'#39','#39','#39#39')+EMPLOYEE_NAME fro' +
      'm V_0842_0848 '#13#10'where V_0842_0848.WorkDate>=@SD and V_0842_0848.' +
      'WorkDate<=@ED'#13#10'group by EMPLOYEE_NAME         '#13#10'set @sql='#39'select' +
      ' * from V_0842_0848 '#39#13#10'+'#39' pivot (sum(WorkTime) for EMPLOYEE_NAME' +
      ' in ('#39'+@sql+'#39'))a'#39#13#10'+'#39' where WorkDate>='#39#13#10'+'#39#39#39#39'+CONVERT(varchar(1' +
      '00), @SD, 23)+'#39#39#39#39'+'#39' and  WorkDate<='#39'+'#39#39#39#39'+ CONVERT(varchar(100)' +
      ', @ED, 23)+'#39#39#39#39#13#10'exec(@sql)'
    Left = 641
    Top = 261
  end
  object cdsMain16_1: Tcds
    Aggregates = <>
    CommandText = 
      'declare @sql varchar(8000),@SD datetime,@ED datetime'#13#10'set @SD=:S' +
      'D set @ED=:ED'#13#10'select @sql=isnull(@sql+'#39','#39','#39#39')+EMPLOYEE_NAME fro' +
      'm V_0842_0848 '#13#10'where V_0842_0848.WorkDate>=@SD and V_0842_0848.' +
      'WorkDate<=@ED'#13#10'group by EMPLOYEE_NAME         '#13#10'set @sql='#39'select' +
      ' * from V_0842_0848 '#39#13#10'+'#39' pivot (sum(WorkTime) for EMPLOYEE_NAME' +
      ' in ('#39'+@sql+'#39'))a'#39#13#10'+'#39' where WorkDate>='#39#13#10'+'#39#39#39#39'+CONVERT(varchar(1' +
      '00), @SD, 23)+'#39#39#39#39'+'#39' and  WorkDate<='#39'+'#39#39#39#39'+ CONVERT(varchar(100)' +
      ', @ED, 23)+'#39#39#39#39#13#10'select (@sql)'
    FilterOptions = [foCaseInsensitive]
    ObjectView = False
    Params = <
      item
        DataType = ftDateTime
        Name = 'SD'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'ED'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspMain'
    BeforeClose = cdsMainBeforeClose
    AfterInsert = cdsMainAfterInsert
    BeforeCancel = cdsMainBeforeCancel
    AfterCancel = cdsMainAfterCancel
    AfterDelete = cdsMainAfterDelete
    BeforeScroll = cdsMainBeforeScroll
    AfterScroll = cdsMainAfterScroll
    OnReconcileError = cdsMainReconcileError
    F_UKSaveNotEdit = False
    F_AutoNumb = False
    F_AutoSave = False
    F_SQLSelectFrom = 
      'declare @sql varchar(8000),@SD datetime,@ED datetime'#13#10'set @SD=:S' +
      'D set @ED=:ED'#13#10'select @sql=isnull(@sql+'#39','#39','#39#39')+EMPLOYEE_NAME fro' +
      'm V_0842_0848 '#13#10'where V_0842_0848.WorkDate>=@SD and V_0842_0848.' +
      'WorkDate<=@ED'#13#10'group by EMPLOYEE_NAME         '#13#10'set @sql='#39'select' +
      ' * from V_0842_0848 '#39#13#10'+'#39' pivot (sum(WorkTime) for EMPLOYEE_NAME' +
      ' in ('#39'+@sql+'#39'))a'#39#13#10'+'#39' where WorkDate>='#39#13#10'+'#39#39#39#39'+CONVERT(varchar(1' +
      '00), @SD, 23)+'#39#39#39#39'+'#39' and  WorkDate<='#39'+'#39#39#39#39'+ CONVERT(varchar(100)' +
      ', @ED, 23)+'#39#39#39#39#13#10'exec(@sql)'
    Left = 673
    Top = 216
  end
  object cdsMain18: Tcds
    Aggregates = <>
    CommandText = 
      'select * from (select * from ('#13#10'select NUMBER               ['#30003#35831#32534 +
      #21495'],   data0417.FASSET_CODE           ['#35774#22791#20195#30721'],'#13#10'data0417.FASSET_NA' +
      'ME        ['#35774#22791#21517#31216'],'#13#10'case data0567.status when 0 then '#39#26410#25552#20132#39' when 1' +
      ' then '#39#24453#21463#29702#39' when 2 then '#39#24050#21463#29702#39#13#10'                     when 3 then ' +
      #39#24050#23436#24037#39' when 4 then '#39#24050#39564#25910#39' when 5 then '#39#34987#36864#22238#39' '#13#10'                    ' +
      ' when 6 then '#39#24050#26242#20572#39' when 8 then '#39#39564#25910#36864#22238#39'  end as ['#29366#24577'],'#13#10'Data0034.DE' +
      'PT_NAME          ['#37096#38376#21517#31216'],   Data0005.EMPLOYEE_NAME         ['#30003#25253#20154'],' +
      #13#10'data0015.abbr_name          ['#24037#21378'],       Data0005_1.EMPLOYEE_NA' +
      'ME as    ['#21463#29702#20154'],'#13#10'Data0005_2.EMPLOYEE_NAME as ['#23436#24037#20154#21592'],   DATA0567.' +
      'equipment_grade'#9'     ['#35774#22791#32423#21035'],'#13#10'DATA0567.failure_degree'#9'    ['#24433#21709#31243#24230']' +
      ',   DATA0567.referring_date'#9'     ['#25552#20132#26085#26399'],'#13#10'DATA0567.CONTACT_NAME'#9 +
      '    ['#32852#32476#20154'],     DATA0567.CONTACT_PHONE'#9'     ['#32852#32476#20154#30005#35805'],'#13#10'DATA0567.fa' +
      'ilure_circs'#9'    ['#25925#38556#35828#26126'],   DATA0567.disposal_date'#9'     ['#21463#29702#26085#26399'],'#13#10'D' +
      'ATA0567.maintain_text'#9'    ['#32500#20462#35760#24405'],   DATA0567.complete_date'#9'     ' +
      '['#23436#24037#26085#26399'],'#13#10'DATA0567.validate_appraise'#9'['#39564#25910#35780#20215'],   DATA0567.fail_type' +
      #9'         ['#24322#24120#31867#21035'],'#13#10'DATA0567.maintain_house'#9'    ['#23454#38469#32500#20462#26102#38388'],'#13#10' data0' +
      '846.FaultName             ['#25925#38556#21517#31216'],'#13#10'data0846.stdDate'#9'        ['#26631#20934#32500 +
      #20462#26102#38388'],'#13#10'case when data0846.stdDate>0 and DATA0567.Staff_Sum_house' +
      '>0 then'#13#10'data0846.stdDate/DATA0567.Staff_Sum_house else 0 end ['#36798 +
      #25104#29575'],'#13#10'['#25237#35785#20869#23481']=convert(varchar(500),STUFF((SELECT '#39#65307#39' + remark fro' +
      'm data0841'#13#10'       where data0841.D567_ptr=data0567.rkey and Sta' +
      'tus_ptr=7'#13#10'       FOR XML PATH('#39#39')), 1, 1, '#39#39')),'#13#10'data0840.Locat' +
      'ion as['#36131#20219#23567#32452'],'#13#10'Data0417.EquiType           ['#26159#35774#22791#31867#22411']'#13#10'from DATA056' +
      '7'#13#10'join data0417 on DATA0567.FASSET_PTR=data0417.rkey'#13#10'join  Dat' +
      'a0034 ON DATA0567.DEPT_PTR = Data0034.RKEY '#13#10'join  Data0005 ON D' +
      'ATA0567.EMPL_PTR = Data0005.RKEY left outer JOIN'#13#10'       Data000' +
      '5 AS Data0005_1 ON DATA0567.disposal_emplptr = Data0005_1.RKEY l' +
      'eft outer join'#13#10'       Data0005 AS Data0005_2 ON Data0567.comple' +
      'tion_emplptr=Data0005_2.RKEY left outer join'#13#10'       Data0015 ON' +
      ' DATA0567.whouse_ptr=data0015.rkey'#13#10'left join data0846 on data08' +
      '46.rkey=DATA0567.d846_ptr '#13#10'left join data0840 on DATA0567.D840_' +
      'ptr=data0840.rkey'#13#10'where DATA0567.complete_date >=:SD and DATA05' +
      '67.complete_date<:ED'#13#10')t1 where  '#13#10'not(['#25237#35785#20869#23481'] is null))as t2'
    FilterOptions = [foCaseInsensitive]
    ObjectView = False
    Params = <
      item
        DataType = ftDateTime
        Name = 'SD'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'ED'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspMain'
    BeforeClose = cdsMainBeforeClose
    AfterInsert = cdsMainAfterInsert
    BeforeCancel = cdsMainBeforeCancel
    AfterCancel = cdsMainAfterCancel
    AfterDelete = cdsMainAfterDelete
    BeforeScroll = cdsMainBeforeScroll
    AfterScroll = cdsMainAfterScroll
    OnReconcileError = cdsMainReconcileError
    F_UKSaveNotEdit = False
    F_AutoNumb = False
    F_AutoSave = False
    F_SQLSelectFrom = 
      'select * from (select * from ('#13#10'select NUMBER               ['#30003#35831#32534 +
      #21495'],   data0417.FASSET_CODE           ['#35774#22791#20195#30721'],'#13#10'data0417.FASSET_NA' +
      'ME        ['#35774#22791#21517#31216'],'#13#10'case data0567.status when 0 then '#39#26410#25552#20132#39' when 1' +
      ' then '#39#24453#21463#29702#39' when 2 then '#39#24050#21463#29702#39#13#10'                     when 3 then ' +
      #39#24050#23436#24037#39' when 4 then '#39#24050#39564#25910#39' when 5 then '#39#34987#36864#22238#39' '#13#10'                    ' +
      ' when 6 then '#39#24050#26242#20572#39' when 8 then '#39#39564#25910#36864#22238#39'  end as ['#29366#24577'],'#13#10'Data0034.DE' +
      'PT_NAME          ['#37096#38376#21517#31216'],   Data0005.EMPLOYEE_NAME         ['#30003#25253#20154'],' +
      #13#10'data0015.abbr_name          ['#24037#21378'],       Data0005_1.EMPLOYEE_NA' +
      'ME as    ['#21463#29702#20154'],'#13#10'Data0005_2.EMPLOYEE_NAME as ['#23436#24037#20154#21592'],   DATA0567.' +
      'equipment_grade'#9'     ['#35774#22791#32423#21035'],'#13#10'DATA0567.failure_degree'#9'    ['#24433#21709#31243#24230']' +
      ',   DATA0567.referring_date'#9'     ['#25552#20132#26085#26399'],'#13#10'DATA0567.CONTACT_NAME'#9 +
      '    ['#32852#32476#20154'],     DATA0567.CONTACT_PHONE'#9'     ['#32852#32476#20154#30005#35805'],'#13#10'DATA0567.fa' +
      'ilure_circs'#9'    ['#25925#38556#35828#26126'],   DATA0567.disposal_date'#9'     ['#21463#29702#26085#26399'],'#13#10'D' +
      'ATA0567.maintain_text'#9'    ['#32500#20462#35760#24405'],   DATA0567.complete_date'#9'     ' +
      '['#23436#24037#26085#26399'],'#13#10'DATA0567.validate_appraise'#9'['#39564#25910#35780#20215'],   DATA0567.fail_type' +
      #9'         ['#24322#24120#31867#21035'],'#13#10'DATA0567.maintain_house'#9'    ['#23454#38469#32500#20462#26102#38388'],'#13#10' data0' +
      '846.FaultName             ['#25925#38556#21517#31216'],'#13#10'data0846.stdDate'#9'        ['#26631#20934#32500 +
      #20462#26102#38388'],'#13#10'case when data0846.stdDate>0 and DATA0567.Staff_Sum_house' +
      '>0 then'#13#10'data0846.stdDate/DATA0567.Staff_Sum_house else 0 end ['#36798 +
      #25104#29575'],'#13#10'['#25237#35785#20869#23481']=convert(varchar(500),STUFF((SELECT '#39#65307#39' + remark fro' +
      'm data0841'#13#10'       where data0841.D567_ptr=data0567.rkey and Sta' +
      'tus_ptr=7'#13#10'       FOR XML PATH('#39#39')), 1, 1, '#39#39')),'#13#10'data0840.Locat' +
      'ion as['#36131#20219#23567#32452'],'#13#10'Data0417.EquiType           ['#26159#35774#22791#31867#22411']'#13#10'from DATA056' +
      '7'#13#10'join data0417 on DATA0567.FASSET_PTR=data0417.rkey'#13#10'join  Dat' +
      'a0034 ON DATA0567.DEPT_PTR = Data0034.RKEY '#13#10'join  Data0005 ON D' +
      'ATA0567.EMPL_PTR = Data0005.RKEY left outer JOIN'#13#10'       Data000' +
      '5 AS Data0005_1 ON DATA0567.disposal_emplptr = Data0005_1.RKEY l' +
      'eft outer join'#13#10'       Data0005 AS Data0005_2 ON Data0567.comple' +
      'tion_emplptr=Data0005_2.RKEY left outer join'#13#10'       Data0015 ON' +
      ' DATA0567.whouse_ptr=data0015.rkey'#13#10'left join data0846 on data08' +
      '46.rkey=DATA0567.d846_ptr '#13#10'left join data0840 on DATA0567.D840_' +
      'ptr=data0840.rkey'#13#10'where DATA0567.complete_date >=:SD and DATA05' +
      '67.complete_date<:ED'#13#10')t1 where  '#13#10'not(['#25237#35785#20869#23481'] is null))as t2'
    Left = 801
    Top = 125
    object cdsMain18CDSDesigner: TStringField
      FieldName = #30003#35831#32534#21495
      Size = 15
    end
    object cdsMain18CDSDesigner2: TStringField
      FieldName = #35774#22791#20195#30721
    end
    object cdsMain18CDSDesigner3: TStringField
      FieldName = #35774#22791#21517#31216
      Size = 30
    end
    object cdsMain18CDSDesigner4: TStringField
      FieldName = #29366#24577
      ReadOnly = True
      Size = 8
    end
    object cdsMain18CDSDesigner5: TStringField
      FieldName = #37096#38376#21517#31216
      Size = 30
    end
    object cdsMain18CDSDesigner6: TStringField
      FieldName = #30003#25253#20154
      Size = 16
    end
    object cdsMain18CDSDesigner7: TStringField
      FieldName = #24037#21378
      Size = 10
    end
    object cdsMain18CDSDesigner8: TStringField
      FieldName = #21463#29702#20154
      Size = 16
    end
    object cdsMain18CDSDesigner9: TStringField
      FieldName = #23436#24037#20154#21592
      Size = 16
    end
    object cdsMain18CDSDesigner10: TStringField
      FieldName = #35774#22791#32423#21035
      Size = 10
    end
    object cdsMain18CDSDesigner11: TStringField
      FieldName = #24433#21709#31243#24230
      Size = 8
    end
    object cdsMain18CDSDesigner12: TDateTimeField
      FieldName = #25552#20132#26085#26399
    end
    object cdsMain18CDSDesigner13: TStringField
      FieldName = #32852#32476#20154
      Size = 10
    end
    object cdsMain18CDSDesigner14: TStringField
      FieldName = #32852#32476#20154#30005#35805
      Size = 15
    end
    object cdsMain18CDSDesigner15: TStringField
      FieldName = #25925#38556#35828#26126
      Size = 200
    end
    object cdsMain18CDSDesigner16: TDateTimeField
      FieldName = #21463#29702#26085#26399
    end
    object cdsMain18CDSDesigner17: TStringField
      FieldName = #32500#20462#35760#24405
      Size = 200
    end
    object cdsMain18CDSDesigner18: TDateTimeField
      FieldName = #23436#24037#26085#26399
    end
    object cdsMain18CDSDesigner19: TStringField
      FieldName = #39564#25910#35780#20215
      Size = 50
    end
    object cdsMain18CDSDesigner20: TStringField
      FieldName = #24322#24120#31867#21035
      Size = 30
    end
    object cdsMain18CDSDesigner21: TBCDField
      FieldName = #23454#38469#32500#20462#26102#38388
      Precision = 8
      Size = 2
    end
    object cdsMain18CDSDesigner22: TStringField
      FieldName = #25925#38556#21517#31216
      Size = 50
    end
    object cdsMain18CDSDesigner23: TBCDField
      FieldName = #26631#20934#32500#20462#26102#38388
      Precision = 9
      Size = 2
    end
    object cdsMain18CDSDesigner24: TBCDField
      FieldName = #36798#25104#29575
      ReadOnly = True
      Precision = 20
      Size = 11
    end
    object cdsMain18CDSDesigner25: TStringField
      FieldName = #25237#35785#20869#23481
      ReadOnly = True
      Size = 500
    end
    object cdsMain18CDSDesigner26: TStringField
      FieldName = #36131#20219#23567#32452
    end
    object cdsMain18CDSDesigner27: TBooleanField
      FieldName = #26159#35774#22791#31867#22411
    end
  end
  object DataSource18: TDataSource
    DataSet = cdsMain18
    Left = 854
    Top = 123
  end
  object cds1: Tcds
    Aggregates = <>
    CommandText = 
      'declare @sql varchar(8000),@SD datetime,@ED datetime'#13#10'set @SD=:S' +
      'D set @ED=:ED'#13#10'select @sql=isnull(@sql+'#39','#39','#39#39')+EMPLOYEE_NAME fro' +
      'm V_0842_0848 '#13#10'where V_0842_0848.WorkDate>=@SD and V_0842_0848.' +
      'WorkDate<=@ED'#13#10'group by EMPLOYEE_NAME         '#13#10'set @sql='#39'select' +
      ' * from V_0842_0848 '#39#13#10'+'#39' pivot (sum(WorkTime) for EMPLOYEE_NAME' +
      ' in ('#39'+@sql+'#39'))a'#39#13#10'+'#39' where WorkDate>='#39#13#10'+'#39#39#39#39'+CONVERT(varchar(1' +
      '00), @SD, 23)+'#39#39#39#39'+'#39' and  WorkDate<='#39'+'#39#39#39#39'+ CONVERT(varchar(100)' +
      ', @ED, 23)+'#39#39#39#39#13#10'exec(@sql)'
    FilterOptions = [foCaseInsensitive]
    ObjectView = False
    Params = <
      item
        DataType = ftDateTime
        Name = 'SD'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'ED'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspMain'
    AfterOpen = cdsMain16AfterOpen
    BeforeClose = cdsMainBeforeClose
    AfterInsert = cdsMainAfterInsert
    BeforeCancel = cdsMainBeforeCancel
    AfterCancel = cdsMainAfterCancel
    AfterDelete = cdsMainAfterDelete
    BeforeScroll = cdsMainBeforeScroll
    AfterScroll = cdsMainAfterScroll
    OnReconcileError = cdsMainReconcileError
    F_UKSaveNotEdit = False
    F_AutoNumb = False
    F_AutoSave = False
    F_SQLSelectFrom = 
      'declare @sql varchar(8000),@SD datetime,@ED datetime'#13#10'set @SD=:S' +
      'D set @ED=:ED'#13#10'select @sql=isnull(@sql+'#39','#39','#39#39')+EMPLOYEE_NAME fro' +
      'm V_0842_0848 '#13#10'where V_0842_0848.WorkDate>=@SD and V_0842_0848.' +
      'WorkDate<=@ED'#13#10'group by EMPLOYEE_NAME         '#13#10'set @sql='#39'select' +
      ' * from V_0842_0848 '#39#13#10'+'#39' pivot (sum(WorkTime) for EMPLOYEE_NAME' +
      ' in ('#39'+@sql+'#39'))a'#39#13#10'+'#39' where WorkDate>='#39#13#10'+'#39#39#39#39'+CONVERT(varchar(1' +
      '00), @SD, 23)+'#39#39#39#39'+'#39' and  WorkDate<='#39'+'#39#39#39#39'+ CONVERT(varchar(100)' +
      ', @ED, 23)+'#39#39#39#39#13#10'exec(@sql)'
    Left = 897
    Top = 213
  end
  object cdsMain16_3: TADOQuery
    Connection = DM.ADOConnection1
    Parameters = <
      item
        Name = 'SD'
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = 'ed'
        DataType = ftDateTime
        Value = Null
      end>
    SQL.Strings = (
      'select data0005.EMPLOYEE_NAME,'
      #9#9#9' Cast(sum(isnull(rwt,0)/8.0)as dec(9,1)) as workdays'
      #9#9#9' from onoffdutydata '
      
        #9#9#9' join employeemsg on employeemsg.rkey=onoffdutydata.employeei' +
        'd'
      
        '                                                 join datadepart' +
        'ment on EMPLOYEEMSG.departmentid=datadepartment.rkey and departm' +
        'entname like'#39'%'#35774#22791'%'#39' '
      
        #9#9#9' JOIN data0005 on data0005.EMPLOYEE_NAME=employeemsg.chinesen' +
        'ame'
      #9#9#9' JOIN data0855 on data0855.D005_ptr=data0005.RKEY'
      #9#9#9' join data0840 on data0855.D840_ptr=data0840.rkey '#9' '
      
        #9#9#9' where checkdate between convert(char(10),:SD,120)and convert' +
        '(char(10),:ED,120)'
      #9#9#9' group by data0005.EMPLOYEE_NAME')
    Left = 813
    Top = 216
  end
end
