object Form1: TForm1
  Left = 671
  Top = 154
  Width = 1096
  Height = 675
  Caption = #20837#24211#35745#21010#23433#25490#34920
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1080
    Height = 69
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 434
      Top = 15
      Width = 91
      Height = 13
      Alignment = taRightJustify
      Caption = #35745#21010#20837#24211#26085#26399#65306
    end
    object Label3: TLabel
      Left = 120
      Top = 14
      Width = 65
      Height = 13
      Alignment = taRightJustify
      Caption = #21152#24037#24418#24335#65306
    end
    object Label2: TLabel
      Left = 573
      Top = 15
      Width = 13
      Height = 13
      Caption = #24180
    end
    object Label4: TLabel
      Left = 622
      Top = 15
      Width = 13
      Height = 13
      Caption = #26376
    end
    object Label5: TLabel
      Left = 671
      Top = 15
      Width = 20
      Height = 13
      Caption = #26085'-'
    end
    object Label6: TLabel
      Left = 728
      Top = 15
      Width = 13
      Height = 13
      Caption = #26085
    end
    object Label7: TLabel
      Left = 258
      Top = 44
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = #24037#21378#65306
    end
    object Label8: TLabel
      Left = 120
      Top = 44
      Width = 65
      Height = 13
      Alignment = taRightJustify
      Caption = #20135#21697#31867#22411#65306
    end
    object SpeedButton5: TSpeedButton
      Left = 658
      Top = 38
      Width = 88
      Height = 23
      Caption = #33258#21160#35843#33410#21015#23485
      OnClick = SpeedButton5Click
    end
    object Button1: TButton
      Left = 8
      Top = 6
      Width = 51
      Height = 28
      Caption = #36864#20986
      TabOrder = 13
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 8
      Top = 36
      Width = 51
      Height = 28
      Caption = #23548#20986
      TabOrder = 12
      OnClick = Button2Click
    end
    object BitBtn1: TBitBtn
      Left = 61
      Top = 36
      Width = 51
      Height = 28
      Hint = #26597#25214
      Caption = #26597#35810
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      OnClick = BitBtn1Click
    end
    object ComboBox1: TComboBox
      Left = 180
      Top = 10
      Width = 69
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 3
      TabOrder = 0
      Text = #20840#37096
      Items.Strings = (
        #33258#21046
        #22806#21457
        #21322#21046#31243
        #20840#37096)
    end
    object UpDown1: TUpDown
      Left = 607
      Top = 11
      Width = 13
      Height = 21
      Associate = Edit1
      Min = 1
      Max = 12
      Position = 11
      TabOrder = 15
      Thousands = False
    end
    object Edit1: TEdit
      Left = 587
      Top = 11
      Width = 20
      Height = 21
      AutoSize = False
      MaxLength = 2
      ReadOnly = True
      TabOrder = 3
      Text = '11'
      OnChange = Edit1Change
    end
    object UpDown2: TUpDown
      Left = 558
      Top = 11
      Width = 13
      Height = 21
      Associate = Edit2
      Min = 2000
      Max = 2050
      Position = 2005
      TabOrder = 14
      Thousands = False
    end
    object Edit2: TEdit
      Left = 519
      Top = 11
      Width = 39
      Height = 21
      AutoSize = False
      MaxLength = 4
      ReadOnly = True
      TabOrder = 2
      Text = '2005'
      OnChange = Edit2Change
    end
    object RadioGroup1: TRadioGroup
      Left = 260
      Top = 4
      Width = 161
      Height = 33
      Caption = #32479#35745#21333#20301
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #25968#37327
        #38754#31215)
      TabOrder = 1
    end
    object Edit3: TEdit
      Left = 534
      Top = 40
      Width = 117
      Height = 21
      TabOrder = 9
    end
    object ComboBox2: TComboBox
      Left = 430
      Top = 40
      Width = 97
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 2
      TabOrder = 8
      Text = #26412#21378#32534#21495
      Items.Strings = (
        #35746#21333#32534#21495
        #23458#25143#20195#30721
        #26412#21378#32534#21495
        #23458#25143#22411#21495
        #23458#25143#35746#21333#21495)
    end
    object Edit4: TEdit
      Left = 636
      Top = 11
      Width = 20
      Height = 21
      AutoSize = False
      MaxLength = 2
      ReadOnly = True
      TabOrder = 4
      Text = '1'
    end
    object UpDown3: TUpDown
      Left = 656
      Top = 11
      Width = 13
      Height = 21
      Associate = Edit4
      Min = 1
      Max = 31
      Position = 1
      TabOrder = 16
      Thousands = False
    end
    object Edit5: TEdit
      Left = 692
      Top = 11
      Width = 20
      Height = 21
      AutoSize = False
      MaxLength = 2
      ReadOnly = True
      TabOrder = 5
      Text = '30'
    end
    object UpDown4: TUpDown
      Left = 712
      Top = 11
      Width = 13
      Height = 21
      Associate = Edit5
      Min = 1
      Max = 31
      Position = 30
      TabOrder = 17
    end
    object Button3: TButton
      Left = 61
      Top = 6
      Width = 51
      Height = 28
      Caption = #26126#32454
      TabOrder = 11
      OnClick = Button3Click
    end
    object ComboBox3: TComboBox
      Left = 180
      Top = 40
      Width = 69
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 6
      Text = #37327#20135
      Items.Strings = (
        #37327#20135
        #26679#26495
        #20840#37096)
    end
    object ComboBox4: TComboBox
      Left = 292
      Top = 40
      Width = 130
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 7
      Text = 'All'#65293#25152#26377#24037#21378
      Items.Strings = (
        'All'#65293#25152#26377#24037#21378)
    end
    object cbBackorder: TCheckBox
      Left = 765
      Top = 44
      Width = 100
      Height = 17
      Caption = #27424#36135#25968#37327#26174#31034
      TabOrder = 18
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 69
    Width = 1080
    Height = 568
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #35745#21010#20837#24211#26126#32454
      object SGrid1: TStringGrid
        Left = 0
        Top = 0
        Width = 1072
        Height = 540
        Align = alClient
        ColCount = 17
        Ctl3D = False
        DefaultRowHeight = 20
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goColMoving]
        ParentCtl3D = False
        PopupMenu = PopupMenu1
        TabOrder = 0
        OnDblClick = Button3Click
        OnKeyDown = SGrid1KeyDown
        OnMouseDown = SGrid1MouseDown
        ColWidths = (
          91
          57
          60
          70
          77
          61
          93
          64
          85
          59
          57
          64
          64
          64
          64
          64
          64)
      end
    end
    object TabSheet2: TTabSheet
      Caption = #35745#21010#20837#24211#27719#24635
      ImageIndex = 1
      object DecisionGrid1: TDecisionGrid
        Left = 0
        Top = 0
        Width = 1080
        Height = 510
        DefaultColWidth = 90
        DefaultRowHeight = 20
        CaptionColor = clActiveCaption
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clCaptionText
        CaptionFont.Height = -11
        CaptionFont.Name = 'MS Sans Serif'
        CaptionFont.Style = []
        DataColor = clInfoBk
        DataSumColor = clNone
        DataFont.Charset = DEFAULT_CHARSET
        DataFont.Color = clWindowText
        DataFont.Height = -11
        DataFont.Name = 'MS Sans Serif'
        DataFont.Style = []
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'MS Sans Serif'
        LabelFont.Style = []
        LabelColor = clBtnFace
        LabelSumColor = clInactiveCaption
        DecisionSource = DecisionSource1
        Dimensions = <
          item
            FieldName = #26085#26399
            Color = clNone
            Alignment = taCenter
            Subtotals = True
          end
          item
            FieldName = #20135#21697#31867#22411
            Color = clNone
            Alignment = taCenter
            Subtotals = True
          end
          item
            FieldName = #38754#31215'm2'
            Color = clNone
            Alignment = taCenter
            Subtotals = True
          end
          item
            FieldName = #25968#37327'PCS'
            Color = clNone
            Alignment = taCenter
            Subtotals = True
          end>
        Totals = True
        ShowCubeEditor = False
        Align = alClient
        Color = clBtnFace
        GridLineWidth = 1
        GridLineColor = clWindowText
        TabOrder = 0
        OnKeyDown = DecisionGrid1KeyDown
      end
      object DecisionPivot1: TDecisionPivot
        Left = 0
        Top = 510
        Width = 1080
        Height = 41
        ButtonAutoSize = True
        DecisionSource = DecisionSource1
        GroupLayout = xtHorizontal
        Groups = [xtRows, xtColumns, xtSummaries]
        ButtonSpacing = 0
        ButtonWidth = 64
        ButtonHeight = 24
        GroupSpacing = 10
        BorderWidth = 0
        BorderStyle = bsNone
        Align = alBottom
        TabOrder = 1
      end
    end
    object TabSheet3: TTabSheet
      Caption = #35745#21010#20837#24211#26126#32454#22270#31034
      ImageIndex = 2
      object Chart1: TChart
        Left = 0
        Top = 0
        Width = 1072
        Height = 540
        AllowPanning = pmNone
        AnimatedZoom = True
        AnimatedZoomSteps = 4
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        BackWall.Color = clSilver
        Foot.Alignment = taLeftJustify
        Foot.Text.Strings = (
          '')
        Foot.Visible = False
        Gradient.Direction = gdBottomTop
        Gradient.Visible = True
        LeftWall.Brush.Color = clWhite
        LeftWall.Brush.Style = bsClear
        MarginBottom = 5
        MarginLeft = 1
        MarginTop = 2
        Title.AdjustFrame = False
        Title.Alignment = taLeftJustify
        Title.Text.Strings = (
          'TChart')
        BackColor = clSilver
        BottomAxis.DateTimeFormat = 'd'#26085
        BottomAxis.LabelsAngle = 300
        BottomAxis.LabelsSeparation = 0
        BottomAxis.LabelsSize = 28
        BottomAxis.MinorTickLength = 3
        BottomAxis.TickLength = 0
        BottomAxis.TickOnLabelsOnly = False
        BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
        BottomAxis.Title.Font.Color = clBlack
        BottomAxis.Title.Font.Height = -13
        BottomAxis.Title.Font.Name = 'Arial'
        BottomAxis.Title.Font.Style = []
        LeftAxis.MinorTickCount = 1
        LeftAxis.MinorTickLength = 7
        LeftAxis.TickLength = 3
        LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -13
        LeftAxis.Title.Font.Name = 'Arial'
        LeftAxis.Title.Font.Style = []
        Legend.Alignment = laLeft
        Legend.ShadowSize = 2
        Legend.TopPos = 2
        MaxPointsPerPage = 20
        RightAxis.Title.Angle = 0
        View3D = False
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        DesignSize = (
          1072
          540)
        object SpeedButton1: TSpeedButton
          Left = 864
          Top = 3
          Width = 27
          Height = 25
          Hint = #19978#19968#39029
          Anchors = [akTop, akRight]
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0080000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0080000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008000
            000080000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00800000008000
            000080000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF008000000080000000800000008000
            000080000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF008000000080000000800000008000
            000080000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF008000000080000000800000008000
            000080000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0080000000800000008000
            000080000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008000
            000080000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0080000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0080000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButton1Click
        end
        object SpeedButton2: TSpeedButton
          Left = 892
          Top = 3
          Width = 26
          Height = 25
          Hint = #19979#19968#39029
          Anchors = [akTop, akRight]
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF0080000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF0080000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF008000000080000000FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00800000008000000080000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00800000008000000080000000800000008000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00800000008000000080000000800000008000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00800000008000000080000000800000008000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF0080000000800000008000000080000000FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF008000000080000000FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF0080000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF0080000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButton2Click
        end
        object SpeedButton3: TSpeedButton
          Left = 838
          Top = 3
          Width = 25
          Height = 25
          Hint = #20445#23384#22270#29255
          Anchors = [akTop, akRight]
          Glyph.Data = {
            C6050000424DC605000000000000360400002800000014000000140000000100
            08000000000090010000C40E0000C40E0000000100000000000000000000E8E0
            18008868080048484800D8D8E000C8C8C8001078F00070500000B0900800F8F8
            F800A8880800D0D8D800B8A81000A0800800C8D0D000E8E8E80068686800B0A0
            100098700800A8900800D0D0D000D8D8D80090700800B0981000C0A81000E0E0
            E0009878080090680800A0880800D8E0D800B8A01000B0901000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000100000000
            000000130000301A1600000000000000E400F712000035A6FC00770000001300
            0700A7FC7700080613000083A600FC7700000000000035A5FC0077FFFF000000
            6800010000000000000000000000000000000000000000000000000000000000
            31000000000000E2EC0000640000660000004716000078011300000047001600
            780001130000F8461600000000000000C000F7120000C8F3EB007770F5001200
            0000ECFD7F0002000000000000001300AF000000000001000A0000884000F877
            30001A1600000100000000998400E6775400F71200000101010001D8F8001200
            450090FB7700801FF80077FFFF00FFFF6000F8120000AD84E6007760F8001200
            D80084E677000000000000FFFF000000C800E2EC0000C8E2EC00001800000000
            00000000000044F8120000400000000000000000000028F81200000000000000
            00000000000000000000000C000000000200000000000101120000872B00F877
            0000ECFD7F00000000000002000000006C00001A0200381A1600007FFF00FFFF
            000000000000381A1600000500000000870031E6770084F8120000218600E677
            9800F81200006713000010FFFF000000680001000000C8E2EC00000000000000
            7000F8120000ACF8120000D8F8001200100030001000F8400000105F5400E677
            680001000000D0F8120000D8F80012000800000000000E0000000F0505BF05BF
            05BF05BF05BF05BF05BF05BF05C7BF0000000000000000000000000000000000
            00050500E1138CE0E0E0E0E0E0E0E0E0E006BD1B00BFBF00031305050505BF05
            050505050505181B00050500C60705050F050FC70F050FC70FBF011B00BFBF00
            011B05A7C7090383BF0503030305011300050500010705091003050503031003
            0305011B00BFBF00011BBF031005BF03101010101005181300050500010705C7
            0FC709C70FC70FC70F05011300BFBF00011B03171017101710171017101B1B18
            00050500011318131813181B181318131813181300BFBF0001181BC601C618C6
            01C601C60101181800050500E11713000003C210050505050510C61800BFBF00
            01181B000010C705C705BF0FC71718C600050500E113180000100F0505000005
            A717C61800BFBF0001C61B000010C70505000005C71718C600050500E1171300
            00100F05050000050F10C60100BFBF00BD0101000010090F0510100FC7170101
            00E90500000000000300000000000000000000000005C705BF05BF0509E9BF05
            BF05BF05BF05BF05BF09}
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButton3Click
        end
        object SpeedButton4: TSpeedButton
          Left = 810
          Top = 3
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
          OnClick = SpeedButton4Click
        end
        object UpDown5: TUpDown
          Left = 948
          Top = 5
          Width = 15
          Height = 21
          Anchors = [akTop, akRight]
          Associate = Edit6
          Min = 5
          Position = 20
          TabOrder = 0
        end
        object Edit6: TEdit
          Left = 927
          Top = 5
          Width = 21
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 1
          Text = '20'
          OnChange = Edit6Change
        end
        object CheckBox0: TCheckBox
          Left = 1
          Top = 537
          Width = 69
          Height = 21
          Anchors = [akLeft, akBottom]
          Caption = '3D'#26174#31034
          Color = clBtnHighlight
          ParentColor = False
          TabOrder = 2
          OnClick = CheckBox0Click
        end
        object Series1: TBarSeries
          Cursor = crArrow
          Marks.Arrow.Color = clBlue
          Marks.Arrow.Style = psDot
          Marks.ArrowLength = 10
          Marks.BackColor = clGray
          Marks.Frame.Color = 8421440
          Marks.Frame.Visible = False
          Marks.Style = smsValue
          Marks.Transparent = True
          Marks.Visible = True
          SeriesColor = 4689414
          ShowInLegend = False
          BarWidthPercent = 40
          XValues.DateTime = True
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
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    OnCommitTransComplete = ADOConnection1CommitTransComplete
    Left = 324
    Top = 109
  end
  object ADO360: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = ADO360CalcFields
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 38565d
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 38595d
      end>
    SQL.Strings = (
      
        'SELECT DISTINCT data0060.ENT_DATE,data0060.SCH_DATE,data0060.ISS' +
        'UED_QTY,'
      ' ROUND(Data0060.PARTS_ORDERED*Data0025.unit_sq, 4) AS order_sq,'
      
        '      Data0060.SALES_ORDER, Data0010.CUST_CODE,Data0025.MANU_PAR' +
        'T_NUMBER,'
      
        '      Data0025.MANU_PART_DESC,ROUND(Data0025.unit_sq, 6) AS unit' +
        '_sq, Data0097.PO_NUMBER,'
      
        '      Data0060.PARTS_ORDERED,Data0060.PARTS_ORDERED + Data0060.P' +
        'ARTS_RETURNED - Data0060.PARTS_SHIPPED'
      '       - Data0060.RETURNED_SHIP AS qty_qianhuo, Data0060.so_tp,'
      
        '      Data0060.RKEY,dbo.Data0008.PROD_CODE,data0060.REFERENCE_NU' +
        'MBER,data0060.ORIG_SCHED_SHIP_DATE'
      
        'FROM Data0008 INNER JOIN Data0025 ON Data0008.RKEY = Data0025.PR' +
        'OD_CODE_PTR'
      
        '     INNER JOIN Data0060 ON Data0025.RKEY = Data0060.CUST_PART_P' +
        'TR'
      '     INNER JOIN data0360 ON Data0060.RKEY = data0360.so_ptr'
      
        '     INNER JOIN Data0010 ON Data0060.CUSTOMER_PTR = Data0010.RKE' +
        'Y'
      
        '     INNER JOIN Data0097 ON Data0060.PURCHASE_ORDER_PTR = Data00' +
        '97.RKEY'
      'where (data0360.sch_date >= :dtpk1) and '
      '           (data0360.sch_date <= :dtpk2) and'
      '           (data0060.status = 1) and'
      
        '      (Data0060.PARTS_ORDERED+Data0060.PARTS_RETURNED-Data0060.P' +
        'ARTS_SHIPPED-Data0060.RETURNED_SHIP>0)'
      ''
      ''
      ''
      ''
      'ORDER BY Data0060.SALES_ORDER')
    Left = 326
    Top = 165
    object ADO360SALES_ORDER: TStringField
      DisplayLabel = #35746#21333#32534#21495
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ADO360CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADO360unit_sq: TFloatField
      DisplayLabel = 'PCS'#38754#31215'(m2)'
      FieldName = 'unit_sq'
      ReadOnly = True
    end
    object ADO360PO_NUMBER: TStringField
      DisplayLabel = #23458#25143#35746#21333#21495
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ADO360PARTS_ORDERED: TFloatField
      DisplayLabel = #35746#21333#25968#37327
      FieldName = 'PARTS_ORDERED'
    end
    object ADO360qty_qianhuo: TFloatField
      DisplayLabel = #27424#36135#25968#37327
      FieldName = 'qty_qianhuo'
      ReadOnly = True
    end
    object ADO360so_tp: TWordField
      FieldName = 'so_tp'
    end
    object ADO360so_type: TStringField
      DisplayLabel = #21152#24037#24418#24335
      FieldKind = fkCalculated
      FieldName = 'so_type'
      Size = 6
      Calculated = True
    end
    object ADO360RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO360PROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object ADO360MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADO360MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADO360REFERENCE_NUMBER: TStringField
      FieldName = 'REFERENCE_NUMBER'
      Size = 30
    end
    object ADO360ENT_DATE: TDateTimeField
      FieldName = 'ENT_DATE'
    end
    object ADO360SCH_DATE: TDateTimeField
      FieldName = 'SCH_DATE'
    end
    object ADO360order_sq: TFloatField
      FieldName = 'order_sq'
      ReadOnly = True
    end
    object ADO360ISSUED_QTY: TIntegerField
      FieldName = 'ISSUED_QTY'
    end
    object ADO360ORIG_SCHED_SHIP_DATE: TDateTimeField
      FieldName = 'ORIG_SCHED_SHIP_DATE'
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <>
    Left = 327
    Top = 227
  end
  object ADOtotal_360: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 38565d
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 38656d
      end>
    SQL.Strings = (
      
        'SELECT TOP 100 PERCENT data0360.sch_date, Data0008.PRODUCT_NAME,' +
        ' '
      
        '      ROUND(SUM(ISNull(data0360.quantity,0) *ISNUll( Data0025.un' +
        'it_sq,0)), 3) AS qty_mianji, '
      '      SUM(IsNull(data0360.quantity,0)) AS qty'
      
        'FROM Data0008 INNER JOIN Data0025 ON Data0008.RKEY = Data0025.PR' +
        'OD_CODE_PTR '
      
        '     INNER JOIN Data0060 ON Data0025.RKEY = Data0060.CUST_PART_P' +
        'TR'
      '     INNER JOIN data0360 ON Data0060.RKEY = data0360.so_ptr '
      'WHERE (Data0060.STATUS = 1) AND'
      
        '      (data0360.sch_date >= :dtpk1) AND (data0360.sch_date <= :d' +
        'tpk2)'
      ''
      ''
      ''
      'GROUP BY data0360.sch_date, Data0008.PRODUCT_NAME'
      'ORDER BY data0360.sch_date')
    Left = 115
    Top = 148
    object ADOtotal_360sch_date: TDateTimeField
      FieldName = 'sch_date'
    end
    object ADOtotal_360PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADOtotal_360qty_mianji: TFloatField
      FieldName = 'qty_mianji'
      ReadOnly = True
    end
    object ADOtotal_360qty: TIntegerField
      FieldName = 'qty'
      ReadOnly = True
    end
  end
  object DecisionSource1: TDecisionSource
    DecisionCube = DecisionCube1
    ControlType = xtCheck
    SparseRows = False
    SparseCols = False
    Left = 190
    Top = 213
    DimensionCount = 2
    SummaryCount = 2
    CurrentSummary = 0
    SparseRows = False
    SparseCols = False
    DimensionInfo = (
      1
      0
      1
      0
      0
      2
      0
      1
      0
      0)
  end
  object DecisionCube1: TDecisionCube
    DataSet = ADOtotal_360
    DimensionMap = <
      item
        ActiveFlag = diAsNeeded
        FieldType = ftDateTime
        Fieldname = 'sch_date'
        Name = #26085#26399
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 43
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftString
        Fieldname = 'PRODUCT_NAME'
        Name = #20135#21697#31867#22411
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 11
        Active = True
      end
      item
        ActiveFlag = diActive
        FieldType = ftFloat
        Fieldname = 'qty_mianji'
        Name = #38754#31215'm2'
        DerivedFrom = -1
        DimensionType = dimSum
        BinType = binNone
        ValueCount = -1
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftInteger
        Fieldname = 'qty'
        Name = #25968#37327'PCS'
        DerivedFrom = -1
        DimensionType = dimSum
        BinType = binNone
        ValueCount = -1
        Active = True
      end>
    ShowProgressDialog = False
    MaxDimensions = 2
    MaxSummaries = 2
    MaxCells = 0
    Left = 191
    Top = 148
  end
  object DataSource1: TDataSource
    DataSet = ADO360
    Left = 384
    Top = 166
  end
  object ADO360_sch: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT data0360.quantity,round(data0360.quantity * Data0025.unit' +
        '_sq,3) AS mianji,'
      '      data0360.sch_date'
      
        'FROM Data0025 INNER JOIN Data0060 ON Data0025.RKEY = Data0060.CU' +
        'ST_PART_PTR '
      '     INNER JOIN data0360 ON Data0060.RKEY = data0360.so_ptr'
      'where (data0360.so_ptr=:rkey)'
      '')
    Left = 476
    Top = 158
    object ADO360_schquantity: TIntegerField
      FieldName = 'quantity'
    end
    object ADO360_schmianji: TFloatField
      FieldName = 'mianji'
      ReadOnly = True
    end
    object ADO360_schsch_date: TDateTimeField
      FieldName = 'sch_date'
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 462
    Top = 97
    object N2: TMenuItem
      Caption = #20837#24211#35745#21010#35843#25972
      OnClick = Button3Click
    end
    object N1: TMenuItem
      Caption = #20837#20179#35745#21010#20462#25913#35760#24405
      OnClick = N1Click
    end
  end
  object AQCOUNT25: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'date1'
        DataType = ftString
        Size = 8
        Value = '2009-4-1'
      end
      item
        Name = 'date2'
        DataType = ftString
        Size = 9
        Value = '2009-4-15'
      end
      item
        Name = 'date3'
        DataType = ftString
        Size = 8
        Value = '2009-4-1'
      end
      item
        Name = 'date4'
        DataType = ftString
        Size = 9
        Value = '2009-4-15'
      end>
    SQL.Strings = (
      'SELECT      schdate.sch_date, COUNT(*) AS number'
      'FROM'
      ' (SELECT     sch_date'
      '   FROM          dbo.data0360'
      '   WHERE      (sch_date >= :date1) and (sch_date <= :date2)'
      '   GROUP BY sch_date) AS schdate INNER JOIN'
      ''
      '(SELECT  data0360.sch_date, dbo.Data0060.CUST_PART_PTR'
      '  FROM          dbo.data0360  INNER JOIN'
      
        '   dbo.Data0060 ON data0360.so_ptr = dbo.Data0060.RKEY INNER JOI' +
        'N'
      
        '   dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0025.RKE' +
        'Y INNER JOIN'
      
        '   dbo.Data0010 ON dbo.Data0060.CUSTOMER_PTR = dbo.Data0010.RKEY' +
        ' INNER JOIN'
      
        '   dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data009' +
        '7.RKEY'
      '  WHERE  (data0360.sch_date >= :date3) and'
      '         (data0360.sch_date <= :date4) and'
      '         (data0060.status=1) and'
      
        '   (Data0060.PARTS_ORDERED+Data0060.PARTS_RETURNED-Data0060.PART' +
        'S_SHIPPED-Data0060.RETURNED_SHIP>0)'
      ''
      ''
      ''
      ''
      
        '  GROUP BY data0360.sch_date, dbo.Data0060.CUST_PART_PTR) AS par' +
        't_number'
      '  ON schdate.sch_date = part_number.sch_date'
      'GROUP BY schdate.sch_date'
      'ORDER BY schdate.sch_date')
    Left = 324
    Top = 285
    object AQCOUNT25sch_date: TDateTimeField
      FieldName = 'sch_date'
    end
    object AQCOUNT25number: TIntegerField
      FieldName = 'number'
    end
  end
  object SavePictureDialog1: TSavePictureDialog
    Filter = 'Bitmaps (*.bmp)|*.bmp'
    Left = 128
    Top = 432
  end
  object PrintDialog1: TPrintDialog
    Left = 96
    Top = 432
  end
end
