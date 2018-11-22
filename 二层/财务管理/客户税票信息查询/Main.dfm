object Frm_Main: TFrm_Main
  Left = 355
  Top = 250
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #23458#25143#31246#31080#20449#24687#26597#35810
  ClientHeight = 350
  ClientWidth = 606
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
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
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 588
    Height = 89
    Caption = #23458#25143#33539#22260
    TabOrder = 0
    object Label1: TLabel
      Left = 40
      Top = 28
      Width = 26
      Height = 13
      Caption = #20174#65306
    end
    object Label2: TLabel
      Left = 40
      Top = 58
      Width = 26
      Height = 13
      Caption = #21040#65306
    end
    object Label3: TLabel
      Left = 200
      Top = 28
      Width = 7
      Height = 13
    end
    object Label4: TLabel
      Left = 200
      Top = 58
      Width = 7
      Height = 13
    end
    object Edit1: TEdit
      Left = 72
      Top = 24
      Width = 81
      Height = 21
      TabOrder = 0
      OnExit = Edit1Exit
    end
    object Edit2: TEdit
      Left = 72
      Top = 56
      Width = 81
      Height = 21
      TabOrder = 2
      OnExit = Edit1Exit
    end
    object BitBtn1: TBitBtn
      Left = 160
      Top = 24
      Width = 25
      Height = 22
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
      Left = 160
      Top = 56
      Width = 25
      Height = 22
      TabOrder = 3
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
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 104
    Width = 588
    Height = 65
    Caption = #25130#27490#26085#26399
    TabOrder = 1
    object Label5: TLabel
      Left = 208
      Top = 30
      Width = 26
      Height = 13
      Caption = #20174#65306
    end
    object Label6: TLabel
      Left = 360
      Top = 30
      Width = 26
      Height = 13
      Caption = #21040#65306
    end
    object ComboBox1: TComboBox
      Left = 80
      Top = 26
      Width = 97
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = #21457#31080#26085#26399
      Items.Strings = (
        #21457#31080#26085#26399
        #24080#40836#26085#26399
        #31246#31080#26085#26399
        #20973#35777#26085#26399)
    end
    object dtpk1: TDateTimePicker
      Left = 240
      Top = 26
      Width = 113
      Height = 21
      Date = 40925.000000000000000000
      Time = 40925.000000000000000000
      TabOrder = 1
    end
    object dtpk2: TDateTimePicker
      Left = 384
      Top = 26
      Width = 113
      Height = 21
      Date = 40925.999988425930000000
      Time = 40925.999988425930000000
      TabOrder = 2
    end
  end
  object BitBtn3: TBitBtn
    Left = 216
    Top = 314
    Width = 75
    Height = 25
    Caption = #26597#25214
    TabOrder = 5
    OnClick = BitBtn3Click
    OnEnter = BitBtn3Enter
    Kind = bkOK
  end
  object BitBtn4: TBitBtn
    Left = 320
    Top = 314
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 6
    Kind = bkClose
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 246
    Width = 588
    Height = 57
    Caption = #25490#24207#26041#24335
    TabOrder = 4
    object rdo1: TRadioButton
      Left = 136
      Top = 24
      Width = 113
      Height = 17
      Caption = #25353#23458#25143#20195#30721
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object rdo2: TRadioButton
      Left = 320
      Top = 24
      Width = 113
      Height = 17
      Caption = #25353#20986#36135#26085#26399
      TabOrder = 1
    end
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 180
    Width = 588
    Height = 57
    Caption = #20854#23427#26597#35810#26465#20214
    TabOrder = 3
    Visible = False
    object CheckBox2: TCheckBox
      Left = 137
      Top = 24
      Width = 160
      Height = 17
      Caption = #26597#35810#24179#34913#26410#35299#38145#25968#25454
      TabOrder = 0
    end
  end
  object rgOther: TRadioGroup
    Left = 8
    Top = 180
    Width = 588
    Height = 57
    Caption = #20854#20182#26597#35810#26465#20214
    Columns = 3
    ItemIndex = 2
    Items.Strings = (
      #24179#34913#35299#38145#25968#25454
      #24179#34913#26410#35299#38145#25968#25454
      #20840#37096#25968#25454)
    TabOrder = 2
  end
end
