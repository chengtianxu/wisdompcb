object frmEditMat: TfrmEditMat
  Left = 216
  Top = 239
  Width = 272
  Height = 187
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #20462#25913#21407#26448#26009#23384#36135#26723#26696
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 39
    Top = 16
    Width = 26
    Height = 13
    Alignment = taRightJustify
    Caption = #25968#37327
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 13
    Top = 56
    Width = 52
    Height = 13
    Alignment = taRightJustify
    Caption = #25910#36135#26085#26399
    FocusControl = DBEdit2
  end
  object DBEdit1: TDBEdit
    Left = 72
    Top = 11
    Width = 65
    Height = 21
    DataField = 'quantity'
    DataSource = frmshowMat.DataSource1
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 72
    Top = 51
    Width = 174
    Height = 21
    DataField = 'recd_date'
    DataSource = frmshowMat.DataSource1
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 32
    Top = 120
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 2
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 160
    Top = 120
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 3
    Kind = bkCancel
  end
end
