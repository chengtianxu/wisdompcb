object FrmTrain: TFrmTrain
  Left = 358
  Top = 255
  Width = 568
  Height = 344
  Caption = 'FrmTrain'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 41
    Width = 560
    Height = 269
    Align = alClient
    DataSource = DM.dsTrain
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGridEh1DblClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'item'
        Footers = <>
        Title.Caption = #22521#35757#31867#22411
      end
      item
        EditButtons = <>
        FieldName = 'Train_No'
        Footers = <>
        Title.Caption = #22521#35757#32534#21495
        Width = 140
      end
      item
        EditButtons = <>
        FieldName = 'Train_topics'
        Footers = <>
        Title.Caption = #22521#35757#20027#39064
        Width = 294
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 560
    Height = 41
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 25
      Top = 16
      Width = 39
      Height = 13
      Caption = #24037#21495#65306
      Color = cl3DLight
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label2: TLabel
      Left = 161
      Top = 16
      Width = 39
      Height = 13
      Caption = #22995#21517#65306
      Color = cl3DLight
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label3: TLabel
      Left = 305
      Top = 16
      Width = 39
      Height = 13
      Caption = #37096#38376#65306
      Color = cl3DLight
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object lblEmpCode: TLabel
      Left = 57
      Top = 16
      Width = 70
      Height = 13
      Caption = 'lblEmpCode'
      Color = cl3DLight
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object lblEmpName: TLabel
      Left = 193
      Top = 16
      Width = 70
      Height = 13
      Caption = 'lblEmpName'
      Color = cl3DLight
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object lblDepartment: TLabel
      Left = 337
      Top = 16
      Width = 91
      Height = 13
      Caption = 'lblDepartment'
      Color = cl3DLight
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
  end
end
