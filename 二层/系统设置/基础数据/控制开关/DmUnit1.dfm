object DM: TDM
  OldCreateOrder = False
  Left = 308
  Top = 336
  Height = 238
  Width = 236
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'FILE NAME=C:\Program Files\Common Files\System\Ole DB\Data Links' +
      '\bak.udl'
    KeepConnection = False
    LoginPrompt = False
    Provider = 'C:\Program Files\Common Files\System\Ole DB\Data Links\bak.udl'
    Left = 32
    Top = 16
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select --192'#25511#21046#24320#20851#23383#27573#35828#26126
      '--'#24066#22330
      'rkey,'
      'aptaxontax,--char(1)Y/N  '#37327#20135#26495#38656#35201#25552#20132#35780#23457
      'artaxontax, --char(1)Y/N  '#26679#26495#38656#35201#25552#20132#35780#23457
      'ppc_control15,--tinyint  (1'#26159'0'#21542')'#35780#23457#21069#26816#26597#26159#21542#38656#35201#36716#21378#30830#35748
      'custcitool,--char(1) (Y/N)'#35746#21333#36755#20837#26102#20801#35768#20197'SET'#36755#20837
      'custciprod,--char(1) (Y/N)'#26087#29256#26412#19979#21333#21518#33258#21160#36807#26399
      'suplcimat,  --char(1) (Y/N)'#26679#21697#22791#21697#20197#22806#30340#21333#20215#21487#20197#20026#38646
      'custciship,--char(1) (Y/N)'#35746#21333#36755#20837#19981#21487#20197#26356#25913#36135#24065
      'suplcimisc,--char(1) (Y/N)'#35746#21333#35201#27714#19994#21153#21592#33258#24049#30830#35748
      'CUSTCOTOOL,--char(1) (Y/N)'#20801#35768#19968#20010#20135#21697#38144#21806#32473#22810#20010#23458#25143
      'CUSTSTATOOL, --(Y/N)'#26412#21378#32534#21495#20013#21253#25324#23458#25143#35782#21035#30721
      'CUSTSTASHIP,  -- (Y/N)'#26412#21378#32534#21495#20013#27969#27700#21495#22312#21069
      'QTE_CONTROL1, --(0,1)'#25253#20215#31995#32479#25240#29575#35745#31639#26041#27861
      'CUSTSTAPROD, --char(1)(Y/N)'#35746#21333#36755#20837#37319#29992#23458#25143#31561#32423#39069#24230#25511#21046
      '--'#24037#31243
      'ENG_CONTROL1,-- tinyint  '#24037#31243#23457#26680#21069#26159#21542#38656#35201#24037#31243#26816#26597',0'#19981#38656#35201'1'#38656#35201
      'ENG_CONTROL2,-- tinyint  '#26159#21542#26174#31034#20026#31354#30340#21046#31243#21442#25968#22312'MI'#19978',0'#26174#31034'1'#19981#26174#31034
      'ENG_CONTROL16,-- tinyint '#26159#21542#26174#31034#20026#31354#30340#20840#23616#21442#25968#22312'MI'#21644'WO'#19978',0'#26174#31034'1'#19981#26174#31034
      'PPC_CONTROL9,-- tinyint  '#26159#21542#26174#31034#20026#31354#30340#21046#31243#21442#25968#22312'WO'#19978',0'#26174#31034'1'#19981#26174#31034
      'ENG_AUDIT_FLAG,  --char(1)'#24037#31243#21462#28040#23457#26680#20801#35768#19981#26159#21407#23457#26680#20154'Y/N'
      ''
      'cut_l1_max,--  numeric(7,1) A'#26495#24320#26009#36793#38271#19978#38480
      'cut_l1_min,--  numeric(7,1) A'#26495#24320#26009#36793#38271#19979#38480
      'cut_w1_max,--  numeric(7,1) A'#26495#24320#26009#36793#23485#19978#38480
      'cut_w1_min,--  numeric(7,1) A'#26495#24320#26009#36793#23485#19979#38480
      ''
      'cut_l2_max,--  numeric(7,1)  B'#26495#24320#26009#36793#38271#19978#38480
      'cut_l2_min,--  numeric(7,1) B'#26495#24320#26009#36793#38271#19979#38480
      'cut_w2_max,--  numeric(7,1) B'#26495#24320#26009#36793#23485#19978#38480
      'cut_w2_min,--  numeric(7,1) B'#26495#24320#26009#36793#23485#19979#38480
      ''
      'space_l_min,-- numeric(7,1)  '#25340#29256#21333#20803#38271#36793#38388#36317
      'space_w_min,-- numeric(7,1)  '#25340#29256#21333#20803#23485#36793#38388#36317
      ''
      'Border_L_Min,-- numeric(7,1)  PAN'#29983#20135#38271#36793#38388#36317
      'ISSUSE_AREA_DAY, --decimal(7, 1)   PAN'#38271#36793#38388#36317#19979#38480
      'Border_W_Min,-- numeric(7,1)  PAN'#29983#20135#23485#36793#38388#36317
      'ppc_control_27,  --decimal(7, 1)   PAN'#23485#36793#38388#36317#19979#38480
      ''
      '--'#37319#36141
      'suplstamat, -- char(1)  '#26410#23457#26680#30340#37319#36141#35746#21333#26159#21542#21487#20197#25171#21360'Y/N'
      'SUPLSTAMISC, --char(1)  '#37319#36141#35746#21333#32534#21495#26159#21542#30001#25511#21046#30721#25511#21046'Y/N'
      'QTE_CONTROL4, --'#25253#20215#26448#26009#20215#26684#19982#37319#36141#20215#26684#35843#20215#30334#20998#27604
      '--'#20179#24211#31649#29702
      'unit_ptr,   -- int      '#35013#31665#21333#31649#29702#20013#40664#35748#35013#36816#37325#37327#21333#20301'02rkey'
      'custcoship, -- char(1)  '#26410#20184#27454#21457#31080#24310#26399#36229#36807#20801#35768#22825#25968#19981#21487#20197#35013#36816'Y/N'
      'trans_pl,   --tinyint  '#22806#24065#32467#31639#37319#29992'0'#35760#24080#27719#29575',1'#28014#21160#27719#29575
      'stock_in_flag, --char(1)Y/N '#20801#35768#26448#26009#20837#24211#26102#25509#25910#25968#37327#22823#20110#35746#36141#25968#37327
      'CUSTCOPROD, --char(1)  '#26410#20184#27454#21457#31080#24310#26399#19981#21487#20197#19979#21333'Y/N'
      'fin_control1, --varchar(1) '#38144#21806#24320#21333#26159#21542#29983#24212#25910#24635#24080#20973#35777'Y/N'
      'CLOSE_DAYTH,--'#20999#21106#20013#24515#40664#35748#39046#26009#37096#38376
      'CLOSE_HOURTH,--'#20999#21106#20013#24515#40664#35748#39046#26009#31867#21035
      'PPC_CONTROL2,--'#20801#35768'PP'#25439#32791#20999#21106#30334#20998#27604
      '--'#29983#20135
      'PPC_BY_CustP,--   '#20801#35768#20154#24037#25353#29031#20135#21697#22411#21495#25237#20135' Y/N'
      'PPC_CONTROL13,--  '#23450#21333#30830#35748#21069#19981#20801#35768#25237#20135
      'PPC_CONTROL18,--  '#20801#35768#25237#20135#31649#29702#20013#35843#39640#39044#23450#25253#24223#29575
      'PPC_CONTROL6,--  '#37197#26009#21333#21495#26681#25454#26085#26399#32534#30721
      'PPC_CONTROL7,--  '#37197#26009#21333#21495#26681#25454#25209#37327#20351#29992#19981#21516#21069#32512
      'PPC_CONTROL8,--  '#37197#26009#21333#21495#21253#25324#37096#20214#20010#25968
      'PPC_CONTROL10,-- '#20316#19994#21333#20010#25968#20026'1'#26102#19981#20351#29992#21518#32512
      'PPC_control22,--  '#26159#21542#38656#35201#36229#25237#23457#26680
      'PPC_CONTROL25,--  '#23567#35746#21333'PCS'#25968#30028#23450
      'PPC_CONTROL26,--  '#23567#35746#21333#20801#35768#36229#25237#38754#31215
      'COST_CONTROL1,-- '#20801#35768#22312'BOM'#23457#26680#21069#20808#36755#20986#37197#26009#21333
      'ppc_control12,-- '#21516#19968#37197#26009#21333#20869#25353#39034#24207#36807#25968' 0'#19981#38656#35201#65292'1'#38656#35201
      'ppc_control23,-- '#20801#35768#36807#25968#26102#20505#35760#24405#21592#24037#20135#20986' 0'#19981#20801#35768', 1'#20801#35768
      'custfedship,-- int WIP'#30424#28857#25253#24223#40664#35748#21407#22240
      'BALA_DAYS,-- '#26679#21697#20801#35768#36229#25237#29575'%'
      'PRIOR_DAYS, --'#35746#21333#38754#31215#23567#20110#35813#25968#26102#24517#39035#19968#27425#24615#25552#20132#20837#24211
      '--'#21697#36136
      'QA_CONTROL1, --0'#25253#24223#21333#32534#21495#35268#21017'('#20351#29992#25511#21046#30721#20316#20026#25513#30721';1'#20351#29992#26085#26399#20316#20026#21069#32512';2'#23436#20840#25163#24037#25511#21046')'
      'fg_scp_dept_ptr, --'#25104#21697#25253#24223#30003#35831#37096#38376
      'PPC_CONTROL1,--'#26679#26495'ECN'#21319#37327#20135#26102#26816#26597#26679#21697#21697#36136#36319#36394#34920'(0'#21542'1'#26159')'
      'PPC_CONTROL3, --'#36820#24037#25237#20135#25552#20132#20837#24211#21069#26159#21542#38656#35201#30830#35748'0'#21542'1'#26159
      '--'#31995#32479#25511#21046
      'EP000, --        tinyint       '#30041#35328#31807#26356#26032#26102#38388#38388#38548'('#31186')'
      'SUPLFEDSHIP, --SMTP'#37038#31665#20027#26426
      'SUPLFEDMAT, --'#21457#36865#37038#20214#22320#22336
      'SUPLFEDMISC, --'#29992#25143#21517
      'SUPLSTASHIP, --'#23494#30721
      'PPC_CONTROL4 --'#37197#26009#21333#26448#26009#37319#29992#24320#26009#37197#39069#31649#29702'0'#65306#21542'1'#65306#26159
      'from data0192')
    Left = 116
    Top = 16
    object ADOQuery1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery1aptaxontax: TStringField
      FieldName = 'aptaxontax'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1artaxontax: TStringField
      FieldName = 'artaxontax'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1CUSTSTATOOL: TStringField
      FieldName = 'CUSTSTATOOL'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1ppc_control15: TWordField
      FieldName = 'ppc_control15'
    end
    object ADOQuery1custcitool: TStringField
      FieldName = 'custcitool'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1custciprod: TStringField
      FieldName = 'custciprod'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1suplcimat: TStringField
      FieldName = 'suplcimat'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1custciship: TStringField
      FieldName = 'custciship'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1suplcimisc: TStringField
      FieldName = 'suplcimisc'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1ENG_CONTROL1: TWordField
      FieldName = 'ENG_CONTROL1'
    end
    object ADOQuery1ENG_CONTROL2: TWordField
      FieldName = 'ENG_CONTROL2'
    end
    object ADOQuery1ENG_CONTROL16: TWordField
      FieldName = 'ENG_CONTROL16'
    end
    object ADOQuery1PPC_CONTROL9: TWordField
      FieldName = 'PPC_CONTROL9'
    end
    object ADOQuery1cut_l1_max: TBCDField
      FieldName = 'cut_l1_max'
      Precision = 7
      Size = 1
    end
    object ADOQuery1cut_l1_min: TBCDField
      FieldName = 'cut_l1_min'
      Precision = 7
      Size = 1
    end
    object ADOQuery1cut_w1_max: TBCDField
      FieldName = 'cut_w1_max'
      Precision = 7
      Size = 1
    end
    object ADOQuery1cut_w1_min: TBCDField
      FieldName = 'cut_w1_min'
      Precision = 7
      Size = 1
    end
    object ADOQuery1cut_l2_max: TBCDField
      FieldName = 'cut_l2_max'
      Precision = 7
      Size = 1
    end
    object ADOQuery1cut_l2_min: TBCDField
      FieldName = 'cut_l2_min'
      Precision = 7
      Size = 1
    end
    object ADOQuery1cut_w2_max: TBCDField
      FieldName = 'cut_w2_max'
      Precision = 7
      Size = 1
    end
    object ADOQuery1cut_w2_min: TBCDField
      FieldName = 'cut_w2_min'
      Precision = 7
      Size = 1
    end
    object ADOQuery1space_l_min: TBCDField
      FieldName = 'space_l_min'
      Precision = 7
      Size = 1
    end
    object ADOQuery1space_w_min: TBCDField
      FieldName = 'space_w_min'
      Precision = 7
      Size = 1
    end
    object ADOQuery1Border_L_Min: TBCDField
      FieldName = 'Border_L_Min'
      Precision = 7
      Size = 1
    end
    object ADOQuery1Border_W_Min: TBCDField
      FieldName = 'Border_W_Min'
      Precision = 7
      Size = 1
    end
    object ADOQuery1suplstamat: TStringField
      FieldName = 'suplstamat'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1SUPLSTAMISC: TStringField
      FieldName = 'SUPLSTAMISC'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1unit_ptr: TIntegerField
      FieldName = 'unit_ptr'
    end
    object ADOQuery1custcoship: TStringField
      FieldName = 'custcoship'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1CUSTCOPROD: TStringField
      FieldName = 'CUSTCOPROD'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1CUSTCOTOOL: TStringField
      FieldName = 'CUSTCOTOOL'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1trans_pl: TWordField
      FieldName = 'trans_pl'
    end
    object ADOQuery1stock_in_flag: TStringField
      FieldName = 'stock_in_flag'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1PPC_BY_CustP: TStringField
      FieldName = 'PPC_BY_CustP'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1PPC_CONTROL13: TWordField
      FieldName = 'PPC_CONTROL13'
    end
    object ADOQuery1PPC_CONTROL18: TWordField
      FieldName = 'PPC_CONTROL18'
    end
    object ADOQuery1PPC_CONTROL6: TWordField
      FieldName = 'PPC_CONTROL6'
    end
    object ADOQuery1PPC_CONTROL7: TWordField
      FieldName = 'PPC_CONTROL7'
    end
    object ADOQuery1PPC_CONTROL8: TWordField
      FieldName = 'PPC_CONTROL8'
    end
    object ADOQuery1PPC_CONTROL10: TWordField
      FieldName = 'PPC_CONTROL10'
    end
    object ADOQuery1PPC_control22: TWordField
      FieldName = 'PPC_control22'
    end
    object ADOQuery1PPC_CONTROL25: TIntegerField
      FieldName = 'PPC_CONTROL25'
    end
    object ADOQuery1PPC_CONTROL26: TFloatField
      FieldName = 'PPC_CONTROL26'
    end
    object ADOQuery1COST_CONTROL1: TWordField
      FieldName = 'COST_CONTROL1'
    end
    object ADOQuery1ppc_control12: TWordField
      FieldName = 'ppc_control12'
    end
    object ADOQuery1ppc_control23: TWordField
      FieldName = 'ppc_control23'
    end
    object ADOQuery1custfedship: TIntegerField
      FieldName = 'custfedship'
    end
    object ADOQuery1BALA_DAYS: TBCDField
      FieldName = 'BALA_DAYS'
      Precision = 6
      Size = 2
    end
    object ADOQuery1QA_CONTROL1: TWordField
      FieldName = 'QA_CONTROL1'
    end
    object ADOQuery1fg_scp_dept_ptr: TIntegerField
      FieldName = 'fg_scp_dept_ptr'
    end
    object ADOQuery1EP000: TWordField
      FieldName = 'EP000'
    end
    object ADOQuery1SUPLFEDSHIP: TStringField
      FieldName = 'SUPLFEDSHIP'
      Size = 30
    end
    object ADOQuery1SUPLFEDMAT: TStringField
      FieldName = 'SUPLFEDMAT'
      Size = 50
    end
    object ADOQuery1SUPLFEDMISC: TStringField
      FieldName = 'SUPLFEDMISC'
      Size = 30
    end
    object ADOQuery1SUPLSTASHIP: TStringField
      FieldName = 'SUPLSTASHIP'
      Size = 15
    end
    object ADOQuery1ENG_AUDIT_FLAG: TStringField
      FieldName = 'ENG_AUDIT_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1QTE_CONTROL1: TWordField
      FieldName = 'QTE_CONTROL1'
    end
    object ADOQuery1QTE_CONTROL4: TFloatField
      FieldName = 'QTE_CONTROL4'
    end
    object ADOQuery1ISSUSE_AREA_DAY: TBCDField
      FieldName = 'ISSUSE_AREA_DAY'
      Precision = 7
      Size = 1
    end
    object ADOQuery1ppc_control_27: TBCDField
      FieldName = 'ppc_control_27'
      Precision = 7
      Size = 1
    end
    object ADOQuery1fin_control1: TStringField
      FieldName = 'fin_control1'
      Size = 1
    end
    object ADOQuery1PPC_CONTROL1: TWordField
      FieldName = 'PPC_CONTROL1'
    end
    object ADOQuery1PRIOR_DAYS: TBCDField
      DisplayLabel = #35746#21333#38754#31215#23567#20110#35813#25968#26102#24517#39035#19968#27425#24615#25552#20132#20837#24211
      FieldName = 'PRIOR_DAYS'
      Precision = 6
      Size = 2
    end
    object ADOQuery1CUSTSTAPROD: TStringField
      FieldName = 'CUSTSTAPROD'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1CLOSE_DAYTH: TIntegerField
      DisplayLabel = #20999#21106#20013#24515#40664#35748#39046#26009#37096#38376
      FieldName = 'CLOSE_DAYTH'
    end
    object ADOQuery1CLOSE_HOURTH: TIntegerField
      DisplayLabel = #20999#21106#20013#24515#40664#35748#39046#26009#26448#26009#31867#21035
      FieldName = 'CLOSE_HOURTH'
    end
    object ADOQuery1PPC_CONTROL2: TWordField
      DisplayLabel = #20801#35768'PP'#25439#32791#20999#21106#30334#20998#27604
      FieldName = 'PPC_CONTROL2'
    end
    object ADOQuery1CUSTSTASHIP: TStringField
      DisplayLabel = #26412#21378#32534#21495#20013#27969#27700#21495#22312#21069
      FieldName = 'CUSTSTASHIP'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1PPC_CONTROL3: TWordField
      DisplayLabel = #36820#24037#25237#20135#25552#20132#20837#24211#21069#26159#21542#38656#35201#30830#35748'0'#21542'1'#26159
      FieldName = 'PPC_CONTROL3'
    end
    object ADOQuery1PPC_CONTROL4: TWordField
      FieldName = 'PPC_CONTROL4'
    end
  end
  object TemADOQuery2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 80
    Top = 72
  end
end
