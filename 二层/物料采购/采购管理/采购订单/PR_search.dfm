object Form_req: TForm_req
  Left = 253
  Top = 141
  Width = 875
  Height = 537
  Caption = #37319#36141#35831#27714#26597#35810
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 41
    Width = 859
    Height = 417
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #25353#35831#36141#32534#21495#23548#20837
      object Splitter1: TSplitter
        Left = 0
        Top = 209
        Width = 851
        Height = 7
        Cursor = crVSplit
        Align = alBottom
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 851
        Height = 209
        Align = alClient
        DataSource = DataSource1
        Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnDblClick = DBGrid1DblClick
        OnKeyDown = DBGrid1KeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'PO_REQ_NUMBER'
            Title.Caption = #35831#36141#32534#21495
            Width = 126
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'abbr_name'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMPLOYEE_NAME'
            Title.Caption = #35831#36141#32773
            Width = 101
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REQ_DATE'
            Title.Caption = #38656#27714#26085#26399
            Width = 79
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'employee_name_appd'
            Title.Caption = #26368#21518#25480#26435#20154#21592
            Width = 112
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'v_flag'
            Title.Caption = #31867#21035
            Visible = True
          end>
      end
      object Panel3: TPanel
        Left = 0
        Top = 216
        Width = 851
        Height = 173
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object DBGrid3: TDBGrid
          Left = 0
          Top = 0
          Width = 851
          Height = 173
          Align = alClient
          DataSource = DataSource3
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'DESCRIPTION_1'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GUI_GE'
              Width = 109
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'abbr_name'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'curr_name'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'unit_name'
              Width = 59
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QUANTITY_REQUIRED'
              Width = 76
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'tax_price'
              Title.Caption = #21547#31246#20215
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'tax'
              Title.Caption = #31246#29575'%'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'reply_date'
              Width = 63
              Visible = True
            end>
        end
        object DBGrid2: TDBGrid
          Left = 0
          Top = 0
          Width = 851
          Height = 173
          Align = alClient
          DataSource = DataSource2
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'INV_PART_NUMBER'
              Width = 107
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'inv_name'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'inv_description'
              Width = 168
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'extra_req'
              Width = 78
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'abbr_name'
              Width = 57
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'curr_name'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'unit_name'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QUANTITY'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'tax_price'
              Title.Caption = #21547#31246#20215
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'tax'
              Title.Caption = #31246#29575'%'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'reply_date'
              Width = 63
              Visible = True
            end>
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #25353#35831#36141#26126#32454#23548#20837
      ImageIndex = 1
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 0
        Width = 851
        Height = 389
        Align = alClient
        DataSource = DataSource4
        FooterColor = clWindow
        FooterFont.Charset = GB2312_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -13
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
        TabOrder = 0
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnKeyDown = DBGridEh1KeyDown
        OnTitleClick = DBGridEh1TitleClick
        Columns = <
          item
            Checkboxes = True
            EditButtons = <>
            FieldName = 'IsSelected'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'INV_PART_NUMBER'
            Footers = <>
            ReadOnly = True
            Title.Color = clRed
            Title.SortIndex = 1
            Title.SortMarker = smUpEh
            Width = 141
          end
          item
            EditButtons = <>
            FieldName = 'INV_NAME'
            Footers = <>
            ReadOnly = True
            Width = 147
          end
          item
            EditButtons = <>
            FieldName = 'INV_DESCRIPTION'
            Footers = <>
            ReadOnly = True
            Width = 171
          end
          item
            EditButtons = <>
            FieldName = 'extra_req'
            Footers = <>
            ReadOnly = True
            Width = 87
          end
          item
            EditButtons = <>
            FieldName = 'CODE'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'ABBR_NAME'
            Footers = <>
            ReadOnly = True
            Width = 78
          end
          item
            EditButtons = <>
            FieldName = 'CURR_NAME'
            Footers = <>
            ReadOnly = True
            Width = 51
          end
          item
            EditButtons = <>
            FieldName = 'UNIT_NAME'
            Footers = <>
            ReadOnly = True
            Width = 28
          end
          item
            EditButtons = <>
            FieldName = 'QUANTITY'
            Footers = <>
            ReadOnly = True
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'tax_price'
            Footers = <>
            ReadOnly = True
            Width = 66
          end
          item
            EditButtons = <>
            FieldName = 'tax'
            Footers = <>
            ReadOnly = True
            Width = 38
          end
          item
            EditButtons = <>
            FieldName = 'reply_date'
            Footers = <>
            ReadOnly = True
            Width = 69
          end
          item
            EditButtons = <>
            FieldName = 'PO_REQ_NUMBER'
            Footers = <>
            ReadOnly = True
            Width = 71
          end
          item
            EditButtons = <>
            FieldName = 'abbr_name15'
            Footers = <>
            ReadOnly = True
          end
          item
            EditButtons = <>
            FieldName = 'flag_oi'
            Footers = <>
            Width = 72
          end
          item
            EditButtons = <>
            FieldName = 'V_FLAG'
            Footers = <>
          end>
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 859
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 125
      Top = 12
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = #37319#27714#32534#21495':'
    end
    object Edit1: TEdit
      Left = 192
      Top = 8
      Width = 169
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
      OnKeyDown = DBGrid1KeyDown
    end
    object BitBtn1: TBitBtn
      Left = 368
      Top = 6
      Width = 25
      Height = 25
      Hint = #21047#26032
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TabStop = False
      OnClick = BitBtn1Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADABFBFBDADADADADADDADADBFADADADADAADADAD000DADADADDADAD0FBF0DA
        DADAADAD0F7FBF0DADADDAD0F7F87BF0DADAAD0F7F87BFB70DADD0F7F87BFB78
        80DA000F87BFB78880ADDAD00BFB78880ADAADADA0B7888740ADDADADA088804
        440AADADADA000A04440DADADADADADA0440ADADADADADADA00D}
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 458
    Width = 859
    Height = 41
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      859
      41)
    object Button1: TButton
      Left = 315
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #30830#23450
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 398
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Cancel = True
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
    object CheckBox1: TCheckBox
      Left = 40
      Top = 8
      Width = 65
      Height = 17
      Caption = #20840#36873
      TabOrder = 2
      OnClick = CheckBox1Click
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    OnDataChange = DataSource1DataChange
    Left = 77
    Top = 150
  end
  object DataSource2: TDataSource
    DataSet = DM.ADO0069
    Left = 243
    Top = 182
  end
  object DataSource3: TDataSource
    DataSet = DM.ADO0204
    Left = 277
    Top = 183
  end
  object ADOQuery1: TADOStoredProc
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = ADOQuery1CalcFields
    ProcedureName = 'ep056;8'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@rkey05'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 105
    Top = 150
    object ADOQuery1RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQuery1PO_REQ_NUMBER: TStringField
      FieldName = 'PO_REQ_NUMBER'
      Size = 15
    end
    object ADOQuery1abbr_name: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'abbr_name'
      Size = 10
    end
    object ADOQuery1REQ_DATE: TDateTimeField
      FieldName = 'REQ_DATE'
    end
    object ADOQuery1FLAG: TStringField
      FieldName = 'FLAG'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1STATUS: TWordField
      FieldName = 'STATUS'
    end
    object ADOQuery1DEPARTMENT_NAME: TStringField
      DisplayLabel = #35831#36141#37096#38376
      FieldName = 'DEPARTMENT_NAME'
      Size = 10
    end
    object ADOQuery1EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADOQuery1employee_name_appd: TStringField
      DisplayLabel = #23457#25209#20154#21592
      FieldName = 'employee_name_appd'
      Size = 16
    end
    object ADOQuery1WAREHOUSE_NAME: TStringField
      DisplayLabel = #24037#21378#20840#31216
      FieldName = 'WAREHOUSE_NAME'
      Size = 70
    end
    object ADOQuery1WHSE_PTR: TIntegerField
      FieldName = 'WHSE_PTR'
    end
    object ADOQuery1v_flag: TStringField
      FieldKind = fkCalculated
      FieldName = 'v_flag'
      Size = 12
      Calculated = True
    end
  end
  object DataSource4: TDataSource
    DataSet = ClientDataSet1
    Left = 420
    Top = 97
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Filtered = True
    IndexFieldNames = 'INV_PART_NUMBER'
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 464
    Top = 97
    object ClientDataSet1IsSelected: TBooleanField
      DisplayLabel = #36873#25321
      FieldName = 'IsSelected'
    end
    object ClientDataSet1INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ClientDataSet1INV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ClientDataSet1INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ClientDataSet1extra_req: TStringField
      DisplayLabel = #29305#21035#35201#27714
      FieldName = 'extra_req'
    end
    object ClientDataSet1ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object ClientDataSet1CURR_NAME: TStringField
      DisplayLabel = #36135#24065#21517#31216
      FieldName = 'CURR_NAME'
    end
    object ClientDataSet1UNIT_NAME: TStringField
      DisplayLabel = #37319#36141#21333#20301
      FieldName = 'UNIT_NAME'
    end
    object ClientDataSet1QUANTITY: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'QUANTITY'
    end
    object ClientDataSet1tax_price: TFloatField
      DisplayLabel = #20215#26684
      FieldName = 'tax_price'
    end
    object ClientDataSet1tax: TFloatField
      DisplayLabel = #31246#29575
      FieldName = 'tax'
    end
    object ClientDataSet1reply_date: TDateTimeField
      DisplayLabel = #22238#22797#20132#26399
      FieldName = 'reply_date'
    end
    object ClientDataSet1PO_REQ_NUMBER: TStringField
      DisplayLabel = #35831#36141#32534#21495
      FieldName = 'PO_REQ_NUMBER'
      Size = 15
    end
    object ClientDataSet1abbr_name15: TStringField
      DisplayLabel = #35831#36141#24037#21378
      FieldName = 'abbr_name15'
      Size = 10
    end
    object ClientDataSet1SUPP_PTR: TIntegerField
      FieldName = 'SUPP_PTR'
    end
    object ClientDataSet1PO_LINK_PTR: TIntegerField
      FieldName = 'PO_LINK_PTR'
    end
    object ClientDataSet1BASE_TO_OTHER: TFloatField
      FieldName = 'BASE_TO_OTHER'
    end
    object ClientDataSet1o_i_flag: TSmallintField
      FieldName = 'o_i_flag'
    end
    object ClientDataSet1CODE: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'CODE'
      Size = 10
    end
    object ClientDataSet1WHSE_PTR: TIntegerField
      FieldName = 'WHSE_PTR'
    end
    object ClientDataSet1INVT_PTR: TIntegerField
      FieldName = 'INVT_PTR'
    end
    object ClientDataSet1UNIT_PTR: TIntegerField
      FieldName = 'UNIT_PTR'
    end
    object ClientDataSet1UNIT_PRICE: TFloatField
      FieldName = 'UNIT_PRICE'
    end
    object ClientDataSet1CONVERSION_FACTOR: TFloatField
      FieldName = 'CONVERSION_FACTOR'
    end
    object ClientDataSet1reason: TStringField
      FieldName = 'reason'
      Size = 60
    end
    object ClientDataSet1avl_flag: TStringField
      FieldName = 'avl_flag'
      FixedChar = True
      Size = 1
    end
    object ClientDataSet1rohs: TStringField
      FieldName = 'rohs'
      Size = 10
    end
    object ClientDataSet1req_unit_ptr: TIntegerField
      FieldName = 'req_unit_ptr'
    end
    object ClientDataSet1IF_CAF: TWideStringField
      FieldName = 'IF_CAF'
      Size = 2
    end
    object ClientDataSet1RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ClientDataSet1flag_oi: TStringField
      DisplayLabel = #25253#34920#26684#24335
      FieldName = 'flag_oi'
      ReadOnly = True
      Size = 6
    end
    object ClientDataSet1FLAG: TStringField
      FieldName = 'FLAG'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object ClientDataSet1V_FLAG: TStringField
      DisplayLabel = #35831#36141#31867#22411
      FieldName = 'V_FLAG'
      ReadOnly = True
      Size = 8
    end
    object ClientDataSet1WAREHOUSE_NAME: TStringField
      FieldName = 'WAREHOUSE_NAME'
      ReadOnly = True
      Size = 70
    end
    object ClientDataSet1IF_urgency: TBooleanField
      FieldName = 'IF_urgency'
      ReadOnly = True
    end
    object ClientDataSet1DEPARTMENT_NAME: TStringField
      DisplayLabel = #35831#36141#37096#38376#20195#30721
      FieldName = 'DEPARTMENT_NAME'
      ReadOnly = True
      Size = 10
    end
    object ClientDataSet1EMPLOYEE_NAME: TStringField
      DisplayLabel = #35831#36141#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      ReadOnly = True
      Size = 16
    end
    object ClientDataSet1ORIG_ABBRNAME: TStringField
      FieldName = 'ORIG_ABBRNAME'
      ReadOnly = True
      Size = 16
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = ADODataSet1
    Left = 500
    Top = 97
  end
  object ADODataSet1: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT    Cast(0 as bit) as IsSelected, dbo.Data0017.INV_PART_NU' +
      'MBER, dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION, '#13#10' db' +
      'o.Data0069.extra_req, dbo.Data0023.ABBR_NAME, dbo.Data0001.CURR_' +
      'NAME, '#13#10' dbo.Data0002.UNIT_NAME, dbo.Data0069.QUANTITY, dbo.Data' +
      '0069.tax_price, dbo.Data0069.tax, dbo.Data0069.reply_date, '#13#10' Da' +
      'ta0068.PO_REQ_NUMBER,DATA0068.DEPARTMENT_NAME, Data0015.ABBR_NAM' +
      'E AS abbr_name15, data0015.WAREHOUSE_NAME,'#13#10' dbo.Data0069.SUPP_P' +
      'TR, dbo.Data0069.PO_LINK_PTR, '#13#10' dbo.Data0001.BASE_TO_OTHER, dbo' +
      '.Data0069.o_i_flag, data0005.EMPLOYEE_NAME,'#13#10' dbo.Data0023.CODE,' +
      ' dbo.Data0068.WHSE_PTR, dbo.Data0069.INVT_PTR, dbo.Data0069.UNIT' +
      '_PTR, '#13#10' dbo.Data0069.UNIT_PRICE, dbo.Data0069.CONVERSION_FACTOR' +
      ', dbo.Data0069.reason,'#13#10' dbo.Data0069.avl_flag, dbo.Data0069.roh' +
      's, dbo.Data0069.req_unit_ptr, '#13#10'   dbo.Data0069.IF_CAF, dbo.Data' +
      '0069.RKEY,data0068.FLAG,'#39#32534#30721#35831#36141#39' as V_FLAG,'#13#10'case Data0069.o_i_fla' +
      'g when 0 then'#39#26684#24335#19968#39' when 1 then '#39#26684#24335#20108#39' end as flag_oi, data0069.IF' +
      '_urgency,data0069.ORIG_ABBRNAME'#13#10'FROM         dbo.Data0069 INNER' +
      ' JOIN'#13#10'                      dbo.Data0023 ON dbo.Data0069.SUPP_P' +
      'TR = dbo.Data0023.RKEY INNER JOIN'#13#10'                      dbo.Dat' +
      'a0001 ON dbo.Data0069.PO_LINK_PTR = dbo.Data0001.RKEY INNER JOIN' +
      #13#10'                      dbo.Data0017 ON dbo.Data0069.INVT_PTR = ' +
      'dbo.Data0017.RKEY INNER JOIN'#13#10'                      dbo.Data0002' +
      ' ON dbo.Data0069.UNIT_PTR = dbo.Data0002.RKEY INNER JOIN'#13#10'      ' +
      '                dbo.Data0068 ON dbo.Data0069.PURCH_REQ_PTR = dbo' +
      '.Data0068.RKEY INNER JOIN'#13#10'                      dbo.Data0015 ON' +
      ' dbo.Data0068.WHSE_PTR = dbo.Data0015.RKEY inner join'#13#10'         ' +
      '             data0005 on dbo.Data0068.REQ_BY=Data0005.RKEY '#13#10'WHE' +
      'RE     (dbo.Data0069.status = 0) AND (dbo.Data0068.STATUS = 2)'#13#10 +
      'and ((Data0068.BUYER_PTR =:rkey05) or (data0068.buyer_ptr is nul' +
      'l))'#13#10'union'#13#10'SELECT    Cast(0 as bit) as IsSelected, dbo.Data0204' +
      '.DESCRIPTION_1 AS INV_PART_NUMBER, '#13#10'dbo.Data0204.GUI_GE AS INV_' +
      'NAME, dbo.Data0204.DESCRIPTION_2 AS INV_DESCRIPTION,'#13#10#39#39' AS extr' +
      'a_req, dbo.Data0023.ABBR_NAME, dbo.Data0001.CURR_NAME, '#13#10' dbo.Da' +
      'ta0002.UNIT_NAME, dbo.Data0204.QUANTITY_REQUIRED AS QUANTITY, '#13#10 +
      'dbo.Data0204.tax_price, dbo.Data0204.tax, dbo.Data0204.reply_dat' +
      'e, '#13#10' Data0068.PO_REQ_NUMBER,DATA0068.DEPARTMENT_NAME,Data0015.A' +
      'BBR_NAME AS abbr_name15,data0015.WAREHOUSE_NAME,'#13#10' Data0204.SUPP' +
      'LIER_PTR as SUPP_PTR, Data0204.PO_LINK_PTR, '#13#10' Data0001.BASE_TO_' +
      'OTHER, Data0204.o_i_flag, data0005.EMPLOYEE_NAME,'#13#10' Data0023.COD' +
      'E, Data0068.WHSE_PTR, 0 AS INVT_PTR, Data0204.G_L_PTR AS UNIT_PT' +
      'R, '#13#10' Data0204.UNIT_PRICE, 1 AS CONVERSION_FACTOR, dbo.Data0204.' +
      'reason,'#13#10' '#39'N'#39' AS avl_flag, dbo.Data0204.rohs, dbo.Data0204.G_L_P' +
      'TR AS req_unit_ptr, '#13#10'  '#39'N'#39' as IF_CAF, dbo.Data0204.RKEY,data006' +
      '8.FLAG,'#39#38750#32534#30721#35831#36141#39' as V_FLAG,'#13#10'case Data0204.o_i_flag when 0 then'#39#26684#24335 +
      #19968#39' when 1 then '#39#26684#24335#20108#39' end as flag_oi,data0204.IF_urgency,'#39#39' as or' +
      'ig_abbrname'#13#10'FROM         dbo.Data0204 INNER JOIN'#13#10'             ' +
      '         dbo.Data0023 ON dbo.Data0204.SUPPlier_PTR = dbo.Data002' +
      '3.RKEY INNER JOIN'#13#10'                      dbo.Data0001 ON dbo.Dat' +
      'a0204.PO_LINK_PTR = dbo.Data0001.RKEY INNER JOIN'#13#10'              ' +
      '        dbo.Data0002 ON dbo.Data0204.G_L_PTR = dbo.Data0002.RKEY' +
      ' INNER JOIN'#13#10'                      dbo.Data0068 ON dbo.Data0204.' +
      'PURCHASE_REQ_PTR = dbo.Data0068.RKEY INNER JOIN'#13#10'               ' +
      '       dbo.Data0015 ON dbo.Data0068.WHSE_PTR = dbo.Data0015.RKEY' +
      ' inner join'#13#10'                      data0005 on dbo.Data0068.REQ_' +
      'BY=Data0005.RKEY '#13#10'WHERE     (dbo.Data0204.status = 0) AND (dbo.' +
      'Data0068.STATUS = 2)'#13#10'and ((Data0068.BUYER_PTR =:rkey_05) or (da' +
      'ta0068.buyer_ptr is null))'
    IndexFieldNames = 'INV_PART_NUMBER'
    Parameters = <
      item
        Name = 'rkey05'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'rkey_05'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    Left = 540
    Top = 97
    object ADODataSet1IsSelected: TBooleanField
      FieldName = 'IsSelected'
    end
    object ADODataSet1INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADODataSet1INV_NAME: TStringField
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ADODataSet1INV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ADODataSet1extra_req: TStringField
      FieldName = 'extra_req'
    end
    object ADODataSet1ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object ADODataSet1CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object ADODataSet1UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object ADODataSet1QUANTITY: TFloatField
      FieldName = 'QUANTITY'
    end
    object ADODataSet1tax_price: TFloatField
      FieldName = 'tax_price'
    end
    object ADODataSet1tax: TFloatField
      FieldName = 'tax'
    end
    object ADODataSet1reply_date: TDateTimeField
      FieldName = 'reply_date'
    end
    object ADODataSet1PO_REQ_NUMBER: TStringField
      FieldName = 'PO_REQ_NUMBER'
      Size = 15
    end
    object ADODataSet1abbr_name15: TStringField
      FieldName = 'abbr_name15'
      Size = 10
    end
    object ADODataSet1SUPP_PTR: TIntegerField
      FieldName = 'SUPP_PTR'
    end
    object ADODataSet1PO_LINK_PTR: TIntegerField
      FieldName = 'PO_LINK_PTR'
    end
    object ADODataSet1BASE_TO_OTHER: TFloatField
      FieldName = 'BASE_TO_OTHER'
    end
    object ADODataSet1o_i_flag: TWordField
      FieldName = 'o_i_flag'
    end
    object ADODataSet1CODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object ADODataSet1WHSE_PTR: TIntegerField
      FieldName = 'WHSE_PTR'
    end
    object ADODataSet1INVT_PTR: TIntegerField
      FieldName = 'INVT_PTR'
    end
    object ADODataSet1UNIT_PTR: TIntegerField
      FieldName = 'UNIT_PTR'
    end
    object ADODataSet1UNIT_PRICE: TFloatField
      FieldName = 'UNIT_PRICE'
    end
    object ADODataSet1CONVERSION_FACTOR: TFloatField
      FieldName = 'CONVERSION_FACTOR'
    end
    object ADODataSet1reason: TStringField
      FieldName = 'reason'
      Size = 60
    end
    object ADODataSet1avl_flag: TStringField
      FieldName = 'avl_flag'
      FixedChar = True
      Size = 1
    end
    object ADODataSet1rohs: TStringField
      FieldName = 'rohs'
      Size = 10
    end
    object ADODataSet1req_unit_ptr: TIntegerField
      FieldName = 'req_unit_ptr'
    end
    object ADODataSet1IF_CAF: TWideStringField
      FieldName = 'IF_CAF'
      FixedChar = True
      Size = 2
    end
    object ADODataSet1RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADODataSet1flag_oi: TStringField
      DisplayLabel = #25253#34920#26684#24335
      FieldName = 'flag_oi'
      ReadOnly = True
      Size = 6
    end
    object ADODataSet1FLAG: TStringField
      FieldName = 'FLAG'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object ADODataSet1V_FLAG: TStringField
      FieldName = 'V_FLAG'
      ReadOnly = True
      Size = 8
    end
    object ADODataSet1WAREHOUSE_NAME: TStringField
      FieldName = 'WAREHOUSE_NAME'
      ReadOnly = True
      Size = 70
    end
    object ADODataSet1IF_urgency: TBooleanField
      FieldName = 'IF_urgency'
      ReadOnly = True
    end
    object ADODataSet1DEPARTMENT_NAME: TStringField
      FieldName = 'DEPARTMENT_NAME'
      ReadOnly = True
      Size = 10
    end
    object ADODataSet1EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      ReadOnly = True
      Size = 16
    end
    object ADODataSet1ORIG_ABBRNAME: TStringField
      FieldName = 'ORIG_ABBRNAME'
      ReadOnly = True
      Size = 16
    end
  end
end
