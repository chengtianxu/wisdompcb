inherited frmDeptinfo: TfrmDeptinfo
  Caption = #37096#38376#23457#25209#20449#24687
  ClientHeight = 344
  ClientWidth = 475
  ExplicitWidth = 483
  ExplicitHeight = 371
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 303
    Width = 475
    Height = 41
    Align = alBottom
    TabOrder = 0
    object Button1: TButton
      Left = 200
      Top = 6
      Width = 69
      Height = 27
      Caption = #20851' '#38381
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 475
    Height = 303
    Align = alClient
    TabOrder = 1
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 473
      Height = 301
      Align = alClient
      DataSource = ds91
      DynProps = <>
      TabOrder = 0
      Columns = <
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'DEPT_NAME'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #35780#23457#37096#38376
          Width = 100
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'auth_flag'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #35780#23457#29366#24577
          Width = 80
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'EMPLOYEE_NAME'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #35780#23457#20154#21592
          Width = 80
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'auth_date'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #35780#23457#26085#26399
          Width = 120
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object ds91: TDataSource
    DataSet = cds91
    Left = 176
    Top = 120
  end
  object cds91: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT Data0034.DEPT_NAME,Data0005.EMPLOYEE_NAME,'#13#10'      data009' +
      '0.auth_date,data0090.rkey,data0090.dept_ptr,'#13#10'case data0090.auth' +
      '_date when  Null then '#39#24453#23457#25209#39' else '#39#24050#35780#23457#39' end as auth_flag'#13#10'FROM Da' +
      'ta0034 INNER JOIN'#13#10'     data0090 ON Data0034.RKEY = data0090.dep' +
      't_ptr LEFT OUTER JOIN'#13#10'     Data0005 ON data0090.user_ptr = Data' +
      '0005.RKEY'#13#10'where 1=1'
    Params = <>
    Left = 272
    Top = 120
  end
end
