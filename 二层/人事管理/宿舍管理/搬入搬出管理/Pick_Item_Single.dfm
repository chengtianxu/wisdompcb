object frmPick_Item_Single: TfrmPick_Item_Single
  Left = 183
  Top = 22
  BorderStyle = bsDialog
  Caption = 'Dialog'
  ClientHeight = 697
  ClientWidth = 795
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 795
    Height = 49
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 40
      Top = 20
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = #26597#35810
    end
    object Label2: TLabel
      Left = 381
      Top = 20
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #25442#25151#26085#26399
    end
    object edtKeyValue: TEdit
      Left = 112
      Top = 16
      Width = 169
      Height = 21
      TabOrder = 0
      OnChange = edtKeyValueChange
    end
    object dtp1: TDateTimePicker
      Left = 440
      Top = 16
      Width = 105
      Height = 21
      Date = 42179.398553055560000000
      Time = 42179.398553055560000000
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 656
    Width = 795
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      795
      41)
    object OKBtn: TButton
      Left = 136
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #30830#23450
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object CancelBtn: TButton
      Left = 521
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Cancel = True
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 49
    Width = 795
    Height = 588
    Align = alClient
    DataSource = dsPick
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    OnKeyPress = DBGrid1KeyPress
    OnTitleClick = DBGrid1TitleClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 637
    Width = 795
    Height = 19
    Panels = <
      item
        Text = #25628#32034#65306
        Width = 50
      end
      item
        Width = 150
      end
      item
        Width = 100
      end>
  end
  object adsPick1: TADODataSet
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 40
    Top = 104
  end
  object dsPick: TDataSource
    OnDataChange = dsPickDataChange
    Left = 80
    Top = 104
  end
end
