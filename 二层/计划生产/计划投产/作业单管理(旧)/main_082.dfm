object frmMain_082: TfrmMain_082
  Left = 292
  Top = 115
  AutoScroll = False
  Caption = #20316#19994#21333#31649#29702#27169#22359'-'
  ClientHeight = 414
  ClientWidth = 688
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 688
    Height = 414
    Align = alClient
    Stretch = True
  end
  object Label1: TLabel
    Left = 248
    Top = 144
    Width = 160
    Height = 33
    Caption = #22825#22825#22909#24515#24773
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = #21326#25991#34892#26999
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object MainMenu1: TMainMenu
    AutoHotkeys = maManual
    Left = 264
    Top = 24
    object N1: TMenuItem
      Caption = #20316#19994#21333#25805#20316'(&F)'
      object N2: TMenuItem
        Caption = #29983#20135#21069#20998#37197
        OnClick = N2Click
      end
      object N9: TMenuItem
        Caption = #29983#20135#20013#20998#37197
        OnClick = N9Click
      end
      object N3: TMenuItem
        Caption = #20316#19994#21333#21457#25918
        OnClick = N3Click
      end
      object N4: TMenuItem
        Caption = #20316#19994#21333#31649#29702
        OnClick = N4Click
      end
    end
    object N5: TMenuItem
      Caption = #20316#19994#21333#21462#28040
      object N8: TMenuItem
        Tag = 1
        Caption = #21322#25104#21697#20998#37197#21462#28040
        OnClick = N7Click
      end
      object N7: TMenuItem
        Caption = #20316#19994#21333#21457#25918#21462#28040
        OnClick = N7Click
      end
    end
    object N6: TMenuItem
      Caption = #36864#20986'(&E)'
      OnClick = N6Click
    end
  end
end
