object Form9: TForm9
  Left = 362
  Top = 255
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #38468#21152#24037#20855#36153#29992
  ClientHeight = 328
  ClientWidth = 423
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StringGrid1: TStringGrid
    Left = 0
    Top = 0
    Width = 423
    Height = 281
    Align = alTop
    Ctl3D = False
    DefaultRowHeight = 20
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    ParentCtl3D = False
    ScrollBars = ssVertical
    TabOrder = 0
    ColWidths = (
      174
      91
      80
      72
      64)
    RowHeights = (
      20
      20)
  end
  object Button1: TButton
    Left = 169
    Top = 296
    Width = 75
    Height = 25
    Caption = #20851#38381
    ModalResult = 2
    TabOrder = 1
  end
end
