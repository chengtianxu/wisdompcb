object FrmSelEmp: TFrmSelEmp
  Left = 437
  Top = 192
  Width = 627
  Height = 418
  Caption = #36873#25321#21592#24037
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 49
    Width = 619
    Height = 282
    Align = alClient
    TabOrder = 0
    object dbgrdh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 617
      Height = 280
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
      OnTitleClick = dbgrdh1TitleClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'IsSelected'
          Footers = <>
          Title.Caption = #36873#25321
          Width = 65
        end
        item
          EditButtons = <>
          FieldName = 'employeecode'
          Footers = <>
          Title.Caption = #21592#24037#24037#21495
        end
        item
          EditButtons = <>
          FieldName = 'ChineseName'
          Footers = <>
          Title.Caption = #21592#24037#22995#21517
        end
        item
          EditButtons = <>
          FieldName = 'DepartmentName'
          Footers = <>
          Title.Caption = #25152#23646#37096#38376
        end>
    end
  end
  object pnlf: TPanel
    Left = 0
    Top = 0
    Width = 619
    Height = 49
    Align = alTop
    TabOrder = 1
    object lbl1: TLabel
      Left = 24
      Top = 12
      Width = 28
      Height = 13
      Caption = 'lbl1'
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
    Top = 331
    Width = 619
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
      OnClick = btnOKClick
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
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'startDate'
        Size = -1
        Value = Null
      end
      item
        Name = 'endDate'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @TempTable table(IsSelected bit)      '
      '  insert @TempTable'
      '  values (0)'
      
        'select IsSelected, a.rkey,a.employeecode, ChineseName,b.Departme' +
        'ntName'
      'from  employeemsg a '
      'inner join datadepartment b  on a.departmentid=b.rkey '
      ' join @TempTable c on 1=1'
      ' where (a.outdutytime is null or a.outdutytime>=:startDate )'
      '     and  a.ondutytime<=:endDate')
    Left = 512
    Top = 8
    object qry1IsSelected: TBooleanField
      FieldName = 'IsSelected'
    end
    object atncfldqry1rkey: TAutoIncField
      FieldName = 'rkey'
    end
    object qry1ChineseName: TWideStringField
      FieldName = 'ChineseName'
    end
    object qry1DepartmentName: TWideStringField
      FieldName = 'DepartmentName'
    end
    object qry1employeecode: TWideStringField
      FieldName = 'employeecode'
    end
  end
end
