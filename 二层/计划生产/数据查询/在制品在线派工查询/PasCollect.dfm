object FrmCollect: TFrmCollect
  Left = 318
  Top = 159
  BorderStyle = bsDialog
  Caption = #22312#32447#27966#24037#24037#24207#27719#24635
  ClientHeight = 477
  ClientWidth = 775
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 775
    Height = 38
    Align = alTop
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 8
      Top = 4
      Width = 63
      Height = 29
      Caption = #20851#38381
      ModalResult = 2
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
    object BitBtn2: TBitBtn
      Left = 73
      Top = 4
      Width = 63
      Height = 29
      Caption = #23548#20986
      TabOrder = 1
      OnClick = BitBtn2Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DADADADADADA
        DADAADADADADADADADADDADADADADAD00000000000000006666007777777706E
        EF0AA0E6666606EEF0ADDA0E66606EEF060AADA0E606EEF0000DDADA006EEF0A
        DADAADAD06EEF00DADADDAD06EEF0670DADAAD06EEF0E6670DADD06EEF0A0E66
        70DA0FFFF0ADA0EEEE0D00000ADADA00000AADADADADADADADAD}
    end
  end
  object SG1: TStringGrid
    Left = 0
    Top = 38
    Width = 775
    Height = 364
    Align = alClient
    ColCount = 7
    FixedCols = 0
    RowCount = 2
    TabOrder = 1
    OnDrawCell = SG1DrawCell
    ColWidths = (
      61
      121
      76
      73
      71
      122
      118)
  end
  object Panel2: TPanel
    Left = 0
    Top = 402
    Width = 775
    Height = 75
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 39
      Height = 13
      Caption = #35828#26126#65306
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 72
      Top = 16
      Width = 257
      Height = 13
      Caption = #36229#26399#30334#20998#27604'='#65288#36229#26399#21333#25968'/'#24635#36229#26399#21333#25968#65289'*100%'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 72
      Top = 40
      Width = 244
      Height = 13
      Caption = #20934#26399#30334#20998#27604'='#65288#20934#26399#21333#25968'/'#27966#24037#24635#25968#65289'*100%'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
  end
end
