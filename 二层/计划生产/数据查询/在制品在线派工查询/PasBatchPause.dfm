object FrmBatchPause: TFrmBatchPause
  Left = 335
  Top = 167
  BorderStyle = bsDialog
  Caption = #25209#37327#24037#24207#26242#20572
  ClientHeight = 486
  ClientWidth = 704
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
  object Panel5: TPanel
    Left = 0
    Top = 0
    Width = 704
    Height = 43
    Align = alTop
    TabOrder = 0
    object d56STEP: TLabel
      Left = 200
      Top = 16
      Width = 7
      Height = 13
      Visible = False
    end
    object labD34Rkey: TLabel
      Left = 240
      Top = 24
      Width = 7
      Height = 13
      Visible = False
    end
    object BitBtn2: TBitBtn
      Left = 73
      Top = 6
      Width = 72
      Height = 32
      Caption = #26242#20572
      TabOrder = 0
      OnClick = BitBtn2Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADA000000000000ADAD0FFFFFFFFFF0DADA0F00F00000F0ADAD0FFFFFFFFFF0
        DADA0F00F00000F0ADAD0FFFFFFFFFF0DADA0FFFFFFF0FF0ADAD0FF0FFF080F0
        DAD40F080F0808000D440FF08080808880440000080808888844DADAD0808888
        8844ADADAD0888888044DADADAD000000A44ADADADADADADADAD}
    end
    object BitBtn5: TBitBtn
      Left = 3
      Top = 6
      Width = 70
      Height = 32
      Caption = #20851#38381
      ModalResult = 2
      TabOrder = 1
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
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 43
    Width = 704
    Height = 49
    Align = alTop
    TabOrder = 1
    object Label3: TLabel
      Left = 216
      Top = 18
      Width = 65
      Height = 13
      Caption = #26242#20572#23567#26102#25968
    end
    object Label7: TLabel
      Left = 393
      Top = 18
      Width = 26
      Height = 13
      Caption = #23567#26102
    end
    object Label1: TLabel
      Left = 16
      Top = 18
      Width = 26
      Height = 13
      Caption = #24037#24207
    end
    object SpeedButton2: TSpeedButton
      Left = 141
      Top = 12
      Width = 25
      Height = 24
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        04000000000078000000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888800000888880000080F000888880F00080F000888880F0008000000080000
        000800F000000F00000800F000800F00000800F000800F000008800000000000
        0088880F00080F000888880000080000088888800088800088888880F08880F0
        888888800088800088888888888888888888}
      OnClick = SpeedButton2Click
    end
    object edtHour: TEdit
      Left = 286
      Top = 14
      Width = 102
      Height = 21
      TabOrder = 0
      OnKeyPress = edtHourKeyPress
    end
    object Edit1: TEdit
      Left = 46
      Top = 14
      Width = 95
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object CheckBox1: TCheckBox
      Left = 472
      Top = 17
      Width = 97
      Height = 17
      Caption = #26159#21542#37325#26032#27966#24037
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 92
    Width = 704
    Height = 394
    Align = alClient
    TabOrder = 2
    object Button1: TButton
      Left = 312
      Top = 104
      Width = 75
      Height = 25
      Caption = #21333#20010#36873#8594
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 312
      Top = 152
      Width = 75
      Height = 25
      Caption = #20840#36873#8594
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 312
      Top = 200
      Width = 75
      Height = 25
      Caption = #8592#21333#20010#21462#28040
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 312
      Top = 248
      Width = 75
      Height = 25
      Caption = #8592#20840#21462#28040
      TabOrder = 3
      OnClick = Button4Click
    end
    object SGrid1: TStringGrid
      Left = 8
      Top = 6
      Width = 302
      Height = 376
      ColCount = 1
      FixedCols = 0
      RowCount = 2
      TabOrder = 4
      ColWidths = (
        180)
    end
    object SGrid2: TStringGrid
      Left = 386
      Top = 6
      Width = 307
      Height = 378
      ColCount = 1
      FixedCols = 0
      RowCount = 2
      TabOrder = 5
      ColWidths = (
        182)
    end
  end
end
