object frmCostPeriod: TfrmCostPeriod
  Left = 549
  Top = 196
  Width = 619
  Height = 407
  Caption = #25104#26412#26399#38388
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 603
    Height = 328
    Align = alClient
    TabOrder = 0
    object dbgrdh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 601
      Height = 326
      Align = alClient
      DataSource = ds1
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -13
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = 'rkey'
          Footers = <>
          Title.Caption = #32534#21495
          Width = 38
        end
        item
          EditButtons = <>
          FieldName = 'FM_DATE'
          Footers = <>
          Title.Caption = #24320#22987#26085#26399
          Width = 106
        end
        item
          EditButtons = <>
          FieldName = 'END_DATE'
          Footers = <>
          Title.Caption = #32467#26463#26085#26399
          Width = 118
        end
        item
          EditButtons = <>
          FieldName = 'CLOSED_DATE'
          Footers = <>
          Title.Caption = #26680#31639#26085#26399
        end
        item
          EditButtons = <>
          FieldName = 'EMPLOYEE_NAME'
          Footers = <>
          Title.Caption = #26680#31639#20154#21592
        end
        item
          EditButtons = <>
          FieldName = 'sel'
          Footers = <>
          Title.Caption = #36873#25321
        end>
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 328
    Width = 603
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btn_Ok: TButton
      Left = 152
      Top = 8
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = btn_OkClick
    end
    object btn_cancel: TButton
      Left = 272
      Top = 8
      Width = 75
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
      OnClick = btn_cancelClick
    end
    object btn_SelAll: TButton
      Left = 536
      Top = 8
      Width = 41
      Height = 25
      Caption = #20840#36873
      TabOrder = 2
      OnClick = btn_SelAllClick
    end
  end
  object qry1: TADOQuery
    Connection = DM.con1
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'BDate'
        Size = -1
        Value = Null
      end
      item
        Name = 'EDate'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @TempTable table(sel bit)      '
      '  insert @TempTable'
      '  values (0)'
      '  '
      'select a.rkey,FM_DATE,END_DATE,CLOSED_DATE,b.EMPLOYEE_NAME,c.sel'
      ' from data0451 a '
      ' inner join data0005 b  on a.CLOSED_BY =b.rkey '
      ' join  @TempTable   c on 1=1 '
      'where a.end_Date>= :BDate and   a.end_Date<= :EDate')
    Left = 352
    Top = 104
    object atncfldqry1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object dtmfldqry1FM_DATE: TDateTimeField
      FieldName = 'FM_DATE'
    end
    object dtmfldqry1END_DATE: TDateTimeField
      FieldName = 'END_DATE'
    end
    object dtmfldqry1CLOSED_DATE: TDateTimeField
      FieldName = 'CLOSED_DATE'
    end
    object strngfldqry1EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object blnfldqry1sel: TBooleanField
      FieldName = 'sel'
    end
  end
  object ds1: TDataSource
    DataSet = qry1
    Left = 440
    Top = 120
  end
end
