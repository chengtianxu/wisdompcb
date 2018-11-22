object FrmPath: TFrmPath
  Left = 590
  Top = 350
  Width = 309
  Height = 336
  Caption = #36873#25321#22791#20221#36335#24452
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 301
    Height = 297
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 25
      Top = 215
      Width = 65
      Height = 13
      Caption = #22791#20221#36335#24452#65306
    end
    object ShellTreeView1: TShellTreeView
      Left = 24
      Top = 16
      Width = 249
      Height = 185
      ObjectTypes = [otFolders]
      Root = 'rfMyComputer'
      UseShellImages = True
      AutoRefresh = False
      Indent = 19
      ParentColor = False
      RightClickSelect = True
      ShowRoot = False
      TabOrder = 0
      OnChange = ShellTreeView1Change
    end
    object Edit1: TEdit
      Left = 97
      Top = 211
      Width = 177
      Height = 21
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 24
      Top = 248
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 2
      OnClick = BitBtn1Click
      Kind = bkOK
    end
    object BitBtn2: TBitBtn
      Left = 160
      Top = 248
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 3
      Kind = bkCancel
    end
  end
end
