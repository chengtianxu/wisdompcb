object FrmImport: TFrmImport
  Left = 335
  Top = 160
  Width = 1088
  Height = 563
  Caption = #25209#37327#23548#20837
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 1072
    Height = 525
    Align = alClient
    TabOrder = 0
    object TPanel
      Left = 1
      Top = 1
      Width = 1070
      Height = 523
      Align = alClient
      TabOrder = 0
      object pnl2: TPanel
        Left = 1
        Top = 1
        Width = 1068
        Height = 40
        Align = alTop
        TabOrder = 0
        object lbl1: TLabel
          Left = 440
          Top = 8
          Width = 247
          Height = 13
          Caption = #26448#26009#32534#30721#21644#24037#24207#20195#30721#35831#20005#26684#25353#33521#25991#36887#21495#38548#24320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object btn_ExModel: TButton
          Left = 24
          Top = 8
          Width = 75
          Height = 25
          Caption = #27169#29256#23548#20986
          TabOrder = 0
          OnClick = btn_ExModelClick
        end
        object btn_exit: TButton
          Left = 208
          Top = 8
          Width = 75
          Height = 25
          Caption = #36864#20986
          TabOrder = 1
          OnClick = btn_exitClick
        end
        object btn_exportErr: TButton
          Left = 112
          Top = 8
          Width = 89
          Height = 25
          Caption = #38169#35823#25968#25454#23548#20986
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = btn_exportErrClick
        end
      end
      object pnl3: TPanel
        Left = 1
        Top = 41
        Width = 1068
        Height = 448
        Align = alClient
        TabOrder = 1
        object sg1: TStringGrid
          Left = 1
          Top = 1
          Width = 1066
          Height = 446
          Align = alClient
          ColCount = 12
          FixedCols = 0
          TabOrder = 0
          ColWidths = (
            64
            64
            64
            64
            64
            64
            64
            64
            64
            64
            64
            64)
          RowHeights = (
            24
            24
            24
            24
            24)
        end
      end
      object pnl4: TPanel
        Left = 1
        Top = 489
        Width = 1068
        Height = 33
        Align = alBottom
        TabOrder = 2
        DesignSize = (
          1068
          33)
        object btn_OpenFile: TButton
          Left = 16
          Top = 8
          Width = 68
          Height = 25
          Anchors = [akLeft, akBottom]
          Caption = #25171#24320#25991#20214
          TabOrder = 0
          OnClick = btn_OpenFileClick
        end
        object btn_check: TButton
          Left = 89
          Top = 8
          Width = 70
          Height = 25
          Anchors = [akLeft, akBottom]
          Caption = #26816#26597
          TabOrder = 1
          OnClick = btn_checkClick
        end
        object btn_import: TButton
          Left = 164
          Top = 6
          Width = 68
          Height = 25
          Anchors = [akLeft, akBottom]
          Caption = #23548#20837
          TabOrder = 2
          OnClick = btn_importClick
        end
      end
    end
  end
  object dlgOpen1: TOpenDialog
    Left = 777
    Top = 113
  end
end
