object frmYear: TfrmYear
  Left = 661
  Top = 278
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #24310#38271#21512#21516#26085#26399
  ClientHeight = 125
  ClientWidth = 267
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 44
    Width = 52
    Height = 13
    Alignment = taRightJustify
    Caption = #21512#21516#24310#38271
  end
  object Label2: TLabel
    Left = 203
    Top = 45
    Width = 13
    Height = 13
    Caption = #24180
  end
  object edtYear: TEdit
    Left = 90
    Top = 40
    Width = 103
    Height = 21
    TabOrder = 0
  end
  object btnCancel: TBitBtn
    Left = 144
    Top = 88
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 1
  end
  object btnConfirm: TBitBtn
    Left = 40
    Top = 88
    Width = 75
    Height = 25
    Caption = #30830#35748
    TabOrder = 2
    OnClick = btnConfirmClick
  end
end
