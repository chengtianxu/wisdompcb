object frmPick_WorkShop: TfrmPick_WorkShop
  Left = 419
  Top = 235
  BorderStyle = bsDialog
  Caption = #36873#25321#24037#24207
  ClientHeight = 471
  ClientWidth = 448
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
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
    Width = 448
    Height = 49
    Align = alTop
    TabOrder = 0
    object labelKey: TLabel
      Left = 108
      Top = 19
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = #25628#32034#65306
    end
    object edtKey: TEdit
      Left = 143
      Top = 15
      Width = 142
      Height = 21
      TabOrder = 0
      OnChange = edtKeyChange
      OnKeyPress = edtKeyKeyPress
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 49
    Width = 448
    Height = 381
    Align = alClient
    DataSource = dm.dsPickWorkShop
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = GB2312_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    TabOrder = 1
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    TitleHeight = 20
    OnCellClick = DBGridEh1CellClick
    OnDblClick = DBGridEh1DblClick
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'IsSelected'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #36873#20013
        Width = 68
      end
      item
        EditButtons = <>
        FieldName = 'Dept_Code'
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #24037#24207#20195#30721
        Width = 97
      end
      item
        EditButtons = <>
        FieldName = 'Dept_Name'
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #24037#24207#21517#31216
        Width = 201
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 430
    Width = 448
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object OKBtn: TButton
      Left = 119
      Top = 8
      Width = 75
      Height = 25
      Caption = #30830#23450'(Y)'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object CancelBtn: TButton
      Left = 247
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = #21462#28040'(&C)'
      ModalResult = 2
      TabOrder = 1
    end
    object CheckBox1: TCheckBox
      Left = 41
      Top = 4
      Width = 57
      Height = 17
      Caption = #20840#36873
      TabOrder = 2
      OnClick = CheckBox1Click
    end
  end
end
