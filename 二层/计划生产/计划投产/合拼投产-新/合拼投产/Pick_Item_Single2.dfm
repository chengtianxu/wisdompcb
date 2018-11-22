object frmPick_Item_Single2: TfrmPick_Item_Single2
  Left = 521
  Top = 226
  BorderStyle = bsDialog
  Caption = 'Dialog'
  ClientHeight = 502
  ClientWidth = 406
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
    Width = 406
    Height = 49
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 80
      Top = 20
      Width = 26
      Height = 13
      Alignment = taRightJustify
      Caption = #26597#35810
    end
    object edtKeyValue: TEdit
      Left = 112
      Top = 16
      Width = 169
      Height = 21
      TabOrder = 0
      OnChange = edtKeyValueChange
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 461
    Width = 406
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      406
      41)
    object OKBtn: TButton
      Left = 120
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
      Left = 206
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
    Width = 406
    Height = 393
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
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    OnKeyPress = DBGrid1KeyPress
    OnTitleClick = DBGrid1TitleClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 442
    Width = 406
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
