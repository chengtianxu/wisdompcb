object Frm_employee: TFrm_employee
  Left = 496
  Top = 203
  Width = 408
  Height = 483
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #21592#24037#25628#32034
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 400
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 104
      Top = 14
      Width = 73
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Label1'
    end
    object Edit1: TEdit
      Left = 184
      Top = 10
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 415
    Width = 400
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 120
      Top = 8
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 216
      Top = 8
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 41
    Width = 400
    Height = 374
    Align = alClient
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGridEh1DblClick
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'empl_code'
        Footers = <>
        Title.Caption = #21592#24037#20195#30721
        Title.SortIndex = 1
        Title.SortMarker = smUpEh
        Width = 99
      end
      item
        EditButtons = <>
        FieldName = 'employee_name'
        Footers = <>
        Title.Caption = #21592#24037#22995#21517
        Width = 143
      end>
  end
  object ADO05: TADODataSet
    Active = True
    Connection = DM.ADOConn
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select empl_code,employee_name from data0005 where empl_code lik' +
      'e '#39'%'#39'+:empl_code+'#39'%'#39
    Parameters = <
      item
        Name = 'empl_code+'#39'%'#39
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    Left = 56
    Top = 328
    object ADO05empl_code: TStringField
      FieldName = 'empl_code'
      Size = 10
    end
    object ADO05employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
  end
  object DataSource1: TDataSource
    DataSet = ADO05
    Left = 120
    Top = 328
  end
end
