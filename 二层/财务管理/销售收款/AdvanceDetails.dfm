object Frm_AdvanceDetails: TFrm_AdvanceDetails
  Left = 386
  Top = 227
  Width = 855
  Height = 563
  Caption = #39044#25910#26126#32454#26597#35810
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 847
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 223
      Top = 14
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Label1'
    end
    object Label2: TLabel
      Left = 520
      Top = 14
      Width = 78
      Height = 13
      Caption = #31080#25454#26085#26399#20174#65306
    end
    object Label3: TLabel
      Left = 712
      Top = 14
      Width = 26
      Height = 13
      Caption = #21040#65306
    end
    object Button1: TButton
      Left = 8
      Top = 8
      Width = 57
      Height = 25
      Caption = #20851#38381
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 72
      Top = 8
      Width = 57
      Height = 25
      Caption = #23548#20986
      TabOrder = 1
      OnClick = Button2Click
    end
    object Edit1: TEdit
      Left = 280
      Top = 10
      Width = 121
      Height = 21
      TabOrder = 2
      OnChange = Edit1Change
    end
    object dtpk1: TDateTimePicker
      Left = 602
      Top = 10
      Width = 100
      Height = 21
      Date = 41062.619398148150000000
      Time = 41062.619398148150000000
      TabOrder = 3
      OnChange = dtpk1Change
    end
    object dtpk2: TDateTimePicker
      Left = 736
      Top = 10
      Width = 100
      Height = 21
      Date = 41061.619775752310000000
      Time = 41061.619775752310000000
      TabOrder = 4
      OnChange = dtpk1Change
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 41
    Width = 847
    Height = 491
    Align = alClient
    DataSource = DS152
    FooterColor = clWindow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGridEh1KeyDown
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'reference_no'
        Footers = <>
        Title.Caption = #31080#25454#32534#21495
        Title.Color = clRed
        Title.SortIndex = 1
        Title.SortMarker = smUpEh
        Width = 72
      end
      item
        EditButtons = <>
        FieldName = 'tdate'
        Footers = <>
        Tag = 1
        Title.Caption = #31080#25454#26085#26399
        Width = 90
      end
      item
        EditButtons = <>
        FieldName = 'cust_code'
        Footers = <>
        Title.Caption = #23458#25143#20195#30721
      end
      item
        EditButtons = <>
        FieldName = 'abbr_name'
        Footers = <>
        Title.Caption = #23458#25143#31616#31216
      end
      item
        EditButtons = <>
        FieldName = 'curr_code'
        Footers = <>
        Title.Caption = #36135#24065#20195#30721
        Width = 63
      end
      item
        EditButtons = <>
        FieldName = 'po_number'
        Footers = <>
        Title.Caption = #23458#25143#35746#21333#21495
        Width = 90
      end
      item
        EditButtons = <>
        FieldName = 'manu_part_number'
        Footers = <>
        Title.Caption = #26412#21378#32534#21495
        Width = 111
      end
      item
        EditButtons = <>
        FieldName = 'amount'
        Footers = <>
        Tag = 1
        Title.Caption = #37329#39069
        Width = 75
      end
      item
        EditButtons = <>
        FieldName = 'all_shipqty'
        Footers = <>
        Tag = 1
        Title.Caption = #20801#35768#20986#36135#25968'(pcs)'
        Width = 112
      end
      item
        EditButtons = <>
        FieldName = 'unit_sq'
        Footers = <>
        Tag = 1
        Title.Caption = #20132#36135#21333#21482#38754#31215
        Width = 164
      end
      item
        EditButtons = <>
        FieldName = 'PARTS_ORDERED'
        Footers = <>
        Tag = 1
        Title.Caption = #35746#21333#25968#37327
      end
      item
        EditButtons = <>
        FieldName = 'REMARK'
        Footers = <>
        Width = 131
      end>
  end
  object ADO152: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT Data0114.REFERENCE_NO,Data0114.TDATE,Data0010.CUST_CODE,D' +
      'ata0010.ABBR_NAME,Data0001.CURR_CODE, '#13#10'       DATA0152.PO_NUMBE' +
      'R,Data0114.REMARK,DATA0152.MANU_PART_NUMBER,DATA0152.AMOUNT,DATA' +
      '0152.all_shipqty, '#13#10'       Data0025.unit_sq,tb.PARTS_ORDERED'#13#10'FR' +
      'OM   DATA0152 INNER JOIN'#13#10'       Data0025 ON DATA0152.MANU_PART_' +
      'NUMBER = Data0025.MANU_PART_NUMBER INNER JOIN'#13#10'       Data0114 O' +
      'N DATA0152.SRCE_PTR = Data0114.RKEY INNER JOIN'#13#10'       Data0010 ' +
      'ON Data0114.SRCE_PTR = Data0010.RKEY INNER JOIN'#13#10'       Data0001' +
      ' ON Data0114.CURRECY_PTR = Data0001.RKEY INNER JOIN'#13#10'       (sel' +
      'ect sum(data0060.PARTS_ORDERED) as PARTS_ORDERED,data0097.PO_NUM' +
      'BER'#13#10'        from data0060 inner join data0097 on data0060.PURCH' +
      'ASE_ORDER_PTR = data0097.RKEY'#13#10'        and data0060.CUSTOMER_PTR' +
      ' = data0097.CUSTOMER_PTR group by data0097.PO_NUMBER) AS tb on D' +
      'ATA0152.PO_NUMBER=tb.PO_NUMBER'#13#10'where data0114.tdate>=:vdate1 an' +
      'd data0114.tdate<=:vdate2'
    IndexFieldNames = 'REFERENCE_NO'
    Parameters = <
      item
        Name = 'vdate1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'vdate2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end>
    Left = 32
    Top = 464
    object ADO152reference_no: TStringField
      FieldName = 'reference_no'
      Size = 10
    end
    object ADO152tdate: TDateTimeField
      FieldName = 'tdate'
    end
    object ADO152cust_code: TStringField
      FieldName = 'cust_code'
      Size = 10
    end
    object ADO152abbr_name: TStringField
      FieldName = 'abbr_name'
      Size = 10
    end
    object ADO152curr_code: TStringField
      FieldName = 'curr_code'
      Size = 5
    end
    object ADO152po_number: TStringField
      FieldName = 'po_number'
      Size = 25
    end
    object ADO152manu_part_number: TStringField
      FieldName = 'manu_part_number'
    end
    object ADO152amount: TBCDField
      FieldName = 'amount'
      Precision = 10
      Size = 2
    end
    object ADO152all_shipqty: TIntegerField
      FieldName = 'all_shipqty'
    end
    object ADO152REMARK: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REMARK'
      Size = 60
    end
    object ADO152unit_sq: TFloatField
      FieldName = 'unit_sq'
    end
    object ADO152PARTS_ORDERED: TFloatField
      FieldName = 'PARTS_ORDERED'
    end
  end
  object DS152: TDataSource
    DataSet = ADO152
    Left = 72
    Top = 464
  end
end
