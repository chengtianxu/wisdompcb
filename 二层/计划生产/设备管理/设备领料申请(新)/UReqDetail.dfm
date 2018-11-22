object frmReqDetail: TfrmReqDetail
  Left = 275
  Top = 119
  Width = 1019
  Height = 666
  Caption = #35774#22791#39046#26009#26126#32454
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 1003
    Height = 628
    Align = alClient
    TabOrder = 0
    object pnl2: TPanel
      Left = 1
      Top = 1
      Width = 1001
      Height = 48
      Align = alTop
      TabOrder = 0
      object lbl3: TLabel
        Left = 145
        Top = 16
        Width = 52
        Height = 13
        Caption = #30003#39046#26085#26399
      end
      object lbl4: TLabel
        Left = 318
        Top = 14
        Width = 16
        Height = 16
        Caption = #21040
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lbl_field: TLabel
        Left = 493
        Top = 19
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = #30003#35831#21333#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clDefault
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object dtp1: TDateTimePicker
        Left = 201
        Top = 11
        Width = 107
        Height = 21
        Date = 39878.000000000000000000
        Time = 39878.000000000000000000
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 0
        OnChange = dtp1Change
      end
      object dtp2: TDateTimePicker
        Left = 345
        Top = 11
        Width = 107
        Height = 21
        Date = 39878.000000000000000000
        Time = 39878.000000000000000000
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 1
        OnChange = dtp2Change
      end
      object edt_value: TEdit
        Left = 546
        Top = 13
        Width = 121
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        ParentFont = False
        TabOrder = 2
        OnChange = edt_valueChange
      end
      object btn_close: TBitBtn
        Left = 8
        Top = 2
        Width = 57
        Height = 45
        Hint = #36864#20986#31995#32479
        Caption = #36864#20986
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = btn_closeClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
          F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
          000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
          338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
          45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
          3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
          F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
          000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
          338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
          4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
          8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
          333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
          0000}
        NumGlyphs = 2
      end
      object btn_export: TBitBtn
        Left = 68
        Top = 2
        Width = 64
        Height = 45
        Caption = #23548#20986
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 4
        OnClick = btn_exportClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000120B0000120B00001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DADADADADADA
          DADAADADADADADADADADDADADADADAD00000000000000006666007777777706E
          EF0AA0E6666606EEF0ADDA0E66606EEF060AADA0E606EEF0000DDADA006EEF0A
          DADAADAD06EEF00DADADDAD06EEF0670DADAAD06EEF0E6670DADD06EEF0A0E66
          70DA0FFFF0ADA0EEEE0D00000ADADA00000AADADADADADADADAD}
      end
    end
    object pnl3: TPanel
      Left = 1
      Top = 49
      Width = 1001
      Height = 557
      Align = alClient
      TabOrder = 1
      object eh1: TDBGridEh
        Left = 1
        Top = 1
        Width = 999
        Height = 555
        Align = alClient
        DataSource = ds1
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -13
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnTitleClick = eh1TitleClick
        Columns = <
          item
            EditButtons = <>
            FieldName = #30003#39046#21333#21495
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #30003#35831#26085#26399
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #23457#26680#26085#26399
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #22791#27880
            Footers = <>
            Width = 131
          end
          item
            EditButtons = <>
            FieldName = #20351#29992#37096#38376
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #37096#38376#21517#31216
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #30003#39046#20154#20195#30721
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #30003#39046#21592#24037#21517#31216
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #23457#26680#21592#24037#20195#30721
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #23457#26680#21592#24037#21517#31216
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #23457#25209#27969#31243
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #24037#21378
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #23457#26680#29366#24577
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #23457#25209#27969#31243#20195#30721
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #30830#35748#29366#24577
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #31867#22411
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #25171#21360#21542
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #31354#35843#20107#19994#37096#24037#20316#21333#21495
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #32500#20462#21333#21333#21495
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #20445#20859#26085#26399
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #20445#20859#21608#26399
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #35774#22791#32534#21495
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #35774#22791#21517#31216
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'DEPT_PTR'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #35774#22791#36131#20219#23567#32452
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #24037#20316#37096#38376
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #24037#20316#20219#21153#21517#31216
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #24037#20316#20219#21153#35828#26126
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #30003#39046#25968#37327
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #24050#21457#25918#25968#37327
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #20379#24212#21830
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #26448#26009#32534#30721
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #26448#26009#21517#31216#35268#26684
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #21333#20301
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #26159#21542'VMI'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #37329#39069'('#26412#24065#21547#31246')'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #37329#39069'('#26412#24065#19981#21547#31246')'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #35774#22791#25152#22312#37096#38376
            Footers = <>
          end>
      end
    end
    object pnl4: TPanel
      Left = 1
      Top = 606
      Width = 1001
      Height = 21
      Align = alBottom
      TabOrder = 2
    end
  end
  object ds1: TDataSource
    DataSet = qry1
    Left = 265
    Top = 161
  end
  object qry1: TADOQuery
    Connection = DM.con1
    CursorType = ctStatic
    Filtered = True
    Parameters = <
      item
        Name = 't1'
        Size = -1
        Value = Null
      end
      item
        Name = 't2'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      ''
      'select * from (select f1.*,data0034.DEPT_NAME ['#35774#22791#25152#22312#37096#38376'] from('
      
        'SELECT dbo.DATA0268.number ['#30003#39046#21333#21495'],         dbo.DATA0268.[DATE]  ' +
        '         ['#30003#35831#26085#26399'], '
      
        'dbo.DATA0268.auth_date     ['#23457#26680#26085#26399'],          dbo.DATA0268.referen' +
        'ce        ['#22791#27880'], '
      
        'dbo.Data0034.DEPT_CODE     ['#20351#29992#37096#38376'],         dbo.Data0034.DEPT_NAM' +
        'E        ['#37096#38376#21517#31216'],'
      
        'dbo.Data0005.EMPL_CODE     ['#30003#39046#20154#20195#30721'],       dbo.Data0005.EMPLOYEE_' +
        'NAME AS ['#30003#39046#21592#24037#21517#31216'],'
      
        'Data0005_1.EMPL_CODE AS    ['#23457#26680#21592#24037#20195#30721'],     Data0005_1.EMPLOYEE_NAM' +
        'E AS   ['#23457#26680#21592#24037#21517#31216'], '
      
        'dbo.Data0094.PURCHASE_APPROV_DESC ['#23457#25209#27969#31243'],  dbo.Data0015.ABBR_NAM' +
        'E AS     ['#24037#21378'],  '
      
        'CASE WHEN data0268.status = 0 THEN '#39#24453#25552#20132#39' WHEN data0268.status = ' +
        '1 THEN '#39#24453#23457#26680#39'  '
      
        'WHEN data0268.status = 2 THEN '#39#24050#23457#26680#39' WHEN data0268.status  = 3 TH' +
        'EN '#39#34987#36864#22238#39'  '
      
        'WHEN data0268.status = 4 THEN '#39#24050#21457#26009#39' END AS '#23457#26680#29366#24577',dbo.Data0094.COD' +
        'E ['#23457#25209#27969#31243#20195#30721'],'
      
        'CASE WHEN data0268.allow_submit = 0 THEN '#39#19981#30830#35748#39' WHEN data0268.all' +
        'ow_submit = 1 THEN '#39#24453#30830#35748#39'  '
      'WHEN data0268.allow_submit = 2 THEN '#39#24050#30830#35748#39'END AS ['#30830#35748#29366#24577'],'
      
        'case dbo.DATA0268.ttype when 2 then '#39#32500#20462#39' when 3 then '#39#32500#25252#39' when 4' +
        ' then '#39#24037#31243#39' when 5 then '#39#20844#29992#39' end as ['#31867#22411'],'
      
        'dbo.DATA0268.Prted          ['#25171#21360#21542'],        dbo.data0835.WorkOrder' +
        '    ['#31354#35843#20107#19994#37096#24037#20316#21333#21495'],'
      
        'dbo.data0567.NUMBER as      ['#32500#20462#21333#21333#21495'],    dbo.data0831.PlanMainDat' +
        'e ['#20445#20859#26085#26399'],    '
      'dbo.data0831.MainCycl       ['#20445#20859#21608#26399'],'
      'Case when dbo.DATA0268.TTYPE=2 then(d17_2.FASSET_CODE) '
      
        '     when dbo.DATA0268.TTYPE=3 then(data0831.DeviNumb) end as ['#35774 +
        #22791#32534#21495'], '
      'Case when dbo.DATA0268.TTYPE=2 then(d17_2.FASSET_NAME) '
      
        '     when dbo.DATA0268.TTYPE=3 then(d17_1.FASSET_NAME) end as ['#35774 +
        #22791#21517#31216'],   '
      'Case when dbo.DATA0268.TTYPE=2 then(d17_2.DEPT_PTR) '
      
        '     when dbo.DATA0268.TTYPE=3 then(d17_1.DEPT_PTR) end as DEPT_' +
        'PTR,           '
      
        'data0840.[Location]         ['#35774#22791#36131#20219#23567#32452'],   data0830.[DeptName]     ' +
        '    ['#24037#20316#37096#38376'],'
      
        'Data0836.[WorkName]         ['#24037#20316#20219#21153#21517#31216'],   data0835.[WorkExpl]     ' +
        '    ['#24037#20316#20219#21153#35828#26126'],'
      
        'dbo.Data0468.QUAN_BOM       ['#30003#39046#25968#37327'],       dbo.Data0468.QUAN_ISSU' +
        'ED    ['#24050#21457#25918#25968#37327'],'
      
        'dbo.Data0468.VENDOR         ['#20379#24212#21830'],         dbo.Data0017.INV_PART' +
        '_NUMBER['#26448#26009#32534#30721'],'
      
        'Data0017.INV_PART_DESCRIPTION ['#26448#26009#21517#31216#35268#26684'],data0002.unit_name       ' +
        '   ['#21333#20301'],'
      
        'case dbo.Data0468.PRINTIT when '#39'Y'#39'then '#39#26222#36890#24211#23384#39' when '#39'N'#39' then '#39'VMI' +
        #24211#23384#39' END AS '#26159#21542'VMI,'
      
        '['#37329#39069'('#26412#24065#21547#31246')]=(select sum(ROUND(dbo.Data0207.QUANTITY * dbo.Data002' +
        '2.tax_price * dbo.Data0456.exch_rate, 4))       '
      'from data0207 join data0022 on data0022.rkey=data0207.D0022_PTR '
      
        'JOIN Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY where ' +
        ' D0468_ptr=Data0468.rkey),'
      
        '['#37329#39069'('#26412#24065#19981#21547#31246')]=(select sum(ROUND((dbo.Data0207.QUANTITY * dbo.Data0' +
        '022.tax_price * dbo.Data0456.exch_rate) / (1 + dbo.Data0022.TAX_' +
        '2 * 0.01), 4)) '
      
        'from data0207 join data0022 on data0022.rkey=data0207.D0022_PTR ' +
        ' '
      
        'JOIN Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY where ' +
        ' D0468_ptr=Data0468.rkey)'
      
        'FROM dbo.DATA0268 INNER JOIN dbo.Data0034 ON dbo.DATA0268.dept_p' +
        'tr = dbo.Data0034.RKEY'
      'and dbo.DATA0268.ttype in (2,3,4,5) /*2'#32500#20462';3'#32500#25252';4'#24037#31243';5'#20844#29992'*/'
      
        'INNER JOIN dbo.Data0005 ON dbo.DATA0268.EMPL_PTR = dbo.Data0005.' +
        'RKEY '
      
        'LEFT JOIN dbo.Data0005 AS Data0005_1 ON dbo.DATA0268.auth_emplpt' +
        'r = Data0005_1.RKEY'
      
        'INNER JOIN dbo.Data0094 ON dbo.DATA0268.auth_ptr = dbo.Data0094.' +
        'RKEY '
      
        'INNER JOIN dbo.Data0015 ON dbo.DATA0268.warehouse_ptr = dbo.Data' +
        '0015.RKEY '
      'left join dbo.data0831 on DATA0268.[d831_ptr]=dbo.data0831.rkey '
      'left join data0417 d17_1 on d17_1.FASSET_CODE=data0831.DeviNumb '
      'left join dbo.data0567 on DATA0268.[d567_ptr]=dbo.data0567.rkey'
      'left join data0417 d17_2 on d17_2.rkey=data0567.FASSET_PTR  '
      'left join dbo.data0835 on DATA0268.[d835_ptr]=dbo.data0835.rkey '
      'left join data0840 on  DATA0268.[d840_ptr]=dbo.data0840.rkey '
      'left join dbo.data0830 on data0835.[Dept_ptr]=data0830.rkey  '
      'left join dbo.Data0836 on data0835.[Work_ptr]=data0836.rkey '
      'join Data0468 on DATA0268.rkey=Data0468.FLOW_NO'
      'join dbo.Data0017 ON dbo.Data0468.INVENT_PTR = dbo.Data0017.RKEY'
      'join data0002 on data0017.STOCK_UNIT_PTR=data0002.rkey '
      
        'where (dbo.DATA0268.[DATE]>= :t1  and dbo.DATA0268.[DATE]<= :t2 ' +
        ' )'
      'and (data0468.QUAN_ISSUED>0))as f1 '
      'left join data0034 on data0034.rkey=f1.DEPT_PTR)as f2')
    Left = 313
    Top = 161
    object strngfldqry1DSDesigner: TStringField
      FieldName = #30003#39046#21333#21495
      Size = 10
    end
    object dtmfldqry1DSDesigner2: TDateTimeField
      FieldName = #30003#35831#26085#26399
    end
    object dtmfldqry1DSDesigner3: TDateTimeField
      FieldName = #23457#26680#26085#26399
    end
    object strngfldqry1DSDesigner4: TStringField
      FieldName = #22791#27880
      Size = 100
    end
    object strngfldqry1DSDesigner5: TStringField
      FieldName = #20351#29992#37096#38376
      Size = 10
    end
    object strngfldqry1DSDesigner6: TStringField
      FieldName = #37096#38376#21517#31216
      Size = 30
    end
    object strngfldqry1DSDesigner7: TStringField
      FieldName = #30003#39046#20154#20195#30721
      Size = 10
    end
    object strngfldqry1DSDesigner8: TStringField
      FieldName = #30003#39046#21592#24037#21517#31216
      Size = 16
    end
    object strngfldqry1DSDesigner9: TStringField
      FieldName = #23457#26680#21592#24037#20195#30721
      Size = 10
    end
    object strngfldqry1DSDesigner10: TStringField
      FieldName = #23457#26680#21592#24037#21517#31216
      Size = 16
    end
    object strngfldqry1DSDesigner11: TStringField
      FieldName = #23457#25209#27969#31243
      Size = 40
    end
    object strngfldqry1DSDesigner12: TStringField
      FieldName = #24037#21378
      Size = 10
    end
    object strngfldqry1DSDesigner13: TStringField
      FieldName = #23457#26680#29366#24577
      ReadOnly = True
      Size = 6
    end
    object strngfldqry1DSDesigner14: TStringField
      FieldName = #23457#25209#27969#31243#20195#30721
      Size = 15
    end
    object strngfldqry1DSDesigner15: TStringField
      FieldName = #30830#35748#29366#24577
      ReadOnly = True
      Size = 6
    end
    object strngfldqry1DSDesigner16: TStringField
      FieldName = #31867#22411
      ReadOnly = True
      Size = 4
    end
    object qry1DSDesigner17: TBooleanField
      FieldName = #25171#21360#21542
    end
    object strngfldqry1DSDesigner18: TStringField
      FieldName = #31354#35843#20107#19994#37096#24037#20316#21333#21495
      Size = 15
    end
    object strngfldqry1DSDesigner19: TStringField
      FieldName = #32500#20462#21333#21333#21495
      Size = 15
    end
    object dtmfldqry1DSDesigner20: TDateTimeField
      FieldName = #20445#20859#26085#26399
    end
    object strngfldqry1DSDesigner21: TStringField
      FieldName = #20445#20859#21608#26399
      Size = 10
    end
    object strngfldqry1DSDesigner22: TStringField
      FieldName = #35774#22791#32534#21495
      ReadOnly = True
    end
    object strngfldqry1DSDesigner23: TStringField
      FieldName = #35774#22791#21517#31216
      ReadOnly = True
      Size = 30
    end
    object intgrfldqry1DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
      ReadOnly = True
    end
    object strngfldqry1DSDesigner24: TStringField
      FieldName = #35774#22791#36131#20219#23567#32452
    end
    object strngfldqry1DSDesigner25: TStringField
      FieldName = #24037#20316#37096#38376
      Size = 50
    end
    object strngfldqry1DSDesigner26: TStringField
      FieldName = #24037#20316#20219#21153#21517#31216
      Size = 50
    end
    object strngfldqry1DSDesigner27: TStringField
      FieldName = #24037#20316#20219#21153#35828#26126
      Size = 200
    end
    object fltfldqry1DSDesigner28: TFloatField
      FieldName = #30003#39046#25968#37327
    end
    object fltfldqry1DSDesigner29: TFloatField
      FieldName = #24050#21457#25918#25968#37327
    end
    object strngfldqry1DSDesigner30: TStringField
      FieldName = #20379#24212#21830
      Size = 30
    end
    object strngfldqry1DSDesigner31: TStringField
      FieldName = #26448#26009#32534#30721
      Size = 25
    end
    object strngfldqry1DSDesigner32: TStringField
      FieldName = #26448#26009#21517#31216#35268#26684
      ReadOnly = True
      Size = 100
    end
    object strngfldqry1DSDesigner33: TStringField
      FieldName = #21333#20301
    end
    object strngfldqry1VMI: TStringField
      FieldName = #26159#21542'VMI'
      ReadOnly = True
      Size = 8
    end
    object qry1DSDesigner34: TBCDField
      FieldName = #37329#39069'('#26412#24065#21547#31246')'
      ReadOnly = True
      Precision = 32
      Size = 8
    end
    object qry1DSDesigner35: TBCDField
      FieldName = #37329#39069'('#26412#24065#19981#21547#31246')'
      ReadOnly = True
      Precision = 32
      Size = 6
    end
    object strngfldqry1DSDesigner36: TStringField
      FieldName = #35774#22791#25152#22312#37096#38376
      Size = 30
    end
  end
end
