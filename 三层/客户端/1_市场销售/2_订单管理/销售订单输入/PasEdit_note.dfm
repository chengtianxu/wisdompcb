inherited frmEdit_note: TfrmEdit_note
  Caption = #35760#20107#26412
  ClientHeight = 206
  ClientWidth = 632
  ExplicitWidth = 640
  ExplicitHeight = 233
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 168
    Width = 632
    Height = 38
    Align = alBottom
    TabOrder = 0
    object Button1: TButton
      Left = 242
      Top = 5
      Width = 65
      Height = 27
      Caption = #30830' '#23450
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 322
      Top = 5
      Width = 65
      Height = 27
      Caption = #21462' '#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 632
    Height = 168
    Align = alClient
    TabOrder = 1
    object Label9: TLabel
      Left = 10
      Top = 13
      Width = 119
      Height = 13
      Caption = ' '#20851#32852#25991#20214#21495'/'#26242#20572#21407#22240':'
    end
    object Edit1: TEdit
      Left = 133
      Top = 10
      Width = 482
      Height = 21
      MaxLength = 50
      TabOrder = 0
    end
    object Memo1: TMemo
      Left = 9
      Top = 36
      Width = 606
      Height = 117
      TabOrder = 1
    end
  end
end
