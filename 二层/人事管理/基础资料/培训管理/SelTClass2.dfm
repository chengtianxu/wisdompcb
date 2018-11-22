object frmSelTClass2: TfrmSelTClass2
  Left = 569
  Top = 221
  Width = 586
  Height = 428
  Caption = 'frmSelTClass2'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 49
    Width = 578
    Height = 288
    Align = alClient
    TabOrder = 0
    object eh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 576
      Height = 286
      Align = alClient
      DataSource = ds1
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnTitleClick = eh1TitleClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'IsSelected'
          Footers = <>
          Title.Caption = #36873#25321
        end
        item
          EditButtons = <>
          FieldName = 'CCode'
          Footers = <>
          Title.Caption = #35838#31243#32534#21495
        end
        item
          EditButtons = <>
          FieldName = 'Cname'
          Footers = <>
          Title.Caption = #35838#31243#21517#31216
        end>
    end
  end
  object pnlf: TPanel
    Left = 0
    Top = 0
    Width = 578
    Height = 49
    Align = alTop
    TabOrder = 1
    object lbl1: TLabel
      Left = 48
      Top = 16
      Width = 52
      Height = 13
      Caption = #35838#31243#32534#21495
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object edt_1: TEdit
      Left = 88
      Top = 12
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = edt_1Change
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 337
    Width = 578
    Height = 60
    Align = alBottom
    TabOrder = 2
    object btnCancel: TButton
      Left = 464
      Top = 16
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 0
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      Left = 232
      Top = 16
      Width = 75
      Height = 25
      Caption = #30830#23450
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ModalResult = 1
      ParentFont = False
      TabOrder = 1
    end
    object btn_SelAll: TButton
      Left = 24
      Top = 8
      Width = 49
      Height = 25
      Caption = #20840#36873
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btn_SelAllClick
    end
  end
  object ds1: TDataSource
    DataSet = qry1
    Left = 464
    Top = 8
  end
  object qry1: TADOQuery
    Connection = DM.con
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      ' declare @TempTable table(IsSelected bit)      '
      '  insert @TempTable'
      '  values (0)'
      'select IsSelected, a.rkey,a.CCode,a.Cname'
      'from  trainclass a '
      ' join @TempTable c on 1=1'
      ' where 1=1')
    Left = 512
    Top = 8
    object qry1IsSelected: TBooleanField
      FieldName = 'IsSelected'
    end
    object atncfldqry1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object strngfldqry1CCode: TStringField
      FieldName = 'CCode'
    end
    object strngfldqry1Cname: TStringField
      FieldName = 'Cname'
      Size = 50
    end
  end
end
