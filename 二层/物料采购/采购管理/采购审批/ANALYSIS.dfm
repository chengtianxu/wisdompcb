object Form5: TForm5
  Left = 336
  Top = 296
  BorderIcons = []
  BorderStyle = bsDialog
  ClientHeight = 217
  ClientWidth = 456
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 93
    Top = 34
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #35831#36141#20154#21592':'
    Visible = False
  end
  object Label2: TLabel
    Left = 80
    Top = 59
    Width = 72
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #26448#26009#31867#21035':'
  end
  object Label3: TLabel
    Left = 80
    Top = 84
    Width = 72
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #20184#27454#22320#28857':'
  end
  object Label4: TLabel
    Left = 80
    Top = 109
    Width = 72
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #31080#25454#31181#31867':'
  end
  object Button1: TButton
    Left = 185
    Top = 176
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 0
  end
  object DBEdit1: TDBEdit
    Left = 160
    Top = 31
    Width = 210
    Height = 21
    Color = cl3DLight
    DataField = 'ANALYSIS_CODE_1'
    DataSource = DM.DataSource1
    ReadOnly = True
    TabOrder = 1
    Visible = False
  end
  object DBEdit2: TDBEdit
    Left = 160
    Top = 55
    Width = 210
    Height = 21
    Color = cl3DLight
    DataField = 'ANALYSIS_CODE_2'
    DataSource = DM.DataSource1
    ReadOnly = True
    TabOrder = 2
  end
  object DBEdit3: TDBEdit
    Left = 160
    Top = 79
    Width = 210
    Height = 21
    Color = cl3DLight
    DataField = 'ANALYSIS_CODE_3'
    DataSource = DM.DataSource1
    ReadOnly = True
    TabOrder = 3
  end
  object DBEdit4: TDBEdit
    Left = 160
    Top = 103
    Width = 210
    Height = 21
    Color = cl3DLight
    DataField = 'ANALYSIS_CODE_4'
    DataSource = DM.DataSource1
    ReadOnly = True
    TabOrder = 4
  end
end
