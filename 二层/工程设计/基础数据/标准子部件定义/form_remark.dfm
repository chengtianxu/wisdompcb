object remark: Tremark
  Left = 299
  Top = 168
  Width = 616
  Height = 317
  Caption = #21152#24037#25351#31034
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 608
    Height = 249
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label3: TLabel
      Left = 0
      Top = 8
      Width = 70
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #20869#23618#21517#31216#65306
    end
    object Label2: TLabel
      Left = 224
      Top = 8
      Width = 70
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #24037#24207#20195#30721#65306
    end
    object Label5: TLabel
      Left = 408
      Top = 8
      Width = 70
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #24037#24207#21517#31216#65306
    end
    object Label1: TLabel
      Left = 0
      Top = 52
      Width = 70
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #21152#24037#25351#31034#65306
    end
    object Label4: TLabel
      Left = 112
      Top = 50
      Width = 70
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #24403#21069#27493#39588#65306
    end
    object DBEdit1: TDBEdit
      Left = 180
      Top = 45
      Width = 52
      Height = 21
      Color = cl3DLight
      DataField = 'STEP_NUMBER'
      DataSource = dm.DataSource2
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 300
      Top = 4
      Width = 84
      Height = 21
      Color = cl3DLight
      DataField = 'DEPT_CODE'
      DataSource = dm.DataSource2
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 68
      Top = 4
      Width = 114
      Height = 21
      Color = cl3DLight
      DataField = 'part_name'
      DataSource = dm.DataSource1
      ReadOnly = True
      TabOrder = 2
    end
    object DBMemo1: TDBMemo
      Left = 0
      Top = 69
      Width = 608
      Height = 180
      Align = alBottom
      DataField = 'DEF_ROUT_INST'
      DataSource = dm.DataSource2
      ScrollBars = ssVertical
      TabOrder = 3
    end
    object DBNavigator1: TDBNavigator
      Left = 241
      Top = 43
      Width = 188
      Height = 25
      DataSource = dm.DataSource2
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 4
    end
    object DBEdit4: TDBEdit
      Left = 476
      Top = 4
      Width = 84
      Height = 21
      Color = cl3DLight
      DataField = 'DEPT_NAME'
      DataSource = dm.DataSource2
      ReadOnly = True
      TabOrder = 5
    end
  end
  object BitBtn1: TBitBtn
    Left = 265
    Top = 257
    Width = 75
    Height = 27
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 1
  end
end
