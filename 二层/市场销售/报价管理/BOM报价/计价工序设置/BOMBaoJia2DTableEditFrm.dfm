object frmBOMBaoJia2DTableEdit: TfrmBOMBaoJia2DTableEdit
  Left = 0
  Top = 0
  Caption = #32534#36753
  ClientHeight = 610
  ClientWidth = 752
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 752
    Height = 33
    Align = alTop
    TabOrder = 0
    object btn1: TRzButton
      Left = 16
      Top = 4
      Caption = #20445#23384
      TabOrder = 0
      OnClick = btn1Click
    end
    object btn2: TRzButton
      Left = 112
      Top = 4
      Caption = #36864#20986
      TabOrder = 1
      OnClick = btn2Click
    end
  end
  object pnl2: TRzPanel
    Left = 0
    Top = 33
    Width = 752
    Height = 56
    Align = alTop
    TabOrder = 1
    object lbl2: TLabel
      Left = 137
      Top = 7
      Width = 36
      Height = 13
      Caption = #21015#25968#65306
    end
    object lbl1: TLabel
      Left = 16
      Top = 7
      Width = 36
      Height = 13
      Caption = #34892#25968#65306
    end
    object lbl3: TLabel
      Left = 16
      Top = 29
      Width = 42
      Height = 13
      Caption = 'X'#31867#22411#65306
    end
    object lbl4: TLabel
      Left = 137
      Top = 29
      Width = 42
      Height = 13
      Caption = 'Y'#31867#22411#65306
    end
    object rgXValueType: TRadioGroup
      Left = 320
      Top = 0
      Width = 137
      Height = 47
      Caption = 'X'#21462#20540
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #31934#30830
        #33539#22260)
      TabOrder = 0
    end
    object btn3: TButton
      Left = 255
      Top = 24
      Width = 61
      Height = 25
      Caption = #35774#32622'XY'#20540
      TabOrder = 1
      OnClick = btn3Click
    end
    object btn4: TButton
      Left = 255
      Top = 1
      Width = 61
      Height = 25
      Caption = #35774#32622'XY'#38271
      TabOrder = 2
      OnClick = btn4Click
    end
    object se1: TSpinEdit
      Left = 58
      Top = 3
      Width = 71
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 3
      Value = 0
    end
    object se2: TSpinEdit
      Left = 178
      Top = 3
      Width = 71
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 4
      Value = 0
    end
    object cbxXType: TRzComboBox
      Left = 58
      Top = 26
      Width = 71
      Height = 21
      TabOrder = 5
      Text = #25968#23383
      Items.Strings = (
        #25968#23383
        #23383#31526)
      ItemIndex = 0
    end
    object cbxYtype: TRzComboBox
      Left = 178
      Top = 26
      Width = 71
      Height = 21
      TabOrder = 6
      Text = #25968#23383
      Items.Strings = (
        #25968#23383
        #23383#31526)
      ItemIndex = 0
    end
    object rgYValueType: TRadioGroup
      Left = 463
      Top = 0
      Width = 137
      Height = 47
      Caption = 'Y'#21462#20540
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #31934#30830
        #33539#22260)
      TabOrder = 7
    end
    object btn5: TButton
      Left = 624
      Top = 16
      Width = 75
      Height = 25
      Caption = 'btn5'
      TabOrder = 8
      Visible = False
      OnClick = btn5Click
    end
  end
  object pnl3: TRzPanel
    Left = 0
    Top = 89
    Width = 752
    Height = 521
    Align = alClient
    TabOrder = 2
    object sg1: TStringGrid
      Left = 2
      Top = 2
      Width = 748
      Height = 517
      Align = alClient
      Ctl3D = True
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      ParentCtl3D = False
      TabOrder = 0
    end
  end
  object cdsBP13: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp1'
    Left = 424
    Top = 360
    object strngfldBP3IDKey: TStringField
      FieldName = 'IDKey'
      FixedChar = True
      Size = 38
    end
    object strngfldBP3BP12_ptr: TStringField
      FieldName = 'BP12_ptr'
      FixedChar = True
      Size = 38
    end
    object strngfldBP3X: TStringField
      FieldName = 'X'
      Size = 500
    end
    object strngfldBP3Y: TStringField
      FieldName = 'Y'
      Size = 500
    end
    object intgrfldBP3Cell_Col: TIntegerField
      FieldName = 'Cell_Col'
    end
    object intgrfldBP3Cell_Row: TIntegerField
      FieldName = 'Cell_Row'
    end
    object strngfldBP3TValue: TStringField
      FieldName = 'TValue'
      Size = 500
    end
  end
  object dsBP13: TDataSource
    DataSet = cdsBP13
    Left = 480
    Top = 360
  end
end
