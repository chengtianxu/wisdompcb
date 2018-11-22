object frm_pickitem: Tfrm_pickitem
  Left = 548
  Top = 178
  Width = 477
  Height = 478
  VertScrollBar.Range = 82
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #26435#38480#22686#21152
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 461
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 13
      Width = 117
      Height = 13
      Caption = #25628#32034#65288#20135#21697#32534#30721#65289#65306
    end
    object Edit1: TEdit
      Left = 128
      Top = 9
      Width = 161
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
    object CheckBox1: TCheckBox
      Left = 384
      Top = 11
      Width = 57
      Height = 17
      Caption = #20840#36873
      TabOrder = 1
      OnClick = CheckBox1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 399
    Width = 461
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Button2: TButton
      Left = 264
      Top = 9
      Width = 75
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
    object Button1: TButton
      Left = 120
      Top = 9
      Width = 75
      Height = 25
      Caption = #20445#23384
      ModalResult = 1
      TabOrder = 0
    end
  end
  object Eh1: TDBGridEh
    Left = 0
    Top = 41
    Width = 461
    Height = 358
    Align = alClient
    DataSource = dm.DS_pickitem
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = Eh1KeyDown
    OnTitleClick = Eh1TitleClick
    Columns = <
      item
        Checkboxes = True
        EditButtons = <>
        FieldName = 'isselected'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #36873#25321
        Width = 50
      end
      item
        EditButtons = <>
        FieldName = 'PROD_CODE'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #20135#21697#20195#30721
        Title.Color = clRed
        Title.SortIndex = 1
        Title.SortMarker = smUpEh
        Width = 95
      end
      item
        EditButtons = <>
        FieldName = 'PRODUCT_NAME'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #20135#21697#21517#31216
        Width = 300
      end>
  end
end
