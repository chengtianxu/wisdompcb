object frmModi: TfrmModi
  Left = 451
  Top = 50
  Width = 1143
  Height = 716
  Caption = #32534#36753
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl19: TLabel
    Left = 34
    Top = 109
    Width = 21
    Height = 13
    Caption = 'lbl'
  end
  object lbl21: TLabel
    Left = 33
    Top = 132
    Width = 21
    Height = 13
    Caption = 'lbl'
  end
  object pnl2: TPanel
    Left = 0
    Top = 313
    Width = 1135
    Height = 331
    Align = alClient
    TabOrder = 0
    object dbgrdh_process: TDBGridEh
      Left = 1
      Top = 1
      Width = 232
      Height = 329
      Align = alLeft
      DataSource = ds_process
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -13
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      PopupMenu = pm_process
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = #24037#24207#20195#30721
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = #24037#24207#21517#31216
          Footers = <>
          Width = 136
        end>
    end
    object dbgrdh_prod: TDBGridEh
      Left = 233
      Top = 1
      Width = 544
      Height = 329
      Align = alClient
      DataSource = ds_materiel
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -13
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      PopupMenu = pm_prod
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = #26448#26009#32534#21495
          Footers = <>
          Width = 76
        end
        item
          EditButtons = <>
          FieldName = #26448#26009#21517#31216
          Footers = <>
          Width = 188
        end
        item
          EditButtons = <>
          FieldName = #24211#23384#21333#20301
          Footers = <>
          Width = 59
        end
        item
          EditButtons = <>
          FieldName = #37319#36141#21333#20301
          Footers = <>
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = #26631#20934#21333#20301#38754#31215
          Footers = <>
          Width = 86
        end
        item
          EditButtons = <>
          FieldName = #26631#20934#21333#20301#37325#37327
          Footers = <>
          Width = 84
        end>
    end
    object dbgrdh_man: TDBGridEh
      Left = 777
      Top = 1
      Width = 357
      Height = 329
      Align = alRight
      DataSource = ds_man
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -13
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      PopupMenu = pm_man
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = #24037#21495
          Footers = <>
          Width = 75
        end
        item
          EditButtons = <>
          FieldName = #22995#21517
          Footers = <>
          Width = 87
        end
        item
          EditButtons = <>
          FieldName = #30005#35805
          Footers = <>
          Visible = False
          Width = 144
        end>
    end
  end
  object pnl5: TPanel
    Left = 0
    Top = 644
    Width = 1135
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btn_save: TButton
      Left = 544
      Top = 5
      Width = 74
      Height = 33
      Caption = #20445#23384
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btn_saveClick
    end
    object btn_cancel: TButton
      Left = 904
      Top = 8
      Width = 57
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
      OnClick = btn_cancelClick
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 1135
    Height = 313
    Align = alTop
    TabOrder = 2
    object pnl6: TPanel
      Left = 1
      Top = 1
      Width = 1133
      Height = 104
      Align = alTop
      TabOrder = 0
      object lbl16: TLabel
        Left = 9
        Top = 12
        Width = 85
        Height = 13
        Caption = #26631#20934#21517#31216'/'#32534#30721
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lbl17: TLabel
        Left = 42
        Top = 34
        Width = 52
        Height = 13
        Caption = #25104#26412#20013#24515
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lbl34: TLabel
        Left = 66
        Top = 64
        Width = 26
        Height = 13
        Caption = #24037#21378
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lbl18: TLabel
        Left = 306
        Top = 8
        Width = 52
        Height = 13
        Caption = #29289#26009#24402#31867
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lbl29: TLabel
        Left = 303
        Top = 32
        Width = 52
        Height = 13
        Caption = #32791#29992#21333#20301
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lbl22: TLabel
        Left = 303
        Top = 54
        Width = 52
        Height = 13
        Caption = #35831#36141#21333#20301
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lbl20: TLabel
        Left = 316
        Top = 74
        Width = 39
        Height = 13
        Caption = #36716#25442#29575
      end
      object lbl26: TLabel
        Left = 570
        Top = 73
        Width = 33
        Height = 13
        Caption = #23646#24615'4'
      end
      object lbl25: TLabel
        Left = 570
        Top = 51
        Width = 33
        Height = 13
        Caption = #23646#24615'3'
      end
      object lbl24: TLabel
        Left = 570
        Top = 30
        Width = 33
        Height = 13
        Caption = #23646#24615'2'
      end
      object lbl23: TLabel
        Left = 570
        Top = 6
        Width = 33
        Height = 13
        Caption = #23646#24615'1'
      end
      object lbl27: TLabel
        Left = 873
        Top = 8
        Width = 26
        Height = 13
        Caption = #22791#27880
      end
      object lbl30: TLabel
        Left = 987
        Top = 55
        Width = 120
        Height = 26
        Caption = '('#25353#29983#20135#22240#32032#21644#13#10#25353#20844#24335#26102#24517#39035#36755#20837')'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 865
        Top = 46
        Width = 39
        Height = 13
        Caption = #39057#29575#22825
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lbl31: TLabel
        Left = 806
        Top = 67
        Width = 98
        Height = 26
        Caption = #27599#21315#24179#31859#21333#32791'/'#23454#13#10#38469#19982#29702#35770#27604#20363#20540
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object edt_factory: TEdit
        Left = 99
        Top = 60
        Width = 121
        Height = 21
        TabOrder = 0
      end
      object edt_Process: TEdit
        Left = 98
        Top = 30
        Width = 121
        Height = 21
        TabOrder = 1
      end
      object edt_name: TEdit
        Left = 98
        Top = 8
        Width = 121
        Height = 21
        TabOrder = 2
      end
      object btn_selProcess: TButton
        Left = 218
        Top = 29
        Width = 30
        Height = 21
        Caption = '...'
        TabOrder = 3
        OnClick = btn_selProcessClick
      end
      object btn_selWH: TButton
        Left = 219
        Top = 59
        Width = 30
        Height = 21
        Caption = '...'
        TabOrder = 4
        OnClick = btn_selWHClick
      end
      object edt_CRate: TEdit
        Left = 366
        Top = 67
        Width = 121
        Height = 21
        TabOrder = 5
      end
      object edt_PurUnit: TEdit
        Left = 366
        Top = 48
        Width = 121
        Height = 21
        TabOrder = 6
      end
      object edt_UseUnit: TEdit
        Left = 366
        Top = 26
        Width = 121
        Height = 21
        TabOrder = 7
      end
      object edt_MType: TEdit
        Left = 363
        Top = 4
        Width = 121
        Height = 21
        TabOrder = 8
      end
      object btn_MType: TButton
        Left = 483
        Top = 3
        Width = 30
        Height = 21
        Caption = '...'
        TabOrder = 9
        OnClick = btn_MTypeClick
      end
      object btn_SelUseUnit: TButton
        Left = 484
        Top = 26
        Width = 30
        Height = 21
        Caption = '...'
        TabOrder = 10
        OnClick = btn_SelUseUnitClick
      end
      object btn_SelPurUnit: TButton
        Left = 485
        Top = 48
        Width = 30
        Height = 20
        Caption = '...'
        TabOrder = 11
        OnClick = btn_SelPurUnitClick
      end
      object edt_property1: TEdit
        Left = 607
        Top = 2
        Width = 121
        Height = 21
        TabOrder = 12
      end
      object edt_property2: TEdit
        Left = 607
        Top = 24
        Width = 121
        Height = 21
        TabOrder = 13
      end
      object edt_property3: TEdit
        Left = 607
        Top = 46
        Width = 121
        Height = 21
        TabOrder = 14
      end
      object edt_property4: TEdit
        Left = 607
        Top = 67
        Width = 121
        Height = 21
        TabOrder = 15
      end
      object mmo1: TMemo
        Left = 910
        Top = 2
        Width = 184
        Height = 39
        Lines.Strings = (
          'mmo1')
        TabOrder = 16
      end
      object edt_Facday: TEdit
        Left = 909
        Top = 42
        Width = 74
        Height = 21
        TabOrder = 17
      end
      object edt_FacUse: TEdit
        Left = 909
        Top = 68
        Width = 73
        Height = 21
        TabOrder = 18
      end
    end
    object grp1: TGroupBox
      Left = 1
      Top = 105
      Width = 1133
      Height = 207
      Align = alClient
      Caption = #39046#26009#25511#21046#26631#20934
      TabOrder = 1
      object Label1: TLabel
        Left = 24
        Top = 45
        Width = 52
        Height = 13
        Caption = #21160#22240#21517#31216
      end
      object Label2: TLabel
        Left = 174
        Top = 45
        Width = 52
        Height = 13
        Caption = #21160#22240#21333#20301
      end
      object Label5: TLabel
        Left = 383
        Top = 42
        Width = 52
        Height = 13
        Caption = #20135#20986#21333#20301
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 603
        Top = 41
        Width = 39
        Height = 13
        Caption = #22791#27880#65306
      end
      object Label7: TLabel
        Left = 14
        Top = 62
        Width = 1134
        Height = 13
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------'
      end
      object lbl28: TLabel
        Left = 42
        Top = 94
        Width = 33
        Height = 13
        Caption = #20844#24335' '
      end
      object lbl38: TLabel
        Left = 14
        Top = 111
        Width = 1134
        Height = 13
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------'
      end
      object lbl11: TLabel
        Left = 16
        Top = 154
        Width = 91
        Height = 13
        Caption = #24403#26376#24635#21487#39046#29992#37327
      end
      object lbl15: TLabel
        Left = 236
        Top = 152
        Width = 26
        Height = 13
        Caption = #22791#27880
      end
      object Panel1: TPanel
        Left = 2
        Top = 192
        Width = 1129
        Height = 13
        Align = alBottom
        TabOrder = 0
        Visible = False
        object lbl1: TLabel
          Left = 24
          Top = 40
          Width = 52
          Height = 13
          Caption = #20445#20859#39057#29575
        end
        object lbl2: TLabel
          Left = 177
          Top = 40
          Width = 33
          Height = 13
          Caption = #22825'/'#27425
        end
        object lbl4: TLabel
          Left = 232
          Top = 40
          Width = 52
          Height = 13
          Caption = #21333#20301#32791#29992
        end
        object lbl3: TLabel
          Left = 382
          Top = 40
          Width = 33
          Height = 13
          Caption = #21319'/'#27425
        end
        object lbl5: TLabel
          Left = 456
          Top = 39
          Width = 26
          Height = 13
          Caption = #22791#27880
        end
        object lbl36: TLabel
          Left = 15
          Top = 56
          Width = 1134
          Height = 13
          Caption = 
            '----------------------------------------------------------------' +
            '----------------------------------------------------------------' +
            '----------------------------------'
        end
        object lbl6: TLabel
          Left = 24
          Top = 90
          Width = 52
          Height = 13
          Caption = #21592#24037#20154#25968
        end
        object lbl7: TLabel
          Left = 177
          Top = 90
          Width = 33
          Height = 13
          Caption = #20010'/'#29677
        end
        object lbl8: TLabel
          Left = 232
          Top = 90
          Width = 52
          Height = 13
          Caption = #21333#20301#32791#29992
        end
        object lbl9: TLabel
          Left = 382
          Top = 90
          Width = 53
          Height = 13
          Caption = #20010'/'#29677'/'#20154
        end
        object lbl10: TLabel
          Left = 456
          Top = 89
          Width = 26
          Height = 13
          Caption = #22791#27880
        end
        object lbl37: TLabel
          Left = 15
          Top = 104
          Width = 1134
          Height = 13
          Caption = 
            '----------------------------------------------------------------' +
            '----------------------------------------------------------------' +
            '----------------------------------'
        end
        object lbl13: TLabel
          Left = 232
          Top = 133
          Width = 52
          Height = 13
          Caption = #21333#20301#32791#29992
        end
        object lbl14: TLabel
          Left = 382
          Top = 133
          Width = 33
          Height = 13
          Caption = #21319'/'#27425
        end
        object chk_freq: TCheckBox
          Left = 15
          Top = 18
          Width = 97
          Height = 17
          Caption = #25353#20445#20859#39057#29575
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = chk_freqClick
        end
        object edt_freq: TEdit
          Left = 88
          Top = 35
          Width = 89
          Height = 21
          TabOrder = 1
          OnExit = edt_freqExit
        end
        object edt_FUse: TEdit
          Left = 288
          Top = 35
          Width = 89
          Height = 21
          TabOrder = 2
          OnExit = edt_FUseExit
        end
        object edt_Fremark: TEdit
          Left = 488
          Top = 32
          Width = 601
          Height = 21
          TabOrder = 3
          OnExit = edt_FremarkExit
        end
        object chk_MCount: TCheckBox
          Left = 7
          Top = 66
          Width = 97
          Height = 17
          Caption = #25353#21592#24037#20154#25968
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          OnClick = chk_MCountClick
        end
        object edt_Mcount: TEdit
          Left = 88
          Top = 85
          Width = 89
          Height = 21
          TabOrder = 5
          OnExit = edt_McountExit
        end
        object edt_MUse: TEdit
          Left = 288
          Top = 85
          Width = 89
          Height = 21
          TabOrder = 6
          OnExit = edt_MUseExit
        end
        object edt_Mremark: TEdit
          Left = 488
          Top = 84
          Width = 601
          Height = 21
          TabOrder = 7
          OnExit = edt_MremarkExit
        end
        object edt_TCont: TEdit
          Left = 288
          Top = 125
          Width = 89
          Height = 21
          TabOrder = 8
          OnExit = edt_TContExit
        end
      end
      object chk_fac: TCheckBox
        Left = 7
        Top = 24
        Width = 97
        Height = 17
        Caption = #25353#22240#32032
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = chk_facClick
      end
      object edt_FacName: TEdit
        Left = 79
        Top = 40
        Width = 76
        Height = 21
        TabOrder = 2
        OnExit = edt_FacNameExit
      end
      object edt_FacUnit: TEdit
        Left = 229
        Top = 41
        Width = 121
        Height = 21
        TabOrder = 3
        OnExit = edt_FacUnitExit
      end
      object btn_SelFacUnit: TButton
        Left = 325
        Top = 41
        Width = 29
        Height = 21
        Caption = '...'
        TabOrder = 4
        OnClick = btn_SelFacUnitClick
      end
      object edt_OUnit: TEdit
        Left = 438
        Top = 38
        Width = 121
        Height = 21
        TabOrder = 5
        OnExit = edt_OUnitExit
      end
      object btn_Sel: TButton
        Left = 538
        Top = 38
        Width = 30
        Height = 21
        Caption = '...'
        TabOrder = 6
        OnClick = btn_SelOUnitClick
      end
      object edt_facRemark: TEdit
        Left = 643
        Top = 36
        Width = 446
        Height = 21
        TabOrder = 7
        OnExit = edt_FacRemarkExit
      end
      object chk_format: TCheckBox
        Left = 7
        Top = 72
        Width = 97
        Height = 17
        Caption = #25353#20844#24335
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
        OnClick = chk_formatClick
      end
      object edt_Formula: TEdit
        Left = 74
        Top = 89
        Width = 121
        Height = 21
        TabOrder = 9
      end
      object btn_SelFormula: TButton
        Left = 195
        Top = 89
        Width = 29
        Height = 21
        Caption = '...'
        TabOrder = 10
        OnClick = btn_SelFormulaClick
      end
      object chk_time: TCheckBox
        Left = 7
        Top = 130
        Width = 97
        Height = 17
        Caption = #25353#22266#23450#26102#38388
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 11
        OnClick = chk_timeClick
      end
      object edt_Tuse: TEdit
        Left = 112
        Top = 149
        Width = 89
        Height = 21
        TabOrder = 12
        OnExit = edt_TuseExit
      end
      object edt_TRemark: TEdit
        Left = 268
        Top = 148
        Width = 601
        Height = 21
        TabOrder = 13
        OnExit = edt_TRemarkExit
      end
    end
  end
  object pm_process: TPopupMenu
    Left = 192
    Top = 433
    object N_addProcess: TMenuItem
      Caption = #26032#22686
      OnClick = N_addProcessClick
    end
    object N_DelProcess: TMenuItem
      Caption = #21024#38500
      OnClick = N_DelProcessClick
    end
  end
  object pm_man: TPopupMenu
    Left = 1048
    Top = 417
    object N_AddMan: TMenuItem
      Caption = #26032#22686
      OnClick = N_AddManClick
    end
    object N_DelMan: TMenuItem
      Caption = #21024#38500
      OnClick = N_DelManClick
    end
  end
  object pm_prod: TPopupMenu
    Left = 352
    Top = 449
    object N_AddMateriel: TMenuItem
      Caption = #26032#22686
      OnClick = N_AddMaterielClick
    end
    object N_DelMateriel: TMenuItem
      Caption = #21024#38500
      OnClick = N_DelMaterielClick
    end
  end
  object qry_process: TADOQuery
    Connection = DM.con1
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'control_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select a.* ,b.dept_code as '#24037#24207#20195#30721', b.dept_Name as '#24037#24207#21517#31216
      'from data0154 a'
      'left  join  data0034 b on a.Dept_ptr=b.rkey'
      'where a.control_ptr=   :control_ptr')
    Left = 66
    Top = 467
    object intgrfld_processcontrol_ptr: TIntegerField
      FieldName = 'control_ptr'
    end
    object intgrfld_processdept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object strngfld_processDSDesigner: TStringField
      FieldName = #24037#24207#20195#30721
      Size = 10
    end
    object strngfld_processDSDesigner2: TStringField
      FieldName = #24037#24207#21517#31216
      Size = 30
    end
  end
  object ds_process: TDataSource
    DataSet = qry_process
    Left = 146
    Top = 435
  end
  object qry_materiel: TADOQuery
    Connection = DM.con1
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'control_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select  a.*,b.Inv_part_number as  '#26448#26009#32534#21495', b.inv_Name as '#26448#26009#21517#31216',c.uni' +
        't_name as '#24211#23384#21333#20301', d.unit_name as '#37319#36141#21333#20301
      ',b.STOCK_SELL as '#26631#20934#21333#20301#38754#31215',STOCK_BASE as '#26631#20934#21333#20301#37325#37327
      'from data0155  a'
      'left join data0017 b   on a.invt_ptr=b.rkey '
      'left join data0002 c on b.STOCK_UNIT_PTR=c.rkey'
      'left join data0002 d on b.PURCH_UNIT_PTR=d.rkey'
      'where a.control_ptr= :control_ptr')
    Left = 554
    Top = 443
    object intgrfld_materielcontrol_ptr: TIntegerField
      FieldName = 'control_ptr'
    end
    object intgrfld_materielinvt_ptr: TIntegerField
      FieldName = 'invt_ptr'
    end
    object strngfld_materielDSDesigner: TStringField
      FieldName = #26448#26009#32534#21495
      Size = 25
    end
    object strngfld_materielDSDesigner2: TStringField
      FieldName = #26448#26009#21517#31216
      Size = 30
    end
    object strngfld_materielDSDesigner3: TStringField
      FieldName = #24211#23384#21333#20301
    end
    object strngfld_materielDSDesigner4: TStringField
      FieldName = #37319#36141#21333#20301
    end
    object fltfld_materielDSDesigner5: TFloatField
      FieldName = #26631#20934#21333#20301#38754#31215
    end
    object fltfld_materielDSDesigner6: TFloatField
      FieldName = #26631#20934#21333#20301#37325#37327
    end
  end
  object ds_materiel: TDataSource
    DataSet = qry_materiel
    Left = 554
    Top = 499
  end
  object qry_Man: TADOQuery
    Connection = DM.con1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey136'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select a.*,b.user_login_name as '#24037#21495',b.user_full_name  as '#22995#21517','
      'd05.phone '#30005#35805
      'from  data0139 a '
      'left join data0073  b  on a.csi_ptr=b.rkey'
      'INNER JOIN  dbo.Data0005  d05 ON b.EMPLOYEE_PTR = d05.RKEY '
      'where a.rkey136= :rkey136')
    Left = 970
    Top = 403
    object intgrfld_Manrkey136: TIntegerField
      FieldName = 'rkey136'
    end
    object intgrfld_Mancsi_ptr: TIntegerField
      FieldName = 'csi_ptr'
    end
    object strngfld_ManDSDesigner: TStringField
      FieldName = #24037#21495
      Size = 10
    end
    object strngfld_ManDSDesigner2: TStringField
      FieldName = #22995#21517
      Size = 16
    end
    object qry_ManDSDesigner: TStringField
      FieldName = #30005#35805
      Size = 14
    end
  end
  object ds_man: TDataSource
    DataSet = qry_Man
    Left = 1034
    Top = 491
  end
  object qry_main: TADOQuery
    Connection = DM.con1
    LockType = ltBatchOptimistic
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
      'select * from data0136   where rkey =  :rkey')
    Left = 272
    Top = 65
    object atncfld_mainrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object strngfld_maincontrol_name: TStringField
      FieldName = 'control_name'
      Size = 50
    end
    object intgrfld_mainunit_ptr: TIntegerField
      FieldName = 'unit_ptr'
    end
    object intgrfld_mainwarehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object bcdfld_mainstan_consume: TBCDField
      FieldName = 'stan_consume'
      Precision = 8
      Size = 2
    end
    object intgrfld_mainDeptId_P: TIntegerField
      FieldName = 'DeptId_P'
    end
    object intgrfld_mainPurUnit: TIntegerField
      FieldName = 'PurUnit'
    end
    object intgrfld_mainUseUnit: TIntegerField
      FieldName = 'UseUnit'
    end
    object intgrfld_mainCRate: TIntegerField
      FieldName = 'CRate'
    end
    object intgrfld_mainPGroupID: TIntegerField
      FieldName = 'PGroupID'
    end
    object strngfld_mainproperty: TStringField
      FieldName = 'property'
    end
    object strngfld_mainproperty2: TStringField
      FieldName = 'property2'
      Size = 30
    end
    object strngfld_mainproperty3: TStringField
      FieldName = 'property3'
      Size = 30
    end
    object strngfld_mainproperty4: TStringField
      FieldName = 'property4'
      Size = 30
    end
    object blnfld_mainIsfreq: TBooleanField
      FieldName = 'Isfreq'
    end
    object fltfld_mainFDays: TFloatField
      FieldName = 'FDays'
    end
    object fltfld_mainFAMountUsed: TFloatField
      FieldName = 'FAMountUsed'
    end
    object strngfld_mainFRemark: TStringField
      FieldName = 'FRemark'
      Size = 500
    end
    object blnfld_mainIsMCount: TBooleanField
      FieldName = 'IsMCount'
    end
    object intgrfld_mainMCount: TIntegerField
      FieldName = 'MCount'
    end
    object fltfld_mainMUsed: TFloatField
      FieldName = 'MUsed'
    end
    object strngfld_mainMRemark: TStringField
      FieldName = 'MRemark'
      Size = 500
    end
    object blnfld_mainIsSTime: TBooleanField
      FieldName = 'IsSTime'
    end
    object intgrfld_mainTCount: TIntegerField
      FieldName = 'TCount'
    end
    object fltfld_mainTUsed: TFloatField
      FieldName = 'TUsed'
    end
    object strngfld_mainTRemark: TStringField
      FieldName = 'TRemark'
      Size = 500
    end
    object blnfld_mainIsFactor: TBooleanField
      FieldName = 'IsFactor'
    end
    object strngfld_mainFacName: TStringField
      FieldName = 'FacName'
    end
    object strngfld_mainFacRemark: TStringField
      FieldName = 'FacRemark'
      Size = 500
    end
    object strngfld_mainremark: TStringField
      FieldName = 'remark'
      Size = 500
    end
    object intgrfld_mainFac_unit: TIntegerField
      FieldName = 'Fac_unit'
    end
    object intgrfld_mainFacDay: TIntegerField
      FieldName = 'FacDay'
    end
    object blnfld_mainIsFormula: TBooleanField
      FieldName = 'IsFormula'
    end
    object strngfld_mainFormula_ptr: TStringField
      FieldName = 'Formula_ptr'
    end
  end
  object qry_processSave: TADOQuery
    Connection = DM.con1
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select  * From data0154 where 1=2')
    Left = 24
    Top = 449
    object intgrfld_processSavecontrol_ptr: TIntegerField
      FieldName = 'control_ptr'
    end
    object intgrfld_processSavedept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
  end
  object qry_MaterielSave: TADOQuery
    Connection = DM.con1
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select  * From data0155 where 1=2')
    Left = 448
    Top = 473
    object intgrfld_MaterielSavecontrol_ptr: TIntegerField
      FieldName = 'control_ptr'
    end
    object intgrfld_MaterielSaveinvt_ptr: TIntegerField
      FieldName = 'invt_ptr'
    end
  end
  object qry_ManSave: TADOQuery
    Connection = DM.con1
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select  * From data0139 where 1=2')
    Left = 888
    Top = 409
    object intgrfld_ManSaverkey136: TIntegerField
      FieldName = 'rkey136'
    end
    object intgrfld_ManSavecsi_ptr: TIntegerField
      FieldName = 'csi_ptr'
    end
  end
end
