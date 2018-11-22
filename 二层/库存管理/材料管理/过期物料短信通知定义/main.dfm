object Frm_0552: TFrm_0552
  Left = 306
  Top = 148
  BorderIcons = [biSystemMenu, biMinimize, biHelp]
  BorderStyle = bsSingle
  Caption = #36807#26399#29289#26009#30701#20449#36890#30693#23450#20041
  ClientHeight = 627
  ClientWidth = 753
  Color = clHighlightText
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 176
    Top = 614
    Width = 156
    Height = 13
    Caption = #25552#31034#65306#21491#38190#23545#25968#25454#36827#34892#25805#20316
    Color = clHighlightText
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label2: TLabel
    Left = 245
    Top = 4
    Width = 78
    Height = 13
    Caption = #26448#26009#31867#21035#20195#30721
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 22
    Width = 737
    Height = 587
    Color = clHighlightText
    DataSource = DM.DataSource1
    FooterColor = clWindow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ShowHint = True
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGridEh1KeyDown
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        Color = clAqua
        EditButtons = <>
        FieldName = 'GROUP_NAME'
        Footers = <>
        Title.Caption = #26448#26009#31867#21035#20195#30721
        Title.Color = clRed
        Width = 93
      end
      item
        Color = clAqua
        EditButtons = <>
        FieldName = 'GROUP_DESC'
        Footers = <>
        Title.Caption = #26448#26009#31867#21035#25551#36848
        Width = 183
      end
      item
        Color = clSkyBlue
        EditButtons = <>
        FieldName = 'USER_LOGIN_NAME'
        Footers = <>
        Title.Caption = #29992#25143#20195#30721
        Width = 139
      end
      item
        Color = clSkyBlue
        EditButtons = <>
        FieldName = 'USER_FULL_NAME'
        Footers = <>
        Title.Caption = #29992#25143#22995#21517
        Width = 84
      end
      item
        Color = clInactiveCaption
        EditButtons = <>
        FieldName = 'PHONE'
        Footers = <>
        Title.Caption = #32852#31995#30005#35805
        Width = 89
      end
      item
        EditButtons = <>
        FieldName = 'DEPT_NAME'
        Footers = <>
        Width = 82
      end
      item
        EditButtons = <>
        FieldName = 'FLAG'
        Footers = <>
        Width = 30
      end>
  end
  object Edit1: TEdit
    Left = 328
    Top = 0
    Width = 121
    Height = 21
    TabOrder = 1
    OnChange = Edit1Change
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 520
    Top = 136
    object N1: TMenuItem
      Caption = #26032#22686
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #20462#25913
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #21024#38500
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N5: TMenuItem
      Caption = #36864#20986
      OnClick = N5Click
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 520
    Top = 176
  end
end
