object frmQuery: TfrmQuery
  Left = 314
  Top = 221
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26597#35810
  ClientHeight = 396
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 117
    Top = 32
    Width = 78
    Height = 13
    Caption = #29983#25928#26085#26399#20174#65306
  end
  object Label2: TLabel
    Left = 341
    Top = 30
    Width = 26
    Height = 13
    Caption = #21040#65306
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 72
    Width = 345
    Height = 257
    Caption = #26597#35810#26465#20214#23450#20041
    TabOrder = 0
    object lbName: TLabel
      Left = 165
      Top = 32
      Width = 52
      Height = 13
      Caption = #35777#20070#21517#31216
    end
    object lbCondition: TListBox
      Left = 16
      Top = 32
      Width = 129
      Height = 201
      ItemHeight = 13
      Items.Strings = (
        #35777#20070#21517#31216
        #35777#20070#32534#21495
        #22833#25928#26085#26399
        #20837#32844#26085#26399
        #31163#32844#26085#26399
        #29366#24577
        #37096#38376
        #23703#20301)
      TabOrder = 0
      OnClick = lbConditionClick
    end
    object edtCondition: TEdit
      Left = 165
      Top = 56
      Width = 161
      Height = 21
      TabOrder = 1
    end
    object rgCondition: TRadioGroup
      Left = 165
      Top = 88
      Width = 161
      Height = 113
      ItemIndex = 0
      Items.Strings = (
        #30456#20284
        #31561#20110)
      TabOrder = 2
    end
    object btnAdd: TBitBtn
      Left = 163
      Top = 208
      Width = 75
      Height = 25
      Caption = #22686#21152
      TabOrder = 3
      OnClick = btnAddClick
    end
    object btnClear: TBitBtn
      Left = 250
      Top = 208
      Width = 75
      Height = 25
      Caption = #28165#31354
      TabOrder = 4
      OnClick = btnClearClick
    end
    object Panel1: TPanel
      Left = 164
      Top = 56
      Width = 162
      Height = 145
      BorderStyle = bsSingle
      TabOrder = 5
      object StaticText1: TStaticText
        Left = 16
        Top = 16
        Width = 17
        Height = 17
        Caption = #20174
        TabOrder = 0
      end
      object dtpkBegin: TDateTimePicker
        Left = 16
        Top = 43
        Width = 129
        Height = 21
        Date = 42231.430717581020000000
        Time = 42231.430717581020000000
        TabOrder = 1
      end
      object StaticText2: TStaticText
        Left = 16
        Top = 82
        Width = 17
        Height = 17
        Caption = #21040
        TabOrder = 2
      end
      object dtpkEnd: TDateTimePicker
        Left = 16
        Top = 111
        Width = 129
        Height = 21
        Date = 42231.431369872680000000
        Time = 42231.431369872680000000
        TabOrder = 3
      end
    end
    object rgStatus: TRadioGroup
      Left = 164
      Top = 52
      Width = 161
      Height = 147
      ItemIndex = 0
      Items.Strings = (
        #26377#25928
        #22833#25928)
      TabOrder = 6
    end
  end
  object GroupBox2: TGroupBox
    Left = 368
    Top = 72
    Width = 233
    Height = 257
    Caption = #23450#20041#30340#26465#20214
    TabOrder = 1
    object sgQuery: TStringGrid
      Left = 8
      Top = 32
      Width = 217
      Height = 241
      ColCount = 3
      FixedCols = 0
      RowCount = 2
      PopupMenu = PopupMenu1
      TabOrder = 0
      ColWidths = (
        81
        130
        3)
    end
  end
  object BitBtn1: TBitBtn
    Left = 160
    Top = 352
    Width = 89
    Height = 33
    Caption = #30830#35748
    ModalResult = 1
    TabOrder = 2
  end
  object BitBtn2: TBitBtn
    Left = 296
    Top = 352
    Width = 97
    Height = 33
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 3
  end
  object dtpkOn: TDateTimePicker
    Left = 213
    Top = 24
    Width = 97
    Height = 21
    Date = 42231.719533472220000000
    Time = 42231.719533472220000000
    TabOrder = 4
  end
  object dtpkTo: TDateTimePicker
    Left = 389
    Top = 24
    Width = 97
    Height = 21
    Date = 42231.719774895830000000
    Time = 42231.719774895830000000
    TabOrder = 5
  end
  object PopupMenu1: TPopupMenu
    Left = 480
    Top = 176
    object N1: TMenuItem
      Caption = #21024#38500
      OnClick = N1Click
    end
  end
end
