object FrmEmpChange: TFrmEmpChange
  Left = 173
  Top = 251
  Width = 748
  Height = 394
  Caption = 'FrmEmpChange'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 740
    Height = 81
    Align = alTop
    Caption = #24403#21069#20449#24687#27010#35272
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object DBText1: TDBText
      Left = 55
      Top = 24
      Width = 59
      Height = 17
      DataField = 'employeecode'
      DataSource = DM.DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object DBText2: TDBText
      Left = 184
      Top = 24
      Width = 65
      Height = 17
      DataField = 'chinesename'
      DataSource = DM.DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object DBText3: TDBText
      Left = 507
      Top = 24
      Width = 44
      Height = 17
      DataField = 'sextext'
      DataSource = DM.DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object DBText4: TDBText
      Left = 339
      Top = 24
      Width = 100
      Height = 17
      DataField = 'departmentname'
      DataSource = DM.DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object DBText5: TDBText
      Left = 55
      Top = 56
      Width = 65
      Height = 17
      DataField = 'Positionitem'
      DataSource = DM.DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object DBText6: TDBText
      Left = 184
      Top = 56
      Width = 65
      Height = 17
      DataField = 'Rankitem'
      DataSource = DM.DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object DBText7: TDBText
      Left = 653
      Top = 24
      Width = 76
      Height = 17
      DataField = 'ondutytime'
      DataSource = DM.DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 36
      Height = 12
      Caption = #24037#21495#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 144
      Top = 24
      Width = 36
      Height = 12
      Caption = #22995#21517#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 302
      Top = 24
      Width = 36
      Height = 12
      Caption = #37096#38376#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 470
      Top = 24
      Width = 36
      Height = 12
      Caption = #24615#21035#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 592
      Top = 24
      Width = 60
      Height = 12
      Caption = #20837#32844#26085#26399#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 16
      Top = 56
      Width = 36
      Height = 12
      Caption = #32844#21153#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 144
      Top = 56
      Width = 36
      Height = 12
      Caption = #32844#32423#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 278
      Top = 56
      Width = 60
      Height = 12
      Caption = #21512#21516#31867#22411#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object DBText9: TDBText
      Left = 339
      Top = 56
      Width = 134
      Height = 17
      DataField = 'employ_typeitem'
      DataSource = DM.DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 81
    Width = 740
    Height = 286
    Align = alClient
    Caption = #21464#21160#35760#24405#26126#32454
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object DBGridEh1: TDBGridEh
      Left = 2
      Top = 15
      Width = 736
      Height = 269
      Align = alClient
      DataSource = DataSource1
      FooterColor = clWindow
      FooterFont.Charset = GB2312_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -13
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      UseMultiTitle = True
      Columns = <
        item
          EditButtons = <>
          FieldName = 'orginal_employeecode'
          Footers = <>
          Title.Caption = #21464#21160#21069#20449#24687'|'#24037#21495
          Width = 58
        end
        item
          EditButtons = <>
          FieldName = 'odepartmentname'
          Footers = <>
          Title.Caption = #21464#21160#21069#20449#24687'|'#37096#38376
          Width = 84
        end
        item
          EditButtons = <>
          FieldName = 'oposition'
          Footers = <>
          Title.Caption = #21464#21160#21069#20449#24687'|'#32844#21153
          Width = 56
        end
        item
          EditButtons = <>
          FieldName = 'orank'
          Footers = <>
          Title.Caption = #21464#21160#21069#20449#24687'|'#32844#32423
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'ohtype'
          Footers = <>
          Title.Caption = #21464#21160#21069#20449#24687'|'#21512#21516#31867#22411
          Width = 67
        end
        item
          EditButtons = <>
          FieldName = 'ttype'
          Footers = <>
          Title.Caption = #21464#21160#31867#22411
          Width = 76
        end
        item
          EditButtons = <>
          FieldName = 'alterdate'
          Footers = <>
          Title.Caption = #21464#21160#26102#38388
          Width = 67
        end
        item
          EditButtons = <>
          FieldName = 'new_employeecode'
          Footers = <>
          Title.Caption = #21464#21160#21518#20449#24687'|'#24037#21495
          Width = 57
        end
        item
          EditButtons = <>
          FieldName = 'ndepartmentname'
          Footers = <>
          Title.Caption = #21464#21160#21518#20449#24687'|'#37096#38376
          Width = 81
        end
        item
          EditButtons = <>
          FieldName = 'nposition'
          Footers = <>
          Title.Caption = #21464#21160#21518#20449#24687'|'#32844#21153
          Width = 59
        end
        item
          EditButtons = <>
          FieldName = 'nrank'
          Footers = <>
          Title.Caption = #21464#21160#21518#20449#24687'|'#32844#32423
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'nhtype'
          Footers = <>
          Title.Caption = #21464#21160#21518#20449#24687'|'#21512#21516#31867#22411
          Width = 66
        end
        item
          EditButtons = <>
          FieldName = 'EMPLOYEE_NAME'
          Footers = <>
          Title.Caption = #25805#20316#20154
          Width = 57
        end
        item
          EditButtons = <>
          FieldName = 'oper_date'
          Footers = <>
          Title.Caption = #25805#20316#26102#38388
          Width = 75
        end
        item
          EditButtons = <>
          FieldName = 'remark'
          Footers = <>
          Title.Caption = #22791#27880
          Width = 97
        end>
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 264
    Top = 185
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    LockType = ltReadOnly
    Parameters = <>
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
        'me, msg.employeecode, msg.ondutytime, msg.employ_type, '
      
        'msg.sex, msg.outdutytime,mdet.item AS rank, rdet.item AS rreason' +
        ', tdet.item AS ttype, pdet.item AS pposition, '
      
        'tdet.dictid, npdet.item AS nposition, opdet.item AS oposition, n' +
        'hdet.item AS nhtype, ohdet.item AS ohtype, hdet.item AS phtype, ' +
        'npdetr.item AS nrank, '
      
        'opdetr.item AS orank, dept.departmentname, ndept.departmentname ' +
        'AS ndepartmentname, odept.departmentname AS odepartmentname, '
      
        '(CASE msg.sex WHEN 0 THEN '#39#22899#39' WHEN 1 THEN '#39#30007#39' ELSE '#39#20854#23427#39' END) AS ' +
        'sexy, alt.remark'
      'FROM employee_alteration AS alt LEFT OUTER JOIN'
      'Data0005 ON Data0005.RKEY = alt.oper_person LEFT OUTER JOIN'
      'employeemsg AS msg ON msg.rkey = alt.employeeid LEFT OUTER JOIN'
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
      'where (1=1)')
    Left = 200
    Top = 185
    object ADOQuery1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery1employeeid: TIntegerField
      FieldName = 'employeeid'
    end
    object ADOQuery1type: TIntegerField
      FieldName = 'type'
    end
    object ADOQuery1reason: TIntegerField
      FieldName = 'reason'
    end
    object ADOQuery1alterdate: TDateTimeField
      FieldName = 'alterdate'
    end
    object ADOQuery1orginal_employeecode: TWideStringField
      FieldName = 'orginal_employeecode'
    end
    object ADOQuery1orginal_departmentid: TIntegerField
      FieldName = 'orginal_departmentid'
    end
    object ADOQuery1orginal_position: TIntegerField
      FieldName = 'orginal_position'
    end
    object ADOQuery1orginal_employ_type: TIntegerField
      FieldName = 'orginal_employ_type'
    end
    object ADOQuery1orginal_politics_face: TIntegerField
      FieldName = 'orginal_politics_face'
    end
    object ADOQuery1orginal_education: TIntegerField
      FieldName = 'orginal_education'
    end
    object ADOQuery1orginal_marriage: TIntegerField
      FieldName = 'orginal_marriage'
    end
    object ADOQuery1orginal_rank: TIntegerField
      FieldName = 'orginal_rank'
    end
    object ADOQuery1new_employeecode: TWideStringField
      FieldName = 'new_employeecode'
    end
    object ADOQuery1new_departmentid: TIntegerField
      FieldName = 'new_departmentid'
    end
    object ADOQuery1new_position: TIntegerField
      FieldName = 'new_position'
    end
    object ADOQuery1new_employ_type: TIntegerField
      FieldName = 'new_employ_type'
    end
    object ADOQuery1new_politics_face: TIntegerField
      FieldName = 'new_politics_face'
    end
    object ADOQuery1new_education: TIntegerField
      FieldName = 'new_education'
    end
    object ADOQuery1new_marriage: TIntegerField
      FieldName = 'new_marriage'
    end
    object ADOQuery1new_rank: TIntegerField
      FieldName = 'new_rank'
    end
    object ADOQuery1oper_date: TDateTimeField
      FieldName = 'oper_date'
    end
    object ADOQuery1active: TIntegerField
      FieldName = 'active'
    end
    object ADOQuery1EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADOQuery1chinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object ADOQuery1employeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object ADOQuery1ondutytime: TDateTimeField
      FieldName = 'ondutytime'
    end
    object ADOQuery1employ_type: TIntegerField
      FieldName = 'employ_type'
    end
    object ADOQuery1sex: TIntegerField
      FieldName = 'sex'
    end
    object ADOQuery1outdutytime: TDateTimeField
      FieldName = 'outdutytime'
    end
    object ADOQuery1rank: TWideStringField
      FieldName = 'rank'
    end
    object ADOQuery1rreason: TWideStringField
      FieldName = 'rreason'
    end
    object ADOQuery1ttype: TWideStringField
      FieldName = 'ttype'
    end
    object ADOQuery1pposition: TWideStringField
      FieldName = 'pposition'
    end
    object ADOQuery1dictid: TIntegerField
      FieldName = 'dictid'
    end
    object ADOQuery1nposition: TWideStringField
      FieldName = 'nposition'
    end
    object ADOQuery1oposition: TWideStringField
      FieldName = 'oposition'
    end
    object ADOQuery1nhtype: TWideStringField
      FieldName = 'nhtype'
    end
    object ADOQuery1ohtype: TWideStringField
      FieldName = 'ohtype'
    end
    object ADOQuery1phtype: TWideStringField
      FieldName = 'phtype'
    end
    object ADOQuery1nrank: TWideStringField
      FieldName = 'nrank'
    end
    object ADOQuery1orank: TWideStringField
      FieldName = 'orank'
    end
    object ADOQuery1departmentname: TWideStringField
      FieldName = 'departmentname'
    end
    object ADOQuery1ndepartmentname: TWideStringField
      FieldName = 'ndepartmentname'
    end
    object ADOQuery1odepartmentname: TWideStringField
      FieldName = 'odepartmentname'
    end
    object ADOQuery1sexy: TStringField
      FieldName = 'sexy'
      ReadOnly = True
      Size = 4
    end
    object ADOQuery1remark: TWideStringField
      FieldName = 'remark'
      Size = 80
    end
  end
end
