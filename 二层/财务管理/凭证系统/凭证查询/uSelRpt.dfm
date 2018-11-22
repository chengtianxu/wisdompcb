object SelRpt: TSelRpt
  Left = 270
  Top = 281
  Width = 385
  Height = 159
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #25253#34920#36830#32493#25171#21360
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    377
    132)
  PixelsPerInch = 96
  TextHeight = 13
  object Button5: TButton
    Left = 290
    Top = 20
    Width = 75
    Height = 25
    Caption = #25171#21360
    TabOrder = 0
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 290
    Top = 60
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 1
    OnClick = Button6Click
  end
  object GroupBox1: TGroupBox
    Left = 1
    Top = 16
    Width = 240
    Height = 88
    Anchors = [akLeft, akBottom]
    Caption = #25171#21360#33539#22260
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 36
      Height = 13
      Caption = #24320#22987#65306
    end
    object Label2: TLabel
      Left = 8
      Top = 56
      Width = 36
      Height = 13
      Caption = #32467#26463#65306
    end
    object Edit1: TEdit
      Left = 48
      Top = 24
      Width = 177
      Height = 21
      TabOrder = 0
      Text = 'Edit1'
    end
    object Edit2: TEdit
      Left = 48
      Top = 56
      Width = 177
      Height = 21
      TabOrder = 1
      Text = 'Edit1'
    end
  end
end
