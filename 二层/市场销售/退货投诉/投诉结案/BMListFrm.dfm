object frmBMList: TfrmBMList
  Left = 363
  Top = 111
  Width = 521
  Height = 565
  Caption = #37096#38376
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 513
    Height = 41
    Align = alTop
    TabOrder = 0
    object edtFilter: TLabeledEdit
      Left = 128
      Top = 8
      Width = 121
      Height = 21
      EditLabel.Width = 52
      EditLabel.Height = 17
      EditLabel.Caption = 'edtFilter'
      EditLabel.Font.Charset = ANSI_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -15
      EditLabel.Font.Name = #40657#20307
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      LabelPosition = lpLeft
      TabOrder = 0
      OnChange = edtFilterChange
      OnKeyPress = edtFilterKeyPress
    end
    object rg1: TRadioGroup
      Left = 272
      Top = -2
      Width = 233
      Height = 41
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #30456#20851#24037#24207
        #20840#37096#24037#24207)
      TabOrder = 1
      OnClick = rg1Click
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 41
    Width = 513
    Height = 451
    Align = alClient
    TabOrder = 1
    object ehBMlist: TDBGridEh
      Left = 1
      Top = 1
      Width = 511
      Height = 449
      Align = alClient
      DataSource = ds1
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = ehBMlistDblClick
      OnTitleClick = ehBMlistTitleClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'step_number'
          Footers = <>
          Title.Caption = #27493#39588#21495
        end
        item
          EditButtons = <>
          FieldName = 'dept_code'
          Footers = <>
          Title.Caption = #37096#38376#20195#30721
          Width = 90
        end
        item
          EditButtons = <>
          FieldName = 'dept_name'
          Footers = <>
          Title.Caption = #37096#38376#21517#31216
          Width = 200
        end
        item
          EditButtons = <>
          FieldName = 'rkey'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'steptype'
          Footers = <>
          Title.Caption = #37096#38376#31867#21035
          Width = 69
        end>
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 492
    Width = 513
    Height = 39
    Align = alBottom
    TabOrder = 2
    object btnOK: TButton
      Left = 120
      Top = 8
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnCancel: TButton
      Left = 304
      Top = 8
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
      OnClick = btnCancelClick
    end
  end
  object ds1: TDataSource
    DataSet = adsBMList
    Left = 384
    Top = 337
  end
  object adsBMList: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'select data0034.rkey,data0034.dept_code,data0034.dept_name,data0' +
      '038.step_number ,'#13#10'CASE TTYPE WHEN 1 THEN '#39#24037#24207#39'  WHEN 4 THEN  '#39#37096#38376 +
      #39'  WHEN 5 THEN '#39#29677#32452#39' END AS steptype'#13#10'from data0034 inner join da' +
      'ta0038 on'#13#10'data0038.dept_ptr=data0034.rkey where data0034.BARCOD' +
      'E_ENTRY_FLAG='#39'Y'#39#13#10'and data0038.source_ptr=:rkey0025'
    Parameters = <
      item
        Name = 'rkey0025'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Prepared = True
    Left = 336
    Top = 345
    object adsBMListrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object adsBMListdept_code: TStringField
      FieldName = 'dept_code'
      Size = 10
    end
    object adsBMListdept_name: TStringField
      FieldName = 'dept_name'
      Size = 30
    end
    object adsBMListstep_number: TSmallintField
      FieldName = 'step_number'
    end
    object adsBMListsteptype: TStringField
      FieldName = 'steptype'
      ReadOnly = True
      Size = 4
    end
  end
end
