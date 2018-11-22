object frmQuerySet: TfrmQuerySet
  Left = 290
  Top = 272
  Width = 616
  Height = 357
  Caption = #26597#35810#26465#20214#35774#32622
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StaticText2: TStaticText
    Left = 327
    Top = 27
    Width = 258
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BevelInner = bvLowered
    BevelOuter = bvNone
    Caption = #24050#23450#20041#30340#26465#20214
    Color = clGrayText
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindow
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 0
  end
  object SGrid1: TStringGrid
    Left = 338
    Top = 44
    Width = 247
    Height = 205
    ColCount = 3
    DefaultRowHeight = 19
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    PopupMenu = PopupMenu1
    ScrollBars = ssHorizontal
    TabOrder = 1
    ColWidths = (
      67
      174
      2)
  end
  object GroupBox6: TGroupBox
    Left = 7
    Top = 24
    Width = 330
    Height = 225
    Caption = #26597#35810#26465#20214#23450#20041
    TabOrder = 2
    object Label8: TLabel
      Left = 141
      Top = 26
      Width = 52
      Height = 13
      Caption = #20316#19994#21333#21495
    end
    object Label1: TLabel
      Left = 136
      Top = 56
      Width = 33
      Height = 13
      Caption = #24320#22987':'
      Visible = False
    end
    object Label2: TLabel
      Left = 136
      Top = 104
      Width = 33
      Height = 13
      Caption = #32467#26463':'
      Visible = False
    end
    object GroupBox1: TGroupBox
      Left = 136
      Top = 21
      Width = 185
      Height = 171
      Caption = #20837#24211#31867#22411
      TabOrder = 11
      object CheckBox1: TCheckBox
        Left = 16
        Top = 16
        Width = 97
        Height = 17
        Caption = #27491#24120#36807#25968
        TabOrder = 0
        OnClick = CheckBox1Click
      end
      object CheckBox2: TCheckBox
        Left = 16
        Top = 33
        Width = 97
        Height = 17
        Caption = #36864#36135#37325#26816
        TabOrder = 1
        OnClick = CheckBox1Click
      end
      object CheckBox3: TCheckBox
        Left = 16
        Top = 50
        Width = 97
        Height = 17
        Caption = #36820#20462#37325#26816
        TabOrder = 2
        OnClick = CheckBox1Click
      end
      object CheckBox4: TCheckBox
        Left = 16
        Top = 67
        Width = 97
        Height = 17
        Caption = #30452#25509#20837#24211
        TabOrder = 3
        OnClick = CheckBox1Click
      end
      object CheckBox5: TCheckBox
        Left = 16
        Top = 84
        Width = 97
        Height = 17
        Caption = #22996#22806#21152#24037
        TabOrder = 4
        OnClick = CheckBox1Click
      end
      object CheckBox6: TCheckBox
        Left = 16
        Top = 101
        Width = 97
        Height = 17
        Caption = #22996#22806#21152#24037#36864#36135
        TabOrder = 5
        OnClick = CheckBox1Click
      end
      object CheckBox8: TCheckBox
        Left = 16
        Top = 135
        Width = 97
        Height = 17
        Caption = #36716#25442#20837#20179
        TabOrder = 6
        OnClick = CheckBox1Click
      end
      object CheckBox9: TCheckBox
        Left = 16
        Top = 152
        Width = 97
        Height = 17
        Caption = #30424#28857#20837#20179
        TabOrder = 7
        OnClick = CheckBox1Click
      end
      object CheckBox7: TCheckBox
        Left = 16
        Top = 118
        Width = 97
        Height = 17
        Caption = #38144#21806#36864#36135
        TabOrder = 8
        OnClick = CheckBox1Click
      end
    end
    object rgType: TRadioGroup
      Left = 144
      Top = 75
      Width = 135
      Height = 77
      ItemIndex = 0
      Items.Strings = (
        #31561'  '#20110
        #30456'  '#20284)
      TabOrder = 6
    end
    object edtValue: TEdit
      Left = 144
      Top = 48
      Width = 134
      Height = 21
      TabOrder = 0
      OnChange = edtValueChange
      OnKeyPress = edtValueKeyPress
    end
    object Button3: TButton
      Left = 155
      Top = 193
      Width = 62
      Height = 25
      Caption = #22686#21152
      Enabled = False
      TabOrder = 1
      OnClick = Button3Click
    end
    object BitBtn6: TBitBtn
      Left = 285
      Top = 46
      Width = 25
      Height = 25
      TabOrder = 2
      Visible = False
      OnClick = BitBtn6Click
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
    object ListBox3: TListBox
      Left = 10
      Top = 40
      Width = 119
      Height = 177
      ItemHeight = 13
      TabOrder = 3
      OnClick = ListBox3Click
    end
    object StaticText7: TStaticText
      Left = 10
      Top = 23
      Width = 119
      Height = 17
      Alignment = taCenter
      AutoSize = False
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = #26465#20214#39033#30446
      Color = clGrayText
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 4
    end
    object Button4: TButton
      Left = 235
      Top = 193
      Width = 62
      Height = 25
      Caption = #28165#38500
      TabOrder = 5
      OnClick = Button4Click
    end
    object DTPk1: TDateTimePicker
      Left = 135
      Top = 81
      Width = 94
      Height = 21
      Date = 37257.000000000000000000
      Time = 37257.000000000000000000
      TabOrder = 7
      Visible = False
    end
    object DTpk2: TDateTimePicker
      Left = 135
      Top = 124
      Width = 94
      Height = 21
      Date = 37575.906419108790000000
      Time = 37575.906419108790000000
      TabOrder = 8
      Visible = False
    end
    object dttm1: TDateTimePicker
      Left = 230
      Top = 81
      Width = 88
      Height = 21
      Date = 38976.000000000000000000
      Time = 38976.000000000000000000
      Kind = dtkTime
      TabOrder = 9
      Visible = False
    end
    object dttm2: TDateTimePicker
      Left = 230
      Top = 123
      Width = 88
      Height = 21
      Date = 38976.999305555550000000
      Time = 38976.999305555550000000
      Kind = dtkTime
      TabOrder = 10
      Visible = False
    end
  end
  object Button1: TButton
    Left = 191
    Top = 280
    Width = 82
    Height = 28
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 3
  end
  object Button2: TButton
    Left = 335
    Top = 280
    Width = 82
    Height = 28
    Cancel = True
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 4
  end
  object PopupMenu1: TPopupMenu
    Left = 384
    Top = 149
    object N1: TMenuItem
      Caption = #21024#38500
      OnClick = Button4Click
    end
  end
end
