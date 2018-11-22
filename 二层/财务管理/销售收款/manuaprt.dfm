object Frm_manuaprt: TFrm_manuaprt
  Left = 483
  Top = 179
  Width = 542
  Height = 581
  BorderIcons = [biSystemMenu]
  Caption = #36873#25321#26412#21378#32534#21495
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
    Width = 526
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 112
      Top = 14
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #26412#21378#32534#21495
    end
    object Edit1: TEdit
      Left = 176
      Top = 10
      Width = 137
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
    object CheckBox1: TCheckBox
      Left = 328
      Top = 12
      Width = 73
      Height = 17
      Caption = #20851#32852#23458#25143
      TabOrder = 1
      OnClick = CheckBox1Click
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 41
    Width = 526
    Height = 461
    Align = alClient
    DataSource = DS25
    FooterColor = clWindow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGridEh1KeyDown
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'MANU_PART_NUMBER'
        Footers = <>
        Title.Caption = #26412#21378#32534#21495
        Title.Color = clRed
        Width = 89
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_DESC'
        Footers = <>
        Title.Caption = #23458#25143#22411#21495
        Width = 119
      end
      item
        EditButtons = <>
        FieldName = 'ANALYSIS_CODE_2'
        Footers = <>
        Title.Caption = #23458#25143#29289#26009#21495
        Width = 126
      end
      item
        EditButtons = <>
        FieldName = 'CUST_CODE'
        Footers = <>
        Title.Caption = #23458#25143#20195#30721
        Width = 62
      end
      item
        EditButtons = <>
        FieldName = 'ABBR_NAME'
        Footers = <>
        Title.Caption = #23458#25143#31616#31216
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 502
    Width = 526
    Height = 41
    Align = alBottom
    TabOrder = 2
    object Button1: TButton
      Left = 176
      Top = 8
      Width = 75
      Height = 25
      Caption = #30830' '#23450
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 272
      Top = 8
      Width = 75
      Height = 25
      Caption = #21462' '#28040
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object DS25: TDataSource
    DataSet = ADO25
    Left = 64
    Top = 472
  end
  object ADO25: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'SELECT Data0010.CUST_CODE,Data0010.CUSTOMER_NAME,'
      '       Data0010.ABBR_NAME,'
      '       Data0025.MANU_PART_NUMBER,'
      '       Data0025.MANU_PART_DESC,'
      '       Data0025.ANALYSIS_CODE_2'
      'FROM   Data0025 INNER JOIN '
      '       Data0010 ON Data0025.CUSTOMER_PTR = Data0010.RKEY'
      'WHERE  Data0025.PARENT_PTR is null '
      'ORDER BY Data0025.MANU_PART_NUMBER')
    Left = 24
    Top = 472
    object ADO25CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADO25CUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object ADO25ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADO25MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADO25MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ADO25ANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      Size = 80
    end
  end
end
