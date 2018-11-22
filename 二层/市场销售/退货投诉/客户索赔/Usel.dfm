object Form_sel: TForm_sel
  Left = 424
  Top = 305
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #26597#35810
  ClientHeight = 330
  ClientWidth = 572
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel5: TPanel
    Tag = 1
    Left = 0
    Top = 0
    Width = 572
    Height = 330
    Align = alClient
    Color = clWhite
    TabOrder = 0
    object Label8: TLabel
      Left = 27
      Top = 59
      Width = 66
      Height = 13
      Caption = #24320#22987#26102#38388': '
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 288
      Top = 59
      Width = 66
      Height = 13
      Caption = #32467#26463#26102#38388': '
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 153
      Top = 169
      Width = 52
      Height = 13
      Caption = #32034#36180#21333#21495
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 8
      Top = 100
      Width = 120
      Height = 15
      AutoSize = False
      Caption = '               '#26465#20214
      Color = clMoneyGreen
      ParentColor = False
    end
    object Label2: TLabel
      Left = 334
      Top = 100
      Width = 221
      Height = 15
      AutoSize = False
      Caption = '                         '#24050#23450#20041#30340#26465#20214
      Color = clMoneyGreen
      ParentColor = False
    end
    object DateTimePicker1: TDateTimePicker
      Left = 97
      Top = 55
      Width = 186
      Height = 21
      Date = 42976.402940069440000000
      Time = 42976.402940069440000000
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object DateTimePicker2: TDateTimePicker
      Left = 350
      Top = 55
      Width = 186
      Height = 21
      Date = 42976.403054884260000000
      Time = 42976.403054884260000000
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object ListBox1: TListBox
      Left = 7
      Top = 114
      Width = 121
      Height = 147
      Color = clMenu
      ItemHeight = 13
      Items.Strings = (
        #32034#36180#32534#21495
        #23458#25143#31616#31216
        #24405#20837#20154#21592
        #24037#21378
        ''
        ''
        '')
      TabOrder = 2
      OnClick = ListBox1Click
    end
    object Edit9: TEdit
      Left = 135
      Top = 189
      Width = 165
      Height = 21
      TabOrder = 3
    end
    object BitBtn7: TBitBtn
      Left = 304
      Top = 188
      Width = 22
      Height = 21
      TabOrder = 4
      OnClick = BitBtn7Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        333333777777777F33333330B00000003333337F7777777F3333333000000000
        333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
        333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
        03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
        03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
        3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
        333333333377F7F33333333333330F03333333333337F7F33333333333330B03
        3333333333373733333333333333303333333333333373333333}
      NumGlyphs = 2
    end
    object Button3: TButton
      Left = 159
      Top = 238
      Width = 48
      Height = 24
      Caption = #22686#21152
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 236
      Top = 238
      Width = 58
      Height = 24
      Caption = #20840#37096#28165#38500
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = Button4Click
    end
    object StringGrid1: TStringGrid
      Left = 335
      Top = 115
      Width = 222
      Height = 147
      Color = clMenu
      ColCount = 3
      DefaultRowHeight = 18
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      PopupMenu = PopupMenu1
      TabOrder = 7
      ColWidths = (
        80
        131
        2)
    end
    object BitBtn8: TBitBtn
      Left = 158
      Top = 305
      Width = 48
      Height = 24
      Caption = #26597#35810
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ModalResult = 1
      ParentFont = False
      TabOrder = 8
    end
    object BitBtn1: TBitBtn
      Left = 243
      Top = 305
      Width = 48
      Height = 24
      Caption = #36864#20986
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      OnClick = BitBtn1Click
    end
    object RadioGroup2: TRadioGroup
      Left = 143
      Top = 110
      Width = 168
      Height = 49
      Caption = #26465#20214
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #31561#20110' ='
        #30456#20284' Like')
      TabOrder = 10
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 420
    Top = 153
    object N1: TMenuItem
      Caption = #21024#38500
      OnClick = N1Click
    end
  end
end
