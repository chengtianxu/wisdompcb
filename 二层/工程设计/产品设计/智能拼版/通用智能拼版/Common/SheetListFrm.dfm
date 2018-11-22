object frmSheetList: TfrmSheetList
  Left = 0
  Top = 0
  Caption = #22823#26009
  ClientHeight = 369
  ClientWidth = 359
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 359
    Height = 328
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 331
    object lbl1: TLabel
      Left = 1
      Top = 1
      Width = 357
      Height = 16
      Align = alTop
      Caption = '     '#38271'     X     '#23485'     '#22823#26009#35268#26684
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #40657#20307
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 291
    end
    object lvSheetList: TListView
      Left = 1
      Top = 17
      Width = 357
      Height = 310
      Align = alClient
      Checkboxes = True
      Color = clInfoBk
      Columns = <
        item
          Caption = #36873
          Width = 20
        end
        item
          Caption = #23485
          Width = 75
        end
        item
          Caption = 'X'
          Width = 35
        end
        item
          Caption = #39640
          Width = 75
        end
        item
          Caption = #22823#26009#35268#26684
          Width = 100
        end>
      Font.Charset = ANSI_CHARSET
      Font.Color = clDefault
      Font.Height = -16
      Font.Name = #23435#20307
      Font.Style = []
      GridLines = True
      RowSelect = True
      ParentFont = False
      PopupMenu = pm1
      ShowColumnHeaders = False
      TabOrder = 0
      ViewStyle = vsReport
      ExplicitWidth = 329
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 328
    Width = 359
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitWidth = 331
    object btnOK: TButton
      Left = 40
      Top = 5
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnCancel: TButton
      Left = 136
      Top = 5
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnAdd: TButton
      Left = 232
      Top = 5
      Width = 75
      Height = 25
      Caption = #28155#21152#23610#23544
      TabOrder = 2
      OnClick = mniN1Click
    end
  end
  object pm1: TPopupMenu
    Left = 144
    Top = 160
    object mniN1: TMenuItem
      Caption = #26032#22686#22823#26009
      OnClick = mniN1Click
    end
  end
end
