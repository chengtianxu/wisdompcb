object frmPick_Item: TfrmPick_Item
  Left = 252
  Top = 158
  BorderStyle = bsDialog
  Caption = 'Dialog'
  ClientHeight = 432
  ClientWidth = 396
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 396
    Height = 49
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 33
      Height = 13
      Caption = #26597#35810':'
    end
    object edtKeyValue: TEdit
      Left = 56
      Top = 16
      Width = 169
      Height = 21
      TabOrder = 0
      OnChange = edtKeyValueChange
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 391
    Width = 396
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object OKBtn: TButton
      Left = 103
      Top = 8
      Width = 75
      Height = 25
      Caption = #30830#23450'(Y)'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object CancelBtn: TButton
      Left = 215
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = #21462#28040'(&C)'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 49
    Width = 396
    Height = 323
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
    OnKeyPress = DBGrid1KeyPress
    OnTitleClick = DBGrid1TitleClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 372
    Width = 396
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
  object dsPick: TDataSource
    DataSet = adsPick
    Left = 80
    Top = 104
  end
  object adsPick: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'adsPickIndex1'
      end>
    Params = <>
    StoreDefs = True
    Left = 48
    Top = 104
  end
end
