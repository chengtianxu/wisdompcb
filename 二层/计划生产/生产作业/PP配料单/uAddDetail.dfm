object frmAddDetail: TfrmAddDetail
  Left = 512
  Top = 234
  Width = 339
  Height = 395
  Caption = #25163#24037#26032#22686
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 56
    Top = 16
    Width = 48
    Height = 12
    Alignment = taRightJustify
    Caption = #20316#19994#21333#21495
    FocusControl = edt06
  end
  object Label2: TLabel
    Left = 56
    Top = 47
    Width = 48
    Height = 12
    Alignment = taRightJustify
    Caption = #26448#26009#32534#21495
    FocusControl = edt17
  end
  object Label3: TLabel
    Left = 14
    Top = 78
    Width = 90
    Height = 12
    Alignment = taRightJustify
    Caption = #29983#20135#25968#37327'(panel)'
    FocusControl = edtmanuf_qty
  end
  object Label4: TLabel
    Left = 44
    Top = 110
    Width = 60
    Height = 12
    Alignment = taRightJustify
    Caption = 'PP'#37197#39069#27604#20363
    FocusControl = edtpp_quota
  end
  object Label5: TLabel
    Left = 44
    Top = 141
    Width = 60
    Height = 12
    Alignment = taRightJustify
    Caption = 'PP'#37197#39069#24352#25968
    FocusControl = edtpanel_qty
  end
  object Label6: TLabel
    Left = 26
    Top = 173
    Width = 78
    Height = 12
    Alignment = taRightJustify
    Caption = 'panel'#38271#24230'(mm)'
    FocusControl = edtpanel_ln
  end
  object Label7: TLabel
    Left = 26
    Top = 204
    Width = 78
    Height = 12
    Alignment = taRightJustify
    Caption = 'panel'#23485#24230'(mm)'
    FocusControl = edtpanel_wd
  end
  object Label8: TLabel
    Left = 68
    Top = 236
    Width = 36
    Height = 12
    Alignment = taRightJustify
    Caption = 'PP'#22411#21495
    FocusControl = cbbPP_TYP
  end
  object Label9: TLabel
    Left = 56
    Top = 267
    Width = 48
    Height = 12
    Alignment = taRightJustify
    Caption = #26641#33026#21547#37327
    FocusControl = cbbpp_rc
  end
  object Label10: TLabel
    Left = 80
    Top = 299
    Width = 24
    Height = 12
    Alignment = taRightJustify
    Caption = 'TG'#20540
    FocusControl = cbbpp_tg
  end
  object SpeedButton1: TSpeedButton
    Left = 274
    Top = 10
    Width = 23
    Height = 22
    Glyph.Data = {
      EE000000424DEE000000000000007600000028000000100000000F0000000100
      04000000000078000000130B0000130B00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      888800000888880000080F000888880F00080F000888880F0008000000080000
      000800F000000F00000800F000800F00000800F000800F000008800000000000
      0088880F00080F000888880000080000088888800088800088888880F08880F0
      888888800088800088888888888888888888}
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 274
    Top = 41
    Width = 23
    Height = 22
    Glyph.Data = {
      EE000000424DEE000000000000007600000028000000100000000F0000000100
      04000000000078000000130B0000130B00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      888800000888880000080F000888880F00080F000888880F0008000000080000
      000800F000000F00000800F000800F00000800F000800F000008800000000000
      0088880F00080F000888880000080000088888800088800088888880F08880F0
      888888800088800088888888888888888888}
    OnClick = SpeedButton2Click
  end
  object edt06: TEdit
    Tag = 1
    Left = 110
    Top = 11
    Width = 160
    Height = 20
    Color = clScrollBar
    Enabled = False
    TabOrder = 0
  end
  object edt17: TEdit
    Tag = 1
    Left = 110
    Top = 42
    Width = 160
    Height = 20
    Color = clScrollBar
    Enabled = False
    TabOrder = 1
  end
  object edtmanuf_qty: TEdit
    Tag = 1
    Left = 110
    Top = 73
    Width = 160
    Height = 20
    TabOrder = 2
    OnChange = edtpp_quotaChange
    OnKeyPress = edtmanuf_qtyKeyPress
  end
  object edtpp_quota: TEdit
    Tag = 1
    Left = 110
    Top = 105
    Width = 160
    Height = 20
    TabOrder = 3
    OnChange = edtpp_quotaChange
    OnKeyPress = edtmanuf_qtyKeyPress
  end
  object edtpanel_qty: TEdit
    Tag = 1
    Left = 110
    Top = 136
    Width = 160
    Height = 20
    Color = clScrollBar
    Enabled = False
    TabOrder = 4
    OnKeyPress = edtmanuf_qtyKeyPress
  end
  object edtpanel_ln: TEdit
    Tag = 1
    Left = 110
    Top = 168
    Width = 160
    Height = 20
    Color = clScrollBar
    Enabled = False
    TabOrder = 5
    OnKeyPress = edtpanel_lnKeyPress
  end
  object edtpanel_wd: TEdit
    Tag = 1
    Left = 110
    Top = 199
    Width = 160
    Height = 20
    Color = clScrollBar
    Enabled = False
    TabOrder = 6
    OnKeyPress = edtpanel_lnKeyPress
  end
  object BitBtn1: TBitBtn
    Left = 56
    Top = 327
    Width = 75
    Height = 25
    Caption = #30830#23450
    Default = True
    TabOrder = 7
    OnClick = BitBtn1Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 181
    Top = 327
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 8
    Kind = bkCancel
  end
  object cbbPP_TYP: TComboBox
    Tag = 1
    Left = 110
    Top = 231
    Width = 177
    Height = 20
    ItemHeight = 12
    TabOrder = 9
    OnDropDown = cbbPP_TYPDropDown
  end
  object cbbpp_rc: TComboBox
    Tag = 1
    Left = 110
    Top = 262
    Width = 177
    Height = 20
    DropDownCount = 13
    ItemHeight = 12
    TabOrder = 10
    OnDropDown = cbbPP_TYPDropDown
  end
  object cbbpp_tg: TComboBox
    Tag = 1
    Left = 110
    Top = 294
    Width = 177
    Height = 20
    ItemHeight = 12
    TabOrder = 11
    OnDropDown = cbbPP_TYPDropDown
  end
end
