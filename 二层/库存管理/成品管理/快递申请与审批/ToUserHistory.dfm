object frmToUserHistory: TfrmToUserHistory
  Left = 645
  Top = 198
  Width = 415
  Height = 501
  Caption = #21382#21490#35760#24405
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
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 399
    Height = 33
    Align = alTop
    TabOrder = 0
    object edtFilter: TLabeledEdit
      Left = 112
      Top = 6
      Width = 121
      Height = 21
      EditLabel.Width = 64
      EditLabel.Height = 15
      EditLabel.Caption = #26412#21378#32534#21495
      EditLabel.Font.Charset = ANSI_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -15
      EditLabel.Font.Name = #40657#20307
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      LabelPosition = lpLeft
      TabOrder = 0
      OnChange = edtFilterChange
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 422
    Width = 399
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btn1: TButton
      Left = 160
      Top = 8
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = btn1Click
    end
  end
  object eh1: TDBGridEh
    Left = 0
    Top = 33
    Width = 399
    Height = 389
    Align = alClient
    DataSource = ds817
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = eh1DblClick
    OnTitleClick = eh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'touser'
        Footers = <>
        Title.Caption = #23545#26041#21517#31216
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'tophone'
        Footers = <>
        Title.Caption = #30005#35805
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'CustName'
        Footers = <>
        Title.Caption = #23458#25143
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'toaddress'
        Footers = <>
        Title.Caption = #22320#22336
        Width = 200
      end>
  end
  object ads817: TADODataSet
    Connection = dm1.con1
    CommandText = 
      'select touser,tophone,toaddress,CustName from data0817 where cus' +
      'er = :p1'
    Parameters = <
      item
        Name = 'p1'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 216
    Top = 96
    object ads817touser: TStringField
      FieldName = 'touser'
      Size = 50
    end
    object ads817tophone: TStringField
      FieldName = 'tophone'
      Size = 100
    end
    object ads817toaddress: TStringField
      FieldName = 'toaddress'
      Size = 1000
    end
    object ads817CustName: TStringField
      FieldName = 'CustName'
      Size = 250
    end
  end
  object ds817: TDataSource
    DataSet = ads817
    Left = 264
    Top = 96
  end
end
