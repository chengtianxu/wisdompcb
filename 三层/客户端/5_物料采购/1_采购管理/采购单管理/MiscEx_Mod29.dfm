inherited frmMiscEx_Mod29: TfrmMiscEx_Mod29
  Left = 377
  Top = 278
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #26434#39033#36153#29992
  ClientHeight = 328
  ClientWidth = 534
  ExplicitLeft = 377
  ExplicitTop = 278
  PixelsPerInch = 96
  TextHeight = 13
  object sgM: TRzStringGrid
    Left = 0
    Top = 0
    Width = 534
    Height = 257
    Align = alTop
    DoubleBuffered = True
    FixedCols = 3
    RowCount = 2
    ParentDoubleBuffered = False
    TabOrder = 0
    OnExit = sgMExit
    OnKeyPress = sgMKeyPress
    OnSelectCell = sgMSelectCell
    ColWidths = (
      59
      253
      86
      99
      3)
  end
  object btnS: TBitBtn
    Left = 152
    Top = 280
    Width = 89
    Height = 33
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 1
  end
  object btnC: TBitBtn
    Left = 304
    Top = 280
    Width = 89
    Height = 33
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 2
  end
end
