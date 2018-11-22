object frm_Main: Tfrm_Main
  Left = 262
  Top = 225
  Width = 860
  Height = 624
  Caption = 'frm_Main'
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object PageControl1: TPageControl
    Left = 0
    Top = 46
    Width = 852
    Height = 544
    ActivePage = TabSheet9
    Align = alClient
    TabOrder = 0
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = #21508#32452#25104#26412#30446#26631
      ImageIndex = 2
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 844
        Height = 217
        Align = alTop
        Caption = 'Panel4'
        TabOrder = 0
        object Panel8: TPanel
          Left = 297
          Top = 1
          Width = 546
          Height = 215
          Align = alClient
          BevelOuter = bvNone
          Caption = 'Panel4'
          TabOrder = 0
          object DBGridEh1_1: TDBGridEh
            Left = 0
            Top = 0
            Width = 546
            Height = 180
            Align = alClient
            DataSource = ds1_1
            FooterColor = clWindow
            FooterFont.Charset = GB2312_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -12
            FooterFont.Name = #23435#20307
            FooterFont.Style = []
            PopupMenu = PopupMenu2
            TabOrder = 0
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            OnEnter = DBGridEh1_1Enter
            OnKeyDown = DBGridEh1_1KeyDown
            Columns = <
              item
                EditButtons = <>
                FieldName = 'ABBR_NAME'
                Footers = <>
                Visible = False
                Width = 82
              end
              item
                EditButtons = <>
                FieldName = 'Location'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'sumA'
                Footers = <>
                ReadOnly = True
              end
              item
                EditButtons = <>
                FieldName = 'Target'
                Footers = <>
              end>
          end
          object Panel9: TPanel
            Left = 0
            Top = 180
            Width = 546
            Height = 35
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            object Label1: TLabel
              Left = 8
              Top = 11
              Width = 12
              Height = 12
              Caption = #24180
            end
            object Edit1: TEdit
              Left = 32
              Top = 8
              Width = 121
              Height = 20
              TabOrder = 0
              OnKeyPress = Edit1KeyPress
            end
          end
        end
        object Panel10: TPanel
          Left = 1
          Top = 1
          Width = 296
          Height = 215
          Align = alLeft
          BevelOuter = bvNone
          Caption = 'Panel4'
          TabOrder = 1
          object DBGridEh1: TDBGridEh
            Left = 0
            Top = 0
            Width = 296
            Height = 215
            Align = alClient
            DataSource = DataSource1
            FooterColor = clWindow
            FooterFont.Charset = GB2312_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -12
            FooterFont.Name = #23435#20307
            FooterFont.Style = []
            TabOrder = 0
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            OnKeyDown = DBGridEh1KeyDown
            Columns = <
              item
                EditButtons = <>
                FieldName = 'Years'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'Month'
                Footers = <>
              end>
          end
        end
      end
      object Panel7: TPanel
        Left = 0
        Top = 217
        Width = 844
        Height = 300
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Panel7'
        TabOrder = 1
        object Chart1: TChart
          Left = 0
          Top = 0
          Width = 844
          Height = 300
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          Title.Text.Strings = (
            'TChart')
          Legend.Alignment = laTop
          Align = alClient
          TabOrder = 0
          DesignSize = (
            844
            300)
          object SpeedButton3: TSpeedButton
            Left = -110
            Top = 6
            Width = 26
            Height = 25
            Hint = #25171#21360#22270#29255
            Anchors = [akTop, akRight]
            Glyph.Data = {
              26050000424D26050000000000003604000028000000100000000F0000000100
              080000000000F000000000000000000000000001000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
              A400000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707070707
              0707070707070707070707070000000000000000000000070707070007070707
              0707070707000700070700000000000000000000000000070007000707070707
              07FBFBFB07070000000700070707070707101010070700070007000000000000
              0000000000000007070000070707070707070707070007000700070000000000
              00000000000700070000070700FFFFFFFFFFFFFFFF000700070007070700FF00
              00000000FF000000000707070700FFFFFFFFFFFFFFFF000707070707070700FF
              0000000000FF000707070707070700FFFFFFFFFFFFFFFF000707070707070700
              00000000000000000707}
            ParentShowHint = False
            ShowHint = True
            OnClick = SpeedButton3Click
          end
          object Series1: TBarSeries
            Marks.ArrowLength = 20
            Marks.Visible = True
            SeriesColor = clRed
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Bar'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
          end
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #21508#39033#20219#21153#25104#26412#32479#35745
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 844
        Height = 193
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Panel2'
        TabOrder = 0
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 689
          Height = 193
          Align = alLeft
          BevelOuter = bvNone
          Caption = 'Panel5'
          TabOrder = 0
          object DBGridEh3: TDBGridEh
            Left = 0
            Top = 0
            Width = 689
            Height = 193
            Align = alClient
            DataSource = DataSource3
            FooterColor = clWindow
            FooterFont.Charset = GB2312_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -12
            FooterFont.Name = #23435#20307
            FooterFont.Style = []
            TabOrder = 0
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            OnEnter = DBGridEh3Enter
            OnKeyDown = DBGridEh3KeyDown
            Columns = <
              item
                EditButtons = <>
                FieldName = #24037#21378
                Footers = <>
                Visible = False
              end
              item
                EditButtons = <>
                FieldName = #35774#22791#36131#20219#23567#32452
                Footers = <>
                Width = 98
              end
              item
                EditButtons = <>
                FieldName = #32500#20462#25104#26412
                Footers = <>
                Width = 80
              end
              item
                EditButtons = <>
                FieldName = #32500#25252#25104#26412
                Footers = <>
                Width = 80
              end
              item
                EditButtons = <>
                FieldName = #24037#31243#25104#26412
                Footers = <>
                Width = 80
              end
              item
                EditButtons = <>
                FieldName = #20844#29992#25104#26412
                Footers = <>
                Width = 80
              end
              item
                EditButtons = <>
                FieldName = #32771#26680#25104#26412
                Footers = <>
                Width = 80
              end
              item
                EditButtons = <>
                FieldName = #27719#24635#25104#26412
                Footers = <>
                Width = 80
              end>
          end
        end
        object Panel6: TPanel
          Left = 689
          Top = 0
          Width = 446
          Height = 193
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 193
        Width = 844
        Height = 279
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Panel1'
        TabOrder = 1
        object DBChart1: TDBChart
          Left = 0
          Top = 0
          Width = 844
          Height = 279
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          Title.Text.Strings = (
            'TDBChart')
          Legend.Alignment = laTop
          Align = alClient
          TabOrder = 0
          DesignSize = (
            844
            279)
          object SpeedButton2: TSpeedButton
            Left = -110
            Top = 6
            Width = 26
            Height = 25
            Hint = #25171#21360#22270#29255
            Anchors = [akTop, akRight]
            Glyph.Data = {
              26050000424D26050000000000003604000028000000100000000F0000000100
              080000000000F000000000000000000000000001000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
              A400000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707070707
              0707070707070707070707070000000000000000000000070707070007070707
              0707070707000700070700000000000000000000000000070007000707070707
              07FBFBFB07070000000700070707070707101010070700070007000000000000
              0000000000000007070000070707070707070707070007000700070000000000
              00000000000700070000070700FFFFFFFFFFFFFFFF000700070007070700FF00
              00000000FF000000000707070700FFFFFFFFFFFFFFFF000707070707070700FF
              0000000000FF000707070707070700FFFFFFFFFFFFFFFF000707070707070700
              00000000000000000707}
            ParentShowHint = False
            ShowHint = True
            OnClick = SpeedButton2Click
          end
          object Series3: TBarSeries
            Marks.ArrowLength = 20
            Marks.Visible = True
            SeriesColor = clRed
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Bar'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
          end
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 472
        Width = 844
        Height = 45
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object GroupBox5: TGroupBox
          Left = 116
          Top = 0
          Width = 369
          Height = 45
          Align = alLeft
          Caption = #21457#26009#26085#26399
          TabOrder = 0
          object Label34: TLabel
            Left = 188
            Top = 18
            Width = 12
            Height = 12
            Caption = #21040
          end
          object Label38: TLabel
            Left = 8
            Top = 18
            Width = 12
            Height = 12
            Caption = #20174
          end
          object PF3_dteEnd: TDateTimePicker
            Left = 206
            Top = 14
            Width = 95
            Height = 20
            Date = 41500.000000000000000000
            Format = 'yyyy-MM-dd '
            Time = 41500.000000000000000000
            TabOrder = 0
            OnChange = PF3_dteEndChange
          end
          object PF3_dteBegin: TDateTimePicker
            Left = 23
            Top = 14
            Width = 95
            Height = 20
            Date = 41500.580699502320000000
            Format = 'yyyy-MM-dd'
            Time = 41500.580699502320000000
            DateFormat = dfLong
            TabOrder = 1
            OnChange = PF3_dteBeginChange
          end
          object PF3_dteBeginTime: TDateTimePicker
            Left = 119
            Top = 14
            Width = 65
            Height = 20
            Date = 41500.333333333340000000
            Format = 'HH:mm'
            Time = 41500.333333333340000000
            DateMode = dmUpDown
            Kind = dtkTime
            TabOrder = 2
            OnChange = PF3_dteBeginChange
          end
          object PF3_dteEndTime: TDateTimePicker
            Left = 302
            Top = 14
            Width = 65
            Height = 20
            Date = 41500.333333333340000000
            Format = 'HH:mm'
            Time = 41500.333333333340000000
            DateMode = dmUpDown
            Kind = dtkTime
            TabOrder = 3
            OnClick = PF3_dteEndChange
          end
        end
        object GroupBox32: TGroupBox
          Left = 0
          Top = 0
          Width = 116
          Height = 45
          Align = alLeft
          Caption = #31579#36873#24037#21378
          TabOrder = 1
          Visible = False
          object PF3_cbx: TComboBox
            Left = 4
            Top = 12
            Width = 110
            Height = 20
            Style = csDropDownList
            ItemHeight = 12
            TabOrder = 0
            OnChange = PF3_cbxChange
          end
        end
        object Panel22: TPanel
          Left = 485
          Top = 0
          Width = 40
          Height = 45
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 2
          object SpeedButton5: TSpeedButton
            Left = 16
            Top = 9
            Width = 24
            Height = 27
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
            OnClick = SpeedButton5Click
          end
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = #21457#26009#35760#24405
      ImageIndex = 5
      object Panel28: TPanel
        Left = 0
        Top = 453
        Width = 844
        Height = 45
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        object Label10: TLabel
          Left = 760
          Top = 18
          Width = 42
          Height = 12
          Caption = 'Label10'
        end
        object Label11: TLabel
          Left = 536
          Top = 18
          Width = 72
          Height = 12
          Caption = #35774#22791#36131#20219#23567#32452
        end
        object GroupBox8: TGroupBox
          Left = 116
          Top = 0
          Width = 369
          Height = 45
          Align = alLeft
          Caption = #21457#26009#26085#26399
          TabOrder = 0
          object Label8: TLabel
            Left = 188
            Top = 18
            Width = 12
            Height = 12
            Caption = #21040
          end
          object Label9: TLabel
            Left = 8
            Top = 18
            Width = 12
            Height = 12
            Caption = #20174
          end
          object PF6_dteEnd: TDateTimePicker
            Left = 206
            Top = 14
            Width = 95
            Height = 20
            Date = 41500.000000000000000000
            Format = 'yyyy-MM-dd '
            Time = 41500.000000000000000000
            TabOrder = 0
            OnChange = PF6_dteEndChange
          end
          object PF6_dteBegin: TDateTimePicker
            Left = 23
            Top = 14
            Width = 95
            Height = 20
            Date = 41500.580699502320000000
            Format = 'yyyy-MM-dd'
            Time = 41500.580699502320000000
            DateFormat = dfLong
            TabOrder = 1
            OnChange = PF6_dteBeginChange
          end
          object PF6_dteBeginTime: TDateTimePicker
            Left = 119
            Top = 14
            Width = 65
            Height = 20
            Date = 41500.333333333340000000
            Format = 'HH:mm'
            Time = 41500.333333333340000000
            DateMode = dmUpDown
            Kind = dtkTime
            TabOrder = 2
            OnChange = PF6_dteBeginChange
          end
          object PF6_dteEndTime: TDateTimePicker
            Left = 302
            Top = 14
            Width = 65
            Height = 20
            Date = 41500.333333333340000000
            Format = 'HH:mm'
            Time = 41500.333333333340000000
            DateMode = dmUpDown
            Kind = dtkTime
            TabOrder = 3
            OnChange = PF6_dteEndChange
          end
        end
        object GroupBox9: TGroupBox
          Left = 0
          Top = 0
          Width = 116
          Height = 45
          Align = alLeft
          Caption = #31579#36873#24037#21378
          TabOrder = 1
          object PF6_cbx: TComboBox
            Left = 4
            Top = 12
            Width = 110
            Height = 20
            Style = csDropDownList
            ItemHeight = 12
            TabOrder = 0
            OnChange = PF6_cbxChange
          end
        end
        object Panel29: TPanel
          Left = 485
          Top = 0
          Width = 40
          Height = 45
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 2
          object SpeedButton8: TSpeedButton
            Left = 16
            Top = 9
            Width = 24
            Height = 27
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
            OnClick = SpeedButton8Click
          end
        end
        object Edit2: TEdit
          Left = 840
          Top = 13
          Width = 121
          Height = 20
          TabOrder = 3
          OnChange = Edit2Change
        end
        object edt_D840: TEdit
          Left = 610
          Top = 13
          Width = 121
          Height = 20
          TabOrder = 4
          OnChange = Edit2Change
        end
      end
      object DBGridEh6: TDBGridEh
        Left = 0
        Top = 0
        Width = 844
        Height = 453
        Align = alClient
        DataSource = DataSource6
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        FooterColor = clWindow
        FooterFont.Charset = GB2312_CHARSET
        FooterFont.Color = clBlue
        FooterFont.Height = -12
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        FooterRowCount = 1
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnEnter = DBGridEh6Enter
        OnKeyDown = DBGridEh6KeyDown
        OnTitleClick = DBGridEh6TitleClick
        Columns = <
          item
            EditButtons = <>
            FieldName = #24037#21378
            Footers = <>
            Width = 54
          end
          item
            EditButtons = <>
            FieldName = #35774#22791#25152#22312#37096#38376
            Footers = <>
            Width = 69
          end
          item
            EditButtons = <>
            FieldName = #30003#39046#21333#21495
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #35774#22791#36131#20219#23567#32452
            Footers = <>
            Width = 74
          end
          item
            EditButtons = <>
            FieldName = #26448#26009#32534#30721
            Footers = <>
            Width = 113
          end
          item
            EditButtons = <>
            FieldName = #26448#26009#21517#31216'/'#35268#26684
            Footers = <>
            Width = 185
          end
          item
            EditButtons = <>
            FieldName = #21333#20301
            Footers = <>
            Width = 29
          end
          item
            EditButtons = <>
            FieldName = #30003#35831#26085#26399
            Footers = <>
            Width = 102
          end
          item
            EditButtons = <>
            FieldName = #30003#39046#25968#37327
            Footers = <>
            Width = 50
          end
          item
            EditButtons = <>
            FieldName = #21457#26009#26085#26399
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #21457#26009#25968#37327
            Footers = <>
            Width = 48
          end
          item
            EditButtons = <>
            FieldName = #37329#39069'('#26412#24065#21547#31246')'
            Footers = <>
            Width = 82
          end
          item
            EditButtons = <>
            FieldName = #37329#39069'('#26412#24065#19981#21547#31246')'
            Footers = <>
            Width = 79
          end
          item
            EditButtons = <>
            FieldName = #31867#22411
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #32500#20462#21333#21333#21495
            Footers = <>
            Width = 74
          end
          item
            EditButtons = <>
            FieldName = #20445#20859#26085#26399
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #20445#20859#21608#26399
            Footers = <>
            Width = 51
          end
          item
            EditButtons = <>
            FieldName = #35774#22791#21517#31216
            Footers = <>
            Width = 139
          end
          item
            EditButtons = <>
            FieldName = #35774#22791#32534#21495
            Footers = <>
            Width = 83
          end
          item
            EditButtons = <>
            FieldName = #26159#21542'VMI'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #30003#39046#21592#24037#21517#31216
            Footers = <>
            Width = 72
          end
          item
            EditButtons = <>
            FieldName = #23457#25209#27969#31243
            Footers = <>
            Width = 92
          end
          item
            EditButtons = <>
            FieldName = #20379#24212#21830
            Footers = <>
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = #25925#38556#24773#20917#35828#26126
            Footers = <>
            Width = 285
          end
          item
            EditButtons = <>
            FieldName = #32500#20462#35760#24405#35828#26126
            Footers = <>
            Width = 265
          end
          item
            EditButtons = <>
            FieldName = #21442#20110#32500#20462#20154#21592
            Footers = <>
            Width = 94
          end
          item
            EditButtons = <>
            FieldName = #20445#20859#20154
            Footers = <>
            Width = 96
          end>
      end
      object StatusBar1: TStatusBar
        Left = 0
        Top = 498
        Width = 844
        Height = 19
        Panels = <
          item
            Width = 250
          end
          item
            Width = 250
          end
          item
            Width = 50
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = #35774#22791#31649#29702#29366#24577
      ImageIndex = 1
      object Panel11: TPanel
        Left = 0
        Top = 472
        Width = 844
        Height = 45
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        object GroupBox1: TGroupBox
          Left = 116
          Top = 0
          Width = 369
          Height = 45
          Align = alLeft
          Caption = #26085#26399
          TabOrder = 0
          object Label2: TLabel
            Left = 188
            Top = 18
            Width = 12
            Height = 12
            Caption = #21040
          end
          object Label3: TLabel
            Left = 8
            Top = 18
            Width = 12
            Height = 12
            Caption = #20174
          end
          object PF2_dteEnd: TDateTimePicker
            Left = 206
            Top = 14
            Width = 95
            Height = 20
            Date = 41500.000000000000000000
            Format = 'yyyy-MM-dd '
            Time = 41500.000000000000000000
            TabOrder = 0
            OnChange = PF2_dteEndChange
          end
          object PF2_dteBegin: TDateTimePicker
            Left = 23
            Top = 14
            Width = 95
            Height = 20
            Date = 41500.580699502320000000
            Format = 'yyyy-MM-dd'
            Time = 41500.580699502320000000
            DateFormat = dfLong
            TabOrder = 1
            OnChange = PF2_dteBeginChange
          end
          object PF2_dteBeginTime: TDateTimePicker
            Left = 123
            Top = 14
            Width = 65
            Height = 20
            Date = 41500.333333333340000000
            Format = 'HH:mm'
            Time = 41500.333333333340000000
            DateMode = dmUpDown
            Kind = dtkTime
            TabOrder = 2
            OnChange = PF2_dteBeginChange
          end
          object PF2_dteEndTime: TDateTimePicker
            Left = 304
            Top = 14
            Width = 65
            Height = 20
            Date = 41500.333333333340000000
            Format = 'HH:mm'
            Time = 41500.333333333340000000
            DateMode = dmUpDown
            Kind = dtkTime
            TabOrder = 3
            OnChange = PF2_dteEndChange
          end
        end
        object GroupBox2: TGroupBox
          Left = 0
          Top = 0
          Width = 116
          Height = 45
          Align = alLeft
          Caption = #31579#36873#24037#21378
          TabOrder = 1
          Visible = False
          object PF2_cbx: TComboBox
            Left = 4
            Top = 12
            Width = 110
            Height = 20
            Style = csDropDownList
            ItemHeight = 12
            TabOrder = 0
            OnChange = PF2_cbxChange
          end
        end
        object Panel12: TPanel
          Left = 485
          Top = 0
          Width = 40
          Height = 45
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 2
          object SpeedButton4: TSpeedButton
            Left = 16
            Top = 9
            Width = 24
            Height = 27
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
            OnClick = SpeedButton4Click
          end
        end
      end
      object Panel13: TPanel
        Left = 0
        Top = 0
        Width = 844
        Height = 201
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Panel13'
        TabOrder = 1
        object Panel15: TPanel
          Left = 0
          Top = 0
          Width = 786
          Height = 201
          Align = alClient
          BevelOuter = bvNone
          Caption = 'Panel15'
          TabOrder = 0
          object DBGridEh2: TDBGridEh
            Left = 0
            Top = 0
            Width = 786
            Height = 201
            Align = alClient
            DataSource = DataSource2
            FooterColor = clWindow
            FooterFont.Charset = GB2312_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -12
            FooterFont.Name = #23435#20307
            FooterFont.Style = []
            TabOrder = 0
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            OnEnter = DBGridEh2Enter
            OnKeyDown = DBGridEh2KeyDown
          end
        end
        object Panel16: TPanel
          Left = 786
          Top = 0
          Width = 387
          Height = 201
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
        end
      end
      object Panel14: TPanel
        Left = 0
        Top = 201
        Width = 844
        Height = 271
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Panel14'
        TabOrder = 2
        object Chart2: TChart
          Left = 0
          Top = 0
          Width = 1173
          Height = 278
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          Title.Text.Strings = (
            #35774#22791#31649#29702#29366#24577)
          Legend.Alignment = laTop
          Align = alClient
          TabOrder = 0
          object Series2: TBarSeries
            Marks.ArrowLength = 20
            Marks.Visible = True
            SeriesColor = clRed
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Bar'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
          end
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = #20851#38190#35774#22791#31649#29702#29366#24577
      ImageIndex = 4
      object Panel21: TPanel
        Left = 0
        Top = 472
        Width = 844
        Height = 45
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        object GroupBox6: TGroupBox
          Left = 116
          Top = 0
          Width = 369
          Height = 45
          Align = alLeft
          Caption = #26085#26399
          TabOrder = 0
          object Label6: TLabel
            Left = 188
            Top = 18
            Width = 12
            Height = 12
            Caption = #21040
          end
          object Label7: TLabel
            Left = 8
            Top = 18
            Width = 12
            Height = 12
            Caption = #20174
          end
          object PF5_dteEnd: TDateTimePicker
            Left = 206
            Top = 14
            Width = 95
            Height = 20
            Date = 41500.000000000000000000
            Format = 'yyyy-MM-dd '
            Time = 41500.000000000000000000
            TabOrder = 0
            OnChange = PF5_dteEndChange
          end
          object PF5_dteBegin: TDateTimePicker
            Left = 23
            Top = 14
            Width = 95
            Height = 20
            Date = 41500.580699502320000000
            Format = 'yyyy-MM-dd'
            Time = 41500.580699502320000000
            DateFormat = dfLong
            TabOrder = 1
            OnChange = PF5_dteBeginChange
          end
          object PF5_dteBeginTime: TDateTimePicker
            Left = 123
            Top = 14
            Width = 65
            Height = 20
            Date = 41500.333333333340000000
            Format = 'HH:mm'
            Time = 41500.333333333340000000
            DateMode = dmUpDown
            Kind = dtkTime
            TabOrder = 2
            OnChange = PF5_dteBeginChange
          end
          object PF5_dteEndTime: TDateTimePicker
            Left = 304
            Top = 14
            Width = 65
            Height = 20
            Date = 41500.333333333340000000
            Format = 'HH:mm'
            Time = 41500.333333333340000000
            DateMode = dmUpDown
            Kind = dtkTime
            TabOrder = 3
            OnChange = PF5_dteEndChange
          end
        end
        object GroupBox7: TGroupBox
          Left = 0
          Top = 0
          Width = 116
          Height = 45
          Align = alLeft
          Caption = #31579#36873#24037#21378
          TabOrder = 1
          Visible = False
          object PF5_cbx: TComboBox
            Left = 4
            Top = 12
            Width = 110
            Height = 20
            Style = csDropDownList
            ItemHeight = 12
            TabOrder = 0
            OnChange = PF5_cbxChange
          end
        end
        object Panel23: TPanel
          Left = 485
          Top = 0
          Width = 40
          Height = 45
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 2
          object SpeedButton7: TSpeedButton
            Left = 16
            Top = 9
            Width = 24
            Height = 27
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
            OnClick = SpeedButton7Click
          end
        end
      end
      object Panel24: TPanel
        Left = 0
        Top = 0
        Width = 844
        Height = 201
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Panel13'
        TabOrder = 1
        object Panel25: TPanel
          Left = 0
          Top = 0
          Width = 457
          Height = 201
          Align = alClient
          BevelOuter = bvNone
          Caption = 'Panel15'
          TabOrder = 0
          object DBGridEh5: TDBGridEh
            Left = 0
            Top = 0
            Width = 457
            Height = 201
            Align = alClient
            DataSource = DataSource5
            FooterColor = clWindow
            FooterFont.Charset = GB2312_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -12
            FooterFont.Name = #23435#20307
            FooterFont.Style = []
            TabOrder = 0
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            OnEnter = DBGridEh5Enter
            OnKeyDown = DBGridEh2KeyDown
          end
        end
        object Panel26: TPanel
          Left = 457
          Top = 0
          Width = 387
          Height = 201
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
        end
      end
      object Panel27: TPanel
        Left = 0
        Top = 201
        Width = 844
        Height = 271
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Panel14'
        TabOrder = 2
        object Chart5: TChart
          Left = 0
          Top = 0
          Width = 844
          Height = 271
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          Title.Text.Strings = (
            #20851#38190#35774#22791#31649#29702#29366#24577)
          Legend.Alignment = laTop
          Align = alClient
          TabOrder = 0
          object Series5: TBarSeries
            Marks.ArrowLength = 20
            Marks.Visible = True
            SeriesColor = clRed
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Bar'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
          end
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = #35774#22791#24433#21709#29366#24577
      ImageIndex = 3
      object Panel17: TPanel
        Left = 0
        Top = 0
        Width = 844
        Height = 185
        Align = alTop
        Caption = 'Panel17'
        TabOrder = 0
        object DBGridEh4: TDBGridEh
          Left = 1
          Top = 1
          Width = 1171
          Height = 183
          Align = alClient
          DataSource = DataSource4
          FooterColor = clWindow
          FooterFont.Charset = GB2312_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -12
          FooterFont.Name = #23435#20307
          FooterFont.Style = []
          TabOrder = 0
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          OnEnter = DBGridEh4Enter
          OnKeyDown = DBGridEh4KeyDown
          Columns = <
            item
              EditButtons = <>
              FieldName = #24037#21378
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = #37096#38376
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = #21517#31216
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = #25925#38556#20572#26426#32791#26102
              Footers = <>
              Width = 91
            end
            item
              EditButtons = <>
              FieldName = #32500#20462#20572#26426#32791#26102
              Footers = <>
              Width = 92
            end>
        end
      end
      object Panel18: TPanel
        Left = 0
        Top = 185
        Width = 844
        Height = 287
        Align = alClient
        Caption = 'Panel18'
        TabOrder = 1
        object Chart4: TChart
          Left = 1
          Top = 1
          Width = 1171
          Height = 292
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          Title.Text.Strings = (
            #35774#22791#24433#21709#29366#24577)
          Legend.Alignment = laTop
          Align = alClient
          TabOrder = 0
          object Series4: TBarSeries
            Marks.ArrowLength = 20
            Marks.Visible = True
            SeriesColor = clRed
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Bar'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
          end
        end
      end
      object Panel19: TPanel
        Left = 0
        Top = 472
        Width = 844
        Height = 45
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object GroupBox3: TGroupBox
          Left = 116
          Top = 0
          Width = 381
          Height = 45
          Align = alLeft
          Caption = #26085#26399
          TabOrder = 0
          object Label4: TLabel
            Left = 188
            Top = 18
            Width = 12
            Height = 12
            Caption = #21040
          end
          object Label5: TLabel
            Left = 8
            Top = 18
            Width = 12
            Height = 12
            Caption = #20174
          end
          object PF4_dteEnd: TDateTimePicker
            Left = 206
            Top = 14
            Width = 95
            Height = 20
            Date = 41500.000000000000000000
            Format = 'yyyy-MM-dd '
            Time = 41500.000000000000000000
            TabOrder = 0
            OnChange = PF4_dteEndChange
          end
          object PF4_dteBegin: TDateTimePicker
            Left = 23
            Top = 14
            Width = 95
            Height = 20
            Date = 41500.580699502320000000
            Format = 'yyyy-MM-dd'
            Time = 41500.580699502320000000
            DateFormat = dfLong
            TabOrder = 1
            OnChange = PF4_dteBeginChange
          end
          object PF4_dteBeginTime: TDateTimePicker
            Left = 123
            Top = 14
            Width = 65
            Height = 20
            Date = 41500.333333333340000000
            Format = 'HH:mm'
            Time = 41500.333333333340000000
            DateMode = dmUpDown
            Kind = dtkTime
            TabOrder = 2
            OnChange = PF4_dteBeginChange
          end
          object PF4_dteEndTime: TDateTimePicker
            Left = 304
            Top = 14
            Width = 65
            Height = 20
            Date = 41500.333333333340000000
            Format = 'HH:mm'
            Time = 41500.333333333340000000
            DateMode = dmUpDown
            Kind = dtkTime
            TabOrder = 3
            OnChange = PF4_dteEndChange
          end
        end
        object GroupBox4: TGroupBox
          Left = 0
          Top = 0
          Width = 116
          Height = 45
          Align = alLeft
          Caption = #31579#36873#24037#21378
          TabOrder = 1
          object PF4_cbx: TComboBox
            Left = 4
            Top = 12
            Width = 110
            Height = 20
            Style = csDropDownList
            ItemHeight = 12
            TabOrder = 0
            OnChange = PF4_cbxChange
          end
        end
        object Panel20: TPanel
          Left = 497
          Top = 0
          Width = 40
          Height = 45
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 2
          object SpeedButton6: TSpeedButton
            Left = 16
            Top = 9
            Width = 24
            Height = 27
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
            OnClick = SpeedButton6Click
          end
        end
      end
    end
    object TabSheet7: TTabSheet
      Caption = #35774#22791#30446#26631#20540
      ImageIndex = 6
      object Panel30: TPanel
        Left = 0
        Top = 0
        Width = 844
        Height = 217
        Align = alTop
        Caption = 'Panel4'
        TabOrder = 0
        object Panel31: TPanel
          Left = 177
          Top = 1
          Width = 666
          Height = 215
          Align = alClient
          BevelOuter = bvNone
          Caption = 'Panel4'
          TabOrder = 0
          object DBGridEh7_1: TDBGridEh
            Left = 0
            Top = 0
            Width = 666
            Height = 180
            Align = alClient
            DataSource = DataSource7
            FooterColor = clWindow
            FooterFont.Charset = GB2312_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -12
            FooterFont.Name = #23435#20307
            FooterFont.Style = []
            FrozenCols = 5
            PopupMenu = PopupMenu1
            TabOrder = 0
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            UseMultiTitle = True
            OnEnter = DBGridEh7_1Enter
            OnKeyDown = DBGridEh7_1KeyDown
            Columns = <
              item
                EditButtons = <>
                FieldName = 'ABBR_NAME'
                Footers = <>
                Visible = False
                Width = 70
              end
              item
                EditButtons = <>
                FieldName = 'Location'
                Footers = <>
                Width = 70
              end
              item
                EditButtons = <>
                FieldName = 'D'
                Footers = <>
                Title.Caption = #22825#25968
                Width = 25
              end
              item
                EditButtons = <>
                FieldName = 'H'
                Footers = <>
                Title.Caption = #23567#26102#25968
                Width = 25
              end
              item
                EditButtons = <>
                FieldName = 'TS'
                Footers = <>
                ReadOnly = True
                Title.Caption = #21488#25968
                Width = 25
              end
              item
                EditButtons = <>
                FieldName = 'Downtime_D'
                Footers = <>
                ReadOnly = True
                Title.Caption = #20572#26426#25925#38556'|'#32791#26102
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'Downtime'
                Footers = <>
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'DowntimeTarget'
                Footers = <>
                Title.Caption = #20572#26426#25925#38556'|'#30446#26631'%'
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'Shutdown_D'
                Footers = <>
                ReadOnly = True
                Title.Caption = #20572#26426#32500#20462'|'#32791#26102
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'Shutdown'
                Footers = <>
                Title.Caption = #20572#26426#32500#20462'|'#23454#38469'%'
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'ShutdownTarget'
                Footers = <>
                Title.Caption = #20572#26426#32500#20462'|'#30446#26631'%'
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'NotDowntime_D'
                Footers = <>
                ReadOnly = True
                Title.Caption = #26410#20572#26426#25925#38556'|'#32791#26102
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'NotDowntime'
                Footers = <>
                Title.Caption = #26410#20572#26426#25925#38556'|'#23454#38469'%'
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'NotDowntimeTarget'
                Footers = <>
                Title.Caption = #26410#20572#26426#25925#38556'|'#30446#26631'%'
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'Service_D'
                Footers = <>
                ReadOnly = True
                Title.Caption = #26410#20572#26426#32500#20462'|'#32791#26102
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'Service'
                Footers = <>
                Title.Caption = #26410#20572#26426#32500#20462'|'#23454#38469'%'
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'ServiceTarget'
                Footers = <>
                Title.Caption = #26410#20572#26426#32500#20462'|'#30446#26631'%'
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'Scrapped'
                Footers = <>
                Title.Caption = #25925#38556#24635#25253#24223#29575'|'#23454#38469'%'
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'ScrappedTarget'
                Footers = <>
                Title.Caption = #25925#38556#24635#25253#24223#29575'|'#30446#26631'%'
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'Plan_D'
                Footers = <>
                ReadOnly = True
                Title.Caption = #20445#20859#35745#21010'||'#23454#38469#32791#26102
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'mainStanTime'
                Footers = <>
                ReadOnly = True
                Title.Caption = #20445#20859#35745#21010'||'#26631#20934#32791#26102
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'Plan'
                Footers = <>
                Title.Caption = #20445#20859#35745#21010'||'#23454#38469'%'
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'PlanTarget'
                Footers = <>
                Title.Caption = #20445#20859#35745#21010'||'#30446#26631'%'
                Width = 50
              end>
          end
          object Panel32: TPanel
            Left = 0
            Top = 180
            Width = 666
            Height = 35
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            object Label12: TLabel
              Left = 8
              Top = 11
              Width = 12
              Height = 12
              Caption = #24180
            end
            object Edit3: TEdit
              Left = 32
              Top = 8
              Width = 121
              Height = 20
              TabOrder = 0
              OnKeyPress = Edit1KeyPress
            end
          end
        end
        object Panel33: TPanel
          Left = 1
          Top = 1
          Width = 176
          Height = 215
          Align = alLeft
          BevelOuter = bvNone
          Caption = 'Panel4'
          TabOrder = 1
          object DBGridEh7: TDBGridEh
            Left = 0
            Top = 0
            Width = 176
            Height = 215
            Align = alClient
            DataSource = DataSource1
            FooterColor = clWindow
            FooterFont.Charset = GB2312_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -12
            FooterFont.Name = #23435#20307
            FooterFont.Style = []
            TabOrder = 0
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            OnKeyDown = DBGridEh1KeyDown
            Columns = <
              item
                EditButtons = <>
                FieldName = 'Years'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'Month'
                Footers = <>
              end>
          end
        end
      end
      object Panel34: TPanel
        Left = 0
        Top = 217
        Width = 844
        Height = 300
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Panel7'
        TabOrder = 1
        object PageControl2: TPageControl
          Left = 0
          Top = 0
          Width = 844
          Height = 300
          ActivePage = TabSheet10
          Align = alClient
          TabOrder = 0
          object TabSheet14: TTabSheet
            Caption = #20572#26426#25925#38556
            ImageIndex = 5
            object Chart7_5: TChart
              Left = 0
              Top = 0
              Width = 836
              Height = 273
              BackWall.Brush.Color = clWhite
              BackWall.Brush.Style = bsClear
              Title.Text.Strings = (
                #20572#26426#25925#38556)
              Legend.Alignment = laTop
              Align = alClient
              TabOrder = 0
              DesignSize = (
                836
                273)
              object SpeedButton14: TSpeedButton
                Left = -110
                Top = 6
                Width = 26
                Height = 25
                Hint = #25171#21360#22270#29255
                Anchors = [akTop, akRight]
                Glyph.Data = {
                  26050000424D26050000000000003604000028000000100000000F0000000100
                  080000000000F000000000000000000000000001000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
                  A400000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707070707
                  0707070707070707070707070000000000000000000000070707070007070707
                  0707070707000700070700000000000000000000000000070007000707070707
                  07FBFBFB07070000000700070707070707101010070700070007000000000000
                  0000000000000007070000070707070707070707070007000700070000000000
                  00000000000700070000070700FFFFFFFFFFFFFFFF000700070007070700FF00
                  00000000FF000000000707070700FFFFFFFFFFFFFFFF000707070707070700FF
                  0000000000FF000707070707070700FFFFFFFFFFFFFFFF000707070707070700
                  00000000000000000707}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton3Click
              end
              object Series12: TBarSeries
                Marks.ArrowLength = 20
                Marks.Visible = True
                SeriesColor = clRed
                XValues.DateTime = False
                XValues.Name = 'X'
                XValues.Multiplier = 1.000000000000000000
                XValues.Order = loAscending
                YValues.DateTime = False
                YValues.Name = 'Bar'
                YValues.Multiplier = 1.000000000000000000
                YValues.Order = loNone
              end
            end
          end
          object TabSheet10: TTabSheet
            Caption = #20572#26426#32500#20462
            ImageIndex = 1
            object Chart7_1: TChart
              Left = 0
              Top = 0
              Width = 836
              Height = 273
              BackWall.Brush.Color = clWhite
              BackWall.Brush.Style = bsClear
              Title.Text.Strings = (
                #20572#26426#32500#20462)
              Legend.Alignment = laTop
              Align = alClient
              TabOrder = 0
              DesignSize = (
                836
                273)
              object SpeedButton10: TSpeedButton
                Left = -110
                Top = 6
                Width = 26
                Height = 25
                Hint = #25171#21360#22270#29255
                Anchors = [akTop, akRight]
                Glyph.Data = {
                  26050000424D26050000000000003604000028000000100000000F0000000100
                  080000000000F000000000000000000000000001000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
                  A400000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707070707
                  0707070707070707070707070000000000000000000000070707070007070707
                  0707070707000700070700000000000000000000000000070007000707070707
                  07FBFBFB07070000000700070707070707101010070700070007000000000000
                  0000000000000007070000070707070707070707070007000700070000000000
                  00000000000700070000070700FFFFFFFFFFFFFFFF000700070007070700FF00
                  00000000FF000000000707070700FFFFFFFFFFFFFFFF000707070707070700FF
                  0000000000FF000707070707070700FFFFFFFFFFFFFFFF000707070707070700
                  00000000000000000707}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton3Click
              end
              object Series8: TBarSeries
                Marks.ArrowLength = 20
                Marks.Visible = True
                SeriesColor = clGreen
                XValues.DateTime = False
                XValues.Name = 'X'
                XValues.Multiplier = 1.000000000000000000
                XValues.Order = loAscending
                YValues.DateTime = False
                YValues.Name = 'Bar'
                YValues.Multiplier = 1.000000000000000000
                YValues.Order = loNone
              end
            end
          end
          object TabSheet15: TTabSheet
            Caption = #26410#20572#26426#25925#38556
            ImageIndex = 6
            object Chart7_6: TChart
              Left = 0
              Top = 0
              Width = 836
              Height = 273
              BackWall.Brush.Color = clWhite
              BackWall.Brush.Style = bsClear
              Title.Text.Strings = (
                #26410#20572#26426#25925#38556)
              Legend.Alignment = laTop
              Align = alClient
              TabOrder = 0
              DesignSize = (
                836
                273)
              object SpeedButton15: TSpeedButton
                Left = -110
                Top = 6
                Width = 26
                Height = 25
                Hint = #25171#21360#22270#29255
                Anchors = [akTop, akRight]
                Glyph.Data = {
                  26050000424D26050000000000003604000028000000100000000F0000000100
                  080000000000F000000000000000000000000001000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
                  A400000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707070707
                  0707070707070707070707070000000000000000000000070707070007070707
                  0707070707000700070700000000000000000000000000070007000707070707
                  07FBFBFB07070000000700070707070707101010070700070007000000000000
                  0000000000000007070000070707070707070707070007000700070000000000
                  00000000000700070000070700FFFFFFFFFFFFFFFF000700070007070700FF00
                  00000000FF000000000707070700FFFFFFFFFFFFFFFF000707070707070700FF
                  0000000000FF000707070707070700FFFFFFFFFFFFFFFF000707070707070700
                  00000000000000000707}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton3Click
              end
              object Series13: TBarSeries
                Marks.ArrowLength = 20
                Marks.Visible = True
                SeriesColor = clRed
                XValues.DateTime = False
                XValues.Name = 'X'
                XValues.Multiplier = 1.000000000000000000
                XValues.Order = loAscending
                YValues.DateTime = False
                YValues.Name = 'Bar'
                YValues.Multiplier = 1.000000000000000000
                YValues.Order = loNone
              end
            end
          end
          object TabSheet11: TTabSheet
            Caption = #26410#20572#26426#32500#20462
            ImageIndex = 2
            object Chart7_2: TChart
              Left = 0
              Top = 0
              Width = 836
              Height = 273
              BackWall.Brush.Color = clWhite
              BackWall.Brush.Style = bsClear
              Title.Text.Strings = (
                #26410#20572#26426#32500#20462)
              Legend.Alignment = laTop
              Align = alClient
              TabOrder = 0
              DesignSize = (
                836
                273)
              object SpeedButton11: TSpeedButton
                Left = -110
                Top = 6
                Width = 26
                Height = 25
                Hint = #25171#21360#22270#29255
                Anchors = [akTop, akRight]
                Glyph.Data = {
                  26050000424D26050000000000003604000028000000100000000F0000000100
                  080000000000F000000000000000000000000001000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
                  A400000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707070707
                  0707070707070707070707070000000000000000000000070707070007070707
                  0707070707000700070700000000000000000000000000070007000707070707
                  07FBFBFB07070000000700070707070707101010070700070007000000000000
                  0000000000000007070000070707070707070707070007000700070000000000
                  00000000000700070000070700FFFFFFFFFFFFFFFF000700070007070700FF00
                  00000000FF000000000707070700FFFFFFFFFFFFFFFF000707070707070700FF
                  0000000000FF000707070707070700FFFFFFFFFFFFFFFF000707070707070700
                  00000000000000000707}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton3Click
              end
              object Series9: TBarSeries
                Marks.ArrowLength = 20
                Marks.Visible = True
                SeriesColor = clGreen
                XValues.DateTime = False
                XValues.Name = 'X'
                XValues.Multiplier = 1.000000000000000000
                XValues.Order = loAscending
                YValues.DateTime = False
                YValues.Name = 'Bar'
                YValues.Multiplier = 1.000000000000000000
                YValues.Order = loNone
              end
            end
          end
          object TabSheet12: TTabSheet
            Caption = #25925#38556#25253#24223
            ImageIndex = 3
            object Chart7_3: TChart
              Left = 0
              Top = 0
              Width = 836
              Height = 273
              BackWall.Brush.Color = clWhite
              BackWall.Brush.Style = bsClear
              Title.Text.Strings = (
                #25925#38556#25253#24223)
              Legend.Alignment = laTop
              Align = alClient
              TabOrder = 0
              DesignSize = (
                836
                273)
              object SpeedButton12: TSpeedButton
                Left = -110
                Top = 6
                Width = 26
                Height = 25
                Hint = #25171#21360#22270#29255
                Anchors = [akTop, akRight]
                Glyph.Data = {
                  26050000424D26050000000000003604000028000000100000000F0000000100
                  080000000000F000000000000000000000000001000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
                  A400000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707070707
                  0707070707070707070707070000000000000000000000070707070007070707
                  0707070707000700070700000000000000000000000000070007000707070707
                  07FBFBFB07070000000700070707070707101010070700070007000000000000
                  0000000000000007070000070707070707070707070007000700070000000000
                  00000000000700070000070700FFFFFFFFFFFFFFFF000700070007070700FF00
                  00000000FF000000000707070700FFFFFFFFFFFFFFFF000707070707070700FF
                  0000000000FF000707070707070700FFFFFFFFFFFFFFFF000707070707070700
                  00000000000000000707}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton3Click
              end
              object Series10: TBarSeries
                Marks.ArrowLength = 20
                Marks.Visible = True
                SeriesColor = clRed
                XValues.DateTime = False
                XValues.Name = 'X'
                XValues.Multiplier = 1.000000000000000000
                XValues.Order = loAscending
                YValues.DateTime = False
                YValues.Name = 'Bar'
                YValues.Multiplier = 1.000000000000000000
                YValues.Order = loNone
              end
            end
          end
          object TabSheet13: TTabSheet
            Caption = #20445#20859#35745#21010
            ImageIndex = 4
            object Chart7_4: TChart
              Left = 0
              Top = 0
              Width = 836
              Height = 273
              BackWall.Brush.Color = clWhite
              BackWall.Brush.Style = bsClear
              Title.Text.Strings = (
                #20445#20859#35745#21010)
              Legend.Alignment = laTop
              Align = alClient
              TabOrder = 0
              DesignSize = (
                836
                273)
              object SpeedButton13: TSpeedButton
                Left = -110
                Top = 6
                Width = 26
                Height = 25
                Hint = #25171#21360#22270#29255
                Anchors = [akTop, akRight]
                Glyph.Data = {
                  26050000424D26050000000000003604000028000000100000000F0000000100
                  080000000000F000000000000000000000000001000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
                  A400000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707070707
                  0707070707070707070707070000000000000000000000070707070007070707
                  0707070707000700070700000000000000000000000000070007000707070707
                  07FBFBFB07070000000700070707070707101010070700070007000000000000
                  0000000000000007070000070707070707070707070007000700070000000000
                  00000000000700070000070700FFFFFFFFFFFFFFFF000700070007070700FF00
                  00000000FF000000000707070700FFFFFFFFFFFFFFFF000707070707070700FF
                  0000000000FF000707070707070700FFFFFFFFFFFFFFFF000707070707070700
                  00000000000000000707}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton3Click
              end
              object Series11: TBarSeries
                Marks.ArrowLength = 20
                Marks.Visible = True
                SeriesColor = clRed
                XValues.DateTime = False
                XValues.Name = 'X'
                XValues.Multiplier = 1.000000000000000000
                XValues.Order = loAscending
                YValues.DateTime = False
                YValues.Name = 'Bar'
                YValues.Multiplier = 1.000000000000000000
                YValues.Order = loNone
              end
            end
          end
        end
      end
    end
    object TabSheet8: TTabSheet
      Caption = #20851#38190#35774#22791#30446#26631#20540
      ImageIndex = 7
      object Panel35: TPanel
        Left = 0
        Top = 0
        Width = 844
        Height = 217
        Align = alTop
        Caption = 'Panel4'
        TabOrder = 0
        object Panel36: TPanel
          Left = 177
          Top = 1
          Width = 666
          Height = 215
          Align = alClient
          BevelOuter = bvNone
          Caption = 'Panel4'
          TabOrder = 0
          object Panel37: TPanel
            Left = 0
            Top = 180
            Width = 666
            Height = 35
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 0
            object Label13: TLabel
              Left = 8
              Top = 11
              Width = 12
              Height = 12
              Caption = #24180
            end
            object Edit4: TEdit
              Left = 32
              Top = 8
              Width = 121
              Height = 20
              TabOrder = 0
              OnKeyPress = Edit1KeyPress
            end
          end
          object DBGridEh8_1: TDBGridEh
            Left = 0
            Top = 0
            Width = 666
            Height = 180
            Align = alClient
            DataSource = DataSource8
            FooterColor = clWindow
            FooterFont.Charset = GB2312_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -12
            FooterFont.Name = #23435#20307
            FooterFont.Style = []
            FrozenCols = 5
            PopupMenu = PopupMenu3
            TabOrder = 1
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            UseMultiTitle = True
            OnEnter = DBGridEh7_1Enter
            OnKeyDown = DBGridEh1_1KeyDown
            Columns = <
              item
                EditButtons = <>
                FieldName = 'ABBR_NAME'
                Footers = <>
                Visible = False
                Width = 70
              end
              item
                EditButtons = <>
                FieldName = 'Location'
                Footers = <>
                Width = 70
              end
              item
                EditButtons = <>
                FieldName = 'D'
                Footers = <>
                Width = 25
              end
              item
                EditButtons = <>
                FieldName = 'H'
                Footers = <>
                Width = 25
              end
              item
                EditButtons = <>
                FieldName = 'TS'
                Footers = <>
                ReadOnly = True
                Width = 25
              end
              item
                EditButtons = <>
                FieldName = 'Downtime_D'
                Footers = <>
                ReadOnly = True
                Title.Caption = #20572#26426#25925#38556'|'#32791#26102
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'Downtime'
                Footers = <>
                Title.Caption = #20572#26426#25925#38556'|'#23454#38469'%'
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'DowntimeTarget'
                Footers = <>
                Title.Caption = #20572#26426#25925#38556'|'#30446#26631'%'
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'Shutdown_D'
                Footers = <>
                ReadOnly = True
                Title.Caption = #20572#26426#32500#20462'|'#32791#26102
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'Shutdown'
                Footers = <>
                Title.Caption = #20572#26426#32500#20462'|'#23454#38469'%'
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'ShutdownTarget'
                Footers = <>
                Title.Caption = #20572#26426#32500#20462'|'#30446#26631'%'
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'NotDowntime_D'
                Footers = <>
                ReadOnly = True
                Title.Caption = #26410#20572#26426#25925#38556'|'#32791#26102
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'NotDowntime'
                Footers = <>
                Title.Caption = #26410#20572#26426#25925#38556'|'#23454#38469'%'
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'NotDowntimeTarget'
                Footers = <>
                Title.Caption = #26410#20572#26426#25925#38556'|'#30446#26631'%'
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'Service_D'
                Footers = <>
                ReadOnly = True
                Title.Caption = #26410#20572#26426#32500#20462'|'#32791#26102
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'Service'
                Footers = <>
                Title.Caption = #26410#20572#26426#32500#20462'|'#23454#38469'%'
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'ServiceTarget'
                Footers = <>
                Title.Caption = #26410#20572#26426#32500#20462'|'#30446#26631'%'
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'Scrapped'
                Footers = <>
                Title.Caption = #25925#38556#24635#25253#24223#29575'|'#23454#38469'%'
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'ScrappedTarget'
                Footers = <>
                Title.Caption = #25925#38556#24635#25253#24223#29575'|'#30446#26631'%'
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'Plan_D'
                Footers = <>
                ReadOnly = True
                Title.Caption = #20445#20859#35745#21010'||'#23454#38469#32791#26102
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'mainStanTime'
                Footers = <>
                ReadOnly = True
                Title.Caption = #20445#20859#35745#21010'||'#26631#20934#32791#26102
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'Plan'
                Footers = <>
                Title.Caption = #20445#20859#35745#21010'||'#23454#38469'%'
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'PlanTarget'
                Footers = <>
                Title.Caption = #20445#20859#35745#21010'||'#30446#26631'%'
                Width = 50
              end>
          end
        end
        object Panel38: TPanel
          Left = 1
          Top = 1
          Width = 176
          Height = 215
          Align = alLeft
          BevelOuter = bvNone
          Caption = 'Panel4'
          TabOrder = 1
          object DBGridEh8: TDBGridEh
            Left = 0
            Top = 0
            Width = 176
            Height = 215
            Align = alClient
            DataSource = DataSource1
            FooterColor = clWindow
            FooterFont.Charset = GB2312_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -12
            FooterFont.Name = #23435#20307
            FooterFont.Style = []
            TabOrder = 0
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            OnKeyDown = DBGridEh1KeyDown
            Columns = <
              item
                EditButtons = <>
                FieldName = 'Years'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'Month'
                Footers = <>
              end>
          end
        end
      end
      object Panel39: TPanel
        Left = 0
        Top = 217
        Width = 844
        Height = 300
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Panel7'
        TabOrder = 1
        object PageControl3: TPageControl
          Left = 0
          Top = 0
          Width = 844
          Height = 300
          ActivePage = TabSheet22
          Align = alClient
          TabOrder = 0
          object TabSheet16: TTabSheet
            Caption = #20572#26426#25925#38556
            ImageIndex = 5
            object Chart8: TChart
              Left = 0
              Top = 0
              Width = 836
              Height = 273
              BackWall.Brush.Color = clWhite
              BackWall.Brush.Style = bsClear
              Title.Text.Strings = (
                #20572#26426#25925#38556)
              Legend.Alignment = laTop
              Align = alClient
              TabOrder = 0
              DesignSize = (
                836
                273)
              object SpeedButton16: TSpeedButton
                Left = -110
                Top = 6
                Width = 26
                Height = 25
                Hint = #25171#21360#22270#29255
                Anchors = [akTop, akRight]
                Glyph.Data = {
                  26050000424D26050000000000003604000028000000100000000F0000000100
                  080000000000F000000000000000000000000001000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
                  A400000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707070707
                  0707070707070707070707070000000000000000000000070707070007070707
                  0707070707000700070700000000000000000000000000070007000707070707
                  07FBFBFB07070000000700070707070707101010070700070007000000000000
                  0000000000000007070000070707070707070707070007000700070000000000
                  00000000000700070000070700FFFFFFFFFFFFFFFF000700070007070700FF00
                  00000000FF000000000707070700FFFFFFFFFFFFFFFF000707070707070700FF
                  0000000000FF000707070707070700FFFFFFFFFFFFFFFF000707070707070700
                  00000000000000000707}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton3Click
              end
              object Series14: TBarSeries
                Marks.ArrowLength = 20
                Marks.Visible = True
                SeriesColor = clRed
                XValues.DateTime = False
                XValues.Name = 'X'
                XValues.Multiplier = 1.000000000000000000
                XValues.Order = loAscending
                YValues.DateTime = False
                YValues.Name = 'Bar'
                YValues.Multiplier = 1.000000000000000000
                YValues.Order = loNone
              end
            end
          end
          object TabSheet17: TTabSheet
            Caption = 'TabSheet9'
            TabVisible = False
            object Chart8_6: TChart
              Left = 0
              Top = 0
              Width = 836
              Height = 273
              BackWall.Brush.Color = clWhite
              BackWall.Brush.Style = bsClear
              Title.Text.Strings = (
                #35774#22791#30446#26631#20540)
              Legend.Alignment = laTop
              Align = alClient
              TabOrder = 0
              DesignSize = (
                836
                273)
              object SpeedButton17: TSpeedButton
                Left = -110
                Top = 6
                Width = 26
                Height = 25
                Hint = #25171#21360#22270#29255
                Anchors = [akTop, akRight]
                Glyph.Data = {
                  26050000424D26050000000000003604000028000000100000000F0000000100
                  080000000000F000000000000000000000000001000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
                  A400000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707070707
                  0707070707070707070707070000000000000000000000070707070007070707
                  0707070707000700070700000000000000000000000000070007000707070707
                  07FBFBFB07070000000700070707070707101010070700070007000000000000
                  0000000000000007070000070707070707070707070007000700070000000000
                  00000000000700070000070700FFFFFFFFFFFFFFFF000700070007070700FF00
                  00000000FF000000000707070700FFFFFFFFFFFFFFFF000707070707070700FF
                  0000000000FF000707070707070700FFFFFFFFFFFFFFFF000707070707070700
                  00000000000000000707}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton3Click
              end
              object BarSeries2: TBarSeries
                Marks.ArrowLength = 20
                Marks.Visible = True
                SeriesColor = clRed
                XValues.DateTime = False
                XValues.Name = 'X'
                XValues.Multiplier = 1.000000000000000000
                XValues.Order = loAscending
                YValues.DateTime = False
                YValues.Name = 'Bar'
                YValues.Multiplier = 1.000000000000000000
                YValues.Order = loNone
              end
            end
          end
          object TabSheet18: TTabSheet
            Caption = #20572#26426#32500#20462
            ImageIndex = 1
            object Chart8_1: TChart
              Left = 0
              Top = 0
              Width = 836
              Height = 273
              BackWall.Brush.Color = clWhite
              BackWall.Brush.Style = bsClear
              Title.Text.Strings = (
                #20572#26426#32500#20462)
              Legend.Alignment = laTop
              Align = alClient
              TabOrder = 0
              DesignSize = (
                836
                273)
              object SpeedButton18: TSpeedButton
                Left = -110
                Top = 6
                Width = 26
                Height = 25
                Hint = #25171#21360#22270#29255
                Anchors = [akTop, akRight]
                Glyph.Data = {
                  26050000424D26050000000000003604000028000000100000000F0000000100
                  080000000000F000000000000000000000000001000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
                  A400000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707070707
                  0707070707070707070707070000000000000000000000070707070007070707
                  0707070707000700070700000000000000000000000000070007000707070707
                  07FBFBFB07070000000700070707070707101010070700070007000000000000
                  0000000000000007070000070707070707070707070007000700070000000000
                  00000000000700070000070700FFFFFFFFFFFFFFFF000700070007070700FF00
                  00000000FF000000000707070700FFFFFFFFFFFFFFFF000707070707070700FF
                  0000000000FF000707070707070700FFFFFFFFFFFFFFFF000707070707070700
                  00000000000000000707}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton3Click
              end
              object Series15: TBarSeries
                Marks.ArrowLength = 20
                Marks.Visible = True
                SeriesColor = clRed
                XValues.DateTime = False
                XValues.Name = 'X'
                XValues.Multiplier = 1.000000000000000000
                XValues.Order = loAscending
                YValues.DateTime = False
                YValues.Name = 'Bar'
                YValues.Multiplier = 1.000000000000000000
                YValues.Order = loNone
              end
            end
          end
          object TabSheet19: TTabSheet
            Caption = #26410#20572#26426#25925#38556
            ImageIndex = 6
            object Chart8_2: TChart
              Left = 0
              Top = 0
              Width = 836
              Height = 273
              BackWall.Brush.Color = clWhite
              BackWall.Brush.Style = bsClear
              Title.Text.Strings = (
                #26410#20572#26426#25925#38556)
              Legend.Alignment = laTop
              Align = alClient
              TabOrder = 0
              DesignSize = (
                836
                273)
              object SpeedButton19: TSpeedButton
                Left = -110
                Top = 6
                Width = 26
                Height = 25
                Hint = #25171#21360#22270#29255
                Anchors = [akTop, akRight]
                Glyph.Data = {
                  26050000424D26050000000000003604000028000000100000000F0000000100
                  080000000000F000000000000000000000000001000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
                  A400000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707070707
                  0707070707070707070707070000000000000000000000070707070007070707
                  0707070707000700070700000000000000000000000000070007000707070707
                  07FBFBFB07070000000700070707070707101010070700070007000000000000
                  0000000000000007070000070707070707070707070007000700070000000000
                  00000000000700070000070700FFFFFFFFFFFFFFFF000700070007070700FF00
                  00000000FF000000000707070700FFFFFFFFFFFFFFFF000707070707070700FF
                  0000000000FF000707070707070700FFFFFFFFFFFFFFFF000707070707070700
                  00000000000000000707}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton3Click
              end
              object Series16: TBarSeries
                Marks.ArrowLength = 20
                Marks.Visible = True
                SeriesColor = clRed
                XValues.DateTime = False
                XValues.Name = 'X'
                XValues.Multiplier = 1.000000000000000000
                XValues.Order = loAscending
                YValues.DateTime = False
                YValues.Name = 'Bar'
                YValues.Multiplier = 1.000000000000000000
                YValues.Order = loNone
              end
            end
          end
          object TabSheet20: TTabSheet
            Caption = #26410#20572#26426#32500#20462
            ImageIndex = 2
            object Chart8_3: TChart
              Left = 0
              Top = 0
              Width = 836
              Height = 273
              BackWall.Brush.Color = clWhite
              BackWall.Brush.Style = bsClear
              Title.Text.Strings = (
                #26410#20572#26426#32500#20462)
              Legend.Alignment = laTop
              Align = alClient
              TabOrder = 0
              DesignSize = (
                836
                273)
              object SpeedButton20: TSpeedButton
                Left = -110
                Top = 6
                Width = 26
                Height = 25
                Hint = #25171#21360#22270#29255
                Anchors = [akTop, akRight]
                Glyph.Data = {
                  26050000424D26050000000000003604000028000000100000000F0000000100
                  080000000000F000000000000000000000000001000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
                  A400000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707070707
                  0707070707070707070707070000000000000000000000070707070007070707
                  0707070707000700070700000000000000000000000000070007000707070707
                  07FBFBFB07070000000700070707070707101010070700070007000000000000
                  0000000000000007070000070707070707070707070007000700070000000000
                  00000000000700070000070700FFFFFFFFFFFFFFFF000700070007070700FF00
                  00000000FF000000000707070700FFFFFFFFFFFFFFFF000707070707070700FF
                  0000000000FF000707070707070700FFFFFFFFFFFFFFFF000707070707070700
                  00000000000000000707}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton3Click
              end
              object Series17: TBarSeries
                Marks.ArrowLength = 20
                Marks.Visible = True
                SeriesColor = clRed
                XValues.DateTime = False
                XValues.Name = 'X'
                XValues.Multiplier = 1.000000000000000000
                XValues.Order = loAscending
                YValues.DateTime = False
                YValues.Name = 'Bar'
                YValues.Multiplier = 1.000000000000000000
                YValues.Order = loNone
              end
            end
          end
          object TabSheet21: TTabSheet
            Caption = #25925#38556#25253#24223
            ImageIndex = 3
            object Chart8_4: TChart
              Left = 0
              Top = 0
              Width = 836
              Height = 273
              BackWall.Brush.Color = clWhite
              BackWall.Brush.Style = bsClear
              Title.Text.Strings = (
                #25925#38556#25253#24223)
              Legend.Alignment = laTop
              Align = alClient
              TabOrder = 0
              DesignSize = (
                836
                273)
              object SpeedButton21: TSpeedButton
                Left = -110
                Top = 6
                Width = 26
                Height = 25
                Hint = #25171#21360#22270#29255
                Anchors = [akTop, akRight]
                Glyph.Data = {
                  26050000424D26050000000000003604000028000000100000000F0000000100
                  080000000000F000000000000000000000000001000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
                  A400000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707070707
                  0707070707070707070707070000000000000000000000070707070007070707
                  0707070707000700070700000000000000000000000000070007000707070707
                  07FBFBFB07070000000700070707070707101010070700070007000000000000
                  0000000000000007070000070707070707070707070007000700070000000000
                  00000000000700070000070700FFFFFFFFFFFFFFFF000700070007070700FF00
                  00000000FF000000000707070700FFFFFFFFFFFFFFFF000707070707070700FF
                  0000000000FF000707070707070700FFFFFFFFFFFFFFFF000707070707070700
                  00000000000000000707}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton3Click
              end
              object Series18: TBarSeries
                Marks.ArrowLength = 20
                Marks.Visible = True
                SeriesColor = clRed
                XValues.DateTime = False
                XValues.Name = 'X'
                XValues.Multiplier = 1.000000000000000000
                XValues.Order = loAscending
                YValues.DateTime = False
                YValues.Name = 'Bar'
                YValues.Multiplier = 1.000000000000000000
                YValues.Order = loNone
              end
            end
          end
          object TabSheet22: TTabSheet
            Caption = #20445#20859#35745#21010
            ImageIndex = 4
            object Chart8_5: TChart
              Left = 0
              Top = 0
              Width = 836
              Height = 273
              BackWall.Brush.Color = clWhite
              BackWall.Brush.Style = bsClear
              Title.Text.Strings = (
                #20445#20859#35745#21010)
              Legend.Alignment = laTop
              Align = alClient
              TabOrder = 0
              DesignSize = (
                836
                273)
              object SpeedButton22: TSpeedButton
                Left = -110
                Top = 6
                Width = 26
                Height = 25
                Hint = #25171#21360#22270#29255
                Anchors = [akTop, akRight]
                Glyph.Data = {
                  26050000424D26050000000000003604000028000000100000000F0000000100
                  080000000000F000000000000000000000000001000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
                  A400000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707070707
                  0707070707070707070707070000000000000000000000070707070007070707
                  0707070707000700070700000000000000000000000000070007000707070707
                  07FBFBFB07070000000700070707070707101010070700070007000000000000
                  0000000000000007070000070707070707070707070007000700070000000000
                  00000000000700070000070700FFFFFFFFFFFFFFFF000700070007070700FF00
                  00000000FF000000000707070700FFFFFFFFFFFFFFFF000707070707070700FF
                  0000000000FF000707070707070700FFFFFFFFFFFFFFFF000707070707070700
                  00000000000000000707}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton3Click
              end
              object Series19: TBarSeries
                Marks.ArrowLength = 20
                Marks.Visible = True
                SeriesColor = clRed
                XValues.DateTime = False
                XValues.Name = 'X'
                XValues.Multiplier = 1.000000000000000000
                XValues.Order = loAscending
                YValues.DateTime = False
                YValues.Name = 'Bar'
                YValues.Multiplier = 1.000000000000000000
                YValues.Order = loNone
              end
            end
          end
        end
      end
    end
    object TabSheet9: TTabSheet
      Caption = #35774#22791#37096#31649#29702#30446#26631
      ImageIndex = 8
      object Panel40: TPanel
        Left = 0
        Top = 0
        Width = 844
        Height = 217
        Align = alTop
        Caption = 'Panel4'
        TabOrder = 0
        object Panel41: TPanel
          Left = 577
          Top = 1
          Width = 266
          Height = 215
          Align = alClient
          BevelOuter = bvNone
          Caption = 'Panel4'
          TabOrder = 0
          object Panel42: TPanel
            Left = 0
            Top = 180
            Width = 266
            Height = 35
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 0
            object Label14: TLabel
              Left = 8
              Top = 11
              Width = 12
              Height = 12
              Caption = #24180
            end
            object Edit5: TEdit
              Left = 32
              Top = 8
              Width = 121
              Height = 20
              TabOrder = 0
              OnKeyPress = Edit5KeyPress
            end
          end
          object DBGridEh9_1: TDBGridEh
            Left = 0
            Top = 0
            Width = 266
            Height = 180
            Align = alClient
            DataSource = DataSource9_1
            FooterColor = clWindow
            FooterFont.Charset = GB2312_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -12
            FooterFont.Name = #23435#20307
            FooterFont.Style = []
            FrozenCols = 4
            PopupMenu = PopupMenu9_1
            TabOrder = 1
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            UseMultiTitle = True
            OnEnter = DBGridEh7_1Enter
            OnKeyDown = DBGridEh1_1KeyDown
            Columns = <
              item
                EditButtons = <>
                FieldName = 'Location'
                Footers = <>
                ReadOnly = True
                Width = 75
              end
              item
                EditButtons = <>
                FieldName = 'NumbDevi'
                Footers = <>
                ReadOnly = True
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'Separati'
                Footers = <>
                ReadOnly = True
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'TotaHour'
                Footers = <>
                ReadOnly = True
                Width = 50
              end
              item
                EditButtons = <>
                EditMask = '0.00'
                FieldName = 'HourWork'
                Footers = <>
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'StafResiActu'
                Footers = <>
                ReadOnly = True
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'StafResiTarg'
                Footers = <>
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'ManaDeviQTY'
                Footers = <>
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'ManaDeviActu'
                Footers = <>
                ReadOnly = True
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'ManaDeviTarg'
                Footers = <>
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'VacaDaysActu'
                Footers = <>
                ReadOnly = True
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'VacaDaysTarg'
                Footers = <>
                Width = 50
              end>
          end
        end
        object Panel43: TPanel
          Left = 1
          Top = 1
          Width = 576
          Height = 215
          Align = alLeft
          BevelOuter = bvNone
          Caption = 'Panel4'
          TabOrder = 1
          object DBGridEh9: TDBGridEh
            Left = 0
            Top = 0
            Width = 576
            Height = 215
            Align = alClient
            DataSource = DataSource9
            FooterColor = clWindow
            FooterFont.Charset = GB2312_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -12
            FooterFont.Name = #23435#20307
            FooterFont.Style = []
            FrozenCols = 3
            PopupMenu = PopupMenu9
            TabOrder = 0
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            UseMultiTitle = True
            OnEnter = DBGridEh9Enter
            OnKeyDown = DBGridEh9KeyDown
            Columns = <
              item
                EditButtons = <>
                FieldName = 'ABBR_NAME'
                Footers = <>
                Width = 76
              end
              item
                EditButtons = <>
                FieldName = 'Years'
                Footers = <>
                Width = 41
              end
              item
                EditButtons = <>
                FieldName = 'Month'
                Footers = <>
                Width = 20
              end
              item
                EditButtons = <>
                FieldName = 'ManuNumb'
                Footers = <>
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'DeviNumb'
                Footers = <>
                ReadOnly = True
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'DeviWork'
                Footers = <>
                ReadOnly = True
                Width = 50
              end
              item
                DisplayFormat = '0.'
                EditButtons = <>
                FieldName = 'Producti'
                Footers = <>
                ReadOnly = True
                Width = 50
              end
              item
                DisplayFormat = '0.'
                EditButtons = <>
                FieldName = 'OutpValu'
                Footers = <>
                ReadOnly = True
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'ManuPropNumb'
                Footers = <>
                Width = 50
              end
              item
                DisplayFormat = '0.'
                EditButtons = <>
                FieldName = 'AverYiel'
                Footers = <>
                Width = 50
              end
              item
                DisplayFormat = '0.'
                EditButtons = <>
                FieldName = 'Aver_GDP'
                Footers = <>
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'HourWork'
                Footers = <>
                Width = 50
              end>
          end
        end
      end
      object Panel44: TPanel
        Left = 0
        Top = 217
        Width = 844
        Height = 300
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Panel7'
        TabOrder = 1
        object Chart9: TChart
          Left = 0
          Top = 0
          Width = 844
          Height = 300
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          Title.Text.Strings = (
            #35774#22791#37096#31649#29702#30446#26631)
          Legend.Alignment = laTop
          Align = alClient
          TabOrder = 0
          DesignSize = (
            844
            300)
          object SpeedButton23: TSpeedButton
            Left = -110
            Top = 6
            Width = 26
            Height = 25
            Hint = #25171#21360#22270#29255
            Anchors = [akTop, akRight]
            Glyph.Data = {
              26050000424D26050000000000003604000028000000100000000F0000000100
              080000000000F000000000000000000000000001000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
              A400000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707070707
              0707070707070707070707070000000000000000000000070707070007070707
              0707070707000700070700000000000000000000000000070007000707070707
              07FBFBFB07070000000700070707070707101010070700070007000000000000
              0000000000000007070000070707070707070707070007000700070000000000
              00000000000700070000070700FFFFFFFFFFFFFFFF000700070007070700FF00
              00000000FF000000000707070700FFFFFFFFFFFFFFFF000707070707070700FF
              0000000000FF000707070707070700FFFFFFFFFFFFFFFF000707070707070700
              00000000000000000707}
            ParentShowHint = False
            ShowHint = True
            OnClick = SpeedButton3Click
          end
          object Series6: TBarSeries
            Marks.ArrowLength = 20
            Marks.Style = smsValue
            Marks.Visible = True
            SeriesColor = clGreen
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Bar'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
          end
        end
      end
    end
    object TabSheet_10: TTabSheet
      Caption = #38599#21592#24635#24037#26102#20998#31867
      ImageIndex = 9
      object Panel45: TPanel
        Left = 0
        Top = 0
        Width = 844
        Height = 217
        Align = alTop
        Caption = 'Panel4'
        TabOrder = 0
        object Panel46: TPanel
          Left = 297
          Top = 1
          Width = 789
          Height = 215
          Align = alClient
          BevelOuter = bvNone
          Caption = 'Panel4'
          TabOrder = 0
          object DBGridEh10_1: TDBGridEh
            Left = 0
            Top = 0
            Width = 789
            Height = 180
            Align = alClient
            DataSource = DataSource10_1
            FooterColor = clWindow
            FooterFont.Charset = GB2312_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -12
            FooterFont.Name = #23435#20307
            FooterFont.Style = []
            TabOrder = 0
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            OnEnter = DBGridEh1_1Enter
            OnKeyDown = DBGridEh1_1KeyDown
            Columns = <
              item
                EditButtons = <>
                FieldName = 'JobName'
                Footers = <>
                Width = 89
              end
              item
                EditButtons = <>
                FieldName = 'TimeCons'
                Footers = <>
                Width = 66
              end
              item
                EditButtons = <>
                FieldName = 'Percentage'
                Footers = <>
              end>
          end
          object Panel47: TPanel
            Left = 0
            Top = 180
            Width = 789
            Height = 35
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            object Label15: TLabel
              Left = 8
              Top = 11
              Width = 12
              Height = 12
              Caption = #24180
            end
            object Edit6: TEdit
              Left = 32
              Top = 8
              Width = 121
              Height = 20
              TabOrder = 0
              OnKeyPress = Edit1KeyPress
            end
          end
        end
        object Panel48: TPanel
          Left = 1
          Top = 1
          Width = 296
          Height = 215
          Align = alLeft
          BevelOuter = bvNone
          Caption = 'Panel4'
          TabOrder = 1
          object DBGridEh10: TDBGridEh
            Left = 0
            Top = 0
            Width = 296
            Height = 215
            Align = alClient
            DataSource = DataSource1
            FooterColor = clWindow
            FooterFont.Charset = GB2312_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -12
            FooterFont.Name = #23435#20307
            FooterFont.Style = []
            TabOrder = 0
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            OnKeyDown = DBGridEh1KeyDown
            Columns = <
              item
                EditButtons = <>
                FieldName = 'Years'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'Month'
                Footers = <>
              end>
          end
        end
      end
      object Panel49: TPanel
        Left = 0
        Top = 217
        Width = 777
        Height = 300
        Align = alLeft
        BevelOuter = bvNone
        Caption = 'Panel49'
        TabOrder = 1
        object PageControl4: TPageControl
          Left = 0
          Top = 0
          Width = 777
          Height = 300
          ActivePage = TabSheet23
          Align = alClient
          TabOrder = 0
          object TabSheet23: TTabSheet
            Caption = #25925#38556#24635#24037#26102#20998#26512#22270
            object Chart3: TChart
              Left = 0
              Top = 0
              Width = 769
              Height = 273
              AllowPanning = pmNone
              AllowZoom = False
              BackWall.Brush.Color = clWhite
              BackWall.Brush.Style = bsClear
              BackWall.Pen.Visible = False
              Title.Text.Strings = (
                #38599#21592#24635#24037#26102#20998#31867)
              AxisVisible = False
              ClipPoints = False
              Frame.Visible = False
              Legend.Alignment = laTop
              View3DOptions.Elevation = 315
              View3DOptions.Orthogonal = False
              View3DOptions.Perspective = 0
              View3DOptions.Rotation = 360
              View3DWalls = False
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              DesignSize = (
                769
                273)
              object SpeedButton24: TSpeedButton
                Left = 183
                Top = 6
                Width = 26
                Height = 25
                Hint = #25171#21360#22270#29255
                Anchors = [akTop, akRight]
                Glyph.Data = {
                  26050000424D26050000000000003604000028000000100000000F0000000100
                  080000000000F000000000000000000000000001000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
                  A400000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707070707
                  0707070707070707070707070000000000000000000000070707070007070707
                  0707070707000700070700000000000000000000000000070007000707070707
                  07FBFBFB07070000000700070707070707101010070700070007000000000000
                  0000000000000007070000070707070707070707070007000700070000000000
                  00000000000700070000070700FFFFFFFFFFFFFFFF000700070007070700FF00
                  00000000FF000000000707070700FFFFFFFFFFFFFFFF000707070707070700FF
                  0000000000FF000707070707070700FFFFFFFFFFFFFFFF000707070707070700
                  00000000000000000707}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton3Click
              end
              object Series20: TPieSeries
                Marks.ArrowLength = 8
                Marks.Visible = True
                SeriesColor = clRed
                OtherSlice.Text = 'Other'
                PieValues.DateTime = False
                PieValues.Name = 'Pie'
                PieValues.Multiplier = 1.000000000000000000
                PieValues.Order = loNone
              end
            end
          end
          object TabSheet24: TTabSheet
            Caption = #25925#38556#20572#26426#32500#20462#20998#26512#22270
            ImageIndex = 1
            object Chart6: TChart
              Left = 0
              Top = 0
              Width = 769
              Height = 273
              AllowPanning = pmNone
              AllowZoom = False
              BackWall.Brush.Color = clWhite
              BackWall.Brush.Style = bsClear
              BackWall.Pen.Visible = False
              Title.Text.Strings = (
                #38599#21592#24635#24037#26102#20998#31867)
              AxisVisible = False
              ClipPoints = False
              Frame.Visible = False
              Legend.Alignment = laTop
              View3DOptions.Elevation = 315
              View3DOptions.Orthogonal = False
              View3DOptions.Perspective = 0
              View3DOptions.Rotation = 360
              View3DWalls = False
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              DesignSize = (
                769
                273)
              object SpeedButton9: TSpeedButton
                Left = 183
                Top = 6
                Width = 26
                Height = 25
                Hint = #25171#21360#22270#29255
                Anchors = [akTop, akRight]
                Glyph.Data = {
                  26050000424D26050000000000003604000028000000100000000F0000000100
                  080000000000F000000000000000000000000001000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
                  A400000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707070707
                  0707070707070707070707070000000000000000000000070707070007070707
                  0707070707000700070700000000000000000000000000070007000707070707
                  07FBFBFB07070000000700070707070707101010070700070007000000000000
                  0000000000000007070000070707070707070707070007000700070000000000
                  00000000000700070000070700FFFFFFFFFFFFFFFF000700070007070700FF00
                  00000000FF000000000707070700FFFFFFFFFFFFFFFF000707070707070700FF
                  0000000000FF000707070707070700FFFFFFFFFFFFFFFF000707070707070700
                  00000000000000000707}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton3Click
              end
              object Series21: TPieSeries
                Marks.ArrowLength = 8
                Marks.Visible = True
                SeriesColor = clGreen
                OtherSlice.Text = 'Other'
                PieValues.DateTime = False
                PieValues.Name = 'Pie'
                PieValues.Multiplier = 1.000000000000000000
                PieValues.Order = loNone
              end
            end
          end
        end
      end
      object Panel50: TPanel
        Left = 777
        Top = 217
        Width = 67
        Height = 300
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
      end
    end
  end
  object tlb1: TToolBar
    Left = 0
    Top = 0
    Width = 852
    Height = 46
    ButtonHeight = 40
    ButtonWidth = 77
    Caption = 'tlb1'
    TabOrder = 1
    object btInsert: TSpeedButton
      Left = 0
      Top = 2
      Width = 36
      Height = 40
      Hint = #26032#24314
      Caption = #26032#24314
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00000000000000000000000000
        0000000000000000000000000000000000000000FF00FFFF00FFFF00FFFF00FF
        FF00FF848484CECECECECECECECECECECECECECECECECECECECECECECECECECE
        CE000000FF00FFFF00FFFF00FFFF00FFFF00FF848484CEFFFFFFFFFF94FFFFFF
        FFFF94FFFFFFFFFF94FFFFFFFFFFCECECE000000FF00FFFF00FFFF00FFFF00FF
        FF00FF848484FFFFFF94FFFFFFFFFF94FFFFFFFFFF94FFFFFFFFFF94FFFFCECE
        CE000000FF00FFFF00FFFF00FFFF00FFFF00FF848484FFFFFFFFFFFF94FFFFFF
        FFFF94FFFFFFFFFF94FFFFFFFFFFCECECE000000FF00FFFF00FFFF00FFFF00FF
        FF00FF848484FFFFFF94FFFFFFFFFF94FFFFFFFFFF94FFFFFFFFFF94FFFFCECE
        CE000000FF00FFFF00FFFF00FFFF00FFFF00FF848484FFFFFFFFFFFF94FFFFFF
        FFFF94FFFFFFFFFF94FFFFFFFFFFCECECE000000FF00FFFF00FFFF00FFFF00FF
        FF00FF848484FFFFFFFFFFFFFFFFFF94FFFFFFFFFF94FFFFFFFFFF94FFFFCECE
        CE000000FF00FFFF00FFFF00FFFF00FFFF00FF848484FFFFFFFFFFFFFFFFFFFF
        FFFF94FFFFFFFFFF94FFFFCECECECECECE000000FF00FFFF00FFFF00FFFF00FF
        FF00FF848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF94FFFF0000000000000000
        00000000FF00FFFF00FFFF00FFFF00FFFF00FF848484FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF848484FFFFFF000000FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF848484000000FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF84848484848484848484848484
        8484848484848484848484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = True
      OnClick = btInsertClick
    end
    object btEdit: TSpeedButton
      Left = 36
      Top = 2
      Width = 36
      Height = 40
      Hint = #32534#36753
      Caption = #32534#36753
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000E0E
        0E000E0E0E000E0E0E000E0E0E000E0E0E00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000E0E
        0E004A4A4A00CECECE009E9E9E009E9E9E000E0E0E00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000E0E
        0E00FFFFFF00E6E6E600C2C2C2000092DC000092DC000E0E0E00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000E0E
        0E00E6E6E600C2C2C2000092DC000062960025AAFF000092DC000E0E0E00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000E0E
        0E00B6B6B6006BC6FF00007AB90025AAFF000062960025AAFF000092DC000E0E
        0E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF000E0E0E0000AAFF008ED4FF00007AB90025AAFF000062960025AAFF000092
        DC000E0E0E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF000E0E0E0000AAFF00B1E2FF00007AB90025AAFF000062960025AA
        FF000092DC000E0E0E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF000E0E0E0000AAFF008ED4FF00007AB90025AAFF000062
        960025AAFF004A7300000E0E0E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF000E0E0E0000AAFF00B1E2FF00007AB90025AA
        FF00629600004A7300004A7300000E0E0E00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000E0E0E0000AAFF008ED4FF003DB9
        000062960000007AB900003DB900003DB9000E0E0E00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000E0E0E000092DC0049DC
        00000049DC00003DB9006B8FFF006B8FFF000049DC000E0E0E00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000E0E0E006296
        0000003DB9006B8FFF000000B9000055FF000049DC000E0E0E00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000E0E
        0E004873FF008EABFF000055FF000055FF00003DB9000E0E0E00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF000E0E0E000049DC000055FF00003DB9000E0E0E00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF000E0E0E000E0E0E000E0E0E00FFFFFF00FFFFFF00}
      Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = True
      Visible = False
    end
    object btDelete: TSpeedButton
      Left = 72
      Top = 2
      Width = 36
      Height = 40
      Hint = #21024#38500
      Caption = #21024#38500
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000
        00000000FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000
        FF000000FF000000FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        FF000000FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00000000000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF000000FF000000FF000000FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00000000000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF000000FF000000FF000000FF0000000000FFFFFF00FFFFFF000000
        00000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF000000FF000000FF000000FF0000000000000000000000
        FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000FF000000FF000000
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00000000000000FF000000FF000000FF000000
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00000000000000FF000000FF000000FF000000FF000000
        FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF0000000000000000000000FF000000FF000000FF00FFFFFF00FFFFFF000000
        FF000000FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        00000000FF000000FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF000000FF000000FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        FF000000FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF000000FF000000FF0000000000FFFFFF00FFFFFF00FFFFFF000000
        FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = True
      OnClick = btDeleteClick
    end
    object btFilter: TSpeedButton
      Left = 108
      Top = 2
      Width = 36
      Height = 40
      Hint = #36807#28388
      Caption = #26597#25214
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF003232320032323200323232003232320032323200323232003232
        3200323232003232320032323200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF003232320086868600B6B6B600DADADA00DADADA00DADADA00DADADA00DADA
        DA00DADADA00CECECE00323232002626260026262600FFFFFF00FFFFFF003232
        3200F2F2F2004A4A4A00B6B6B600E6E6E600E6E6E600E6E6E600E6E6E600E6E6
        E600E6E6E600626262000049DC0025AAFF000031960026262600323232008686
        86004A4A4A0062626200E6E6E600E6E6E600F2F2F200F2F2F200F2F2F200F2F2
        F200626262000049DC008ED4FF008E8EFF000049DC002626260032323200DADA
        DA00E6E6E600E6E6E600E6E6E600E6E6E600DADADA00AAAAAA00AAAAAA006262
        62000049DC008ED4FF008E8EFF000049DC0026262600FFFFFF0032323200E6E6
        E600E6E6E600E6E6E600C2C2C2006E6E6E004A4A4A004A4A4A004A4A4A004A4A
        4A008ED4FF008E8EFF000049DC0026262600FFFFFF00FFFFFF0032323200E6E6
        E600E6E6E600C2C2C2006E6E6E00FFC66B00FFC66B00FFC66B00FFB84800FF8F
        6B002557FF000049DC0026262600FFFFFF00FFFFFF00FFFFFF0032323200E6E6
        E600C2C2C2006E6E6E00AAAAAA00FFE2B100FFFF8E00FFFF8E00FFC66B00FFB8
        4800FF8F6B004A4A4A0032323200FFFFFF00FFFFFF00FFFFFF0032323200E6E6
        E600C2C2C2006E6E6E00FFE2B100FFFFD400FFFFB100FFFF8E00FFFF8E00FFC6
        6B00FFB848004A4A4A0032323200FFFFFF00FFFFFF00FFFFFF0032323200E6E6
        E600C2C2C2006E6E6E00FFE2B100FFFFD400FFFFB100FFFFB100FFFF8E00FFFF
        8E00FFB848004A4A4A0032323200FFFFFF00FFFFFF00FFFFFF0032323200E6E6
        E600C2C2C2006E6E6E00FFE2B100FFFFD400FFFFB100FFFFB100FFFFB100FFFF
        8E00FFB848004A4A4A0032323200FFFFFF00FFFFFF00FFFFFF0032323200E6E6
        E600DADADA006E6E6E00C2C2C200FFE2B100FFFFD400FFFFB100FFFFB100FFE2
        B100AAAAAA004A4A4A0032323200FFFFFF00FFFFFF00FFFFFF0032323200E6E6
        E600DADADA00C2C2C2006E6E6E00C2C2C200FFE2B100FFE2B100FFE2B100AAAA
        AA0026262600C2C2C20032323200FFFFFF00FFFFFF00FFFFFF0032323200E6E6
        E600DADADA00DADADA00C2C2C2006E6E6E006E6E6E006E6E6E006E6E6E006E6E
        6E00C2C2C200E6E6E60032323200FFFFFF00FFFFFF00FFFFFF0032323200F2F2
        F200E6E6E600E6E6E600E6E6E600E6E6E600C2C2C200C2C2C200C2C2C200C2C2
        C200E6E6E600E6E6E60032323200FFFFFF00FFFFFF00FFFFFF00323232003232
        3200323232003232320032323200323232003232320032323200323232003232
        3200323232003232320032323200FFFFFF00FFFFFF00FFFFFF00}
      Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = True
      Visible = False
    end
    object btRefresh: TSpeedButton
      Left = 144
      Top = 2
      Width = 36
      Height = 40
      Hint = #21047#26032
      Caption = #21047#26032
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FFFFFF000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000FFFFFF00FFFFFF00707070008080
        8000808080008080800080808000808080008080800080808000808080008080
        80008080800080808000808080004F4F4F0000000000FFFFFF0080808000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00808080004F4F4F000000000080808000AFB0
        AF00808080008080800080808000808080008080800000000000808080007070
        70008080800080808000FFFFFF00808080004F4F4F000000000080808000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00007F7F00FFFFFF0000000000FFFF
        FF00FFFFFF00FFFFFF00AFB0AF00808080004F4F4F000000000080808000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00007F7F00FFFFFF0060CFCF000000
        0000FFFFFF00007F0000FFFFFF00808080004F4F4F000000000080808000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00007F7F00FFFFFF0090FFFF002F90CF0060CF
        CF0000000000FFFFFF00FFFFFF00808080004F4F4F0000000000FFFFFF008080
        8000FFFFFF00AFB0AF00FFFFFF00007F7F00FFFFFF002F90CF0090FFFF002F90
        CF0060CFCF0000000000FFFFFF00AFB0AF005050500000000000FFFFFF00FFFF
        FF008080800080808000007F7F00FFFFFF002F90CF0090FFFF002F90CF0060CF
        FF002F90CF0060CFCF00000000008080800080808000FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF007F000000FFFFFF0090FFFF002F90CF002FFFFF00007F
        7F0060CFFF0060CFCF00007F7F0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF007F000000FF9060007F000000007F7F0000FFFF00007F7F0060CF
        FF0060CFCF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF007F000000FFCFCF00FF9060007F000000007F7F0060CFFF000000
        000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF007F000000FF906000FF0000007F0000000000000000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF007F000000FF906000000000000000000000000000FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007F00
        0000FF90600000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007F00
        000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = True
      Visible = False
    end
    object btOut: TSpeedButton
      Left = 180
      Top = 2
      Width = 36
      Height = 40
      Hint = #23548#20986'Excel'
      Caption = #23548#20986
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
        00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
        00005B5BF5005555F100504FED004B4CEA00393ADF0000000000000000001313
        C5002827D300201FCD001B1BCB001313C50000000000FFFFFF00FFFFFF00FFFF
        FF00000000005B5BF500504FED005555F1004B4CEA001B1BCB0005059D00504F
        ED006B6BFF006B6BFF00201FCD0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00000000005B5BF500504FED005555F1004B4CEA001B1BCB00504F
        ED006B6BFF002D2DD60000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00000000005B5BF500504FED005555F1004343E5006464
        FA00393ADF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00000000005B5BF500504FED005555F1004343
        E50000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00000000005F5FF8004B4CEA00504FED004B4C
        EA0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00000000006B6BFF003D3DE1005F5FF8004B4CEA005352
        EF004B4CEA0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00000000006B6BFF003434DB006B6BFF001B1BCB005F5FF8004B4C
        EA005352EF004B4CEA0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00000000006B6BFF002827D3002D2DD6006B6BFF0005059D003D3DE1005F5F
        F8004B4CEA005352EF004B4CEA0000000000FFFFFF00FFFFFF00FFFFFF000000
        00006B6BFF006B6BFF006B6BFF006B6BFF006B6BFF0000000000000000006B6B
        FF005F5FF8005B5BF500504FED004B4CEA0000000000FFFFFF00FFFFFF000000
        00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
        00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = True
      OnClick = btOutClick
    end
    object btPrior: TSpeedButton
      Left = 216
      Top = 2
      Width = 36
      Height = 40
      Hint = #21069#19968#34892#35760#24405
      Caption = #21521#21069
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000D76B
        080000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000D76B0800E18C
        0E00D76B080000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000D76B0800E18C0E00E18C
        0E00E18C0E00D76B080000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF0000000000D9720A00DF840D00DF840D00E18C
        0E00D76B080000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF0000000000D9720A00DC7C0B00DF840D00DF840D00D86D
        090000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0000000000DC7C0B00D9720A00DC7C0B00DC7C0B00D9720A000000
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF0000000000DC7C0B00D76B0800D9720A00D9720A00DC7C0B0000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0000000000DF840D00D76B0800D9720A00D9720A00DC7C0B000000
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF0000000000E18C0E00D86D0900D9720A00D9720A00DC7C
        0B0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF0000000000E18C0E00D86D0900D86D0900D76B
        0800D9720A0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000DF840D00D76B0800D76B
        0800D76B0800D9720A0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000DC7C0B00D76B
        0800D9720A0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000D972
        0A0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = True
      Visible = False
    end
    object btNext: TSpeedButton
      Left = 252
      Top = 2
      Width = 36
      Height = 40
      Hint = #21518#19968#34892#35760#24405
      Caption = #21521#21518
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF0000000000D9720A0000000000FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0000000000D9720A00D76B0800DC7C0B0000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF0000000000D9720A00D76B0800D76B0800D76B0800DF840D0000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0000000000D9720A00D76B0800D86D0900D86D0900E18C0E000000
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF0000000000DC7C0B00D9720A00D9720A00D86D0900E18C
        0E0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF0000000000DC7C0B00D9720A00D9720A00D76B
        0800DF840D0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000DC7C0B00D9720A00D972
        0A00D76B0800DC7C0B0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF0000000000D9720A00DC7C0B00DC7C0B00D972
        0A00DC7C0B0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF0000000000D86D0900DF840D00DF840D00DC7C0B00D972
        0A0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0000000000D76B0800E18C0E00DF840D00DF840D00D9720A000000
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF0000000000D76B0800E18C0E00E18C0E00E18C0E00D76B080000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0000000000D76B0800E18C0E00D76B080000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF0000000000D76B080000000000FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = True
      Visible = False
    end
    object btUpload: TSpeedButton
      Left = 288
      Top = 2
      Width = 36
      Height = 40
      Hint = #19978#20256#25991#26723
      Caption = #19978#20256
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
        0000000000000000000000000000000000000000000000000000FFFFFF000000
        000000000000000000000000000000000000000000000000000000FFFF00FFFF
        FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000000000000C0C0
        C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF0000000000FFFFFF008080
        800080808000808080008080800080808000FFFFFF000000000000000000FFFF
        FF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C0000000000000FFFF00FFFF
        FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000000000000C0C0
        C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF0000000000FFFFFF00C0C0
        C000C0C0C000808080008080800080808000FFFFFF000000000000000000FFFF
        FF00C0C0C000FFFFFF00C0C0C000FFFFFF008000000080000000800000008000
        000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000000000000C0C0
        C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00FF000000FF0000008000
        0000C0C0C000808080008080800080808000FFFFFF000000000000000000FFFF
        FF00C0C0C000FFFFFF00C0C0C000FFFFFF00FF000000FF000000800000008000
        000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000000000000C0C0
        C000FFFFFF00C0C0C000FFFFFF00FF000000FF00000080000000FFFFFF008000
        0000FFFFFF00FFFFFF00FFFFFF0080808000808080000000000000000000FFFF
        FF00C0C0C000FFFFFF00FF000000FF000000800000000000000000FFFF00FFFF
        FF0000FFFF00FFFFFF0000FFFF008080800000000000FFFFFF0000000000C0C0
        C000FFFFFF00C0C0C000FFFFFF0080000000FFFFFF0000000000000000000000
        000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
        FF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFF
        FF00C0C0C00000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C0C0
        C000FFFFFF00800000008000000080000000800000008000000080000000C0C0
        C000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        000000000000FFFF0000FF000000FF000000FF000000FF000000800000000000
        000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFF0000FF000000FF000000FF000000FF00000080000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFF0000FFFF0000FFFF0000FFFF0000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = True
      Visible = False
    end
    object btDownload: TSpeedButton
      Left = 324
      Top = 2
      Width = 36
      Height = 40
      Hint = #25171#24320#23384#26723
      Caption = #25171#24320
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
        0000008484000084840000848400008484000084840000848400008484000084
        84000084840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FF
        FF00000000000084840000848400008484000084840000848400008484000084
        8400008484000084840000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFF
        FF0000FFFF000000000000848400008484000084840000848400008484000084
        840000848400008484000084840000000000FFFFFF00FFFFFF000000000000FF
        FF00FFFFFF0000FFFF0000000000008484000084840000848400008484000084
        84000084840000848400008484000084840000000000FFFFFF0000000000FFFF
        FF0000FFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000000000000000FF
        FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
        FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
        FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
        FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FF
        FF00FFFFFF0000FFFF0000000000000000000000000000000000000000000000
        000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
        FF00FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = True
      Visible = False
    end
    object SpeedButton1: TSpeedButton
      Left = 360
      Top = 2
      Width = 36
      Height = 40
      Hint = #25253#34920#35774#35745
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00000000000000000000000000000000000000000000000000000000000000
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF0084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
        000084848400FFFFFF0084000000840000008400000084000000C6C6C6000000
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840000FF
        FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C6000000
        000000000000000000000000000000000000000000000000000084848400FFFF
        FF0084848400FFFFFF0084000000840000008400000084000000C6C6C600C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000008484840000FF
        FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600FFFF
        FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C6000000000084848400FFFF
        FF0084848400FFFFFF0084000000840000008400000084000000C6C6C600C6C6
        C600FFFFFF00C6C6C600FFFFFF00C6C6C600C6C6C600000000008484840000FF
        FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600FFFF
        FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C6000000000084848400FFFF
        FF0084848400848484008484840084848400848484008484840084848400C6C6
        C600FFFFFF00C6C6C600FFFFFF00C6C6C600C6C6C600000000008484840000FF
        FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0084848400C6C6C600FFFF
        FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C60000000000848484008484
        8400848484008484840084848400848484008484840084848400FFFFFF00C6C6
        C600FFFFFF00C6C6C600FFFFFF00C6C6C600C6C6C60000000000FFFFFF00FFFF
        FF0084848400FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
        FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C60000000000FFFFFF00FFFF
        FF00848484008400000084000000840000008400000084000000840000008400
        000084000000840000008400000084000000C6C6C60000000000FFFFFF00FFFF
        FF00848484008400000084000000840000008400000084000000840000008400
        000084000000840000008400000084000000C6C6C60000000000FFFFFF00FFFF
        FF00848484008484840084848400848484008484840084848400848484008484
        8400848484008484840084848400848484008484840000000000}
      Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = True
      Visible = False
    end
    object btPrint: TSpeedButton
      Left = 396
      Top = 2
      Width = 36
      Height = 40
      Hint = #25171#21360
      Caption = #25171#21360
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
        C600C6C6C60000000000C6C6C60000000000FFFFFF00FFFFFF00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000C6C6C60000000000FFFFFF0000000000C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000FFFF0000FFFF0000FF
        FF00C6C6C600C6C6C600000000000000000000000000FFFFFF0000000000C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60084848400848484008484
        8400C6C6C600C6C6C60000000000C6C6C60000000000FFFFFF00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000C6C6C600C6C6C6000000000000000000C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
        C600C6C6C60000000000C6C6C60000000000C6C6C60000000000FFFFFF000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000C6C6C60000000000C6C6C6000000000000000000FFFFFF00FFFF
        FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0000000000C6C6C60000000000C6C6C60000000000FFFFFF00FFFF
        FF00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
        0000FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF0000000000FFFFFF000000000000000000000000000000
        000000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
        000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = True
      Visible = False
    end
    object btClose: TSpeedButton
      Left = 432
      Top = 2
      Width = 36
      Height = 40
      Hint = #20851#38381
      Caption = #20851#38381
      Glyph.Data = {
        26040000424D2604000000000000360000002800000012000000120000000100
        180000000000F0030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFF000000808000000000FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFF000000808000808000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFF0000000000008080008080
        00808000000000000000000000000000000000000000000000000000FFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFF000000808000808000808000000000FF
        FFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFF000000808000808000000000000000FFFFFFFFFFFF000000
        FFFFFFFFFFFFFFFFFFFFFFFF800000FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        000000808000808000808000000000FFFFFFFFFFFF000000FFFFFFFFFFFFFFFF
        FF800000800000FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF0000008080008080
        00808000000000FFFFFFFFFFFF000000FFFFFFFFFFFF80000080000080000080
        0000800000FFFFFF0000FFFFFFFFFFFF000000808000808000808000000000FF
        FFFFFFFFFF000000FFFFFF800000800000800000800000800000800000FFFFFF
        0000FFFFFFFFFFFF000000808000808000808000000000FFFFFFFFFFFF000000
        FFFFFFFFFFFF800000800000800000800000800000FFFFFF0000FFFFFFFFFFFF
        000000808000808000000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFF
        FF800000800000FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF0000008080000000
        00FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF800000FF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFF000000000000000000000000000000000000000000000000
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000}
      Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = True
      OnClick = btCloseClick
    end
    object btCancel: TSpeedButton
      Left = 468
      Top = 2
      Width = 36
      Height = 40
      Hint = #21462#28040
      Caption = #21462#28040
      Enabled = False
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF005656560056565600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005656
        560092DC00007AB9000026262600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003E3E
        3E007AB90000AAFF25007AB9000026262600FFFFFF00FFFFFF00FFFFFF000000
        0000000000000000000000000000000000000000000056565600FFFFFF00FFFF
        FF003E3E3E0062960000AAFF25006296000056565600FFFFFF00FFFFFF003E3E
        3E007AB900007AB90000629600006296000056565600FFFFFF00FFFFFF00FFFF
        FF00FFFFFF005656560092DC000092DC000056565600FFFFFF00FFFFFF003E3E
        3E00C6FF6B008FFF6B007AB900006E6E6E00B6B6B600FFFFFF00FFFFFF00FFFF
        FF00FFFFFF007A7A7A007AB90000AAFF250026262600FFFFFF00FFFFFF003E3E
        3E00D4FF8E00ABFF8E00B8FF48006296000056565600FFFFFF00FFFFFF00FFFF
        FF00FFFFFF007A7A7A007AB90000D4FF8E0026262600FFFFFF00FFFFFF003E3E
        3E00E2FFB100AAAAAA0092DC0000AAFF25006296000056565600FFFFFF00FFFF
        FF00FFFFFF00565656007AB90000AAFF250026262600FFFFFF00FFFFFF005656
        560056565600B6B6B6005656560092DC0000D4FF8E0062960000565656003E3E
        3E003E3E3E006296000092DC000092DC000056565600FFFFFF00FFFFFF005656
        5600FFFFFF00FFFFFF00FFFFFF00565656007AB90000D4FF8E007AB900007AB9
        00007AB900007AB9000092DC0000629600007A7A7A00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00565656007AB9000092DC0000AAFF
        2500AAFF2500AAFF25007AB9000056565600FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007A7A7A00565656005656
        560056565600565656007A7A7A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = True
      OnClick = btCancelClick
    end
    object btPost: TSpeedButton
      Left = 504
      Top = 2
      Width = 36
      Height = 40
      Hint = #20445#23384
      Caption = #20445#23384
      Enabled = False
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00000000004A4A4A0000000000C2C2C200C2C2C2009E9E9E009E9E9E009E9E
        9E00000000004A4A4A004A4A4A0000000000FFFFFF00FFFFFF00FFFFFF000000
        00005656560056565600000000009E9E9E00C2C2C200C2C2C200C2C2C2009E9E
        9E0000000000565656004A4A4A0000000000FFFFFF00FFFFFF00FFFFFF000000
        00006262620056565600000000000E0E0E000E0E0E000E0E0E000E0E0E000E0E
        0E0000000000565656005656560000000000FFFFFF00FFFFFF00FFFFFF000000
        000062626200626262004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
        4A004A4A4A00626262005656560000000000FFFFFF00FFFFFF00FFFFFF000000
        00006E6E6E006E6E6E0062626200626262006262620062626200626262006262
        620062626200626262006262620000000000FFFFFF00FFFFFF00FFFFFF000000
        00007A7A7A006E6E6E006E6E6E006E6E6E006E6E6E006E6E6E006E6E6E006E6E
        6E006E6E6E006E6E6E006262620000000000FFFFFF00FFFFFF00FFFFFF000000
        00007A7A7A003232320032323200323232003232320032323200323232003232
        320032323200323232006E6E6E0000000000FFFFFF00FFFFFF00FFFFFF000000
        00008686860000000000E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6
        E600E6E6E600323232007A7A7A0000000000FFFFFF00FFFFFF00FFFFFF000000
        00009292920000000000E6E6E6004848FF006B6BFF008E8EFF00B1B1FF00B1B1
        FF00E6E6E600323232008686860000000000FFFFFF00FFFFFF00FFFFFF000000
        00009E9E9E0000000000E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6
        E600E6E6E600323232009292920000000000FFFFFF00FFFFFF00FFFFFF000000
        0000AAAAAA0000000000E6E6E6004848FF004848FF006B6BFF008E8EFF00B1B1
        FF00E6E6E600323232009E9E9E0000000000FFFFFF00FFFFFF00FFFFFF000000
        0000AAAAAA0000000000E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6
        E600E6E6E60032323200AAAAAA0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = True
      OnClick = btPostClick
    end
    object SpeedButton25: TSpeedButton
      Left = 540
      Top = 2
      Width = 104
      Height = 40
      Hint = #20445#23384
      Caption = #35774#32622#20135#37327#32479#35745#20179#24211
      Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton25Click
    end
  end
  object DataSource3: TDataSource
    DataSet = ADOQuery3
    Left = 285
    Top = 160
  end
  object ADOQuery3: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
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
    SQL.Strings = (
      
        'select ['#35774#22791#36131#20219#23567#32452'],isnull('#32500#20462#25104#26412',0)'#32500#20462#25104#26412',isnull('#32500#25252#25104#26412',0)'#32500#25252#25104#26412',isnull('#24037#31243#25104 +
        #26412',0)'#24037#31243#25104#26412','
      'isnull('#20844#29992#25104#26412',0)'#20844#29992#25104#26412','
      
        '(isnull('#32500#20462#25104#26412',0)+isnull('#32500#25252#25104#26412',0)+isnull('#24037#31243#25104#26412',0)+isnull('#20844#29992#25104#26412',0))as ' +
        '['#27719#24635#25104#26412'],'
      '(isnull('#32500#20462#25104#26412',0)+isnull('#32500#25252#25104#26412',0)+isnull('#20844#29992#25104#26412',0))as ['#32771#26680#25104#26412']'
      ' from '
      '(select ['#35774#22791#36131#20219#23567#32452'],['#31867#22411'],sum(isnull(['#37329#39069'('#26412#24065#21547#31246')],0))['#37329#39069'('#26412#24065#21547#31246')] from '
      '(select data0840.[Location] ['#35774#22791#36131#20219#23567#32452'],'
      
        'case dbo.DATA0268.ttype when 2 then '#39#32500#20462#25104#26412#39' when 3 then '#39#32500#25252#25104#26412#39' wh' +
        'en 4 then '#39#24037#31243#25104#26412#39' when 5 then '#39#20844#29992#25104#26412#39' end as ['#31867#22411'],'
      
        '['#37329#39069'('#26412#24065#21547#31246')]=(select sum(ROUND(dbo.Data0207.QUANTITY * dbo.Data002' +
        '2.tax_price * dbo.Data0456.exch_rate, 4))       '
      'from data0207 join data0022 on data0022.rkey=data0207.D0022_PTR '
      
        'JOIN Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY where ' +
        ' Data0207.D0468_ptr=Data0468.rkey '
      'and data0207.tdate>=:SD and data0207.tdate<:ED)'
      'FROM dbo.DATA0268 '
      'join data0840 on  DATA0268.[d840_ptr]=dbo.data0840.rkey '
      'join Data0468 on DATA0268.rkey=Data0468.FLOW_NO'
      'join data0015 on data0268.warehouse_ptr=data0015.rkey'
      
        'where  data0268.status =4 and dbo.DATA0268.ttype in (2,3,4,5))as' +
        ' t1'
      'group by ['#35774#22791#36131#20219#23567#32452'],['#31867#22411'] '
      ')as t2'
      'pivot (sum(['#37329#39069'('#26412#24065#21547#31246')]) for ['#31867#22411'] in ('#32500#20462#25104#26412','#32500#25252#25104#26412','#24037#31243#25104#26412','#20844#29992#25104#26412'))a')
    Left = 285
    Top = 120
    object ADOQuery3DSDesigner2: TStringField
      FieldName = #35774#22791#36131#20219#23567#32452
    end
    object ADOQuery3DSDesigner3: TBCDField
      FieldName = #32500#20462#25104#26412
      ReadOnly = True
      DisplayFormat = '0.00'
      Precision = 32
      Size = 8
    end
    object ADOQuery3DSDesigner4: TBCDField
      FieldName = #32500#25252#25104#26412
      ReadOnly = True
      DisplayFormat = '0.00'
      Precision = 32
      Size = 8
    end
    object ADOQuery3DSDesigner5: TBCDField
      FieldName = #24037#31243#25104#26412
      ReadOnly = True
      DisplayFormat = '0.00'
      Precision = 32
      Size = 8
    end
    object ADOQuery3DSDesigner6: TBCDField
      FieldName = #20844#29992#25104#26412
      ReadOnly = True
      DisplayFormat = '0.00'
      Precision = 32
      Size = 8
    end
    object ADOQuery3DSDesigner8: TBCDField
      FieldName = #32771#26680#25104#26412
      ReadOnly = True
      DisplayFormat = '0.00'
      Precision = 32
      Size = 8
    end
    object ADOQuery3DSDesigner7: TBCDField
      FieldName = #27719#24635#25104#26412
      ReadOnly = True
      DisplayFormat = '0.00'
      Precision = 32
      Size = 8
    end
  end
  object qry0015: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select RKEY,WAREHOUSE_CODE,ABBR_NAME from data0015')
    Left = 748
    Top = 488
    object qry0015RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
      Visible = False
    end
    object qry0015WAREHOUSE_CODE: TStringField
      DisplayLabel = #24037#21378#20195#30721
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object qry0015ABBR_NAME: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'ABBR_NAME'
      Size = 10
    end
  end
  object ADODataSet1: TADODataSet
    Connection = DM.ADOConnection1
    Parameters = <>
    Left = 628
    Top = 488
  end
  object qry_0840: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from data0840'
      'order by Location')
    Left = 693
    Top = 488
    object qry_0840rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
    object qry_0840Location: TStringField
      DisplayLabel = #35774#22791#36131#20219#23567#32452
      FieldName = 'Location'
    end
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    AfterOpen = ADOQuery1AfterOpen
    AfterClose = ADOQuery1AfterClose
    AfterPost = ADOQuery1AfterPost
    AfterScroll = ADOQuery1AfterScroll
    Parameters = <>
    SQL.Strings = (
      'select * from data0851')
    Left = 37
    Top = 113
    object ADOQuery1Rkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object ADOQuery1Years: TWordField
      DisplayLabel = #24180
      FieldName = 'Years'
    end
    object ADOQuery1Month: TWordField
      DisplayLabel = #26376
      FieldName = 'Month'
    end
  end
  object ClientDataSet1_1: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select Data0852.Rkey,D851_ptr,D840_ptr,Data0852.sumA,Data0852.Ta' +
      'rget,data0840.Location,data0015. ABBR_NAME,Data0852.D015_ptr'#13#10'  ' +
      'from Data0852'#13#10'  join data0840 on Data0852.[D840_ptr]=data0840.r' +
      'key'#13#10'  left join data0015 on Data0852.[D015_ptr]=data0015.rkey'#13#10 +
      '  where [D851_ptr]=:vD851_ptr'#13#10'  order by data0015. ABBR_NAME,da' +
      'ta0840.Location'
    Params = <
      item
        DataType = ftInteger
        Name = 'vD851_ptr'
        ParamType = ptUnknown
      end>
    ProviderName = 'DataSetProvider1_1'
    AfterOpen = ClientDataSet1_1AfterOpen
    BeforeInsert = ClientDataSet1_1BeforeInsert
    AfterInsert = ClientDataSet1_1AfterInsert
    AfterPost = ClientDataSet1_1AfterPost
    BeforeScroll = ClientDataSet1_1BeforeScroll
    OnReconcileError = ClientDataSet1_1ReconcileError
    Left = 119
    Top = 199
    object ClientDataSet1_1Rkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object ClientDataSet1_1D851_ptr: TIntegerField
      FieldName = 'D851_ptr'
    end
    object ClientDataSet1_1D840_ptr: TIntegerField
      FieldName = 'D840_ptr'
    end
    object ClientDataSet1_1Target: TBCDField
      DisplayLabel = #30446#26631#25104#26412
      FieldName = 'Target'
      Precision = 12
      Size = 2
    end
    object ClientDataSet1_1sumA: TBCDField
      DisplayLabel = #23454#38469#25104#26412
      FieldName = 'sumA'
      Precision = 12
      Size = 2
    end
    object ClientDataSet1_1Location: TStringField
      DisplayLabel = #35774#22791#36131#20219#23567#32452
      FieldName = 'Location'
      ProviderFlags = []
      OnChange = ClientDataSet1_1LocationChange
    end
    object ClientDataSet1_1ABBR_NAME: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'ABBR_NAME'
      ProviderFlags = []
      OnChange = ClientDataSet1_1ABBR_NAMEChange
      Size = 10
    end
    object ClientDataSet1_1D015_ptr: TIntegerField
      FieldName = 'D015_ptr'
    end
  end
  object DataSetProvider1_1: TDataSetProvider
    DataSet = ADOQuery1_1
    Options = [poAllowCommandText]
    AfterUpdateRecord = DataSetProvider1_1AfterUpdateRecord
    Left = 119
    Top = 156
  end
  object ADOQuery1_1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'vD851_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 119
    Top = 113
    object ADOQuery1_1Rkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object ADOQuery1_1D851_ptr: TIntegerField
      FieldName = 'D851_ptr'
    end
    object ADOQuery1_1D840_ptr: TIntegerField
      FieldName = 'D840_ptr'
    end
    object ADOQuery1_1sumA: TBCDField
      FieldName = 'sumA'
      Precision = 12
      Size = 2
    end
    object ADOQuery1_1Target: TBCDField
      FieldName = 'Target'
      Precision = 12
      Size = 2
    end
    object ADOQuery1_1Location: TStringField
      FieldName = 'Location'
      ProviderFlags = []
    end
    object ADOQuery1_1ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      ProviderFlags = []
      Size = 10
    end
    object ADOQuery1_1D015_ptr: TIntegerField
      FieldName = 'D015_ptr'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    OnStateChange = DataSource1StateChange
    Left = 37
    Top = 157
  end
  object ds1_1: TDataSource
    DataSet = ClientDataSet1_1
    Left = 114
    Top = 242
  end
  object ADOQuery1_1_1: TADOQuery
    Connection = DM.ADOConnection1
    Parameters = <
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
      end
      item
        Name = 'Location_ptr'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'warehouse_ptr'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'declare @SD datetime,@ED datetime,@Location_ptr integer,@warehou' +
        'se_ptr integer'
      'set @SD=:SD'
      'set @ED=:ED'
      'set @Location_ptr=:Location_ptr'
      'set @warehouse_ptr=:warehouse_ptr'
      
        'select sum(ROUND(dbo.Data0207.QUANTITY * dbo.Data0022.tax_price ' +
        '* dbo.Data0456.exch_rate, 4))       '
      'from data0207 join data0022 on data0022.rkey=data0207.D0022_PTR '
      'JOIN Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY '
      'where  Data0207.D0468_ptr in '
      '  (select Data0468.rkey FROM dbo.DATA0268 '
      'join data0840 on DATA0268.[d840_ptr]=dbo.data0840.rkey '
      'join Data0468 on DATA0268.rkey=Data0468.FLOW_NO'
      'join data0015 on data0268.warehouse_ptr=data0015.rkey'
      'where DATA0268.DATE>=@SD and DATA0268.DATE<=@ED'
      'and DATA0268.D840_ptr=@Location_ptr'
      'and data0268.status =4 and dbo.DATA0268.ttype in (2,3,4,5)'
      'and data0268.warehouse_ptr=@warehouse_ptr )'
      'and data0207.tdate>=@SD and data0207.tdate<@ED')
    Left = 115
    Top = 317
  end
  object PopupMenu2: TPopupMenu
    OnPopup = PopupMenu2Popup
    Left = 221
    Top = 343
    object N_New: TMenuItem
      Caption = #26032#24314
      Visible = False
      OnClick = N_NewClick
    end
    object N_save: TMenuItem
      Caption = #20445#23384
      OnClick = N_saveClick
    end
    object N_cancel: TMenuItem
      Caption = #21462#28040
      OnClick = N_cancelClick
    end
    object N_delete: TMenuItem
      Caption = #21024#38500
      OnClick = N_DeleteClick
    end
  end
  object ADOQuery1_2: TADOQuery
    Connection = DM.ADOConnection1
    Parameters = <
      item
        Name = 'SD'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @SD datetime,@ED datetime'
      'set @SD=:SD'
      'set @ED=dateadd(Month,1,@SD)'
      '--,'#31995#32479#24403#21069#26085#26399'>'#32467#26463#26085#26399'+1'#22825','#25191#34892#19979#38754#30340#26597#35810#12290
      'if getdate()>DateAdd(day,1,@ED)'
      'begin'
      ' select --D268.warehouse_ptr,d15.ABBR_NAME,'
      
        ' D268.D840_ptr,D840.location,sum(d07.QUANTITY* D22.tax_price * D' +
        '456.exch_rate)  A'
      ' from data0207 d07  '
      ' left join data0468 D468 on d07.D0468_PTR=D468.rkey'
      ' left join data0268 D268 on D468.FLOW_NO=D268.rkey'
      ' left join data0840 D840 on D268.D840_ptr=D840.rkey'
      '  left join data0022 D22 on D22.rkey=d07.D0022_PTR '
      '  left JOIN Data0456 D456 ON D22.GRN_PTR =D456.RKEY'
      '  left join data0015 d15 on d15.rkey =D268.warehouse_ptr'
      ' where d07.TDATE>=@SD and d07.TDATE<@ED'
      'and D268.status =4 and D268.ttype in (2,3,5)'
      ' and D268.rkey in  (select rkey from data0268 '
      
        ' where data0268.[date]>DateAdd(year,-1,@sd) and D840_ptr is not ' +
        'null )'
      ' group by --D268.warehouse_ptr,d15.ABBR_NAME,'
      ' D268.D840_ptr,D840.location'
      ' order by --D268.warehouse_ptr,d15.ABBR_NAME,'
      ' D268.D840_ptr,D840.location'
      'end '
      'else'
      'select Null'#9#9
      '')
    Left = 38
    Top = 199
  end
  object ADOQuery2: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    AfterOpen = ADOQuery2AfterOpen
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 208
    Top = 115
  end
  object ADOQuery2_1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <
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
    SQL.Strings = (
      'declare @sql varchar(8000),@SD datetime,@ED datetime'
      'set @SD=:SD'
      'set @ED=:ED'
      'select @sql=isnull(@sql+'#39','#39','#39#39')+Location from data0840 '
      'select '#39'select * from ( '
      ' select data0840.Location as '#36131#20219#23567#32452' ,'#39#39#23450#26399#20445#20859#26102#38388#39#39'as '#39#39#32479#35745#39033#30446#39#39','
      
        'SumTime=(select isnull(sum(data0831.TimeCons),0)  from data0417 ' +
        ' '
      #9#9' join data0831 on data0831.DeviNumb=dbo.DATA0417.FASSET_CODE'
      #9#9' where data0417.D840_ptr=data0840.rkey '
      
        #9#9' and data0831.ActuCompTime>='#39#39#39'+CONVERT(varchar(100), @SD, 20)' +
        '+'#39#39#39' '
      
        #9#9' and data0831.ActuCompTime<'#39#39#39'+CONVERT(varchar(100), @ED, 20)+' +
        #39#39#39')'
      ' from data0840'
      ')as t1 '
      '  pivot (sum(SumTime) for   '#36131#20219#23567#32452'  in ('#39'+@sql+'#39'))a  '
      '   union all  '
      '   select * from '
      '   (  select data0840.Location as '#36131#20219#23567#32452','#39#39#32500#20462#20572#26426#32791#26102#39#39'as '#39#39#32479#35745#39033#30446#39#39','
      
        '   SumTime=(select isnull(sum(DATA0567.maintain_house ),0)from d' +
        'ata0567'
      #9#9'   join data0417 on data0567.FASSET_PTR=dbo.DATA0417.rkey'
      #9#9'   where DATA0567.D840_ptr=data0840.rkey '
      
        #9#9'   and data0567.complete_date>='#39#39#39'+CONVERT(varchar(100), @SD, ' +
        '20)+'#39#39#39' '
      
        #9#9'   and data0567.complete_date<'#39#39#39'+CONVERT(varchar(100), @ED, 2' +
        '0)+'#39#39#39' '
      
        #9#9'   and data0417.EquiType=1 and failure_degree in ('#39#39#29983#20135#20572#39039#39#39') ) ' +
        ' '
      '   from data0840'
      '  )as t1  '
      '   pivot (sum(SumTime) for   '#36131#20219#23567#32452'  in ('#39'+@sql+'#39'))a '
      '    union all  '
      '    select * from '
      '    (  select data0840.Location as '#36131#20219#23567#32452','#39#39#25925#38556#20572#26426#32791#26102#39#39'as '#39#39#32479#35745#39033#30446#39#39','
      
        '    SumTime=(select isnull(sum(datediff(ss,data0567.ent_date,dat' +
        'a0567.complete_date) )/3600,0) from data0567   '
      #9#9#9' join data0417 on data0567.FASSET_PTR=dbo.DATA0417.rkey  '
      #9#9#9' where DATA0567.D840_ptr=data0840.rkey'
      
        #9#9#9' and data0567.complete_date>='#39#39#39'+CONVERT(varchar(100), @SD, 2' +
        '0)+'#39#39#39' '
      
        #9#9#9' and data0567.complete_date<'#39#39#39'+CONVERT(varchar(100), @ED, 20' +
        ')+'#39#39#39' '
      #9#9#9' and data0417.EquiType=1 and failure_degree='#39#39#29983#20135#20572#39039#39#39')  '
      '    from data0840)as t1  '
      '    pivot (sum(SumTime) for   '#36131#20219#23567#32452'  in ('#39'+@sql+'#39'))a      '
      '    UNION all  '
      #9'select * from ('
      
        #9'select DATA0417.RKEY,data0840.Location as '#36131#20219#23567#32452','#39#39#35774#22791#21488#25968#39#39'as '#39#39#32479#35745#39033 +
        #30446#39#39
      #9'from data0417 '
      #9'left join data0840 on data0417.D840_ptr=data0840.rkey'
      #9'where  data0417.EquiType=1 and DATA0417.active_flag IN(2,3)'
      #9'and data0417 .confi_date<'#39#39#39'+CONVERT(varchar(100), @ED, 20)+'#39#39#39
      #9'group by DATA0417.RKEY,data0840.Location )as t1'
      #9'pivot (count(RKEY) for '#9#36131#20219#23567#32452'  in ('#39'+@sql+'#39'))a'#39)
    Left = 208
    Top = 200
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 208
    Top = 158
  end
  object ADOQuery1_3: TADOQuery
    Parameters = <>
    SQL.Strings = (
      'declare @SD datetime,@ED datetime'
      'set @SD=:sd'
      '--select dateadd(Month,1,@SD)'
      'set @ED=dateadd(Month,1,@SD)'
      
        'select DATA0268.warehouse_ptr,data0015.ABBR_NAME,DATA0268.D840_p' +
        'tr,data0840.Location,'
      
        'a=sum(ROUND(dbo.Data0207.QUANTITY * dbo.Data0022.tax_price * dbo' +
        '.Data0456.exch_rate, 4))       '
      'from data0207 join data0022 on data0022.rkey=data0207.D0022_PTR '
      'JOIN Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY'
      'join Data0468 on  Data0468.rkey= Data0207.D0468_ptr'
      'join DATA0268 on  DATA0268.rkey=Data0468.FLOW_NO '
      'join data0015 on data0268.warehouse_ptr=data0015.rkey'
      'join data0840 on DATA0268.[d840_ptr]=dbo.data0840.rkey '
      'where data0207.tdate>=@SD and data0207.tdate<@ED'
      'and data0268.status =4 and dbo.DATA0268.ttype in (2,3,4,5)'
      
        'group by DATA0268.warehouse_ptr,data0015.ABBR_NAME,DATA0268.D840' +
        '_ptr,data0840.Location')
    Left = 38
    Top = 241
  end
  object ADOQuery4: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
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
    SQL.Strings = (
      'declare @sd datetime ,@ed datetime '
      'set @sd=:SD'
      'set @ed=:ED'
      
        '   select data0015.ABBR_NAME '#24037#21378',data0034.DEPT_CODE '#37096#38376',data0034.D' +
        'EPT_NAME '#21517#31216','
      '   T1.'#25925#38556#20572#26426#32791#26102',t1.'#32500#20462#20572#26426#32791#26102' from '
      #9#9'(select data0417.DEPT_PTR,data0417.warehouse_ptr,'
      
        #9#9#25925#38556#20572#26426#32791#26102'=isnull(sum(datediff(ss,data0567.ent_date,data0567.compl' +
        'ete_date) )/3600,0) ,'
      #9#9#32500#20462#20572#26426#32791#26102'=isnull(sum(data0567.maintain_house ),0) '
      #9#9'from data0567  '
      #9#9'join data0417  on  data0567.FASSET_PTR=dbo.DATA0417.rkey'
      #9#9'left join data0034 on data0417.DEPT_PTR=data0034.rkey'
      
        #9#9'where  data0567.complete_date>=@SD and data0567.complete_date<' +
        '@ED'
      #9#9'and data0417.EquiType=1 and data0567.failure_degree ='#39#29983#20135#20572#39039#39#9
      #9#9'group by data0417.DEPT_PTR,data0417.warehouse_ptr)as t1'
      #9'join data0015 on t1.warehouse_ptr=data0015.rkey'
      #9'join data0034 on t1.DEPT_PTR=data0034.rkey')
    Left = 348
    Top = 125
    object ADOQuery4DSDesigner: TStringField
      FieldName = #24037#21378
      Size = 10
    end
    object ADOQuery4DSDesigner2: TStringField
      FieldName = #37096#38376
      Size = 10
    end
    object ADOQuery4DSDesigner3: TStringField
      FieldName = #21517#31216
      Size = 30
    end
    object ADOQuery4DSDesigner4: TIntegerField
      FieldName = #25925#38556#20572#26426#32791#26102
      ReadOnly = True
    end
    object ADOQuery4DSDesigner5: TBCDField
      FieldName = #32500#20462#20572#26426#32791#26102
      ReadOnly = True
      Precision = 32
      Size = 2
    end
  end
  object DataSource4: TDataSource
    DataSet = ADOQuery4
    Left = 356
    Top = 173
  end
  object ADOQuery1_4: TADOQuery
    Parameters = <>
    SQL.Strings = (
      'declare @SD datetime,@ED datetime'
      'set @SD=:SD'
      'set @ED=dateadd(Month,1,@SD)'
      
        'select DATA0268.warehouse_ptr,data0015.ABBR_NAME,DATA0268.D840_p' +
        'tr,data0840.Location,'
      ' sum(dbo.SumD207( Data0468.rkey,@SD,@ED)) A'
      'from Data0468 '
      'join DATA0268 on  DATA0268.rkey=Data0468.FLOW_NO '
      'join data0015 on data0268.warehouse_ptr=data0015.rkey'
      'join data0840 on DATA0268.[d840_ptr]=dbo.data0840.rkey '
      'where data0268.status =4 and dbo.DATA0268.ttype in (2,3,5)'
      'and data0268.date>=dateadd(day,-90, @SD) and data0268.date<=@ED'
      
        'group by DATA0268.warehouse_ptr,data0015.ABBR_NAME,DATA0268.D840' +
        '_ptr,data0840.Location'
      'having sum(dbo.SumD207( Data0468.rkey,@SD,@ED))>0')
    Left = 38
    Top = 310
  end
  object ADOQuery5: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    AfterOpen = ADOQuery5AfterOpen
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 427
    Top = 126
  end
  object DataSource5: TDataSource
    DataSet = ADOQuery5
    Left = 427
    Top = 174
  end
  object ADOQuery5_1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <
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
    SQL.Strings = (
      'declare @sql varchar(8000),@SD datetime,@ED datetime'
      'set @SD=:SD'
      'set @ED=:ED'
      'select @sql=isnull(@sql+'#39','#39','#39#39')+Location from data0840 '
      'select '#39'select * from ( '
      ' select data0840.Location as '#36131#20219#23567#32452' ,'#39#39#23450#26399#20445#20859#26102#38388#39#39'as '#39#39#32479#35745#39033#30446#39#39','
      
        'SumTime=(select isnull(sum(data0831.TimeCons),0)  from data0417 ' +
        ' '
      #9#9' join data0831 on data0831.DeviNumb=dbo.DATA0417.FASSET_CODE'
      
        #9#9' where data0417.D840_ptr=data0840.rkey  and data0417.equipment' +
        '_grade='#39#39#20851#38190#39#39' '
      
        #9#9' and data0831.ActuCompTime>='#39#39#39'+CONVERT(varchar(100), @SD, 20)' +
        '+'#39#39#39' '
      
        #9#9' and data0831.ActuCompTime<'#39#39#39'+CONVERT(varchar(100), @ED, 20)+' +
        #39#39#39')'
      ' from data0840'
      ')as t1 '
      '  pivot (sum(SumTime) for   '#36131#20219#23567#32452'  in ('#39'+@sql+'#39'))a  '
      '   union all  '
      '   select * from '
      '   (  select data0840.Location as '#36131#20219#23567#32452','#39#39#32500#20462#20572#26426#32791#26102#39#39'as '#39#39#32479#35745#39033#30446#39#39','
      
        '   SumTime=(select isnull(sum(DATA0567.maintain_house ),0)from d' +
        'ata0567'
      #9#9'   join data0417 on data0567.FASSET_PTR=dbo.DATA0417.rkey'
      
        #9#9'   where DATA0567.D840_ptr=data0840.rkey  and data0417.equipme' +
        'nt_grade='#39#39#20851#38190#39#39
      
        #9#9'   and data0567.complete_date>='#39#39#39'+CONVERT(varchar(100), @SD, ' +
        '20)+'#39#39#39' '
      
        #9#9'   and data0567.complete_date<'#39#39#39'+CONVERT(varchar(100), @ED, 2' +
        '0)+'#39#39#39' '
      
        #9#9'   and data0417.EquiType=1 and failure_degree in ('#39#39#29983#20135#20572#39039#39#39') ) ' +
        ' '
      '   from data0840'
      '  )as t1  '
      '   pivot (sum(SumTime) for   '#36131#20219#23567#32452'  in ('#39'+@sql+'#39'))a '
      '    union all  '
      '    select * from '
      '    (  select data0840.Location as '#36131#20219#23567#32452','#39#39#25925#38556#20572#26426#32791#26102#39#39'as '#39#39#32479#35745#39033#30446#39#39','
      
        '    SumTime=(select isnull(sum(datediff(ss,data0567.ent_date,dat' +
        'a0567.complete_date) )/3600,0) from data0567   '
      #9#9#9' join data0417 on data0567.FASSET_PTR=dbo.DATA0417.rkey  '
      
        #9#9#9' where DATA0567.D840_ptr=data0840.rkey and data0417.equipment' +
        '_grade='#39#39#20851#38190#39#39
      
        #9#9#9' and data0567.complete_date>='#39#39#39'+CONVERT(varchar(100), @SD, 2' +
        '0)+'#39#39#39' '
      
        #9#9#9' and data0567.complete_date<'#39#39#39'+CONVERT(varchar(100), @ED, 20' +
        ')+'#39#39#39' '
      #9#9#9' and data0417.EquiType=1 and failure_degree='#39#39#29983#20135#20572#39039#39#39')  '
      '    from data0840)as t1  '
      '    pivot (sum(SumTime) for   '#36131#20219#23567#32452'  in ('#39'+@sql+'#39'))a      '
      '    UNION all  '
      #9'select * from ('
      
        #9'select DATA0417.RKEY,data0840.Location as '#36131#20219#23567#32452','#39#39#35774#22791#21488#25968#39#39'as '#39#39#32479#35745#39033 +
        #30446#39#39
      #9'from data0417 '
      
        #9'left join data0840 on data0417.D840_ptr=data0840.rkey  and data' +
        '0417.equipment_grade='#39#39#20851#38190#39#39
      #9'where  data0417.EquiType=1 and DATA0417.active_flag IN(2,3)'
      #9'and data0417 .confi_date<'#39#39#39'+CONVERT(varchar(100), @ED, 20)+'#39#39#39
      #9'group by DATA0417.RKEY,data0840.Location )as t1'
      #9'pivot (count(RKEY) for '#9#36131#20219#23567#32452'  in ('#39'+@sql+'#39'))a'#39)
    Left = 427
    Top = 214
  end
  object ADOQuery6: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    AfterOpen = ADOQuery6AfterOpen
    AfterScroll = ADOQuery6AfterScroll
    Parameters = <
      item
        Name = 'SD'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'ED'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'SELECT  dbo.Data0015.ABBR_NAME AS ['#24037#21378'],'
      'DATA0268.number '#30003#39046#21333#21495',data0840.[Location]['#35774#22791#36131#20219#23567#32452'],  '
      'dbo.Data0017.INV_PART_NUMBER['#26448#26009#32534#30721'],'
      
        'Data0017.INV_PART_DESCRIPTION ['#26448#26009#21517#31216'/'#35268#26684'],data0002.unit_name      ' +
        '    ['#21333#20301'],'
      'dbo.DATA0268.[DATE] ['#30003#35831#26085#26399'],dbo.Data0468.QUAN_BOM       ['#30003#39046#25968#37327'], '
      'Data0207.TDATE '#21457#26009#26085#26399',Data0207.QUANTITY '#21457#26009#25968#37327','
      
        'ROUND(dbo.Data0207.QUANTITY * dbo.Data0022.tax_price * dbo.Data0' +
        '456.exch_rate, 4)['#37329#39069'('#26412#24065#21547#31246')],'
      
        'ROUND(dbo.Data0207.QUANTITY * dbo.Data0022.price * dbo.Data0456.' +
        'exch_rate, 4)['#37329#39069'('#26412#24065#19981#21547#31246')],'
      
        'case dbo.Data0468.PRINTIT when '#39'Y'#39'then '#39#26222#36890#24211#23384#39' when '#39'N'#39' then '#39'VMI' +
        #24211#23384#39' END AS '#26159#21542'VMI,      '
      'dbo.Data0468.VENDOR         ['#20379#24212#21830'],'
      
        'case dbo.DATA0268.ttype when 2 then '#39#32500#20462#39' when 3 then '#39#32500#25252#39' when 4' +
        ' then '#39#24037#31243#39' when 5 then '#39#20844#29992#39' end as ['#31867#22411'], '
      
        'dbo.Data0005.EMPLOYEE_NAME AS ['#30003#39046#21592#24037#21517#31216'],dbo.Data0094.PURCHASE_APP' +
        'ROV_DESC ['#23457#25209#27969#31243'],'
      'data0034.DEPT_NAME ['#35774#22791#25152#22312#37096#38376'],'
      'Case when dbo.DATA0268.TTYPE=2 then(d17_2.FASSET_CODE) '
      
        '     when dbo.DATA0268.TTYPE=3 then(data0831.DeviNumb) end as ['#35774 +
        #22791#32534#21495'], '
      'Case when dbo.DATA0268.TTYPE=2 then(d17_2.FASSET_NAME) '
      
        '     when dbo.DATA0268.TTYPE=3 then(d17_1.FASSET_NAME) end as ['#35774 +
        #22791#21517#31216'],'
      
        ' dbo.data0567.NUMBER as      ['#32500#20462#21333#21333#21495'],    dbo.data0831.PlanMainDa' +
        'te ['#20445#20859#26085#26399'],    '
      'dbo.data0831.MainCycl       ['#20445#20859#21608#26399'],'
      'data0567.failure_circs'#9#25925#38556#24773#20917#35828#26126','
      'data0567.maintain_text'#9#32500#20462#35760#24405#35828#26126','
      'data0567.maintain_empl'#9#21442#20110#32500#20462#20154#21592','
      'data0831.MainImpl '#20445#20859#20154'   '
      'FROM dbo.DATA0268'
      'join data0840 on  DATA0268.[d840_ptr]=dbo.data0840.rkey '
      'join Data0468 on DATA0268.rkey=Data0468.FLOW_NO'
      'join data0015 on data0268.warehouse_ptr=data0015.rkey'
      'JOIN Data0207 on Data0207.D0468_ptr=Data0468.rkey'
      'join data0022 on data0022.rkey=data0207.D0022_PTR '
      'JOIN Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY'
      'join data0034 on data0034.rkey=DATA0268.dept_ptr'
      'join dbo.Data0017 ON dbo.Data0468.INVENT_PTR = dbo.Data0017.RKEY'
      'join data0002 on data0017.STOCK_UNIT_PTR=data0002.rkey '
      
        'INNER JOIN dbo.Data0005 ON dbo.DATA0268.EMPL_PTR = dbo.Data0005.' +
        'RKEY '
      
        'INNER JOIN dbo.Data0094 ON dbo.DATA0268.auth_ptr = dbo.Data0094.' +
        'RKEY '
      'left join dbo.data0831 on DATA0268.[d831_ptr]=dbo.data0831.rkey '
      'left join data0417 d17_1 on d17_1.FASSET_CODE=data0831.DeviNumb '
      'left join dbo.data0567 on DATA0268.[d567_ptr]=dbo.data0567.rkey'
      'left join data0417 d17_2 on d17_2.rkey=data0567.FASSET_PTR'
      'WHERE Data0268.TTYPE IN (2,3,4,5) and data0268.status =4 '
      'AND Data0207.TDATE>=:SD and Data0207.TDATE<=:ED '
      
        'order by dbo.Data0015.ABBR_NAME,data0034.DEPT_NAME,DATA0268.numb' +
        'er ')
    Left = 497
    Top = 125
    object ADOQuery6DSDesigner: TStringField
      FieldName = #24037#21378
      Size = 10
    end
    object ADOQuery6DSDesigner3: TStringField
      FieldName = #30003#39046#21333#21495
      Size = 10
    end
    object ADOQuery6DSDesigner4: TStringField
      FieldName = #35774#22791#36131#20219#23567#32452
    end
    object ADOQuery6DSDesigner5: TStringField
      FieldName = #26448#26009#32534#30721
      Size = 25
    end
    object ADOQuery6DSDesigner6: TStringField
      FieldName = #26448#26009#21517#31216'/'#35268#26684
      ReadOnly = True
      Size = 100
    end
    object ADOQuery6DSDesigner7: TStringField
      FieldName = #21333#20301
    end
    object ADOQuery6DSDesigner8: TDateTimeField
      FieldName = #30003#35831#26085#26399
    end
    object ADOQuery6DSDesigner9: TFloatField
      FieldName = #30003#39046#25968#37327
    end
    object ADOQuery6DSDesigner10: TDateTimeField
      FieldName = #21457#26009#26085#26399
    end
    object ADOQuery6DSDesigner11: TBCDField
      FieldName = #21457#26009#25968#37327
      Precision = 19
    end
    object ADOQuery6DSDesigner12: TBCDField
      FieldName = #37329#39069'('#26412#24065#21547#31246')'
      ReadOnly = True
      Precision = 32
      Size = 8
    end
    object ADOQuery6DSDesigner26: TBCDField
      FieldName = #37329#39069'('#26412#24065#19981#21547#31246')'
      ReadOnly = True
      Precision = 32
      Size = 8
    end
    object ADOQuery6VMI: TStringField
      FieldName = #26159#21542'VMI'
      ReadOnly = True
      Size = 8
    end
    object ADOQuery6DSDesigner13: TStringField
      FieldName = #20379#24212#21830
      Size = 15
    end
    object ADOQuery6DSDesigner14: TStringField
      FieldName = #31867#22411
      ReadOnly = True
      Size = 4
    end
    object ADOQuery6DSDesigner15: TStringField
      FieldName = #30003#39046#21592#24037#21517#31216
      Size = 16
    end
    object ADOQuery6DSDesigner16: TStringField
      FieldName = #23457#25209#27969#31243
      Size = 40
    end
    object ADOQuery6DSDesigner17: TStringField
      FieldName = #35774#22791#25152#22312#37096#38376
      Size = 30
    end
    object ADOQuery6DSDesigner18: TStringField
      FieldName = #35774#22791#32534#21495
      ReadOnly = True
    end
    object ADOQuery6DSDesigner19: TStringField
      FieldName = #35774#22791#21517#31216
      ReadOnly = True
      Size = 30
    end
    object ADOQuery6DSDesigner20: TStringField
      FieldName = #32500#20462#21333#21333#21495
      Size = 15
    end
    object ADOQuery6DSDesigner21: TDateTimeField
      FieldName = #20445#20859#26085#26399
    end
    object ADOQuery6DSDesigner22: TStringField
      FieldName = #20445#20859#21608#26399
      Size = 10
    end
    object ADOQuery6DSDesigner2: TStringField
      FieldName = #25925#38556#24773#20917#35828#26126
      Size = 200
    end
    object ADOQuery6DSDesigner23: TStringField
      FieldName = #32500#20462#35760#24405#35828#26126
      Size = 200
    end
    object ADOQuery6DSDesigner24: TStringField
      FieldName = #21442#20110#32500#20462#20154#21592
      Size = 50
    end
    object ADOQuery6DSDesigner25: TWideStringField
      FieldName = #20445#20859#20154
    end
  end
  object DataSource6: TDataSource
    DataSet = ADOQuery6
    Left = 497
    Top = 176
  end
  object DataSetProvider7: TDataSetProvider
    DataSet = ADODataSet7
    Options = [poAutoRefresh, poPropogateChanges, poAllowCommandText]
    AfterUpdateRecord = DataSetProvider7AfterUpdateRecord
    Left = 582
    Top = 175
  end
  object ClientDataSet7: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select data0840.Location,data0015. ABBR_NAME,Data0853.*'#13#10'  from ' +
      'Data0853'#13#10'  join data0840 on Data0853.[D840_ptr]=data0840.rkey'#13#10 +
      ' left join data0015 on Data0853.[D015_ptr]=data0015.rkey'#13#10'  wher' +
      'e [D851_ptr]=:vD851_ptr'#13#10'  order by data0015. ABBR_NAME,data0840' +
      '.Location'
    FieldDefs = <
      item
        Name = 'Location'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ABBR_NAME'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Rkey'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'D015_ptr'
        DataType = ftInteger
      end
      item
        Name = 'D851_ptr'
        DataType = ftInteger
      end
      item
        Name = 'D840_ptr'
        DataType = ftInteger
      end
      item
        Name = 'H'
        DataType = ftInteger
      end
      item
        Name = 'D'
        DataType = ftInteger
      end
      item
        Name = 'TS'
        DataType = ftInteger
      end
      item
        Name = 'Scrapped'
        DataType = ftFloat
      end
      item
        Name = 'ScrappedTarget'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'vD851_ptr'
        ParamType = ptUnknown
      end>
    ProviderName = 'DataSetProvider7'
    StoreDefs = True
    AfterOpen = ClientDataSet7AfterOpen
    AfterInsert = ClientDataSet7AfterInsert
    BeforeScroll = ClientDataSet7BeforeScroll
    OnCalcFields = ClientDataSet7CalcFields
    OnReconcileError = ClientDataSet7ReconcileError
    Left = 582
    Top = 223
    object ClientDataSet7Shutdown: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Shutdown'
      OnGetText = ClientDataSet7DowntimeGetText
      Calculated = True
    end
    object ClientDataSet7Service: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Service'
      OnGetText = ClientDataSet7DowntimeGetText
      Calculated = True
    end
    object ClientDataSet7Plan: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Plan'
      OnGetText = ClientDataSet7DowntimeGetText
      Calculated = True
    end
    object ClientDataSet7Downtime: TFloatField
      DisplayLabel = #20572#26426#25925#38556'|'#23454#38469'%'
      FieldKind = fkCalculated
      FieldName = 'Downtime'
      OnGetText = ClientDataSet7DowntimeGetText
      Calculated = True
    end
    object ClientDataSet7NotDowntime: TFloatField
      FieldKind = fkCalculated
      FieldName = 'NotDowntime'
      OnGetText = ClientDataSet7DowntimeGetText
      Calculated = True
    end
    object ClientDataSet7Location: TStringField
      DisplayLabel = #35774#22791#36131#20219#23567#32452
      FieldName = 'Location'
      ProviderFlags = []
      OnChange = ClientDataSet7LocationChange
    end
    object ClientDataSet7ABBR_NAME: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'ABBR_NAME'
      ProviderFlags = []
      OnChange = ClientDataSet7ABBR_NAMEChange
      Size = 10
    end
    object ClientDataSet7Rkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object ClientDataSet7D015_ptr: TIntegerField
      FieldName = 'D015_ptr'
    end
    object ClientDataSet7D840_ptr: TIntegerField
      FieldName = 'D840_ptr'
    end
    object ClientDataSet7D851_ptr: TIntegerField
      FieldName = 'D851_ptr'
    end
    object ClientDataSet7H: TIntegerField
      FieldName = 'H'
    end
    object ClientDataSet7D: TIntegerField
      FieldName = 'D'
    end
    object ClientDataSet7TS: TIntegerField
      FieldName = 'TS'
    end
    object ClientDataSet7Scrapped: TFloatField
      FieldName = 'Scrapped'
      OnGetText = ClientDataSet7ServiceTargetGetText
    end
    object ClientDataSet7ScrappedTarget: TFloatField
      FieldName = 'ScrappedTarget'
      OnGetText = ClientDataSet7ServiceTargetGetText
    end
    object ClientDataSet7Shutdown_D: TFloatField
      FieldName = 'Shutdown_D'
      DisplayFormat = '0.0'
    end
    object ClientDataSet7ShutdownTarget: TFloatField
      FieldName = 'ShutdownTarget'
      OnGetText = ClientDataSet7ServiceTargetGetText
    end
    object ClientDataSet7Service_D: TFloatField
      FieldName = 'Service_D'
      DisplayFormat = '0.0'
    end
    object ClientDataSet7ServiceTarget: TFloatField
      FieldName = 'ServiceTarget'
      OnGetText = ClientDataSet7ServiceTargetGetText
    end
    object ClientDataSet7Plan_D: TFloatField
      FieldName = 'Plan_D'
      DisplayFormat = '0.0'
    end
    object ClientDataSet7PlanTarget: TFloatField
      FieldName = 'PlanTarget'
      OnGetText = ClientDataSet7ServiceTargetGetText
    end
    object ClientDataSet7mainStanTime: TFloatField
      FieldName = 'mainStanTime'
    end
    object ClientDataSet7Outflow: TFloatField
      FieldName = 'Outflow'
      OnGetText = ClientDataSet7ServiceTargetGetText
    end
    object ClientDataSet7OutflowTarget: TFloatField
      FieldName = 'OutflowTarget'
      OnGetText = ClientDataSet7ServiceTargetGetText
    end
    object ClientDataSet7Downtime_D: TFloatField
      FieldName = 'Downtime_D'
      DisplayFormat = '0.0'
    end
    object ClientDataSet7DowntimeTarget: TFloatField
      FieldName = 'DowntimeTarget'
      OnGetText = ClientDataSet7ServiceTargetGetText
    end
    object ClientDataSet7NotDowntime_D: TFloatField
      FieldName = 'NotDowntime_D'
      DisplayFormat = '0.0'
    end
    object ClientDataSet7NotDowntimeTarget: TFloatField
      FieldName = 'NotDowntimeTarget'
      OnGetText = ClientDataSet7ServiceTargetGetText
    end
  end
  object DataSource7: TDataSource
    DataSet = ClientDataSet7
    Left = 582
    Top = 263
  end
  object PopupMenu1: TPopupMenu
    Left = 141
    Top = 351
    object MenuItem1: TMenuItem
      Caption = #26032#24314
      OnClick = MenuItem1Click
    end
    object MenuItem2: TMenuItem
      Caption = #20445#23384
      OnClick = MenuItem2Click
    end
    object MenuItem3: TMenuItem
      Caption = #21462#28040
      OnClick = MenuItem3Click
    end
    object MenuItem4: TMenuItem
      Caption = #21024#38500
      OnClick = MenuItem4Click
    end
  end
  object DtRead: TADODataSet
    Connection = DM.ADOConnection1
    Parameters = <>
    Left = 812
    Top = 494
  end
  object ADOQuery7_2: TADOQuery
    Connection = DM.ADOConnection1
    Parameters = <
      item
        Name = 'SD'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'declare @SD datetime,@ED datetime,@d015_ptr int ,@vMonth int ,@v' +
        'Year int'
      'set @SD=:SD'
      'set @ED=dateadd(Month,1,@SD)'
      
        'select @vMonth=Month(dateadd(Month,-1,@SD)),@vYear=Year(dateadd(' +
        'Month,-1,@SD))'
      '--,'#31995#32479#24403#21069#26085#26399'>'#32467#26463#26085#26399'+1'#22825','#25191#34892#19979#38754#30340#26597#35810#12290
      'if getdate()>DateAdd(day,1,@ED)'
      'begin'
      '    select  t4.*,t7.*,isnull(t3.TS,0)ts   from '
      '    (select data0840.rkey,data0840.Location,'
      '    '
      
        #9#9'(select isnull(sum(datediff(ss,T1.ent_date,T1.complete_date) )' +
        '/3600,0) '
      #9#9'from data0567 as T1 '
      #9#9'join data0417  on  T1.FASSET_PTR=dbo.DATA0417.rkey'
      
        #9#9'where T1.D840_ptr=data0840.rkey and T1.complete_date>=@SD and ' +
        'T1.complete_date<@ED'
      #9#9'and data0417.EquiType=1 and T1.failure_degree='#39#29983#20135#20572#39039#39
      #9#9')as TJGZ'#9',--'#20572#26426#25925#38556#32791#26102#26597#35810#32467#26524#21644#21407#20540#19981#23545' '
      #9#9'   '
      #9#9'(select isnull(sum(data0567.maintain_house ),0)'
      #9#9'from data0567  '
      
        #9#9'join data0417  on  data0567.FASSET_PTR=dbo.DATA0417.rkey '#9#9#9#9#9 +
        #9
      
        #9#9'WHERE data0567.D840_ptr=data0840.rkey and data0567.complete_da' +
        'te>=@SD and data0567.complete_date<@ED'
      #9#9'and data0417.EquiType=1 and data0567.failure_degree='#39#29983#20135#20572#39039#39
      #9#9')as TD,'#9'--'#20572#26426#32500#20462#32791#26102#26597#35810#32467#26524#21644#21407#20540#19981#23545
      #9#9' '
      
        #9#9'(select isnull(sum(datediff(ss,T1.ent_date,T1.complete_date) )' +
        '/3600,0) '
      #9#9'from data0567 as T1 '
      #9#9'join data0417  on  T1.FASSET_PTR=dbo.DATA0417.rkey'
      
        #9#9'where T1.D840_ptr=data0840.rkey and T1.complete_date>=@SD and ' +
        'T1.complete_date<@ED'
      
        #9#9'and data0417.EquiType=1 and T1.failure_degree in ('#39#29983#20135#20572#39039#39','#39#24433#21709#29983#20135 +
        #39','#39#20173#21487#29983#20135#39')'#9
      #9#9')as FTJGZ,--'#26410#20572#26426#25925#38556#32791#26102#26597#35810#32467#26524#21644#21407#20540#19981#23545
      #9#9#9#9
      #9#9'(select isnull(sum(data0567.maintain_house ),0)'
      #9#9'from data0567  '
      
        #9#9'join data0417  on  data0567.FASSET_PTR=dbo.DATA0417.rkey '#9#9#9#9#9 +
        #9
      
        #9#9'WHERE data0567.D840_ptr=data0840.rkey and data0567.complete_da' +
        'te>=@SD and data0567.complete_date<@ED'
      
        #9#9'and data0417.EquiType=1 and data0567.failure_degree in ('#39#29983#20135#20572#39039#39 +
        ','#39#24433#21709#29983#20135#39','#39#20173#21487#29983#20135#39')'
      #9#9')as YX'#9',--'#26410#20572#26426#32500#20462#32791#26102#26597#35810#32467#26524#21644#21407#20540#19981#23545
      #9#9
      #9#9'(select isnull(sum(data0831.TimeCons),0)'
      #9#9'from data0417 as D831_417  '
      #9#9'join data0831 on data0831.DeviNumb=D831_417.FASSET_CODE'
      #9#9'where D831_417.D840_ptr=data0840.rkey and  '
      
        #9#9'data0831.ActuCompTime>=@SD and data0831.ActuCompTime<@ED )as S' +
        'BBY,--'#20445#20859#35745#21010#23454#38469#32791#26102
      #9#9
      #9#9'(select isnull(sum(data0831.StdTimeCons),0)'
      #9#9'from data0417 as D831_417  '
      #9#9'join data0831 on data0831.DeviNumb=D831_417.FASSET_CODE'
      
        #9#9'where D831_417.D840_ptr=data0840.rkey and data0831.ActuCompTim' +
        'e>=@SD and data0831.ActuCompTime<@ED '
      #9#9')as StdTimeCons--'#20445#20859#35745#21010#26631#20934#32791#26102
      #9#9
      #9'from data0840'
      '                where data0840.[active]=1'
      #9'group by data0840.rkey,data0840.Location'
      #9')'
      '        as t4'
      #9#9'left join '
      #9#9'(SELECT D17.D840_ptr,isnull(COUNT(D17.RKEY),0) TS'
      
        #9#9'from data0417 AS D17 WHERE  d17.EquiType=1 and D17.active_flag' +
        ' IN (2,3)'
      '                               and d17.confi_date<@ED'
      #9#9'group by D17.D840_ptr'
      #9#9')as t3  '
      '        on  T3.D840_ptr=t4.rkey'#9
      '        '
      
        #9#9'left join (select d840_ptr,data0853.H,data0853.D,data0853.Shut' +
        'downTarget,data0853.ServiceTarget,'
      
        #9#9'data0853.ScrappedTarget,data0853.PlanTarget,data0853.OutflowTa' +
        'rget,data0853.DowntimeTarget,data0853.NotDowntimeTarget'
      #9#9'from data0851'
      #9#9'join data0853 on data0853.d851_ptr='#9'data0851.rkey'
      #9#9'and data0851.Years=@vyear and data0851.[month]=@vMonth'
      #9#9
      #9#9')as t7 on t4.rkey=t7.d840_ptr        '
      'end'
      'else'
      'select Null')
    Left = 583
    Top = 319
  end
  object DataSetProvider8: TDataSetProvider
    DataSet = ADODataSet8
    Options = [poAutoRefresh, poPropogateChanges, poAllowCommandText]
    AfterUpdateRecord = DataSetProvider8AfterUpdateRecord
    Left = 678
    Top = 175
  end
  object ClientDataSet8: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select data0840.Location,data0015. ABBR_NAME,Data0854.*'#13#10'  from ' +
      'Data0854'#13#10'  join data0840 on Data0854.[D840_ptr]=data0840.rkey'#13#10 +
      ' left  join data0015 on Data0854.[D015_ptr]=data0015.rkey'#13#10'  whe' +
      're [D851_ptr]=:vD851_ptr'#13#10'  order by data0015. ABBR_NAME,data084' +
      '0.Location'
    Params = <
      item
        DataType = ftInteger
        Name = 'vD851_ptr'
        ParamType = ptUnknown
      end>
    ProviderName = 'DataSetProvider8'
    AfterOpen = ClientDataSet8_1AfterOpen
    AfterInsert = ClientDataSet8_1AfterInsert
    BeforeScroll = ClientDataSet8BeforeScroll
    OnCalcFields = ClientDataSet8CalcFields
    OnReconcileError = ClientDataSet8ReconcileError
    Left = 678
    Top = 223
    object ClientDataSet8Location: TStringField
      DisplayLabel = #35774#22791#36131#20219#23567#32452
      FieldName = 'Location'
    end
    object ClientDataSet8ABBR_NAME: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ClientDataSet8Rkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object ClientDataSet8D015_ptr: TIntegerField
      FieldName = 'D015_ptr'
    end
    object ClientDataSet8D851_ptr: TIntegerField
      FieldName = 'D851_ptr'
    end
    object ClientDataSet8D840_ptr: TIntegerField
      FieldName = 'D840_ptr'
    end
    object ClientDataSet8H: TIntegerField
      DisplayLabel = #23567#26102
      FieldName = 'H'
    end
    object ClientDataSet8D: TIntegerField
      DisplayLabel = #22825
      FieldName = 'D'
    end
    object ClientDataSet8TS: TIntegerField
      DisplayLabel = #21488#25968
      FieldName = 'TS'
    end
    object ClientDataSet8mainStanTime: TFloatField
      FieldName = 'mainStanTime'
    end
    object ClientDataSet8Shutdown: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Shutdown'
      OnGetText = ClientDataSet8ShutdownGetText
      Calculated = True
    end
    object ClientDataSet8Service: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Service'
      OnGetText = ClientDataSet8ShutdownGetText
      Calculated = True
    end
    object ClientDataSet8Plan: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Plan'
      OnGetText = ClientDataSet8ShutdownGetText
      Calculated = True
    end
    object ClientDataSet8Downtime: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Downtime'
      OnGetText = ClientDataSet8ShutdownGetText
      Calculated = True
    end
    object ClientDataSet8NotDowntime: TFloatField
      FieldKind = fkCalculated
      FieldName = 'NotDowntime'
      OnGetText = ClientDataSet8ShutdownGetText
      Calculated = True
    end
    object ClientDataSet8ShutdownTarget: TFloatField
      FieldName = 'ShutdownTarget'
      OnGetText = ClientDataSet8ShutdownGetText
    end
    object ClientDataSet8ServiceTarget: TFloatField
      FieldName = 'ServiceTarget'
      OnGetText = ClientDataSet8ShutdownGetText
    end
    object ClientDataSet8Scrapped: TFloatField
      FieldName = 'Scrapped'
      OnGetText = ClientDataSet8ShutdownGetText
    end
    object ClientDataSet8ScrappedTarget: TFloatField
      FieldName = 'ScrappedTarget'
      OnGetText = ClientDataSet8ShutdownGetText
    end
    object ClientDataSet8PlanTarget: TFloatField
      FieldName = 'PlanTarget'
      OnGetText = ClientDataSet8ShutdownGetText
    end
    object ClientDataSet8Outflow: TFloatField
      FieldName = 'Outflow'
    end
    object ClientDataSet8OutflowTarget: TFloatField
      FieldName = 'OutflowTarget'
      OnGetText = ClientDataSet8ShutdownGetText
    end
    object ClientDataSet8DowntimeTarget: TFloatField
      FieldName = 'DowntimeTarget'
      OnGetText = ClientDataSet8ShutdownGetText
    end
    object ClientDataSet8NotDowntimeTarget: TFloatField
      FieldName = 'NotDowntimeTarget'
      OnGetText = ClientDataSet8ShutdownGetText
    end
    object ClientDataSet8Shutdown_D: TFloatField
      FieldName = 'Shutdown_D'
      DisplayFormat = '0.0'
    end
    object ClientDataSet8Service_D: TFloatField
      FieldName = 'Service_D'
      DisplayFormat = '0.0'
    end
    object ClientDataSet8Plan_D: TFloatField
      FieldName = 'Plan_D'
      DisplayFormat = '0.0'
    end
    object ClientDataSet8Downtime_D: TFloatField
      FieldName = 'Downtime_D'
      DisplayFormat = '0.0'
    end
    object ClientDataSet8NotDowntime_D: TFloatField
      FieldName = 'NotDowntime_D'
      DisplayFormat = '0.0'
    end
  end
  object DataSource8: TDataSource
    DataSet = ClientDataSet8
    Left = 678
    Top = 271
  end
  object ADOQuery8_2: TADOQuery
    Connection = DM.ADOConnection1
    Parameters = <
      item
        Name = 'SD'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'declare @SD datetime,@ED datetime,@d015_ptr int ,@vMonth int ,@v' +
        'Year int'
      'set @SD=:SD'
      'set @ED=dateadd(Month,1,@SD)'
      
        'select @vMonth=Month(dateadd(Month,-1,@SD)),@vYear=Year(dateadd(' +
        'Month,-1,@SD))'
      '--,'#31995#32479#24403#21069#26085#26399'>'#32467#26463#26085#26399'+1'#22825','#25191#34892#19979#38754#30340#26597#35810#12290
      'if getdate()>DateAdd(day,1,@ED)'
      'begin'
      '    select t4.*,t7.*,isnull(t3.TS,0)ts from '
      '    (select data0840.rkey,data0840.Location ,'
      #9#9'(select isnull(sum(data0567.maintain_house ),0)'
      #9#9'from data0567  '
      
        #9#9'join data0417  on  data0567.FASSET_PTR=dbo.DATA0417.rkey '#9#9#9#9#9 +
        #9
      
        #9#9'WHERE data0567.D840_ptr=data0840.rkey and data0567.complete_da' +
        'te>=@SD and data0567.complete_date<@ED'
      
        #9#9'and data0417.EquiType=1 and data0567.failure_degree='#39#29983#20135#20572#39039#39' AND' +
        ' data0417.equipment_grade='#39#20851#38190#39
      #9#9')as TD,'#9'--'#20572#26426#32500#20462#32791#26102#26597#35810#32467#26524#21644#21407#20540#19981#23545
      #9#9
      #9#9'(select isnull(sum(data0567.maintain_house ),0)'
      #9#9'from data0567  '
      
        #9#9'join data0417  on  data0567.FASSET_PTR=dbo.DATA0417.rkey '#9#9#9#9#9 +
        #9
      
        #9#9'WHERE data0567.D840_ptr=data0840.rkey and data0567.complete_da' +
        'te>=@SD and data0567.complete_date<@ED'
      
        #9#9'and data0417.EquiType=1 and data0567.failure_degree in ('#39#29983#20135#20572#39039#39 +
        ','#39#24433#21709#29983#20135#39','#39#20173#21487#29983#20135#39')'
      #9#9' AND data0417.equipment_grade='#39#20851#38190#39
      #9#9')as YX'#9',--'#26410#20572#26426#32500#20462#32791#26102#26597#35810#32467#26524#21644#21407#20540#19981#23545
      #9#9
      
        #9#9'(select isnull(sum(datediff(ss,T1.ent_date,T1.complete_date) )' +
        '/3600,0) '
      #9#9'from data0567 as T1 '
      #9#9'join data0417  on  T1.FASSET_PTR=dbo.DATA0417.rkey'
      
        #9#9'where T1.D840_ptr=data0840.rkey and T1.complete_date>=@SD and ' +
        'T1.complete_date<@ED'
      
        #9#9'and data0417.EquiType=1 and T1.failure_degree='#39#29983#20135#20572#39039#39' AND data0' +
        '417.equipment_grade='#39#20851#38190#39
      #9#9')as TJGZ'#9',--'#20572#26426#25925#38556#32791#26102#26597#35810#32467#26524#21644#21407#20540#19981#23545
      #9#9' '
      
        #9#9'(select isnull(sum(datediff(ss,T1.ent_date,T1.complete_date) )' +
        '/3600,0) '
      #9#9'from data0567 as T1 '
      #9#9'join data0417  on  T1.FASSET_PTR=dbo.DATA0417.rkey'
      
        #9#9'where T1.D840_ptr=data0840.rkey and T1.complete_date>=@SD and ' +
        'T1.complete_date<@ED'
      
        #9#9'and data0417.EquiType=1 and T1.failure_degree in ('#39#29983#20135#20572#39039#39','#39#24433#21709#29983#20135 +
        #39','#39#20173#21487#29983#20135#39')'#9
      #9#9' AND data0417.equipment_grade='#39#20851#38190#39
      #9#9')as FTJGZ,--'#26410#20572#26426#25925#38556#32791#26102#26597#35810#32467#26524#21644#21407#20540#19981#23545#9
      #9#9#9
      #9#9'(select isnull(sum(data0831.TimeCons),0)'
      #9#9'from data0417 as D831_417  '
      #9#9'join data0831 on data0831.DeviNumb=D831_417.FASSET_CODE'
      #9#9'where D831_417.D840_ptr=data0840.rkey and  '
      #9#9'data0831.ActuCompTime>=@SD and data0831.ActuCompTime<@ED'
      #9#9'AND D831_417.equipment_grade='#39#20851#38190#39' )as SBBY,--'#20445#20859#35745#21010#23454#38469#32791#26102
      #9#9
      #9#9'(select isnull(sum(data0831.StdTimeCons),0)'
      #9#9'from data0417 as D831_417  '
      #9#9'join data0831 on data0831.DeviNumb=D831_417.FASSET_CODE'
      
        #9#9'where D831_417.D840_ptr=data0840.rkey and data0831.ActuCompTim' +
        'e>=@SD and data0831.ActuCompTime<@ED '
      #9#9'AND D831_417.equipment_grade='#39#20851#38190#39' )as StdTimeCons--'#20445#20859#35745#21010#26631#20934#32791#26102
      #9#9
      #9'from data0840'
      '               where data0840.[active]=1'
      #9'group by data0840.rkey,data0840.Location)'
      '        as t4'
      #9#9'left join '
      #9#9'(SELECT D17.D840_ptr,COUNT(D17.RKEY) TS'
      
        #9#9'from data0417 AS D17 WHERE  d17.EquiType=1 and D17.active_flag' +
        ' IN (2,3)'
      '        and d17.confi_date<@ED  AND D17.equipment_grade='#39#20851#38190#39
      #9#9'group by D17.D840_ptr'
      #9#9')as t3  '
      '        on  T3.D840_ptr=t4.rkey'#9
      '        '
      
        #9#9'left join (select d840_ptr,data0854.H,data0854.D,data0854.Shut' +
        'downTarget,data0854.ServiceTarget,'
      
        #9#9'data0854.ScrappedTarget,data0854.PlanTarget,data0854.OutflowTa' +
        'rget,data0854.DowntimeTarget,data0854.NotDowntimeTarget'
      #9#9'from data0851'
      #9#9'join data0854 on data0854.d851_ptr='#9'data0851.rkey'
      #9#9'and data0851.Years=@vYear and data0851.[month]=@vMonth'
      #9#9
      #9#9')as t7 on t4.rkey=t7.d840_ptr         '
      'end'
      'else'
      'select Null')
    Left = 679
    Top = 311
  end
  object PopupMenu3: TPopupMenu
    Left = 309
    Top = 343
    object MenuItem5: TMenuItem
      Caption = #26032#24314
      Visible = False
      OnClick = MenuItem5Click
    end
    object MenuItem6: TMenuItem
      Caption = #20445#23384
      OnClick = MenuItem6Click
    end
    object MenuItem7: TMenuItem
      Caption = #21462#28040
      OnClick = MenuItem7Click
    end
    object MenuItem8: TMenuItem
      Caption = #21024#38500
      OnClick = MenuItem8Click
    end
  end
  object ADOQuery9: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    Left = 789
    Top = 126
    object ADOQuery9ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      ProviderFlags = []
      Size = 10
    end
    object ADOQuery9Rkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object ADOQuery9Years: TIntegerField
      FieldName = 'Years'
    end
    object ADOQuery9Month: TWordField
      FieldName = 'Month'
    end
    object ADOQuery9ManuNumb: TIntegerField
      FieldName = 'ManuNumb'
    end
    object ADOQuery9Producti: TBCDField
      FieldName = 'Producti'
      Precision = 12
      Size = 2
    end
    object ADOQuery9OutpValu: TBCDField
      FieldName = 'OutpValu'
      Precision = 12
      Size = 2
    end
    object ADOQuery9DeviNumb: TIntegerField
      FieldName = 'DeviNumb'
    end
    object ADOQuery9DeviWork: TIntegerField
      FieldName = 'DeviWork'
    end
    object ADOQuery9WorkDays: TBCDField
      FieldName = 'WorkDays'
      Precision = 9
      Size = 2
    end
    object ADOQuery9D015_ptr: TIntegerField
      FieldName = 'D015_ptr'
    end
  end
  object ADOQuery9_1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'D856_ptr'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    Left = 888
    Top = 126
    object ADOQuery9_1Location: TStringField
      FieldName = 'Location'
      ProviderFlags = []
    end
    object ADOQuery9_1Rkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object ADOQuery9_1D856_ptr: TIntegerField
      FieldName = 'D856_ptr'
    end
    object ADOQuery9_1D840_ptr: TIntegerField
      FieldName = 'D840_ptr'
    end
    object ADOQuery9_1NumbDevi: TBCDField
      FieldName = 'NumbDevi'
      Precision = 12
      Size = 5
    end
    object ADOQuery9_1Separati: TBCDField
      FieldName = 'Separati'
      Precision = 12
      Size = 5
    end
    object ADOQuery9_1TotaHour: TBCDField
      FieldName = 'TotaHour'
      Precision = 12
      Size = 5
    end
    object ADOQuery9_1StafResiTarg: TBCDField
      FieldName = 'StafResiTarg'
      Precision = 12
      Size = 5
    end
    object ADOQuery9_1ManaDeviTarg: TBCDField
      FieldName = 'ManaDeviTarg'
      Precision = 12
      Size = 5
    end
    object ADOQuery9_1VacaDaysActu: TBCDField
      FieldName = 'VacaDaysActu'
      Precision = 12
      Size = 5
    end
    object ADOQuery9_1VacaDaysTarg: TBCDField
      FieldName = 'VacaDaysTarg'
      Precision = 12
      Size = 5
    end
    object ADOQuery9_1ManaDeviQTY: TIntegerField
      FieldName = 'ManaDeviQTY'
    end
    object ADOQuery9_1WorkDays: TBCDField
      FieldName = 'WorkDays'
      Precision = 9
      Size = 2
    end
  end
  object DataSetProvider9: TDataSetProvider
    DataSet = ADOQuery9
    Constraints = False
    Options = [poAutoRefresh, poPropogateChanges, poAllowCommandText]
    AfterUpdateRecord = DataSetProvider9AfterUpdateRecord
    Left = 788
    Top = 175
  end
  object ClientDataSet9: TClientDataSet
    Aggregates = <>
    CommandText = 
      ' SELECT data0015.ABBR_NAME,[Data0856].* FROM data0856'#13#10'left  joi' +
      'n data0015 on data0856.d015_ptr=data0015.rkey'#13#10' order by data085' +
      '6.Years,data0856.[Month],data0015.ABBR_NAME'
    Params = <>
    ProviderName = 'DataSetProvider9'
    AfterOpen = ClientDataSet9AfterOpen
    BeforePost = ClientDataSet9BeforePost
    BeforeScroll = ClientDataSet9BeforeScroll
    AfterScroll = ClientDataSet9AfterScroll
    OnCalcFields = ClientDataSet9CalcFields
    OnReconcileError = ClientDataSet9ReconcileError
    Left = 788
    Top = 223
    object ClientDataSet9ABBR_NAME: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'ABBR_NAME'
      OnChange = ClientDataSet9ABBR_NAMEChange
      Size = 10
    end
    object ClientDataSet9Rkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object ClientDataSet9Years: TIntegerField
      DisplayLabel = #24180
      FieldName = 'Years'
      OnChange = ClientDataSet9YearsChange
    end
    object ClientDataSet9Month: TSmallintField
      DisplayLabel = #26376
      FieldName = 'Month'
      OnChange = ClientDataSet9YearsChange
    end
    object ClientDataSet9ManuNumb: TIntegerField
      DisplayLabel = #21046#36896#24635#20154#25968
      FieldName = 'ManuNumb'
    end
    object ClientDataSet9DeviNumb: TIntegerField
      DisplayLabel = #35774#22791#37096#24635#20154#25968
      FieldName = 'DeviNumb'
    end
    object ClientDataSet9Producti: TBCDField
      DisplayLabel = #24635#20135#37327
      FieldName = 'Producti'
      Precision = 12
      Size = 2
    end
    object ClientDataSet9OutpValu: TBCDField
      DisplayLabel = #24635#20135#20540
      FieldName = 'OutpValu'
      Precision = 12
      Size = 2
    end
    object ClientDataSet9ManuPropNumb: TBCDField
      DisplayLabel = #35774#22791#20154#25968#21344#21046#36896#20154#25968#27604#20363
      FieldKind = fkCalculated
      FieldName = 'ManuPropNumb'
      OnGetText = ClientDataSet9ManuPropNumbGetText
      Precision = 12
      Size = 5
      Calculated = True
    end
    object ClientDataSet9AverYiel: TBCDField
      DisplayLabel = #20154#22343#20135#37327
      FieldKind = fkCalculated
      FieldName = 'AverYiel'
      Precision = 12
      Size = 5
      Calculated = True
    end
    object ClientDataSet9Aver_GDP: TBCDField
      DisplayLabel = #20154#22343#20135#20540
      FieldKind = fkCalculated
      FieldName = 'Aver_GDP'
      Precision = 12
      Size = 5
      Calculated = True
    end
    object ClientDataSet9HourWork: TBCDField
      DisplayLabel = #20154#22343#24037#26102
      FieldKind = fkCalculated
      FieldName = 'HourWork'
      Precision = 12
      Size = 5
      Calculated = True
    end
    object ClientDataSet9DeviWork: TIntegerField
      DisplayLabel = #35774#22791#37096#24635#24037#26102
      FieldName = 'DeviWork'
    end
    object ClientDataSet9WorkDays: TBCDField
      FieldName = 'WorkDays'
      Precision = 9
      Size = 2
    end
    object ClientDataSet9D015_ptr: TIntegerField
      FieldName = 'D015_ptr'
    end
  end
  object DataSource9: TDataSource
    DataSet = ClientDataSet9
    Left = 788
    Top = 279
  end
  object DataSetProvider9_1: TDataSetProvider
    DataSet = ADOQuery9_1
    Options = [poAutoRefresh, poPropogateChanges, poAllowCommandText]
    AfterUpdateRecord = DataSetProvider9_1AfterUpdateRecord
    BeforeUpdateRecord = DataSetProvider9_1BeforeUpdateRecord
    Left = 892
    Top = 175
  end
  object DataSource9_1: TDataSource
    DataSet = ClientDataSet9_1
    Left = 892
    Top = 271
  end
  object PopupMenu9_1: TPopupMenu
    Left = 892
    Top = 391
    object MenuItem9: TMenuItem
      Caption = #26032#24314
      Visible = False
      OnClick = MenuItem9Click
    end
    object MenuItem10: TMenuItem
      Caption = #20445#23384
      OnClick = MenuItem10Click
    end
    object MenuItem11: TMenuItem
      Caption = #21462#28040
      OnClick = MenuItem11Click
    end
    object MenuItem12: TMenuItem
      Caption = #21024#38500
      OnClick = MenuItem12Click
    end
  end
  object PopupMenu9: TPopupMenu
    Left = 381
    Top = 344
    object MenuItem13: TMenuItem
      Caption = #26032#24314
      Visible = False
      OnClick = MenuItem13Click
    end
    object MenuItem14: TMenuItem
      Caption = #20445#23384
      OnClick = MenuItem14Click
    end
    object MenuItem15: TMenuItem
      Caption = #21462#28040
      OnClick = MenuItem15Click
    end
    object MenuItem16: TMenuItem
      Caption = #21024#38500
      OnClick = MenuItem16Click
    end
  end
  object ADOQuery9_3: TADOQuery
    Connection = DM.ADOConnection1
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'SD'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'd015_ptr'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @SD datetime,@ED datetime,@d015_ptr int '
      'set @SD=:SD'
      'set @d015_ptr=:d015_ptr'
      'set @ED=dateadd(Month,1,@SD)   '
      
        'SELECT isnull(MJ,0)as MJ,isnull(HSJE,0)as HSJE, isnull(SBRS,0)as' +
        ' SBRS,isnull(WorkTime,0)as WorkTime,'
      'isnull(workdays,0)as workdays  FROM ('#9#9
      
        'select sum(ROUND(dbo.Data0053.QUANTITY * dbo.Data0025.unit_sq, 4' +
        ')) AS MJ,'
      
        'HSJE= Sum((CASE WHEN DATA0060_2.PART_PRICE >= 0 THEN ROUND(DATA0' +
        '060_2.PARTS_ALLOC '
      
        '* (1 + Data0060_2.RUSH_CHARGE * 0.01)  / Data0060_2.EXCH_RATE, 6' +
        ') '
      '         ELSE Data0025.LATEST_PRICE END)*dbo.Data0053.QUANTITY) '
      'from Data0053 '
      'left join Data0025 on Data0053.CUST_PART_PTR=Data0025.RKEY'
      
        'left OUTER JOIN Data0060 as Data0060_2 on Data0060_2.RKEY = dbo.' +
        'Data0053.barcode_ptr'
      'join data0016 on Data0053.LOC_ptr=data0016.rkey '
      'and Data0016.[Statistics] = 1'
      
        '--and data0016.LOCATION in ('#39#20108#21378#25104#21697#20179#39','#39#19968#21378#25104#21697#20179'('#21452#38754')'#39','#39#19968#21378#25104#21697#20179'('#21333#38754')'#39','#39#25104#21697#20179 +
        #39','#39#20116#26666#20135#25104#21697#20179#39','#39#24555#26495#20135#25104#21697#20179#39')'
      'WHERE (dbo.Data0053.QUANTITY > 0) and '
      
        'Data0053.mfg_date>=convert(char(10),@SD,120) and Data0053.mfg_da' +
        'te<convert(char(10),@ED,120)'
      'and data0053.rma_ptr=0 and data0053.WHSE_PTR=@d015_ptr)as t1'
      'JOIN '
      '(SELECT COUNT(data0855.rkey )as SBRS from data0855 '
      'join data0840 on data0855.D840_ptr=data0840.rkey'
      'and data0840.D015_ptr=@d015_ptr'
      
        'where data0855.EntrDate<=dateadd(day,-1,convert(char(10),@ED,120' +
        ')) AND '
      
        '     ((data0855.DepaDate IS NULL)or(data0855.DepaDate<dateadd(da' +
        'y,-1,convert(char(10),@ED,120))))'
      ' and data0840.[OutsPrep]<>1)as t2 on 1=1'
      'JOIN '
      '(    select  SUM(WorkTime)WorkTime FROM'
      #9#9'(select TOP (100) PERCENT '
      
        #9#9'Case when ((datepart(HH,data0842.BeginTime)<8)and(datepart(HH,' +
        'data0842.EndTime)>=8)and (data0842.DayShift=2))'
      
        #9#9'or((datepart(HH,data0842.BeginTime)<8)and(datepart(HH,data0842' +
        '.EndTime)<8)) '
      
        #9#9'then DateAdd(day,-1,dbo.data0842.WorkDate)else dbo.data0842.Wo' +
        'rkDate  end as WorkDate, '
      #9#9'data0842.WorkTime'
      #9#9'from data0842 '
      #9#9'join data0567 on data0567.rkey=data0842.Work_ptr'
      #9#9'join data0855 on data0842.Empl_ptr=data0855.D005_ptr'
      #9#9'join data0840 on data0855.D840_ptr=data0840.rkey'
      #9#9'and data0840.D015_ptr=@d015_ptr'
      
        #9#9'where data0840.[OutsPrep]<>1 and data0855.TTYPE<>1 and data084' +
        '0.[active]=1'
      #9#9'order by  data0842.WorkDate'
      #9#9'union all'
      #9#9'select TOP (100) PERCENT '
      
        #9#9'Case when ((datepart(HH,data0848.BeginTime)<8)and(datepart(HH,' +
        'data0848.EndTime)>=8)and (data0848.DayShift=2))'
      
        #9#9'or((datepart(HH,data0848.BeginTime)<8)and(datepart(HH,data0848' +
        '.EndTime)<8)) '
      
        #9#9'then DateAdd(day,-1,dbo.data0848.WorkDate)else dbo.data0848.Wo' +
        'rkDate  end as WorkDate, '
      #9#9'data0848.WorkTime'
      #9#9'from data0848 '
      #9#9'join data0831 on data0831.rkey=data0848.Work_ptr'
      #9#9'join data0417 on data0831.DeviNumb=data0417.FASSET_CODE'
      #9#9'join data0855 on data0848.Empl_ptr=data0855.D005_ptr'
      #9#9'join data0840 on data0855.D840_ptr=data0840.rkey'
      
        #9#9'where data0840.[OutsPrep]<>1 and data0855.TTYPE<>1 and data084' +
        '0.[active]=1'#9#9
      #9#9')as t1'
      #9'WHERE t1.WorkDate>=@SD  and t1.WorkDate<@ED'
      ')as t3 on 1=1'
      'join (select '
      #9#9#9' sum(isnull(rwt,0)/8.0) as workdays'
      #9#9#9' from onoffdutydata '
      
        #9#9#9' join employeemsg on employeemsg.rkey=onoffdutydata.employeei' +
        'd'
      #9#9#9' JOIN data0005 on data0005.ABBR_NAME=employeemsg.chinesename'
      
        #9#9#9' JOIN data0855 on data0855.D005_ptr=data0005.RKEY and data085' +
        '5. TTYPE<>1'
      #9#9#9' join data0840 on data0855.D840_ptr=data0840.rkey '
      #9#9#9' and data0840.OutsPrep'#9'<>1'#9'and data0840.D015_ptr=@d015_ptr'#9' '
      
        #9#9#9' where checkdate between convert(char(10),@SD,120)and dateadd' +
        '(day,-1,convert(char(10),@ED,120))'
      ')as t4 on 1=1')
    Left = 789
    Top = 334
  end
  object dtReadRkey: TADODataSet
    Connection = DM.ADOConnection1
    Parameters = <>
    Left = 880
    Top = 496
  end
  object ClientDataSet9_1: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT data0840.Location,[Data0857].* FROM [Data0857]'#13#10'join data' +
      '0840 on [Data0857].[D840_ptr]=data0840.rkey'#13#10'where [D856_ptr]=:D' +
      '856_ptr'
    FieldDefs = <
      item
        Name = 'Location'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Rkey'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'D856_ptr'
        DataType = ftInteger
      end
      item
        Name = 'D840_ptr'
        DataType = ftInteger
      end
      item
        Name = 'NumbDevi'
        DataType = ftBCD
        Precision = 12
        Size = 5
      end
      item
        Name = 'Separati'
        DataType = ftBCD
        Precision = 12
        Size = 5
      end
      item
        Name = 'TotaHour'
        DataType = ftBCD
        Precision = 12
        Size = 5
      end
      item
        Name = 'StafResiTarg'
        DataType = ftBCD
        Precision = 12
        Size = 5
      end
      item
        Name = 'ManaDeviTarg'
        DataType = ftBCD
        Precision = 12
        Size = 5
      end
      item
        Name = 'VacaDaysActu'
        DataType = ftBCD
        Precision = 12
        Size = 5
      end
      item
        Name = 'VacaDaysTarg'
        DataType = ftBCD
        Precision = 12
        Size = 5
      end
      item
        Name = 'ManaDeviQTY'
        DataType = ftInteger
      end
      item
        Name = 'WorkDays'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end>
    IndexDefs = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'D856_ptr'
        ParamType = ptUnknown
      end>
    ProviderName = 'DataSetProvider9_1'
    StoreDefs = True
    AfterInsert = ClientDataSet9_1AfterInsert
    BeforeScroll = ClientDataSet9_1BeforeScroll
    OnCalcFields = ClientDataSet9_1CalcFields
    OnReconcileError = ClientDataSet9_1ReconcileError
    Left = 892
    Top = 222
    object ClientDataSet9_1Location: TStringField
      DisplayLabel = #36131#20219#23567#32452
      FieldName = 'Location'
      ProviderFlags = []
    end
    object ClientDataSet9_1Rkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object ClientDataSet9_1D856_ptr: TIntegerField
      FieldName = 'D856_ptr'
    end
    object ClientDataSet9_1D840_ptr: TIntegerField
      FieldName = 'D840_ptr'
    end
    object ClientDataSet9_1NumbDevi: TBCDField
      DisplayLabel = #35774#22791#20154#25968
      FieldName = 'NumbDevi'
      Precision = 12
      Size = 5
    end
    object ClientDataSet9_1Separati: TBCDField
      DisplayLabel = #31163#32844#20154#25968
      FieldName = 'Separati'
      Precision = 12
      Size = 5
    end
    object ClientDataSet9_1TotaHour: TBCDField
      DisplayLabel = #24635#24037#26102
      FieldName = 'TotaHour'
      Precision = 12
      Size = 5
    end
    object ClientDataSet9_1StafResiActu: TFloatField
      DisplayLabel = #25104#21592#27969#22833#29575'|'#23454#38469
      FieldKind = fkCalculated
      FieldName = 'StafResiActu'
      OnGetText = ClientDataSet9_1StafResiActuGetText
      Calculated = True
    end
    object ClientDataSet9_1StafResiTarg: TBCDField
      DisplayLabel = #25104#21592#27969#22833#29575'|'#30446#26631
      FieldName = 'StafResiTarg'
      OnGetText = ClientDataSet9_1StafResiTargGetText
      Precision = 12
      Size = 5
    end
    object ClientDataSet9_1ManaDeviActu: TFloatField
      DisplayLabel = #20154#22343#31649#29702#35774#22791#21488#25968'|'#23454#38469
      FieldKind = fkCalculated
      FieldName = 'ManaDeviActu'
      Calculated = True
    end
    object ClientDataSet9_1ManaDeviTarg: TBCDField
      DisplayLabel = #20154#22343#31649#29702#35774#22791#21488#25968'|'#30446#26631
      FieldName = 'ManaDeviTarg'
      Precision = 12
      Size = 5
    end
    object ClientDataSet9_1VacaDaysActu: TBCDField
      DisplayLabel = #20154#22343#20241#20551#22825#25968'|'#23454#38469
      FieldName = 'VacaDaysActu'
      DisplayFormat = '0.0'
      Precision = 12
      Size = 5
    end
    object ClientDataSet9_1VacaDaysTarg: TBCDField
      DisplayLabel = #20154#22343#20241#20551#22825#25968'|'#30446#26631
      FieldName = 'VacaDaysTarg'
      DisplayFormat = '0.0'
      Precision = 12
      Size = 5
    end
    object ClientDataSet9_1ManaDeviQTY: TIntegerField
      DisplayLabel = #35774#22791#21488#25968
      FieldName = 'ManaDeviQTY'
      DisplayFormat = '0.'
    end
    object ClientDataSet9_1HourWork: TFloatField
      DisplayLabel = #20154#22343#24037#26102
      FieldKind = fkCalculated
      FieldName = 'HourWork'
      Calculated = True
    end
    object ClientDataSet9_1WorkDays: TBCDField
      FieldName = 'WorkDays'
      Precision = 9
      Size = 2
    end
  end
  object ADODataSet7: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'select data0840.Location,data0015. ABBR_NAME,Data0853.*'#13#10'  from ' +
      'Data0853'#13#10'  join data0840 on Data0853.[D840_ptr]=data0840.rkey'#13#10 +
      '  join data0015 on Data0853.[D015_ptr]=data0015.rkey'#13#10'  where [D' +
      '851_ptr]=:vD851_ptr'#13#10'  order by data0015. ABBR_NAME,data0840.Loc' +
      'ation'
    EnableBCD = False
    FieldDefs = <
      item
        Name = 'Location'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ABBR_NAME'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Rkey'
        Attributes = [faReadonly, faFixed]
        DataType = ftAutoInc
      end
      item
        Name = 'D015_ptr'
        Attributes = [faFixed]
        DataType = ftInteger
      end
      item
        Name = 'D851_ptr'
        Attributes = [faFixed]
        DataType = ftInteger
      end
      item
        Name = 'D840_ptr'
        Attributes = [faFixed]
        DataType = ftInteger
      end
      item
        Name = 'H'
        Attributes = [faFixed]
        DataType = ftInteger
      end
      item
        Name = 'D'
        Attributes = [faFixed]
        DataType = ftInteger
      end
      item
        Name = 'TS'
        Attributes = [faFixed]
        DataType = ftInteger
      end
      item
        Name = 'Shutdown_D'
        Attributes = [faFixed]
        DataType = ftFloat
      end
      item
        Name = 'ShutdownTarget'
        Attributes = [faFixed]
        DataType = ftFloat
      end
      item
        Name = 'Service_D'
        Attributes = [faFixed]
        DataType = ftFloat
      end
      item
        Name = 'ServiceTarget'
        Attributes = [faFixed]
        DataType = ftFloat
      end
      item
        Name = 'Scrapped'
        Attributes = [faFixed]
        DataType = ftFloat
      end
      item
        Name = 'ScrappedTarget'
        Attributes = [faFixed]
        DataType = ftFloat
      end
      item
        Name = 'Plan_D'
        Attributes = [faFixed]
        DataType = ftFloat
      end
      item
        Name = 'mainStanTime'
        Attributes = [faFixed]
        DataType = ftFloat
      end
      item
        Name = 'PlanTarget'
        Attributes = [faFixed]
        DataType = ftFloat
      end
      item
        Name = 'Outflow'
        Attributes = [faFixed]
        DataType = ftFloat
      end
      item
        Name = 'OutflowTarget'
        Attributes = [faFixed]
        DataType = ftFloat
      end
      item
        Name = 'Downtime_D'
        Attributes = [faFixed]
        DataType = ftFloat
      end
      item
        Name = 'DowntimeTarget'
        Attributes = [faFixed]
        DataType = ftFloat
      end
      item
        Name = 'NotDowntime_D'
        Attributes = [faFixed]
        DataType = ftFloat
      end
      item
        Name = 'NotDowntimeTarget'
        Attributes = [faFixed]
        DataType = ftFloat
      end>
    Parameters = <
      item
        Name = 'vD851_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    StoreDefs = True
    Left = 580
    Top = 126
    object ADODataSet7Location: TStringField
      FieldName = 'Location'
      ProviderFlags = []
    end
    object ADODataSet7ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      ProviderFlags = []
      Size = 10
    end
    object ADODataSet7Rkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object ADODataSet7D015_ptr: TIntegerField
      FieldName = 'D015_ptr'
    end
    object ADODataSet7D851_ptr: TIntegerField
      FieldName = 'D851_ptr'
    end
    object ADODataSet7D840_ptr: TIntegerField
      FieldName = 'D840_ptr'
    end
    object ADODataSet7H: TIntegerField
      FieldName = 'H'
    end
    object ADODataSet7D: TIntegerField
      FieldName = 'D'
    end
    object ADODataSet7TS: TIntegerField
      FieldName = 'TS'
    end
    object ADODataSet7Shutdown_D: TFloatField
      FieldName = 'Shutdown_D'
      ProviderFlags = [pfInUpdate]
    end
    object ADODataSet7ShutdownTarget: TFloatField
      FieldName = 'ShutdownTarget'
      ProviderFlags = [pfInUpdate]
    end
    object ADODataSet7Service_D: TFloatField
      FieldName = 'Service_D'
      ProviderFlags = [pfInUpdate]
    end
    object ADODataSet7ServiceTarget: TFloatField
      FieldName = 'ServiceTarget'
      ProviderFlags = [pfInUpdate]
    end
    object ADODataSet7Scrapped: TFloatField
      FieldName = 'Scrapped'
      ProviderFlags = [pfInUpdate]
    end
    object ADODataSet7ScrappedTarget: TFloatField
      FieldName = 'ScrappedTarget'
      ProviderFlags = [pfInUpdate]
    end
    object ADODataSet7Plan_D: TFloatField
      FieldName = 'Plan_D'
      ProviderFlags = [pfInUpdate]
    end
    object ADODataSet7mainStanTime: TFloatField
      FieldName = 'mainStanTime'
      ProviderFlags = [pfInUpdate]
    end
    object ADODataSet7PlanTarget: TFloatField
      FieldName = 'PlanTarget'
      ProviderFlags = [pfInUpdate]
    end
    object ADODataSet7Outflow: TFloatField
      FieldName = 'Outflow'
      ProviderFlags = [pfInUpdate]
    end
    object ADODataSet7OutflowTarget: TFloatField
      FieldName = 'OutflowTarget'
      ProviderFlags = [pfInUpdate]
    end
    object ADODataSet7Downtime_D: TFloatField
      FieldName = 'Downtime_D'
      ProviderFlags = [pfInUpdate]
    end
    object ADODataSet7DowntimeTarget: TFloatField
      FieldName = 'DowntimeTarget'
      ProviderFlags = [pfInUpdate]
    end
    object ADODataSet7NotDowntime_D: TFloatField
      FieldName = 'NotDowntime_D'
      ProviderFlags = [pfInUpdate]
    end
    object ADODataSet7NotDowntimeTarget: TFloatField
      FieldName = 'NotDowntimeTarget'
      ProviderFlags = [pfInUpdate]
    end
  end
  object ADODataSet8: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'select data0840.Location,data0015. ABBR_NAME,Data0854.*'#13#10'  from ' +
      'Data0854'#13#10'  join data0840 on Data0854.[D840_ptr]=data0840.rkey'#13#10 +
      '  join data0015 on Data0854.[D015_ptr]=data0015.rkey'#13#10'  where [D' +
      '851_ptr]=:vD851_ptr'#13#10'  order by data0015. ABBR_NAME,data0840.Loc' +
      'ation'
    EnableBCD = False
    FieldDefs = <
      item
        Name = 'Location'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ABBR_NAME'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Rkey'
        Attributes = [faReadonly, faFixed]
        DataType = ftAutoInc
      end
      item
        Name = 'D015_ptr'
        Attributes = [faFixed]
        DataType = ftInteger
      end
      item
        Name = 'D851_ptr'
        Attributes = [faFixed]
        DataType = ftInteger
      end
      item
        Name = 'D840_ptr'
        Attributes = [faFixed]
        DataType = ftInteger
      end
      item
        Name = 'H'
        Attributes = [faFixed]
        DataType = ftInteger
      end
      item
        Name = 'D'
        Attributes = [faFixed]
        DataType = ftInteger
      end
      item
        Name = 'TS'
        Attributes = [faFixed]
        DataType = ftInteger
      end
      item
        Name = 'Downtime_D'
        Attributes = [faFixed]
        DataType = ftFloat
      end
      item
        Name = 'DowntimeTarget'
        Attributes = [faFixed]
        DataType = ftFloat
      end
      item
        Name = 'Shutdown_D'
        Attributes = [faFixed]
        DataType = ftFloat
      end
      item
        Name = 'ShutdownTarget'
        Attributes = [faFixed]
        DataType = ftFloat
      end
      item
        Name = 'NotDowntime_D'
        Attributes = [faFixed]
        DataType = ftFloat
      end
      item
        Name = 'NotDowntimeTarget'
        Attributes = [faFixed]
        DataType = ftFloat
      end
      item
        Name = 'Service_D'
        Attributes = [faFixed]
        DataType = ftFloat
      end
      item
        Name = 'ServiceTarget'
        Attributes = [faFixed]
        DataType = ftFloat
      end
      item
        Name = 'Scrapped'
        Attributes = [faFixed]
        DataType = ftFloat
      end
      item
        Name = 'ScrappedTarget'
        Attributes = [faFixed]
        DataType = ftFloat
      end
      item
        Name = 'Plan_D'
        Attributes = [faFixed]
        DataType = ftFloat
      end
      item
        Name = 'mainStanTime'
        Attributes = [faFixed]
        DataType = ftFloat
      end
      item
        Name = 'PlanTarget'
        Attributes = [faFixed]
        DataType = ftFloat
      end
      item
        Name = 'Outflow'
        Attributes = [faFixed]
        DataType = ftFloat
      end
      item
        Name = 'OutflowTarget'
        Attributes = [faFixed]
        DataType = ftFloat
      end>
    Parameters = <
      item
        Name = 'vD851_ptr'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    StoreDefs = True
    Left = 684
    Top = 126
    object ADODataSet8Location: TStringField
      FieldName = 'Location'
      ProviderFlags = []
    end
    object ADODataSet8ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      ProviderFlags = []
      Size = 10
    end
    object ADODataSet8Rkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object ADODataSet8D015_ptr: TIntegerField
      FieldName = 'D015_ptr'
    end
    object ADODataSet8D851_ptr: TIntegerField
      FieldName = 'D851_ptr'
    end
    object ADODataSet8D840_ptr: TIntegerField
      FieldName = 'D840_ptr'
    end
    object ADODataSet8H: TIntegerField
      FieldName = 'H'
    end
    object ADODataSet8D: TIntegerField
      FieldName = 'D'
    end
    object ADODataSet8TS: TIntegerField
      FieldName = 'TS'
    end
    object ADODataSet8Downtime_D: TFloatField
      FieldName = 'Downtime_D'
      ProviderFlags = [pfInUpdate]
    end
    object ADODataSet8DowntimeTarget: TFloatField
      FieldName = 'DowntimeTarget'
      ProviderFlags = [pfInUpdate]
    end
    object ADODataSet8Shutdown_D: TFloatField
      FieldName = 'Shutdown_D'
      ProviderFlags = [pfInUpdate]
    end
    object ADODataSet8ShutdownTarget: TFloatField
      FieldName = 'ShutdownTarget'
      ProviderFlags = [pfInUpdate]
    end
    object ADODataSet8NotDowntime_D: TFloatField
      FieldName = 'NotDowntime_D'
      ProviderFlags = [pfInUpdate]
    end
    object ADODataSet8NotDowntimeTarget: TFloatField
      FieldName = 'NotDowntimeTarget'
      ProviderFlags = [pfInUpdate]
    end
    object ADODataSet8Service_D: TFloatField
      FieldName = 'Service_D'
      ProviderFlags = [pfInUpdate]
    end
    object ADODataSet8ServiceTarget: TFloatField
      FieldName = 'ServiceTarget'
      ProviderFlags = [pfInUpdate]
    end
    object ADODataSet8Scrapped: TFloatField
      FieldName = 'Scrapped'
      ProviderFlags = [pfInUpdate]
    end
    object ADODataSet8ScrappedTarget: TFloatField
      FieldName = 'ScrappedTarget'
      ProviderFlags = [pfInUpdate]
    end
    object ADODataSet8Plan_D: TFloatField
      FieldName = 'Plan_D'
      ProviderFlags = [pfInUpdate]
    end
    object ADODataSet8mainStanTime: TFloatField
      FieldName = 'mainStanTime'
      ProviderFlags = [pfInUpdate]
    end
    object ADODataSet8PlanTarget: TFloatField
      FieldName = 'PlanTarget'
      ProviderFlags = [pfInUpdate]
    end
    object ADODataSet8Outflow: TFloatField
      FieldName = 'Outflow'
      ProviderFlags = [pfInUpdate]
    end
    object ADODataSet8OutflowTarget: TFloatField
      FieldName = 'OutflowTarget'
      ProviderFlags = [pfInUpdate]
    end
  end
  object ADOQuery3Copy: TADOQuery
    Parameters = <>
    SQL.Strings = (
      
        'select ['#24037#21378'],['#35774#22791#36131#20219#23567#32452'],isnull('#32500#20462#25104#26412',0)'#32500#20462#25104#26412',isnull('#32500#25252#25104#26412',0)'#32500#25252#25104#26412',isnul' +
        'l('#24037#31243#25104#26412',0)'#24037#31243#25104#26412','
      'isnull('#20844#29992#25104#26412',0)'#20844#29992#25104#26412','
      
        '(isnull('#32500#20462#25104#26412',0)+isnull('#32500#25252#25104#26412',0)+isnull('#24037#31243#25104#26412',0)+isnull('#20844#29992#25104#26412',0))as ' +
        '['#27719#24635#25104#26412'],'
      '(isnull('#32500#20462#25104#26412',0)+isnull('#32500#25252#25104#26412',0)+isnull('#20844#29992#25104#26412',0))as ['#32771#26680#25104#26412']'
      ' from '
      
        '(select ['#24037#21378'],['#35774#22791#36131#20219#23567#32452'],['#31867#22411'],sum(isnull(['#37329#39069'('#26412#24065#21547#31246')],0))['#37329#39069'('#26412#24065#21547#31246')] f' +
        'rom '
      '(select data0840.[Location] ['#35774#22791#36131#20219#23567#32452'],data0015.ABBR_NAME ['#24037#21378'],'
      
        'case dbo.DATA0268.ttype when 2 then '#39#32500#20462#25104#26412#39' when 3 then '#39#32500#25252#25104#26412#39' wh' +
        'en 4 then '#39#24037#31243#25104#26412#39' when 5 then '#39#20844#29992#25104#26412#39' end as ['#31867#22411'],'
      
        '['#37329#39069'('#26412#24065#21547#31246')]=(select sum(ROUND(dbo.Data0207.QUANTITY * dbo.Data002' +
        '2.tax_price * dbo.Data0456.exch_rate, 4))       '
      'from data0207 join data0022 on data0022.rkey=data0207.D0022_PTR '
      
        'JOIN Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY where ' +
        ' Data0207.D0468_ptr=Data0468.rkey '
      'and data0207.tdate>=:SD and data0207.tdate<:ED)'
      'FROM dbo.DATA0268 '
      'join data0840 on  DATA0268.[d840_ptr]=dbo.data0840.rkey '
      'join Data0468 on DATA0268.rkey=Data0468.FLOW_NO'
      'join data0015 on data0268.warehouse_ptr=data0015.rkey'
      
        'where  data0268.status =4 and dbo.DATA0268.ttype in (2,3,4,5))as' +
        ' t1'
      'group by ['#24037#21378'],['#35774#22791#36131#20219#23567#32452'],['#31867#22411'] '
      ')as t2'
      'pivot (sum(['#37329#39069'('#26412#24065#21547#31246')]) for ['#31867#22411'] in ('#32500#20462#25104#26412','#32500#25252#25104#26412','#24037#31243#25104#26412','#20844#29992#25104#26412'))a'
      ''
      '--'#19981#35201#21024#38500#65292#24352#20852#26106'2014-2-18'#21495#35201#27714#23558#8220#24037#21378#8221#36825#20010#23383#27573#21435#25481#65292#20808#20445#30041#65292#25285#24515#20182#21738#19968#22825#21448#35201#27714#24674#22797'--')
    Left = 284
    Top = 238
  end
  object ADOQuery3_1: TADOQuery
    Parameters = <>
    SQL.Strings = (
      
        'select ['#35774#22791#36131#20219#23567#32452'],isnull('#32500#20462#25104#26412',0)'#32500#20462#25104#26412',isnull('#32500#25252#25104#26412',0)'#32500#25252#25104#26412',isnull('#24037#31243#25104 +
        #26412',0)'#24037#31243#25104#26412','
      'isnull('#20844#29992#25104#26412',0)'#20844#29992#25104#26412','
      
        '(isnull('#32500#20462#25104#26412',0)+isnull('#32500#25252#25104#26412',0)+isnull('#24037#31243#25104#26412',0)+isnull('#20844#29992#25104#26412',0))as ' +
        '['#27719#24635#25104#26412'],'
      '(isnull('#32500#20462#25104#26412',0)+isnull('#32500#25252#25104#26412',0)+isnull('#20844#29992#25104#26412',0))as ['#32771#26680#25104#26412']'
      ' from '
      '(select ['#35774#22791#36131#20219#23567#32452'],['#31867#22411'],sum(isnull(['#37329#39069'('#26412#24065#21547#31246')],0))['#37329#39069'('#26412#24065#21547#31246')] from '
      '(select data0840.[Location] ['#35774#22791#36131#20219#23567#32452'],'
      
        'case dbo.DATA0268.ttype when 2 then '#39#32500#20462#25104#26412#39' when 3 then '#39#32500#25252#25104#26412#39' wh' +
        'en 4 then '#39#24037#31243#25104#26412#39' when 5 then '#39#20844#29992#25104#26412#39' end as ['#31867#22411'],'
      
        '['#37329#39069'('#26412#24065#21547#31246')]=(select sum(ROUND(dbo.Data0207.QUANTITY * dbo.Data002' +
        '2.tax_price * dbo.Data0456.exch_rate, 4))       '
      'from data0207 join data0022 on data0022.rkey=data0207.D0022_PTR '
      
        'JOIN Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY where ' +
        ' Data0207.D0468_ptr=Data0468.rkey '
      'and data0207.tdate>=:SD and data0207.tdate<:ED)'
      'FROM dbo.DATA0268 '
      'join data0840 on  DATA0268.[d840_ptr]=dbo.data0840.rkey '
      'join Data0468 on DATA0268.rkey=Data0468.FLOW_NO'
      'join data0015 on data0268.warehouse_ptr=data0015.rkey'
      
        'where  data0268.status =4 and dbo.DATA0268.ttype in (2,3,4,5))as' +
        ' t1'
      'group by ['#35774#22791#36131#20219#23567#32452'],['#31867#22411'] '
      ')as t2'
      'pivot (sum(['#37329#39069'('#26412#24065#21547#31246')]) for ['#31867#22411'] in ('#32500#20462#25104#26412','#32500#25252#25104#26412','#24037#31243#25104#26412','#20844#29992#25104#26412'))a')
    Left = 284
    Top = 202
  end
  object ADOQuery2_1Copy: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <
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
    SQL.Strings = (
      'declare @sql varchar(8000),@SD datetime,@ED datetime'
      'set @SD=:SD'
      'set @ED=:ED'
      'select @sql=isnull(@sql+'#39','#39','#39#39')+Location from data0840 '
      'select '#39'select * from ('
      
        'select data0015.Abbr_Name as '#24037#21378',data0840.Location as '#36131#20219#23567#32452' ,'#39#39#23450#26399#20445 +
        #20859#26102#38388#39#39'as '#39#39#32479#35745#39033#30446#39#39',sum(data0831.TimeCons) SumTime'
      'from data0831'
      'join data0417 on data0831.DeviNumb=dbo.DATA0417.FASSET_CODE'
      'join data0015 on DATA0417.warehouse_ptr=data0015.rkey '
      'join data0840 on data0417.D840_ptr=data0840.rkey'
      'where data0831.ActuCompTime>='#39#39#39'+CONVERT(varchar(100), @SD, 20)'
      
        ' +'#39#39#39' and data0831.ActuCompTime<'#39#39#39'+CONVERT(varchar(100), @ED, 2' +
        '0)+'
      #39#39#39'group by data0015.Abbr_Name,data0840.Location )as t1'
      'pivot (sum(SumTime) for '
      #36131#20219#23567#32452'  in ('#39'+@sql+'#39'))a '
      'union all'
      'select * from ('
      
        'select data0015.Abbr_Name as '#24037#21378',data0840.Location as '#36131#20219#23567#32452','#39#39#25925#38556#32500#20462 +
        #26102#38388#39#39'as '#39#39#32479#35745#39033#30446#39#39',sum(DATA0567.maintain_house )SumTime'
      'from data0567 '
      'join data0417 on data0567.FASSET_PTR=dbo.DATA0417.rkey'
      'join data0015 on data0567.WHOUSE_PTR=data0015.rkey '
      'join data0840 on data0417.D840_ptr=data0840.rkey'
      'where data0567.complete_date>='#39#39#39'+CONVERT(varchar(100), @SD, 20)'
      
        ' +'#39#39#39' and data0567.complete_date<'#39#39#39'+CONVERT(varchar(100), @ED, ' +
        '20)+'
      
        #39#39#39' and data0417.EquiType=1 and failure_degree in ('#39#39#29983#20135#20572#39039#39#39','#39#39#24433#21709 +
        #29983#20135#39#39','#39#39#20173#21487#29983#20135#39#39')'
      'group by data0015.Abbr_Name,data0840.Location )as t1'
      'pivot (sum(SumTime) for '
      #36131#20219#23567#32452'  in ('#39'+@sql+'#39'))a'
      'union all'
      'select * from ('
      
        'select data0015.Abbr_Name as '#24037#21378',data0840.Location as '#36131#20219#23567#32452','#39#39#25925#38556#24635#20572 +
        #26426#26102#38388#39#39'as '#39#39#32479#35745#39033#30446#39#39',sum(DATA0567.maintain_house )SumTime'
      'from data0567 '
      'join data0417 on data0567.FASSET_PTR=dbo.DATA0417.rkey'
      'join data0015 on data0567.WHOUSE_PTR=data0015.rkey '
      'join data0840 on data0417.D840_ptr=data0840.rkey'
      'where data0567.complete_date>='#39#39#39'+CONVERT(varchar(100), @SD, 20)'
      
        ' +'#39#39#39' and data0567.complete_date<'#39#39#39'+CONVERT(varchar(100), @ED, ' +
        '20)+'
      #39#39#39' and data0417.EquiType=1 and failure_degree='#39#39#29983#20135#20572#39039#39#39
      'group by data0015.Abbr_Name,data0840.Location )as t1'
      'pivot (sum(SumTime) for '
      #36131#20219#23567#32452'  in ('#39'+@sql+'#39'))a'
      'UNION'
      'select * from ('
      
        'select DATA0417.RKEY,data0015.Abbr_Name as '#24037#21378',data0840.Location ' +
        'as '#36131#20219#23567#32452','#39#39#35774#22791#21488#25968#39#39'as '#39#39#32479#35745#39033#30446#39#39
      'from data0417 '
      'join data0015 on data0417.warehouse_ptr=data0015.rkey '
      'join data0840 on data0417.D840_ptr=data0840.rkey'
      'where  data0417.EquiType=1 and DATA0417.active_flag IN(2,3)'
      'and data0417 .confi_date<'#39#39#39'+CONVERT(varchar(100), @ED, 20)+'#39#39#39
      
        'group by DATA0417.RKEY,data0015.Abbr_Name,data0840.Location )as ' +
        't1'
      'pivot (count(RKEY) for '
      #36131#20219#23567#32452'  in ('#39'+@sql+'#39'))a'#39
      '--'#19981#35201#21024#38500#65292#24352#20852#26106'2014-2-18'#21495#35201#27714#23558#8220#24037#21378#8221#36825#20010#23383#27573#21435#25481#65292#20808#20445#30041#65292#25285#24515#20182#21738#19968#22825#21448#35201#27714#24674#22797'--')
    Left = 208
    Top = 239
  end
  object ADOQuery5_1Copy: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <
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
    SQL.Strings = (
      'declare @sql varchar(8000),@SD datetime,@ED datetime'
      'set @SD=:SD'
      'set @ED=:ED'
      'select @sql=isnull(@sql+'#39','#39','#39#39')+Location from data0840 '
      'select '#39'select * from ('
      
        'select data0015.Abbr_Name as '#24037#21378',data0840.Location as '#36131#20219#23567#32452' ,'#39#39#23450#26399#20445 +
        #20859#26102#38388#39#39'as '#39#39#32479#35745#39033#30446#39#39',sum(data0831.TimeCons) SumTime'
      'from data0831'
      
        'join data0417 on data0831.DeviNumb=dbo.DATA0417.FASSET_CODE and ' +
        'data0417.equipment_grade='#39#39#20851#38190#39#39
      'join data0015 on DATA0417.warehouse_ptr=data0015.rkey '
      'join data0840 on data0417.D840_ptr=data0840.rkey'
      'where data0831.ActuCompTime>='#39#39#39'+CONVERT(varchar(100), @SD, 20)'
      
        ' +'#39#39#39' and data0831.ActuCompTime<'#39#39#39'+CONVERT(varchar(100), @ED, 2' +
        '0)+'
      #39#39#39'group by data0015.Abbr_Name,data0840.Location )as t1'
      'pivot (sum(SumTime) for '
      #36131#20219#23567#32452'  in ('#39'+@sql+'#39'))a '
      'union all'
      'select * from ('
      
        'select data0015.Abbr_Name as '#24037#21378',data0840.Location as '#36131#20219#23567#32452','#39#39#25925#38556#32500#20462 +
        #26102#38388#39#39'as '#39#39#32479#35745#39033#30446#39#39',sum(DATA0567.maintain_house )SumTime'
      'from data0567 '
      
        'join data0417 on data0567.FASSET_PTR=dbo.DATA0417.rkey and data0' +
        '417.equipment_grade='#39#39#20851#38190#39#39
      'join data0015 on data0567.WHOUSE_PTR=data0015.rkey '
      'join data0840 on data0417.D840_ptr=data0840.rkey'
      'where data0567.complete_date>='#39#39#39'+CONVERT(varchar(100), @SD, 20)'
      
        ' +'#39#39#39' and data0567.complete_date<'#39#39#39'+CONVERT(varchar(100), @ED, ' +
        '20)+'
      
        #39#39#39' and data0417.EquiType=1 and failure_degree in ('#39#39#29983#20135#20572#39039#39#39','#39#39#24433#21709 +
        #29983#20135#39#39','#39#39#20173#21487#29983#20135#39#39')'
      'group by data0015.Abbr_Name,data0840.Location )as t1'
      'pivot (sum(SumTime) for '
      #36131#20219#23567#32452'  in ('#39'+@sql+'#39'))a'
      'union all'
      'select * from ('
      
        'select data0015.Abbr_Name as '#24037#21378',data0840.Location as '#36131#20219#23567#32452','#39#39#25925#38556#24635#20572 +
        #26426#26102#38388#39#39'as '#39#39#32479#35745#39033#30446#39#39',sum(DATA0567.maintain_house )SumTime'
      'from data0567 '
      
        'join data0417 on data0567.FASSET_PTR=dbo.DATA0417.rkey and data0' +
        '417.equipment_grade='#39#39#20851#38190#39#39
      'join data0015 on data0567.WHOUSE_PTR=data0015.rkey '
      'join data0840 on data0417.D840_ptr=data0840.rkey'
      'where data0567.complete_date>='#39#39#39'+CONVERT(varchar(100), @SD, 20)'
      
        ' +'#39#39#39' and data0567.complete_date<'#39#39#39'+CONVERT(varchar(100), @ED, ' +
        '20)+'
      #39#39#39' and data0417.EquiType=1 and failure_degree='#39#39#29983#20135#20572#39039#39#39
      'group by data0015.Abbr_Name,data0840.Location )as t1'
      'pivot (sum(SumTime) for '
      #36131#20219#23567#32452'  in ('#39'+@sql+'#39'))a'
      'UNION'
      'select * from ('
      
        'select DATA0417.RKEY,data0015.Abbr_Name as '#24037#21378',data0840.Location ' +
        'as '#36131#20219#23567#32452','#39#39#35774#22791#21488#25968#39#39'as '#39#39#32479#35745#39033#30446#39#39
      'from data0417 '
      'join data0015 on data0417.warehouse_ptr=data0015.rkey '
      'join data0840 on data0417.D840_ptr=data0840.rkey'
      
        'where  data0417.EquiType=1 and equipment_grade='#39#39#20851#38190#39#39' and DATA04' +
        '17.active_flag IN(2,3)'
      'and confi_date<'#39#39#39'+CONVERT(varchar(100), @ED, 20)+'#39#39#39
      
        'group by DATA0417.RKEY,data0015.Abbr_Name,data0840.Location )as ' +
        't1'
      'pivot (count(RKEY) for '
      #36131#20219#23567#32452'  in ('#39'+@sql+'#39'))a'#39)
    Left = 427
    Top = 246
  end
  object ADOQuery7_2Copy: TADOQuery
    Connection = DM.ADOConnection1
    Parameters = <
      item
        Name = 'SD'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @SD datetime,@ED datetime'
      'set @SD=:SD'
      'set @ED=dateadd(Month,1,@SD)'
      '--,'#31995#32479#24403#21069#26085#26399'>'#32467#26463#26085#26399'+2'#22825','#25191#34892#19979#38754#30340#26597#35810#12290
      'if getdate()>DateAdd(day,2,@ED)'
      'if getdate()>DateAdd(day,2,@ED)'
      'begin'
      '    select *from '
      
        '    (select data0417.warehouse_ptr as WHOUSE_PTR,data0015.rkey a' +
        's d15rkey,data0015.Abbr_Name ,data0840.rkey,data0840.Location ,'
      #9'(select sum(T1.maintain_house )'
      
        #9'from data0567 as T1 join data0417  on  T1.FASSET_PTR=dbo.DATA04' +
        '17.rkey '
      #9'JOIN data0840 as D40 on data0417.D840_ptr=D40.rkey '
      #9'and T1.complete_date>=@SD and T1.complete_date<@ED'
      #9'and data0417.EquiType=1 '
      #9'and T1.failure_degree='#39#29983#20135#20572#39039#39
      #9'WHERE D40.rkey=data0840.rkey and t1.WHOUSE_PTR=Data0015.rkey'
      #9')as TD,'#9
      #9'(select sum(T1.maintain_house )'
      
        #9'from data0567 as T1 join data0417  on  T1.FASSET_PTR=dbo.DATA04' +
        '17.rkey '
      #9'JOIN data0840 as D40 on data0417.D840_ptr=D40.rkey '
      #9'and T1.complete_date>=@SD and T1.complete_date<@ED'
      #9'and data0417.EquiType=1'
      #9'and T1.failure_degree in ('#39#29983#20135#20572#39039#39','#39#24433#21709#29983#20135#39','#39#20173#21487#29983#20135#39')'
      #9'WHERE D40.rkey=data0840.rkey and t1.WHOUSE_PTR=Data0015.rkey'
      #9')as YX'#9','
      #9'(select sum(data0831.TimeCons)'
      #9'from data0417 as D831_417  '
      #9'join data0831 on data0831.DeviNumb=D831_417.FASSET_CODE'
      #9'and data0831.ActuCompTime>=@SD and data0831.ActuCompTime<@ED '
      
        #9'and D831_417.D840_ptr=data0840.rkey and D831_417.warehouse_ptr=' +
        'data0015.rkey) SBBY,'
      #9'(select sum(data0831.StdTimeCons)'
      #9'from data0417 as D831_417  '
      #9'join data0831 on data0831.DeviNumb=D831_417.FASSET_CODE'
      #9'and data0831.ActuCompTime>=@SD and data0831.ActuCompTime<@ED '
      
        #9'and D831_417.D840_ptr=data0840.rkey and D831_417.warehouse_ptr=' +
        'data0015.rkey) StdTimeCons'
      #9',(select sum(datediff(ss,T1.ent_date,T1.complete_date) )/3600 '
      
        #9'from data0567 as T1 join data0417  on  T1.FASSET_PTR=dbo.DATA04' +
        '17.rkey '
      #9'JOIN data0840 as D40 on data0417.D840_ptr=D40.rkey '
      #9'and T1.complete_date>=@SD and T1.complete_date<@ED'
      #9'and data0417.EquiType=1 '
      #9'and T1.failure_degree='#39#29983#20135#20572#39039#39
      #9'WHERE D40.rkey=data0840.rkey and t1.WHOUSE_PTR=Data0015.rkey'
      #9')as TJGZ'
      #9',(select sum(datediff(ss,T1.ent_date,T1.complete_date) )/3600 '
      
        #9'from data0567 as T1 join data0417  on  T1.FASSET_PTR=dbo.DATA04' +
        '17.rkey '
      #9'JOIN data0840 as D40 on data0417.D840_ptr=D40.rkey '
      #9'and T1.complete_date>=@SD and T1.complete_date<@ED'
      #9'and data0417.EquiType=1 '
      #9'and T1.failure_degree in ('#39#29983#20135#20572#39039#39','#39#24433#21709#29983#20135#39','#39#20173#21487#29983#20135#39')'
      #9'WHERE D40.rkey=data0840.rkey and t1.WHOUSE_PTR=Data0015.rkey'
      #9')as FTJGZ'
      #9'from data0840'
      #9'join  data0417 on data0417.D840_ptr=data0840.rkey'
      #9'join Data0015 on data0417.warehouse_ptr=Data0015.rkey'
      
        #9'group by data0417.warehouse_ptr,data0015.rkey,data0015.Abbr_Nam' +
        'e,data0840.rkey,data0840.Location)'
      '        as t4'
      #9#9'join '
      #9#9'(SELECT D17.warehouse_ptr,D17.D840_ptr,COUNT(D17.RKEY) TS'
      
        #9#9'from data0417 AS D17 WHERE  d17.EquiType=1 and D17.active_flag' +
        ' IN (2,3)'
      '                               and d17.confi_date<@ED'
      #9#9'group by D17.warehouse_ptr,D17.D840_ptr'
      #9#9')as t3  '
      
        '        on T3.warehouse_ptr=t4.WHOUSE_PTR and T3.D840_ptr=t4.rke' +
        'y'#9
      'end'
      'else'
      'select Null')
    Left = 591
    Top = 375
  end
  object ADOQuery8_2Copy: TADOQuery
    Connection = DM.ADOConnection1
    Parameters = <
      item
        Name = 'SD'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @SD datetime,@ED datetime'
      'set @SD=:SD'
      'set @ED=dateadd(Month,1,@SD)'
      '--,'#31995#32479#24403#21069#26085#26399'>'#32467#26463#26085#26399'+2'#22825','#25191#34892#19979#38754#30340#26597#35810#12290
      'if getdate()>DateAdd(day,2,@ED)'
      'if getdate()>DateAdd(day,2,@ED)'
      'begin'
      '    select *from '
      
        '    (select data0417.warehouse_ptr as WHOUSE_PTR,data0015.rkey a' +
        's d15rkey,data0015.Abbr_Name ,data0840.rkey,data0840.Location ,'
      #9'(select sum(T1.maintain_house )'
      
        #9'from data0567 as T1 join data0417  on  T1.FASSET_PTR=dbo.DATA04' +
        '17.rkey '
      #9'JOIN data0840 as D40 on data0417.D840_ptr=D40.rkey '
      #9'and T1.complete_date>=@SD and T1.complete_date<@ED'
      #9'and data0417.EquiType=1 '
      #9'and T1.failure_degree='#39#29983#20135#20572#39039#39' AND data0417.equipment_grade='#39#20851#38190#39
      #9'WHERE D40.rkey=data0840.rkey and t1.WHOUSE_PTR=Data0015.rkey'
      #9')as TD,'#9
      #9'(select sum(T1.maintain_house )'
      
        #9'from data0567 as T1 join data0417  on  T1.FASSET_PTR=dbo.DATA04' +
        '17.rkey '
      #9'JOIN data0840 as D40 on data0417.D840_ptr=D40.rkey '
      #9'and T1.complete_date>=@SD and T1.complete_date<@ED'
      #9'and data0417.EquiType=1 and data0417.equipment_grade='#39#20851#38190#39
      #9'and T1.failure_degree in ('#39#29983#20135#20572#39039#39','#39#24433#21709#29983#20135#39','#39#20173#21487#29983#20135#39')'
      #9'WHERE D40.rkey=data0840.rkey and t1.WHOUSE_PTR=Data0015.rkey'
      #9')as YX'#9','
      #9'(select sum(data0831.TimeCons)'
      #9'from data0417 as D831_417  '
      #9'join data0831 on data0831.DeviNumb=D831_417.FASSET_CODE'
      #9'and data0831.ActuCompTime>=@SD and data0831.ActuCompTime<@ED '
      
        #9'and D831_417.D840_ptr=data0840.rkey and D831_417.warehouse_ptr=' +
        'data0015.rkey) SBBY,'
      '(select sum(data0831.StdTimeCons)'
      #9'from data0417 as D831_417  '
      #9'join data0831 on data0831.DeviNumb=D831_417.FASSET_CODE'
      #9'and data0831.ActuCompTime>=@SD and data0831.ActuCompTime<@ED '
      
        #9'and D831_417.D840_ptr=data0840.rkey and D831_417.warehouse_ptr=' +
        'data0015.rkey) StdTimeCons'
      #9',(select sum(datediff(ss,T1.ent_date,T1.complete_date) )/3600 '
      
        #9'from data0567 as T1 join data0417  on  T1.FASSET_PTR=dbo.DATA04' +
        '17.rkey '
      #9'JOIN data0840 as D40 on data0417.D840_ptr=D40.rkey '
      #9'and T1.complete_date>=@SD and T1.complete_date<@ED'
      #9'and data0417.EquiType=1 '
      #9'and T1.failure_degree='#39#29983#20135#20572#39039#39
      #9'WHERE D40.rkey=data0840.rkey and t1.WHOUSE_PTR=Data0015.rkey'
      #9'and data0417.equipment_grade='#39#20851#38190#39
      #9')as TJGZ'
      #9',(select sum(datediff(ss,T1.ent_date,T1.complete_date) )/3600 '
      
        #9'from data0567 as T1 join data0417  on  T1.FASSET_PTR=dbo.DATA04' +
        '17.rkey '
      #9'JOIN data0840 as D40 on data0417.D840_ptr=D40.rkey '
      #9'and T1.complete_date>=@SD and T1.complete_date<@ED'
      #9'and data0417.EquiType=1 '
      #9'and T1.failure_degree in ('#39#29983#20135#20572#39039#39','#39#24433#21709#29983#20135#39','#39#20173#21487#29983#20135#39')'
      #9'WHERE D40.rkey=data0840.rkey and t1.WHOUSE_PTR=Data0015.rkey'
      #9'and data0417.equipment_grade='#39#20851#38190#39
      #9')as FTJGZ'
      #9'from data0840'
      #9'join  data0417 on data0417.D840_ptr=data0840.rkey'
      #9'join Data0015 on data0417.warehouse_ptr=Data0015.rkey'
      
        #9'group by data0417.warehouse_ptr,data0015.rkey,data0015.Abbr_Nam' +
        'e,data0840.rkey,data0840.Location)'
      '        as t4'
      #9#9'join '
      #9#9'(SELECT D17.warehouse_ptr,D17.D840_ptr,COUNT(D17.RKEY) TS'
      
        #9#9'from data0417 AS D17 WHERE  d17.EquiType=1 and D17.active_flag' +
        ' IN (2,3)'
      
        '                               and confi_date<@ED and d17.equipm' +
        'ent_grade='#39#20851#38190#39
      #9#9'group by D17.warehouse_ptr,D17.D840_ptr'
      #9#9')as t3  '
      
        '        on T3.warehouse_ptr=t4.WHOUSE_PTR and T3.D840_ptr=t4.rke' +
        'y'#9
      'end'
      'else'
      'select Null'
      '')
    Left = 679
    Top = 359
  end
  object ADOQuery4_Copy: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
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
    SQL.Strings = (
      'declare @sd datetime ,@ed datetime '
      'set @sd=:SD'
      'set @ed=:ED'
      
        'select A.ABBR_NAME '#24037#21378',a.DEPT_CODE '#37096#38376',a.DEPT_NAME '#21517#31216',a.'#25925#38556#32500#20462#26102#38388',isn' +
        'ull(b.'#25925#38556#20572#26426#26102#38388' ,0)as '#25925#38556#20572#26426#26102#38388
      
        'from (select data0015.ABBR_NAME,data0034.DEPT_CODE,data0034.DEPT' +
        '_NAME,sum(data0567.maintain_house) '#25925#38556#32500#20462#26102#38388
      'from data0567'
      'join data0417 on data0567.Fasset_ptr=data0417.rkey'
      'join data0034 on data0417.DEPT_PTR=data0034.rkey'
      'join data0015 on data0417.warehouse_ptr=data0015.rkey'
      
        'where data0567.complete_date>=@sd  and data0567.complete_date<@e' +
        'd'
      'and data0567.failure_degree in ('#39#29983#20135#20572#39039#39','#39#24433#21709#29983#20135#39','#39#20173#21487#29983#20135#39')'
      'and data0567.maintain_house>0 and data0417.EquiType=1'
      
        'group by data0015.ABBR_NAME,data0034.DEPT_CODE,data0034.DEPT_NAM' +
        'E)as a'
      'left join '
      
        '(select data0015.ABBR_NAME,data0034.DEPT_CODE,data0034.DEPT_NAME' +
        ',sum(data0567.maintain_house) '#25925#38556#20572#26426#26102#38388
      'from data0567'
      'join data0417 on data0567.Fasset_ptr=data0417.rkey'
      'join data0034 on data0417.DEPT_PTR=data0034.rkey'
      'join data0015 on data0417.warehouse_ptr=data0015.rkey'
      
        'where data0567.complete_date>=@sd  and data0567.complete_date<@e' +
        'd'
      'and data0567.failure_degree in ('#39#29983#20135#20572#39039#39')'
      'and data0567.maintain_house>0 and data0417.EquiType=1'
      
        'group by data0015.ABBR_NAME,data0034.DEPT_CODE,data0034.DEPT_NAM' +
        'E)as b'
      
        'on a.ABBR_NAME=b.ABBR_NAME and a.DEPT_CODE=b.DEPT_CODE and a.DEP' +
        'T_NAME=b.DEPT_NAME')
    Left = 356
    Top = 237
    object ADOQuery4_CopyStringField1: TStringField
      FieldName = #24037#21378
      Size = 10
    end
    object ADOQuery4_CopyStringField2: TStringField
      FieldName = #37096#38376
      Size = 10
    end
    object ADOQuery4_CopyStringField3: TStringField
      FieldName = #21517#31216
      Size = 30
    end
    object ADOQuery4_CopyBCDField1: TBCDField
      FieldName = #25925#38556#32500#20462#26102#38388
      ReadOnly = True
      Precision = 32
      Size = 2
    end
    object ADOQuery4_CopyBCDField2: TBCDField
      FieldName = #25925#38556#20572#26426#26102#38388
      ReadOnly = True
      Precision = 32
      Size = 2
    end
  end
  object ADOQuery9_2_copy: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'd015_ptr'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'sd'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'declare @SD datetime,@ED datetime,@d015_ptr int ,@vMonth int ,@v' +
        'Year int'
      'set @d015_ptr=:d015_ptr'
      'set @SD=:sd'
      'set @ED=dateadd(Month,1,@SD)'
      
        'select @vMonth=Month(dateadd(Month,-1,@SD)),@vYear=Year(dateadd(' +
        'Month,-1,@SD))'
      '--,'#31995#32479#24403#21069#26085#26399'>'#32467#26463#26085#26399'+2'#22825','#25191#34892#19979#38754#30340#26597#35810#12290
      'if getdate()>DateAdd(day,2,@ED)'
      'begin'
      'select t7.ManaDeviTarg,t7.VacaDaysTarg,t7.StafResiTarg,'
      
        't6.* from (select data0840.rkey,data0840.Location,isnull(t1.Work' +
        'Time,0) TotaHour,isnull(t3.Ts,0)as ts,'
      
        '       isnull([VacaDaysActu],0)as[VacaDaysActu],isnull(workdays,' +
        '0)as workdays,'
      '    NumbDevi=(SELECT COUNT(data0855.rkey ) from data0855 '
      '    where data0855.D840_ptr=data0840.rkey '
      
        '    and data0855.EntrDate<=dateadd(day,-1,convert(char(10),@ED,1' +
        '20)) AND '
      
        '     ((data0855.DepaDate IS NULL)or(data0855.DepaDate>dateadd(da' +
        'y,-1,convert(char(10),@SD,120))))'
      '         ),'
      '    Separati=(SELECT COUNT(data0855.rkey ) from data0855 '
      '    where data0855.D840_ptr=data0840.rkey '
      '    and DATEPART(month,data0855.DepaDate)=DATEPART(month,@SD) )'
      '    from data0840 '
      '    left join Data0855 on data0840.rkey=Data0855.D840_ptr'
      '    left join Data0005 on  Data0855.D005_ptr= Data0005.RKEY '
      '    left join(     '
      '        select  D840_ptr,SUM(WorkTime)WorkTime FROM'
      #9#9'(select TOP (100) PERCENT '
      
        #9#9'Case when ((datepart(HH,data0842.BeginTime)<8)and(datepart(HH,' +
        'data0842.EndTime)>=8)and (data0842.DayShift=2))'
      
        #9#9'or((datepart(HH,data0842.BeginTime)<8)and(datepart(HH,data0842' +
        '.EndTime)<8)) '
      
        #9#9'then DateAdd(day,-1,dbo.data0842.WorkDate)else dbo.data0842.Wo' +
        'rkDate  end as WorkDate, '
      #9#9'data0842.WorkTime,data0567.D840_ptr'
      #9#9'from data0842 '
      #9#9'join data0567 on data0567.rkey=data0842.Work_ptr'
      #9#9'join data0855 on data0842.Empl_ptr=data0855.D005_ptr'
      #9#9'join data0840 on data0855.D840_ptr=data0840.rkey'
      #9#9'where data0855.TTYPE<>1'#9#9
      #9#9'order by  data0842.WorkDate'
      #9#9'union all'
      #9#9'select TOP (100) PERCENT '
      
        #9#9'Case when ((datepart(HH,data0848.BeginTime)<8)and(datepart(HH,' +
        'data0848.EndTime)>=8)and (data0848.DayShift=2))'
      
        #9#9'or((datepart(HH,data0848.BeginTime)<8)and(datepart(HH,data0848' +
        '.EndTime)<8)) '
      
        #9#9'then DateAdd(day,-1,dbo.data0848.WorkDate)else dbo.data0848.Wo' +
        'rkDate  end as WorkDate, '
      #9#9'data0848.WorkTime,data0417.D840_ptr'
      #9#9'from data0848 '
      #9#9'join data0831 on data0831.rkey=data0848.Work_ptr'
      #9#9'join data0417 on data0831.DeviNumb=data0417.FASSET_CODE'
      #9#9'join data0855 on data0848.Empl_ptr=data0855.D005_ptr'
      #9#9'join data0840 on data0855.D840_ptr=data0840.rkey'
      #9#9'where data0855.TTYPE<>1'#9#9#9
      #9#9')as t1'
      #9#9'WHERE WorkDate>=@SD  and WorkDate<@ED'
      #9#9'group by D840_ptr'
      #9') as t1 on data0840.rkey=t1.D840_ptr'
      #9'left join ('
      
        #9#9'select D840_ptr,COUNT(rkey) ts from DATA0417 where data0417.Eq' +
        'uiType=1 and DATA0417.active_flag IN(2,3)'
      #9#9'and data0417 .confi_date<@ED'
      #9#9'GROUP BY D840_ptr'
      #9') as t3 on t3.D840_ptr=data0840.rkey'
      ' left JOIN ('
      #9#9'SELECT D840_ptr,AVG(workdays)as[VacaDaysActu] from '
      #9#9#9'( select data0855.D840_ptr,employeemsg.rkey,'
      
        #9#9#9' DatePart(day,DateAdd(day, -1,@ED))-sum(isnull(rwt,0)/8.0) as' +
        ' workdays'
      #9#9#9' from onoffdutydata   '
      
        #9#9#9' join employeemsg on employeemsg.rkey=onoffdutydata.employeei' +
        'd'
      #9#9#9' JOIN data0005 on data0005.ABBR_NAME=employeemsg.chinesename'
      
        #9#9#9' JOIN data0855 on data0855.D005_ptr=data0005.RKEY and data085' +
        '5. TTYPE<>1'
      
        #9#9#9' where checkdate between convert(char(10),@SD,120)and dateadd' +
        '(day,-1,convert(char(10),@ED,120))'
      #9#9#9' GROUP BY  data0855.D840_ptr,employeemsg.rkey'
      #9#9#9' )as t1 '
      #9#9#9' GROUP BY D840_ptr'
      #9#9')as t4 on data0840.rkey=t4.D840_ptr'#9
      'left join (select '
      #9#9#9' data0840.rkey ,sum(isnull(rwt,0)/8.0) as workdays'
      #9#9#9' from onoffdutydata '
      
        #9#9#9' join employeemsg on employeemsg.rkey=onoffdutydata.employeei' +
        'd'
      #9#9#9' JOIN data0005 on data0005.ABBR_NAME=employeemsg.chinesename'
      
        #9#9#9' JOIN data0855 on data0855.D005_ptr=data0005.RKEY and data085' +
        '5. TTYPE<>1'
      #9#9#9' join data0840 on data0855.D840_ptr=data0840.rkey '#9' '
      
        #9#9#9' where checkdate between convert(char(10),@SD,120)and dateadd' +
        '(day,-1,convert(char(10),@ED,120))'
      #9#9#9' group by data0840.rkey '
      ') as t5 on '#9'data0840.rkey=t5.rkey'#9
      'where data0840.'#9'D015_ptr=@d015_ptr and data0840.[active]=1'#9
      
        #9'group BY data0840.rkey,data0840.Location,t1.WorkTime,t3.Ts,[Vac' +
        'aDaysActu],workdays'
      ')as t6 '
      
        'left join (select d840_ptr,data0857.ManaDeviTarg,data0857.VacaDa' +
        'ysTarg,data0857.StafResiTarg from data0857 '
      'join data0856 on data0857.d856_ptr='#9'data0856.rkey'
      'and data0856.Years=@vyear and data0856.[month]=@vMonth'
      
        'join data0840 on data0857.d840_ptr=data0840.rkey and data0840.d0' +
        '15_ptr=@d015_ptr'
      ')as t7 on t6.rkey=t7.d840_ptr'
      'end')
    Left = 901
    Top = 442
  end
  object ADOQuery9_3_copy: TADOQuery
    Connection = DM.ADOConnection1
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'SD'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'd015_ptr'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @SD datetime,@ED datetime,@d015_ptr int '
      'set @SD=:SD'
      'set @d015_ptr=:d015_ptr'
      'set @ED=dateadd(Month,1,@SD)   '
      
        'SELECT isnull(MJ,0)as MJ,isnull(HSJE,0)as HSJE, isnull(SBRS,0)as' +
        ' SBRS,isnull(WorkTime,0)as WorkTime,'
      'isnull(workdays,0)as workdays  FROM ('#9#9
      
        'select sum(ROUND(dbo.Data0053.QUANTITY * dbo.Data0025.unit_sq, 4' +
        ')) AS MJ,'
      
        'HSJE= Sum((CASE WHEN DATA0060_2.PART_PRICE >= 0 THEN ROUND(DATA0' +
        '060_2.PARTS_ALLOC '
      
        '* (1 + DATA0060_2.RUSH_CHARGE * 0.01) * ROUND(1 / DATA0060_2.EXC' +
        'H_RATE, '
      '4), 6) ELSE DATA0025.LATEST_PRICE END)*dbo.Data0053.QUANTITY) '
      'from Data0053 '
      'left join Data0025 on Data0053.CUST_PART_PTR=Data0025.RKEY'
      
        'left OUTER JOIN Data0060 as Data0060_2 on Data0060_2.RKEY = dbo.' +
        'Data0053.barcode_ptr'
      'join data0016 on Data0053.LOC_ptr=data0016.rkey '
      
        'and data0016.LOCATION in ('#39#20108#21378#25104#21697#20179#39','#39#19968#21378#25104#21697#20179'('#21452#38754')'#39','#39#19968#21378#25104#21697#20179'('#21333#38754')'#39','#39#25104#21697#20179#39',' +
        #39#20116#26666#20135#25104#21697#20179#39','#39#24555#26495#20135#25104#21697#20179#39')'
      'WHERE (dbo.Data0053.QUANTITY > 0) and '
      'Data0053.mfg_date>=@SD and Data0053.mfg_date<=@ED'
      'and data0053.rma_ptr=0 and data0053.WHSE_PTR=@d015_ptr)as t1'
      'JOIN '
      '(SELECT COUNT(data0855.rkey )as SBRS from data0855 '
      'join data0840 on data0855.D840_ptr=data0840.rkey'
      'and data0840.D015_ptr=@d015_ptr'
      
        'where data0855.EntrDate<=dateadd(day,-1,convert(char(10),@ED,120' +
        ')) AND '
      
        '     ((data0855.DepaDate IS NULL)or(data0855.DepaDate<dateadd(da' +
        'y,-1,convert(char(10),@ED,120))))'
      ' and data0840.[OutsPrep]<>1)as t2 on 1=1'
      'JOIN '
      '(    select  SUM(WorkTime)WorkTime FROM'
      #9#9'(select TOP (100) PERCENT '
      
        #9#9'Case when ((datepart(HH,data0842.BeginTime)<8)and(datepart(HH,' +
        'data0842.EndTime)>=8)and (data0842.DayShift=2))'
      
        #9#9'or((datepart(HH,data0842.BeginTime)<8)and(datepart(HH,data0842' +
        '.EndTime)<8)) '
      
        #9#9'then DateAdd(day,-1,dbo.data0842.WorkDate)else dbo.data0842.Wo' +
        'rkDate  end as WorkDate, '
      #9#9'data0842.WorkTime'
      #9#9'from data0842 '
      #9#9'join data0567 on data0567.rkey=data0842.Work_ptr'
      #9#9'join data0855 on data0842.Empl_ptr=data0855.D005_ptr'
      #9#9'join data0840 on data0855.D840_ptr=data0840.rkey'
      #9#9'and data0840.D015_ptr=@d015_ptr'
      #9#9'where data0840.[OutsPrep]<>1 and data0855.TTYPE<>1'
      #9#9'order by  data0842.WorkDate'
      #9#9'union all'
      #9#9'select TOP (100) PERCENT '
      
        #9#9'Case when ((datepart(HH,data0848.BeginTime)<8)and(datepart(HH,' +
        'data0848.EndTime)>=8)and (data0848.DayShift=2))'
      
        #9#9'or((datepart(HH,data0848.BeginTime)<8)and(datepart(HH,data0848' +
        '.EndTime)<8)) '
      
        #9#9'then DateAdd(day,-1,dbo.data0848.WorkDate)else dbo.data0848.Wo' +
        'rkDate  end as WorkDate, '
      #9#9'data0848.WorkTime'
      #9#9'from data0848 '
      #9#9'join data0831 on data0831.rkey=data0848.Work_ptr'
      #9#9'join data0417 on data0831.DeviNumb=data0417.FASSET_CODE'
      #9#9'join data0855 on data0848.Empl_ptr=data0855.D005_ptr'
      #9#9'join data0840 on data0855.D840_ptr=data0840.rkey'
      #9#9'where data0840.[OutsPrep]<>1 and data0855.TTYPE<>1'#9#9
      #9#9')as t1'
      #9'WHERE t1.WorkDate>=@SD  and t1.WorkDate<@ED'
      ')as t3 on 1=1'
      'join (select '
      #9#9#9' sum(isnull(rwt,0)/8.0) as workdays'
      #9#9#9' from onoffdutydata '
      
        #9#9#9' join employeemsg on employeemsg.rkey=onoffdutydata.employeei' +
        'd'
      #9#9#9' JOIN data0005 on data0005.ABBR_NAME=employeemsg.chinesename'
      
        #9#9#9' JOIN data0855 on data0855.D005_ptr=data0005.RKEY and data085' +
        '5. TTYPE<>1'
      #9#9#9' join data0840 on data0855.D840_ptr=data0840.rkey '
      #9#9#9' and data0840.OutsPrep'#9'<>1'#9'and data0840.D015_ptr=@d015_ptr'#9' '
      
        #9#9#9' where checkdate between convert(char(10),@SD,120)and dateadd' +
        '(day,-1,convert(char(10),@ED,120))'
      ')as t4 on 1=1'
      '')
    Left = 781
    Top = 390
  end
  object ADOQuery9_2: TADOQuery
    Connection = DM.ADOConnection1
    Parameters = <
      item
        Name = 'd015_ptr'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'sd'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'declare @SD datetime,@ED datetime,@d015_ptr int ,@vMonth int ,@v' +
        'Year int'
      'set @d015_ptr=:d015_ptr'
      'set @SD=:sd'
      'set @ED=dateadd(Month,1,@SD)'
      
        'select @vMonth=Month(dateadd(Month,-1,@SD)),@vYear=Year(dateadd(' +
        'Month,-1,@SD))'
      '--,'#31995#32479#24403#21069#26085#26399'>'#32467#26463#26085#26399'+1'#22825','#25191#34892#19979#38754#30340#26597#35810#12290
      'if getdate()>DateAdd(day,1,@ED)'
      'begin'
      
        'select t7.ManaDeviTarg,t7.VacaDaysTarg,t7.StafResiTarg,t6.* from' +
        ' '
      
        '    (select data0840.rkey,data0840.Location,isnull(t1.TotaHour,0' +
        ') TotaHour,isnull(t3.Ts,0)as ts,'
      
        '       isnull([VacaDaysActu],0)as[VacaDaysActu],isnull(workdays,' +
        '0)as workdays,'
      
        '    NumbDevi/*'#35774#22791#20154#25968'*/='#9'(SELECT COUNT(data0855.rkey ) from data085' +
        '5 '
      #9#9#9#9'where data0855.D840_ptr=data0840.rkey '
      
        #9#9#9#9'and data0855.EntrDate<=dateadd(day,-1,convert(char(10),@ED,1' +
        '20)) AND '
      
        #9#9#9#9' ((data0855.DepaDate IS NULL)or(data0855.DepaDate>dateadd(da' +
        'y,-1,convert(char(10),@SD,120)))) ),'#9#9#9#9
      
        '    Separati/*'#31163#32844#20154#25968'*/=('#9'SELECT COUNT(data0855.rkey ) from data085' +
        '5 '
      #9#9#9#9'where data0855.D840_ptr=data0840.rkey '
      #9#9#9#9'and DATEPART(month,data0855.DepaDate)=DATEPART(month,@SD) )'
      '    from data0840 '
      
        '    left join Data0855 on data0840.rkey=Data0855.D840_ptr and Da' +
        'ta0855.ttype<>0'
      '    left join Data0005 on  Data0855.D005_ptr= Data0005.RKEY '
      '    left join(     '
      
        '        select  D840_ptr,SUM(WorkTime)TotaHour/*'#24635#24037#26102' '#20154#22343#24037#26102'='#24635#24037#26102'/'#24037#20316#22825 +
        #25968'*/ FROM'
      #9#9'(select TOP (100) PERCENT '
      
        #9#9'Case when ((datepart(HH,data0842.BeginTime)<8)and(datepart(HH,' +
        'data0842.EndTime)>=8)and (data0842.DayShift=2))'
      
        #9#9'or((datepart(HH,data0842.BeginTime)<8)and(datepart(HH,data0842' +
        '.EndTime)<8)) '
      
        #9#9'then DateAdd(day,-1,dbo.data0842.WorkDate)else dbo.data0842.Wo' +
        'rkDate  end as WorkDate, '
      #9#9'data0842.WorkTime,data0567.D840_ptr'
      #9#9'from data0842 '
      #9#9'join data0567 on data0567.rkey=data0842.Work_ptr'
      #9#9'join data0855 on data0842.Empl_ptr=data0855.D005_ptr'
      #9#9'join data0840 on data0855.D840_ptr=data0840.rkey'
      
        #9#9'where data0855.TTYPE<>1'#9'and data0840.[active]=1 and data0840.O' +
        'utsPrep=0 '
      
        #9#9'and DateAdd(day,1,dbo.data0842.WorkDate)>=@SD and DateAdd(day,' +
        '-1,dbo.data0842.WorkDate)<=@ED '#9
      #9#9'order by  data0842.WorkDate'
      #9#9'union all'
      #9#9'select TOP (100) PERCENT '
      
        #9#9'Case when ((datepart(HH,data0848.BeginTime)<8)and(datepart(HH,' +
        'data0848.EndTime)>=8)and (data0848.DayShift=2))'
      
        #9#9'or((datepart(HH,data0848.BeginTime)<8)and(datepart(HH,data0848' +
        '.EndTime)<8)) '
      
        #9#9'then DateAdd(day,-1,dbo.data0848.WorkDate)else dbo.data0848.Wo' +
        'rkDate  end as WorkDate/*'#24037#20316#22825#25968'*/, '
      #9#9'data0848.WorkTime,data0417.D840_ptr'
      #9#9'from data0848 '
      #9#9'join data0831 on data0831.rkey=data0848.Work_ptr'
      #9#9'join data0417 on data0831.DeviNumb=data0417.FASSET_CODE'
      #9#9'join data0855 on data0848.Empl_ptr=data0855.D005_ptr'
      #9#9'join data0840 on data0855.D840_ptr=data0840.rkey'
      
        #9#9'where data0855.TTYPE<>1'#9'and data0840.[active]=1 and data0840.O' +
        'utsPrep=0 '
      
        #9#9'and (DateAdd(day,1,dbo.data0848.WorkDate)>=@SD)and(DateAdd(day' +
        ',-1,dbo.data0848.WorkDate)<=@ED)'#9#9
      #9#9')as t1'
      #9#9'WHERE WorkDate>=@SD  and WorkDate<@ED'
      #9#9'group by D840_ptr'
      #9') as t1 on data0840.rkey=t1.D840_ptr'
      #9'left join ('
      
        #9#9'select D840_ptr,COUNT(rkey) ts from DATA0417 where data0417.Eq' +
        'uiType=1 and DATA0417.active_flag IN(2,3)'
      #9#9'and data0417 .confi_date<@ED'
      #9#9'GROUP BY D840_ptr'
      #9') as t3 on t3.D840_ptr=data0840.rkey'
      '   left JOIN ('
      
        #9#9'SELECT D840_ptr,AVG(workdays)as[VacaDaysActu]/*'#20154#22343#20241#20551#22825#25968'|'#23454#38469'*/ fro' +
        'm '
      #9#9#9'( select data0855.D840_ptr,employeemsg.rkey,'
      
        #9#9#9' DatePart(day,DateAdd(day, -1,@ED))-sum(isnull(rwt,0)/8.0) as' +
        ' workdays'
      #9#9#9' from onoffdutydata   '
      
        #9#9#9' join employeemsg on employeemsg.rkey=onoffdutydata.employeei' +
        'd'
      
        #9#9#9' JOIN data0005 on data0005.EMPLOYEE_NAME=employeemsg.chinesen' +
        'ame'
      
        #9#9#9' JOIN data0855 on data0855.D005_ptr=data0005.RKEY and data085' +
        '5. TTYPE<>1'
      #9#9#9' join data0840 on data0855.d840_ptr=data0840.rkey'
      
        #9#9#9' where checkdate between convert(char(10),@SD,120)and dateadd' +
        '(day,-1,convert(char(10),@ED,120))'
      
        #9#9#9' and data0855.TTYPE<>1'#9'and data0840.[active]=1 and data0840.O' +
        'utsPrep=0 '
      #9#9#9' GROUP BY  data0855.D840_ptr,employeemsg.rkey'
      #9#9#9' )as t1 '
      #9#9#9' GROUP BY D840_ptr'
      #9#9')as t4 on data0840.rkey=t4.D840_ptr'#9
      '   left join (select '
      #9#9#9' data0840.rkey ,sum(isnull(rwt,0)/8.0) as workdays'
      #9#9#9' from onoffdutydata '
      
        #9#9#9' join employeemsg on employeemsg.rkey=onoffdutydata.employeei' +
        'd'
      
        #9#9#9' join datadepartment on EMPLOYEEMSG.departmentid=datadepartme' +
        'nt.rkey and departmentname like'#39'%'#35774#22791'%'#39' '
      
        #9#9#9' JOIN data0005 on data0005.EMPLOYEE_NAME=employeemsg.chinesen' +
        'ame'
      
        #9#9#9' JOIN data0855 on data0855.D005_ptr=data0005.RKEY and data085' +
        '5. TTYPE<>1'
      #9#9#9' join data0840 on data0855.D840_ptr=data0840.rkey '#9' '
      
        #9#9#9' where checkdate between convert(char(10),@SD,120)and dateadd' +
        '(day,-1,convert(char(10),@ED,120))'
      
        #9#9#9' and data0855.TTYPE=0'#9'and data0840.[active]=1 and data0840.Ou' +
        'tsPrep=0 '
      #9#9#9' /*'#21512#35745#24037#20316#22825#25968#65292#19981#21253#25324#26159#36127#36131#20154#12289#26080#25928#12289#32534#22806'*/'
      #9#9#9' group by data0840.rkey '
      #9') as t5 on '#9'data0840.rkey=t5.rkey'#9
      
        #9'where data0840.'#9'D015_ptr=@d015_ptr and data0840.[active]=1 and ' +
        'data0840.OutsPrep=0 '
      
        #9'group BY data0840.rkey,data0840.Location,t1.TotaHour,t3.Ts,[Vac' +
        'aDaysActu],workdays'
      ')as t6 '
      
        'left join (select d840_ptr,data0857.ManaDeviTarg,data0857.VacaDa' +
        'ysTarg,data0857.StafResiTarg from data0857 '
      'join data0856 on data0857.d856_ptr='#9'data0856.rkey'
      'and data0856.Years=@vyear and data0856.[month]=@vMonth'
      
        'join data0840 on data0857.d840_ptr=data0840.rkey and data0840.d0' +
        '15_ptr=@d015_ptr'
      ')as t7 on t6.rkey=t7.d840_ptr'
      'end'
      'else'
      '  select * from data0840 where 1=2'
      '')
    Left = 896
    Top = 336
  end
  object DataSource10_1: TDataSource
    DataSet = ClientDataSet10_1
    Left = 1029
    Top = 270
  end
  object ADOQuery10_1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'SD'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    Left = 1029
    Top = 118
  end
  object DataSetProvider10_1: TDataSetProvider
    DataSet = ADOQuery10_1
    Options = [poAllowCommandText]
    Left = 1029
    Top = 166
  end
  object ClientDataSet10_1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider10_1'
    ReadOnly = True
    AfterOpen = ClientDataSet10_1AfterOpen
    OnCalcFields = ClientDataSet10_1CalcFields
    Left = 1029
    Top = 222
    object ClientDataSet10_1JobName: TStringField
      DisplayLabel = #24037#20316#21517#31216
      FieldName = 'JobName'
      ReadOnly = True
      Size = 12
    end
    object ClientDataSet10_1TimeCons: TBCDField
      DisplayLabel = #32791#26102
      FieldName = 'TimeCons'
      ReadOnly = True
      Precision = 32
      Size = 2
    end
    object ClientDataSet10_1Percentage: TFloatField
      DisplayLabel = #30334#20998#27604
      FieldKind = fkCalculated
      FieldName = 'Percentage'
      OnGetText = ClientDataSet10_1PercentageGetText
      Calculated = True
    end
  end
  object ClientDataSet10: TClientDataSet
    Aggregates = <>
    CommandText = 
      'declare @SD datetime,@ED datetime,@d015_ptr int ,@vMonth int ,@v' +
      'Year int'#13#10'set @SD=:SD'#13#10'set @ED=dateadd(Month,1,@SD)'#13#10#13#10'        s' +
      'elect JobName,sum(WorkTime)as TimeCons from ('#13#10#9#9#9'select Case wh' +
      'en ((datepart(HH,data0842.BeginTime)<8)and(datepart(HH,data0842.' +
      'EndTime)>=8)and (data0842.DayShift=2))'#13#10#9#9#9'or((datepart(HH,data0' +
      '842.BeginTime)<8)and(datepart(HH,data0842.EndTime)<8)) '#13#10#9#9#9'then' +
      ' DateAdd(day,-1,dbo.data0842.WorkDate)else dbo.data0842.WorkDate' +
      '  end as WorkDate, '#13#10#9#9#9'data0842.WorkTime,'#39#25925#38556#20572#26426#32500#20462#39' JobName'#13#10#9#9#9'f' +
      'rom data0842 '#13#10#9#9#9'join data0567  on data0567.rkey=data0842.Work_' +
      'ptr'#13#10#9#9#9'join data0417  on  data0567.FASSET_PTR=dbo.DATA0417.rkey' +
      #13#10#9#9#9'join data0855 on data0842.Empl_ptr=data0855.D005_ptr'#13#10#9#9#9'jo' +
      'in data0840 on data0855.D840_ptr=data0840.rkey'#13#10#9#9#9'and data0840.' +
      'OutsPrep=0 '#13#10#9#9#9'where DateAdd(day,1,dbo.data0842.WorkDate)>=@SD ' +
      'and DateAdd(day,-1,dbo.data0842.WorkDate)<=@ED'#13#10#9#9#9'and data0417.' +
      'EquiType=1 and data0567.failure_degree='#39#29983#20135#20572#39039#39')as t1'#13#10#9#9'where Wor' +
      'kDate>=@SD and WorkDate<@ED'#13#10#9#9'group by JobName'#13#10'union all'#13#10#9#9'se' +
      'lect JobName,sum(WorkTime)as TimeCons from '#9#9#13#10#9#9#9'(select  Case ' +
      'when ((datepart(HH,data0842.BeginTime)<8)and(datepart(HH,data084' +
      '2.EndTime)>=8)and (data0842.DayShift=2))'#13#10#9#9#9'or((datepart(HH,dat' +
      'a0842.BeginTime)<8)and(datepart(HH,data0842.EndTime)<8)) '#13#10#9#9#9'th' +
      'en DateAdd(day,-1,dbo.data0842.WorkDate)else dbo.data0842.WorkDa' +
      'te  end as WorkDate, '#13#10#9#9#9'data0842.WorkTime,'#39#25925#38556#24635#32500#20462#39' JobName'#13#10#9#9#9 +
      'from data0842 '#13#10#9#9#9'join data0567  on data0567.rkey=data0842.Work' +
      '_ptr'#13#10#9#9#9'join data0417  on  data0567.FASSET_PTR=dbo.DATA0417.rke' +
      'y'#13#10#9#9#9'join data0855 on data0842.Empl_ptr=data0855.D005_ptr'#13#10#9#9#9'j' +
      'oin data0840 on data0855.D840_ptr=data0840.rkey'#13#10#9#9#9'and data0840' +
      '.OutsPrep=0 '#13#10#9#9#9'where DateAdd(day,1,dbo.data0842.WorkDate)>=@SD' +
      ' and DateAdd(day,-1,dbo.data0842.WorkDate)<=@ED'#13#10#9#9#9'and data0417' +
      '.EquiType=1 and data0567.failure_degree in ('#39#29983#20135#20572#39039#39','#39#24433#21709#29983#20135#39','#39#20173#21487#29983#20135#39 +
      '))as t1'#9#13#10#9#9'where WorkDate>=@SD and WorkDate<@ED'#13#10#9#9'group by Job' +
      'Name'#9#9#9#13#10'union all'#9#9#13#10#9#9'select JobName,sum(WorkTime)as TimeCons ' +
      'from '#13#10#9#9#9'(select  Case when ((datepart(HH,data0848.BeginTime)<8' +
      ')and(datepart(HH,data0848.EndTime)>=8)and (data0848.DayShift=2))' +
      #13#10#9#9#9'or((datepart(HH,data0848.BeginTime)<8)and(datepart(HH,data0' +
      '848.EndTime)<8)) '#13#10#9#9#9'then DateAdd(day,-1,dbo.data0848.WorkDate)' +
      'else dbo.data0848.WorkDate  end as WorkDate,'#13#10#9#9#9'data0848.WorkTi' +
      'me,'#39#23450#26399#20445#20859#39' JobName'#13#10#9#9#9'from data0848 '#13#10#9#9#9'join data0831 on data08' +
      '31.rkey=data0848.Work_ptr'#13#10#9#9#9'join data0417 as D831_417 on data0' +
      '831.DeviNumb=D831_417.FASSET_CODE'#13#10#9#9#9'join data0855 on data0848.' +
      'Empl_ptr=data0855.D005_ptr'#13#10#9#9#9'join data0840 on data0855.D840_pt' +
      'r=data0840.rkey'#13#10#9#9#9'and data0840.OutsPrep=0 '#13#10#9#9#9'where (DateAdd(' +
      'day,1,dbo.data0848.WorkDate)>=@SD)and(DateAdd(day,-1,dbo.data084' +
      '8.WorkDate)<=@ED))as t1'#13#10#9#9'where WorkDate>=@SD and WorkDate<@ED'#13 +
      #10#9#9'group by JobName'#9#13#10'union all'#13#10#9#9'select JobName,sum(WorkTime)a' +
      's TimeCons from '#13#10#9#9#9'(select  Case when ((datepart(HH,data0842.B' +
      'eginTime)<8)and(datepart(HH,data0842.EndTime)>=8)and (data0842.D' +
      'ayShift=2))'#13#10#9#9#9'or((datepart(HH,data0842.BeginTime)<8)and(datepa' +
      'rt(HH,data0842.EndTime)<8)) '#13#10#9#9#9'then DateAdd(day,-1,dbo.data084' +
      '2.WorkDate)else dbo.data0842.WorkDate  end as WorkDate, '#13#10#9#9#9'dat' +
      'a0842.WorkTime, '#39#38750#23450#26399#32500#25252#39' JobName'#13#10#9#9#9'from data0842 '#13#10#9#9#9'join data' +
      '0567 on   data0567.rkey=data0842.Work_ptr'#13#10#9#9#9'join data0855 on d' +
      'ata0842.Empl_ptr=data0855.D005_ptr'#13#10#9#9#9'join data0840 on data0855' +
      '.D840_ptr=data0840.rkey'#13#10#9#9#9'and data0840.OutsPrep=0 '#13#10#9#9#9'join da' +
      'ta0417 on  data0567.FASSET_PTR = data0417.rkey '#13#10#9#9#9'JOIN Data051' +
      '4 ON DATA0417.FASSET_TYPE_PTR = Data0514.RKEY'#13#10#9#9#9'where ((Data05' +
      '14.Fasset_type='#39#39044#38450#32500#25252#39')or((data0567.failure_degree in ('#39#39044#38450#32500#25252#39','#39#32791#26448 +
      #26356#25442#39'))and(data0417.EquiType=1)))'#13#10#9#9#9'and DateAdd(day,1,dbo.data08' +
      '42.WorkDate)>=@SD and DateAdd(day,-1,dbo.data0842.WorkDate)<=@ED' +
      #13#10#9#9#9') as t1'#9#9#9#13#10#9#9'where WorkDate>=@SD and WorkDate<@ED'#13#10#9#9'group' +
      ' by JobName'#9#9#13#10'union all'#13#10#9#9'select JobName,sum(WorkTime)as TimeC' +
      'ons from '#13#10#9#9'   (select  Case when ((datepart(HH,data0842.BeginT' +
      'ime)<8)and(datepart(HH,data0842.EndTime)>=8)and (data0842.DayShi' +
      'ft=2))'#13#10#9#9#9'or((datepart(HH,data0842.BeginTime)<8)and(datepart(HH' +
      ',data0842.EndTime)<8)) '#13#10#9#9#9'then DateAdd(day,-1,dbo.data0842.Wor' +
      'kDate)else dbo.data0842.WorkDate  end as WorkDate, '#13#10#9#9#9'data0842' +
      '.WorkTime,'#39#24037#31243#39' JobName'#13#10#9#9#9'from data0842 '#13#10#9#9#9'join data0567 on  ' +
      ' data0567.rkey=data0842.Work_ptr '#13#10#9#9#9'join data0855 on data0842.' +
      'Empl_ptr=data0855.D005_ptr'#13#10#9#9#9'join data0840 on data0855.D840_pt' +
      'r=data0840.rkey'#13#10#9#9#9'and data0840.OutsPrep=0 '#13#10#9#9#9'where data0567.' +
      'FASSET_PTR in'#13#10#9#9#9'(select data0417.rkey from data0417 '#13#10#9#9#9'JOIN ' +
      'Data0514 ON DATA0417.FASSET_TYPE_PTR = Data0514.RKEY'#13#10#9#9#9'where F' +
      'asset_type='#39#24037#31243#39')'#13#10#9#9#9'and DateAdd(day,1,dbo.data0842.WorkDate)>=@' +
      'SD and DateAdd(day,-1,dbo.data0842.WorkDate)<=@ED) as t1'#13#10#9#9'wher' +
      'e WorkDate>=@SD and WorkDate<@ED'#13#10#9#9'group by JobName'#9#9#9#9#13#10'union ' +
      'all'#13#10#9#9'select JobName,sum(WorkTime)as TimeCons from '#13#10#9#9#9'(select' +
      '  Case when ((datepart(HH,data0842.BeginTime)<8)and(datepart(HH,' +
      'data0842.EndTime)>=8)and (data0842.DayShift=2))'#13#10#9#9#9'or((datepart' +
      '(HH,data0842.BeginTime)<8)and(datepart(HH,data0842.EndTime)<8)) ' +
      #13#10#9#9#9'then DateAdd(day,-1,dbo.data0842.WorkDate)else dbo.data0842' +
      '.WorkDate  end as WorkDate, '#13#10#9#9#9'data0842.WorkTime,'#39#22522#30784#26434#21153#39' JobNam' +
      'e'#13#10#9#9#9'from data0842 '#13#10#9#9#9'join data0567 on   data0567.rkey=data08' +
      '42.Work_ptr '#13#10#9#9#9'join data0855 on data0842.Empl_ptr=data0855.D00' +
      '5_ptr'#13#10#9#9#9'join data0840 on data0855.D840_ptr=data0840.rkey'#13#10#9#9#9'a' +
      'nd data0840.OutsPrep=0  '#13#10#9#9#9'where data0567.FASSET_PTR in'#13#10#9#9#9'(s' +
      'elect data0417.rkey from data0417 '#13#10#9#9#9'JOIN Data0514 ON DATA0417' +
      '.FASSET_TYPE_PTR = Data0514.RKEY'#13#10#9#9#9'where Fasset_type='#39#22522#30784#26434#21153#39')'#13#10 +
      #9#9#9'and DateAdd(day,1,dbo.data0842.WorkDate)>=@SD and DateAdd(day' +
      ',-1,dbo.data0842.WorkDate)<=@ED) as t1'#13#10#9#9'where WorkDate>=@SD an' +
      'd WorkDate<@ED'#13#10#9#9'group by JobName'
    Params = <
      item
        DataType = ftDate
        Name = 'SD'
        ParamType = ptUnknown
      end>
    ProviderName = 'DataSetProvider10_1'
    AfterOpen = ClientDataSet10AfterOpen
    Left = 1029
    Top = 326
    object ClientDataSet10TimeCons: TBCDField
      FieldName = 'TimeCons'
      ReadOnly = True
      Precision = 32
      Size = 2
    end
    object ClientDataSet10JobName: TStringField
      FieldName = 'JobName'
      ReadOnly = True
      Size = 12
    end
    object ClientDataSet10Percentage: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Percentage'
      Calculated = True
    end
  end
end
