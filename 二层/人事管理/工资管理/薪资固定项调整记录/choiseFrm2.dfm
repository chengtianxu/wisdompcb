object frmchoise2: Tfrmchoise2
  Left = 458
  Top = 293
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #36873#25321#22120
  ClientHeight = 332
  ClientWidth = 393
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 2
    Top = 9
    Width = 26
    Height = 13
    Caption = #24037#21495
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 32
    Width = 393
    Height = 300
    Align = alBottom
    DataSource = DM.dschoiseEmp
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGridEh1DblClick
    OnKeyDown = DBGridEh1KeyDown
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'employeecode'
        Footers = <>
        Title.Caption = #24037#21495
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = 'chinesename'
        Footers = <>
        Title.Caption = #22995#21517
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = 'item'
        Footers = <>
        Title.Caption = #32844#21153
        Width = 136
      end
      item
        EditButtons = <>
        FieldName = 'train_flag'
        Footers = <>
        Title.Caption = #20851#32852#22521#35757
        Width = 65
      end>
  end
  object edt_1: TEdit
    Left = 32
    Top = 4
    Width = 121
    Height = 21
    TabOrder = 0
    OnChange = edt_1Change
  end
end
