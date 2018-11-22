object frmPickEngNote: TfrmPickEngNote
  Left = 293
  Top = 179
  BorderStyle = bsDialog
  Caption = #36873#25321#24037#31243#22791#27880#24211
  ClientHeight = 447
  ClientWidth = 588
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBCtrlGrid1: TDBCtrlGrid
    Left = 0
    Top = 57
    Width = 588
    Height = 349
    Hint = #21487#21452#20987#25152#36873#35760#24405#39033#25110#25353'OK'#25353#32445#36873#25321
    Align = alClient
    Color = clActiveBorder
    DataSource = DataSource1
    PanelHeight = 116
    PanelWidth = 572
    ParentColor = False
    ParentShowHint = False
    TabOrder = 0
    SelectedColor = clMedGray
    ShowHint = True
    OnDblClick = DBCtrlGrid1DblClick
    object Label2: TLabel
      Left = 3
      Top = 9
      Width = 54
      Height = 13
      Alignment = taRightJustify
      BiDiMode = bdLeftToRight
      Caption = '   '#20195#30721':'
      ParentBiDiMode = False
    end
    object Label3: TLabel
      Left = 12
      Top = 29
      Width = 47
      Height = 13
      Alignment = taRightJustify
      Caption = '  '#20869#23481':'
    end
    object Memo: TDBMemo
      Left = 63
      Top = 28
      Width = 458
      Height = 85
      DataField = 'PROD_ROUT_INST'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit1: TDBEdit
      Left = 63
      Top = 5
      Width = 458
      Height = 21
      DataField = 'INST_CODE'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 588
    Height = 57
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 64
      Top = 29
      Width = 33
      Height = 13
      Caption = #26597#25214':'
    end
    object edtkeyValue: TEdit
      Left = 104
      Top = 24
      Width = 161
      Height = 21
      TabOrder = 0
      OnChange = edtkeyValueChange
    end
    object rgSearchType: TRadioGroup
      Left = 296
      Top = 8
      Width = 185
      Height = 41
      Caption = #26597#25214#26041#24335
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #22791#27880#20195#30721
        #22791#27880#20869#23481)
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 406
    Width = 588
    Height = 41
    Align = alBottom
    TabOrder = 2
    object btnYes: TButton
      Left = 168
      Top = 8
      Width = 75
      Height = 25
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object btnCancel: TButton
      Left = 304
      Top = 8
      Width = 75
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object ADOQuery1: TADOQuery
    Connection = dmcon.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from data0036 order by inst_code')
    Left = 96
    Top = 350
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 64
    Top = 350
  end
end
