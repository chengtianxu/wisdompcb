object FrmEmpChange: TFrmEmpChange
  Left = 335
  Top = 187
  Width = 1025
  Height = 480
  Caption = #24322#21160#26126#32454
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl7: TLabel
    Left = 224
    Top = 8
    Width = 16
    Height = 13
    Caption = 'lbl1'
  end
  object lbl8: TLabel
    Left = 248
    Top = 8
    Width = 16
    Height = 13
    Caption = 'lbl1'
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 1017
    Height = 81
    Align = alTop
    TabOrder = 0
    object lbl1: TLabel
      Left = 32
      Top = 8
      Width = 36
      Height = 13
      Caption = #24037#21495#65306
    end
    object lbl_EmpCode: TLabel
      Left = 72
      Top = 8
      Width = 24
      Height = 11
      Caption = 'lbl1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object lbl3: TLabel
      Left = 147
      Top = 8
      Width = 36
      Height = 13
      Caption = #22995#21517#65306
    end
    object lbl_EmpName: TLabel
      Left = 187
      Top = 8
      Width = 24
      Height = 11
      Caption = 'lbl1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object lbl5: TLabel
      Left = 275
      Top = 8
      Width = 36
      Height = 13
      Caption = #37096#38376#65306
    end
    object lbl_Dep: TLabel
      Left = 315
      Top = 8
      Width = 24
      Height = 11
      Caption = 'lbl1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object lbl9: TLabel
      Left = 395
      Top = 8
      Width = 36
      Height = 13
      Caption = #24615#21035#65306
    end
    object lbl_sex: TLabel
      Left = 435
      Top = 8
      Width = 24
      Height = 11
      Caption = 'lbl1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object lbl11: TLabel
      Left = 499
      Top = 8
      Width = 60
      Height = 13
      Caption = #20837#32844#26085#26399#65306
    end
    object lbl_InDate: TLabel
      Left = 566
      Top = 8
      Width = 24
      Height = 11
      Caption = 'lbl1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object lbl13: TLabel
      Left = 32
      Top = 48
      Width = 36
      Height = 13
      Caption = #32844#21153#65306
    end
    object lbl_Position: TLabel
      Left = 72
      Top = 48
      Width = 24
      Height = 11
      Caption = 'lbl1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object lbl15: TLabel
      Left = 148
      Top = 48
      Width = 36
      Height = 13
      Caption = #32844#32423#65306
    end
    object lbl_Rank: TLabel
      Left = 192
      Top = 48
      Width = 24
      Height = 11
      Caption = 'lbl1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object lbl17: TLabel
      Left = 256
      Top = 48
      Width = 60
      Height = 13
      Caption = #21512#21516#31867#22411#65306
    end
    object lbl_type: TLabel
      Left = 329
      Top = 48
      Width = 24
      Height = 11
      Caption = 'lbl1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 81
    Width = 1017
    Height = 372
    Align = alClient
    TabOrder = 1
    object dbgrdh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 1015
      Height = 370
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
      UseMultiTitle = True
      Columns = <
        item
          EditButtons = <>
          FieldName = 'orginal_employeecode'
          Footers = <>
          Title.Caption = #21464#21160#21069#20449#24687'|'#24037#21495
          Width = 55
        end
        item
          EditButtons = <>
          FieldName = 'odepartmentname'
          Footers = <>
          Title.Caption = #21464#21160#21069#20449#24687'|'#37096#38376
          Width = 117
        end
        item
          EditButtons = <>
          FieldName = 'oposition'
          Footers = <>
          Title.Caption = #21464#21160#21069#20449#24687'|'#32844#21153
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'orank'
          Footers = <>
          Title.Caption = #21464#21160#21069#20449#24687'|'#32844#32423
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'ohtype'
          Footers = <>
          Title.Caption = #21464#21160#21069#20449#24687'|'#21512#21516#31867#22411
          Width = 94
        end
        item
          EditButtons = <>
          FieldName = 'oper_date'
          Footers = <>
          Title.Caption = #25805#20316#26102#38388
        end
        item
          EditButtons = <>
          FieldName = 'ttype'
          Footers = <>
          Title.Caption = #24322#21160#31867#22411
          Width = 91
        end
        item
          EditButtons = <>
          FieldName = 'new_employeecode'
          Footers = <>
          Title.Caption = #21464#21160#21518#20449#24687'|'#24037#21495
          Width = 67
        end
        item
          EditButtons = <>
          FieldName = 'ndepartmentname'
          Footers = <>
          Title.Caption = #21464#21160#21518#20449#24687'|'#37096#38376
        end
        item
          EditButtons = <>
          FieldName = 'nposition'
          Footers = <>
          Title.Caption = #21464#21160#21518#20449#24687'|'#32844#21153
          Width = 74
        end
        item
          EditButtons = <>
          FieldName = 'nrank'
          Footers = <>
          Title.Caption = #21464#21160#21518#20449#24687'|'#32844#32423
          Width = 84
        end
        item
          EditButtons = <>
          FieldName = 'nhtype'
          Footers = <>
          Title.Caption = #21464#21160#21518#20449#24687'|'#21512#21516#31867#22411
          Width = 95
        end
        item
          EditButtons = <>
          FieldName = 'EMPLOYEE_NAME'
          Footers = <>
          Title.Caption = #25805#20316#20154
          Width = 82
        end
        item
          EditButtons = <>
          FieldName = 'alterdate'
          Footers = <>
          Title.Caption = #24322#21160#26102#38388
          Width = 76
        end
        item
          EditButtons = <>
          FieldName = 'remark'
          Footers = <>
          Title.Caption = #22791#27880
          Width = 202
        end>
    end
  end
  object qry_EmpChange: TADOQuery
    Connection = FDM.con1
    CursorType = ctStatic
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
      
        'SELECT  alt.rkey, alt.employeeid, alt.type, alt.reason, alt.alte' +
        'rdate, alt.orginal_employeecode, alt.orginal_departmentid, alt.o' +
        'rginal_position,'
      
        'alt.orginal_employ_type, alt.orginal_politics_face, alt.orginal_' +
        'education, alt.orginal_marriage, alt.orginal_rank, alt.new_emplo' +
        'yeecode, '
      
        'alt.new_departmentid, alt.new_position, alt.new_employ_type, alt' +
        '.new_politics_face, alt.new_education, alt.new_marriage, alt.new' +
        '_rank, '
      
        'alt.oper_date, alt.active, Data0005.EMPLOYEE_NAME, msg.chinesena' +
        'me, msg.employeecode, msg.ondutytime, msg.employ_type,msg.positi' +
        'on ,'
      
        'msg.sex, msg.outdutytime,mdet.item AS rank, rdet.item AS rreason' +
        ', tdet.item AS ttype, pdet.item AS pposition, '
      
        'tdet.dictid, npdet.item AS nposition, opdet.item AS oposition, n' +
        'hdet.item AS nhtype, ohdet.item AS ohtype, hdet.item AS phtype, ' +
        'npdetr.item AS nrank, '
      
        'opdetr.item AS orank, dept.departmentname, ndept.departmentname ' +
        'AS ndepartmentname, odept.departmentname AS odepartmentname, '
      
        '(CASE msg.sex WHEN 0 THEN '#39#22899#39' WHEN 1 THEN '#39#30007#39' ELSE '#39#20854#23427#39' END) AS ' +
        'sexy, alt.remark'
      'FROM   employeemsg AS msg'
      
        'left join  employee_alteration AS alt ON msg.rkey = alt.employee' +
        'id   LEFT OUTER JOIN'
      'Data0005 ON Data0005.RKEY = alt.oper_person LEFT OUTER JOIN'
      'datadetail AS mdet ON mdet.rkey = msg.Rank LEFT OUTER JOIN'
      'datadetail AS rdet ON rdet.rkey = alt.reason LEFT OUTER JOIN'
      'datadetail AS tdet ON tdet.rkey = alt.type LEFT OUTER JOIN'
      'datadetail AS pdet ON pdet.rkey = msg.Position LEFT OUTER JOIN'
      
        'datadetail AS npdet ON npdet.rkey = alt.new_position LEFT OUTER ' +
        'JOIN'
      
        'datadetail AS opdet ON opdet.rkey = alt.orginal_position LEFT OU' +
        'TER JOIN'
      
        'datadetail AS npdetr ON npdetr.rkey = alt.new_rank LEFT OUTER JO' +
        'IN'
      
        'datadetail AS opdetr ON opdetr.rkey = alt.orginal_rank LEFT OUTE' +
        'R JOIN'
      
        'datadetail AS hdet ON hdet.rkey = msg.employ_type LEFT OUTER JOI' +
        'N'
      
        'datadetail AS nhdet ON nhdet.rkey = alt.new_employ_type LEFT OUT' +
        'ER JOIN'
      
        'datadetail AS ohdet ON ohdet.rkey = alt.orginal_employ_type LEFT' +
        ' OUTER JOIN'
      
        'datadepartment AS dept ON dept.rkey = msg.departmentid LEFT OUTE' +
        'R JOIN'
      
        'datadepartment AS ndept ON ndept.rkey = alt.new_departmentid LEF' +
        'T OUTER JOIN'
      'datadepartment AS odept ON odept.rkey = alt.orginal_departmentid'
      'where (1=1) and msg.rkey=:rkey')
    Left = 832
    Top = 16
  end
  object ds1: TDataSource
    DataSet = qry_EmpChange
    Left = 920
    Top = 16
  end
end
