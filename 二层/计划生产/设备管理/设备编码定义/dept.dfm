object Frm_dept: TFrm_dept
  Left = 532
  Top = 219
  Width = 431
  Height = 562
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #36873#25321#37096#38376#32534#21495
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 423
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 112
      Top = 14
      Width = 42
      Height = 13
      Caption = 'Label1'
    end
    object Edit1: TEdit
      Left = 176
      Top = 10
      Width = 137
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
  end
  object DBGrd: TDBGridEh
    Left = 0
    Top = 41
    Width = 423
    Height = 453
    Align = alClient
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrdDblClick
    OnTitleClick = DBGrdTitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'dept_code'
        Footers = <>
        Title.Caption = #37096#38376#32534#21495
        Title.SortIndex = 1
        Title.SortMarker = smUpEh
        Width = 97
      end
      item
        EditButtons = <>
        FieldName = 'dept_name'
        Footers = <>
        Title.Caption = #37096#38376#21517#31216
        Width = 194
      end
      item
        EditButtons = <>
        FieldName = 'xz'
        Footers = <>
        Title.Caption = #24615#36136
        Width = 50
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 494
    Width = 423
    Height = 41
    Align = alBottom
    TabOrder = 2
    object Button1: TButton
      Left = 128
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
  object ADO34: TADODataSet
    Connection = DM.ADOConn
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select rkey,dept_code,dept_name,'#13#10'case ttype when 4 then '#39#37096#38376#39' wh' +
      'en 5 then '#39#29677#32452#39' else '#39#24037#24207#39' end AS xz '#13#10'from data0034'#13#10'where (ttype' +
      ' in (1,4,5) or IS_COST_DEPT=1) and dept_code like '#39'%'#39'+:dept_code' +
      '+'#39'%'#39
    Parameters = <
      item
        Name = 'dept_code+'#39'%'#39
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    Left = 320
    Top = 487
    object ADO34rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO34dept_code: TStringField
      FieldName = 'dept_code'
      Size = 10
    end
    object ADO34dept_name: TStringField
      FieldName = 'dept_name'
      Size = 30
    end
    object ADO34xz: TStringField
      FieldName = 'xz'
      ReadOnly = True
      Size = 4
    end
  end
  object DataSource1: TDataSource
    DataSet = ADO34
    Left = 376
    Top = 487
  end
end
