object frmPause: TfrmPause
  Left = 406
  Top = 183
  Width = 338
  Height = 322
  Caption = #24037#24207#26242#20572
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel5: TPanel
    Left = 0
    Top = 0
    Width = 330
    Height = 43
    Align = alTop
    TabOrder = 0
    object d34Rkey: TLabel
      Left = 200
      Top = 16
      Width = 3
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
  object Panel1: TPanel
    Left = 0
    Top = 107
    Width = 330
    Height = 184
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 24
      Top = 21
      Width = 48
      Height = 13
      Caption = #20316#19994#21333#21495
    end
    object Label2: TLabel
      Left = 24
      Top = 50
      Width = 48
      Height = 13
      Caption = #26412#21378#32534#21495
    end
    object Label4: TLabel
      Left = 24
      Top = 80
      Width = 48
      Height = 13
      Caption = #24037#24207#32534#21495
    end
    object Label5: TLabel
      Left = 50
      Top = 138
      Width = 24
      Height = 13
      Caption = #27493#39588
    end
    object Label6: TLabel
      Left = 24
      Top = 109
      Width = 48
      Height = 13
      Caption = #24037#24207#21517#31216
    end
    object Edit1: TEdit
      Left = 80
      Top = 16
      Width = 178
      Height = 21
      Color = clBtnFace
      Enabled = False
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 80
      Top = 45
      Width = 178
      Height = 21
      Color = clBtnFace
      Enabled = False
      TabOrder = 1
    end
    object Edit3: TEdit
      Left = 80
      Top = 74
      Width = 178
      Height = 21
      Color = clBtnFace
      Enabled = False
      TabOrder = 2
    end
    object Edit4: TEdit
      Left = 80
      Top = 103
      Width = 178
      Height = 21
      Color = clBtnFace
      Enabled = False
      TabOrder = 3
    end
    object Edit5: TEdit
      Left = 80
      Top = 132
      Width = 178
      Height = 21
      Color = clBtnFace
      Enabled = False
      TabOrder = 4
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 43
    Width = 330
    Height = 64
    Align = alTop
    TabOrder = 2
    object Label3: TLabel
      Left = 9
      Top = 11
      Width = 60
      Height = 13
      Caption = #26242#20572#23567#26102#25968
    end
    object Label7: TLabel
      Left = 145
      Top = 11
      Width = 24
      Height = 13
      Caption = #23567#26102
    end
    object Label8: TLabel
      Left = 8
      Top = 40
      Width = 48
      Height = 13
      Caption = #26242#20572#21407#22240
    end
    object edtHour: TEdit
      Left = 76
      Top = 7
      Width = 66
      Height = 21
      TabOrder = 0
    end
    object Edit6: TEdit
      Left = 61
      Top = 35
      Width = 226
      Height = 21
      TabOrder = 1
    end
  end
  object qry1: TADOQuery
    Connection = DM.con1
    Parameters = <>
    Left = 256
    Top = 24
  end
end
