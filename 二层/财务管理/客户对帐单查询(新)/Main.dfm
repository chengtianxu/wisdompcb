object Frm_Main: TFrm_Main
  Left = 439
  Top = 290
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #23458#25143#23545#24080#21333#26597#35810
  ClientHeight = 321
  ClientWidth = 593
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 585
    Height = 97
    Caption = #23458#25143#33539#22260
    TabOrder = 0
    object Label1: TLabel
      Left = 40
      Top = 28
      Width = 13
      Height = 13
      Caption = #20174
    end
    object Label2: TLabel
      Left = 40
      Top = 64
      Width = 13
      Height = 13
      Caption = #21040
    end
    object Label3: TLabel
      Left = 176
      Top = 28
      Width = 7
      Height = 13
    end
    object Label4: TLabel
      Left = 176
      Top = 64
      Width = 7
      Height = 13
    end
    object Edit1: TEdit
      Left = 56
      Top = 24
      Width = 73
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
      OnExit = Edit1Exit
    end
    object BitBtn1: TBitBtn
      Left = 136
      Top = 22
      Width = 26
      Height = 26
      TabOrder = 1
      OnClick = BitBtn1Click
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
    object BitBtn2: TBitBtn
      Left = 136
      Top = 58
      Width = 26
      Height = 26
      TabOrder = 2
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
    object Edit2: TEdit
      Left = 56
      Top = 60
      Width = 73
      Height = 21
      TabOrder = 3
      OnChange = Edit1Change
      OnExit = Edit1Exit
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 112
    Width = 585
    Height = 49
    Caption = #21457#31080#31867#22411
    TabOrder = 1
    object CheckBox1: TCheckBox
      Left = 64
      Top = 20
      Width = 73
      Height = 17
      Caption = #26631#20934#21457#31080
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object CheckBox2: TCheckBox
      Left = 160
      Top = 20
      Width = 73
      Height = 17
      Caption = #24037#20855#21457#31080
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object CheckBox3: TCheckBox
      Left = 264
      Top = 20
      Width = 73
      Height = 17
      Caption = #26434#39033#21457#31080
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object CheckBox4: TCheckBox
      Left = 368
      Top = 20
      Width = 73
      Height = 17
      Caption = #36864#36135#22791#24536
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object CheckBox5: TCheckBox
      Left = 472
      Top = 20
      Width = 81
      Height = 17
      Caption = #26080#36864#36135#22791#24536
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 168
    Width = 585
    Height = 49
    Caption = #25130#27490#26085#26399
    TabOrder = 2
    object Label5: TLabel
      Left = 208
      Top = 22
      Width = 13
      Height = 13
      Caption = #20174
    end
    object Label6: TLabel
      Left = 360
      Top = 22
      Width = 13
      Height = 13
      Caption = #21040
    end
    object ComboBox1: TComboBox
      Left = 64
      Top = 18
      Width = 105
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = #20837#24080#26085#26399
      Items.Strings = (
        #20837#24080#26085#26399
        #24080#40836#26085#26399)
    end
    object dtpk1: TDateTimePicker
      Left = 232
      Top = 18
      Width = 120
      Height = 21
      Date = 40179.418101099540000000
      Time = 40179.418101099540000000
      TabOrder = 1
    end
    object dtpk2: TDateTimePicker
      Left = 384
      Top = 18
      Width = 120
      Height = 21
      Date = 40574.418101099540000000
      Time = 40574.418101099540000000
      TabOrder = 2
    end
  end
  object BitBtn3: TBitBtn
    Left = 200
    Top = 288
    Width = 75
    Height = 25
    Caption = #26597#25214
    TabOrder = 3
    OnClick = BitBtn3Click
    OnEnter = BitBtn3Enter
    Kind = bkOK
  end
  object BitBtn4: TBitBtn
    Left = 312
    Top = 288
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 4
    OnClick = BitBtn4Click
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
  object GroupBox4: TGroupBox
    Left = 8
    Top = 224
    Width = 585
    Height = 49
    Caption = #25490#24207#26041#24335
    TabOrder = 5
    object RadioButton1: TRadioButton
      Left = 160
      Top = 20
      Width = 97
      Height = 17
      Caption = #25353#23458#25143#35746#21333#21495
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object RadioButton2: TRadioButton
      Left = 320
      Top = 20
      Width = 89
      Height = 17
      Caption = #25353#20986#36135#26085#26399
      TabOrder = 1
    end
  end
end
