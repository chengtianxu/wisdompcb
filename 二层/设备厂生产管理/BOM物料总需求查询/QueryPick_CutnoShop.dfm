object QueryPick_Cutno: TQueryPick_Cutno
  Left = 426
  Top = 125
  Width = 928
  Height = 543
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #36873#25321#29983#20135#21333#21495
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 920
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 48
      Top = 13
      Width = 39
      Height = 13
      Caption = #25628#32034#65306
    end
    object Edit1: TEdit
      Left = 128
      Top = 9
      Width = 161
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
    object CheckBox1: TCheckBox
      Left = 360
      Top = 11
      Width = 57
      Height = 17
      Caption = #20840#36873
      TabOrder = 1
      OnClick = CheckBox1Click
    end
  end
  object Eh1: TDBGridEh
    Left = 0
    Top = 41
    Width = 920
    Height = 437
    Align = alClient
    DataSource = DS_pickitem
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = Eh1KeyDown
    OnTitleClick = Eh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'isselected'
        Footers = <>
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        Title.Caption = #36873#25321
        Width = 50
      end
      item
        EditButtons = <>
        FieldName = 'rkey'
        Footers = <>
        Title.Caption = #32534#21495
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'CUT_NO'
        Footers = <>
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        Title.Caption = #29983#20135#21333#21495
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'PROD_CODE'
        Footers = <>
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        Title.Caption = #24037#31243#32534#30721
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'PRODUCT_NAME'
        Footers = <>
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        Title.Caption = #20135#21697#21517#31216
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'PRODUCT_DESC'
        Footers = <>
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        Title.Caption = #20135#21697#35268#26684
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'ISSUE_DATE'
        Footers = <>
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        Title.Caption = #25237#20135#26085#26399
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'SCH_COMPL_DATE'
        Footers = <>
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        Title.Caption = #23436#24037#26085#26399
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'v_ttype'
        Footers = <>
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        Title.Caption = #25237#20135#31867#22411
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'DEPT_NAME'
        Footers = <>
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        Title.Caption = #29983#20135#37096#38376
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'ABBR_NAME'
        Footers = <>
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        Title.Caption = #23458#25143#31616#31216
        Width = 100
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 478
    Width = 920
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      920
      41)
    object Button1: TButton
      Left = 350
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 454
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object ADS_pickitem: TADODataSet
    Connection = DM.ADOConn1
    CursorType = ctStatic
    AfterOpen = ADS_pickitemAfterOpen
    CommandText = 
      'declare @isselected bit '#13#10'select @isselected=0'#13#10'select @isselect' +
      'ed as isselected,data0492.rkey , data0492.CUT_NO,Data0008.PROD_C' +
      'ODE,Data0008.PRODUCT_NAME,Data0008.PRODUCT_DESC,'#13#10'data0492.ISSUE' +
      '_DATE AS ISSUE_DATE,data0492.SCH_COMPL_DATE AS SCH_COMPL_DATE,'#13#10 +
      'CASE data0492.ttype WHEN 0 THEN '#39#35746#21333#25237#20135#39' WHEN 1 THEN '#39#34917#26009#25237#20135#39' WHEN 4' +
      ' THEN '#39#25353#20135#21697#25237#20135#39' END AS v_ttype,Data0034.DEPT_NAME,'#13#10'Data0010.ABBR_' +
      'NAME   from data0492 INNER JOIN'#13#10'       Data0005 ON data0492.CRE' +
      'ATED_BY_PTR = Data0005.RKEY INNER JOIN'#13#10'       Data0008 ON data0' +
      '492.BOM_PTR = Data0008.RKEY INNER JOIN'#13#10'       Data0034 ON data0' +
      '492.mrb_ptr = Data0034.RKEY INNER JOIN'#13#10'       Data0015 ON data0' +
      '492.WHOUSE_PTR = Data0015.RKEY INNER JOIN'#13#10'       WZCP0070 ON da' +
      'ta0492.SO_NO = WZCP0070.sales_order left JOIN'#13#10'      data0034 da' +
      'ta34s on wzcp0070.entrust_deptptr= data34s.rkey INNER JOIN'#13#10'    ' +
      '   WZCP0071 ON WZCP0071.so_ptr=WZCP0070.RKEY and data0492.BOM_PT' +
      'R = wzcp0071.prod_ptr LEFT OUTER JOIN'#13#10'       Data0010 ON WZCP00' +
      '70.customer_ptr = Data0010.RKEY'#13#10'where   Data0492.TSTATUS in (0,' +
      '2) '
    Parameters = <>
    Left = 32
    Top = 288
    object ADS_pickitemisselected: TBooleanField
      FieldName = 'isselected'
    end
    object ADS_pickitemrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADS_pickitemCUT_NO: TStringField
      FieldName = 'CUT_NO'
      ReadOnly = True
      FixedChar = True
      Size = 12
    end
    object ADS_pickitemPROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      ReadOnly = True
      Size = 25
    end
    object ADS_pickitemPRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      ReadOnly = True
      Size = 30
    end
    object ADS_pickitemPRODUCT_DESC: TStringField
      FieldName = 'PRODUCT_DESC'
      ReadOnly = True
      Size = 200
    end
    object ADS_pickitemISSUE_DATE: TDateTimeField
      FieldName = 'ISSUE_DATE'
    end
    object ADS_pickitemSCH_COMPL_DATE: TDateTimeField
      FieldName = 'SCH_COMPL_DATE'
    end
    object ADS_pickitemv_ttype: TStringField
      FieldName = 'v_ttype'
      Size = 10
    end
    object ADS_pickitemDEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADS_pickitemABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      ReadOnly = True
      Size = 10
    end
  end
  object DSP_pickitem: TDataSetProvider
    DataSet = ADS_pickitem
    Left = 80
    Top = 288
  end
  object CDS_pickitem: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 120
    Top = 288
  end
  object DS_pickitem: TDataSource
    DataSet = CDS_pickitem
    Left = 168
    Top = 288
  end
end
