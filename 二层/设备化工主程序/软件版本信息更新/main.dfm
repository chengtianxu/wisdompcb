object frmMain: TfrmMain
  Left = 298
  Top = 340
  Width = 461
  Height = 192
  Caption = #36719#20214#29256#26412#20449#24687#26356#26032
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 24
    Top = 8
    Width = 297
    Height = 113
    Caption = #36873#25321#26356#26032#30340#25968#25454#24211
    TabOrder = 0
    object Label1: TLabel
      Left = 53
      Top = 34
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = #26381#21153#22120
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 53
      Top = 64
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = #25968#25454#24211
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object ComboBox1: TRzComboBox
      Left = 112
      Top = 27
      Width = 145
      Height = 21
      Ctl3D = False
      FrameVisible = True
      ItemHeight = 13
      ParentCtl3D = False
      TabOnEnter = True
      TabOrder = 0
    end
    object ComboBox2: TRzComboBox
      Left = 112
      Top = 57
      Width = 145
      Height = 21
      Ctl3D = False
      FrameVisible = True
      ItemHeight = 13
      ParentCtl3D = False
      TabOnEnter = True
      TabOrder = 1
    end
  end
  object Button1: TButton
    Left = 352
    Top = 24
    Width = 75
    Height = 25
    Caption = #30830#23450'(&Y)'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 352
    Top = 64
    Width = 75
    Height = 25
    Caption = #36864#20986'(&C)'
    ModalResult = 2
    TabOrder = 2
    OnClick = Button2Click
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 146
    Width = 453
    Height = 19
    Panels = <
      item
        Text = #31561#24453#26356#26032
        Width = 60
      end
      item
        Width = 50
      end>
  end
  object ProgressBar1: TProgressBar
    Left = 72
    Top = 128
    Width = 361
    Height = 16
    Smooth = True
    TabOrder = 4
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Left = 304
    Top = 32
  end
end
