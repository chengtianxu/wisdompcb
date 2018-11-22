inherited frm_Picking1: Tfrm_Picking1
  Left = 388
  Top = 195
  Width = 809
  Height = 573
  Caption = #35774#22791#39046#29992#26597#35810
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 12
  inherited StatusBar1: TStatusBar
    Top = 520
    Width = 801
  end
  inherited RzToolbar1: TRzToolbar
    Width = 801
    ToolbarControls = (
      tblAdd
      tblEdit
      tblSave
      tblCancel
      tblDelete
      RzSpacer1
      tblRefresh
      tblfind
      tblExport
      tblFilter
      tblCancelFilter
      tblPrint
      tblDesign
      RzSpacer2
      tblFirst
      tblPrior
      tblNext
      tblLast)
    inherited tblAdd: TRzToolButton
      Visible = False
    end
    inherited tblEdit: TRzToolButton
      Visible = False
    end
    inherited tblSave: TRzToolButton
      Visible = False
    end
    inherited tblCancel: TRzToolButton
      Visible = False
    end
    inherited tblDelete: TRzToolButton
      Visible = False
    end
    inherited tblRefresh: TRzToolButton
      Visible = False
    end
  end
  inherited Panel_right: TPanel
    Left = 795
    Height = 479
  end
  inherited Panel_Left: TPanel
    Height = 479
  end
  inherited Panel_Main: TPanel
    Width = 789
    Height = 479
    inherited Panel5: TPanel
      Width = 789
      Height = 439
      inherited Panel7: TPanel
        Left = 669
        Height = 439
        inherited RzToolbar2: TRzToolbar
          Height = 439
          ToolbarControls = (
            btn1)
        end
        inherited Panel2: TPanel
          Height = 439
        end
      end
      inherited PageControl_M: TPageControl
        Width = 669
        Height = 439
        inherited TabSheet1: TTabSheet
          inherited DghMain: TDBGridEh
            Width = 661
            Height = 412
            Columns = <
              item
                EditButtons = <>
                FieldName = #25171#21360#21542
                Footers = <>
              end
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
                FieldName = #24037#21378
                Footers = <>
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
                Width = 70
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
                Width = 72
              end
              item
                EditButtons = <>
                FieldName = #23457#26680#26085#26399
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
                FieldName = #23457#26680#29366#24577
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = #23457#25209#27969#31243#20195#30721
                Footers = <>
                Width = 60
              end
              item
                EditButtons = <>
                FieldName = #23457#25209#27969#31243
                Footers = <>
                Width = 153
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
                FieldName = #35774#22791#36131#20219#23567#32452
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
                Width = 150
              end
              item
                EditButtons = <>
                FieldName = #35774#22791#25152#22312#37096#38376
                Footers = <>
                Width = 81
              end
              item
                EditButtons = <>
                FieldName = #31354#35843#20107#19994#37096#24037#20316#21333#21495
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = #24037#20316#37096#38376
                Footers = <>
                Width = 138
              end
              item
                EditButtons = <>
                FieldName = #24037#20316#20219#21153#21517#31216
                Footers = <>
                Width = 91
              end
              item
                EditButtons = <>
                FieldName = #24037#20316#20219#21153#35828#26126
                Footers = <>
                Width = 150
              end
              item
                EditButtons = <>
                FieldName = #26448#26009#32534#30721
                Footers = <>
                Width = 146
              end
              item
                EditButtons = <>
                FieldName = #26448#26009#21517#31216#35268#26684
                Footers = <>
                Width = 323
              end
              item
                EditButtons = <>
                FieldName = #21333#20301
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
                FieldName = #37329#39069'('#26412#24065#21547#31246')'
                Footers = <>
                Width = 80
              end
              item
                EditButtons = <>
                FieldName = #37329#39069'('#26412#24065#19981#21547#31246')'
                Footers = <>
                Width = 80
              end
              item
                EditButtons = <>
                FieldName = #20379#24212#21830
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = #26159#21542'VMI'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = #22791#27880
                Footers = <>
                Width = 208
              end>
          end
        end
        inherited TabSheet2: TTabSheet
          TabVisible = False
        end
      end
    end
    inherited Panel6: TPanel
      Width = 789
    end
    inherited Panel_Bottom: TPanel
      Top = 447
      Width = 789
      Height = 32
      object Label13: TLabel
        Left = 162
        Top = 15
        Width = 12
        Height = 12
        Caption = #21040
      end
      object Label12: TLabel
        Left = 8
        Top = 15
        Width = 48
        Height = 12
        Caption = #30003#35831#26085#26399
      end
      object BtFind: TSpeedButton
        Left = 306
        Top = 7
        Width = 25
        Height = 25
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000
          00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF0000CE0094FF0000CE000000FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000CE0094FF0000
          FF0000CE000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF0000CE0094FF0000FF0000CE000000FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF0000000000000000000000000000000094FF0000FF0000CE0000
          00FF00FFFF00FFFF00FFFF00FFFF00FF848484000000CE9400CE9400CE940094
          63299463290000000000CE000000FF00FFFF00FFFF00FFFF00FFFF00FF848484
          ADB5ADFFCE29FFCE29FFCE29FFCE29CE9400CE9400946329000000FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF848484FFFF94FFFF94FFFF94FFCE94FFCE29FF
          CE29CE9400CE9400000000FF00FFFF00FFFF00FFFF00FFFF00FF848484FFCE94
          FFFF94FFFF94FFFF94FFFF94FFFF94FFCE29FFCE29CE9400946329000000FF00
          FFFF00FFFF00FFFF00FF848484FFCE94FFFFCEFFFFCEFFFFCEFFFF94FFFF94FF
          FF94FFCE29CE9400CE9400000000FF00FFFF00FFFF00FFFF00FF848484FFCE94
          FFFFFFFFFFFFFFFFCEFFFFCEFFFF94FFFF94FFCE94FFCE29CE9400000000FF00
          FFFF00FFFF00FFFF00FF848484ADB5ADFFFFFFFFFFFFFFFFFFFFFFCEFFFFCEFF
          FF94FFFF94FFCE29CE9400000000FF00FFFF00FFFF00FFFF00FFFF00FF848484
          FFCE94FFFFFFFFFFFFFFFFFFFFFFCEFFFF94FFFF94FFCE29000000FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF848484ADB5ADFFCE94FFFFFFFFFFFFFFFFCEFF
          FF94FFCE94CE9429000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          848484848484ADB5ADFFCE94FFCE94FFCE94848484848484FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF84848484848484848484
          8484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        OnClick = BtFindClick
      end
      object dteEnd: TDateTimePicker
        Left = 189
        Top = 10
        Width = 89
        Height = 21
        Date = 41449.393683449070000000
        Time = 41449.393683449070000000
        TabOrder = 0
        OnChange = dteEndChange
      end
      object dteBegin: TDateTimePicker
        Left = 62
        Top = 10
        Width = 88
        Height = 21
        Date = 41449.389854236120000000
        Time = 41449.389854236120000000
        TabOrder = 1
        OnChange = dteBeginChange
      end
    end
  end
  inherited pp_Report1: TppReport
    DataPipelineName = 'pp_DBPipeline1'
    inherited ppDetailBand1: TppDetailBand
      inherited ppDBText1: TppDBText
        DataPipelineName = 'pp_DBPipeline1'
      end
      inherited ppDBText2: TppDBText
        DataPipelineName = 'pp_DBPipeline1'
      end
    end
  end
  inherited dtRead: TADODataSet
    CursorType = ctStatic
    CommandText = 'select FASSET_CODE '#35774#22791#32534#21495',FASSET_NAME '#35774#22791#21517#31216' from data0417'
  end
  inherited cdsMain: Tcds
    CommandText = 
      'select * from (select f1.*,data0034.DEPT_NAME ['#35774#22791#25152#22312#37096#38376'] from('#13#10'SE' +
      'LECT dbo.DATA0268.number ['#30003#39046#21333#21495'],         dbo.DATA0268.[DATE]    ' +
      '       ['#30003#35831#26085#26399'], '#13#10'dbo.DATA0268.auth_date     ['#23457#26680#26085#26399'],          dbo' +
      '.DATA0268.reference        ['#22791#27880'], '#13#10'dbo.Data0034.DEPT_CODE     ['#20351 +
      #29992#37096#38376'],         dbo.Data0034.DEPT_NAME        ['#37096#38376#21517#31216'],'#13#10'dbo.Data000' +
      '5.EMPL_CODE     ['#30003#39046#20154#20195#30721'],       dbo.Data0005.EMPLOYEE_NAME AS ['#30003#39046 +
      #21592#24037#21517#31216'],'#13#10'Data0005_1.EMPL_CODE AS    ['#23457#26680#21592#24037#20195#30721'],     Data0005_1.EMPL' +
      'OYEE_NAME AS   ['#23457#26680#21592#24037#21517#31216'], '#13#10'dbo.Data0094.PURCHASE_APPROV_DESC ['#23457#25209 +
      #27969#31243'],  dbo.Data0015.ABBR_NAME AS     ['#24037#21378'],  '#13#10'CASE WHEN data0268.' +
      'status = 0 THEN '#39#24453#25552#20132#39' WHEN data0268.status = 1 THEN '#39#24453#23457#26680#39'  '#13#10'WHE' +
      'N data0268.status = 2 THEN '#39#24050#23457#26680#39' WHEN data0268.status  = 3 THEN ' +
      #39#34987#36864#22238#39'  '#13#10'WHEN data0268.status = 4 THEN '#39#24050#21457#26009#39' END AS '#23457#26680#29366#24577',dbo.Dat' +
      'a0094.CODE ['#23457#25209#27969#31243#20195#30721'],'#13#10'CASE WHEN data0268.allow_submit = 0 THEN '#39 +
      #19981#30830#35748#39' WHEN data0268.allow_submit = 1 THEN '#39#24453#30830#35748#39'  '#13#10'WHEN data0268.' +
      'allow_submit = 2 THEN '#39#24050#30830#35748#39'END AS ['#30830#35748#29366#24577'],'#13#10'case dbo.DATA0268.tty' +
      'pe when 2 then '#39#32500#20462#39' when 3 then '#39#32500#25252#39' when 4 then '#39#24037#31243#39' when 5 the' +
      'n '#39#20844#29992#39' end as ['#31867#22411'],'#13#10'dbo.DATA0268.Prted          ['#25171#21360#21542'],        d' +
      'bo.data0835.WorkOrder    ['#31354#35843#20107#19994#37096#24037#20316#21333#21495'],'#13#10'dbo.data0567.NUMBER as   ' +
      '   ['#32500#20462#21333#21333#21495'],    dbo.data0831.PlanMainDate ['#20445#20859#26085#26399'],    '#13#10'dbo.data08' +
      '31.MainCycl       ['#20445#20859#21608#26399'],'#13#10'Case when dbo.DATA0268.TTYPE=2 then(d' +
      '17_2.FASSET_CODE) '#13#10'     when dbo.DATA0268.TTYPE=3 then(data0831' +
      '.DeviNumb) end as ['#35774#22791#32534#21495'], '#13#10'Case when dbo.DATA0268.TTYPE=2 then(' +
      'd17_2.FASSET_NAME) '#13#10'     when dbo.DATA0268.TTYPE=3 then(d17_1.F' +
      'ASSET_NAME) end as ['#35774#22791#21517#31216'],   '#13#10'Case when dbo.DATA0268.TTYPE=2 th' +
      'en(d17_2.DEPT_PTR) '#13#10'     when dbo.DATA0268.TTYPE=3 then(d17_1.D' +
      'EPT_PTR) end as DEPT_PTR,           '#13#10'data0840.[Location]       ' +
      '  ['#35774#22791#36131#20219#23567#32452'],   data0830.[DeptName]         ['#24037#20316#37096#38376'],'#13#10'Data0836.[Wor' +
      'kName]         ['#24037#20316#20219#21153#21517#31216'],   data0835.[WorkExpl]         ['#24037#20316#20219#21153#35828#26126'],' +
      #13#10'dbo.Data0468.QUAN_BOM       ['#30003#39046#25968#37327'],       dbo.Data0468.QUAN_IS' +
      'SUED    ['#24050#21457#25918#25968#37327'],'#13#10'dbo.Data0468.VENDOR         ['#20379#24212#21830'],         dbo' +
      '.Data0017.INV_PART_NUMBER['#26448#26009#32534#30721'],'#13#10'Data0017.INV_PART_DESCRIPTION ' +
      '['#26448#26009#21517#31216#35268#26684'],data0002.unit_name          ['#21333#20301'],'#13#10'case dbo.Data0468.PR' +
      'INTIT when '#39'Y'#39'then '#39#26222#36890#24211#23384#39' when '#39'N'#39' then '#39'VMI'#24211#23384#39' END AS '#26159#21542'VMI,'#13#10'[' +
      #37329#39069'('#26412#24065#21547#31246')]=(select sum(ROUND(dbo.Data0207.QUANTITY * dbo.Data0022' +
      '.tax_price * dbo.Data0456.exch_rate, 4))       '#13#10'from data0207 j' +
      'oin data0022 on data0022.rkey=data0207.D0022_PTR '#13#10'JOIN Data0456' +
      ' ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY where  D0468_ptr=Da' +
      'ta0468.rkey),'#13#10'['#37329#39069'('#26412#24065#19981#21547#31246')]=(select sum(ROUND((dbo.Data0207.QUANT' +
      'ITY * dbo.Data0022.tax_price * dbo.Data0456.exch_rate) / (1 + db' +
      'o.Data0022.TAX_2 * 0.01), 4)) '#13#10'from data0207 join data0022 on d' +
      'ata0022.rkey=data0207.D0022_PTR  '#13#10'JOIN Data0456 ON dbo.Data0022' +
      '.GRN_PTR = dbo.Data0456.RKEY where  D0468_ptr=Data0468.rkey)'#13#10'FR' +
      'OM dbo.DATA0268 INNER JOIN dbo.Data0034 ON dbo.DATA0268.dept_ptr' +
      ' = dbo.Data0034.RKEY'#13#10'and dbo.DATA0268.ttype in (2,3,4,5) /*2'#32500#20462';' +
      '3'#32500#25252';4'#24037#31243';5'#20844#29992'*/'#13#10'INNER JOIN dbo.Data0005 ON dbo.DATA0268.EMPL_PTR ' +
      '= dbo.Data0005.RKEY '#13#10'LEFT JOIN dbo.Data0005 AS Data0005_1 ON db' +
      'o.DATA0268.auth_emplptr = Data0005_1.RKEY'#13#10'INNER JOIN dbo.Data00' +
      '94 ON dbo.DATA0268.auth_ptr = dbo.Data0094.RKEY '#13#10'INNER JOIN dbo' +
      '.Data0015 ON dbo.DATA0268.warehouse_ptr = dbo.Data0015.RKEY '#13#10'le' +
      'ft join dbo.data0831 on DATA0268.[d831_ptr]=dbo.data0831.rkey '#13#10 +
      'left join data0417 d17_1 on d17_1.FASSET_CODE=data0831.DeviNumb ' +
      #13#10'left join dbo.data0567 on DATA0268.[d567_ptr]=dbo.data0567.rke' +
      'y'#13#10'left join data0417 d17_2 on d17_2.rkey=data0567.FASSET_PTR  '#13 +
      #10'left join dbo.data0835 on DATA0268.[d835_ptr]=dbo.data0835.rkey' +
      ' '#13#10'left join data0840 on  DATA0268.[d840_ptr]=dbo.data0840.rkey ' +
      #13#10'left join dbo.data0830 on data0835.[Dept_ptr]=data0830.rkey  '#13 +
      #10'left join dbo.Data0836 on data0835.[Work_ptr]=data0836.rkey '#13#10'j' +
      'oin Data0468 on DATA0268.rkey=Data0468.FLOW_NO'#13#10'join dbo.Data001' +
      '7 ON dbo.Data0468.INVENT_PTR = dbo.Data0017.RKEY'#13#10'join data0002 ' +
      'on data0017.STOCK_UNIT_PTR=data0002.rkey '#13#10'where (dbo.DATA0268.[' +
      'DATE]>=:SD and dbo.DATA0268.[DATE]<=:ED  )and (data0268.status =' +
      '4))as f1 '#13#10'left join data0034 on data0034.rkey=f1.DEPT_PTR)as f2'
    Params = <
      item
        DataType = ftDateTime
        Name = 'SD'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'ED'
        ParamType = ptUnknown
      end>
    ReadOnly = True
    F_SQLSelectFrom = 
      'select * from (select f1.*,data0034.DEPT_NAME ['#35774#22791#25152#22312#37096#38376'] from('#13#10'SE' +
      'LECT dbo.DATA0268.number ['#30003#39046#21333#21495'],         dbo.DATA0268.[DATE]    ' +
      '       ['#30003#35831#26085#26399'], '#13#10'dbo.DATA0268.auth_date     ['#23457#26680#26085#26399'],          dbo' +
      '.DATA0268.reference        ['#22791#27880'], '#13#10'dbo.Data0034.DEPT_CODE     ['#20351 +
      #29992#37096#38376'],         dbo.Data0034.DEPT_NAME        ['#37096#38376#21517#31216'],'#13#10'dbo.Data000' +
      '5.EMPL_CODE     ['#30003#39046#20154#20195#30721'],       dbo.Data0005.EMPLOYEE_NAME AS ['#30003#39046 +
      #21592#24037#21517#31216'],'#13#10'Data0005_1.EMPL_CODE AS    ['#23457#26680#21592#24037#20195#30721'],     Data0005_1.EMPL' +
      'OYEE_NAME AS   ['#23457#26680#21592#24037#21517#31216'], '#13#10'dbo.Data0094.PURCHASE_APPROV_DESC ['#23457#25209 +
      #27969#31243'],  dbo.Data0015.ABBR_NAME AS     ['#24037#21378'],  '#13#10'CASE WHEN data0268.' +
      'status = 0 THEN '#39#24453#25552#20132#39' WHEN data0268.status = 1 THEN '#39#24453#23457#26680#39'  '#13#10'WHE' +
      'N data0268.status = 2 THEN '#39#24050#23457#26680#39' WHEN data0268.status  = 3 THEN ' +
      #39#34987#36864#22238#39'  '#13#10'WHEN data0268.status = 4 THEN '#39#24050#21457#26009#39' END AS '#23457#26680#29366#24577',dbo.Dat' +
      'a0094.CODE ['#23457#25209#27969#31243#20195#30721'],'#13#10'CASE WHEN data0268.allow_submit = 0 THEN '#39 +
      #19981#30830#35748#39' WHEN data0268.allow_submit = 1 THEN '#39#24453#30830#35748#39'  '#13#10'WHEN data0268.' +
      'allow_submit = 2 THEN '#39#24050#30830#35748#39'END AS ['#30830#35748#29366#24577'],'#13#10'case dbo.DATA0268.tty' +
      'pe when 2 then '#39#32500#20462#39' when 3 then '#39#32500#25252#39' when 4 then '#39#24037#31243#39' when 5 the' +
      'n '#39#20844#29992#39' end as ['#31867#22411'],'#13#10'dbo.DATA0268.Prted          ['#25171#21360#21542'],        d' +
      'bo.data0835.WorkOrder    ['#31354#35843#20107#19994#37096#24037#20316#21333#21495'],'#13#10'dbo.data0567.NUMBER as   ' +
      '   ['#32500#20462#21333#21333#21495'],    dbo.data0831.PlanMainDate ['#20445#20859#26085#26399'],    '#13#10'dbo.data08' +
      '31.MainCycl       ['#20445#20859#21608#26399'],'#13#10'Case when dbo.DATA0268.TTYPE=2 then(d' +
      '17_2.FASSET_CODE) '#13#10'     when dbo.DATA0268.TTYPE=3 then(data0831' +
      '.DeviNumb) end as ['#35774#22791#32534#21495'], '#13#10'Case when dbo.DATA0268.TTYPE=2 then(' +
      'd17_2.FASSET_NAME) '#13#10'     when dbo.DATA0268.TTYPE=3 then(d17_1.F' +
      'ASSET_NAME) end as ['#35774#22791#21517#31216'],   '#13#10'Case when dbo.DATA0268.TTYPE=2 th' +
      'en(d17_2.DEPT_PTR) '#13#10'     when dbo.DATA0268.TTYPE=3 then(d17_1.D' +
      'EPT_PTR) end as DEPT_PTR,           '#13#10'data0840.[Location]       ' +
      '  ['#35774#22791#36131#20219#23567#32452'],   data0830.[DeptName]         ['#24037#20316#37096#38376'],'#13#10'Data0836.[Wor' +
      'kName]         ['#24037#20316#20219#21153#21517#31216'],   data0835.[WorkExpl]         ['#24037#20316#20219#21153#35828#26126'],' +
      #13#10'dbo.Data0468.QUAN_BOM       ['#30003#39046#25968#37327'],       dbo.Data0468.QUAN_IS' +
      'SUED    ['#24050#21457#25918#25968#37327'],'#13#10'dbo.Data0468.VENDOR         ['#20379#24212#21830'],         dbo' +
      '.Data0017.INV_PART_NUMBER['#26448#26009#32534#30721'],'#13#10'Data0017.INV_PART_DESCRIPTION ' +
      '['#26448#26009#21517#31216#35268#26684'],data0002.unit_name          ['#21333#20301'],'#13#10'case dbo.Data0468.PR' +
      'INTIT when '#39'Y'#39'then '#39#26222#36890#24211#23384#39' when '#39'N'#39' then '#39'VMI'#24211#23384#39' END AS '#26159#21542'VMI,'#13#10'[' +
      #37329#39069'('#26412#24065#21547#31246')]=(select sum(ROUND(dbo.Data0207.QUANTITY * dbo.Data0022' +
      '.tax_price * dbo.Data0456.exch_rate, 4))       '#13#10'from data0207 j' +
      'oin data0022 on data0022.rkey=data0207.D0022_PTR '#13#10'JOIN Data0456' +
      ' ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY where  D0468_ptr=Da' +
      'ta0468.rkey),'#13#10'['#37329#39069'('#26412#24065#19981#21547#31246')]=(select sum(ROUND((dbo.Data0207.QUANT' +
      'ITY * dbo.Data0022.tax_price * dbo.Data0456.exch_rate) / (1 + db' +
      'o.Data0022.TAX_2 * 0.01), 4)) '#13#10'from data0207 join data0022 on d' +
      'ata0022.rkey=data0207.D0022_PTR  '#13#10'JOIN Data0456 ON dbo.Data0022' +
      '.GRN_PTR = dbo.Data0456.RKEY where  D0468_ptr=Data0468.rkey)'#13#10'FR' +
      'OM dbo.DATA0268 INNER JOIN dbo.Data0034 ON dbo.DATA0268.dept_ptr' +
      ' = dbo.Data0034.RKEY'#13#10'and dbo.DATA0268.ttype in (2,3,4,5) /*2'#32500#20462';' +
      '3'#32500#25252';4'#24037#31243';5'#20844#29992'*/'#13#10'INNER JOIN dbo.Data0005 ON dbo.DATA0268.EMPL_PTR ' +
      '= dbo.Data0005.RKEY '#13#10'LEFT JOIN dbo.Data0005 AS Data0005_1 ON db' +
      'o.DATA0268.auth_emplptr = Data0005_1.RKEY'#13#10'INNER JOIN dbo.Data00' +
      '94 ON dbo.DATA0268.auth_ptr = dbo.Data0094.RKEY '#13#10'INNER JOIN dbo' +
      '.Data0015 ON dbo.DATA0268.warehouse_ptr = dbo.Data0015.RKEY '#13#10'le' +
      'ft join dbo.data0831 on DATA0268.[d831_ptr]=dbo.data0831.rkey '#13#10 +
      'left join data0417 d17_1 on d17_1.FASSET_CODE=data0831.DeviNumb ' +
      #13#10'left join dbo.data0567 on DATA0268.[d567_ptr]=dbo.data0567.rke' +
      'y'#13#10'left join data0417 d17_2 on d17_2.rkey=data0567.FASSET_PTR  '#13 +
      #10'left join dbo.data0835 on DATA0268.[d835_ptr]=dbo.data0835.rkey' +
      ' '#13#10'left join data0840 on  DATA0268.[d840_ptr]=dbo.data0840.rkey ' +
      #13#10'left join dbo.data0830 on data0835.[Dept_ptr]=data0830.rkey  '#13 +
      #10'left join dbo.Data0836 on data0835.[Work_ptr]=data0836.rkey '#13#10'j' +
      'oin Data0468 on DATA0268.rkey=Data0468.FLOW_NO'#13#10'join dbo.Data001' +
      '7 ON dbo.Data0468.INVENT_PTR = dbo.Data0017.RKEY'#13#10'join data0002 ' +
      'on data0017.STOCK_UNIT_PTR=data0002.rkey '#13#10'where (dbo.DATA0268.[' +
      'DATE]>=:SD and dbo.DATA0268.[DATE]<=:ED  )and (data0268.status =' +
      '4))as f1 '#13#10'left join data0034 on data0034.rkey=f1.DEPT_PTR)as f2'
    F_SQLOrderBy = 'order by '#30003#39046#21333#21495
    object cdsMainCDSDesigner: TStringField
      FieldName = #30003#39046#21333#21495
      Size = 10
    end
    object cdsMainCDSDesigner2: TDateTimeField
      FieldName = #30003#35831#26085#26399
    end
    object cdsMainCDSDesigner3: TDateTimeField
      FieldName = #23457#26680#26085#26399
    end
    object cdsMainCDSDesigner4: TStringField
      FieldName = #22791#27880
      Size = 100
    end
    object cdsMainCDSDesigner5: TStringField
      FieldName = #20351#29992#37096#38376
      Size = 10
    end
    object cdsMainCDSDesigner6: TStringField
      FieldName = #37096#38376#21517#31216
      Size = 30
    end
    object cdsMainCDSDesigner7: TStringField
      FieldName = #30003#39046#20154#20195#30721
      Size = 10
    end
    object cdsMainCDSDesigner8: TStringField
      FieldName = #30003#39046#21592#24037#21517#31216
      Size = 16
    end
    object cdsMainCDSDesigner9: TStringField
      FieldName = #23457#26680#21592#24037#20195#30721
      Size = 10
    end
    object cdsMainCDSDesigner10: TStringField
      FieldName = #23457#26680#21592#24037#21517#31216
      Size = 16
    end
    object cdsMainCDSDesigner11: TStringField
      FieldName = #23457#26680#29366#24577
      ReadOnly = True
      Size = 6
    end
    object cdsMainCDSDesigner12: TStringField
      FieldName = #23457#25209#27969#31243#20195#30721
      Size = 15
    end
    object cdsMainCDSDesigner13: TStringField
      FieldName = #23457#25209#27969#31243
      Size = 40
    end
    object cdsMainCDSDesigner14: TStringField
      FieldName = #24037#21378
      Size = 10
    end
    object cdsMainCDSDesigner15: TBooleanField
      FieldName = #25171#21360#21542
    end
    object cdsMainCDSDesigner16: TStringField
      FieldName = #30830#35748#29366#24577
      ReadOnly = True
      Size = 6
    end
    object cdsMainCDSDesigner17: TStringField
      FieldName = #31867#22411
      ReadOnly = True
      Size = 4
    end
    object cdsMainCDSDesigner24: TStringField
      FieldName = #35774#22791#36131#20219#23567#32452
    end
    object cdsMainCDSDesigner18: TStringField
      FieldName = #31354#35843#20107#19994#37096#24037#20316#21333#21495
      Size = 15
    end
    object cdsMainCDSDesigner19: TStringField
      FieldName = #32500#20462#21333#21333#21495
      Size = 15
    end
    object cdsMainCDSDesigner20: TDateTimeField
      FieldName = #20445#20859#26085#26399
    end
    object cdsMainCDSDesigner21: TStringField
      FieldName = #20445#20859#21608#26399
      Size = 10
    end
    object cdsMainCDSDesigner22: TStringField
      FieldName = #35774#22791#32534#21495
      ReadOnly = True
    end
    object cdsMainCDSDesigner23: TStringField
      FieldName = #35774#22791#21517#31216
      ReadOnly = True
      Size = 30
    end
    object cdsMainCDSDesigner36: TStringField
      FieldName = #35774#22791#25152#22312#37096#38376
      Size = 30
    end
    object cdsMainDEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
      ReadOnly = True
    end
    object cdsMainCDSDesigner25: TStringField
      FieldName = #24037#20316#37096#38376
      Size = 50
    end
    object cdsMainCDSDesigner26: TStringField
      FieldName = #24037#20316#20219#21153#21517#31216
      Size = 50
    end
    object cdsMainCDSDesigner27: TStringField
      FieldName = #24037#20316#20219#21153#35828#26126
      Size = 200
    end
    object cdsMainCDSDesigner28: TFloatField
      FieldName = #30003#39046#25968#37327
    end
    object cdsMainCDSDesigner29: TFloatField
      FieldName = #24050#21457#25918#25968#37327
    end
    object cdsMainCDSDesigner34: TBCDField
      FieldName = #37329#39069'('#26412#24065#21547#31246')'
      ReadOnly = True
      Precision = 32
      Size = 8
    end
    object cdsMainCDSDesigner35: TBCDField
      FieldName = #37329#39069'('#26412#24065#19981#21547#31246')'
      ReadOnly = True
      Precision = 32
      Size = 6
    end
    object cdsMainCDSDesigner30: TStringField
      FieldName = #20379#24212#21830
      Size = 15
    end
    object cdsMainCDSDesigner31: TStringField
      FieldName = #26448#26009#32534#30721
      Size = 25
    end
    object cdsMainCDSDesigner32: TStringField
      FieldName = #26448#26009#21517#31216#35268#26684
      ReadOnly = True
      Size = 100
    end
    object cdsMainCDSDesigner33: TStringField
      FieldName = #21333#20301
    end
    object cdsMainVMI: TStringField
      FieldName = #26159#21542'VMI'
      ReadOnly = True
      Size = 8
    end
  end
  inherited dtMain: TADODataSet
    CursorType = ctStatic
    CommandText = 
      'select * from (select f1.*,data0034.DEPT_NAME ['#35774#22791#25152#22312#37096#38376'] from('#13#10'SE' +
      'LECT dbo.DATA0268.number ['#30003#39046#21333#21495'],         dbo.DATA0268.[DATE]    ' +
      '       ['#30003#35831#26085#26399'], '#13#10'dbo.DATA0268.auth_date     ['#23457#26680#26085#26399'],          dbo' +
      '.DATA0268.reference        ['#22791#27880'], '#13#10'dbo.Data0034.DEPT_CODE     ['#30003 +
      #39046#37096#38376'],         dbo.Data0034.DEPT_NAME        ['#37096#38376#21517#31216'],'#13#10'dbo.Data000' +
      '5.EMPL_CODE     ['#30003#39046#20154#20195#30721'],       dbo.Data0005.EMPLOYEE_NAME AS ['#30003#39046 +
      #21592#24037#21517#31216'],'#13#10'Data0005_1.EMPL_CODE AS    ['#23457#26680#21592#24037#20195#30721'],     Data0005_1.EMPL' +
      'OYEE_NAME AS   ['#23457#26680#21592#24037#21517#31216'], '#13#10'dbo.Data0094.PURCHASE_APPROV_DESC ['#23457#25209 +
      #27969#31243'],  dbo.Data0015.ABBR_NAME AS     ['#24037#21378'],  '#13#10'CASE WHEN data0268.' +
      'status = 0 THEN '#39#24453#25552#20132#39' WHEN data0268.status = 1 THEN '#39#24453#23457#26680#39'  '#13#10'WHE' +
      'N data0268.status = 2 THEN '#39#24050#23457#26680#39' WHEN data0268.status  = 3 THEN ' +
      #39#34987#36864#22238#39'  '#13#10'WHEN data0268.status = 4 THEN '#39#24050#21457#26009#39' END AS '#23457#26680#29366#24577',dbo.Dat' +
      'a0094.CODE ['#23457#25209#27969#31243#20195#30721'],'#13#10'CASE WHEN data0268.allow_submit = 0 THEN '#39 +
      #19981#30830#35748#39' WHEN data0268.allow_submit = 1 THEN '#39#24453#30830#35748#39'  '#13#10'WHEN data0268.' +
      'allow_submit = 2 THEN '#39#24050#30830#35748#39'END AS ['#30830#35748#29366#24577'],'#13#10'case dbo.DATA0268.tty' +
      'pe when 2 then '#39#32500#20462#39' when 3 then '#39#32500#25252#39' when 4 then '#39#24037#31243#39' when 5 the' +
      'n '#39#20844#29992#39' end as ['#31867#22411'],'#13#10'dbo.DATA0268.Prted          ['#25171#21360#21542'],        d' +
      'bo.data0835.WorkOrder    ['#31354#35843#20107#19994#37096#24037#20316#21333#21495'],'#13#10'dbo.data0567.NUMBER as   ' +
      '   ['#32500#20462#21333#21333#21495'],    dbo.data0831.PlanMainDate ['#20445#20859#26085#26399'],    '#13#10'dbo.data08' +
      '31.MainCycl       ['#20445#20859#21608#26399'],'#13#10'Case when dbo.DATA0268.TTYPE=2 then(d' +
      '17_2.FASSET_CODE) '#13#10'     when dbo.DATA0268.TTYPE=3 then(data0831' +
      '.DeviNumb) end as ['#35774#22791#32534#21495'], '#13#10'Case when dbo.DATA0268.TTYPE=2 then(' +
      'd17_2.FASSET_NAME) '#13#10'     when dbo.DATA0268.TTYPE=3 then(d17_1.F' +
      'ASSET_NAME) end as ['#35774#22791#21517#31216'],   '#13#10'Case when dbo.DATA0268.TTYPE=2 th' +
      'en(d17_2.DEPT_PTR) '#13#10'     when dbo.DATA0268.TTYPE=3 then(d17_1.D' +
      'EPT_PTR) end as DEPT_PTR,           '#13#10'data0840.[Location]       ' +
      '  ['#35774#22791#36131#20219#23567#32452'],   data0830.[DeptName]         ['#24037#20316#37096#38376'],'#13#10'Data0836.[Wor' +
      'kName]         ['#24037#20316#20219#21153#21517#31216'],   data0835.[WorkExpl]         ['#24037#20316#20219#21153#35828#26126'],' +
      #13#10'dbo.Data0468.QUAN_BOM       ['#30003#39046#25968#37327'],       dbo.Data0468.QUAN_IS' +
      'SUED    ['#24050#21457#25918#25968#37327'],'#13#10'dbo.Data0468.VENDOR         ['#20379#24212#21830'],         dbo' +
      '.Data0017.INV_PART_NUMBER['#26448#26009#32534#30721'],'#13#10'Data0017.INV_PART_DESCRIPTION ' +
      '['#26448#26009#21517#31216'/'#35268#26684'],data0002.unit_name          ['#21333#20301'],'#13#10'case dbo.Data0468.P' +
      'RINTIT when '#39'Y'#39'then '#39#26222#36890#24211#23384#39' when '#39'N'#39' then '#39'VMI'#24211#23384#39' END AS '#26159#21542'VMI,'#13#10 +
      '['#37329#39069'('#26412#24065#21547#31246')]=(select sum(ROUND(dbo.Data0207.QUANTITY * dbo.Data002' +
      '2.tax_price * dbo.Data0456.exch_rate, 4))       '#13#10'from data0207 ' +
      'join data0022 on data0022.rkey=data0207.D0022_PTR '#13#10'JOIN Data045' +
      '6 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY where  D0468_ptr=D' +
      'ata0468.rkey),'#13#10'['#37329#39069'('#26412#24065#19981#21547#31246')]=(select sum(ROUND((dbo.Data0207.QUAN' +
      'TITY * dbo.Data0022.tax_price * dbo.Data0456.exch_rate) / (1 + d' +
      'bo.Data0022.TAX_2 * 0.01), 4)) '#13#10'from data0207 join data0022 on ' +
      'data0022.rkey=data0207.D0022_PTR  '#13#10'JOIN Data0456 ON dbo.Data002' +
      '2.GRN_PTR = dbo.Data0456.RKEY where  D0468_ptr=Data0468.rkey)'#13#10'F' +
      'ROM dbo.DATA0268 INNER JOIN dbo.Data0034 ON dbo.DATA0268.dept_pt' +
      'r = dbo.Data0034.RKEY'#13#10'and dbo.DATA0268.ttype in (2,3,4,5) /*2'#32500#20462 +
      ';3'#32500#25252';4'#24037#31243';5'#20844#29992'*/'#13#10'INNER JOIN dbo.Data0005 ON dbo.DATA0268.EMPL_PTR' +
      ' = dbo.Data0005.RKEY '#13#10'LEFT JOIN dbo.Data0005 AS Data0005_1 ON d' +
      'bo.DATA0268.auth_emplptr = Data0005_1.RKEY'#13#10'INNER JOIN dbo.Data0' +
      '094 ON dbo.DATA0268.auth_ptr = dbo.Data0094.RKEY '#13#10'INNER JOIN db' +
      'o.Data0015 ON dbo.DATA0268.warehouse_ptr = dbo.Data0015.RKEY '#13#10'l' +
      'eft join dbo.data0831 on DATA0268.[d831_ptr]=dbo.data0831.rkey '#13 +
      #10'left join data0417 d17_1 on d17_1.FASSET_CODE=data0831.DeviNumb' +
      ' '#13#10'left join dbo.data0567 on DATA0268.[d567_ptr]=dbo.data0567.rk' +
      'ey'#13#10'left join data0417 d17_2 on d17_2.rkey=data0567.FASSET_PTR  ' +
      #13#10'left join dbo.data0835 on DATA0268.[d835_ptr]=dbo.data0835.rke' +
      'y '#13#10'left join data0840 on  DATA0268.[d840_ptr]=dbo.data0840.rkey' +
      ' '#13#10'left join dbo.data0830 on data0835.[Dept_ptr]=data0830.rkey  ' +
      #13#10'left join dbo.Data0836 on data0835.[Work_ptr]=data0836.rkey '#13#10 +
      'join Data0468 on DATA0268.rkey=Data0468.FLOW_NO'#13#10'join dbo.Data00' +
      '17 ON dbo.Data0468.INVENT_PTR = dbo.Data0017.RKEY'#13#10'join data0002' +
      ' on data0017.STOCK_UNIT_PTR=data0002.rkey '#13#10'where data0268.statu' +
      's =4)as f1 '#13#10'left join data0034 on data0034.rkey=f1.DEPT_PTR)as ' +
      'f2'
  end
  object cds0034: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select  dbo.Data0034.DEPT_CODE '#30003#39046#37096#38376', '#13' dbo.Data0034.DEPT_NAME '#37096#38376 +
      #21517#31216' from data0034'
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 536
    Top = 184
    object cds0034CDSDesigner: TStringField
      FieldName = #30003#39046#37096#38376
      Size = 10
    end
    object cds0034CDSDesigner2: TStringField
      FieldName = #37096#38376#21517#31216
      Size = 30
    end
  end
  object cds0005: TClientDataSet
    Aggregates = <>
    CommandText = ' select EMPL_CODE '#21592#24037#20195#30721',EMPLOYEE_NAME '#21592#24037#21517#31216' from data0005'
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 536
    Top = 248
    object cds0005CDSDesigner: TStringField
      FieldName = #21592#24037#20195#30721
      Size = 10
    end
    object cds0005CDSDesigner2: TStringField
      FieldName = #21592#24037#21517#31216
      Size = 16
    end
  end
  object cds0094: TClientDataSet
    Aggregates = <>
    CommandText = 
      ' select dbo.Data0094.CODE '#23457#25209#27969#31243#20195#30721','#13' dbo.Data0094.PURCHASE_APPROV_' +
      'DESC '#23457#25209#27969#31243' from data0094'
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 536
    Top = 304
    object cds0094CDSDesigner: TStringField
      FieldName = #23457#25209#27969#31243#20195#30721
      Size = 15
    end
    object cds0094CDSDesigner2: TStringField
      FieldName = #23457#25209#27969#31243
      Size = 40
    end
  end
  object cds0015: TClientDataSet
    Aggregates = <>
    CommandText = 'select dbo.Data0015.ABBR_NAME AS '#24037#21378' from data0015'
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 536
    Top = 360
    object cds0015CDSDesigner: TStringField
      FieldName = #24037#21378
      Size = 10
    end
  end
  object cds0417: TClientDataSet
    Aggregates = <>
    CommandText = 'select FASSET_CODE '#35774#22791#32534#21495',FASSET_NAME '#35774#22791#21517#31216' from data0417'
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 536
    Top = 472
    object cds0417CDSDesigner: TStringField
      FieldName = #35774#22791#32534#21495
    end
    object cds0417CDSDesigner2: TStringField
      FieldName = #35774#22791#21517#31216
      Size = 30
    end
  end
  object cds0831: TClientDataSet
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 536
    Top = 416
  end
  object cds835: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select  dbo.data0835.WorkOrder '#31354#35843#20107#19994#37096#24037#20316#21333#21495',data0835.[WorkExpl] '#24037#20316#20219 +
      #21153#35828#26126' '#13#10'from data0835'#13'where AdmiTime>=getdate()-360'#13'order by AdmiT' +
      'ime desc'
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 616
    Top = 232
    object cds835CDSDesigner: TStringField
      DisplayWidth = 12
      FieldName = #31354#35843#20107#19994#37096#24037#20316#21333#21495
      Size = 15
    end
    object cds835CDSDesigner2: TStringField
      DisplayWidth = 100
      FieldName = #24037#20316#20219#21153#35828#26126
      Size = 200
    end
  end
  object cds0017: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select dbo.Data0017.INV_PART_NUMBER '#26448#26009#32534#30721','#13#10#13' dbo.Data0017.INV_PA' +
      'RT_DESCRIPTION ['#26448#26009#21517#31216#35268#26684'] from data0017'
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 624
    Top = 176
    object cds0017CDSDesigner: TStringField
      FieldName = #26448#26009#32534#30721
      Size = 25
    end
    object cds0017CDSDesigner2: TStringField
      FieldName = #26448#26009#21517#31216#35268#26684
      ReadOnly = True
      Size = 100
    end
  end
end
