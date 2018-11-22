object frmPuau: TfrmPuau
  Left = 239
  Top = 224
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #25253#20215#25480#26435
  ClientHeight = 347
  ClientWidth = 594
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 5
    Top = 101
    Width = 60
    Height = 13
    Alignment = taRightJustify
    Caption = #20195'   '#30721#65306
  end
  object Label2: TLabel
    Left = 5
    Top = 129
    Width = 60
    Height = 13
    Alignment = taRightJustify
    Caption = #25551'   '#36848#65306
  end
  object StringGrid1: TStringGrid
    Left = -1
    Top = 152
    Width = 594
    Height = 193
    DefaultRowHeight = 19
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
    PopupMenu = PopupMenu1
    ScrollBars = ssVertical
    TabOrder = 0
    ColWidths = (
      74
      244
      128
      140
      64)
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 594
    Height = 55
    ButtonHeight = 52
    ButtonWidth = 39
    Caption = 'ToolBar1'
    Color = clScrollBar
    EdgeBorders = [ebTop, ebBottom]
    Flat = True
    Images = frmMain.ImageList1
    ParentColor = False
    ShowCaptions = True
    TabOrder = 1
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Hint = #20445#23384
      Caption = #20445#23384
      ImageIndex = 5
      ParentShowHint = False
      ShowHint = False
      OnClick = BitBtn1Click
    end
    object ToolButton2: TToolButton
      Left = 39
      Top = 0
      Hint = #36864#20986
      Caption = #36864#20986
      ImageIndex = 2
      OnClick = BitBtn2Click
    end
  end
  object Edit1: TEdit
    Left = 76
    Top = 96
    Width = 70
    Height = 21
    TabOrder = 2
  end
  object Edit2: TEdit
    Left = 75
    Top = 125
    Width = 309
    Height = 21
    TabOrder = 3
  end
  object PopupMenu1: TPopupMenu
    Left = 416
    Top = 112
    object N1: TMenuItem
      Caption = #26032#24314
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #32534#36753
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #21024#38500
      OnClick = N3Click
    end
  end
end
