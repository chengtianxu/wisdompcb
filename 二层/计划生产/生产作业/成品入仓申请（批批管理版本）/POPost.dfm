object frmPOPost: TfrmPOPost
  Left = 362
  Top = 92
  Width = 696
  Height = 616
  Caption = #25552#20132#20837#20179
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 680
    Height = 81
    Align = alTop
    TabOrder = 0
    object lbl4: TLabel
      Left = 86
      Top = 48
      Width = 110
      Height = 21
      Caption = #25552#20132#25968#37327#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -21
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl5: TLabel
      Left = 86
      Top = 11
      Width = 110
      Height = 21
      Caption = #38144#21806#35746#21333#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -21
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl1: TLabel
      Left = 336
      Top = 52
      Width = 41
      Height = 13
      AutoSize = False
      Caption = #37325#37327#65306
    end
    object lbl2: TLabel
      Left = 486
      Top = 28
      Width = 72
      Height = 13
      Caption = #35746#21333'+'#36864#36135#65306
    end
    object lblAllpcs: TLabel
      Left = 558
      Top = 27
      Width = 7
      Height = 13
    end
    object lbl6: TLabel
      Left = 486
      Top = 51
      Width = 65
      Height = 13
      Caption = #36824#38656#25552#20132#65306
    end
    object lblNeedPcs: TLabel
      Left = 558
      Top = 49
      Width = 9
      Height = 16
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl3: TLabel
      Left = 487
      Top = 7
      Width = 65
      Height = 13
      Caption = #23458#25143#35746#21333#65306
    end
    object lbl97PoNumber: TLabel
      Left = 558
      Top = 6
      Width = 7
      Height = 13
    end
    object edtPO: TEdit
      Left = 204
      Top = 8
      Width = 214
      Height = 29
      TabStop = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -21
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object edtPostPcs: TEdit
      Left = 204
      Top = 43
      Width = 107
      Height = 29
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -21
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Text = '0'
      OnExit = edtPostPcsExit
      OnKeyPress = edtPostPcsKeyPress
    end
    object edtweight: TEdit
      Left = 376
      Top = 47
      Width = 73
      Height = 21
      TabOrder = 1
      OnExit = edtweightExit
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 81
    Width = 680
    Height = 455
    Align = alClient
    TabOrder = 1
    object eh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 678
      Height = 428
      TabStop = False
      Align = alClient
      DataSource = ds1
      FooterColor = clWindow
      FooterFont.Charset = ANSI_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -13
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      FooterRowCount = 1
      ReadOnly = True
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          Checkboxes = True
          EditButtons = <>
          FieldName = 'Checked'
          Footers = <>
          Title.Caption = #36873
          Width = 25
        end
        item
          EditButtons = <>
          FieldName = 'work_order_number'
          Footers = <>
          Title.Caption = #20316#19994#21333#21495
          Width = 150
        end
        item
          EditButtons = <>
          FieldName = 'manu_part_number'
          Footers = <>
          Title.Caption = #26412#21378#32534#21495
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'Canusepcs'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #26377#25928'PCS'
          Width = 65
        end
        item
          EditButtons = <>
          FieldName = 'CanUsePNL'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #26377#25928'PNL'
          Width = 65
        end
        item
          EditButtons = <>
          FieldName = 'dept_name'
          Footers = <>
          Title.Caption = #24403#21069#24037#24207
          Width = 90
        end
        item
          EditButtons = <>
          FieldName = 'rkey06'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'PostPcs'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #25552#20132#25968'PCS'
        end
        item
          EditButtons = <>
          FieldName = 'PostPNL'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #25552#20132#25968'PNL'
        end>
    end
    object pnl4: TPanel
      Left = 1
      Top = 429
      Width = 678
      Height = 25
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object lbl10: TLabel
        Left = 7
        Top = 4
        Width = 39
        Height = 13
        Caption = #22791#27880#65306
      end
      object edtBZ: TEdit
        Left = 48
        Top = 0
        Width = 673
        Height = 21
        TabOrder = 0
      end
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 536
    Width = 680
    Height = 42
    Align = alBottom
    TabOrder = 2
    object btn2: TButton
      Left = 296
      Top = 11
      Width = 75
      Height = 25
      Caption = #25552#20132
      TabOrder = 0
      OnClick = btn2Click
    end
  end
  object ds1: TDataSource
    DataSet = cds1
    Left = 436
    Top = 265
  end
  object cds1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 352
    Top = 265
    object cds1work_order_number: TStringField
      FieldName = 'work_order_number'
      Size = 22
    end
    object cds1manu_part_number: TStringField
      FieldName = 'manu_part_number'
    end
    object cds1Canusepcs: TFloatField
      FieldName = 'Canusepcs'
      ReadOnly = True
    end
    object cds1CanUsePNL: TIntegerField
      FieldName = 'CanUsePNL'
      ReadOnly = True
    end
    object cds1dept_name: TStringField
      FieldName = 'dept_name'
      Size = 30
    end
    object cds1rkey06: TAutoIncField
      FieldName = 'rkey06'
      ReadOnly = True
    end
    object cds1Checked: TBooleanField
      FieldName = 'Checked'
    end
    object cds1PostPcs: TIntegerField
      FieldName = 'PostPcs'
    end
    object cds1PostPNL: TIntegerField
      FieldName = 'PostPNL'
    end
    object cds1PARTS_PER_PANEL: TFloatField
      FieldName = 'PARTS_PER_PANEL'
    end
  end
  object dsp1: TDataSetProvider
    DataSet = qry1
    Left = 312
    Top = 265
  end
  object qry1: TADOQuery
    Connection = dm1.con1
    Parameters = <
      item
        Name = 'p1'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @Checked bit,@PostPcs int,@PostPNL int'
      'set @Checked = 0'
      'set @PostPcs = 0'
      'set @PostPNL = 0'
      
        'select distinct top 100 @Checked as Checked, @PostPcs as PostPcs' +
        ',@PostPNL as PostPNL, d06.work_order_number,d25.manu_part_number' +
        ',d56.QTY_BACKLOG - isnull(d06.QUAN_ALLREJ,0) as Canusepcs,'
      
        'd56.panels- isnull(d06.QUAN_ALLPNL,0) as CanUsePNL,d34.dept_name' +
        ',d06.PARTS_PER_PANEL,'
      'd06.rkey as rkey06 from data0025 d25 '
      'inner join data0060 d60 on d25.rkey = d60.CUST_PART_PTR'
      'inner join data0006 d06 on d06.bom_ptr = d25.rkey'
      'inner join data0056 d56 on d56.wo_ptr = d06.rkey'
      'inner join data0034 d34 on d34.rkey = d56.dept_ptr'
      'left join data0006 d06_child on d06_child.from_wo_ptr = d06.rkey'
      
        'where (d56.QTY_BACKLOG - isnull(d06.QUAN_ALLREJ,0) > 0) and (d06' +
        '.PROD_STATUS = 5)'
      
        'and (d06.wtype not in (2,4)) and (isnull(d06_child.wtype,0) not ' +
        'in (2,4))'
      'and d25.manu_part_number like :p1'
      'order by d06.work_order_number asc')
    Left = 392
    Top = 265
    object qry1Checked: TBooleanField
      FieldName = 'Checked'
    end
    object qry1PostPcs: TIntegerField
      FieldName = 'PostPcs'
    end
    object qry1PostPNL: TIntegerField
      FieldName = 'PostPNL'
    end
    object qry1work_order_number: TStringField
      FieldName = 'work_order_number'
      Size = 22
    end
    object qry1manu_part_number: TStringField
      FieldName = 'manu_part_number'
    end
    object qry1Canusepcs: TFloatField
      FieldName = 'Canusepcs'
      ReadOnly = True
    end
    object qry1CanUsePNL: TIntegerField
      FieldName = 'CanUsePNL'
      ReadOnly = True
    end
    object qry1dept_name: TStringField
      FieldName = 'dept_name'
      Size = 30
    end
    object qry1PARTS_PER_PANEL: TFloatField
      FieldName = 'PARTS_PER_PANEL'
    end
    object qry1rkey06: TAutoIncField
      FieldName = 'rkey06'
      ReadOnly = True
    end
  end
end
