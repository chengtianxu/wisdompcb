object Form1: TForm1
  Left = 206
  Top = 174
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #21046#36896#36153#29992#26723#26696
  ClientHeight = 534
  ClientWidth = 710
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 710
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 2
      Top = 4
      Width = 60
      Height = 29
      Caption = #36864#20986
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
      OnClick = SpeedButton1Click
    end
    object Label1: TLabel
      Left = 211
      Top = 14
      Width = 65
      Height = 13
      Caption = #26680#31639#24180#24230#65306
    end
    object SpeedButton2: TSpeedButton
      Left = 66
      Top = 4
      Width = 60
      Height = 29
      Caption = #21047#26032
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADABFBFBDADADADADADDADADBFADADADADAADADAD000DADADADDADAD0FBF0DA
        DADAADAD0F7FBF0DADADDAD0F7F87BF0DADAAD0F7F87BFB70DADD0F7F87BFB78
        80DA000F87BFB78880ADDAD00BFB78880ADAADADA0B7888740ADDADADA088804
        440AADADADA000A04440DADADADADADA0440ADADADADADADA00D}
      OnClick = SpeedButton2Click
    end
    object SpinEdit1: TSpinEdit
      Left = 279
      Top = 8
      Width = 74
      Height = 22
      MaxValue = 2050
      MinValue = 2000
      TabOrder = 0
      Value = 2000
      OnChange = SpinEdit1Change
    end
  end
  object SGrid1: TStringGrid
    Left = 0
    Top = 41
    Width = 710
    Height = 480
    Align = alTop
    Ctl3D = False
    DefaultRowHeight = 18
    FixedColor = clMoneyGreen
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
    ParentCtl3D = False
    PopupMenu = PopupMenu1
    TabOrder = 1
    OnDblClick = SGrid1DblClick
    OnMouseDown = SGrid1MouseDown
    ColWidths = (
      57
      186
      189
      71
      198)
  end
  object SGrid2: TStringGrid
    Left = 128
    Top = 168
    Width = 73
    Height = 241
    ColCount = 1
    FixedCols = 0
    RowCount = 2
    TabOrder = 2
    Visible = False
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 280
    Top = 208
    object N1: TMenuItem
      Caption = #20462#35746#21046#36896#36153#29992#26723#26696
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #26597#38405#21046#36896#36153#29992#26723#26696
      OnClick = N2Click
    end
  end
end
