object frmSelEmp: TfrmSelEmp
  Left = 620
  Top = 228
  Width = 574
  Height = 469
  Caption = #36873#25321#21592#24037
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 49
    Width = 566
    Height = 329
    Align = alClient
    TabOrder = 0
    object eh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 564
      Height = 327
      Align = alClient
      DataSource = ds1
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -13
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
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
          FieldName = 'employeeCode'
          Footers = <>
          Title.Caption = #24037#21495
          Width = 65
        end
        item
          EditButtons = <>
          FieldName = 'chinesename'
          Footers = <>
          Title.Caption = #22995#21517
        end
        item
          EditButtons = <>
          FieldName = 'departmentName'
          Footers = <>
          Title.Caption = #37096#38376
          Width = 129
        end
        item
          EditButtons = <>
          FieldName = 'item'
          Footers = <>
          Title.Caption = #23703#20301
          Width = 75
        end>
    end
  end
  object pnlf: TPanel
    Left = 0
    Top = 0
    Width = 566
    Height = 49
    Align = alTop
    TabOrder = 1
    object lbl1: TLabel
      Left = 48
      Top = 16
      Width = 26
      Height = 13
      Caption = #24037#21495
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
    Top = 378
    Width = 566
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
    Left = 384
    Top = 16
  end
  object qry1: TADOQuery
    Connection = DM.con
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'declare @TempTable table(IsSelected bit)      '
      'insert @TempTable'
      'values (0)'
      
        'select IsSelected, a.rkey,a.employeeCode,a.chinesename,d.departm' +
        'entName, b.item, a.station, a.departmentid '
      'from  employeemsg  a  '
      'inner join datadepartment d   on a.departmentid=d.rkey'
      'inner join datadetail b on a.station =b.rkey '
      'join @TempTable c on 1=1'
      'where  a.status<>2')
    Left = 432
    Top = 16
    object qry1IsSelected: TBooleanField
      FieldName = 'IsSelected'
    end
    object atncfldqry1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object wdstrngfldqry1employeeCode: TWideStringField
      FieldName = 'employeeCode'
    end
    object wdstrngfldqry1chinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object wdstrngfldqry1departmentName: TWideStringField
      FieldName = 'departmentName'
    end
    object wdstrngfldqry1item: TWideStringField
      FieldName = 'item'
      Size = 50
    end
    object intgrfldqry1station: TIntegerField
      FieldName = 'station'
    end
    object intgrfldqry1departmentid: TIntegerField
      FieldName = 'departmentid'
    end
  end
end
