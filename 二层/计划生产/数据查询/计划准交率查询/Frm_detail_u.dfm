object Frm_detail: TFrm_detail
  Left = 258
  Top = 236
  Width = 961
  Height = 541
  Caption = #35746#21333#20934#20132#29575#32479#35745
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 945
    Height = 31
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      945
      31)
    object SpeedButton1: TSpeedButton
      Left = 74
      Top = 3
      Width = 63
      Height = 26
      Hint = #23558#25968#25454#36755#20986#21040'EXCEL'#25991#20214#20013
      Caption = #23548#20986
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DADADADADADA
        DADAADADADADADADADADDADADADADAD00000000000000006666007777777706E
        EF0AA0E6666606EEF0ADDA0E66606EEF060AADA0E606EEF0000DDADA006EEF0A
        DADAADAD06EEF00DADADDAD06EEF0670DADAAD06EEF0E6670DADD06EEF0A0E66
        70DA0FFFF0ADA0EEEE0D00000ADADA00000AADADADADADADADAD}
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
    object Label4: TLabel
      Left = 691
      Top = 11
      Width = 47
      Height = 13
      Anchors = [akTop, akRight]
      Caption = ' '#24180' '#24230' '
      Visible = False
    end
    object Label5: TLabel
      Left = 400
      Top = 8
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Label5'
      Visible = False
    end
    object ytype: TComboBox
      Left = 742
      Top = 6
      Width = 59
      Height = 21
      Style = csDropDownList
      Anchors = [akTop, akRight]
      ItemHeight = 13
      TabOrder = 2
      Visible = False
      OnChange = ytypeChange
      OnKeyDown = cbtypeKeyDown
    end
    object BitBtn1: TBitBtn
      Left = 9
      Top = 3
      Width = 63
      Height = 26
      Hint = #36864#20986
      Caption = #20851#38381
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        0400000000007800000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFF0FFFFFF
        FFFFFFFF00FFFFFFFFFFFFF030FFFFFFFFFFFF0330FFFFFFFFFF003330000000
        0FFFF03330FF0FFFFFFFF03300FF0FFFF4FFF03330FF0FFF44FFF03330FF0FF4
        4444F03330FF0F444444F03330FF0FF44444F0330FFF0FFF44FFF030FFFF0FFF
        F4FFF00FFFFF0FFFFFFFF00000000FFFFFFF}
    end
    object CheckBox1: TCheckBox
      Left = 900
      Top = 9
      Width = 51
      Height = 17
      Anchors = [akTop, akRight]
      Caption = #19977#32500
      Checked = True
      Enabled = False
      State = cbChecked
      TabOrder = 1
      OnClick = CheckBox1Click
    end
    object fstr: TEdit
      Left = 448
      Top = 4
      Width = 121
      Height = 21
      TabOrder = 3
      Visible = False
      OnChange = fstrChange
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 31
    Width = 945
    Height = 472
    ActivePage = TabSheet3
    Align = alClient
    TabOrder = 1
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = #35746#21333#20132#26399#25968#25454#27719#24635
      ImageIndex = 1
      object Eh1: TDBGridEh
        Left = 0
        Top = 0
        Width = 937
        Height = 444
        Align = alClient
        DataSource = DataSource1
        Flat = True
        FooterColor = clBtnFace
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -13
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        SumList.Active = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnDblClick = Eh1DblClick
        OnKeyDown = Eh1KeyDown
        Columns = <
          item
            EditButtons = <>
            Footer.Color = clRed
            Footer.Value = #21512'  '#35745
            Footer.ValueType = fvtStaticText
            Footers = <>
            Title.Alignment = taCenter
            Width = 121
          end
          item
            EditButtons = <>
            Footers = <>
            Title.Alignment = taCenter
            Width = 121
          end
          item
            DisplayFormat = '##0.000%'
            EditButtons = <>
            Footer.DisplayFormat = '#,###'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Alignment = taCenter
            Width = 80
          end
          item
            EditButtons = <>
            Footers = <>
          end
          item
            EditButtons = <>
            Footers = <>
          end>
      end
    end
    object TabSheet2: TTabSheet
      Tag = 1
      Caption = #22270#34920#20998#26512
      object Chart1: TChart
        Left = 0
        Top = 0
        Width = 937
        Height = 444
        AllowPanning = pmNone
        AnimatedZoom = True
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        BackWall.Color = clSilver
        BottomWall.Brush.Color = clWhite
        BottomWall.Brush.Style = bsClear
        LeftWall.Brush.Color = clWhite
        LeftWall.Brush.Style = bsClear
        Title.Alignment = taLeftJustify
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -16
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Title.Text.Strings = (
          #20934#20132#29575#25968#25454#23545#27604#22270)
        BackColor = clSilver
        BottomAxis.LabelsAngle = 270
        LeftAxis.AxisValuesFormat = '0'
        LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
        LeftAxis.LabelsFont.Color = clBlack
        LeftAxis.LabelsFont.Height = -12
        LeftAxis.LabelsFont.Name = 'Arial'
        LeftAxis.LabelsFont.Style = []
        LeftAxis.LabelsSeparation = 20
        LeftAxis.Title.Caption = #27604#29575
        LeftAxis.Title.Font.Charset = ANSI_CHARSET
        LeftAxis.Title.Font.Color = clBlue
        LeftAxis.Title.Font.Height = -16
        LeftAxis.Title.Font.Name = #23435#20307
        LeftAxis.Title.Font.Style = []
        Legend.ShadowSize = 2
        Legend.VertMargin = 4
        MaxPointsPerPage = 31
        RightAxis.AxisValuesFormat = '0'
        TopAxis.Axis.Width = 1
        TopAxis.AxisValuesFormat = '0'
        Align = alClient
        BevelOuter = bvLowered
        BorderWidth = 1
        Color = 13160660
        TabOrder = 0
        DesignSize = (
          937
          444)
        object SpeedButton2: TSpeedButton
          Left = 793
          Top = 6
          Width = 26
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
          OnClick = SpeedButton2Click
        end
        object SpeedButton3: TSpeedButton
          Left = 821
          Top = 6
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
          OnClick = SpeedButton3Click
        end
        object SpeedButton4: TSpeedButton
          Left = 711
          Top = 6
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
          OnClick = SpeedButton4Click
        end
        object SpeedButton5: TSpeedButton
          Left = 683
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
          OnClick = SpeedButton5Click
        end
        object SpeedButton6: TSpeedButton
          Left = 738
          Top = 7
          Width = 25
          Height = 24
          Hint = #25918#22823
          Anchors = [akTop, akRight]
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF000000
            000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
            00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00000000000000000000000000FF00FF0080808000000000000000
            0000000000000000000080808000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0000000000000000000000000000000000C0C0C000C0C0
            C000C0C0C000C0C0C0000000000000000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF000000000080808000FFFF0000FFFF0000C0C0
            C000C0C0C000C0C0C000C0C0C0008080800000000000FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF008080800000000000C0C0C000FFFF0000C0C0C0000000
            000000000000C0C0C000C0C0C000C0C0C0000000000080808000FF00FF00FF00
            FF00FF00FF00FF00FF0000000000C0C0C000FFFF0000C0C0C000C0C0C0000000
            000000000000C0C0C000C0C0C000C0C0C000C0C0C00000000000FF00FF00FF00
            FF00FF00FF00FF00FF0000000000C0C0C000C0C0C00000000000000000000000
            0000000000000000000000000000C0C0C000C0C0C00000000000FF00FF00FF00
            FF00FF00FF00FF00FF0000000000C0C0C000C0C0C00000000000000000000000
            0000000000000000000000000000FFFF0000C0C0C00000000000FF00FF00FF00
            FF00FF00FF00FF00FF0000000000C0C0C000C0C0C000C0C0C000C0C0C0000000
            000000000000C0C0C000C0C0C000FFFF0000C0C0C00000000000FF00FF00FF00
            FF00FF00FF00FF00FF008080800000000000C0C0C000C0C0C000C0C0C0000000
            000000000000C0C0C000FFFF0000FFFF00000000000080808000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF000000000080808000C0C0C000C0C0C000C0C0
            C000FFFF0000FFFF0000FFFF00008080800000000000FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000C0C0C000C0C0
            C000C0C0C000C0C0C0000000000000000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0080808000000000000000
            0000000000000000000080808000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButton6Click
        end
        object SpeedButton7: TSpeedButton
          Left = 766
          Top = 7
          Width = 25
          Height = 24
          Hint = #32553#23567
          Anchors = [akTop, akRight]
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF000000
            000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
            00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00000000000000000000000000FF00FF0080808000000000000000
            0000000000000000000080808000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0000000000000000000000000000000000C0C0C000C0C0
            C000C0C0C000C0C0C0000000000000000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF000000000080808000FFFF0000FFFF0000C0C0
            C000C0C0C000C0C0C000C0C0C0008080800000000000FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF008080800000000000C0C0C000FFFF0000C0C0C000C0C0
            C000C0C0C000C0C0C000C0C0C000C0C0C0000000000080808000FF00FF00FF00
            FF00FF00FF00FF00FF0000000000C0C0C000FFFF0000C0C0C000C0C0C000C0C0
            C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00000000000FF00FF00FF00
            FF00FF00FF00FF00FF0000000000C0C0C000C0C0C00000000000000000000000
            0000000000000000000000000000C0C0C000C0C0C00000000000FF00FF00FF00
            FF00FF00FF00FF00FF0000000000C0C0C000C0C0C00000000000000000000000
            0000000000000000000000000000FFFF0000C0C0C00000000000FF00FF00FF00
            FF00FF00FF00FF00FF0000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
            C000C0C0C000C0C0C000C0C0C000FFFF0000C0C0C00000000000FF00FF00FF00
            FF00FF00FF00FF00FF008080800000000000C0C0C000C0C0C000C0C0C000C0C0
            C000C0C0C000C0C0C000FFFF0000FFFF00000000000080808000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF000000000080808000C0C0C000C0C0C000C0C0
            C000FFFF0000FFFF0000FFFF00008080800000000000FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000C0C0C000C0C0
            C000C0C0C000C0C0C0000000000000000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0080808000000000000000
            0000000000000000000080808000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButton7Click
        end
        object UpDown1: TUpDown
          Left = 877
          Top = 8
          Width = 15
          Height = 21
          Anchors = [akTop, akRight]
          Associate = Edit2
          Max = 30
          Position = 30
          TabOrder = 0
        end
        object Edit2: TEdit
          Left = 856
          Top = 8
          Width = 21
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 1
          Text = '30'
          OnChange = Edit2Change
        end
        object Series1: TBarSeries
          ColorEachPoint = True
          Marks.ArrowLength = 10
          Marks.BackColor = clGray
          Marks.Frame.Visible = False
          Marks.Style = smsValue
          Marks.Transparent = True
          Marks.Visible = True
          SeriesColor = clRed
          ShowInLegend = False
          AutoMarkPosition = False
          BarBrush.Color = clWhite
          BarStyle = bsRectGradient
          Dark3D = False
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
    object TabSheet3: TTabSheet
      Tag = 2
      Caption = #24180#24230'-'#23458#25143'-'#26376#20221#27719#24635
      ImageIndex = 2
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 0
        Width = 937
        Height = 444
        Align = alClient
        DataSource = ds2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -13
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect]
        ParentFont = False
        ReadOnly = True
        RowHeight = 15
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnKeyDown = DBGridEh1KeyDown
      end
    end
    object TabSheet4: TTabSheet
      Tag = 3
      Caption = #20132#26399#20998#26512
      ImageIndex = 3
      object dbgmain: TDBGridEh
        Tag = 999
        Left = 0
        Top = 0
        Width = 937
        Height = 260
        Hint = #28857#20987#24102#26143#21495#30340#34920#22836#21487#20197#20020#26102#36807#28388#25968#25454
        Align = alClient
        DataSource = mds
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -13
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs]
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        SortLocal = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnKeyDown = dbgmainKeyDown
        OnTitleClick = dbgmainTitleClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'SALES_ORDER'
            Footers = <>
            Tag = 3
            Title.Caption = '*'#35746#21333#32534#21495
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'so_type'
            Footers = <>
            KeyList.Strings = (
              '0'
              '1'
              '2')
            PickList.Strings = (
              #33258#21046
              #22806#21457
              #21322#21046#31243)
            Title.Caption = #35746#21333#31867#22411
            Width = 56
          end
          item
            Alignment = taRightJustify
            EditButtons = <>
            FieldName = 'CUST_CODE'
            Footers = <>
            Tag = 4
            Title.Caption = '*'#23458#25143#20195#30721
            Width = 65
          end
          item
            EditButtons = <>
            FieldName = 'MANU_PART_NUMBER'
            Footers = <>
            Tag = 1
            Title.Alignment = taCenter
            Title.Caption = '*'#26412#21378#32534#21495
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'ENT_DATE'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #19979#21333#26085#26399
            Width = 140
          end
          item
            EditButtons = <>
            FieldName = 'schdate'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #26368#21518#20132#26399
            Width = 76
          end
          item
            EditButtons = <>
            FieldName = 'sdate'
            Footers = <>
            Title.Caption = #35745#21010#20132#26399
            Width = 76
          end
          item
            AutoFitColWidth = False
            DisplayFormat = '#####0.00#####'
            EditButtons = <>
            EndEllipsis = True
            FieldName = 'pcs_sq'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #21333'PCS'#38754#31215
            Width = 76
          end
          item
            EditButtons = <>
            FieldName = 'PARTS_ORDERED'
            Footers = <>
            Title.Caption = #35746#21333#25968#37327
            Width = 76
          end
          item
            EditButtons = <>
            FieldName = 'ISSUED_QTY'
            Footers = <>
            Title.Caption = #25237#20135#25968#37327
            Width = 56
          end
          item
            Alignment = taRightJustify
            AutoFitColWidth = False
            DisplayFormat = '#####0.00#####'
            EditButtons = <>
            EndEllipsis = True
            FieldName = 'total_sq'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #35746#21333#38754#31215
            Width = 76
          end
          item
            EditButtons = <>
            FieldName = 'davg'
            Footers = <>
            Tag = 2
            Title.Alignment = taCenter
            Title.Caption = '*'#26085#22343#20837#24211
          end
          item
            DisplayFormat = '#####0.00#####'
            EditButtons = <>
            EndEllipsis = True
            FieldName = 'insqr'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #26085#20135#20986#38754#31215
            Width = 76
          end
          item
            EditButtons = <>
            FieldName = 'leavedays'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #21097#20313#24037#26399
          end
          item
            EditButtons = <>
            FieldName = 'REFERENCE_NUMBER'
            Footers = <>
            Title.Caption = #35746#21333#21442#32771
            Width = 179
          end
          item
            EditButtons = <>
            FieldName = 'PRODUCT_NAME'
            Footers = <>
            Title.Caption = #20135#21697#31867#22411
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'MANU_PART_DESC'
            Footers = <>
            Title.Caption = #23458#25143#22411#21495
            Width = 120
          end
          item
            Alignment = taRightJustify
            EditButtons = <>
            FieldName = 'PO_NUMBER'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #23458#25143#35746#21333#21495
            Width = 140
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 260
        Width = 937
        Height = 184
        Align = alBottom
        Caption = 'Panel2'
        TabOrder = 1
        object dbgsub: TDBGridEh
          Left = 1
          Top = 1
          Width = 631
          Height = 182
          Align = alClient
          DataSource = sds
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -13
          FooterFont.Name = #23435#20307
          FooterFont.Style = []
          FooterRowCount = 1
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect]
          ReadOnly = True
          SumList.Active = True
          SumList.VirtualRecords = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          OnKeyDown = dbgsubKeyDown
          Columns = <
            item
              EditButtons = <>
              FieldName = 'sch_date'
              Footer.Value = #24635#35745
              Footer.ValueType = fvtStaticText
              Footers = <>
              Title.Caption = #20132#26399
              Width = 76
            end
            item
              EditButtons = <>
              FieldName = 'quantity'
              Footer.FieldName = 'quantity'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #20132#36135#25968#37327
              Width = 56
            end
            item
              EditButtons = <>
              FieldName = 'complete_qty'
              Footer.FieldName = 'complete_qty'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #24050#20837#24211#25968#37327
              Width = 56
            end
            item
              EditButtons = <>
              FieldName = 'davg'
              Footer.FieldName = 'davg'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #26085#22343#20132#36135#25968
            end>
        end
        object Panel3: TPanel
          Left = 632
          Top = 1
          Width = 304
          Height = 182
          Align = alRight
          TabOrder = 1
          object Label1: TLabel
            Left = 29
            Top = 13
            Width = 52
            Height = 13
            Caption = #20135#21697#24615#36136
          end
          object Label2: TLabel
            Left = 28
            Top = 65
            Width = 52
            Height = 13
            Caption = #29983#20135#26631#35760
          end
          object Label3: TLabel
            Left = 28
            Top = 39
            Width = 52
            Height = 13
            Caption = #29983#20135#24037#21378
          end
          object cb1: TCheckBox
            Tag = 1
            Left = 89
            Top = 63
            Width = 63
            Height = 17
            Hint = 'PROD_REL'
            Caption = #26410#30830#35748
            Checked = True
            State = cbChecked
            TabOrder = 0
            OnClick = Filtercheck
          end
          object cb2: TCheckBox
            Tag = 2
            Left = 153
            Top = 63
            Width = 63
            Height = 17
            Hint = 'PROD_REL'
            Caption = #24050#30830#35748
            Checked = True
            State = cbChecked
            TabOrder = 1
            OnClick = Filtercheck
          end
          object cb3: TCheckBox
            Tag = 3
            Left = 217
            Top = 63
            Width = 63
            Height = 17
            Hint = 'PROD_REL'
            Caption = #24050#25237#20135
            Checked = True
            State = cbChecked
            TabOrder = 2
            OnClick = Filtercheck
          end
          object whcb: TComboBox
            Left = 88
            Top = 35
            Width = 89
            Height = 21
            Hint = 'SHIP_REG_TAX_ID'
            AutoComplete = False
            ItemHeight = 13
            TabOrder = 3
            Text = #20840#37096
            OnClick = Filtercheck
            OnKeyDown = whcbKeyDown
            Items.Strings = (
              #20840#37096)
          end
          object tpcb: TComboBox
            Left = 88
            Top = 9
            Width = 89
            Height = 21
            Hint = 'ttype'
            AutoComplete = False
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 4
            Text = #20840#37096
            OnClick = Filtercheck
            OnKeyDown = whcbKeyDown
            Items.Strings = (
              #20840#37096
              #37327#20135
              #26679#21697)
          end
          object cb4: TCheckBox
            Left = 8
            Top = 88
            Width = 81
            Height = 17
            Caption = #35745#21010#20132#26399
            TabOrder = 5
            OnClick = Filtercheck
          end
          object sdtp: TDateTimePicker
            Left = 88
            Top = 84
            Width = 97
            Height = 21
            Date = 42569.000000000000000000
            Time = 42569.000000000000000000
            TabOrder = 6
            OnChange = Filtercheck
          end
        end
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 164
    Top = 135
  end
  object ADOQuery1: TADOQuery
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    Left = 196
    Top = 135
  end
  object PrintDialog1: TPrintDialog
    Left = 232
    Top = 136
  end
  object SavePictureDialog1: TSavePictureDialog
    Filter = 'Bitmaps (*.bmp)|*.bmp'
    Left = 264
    Top = 136
  end
  object tmp: TADOQuery
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     dbo.Data0060.SALES_ORDER,  so_tp AS so_type, dbo.Data' +
        '0010.CUST_CODE, dbo.Data0025.MANU_PART_NUMBER, '
      
        '                      dbo.Data0060.REFERENCE_NUMBER, dbo.Data000' +
        '8.PRODUCT_NAME, dbo.Data0025.MANU_PART_DESC, dbo.Data0025.pcs_sq' +
        ', dbo.Data0097.PO_NUMBER, dbo.Data0060.ENT_DATE, '
      
        '                      dbo.Data0060.PARTS_ORDERED, dbo.Data0060.I' +
        'SSUED_QTY, dbo.Data0025.pcs_sq * dbo.Data0060.PARTS_ORDERED AS t' +
        'otal_sq, dbo.data0360.sch_date, dbo.data0360.quantity, '
      
        '                      dbo.data0360.complete_date, ISNULL(dbo.dat' +
        'a0360.complete_qty, 0) AS income, CASE complete_FLAG WHEN 0 THEN' +
        ' '#39#26159#39' WHEN 1 THEN '#39#21542#39' ELSE '#39#26080#27861#35780#20272#39' END AS flag, data0060.rkey as m' +
        'key'
      'FROM         dbo.Data0060 INNER JOIN'
      
        '                      dbo.data0360 ON dbo.Data0060.RKEY = dbo.da' +
        'ta0360.so_ptr INNER JOIN'
      
        '                      dbo.Data0010 ON dbo.Data0060.CUSTOMER_PTR ' +
        '= dbo.Data0010.RKEY INNER JOIN'
      
        '                      dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR' +
        ' = dbo.Data0025.RKEY INNER JOIN'
      
        '                      dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR' +
        ' = dbo.Data0008.RKEY INNER JOIN'
      
        '                      dbo.Data0097 ON dbo.Data0097.RKEY = dbo.Da' +
        'ta0060.PURCHASE_ORDER_PTR'
      
        'WHERE     (dbo.Data0060.ENT_DATE > DATEADD(m, -1, GETDATE())) AN' +
        'D (NOT (dbo.data0360.complete_FLAG IS NULL))')
    Left = 461
    Top = 75
  end
  object ds2: TDataSource
    DataSet = tmp
    Left = 460
    Top = 113
  end
  object mds: TDataSource
    AutoEdit = False
    DataSet = mainqry
    OnDataChange = mdsDataChange
    Left = 555
    Top = 109
  end
  object mainqry: TADOQuery
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      
        'select *, davg*pcs_sq  as insqr , case when DATEDIFF(dd,getdate(' +
        '),schdate)<0 then 0 else DATEDIFF(dd,getdate(),schdate) end as l' +
        'eavedays'
      'from('
      
        'SELECT  dbo.Data0060.rkey,   dbo.Data0060.SALES_ORDER,  so_tp AS' +
        ' so_type, dbo.Data0010.CUST_CODE, dbo.Data0025.MANU_PART_NUMBER,' +
        ' data0060.SHIP_REG_TAX_ID,'
      
        '                      dbo.Data0060.REFERENCE_NUMBER, dbo.Data000' +
        '8.PRODUCT_NAME, dbo.Data0025.MANU_PART_DESC, dbo.Data0025.pcs_sq' +
        ', dbo.Data0097.PO_NUMBER, dbo.Data0060.ENT_DATE, '
      
        '                      dbo.Data0060.PARTS_ORDERED, dbo.Data0060.I' +
        'SSUED_QTY, dbo.Data0025.pcs_sq * dbo.Data0060.PARTS_ORDERED AS t' +
        'otal_sq, max(data0360.sch_date) as schdate, '
      
        'CEILING(sum((data0360.quantity - isnull(data0360.complete_qty,0)' +
        ')/case when (DATEDIFF(dd,getdate(),data0360.sch_date))<=1 then 1' +
        ' else (DATEDIFF(dd,getdate(),data0360.sch_date)) end ) ) as davg' +
        ','
      
        'sum((data0360.quantity - isnull(data0360.complete_qty,0))) as ds' +
        'um, data0025.ttype, data0060.PROD_REL,'
      
        'avg(case when (DATEDIFF(dd,getdate(),data0360.sch_date))<=1 then' +
        ' 1 else (DATEDIFF(dd,getdate(),data0360.sch_date)) end ) as days'
      'FROM         dbo.Data0060 INNER JOIN'
      
        '                      dbo.data0360 ON dbo.Data0060.RKEY = dbo.da' +
        'ta0360.so_ptr INNER JOIN'
      
        '                      dbo.Data0010 ON dbo.Data0060.CUSTOMER_PTR ' +
        '= dbo.Data0010.RKEY INNER JOIN'
      
        '                      dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR' +
        ' = dbo.Data0025.RKEY INNER JOIN'
      
        '                      dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR' +
        ' = dbo.Data0008.RKEY INNER JOIN'
      
        '                      dbo.Data0097 ON dbo.Data0097.RKEY = dbo.Da' +
        'ta0060.PURCHASE_ORDER_PTR'
      
        'WHERE     (dbo.Data0060.so_style = 0)  and  (dbo.Data0060.status' +
        ' = 1)  and (dbo.Data0060.ENT_DATE > '#39'2015-01-01'#39')'
      
        'group by dbo.Data0060.SALES_ORDER,  so_tp , dbo.Data0010.CUST_CO' +
        'DE, dbo.Data0025.MANU_PART_NUMBER, dbo.Data0060.rkey,'
      
        '                      dbo.Data0060.REFERENCE_NUMBER, dbo.Data000' +
        '8.PRODUCT_NAME, dbo.Data0025.MANU_PART_DESC, dbo.Data0025.pcs_sq' +
        ', dbo.Data0097.PO_NUMBER, dbo.Data0060.ENT_DATE, '
      
        '                      dbo.Data0060.PARTS_ORDERED, dbo.Data0060.I' +
        'SSUED_QTY, dbo.Data0025.pcs_sq * dbo.Data0060.PARTS_ORDERED,data' +
        '0060.SHIP_REG_TAX_ID,data0025.ttype, data0060.PROD_REL'
      ') detailall'
      
        'outer apply (select min(d3601.sch_date) as sdate from data0360 d' +
        '3601 where d3601.so_ptr = detailall.rkey and d3601.complete_flag' +
        ' is null group by so_ptr) dapply'
      'where davg >0 '
      'order by schdate, insqr desc')
    Left = 554
    Top = 76
  end
  object sds: TDataSource
    DataSet = subads
    Left = 588
    Top = 110
  end
  object subads: TADODataSet
    CursorType = ctStatic
    CommandText = 
      'select sch_date,quantity, isnull(complete_qty,0) as complete_qty' +
      ', '#13#10'      CEILING((quantity - isnull(complete_qty,0))/case when ' +
      '(DATEDIFF(dd,getdate(),sch_date))<1 then 1 else (DATEDIFF(dd,get' +
      'date(),sch_date)) end )  as davg, so_ptr'#13#10'from data0360'#13#10'where s' +
      'ch_date>'#39'2015-01-01'#39#13#10'order by sch_date'
    DataSource = mds
    IndexFieldNames = 'so_ptr'
    MasterFields = 'rkey'
    Parameters = <>
    Left = 589
    Top = 76
  end
  object cds: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 532
    Top = 223
  end
end
