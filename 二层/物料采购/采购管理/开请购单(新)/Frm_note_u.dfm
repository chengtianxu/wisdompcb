object Frm_note: TFrm_note
  Left = 316
  Top = 228
  BorderStyle = bsDialog
  Caption = #35760#20107#26412
  ClientHeight = 196
  ClientWidth = 352
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBMemo1: TDBMemo
    Left = 0
    Top = 0
    Width = 352
    Height = 137
    Align = alTop
    DataField = 'note_pad_line_1'
    DataSource = DS11
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 96
    Top = 160
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 208
    Top = 160
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 2
    Kind = bkCancel
  end
  object DS11: TDataSource
    DataSet = DM.ADO11
    Left = 48
    Top = 88
  end
end
