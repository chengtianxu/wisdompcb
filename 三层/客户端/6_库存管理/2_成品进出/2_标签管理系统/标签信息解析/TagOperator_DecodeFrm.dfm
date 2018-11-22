inherited frmTagOperator_Decode: TfrmTagOperator_Decode
  Caption = 'frmTagOperator_Decode'
  ClientHeight = 565
  ClientWidth = 725
  OnCreate = FormCreate
  ExplicitWidth = 741
  ExplicitHeight = 604
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlDisplay: TPanel
    Width = 725
    Height = 565
    ExplicitWidth = 725
    ExplicitHeight = 565
    object pnl1: TPanel
      Left = 177
      Top = 1
      Width = 547
      Height = 563
      Align = alClient
      TabOrder = 0
      object pnl5: TPanel
        Left = 1
        Top = 1
        Width = 545
        Height = 32
        Align = alTop
        TabOrder = 0
        object lbl1: TLabel
          Left = 167
          Top = 9
          Width = 48
          Height = 13
          Caption = #25968#25454#24211#65306
        end
        object cbxDB: TComboBox
          Left = 225
          Top = 5
          Width = 107
          Height = 21
          Style = csDropDownList
          TabOrder = 0
        end
        object btnOperator: TButton
          Left = 1
          Top = 1
          Width = 51
          Height = 30
          Align = alLeft
          Caption = #25805#20316
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = btnOperatorClick
        end
      end
      object ehTagDecode: TDBGridEh
        Left = 1
        Top = 33
        Width = 545
        Height = 529
        Align = alClient
        DataSource = dsTagDecode
        DynProps = <>
        ReadOnly = True
        TabOrder = 1
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object pnl2: TPanel
      Left = 1
      Top = 1
      Width = 176
      Height = 563
      Align = alLeft
      TabOrder = 1
      object pnl3: TPanel
        Left = 1
        Top = 33
        Width = 174
        Height = 529
        Align = alClient
        TabOrder = 0
        object mmo1: TMemo
          Left = 1
          Top = 1
          Width = 172
          Height = 399
          TabStop = False
          Align = alClient
          TabOrder = 0
        end
        object pnl6: TPanel
          Left = 1
          Top = 400
          Width = 172
          Height = 128
          Align = alBottom
          TabOrder = 1
          object lbl2: TLabel
            Left = 1
            Top = 1
            Width = 170
            Height = 15
            Align = alTop
            Caption = #35299#26512#22833#36133#21015#34920
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = #23435#20307
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 96
          end
          object mmoDecodeErr: TMemo
            Left = 1
            Top = 16
            Width = 170
            Height = 111
            Align = alClient
            TabOrder = 0
          end
        end
      end
      object pnl4: TPanel
        Left = 1
        Top = 1
        Width = 174
        Height = 32
        Align = alTop
        TabOrder = 1
        object lblLineNum: TLabel
          Left = 137
          Top = 8
          Width = 9
          Height = 15
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtScanBar: TLabeledEdit
          Left = 51
          Top = 5
          Width = 76
          Height = 21
          EditLabel.Width = 36
          EditLabel.Height = 13
          EditLabel.Caption = #25195#30721#65306
          LabelPosition = lpLeft
          TabOrder = 0
          OnKeyPress = edtScanBarKeyPress
        end
      end
    end
  end
  object cdsTagDecode: TClientDataSet [1]
    Aggregates = <>
    Params = <>
    Left = 392
    Top = 216
  end
  object dsTagDecode: TDataSource [2]
    DataSet = cdsTagDecode
    Left = 464
    Top = 216
  end
  object pmOperator: TPopupMenu [3]
    Left = 224
    Top = 8
    object mniTagDecode: TMenuItem
      Caption = #26631#31614#35299#26512
      OnClick = mniTagDecodeClick
    end
    object mniSumPack: TMenuItem
      Caption = #27719#24635#31665#25968
      OnClick = mniSumPackClick
    end
    object mniEXCEL1: TMenuItem
      Caption = #23548#20986'EXCEL'
      OnClick = mniEXCEL1Click
    end
    object mniClearMemo: TMenuItem
      Caption = #28165#31354
      OnClick = mniClearMemoClick
    end
    object mniInStock: TMenuItem
      Caption = #20837#24211
      OnClick = mniInStockClick
    end
    object mniOutStock: TMenuItem
      Caption = #20986#24211
    end
  end
end
