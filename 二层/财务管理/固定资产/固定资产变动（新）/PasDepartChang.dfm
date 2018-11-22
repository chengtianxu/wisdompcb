object frmDepartChang: TfrmDepartChang
  Left = 601
  Top = 302
  Width = 327
  Height = 283
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #32534#36753#37096#38376
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 311
    Height = 193
    Align = alClient
    TabOrder = 0
    object Label5: TLabel
      Left = 32
      Top = 25
      Width = 60
      Height = 13
      Caption = #37096#38376#20195#30721#65306
    end
    object Label6: TLabel
      Left = 32
      Top = 57
      Width = 60
      Height = 13
      Caption = #37096#38376#21517#31216#65306
    end
    object Label7: TLabel
      Left = 45
      Top = 89
      Width = 48
      Height = 13
      Caption = #30334#20998#27604#65306
    end
    object Label8: TLabel
      Left = 32
      Top = 121
      Width = 60
      Height = 13
      Caption = #25240#26087#31185#30446#65306
    end
    object Label9: TLabel
      Left = 32
      Top = 153
      Width = 60
      Height = 13
      Caption = #31185#30446#21517#31216#65306
    end
    object DBEdit4: TDBEdit
      Left = 104
      Top = 19
      Width = 121
      Height = 21
      DataField = 'DEPT_CODE'
      DataSource = DM.DataSource8
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit5: TDBEdit
      Left = 104
      Top = 53
      Width = 121
      Height = 21
      DataField = 'DEPT_NAME'
      DataSource = DM.DataSource8
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit6: TDBEdit
      Left = 104
      Top = 86
      Width = 121
      Height = 21
      DataField = 'PERCENTS'
      DataSource = DM.DataSource8
      TabOrder = 2
      OnExit = DBEdit6Exit
      OnKeyPress = DBEdit6KeyPress
    end
    object DBEdit7: TDBEdit
      Left = 104
      Top = 119
      Width = 121
      Height = 21
      DataField = 'GL_ACC_NUMBER'
      DataSource = DM.DataSource8
      ReadOnly = True
      TabOrder = 3
    end
    object DBEdit8: TDBEdit
      Left = 104
      Top = 153
      Width = 121
      Height = 21
      DataField = 'GL_DESCRIPTION'
      DataSource = DM.DataSource8
      ReadOnly = True
      TabOrder = 4
    end
    object btnDepart: TBitBtn
      Left = 232
      Top = 17
      Width = 33
      Height = 25
      TabOrder = 5
      OnClick = btnDepartClick
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
    object btNumber: TBitBtn
      Left = 232
      Top = 115
      Width = 33
      Height = 25
      TabOrder = 6
      OnClick = btNumberClick
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
  object Panel3: TPanel
    Left = 0
    Top = 193
    Width = 311
    Height = 52
    Align = alBottom
    TabOrder = 1
    object BitBtn2: TBitBtn
      Left = 174
      Top = 11
      Width = 75
      Height = 29
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 78
      Top = 11
      Width = 75
      Height = 29
      Caption = #30830#23450
      TabOrder = 1
      OnClick = BitBtn1Click
    end
  end
end
