object Frm_GXCL: TFrm_GXCL
  Left = 279
  Top = 195
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #24037#24207#27979#37327#32467#26524#36755#20837
  ClientHeight = 374
  ClientWidth = 444
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 115
    Width = 444
    Height = 226
    Align = alTop
    DataSource = DM.DS3
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'bach_num'
        Footers = <>
        Width = 61
      end
      item
        EditButtons = <>
        FieldName = 'se_num'
        Footers = <>
        Width = 31
      end
      item
        EditButtons = <>
        FieldName = 'au_umply'
        Footers = <>
        Width = 62
      end
      item
        EditButtons = <>
        FieldName = 'measure_empl'
        Footers = <>
        Width = 86
      end
      item
        EditButtons = <>
        FieldName = 'measure_date'
        Footers = <>
        Width = 142
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 444
    Height = 115
    Align = alTop
    TabOrder = 0
    object Label2: TLabel
      Left = 8
      Top = 55
      Width = 52
      Height = 13
      Caption = #27979#37327#25209#27425
      FocusControl = DBEdit1
    end
    object Label3: TLabel
      Left = 32
      Top = 83
      Width = 26
      Height = 13
      Caption = #24207#21495
      FocusControl = DBEdit2
    end
    object Label4: TLabel
      Left = 303
      Top = 87
      Width = 54
      Height = 13
      Caption = #37329#21402'(um)'
      FocusControl = DBEdit3
    end
    object Label5: TLabel
      Left = 128
      Top = 87
      Width = 52
      Height = 13
      Caption = #27979#37327#26085#26399
    end
    object Label6: TLabel
      Left = 160
      Top = 55
      Width = 52
      Height = 13
      Caption = #27979#37327#20154#21592
      FocusControl = DBEdit4
    end
    object Label8: TLabel
      Left = 9
      Top = 15
      Width = 52
      Height = 13
      Caption = #26412#21378#32534#21495
    end
    object Shape1: TShape
      Left = 8
      Top = 45
      Width = 428
      Height = 1
    end
    object DBEdit1: TDBEdit
      Left = 61
      Top = 52
      Width = 52
      Height = 21
      DataField = 'bach_num'
      DataSource = DM.DS3
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 61
      Top = 80
      Width = 52
      Height = 21
      DataField = 'se_num'
      DataSource = DM.DS3
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 359
      Top = 85
      Width = 77
      Height = 21
      DataField = 'au_umply'
      DataSource = DM.DS3
      TabOrder = 4
      OnKeyDown = DBEdit3KeyDown
      OnKeyPress = DBEdit3KeyPress
    end
    object DBDateTimeEditEh1: TDBDateTimeEditEh
      Left = 184
      Top = 83
      Width = 113
      Height = 21
      DataField = 'measure_date'
      DataSource = DM.DS3
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 3
      Visible = True
    end
    object DBEdit4: TDBEdit
      Left = 216
      Top = 51
      Width = 78
      Height = 21
      DataField = 'measure_empl'
      DataSource = DM.DS3
      TabOrder = 2
    end
    object Edit3: TEdit
      Left = 65
      Top = 11
      Width = 137
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 5
    end
    object CheckBox1: TCheckBox
      Left = 360
      Top = 55
      Width = 73
      Height = 17
      Caption = #36830#32493#36755#20837
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 6
    end
  end
  object Button1: TButton
    Left = 168
    Top = 347
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 2
    OnClick = Button1Click
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 184
    Top = 200
    object N1: TMenuItem
      Caption = #26032#22686
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #21024#38500
      OnClick = N2Click
    end
  end
end
