inherited frmBugetDel_Mod27: TfrmBugetDel_Mod27
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #39044#31639#32454#30446
  ClientHeight = 373
  ClientWidth = 525
  OnActivate = FormActivate
  ExplicitWidth = 531
  ExplicitHeight = 398
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 116
    Top = 10
    Width = 64
    Height = 13
    Alignment = taRightJustify
    Caption = '    '#39044#31639#20195#30721':'
  end
  object Edit1: TEdit
    Left = 188
    Top = 6
    Width = 161
    Height = 21
    Color = cl3DLight
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    ReadOnly = True
    TabOrder = 0
  end
  object editor1: TStringGrid
    Left = 0
    Top = 33
    Width = 517
    Height = 302
    Color = cl3DLight
    ColCount = 4
    DefaultRowHeight = 19
    FixedCols = 0
    RowCount = 14
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
    TabOrder = 1
    ColWidths = (
      85
      163
      149
      107)
  end
  object Button1: TButton
    Left = 222
    Top = 341
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 2
  end
end
