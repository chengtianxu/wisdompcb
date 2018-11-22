object frmCycle: TfrmCycle
  Left = 360
  Top = 291
  Width = 314
  Height = 357
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #26448#26009#31867#21035#21608#26399
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
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 298
    Height = 41
    Align = alTop
    TabOrder = 0
    object btnExit: TBitBtn
      Left = 2
      Top = 1
      Width = 65
      Height = 38
      Caption = #36864#20986
      ModalResult = 1
      TabOrder = 0
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        0400000000007800000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFF0FFFFFF
        FFFFFFFF00FFFFFFFFFFFFF030FFFFFFFFFFFF0330FFFFFFFFFF003330000000
        0FFFF03330FF0FFFFFFFF03300FF0FFFF4FFF03330FF0FFF44FFF03330FF0FF4
        4444F03330FF0F444444F03330FF0FF44444F0330FFF0FFF44FFF030FFFF0FFF
        F4FFF00FFFFF0FFFFFFFF00000000FFFFFFF}
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 41
    Width = 298
    Height = 278
    Align = alClient
    TabOrder = 1
    object ehCycle: TDBGridEh
      Left = 1
      Top = 1
      Width = 296
      Height = 276
      Align = alClient
      DataSource = DM.dsCycle
      FooterColor = clWindow
      FooterFont.Charset = ANSI_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -13
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      PopupMenu = pm1
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = 'GROUP_NAME'
          Footers = <>
          Width = 93
        end
        item
          EditButtons = <>
          FieldName = 'GROUP_DESC'
          Footers = <>
          Width = 106
        end
        item
          EditButtons = <>
          FieldName = 'strCycle'
          Footers = <>
          Width = 58
        end>
    end
  end
  object pm1: TPopupMenu
    Left = 144
    Top = 113
    object NAdd: TMenuItem
      Caption = #26032#22686
      OnClick = NAddClick
    end
    object NDel: TMenuItem
      Caption = #21024#38500
      OnClick = NDelClick
    end
  end
end
