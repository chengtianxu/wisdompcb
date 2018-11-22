object frmQuery: TfrmQuery
  Left = 475
  Top = 295
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26597#35810
  ClientHeight = 371
  ClientWidth = 592
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 592
    Height = 371
    Align = alClient
    TabOrder = 0
    object GroupBox2: TGroupBox
      Left = 379
      Top = 35
      Width = 185
      Height = 249
      Caption = #24050#23450#20041#30340#26465#20214
      TabOrder = 0
      object sgCondition: TStringGrid
        Left = 2
        Top = 32
        Width = 181
        Height = 215
        Align = alBottom
        ColCount = 3
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        PopupMenu = PopupMenu1
        TabOrder = 0
        ColWidths = (
          71
          105
          3)
      end
    end
    object btnOk: TBitBtn
      Left = 175
      Top = 315
      Width = 75
      Height = 30
      Caption = #30830#23450
      ModalResult = 6
      TabOrder = 1
    end
    object btnCancel: TBitBtn
      Left = 320
      Top = 315
      Width = 75
      Height = 30
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 2
    end
    object gbCondition: TGroupBox
      Left = 19
      Top = 37
      Width = 345
      Height = 249
      Caption = #26465#20214#23450#20041
      TabOrder = 3
      object lbCondition: TLabel
        Left = 184
        Top = 32
        Width = 77
        Height = 13
        Caption = 'lbCondition'
      end
      object ltbConditon: TListBox
        Left = 15
        Top = 31
        Width = 145
        Height = 193
        ItemHeight = 13
        TabOrder = 0
        OnClick = ltbConditonClick
      end
      object btnAdd: TBitBtn
        Left = 176
        Top = 200
        Width = 70
        Height = 25
        Caption = #22686#21152
        TabOrder = 1
        OnClick = btnAddClick
      end
      object btnClear: TBitBtn
        Left = 260
        Top = 200
        Width = 70
        Height = 25
        Caption = #28165#31354
        TabOrder = 2
        OnClick = btnClearClick
      end
      object rgStatus: TRadioGroup
        Left = 184
        Top = 47
        Width = 137
        Height = 145
        ItemIndex = 0
        Items.Strings = (
          #26377#25928
          #25346#22833
          #36864#21345
          #25439#22351)
        TabOrder = 3
      end
      object edtCondition: TEdit
        Left = 184
        Top = 59
        Width = 137
        Height = 21
        TabOrder = 4
      end
      object pnl1: TPanel
        Left = 184
        Top = 52
        Width = 137
        Height = 145
        TabOrder = 5
        object lbl1: TLabel
          Left = 8
          Top = 16
          Width = 26
          Height = 13
          Caption = #20174#65306
        end
        object lbl2: TLabel
          Left = 8
          Top = 80
          Width = 26
          Height = 13
          Caption = #21040#65306
        end
        object dtpkFrom: TDateTimePicker
          Left = 8
          Top = 40
          Width = 113
          Height = 21
          Date = 42263.660011388880000000
          Time = 42263.660011388880000000
          TabOrder = 0
        end
        object dtpkTo: TDateTimePicker
          Left = 8
          Top = 112
          Width = 113
          Height = 21
          Date = 42263.660011388880000000
          Time = 42263.660011388880000000
          TabOrder = 1
        end
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 445
    Top = 153
    object nDelete: TMenuItem
      Caption = #21024#38500#19968#34892
      OnClick = nDeleteClick
    end
  end
end
