object Form_ysdetail: TForm_ysdetail
  Left = 254
  Top = 132
  Width = 882
  Height = 559
  Caption = #24212#25910#26126#32454
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 41
    Width = 866
    Height = 479
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = #21457#31080#26126#32454
      object Panel3: TPanel
        Left = 0
        Top = 243
        Width = 858
        Height = 208
        Align = alClient
        TabOrder = 0
        object StringGrid2: TStringGrid
          Left = 1
          Top = 1
          Width = 856
          Height = 206
          Align = alClient
          ColCount = 20
          DefaultRowHeight = 20
          FixedCols = 0
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing]
          PopupMenu = PopupMenu2
          TabOrder = 0
          OnDrawCell = StringGrid2DrawCell
          OnExit = StringGrid2Exit
          OnKeyDown = StringGrid2KeyDown
          OnKeyPress = StringGrid2KeyPress
          OnKeyUp = StringGrid2KeyUp
          OnMouseDown = StringGrid2MouseDown
          OnSelectCell = StringGrid2SelectCell
          ColWidths = (
            74
            73
            81
            75
            71
            76
            58
            59
            91
            53
            48
            40
            46
            35
            64
            64
            64
            64
            64
            84)
        end
        object dtpk1: TDateTimePicker
          Left = 577
          Top = 23
          Width = 92
          Height = 22
          Date = 40015.000000000000000000
          Time = 40015.000000000000000000
          TabOrder = 1
          OnChange = dtpk1Change
          OnKeyDown = dtpk1KeyDown
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 89
        Width = 858
        Height = 154
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object StringGrid1: TStringGrid
          Left = 0
          Top = 0
          Width = 858
          Height = 154
          Align = alClient
          ColCount = 15
          DefaultRowHeight = 20
          FixedCols = 0
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing]
          PopupMenu = PopupMenu1
          TabOrder = 0
          OnDrawCell = StringGrid1DrawCell
          OnExit = StringGrid1Exit
          OnKeyDown = StringGrid1KeyDown
          OnKeyPress = StringGrid1KeyPress
          OnKeyUp = StringGrid1KeyUp
          OnMouseDown = StringGrid1MouseDown
          OnSelectCell = StringGrid1SelectCell
          ColWidths = (
            78
            74
            78
            73
            77
            72
            54
            48
            6
            74
            78
            99
            64
            85
            64)
        end
        object dtpk2: TDateTimePicker
          Left = 689
          Top = 22
          Width = 100
          Height = 22
          Date = 40015.000000000000000000
          Time = 40015.000000000000000000
          TabOrder = 1
          OnChange = dtpk2Change
          OnKeyDown = dtpk2KeyDown
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 858
        Height = 89
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object Label2: TLabel
          Left = 391
          Top = 17
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Caption = #23458#25143':'
        end
        object Label19: TLabel
          Left = 529
          Top = 17
          Width = 28
          Height = 13
          Caption = '    '
        end
        object Label3: TLabel
          Left = 391
          Top = 44
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Caption = #36135#24065':'
        end
        object Label20: TLabel
          Left = 529
          Top = 44
          Width = 28
          Height = 13
          Caption = '    '
        end
        object Label4: TLabel
          Left = 734
          Top = 44
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Caption = #27719#29575':'
        end
        object Label23: TLabel
          Left = 1
          Top = 17
          Width = 59
          Height = 13
          Caption = #20973#35777#32534#21495':'
        end
        object Label24: TLabel
          Left = 1
          Top = 44
          Width = 59
          Height = 13
          Caption = #20973#35777#26085#26399':'
        end
        object Label27: TLabel
          Left = 168
          Top = 44
          Width = 59
          Height = 13
          Caption = #20250#35745#24180#24230':'
        end
        object Label28: TLabel
          Left = 276
          Top = 44
          Width = 59
          Height = 13
          Caption = #20250#35745#26376#20221':'
        end
        object Label1: TLabel
          Left = 1
          Top = 70
          Width = 59
          Height = 13
          Alignment = taRightJustify
          Caption = #24037#20855#36153#29992':'
        end
        object Label5: TLabel
          Left = 166
          Top = 70
          Width = 59
          Height = 13
          Alignment = taRightJustify
          Caption = #26434#39033#36153#29992':'
        end
        object Label6: TLabel
          Left = 364
          Top = 70
          Width = 59
          Height = 13
          Alignment = taRightJustify
          Caption = #20986#36135#20215#27454':'
        end
        object Label7: TLabel
          Left = 553
          Top = 70
          Width = 46
          Height = 13
          Alignment = taRightJustify
          Caption = #22686#20540#31246':'
        end
        object Label8: TLabel
          Left = 708
          Top = 70
          Width = 59
          Height = 13
          Alignment = taRightJustify
          Caption = #24212#25910#24635#35745':'
        end
        object Label9: TLabel
          Left = 181
          Top = 16
          Width = 46
          Height = 13
          Alignment = taRightJustify
          Caption = #21442#32771#21495':'
        end
        object Edit1: TEdit
          Left = 429
          Top = 13
          Width = 65
          Height = 21
          TabStop = False
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 0
        end
        object Edit5: TEdit
          Left = 429
          Top = 40
          Width = 65
          Height = 21
          TabStop = False
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 1
        end
        object BitBtn6: TBitBtn
          Left = 497
          Top = 11
          Width = 25
          Height = 25
          TabOrder = 2
          OnClick = BitBtn6Click
          Glyph.Data = {
            EE000000424DEE000000000000007600000028000000100000000F0000000100
            04000000000078000000130B0000130B00001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            888800000888880000080F000888880F00080F000888880F0008000000080000
            000800F000000F00000800F000800F00000800F000800F000008800000000000
            0088880F00080F000888880000080000088888800088800088888880F08880F0
            888888800088800088888888888888888888}
        end
        object BitBtn4: TBitBtn
          Left = 497
          Top = 38
          Width = 25
          Height = 25
          TabOrder = 3
          OnClick = BitBtn4Click
          Glyph.Data = {
            EE000000424DEE000000000000007600000028000000100000000F0000000100
            04000000000078000000130B0000130B00001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            888800000888880000080F000888880F00080F000888880F0008000000080000
            000800F000000F00000800F000800F00000800F000800F000008800000000000
            0088880F00080F000888880000080000088888800088800088888880F08880F0
            888888800088800088888888888888888888}
        end
        object Edit2: TEdit
          Left = 771
          Top = 40
          Width = 86
          Height = 21
          TabOrder = 4
          Text = '0.00000000'
          OnExit = Edit2Exit
          OnKeyPress = Edit2KeyPress
        end
        object Edit8: TEdit
          Left = 64
          Top = 13
          Width = 99
          Height = 21
          ReadOnly = True
          TabOrder = 5
        end
        object Edit11: TEdit
          Left = 64
          Top = 40
          Width = 99
          Height = 21
          TabOrder = 6
          OnExit = Edit11Exit
          OnKeyPress = Edit11KeyPress
        end
        object Edit13: TEdit
          Left = 230
          Top = 40
          Width = 45
          Height = 21
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 7
        end
        object Edit14: TEdit
          Left = 338
          Top = 40
          Width = 43
          Height = 21
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 8
        end
        object Edit3: TEdit
          Left = 64
          Top = 66
          Width = 86
          Height = 21
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 9
          Text = '0.00'
        end
        object Edit4: TEdit
          Left = 230
          Top = 66
          Width = 86
          Height = 21
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 10
          Text = '0.00'
        end
        object Edit6: TEdit
          Left = 429
          Top = 66
          Width = 86
          Height = 21
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 11
          Text = '0.00'
        end
        object Edit7: TEdit
          Left = 604
          Top = 66
          Width = 86
          Height = 21
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 12
          Text = '0.00'
        end
        object Edit9: TEdit
          Left = 772
          Top = 66
          Width = 86
          Height = 21
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 13
          Text = '0.00'
        end
        object Edit10: TEdit
          Left = 231
          Top = 13
          Width = 99
          Height = 21
          TabOrder = 14
        end
        object CheckBox2: TCheckBox
          Left = 615
          Top = 42
          Width = 74
          Height = 17
          Caption = #24179#34913#35299#38145
          TabOrder = 15
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #20973#35777#26126#32454
      ImageIndex = 1
      object ToolBar1: TToolBar
        Left = 0
        Top = 0
        Width = 858
        Height = 45
        ButtonHeight = 41
        Caption = 'ToolBar1'
        Color = clBtnFace
        ParentColor = False
        TabOrder = 0
        object SpeedButton1: TSpeedButton
          Left = 0
          Top = 2
          Width = 63
          Height = 41
          Hint = #22686#21152#31185#30446'Ctrl+A'
          Caption = #28155#21152
          Flat = True
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            04000000000080000000CE0E0000D80E00001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            7777777777707777777777777777777777777700007007777777777777777777
            7777770000700000000077777777777777777747777000000777774477700000
            0777444447777777777777447770000000007747777000000000777777777777
            7777770000700000000077777777777777777777777077777777}
          Layout = blGlyphTop
          ParentShowHint = False
          ShowHint = True
          OnClick = N4Click
        end
        object SpeedButton2: TSpeedButton
          Left = 63
          Top = 2
          Width = 63
          Height = 41
          Caption = #26356#25913#31185#30446
          Flat = True
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            04000000000080000000CE0E0000C40E00001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            7777777777777777777777777744447777777777444444447777777444777744
            4777777447777774477777447777777744777744777777774477774477777777
            4477774477777777447777744777747447777774477774444777777777777444
            7777777777777444477777777777777777777777777777777777}
          Layout = blGlyphTop
          ParentShowHint = False
          ShowHint = True
          OnClick = N5Click
        end
        object SpeedButton3: TSpeedButton
          Left = 126
          Top = 2
          Width = 63
          Height = 41
          Caption = #26356#25913#36135#24065
          Flat = True
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            04000000000080000000CE0E0000C40E00001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            7777777777777777777777777744447777777777444444447777777444777744
            4777777447777774477777447777777744777744777777774477774477777777
            4477774477777777447777744777747447777774477774444777777777777444
            7777777777777444477777777777777777777777777777777777}
          Layout = blGlyphTop
          ParentShowHint = False
          ShowHint = True
          OnClick = N11Click
        end
        object SpeedButton4: TSpeedButton
          Left = 189
          Top = 2
          Width = 63
          Height = 41
          Hint = #21024#38500#31185#30446'Ctrl+D'
          Caption = #21024#38500
          Flat = True
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            04000000000080000000CE0E0000D80E00001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            7777777777777777777777777777777770F77770F7777777777777000F777777
            0F7777000F777770F777777000F77700F7777777000F700F77777777700000F7
            7777777777000F7777777777700000F777777777000F70F77777770000F77700
            F77770000F7777700F77700F7777777700F77777777777777777}
          Layout = blGlyphTop
          ParentShowHint = False
          ShowHint = True
          OnClick = N7Click
        end
        object SpeedButton5: TSpeedButton
          Left = 252
          Top = 2
          Width = 63
          Height = 41
          Caption = #25688#35201#23383#20856
          Flat = True
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            04000000000080000000CE0E0000D80E00001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            7777447777777777777777477777777777777477700000000077444777777777
            7777777777777777777744477777777777777477777777777777774770000000
            0077447777777777777777777777777777774447777777777777747777777777
            7777447770000000007774777777777777777777777777777777}
          Layout = blGlyphTop
          ParentShowHint = False
          ShowHint = True
          OnClick = N8Click
        end
        object SpeedButton6: TSpeedButton
          Left = 315
          Top = 2
          Width = 63
          Height = 41
          Hint = #22797#21046#25688#35201'Ctrl+V'
          Caption = #22797#21046#25688#35201
          Flat = True
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
            0707070707070707070707070707070704040404040404040407070707070707
            04FFFFFFFFFFFFFF040707070707070704FF0000000000FF0407000000000000
            04FFFFFFFFFFFFFF040700FFFFFFFFFF04FF0000000000FF040700FF00000000
            04FFFFFFFFFFFFFF040700FFFFFFFFFF04FF0000FF040404040700FF00000000
            04FFFFFFFF04FF04070700FFFFFFFFFF04FFFFFFFF040407070700FF0000FF00
            0404040404040707070700FFFFFFFF00FF00070707070707070700FFFFFFFF00
            0007070707070707070700000000000007070707070707070707070707070707
            07070707070707070707}
          Layout = blGlyphTop
          ParentShowHint = False
          ShowHint = True
          OnClick = N9Click
        end
        object SpeedButton7: TSpeedButton
          Left = 378
          Top = 2
          Width = 63
          Height = 41
          Hint = #26356#26032#20973#35777#32534#21495
          Caption = #26356#26032#32534#21495
          Flat = True
          Glyph.Data = {
            9E050000424D9E05000000000000360400002800000012000000120000000100
            080000000000680100001217000012170000000100000000000000000000F870
            48000048D800F8F8F800003090004870F80090300000F8886800006F00006E00
            3100003600002E00670000690000660000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000013000060AD1700000000000000E400F712000035A6FC00770000001300
            0700A7FC7700080613000083A600FC7700000000000035A5FC0077FFFF000000
            7C00010000000000000000000000000000000000000000000000000000000000
            31000000000000EAF100006400006600D800CD1700007801130000D8CD001700
            780001130000D0CD1700000000000000C000F7120000C8F3EB007770F5001200
            0000ECFD7F0002000000000000001300E8000100000001000A0000884000F877
            6000AD1700000100000000998400E6775400F71200000101010001D8F8001200
            450090FB7700801FF80077FFFF00FFFF6000F8120000AD84E6007760F8001200
            D80084E677000000000000FFFF000000C800EAF10000C8EAF100001800000000
            00000000000044F8120000400000000000000000000028F81200000000000000
            00000000000000000000000C000000000200000000000101120000872B00F877
            0000ECFD7F00000000000002000000006C00001A020068AD1700007FFF00FFFF
            00000000000068AD1700000500000000870031E6770084F8120000218600E677
            9800F81200006713000010FFFF0000007C0001000000C8EAF100000000000000
            7000F8120000ACF8120000D8F8001200100030001000F8400000105F5400E677
            7C0001000000D0F8120000D8F80012000800000000000E000000030303030303
            0303F8F9F8E9A7A703030303F9B50303030303030389EB090606F6F9BF030303
            F9B50303F900000000008B0707E907C8C8000303F9B503030000000000000082
            8201070706D70003F9B50303000405050500F9F9B400EB070706D7C2F9B503A7
            E900FF050500F8A70303F9B5F90701A8F9B503F90AE805050489F9A70303C7FF
            B5B5B1EBF9B50300B9050502C8D7B403030303AF090707E3F9B50300F8050504
            B5C203030303030382070709F9B5030004C005F88C0303030303A703000707B5
            F9B503FF040505E8F9EF03030303F900000707DFF9B50300DD05A80206EF0303
            03030000EB07F9B5F9B503A700020505E803030303030DF9B5B5B1DFF9B50303
            F900B9050289C20303039CF9B10706F8F9B503C70300D4E805028B00F9EFF607
            0707070BF9B50303030300000205028900D4C8D7AFAFC806F9B50303030303F9
            00E8050504049907F8F9B4C7F9B50303030303A703C2F609F809C20303030303
            F9B5}
          Layout = blGlyphTop
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButton7Click
        end
        object Label25: TLabel
          Left = 441
          Top = 2
          Width = 148
          Height = 37
          Caption = #36716#24080#20973#35777
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -37
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Panel2: TPanel
          Left = 589
          Top = 2
          Width = 177
          Height = 41
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          object Label26: TLabel
            Left = 24
            Top = 6
            Width = 33
            Height = 13
            Caption = #38468#20214':'
          end
          object Edit12: TEdit
            Left = 62
            Top = 2
            Width = 27
            Height = 21
            TabOrder = 0
            Text = '1'
          end
          object UpDown1: TUpDown
            Left = 89
            Top = 2
            Width = 16
            Height = 21
            Associate = Edit12
            Max = 200
            Position = 1
            TabOrder = 1
          end
          object CheckBox1: TCheckBox
            Left = 24
            Top = 24
            Width = 89
            Height = 17
            Caption = #20445#23384#26102#25171#21360
            TabOrder = 2
          end
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 427
        Width = 858
        Height = 25
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object Label29: TLabel
          Left = 32
          Top = 5
          Width = 46
          Height = 13
          Caption = #21046#21333#20154':'
        end
        object Label30: TLabel
          Left = 578
          Top = 2
          Width = 33
          Height = 13
          Caption = #21512#35745':'
        end
        object Edit15: TEdit
          Left = 88
          Top = 2
          Width = 121
          Height = 21
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 0
        end
        object StaticText1: TStaticText
          Left = 622
          Top = 0
          Width = 80
          Height = 17
          Alignment = taRightJustify
          AutoSize = False
          BevelInner = bvNone
          BevelKind = bkSoft
          Caption = '0.00'
          Color = clWindow
          ParentColor = False
          TabOrder = 1
        end
        object StaticText2: TStaticText
          Left = 701
          Top = 0
          Width = 81
          Height = 17
          Alignment = taRightJustify
          AutoSize = False
          BevelInner = bvNone
          BevelKind = bkSoft
          Caption = '0.00'
          Color = clWindow
          ParentColor = False
          TabOrder = 2
        end
      end
      object Sgrid1: TStringGrid
        Left = 0
        Top = 45
        Width = 858
        Height = 382
        Align = alClient
        ColCount = 7
        Ctl3D = False
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goEditing]
        ParentCtl3D = False
        PopupMenu = PopupMenu3
        TabOrder = 2
        OnDrawCell = Sgrid1DrawCell
        OnExit = Sgrid1Exit
        OnKeyDown = Sgrid1KeyDown
        OnKeyPress = Sgrid1KeyPress
        OnMouseDown = Sgrid1MouseDown
        OnSelectCell = Sgrid1SelectCell
        ColWidths = (
          157
          307
          37
          61
          83
          81
          84)
      end
      object sgrid2: TStringGrid
        Left = 16
        Top = 221
        Width = 161
        Height = 140
        ColCount = 2
        FixedCols = 0
        RowCount = 2
        TabOrder = 3
        Visible = False
        ColWidths = (
          70
          68)
      end
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 0
    Width = 866
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 8
      Top = 5
      Width = 30
      Height = 30
      Cursor = crHandPoint
      Hint = #20445#23384
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TabStop = False
      OnClick = BitBtn1Click
      OnEnter = BitBtn1Enter
      Glyph.Data = {
        56070000424D5607000000000000360400002800000028000000140000000100
        0800000000002003000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A600000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
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
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
        0303030303030303030303030303030303030303030303030303030303030303
        0303030303030303030303030303030303030303030303030303030303030303
        0303030303030303030303030303030303030303030303030303030303030303
        030303FFFFFFFFFFFFFFFFFFFFFFFF030303030303F800000000000000000000
        0000F803030303030303F8F8F8F8F8F8F8F8F8F8F8F803FF030303030300FCFC
        00F8FCFCFF070700FCFC00030303030303F8FF03F8FF0303030303F8FF03F8FF
        030303030300FCFC00F8FCFCFF070700FCFC00030303030303F8FF03F8FF0303
        030303F8FF03F8FF030303030300FCFC0007F8F807070700FCFC000303030303
        03F8FF03F8FFFFFFFFFFFFF80303F8FF030303030300FCFC0600000000000006
        FCFC00030303030303F8FF0303F8F8F8F8F8F8030303F8FF030303030300FCFC
        FCFCFCFCFCFCFCFCFCFC00030303030303F8FF0303FFFFFFFFFFFFFFFF03F8FF
        030303030300FC06000000000000000006FC00030303030303F8FF03F8F8F8F8
        F8F8F8F803FFF8FF030303030300FC00FFFFFFFFFFFFFFFF00FC000303030303
        03F8FFF8FF03030303030303F8FFF8FF030303030300FC00FFFFFFFFFFFFFFFF
        00FC00030303030303F8FFF8FF03030303030303F8FFF8FF030303030300FC00
        FFFFFFFFFFFFFFFF00FC00030303030303F8FFF8FF03030303030303F8FFF8FF
        030303030300FC00FFFFFFFFFFFFFFFF00FC00030303030303F8FFF8FF030303
        03030303F8FFF8FF0303030303000000FFFFFFFFFFFFFFFF0000000303030303
        03F8FFF8FF03030303030303F8FFF8FF030303030300FC00FFFFFFFFFFFFFFFF
        00FC00030303030303F8FFF8FFFFFFFFFFFFFFFFF8FFF8030303030303F80000
        00000000000000000000F803030303030303F8F8F8F8F8F8F8F8F8F8F8F80303
        0303030303030303030303030303030303030303030303030303030303030303
        0303030303030303030303030303030303030303030303030303030303030303
        0303030303030303030303030303030303030303030303030303030303030303
        0303030303030303030303030303030303030303030303030303}
      NumGlyphs = 2
    end
    object BitBtn3: TBitBtn
      Left = 42
      Top = 5
      Width = 30
      Height = 30
      Cursor = crHandPoint
      Hint = #21462#28040
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TabStop = False
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333FFFFF333333000033333388888833333333333F888888FFF333
        000033338811111188333333338833FFF388FF33000033381119999111833333
        38F338888F338FF30000339119933331111833338F388333383338F300003391
        13333381111833338F8F3333833F38F3000039118333381119118338F38F3338
        33F8F38F000039183333811193918338F8F333833F838F8F0000391833381119
        33918338F8F33833F8338F8F000039183381119333918338F8F3833F83338F8F
        000039183811193333918338F8F833F83333838F000039118111933339118338
        F3833F83333833830000339111193333391833338F33F8333FF838F300003391
        11833338111833338F338FFFF883F83300003339111888811183333338FF3888
        83FF83330000333399111111993333333388FFFFFF8833330000333333999999
        3333333333338888883333330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object PopupMenu3: TPopupMenu
    OnPopup = PopupMenu3Popup
    Left = 296
    Top = 5
    object N4: TMenuItem
      Caption = #28155#21152
      ShortCut = 16449
      OnClick = N4Click
    end
    object N6: TMenuItem
      Caption = #25554#20837#31185#30446
      OnClick = N6Click
    end
    object N5: TMenuItem
      Caption = #20462#25913#31185#30446
      OnClick = N5Click
    end
    object N11: TMenuItem
      Caption = #20462#25913#36135#24065
      OnClick = N11Click
    end
    object N7: TMenuItem
      Caption = #21024#38500
      ShortCut = 16452
      OnClick = N7Click
    end
    object N10: TMenuItem
      Caption = '-'
    end
    object N8: TMenuItem
      Caption = #25688#35201#23383#20856
      OnClick = N8Click
    end
    object N9: TMenuItem
      Caption = #22797#21046#25688#35201
      ShortCut = 16471
      OnClick = N9Click
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 216
    Top = 160
    object N1: TMenuItem
      Caption = #28155#21152#24037#20855','#26434#39033#21457#31080#21450#26080#36864#36135#22791#24536
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #21024#38500
      OnClick = N2Click
    end
  end
  object PopupMenu2: TPopupMenu
    OnPopup = PopupMenu2Popup
    Left = 216
    Top = 320
    object N3: TMenuItem
      Caption = #25353#26631#20934#21457#31080#25110#36864#36135#22791#24536#28155#21152
      OnClick = N3Click
    end
    object N12: TMenuItem
      Caption = #25353#25351#27966#26126#32454#28155#21152
      OnClick = N12Click
    end
    object N14: TMenuItem
      Caption = #25353#36864#36135#26126#32454#28155#21152
      OnClick = N14Click
    end
    object N13: TMenuItem
      Caption = #21024#38500
      OnClick = N13Click
    end
    object N15: TMenuItem
      Caption = '-'
    end
    object EXCEL2: TMenuItem
      Caption = #23548#20837'EXCEL'
      Hint = 'Excel'#31532#19968#21015#20026#26631#35782','#20108#21015#20026#31867#22411','#19977#21015#20026#24320#31080#25968#37327','#13#10#22235#21015#20026#26085#26399','#20116#21015#20026#31246#31080#21495','#20845#21015#20026#24320#31080#20215#26684
      OnClick = EXCEL2Click
    end
    object EXCEL1: TMenuItem
      Caption = #23548#20986'EXCEL'
      OnClick = EXCEL1Click
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.XLS'
    Filter = '*.XLS|*.XLS'
    Left = 260
    Top = 322
  end
  object PopupMenu4: TPopupMenu
    Left = 324
    Top = 348
    object EXCEL3: TMenuItem
      Caption = #23548#20986'EXCEL'
      OnClick = EXCEL1Click
    end
  end
end
