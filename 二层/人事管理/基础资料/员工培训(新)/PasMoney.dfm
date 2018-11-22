object frmMoney: TfrmMoney
  Left = 475
  Top = 348
  Width = 400
  Height = 297
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #23454#38469#25187#36153
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
    Left = 36
    Top = 46
    Width = 39
    Height = 13
    Caption = #25187#36153#65306
  end
  object Label2: TLabel
    Left = 12
    Top = 79
    Width = 65
    Height = 13
    Caption = #22521#35757#20869#23481#65306
  end
  object Label3: TLabel
    Left = 29
    Top = 2
    Width = 312
    Height = 26
    Caption = #27880#65306#22914#26524#23454#38469#25187#36153#19981#26159#25353#20844#24335#35745#31639#65288#21363#29305#25209#65289#21487#20197#26356#25913#13#10#37329#39069#65292#22521#35757#20869#23481#20013#21487#20197#22312#21407#26377#30340#22522#30784#19978#22686#21152#22791#27880
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 84
    Top = 41
    Width = 121
    Height = 21
    TabOrder = 0
    OnKeyPress = Edit1KeyPress
  end
  object btnComit: TBitBtn
    Left = 99
    Top = 216
    Width = 75
    Height = 31
    Caption = #30830#35748
    TabOrder = 1
    OnClick = btnComitClick
  end
  object btnCanCle: TBitBtn
    Left = 219
    Top = 216
    Width = 75
    Height = 31
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 2
  end
  object Memo1: TMemo
    Left = 84
    Top = 79
    Width = 249
    Height = 129
    ScrollBars = ssVertical
    TabOrder = 3
  end
end
