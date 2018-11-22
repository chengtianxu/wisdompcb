object frmQRep: TfrmQRep
  Left = 492
  Top = 249
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #27719#24635#25253#34920
  ClientHeight = 382
  ClientWidth = 560
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
  object lbl3: TLabel
    Left = 21
    Top = 298
    Width = 507
    Height = 13
    Caption = #27880#65306#20197#19978#20379#24212#21830#19982#26448#26009#32534#30721#20026#21487#36873#39033#65292#21363#21487#26681#25454#38656#35201#22635#20889#12290#22914#35201#21462#28040#36873#25321#65292#35831#21452#20987#25991#26412#26694
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object btnOk: TBitBtn
    Left = 170
    Top = 341
    Width = 75
    Height = 30
    Caption = #30830#23450
    TabOrder = 0
    OnClick = btnOkClick
  end
  object btnCancel: TBitBtn
    Left = 315
    Top = 342
    Width = 75
    Height = 30
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 1
  end
  object grpDate: TGroupBox
    Left = 24
    Top = 24
    Width = 505
    Height = 49
    Caption = #26085#26399#33539#22260
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 19
      Width = 78
      Height = 13
      Caption = #27719#24635#26085#26399#20174#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 264
      Top = 19
      Width = 26
      Height = 13
      Caption = #33267#65306
    end
    object dtpStart: TDateTimePicker
      Left = 120
      Top = 16
      Width = 105
      Height = 21
      Date = 42634.000000000000000000
      Time = 42634.000000000000000000
      TabOrder = 0
    end
    object dtpEnd: TDateTimePicker
      Left = 320
      Top = 16
      Width = 105
      Height = 21
      Date = 42634.000000000000000000
      Time = 42634.000000000000000000
      TabOrder = 1
    end
  end
  object GroupBox1: TGroupBox
    Left = 24
    Top = 186
    Width = 505
    Height = 52
    Caption = #20379#24212#21830
    TabOrder = 3
    object lbl1: TLabel
      Left = 25
      Top = 24
      Width = 52
      Height = 13
      Caption = #20379#24212#21830#65306
    end
    object lbl2: TLabel
      Left = 240
      Top = 24
      Width = 7
      Height = 13
    end
    object edtCode: TEdit
      Left = 80
      Top = 19
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 0
      OnDblClick = edtCodeDblClick
      OnExit = edtCodeExit
    end
    object btn1: TBitBtn
      Left = 206
      Top = 17
      Width = 33
      Height = 25
      TabOrder = 1
      OnClick = btn1Click
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        04000000000078000000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888800000888880000080F000888880F00080F000888880F0008000000080000
        000800F000000F00000800F000800F00000800F000800F000008800000000000
        0088880F00080F000888880000080000088888800088800088888880F08880F0
        888888800088800088888888888888888888}
    end
  end
  object GroupBox2: TGroupBox
    Left = 24
    Top = 240
    Width = 505
    Height = 52
    Caption = #26448#26009#32534#30721
    TabOrder = 4
    object Label3: TLabel
      Left = 10
      Top = 23
      Width = 65
      Height = 13
      Caption = #26448#26009#32534#30721#65306
    end
    object Label4: TLabel
      Left = 240
      Top = 24
      Width = 7
      Height = 13
    end
    object edtINVT: TEdit
      Left = 80
      Top = 19
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 0
      OnDblClick = Edit1DblClick
      OnExit = edtINVTExit
    end
    object BitBtn1: TBitBtn
      Left = 207
      Top = 16
      Width = 33
      Height = 25
      TabOrder = 1
      OnClick = BitBtn1Click
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        04000000000078000000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888800000888880000080F000888880F00080F000888880F0008000000080000
        000800F000000F00000800F000800F00000800F000800F000008800000000000
        0088880F00080F000888880000080000088888800088800088888880F08880F0
        888888800088800088888888888888888888}
    end
  end
  object rg1: TRadioGroup
    Left = 24
    Top = 80
    Width = 505
    Height = 49
    Caption = #27719#24635#27169#24335
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #25353#36873#25321#26085#26399
      #25353#26376)
    TabOrder = 5
  end
  object GroupBox3: TGroupBox
    Left = 24
    Top = 136
    Width = 505
    Height = 49
    Caption = #26448#26009#31867#21035
    TabOrder = 6
    object Label5: TLabel
      Left = 12
      Top = 22
      Width = 65
      Height = 13
      Caption = #26448#26009#31867#21035#65306
    end
    object Edit1: TEdit
      Left = 80
      Top = 18
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 0
      OnDblClick = Edit1DblClick
    end
    object BitBtn2: TBitBtn
      Left = 208
      Top = 16
      Width = 30
      Height = 25
      TabOrder = 1
      OnClick = BitBtn2Click
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        04000000000078000000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888800000888880000080F000888880F00080F000888880F0008000000080000
        000800F000000F00000800F000800F00000800F000800F000008800000000000
        0088880F00080F000888880000080000088888800088800088888880F08880F0
        888888800088800088888888888888888888}
    end
  end
end
