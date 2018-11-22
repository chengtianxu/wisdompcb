object FrmMain: TFrmMain
  Left = 109
  Top = 82
  Width = 1168
  Height = 647
  Caption = #35746#21333#20986#36135#20215#26684#20998#26512
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 1160
    Height = 620
    Align = alClient
    TabOrder = 0
    object pnl2: TPanel
      Left = 1
      Top = 1
      Width = 1158
      Height = 39
      Align = alTop
      TabOrder = 0
      object lbl_FIeld: TLabel
        Left = 404
        Top = 9
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = #21333#25454#32534#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object btn_Exit: TBitBtn
        Left = 0
        Top = 2
        Width = 57
        Height = 30
        Hint = #36864#20986#31995#32479
        Caption = #36864#20986
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = btn_ExitClick
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
        Left = 58
        Top = 2
        Width = 57
        Height = 30
        Hint = #23548#20986#25968#25454#21040'Excel'
        Caption = #23548#20986
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
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
      object btn_qry: TBitBtn
        Left = 115
        Top = 2
        Width = 57
        Height = 30
        Hint = #37325#26032#23450#20041#26597#35810#26465#20214
        Caption = #26597#35810
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btn_qryClick
        Glyph.Data = {
          C6050000424DC605000000000000360400002800000014000000140000000100
          08000000000090010000C40E0000C40E0000000100000000000000000000E8E0
          0000D0A000006060600038383800F0700000B8B8C00020202000A8B0B000F0F0
          F800B8400000C0600800A0A0A000E0E0E800D8D8E000B8100000D0D8D800C0A0
          8800B8300000F8F8080098989800B0504000B0908800B8706000E0A86000E0D8
          C000F070380088888800F0D8B0005858580008101000E0D0B000B8504000E8C8
          A000F0B85000E8D8A800C8C8C800D8982000D8C0B00050505000C8803800F0C8
          8800F8500800D8A040007078780008080800E8C0880028283000F8980000E8F0
          F00040404000B0B8B800B8A0A000C0682800E0A87800F0800000C8D0D000C898
          8000E0A88000D8904800E0E0E000F0A0000070707000E0783000B0888800E8D0
          6800C8B8A800C8700800D8885000B850180028282000B8887800F0F0D8001818
          1800F070180090909000D8C05800E8B09800F8F0E000F8F0F00048484800B8C0
          C800F0C06000F8F8F800F8805800F8F0C80080808000B8906000B0B0B000D090
          5000F8600000D8D0C800E0A05800B8585800B8B00000B8481000D0D0B000D078
          3000C0702000F0A86800C0602000E8E8E800A8A8A800F0C0B800B0201000F0A8
          4000E0B89000B8B8B80068686800F0F0E800F0982000D8D0A800E8C88000F0E0
          C000B8380800F0800800D8E0E000C0C0C000F0680800B0B0B800C0601800E0B8
          7800F0981000C8781800C0C8C80010101800C8A09000E0B8600030303000F0F0
          F000C0B8B80028282800E8E0E000F0F8F8003838400078787800F0D8B800D8C8
          B800F0C89000E0E8E800B8601000D0883800F8680800D8D0B800E8D08800C8C8
          D000D0D0D000B8B0B00058586000D8D8D8002820200010101000E8E8F000F8F8
          F000D8D0D000B8786000B8480000F0780000F0880000E0B08000B8C0C000B818
          0000C0A88800B8300800B0504800F0E0B000E8D0B000F0D08800F8501000F880
          0800ECFD7F0002000000000000001300E8000100000001000A0000884000F877
          78004B1B00000100000000998400E6775400F71200000101010001D8F8001200
          450090FB7700801FF80077FFFF00FFFF6000F8120000AD84E6007760F8001200
          D80084E677000000000000FFFF0000003800A8F8000038A8F800001800000000
          00000000000044F8120000400000000000000000000028F81200000000000000
          00000000000000000000000C000000000200000000000101120000872B00F877
          0000ECFD7F00000000000002000000006C00001A0200804B1B00007FFF00FFFF
          000000000000804B1B00000500000000870031E6770084F8120000218600E677
          9800F81200006713000010FFFF00000020000100000038A8F800000000000000
          7000F8120000ACF8120000D8F8001200100030001000F8400000105F5400E677
          200001000000D0F8120000D8F80012000800000000000E0000005331B2861D86
          1D861D861D861DF81DC57431F62C9824801414572C572C6C2C6C6C1D6C6C77B2
          6CB2B26C2CDF1232DF6C6CF86CF86C861D1B006C1D0E94530E8A6E8A24240E24
          24240E6F6CB294800E531D31550E4C245524242424515551B26C322453318655
          248A0E557780000086576C002CB20E5398536C31305A55F8CC1424511486B2F3
          1D802453535386534C229457536F066F06242CB2806C065353551D5353511D53
          638C12152477248680F8245353318653531D7755358D35121B57066FF66C2453
          98536C535380240EAA6F631557123551B26C24535353945353B2065398554D35
          776F0624C56C065353551D53536C6F53535355246F152451806C245353319453
          532480535353246F7E8D531D946C245398536C53535314F85353AA2453531480
          576C245353532C5353555314C557776F14002C246C5706535355575353315353
          551B6CF857146E146C2C24535331866C775353555353535353225A35C5B20653
          9853570E57535353535353535353AA08143153315353986C866C2C6C6C1D941D
          861D8680775398535355}
      end
      object edt_value: TEdit
        Left = 460
        Top = 5
        Width = 109
        Height = 21
        TabOrder = 3
        OnChange = edt_valueChange
      end
      object rg_ct: TRadioGroup
        Left = 261
        Top = -1
        Width = 105
        Height = 36
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          #20986#36135
          #36864#36135)
        TabOrder = 4
        OnClick = rg_ctClick
      end
    end
    object pnl3: TPanel
      Left = 1
      Top = 582
      Width = 1158
      Height = 37
      Align = alBottom
      TabOrder = 1
      object lbl1: TLabel
        Left = 114
        Top = 14
        Width = 103
        Height = 13
        Caption = #21152#26435'/'#27611#21033#29575'(%)'#65306
      end
      object lbl2: TLabel
        Left = 555
        Top = 14
        Width = 158
        Height = 13
        Caption = #21152#26435'/'#26631#20934#25104#26412#27611#21033#29575'(%)'#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object lbl3: TLabel
        Left = 338
        Top = 14
        Width = 103
        Height = 13
        Caption = #21152#26435'/'#20928#21033#29575'(%)'#65306
      end
      object edtRate: TEdit
        Left = 225
        Top = 7
        Width = 89
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object edt_SRate: TEdit
        Left = 709
        Top = 7
        Width = 89
        Height = 21
        ReadOnly = True
        TabOrder = 1
        Visible = False
      end
      object edt_JRate: TEdit
        Left = 433
        Top = 7
        Width = 89
        Height = 21
        ReadOnly = True
        TabOrder = 2
      end
    end
    object pnl4: TPanel
      Left = 1
      Top = 40
      Width = 1158
      Height = 542
      Align = alClient
      TabOrder = 2
      object dbgrdhDBGrid1: TDBGridEh
        Left = 1
        Top = 1
        Width = 1156
        Height = 540
        Align = alClient
        DataSource = ds1
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        FooterRowCount = 1
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
        ReadOnly = True
        SortLocal = True
        SumList.Active = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleHeight = 30
        OnKeyDown = dbgrdhDBGrid1KeyDown
        OnTitleClick = dbgrdhDBGrid1TitleClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'SALES_ORDER'
            Footers = <>
            Title.Caption = #38144#21806#35746#21333#32534#21495
          end
          item
            EditButtons = <>
            FieldName = 'CUST_CODE'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #23458#25143#20195#30721
            Title.TitleButton = True
            Width = 76
          end
          item
            EditButtons = <>
            FieldName = 'ABBR_NAME'
            Footers = <>
            Title.Caption = #23458#25143#31616#31216
          end
          item
            EditButtons = <>
            FieldName = 'ROW_NAME'
            Footers = <>
            Title.Caption = #20135#21697#38454#25968
            Width = 77
          end
          item
            EditButtons = <>
            FieldName = 'PRODUCT_NAME'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #20135#21697#31867#21035
            Title.TitleButton = True
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'MANU_PART_NUMBER'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #26412#21378#32534#21495
            Title.TitleButton = True
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'MANU_PART_DESC'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #23458#25143#22411#21495
            Title.TitleButton = True
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'PO_NUMBER'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #23458#25143#35746#21333#21495
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'part_price'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #19981#21547#31246#38144#21806#21333#20215
            Title.TitleButton = True
            Width = 85
          end
          item
            EditButtons = <>
            FieldName = 'part_price2'
            Footers = <>
            Title.Caption = #19981#21547#31246#38144#21806#21333#20215'('#26412#24065')'
          end
          item
            EditButtons = <>
            FieldName = 'total_cost'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #25104#26412#20215#26684'('#26412#24065')'
            Title.TitleButton = True
            Width = 98
          end
          item
            EditButtons = <>
            FieldName = 'rate_margin'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #27611#21033#29575
            Width = 70
          end
          item
            EditButtons = <>
            FieldName = 'stand_rate'
            Footers = <>
            Title.Caption = #26631#20934#25104#26412#27611#21033'%'
            Visible = False
            Width = 54
          end
          item
            EditButtons = <>
            FieldName = #20928#21033#29575
            Footers = <>
            Title.Caption = #25240#29575
          end
          item
            EditButtons = <>
            FieldName = 'PARTS_ORDERED'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #35746#36135#25968#37327
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'DATE_SHIPPED'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #20986#36135#26085#26399
            Title.TitleButton = True
            Width = 85
          end
          item
            EditButtons = <>
            FieldName = 'quan_shipped'
            Footer.FieldName = 'quan_shipped'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #20986#36135#25968#37327
            Title.TitleButton = True
            Width = 78
          end
          item
            EditButtons = <>
            FieldName = 'TotalArea'
            Footer.FieldName = 'TotalArea'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #20986#36135#38754#31215
            Width = 71
          end
          item
            EditButtons = <>
            FieldName = 'amount'
            Footer.FieldName = 'amount'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #20986#36135#37329#39069'('#26412#24065#19981#21547#31246')'
            Width = 83
          end
          item
            EditButtons = <>
            FieldName = #29702#35770#25104#26412
            Footer.FieldName = #29702#35770#25104#26412
            Footer.ValueType = fvtSum
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'CURR_CODE'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #36135#24065
            Title.TitleButton = True
            Width = 44
          end
          item
            EditButtons = <>
            FieldName = 'SALES_REP_NAME'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #19994#21153#20195#34920
            Title.TitleButton = True
            Width = 66
          end
          item
            EditButtons = <>
            FieldName = 'sqft_price'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #24179#31859#20215#65288#19981#21547#31246#20154#27665#24065#65289
            Title.TitleButton = True
            Width = 86
          end
          item
            Alignment = taLeftJustify
            EditButtons = <>
            FieldName = 'UNIT_LEN'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #21333#20803#38271#24230
          end
          item
            Alignment = taLeftJustify
            EditButtons = <>
            FieldName = 'UNIT_WTH'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #21333#20803#23485#24230
          end
          item
            Alignment = taLeftJustify
            EditButtons = <>
            FieldName = 'TUNITS'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = 'PCS/'#25340#26495#21333#20803
          end
          item
            EditButtons = <>
            FieldName = 'TUSAGE'
            Footers = <>
            Title.Caption = #22823#26009#21033#29992#29575
            Width = 66
          end
          item
            EditButtons = <>
            FieldName = 'ORIG_CUSTOMER'
            Footers = <>
            Title.Caption = #20851#32852#21407#23458#25143
          end
          item
            EditButtons = <>
            FieldName = 'TNUMBERs'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #25253#20215#21333#21495
            Width = 120
          end>
      end
    end
  end
  object qry_main: TADOQuery
    Connection = DM.con1
    CursorType = ctStatic
    Filtered = True
    AfterOpen = qry_mainAfterOpen
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     TOP  1  dbo.Data0008.PROD_CODE, dbo.Data0005.EMPLOYEE' +
        '_NAME AS SALES_REP_NAME, dbo.Data0010.CUST_CODE, '
      
        'dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC, dbo.' +
        'Data0060.SALES_ORDER,               '
      
        'dbo.Data0010.ABBR_NAME, dbo.Data0060.PARTS_ORDERED, dbo.Data0085' +
        '.SALES_DISCOUNT, dbo.Data0025.set_lngth AS UNIT_LEN, '
      
        'dbo.Data0025.set_width AS UNIT_WTH, dbo.Data0025.set_qty AS TUNI' +
        'TS, dbo.Data0064.DATE_SHIPPED, dbo.Data0001.CURR_CODE, '
      'dbo.Data0025.ORIG_CUSTOMER,'
      
        'case when dbo.Data0060.EXCH_RATE >0 and    dbo.Data0025.unit_sq>' +
        '0 then '
      
        ' dbo.Data0060.PARTS_ALLOC / dbo.Data0060.EXCH_RATE / dbo.Data002' +
        '5.unit_sq else 0 end AS sqft_price, '
      ' dbo.Data0025.TUSAGE, '
      'ISNULL(dbo.Data0064.QUAN_SHIPPED, 0) AS quan_shipped,    '
      
        'case when dbo.Data0060.EXCH_RATE>0  then  dbo.Data0064.QUAN_SHIP' +
        'PED * dbo.Data0064.part_price / dbo.Data0060.EXCH_RATE  else 0 e' +
        'nd aS amount, '
      
        'ISNULL(dbo.Data0025.unit_sq, 0) AS unit_sq, ISNULL(dbo.Data0064.' +
        'QUAN_SHIPPED, 0) * ISNULL(dbo.Data0025.unit_sq, 0) AS TotalArea,' +
        ' '
      'CASE '
      
        'WHEN (Data0060.PARTS_ALLOC > 0) AND (isnull(dbo.Data0025.tot_acc' +
        'u_matl_per_sqft, 0) + isnull(dbo.Data0025.tot_accu_OVHD_per_sqft' +
        ', 0) > 0) '
      
        'THEN round((dbo.Data0060.PARTS_ALLOC / dbo.Data0060.EXCH_RATE - ' +
        '(isnull(dbo.Data0025.tot_accu_matl_per_sqft, 0) '
      
        '+ isnull(dbo.Data0025.tot_accu_OVHD_per_sqft, 0)) * dbo.Data0025' +
        '.unit_sq) / (dbo.Data0060.PARTS_ALLOC / dbo.Data0060.EXCH_RATE) ' +
        '* 100, 2) '
      
        'ELSE 0 END AS stand_rate, dbo.Data0008.PRODUCT_NAME, dbo.data002' +
        '5.CPJS as ROW_NAME'
      '-- dbo.Data0064.part_price,'
      
        ' ,case  when isnull(bp06.buhanshuijiage_Pcs,0)>0   then isnull(b' +
        'p06.buhanshuijiage_Pcs,0)'
      
        '        when dbo.Data0060.PARTS_ALLOC>0   then  dbo.Data0060.PAR' +
        'TS_ALLOC'
      '        else 0  end as  part_price,  -----'#38144#21806#21407#24065#21333#20215' '
      '        '
      
        ' --        case  when isnull(bp06.buhanshuijiage_Pcs,0)>0   then' +
        ' isnull(bp06.buhanshuijiage_Pcs,0)*isnull(bp06.CurRate,0)'
      
        ' --              when dbo.Data0060.PARTS_ALLOC>0   then  dbo.Dat' +
        'a0060.PARTS_ALLOC/Data0060.EXCH_RATE'
      
        ' --              else 0  end as  part_price2   -----'#38144#21806#26412#24065#21333#20215'      ' +
        ' '
      '          '
      
        ' --,case  when  isnull(bp06.buhanshuijiage_Pcs,0)>0   then  (isn' +
        'ull(bp06.P1P2P3P4P5_Pcs,0)+isnull(baofei_cost_pcs,0))*isnull(bp0' +
        '6.CurRate,0)'
      
        ' --       when isnull(data0085.total_cost,0)>0   and Data0060.EX' +
        'CH_RATE>0  then  data0085.total_cost/Data0060.EXCH_RATE'
      ' --       else 0  end as  total_cost    ---'#25104#26412#26412#24065#21333#20215' '
      '        '
      
        ' --, case  when  isnull(bp06.buhanshuijiage_Pcs,0)>0   then  isn' +
        'ull(bp06.maolilv_add,0)          '
      
        ' --       when isnull(data0085.rate_margin,0)>0   then  data0085' +
        '.rate_margin'
      ' --       else 0    end as  rate_margin     --'#27611#21033#29575' '
      ' '
      
        '  isnull(bp06.buhanshuijiage_Pcs,0)*isnull(bp06.CurRate,0) as  p' +
        'art_price2'
      
        ', (isnull(bp06.P1P2P3P4P5_Pcs,0)+isnull(baofei_cost_pcs,0))*isnu' +
        'll(bp06.CurRate,0) as total_cost'
      ', isnull(bp06.maolilv_add,0) as  rate_margin'
      ''
      
        ',round(((case  when  isnull(bp06.buhanshuijiage_Pcs,0)>0   then ' +
        ' (isnull(bp06.P1P2P3P4P5_Pcs,0)+isnull(baofei_cost_pcs,0))*isnul' +
        'l(bp06.CurRate,0)'
      
        '        when isnull(data0085.total_cost,0)>0   then  data0085.to' +
        'tal_cost/Data0060.EXCH_RATE'
      
        '        else 0  end)*ISNULL(dbo.Data0064.QUAN_SHIPPED, 0)),2) as' +
        ' '#29702#35770#25104#26412
      '        '
      
        ' ,isnull(jinglilv_add,0)  as '#20928#21033#29575',isnull(bp06.AllCost_PCS,0)AllCo' +
        'st_PCS,isnull( bp06.buhanshuijiage_Pcs,0)buhanshuijiage_Pcs     '
      
        ' ,Data0097.PO_NUMBER,case when data0085.TNUMBER is NULL then bp0' +
        '6.BPNO else data0085.TNUMBER end as TNUMBERs      '
      'FROM         dbo.Data0346 RIGHT '
      
        'OUTER JOIN   dbo.Data0085 ON dbo.Data0346.RKEY = dbo.Data0085.EN' +
        'GR_ROUTE_PTR'
      ' RIGHT OUTER JOIN   dbo.Data0001'
      ' INNER JOIN  dbo.Data0025'
      ' INNER JOIN  dbo.Data0010'
      
        ' INNER JOIN  dbo.Data0060 ON dbo.Data0010.RKEY = dbo.Data0060.CU' +
        'STOMER_PTR'
      
        '                           ON dbo.Data0025.RKEY = dbo.Data0060.C' +
        'UST_PART_PTR'
      
        ' left join  bomprice06 bp06 on data0060.bp06_ptr=bp06.idkey     ' +
        '                      '
      
        ' INNER JOIN    dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR = dbo.' +
        'Data0008.RKEY '
      
        '                            ON dbo.Data0001.RKEY = dbo.Data0060.' +
        'CURRENCY_PTR'
      
        ' INNER JOIN   dbo.Data0064 ON dbo.Data0060.RKEY = dbo.Data0064.S' +
        'O_PTR'
      
        ' INNER JOIN    dbo.Data0005 ON dbo.Data0060.COMM_ASSIGNED_BY_E_P' +
        ' = dbo.Data0005.RKEY '
      
        '                             ON dbo.Data0085.RKEY = dbo.Data0060' +
        '.QTE_PTR'
      
        ' inner join  data0015 on data0060.SHIP_REG_TAX_ID= data0015.rkey' +
        ' '
      
        ' inner join Data0097 on Data0060.PURCHASE_ORDER_PTR=Data0097.RKE' +
        'Y '
      'WHERE   1=1')
    Left = 233
    Top = 138
    object strngfld_mainPROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object strngfld_mainSALES_REP_NAME: TStringField
      FieldName = 'SALES_REP_NAME'
      Size = 16
    end
    object strngfld_mainCUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object strngfld_mainMANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object strngfld_mainMANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object strngfld_mainSALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object strngfld_mainABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object fltfld_mainPARTS_ORDERED: TFloatField
      FieldName = 'PARTS_ORDERED'
    end
    object bcdfld_mainSALES_DISCOUNT: TBCDField
      FieldName = 'SALES_DISCOUNT'
      Precision = 4
      Size = 2
    end
    object bcdfld_mainUNIT_LEN: TBCDField
      FieldName = 'UNIT_LEN'
      Precision = 7
      Size = 3
    end
    object bcdfld_mainUNIT_WTH: TBCDField
      FieldName = 'UNIT_WTH'
      Precision = 7
      Size = 3
    end
    object intgrfld_mainTUNITS: TIntegerField
      FieldName = 'TUNITS'
    end
    object dtmfld_mainDATE_SHIPPED: TDateTimeField
      FieldName = 'DATE_SHIPPED'
    end
    object strngfld_mainCURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object strngfld_mainORIG_CUSTOMER: TStringField
      FieldName = 'ORIG_CUSTOMER'
      Size = 10
    end
    object fltfld_mainsqft_price: TFloatField
      FieldName = 'sqft_price'
      ReadOnly = True
    end
    object bcdfld_mainTUSAGE: TBCDField
      FieldName = 'TUSAGE'
      Precision = 5
      Size = 2
    end
    object intgrfld_mainquan_shipped: TIntegerField
      FieldName = 'quan_shipped'
      ReadOnly = True
    end
    object fltfld_mainamount: TFloatField
      FieldName = 'amount'
      ReadOnly = True
    end
    object fltfld_mainunit_sq: TFloatField
      FieldName = 'unit_sq'
      ReadOnly = True
    end
    object fltfld_mainTotalArea: TFloatField
      FieldName = 'TotalArea'
      ReadOnly = True
    end
    object fltfld_mainstand_rate: TFloatField
      FieldName = 'stand_rate'
      ReadOnly = True
    end
    object strngfld_mainPRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object strngfld_mainROW_NAME: TStringField
      FieldName = 'ROW_NAME'
      Size = 30
    end
    object fltfld_mainpart_price: TFloatField
      FieldName = 'part_price'
      ReadOnly = True
    end
    object bcdfld_mainpart_price2: TBCDField
      FieldName = 'part_price2'
      ReadOnly = True
      Precision = 32
      Size = 13
    end
    object bcdfld_maintotal_cost: TBCDField
      FieldName = 'total_cost'
      ReadOnly = True
      Precision = 32
      Size = 13
    end
    object bcdfld_mainrate_margin: TBCDField
      FieldName = 'rate_margin'
      ReadOnly = True
      Precision = 18
      Size = 5
    end
    object fltfld_mainDSDesigner: TFloatField
      FieldName = #29702#35770#25104#26412
      ReadOnly = True
    end
    object bcdfld_mainDSDesigner2: TBCDField
      FieldName = #20928#21033#29575
      ReadOnly = True
      Precision = 18
      Size = 5
    end
    object bcdfld_mainAllCost_PCS: TBCDField
      FieldName = 'AllCost_PCS'
      Precision = 18
      Size = 8
    end
    object bcdfld_mainbuhanshuijiage_Pcs: TBCDField
      FieldName = 'buhanshuijiage_Pcs'
      ReadOnly = True
      Precision = 18
      Size = 8
    end
    object qry_mainPO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 32
    end
    object qry_mainTNUMBERs: TStringField
      FieldName = 'TNUMBERs'
      ReadOnly = True
      Size = 50
    end
  end
  object ds1: TDataSource
    DataSet = qry_main
    Left = 369
    Top = 226
  end
  object qry1: TADOQuery
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     TOP (100) PERCENT dbo.Data0008.PROD_CODE, dbo.Data000' +
        '5.EMPLOYEE_NAME AS SALES_REP_NAME, dbo.Data0010.CUST_CODE, '
      
        'dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC, dbo.' +
        'Data0060.SALES_ORDER,               '
      
        'dbo.Data0010.ABBR_NAME, dbo.Data0060.PARTS_ORDERED, dbo.Data0085' +
        '.SALES_DISCOUNT, dbo.Data0025.set_lngth AS UNIT_LEN, '
      
        'dbo.Data0025.set_width AS UNIT_WTH, dbo.Data0025.set_qty AS TUNI' +
        'TS, dbo.Data0064.DATE_SHIPPED, dbo.Data0001.CURR_CODE, '
      'dbo.Data0025.ORIG_CUSTOMER,'
      
        'case when dbo.Data0060.EXCH_RATE >0 and    dbo.Data0025.unit_sq>' +
        '0 then '
      
        ' dbo.Data0060.PARTS_ALLOC / dbo.Data0060.EXCH_RATE / dbo.Data002' +
        '5.unit_sq else 0 end AS sqft_price, '
      ' dbo.Data0025.TUSAGE, '
      'ISNULL(dbo.Data0064.QUAN_SHIPPED, 0) AS quan_shipped,    '
      
        'case when dbo.Data0060.EXCH_RATE>0  then  dbo.Data0064.QUAN_SHIP' +
        'PED * dbo.Data0064.part_price / dbo.Data0060.EXCH_RATE  else 0 e' +
        'nd aS amount, '
      
        'ISNULL(dbo.Data0025.unit_sq, 0) AS unit_sq, ISNULL(dbo.Data0064.' +
        'QUAN_SHIPPED, 0) * ISNULL(dbo.Data0025.unit_sq, 0) AS TotalArea,' +
        ' '
      'CASE '
      
        'WHEN (Data0060.PARTS_ALLOC > 0) AND (isnull(dbo.Data0025.tot_acc' +
        'u_matl_per_sqft, 0) + isnull(dbo.Data0025.tot_accu_OVHD_per_sqft' +
        ', 0) > 0) '
      
        'THEN round((dbo.Data0060.PARTS_ALLOC / dbo.Data0060.EXCH_RATE - ' +
        '(isnull(dbo.Data0025.tot_accu_matl_per_sqft, 0) '
      
        '+ isnull(dbo.Data0025.tot_accu_OVHD_per_sqft, 0)) * dbo.Data0025' +
        '.unit_sq) / (dbo.Data0060.PARTS_ALLOC / dbo.Data0060.EXCH_RATE) ' +
        '* 100, 2) '
      
        'ELSE 0 END AS stand_rate, dbo.Data0008.PRODUCT_NAME, dbo.data002' +
        '5.CPJS as ROW_NAME'
      '-- dbo.Data0064.part_price,'
      
        ' ,case  when isnull(bp06.buhanshuijiage_Pcs,0)>0  and isnull(bp0' +
        '6.CurRate,0)>0  and isnull(bp06.P1P2P3P4P5_Pcs,0)>0 and isnull(b' +
        'aofei_cost_pcs,0)>0  and isnull(bp06.maolilv_add,0)>0  then'
      '              isnull(bp06.buhanshuijiage_Pcs,0)'
      
        '        when dbo.Data0060.PARTS_ALLOC>0   then  dbo.Data0060.PAR' +
        'TS_ALLOC'
      '        else 0  end as  part_price   -----'#38144#21806#21407#24065#21333#20215' '
      '        '
      
        ' --,case when  isnull(bp06.buhanshuijiage_Pcs,0)>0  and isnull(b' +
        'p06.CurRate,0)>0  and isnull(bp06.P1P2P3P4P5_Pcs,0)>0 and isnull' +
        '(baofei_cost_pcs,0)>0  and isnull(bp06.maolilv_add,0)>0 then'
      
        #9'--       isnull(bp06.buhanshuijiage_Pcs,0)*isnull(bp06.CurRate,' +
        '0)'
      
        #9'--   when dbo.Data0060.PARTS_ALLOC>0   then  dbo.Data0060.PARTS' +
        '_ALLOC/Data0060.EXCH_RATE'
      #9'--   else 0  end as  part_price2   -----'#38144#21806#26412#24065#21333#20215'       '
      '          '
      
        ' --,case  when  isnull(bp06.buhanshuijiage_Pcs,0)>0  and isnull(' +
        'bp06.CurRate,0)>0  and isnull(bp06.P1P2P3P4P5_Pcs,0)>0 and isnul' +
        'l(baofei_cost_pcs,0)>0  and isnull(bp06.maolilv_add,0)>0 then'
      
        ' --            (isnull(bp06.P1P2P3P4P5_Pcs,0)+isnull(baofei_cost' +
        '_pcs,0))*isnull(bp06.CurRate,0)'
      
        ' --       when isnull(data0085.total_cost,0)>0   and Data0060.EX' +
        'CH_RATE>0  then  data0085.total_cost/Data0060.EXCH_RATE'
      ' --       else 0  end as  total_cost    ---'#25104#26412#26412#24065#21333#20215' '
      '        '
      
        ' --, case  when  isnull(bp06.buhanshuijiage_Pcs,0)>0  and isnull' +
        '(bp06.CurRate,0)>0  and isnull(bp06.P1P2P3P4P5_Pcs,0)>0 and isnu' +
        'll(baofei_cost_pcs,0)>0  and isnull(bp06.maolilv_add,0)>0  then'
      ' --               isnull(bp06.maolilv_add,0)          '
      
        ' --       when isnull(data0085.rate_margin,0)>0   then  data0085' +
        '.rate_margin'
      ' --       else 0    end as  rate_margin     --'#27611#21033#29575' '
      ' '
      
        ' , isnull(bp06.buhanshuijiage_Pcs,0)*isnull(bp06.CurRate,0) as  ' +
        'part_price2'
      
        ', (isnull(bp06.P1P2P3P4P5_Pcs,0)+isnull(baofei_cost_pcs,0))*isnu' +
        'll(bp06.CurRate,0) as total_cost'
      ', isnull(bp06.maolilv_add,0) as  rate_margin'
      ''
      ''
      
        ',round(((case  when  isnull(bp06.buhanshuijiage_Pcs,0)>0   then ' +
        ' (isnull(bp06.P1P2P3P4P5_Pcs,0)+isnull(baofei_cost_pcs,0))*isnul' +
        'l(bp06.CurRate,0)'
      
        '        when isnull(data0085.total_cost,0)>0   then  data0085.to' +
        'tal_cost/Data0060.EXCH_RATE'
      
        '        else 0  end)*ISNULL(dbo.Data0064.QUAN_SHIPPED, 0)),2) as' +
        ' '#29702#35770#25104#26412
      '        '
      
        ' ,isnull(jinglilv_add,0)  as '#20928#21033#29575',isnull(bp06.AllCost_PCS,0)AllCo' +
        'st_PCS,isnull( bp06.buhanshuijiage_Pcs,0)buhanshuijiage_Pcs '
      
        ' ,Data0097.PO_NUMBER,case when data0085.TNUMBER is NULL then bp0' +
        '6.BPNO else data0085.TNUMBER end as TNUMBERs      '
      '         '
      'FROM         dbo.Data0346 RIGHT '
      
        'OUTER JOIN   dbo.Data0085 ON dbo.Data0346.RKEY = dbo.Data0085.EN' +
        'GR_ROUTE_PTR'
      ' RIGHT OUTER JOIN   dbo.Data0001'
      ' INNER JOIN  dbo.Data0025'
      ' INNER JOIN  dbo.Data0010'
      
        ' INNER JOIN  dbo.Data0060 ON dbo.Data0010.RKEY = dbo.Data0060.CU' +
        'STOMER_PTR'
      
        '                           ON dbo.Data0025.RKEY = dbo.Data0060.C' +
        'UST_PART_PTR'
      
        ' left join  bomprice06 bp06 on data0060.bp06_ptr=bp06.idkey     ' +
        '                      '
      
        ' INNER JOIN    dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR = dbo.' +
        'Data0008.RKEY '
      
        '                            ON dbo.Data0001.RKEY = dbo.Data0060.' +
        'CURRENCY_PTR'
      
        ' INNER JOIN   dbo.Data0064 ON dbo.Data0060.RKEY = dbo.Data0064.S' +
        'O_PTR'
      
        ' INNER JOIN    dbo.Data0005 ON dbo.Data0060.COMM_ASSIGNED_BY_E_P' +
        ' = dbo.Data0005.RKEY '
      
        '                             ON dbo.Data0085.RKEY = dbo.Data0060' +
        '.QTE_PTR'
      
        ' inner join  data0015 on data0060.SHIP_REG_TAX_ID= data0015.rkey' +
        '                             '
      
        ' inner join Data0097 on Data0060.PURCHASE_ORDER_PTR=Data0097.RKE' +
        'Y '
      'WHERE   1=1')
    Left = 417
    Top = 144
  end
  object qry2: TADOQuery
    Parameters = <>
    SQL.Strings = (
      
        'SELECT dbo.Data0008.PROD_CODE, Data0005.EMPLOYEE_NAME as SALES_R' +
        'EP_NAME,       '
      
        '      dbo.Data0010.CUST_CODE, dbo.Data0025.MANU_PART_NUMBER,    ' +
        '   '
      '      dbo.Data0025.MANU_PART_DESC,dbo.Data0060.SALES_ORDER,'
      '      ---dbo.Data0060.PARTS_ALLOC as PART_PRICE,       '
      
        '      data0010.ABBR_NAME,dbo.Data0060.PARTS_ORDERED, data0025.OR' +
        'IG_CUSTOMER,  '
      '       dbo.Data0085.SALES_DISCOUNT,      '
      
        'dbo.Data0025.set_lngth as UNIT_LEN,  dbo.Data0025.set_width as U' +
        'NIT_WTH, dbo.Data0025.set_qty as TUNITS,  '
      
        '     dbo.Data0098.RMA_DATE AS DATE_SHIPPED, dbo.Data0001.CURR_CO' +
        'DE,       '
      
        '     case  when dbo.Data0060.EXCH_RATE>0 and  dbo.Data0025.unit_' +
        'sq> 0 '
      
        '     then  dbo.Data0060.PARTS_ALLOC / dbo.Data0060.EXCH_RATE / d' +
        'bo.Data0025.unit_sq  else  0 end AS sqft_price,'
      '      dbo.Data0025.TUSAGE,      '
      ' ISNULL(dbo.Data0098.QTY_AUTH,0) AS quan_shipped,       '
      
        '  case  when dbo.Data0060.EXCH_RATE>0  then dbo.Data0098.QTY_AUT' +
        'H * dbo.Data0060.PARTS_ALLOC / dbo.Data0060.EXCH_RATE  else 0 en' +
        'd  AS amount,     '
      '       ISNULL(Data0025.unit_sq,0) AS unit_sq,      '
      
        '      ISNULL(dbo.Data0098.QTY_AUTH,0)*ISNULL(Data0025.unit_sq,0)' +
        ' AS TotalArea ,  '
      ' CASE '
      ' WHEN (Data0060.PARTS_ALLOC > 0) AND   '
      
        '  (isnull(dbo.Data0025.tot_accu_matl_per_sqft, 0) + isnull(dbo.D' +
        'ata0025.tot_accu_OVHD_per_sqft, 0) > 0)   '
      
        '  THEN round((dbo.Data0060.PARTS_ALLOC / dbo.Data0060.EXCH_RATE ' +
        '- (isnull(dbo.Data0025.tot_accu_matl_per_sqft, 0)   '
      
        '  + isnull(dbo.Data0025.tot_accu_OVHD_per_sqft, 0)) * dbo.Data00' +
        '25.unit_sq) / (dbo.Data0060.PARTS_ALLOC / dbo.Data0060.EXCH_RATE' +
        ') * 100, 2)   '
      
        '  ELSE 0 END AS stand_rate , dbo.Data0008.PRODUCT_NAME,  dbo.dat' +
        'a0025.CPJS as ROW_NAME '
      
        ' ,case  when isnull(bp06.buhanshuijiage_Pcs,0)<>0   then isnull(' +
        'bp06.buhanshuijiage_Pcs,0)'
      
        '        when  dbo.Data0060.PARTS_ALLOC<>0   then  dbo.Data0060.p' +
        'art_price'
      '        else 0  end as  part_price  -----'#38144#21806#21407#24065#21333#20215' '
      '        '
      
        ' --        case  when isnull(bp06.buhanshuijiage_Pcs,0)<>0   the' +
        'n isnull(bp06.buhanshuijiage_Pcs,0)*isnull(curr_rate,0)'
      
        ' --       when dbo.Data0060.part_price<>0   then  dbo.Data0060.p' +
        'art_price/Data0060.EXCH_RATE'
      ' --       else 0  end as  part_price2   -----'#38144#21806#26412#24065#21333#20215'       '
      '          '
      
        ' --,case  when  isnull(bp06.P1P2P3P4P5_Pcs,0)<>0   then  isnull(' +
        'bp06.P1P2P3P4P5_Pcs,0)+isnull(baofei_cost_pcs,0)*isnull(curr_rat' +
        'e,0)'
      
        ' --       when isnull(data0085.total_cost,0)<>0   and Data0060.E' +
        'XCH_RATE<>0  then  data0085.total_cost/Data0060.EXCH_RATE'
      ' --       else 0  end as  total_cost    ---'#25104#26412#26412#24065#21333#20215' '
      '        '
      
        ' --, case  when  isnull(bp06.P1P2P3P4P5_Pcs,0)<>0   then  isnull' +
        '(bp06.maolilv_add,0)          '
      
        ' --       when isnull(data0085.rate_margin,0)<>0   then  data008' +
        '5.rate_margin'
      ' --       else 0    end as  rate_margin     --'#27611#21033#29575' '
      ' '
      
        '  , isnull(bp06.buhanshuijiage_Pcs,0)*isnull(bp06.CurRate,0) as ' +
        ' part_price2'
      
        ', (isnull(bp06.P1P2P3P4P5_Pcs,0)+isnull(baofei_cost_pcs,0))*isnu' +
        'll(bp06.CurRate,0) as total_cost'
      ', isnull(bp06.maolilv_add,0) as  rate_margin'
      ''
      
        ',round(((case  when  isnull(bp06.P1P2P3P4P5_Pcs,0)<>0   then  is' +
        'null(bp06.P1P2P3P4P5_Pcs,0)+isnull(baofei_cost_pcs,0)*isnull(cur' +
        'r_rate,0)'
      
        '        when isnull(data0085.total_cost,0)<>0   then  data0085.t' +
        'otal_cost/Data0060.EXCH_RATE'
      
        '        else 0  end)*ISNULL(dbo.Data0098.QTY_AUTH, 0)),2) as '#29702#35770#25104 +
        #26412
      '        '
      
        ' ,isnull(jinglilv_add,0)  as '#20928#21033#29575',isnull(bp06.AllCost_PCS,0)AllCo' +
        'st_PCS,isnull( bp06.buhanshuijiage_Pcs,0)buhanshuijiage_Pcs '
      
        ' ,Data0097.PO_NUMBER,case when data0085.TNUMBER is NULL then bp0' +
        '6.BPNO else data0085.TNUMBER end as TNUMBERs      '
      '                    '
      'FROM  dbo.Data0001'
      ' INNER JOIN   dbo.Data0025'
      ' INNER JOIN    dbo.Data0010'
      
        ' INNER JOIN     dbo.Data0060 ON dbo.Data0010.RKEY = dbo.Data0060' +
        '.CUSTOMER_PTR '
      
        '                             ON dbo.Data0025.RKEY = dbo.Data0060' +
        '.CUST_PART_PTR  '
      
        '  left join  bomprice06 bp06 on data0060.bp06_ptr=bp06.idkey    ' +
        '                               '
      
        ' INNER JOIN      dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR = db' +
        'o.Data0008.RKEY '
      
        '                              ON dbo.Data0001.RKEY = dbo.Data006' +
        '0.CURRENCY_PTR'
      
        ' INNER JOIN  dbo.Data0098 ON dbo.Data0060.RKEY = dbo.Data0098.SO' +
        '_PTR '
      
        ' LEFT OUTER join dbo.Data0085 ON dbo.Data0060.QTE_PTR = dbo.Data' +
        '0085.RKEY'
      
        ' inner JOIN  dbo.Data0005 ON Data0060.COMM_ASSIGNED_BY_E_P = Dat' +
        'a0005.RKEY '
      
        '  inner join  dbo.Data0346 on dbo.Data0346.RKEY = dbo.Data0085.E' +
        'NGR_ROUTE_PTR  '
      
        ' inner join  data0015 on data0060.SHIP_REG_TAX_ID= data0015.rkey' +
        '                  '
      
        ' inner join Data0097 on Data0060.PURCHASE_ORDER_PTR=Data0097.RKE' +
        'Y '
      'where  1=1'
      '')
    Left = 513
    Top = 144
  end
end
