object frmEdit: TfrmEdit
  Left = 493
  Top = 185
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #32534#36753
  ClientHeight = 481
  ClientWidth = 461
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
  object edtGradeCode: TLabeledEdit
    Left = 65
    Top = 20
    Width = 121
    Height = 21
    EditLabel.Width = 48
    EditLabel.Height = 13
    EditLabel.Caption = #31561#32423#20195#30721
    LabelPosition = lpLeft
    TabOrder = 0
  end
  object edtGrade_Name: TLabeledEdit
    Left = 305
    Top = 20
    Width = 121
    Height = 21
    EditLabel.Width = 48
    EditLabel.Height = 13
    EditLabel.Caption = #31561#32423#21517#31216
    LabelPosition = lpLeft
    TabOrder = 1
  end
  object edtGrade_Note: TLabeledEdit
    Left = 65
    Top = 60
    Width = 361
    Height = 21
    EditLabel.Width = 48
    EditLabel.Height = 13
    EditLabel.Caption = #31561#32423#22791#27880
    LabelPosition = lpLeft
    TabOrder = 2
  end
  object pnl1: TPanel
    Left = 0
    Top = 440
    Width = 461
    Height = 41
    Align = alBottom
    TabOrder = 3
    object btnOK: TButton
      Left = 129
      Top = 8
      Width = 75
      Height = 25
      Caption = #20445#23384
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnCancel: TButton
      Left = 259
      Top = 8
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
      OnClick = btnCancelClick
    end
  end
  object eh1: TDBGridEh
    Left = 0
    Top = 102
    Width = 461
    Height = 169
    Align = alBottom
    DataSource = ds1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    PopupMenu = pmAddDept
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'dept_code'
        Footers = <>
        Title.Caption = #24037#24207#20195#30721
      end
      item
        EditButtons = <>
        FieldName = 'dept_name'
        Footers = <>
        Title.Caption = #24037#24207#21517#31216
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'dept_note'
        Footers = <>
        Title.Caption = #31561#32423#21152#24037#25351#31034
        Width = 240
      end>
  end
  object eh2: TDBGridEh
    Left = 0
    Top = 271
    Width = 461
    Height = 169
    Align = alBottom
    DataSource = ds2
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    PopupMenu = pmAddParam
    ReadOnly = True
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'seq_no'
        Footers = <>
        Title.Caption = #24207#21495
      end
      item
        EditButtons = <>
        FieldName = 'parameter_desc'
        Footers = <>
        Title.Caption = #21442#25968#21517#31216
      end
      item
        EditButtons = <>
        FieldName = 'parameter_name'
        Footers = <>
        Title.Caption = #21442#25968#20195#30721
      end
      item
        EditButtons = <>
        FieldName = 'tvalue'
        Footers = <>
        Title.Caption = #21442#25968#20540
        Width = 170
      end>
  end
  object pmAddParam: TPopupMenu
    OnPopup = pmAddParamPopup
    Left = 312
    Top = 328
    object N1: TMenuItem
      Caption = #26032#22686#21442#25968
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #32534#36753#21442#25968
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #21024#38500#21442#25968
      OnClick = N3Click
    end
  end
  object dtstprvdr1: TDataSetProvider
    DataSet = ads1
    Left = 24
    Top = 144
  end
  object cds1: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'dept_note'
        DataType = ftWideString
        Size = 2048
      end
      item
        Name = 'dept_ptr'
        DataType = ftInteger
      end
      item
        Name = 'dept_code'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'dept_name'
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <
      item
        Name = 'cds1Index1'
        Fields = 'dept_ptr'
        Options = [ixPrimary, ixUnique]
      end>
    IndexName = 'cds1Index1'
    Params = <>
    StoreDefs = True
    AfterPost = cds1AfterScroll
    AfterScroll = cds1AfterScroll
    Left = 64
    Top = 144
    object cds1dept_note: TWideStringField
      FieldName = 'dept_note'
      Size = 2048
    end
    object cds1dept_code: TStringField
      FieldName = 'dept_code'
      Size = 10
    end
    object cds1dept_name: TStringField
      FieldName = 'dept_name'
      Size = 30
    end
    object cds1dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
  end
  object ds1: TDataSource
    DataSet = cds1
    Left = 112
    Top = 144
  end
  object cds2: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'grade_code'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'seq_no'
        DataType = ftInteger
      end
      item
        Name = 'parameter_name'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'parameter_desc'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'tvalue'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'dept_ptr'
        DataType = ftInteger
      end
      item
        Name = 'parameter_ptr'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'cds2Index6'
        Fields = 'dept_ptr;parameter_ptr'
        Options = [ixPrimary, ixUnique]
      end>
    IndexName = 'cds2Index6'
    Params = <>
    StoreDefs = True
    Left = 64
    Top = 280
    object cds2seq_no: TIntegerField
      FieldName = 'seq_no'
    end
    object cds2parameter_name: TStringField
      FieldName = 'parameter_name'
      Size = 10
    end
    object cds2tvalue: TStringField
      FieldName = 'tvalue'
      Size = 30
    end
    object cds2dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object cds2parameter_ptr: TIntegerField
      FieldName = 'parameter_ptr'
    end
    object cds2parameter_desc: TStringField
      FieldName = 'parameter_desc'
    end
  end
  object ds2: TDataSource
    DataSet = cds2
    Left = 112
    Top = 280
  end
  object ads1: TADODataSet
    Connection = DM1.con1
    CursorType = ctStatic
    CommandText = 
      'select D83.dept_note, d83.dept_ptr, d34.dept_code,d34.dept_name ' +
      'from data0083 d83'#13#10'inner join data0034 d34 on d34.rkey = d83.dep' +
      't_ptr'#13#10'where d83.grade_code = :param1'
    Parameters = <
      item
        Name = 'param1'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    Left = 24
    Top = 184
  end
  object dtstprvdr2: TDataSetProvider
    DataSet = ads2
    Left = 24
    Top = 280
  end
  object ads2: TADODataSet
    Connection = DM1.con1
    CursorType = ctStatic
    CommandText = 
      'select d84.seq_no,d278.parameter_name,d278.parameter_desc,d84.tv' +
      'alue,d83.dept_ptr,d84.parameter_ptr  from data0084 d84'#13#10'inner jo' +
      'in data0278 d278 on d84.parameter_ptr = d278.rkey'#13#10'inner join da' +
      'ta0083 d83 on d84.dept_ptr = d83.dept_ptr and d84.grade_code = d' +
      '83.grade_code'#13#10'where d83.grade_code = :param1'#13#10'order by d84.seq_' +
      'no asc'
    Parameters = <
      item
        Name = 'param1'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    Left = 24
    Top = 320
  end
  object pmAddDept: TPopupMenu
    OnPopup = pmAddDeptPopup
    Left = 312
    Top = 144
    object N4: TMenuItem
      Caption = #28155#21152#24037#24207
      OnClick = N4Click
    end
    object N6: TMenuItem
      Caption = #32534#36753#24037#24207
      OnClick = N6Click
    end
    object N5: TMenuItem
      Caption = #21024#38500#24037#24207
      OnClick = N5Click
    end
  end
end
