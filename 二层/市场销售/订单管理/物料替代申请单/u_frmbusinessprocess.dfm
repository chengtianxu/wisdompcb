object frmbusinessprocess: Tfrmbusinessprocess
  Left = 795
  Top = 201
  BorderStyle = bsSingle
  Caption = #23457#26680#27969#31243#23450#20041
  ClientHeight = 482
  ClientWidth = 712
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
    Width = 712
    Height = 41
    Align = alTop
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 8
      Top = 8
      Width = 57
      Height = 33
      Caption = #26032#22686
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Tag = 1
      Left = 65
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
    Width = 712
    Height = 441
    Align = alClient
    TabOrder = 1
    object DBGridEh1: TDBGridEh
      Left = 501
      Top = 1
      Width = 210
      Height = 439
      Align = alRight
      DataSource = dm.DS544
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
      PopupMenu = PopupMenu2
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyDown = DBGridEh1KeyDown
      Columns = <
        item
          EditButtons = <>
          FieldName = 'd34_index'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #24207
          Width = 17
        end
        item
          EditButtons = <>
          FieldName = 'dept_name'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #23457#25209#37096#38376
          Width = 172
        end
        item
          EditButtons = <>
          FieldName = 'rkey'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'd542_ptr'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'd34_ptr'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'remark'
          Footers = <>
          Visible = False
        end>
    end
    object DBGridEh2: TDBGridEh
      Left = 1
      Top = 1
      Width = 500
      Height = 439
      Align = alClient
      DataSource = dm.DS542
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
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
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
          Title.Caption = #21512#21516#23457#25209#27969#31243#21517#31216
          Width = 239
        end
        item
          EditButtons = <>
          FieldName = 'remark'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #22791#27880
          Width = 180
        end>
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 194
    Top = 150
    object N1: TMenuItem
      Caption = #21024#38500
      OnClick = N1Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 559
    Top = 165
    object N2: TMenuItem
      Caption = '-'
    end
    object N4: TMenuItem
      Caption = #26032#22686
      OnClick = N4Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object MenuItem1: TMenuItem
      Caption = #21024#38500
      OnClick = MenuItem1Click
    end
  end
end
