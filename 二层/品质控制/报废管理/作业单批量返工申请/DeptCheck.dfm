object Frm_DeptCheck: TFrm_DeptCheck
  Left = 382
  Top = 302
  BorderStyle = bsSingle
  Caption = #36820#24037#27969#31243#30830#23450
  ClientHeight = 441
  ClientWidth = 681
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
    Width = 681
    Height = 400
    Align = alClient
    TabOrder = 0
    object pnl3: TPanel
      Left = 386
      Top = 1
      Width = 294
      Height = 398
      Align = alRight
      TabOrder = 0
      object lbl2: TLabel
        Left = 1
        Top = 1
        Width = 292
        Height = 19
        Align = alTop
        Caption = #36820#24037#27969#31243#21015#34920
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lvRStep: TListView
        Left = 1
        Top = 20
        Width = 292
        Height = 377
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
      Height = 398
      Align = alLeft
      TabOrder = 1
      object lbl1: TLabel
        Left = 1
        Top = 1
        Width = 286
        Height = 19
        Align = alTop
        Caption = #36820#24037#24037#24207#36873#25321
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lvMIStep: TListView
        Left = 1
        Top = 20
        Width = 286
        Height = 377
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
      Left = 302
      Top = 256
      Width = 75
      Height = 25
      Caption = #20840#37096#28155#21152
      TabOrder = 2
      OnClick = btnAddAllClick
    end
    object btnDeleOne: TButton
      Left = 302
      Top = 170
      Width = 75
      Height = 25
      Caption = '<---'#21024#38500
      TabOrder = 3
      OnClick = btnDeleOneClick
    end
    object btnAddOne: TButton
      Left = 302
      Top = 96
      Width = 75
      Height = 25
      Caption = '--->'#28155#21152
      TabOrder = 4
      OnClick = btnAddOneClick
    end
    object btnDeleAll: TButton
      Left = 302
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
    Top = 400
    Width = 681
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnOK: TButton
      Left = 296
      Top = 8
      Width = 84
      Height = 27
      Caption = #30830#23450#36820#24037#27969#31243
      TabOrder = 0
      OnClick = btnOKClick
    end
  end
end
