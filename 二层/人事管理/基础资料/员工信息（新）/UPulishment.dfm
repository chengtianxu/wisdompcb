object frmPulishment: TfrmPulishment
  Left = 294
  Top = 186
  Width = 1119
  Height = 563
  Caption = #22870#24809#26126#32454
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 1103
    Height = 525
    Align = alClient
    TabOrder = 0
    object pnl2: TPanel
      Left = 1
      Top = 1
      Width = 1101
      Height = 80
      Align = alTop
      TabOrder = 0
      object lbl13: TLabel
        Left = 32
        Top = 48
        Width = 36
        Height = 13
        Caption = #32844#21153#65306
      end
      object lbl1: TLabel
        Left = 32
        Top = 8
        Width = 36
        Height = 13
        Caption = #24037#21495#65306
      end
      object lbl3: TLabel
        Left = 147
        Top = 8
        Width = 36
        Height = 13
        Caption = #22995#21517#65306
      end
      object lbl17: TLabel
        Left = 152
        Top = 48
        Width = 60
        Height = 13
        Caption = #21512#21516#31867#22411#65306
      end
      object lbl5: TLabel
        Left = 275
        Top = 8
        Width = 36
        Height = 13
        Caption = #37096#38376#65306
      end
      object lbl11: TLabel
        Left = 395
        Top = 8
        Width = 60
        Height = 13
        Caption = #20837#32844#26085#26399#65306
      end
      object dbtxt1: TDBText
        Left = 72
        Top = 6
        Width = 65
        Height = 17
        DataField = #24037#21495
        DataSource = ds1
      end
      object dbtxt2: TDBText
        Left = 184
        Top = 8
        Width = 65
        Height = 17
        DataField = #22995#21517
        DataSource = ds1
      end
      object dbtxt3: TDBText
        Left = 312
        Top = 8
        Width = 65
        Height = 17
        DataField = #37096#38376
        DataSource = ds1
      end
      object dbtxt4: TDBText
        Left = 472
        Top = 8
        Width = 65
        Height = 17
        DataField = #20837#32844#26085#26399
        DataSource = ds1
      end
      object dbtxt5: TDBText
        Left = 72
        Top = 48
        Width = 65
        Height = 17
        DataField = #32844#21153
        DataSource = ds1
      end
      object dbtxt6: TDBText
        Left = 232
        Top = 48
        Width = 65
        Height = 17
        DataField = #21512#21516#31867#22411
        DataSource = ds1
      end
    end
    object pnl3: TPanel
      Left = 1
      Top = 81
      Width = 1101
      Height = 443
      Align = alClient
      TabOrder = 1
      object dbgrdh1: TDBGridEh
        Left = 1
        Top = 1
        Width = 1099
        Height = 441
        Align = alClient
        DataSource = ds1
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            EditButtons = <>
            FieldName = 'id'
            Footers = <>
            Width = 36
          end
          item
            EditButtons = <>
            FieldName = #24037#21495
            Footers = <>
            Width = 54
          end
          item
            EditButtons = <>
            FieldName = #22995#21517
            Footers = <>
            Width = 73
          end
          item
            EditButtons = <>
            FieldName = #20837#32844#26085#26399
            Footers = <>
            Width = 68
          end
          item
            EditButtons = <>
            FieldName = #37096#38376
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #32844#21153
            Footers = <>
            Width = 69
          end
          item
            EditButtons = <>
            FieldName = #21512#21516#31867#22411
            Footers = <>
            Width = 65
          end
          item
            EditButtons = <>
            FieldName = #26085#26399
            Footers = <>
            Width = 77
          end
          item
            EditButtons = <>
            FieldName = #22870#24809#31867#22411
            Footers = <>
            Width = 81
          end
          item
            EditButtons = <>
            FieldName = #37329#39069
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #21407#22240
            Footers = <>
          end>
      end
    end
  end
  object qry1: TADOQuery
    Connection = FDM.con1
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select msg.rkey as id,msg.employeecode as '#24037#21495',msg.chinesename '#22995#21517',' +
        'msg.ondutytime '#20837#32844#26085#26399','
      'dept.departmentname '#37096#38376', pdet.item as '#32844#21153' ,hdet.item as '#21512#21516#31867#22411','
      'p.effectdate '#26085#26399',df.item   '#22870#24809#31867#22411', p.money '#37329#39069',p.remark '#21407#22240
      'FROM   employeemsg AS msg'
      
        'left  join  employee_rewards_punishment AS p ON msg.rkey = p.emp' +
        'loyeeid  '
      'LEFT  JOIN datadetail AS mdet ON mdet.rkey = msg.Rank '
      'LEFT  JOIN  datadetail AS pdet ON pdet.rkey = msg.Position '
      'LEFT  JOIN datadetail AS hdet ON hdet.rkey = msg.employ_type '
      
        'LEFT  JOIN datadepartment AS dept ON dept.rkey = msg.departmenti' +
        'd '
      'left join datadetail as df on df.rkey=p.type'
      'where (1=1) and msg.rkey=:rkey ')
    Left = 337
    Top = 201
    object atncfldqry1id: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object wdstrngfldqry1DSDesigner: TWideStringField
      FieldName = #24037#21495
    end
    object wdstrngfldqry1DSDesigner2: TWideStringField
      FieldName = #22995#21517
    end
    object dtmfldqry1DSDesigner3: TDateTimeField
      FieldName = #20837#32844#26085#26399
    end
    object wdstrngfldqry1DSDesigner4: TWideStringField
      FieldName = #37096#38376
    end
    object wdstrngfldqry1DSDesigner5: TWideStringField
      FieldName = #32844#21153
      Size = 50
    end
    object dtmfldqry1DSDesigner7: TDateTimeField
      FieldName = #26085#26399
    end
    object wdstrngfldqry1DSDesigner8: TWideStringField
      FieldName = #22870#24809#31867#22411
      Size = 50
    end
    object fltfldqry1DSDesigner9: TFloatField
      FieldName = #37329#39069
    end
    object wdstrngfldqry1DSDesigner10: TWideStringField
      FieldName = #21407#22240
      Size = 200
    end
    object wdstrngfldqry1DSDesigner1: TWideStringField
      FieldName = #21512#21516#31867#22411
      Size = 50
    end
  end
  object ds1: TDataSource
    DataSet = qry1
    Left = 449
    Top = 201
  end
end
