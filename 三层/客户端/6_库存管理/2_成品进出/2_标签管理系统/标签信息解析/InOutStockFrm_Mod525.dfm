inherited frmInOutStock_Mod525: TfrmInOutStock_Mod525
  Caption = #26631#31665#20986#20837#24211#23384#25805#20316
  ClientHeight = 634
  ClientWidth = 851
  ExplicitWidth = 867
  ExplicitHeight = 673
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 851
    Height = 634
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 1031
    ExplicitHeight = 634
    inherited pnl1: TPanel
      Width = 849
      Visible = False
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 1029
      object lbl5: TLabel [0]
        Left = 303
        Top = 8
        Width = 68
        Height = 16
        Caption = #25104#21151#25968#65306
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblSuccNum: TLabel [1]
        Left = 368
        Top = 8
        Width = 57
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl6: TLabel [2]
        Left = 431
        Top = 8
        Width = 9
        Height = 16
        Caption = '/'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblAllNum: TLabel [3]
        Left = 446
        Top = 8
        Width = 67
        Height = 16
        AutoSize = False
        Caption = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    inherited pnl2: TPanel
      Width = 849
      Height = 599
      ExplicitLeft = 1
      ExplicitTop = 34
      ExplicitWidth = 1029
      ExplicitHeight = 599
      object pnl3: TPanel
        Left = 1
        Top = 352
        Width = 847
        Height = 246
        Align = alBottom
        TabOrder = 0
        ExplicitWidth = 1027
        object lbl2: TLabel
          Left = 55
          Top = 17
          Width = 85
          Height = 16
          Caption = #20837#24211#20301#32622#65306
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl3: TLabel
          Left = 502
          Top = 19
          Width = 102
          Height = 16
          Caption = #26631#31614#25171#21360#22320#65306
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl4: TLabel
          Left = 55
          Top = 51
          Width = 85
          Height = 16
          Caption = #22791#27880#20449#24687#65306
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl7: TLabel
          Left = 511
          Top = 56
          Width = 85
          Height = 16
          Caption = #38169#35823#21015#34920#65306
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnPost: TButton
          Left = 367
          Top = 170
          Width = 105
          Height = 57
          Caption = #20986#24211
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = btnPostClick
        end
        object edtPlace: TEdit
          Left = 140
          Top = 15
          Width = 213
          Height = 21
          TabOrder = 1
        end
        object mmoBaknote: TMemo
          Left = 140
          Top = 50
          Width = 357
          Height = 95
          TabOrder = 2
        end
        object cbx1: TComboBox
          Left = 608
          Top = 17
          Width = 161
          Height = 21
          Style = csDropDownList
          TabOrder = 3
          Items.Strings = (
            #28145#22323#20116#26666
            #19996#33694#20116#26666
            #26757#24030#24535#28009
            #39321#28207#20116#26666)
        end
        object mmoError: TMemo
          Left = 600
          Top = 50
          Width = 185
          Height = 89
          TabOrder = 4
        end
      end
      object pnl4: TPanel
        Left = 1
        Top = 1
        Width = 847
        Height = 351
        Align = alClient
        TabOrder = 1
        ExplicitWidth = 1027
        object lbl1: TLabel
          Left = 1
          Top = 1
          Width = 68
          Height = 16
          Align = alTop
          Alignment = taCenter
          Caption = #26631#31665#21015#34920
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
        end
        object eh1: TDBGridEh
          Left = 1
          Top = 17
          Width = 845
          Height = 333
          Align = alClient
          DataSource = dsDispaly
          DynProps = <>
          ReadOnly = True
          TabOrder = 0
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
  end
  object cdsDispaly: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 528
    Top = 184
  end
  object dsDispaly: TDataSource
    DataSet = cdsDispaly
    Left = 592
    Top = 184
  end
  object cdsPostMain: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 528
    Top = 264
  end
  object cdsPostDetail: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 528
    Top = 320
  end
end
