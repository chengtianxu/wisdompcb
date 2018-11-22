inherited FrmBug_Mod36: TFrmBug_Mod36
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #32570#38519#35814#32454#24773#20917
  ClientHeight = 248
  ClientWidth = 337
  Font.Height = -13
  Font.Name = #23435#20307
  Position = poScreenCenter
  ExplicitWidth = 343
  ExplicitHeight = 280
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl1: TPanel
    Width = 337
    TabOrder = 1
    ExplicitWidth = 337
    inherited btnSave: TBitBtn
      OnClick = btnSaveClick
    end
    inherited btnSaveAll: TBitBtn
      ExplicitLeft = 91
      ExplicitHeight = 28
    end
    inherited btnCheck: TBitBtn
      ExplicitLeft = 121
      ExplicitHeight = 28
    end
    inherited btnPrint: TBitBtn
      ExplicitLeft = 61
      ExplicitHeight = 28
    end
    inherited btnClose: TBitBtn
      OnClick = btnCloseClick
      ExplicitLeft = 31
      ExplicitHeight = 28
    end
  end
  inherited pnl2: TPanel
    Width = 337
    Height = 218
    TabOrder = 0
    ExplicitTop = 30
    ExplicitWidth = 337
    ExplicitHeight = 218
    object Label2: TLabel
      Left = 106
      Top = 64
      Width = 33
      Height = 13
      Caption = #25968#37327':'
    end
    object Label1: TLabel
      Left = 80
      Top = 32
      Width = 59
      Height = 13
      Caption = #32570#38519#32534#21495':'
    end
    object RadioGroup1: TRadioGroup
      Left = 74
      Top = 93
      Width = 185
      Height = 46
      Caption = #22788#29702#26041#24335
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #25253#24223
        #36864#36135)
      TabOrder = 0
    end
    object Edit1: TEdit
      Left = 138
      Top = 56
      Width = 121
      Height = 21
      TabOrder = 1
      Text = '0'
      OnKeyPress = Edit1KeyPress
    end
    object RzButtonEdit1: TRzButtonEdit
      Left = 138
      Top = 29
      Width = 121
      Height = 21
      Text = ''
      TabOrder = 2
      OnKeyPress = RzButtonEdit1KeyPress
      ButtonKind = bkFind
      AltBtnWidth = 15
      ButtonWidth = 15
      OnButtonClick = RzButtonEdit1ButtonClick
    end
  end
end
