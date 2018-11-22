object Form21: TForm21
  Left = 217
  Top = 191
  Width = 1008
  Height = 623
  Caption = #22312#36884#29289#26009#26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 992
    Height = 38
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 117
      Top = 13
      Width = 79
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '   '#26448#26009#32534#30721':'
    end
    object Label2: TLabel
      Left = 339
      Top = 13
      Width = 24
      Height = 13
      Caption = #20174#65306
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 460
      Top = 13
      Width = 24
      Height = 13
      Caption = #21040#65306
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 788
      Top = 5
      Width = 13
      Height = 13
      AutoSize = False
      Color = clRed
      ParentColor = False
    end
    object Label5: TLabel
      Left = 788
      Top = 22
      Width = 13
      Height = 13
      AutoSize = False
      Color = clBlack
      ParentColor = False
    end
    object Label6: TLabel
      Left = 808
      Top = 4
      Width = 84
      Height = 13
      Caption = #65306#24050#21040#20132#26399#29289#26009
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 808
      Top = 22
      Width = 84
      Height = 13
      Caption = #65306#27491#24120#29366#24577#29289#26009
    end
    object Edit1: TEdit
      Left = 200
      Top = 10
      Width = 128
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
    object CheckBox1: TCheckBox
      Left = 586
      Top = 12
      Width = 79
      Height = 14
      Caption = #22312#36884#29289#26009
      TabOrder = 1
      OnClick = CheckBox1Click
    end
    object CheckBox2: TCheckBox
      Left = 668
      Top = 11
      Width = 109
      Height = 17
      Caption = #24050#21040#20132#26399#29289#26009
      Color = clBtnFace
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 2
      OnClick = CheckBox2Click
    end
    object dtpk1: TDateTimePicker
      Left = 360
      Top = 9
      Width = 97
      Height = 21
      Date = 42990.871589710640000000
      Time = 42990.871589710640000000
      TabOrder = 3
      OnChange = dtpk1Change
    end
    object dtpk2: TDateTimePicker
      Left = 478
      Top = 9
      Width = 97
      Height = 21
      Date = 42990.871589710640000000
      Time = 42990.871589710640000000
      TabOrder = 4
      OnChange = dtpk2Change
    end
    object BitBtn3: TBitBtn
      Left = 3
      Top = 6
      Width = 55
      Height = 29
      Hint = #36864#20986
      Caption = #36864#20986
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      TabStop = False
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
    object BitBtn4: TBitBtn
      Left = 61
      Top = 6
      Width = 55
      Height = 29
      Hint = #23548#20986#25968#25454#21040'Excel'
      Caption = #23548#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = BitBtn4Click
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 38
    Width = 992
    Height = 547
    Align = alClient
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'INV_PART_NUMBER'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_NAME'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_DESCRIPTION'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_NUMBER'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_DATE'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_ORD'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tax_price'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAX_2'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_NAME'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXCHANGE_RATE'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = #35201#27714#21040#36135#26085#26399
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = #26368#21518#25910#36135#26085#26399
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_RECD'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = #27424#36135#25968#37327
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = #35831#36141#21407#22240
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = #29305#21035#35201#27714
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = #29615#20445#31561#32423
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = #26159#21542#32039#24613
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbr_name15'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = #37319#36141#20154#21592
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = #35831#36141#20154#21592
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = #35831#36141#37096#38376
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = #35831#36141#32534#21495
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = #29366#24577
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = #31867#22411
        Width = 60
        Visible = True
      end>
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 38
    Width = 992
    Height = 547
    Align = alClient
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGridEh1DrawColumnCell
    OnKeyDown = DBGridEh1KeyDown
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'INV_PART_NUMBER'
        Footers = <>
        Title.Color = clRed
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = 'INV_NAME'
        Footers = <>
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = 'INV_DESCRIPTION'
        Footers = <>
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = 'PO_NUMBER'
        Footers = <>
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = 'PO_DATE'
        Footers = <>
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = 'ABBR_NAME'
        Footers = <>
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = 'QUAN_ORD'
        Footers = <>
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = 'QUAN_RECD'
        Footers = <>
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = #27424#36135#25968#37327
        Footers = <>
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = 'UNIT_NAME'
        Footers = <>
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = #35201#27714#21040#36135#26085#26399
        Footers = <>
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = #26368#21518#25910#36135#26085#26399
        Footers = <>
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = #26159#21542#32039#24613
        Footers = <>
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = #37319#36141#20154#21592
        Footers = <>
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = #29305#21035#35201#27714
        Footers = <>
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = #35831#36141#21407#22240
        Footers = <>
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = 'tax_price'
        Footers = <>
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = 'TAX_2'
        Footers = <>
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = 'CURR_NAME'
        Footers = <>
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = 'EXCHANGE_RATE'
        Footers = <>
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = #29615#20445#31561#32423
        Footers = <>
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = #35831#36141#32534#21495
        Footers = <>
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = 'abbr_name15'
        Footers = <>
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = #35831#36141#37096#38376
        Footers = <>
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = #35831#36141#20154#21592
        Footers = <>
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = #29366#24577
        Footers = <>
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = #31867#22411
        Footers = <>
        Width = 65
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 104
    Top = 452
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'dtpk1'
        Size = -1
        Value = Null
      end
      item
        Name = 'dtpk2'
        Size = -1
        Value = Null
      end
      item
        Name = 'dtpk3'
        Size = -1
        Value = Null
      end
      item
        Name = 'dtpk4'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, ' +
        'dbo.Data0017.INV_DESCRIPTION, '
      
        '           dbo.Data0070.PO_NUMBER,data0070.PO_DATE,dbo.Data0023.' +
        'ABBR_NAME, dbo.Data0071.QUAN_ORD, '
      
        '          dbo.Data0071.tax_price, dbo.Data0071.TAX_2, dbo.Data00' +
        '01.CURR_NAME, '
      '          dbo.Data0070.EXCHANGE_RATE, dbo.Data0002.UNIT_NAME, '
      
        '          dbo.Data0071.REQ_DATE as '#35201#27714#21040#36135#26085#26399', dbo.Data0071.recd_DAT' +
        'E as '#26368#21518#25910#36135#26085#26399', '
      
        '          dbo.Data0071.QUAN_RECD, dbo.Data0071.QUAN_ORD - dbo.Da' +
        'ta0071.QUAN_RECD AS '#27424#36135#25968#37327','
      
        '           dbo.Data0071.reason as '#35831#36141#21407#22240', dbo.Data0071.extra_req a' +
        's '#29305#21035#35201#27714', '
      
        '           dbo.Data0071.rohs as '#29615#20445#31561#32423', dbo.Data0071.IF_urgency as' +
        ' '#26159#21542#32039#24613', '
      
        '          dbo.Data0015.ABBR_NAME AS abbr_name15, dbo.Data0005.EM' +
        'PLOYEE_NAME as '#37319#36141#20154#21592', '
      
        '          ISNULL(data0005_1.EMPLOYEE_NAME, dbo.Data0070.ANALYSIS' +
        '_CODE_1) as '#35831#36141#20154#21592', '
      
        '          ISNULL(dbo.Data0034.DEPT_NAME, data0034_1.DEPT_NAME)  ' +
        'as '#35831#36141#37096#38376', '
      
        '          ISNULL(dbo.Data0068.PO_REQ_NUMBER, dbo.Data0070.FOB)  ' +
        'as '#35831#36141#32534#21495','
      
        '          case  data0070.STATUS when 1 then '#39#24453#23457#26680#39' when 2 then '#39#34987 +
        #36864#22238#39' when 3 then '#39#24050#20445#30041#39' when 4 then '#39#24050#26242#32531#39
      
        '           when 5 then '#39#24050#23457#26680#39' when 6 then '#39#24050#25910#36135#39' when 7 then '#39#24050#23436#25104#39 +
        ' when 8 then '#39#26410#25552#20132#39' end as '#29366#24577','
      '           '#39#32534#30721#29289#26009#39' as '#31867#22411'          '
      'FROM         dbo.Data0071 INNER JOIN'
      
        '          dbo.Data0070 ON dbo.Data0071.PO_PTR = dbo.Data0070.RKE' +
        'Y INNER JOIN'
      
        '          dbo.Data0017 ON dbo.Data0071.INVT_PTR = dbo.Data0017.R' +
        'KEY INNER JOIN'
      
        '          dbo.Data0023 ON dbo.Data0070.SUPPLIER_POINTER = dbo.Da' +
        'ta0023.RKEY INNER JOIN'
      
        '          dbo.Data0002 ON dbo.Data0071.PURCHASE_UNIT_PTR = dbo.D' +
        'ata0002.RKEY INNER JOIN'
      
        '          dbo.Data0005 ON dbo.Data0070.EMPLOYEE_POINTER = dbo.Da' +
        'ta0005.RKEY INNER JOIN'
      
        '          dbo.Data0015 ON dbo.Data0070.WAREHOUSE_POINTER = dbo.D' +
        'ata0015.RKEY INNER JOIN'
      
        '          dbo.Data0001 ON dbo.Data0070.CURRENCY_PTR = dbo.Data00' +
        '01.RKEY LEFT OUTER JOIN'
      
        '          dbo.Data0069 ON dbo.Data0071.rkey69 = dbo.Data0069.RKE' +
        'Y LEFT OUTER JOIN'
      
        '          dbo.Data0068 ON dbo.Data0069.PURCH_REQ_PTR = dbo.Data0' +
        '068.RKEY LEFT OUTER JOIN'
      
        '          dbo.Data0005 AS data0005_1 ON dbo.Data0068.REQ_BY = da' +
        'ta0005_1.RKEY LEFT OUTER JOIN'
      
        '          dbo.Data0034 ON dbo.Data0068.DEPARTMENT_NAME = dbo.Dat' +
        'a0034.DEPT_CODE LEFT OUTER JOIN'
      
        '          dbo.Data0034 AS data0034_1 ON dbo.Data0070.PO_REV_NO =' +
        ' data0034_1.DEPT_CODE'
      
        'WHERE    dbo.Data0070.PO_DATE >= :dtpk1 and dbo.Data0070.PO_DATE' +
        ' <= :dtpk2  '
      ''
      ''
      ' '
      'union '
      
        'SELECT     dbo.Data0072.DESCRIPTION, dbo.Data0072.GUI_GE, dbo.Da' +
        'ta0072.DESCRIPTION2, '
      
        '           dbo.Data0070.PO_NUMBER,data0070.PO_DATE,dbo.Data0023.' +
        'ABBR_NAME, dbo.Data0072.QUAN_ORD, '
      
        '          dbo.Data0072.tax_price, dbo.Data0072.state_TAX, dbo.Da' +
        'ta0001.CURR_NAME, '
      '          dbo.Data0070.EXCHANGE_RATE, dbo.Data0002.UNIT_NAME, '
      
        '          dbo.Data0072.del_DATE as '#35201#27714#21040#36135#26085#26399', dbo.Data0072.recd_DAT' +
        'E as '#26368#21518#25910#36135#26085#26399', '
      
        '          dbo.Data0072.QUANTITY_RECEIVED, dbo.Data0072.QUAN_ORD ' +
        '- dbo.Data0072.QUANTITY_RECEIVED AS '#27424#36135#25968#37327','
      '           dbo.Data0072.reason as '#35831#36141#21407#22240', '#39#39' as '#29305#21035#35201#27714', '
      
        '           dbo.Data0072.rohs as '#29615#20445#31561#32423', dbo.Data0072.IF_urgency as' +
        ' '#26159#21542#32039#24613', '
      
        '          dbo.Data0015.ABBR_NAME AS abbr_name15, dbo.Data0005.EM' +
        'PLOYEE_NAME as '#37319#36141#20154#21592', '
      
        '          ISNULL(data0005_1.EMPLOYEE_NAME, dbo.Data0070.ANALYSIS' +
        '_CODE_1) as '#35831#36141#20154#21592', '
      
        '          ISNULL(dbo.Data0034.DEPT_NAME, data0034_1.DEPT_NAME)  ' +
        'as '#35831#36141#37096#38376', '
      
        '          ISNULL(dbo.Data0068.PO_REQ_NUMBER, dbo.Data0070.FOB)  ' +
        'as '#35831#36141#32534#21495','
      
        '          case  data0070.STATUS when 1 then '#39#24453#23457#26680#39' when 2 then '#39#34987 +
        #36864#22238#39' when 3 then '#39#24050#20445#30041#39' when 4 then '#39#24050#26242#32531#39
      
        '           when 5 then '#39#24050#23457#26680#39' when 6 then '#39#24050#25910#36135#39' when 7 then '#39#24050#23436#25104#39 +
        ' when 8 then '#39#26410#25552#20132#39' end as '#29366#24577' ,'
      '          '#39#38750#32534#30721#29289#26009#39' as '#31867#22411'           '
      'FROM         dbo.Data0072 INNER JOIN'
      
        '          dbo.Data0070 ON dbo.Data0072.POPTR = dbo.Data0070.RKEY' +
        '  INNER JOIN'
      
        '          dbo.Data0023 ON dbo.Data0070.SUPPLIER_POINTER = dbo.Da' +
        'ta0023.RKEY INNER JOIN'
      
        '          dbo.Data0002 ON dbo.Data0072.UNIT_PTR = dbo.Data0002.R' +
        'KEY INNER JOIN'
      
        '          dbo.Data0005 ON dbo.Data0070.EMPLOYEE_POINTER = dbo.Da' +
        'ta0005.RKEY INNER JOIN'
      
        '          dbo.Data0015 ON dbo.Data0070.WAREHOUSE_POINTER = dbo.D' +
        'ata0015.RKEY INNER JOIN'
      
        '          dbo.Data0001 ON dbo.Data0070.CURRENCY_PTR = dbo.Data00' +
        '01.RKEY LEFT OUTER JOIN'
      
        '          dbo.Data0204 ON dbo.Data0072.rkey204 = dbo.Data0204.RK' +
        'EY LEFT OUTER JOIN'
      
        '          dbo.Data0068 ON dbo.Data0204.PURCHase_REQ_PTR = dbo.Da' +
        'ta0068.RKEY LEFT OUTER JOIN'
      
        '          dbo.Data0005 AS data0005_1 ON dbo.Data0068.REQ_BY = da' +
        'ta0005_1.RKEY LEFT OUTER JOIN'
      
        '          dbo.Data0034 ON dbo.Data0068.DEPARTMENT_NAME = dbo.Dat' +
        'a0034.DEPT_CODE LEFT OUTER JOIN'
      
        '          dbo.Data0034 AS data0034_1 ON dbo.Data0070.PO_REV_NO =' +
        ' data0034_1.DEPT_CODE'
      
        'WHERE   dbo.Data0070.PO_DATE >= :dtpk3 and dbo.Data0070.PO_DATE ' +
        '<= :dtpk4 '
      ''
      ' ')
    Left = 192
    Top = 448
    object ADOQuery1INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      ReadOnly = True
      Size = 60
    end
    object ADOQuery1INV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      ReadOnly = True
      Size = 200
    end
    object ADOQuery1INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      ReadOnly = True
      Size = 70
    end
    object ADOQuery1PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#23450#21333
      FieldName = 'PO_NUMBER'
      ReadOnly = True
      Size = 15
    end
    object ADOQuery1PO_DATE: TDateTimeField
      DisplayLabel = #37319#36141#26085#26399
      FieldName = 'PO_DATE'
      ReadOnly = True
    end
    object ADOQuery1ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'ABBR_NAME'
      ReadOnly = True
      Size = 16
    end
    object ADOQuery1QUAN_ORD: TFloatField
      DisplayLabel = #37319#36141#25968#37327
      FieldName = 'QUAN_ORD'
      ReadOnly = True
    end
    object ADOQuery1tax_price: TFloatField
      DisplayLabel = #21547#31246#20215
      FieldName = 'tax_price'
      ReadOnly = True
    end
    object ADOQuery1TAX_2: TBCDField
      DisplayLabel = #31246#29575
      FieldName = 'TAX_2'
      ReadOnly = True
      Precision = 4
      Size = 2
    end
    object ADOQuery1CURR_NAME: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_NAME'
      ReadOnly = True
    end
    object ADOQuery1EXCHANGE_RATE: TFloatField
      DisplayLabel = #27719#29575
      FieldName = 'EXCHANGE_RATE'
      ReadOnly = True
    end
    object ADOQuery1UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
      ReadOnly = True
    end
    object ADOQuery1DSDesigner: TDateTimeField
      FieldName = #35201#27714#21040#36135#26085#26399
      ReadOnly = True
    end
    object ADOQuery1DSDesigner2: TDateTimeField
      FieldName = #26368#21518#25910#36135#26085#26399
      ReadOnly = True
    end
    object ADOQuery1QUAN_RECD: TFloatField
      DisplayLabel = #25509#25910#25968#37327
      FieldName = 'QUAN_RECD'
      ReadOnly = True
    end
    object ADOQuery1DSDesigner3: TFloatField
      FieldName = #27424#36135#25968#37327
      ReadOnly = True
    end
    object ADOQuery1DSDesigner4: TStringField
      FieldName = #35831#36141#21407#22240
      ReadOnly = True
      Size = 60
    end
    object ADOQuery1DSDesigner5: TStringField
      FieldName = #29305#21035#35201#27714
      ReadOnly = True
      Size = 50
    end
    object ADOQuery1DSDesigner6: TStringField
      FieldName = #29615#20445#31561#32423
      ReadOnly = True
      Size = 10
    end
    object ADOQuery1DSDesigner7: TBooleanField
      FieldName = #26159#21542#32039#24613
      ReadOnly = True
    end
    object ADOQuery1abbr_name15: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'abbr_name15'
      ReadOnly = True
      Size = 10
    end
    object ADOQuery1DSDesigner8: TStringField
      FieldName = #37319#36141#20154#21592
      ReadOnly = True
      Size = 16
    end
    object ADOQuery1DSDesigner9: TStringField
      FieldName = #35831#36141#20154#21592
      ReadOnly = True
      Size = 16
    end
    object ADOQuery1DSDesigner10: TStringField
      FieldName = #35831#36141#37096#38376
      ReadOnly = True
      Size = 30
    end
    object ADOQuery1DSDesigner11: TStringField
      FieldName = #35831#36141#32534#21495
      ReadOnly = True
      Size = 15
    end
    object ADOQuery1DSDesigner12: TStringField
      FieldName = #29366#24577
      ReadOnly = True
      Size = 6
    end
    object ADOQuery1DSDesigner13: TStringField
      FieldName = #31867#22411
      ReadOnly = True
      Size = 10
    end
  end
  object ADOQuery2: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'dtpk1'
        Size = -1
        Value = Null
      end
      item
        Name = 'dtpk2'
        Size = -1
        Value = Null
      end
      item
        Name = 'dtpk3'
        Size = -1
        Value = Null
      end
      item
        Name = 'dtpk4'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, ' +
        'dbo.Data0017.INV_DESCRIPTION, '
      
        '           dbo.Data0070.PO_NUMBER,data0070.PO_DATE,dbo.Data0023.' +
        'ABBR_NAME, dbo.Data0071.QUAN_ORD, '
      
        '          dbo.Data0071.tax_price, dbo.Data0071.TAX_2, dbo.Data00' +
        '01.CURR_NAME, '
      '          dbo.Data0070.EXCHANGE_RATE, dbo.Data0002.UNIT_NAME, '
      
        '          dbo.Data0071.REQ_DATE as '#35201#27714#21040#36135#26085#26399', dbo.Data0071.recd_DAT' +
        'E as '#26368#21518#25910#36135#26085#26399', '
      
        '          dbo.Data0071.QUAN_RECD, dbo.Data0071.QUAN_ORD - dbo.Da' +
        'ta0071.QUAN_RECD AS '#27424#36135#25968#37327','
      
        '           dbo.Data0071.reason as '#35831#36141#21407#22240', dbo.Data0071.extra_req a' +
        's '#29305#21035#35201#27714', '
      
        '           dbo.Data0071.rohs as '#29615#20445#31561#32423', dbo.Data0071.IF_urgency as' +
        ' '#26159#21542#32039#24613', '
      
        '          dbo.Data0015.ABBR_NAME AS abbr_name15, dbo.Data0005.EM' +
        'PLOYEE_NAME as '#37319#36141#20154#21592', '
      
        '          ISNULL(data0005_1.EMPLOYEE_NAME, dbo.Data0070.ANALYSIS' +
        '_CODE_1) as '#35831#36141#20154#21592', '
      
        '          ISNULL(dbo.Data0034.DEPT_NAME, data0034_1.DEPT_NAME)  ' +
        'as '#35831#36141#37096#38376', '
      
        '          ISNULL(dbo.Data0068.PO_REQ_NUMBER, dbo.Data0070.FOB)  ' +
        'as '#35831#36141#32534#21495','
      
        '          case  data0070.STATUS when 1 then '#39#24453#23457#26680#39' when 2 then '#39#34987 +
        #36864#22238#39' when 3 then '#39#24050#20445#30041#39' when 4 then '#39#24050#26242#32531#39
      
        '           when 5 then '#39#24050#23457#26680#39' when 6 then '#39#24050#25910#36135#39' when 7 then '#39#24050#23436#25104#39 +
        ' when 8 then '#39#26410#25552#20132#39' end as '#29366#24577','
      '           '#39#32534#30721#29289#26009#39' as '#31867#22411'          '
      'FROM         dbo.Data0071 INNER JOIN'
      
        '          dbo.Data0070 ON dbo.Data0071.PO_PTR = dbo.Data0070.RKE' +
        'Y INNER JOIN'
      
        '          dbo.Data0017 ON dbo.Data0071.INVT_PTR = dbo.Data0017.R' +
        'KEY INNER JOIN'
      
        '          dbo.Data0023 ON dbo.Data0070.SUPPLIER_POINTER = dbo.Da' +
        'ta0023.RKEY INNER JOIN'
      
        '          dbo.Data0002 ON dbo.Data0071.PURCHASE_UNIT_PTR = dbo.D' +
        'ata0002.RKEY INNER JOIN'
      
        '          dbo.Data0005 ON dbo.Data0070.EMPLOYEE_POINTER = dbo.Da' +
        'ta0005.RKEY INNER JOIN'
      
        '          dbo.Data0015 ON dbo.Data0070.WAREHOUSE_POINTER = dbo.D' +
        'ata0015.RKEY INNER JOIN'
      
        '          dbo.Data0001 ON dbo.Data0070.CURRENCY_PTR = dbo.Data00' +
        '01.RKEY LEFT OUTER JOIN'
      
        '          dbo.Data0069 ON dbo.Data0071.rkey69 = dbo.Data0069.RKE' +
        'Y LEFT OUTER JOIN'
      
        '          dbo.Data0068 ON dbo.Data0069.PURCH_REQ_PTR = dbo.Data0' +
        '068.RKEY LEFT OUTER JOIN'
      
        '          dbo.Data0005 AS data0005_1 ON dbo.Data0068.REQ_BY = da' +
        'ta0005_1.RKEY LEFT OUTER JOIN'
      
        '          dbo.Data0034 ON dbo.Data0068.DEPARTMENT_NAME = dbo.Dat' +
        'a0034.DEPT_CODE LEFT OUTER JOIN'
      
        '          dbo.Data0034 AS data0034_1 ON dbo.Data0070.PO_REV_NO =' +
        ' data0034_1.DEPT_CODE'
      
        ' WHERE  dbo.Data0070.PO_DATE >= :dtpk1 and dbo.Data0070.PO_DATE ' +
        '<= :dtpk2 and  '
      
        '      data0070.STATUS=5 and dbo.Data0071.QUAN_ORD > dbo.Data0071' +
        '.QUAN_RECD '
      ''
      'union '
      
        'SELECT     dbo.Data0072.DESCRIPTION, dbo.Data0072.GUI_GE, dbo.Da' +
        'ta0072.DESCRIPTION2, '
      
        '           dbo.Data0070.PO_NUMBER,data0070.PO_DATE,dbo.Data0023.' +
        'ABBR_NAME, dbo.Data0072.QUAN_ORD, '
      
        '          dbo.Data0072.tax_price, dbo.Data0072.state_TAX, dbo.Da' +
        'ta0001.CURR_NAME, '
      '          dbo.Data0070.EXCHANGE_RATE, dbo.Data0002.UNIT_NAME, '
      
        '          dbo.Data0072.del_DATE as '#35201#27714#21040#36135#26085#26399', dbo.Data0072.recd_DAT' +
        'E as '#26368#21518#25910#36135#26085#26399', '
      
        '          dbo.Data0072.QUANTITY_RECEIVED, dbo.Data0072.QUAN_ORD ' +
        '- dbo.Data0072.QUANTITY_RECEIVED AS '#27424#36135#25968#37327','
      '           dbo.Data0072.reason as '#35831#36141#21407#22240', '#39#39' as '#29305#21035#35201#27714', '
      
        '           dbo.Data0072.rohs as '#29615#20445#31561#32423', dbo.Data0072.IF_urgency as' +
        ' '#26159#21542#32039#24613', '
      
        '          dbo.Data0015.ABBR_NAME AS abbr_name15, dbo.Data0005.EM' +
        'PLOYEE_NAME as '#37319#36141#20154#21592', '
      
        '          ISNULL(data0005_1.EMPLOYEE_NAME, dbo.Data0070.ANALYSIS' +
        '_CODE_1) as '#35831#36141#20154#21592', '
      
        '          ISNULL(dbo.Data0034.DEPT_NAME, data0034_1.DEPT_NAME)  ' +
        'as '#35831#36141#37096#38376', '
      
        '          ISNULL(dbo.Data0068.PO_REQ_NUMBER, dbo.Data0070.FOB)  ' +
        'as '#35831#36141#32534#21495','
      
        '          case  data0070.STATUS when 1 then '#39#24453#23457#26680#39' when 2 then '#39#34987 +
        #36864#22238#39' when 3 then '#39#24050#20445#30041#39' when 4 then '#39#24050#26242#32531#39
      
        '           when 5 then '#39#24050#23457#26680#39' when 6 then '#39#24050#25910#36135#39' when 7 then '#39#24050#23436#25104#39 +
        ' when 8 then '#39#26410#25552#20132#39' end as '#29366#24577' ,'
      '          '#39#38750#32534#30721#29289#26009#39' as '#31867#22411'           '
      'FROM         dbo.Data0072 INNER JOIN'
      
        '          dbo.Data0070 ON dbo.Data0072.POPTR = dbo.Data0070.RKEY' +
        '  INNER JOIN'
      
        '          dbo.Data0023 ON dbo.Data0070.SUPPLIER_POINTER = dbo.Da' +
        'ta0023.RKEY INNER JOIN'
      
        '          dbo.Data0002 ON dbo.Data0072.UNIT_PTR = dbo.Data0002.R' +
        'KEY INNER JOIN'
      
        '          dbo.Data0005 ON dbo.Data0070.EMPLOYEE_POINTER = dbo.Da' +
        'ta0005.RKEY INNER JOIN'
      
        '          dbo.Data0015 ON dbo.Data0070.WAREHOUSE_POINTER = dbo.D' +
        'ata0015.RKEY INNER JOIN'
      
        '          dbo.Data0001 ON dbo.Data0070.CURRENCY_PTR = dbo.Data00' +
        '01.RKEY LEFT OUTER JOIN'
      
        '          dbo.Data0204 ON dbo.Data0072.rkey204 = dbo.Data0204.RK' +
        'EY LEFT OUTER JOIN'
      
        '          dbo.Data0068 ON dbo.Data0204.PURCHase_REQ_PTR = dbo.Da' +
        'ta0068.RKEY LEFT OUTER JOIN'
      
        '          dbo.Data0005 AS data0005_1 ON dbo.Data0068.REQ_BY = da' +
        'ta0005_1.RKEY LEFT OUTER JOIN'
      
        '          dbo.Data0034 ON dbo.Data0068.DEPARTMENT_NAME = dbo.Dat' +
        'a0034.DEPT_CODE LEFT OUTER JOIN'
      
        '          dbo.Data0034 AS data0034_1 ON dbo.Data0070.PO_REV_NO =' +
        ' data0034_1.DEPT_CODE'
      ''
      
        'WHERE dbo.Data0070.PO_DATE >= :dtpk3 and dbo.Data0070.PO_DATE <=' +
        ' :dtpk4 and   '
      
        ' data0070.STATUS=5 and  dbo.Data0072.QUAN_ORD > dbo.Data0072.QUA' +
        'NTITY_RECEIVED ')
    Left = 308
    Top = 444
    object ADOQuery2INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      ReadOnly = True
      Size = 60
    end
    object ADOQuery2INV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      ReadOnly = True
      Size = 200
    end
    object ADOQuery2INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      ReadOnly = True
      Size = 70
    end
    object ADOQuery2PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#23450#21333
      FieldName = 'PO_NUMBER'
      ReadOnly = True
      Size = 15
    end
    object ADOQuery2PO_DATE: TDateTimeField
      DisplayLabel = #37319#36141#26085#26399
      FieldName = 'PO_DATE'
      ReadOnly = True
    end
    object ADOQuery2ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'ABBR_NAME'
      ReadOnly = True
      Size = 16
    end
    object ADOQuery2QUAN_ORD: TFloatField
      DisplayLabel = #37319#36141#25968#37327
      FieldName = 'QUAN_ORD'
      ReadOnly = True
    end
    object ADOQuery2tax_price: TFloatField
      DisplayLabel = #21547#31246#20215
      FieldName = 'tax_price'
      ReadOnly = True
    end
    object ADOQuery2TAX_2: TBCDField
      DisplayLabel = #31246#29575
      FieldName = 'TAX_2'
      ReadOnly = True
      Precision = 4
      Size = 2
    end
    object ADOQuery2CURR_NAME: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_NAME'
      ReadOnly = True
    end
    object ADOQuery2EXCHANGE_RATE: TFloatField
      DisplayLabel = #27719#29575
      FieldName = 'EXCHANGE_RATE'
      ReadOnly = True
    end
    object ADOQuery2UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
      ReadOnly = True
    end
    object ADOQuery2DSDesigner: TDateTimeField
      FieldName = #35201#27714#21040#36135#26085#26399
      ReadOnly = True
    end
    object ADOQuery2DSDesigner2: TDateTimeField
      FieldName = #26368#21518#25910#36135#26085#26399
      ReadOnly = True
    end
    object ADOQuery2QUAN_RECD: TFloatField
      DisplayLabel = #25509#25910#25968#37327
      FieldName = 'QUAN_RECD'
      ReadOnly = True
    end
    object ADOQuery2DSDesigner3: TFloatField
      FieldName = #27424#36135#25968#37327
      ReadOnly = True
    end
    object ADOQuery2DSDesigner4: TStringField
      FieldName = #35831#36141#21407#22240
      ReadOnly = True
      Size = 60
    end
    object ADOQuery2DSDesigner5: TStringField
      FieldName = #29305#21035#35201#27714
      ReadOnly = True
      Size = 50
    end
    object ADOQuery2DSDesigner6: TStringField
      FieldName = #29615#20445#31561#32423
      ReadOnly = True
      Size = 10
    end
    object ADOQuery2DSDesigner7: TBooleanField
      FieldName = #26159#21542#32039#24613
      ReadOnly = True
    end
    object ADOQuery2abbr_name15: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'abbr_name15'
      ReadOnly = True
      Size = 10
    end
    object ADOQuery2DSDesigner8: TStringField
      FieldName = #37319#36141#20154#21592
      ReadOnly = True
      Size = 16
    end
    object ADOQuery2DSDesigner9: TStringField
      FieldName = #35831#36141#20154#21592
      ReadOnly = True
      Size = 16
    end
    object ADOQuery2DSDesigner10: TStringField
      FieldName = #35831#36141#37096#38376
      ReadOnly = True
      Size = 30
    end
    object ADOQuery2DSDesigner11: TStringField
      FieldName = #35831#36141#32534#21495
      ReadOnly = True
      Size = 15
    end
    object ADOQuery2DSDesigner12: TStringField
      FieldName = #29366#24577
      ReadOnly = True
      Size = 6
    end
    object ADOQuery2DSDesigner13: TStringField
      FieldName = #31867#22411
      ReadOnly = True
      Size = 10
    end
  end
  object ADOQuery3: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'dtpk1'
        Size = -1
        Value = Null
      end
      item
        Name = 'dtpk2'
        Size = -1
        Value = Null
      end
      item
        Name = 'dtpk3'
        Size = -1
        Value = Null
      end
      item
        Name = 'dtpk4'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, ' +
        'dbo.Data0017.INV_DESCRIPTION, '
      
        '           dbo.Data0070.PO_NUMBER,data0070.PO_DATE,dbo.Data0023.' +
        'ABBR_NAME, dbo.Data0071.QUAN_ORD, '
      
        '          dbo.Data0071.tax_price, dbo.Data0071.TAX_2, dbo.Data00' +
        '01.CURR_NAME, '
      '          dbo.Data0070.EXCHANGE_RATE, dbo.Data0002.UNIT_NAME, '
      
        '          dbo.Data0071.REQ_DATE as '#35201#27714#21040#36135#26085#26399', dbo.Data0071.recd_DAT' +
        'E as '#26368#21518#25910#36135#26085#26399', '
      
        '          dbo.Data0071.QUAN_RECD, dbo.Data0071.QUAN_ORD - dbo.Da' +
        'ta0071.QUAN_RECD AS '#27424#36135#25968#37327','
      
        '           dbo.Data0071.reason as '#35831#36141#21407#22240', dbo.Data0071.extra_req a' +
        's '#29305#21035#35201#27714', '
      
        '           dbo.Data0071.rohs as '#29615#20445#31561#32423', dbo.Data0071.IF_urgency as' +
        ' '#26159#21542#32039#24613', '
      
        '          dbo.Data0015.ABBR_NAME AS abbr_name15, dbo.Data0005.EM' +
        'PLOYEE_NAME as '#37319#36141#20154#21592', '
      
        '          ISNULL(data0005_1.EMPLOYEE_NAME, dbo.Data0070.ANALYSIS' +
        '_CODE_1) as '#35831#36141#20154#21592', '
      
        '          ISNULL(dbo.Data0034.DEPT_NAME, data0034_1.DEPT_NAME)  ' +
        'as '#35831#36141#37096#38376', '
      
        '          ISNULL(dbo.Data0068.PO_REQ_NUMBER, dbo.Data0070.FOB)  ' +
        'as '#35831#36141#32534#21495','
      
        '          case  data0070.STATUS when 1 then '#39#24453#23457#26680#39' when 2 then '#39#34987 +
        #36864#22238#39' when 3 then '#39#24050#20445#30041#39' when 4 then '#39#24050#26242#32531#39
      
        '           when 5 then '#39#24050#23457#26680#39' when 6 then '#39#24050#25910#36135#39' when 7 then '#39#24050#23436#25104#39 +
        ' when 8 then '#39#26410#25552#20132#39' end as '#29366#24577','
      '           '#39#32534#30721#29289#26009#39' as '#31867#22411'          '
      'FROM         dbo.Data0071 INNER JOIN'
      
        '          dbo.Data0070 ON dbo.Data0071.PO_PTR = dbo.Data0070.RKE' +
        'Y INNER JOIN'
      
        '          dbo.Data0017 ON dbo.Data0071.INVT_PTR = dbo.Data0017.R' +
        'KEY INNER JOIN'
      
        '          dbo.Data0023 ON dbo.Data0070.SUPPLIER_POINTER = dbo.Da' +
        'ta0023.RKEY INNER JOIN'
      
        '          dbo.Data0002 ON dbo.Data0071.PURCHASE_UNIT_PTR = dbo.D' +
        'ata0002.RKEY INNER JOIN'
      
        '          dbo.Data0005 ON dbo.Data0070.EMPLOYEE_POINTER = dbo.Da' +
        'ta0005.RKEY INNER JOIN'
      
        '          dbo.Data0015 ON dbo.Data0070.WAREHOUSE_POINTER = dbo.D' +
        'ata0015.RKEY INNER JOIN'
      
        '          dbo.Data0001 ON dbo.Data0070.CURRENCY_PTR = dbo.Data00' +
        '01.RKEY LEFT OUTER JOIN'
      
        '          dbo.Data0069 ON dbo.Data0071.rkey69 = dbo.Data0069.RKE' +
        'Y LEFT OUTER JOIN'
      
        '          dbo.Data0068 ON dbo.Data0069.PURCH_REQ_PTR = dbo.Data0' +
        '068.RKEY LEFT OUTER JOIN'
      
        '          dbo.Data0005 AS data0005_1 ON dbo.Data0068.REQ_BY = da' +
        'ta0005_1.RKEY LEFT OUTER JOIN'
      
        '          dbo.Data0034 ON dbo.Data0068.DEPARTMENT_NAME = dbo.Dat' +
        'a0034.DEPT_CODE LEFT OUTER JOIN'
      
        '          dbo.Data0034 AS data0034_1 ON dbo.Data0070.PO_REV_NO =' +
        ' data0034_1.DEPT_CODE'
      'WHERE    '
      
        '      dbo.Data0070.PO_DATE >= :dtpk1 and dbo.Data0070.PO_DATE <=' +
        ' :dtpk2'
      
        '      and data0070.STATUS=5 and dbo.Data0071.QUAN_ORD > dbo.Data' +
        '0071.QUAN_RECD'
      '      and (dbo.Data0071.REQ_DATE < GETDATE()) '
      'union '
      
        'SELECT     dbo.Data0072.DESCRIPTION, dbo.Data0072.GUI_GE, dbo.Da' +
        'ta0072.DESCRIPTION2, '
      
        '           dbo.Data0070.PO_NUMBER,data0070.PO_DATE,dbo.Data0023.' +
        'ABBR_NAME, dbo.Data0072.QUAN_ORD, '
      
        '          dbo.Data0072.tax_price, dbo.Data0072.state_TAX, dbo.Da' +
        'ta0001.CURR_NAME, '
      '          dbo.Data0070.EXCHANGE_RATE, dbo.Data0002.UNIT_NAME, '
      
        '          dbo.Data0072.del_DATE as '#35201#27714#21040#36135#26085#26399', dbo.Data0072.recd_DAT' +
        'E as '#26368#21518#25910#36135#26085#26399', '
      
        '          dbo.Data0072.QUANTITY_RECEIVED, dbo.Data0072.QUAN_ORD ' +
        '- dbo.Data0072.QUANTITY_RECEIVED AS '#27424#36135#25968#37327','
      '           dbo.Data0072.reason as '#35831#36141#21407#22240', '#39#39' as '#29305#21035#35201#27714', '
      
        '           dbo.Data0072.rohs as '#29615#20445#31561#32423', dbo.Data0072.IF_urgency as' +
        ' '#26159#21542#32039#24613', '
      
        '          dbo.Data0015.ABBR_NAME AS abbr_name15, dbo.Data0005.EM' +
        'PLOYEE_NAME as '#37319#36141#20154#21592', '
      
        '          ISNULL(data0005_1.EMPLOYEE_NAME, dbo.Data0070.ANALYSIS' +
        '_CODE_1) as '#35831#36141#20154#21592', '
      
        '          ISNULL(dbo.Data0034.DEPT_NAME, data0034_1.DEPT_NAME)  ' +
        'as '#35831#36141#37096#38376', '
      
        '          ISNULL(dbo.Data0068.PO_REQ_NUMBER, dbo.Data0070.FOB)  ' +
        'as '#35831#36141#32534#21495','
      
        '          case  data0070.STATUS when 1 then '#39#24453#23457#26680#39' when 2 then '#39#34987 +
        #36864#22238#39' when 3 then '#39#24050#20445#30041#39' when 4 then '#39#24050#26242#32531#39
      
        '           when 5 then '#39#24050#23457#26680#39' when 6 then '#39#24050#25910#36135#39' when 7 then '#39#24050#23436#25104#39 +
        ' when 8 then '#39#26410#25552#20132#39' end as '#29366#24577' ,'
      '          '#39#38750#32534#30721#29289#26009#39' as '#31867#22411'           '
      'FROM         dbo.Data0072 INNER JOIN'
      
        '          dbo.Data0070 ON dbo.Data0072.POPTR = dbo.Data0070.RKEY' +
        '  INNER JOIN'
      
        '          dbo.Data0023 ON dbo.Data0070.SUPPLIER_POINTER = dbo.Da' +
        'ta0023.RKEY INNER JOIN'
      
        '          dbo.Data0002 ON dbo.Data0072.UNIT_PTR = dbo.Data0002.R' +
        'KEY INNER JOIN'
      
        '          dbo.Data0005 ON dbo.Data0070.EMPLOYEE_POINTER = dbo.Da' +
        'ta0005.RKEY INNER JOIN'
      
        '          dbo.Data0015 ON dbo.Data0070.WAREHOUSE_POINTER = dbo.D' +
        'ata0015.RKEY INNER JOIN'
      
        '          dbo.Data0001 ON dbo.Data0070.CURRENCY_PTR = dbo.Data00' +
        '01.RKEY LEFT OUTER JOIN'
      
        '          dbo.Data0204 ON dbo.Data0072.rkey204 = dbo.Data0204.RK' +
        'EY LEFT OUTER JOIN'
      
        '          dbo.Data0068 ON dbo.Data0204.PURCHase_REQ_PTR = dbo.Da' +
        'ta0068.RKEY LEFT OUTER JOIN'
      
        '          dbo.Data0005 AS data0005_1 ON dbo.Data0068.REQ_BY = da' +
        'ta0005_1.RKEY LEFT OUTER JOIN'
      
        '          dbo.Data0034 ON dbo.Data0068.DEPARTMENT_NAME = dbo.Dat' +
        'a0034.DEPT_CODE LEFT OUTER JOIN'
      
        '          dbo.Data0034 AS data0034_1 ON dbo.Data0070.PO_REV_NO =' +
        ' data0034_1.DEPT_CODE'
      'WHERE    '
      
        ' dbo.Data0070.PO_DATE >= :dtpk3 and dbo.Data0070.PO_DATE <= :dtp' +
        'k4'
      
        'and data0070.STATUS=5 and  dbo.Data0072.QUAN_ORD > dbo.Data0072.' +
        'QUANTITY_RECEIVED'
      'and (dbo.Data0072.del_DATE < GETDATE()) ')
    Left = 420
    Top = 440
    object ADOQuery3INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      ReadOnly = True
      Size = 60
    end
    object ADOQuery3INV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      ReadOnly = True
      Size = 200
    end
    object ADOQuery3INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      ReadOnly = True
      Size = 70
    end
    object ADOQuery3PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#23450#21333
      FieldName = 'PO_NUMBER'
      ReadOnly = True
      Size = 15
    end
    object ADOQuery3PO_DATE: TDateTimeField
      DisplayLabel = #37319#36141#26085#26399
      FieldName = 'PO_DATE'
      ReadOnly = True
    end
    object ADOQuery3ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'ABBR_NAME'
      ReadOnly = True
      Size = 16
    end
    object ADOQuery3QUAN_ORD: TFloatField
      DisplayLabel = #37319#36141#25968#37327
      FieldName = 'QUAN_ORD'
      ReadOnly = True
    end
    object ADOQuery3tax_price: TFloatField
      DisplayLabel = #21547#31246#20215
      FieldName = 'tax_price'
      ReadOnly = True
    end
    object ADOQuery3TAX_2: TBCDField
      DisplayLabel = #31246#29575
      FieldName = 'TAX_2'
      ReadOnly = True
      Precision = 4
      Size = 2
    end
    object ADOQuery3CURR_NAME: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_NAME'
      ReadOnly = True
    end
    object ADOQuery3EXCHANGE_RATE: TFloatField
      DisplayLabel = #27719#29575
      FieldName = 'EXCHANGE_RATE'
      ReadOnly = True
    end
    object ADOQuery3UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
      ReadOnly = True
    end
    object ADOQuery3DSDesigner: TDateTimeField
      FieldName = #35201#27714#21040#36135#26085#26399
      ReadOnly = True
    end
    object ADOQuery3DSDesigner2: TDateTimeField
      FieldName = #26368#21518#25910#36135#26085#26399
      ReadOnly = True
    end
    object ADOQuery3QUAN_RECD: TFloatField
      DisplayLabel = #25509#25910#25968#37327
      FieldName = 'QUAN_RECD'
      ReadOnly = True
    end
    object ADOQuery3DSDesigner3: TFloatField
      FieldName = #27424#36135#25968#37327
      ReadOnly = True
    end
    object ADOQuery3DSDesigner4: TStringField
      FieldName = #35831#36141#21407#22240
      ReadOnly = True
      Size = 60
    end
    object ADOQuery3DSDesigner5: TStringField
      FieldName = #29305#21035#35201#27714
      ReadOnly = True
      Size = 50
    end
    object ADOQuery3DSDesigner6: TStringField
      FieldName = #29615#20445#31561#32423
      ReadOnly = True
      Size = 10
    end
    object ADOQuery3DSDesigner7: TBooleanField
      FieldName = #26159#21542#32039#24613
      ReadOnly = True
    end
    object ADOQuery3abbr_name15: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'abbr_name15'
      ReadOnly = True
      Size = 10
    end
    object ADOQuery3DSDesigner8: TStringField
      FieldName = #37319#36141#20154#21592
      ReadOnly = True
      Size = 16
    end
    object ADOQuery3DSDesigner9: TStringField
      FieldName = #35831#36141#20154#21592
      ReadOnly = True
      Size = 16
    end
    object ADOQuery3DSDesigner10: TStringField
      FieldName = #35831#36141#37096#38376
      ReadOnly = True
      Size = 30
    end
    object ADOQuery3DSDesigner11: TStringField
      FieldName = #35831#36141#32534#21495
      ReadOnly = True
      Size = 15
    end
    object ADOQuery3DSDesigner12: TStringField
      FieldName = #29366#24577
      ReadOnly = True
      Size = 6
    end
    object ADOQuery3DSDesigner13: TStringField
      FieldName = #31867#22411
      ReadOnly = True
      Size = 10
    end
  end
  object ADOQuery4: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select GETDATE() as date1 from data0070 ')
    Left = 524
    Top = 440
    object ADOQuery4date1: TDateTimeField
      FieldName = 'date1'
      ReadOnly = True
    end
  end
end
