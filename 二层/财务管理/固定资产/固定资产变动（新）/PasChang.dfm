object frmChang: TfrmChang
  Left = 542
  Top = 316
  Width = 326
  Height = 283
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #32534#36753#21407#20540
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 310
    Height = 193
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 40
      Top = 31
      Width = 65
      Height = 13
      Caption = #21407#24065#37329#39069#65306
    end
    object Label2: TLabel
      Left = 65
      Top = 71
      Width = 39
      Height = 13
      Caption = #24065#21035#65306
    end
    object Label3: TLabel
      Left = 65
      Top = 111
      Width = 39
      Height = 13
      Caption = #27719#29575#65306
    end
    object Label4: TLabel
      Left = 40
      Top = 151
      Width = 65
      Height = 13
      Caption = #26412#24065#37329#39069#65306
    end
    object DBEdit1: TDBEdit
      Left = 112
      Top = 27
      Width = 121
      Height = 21
      DataField = 'orig_curr_orig_value'
      DataSource = DM.DataSource8
      TabOrder = 0
      OnKeyPress = DBEdit1KeyPress
    end
    object DBEdit2: TDBEdit
      Left = 112
      Top = 111
      Width = 121
      Height = 21
      DataField = 'ex_rate'
      DataSource = DM.DataSource8
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 112
      Top = 151
      Width = 121
      Height = 21
      DataField = 'CURR_VALUE'
      DataSource = DM.DataSource8
      ReadOnly = True
      TabOrder = 2
    end
    object cbbtype: TComboBox
      Left = 112
      Top = 71
      Width = 121
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 3
      OnChange = cbbtypeChange
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 193
    Width = 310
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
