object frmbusinessprocess: Tfrmbusinessprocess
  Left = 409
  Top = 216
  BorderStyle = bsDialog
  Caption = #23457#26680#27969#31243#23450#20041
  ClientHeight = 522
  ClientWidth = 855
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 855
    Height = 41
    Align = alTop
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = -1
      Top = 8
      Width = 57
      Height = 33
      Caption = #26032#22686
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Tag = 1
      Left = 58
      Top = 8
      Width = 57
      Height = 33
      Caption = #32534#36753
      TabOrder = 1
      OnClick = BitBtn1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 855
    Height = 481
    Align = alClient
    TabOrder = 1
    object DBGridEh2: TDBGridEh
      Left = 1
      Top = 1
      Width = 654
      Height = 479
      Align = alClient
      DataSource = dm.DataSource2
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      PopupMenu = PopupMenu1
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGridEh2DrawColumnCell
      OnKeyDown = DBGridEh2KeyDown
      OnMouseDown = DBGridEh2MouseDown
      Columns = <
        item
          EditButtons = <>
          FieldName = 'rkey'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'type_code'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #23457#25209#20195#30721
          Width = 71
        end
        item
          EditButtons = <>
          FieldName = 'name'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #23457#25209#27969#31243#21517#31216
          Width = 239
        end
        item
          EditButtons = <>
          FieldName = #23457#26680#27969#31243
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'remark'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #22791#27880
          Width = 180
        end
        item
          EditButtons = <>
          FieldName = 'Type'
          Footers = <>
          Visible = False
        end>
    end
    object DBGridEh1: TDBGridEh
      Left = 655
      Top = 1
      Width = 199
      Height = 479
      Align = alRight
      DataSource = dm.DataSource3
      FooterColor = clWindow
      FooterFont.Charset = ANSI_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -13
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      PopupMenu = PopupMenu2
      TabOrder = 1
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnKeyDown = DBGridEh1KeyDown
      Columns = <
        item
          EditButtons = <>
          FieldName = 'd34_index'
          Footers = <>
          Title.Caption = #24207#21495
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'dept_name'
          Footers = <>
          Title.Caption = #37096#38376#21517#31216
          Width = 120
        end>
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 194
    Top = 150
    object N1: TMenuItem
      Caption = #21024#38500
      OnClick = N1Click
    end
  end
  object PopupMenu2: TPopupMenu
    OnPopup = PopupMenu2Popup
    Left = 575
    Top = 245
    object N4: TMenuItem
      Caption = #26032#22686
      OnClick = N4Click
    end
    object MenuItem1: TMenuItem
      Caption = #21024#38500
      OnClick = MenuItem1Click
    end
  end
  object ApplicationEvents1: TApplicationEvents
    OnMessage = ApplicationEvents1Message
    Left = 584
    Top = 304
  end
end
