object Frm_PrgType: TFrm_PrgType
  Left = 301
  Top = 206
  BorderStyle = bsDialog
  Caption = #39033#30446#31867#21035#23450#20041
  ClientHeight = 207
  ClientWidth = 339
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 217
    Height = 207
    Align = alLeft
    DataSource = DataSource1
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    PopupMenu = PopupMenu1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'type_name'
        Footers = <>
        Title.Alignment = taCenter
        Width = 169
      end>
  end
  object BitBtn1: TBitBtn
    Left = 240
    Top = 96
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 1
    Kind = bkCancel
  end
  object BitBtn2: TBitBtn
    Left = 240
    Top = 152
    Width = 75
    Height = 25
    Caption = #20445#23384
    TabOrder = 2
    Kind = bkOK
  end
  object DataSource1: TDataSource
    DataSet = DM.ADO306
    Left = 40
    Top = 120
  end
  object PopupMenu1: TPopupMenu
    Left = 96
    Top = 121
    object N1: TMenuItem
      Caption = #26032#22686
      OnClick = N1Click
    end
    object N2: TMenuItem
      Tag = 1
      Caption = #20462#25913
      OnClick = N1Click
    end
    object N3: TMenuItem
      Tag = 2
      Caption = #21024#38500
      OnClick = N1Click
    end
  end
end
