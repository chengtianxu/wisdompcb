object Form_cancelcutno: TForm_cancelcutno
  Left = 243
  Top = 146
  Width = 769
  Height = 572
  Caption = #25972#25209#25237#20135#21462#28040
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 239
    Width = 753
    Height = 6
    Cursor = crVSplit
    Align = alTop
    Color = clBlue
    ParentColor = False
    ResizeStyle = rsLine
  end
  object Panel1: TPanel
    Left = 0
    Top = 495
    Width = 753
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      753
      39)
    object BitBtn1: TBitBtn
      Left = 276
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #30830#23450
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000610B0000610B00000001000000000000000000003300
        00006600000099000000CC000000FF0000000033000033330000663300009933
        0000CC330000FF33000000660000336600006666000099660000CC660000FF66
        000000990000339900006699000099990000CC990000FF99000000CC000033CC
        000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
        0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
        330000333300333333006633330099333300CC333300FF333300006633003366
        33006666330099663300CC663300FF6633000099330033993300669933009999
        3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
        330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
        66006600660099006600CC006600FF0066000033660033336600663366009933
        6600CC336600FF33660000666600336666006666660099666600CC666600FF66
        660000996600339966006699660099996600CC996600FF99660000CC660033CC
        660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
        6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
        990000339900333399006633990099339900CC339900FF339900006699003366
        99006666990099669900CC669900FF6699000099990033999900669999009999
        9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
        990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
        CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
        CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
        CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
        CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
        CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
        FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
        FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
        FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
        FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
        000000808000800000008000800080800000C0C0C00080808000191919004C4C
        4C00B2B2B200E5E5E5005A1E1E00783C3C0096646400C8969600FFC8C800465F
        82005591B9006EB9D7008CD2E600B4E6F000D8E9EC0099A8AC00646F7100E2EF
        F100C56A31000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000EEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE180C
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEE2DFEEEEEEEEEEEEEEEEEEEEEEEEEE181212
        0CEEEEEEEEEEEEEEEEEEEEEEEEE28181DFEEEEEEEEEEEEEEEEEEEEEE18121212
        120CEEEEEEEEEEEEEEEEEEEEE281818181DFEEEEEEEEEEEEEEEEEE1812121212
        12120CEEEEEEEEEEEEEEEEE2818181818181DFEEEEEEEEEEEEEEEE1812120C18
        1212120CEEEEEEEEEEEEEEE28181DFE2818181DFEEEEEEEEEEEEEE18120CEEEE
        181212120CEEEEEEEEEEEEE281DFEEEEE2818181DFEEEEEEEEEEEE180CEEEEEE
        EE181212120CEEEEEEEEEEE2DFEEEEEEEEE2818181DFEEEEEEEEEEEEEEEEEEEE
        EEEE181212120CEEEEEEEEEEEEEEEEEEEEEEE2818181DFEEEEEEEEEEEEEEEEEE
        EEEEEE181212120CEEEEEEEEEEEEEEEEEEEEEEE2818181DFEEEEEEEEEEEEEEEE
        EEEEEEEE1812120CEEEEEEEEEEEEEEEEEEEEEEEEE28181DFEEEEEEEEEEEEEEEE
        EEEEEEEEEE18120CEEEEEEEEEEEEEEEEEEEEEEEEEEE281DFEEEEEEEEEEEEEEEE
        EEEEEEEEEEEE180CEEEEEEEEEEEEEEEEEEEEEEEEEEEEE2DFEEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE}
      NumGlyphs = 2
    end
    object BitBtn2: TBitBtn
      Left = 388
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Cancel = True
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333FFFFF333333000033333388888833333333333F888888FFF333
        000033338811111188333333338833FFF388FF33000033381119999111833333
        38F338888F338FF30000339119933331111833338F388333383338F300003391
        13333381111833338F8F3333833F38F3000039118333381119118338F38F3338
        33F8F38F000039183333811193918338F8F333833F838F8F0000391833381119
        33918338F8F33833F8338F8F000039183381119333918338F8F3833F83338F8F
        000039183811193333918338F8F833F83333838F000039118111933339118338
        F3833F83333833830000339111193333391833338F33F8333FF838F300003391
        11833338111833338F338FFFF883F83300003339111888811183333338FF3888
        83FF83330000333399111111993333333388FFFFFF8833330000333333999999
        3333333333338888883333330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object BitBtn3: TBitBtn
      Left = 332
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Cancel = True
      Caption = #20851#38381
      ModalResult = 2
      TabOrder = 2
      Visible = False
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000710B0000710B00000001000000000000000000003300
        00006600000099000000CC000000FF0000000033000033330000663300009933
        0000CC330000FF33000000660000336600006666000099660000CC660000FF66
        000000990000339900006699000099990000CC990000FF99000000CC000033CC
        000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
        0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
        330000333300333333006633330099333300CC333300FF333300006633003366
        33006666330099663300CC663300FF6633000099330033993300669933009999
        3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
        330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
        66006600660099006600CC006600FF0066000033660033336600663366009933
        6600CC336600FF33660000666600336666006666660099666600CC666600FF66
        660000996600339966006699660099996600CC996600FF99660000CC660033CC
        660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
        6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
        990000339900333399006633990099339900CC339900FF339900006699003366
        99006666990099669900CC669900FF6699000099990033999900669999009999
        9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
        990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
        CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
        CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
        CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
        CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
        CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
        FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
        FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
        FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
        FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
        000000808000800000008000800080800000C0C0C00080808000191919004C4C
        4C00B2B2B200E5E5E5005A1E1E00783C3C0096646400C8969600FFC8C800465F
        82005591B9006EB9D7008CD2E600B4E6F000D8E9EC0099A8AC00646F7100E2EF
        F100C56A31000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000EEEEEEEEEEEE
        F1EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEF1EEEEEEEEEEEEEEEEEEEEEEEEF1E3AC
        E3F1EEEEEEEEEEEEEEEEEEEEEEF1EEACE3F1EEEEEEEEEEEEEEEEEEF1E3E28257
        57E2ACE3F1EEEEEEEEEEEEF1EEE2818181E2ACEEF1EEEEEEEEEEE382578282D7
        578181E2E3EEEEEEEEEEEE81818181D7818181E2EEEEEEEEEEEE57828989ADD7
        57797979F1EEEEEEEEEE8181DEDEACD781818181F1EEEEEEEEEE57898989ADD7
        57AAAAA2D7ADEEEEEEEE81DEDEDEACD781DEDE81D7ACEEEEEEEE57898989ADD7
        57AACEA3AD10EEEEEEEE81DEDEDEACD781DEAC81AC81EEEEEEEE5789825EADD7
        57ABCFE21110EEEEEEEE81DE8181ACD781ACACE28181EEEEEEEE578957D7ADD7
        57ABDE101010101010EE81DE56D7ACD781ACDE818181818181EE57898257ADD7
        57EE10101010101010EE81DE8156ACD781E381818181818181EE57898989ADD7
        57EE82101010101010EE81DEDEDEACD781E381818181818181EE57898989ADD7
        57ACF1821110EEEEEEEE81DEDEDEACD781ACF1818181EEEEEEEE57898989ADD7
        57ABEEAB8910EEEEEEEE81DEDEDEACD781ACE3ACDE81EEEEEEEE57828989ADD7
        57ACEEA3EE89EEEEEEEE8181DEDEACD781ACE381EEDEEEEEEEEEEEDE5E8288D7
        57A2A2A2EEEEEEEEEEEEEEDE8181DED781818181EEEEEEEEEEEEEEEEEEAC8257
        57EEEEEEEEEEEEEEEEEEEEEEEEAC818181EEEEEEEEEEEEEEEEEE}
      NumGlyphs = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 753
    Height = 36
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 335
      Top = 12
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #37197#26009#21333#21495
    end
    object Label2: TLabel
      Left = 4
      Top = 12
      Width = 65
      Height = 13
      Caption = #25237#20135#26085#26399#20174
    end
    object Label3: TLabel
      Left = 172
      Top = 12
      Width = 13
      Height = 13
      Caption = #21040
    end
    object Edit1: TEdit
      Left = 391
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
    object dtpk1: TDateTimePicker
      Left = 70
      Top = 8
      Width = 99
      Height = 21
      Date = 39598.000000000000000000
      Time = 39598.000000000000000000
      TabOrder = 1
      OnCloseUp = dtpk1CloseUp
      OnExit = dtpk1CloseUp
    end
    object dtpk2: TDateTimePicker
      Left = 187
      Top = 8
      Width = 99
      Height = 21
      Date = 39598.000000000000000000
      Time = 39598.000000000000000000
      TabOrder = 2
      OnCloseUp = dtpk1CloseUp
      OnExit = dtpk1CloseUp
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 36
    Width = 753
    Height = 203
    Align = alTop
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghRowHighlight]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGridEh1KeyDown
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'CUT_NO'
        Footers = <>
        Title.Color = clRed
        Title.SortIndex = 1
        Title.SortMarker = smUpEh
        Width = 78
      end
      item
        EditButtons = <>
        FieldName = 'SO_NO'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_NUMBER'
        Footers = <>
        Width = 77
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_DESC'
        Footers = <>
        Width = 107
      end
      item
        ButtonStyle = cbsNone
        EditButtons = <>
        FieldName = 'ISSUE_DATE'
        Footers = <>
        ReadOnly = False
        Width = 78
      end
      item
        EditButtons = <>
        FieldName = 'EMPLOYEE_NAME'
        Footers = <>
        Width = 58
      end
      item
        EditButtons = <>
        FieldName = 'ct_type'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'status'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'ISSUED_QTY'
        Footers = <>
        ReadOnly = False
        Width = 54
      end
      item
        EditButtons = <>
        FieldName = 'PANEL_1_QTY'
        Footers = <>
        ReadOnly = False
        Width = 47
      end
      item
        EditButtons = <>
        FieldName = 'PANEL_2_QTY'
        Footers = <>
        ReadOnly = False
        Width = 45
      end
      item
        EditButtons = <>
        FieldName = 'UPANEL1'
        Footers = <>
        ReadOnly = False
        Width = 58
      end
      item
        EditButtons = <>
        FieldName = 'UPANEL2'
        Footers = <>
        ReadOnly = False
        Width = 58
      end
      item
        EditButtons = <>
        FieldName = 'ORD_REQ_QTY'
        Footers = <>
        Width = 55
      end
      item
        EditButtons = <>
        FieldName = 'ct_rate'
        Footers = <>
        Width = 52
      end>
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 245
    Width = 753
    Height = 250
    Align = alClient
    DataSource = DataSource2
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'WORK_ORDER_NUMBER'
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BEGIN_STEP_NO'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_SCH'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PANELS'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PARTS_PER_PANEL'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SCH_COMPL_DATE'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pnl_size'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = '_status'
        Width = 56
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = ads492
    OnDataChange = DataSource1DataChange
    Left = 96
    Top = 96
  end
  object DataSource2: TDataSource
    DataSet = ads06
    Left = 96
    Top = 136
  end
  object ads492: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    AfterScroll = ads492AfterScroll
    OnCalcFields = ads492CalcFields
    CommandText = 
      'SELECT     dbo.data0492.rkey, dbo.data0492.CUT_NO, dbo.data0492.' +
      'SO_NO, '#13#10'dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_D' +
      'ESC, '#13#10' data0492.WIP_QTY, data0492.waitfor_release,dbo.data0492.' +
      'ISSUED_QTY, '#13#10'dbo.Data0005.EMPLOYEE_NAME, dbo.data0492.PANEL_1_Q' +
      'TY, '#13#10'dbo.data0492.PANEL_2_QTY, dbo.data0492.UPANEL1, dbo.data04' +
      '92.UPANEL2,'#13#10'data0492.PLANNED_QTY, data0492.ORD_REQ_QTY, data049' +
      '2.ttype,'#13#10'dbo.data0492.ISSUE_DATE,data0492.CREATED_BY_PTR,'#13#10'case' +
      ' data0492.ttype when 0 then '#39#35746#21333#25237#20135#39#13#10'when 1 then '#39#34917#26009#25237#20135#39#13#10'when 2 t' +
      'hen '#39'MRB'#37325#25237#39#13#10'when 3 then '#39'MRB'#36820#20462#39#13#10'when 4 then '#39#26495#21495#25237#20135#39#13#10'end as ct_' +
      'type,'#13#10'case data0492.tstatus'#13#10'when 1 then '#39#26410#23457#26680#39#13#10'when 2 then '#39#19981#23457 +
      #26680#39#13#10'end as status,data0492.tstatus,data0492.BOM_PTR,data0492.mrb' +
      '_ptr'#13#10'FROM         dbo.data0492 INNER JOIN'#13#10'    dbo.Data0025 ON ' +
      'dbo.data0492.BOM_PTR = dbo.Data0025.RKEY INNER JOIN'#13#10'    dbo.Dat' +
      'a0005 ON dbo.data0492.CREATED_BY_PTR = dbo.Data0005.RKEY'#13#10'where ' +
      'data0492.tstatus<>0 and '#13#10'          data0492.tstatus<>3 and'#13#10'   ' +
      '       data0492.con_flag<>2 and '#13#10'          data0492.issue_date ' +
      '>= :dtpk1 and'#13#10'          data0492.issue_date <= :dtpk2'
    IndexFieldNames = 'CUT_NO'
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 39448d
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 39600d
      end>
    Left = 136
    Top = 96
    object ads492rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ads492CUT_NO: TStringField
      DisplayLabel = #37197#26009#21333#21495
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object ads492SO_NO: TStringField
      DisplayLabel = #38144#21806#35746#21333
      FieldName = 'SO_NO'
      FixedChar = True
      Size = 12
    end
    object ads492MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ads492MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ads492ISSUED_QTY: TIntegerField
      DisplayLabel = #25237#20135#25968#37327
      FieldName = 'ISSUED_QTY'
    end
    object ads492ISSUE_DATE: TDateTimeField
      DisplayLabel = #25237#20135#26085#26399
      FieldName = 'ISSUE_DATE'
    end
    object ads492EMPLOYEE_NAME: TStringField
      DisplayLabel = #25237#20135#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ads492PANEL_1_QTY: TIntegerField
      DisplayLabel = 'APAN'#25968
      FieldName = 'PANEL_1_QTY'
    end
    object ads492PANEL_2_QTY: TIntegerField
      DisplayLabel = 'BPAN'#25968
      FieldName = 'PANEL_2_QTY'
    end
    object ads492UPANEL1: TIntegerField
      DisplayLabel = 'PCS/APNL'
      FieldName = 'UPANEL1'
    end
    object ads492UPANEL2: TIntegerField
      DisplayLabel = 'PCS/BPNL'
      FieldName = 'UPANEL2'
    end
    object ads492ct_type: TStringField
      DisplayLabel = #25237#20135#31867#22411
      FieldName = 'ct_type'
      ReadOnly = True
      Size = 8
    end
    object ads492status: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'status'
      ReadOnly = True
      Size = 6
    end
    object ads492tstatus: TWordField
      FieldName = 'tstatus'
    end
    object ads492PLANNED_QTY: TIntegerField
      FieldName = 'PLANNED_QTY'
    end
    object ads492ORD_REQ_QTY: TIntegerField
      DisplayLabel = #24453#35745#21010#25968
      FieldName = 'ORD_REQ_QTY'
    end
    object ads492ttype: TWordField
      FieldName = 'ttype'
    end
    object ads492BOM_PTR: TIntegerField
      FieldName = 'BOM_PTR'
    end
    object ads492mrb_ptr: TIntegerField
      FieldName = 'mrb_ptr'
    end
    object ads492ct_rate: TCurrencyField
      DisplayLabel = #36229#25237#29575'%'
      FieldKind = fkCalculated
      FieldName = 'ct_rate'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object ads492WIP_QTY: TIntegerField
      FieldName = 'WIP_QTY'
    end
    object ads492waitfor_release: TIntegerField
      FieldName = 'waitfor_release'
    end
    object ads492CREATED_BY_PTR: TIntegerField
      FieldName = 'CREATED_BY_PTR'
    end
  end
  object ads06: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'SELECT   '#13#10'CUT_NO,WORK_ORDER_NUMBER, BEGIN_STEP_NO, QUAN_SCH, '#13#10 +
      'PANELS, PARTS_PER_PANEL, SCH_COMPL_DATE, pnl_size, '#13#10'WIPMAT_STAT' +
      'US, PROD_STATUS,RKEY,'#13#10'case PROD_STATUS '#13#10'when 2 then '#39#24453#21457#25918#39#13#10'whe' +
      'n 3 then '#39#29983#20135#20013#39#13#10'when 4 then '#39#22806#21457#29983#20135#39#13#10'when 5 then '#39#24453#20837#20179#39#13#10'when 6 th' +
      'en '#39#24453#20998#37197#39#13#10'when 9 then '#39#29983#20135#32467#26463#39#13#10'when 102 then '#39#29983#20135#21069#26242#32531#39#13#10'when 103 th' +
      'en '#39#29983#20135#20013#26242#32531#39#13#10'when 202 then '#39#21462#28040#39#13#10'end as _status, REMARK_PNLS,'#13#10'PA' +
      'NEL_A_B'#13#10'FROM         dbo.Data0006'#13#10'WHERE     (CUT_NO = :CUT_NO)'
    Parameters = <
      item
        Name = 'CUT_NO'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 12
        Value = 'B0018722-0  '
      end>
    Left = 136
    Top = 136
    object ads06WORK_ORDER_NUMBER: TStringField
      DisplayLabel = #20316#19994#21333#21495
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object ads06BEGIN_STEP_NO: TSmallintField
      DisplayLabel = #24320#22987#27493#39588
      FieldName = 'BEGIN_STEP_NO'
    end
    object ads06QUAN_SCH: TFloatField
      DisplayLabel = #35745#21010#25968#37327' '
      FieldName = 'QUAN_SCH'
    end
    object ads06PANELS: TIntegerField
      DisplayLabel = 'PNL'#25968
      FieldName = 'PANELS'
    end
    object ads06PARTS_PER_PANEL: TFloatField
      DisplayLabel = 'PCS/PNL'
      FieldName = 'PARTS_PER_PANEL'
    end
    object ads06SCH_COMPL_DATE: TDateTimeField
      DisplayLabel = #23436#24037#26085#26399
      FieldName = 'SCH_COMPL_DATE'
    end
    object ads06pnl_size: TStringField
      DisplayLabel = #29983#20135#23610#23544
      FieldName = 'pnl_size'
    end
    object ads06WIPMAT_STATUS: TSmallintField
      FieldName = 'WIPMAT_STATUS'
    end
    object ads06PROD_STATUS: TSmallintField
      FieldName = 'PROD_STATUS'
    end
    object ads06CUT_NO: TStringField
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object ads06_status: TStringField
      DisplayLabel = #29366#24577
      FieldName = '_status'
      ReadOnly = True
      Size = 10
    end
    object ads06REMARK_PNLS: TFloatField
      FieldName = 'REMARK_PNLS'
    end
    object ads06RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ads06PANEL_A_B: TIntegerField
      FieldName = 'PANEL_A_B'
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 128
    Top = 336
    object N1: TMenuItem
      Caption = #20462#25913'PNL'#25968#37327
      OnClick = N1Click
    end
  end
end
