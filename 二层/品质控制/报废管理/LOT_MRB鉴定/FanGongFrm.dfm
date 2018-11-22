object frmFG1: TfrmFG1
  Left = 364
  Top = 218
  BorderStyle = bsSingle
  Caption = #36820#24037#30830#35748
  ClientHeight = 466
  ClientWidth = 714
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 714
    Height = 406
    Align = alClient
    TabOrder = 0
    object pnl3: TPanel
      Left = 419
      Top = 1
      Width = 294
      Height = 404
      Align = alRight
      TabOrder = 0
      object lbl2: TLabel
        Left = 1
        Top = 1
        Width = 292
        Height = 21
        Align = alTop
        Caption = #26032#36820#24037#27969#31243#21015#34920
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lvRStep: TListView
        Left = 1
        Top = 22
        Width = 292
        Height = 381
        Align = alClient
        Columns = <
          item
            Caption = #27493#39588#21495
          end
          item
            Caption = #24037#24207#20195#30721
            Width = 80
          end
          item
            Caption = #24037#24207#21517#31216
            Width = 100
          end
          item
            Caption = #21407#27493#39588
          end
          item
            Caption = #36807#25968
          end>
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
    object pnl4: TPanel
      Left = 1
      Top = 1
      Width = 288
      Height = 404
      Align = alLeft
      TabOrder = 1
      object lbl1: TLabel
        Left = 1
        Top = 1
        Width = 286
        Height = 21
        Align = alTop
        Caption = #21487#36873#24037#24207
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lvMIStep: TListView
        Left = 1
        Top = 22
        Width = 286
        Height = 381
        Align = alClient
        Columns = <
          item
            Caption = #27493#39588#21495
          end
          item
            Caption = #24037#24207#20195#30721
            Width = 80
          end
          item
            Caption = #24037#24207#21517#31216
            Width = 100
          end
          item
            Caption = #36807#25968
          end>
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
    object btnAddAll: TButton
      Left = 312
      Top = 256
      Width = 75
      Height = 25
      Caption = #20840#37096#28155#21152
      TabOrder = 2
      OnClick = btnAddAllClick
    end
    object btnDeleOne: TButton
      Left = 312
      Top = 170
      Width = 75
      Height = 25
      Caption = '<---'#21024#38500
      TabOrder = 3
      OnClick = btnDeleOneClick
    end
    object btnAddOne: TButton
      Left = 312
      Top = 96
      Width = 75
      Height = 25
      Caption = '--->'#28155#21152
      TabOrder = 4
      OnClick = btnAddOneClick
    end
    object btnDeleAll: TButton
      Left = 312
      Top = 336
      Width = 75
      Height = 25
      Caption = #20840#37096#21024#38500
      TabOrder = 5
      OnClick = btnDeleAllClick
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 406
    Width = 714
    Height = 60
    Align = alBottom
    TabOrder = 1
    object lblFGBZ: TLabel
      Left = 408
      Top = 8
      Width = 52
      Height = 13
      Caption = #36820#24037#22791#27880
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object btnOK: TButton
      Left = 305
      Top = 16
      Width = 75
      Height = 25
      Caption = #30830#23450#36820#24037
      TabOrder = 0
      OnClick = btnOKClick
    end
    object edtFGBZ: TEdit
      Left = 408
      Top = 24
      Width = 297
      Height = 21
      TabOrder = 1
      OnKeyPress = edtFGBZKeyPress
    end
  end
  object dsMISTep: TDataSource
    DataSet = qryMIStep
    Left = 25
    Top = 25
  end
  object qryMIStep: TADOQuery
    Parameters = <>
    Left = 65
    Top = 25
  end
end
