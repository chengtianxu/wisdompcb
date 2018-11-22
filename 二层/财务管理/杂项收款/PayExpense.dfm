object Form_mic: TForm_mic
  Left = 228
  Top = 182
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26434#39033#25910#27454
  ClientHeight = 466
  ClientWidth = 688
  Color = clScrollBar
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 31
    Align = alTop
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 0
    object BitBtn3: TBitBtn
      Left = 32
      Top = 3
      Width = 25
      Height = 25
      Hint = #21462#28040
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
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
    object BitBtn2: TBitBtn
      Left = 8
      Top = 3
      Width = 25
      Height = 25
      Hint = #20648#23384
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TabStop = False
      OnClick = BitBtn2Click
      OnEnter = BitBtn2Enter
      Glyph.Data = {
        26050000424D26050000000000003604000028000000100000000F0000000100
        080000000000F0000000CE0E0000C40E00000001000000000000000000000000
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
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF00000000
        000000000000000000FFFF0003030000000000000707000300FFFF0003030000
        000000000707000300FFFF0003030000000000000707000300FFFF0003030000
        000000000000000300FFFF0003030303030303030303030300FFFF0003030000
        000000000000030300FFFF000300FFFFFFFFFFFFFFFF000300FFFF000300FFFF
        FFFFFFFFFFFF000300FFFF000300FFFFFFFFFFFFFFFF000300FFFF000300FFFF
        FFFFFFFFFFFF000300FFFF000300FFFFFFFFFFFFFFFF000000FFFF000300FFFF
        FFFFFFFFFFFF000700FFFF0000000000000000000000000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF}
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 31
    Width = 688
    Height = 435
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = #21457#31080#26126#32454
      object Label3: TLabel
        Left = 359
        Top = 60
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = #27719#29575':'
      end
      object Label2: TLabel
        Left = 76
        Top = 60
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = #36135#24065':'
      end
      object Label9: TLabel
        Left = 333
        Top = 10
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = #25903#31080#26085#26399':'
      end
      object Label8: TLabel
        Left = 50
        Top = 10
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = #25903#31080#21495#30721':'
      end
      object Label5: TLabel
        Left = 50
        Top = 114
        Width = 59
        Height = 13
        Caption = #31080#25454#22791#27880':'
      end
      object Label4: TLabel
        Left = 50
        Top = 34
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = #29616#37329#38134#34892':'
      end
      object Label15: TLabel
        Left = 214
        Top = 60
        Width = 21
        Height = 13
        Caption = '   '
      end
      object Label14: TLabel
        Left = 214
        Top = 88
        Width = 28
        Height = 13
        Caption = '    '
      end
      object Label11: TLabel
        Left = 333
        Top = 113
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = #31080#25454#37329#39069':'
      end
      object Label1: TLabel
        Left = 50
        Top = 88
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = #32463#21150#20154#21592':'
      end
      object abbr_name: TLabel
        Left = 248
        Top = 88
        Width = 63
        Height = 13
        Caption = 'abbr_name'
        Visible = False
      end
      object Label10: TLabel
        Left = 333
        Top = 34
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = #24403#21069#20313#39069':'
      end
      object Label6: TLabel
        Left = 335
        Top = 86
        Width = 59
        Height = 13
        Caption = #24037#21378#31616#31216':'
      end
      object BitBtn4: TBitBtn
        Left = 181
        Top = 82
        Width = 24
        Height = 25
        TabOrder = 3
        TabStop = False
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
      object BitBtn5: TBitBtn
        Left = 180
        Top = 54
        Width = 25
        Height = 25
        Enabled = False
        TabOrder = 7
        TabStop = False
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
      object Edit6: TEdit
        Left = 397
        Top = 109
        Width = 91
        Height = 21
        Color = cl3DLight
        ReadOnly = True
        TabOrder = 5
        Text = '0.00'
      end
      object Edit5: TEdit
        Left = 397
        Top = 56
        Width = 91
        Height = 21
        TabOrder = 4
        Text = '0.00000000'
        OnExit = Edit5Exit
        OnKeyPress = Edit5KeyPress
      end
      object Edit4: TEdit
        Left = 115
        Top = 6
        Width = 114
        Height = 21
        TabOrder = 0
      end
      object Edit3: TEdit
        Left = 115
        Top = 31
        Width = 146
        Height = 21
        Color = cl3DLight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
      end
      object edit2: TEdit
        Left = 115
        Top = 56
        Width = 57
        Height = 21
        Color = cl3DLight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 9
      end
      object edit1: TEdit
        Left = 115
        Top = 84
        Width = 57
        Height = 21
        Color = cl3DLight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 10
      end
      object DBEdit3: TDBEdit
        Left = 398
        Top = 6
        Width = 91
        Height = 21
        DataField = 'TDATE'
        DataSource = DM.DataSource2
        TabOrder = 1
      end
      object DBEdit2: TDBEdit
        Left = 115
        Top = 110
        Width = 173
        Height = 21
        DataField = 'REMARK'
        DataSource = DM.DataSource2
        TabOrder = 6
      end
      object BitBtn6: TBitBtn
        Left = 271
        Top = 29
        Width = 25
        Height = 25
        TabOrder = 2
        TabStop = False
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
      object SText3: TStaticText
        Left = 398
        Top = 31
        Width = 91
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        BevelInner = bvLowered
        BevelKind = bkSoft
        Caption = '0.00'
        TabOrder = 11
      end
      object StringGrid1: TStringGrid
        Left = 0
        Top = 141
        Width = 680
        Height = 266
        Align = alBottom
        ColCount = 3
        Ctl3D = False
        DefaultRowHeight = 19
        FixedColor = clSkyBlue
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goEditing, goTabs]
        ParentCtl3D = False
        PopupMenu = PopupMenu1
        TabOrder = 12
        OnDrawCell = StringGrid1DrawCell
        OnExit = StringGrid1Exit
        OnKeyPress = StringGrid1KeyPress
        OnKeyUp = StringGrid1KeyUp
        OnMouseDown = StringGrid1MouseDown
        OnSelectCell = StringGrid1SelectCell
        ColWidths = (
          173
          364
          137)
      end
      object StringGrid2: TStringGrid
        Left = 12
        Top = 296
        Width = 141
        Height = 89
        ColCount = 2
        DefaultRowHeight = 19
        FixedCols = 0
        RowCount = 2
        ScrollBars = ssNone
        TabOrder = 13
        Visible = False
      end
      object CheckBox2: TCheckBox
        Left = 504
        Top = 8
        Width = 79
        Height = 17
        Caption = #36830#32493#26032#22686
        Checked = True
        State = cbChecked
        TabOrder = 14
        Visible = False
      end
      object ComboBox1: TComboBox
        Left = 398
        Top = 82
        Width = 107
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 15
        OnChange = ComboBox1Change
      end
    end
    object TabSheet2: TTabSheet
      Caption = #20973#35777#26126#32454
      ImageIndex = 1
      object Label23: TLabel
        Left = 18
        Top = 55
        Width = 59
        Height = 13
        Caption = #20973#35777#32534#21495':'
      end
      object Label24: TLabel
        Left = 218
        Top = 55
        Width = 59
        Height = 13
        Caption = #20973#35777#26085#26399':'
      end
      object Label26: TLabel
        Left = 500
        Top = 56
        Width = 59
        Height = 13
        Caption = #38468#20214#24352#25968':'
      end
      object Label27: TLabel
        Left = 20
        Top = 81
        Width = 59
        Height = 13
        Caption = #20250#35745#24180#24230':'
      end
      object Label28: TLabel
        Left = 219
        Top = 80
        Width = 59
        Height = 13
        Caption = #20250#35745#26376#20221':'
      end
      object ToolBar1: TToolBar
        Left = 0
        Top = 0
        Width = 680
        Height = 46
        ButtonHeight = 37
        Caption = 'ToolBar1'
        Color = clBtnFace
        ParentColor = False
        TabOrder = 0
        object SpeedButton1: TSpeedButton
          Left = 0
          Top = 2
          Width = 67
          Height = 37
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
          Left = 67
          Top = 2
          Width = 68
          Height = 37
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
          Left = 135
          Top = 2
          Width = 67
          Height = 37
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
          Left = 202
          Top = 2
          Width = 67
          Height = 37
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
          Left = 269
          Top = 2
          Width = 69
          Height = 37
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
          Left = 338
          Top = 2
          Width = 69
          Height = 37
          Hint = #22797#21046#25688#35201'Ctrl+W'
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
          Left = 407
          Top = 2
          Width = 69
          Height = 37
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
          Left = 476
          Top = 2
          Width = 148
          Height = 37
          Caption = #25910#27454#20973#35777
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -37
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
      end
      object Edit11: TEdit
        Left = 81
        Top = 51
        Width = 121
        Height = 21
        ReadOnly = True
        TabOrder = 1
      end
      object Edit12: TEdit
        Left = 281
        Top = 51
        Width = 121
        Height = 21
        TabOrder = 2
        OnExit = Edit12Exit
        OnKeyPress = Edit12KeyPress
      end
      object Edit13: TEdit
        Left = 562
        Top = 52
        Width = 45
        Height = 21
        TabOrder = 3
        Text = '0'
        OnKeyPress = Edit13KeyPress
      end
      object Edit14: TEdit
        Left = 82
        Top = 76
        Width = 81
        Height = 21
        Color = cl3DLight
        ReadOnly = True
        TabOrder = 4
      end
      object Edit15: TEdit
        Left = 281
        Top = 75
        Width = 81
        Height = 21
        Color = cl3DLight
        ReadOnly = True
        TabOrder = 5
      end
      object CheckBox1: TCheckBox
        Left = 501
        Top = 77
        Width = 121
        Height = 17
        Caption = #20445#23384#26102#25171#21360#20973#35777
        TabOrder = 6
      end
      object UpDown1: TUpDown
        Left = 607
        Top = 52
        Width = 15
        Height = 21
        Associate = Edit13
        Max = 200
        TabOrder = 7
      end
      object Panel1: TPanel
        Left = 0
        Top = 382
        Width = 680
        Height = 25
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 8
        object Label29: TLabel
          Left = 32
          Top = 5
          Width = 46
          Height = 13
          Caption = #21046#21333#20154':'
        end
        object Label30: TLabel
          Left = 477
          Top = 2
          Width = 33
          Height = 13
          Caption = #21512#35745':'
        end
        object Edit16: TEdit
          Left = 88
          Top = 2
          Width = 121
          Height = 21
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 0
          Text = 'Edit16'
        end
        object StaticText1: TStaticText
          Left = 521
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
          Left = 600
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
        Top = 103
        Width = 680
        Height = 279
        Align = alBottom
        ColCount = 7
        Ctl3D = False
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
        ParentCtl3D = False
        PopupMenu = PopupMenu3
        TabOrder = 9
        OnDrawCell = Sgrid1DrawCell
        OnExit = Sgrid1Exit
        OnKeyDown = Sgrid1KeyDown
        OnKeyPress = Sgrid1KeyPress
        OnMouseDown = Sgrid1MouseDown
        OnSelectCell = Sgrid1SelectCell
        ColWidths = (
          148
          179
          32
          72
          83
          77
          76)
      end
      object sgrid2: TStringGrid
        Left = 16
        Top = 245
        Width = 137
        Height = 77
        ColCount = 2
        FixedCols = 0
        RowCount = 2
        TabOrder = 10
        Visible = False
        ColWidths = (
          66
          64)
      end
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 168
    object N1: TMenuItem
      Caption = #22686#21152
      OnClick = N1Click
    end
    object N3: TMenuItem
      Caption = #26367#25442
      OnClick = N3Click
    end
    object N2: TMenuItem
      Caption = #21024#38500
      OnClick = N2Click
    end
  end
  object PopupMenu3: TPopupMenu
    OnPopup = PopupMenu3Popup
    Left = 216
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
end
