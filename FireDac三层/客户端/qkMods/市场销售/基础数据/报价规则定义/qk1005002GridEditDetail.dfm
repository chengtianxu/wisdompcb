inherited frmqk1005002GridEditDetail: Tfrmqk1005002GridEditDetail
  ClientHeight = 504
  ClientWidth = 799
  ExplicitWidth = 815
  ExplicitHeight = 543
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 799
    Height = 504
    Align = alClient
    TabOrder = 0
    object pnl2: TPanel
      Left = 1
      Top = 1
      Width = 797
      Height = 64
      Align = alTop
      TabOrder = 0
      object lbl2: TLabel
        Left = 209
        Top = 14
        Width = 39
        Height = 13
        Caption = #21015#25968#65306
      end
      object lbl1: TLabel
        Left = 88
        Top = 14
        Width = 39
        Height = 13
        Caption = #34892#25968#65306
      end
      object lbl3: TLabel
        Left = 88
        Top = 40
        Width = 46
        Height = 13
        Caption = 'X'#31867#22411#65306
      end
      object lbl4: TLabel
        Left = 209
        Top = 40
        Width = 46
        Height = 13
        Caption = 'Y'#31867#22411#65306
      end
      object btn1: TRzBitBtn
        Left = 1
        Top = 1
        Width = 40
        Height = 62
        Align = alLeft
        Caption = #30830#23450
        Enabled = False
        TabOrder = 0
        OnClick = btn1Click
        NumGlyphs = 2
      end
      object btn2: TRzBitBtn
        Left = 41
        Top = 1
        Width = 40
        Height = 62
        Align = alLeft
        Caption = #20462#25913
        TabOrder = 1
        OnClick = btn2Click
      end
      object btn3: TButton
        Left = 327
        Top = 33
        Width = 61
        Height = 25
        Caption = #35774#32622'XY'#20540
        Enabled = False
        TabOrder = 2
        OnClick = btn3Click
      end
      object btn4: TButton
        Left = 327
        Top = 8
        Width = 61
        Height = 25
        Caption = #35774#32622'XY'#38271
        Enabled = False
        TabOrder = 3
        OnClick = btn4Click
      end
      object se1: TSpinEdit
        Left = 130
        Top = 10
        Width = 71
        Height = 22
        Enabled = False
        MaxValue = 5000
        MinValue = 0
        TabOrder = 4
        Value = 0
      end
      object se2: TSpinEdit
        Left = 250
        Top = 10
        Width = 71
        Height = 22
        Enabled = False
        MaxValue = 5000
        MinValue = 0
        TabOrder = 5
        Value = 0
      end
      object rgYValueType: TRadioGroup
        Left = 535
        Top = 8
        Width = 137
        Height = 50
        Caption = 'Y'#21462#20540
        Columns = 2
        Enabled = False
        ItemIndex = 0
        Items.Strings = (
          #31934#30830
          #33539#22260)
        TabOrder = 6
      end
      object rgXValueType: TRadioGroup
        Left = 392
        Top = 8
        Width = 137
        Height = 50
        Caption = 'X'#21462#20540
        Columns = 2
        Enabled = False
        ItemIndex = 0
        Items.Strings = (
          #31934#30830
          #33539#22260)
        TabOrder = 7
      end
      object cbxYtype: TRzComboBox
        Left = 250
        Top = 35
        Width = 71
        Height = 21
        Enabled = False
        TabOrder = 8
        Text = #25968#23383
        Items.Strings = (
          #25968#23383
          #23383#31526)
        ItemIndex = 0
      end
      object cbxXType: TRzComboBox
        Left = 130
        Top = 35
        Width = 71
        Height = 21
        Enabled = False
        TabOrder = 9
        Text = #25968#23383
        Items.Strings = (
          #25968#23383
          #23383#31526)
        ItemIndex = 0
      end
      object btn5: TRzBitBtn
        Left = 678
        Top = 3
        Width = 35
        Height = 58
        Caption = #23548#20986
        TabOrder = 10
        OnClick = btn5Click
      end
    end
    object pnl3: TPanel
      Left = 1
      Top = 65
      Width = 797
      Height = 438
      Align = alClient
      TabOrder = 1
      object sg1: TStringGrid
        Left = 1
        Top = 1
        Width = 795
        Height = 436
        Align = alClient
        DefaultColWidth = 100
        TabOrder = 0
      end
    end
  end
end
