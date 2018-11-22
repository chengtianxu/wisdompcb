object Frm_authInfo: TFrm_authInfo
  Left = 248
  Top = 205
  BorderStyle = bsDialog
  Caption = #23457#26680#20449#24687
  ClientHeight = 269
  ClientWidth = 448
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 478
    Height = 225
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'USER_ID'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #23457#26680#21592#20195#30721
        Width = 79
      end
      item
        EditButtons = <>
        FieldName = 'USER_FULL_NAME'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #23457#26680#21592#21517#31216
        Width = 77
      end
      item
        EditButtons = <>
        FieldName = 'auth_flag'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #23457#26680#26631#24535
        Width = 61
      end
      item
        EditButtons = <>
        FieldName = 'auth_date'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #23457#26680#26085#26399
        Width = 118
      end
      item
        EditButtons = <>
        FieldName = 'ranking'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #23457#26680#39034#24207
      end>
  end
  object Button1: TButton
    Left = 184
    Top = 232
    Width = 75
    Height = 25
    Caption = #20851#38381
    TabOrder = 1
    OnClick = Button1Click
  end
  object DataSource1: TDataSource
    Left = 320
    Top = 104
  end
end
