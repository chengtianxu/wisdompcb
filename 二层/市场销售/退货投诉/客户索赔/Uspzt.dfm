object Form1: TForm1
  Left = 380
  Top = 251
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #23457#25209#29366#24577
  ClientHeight = 331
  ClientWidth = 595
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 595
    Height = 13
    Align = alTop
    Caption = 
      '                                                                ' +
      '                                                                ' +
      '                              ---- '#21452#20987#26597#30475#22791#27880'----'
  end
  object DBGridEh4: TDBGridEh
    Left = 0
    Top = 13
    Width = 595
    Height = 318
    Align = alClient
    DataSource = DM.DSl599
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGridEh4DblClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'seq_no'
        Footers = <>
        Title.Caption = #39034#24207
        Width = 74
      end
      item
        EditButtons = <>
        FieldName = 'USER_FULL_NAME'
        Footers = <>
        Title.Caption = #23457#25209#20154
        Width = 114
      end
      item
        EditButtons = <>
        FieldName = 'auth_date'
        Footers = <>
        Title.Caption = #26102#38388
        Width = 97
      end
      item
        EditButtons = <>
        FieldName = 'PUTH_INFO'
        Footers = <>
        Title.Caption = #22791#27880
        Width = 101
      end
      item
        EditButtons = <>
        FieldName = 'status1'
        Footers = <>
        Title.Caption = #23457#26680#29366#24577
        Width = 81
      end
      item
        EditButtons = <>
        FieldName = 'v_ttype'
        Footers = <>
        Title.Caption = #23457#25209#20195#30721
        Width = 100
      end>
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 208
    Top = 128
    object N1: TMenuItem
      Caption = #26356#26032#23457#26680#20154#21592
      OnClick = N1Click
    end
  end
end
