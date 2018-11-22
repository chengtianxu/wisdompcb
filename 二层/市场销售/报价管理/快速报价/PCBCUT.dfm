object Frm_PCBCUT: TFrm_PCBCUT
  Left = 253
  Top = 143
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'PCB'#26234#33021#25340#29256#35774#35745
  ClientHeight = 623
  ClientWidth = 937
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  DesignSize = (
    937
    623)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 937
    Height = 38
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 1
    object Label33: TLabel
      Left = 626
      Top = 15
      Width = 39
      Height = 13
      AutoSize = False
      Caption = #23458#25143#65306
    end
    object Label34: TLabel
      Left = 662
      Top = 15
      Width = 56
      Height = 13
      AutoSize = False
    end
    object Label35: TLabel
      Left = 742
      Top = 15
      Width = 39
      Height = 13
      AutoSize = False
      Caption = #21378#32534#65306
    end
    object Label36: TLabel
      Left = 778
      Top = 15
      Width = 95
      Height = 13
      AutoSize = False
    end
    object ToolBar1: TToolBar
      Left = 4
      Top = 3
      Width = 581
      Height = 36
      Align = alNone
      ButtonHeight = 35
      ButtonWidth = 49
      Caption = 'ToolBar1'
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      Images = ImageList1
      ParentFont = False
      ShowCaptions = True
      TabOrder = 0
      Transparent = False
      object tbsave: TToolButton
        Left = 0
        Top = 0
        Caption = ' '#20445' '#23384' '
        ImageIndex = 0
        OnClick = tbsaveClick
      end
      object tbinport: TToolButton
        Left = 49
        Top = 0
        Caption = #23548' '#20837
        ImageIndex = 1
        OnClick = tbinportClick
      end
      object tboutput: TToolButton
        Left = 98
        Top = 0
        Caption = #23548' '#20986
        ImageIndex = 2
        OnClick = tboutputClick
      end
      object tbprint: TToolButton
        Left = 147
        Top = 0
        Caption = #25171' '#21360
        ImageIndex = 3
        OnClick = tbprintClick
      end
      object ToolButton8: TToolButton
        Left = 196
        Top = 0
        Width = 8
        Caption = 'ToolButton8'
        ImageIndex = 10
        Style = tbsDivider
      end
      object ToolButton3: TToolButton
        Left = 204
        Top = 0
        Hint = #22312#23567#30011#23478#37324#32534#36753#22270#29255
        Caption = #30011' '#22270
        ImageIndex = 8
        ParentShowHint = False
        ShowHint = True
        OnClick = ToolButton3Click
      end
      object btrefresh: TToolButton
        Left = 253
        Top = 0
        Hint = #25226#23567#30011#23478#20445#23384#30340#22270#29255#26356#26032#21040#31995#32479
        Caption = #26356' '#26032
        Enabled = False
        ImageIndex = 9
        ParentShowHint = False
        ShowHint = True
        OnClick = btrefreshClick
      end
      object ToolButton4: TToolButton
        Left = 302
        Top = 0
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 8
        Style = tbsSeparator
      end
      object tbclear: TToolButton
        Left = 310
        Top = 0
        Hint = #28165#31354#25152#26377#25340#29256#22270
        Caption = #28165' '#31354
        ImageIndex = 5
        ParentShowHint = False
        ShowHint = True
        OnClick = tbclearClick
      end
      object tbundo: TToolButton
        Left = 359
        Top = 0
        Hint = #24674#22797#21040#19978#19968#27425#25805#20316#20043#21069#30340#22270#24418
        Caption = #25764' '#28040
        ImageIndex = 6
        ParentShowHint = False
        ShowHint = True
        OnClick = tbundoClick
      end
      object ToolButton1: TToolButton
        Left = 408
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object ToolButton2: TToolButton
        Left = 416
        Top = 0
        Caption = #20851' '#38381
        ImageIndex = 7
        OnClick = ToolButton2Click
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 38
    Width = 626
    Height = 565
    Align = alLeft
    Caption = 'Panel2'
    TabOrder = 2
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 67
      Height = 563
      Align = alLeft
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object btrectangle: TSpeedButton
        Left = 36
        Top = 38
        Width = 25
        Height = 24
        Hint = #30011#30697#24418'('#25353#19979'shift'#38190#30011#27491#26041#24418')'
        BiDiMode = bdLeftToRight
        GroupIndex = 1
        Glyph.Data = {
          66010000424D6601000000000000760000002800000014000000140000000100
          040000000000F000000000000000000000001000000000000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333300003000000000000000000300003033333333333333330300003033
          3333333333333303000030333333333333333303000030333333333333333303
          0000303333333333333333030000303333333333333333030000303333333333
          3333330300003033333333333333330300003033333333333333330300003033
          3333333333333303000030333333333333333303000030333333333333333303
          0000303333333333333333030000303333333333333333030000303333333333
          3333330300003033333333333333330300003000000000000000000300003333
          33333333333333330000}
        ParentShowHint = False
        ParentBiDiMode = False
        ShowHint = True
        OnClick = btrectangleClick
      end
      object btline: TSpeedButton
        Left = 7
        Top = 38
        Width = 25
        Height = 24
        Hint = #30011#30452#32447'('#25353#19979'shift'#38190#30011'45'#24230#22402#30452#32447')'
        GroupIndex = 1
        Glyph.Data = {
          36010000424D3601000000000000760000002800000011000000100000000100
          040000000000C0000000120B0000120B00001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00999999999999
          9999900000009999999999999999900000009999999999999009900000009999
          9999999900999000000099999999999009999000000099999999990099999000
          0000999999999009999990000000999999990099999990000000999999900999
          9999900000009999990099999999900000009999900999999999900000009999
          0099999999999000000099900999999999999000000099009999999999999000
          0000900999999999999990000000999999999999999990000000}
        ParentShowHint = False
        ShowHint = True
        OnClick = btlineClick
      end
      object Label31: TLabel
        Left = 4
        Top = 279
        Width = 18
        Height = 12
        Caption = 'Pen'
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object bterase: TSpeedButton
        Left = 36
        Top = 4
        Width = 25
        Height = 24
        Hint = #25830#38500
        GroupIndex = 1
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000120B0000120B00001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
          DADAADADA70000000000DADA088770DADADAADA08888770DADADDA78878F8770
          DADAAD0878F8F8770DADDAD0FF8F8F8770DAADAD0FF8F8F8770DDADAD0FF8F8F
          870AADADAD0FF8F8F80DDADADAD0FF8F8F0AADADADAD0FF880ADDADADADAD777
          7ADAADADADADADADADADDADADADADADADADAADADADADADADADAD}
        ParentShowHint = False
        ShowHint = True
        OnClick = btrectangleClick
      end
      object btselect: TSpeedButton
        Left = 7
        Top = 4
        Width = 25
        Height = 24
        Hint = #36873#25321
        GroupIndex = 1
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888888008888888888888800888888888888800888888888808880088
          8888888800800888888888880000088888888888000000888888888800000008
          8888888800000088888888880000088888888888000088888888888800088888
          8888888800888888888888880888888888888888888888888888}
        ParentShowHint = False
        ShowHint = True
        OnClick = btselectClick
      end
      object btarrow1: TSpeedButton
        Left = 7
        Top = 93
        Width = 25
        Height = 24
        Hint = #30011#21452#31661#22836'('#25353#19979'shift'#38190#30011'45'#24230#22402#30452#21452#31661#22836')'
        GroupIndex = 1
        Glyph.Data = {
          96000000424D96000000000000003E0000002800000010000000160000000100
          01000000000058000000C40E0000C40E0000020000000000000000000000FFFF
          FF00FFFF0000FFFF0000FFFF0000FE7F0000FE7F0000FE7F0000FE7F0000FE7F
          0000FE7F0000FE7F0000FE7F00009E7300008E730000E6670000E6670000F24F
          0000F81F0000F81F0000FC3F0000FC7F0000FFFF0000FFFF0000}
        ParentShowHint = False
        ShowHint = True
        OnClick = btarrow1Click
      end
      object btarrow2: TSpeedButton
        Left = 7
        Top = 121
        Width = 25
        Height = 24
        Hint = #30011#21333#31661#22836'('#25353#19979'shift'#38190#30011'45'#24230#22402#30452#21333#31661#22836')'
        GroupIndex = 1
        Glyph.Data = {
          8A000000424D8A000000000000003E000000280000000F000000130000000100
          0100000000004C000000C40E0000C40E0000020000000000000000000000FFFF
          FF00FFFE0000FFCE0000FFCE0000FFCE0000FFCE0000FFCE0000FFCE0000FFCE
          0000FFCE0000E7CE0000E3CE0000F9CE0000FCCE0000FE4E0000FF0E0000FF8E
          0000FF8E0000FFFE0000FFFE0000}
        ParentShowHint = False
        ShowHint = True
        OnClick = btarrow2Click
      end
      object btspec8: TSpeedButton
        Left = 36
        Top = 238
        Width = 25
        Height = 24
        Hint = #25554#20837#29305#27530#31526#21495
        GroupIndex = 1
        Caption = #9651
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btspec1Click
      end
      object btspec7: TSpeedButton
        Left = 7
        Top = 238
        Width = 25
        Height = 24
        Hint = #25554#20837#29305#27530#31526#21495
        GroupIndex = 1
        Caption = #9671
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Spacing = 0
        OnClick = btspec1Click
      end
      object btspec6: TSpeedButton
        Left = 36
        Top = 210
        Width = 25
        Height = 24
        Hint = #25554#20837#29305#27530#31526#21495
        GroupIndex = 1
        Caption = #9734
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btspec1Click
      end
      object btspec5: TSpeedButton
        Left = 7
        Top = 210
        Width = 25
        Height = 24
        Hint = #25554#20837#29305#27530#31526#21495
        GroupIndex = 1
        Caption = #9678
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btspec1Click
      end
      object btspec4: TSpeedButton
        Left = 36
        Top = 183
        Width = 25
        Height = 24
        Hint = #25554#20837#29305#27530#31526#21495
        GroupIndex = 1
        Caption = #167
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btspec1Click
      end
      object btspec3: TSpeedButton
        Left = 7
        Top = 183
        Width = 25
        Height = 24
        Hint = #25554#20837#29305#27530#31526#21495
        GroupIndex = 1
        Caption = #8251
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btspec1Click
      end
      object btspec2: TSpeedButton
        Left = 36
        Top = 156
        Width = 25
        Height = 24
        Hint = #25554#20837#29305#27530#31526#21495
        GroupIndex = 1
        Caption = #8857
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btspec1Click
      end
      object btspec1: TSpeedButton
        Left = 7
        Top = 156
        Width = 25
        Height = 24
        Hint = #25554#20837#29305#27530#31526#21495
        GroupIndex = 1
        Caption = #8853
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btspec1Click
      end
      object btellipse: TSpeedButton
        Left = 7
        Top = 65
        Width = 25
        Height = 24
        Hint = #30011#22278'('#25353#19979'shift'#38190#30011#27491#22278#24418')'
        GroupIndex = 1
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
          3333330000003333003333330033330000003330333333333303330000003303
          3333333333303300000030333333333333330300000030333333333333330300
          0000033333333333333330000000033333333333333330000000033333333333
          3333300000000333333333333333300000000333333333333333300000000333
          3333333333333000000030333333333333330300000030333333333333330300
          0000330333333333333033000000333033333333330333000000333300333333
          003333000000333333000000333333000000}
        ParentShowHint = False
        ShowHint = True
        OnClick = btellipseClick
      end
      object bttext: TSpeedButton
        Left = 36
        Top = 93
        Width = 25
        Height = 24
        Hint = #25991#23383
        GroupIndex = 1
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = #23435#20307
        Font.Style = []
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000120B0000120B00001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00999999999999
          9999999999999999999999999999999999990000999000000099990999999000
          9999990999990000999999900000000999999990999000099999999099900099
          9999999909000099999999990900099999999999900009999999999990009999
          9999999990009999999999999909999999999999999999999999}
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = bttextClick
      end
      object Bevel1: TBevel
        Left = 1
        Top = 150
        Width = 64
        Height = 2
      end
      object Bevel2: TBevel
        Left = 3
        Top = 32
        Width = 62
        Height = 2
      end
      object Label32: TLabel
        Left = 4
        Top = 335
        Width = 30
        Height = 12
        Caption = 'Color'
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label40: TLabel
        Left = 3
        Top = 306
        Width = 24
        Height = 12
        Caption = 'Font'
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Bevel5: TBevel
        Left = 2
        Top = 267
        Width = 64
        Height = 2
      end
      object btarrow3: TSpeedButton
        Left = 36
        Top = 121
        Width = 25
        Height = 24
        Hint = #30011#21333#31661#22836'('#25353#19979'shift'#38190#30011'45'#24230#22402#30452#21333#31661#22836')'
        GroupIndex = 1
        Glyph.Data = {
          8A000000424D8A000000000000003E000000280000000F000000130000000100
          0100000000004C000000C40E0000C40E0000020000000000000000000000FFFF
          FF00FFFE0000E7FE0000E7FE0000E7FE0000E7FE0000E7FE0000E7FE0000E7FE
          0000E7FE0000E7CE0000E78E0000E73E0000E67E0000E4FE0000E1FE0000E3FE
          0000E3FE0000FFFE0000FFFE0000}
        ParentShowHint = False
        ShowHint = True
        OnClick = btarrow3Click
      end
      object btroundrect: TSpeedButton
        Left = 36
        Top = 65
        Width = 25
        Height = 24
        Hint = #30011#22278#35282#26041#24418'('#25353#19979'shift'#38190#30011#27491#26041#22278#35282')'
        GroupIndex = 1
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300000000
          0033330000003300333333333300330000003033333333333333030000003033
          3333333333330300000003333333333333333000000003333333333333333000
          0000033333333333333330000000033333333333333330000000033333333333
          3333300000000333333333333333300000000333333333333333300000000333
          3333333333333000000003333333333333333000000003333333333333333000
          0000303333333333333303000000303333333333333303000000330033333333
          330033000000333300000000003333000000}
        ParentShowHint = False
        ShowHint = True
        OnClick = btroundrectClick
      end
      object PenSize: TEdit
        Left = 27
        Top = 275
        Width = 22
        Height = 21
        Hint = #35774#32622#30011#31508#23485#24230
        MaxLength = 2
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Text = '1'
        OnChange = PenSizeChange
      end
      object PenWidth: TUpDown
        Left = 49
        Top = 275
        Width = 14
        Height = 21
        Associate = PenSize
        ArrowKeys = False
        Min = 1
        Max = 99
        Position = 1
        TabOrder = 1
      end
      object colortype: TPanel
        Left = 35
        Top = 330
        Width = 27
        Height = 22
        Hint = #35774#32622#30011#22270#25110#25991#23383#30340#39068#33394
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = #9670
        Color = clWhite
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -20
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = colortypeClick
      end
      object Font_size: TEdit
        Left = 27
        Top = 302
        Width = 22
        Height = 21
        Hint = #35774#32622#23383#20307#22823#23567
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        MaxLength = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        Text = '12'
        OnChange = Font_sizeChange
      end
      object Fontsize: TUpDown
        Left = 49
        Top = 302
        Width = 14
        Height = 21
        Associate = Font_size
        ArrowKeys = False
        Min = 1
        Max = 99
        Position = 12
        TabOrder = 4
      end
    end
    object Panel4: TPanel
      Left = 68
      Top = 1
      Width = 557
      Height = 563
      Align = alClient
      Caption = 'Panel4'
      TabOrder = 1
      object Label1: TLabel
        Left = 352
        Top = 426
        Width = 53
        Height = 13
        Caption = #22871'/A'#26495#65306
      end
      object Label2: TLabel
        Left = 446
        Top = 426
        Width = 66
        Height = 13
        Caption = 'A'#26495'/'#22823#26009#65306
      end
      object Label3: TLabel
        Left = 352
        Top = 447
        Width = 53
        Height = 13
        Caption = #22871'/B'#26495#65306
      end
      object Label4: TLabel
        Left = 446
        Top = 447
        Width = 66
        Height = 13
        Caption = 'B'#26495'/'#22823#26009#65306
      end
      object Label45: TLabel
        Left = 352
        Top = 469
        Width = 53
        Height = 13
        Caption = #26495#36793'Dx'#65306
      end
      object Label46: TLabel
        Left = 458
        Top = 469
        Width = 53
        Height = 13
        Caption = #26495#36793'Dy'#65306
      end
      object PageControl1: TPageControl
        Left = 1
        Top = 1
        Width = 555
        Height = 420
        ActivePage = TabSheet4
        Align = alTop
        Style = tsFlatButtons
        TabOrder = 0
        object TabSheet4: TTabSheet
          Caption = #24320#26009#31034#24847#22270
          OnShow = TabSheet4Show
          object Image1: TImage
            Left = 0
            Top = 0
            Width = 547
            Height = 389
            Align = alClient
            ParentShowHint = False
            ShowHint = False
            OnMouseDown = Image1MouseDown
            OnMouseMove = Image1MouseMove
            OnMouseUp = Image1MouseUp
          end
        end
        object TabSheet5: TTabSheet
          Caption = 'Panel A'#25340#29256#22270
          ImageIndex = 1
          OnShow = TabSheet5Show
          object Image2: TImage
            Left = 0
            Top = 0
            Width = 547
            Height = 389
            Align = alClient
            OnMouseDown = Image1MouseDown
            OnMouseMove = Image1MouseMove
            OnMouseUp = Image1MouseUp
          end
        end
        object TabSheet6: TTabSheet
          Caption = 'Panel B'#25340#29256#22270
          ImageIndex = 2
          OnShow = TabSheet6Show
          object Image3: TImage
            Left = 0
            Top = 0
            Width = 547
            Height = 389
            Align = alClient
            OnMouseDown = Image1MouseDown
            OnMouseMove = Image1MouseMove
            OnMouseUp = Image1MouseUp
          end
          object Image14: TImage
            Left = 0
            Top = 0
            Width = 547
            Height = 389
            Align = alClient
            Visible = False
          end
        end
      end
      object Edit2: TEdit
        Left = 398
        Top = 422
        Width = 44
        Height = 21
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 1
        OnKeyPress = Edit8KeyPress
      end
      object Edit3: TEdit
        Left = 506
        Top = 422
        Width = 44
        Height = 21
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 2
        OnKeyPress = Edit8KeyPress
      end
      object Edit4: TEdit
        Left = 398
        Top = 443
        Width = 44
        Height = 21
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 3
        OnKeyPress = Edit8KeyPress
      end
      object Edit5: TEdit
        Left = 506
        Top = 445
        Width = 44
        Height = 21
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 4
        OnKeyPress = Edit8KeyPress
      end
      object GroupBox4: TGroupBox
        Left = 352
        Top = 488
        Width = 200
        Height = 73
        Caption = 'Panel '#23610#23544#35843#25972
        TabOrder = 5
        object Label56: TLabel
          Left = 6
          Top = 48
          Width = 33
          Height = 13
          Caption = 'B'#26495#65306
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label57: TLabel
          Left = 6
          Top = 22
          Width = 33
          Height = 13
          Caption = 'A'#26495#65306
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label42: TLabel
          Left = 92
          Top = 22
          Width = 11
          Height = 13
          AutoSize = False
          Caption = '*'
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label43: TLabel
          Left = 92
          Top = 46
          Width = 11
          Height = 13
          AutoSize = False
          Caption = '*'
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Edit42: TEdit
          Left = 33
          Top = 18
          Width = 55
          Height = 21
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 0
          OnKeyPress = Edit6KeyPress
        end
        object Edit43: TEdit
          Left = 103
          Top = 18
          Width = 55
          Height = 21
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 1
          OnKeyPress = Edit6KeyPress
        end
        object Edit44: TEdit
          Left = 33
          Top = 45
          Width = 55
          Height = 21
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 2
          OnKeyPress = Edit6KeyPress
        end
        object Edit45: TEdit
          Left = 103
          Top = 45
          Width = 55
          Height = 21
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 3
          OnKeyPress = Edit6KeyPress
        end
      end
      object BtnMicroAdapt: TBitBtn
        Left = 514
        Top = 506
        Width = 32
        Height = 48
        Caption = #35843#25972
        Enabled = False
        TabOrder = 6
        WordWrap = True
        OnClick = BtnMicroAdaptClick
      end
      object Panel5: TPanel
        Left = 3
        Top = 30
        Width = 286
        Height = 29
        Align = alCustom
        BevelInner = bvRaised
        Color = clBackground
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        Visible = False
        object Label44: TLabel
          Left = 8
          Top = 9
          Width = 31
          Height = 13
          AutoSize = False
          Caption = #25991#23383#65306
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object inputtext: TEdit
          Left = 33
          Top = 5
          Width = 216
          Height = 21
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnExit = inputtextExit
        end
        object btntext: TBitBtn
          Left = 250
          Top = 6
          Width = 31
          Height = 21
          TabOrder = 1
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            04000000000080000000CE0E0000D80E00001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            7777777774F7777777777777444F777777777774444F7777777777444F44F777
            77777444F7744F777777774F77774F7777777777777774F7777777777777774F
            7777777777777774F7777070700777004F7770707070707774F7700070077077
            7747707070707077777777077007770077777777777777777777}
        end
      end
      object Panel6: TPanel
        Left = 1
        Top = 421
        Width = 348
        Height = 141
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 8
        object sgrid1: TStringGrid
          Left = 0
          Top = 0
          Width = 348
          Height = 106
          Align = alClient
          Color = clInfoBk
          ColCount = 7
          DefaultColWidth = 48
          DefaultRowHeight = 16
          FixedCols = 0
          RowCount = 20
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
          ScrollBars = ssVertical
          TabOrder = 0
          OnSelectCell = sgrid1SelectCell
          ColWidths = (
            30
            48
            48
            48
            48
            40
            48)
        end
        object Panel7: TPanel
          Left = 0
          Top = 106
          Width = 348
          Height = 35
          Align = alBottom
          TabOrder = 1
          Visible = False
          object Label38: TLabel
            Left = 4
            Top = 11
            Width = 59
            Height = 13
            Caption = #21033#29992#29575'%'#65306
          end
          object Label39: TLabel
            Left = 114
            Top = 11
            Width = 52
            Height = 13
            Caption = #22823#26009#38271#65306
          end
          object Label41: TLabel
            Left = 229
            Top = 11
            Width = 52
            Height = 13
            Caption = #22823#26009#23485#65306
          end
          object Edit33: TEdit
            Left = 56
            Top = 7
            Width = 52
            Height = 21
            Color = clInfoBk
            TabOrder = 0
            OnKeyPress = Edit6KeyPress
          end
          object Edit31: TEdit
            Left = 159
            Top = 7
            Width = 65
            Height = 21
            Color = clInfoBk
            TabOrder = 1
            OnKeyPress = Edit6KeyPress
          end
          object Edit32: TEdit
            Left = 274
            Top = 7
            Width = 65
            Height = 21
            Color = clInfoBk
            TabOrder = 2
            OnKeyPress = Edit6KeyPress
          end
        end
      end
      object Edit1: TEdit
        Left = 398
        Top = 466
        Width = 44
        Height = 21
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 9
        OnKeyPress = Edit8KeyPress
      end
      object Edit38: TEdit
        Left = 505
        Top = 468
        Width = 44
        Height = 21
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 10
        OnKeyPress = Edit8KeyPress
      end
    end
  end
  object PageControl2: TPageControl
    Left = 626
    Top = 38
    Width = 311
    Height = 565
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #26234#33021#25340#29256
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 303
        Height = 65
        Align = alTop
        Caption = #22871#26495'(Set)'
        TabOrder = 0
        object Label5: TLabel
          Left = 41
          Top = 20
          Width = 39
          Height = 13
          Caption = #38271#24230#65306
        end
        object Label6: TLabel
          Left = 145
          Top = 20
          Width = 39
          Height = 13
          Caption = #23485#24230#65306
        end
        object Label7: TLabel
          Left = 8
          Top = 44
          Width = 72
          Height = 13
          Caption = #21333#20803#25968'/'#22871#65306
        end
        object Edit6: TEdit
          Left = 80
          Top = 16
          Width = 57
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnKeyPress = Edit6KeyPress
        end
        object Edit7: TEdit
          Left = 184
          Top = 16
          Width = 57
          Height = 21
          TabOrder = 1
          OnKeyPress = Edit6KeyPress
        end
        object Edit8: TEdit
          Left = 80
          Top = 40
          Width = 57
          Height = 21
          TabOrder = 2
          OnKeyPress = Edit8KeyPress
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 65
        Width = 303
        Height = 197
        Align = alTop
        Caption = #25340#29256#35774#32622
        TabOrder = 1
        object Label8: TLabel
          Left = 8
          Top = 21
          Width = 65
          Height = 13
          Caption = #24320#26009#26041#24335#65306
        end
        object Label13: TLabel
          Left = 8
          Top = 144
          Width = 53
          Height = 13
          Caption = #26495#36793'Dx'#65306
        end
        object Label14: TLabel
          Left = 171
          Top = 143
          Width = 74
          Height = 13
          Caption = 'SET'#38388#36317'Dx'#65306
        end
        object Label15: TLabel
          Left = 8
          Top = 167
          Width = 53
          Height = 13
          Caption = #26495#36793'Dy'#65306
        end
        object Label16: TLabel
          Left = 171
          Top = 167
          Width = 74
          Height = 13
          Caption = 'SET'#38388#36317'Dy'#65306
        end
        object Shape5: TShape
          Left = 103
          Top = 149
          Width = 17
          Height = 2
        end
        object Shape6: TShape
          Left = 103
          Top = 171
          Width = 17
          Height = 2
        end
        object SpinEdit1: TSpinEdit
          Left = 72
          Top = 16
          Width = 41
          Height = 22
          EditorEnabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          MaxValue = 2
          MinValue = 1
          ParentFont = False
          TabOrder = 0
          Value = 1
          OnChange = SpinEdit1Change
        end
        object Edit13: TEdit
          Left = 240
          Top = 140
          Width = 45
          Height = 21
          TabOrder = 1
          OnKeyPress = Edit6KeyPress
        end
        object Edit14: TEdit
          Left = 240
          Top = 164
          Width = 45
          Height = 21
          TabOrder = 2
          OnKeyPress = Edit6KeyPress
        end
        object Edit15: TEdit
          Left = 120
          Top = 139
          Width = 45
          Height = 21
          TabOrder = 3
          OnKeyPress = Edit6KeyPress
        end
        object Edit16: TEdit
          Left = 120
          Top = 163
          Width = 45
          Height = 21
          TabOrder = 4
          OnKeyPress = Edit6KeyPress
        end
        object CheckBox1: TCheckBox
          Left = 131
          Top = 9
          Width = 127
          Height = 17
          Caption = #20801#35768#26495#36793#26041#21521#23545#35843
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 5
        end
        object CheckBox4: TCheckBox
          Left = 132
          Top = 26
          Width = 127
          Height = 17
          Caption = #20801#35768'PNL'#38271#23485#23545#35843
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 6
        end
        object GroupBox7: TGroupBox
          Left = 8
          Top = 48
          Width = 148
          Height = 81
          Caption = 'A'#26495'('#22823#26495')'
          TabOrder = 7
          object Label10: TLabel
            Left = 5
            Top = 25
            Width = 26
            Height = 13
            Caption = #38271#36793
          end
          object Shape1: TShape
            Left = 81
            Top = 31
            Width = 17
            Height = 2
          end
          object Label12: TLabel
            Left = 5
            Top = 56
            Width = 26
            Height = 13
            Caption = #23485#36793
          end
          object Shape2: TShape
            Left = 80
            Top = 61
            Width = 17
            Height = 2
          end
          object Edit10: TEdit
            Left = 35
            Top = 21
            Width = 45
            Height = 21
            TabOrder = 0
            OnKeyPress = Edit6KeyPress
          end
          object Edit9: TEdit
            Left = 96
            Top = 20
            Width = 45
            Height = 21
            TabOrder = 1
            OnKeyPress = Edit6KeyPress
          end
          object Edit12: TEdit
            Left = 34
            Top = 52
            Width = 45
            Height = 21
            TabOrder = 2
            OnKeyPress = Edit6KeyPress
          end
          object Edit11: TEdit
            Left = 97
            Top = 51
            Width = 45
            Height = 21
            TabOrder = 3
            OnKeyPress = Edit6KeyPress
          end
        end
        object GroupBox8: TGroupBox
          Left = 154
          Top = 48
          Width = 148
          Height = 81
          Caption = 'B'#26495'('#23567#26495')'
          TabOrder = 8
          object Label9: TLabel
            Left = 5
            Top = 25
            Width = 26
            Height = 13
            Caption = #38271#36793
          end
          object Shape3: TShape
            Left = 80
            Top = 31
            Width = 17
            Height = 2
          end
          object Label11: TLabel
            Left = 5
            Top = 56
            Width = 26
            Height = 13
            Caption = #23485#36793
          end
          object Shape4: TShape
            Left = 80
            Top = 61
            Width = 17
            Height = 2
          end
          object Edit34: TEdit
            Left = 98
            Top = 21
            Width = 45
            Height = 21
            TabOrder = 0
            OnKeyPress = Edit6KeyPress
          end
          object Edit36: TEdit
            Left = 98
            Top = 51
            Width = 45
            Height = 21
            TabOrder = 1
            OnKeyPress = Edit6KeyPress
          end
          object Edit35: TEdit
            Left = 32
            Top = 20
            Width = 45
            Height = 21
            TabOrder = 2
            OnKeyPress = Edit6KeyPress
          end
          object Edit37: TEdit
            Left = 33
            Top = 52
            Width = 45
            Height = 21
            TabOrder = 3
            OnKeyPress = Edit6KeyPress
          end
        end
        object Edit39: TEdit
          Left = 55
          Top = 140
          Width = 45
          Height = 21
          TabOrder = 9
          OnKeyPress = Edit6KeyPress
        end
        object Edit40: TEdit
          Left = 55
          Top = 163
          Width = 45
          Height = 21
          TabOrder = 10
          OnKeyPress = Edit6KeyPress
        end
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 262
        Width = 303
        Height = 275
        Align = alClient
        Caption = #26495#26009#35268#26684
        TabOrder = 2
        object Image5: TImage
          Left = 207
          Top = 14
          Width = 15
          Height = 15
          AutoSize = True
          ParentShowHint = False
          Picture.Data = {
            07544269746D617006030000424D060300000000000036000000280000000F00
            00000F0000000100180000000000D0020000C30E0000C30E0000000000000000
            0000808080BABABAEAEAEADFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF
            DFDFDFDFDFDFDFDFDFDFDFDFDFDFDF000000808080555555848484F3F3F3F3F3
            F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F300
            0000808080040404303030FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000808080161616434343FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
            0000808080161616434343FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000808080161616434343FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
            0000808080161616434343FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000808080161616434343FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
            0000808080161616434343FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000808080161616434343FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
            0000808080161616434343FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000808080161616434343FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
            00008080801313134A4A4AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000008080802020202929299D9D9D9D9D
            9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D00
            0000808080313131000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000}
          ShowHint = False
          Stretch = True
          Visible = False
        end
        object Image4: TImage
          Left = 227
          Top = 14
          Width = 15
          Height = 15
          AutoSize = True
          ParentShowHint = False
          Picture.Data = {
            07544269746D617006030000424D060300000000000036000000280000000F00
            00000F0000000100180000000000D0020000C30E0000C30E0000000000000000
            00000000009D9D9DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000009D9D9DFFFFFFFFFFFFFFFF
            FFF9F9F9F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
            00000000009B9B9BFFFFFFFFFFFFF5F5F5020202000000E5E5E5FEFEFEFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000009F9F9FFFFFFFFDFDFD0000
            00000000000000000000DDDDDDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
            0000000000B3B3B3C0C0C0020202000000070707141414010101000000E5E5E5
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000BABABA0101010000000808
            08C7C7C7F5F5F5010101010101000000DDDDDDFFFFFFFFFFFFFFFFFFFFFFFF00
            0000000000B9B9B90404040F0F0FE1E1E1FEFEFEFFFFFFFBFBFB070707000000
            000000DBDBDBFEFEFEFFFFFFFFFFFF000000000000B8B8B8020202F6F6F6FFFF
            FFFFFFFFFFFFFFFFFFFFFEFEFE090909000000000000DCDCDCFEFEFEFFFFFF00
            0000000000A4A4A4F2F2F2FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFDFDFD
            010101000000000000D9D9D9FFFFFF0000000000009A9A9AFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFB050505000000DEDEDEFFFFFF00
            0000000000A1A1A1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FDFDFDFFFFFF0A0A0AE6E6E6FFFFFF000000000000DADADAFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
            0000000000898989FDFDFDFEFEFEFAFAFAF9F9F9F9F9F9FBFBFBFAFAFAFAFAFA
            FBFBFBFBFBFBF9F9F9FBFBFBFFFFFF0000003131312020201616161616161616
            16161616161616161616161616161616161616161616101010707070FFFFFF00
            0000808080808080808080808080808080808080808080808080808080808080
            808080808080727272B1B1B1FFFFFF000000}
          ShowHint = False
          Stretch = True
          Visible = False
        end
        object Label37: TLabel
          Left = 8
          Top = 255
          Width = 65
          Height = 13
          Caption = #27599#22823#26009#26174#31034
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label47: TLabel
          Left = 114
          Top = 255
          Width = 26
          Height = 13
          Caption = #25490#27861
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object stringgrid1: TStringGrid
          Left = 8
          Top = 35
          Width = 289
          Height = 208
          ColCount = 3
          DefaultColWidth = 75
          DefaultRowHeight = 18
          FixedCols = 0
          RowCount = 2
          TabOrder = 1
          OnDrawCell = stringgrid1DrawCell
          OnMouseDown = stringgrid1MouseDown
          ColWidths = (
            76
            77
            97)
        end
        object CheckBox2: TCheckBox
          Left = 8
          Top = 17
          Width = 193
          Height = 17
          Caption = #36873#20013#20840#37096#22823#26009'('#26368#22810'15'#31181#35268#26684')'
          TabOrder = 0
          OnClick = CheckBox2Click
        end
        object BitBtn3: TBitBtn
          Left = 162
          Top = 248
          Width = 79
          Height = 25
          Caption = #33258#21160#25340#29256
          TabOrder = 2
          OnClick = BitBtn3Click
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            04000000000080000000120B0000120B00001000000010000000000000000000
            BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00999999999999
            9999999909999999999999990099999999999999000999999999999900009999
            9999999900B00999999999990BF709999999999990BF00999999999990FB7099
            99999999990FB00999999999990BF709999999999990B00099999999999001F0
            99999999999901FF099999999999011109999999999990009999}
        end
        object SpinEdit2: TSpinEdit
          Left = 76
          Top = 251
          Width = 37
          Height = 22
          EditorEnabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          MaxValue = 6
          MinValue = 1
          ParentFont = False
          TabOrder = 3
          Value = 1
          OnChange = SpinEdit1Change
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #25163#24037#25340#29256
      ImageIndex = 1
      object GroupBox5: TGroupBox
        Left = 0
        Top = 8
        Width = 249
        Height = 105
        Caption = #22871#26495'(Set)'
        TabOrder = 0
        object Label17: TLabel
          Left = 21
          Top = 21
          Width = 65
          Height = 13
          Caption = #22871#26495#38271#24230#65306
        end
        object Label18: TLabel
          Left = 21
          Top = 49
          Width = 65
          Height = 13
          Caption = #22871#26495#23485#24230#65306
        end
        object Label19: TLabel
          Left = 16
          Top = 77
          Width = 72
          Height = 13
          Caption = #21333#20803#25968'/'#22871#65306
        end
        object Edit17: TEdit
          Left = 88
          Top = 17
          Width = 105
          Height = 21
          TabOrder = 0
          OnKeyPress = Edit6KeyPress
        end
        object Edit18: TEdit
          Left = 88
          Top = 45
          Width = 105
          Height = 21
          TabOrder = 1
          OnKeyPress = Edit6KeyPress
        end
        object Edit19: TEdit
          Left = 88
          Top = 73
          Width = 105
          Height = 21
          TabOrder = 2
          OnKeyPress = Edit8KeyPress
        end
      end
      object GroupBox6: TGroupBox
        Left = 0
        Top = 144
        Width = 249
        Height = 313
        Caption = #25340#29256#35774#32622
        TabOrder = 1
        object Label21: TLabel
          Left = 8
          Top = 133
          Width = 79
          Height = 13
          Caption = #38453#21015#22871#25968'Dx'#65306
        end
        object Label22: TLabel
          Left = 8
          Top = 159
          Width = 79
          Height = 13
          Caption = #38453#21015#22871#25968'Dy'#65306
        end
        object Label23: TLabel
          Left = 8
          Top = 202
          Width = 87
          Height = 13
          Caption = #38453#21015'Pnl'#25968'Dx'#65306
        end
        object Label24: TLabel
          Left = 8
          Top = 228
          Width = 87
          Height = 13
          Caption = #38453#21015'Pnl'#25968'Dy'#65306
        end
        object Label25: TLabel
          Left = 8
          Top = 27
          Width = 79
          Height = 13
          Caption = #25340#29256#38388#36317'Dx'#65306
        end
        object Label26: TLabel
          Left = 8
          Top = 53
          Width = 79
          Height = 13
          Caption = #25340#29256#38388#36317'Dy'#65306
        end
        object Label27: TLabel
          Left = 8
          Top = 80
          Width = 79
          Height = 13
          Caption = #26495#36793#23485#24230'Dx'#65306
        end
        object Label28: TLabel
          Left = 8
          Top = 106
          Width = 79
          Height = 13
          Caption = #26495#36793#23485#24230'Dy'#65306
        end
        object Label20: TLabel
          Left = 8
          Top = 255
          Width = 65
          Height = 13
          Caption = #22823#26009#38271#24230#65306
        end
        object Label29: TLabel
          Left = 8
          Top = 282
          Width = 65
          Height = 13
          Caption = #22823#26009#23485#24230#65306
        end
        object Bevel3: TBevel
          Left = 7
          Top = 187
          Width = 228
          Height = 2
        end
        object Edit20: TEdit
          Left = 88
          Top = 129
          Width = 105
          Height = 21
          TabOrder = 4
          OnKeyPress = Edit8KeyPress
        end
        object Edit21: TEdit
          Left = 88
          Top = 155
          Width = 105
          Height = 21
          TabOrder = 5
          OnKeyPress = Edit8KeyPress
        end
        object Edit22: TEdit
          Left = 88
          Top = 198
          Width = 105
          Height = 21
          TabOrder = 6
          OnKeyPress = Edit8KeyPress
        end
        object Edit23: TEdit
          Left = 88
          Top = 224
          Width = 105
          Height = 21
          TabOrder = 7
          OnKeyPress = Edit8KeyPress
        end
        object Edit24: TEdit
          Left = 88
          Top = 23
          Width = 105
          Height = 21
          TabOrder = 0
          OnKeyPress = Edit6KeyPress
        end
        object Edit25: TEdit
          Left = 88
          Top = 49
          Width = 105
          Height = 21
          TabOrder = 1
          OnKeyPress = Edit6KeyPress
        end
        object Edit26: TEdit
          Left = 88
          Top = 76
          Width = 105
          Height = 21
          TabOrder = 2
          OnKeyPress = Edit6KeyPress
        end
        object Edit27: TEdit
          Left = 88
          Top = 102
          Width = 105
          Height = 21
          TabOrder = 3
          OnKeyPress = Edit6KeyPress
        end
        object Edit28: TEdit
          Left = 88
          Top = 251
          Width = 105
          Height = 21
          TabOrder = 8
          OnKeyPress = Edit6KeyPress
        end
        object Edit29: TEdit
          Left = 88
          Top = 278
          Width = 105
          Height = 21
          TabOrder = 9
          OnKeyPress = Edit6KeyPress
        end
      end
      object BitBtn2: TBitBtn
        Left = 80
        Top = 472
        Width = 97
        Height = 25
        Caption = #25163#24037#25340#29256
        TabOrder = 2
        OnClick = BitBtn2Click
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000120B0000120B00001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00999999999999
          9999999909999999999999990099999999999999000999999999999900009999
          9999999900B00999999999990BF709999999999990BF00999999999990FB7099
          99999999990FB00999999999990BF709999999999990B00099999999999001F0
          99999999999901FF099999999999011109999999999990009999}
      end
    end
    object TabSheet3: TTabSheet
      Caption = #26495#26009#26597#35810
      ImageIndex = 2
      object Label30: TLabel
        Left = 2
        Top = 20
        Width = 65
        Height = 13
        Caption = #26448#26009#32534#21495#65306
      end
      object Edit30: TEdit
        Left = 64
        Top = 16
        Width = 182
        Height = 21
        TabOrder = 0
        OnChange = Edit30Change
      end
      object Eh1: TDBGridEh
        Left = 0
        Top = 48
        Width = 249
        Height = 477
        DataSource = dm.DS17
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -13
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnTitleClick = Eh1TitleClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'inv_part_number'
            Footers = <>
            Title.Caption = #26448#26009#32534#21495
            Title.Color = clRed
            Width = 106
          end
          item
            EditButtons = <>
            FieldName = 'quan_on_hand'
            Footers = <>
            ReadOnly = False
            Title.Caption = #24211#23384
            Width = 55
          end
          item
            EditButtons = <>
            FieldName = 'inv_part_description'
            Footers = <>
            Title.Caption = #26448#26009#25551#36848
            Width = 225
          end
          item
            EditButtons = <>
            FieldName = 'UNIT_CODE'
            Footers = <>
            Title.Caption = #21333#20301
            Width = 30
          end
          item
            EditButtons = <>
            FieldName = 'ship_DATE'
            Footers = <>
            ReadOnly = False
            Title.Caption = #26469#26009#26085#26399
            Width = 76
          end
          item
            EditButtons = <>
            FieldName = 'ABBR_NAME'
            Footers = <>
            Title.Caption = #20379#24212#21830
            Width = 70
          end>
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 603
    Width = 937
    Height = 20
    Panels = <
      item
        Text = #24231#26631#65306
        Width = 200
      end
      item
        Text = #21333#20301#65306'MM'
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object ProgressBar1: TProgressBar
    Left = 403
    Top = 607
    Width = 533
    Height = 15
    Anchors = [akLeft, akRight, akBottom]
    Max = 2000
    Step = 1
    TabOrder = 4
  end
  object ImageList1: TImageList
    Left = 173
    Top = 208
    Bitmap = {
      494C01010A000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000008000000080000000000000800000008000008000
      0000800000000080000000800000008000000080000000800000008000000080
      0000008000000080000080000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000000008000000080000000000000800000008000000080
      000000800000008000000080000000FF000000FF000000FF000000FF000000FF
      0000008000000080000000800000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF00800080008000
      800080008000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000000000008000000080000000000000800000008000000080
      0000008000000080000000FF0000000000000000000000000000000000000000
      000000FF00000080000000800000008000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF00FFFFFF000000
      FF000000FF0080008000800080008000800000000000FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000000000008000000080000000000000800000008000000080
      0000008000000080000000000000000000000000000000000000000000000000
      00000000000000FF000000800000008000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000FF000000FF0080808000C0C0C00000000000FFFFFF00FFFF
      FF00C0C0C0000000000000008000000080000000000000800000008000000080
      0000008000000080000000800000000000000000000000000000000000000000
      00000000000000FF000080000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF00FFFFFF00808080000000000080000000FFFF
      FF00C0C0C0000000000000008000000080000000000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF000080000000FF
      000000FF00000080000000000000FFFFFF00FFFFFF00FFFF0000FF0000008000
      0000C0C0C0000000000000008000000080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF000080000000FF
      000000FF000000800000000000000000FF000000FF00FFFFFF00FF000000FF00
      0000800000000000000000008000000080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000800000008000000080000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF000080000000FF
      FF0000FF000000800000000000000000FF000000FF0080008000FFFFFF00FF00
      0000FF0000008000000000008000000080000000000000FF0000800000008000
      00008000000000000000000000000000000000000000000000000000000000FF
      0000008000000080000000800000008000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF00FFFFFF000080
      000000800000000000000000FF000000FF000000FF0080008000FFFFFF00FFFF
      FF00FF000000FF00000080000000000080000000000000FF0000008000000080
      0000800000000000000000000000000000000000000000000000000000000000
      000000FF00000080000000800000008000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000FF000000FF000000FF000000FF0080008000FFFFFF00FFFF
      FF00C0C0C000FF000000FF00000080000000000000000000000000FF00000080
      0000008000008000000000000000000000000000000000000000000000008000
      0000800000000080000000800000008000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008080800080808000808080008080800080008000FFFFFF00FFFF
      FF00C0C0C00000000000FF000000FF000000000000000000000000FF00000080
      0000008000000080000080000000800000008000000080000000800000000080
      0000008000000080000000800000008000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080008000800080008000800080008000000000000000
      0000000000000000000000008000FF00000000000000000000000000000000FF
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000FF000000FF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FFFF
      FF00808080000000800000008000000080000000000000000000000000000000
      000000FF000000FF000000800000008000000080000000800000008000000080
      000000FF000000FF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C0008080
      8000000080000000800000008000000080000000000000000000000000000000
      0000000000000000000000FF000000FF000000FF000000FF000000FF000000FF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080000000
      8000000080000000800000008000000080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00F7F7F700EFEFEF00E7E7E700E7E7E700E7E7E700EFEFEF00EFEFEF00F7F7
      F700FFFFFF000000000000000000000000000000000000000000000000009C9C
      FF000031FF000031FF000031FF000031FF000031FF000031FF000031FF000031
      FF000031FF000031FF000031FF000031FF000000000000000000000000000000
      0000000000005A735A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000D6D6D600E7732100D66B21000000
      0000FFFFFF00F7F7F700EFEFEF00EFEFEF00EFEFEF00F7F7F700FFFFFF000000
      00009C9CAD001818BD006363CE000000000000000000000000000031FF000000
      DE000000BD000000AD000000DE000000BD000000AD000000BD000000DE000000
      DE009C9CFF000000000000000000000000000000000000000000000000000000
      0000296B29002963290000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000ADADAD004A4AA5004A4A
      AD004A52AD004A52AD004A4AAD004A4AAD00424AAD004242AD004242AD004242
      AD004242AD0052527B00EFEFEF0000000000A56B4200C6B5B500E77B2100CE63
      1000000000000000000000000000000000000000000000000000000000001010
      9C001818A500A5A5F7003131D6000000000000000000CECECE000000AD005252
      52003131310000008C000000730042424200000000000000AD000000AD009C9C
      FF000000000000000000000000000000000000000000FFFFFF00000000002973
      290039843900296B290000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6D6D6003131D6000000B5000000
      BD000000C6000000CE000000D6000000DE000000E7000008E7000810E7001021
      EF002129EF003142EF0039399C000000000000000000E78C3900BD420800DE7B
      2900C65210000000000000000000000000000000000000000000101094001010
      9C00B5B5F7002929CE0010109C0000000000000000009C9C9C00313131003131
      31003131310000008C000000000052525200000000000000AD00000000000000
      0000000000000000000000000000000000000000000000000000296B29003984
      42003184390021842900187B1800187B18001084180010841800107B1000107B
      100010731000106B10006B846B00000000006B6B94000000AD000000BD000000
      C6000000C6001010D600ADADF700EFEFFF00D6D6FF006B6BF7000008E7001829
      EF002131EF002939EF00394AFF00000000000000000000000000CE732900AD31
      0000E7843900AD5221000000000000000000000000005A5A9C0010109400DEDE
      FF002929CE0010108C0000000000000000000000000052525200636363000000
      0000000000000000000031313100313131003131310000000000000000000000
      00000000000000000000000000000000000000000000296B290042844200398C
      390031AD390029BD310021CE310018DE290018DE290010DE210008CE180000BD
      080000940000005A00004A7B5200000000006B6B8C000000AD000000B5000000
      BD00B5B5EF00FFFFFF00FFFFFF00F7F7FF00FFFFFF00FFFFFF00FFFFFF002129
      EF002131EF002939EF003142F700000000000000000000000000EFEFEF00BD5A
      2100B5390000EF9C5200B59C9400000000000000000010109400CECEF7002121
      C60010108C000000000000000000000000000000000052525200737373000000
      0000000000000000000031313100313131003131310000000000000000000000
      00000000000000000000000000000000000000000000A5ADB5000873100008A5
      180029C631004AE75A0063FF73007BFF8C0084FF94006BFF7B0052EF630039DE
      4A0010B52100007B00004A845200000000006B6B8C000000AD000000B5007B7B
      DE00FFFFFF00BDBDEF000000CE000000DE000000E7002121DE00FFFFFF00FFFF
      FF001021EF002939EF003142EF0000000000000000000000000000000000C6BD
      BD00AD521800C64A0000F79C4200000000001818AD009C9CEF002929CE001010
      8C000000000000000000000000000000000000000000DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE000000
      00000000000000000000000000000000000000000000BDC6CE0084A5AD0021C6
      290042E7520042944A00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700ADBD
      B50031D64200009C00004A8C5200000000006B6B84001010B5000808B500FFFF
      FF00F7F7FF001010CE001818D6000000DE000000DE000000E7003139E700FFFF
      FF00848CF7002931EF002939EF00000000000000000000000000000000000000
      0000D6CECE00A5390000080873005A5AE7005252E7002929BD005A5A9C000000
      00000000000000000000000000000000000000000000DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE000000
      000000000000000000000000000000000000000000008C9CB5008CA5BD0084A5
      A50063FF73005AA55A00000000000000000000000000000000004A5A9C00D6DE
      D60063CE6B00299C29006B9C6B00000000006B6B84002121B5002929BD00FFFF
      FF009494E7002929CE003131D6003131DE003939E7001818E7000000E700FFFF
      FF00DEDEFF001829EF002131E700000000000000000000000000000000000000
      000000000000D6CECE00736BE7007373EF007B7BEF00BDBDC600000000000000
      0000000000000000000000000000000000000000000000005200639CCE000031
      9C00639CCE000000520000005200000052000000520000005200000052000000
      000000000000000000000000000000000000000000005284B5004A8CC6007BA5
      CE00C6CEC600529C5A0000000000000000000000000000000000BDE7FF003952
      8C009CBDA5008CAD8C00ADBDAD00000000006B6B84003131B5003131BD00FFFF
      FF00A5A5E7003939CE003939D6007373E7004242E7004A4AE7003939EF00FFFF
      FF00D6D6FF001018EF001821DE00000000000000000000000000000000000000
      00000000000000000000CEBDBD008C94EF001818C600B55A3100000000000000
      0000000000000000000000000000000000000000000000000000639CFF006363
      9C000000520000005200000052000000520063639C00639CFF00000000000000
      00000000000000000000000000000000000000000000187BCE00087BE70042A5
      FF000000000000000000000000000000000000000000000000007BBDFF002194
      FF00425A8400DEDEDE00E7E7E700000000006B6B7B004242B5003939BD00FFFF
      FF00FFFFFF004242CE004A4AD600FFFFFF00BDBDF7005252E7008C8CEF00FFFF
      FF006B73EF000810E7001010DE00000000000000000000000000000000000000
      000000000000CECED60094949400D6D6D600BD390000B56B42008C8C8C00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000639CFF000000520000005200639CFF000000000000000000000000000000
      000000000000000000000000000000000000000000001873CE000073DE00299C
      F7002142A500294AAD003152AD003152AD003152AD00294AA500399CFF000073
      EF000052AD004A5A7B0000000000000000006B6B7B005252BD005252BD008C8C
      CE00FFFFFF00EFEFFF005252D600FFFFFF00BDBDF7008C8CEF00FFFFFF00FFFF
      FF006B6BEF001818E7000000D600000000000000000000000000000000000000
      0000BDBDC600949494000000000000000000BDB5B500CEC6CE0084848400C6C6
      C600E7E7E7000000000000000000000000000000000000000000000000000000
      0000000000000000520000005200000000000000000000000000000000000000
      00000000000000000000000000000000000000000000428CDE002984DE002194
      EF0018A5FF0042B5FF005ABDFF005AB5FF0042ADFF00189CFF000084F700006B
      D6000052AD00004A9C004A5A7B00000000006B6B7B006363BD006363BD006363
      C600B5B5D600FFFFFF006363CE00FFFFFF00BDBDEF00FFFFFF00FFFFFF007373
      DE007B7BE7008484EF000000CE0000000000000000000000000000000000CECE
      CE009494940000000000000000000000000000000000FFFFFF008C8C8C00DEDE
      DE00848484008484840000000000000000000000000000000000000000000000
      0000000000000000520000005200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084BDF70073B5F7006BBD
      FF006BC6FF0063C6FF006BC6FF005AC6FF004AB5FF0042A5F700318CDE00297B
      CE00216BBD00295AA50000000000000000006B6B7B007373BD007373C6007373
      C6007373CE007373CE007373D600FFFFFF00CECEEF007B7BD6007B7BDE008C8C
      E7008C8CE7008C8CE7005252D600000000000000000000000000CECED6009494
      94000000000000000000000000000000000000000000FFFFFF00F7F7F700C6C6
      C60094949400C6C6C60000000000000000000000000000000000000000000000
      0000000000000000520000005200000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00E7E7EF00E7E7EF00E7E7EF00DEDEDE007BADE70073A5
      E700638CCE0000000000FFFFFF00000000006B6B7B007B7BC6007B7BC6008484
      C6008484CE008484CE008484CE00FFFFFF00B5B5E7009494DE009494DE009C9C
      DE009C9CDE009C9CDE008C8CDE000000000000000000F7F7F7009C9C9C000000
      000000000000000000000000000000000000000000009C9C9C00B5B5B500C6C6
      C60000000000BDBDBD0000000000000000000000000000000000000000000000
      0000000000000000520000005200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5CEF700A5C6
      E700FFFFFF00000000000000000000000000DEDEDE009C9CCE008C8CC6008C8C
      C6009494CE009494CE009494D6009494CE009C9CD6009C9CDE00A5A5DE00A5A5
      DE00ADADDE00A5A5DE009C9CCE0000000000F7F7F7009C9C9C00000000000000
      0000000000000000000000000000000000000000000000000000BDBDC600E7E7
      E700DEDEDE00C6C6C60000000000000000000000000000000000000000000000
      0000000000000000520000005200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6CED600FFFF
      FF000000000000000000000000000000000000000000A5A5AD00BDBDE700C6C6
      E700CECEEF00CECEEF00D6D6EF00D6D6F700DEDEF700DEDEF700E7E7F700E7E7
      F700E7E7FF009494BD0000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7E7E700B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B5004A4A4A00181818005252
      52000808080008080800BDBDBD001818180000000000FFFFFF00EFEFEF00DEDE
      DE00D6D6D600CECECE00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600CECE
      CE00D6D6D600E7E7E700FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000214221000000
      0000000000000000000000000000000000000000000000000000F7F7F700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0018181800FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0018181800FFFFFF0018101000181010002121
      21008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C00949494001010
      0800181010001810100021212100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000084A08002131
      210000000000000000000000000000000000EFEFEF008C8C8C00B5B5B500C6C6
      C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00BDBDBD003131310021181000211818002921
      2100A5A5A50018101000211818009C9C9C0094949400949494009C9C9C001818
      1000211818002921180029292100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D6DED600DEDEDE00D6DED600000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000008420800297B
      29001831180000000000000000000000000084848400BDBDBD00292929000000
      0000C6C6C600B5B5B500B5B5B500BDBDBD0018181800FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00181818003131310021181800292118003129
      2900ADADAD002118180029212100A5A5A5009C9C9C009C9C9C00A5A5A5002118
      1800292118002921210029292100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009CBD9C0094B59C008CAD8C0000000000395A39002952310031523100315A
      3100315A3100315A3100315A3100315A3100295A3100395A390010421000216B
      2900297B2900183918000000000000000000A5A5A500C6C6C6007B7B7B006363
      63005A5A5A005A5A5A005A5A5A005A5A5A007B7B7B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00181818003131310029212100292121003931
      2900BDBDBD002921210031292900ADADAD00ADADAD00ADADAD00B5B5B5002921
      2100312921002921210029292900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084D68C0063B56B00529C52000000000010631800005200000084000000AD
      000000C6080000CE100008D6100010CE180010C6180018AD180018A518002184
      2100296B2900317B31001031100000000000C6C6C600D6D6D600D6D6D600D6D6
      D600D6D6D600D6D6D600D6D6D600D6D6D60031313100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008C8C8C003131310031292100312929003939
      3100CECECE0021212100524A4A00BDC6C600BDBDBD00BDBDBD00C6C6C6003129
      2100312929003129210029292900000000000000000000000000000000000000
      00005AB56300E7EFE70000000000000000000000000000000000000000000000
      00007BEF8C0042C64A00299C310000000000186B2100005200000084000000AD
      000000C6000000D6000000E7080000E7080008D6100010CE180018BD210021AD
      2100298C2900396B39004A944A0000000000C6C6C600E7E7E700EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF009C9C9C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00181818003131310039312900393129003931
      3100312929003929290039292900392929003929290039292900312929004231
      31003931310039312900292929000000000000000000000000000000000021A5
      31008CFF9C00EFEFEF0000000000000000000000000000000000000000000000
      000063FF7B0021C63100089C100000000000186B2100007B000018BD21004AAD
      630063F7730084FF9400A5FFAD00ADFFB50094FFA5006BFF7B004ADE630018C6
      2900009C08000873080000000000000000009C9C9C00FFFFFF00EFF7EF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004A4A4A0042424200FFFFFF004242
      420042424200D6D6D6004A4A4A009C9C9C003131310039313100312929003131
      2900313131003931310039313100393931003931310039313100313131003131
      29003129290042313100292929000000000000000000000000001884210021D6
      31004AFF5A000000000000000000000000000000000000000000000000000000
      000052EF6B0010B52100008C08000000000018842100008C000029DE39007BAD
      7B00000000000000000000000000000000000000000000000000187B210031E7
      420029C631000000000000000000000000007B7B7B00EFFFEF00A5DEA500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B5B5B500000000003131310039313100D6CEC600DED6
      CE00DED6CE00DED6CE00DED6CE00DED6CE00DED6CE00DED6CE00DED6CE00DED6
      CE00DECEC60042313100292929000000000000000000185218000084000008AD
      100021D6310052D6630073F7840094F79C0094F7A50084F78C005AF76B0042D6
      520039DE5200009C08000063080000000000189421000894080042EF520084B5
      8C00000000000000000000000000000000000000000000000000317B31005AFF
      6B0000000000000000000000000000000000000000008C8C8C0094949400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700EFEFEF00EFEFEF00E7E7
      E700BDBDBD0073737300DEDEDE00000000003131310042393100DED6CE00E7DE
      D600E7DED600E7DED600E7DED600E7DED600E7DED600E7DED600E7DED600E7DE
      D600DED6CE004239390031292900000000001839180031A55A0029944A0021B5
      390029C64A0039D6520042E7520042F75A004AF75A004AF7520042E74A0039CE
      420021B53100218C29003173390000000000399442003994390063D66B00ADC6
      AD00000000000000000000000000000000000000000000000000295A31000000
      000000000000000000000000000000000000000000000000000000000000EFEF
      EF00A5A5A500A5A5A500A5A5A5009C9C9C0094949400949494008C8C8C00B5B5
      B50084848400000000000000000000000000313131004A393900E7DED600CEC6
      C600CEC6C600CEC6C600CEC6C600CEC6C600CEC6C600CEC6C600CEC6C600CEC6
      C600E7DED6004A4239003129290000000000000000005AB57300399452003994
      520039B552004AC65A005AD66B006BE773006BE77B0073EF7B0073E77B006BDE
      730063CE6B0063AD6B0084BD8C00000000008CA58C0094AD94009CC6A500D6DE
      D600000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B5B5
      B500FFFFFF00FFFFFF00F7F7F700EFEFEF00E7E7E700DEDEDE00D6D6D6008C8C
      8C0000000000000000000000000000000000313131004A424200EFE7DE00EFEF
      E700EFEFE700EFEFE700EFEFE700EFEFE700EFEFE700EFEFE700EFEFE700EFEF
      E700EFE7DE00524242003131290000000000000000000000000094DEAD006BB5
      840073AD8400427B4A00638C63005A8C63005A8C63005A8C63005A8C63005A84
      63005A8463005A7B6300526B5200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00F7F7F700EFEFEF00E7E7E700DEDEDE00DEDEDE00BDBD
      BD000000000000000000000000000000000031313100524A4200EFE7E700F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00EFEFE700524A4A003131310000000000000000000000000000000000D6FF
      DE00CEEFD6000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00F7F7F700FFFFFF00FFFFFF00F7F7F700EFEFEF00E7E7E700E7E7E700BDBD
      BD0000000000000000000000000000000000313131005A525200F7EFEF00DED6
      D600DED6D600DED6D600DED6D600DED6D600DED6D600DED6D600DED6D600DED6
      D600F7EFEF005A524A0031313100000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00F7F7F700FFFFFF00FFFFFF00FFFFFF00F7F7F700EFEFEF00EFEFEF00BDBD
      BD000000000000000000000000000000000031313100635A5A00FFFFF700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFF7F7006352520039313100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00DEDEDE00E7E7E700E7E7E700E7E7E700E7E7E700DEDEDE00DEDEDE00BDBD
      BD0000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFC8001000000000004800000000000
      000481F000000000008483F800000000004481F8000000001C4480FF00000000
      0204FFFF000000000204FFF000000000020087E000000000040087F000000000
      0000C3E0000000000004C00000000000003CE000000000000000F00300000000
      0000FC0F000000000000FFFF00000000E007E000FBFFC0071011C007F3FF8001
      0FE1800FA3FF000187C1801FC0010001C383801F80010001C187801F80010001
      E10F801F80010001F01F801F83C10001F83F801F83C10001FC3FC03F8FC10001
      F80FF0FF80030001F307F9FF80010001E783F9FF80030001CF83F9FF80050001
      9F8BF9FFFFC700013FC3F9FFFFCF8003C001FFFFFFFFC0008001FFF0FFDFC000
      0001FFF0FFCF00000001FFF1FFC700000001FFF1000300000001FFF100010000
      0001F3F1000100000001E3F1000300000001C7F10FC70001000180010FCF8001
      000100010FDFE007000180010FFFE00F0001C001FFFFE00F0001E7FF0FFFE00F
      0001F7FF0FFFE00F0001FFFFFFFFE00F00000000000000000000000000000000
      000000000000}
  end
  object ColorDialog1: TColorDialog
    OnShow = ColorDialog1Show
    Left = 205
    Top = 208
  end
  object PrintDlg: TPrintDialog
    Left = 240
    Top = 172
  end
  object OpenDlg: TOpenPictureDialog
    Filter = 'BMP and JPG Images|*.bmp;*.jpg;*.jpeg'
    Left = 173
    Top = 172
  end
  object SaveDlg: TSavePictureDialog
    DefaultExt = 'BMP'
    Filter = 'Bitmap file(*.bmp)|*.bmp|JPG file(*.jpg)|*.jpg'
    Left = 205
    Top = 172
  end
  object ppReport1: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297128
    PrinterSetup.mmPaperWidth = 210080
    PrinterSetup.PaperSize = 9
    Template.FileName = 'E:\lihao\program\'#24320#26009#36719#20214'\report.rtm'
    Units = utScreenPixels
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zsPercentage
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 141
    Top = 172
    Version = '7.01'
    mmColumnWidth = 197300
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 24871
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = #28145#22323#20116#27954#30005#36335#26495#26377#38480#20844#21496
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 59002
        mmTop = 1058
        mmWidth = 79640
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'WisdomPCB Software Technology Co.Ltd.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 59002
        mmTop = 6350
        mmWidth = 79640
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = #25340#29256#24320#26009#35774#35745#26041#26696
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6615
        mmLeft = 59002
        mmTop = 11377
        mmWidth = 79640
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 529
        mmTop = 24077
        mmWidth = 197380
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 1852
        mmLeft = 73819
        mmTop = 17992
        mmWidth = 52388
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = #23458#25143#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 2381
        mmTop = 18785
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 16404
        mmTop = 18785
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = #21378#32534#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 36248
        mmTop = 18785
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 50271
        mmTop = 18785
        mmWidth = 26723
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = #23458#25143#20135#21697#22411#21495#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 82021
        mmTop = 18785
        mmWidth = 28046
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 111390
        mmTop = 18785
        mmWidth = 83873
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 259557
      mmPrintPosition = 0
      object ppShape6: TppShape
        UserName = 'Shape6'
        Brush.Color = clBtnFace
        mmHeight = 4498
        mmLeft = 1852
        mmTop = 173038
        mmWidth = 107421
        BandType = 4
      end
      object ppShape5: TppShape
        UserName = 'Shape5'
        Pen.Width = 2
        mmHeight = 81227
        mmLeft = 1852
        mmTop = 177536
        mmWidth = 107686
        BandType = 4
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        Pen.Width = 2
        mmHeight = 81227
        mmLeft = 1852
        mmTop = 91281
        mmWidth = 107686
        BandType = 4
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        Pen.Width = 2
        mmHeight = 81227
        mmLeft = 1852
        mmTop = 4763
        mmWidth = 107686
        BandType = 4
      end
      object ppImage1: TppImage
        UserName = 'Image1'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 79375
        mmLeft = 2646
        mmTop = 5556
        mmWidth = 105834
        BandType = 4
      end
      object ppImage2: TppImage
        UserName = 'Image2'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 79375
        mmLeft = 2646
        mmTop = 92075
        mmWidth = 105834
        BandType = 4
      end
      object ppImage3: TppImage
        UserName = 'Image3'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 79375
        mmLeft = 2646
        mmTop = 178330
        mmWidth = 105834
        BandType = 4
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        Brush.Color = clBtnFace
        mmHeight = 4498
        mmLeft = 1852
        mmTop = 265
        mmWidth = 107421
        BandType = 4
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = #24320#26009#22270
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 18256
        mmTop = 265
        mmWidth = 73025
        BandType = 4
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = #22823#26009#23610#23544#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4868
        mmLeft = 121444
        mmTop = 4233
        mmWidth = 21167
        BandType = 4
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = #22871#26495#23610#23544#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 121444
        mmTop = 11642
        mmWidth = 21167
        BandType = 4
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = #25340#29256#25968'/'#22823#26009#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 116152
        mmTop = 19844
        mmWidth = 26458
        BandType = 4
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = #22871#26495#25968'/'#22823#26009#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 116152
        mmTop = 27781
        mmWidth = 26458
        BandType = 4
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = #21333#20803#25968'/'#22823#26009#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 116152
        mmTop = 43921
        mmWidth = 26458
        BandType = 4
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = #21333#20803#25968'/'#22871#26495#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 116152
        mmTop = 35719
        mmWidth = 26458
        BandType = 4
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = #22823#26009#21033#29992#29575#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 117211
        mmTop = 51065
        mmWidth = 25400
        BandType = 4
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = #25340#29256#38388#36317'DX'#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 115623
        mmTop = 58208
        mmWidth = 26988
        BandType = 4
      end
      object ppLabel21: TppLabel
        UserName = 'Label201'
        Caption = #25340#29256#38388#36317'DY'#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 115623
        mmTop = 65881
        mmWidth = 26988
        BandType = 4
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = #24037#33402#36793#23485#24230'DX'#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 111390
        mmTop = 72761
        mmWidth = 31221
        BandType = 4
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = #24037#33402#36793#23485#24230'DY'#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 111390
        mmTop = 80169
        mmWidth = 31221
        BandType = 4
      end
      object ppLabel34: TppLabel
        UserName = 'Label34'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 143934
        mmTop = 80169
        mmWidth = 34660
        BandType = 4
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 143934
        mmTop = 72761
        mmWidth = 34660
        BandType = 4
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 143934
        mmTop = 65881
        mmWidth = 34660
        BandType = 4
      end
      object ppLabel31: TppLabel
        UserName = 'Label202'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 143934
        mmTop = 58208
        mmWidth = 34660
        BandType = 4
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 143934
        mmTop = 51065
        mmWidth = 34660
        BandType = 4
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 143934
        mmTop = 43921
        mmWidth = 34660
        BandType = 4
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 143934
        mmTop = 35719
        mmWidth = 34660
        BandType = 4
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 143934
        mmTop = 27781
        mmWidth = 34660
        BandType = 4
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 143934
        mmTop = 19844
        mmWidth = 34660
        BandType = 4
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 143934
        mmTop = 11642
        mmWidth = 34660
        BandType = 4
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 143934
        mmTop = 4233
        mmWidth = 34660
        BandType = 4
      end
      object ppShape3: TppShape
        UserName = 'Shape3'
        Brush.Color = clBtnFace
        mmHeight = 4498
        mmLeft = 1852
        mmTop = 86784
        mmWidth = 107421
        BandType = 4
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        AutoSize = False
        Caption = 'PnlA'#25340#29256#31034#24847#22270
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 18256
        mmTop = 86784
        mmWidth = 73025
        BandType = 4
      end
      object ppLabel36: TppLabel
        UserName = 'Label36'
        AutoSize = False
        Caption = 'PnlB'#25340#29256#31034#24847#22270
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 18256
        mmTop = 173038
        mmWidth = 73025
        BandType = 4
      end
      object ppLabel37: TppLabel
        UserName = 'Label21'
        Caption = 'A'#25340#29256#23610#23544#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 118534
        mmTop = 121444
        mmWidth = 24077
        BandType = 4
      end
      object ppLabel38: TppLabel
        UserName = 'Label38'
        Caption = #25340#29256#25968'/'#22823#26009#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 116152
        mmTop = 128852
        mmWidth = 26458
        BandType = 4
      end
      object ppLabel39: TppLabel
        UserName = 'Label39'
        Caption = #22871#26495#25968'/'#25340#29256#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 116152
        mmTop = 136261
        mmWidth = 26458
        BandType = 4
      end
      object ppLabel40: TppLabel
        UserName = 'Label40'
        Caption = 'B'#25340#29256#23610#23544#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 118534
        mmTop = 209021
        mmWidth = 24077
        BandType = 4
      end
      object ppLabel41: TppLabel
        UserName = 'Label41'
        Caption = #25340#29256#25968'/'#22823#26009#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 116152
        mmTop = 216430
        mmWidth = 26458
        BandType = 4
      end
      object ppLabel42: TppLabel
        UserName = 'Label42'
        Caption = #22871#26495#25968'/'#25340#29256#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 116152
        mmTop = 223838
        mmWidth = 26458
        BandType = 4
      end
      object ppLabel43: TppLabel
        UserName = 'Label43'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 143934
        mmTop = 121444
        mmWidth = 34660
        BandType = 4
      end
      object ppLabel44: TppLabel
        UserName = 'Label44'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 143934
        mmTop = 128852
        mmWidth = 34660
        BandType = 4
      end
      object ppLabel45: TppLabel
        UserName = 'Label45'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 143934
        mmTop = 136261
        mmWidth = 34660
        BandType = 4
      end
      object ppLabel46: TppLabel
        UserName = 'Label46'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 143934
        mmTop = 209021
        mmWidth = 34660
        BandType = 4
      end
      object ppLabel47: TppLabel
        UserName = 'Label47'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 143934
        mmTop = 216430
        mmWidth = 34660
        BandType = 4
      end
      object ppLabel48: TppLabel
        UserName = 'Label48'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 143934
        mmTop = 223838
        mmWidth = 34660
        BandType = 4
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 149225
        mmTop = 253471
        mmWidth = 39158
        BandType = 4
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = #25171#21360#26102#38388#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 127529
        mmTop = 253471
        mmWidth = 21167
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
  end
end
