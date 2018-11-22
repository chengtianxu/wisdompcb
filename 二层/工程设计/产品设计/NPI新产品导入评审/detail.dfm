object Frm_authinfo: TFrm_authinfo
  Left = 358
  Top = 292
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #23457#25209#26126#32454
  ClientHeight = 282
  ClientWidth = 545
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
    Width = 545
    Height = 282
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 0
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 543
      Height = 280
      Align = alClient
      DataSource = DM.DataSource2
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = 'DEPT_NAME'
          Footers = <>
          Title.Caption = #35780#23457#37096#38376
          Width = 98
        end
        item
          EditButtons = <>
          FieldName = 'EMPLOYEE_NAME'
          Footers = <>
          Title.Caption = #35780#23457#20154#21592
        end
        item
          EditButtons = <>
          FieldName = 'auth_date'
          Footers = <>
          Title.Caption = #35780#23457#26102#38388
        end
        item
          EditButtons = <>
          FieldName = 'PUTH_INFO'
          Footers = <>
          Title.Caption = #35780#23457#22791#27880
          Width = 93
        end
        item
          EditButtons = <>
          FieldName = 'auth_flag1'
          Footers = <>
          Title.Caption = #35780#23457#29366#24577
          Width = 70
        end>
    end
  end
end
