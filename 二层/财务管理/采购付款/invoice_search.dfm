object Form_invoice: TForm_invoice
  Left = 321
  Top = 183
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #24212#20184#21457#31080#26597#25214
  ClientHeight = 492
  ClientWidth = 720
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 202
    Top = 11
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #21457#31080#32534#21495':'
  end
  object Edit1: TEdit
    Left = 264
    Top = 6
    Width = 121
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = DBGrid1KeyDown
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 32
    Width = 713
    Height = 417
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'invoice_no'
        Title.Color = clRed
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'type'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_DATE'
        ReadOnly = False
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'due_date'
        ReadOnly = False
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_TOTAL'
        ReadOnly = False
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'yisou'
        ReadOnly = False
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'yinsou'
        ReadOnly = False
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_NAME'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_RATE'
        ReadOnly = False
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbr_name'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = #31246#31080#26631#35782
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 224
    Top = 459
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 304
    Top = 459
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 3
  end
  object CheckBox1: TCheckBox
    Left = 24
    Top = 464
    Width = 56
    Height = 17
    Caption = #20840#36873
    TabOrder = 4
    OnClick = CheckBox1Click
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 72
    Top = 400
  end
  object ADODataSet1: TADODataSet
    Connection = dm.ACt
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT data0107.invoice_no, data0107.due_date, data0107.INV_TOTA' +
      'L, '#13#10'data0107.EX_RATE,data0107.rkey,'#13#10'data0107.amt_paid + data01' +
      '07.CASH_DISC AS yisou,'#13#10'data0107.INV_TOTAL - data0107.amt_paid -' +
      ' data0107.CASH_DISC AS yinsou,'#13#10'case data0107.inv_tp when '#39'0'#39' th' +
      'en '#39#26631#20934'PO'#39' when '#39'1'#39' then '#39#26434#39033'PO'#39' '#13#10'when '#39'2'#39' then '#39#30452#25509#20837#20179#39' when '#39'3'#39' t' +
      'hen '#39#22996#22806#21152#24037#39' '#13#10'when '#39'4'#39'  then '#39#20854#23427#36153#29992#39' end as  type, data0015.abbr_n' +
      'ame,'#13#10'data0001.CURR_NAME,data0107.INV_DATE,'#13#10'case data0107.GLPTR' +
      '_STATUS when 0 then '#39#21542#39' when 1 then '#39#26159#39' end as '#31246#31080#26631#35782#13#10'FROM Data01' +
      '07 inner join data0001'#13#10'on data0107.currency_ptr=data0001.rkey i' +
      'nner join '#13#10'data0015 on data0107.warehouse_ptr=data0015.rkey'#13#10'WH' +
      'ERE (data0107.STATUS = 1)'#13#10'and SUPP_PTR=:rkey23'#13#10'and CURRENCY_PT' +
      'R=:rkey01'#13#10
    IndexFieldNames = 'invoice_no'
    Parameters = <
      item
        Name = 'rkey23'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end
      item
        Name = 'rkey01'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    Left = 101
    Top = 400
    object ADODataSet1invoice_no: TStringField
      DisplayLabel = #21457#31080#32534#21495
      FieldName = 'invoice_no'
      Size = 16
    end
    object ADODataSet1due_date: TDateTimeField
      DisplayLabel = #21040#26399#26085
      FieldName = 'due_date'
    end
    object ADODataSet1INV_TOTAL: TBCDField
      DisplayLabel = #37329#39069
      FieldName = 'INV_TOTAL'
      Precision = 19
    end
    object ADODataSet1EX_RATE: TFloatField
      DisplayLabel = #27719#29575
      FieldName = 'EX_RATE'
    end
    object ADODataSet1rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADODataSet1yisou: TBCDField
      DisplayLabel = #24050#20184
      FieldName = 'yisou'
      ReadOnly = True
      Precision = 19
    end
    object ADODataSet1yinsou: TBCDField
      DisplayLabel = #24212#20184
      FieldName = 'yinsou'
      ReadOnly = True
      Precision = 19
    end
    object ADODataSet1type: TStringField
      DisplayLabel = #31867#22411
      FieldName = 'type'
      ReadOnly = True
      Size = 8
    end
    object ADODataSet1CURR_NAME: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_NAME'
    end
    object ADODataSet1INV_DATE: TDateTimeField
      DisplayLabel = #21457#31080#26085#26399
      FieldName = 'INV_DATE'
    end
    object ADODataSet1abbr_name: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'abbr_name'
      Size = 10
    end
    object ADODataSet1DSDesigner: TStringField
      FieldName = #31246#31080#26631#35782
      ReadOnly = True
      Size = 2
    end
  end
end
