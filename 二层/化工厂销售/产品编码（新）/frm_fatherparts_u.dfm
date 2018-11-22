object frm_fatherparts: Tfrm_fatherparts
  Left = 261
  Top = 210
  Width = 947
  Height = 480
  Caption = #29238#31867#37096#20214#26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 939
    Height = 33
    Align = alTop
    TabOrder = 0
    object lbl1: TLabel
      Left = 160
      Top = 6
      Width = 89
      Height = 17
      AutoSize = False
    end
    object btn2: TButton
      Left = 77
      Top = 0
      Width = 75
      Height = 25
      Caption = #20851#38381
      ModalResult = 1
      TabOrder = 0
      OnClick = btn2Click
    end
    object btn1: TBitBtn
      Left = 1
      Top = 0
      Width = 75
      Height = 25
      Caption = #23548#20986
      TabOrder = 1
      OnClick = btn1Click
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
    object edt1: TEdit
      Left = 256
      Top = 3
      Width = 121
      Height = 21
      TabOrder = 2
      OnChange = edt1Change
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 33
    Width = 939
    Height = 391
    Align = alClient
    TabOrder = 1
    object dbgrid1: TDBGridEh
      Left = 1
      Top = 1
      Width = 937
      Height = 389
      Align = alClient
      DataSource = dsDS1_1
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnTitleClick = dbgrid1TitleClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'PROD_CODE'
          Footers = <>
          Title.Caption = #24037#31243#32534#30721
          Width = 150
        end
        item
          EditButtons = <>
          FieldName = 'PRODUCT_NAME'
          Footers = <>
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'PRODUCT_DESC'
          Footers = <>
          Width = 150
        end
        item
          EditButtons = <>
          FieldName = 'UNIT_CODE'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'new_price'
          Footers = <>
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'qty_onhand'
          Footers = <>
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'ttype_c'
          Footers = <>
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'PR_GRP_CODE'
          Footers = <>
          Width = 68
        end
        item
          EditButtons = <>
          FieldName = 'PRODUCT_GROUP_NAME'
          Footers = <>
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'DEPT_CODE'
          Footers = <>
          Visible = False
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'DEPT_NAME'
          Footers = <>
          Title.Caption = #21046#36896#37096#38376
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'total_cost'
          Footers = <>
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'WORKHOUSE'
          Footers = <>
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'employee_name'
          Footers = <>
          Title.Caption = #21019#24314#20154
          Width = 50
        end
        item
          DisplayFormat = 'YYYY-MM-DD'
          EditButtons = <>
          FieldName = 'create_date'
          Footers = <>
          Title.Caption = #21019#24314#26102#38388
          Width = 80
        end>
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 424
    Width = 939
    Height = 29
    Align = alBottom
    TabOrder = 2
  end
  object qryD08: TADOQuery
    Connection = conADOCon_1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey08'
        Size = -1
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'SELECT     dbo.Data0008.*, dbo.Data0007.PR_GRP_CODE, '
      'dbo.Data0007.PRODUCT_GROUP_NAME, '
      'dbo.Data0002.UNIT_CODE, dbo.Data0002.UNIT_NAME, '
      'dbo.Data0034.DEPT_CODE, dbo.Data0034.DEPT_NAME,'
      'u.employee_name,'
      'case when data0008.ttype=0 then '#39#21322#25104#21697#39' else '#39#25104#21697#39' end ttype_c    '
      'FROM dbo.Data0008 '
      
        'INNER JOIN    dbo.Data0007 ON dbo.Data0008.PR_GRP_POINTER = dbo.' +
        'Data0007.RKEY'
      
        'INNER JOIN    dbo.Data0002 ON dbo.Data0008.unit_ptr = dbo.Data00' +
        '02.RKEY '
      
        'INNER JOIN    dbo.Data0034 ON dbo.Data0008.DEPT_PTR = dbo.Data00' +
        '34.RKEY '
      'left join data0005 u on Data0008.create_user_ptr=u.rkey '
      'where Data0008.rkey in ('
      'select a.part_ptr from data0140 a join data0148 b '
      ' on a.rkey=b.part_ptr'
      ' where b.invent_ptr =:rkey08 and b.invent_or=1)')
    Left = 467
    Top = 90
    object qryD08RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object qryD08PROD_CODE: TStringField
      DisplayLabel = #20135#21697#32534#30721
      DisplayWidth = 25
      FieldName = 'PROD_CODE'
      Size = 25
    end
    object qryD08PRODUCT_NAME: TStringField
      DisplayLabel = #20135#21697#21517#31216
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object qryD08PRODUCT_DESC: TStringField
      DisplayLabel = #20135#21697#35268#26684
      FieldName = 'PRODUCT_DESC'
      Size = 200
    end
    object qryD08PR_GRP_POINTER: TIntegerField
      FieldName = 'PR_GRP_POINTER'
    end
    object qryD08unit_ptr: TIntegerField
      FieldName = 'unit_ptr'
    end
    object qryD08DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object qryD08new_price: TBCDField
      DisplayLabel = #26368#26032#20215#26684
      FieldName = 'new_price'
      Precision = 8
      Size = 2
    end
    object qryD08qty_onhand: TBCDField
      DisplayLabel = #24403#21069#24211#23384
      FieldName = 'qty_onhand'
      Precision = 10
      Size = 3
    end
    object qryD08min_qty: TBCDField
      DisplayLabel = #26368#23567#24211#23384
      FieldName = 'min_qty'
      Precision = 10
      Size = 3
    end
    object qryD08max_qty: TBCDField
      DisplayLabel = #26368#22823#24211#23384
      FieldName = 'max_qty'
      Precision = 10
      Size = 3
    end
    object qryD08TTYPE: TWordField
      FieldName = 'TTYPE'
    end
    object qryD08PR_GRP_CODE: TStringField
      DisplayLabel = #20135#21697#32452#21035
      FieldName = 'PR_GRP_CODE'
      Size = 5
    end
    object qryD08PRODUCT_GROUP_NAME: TStringField
      DisplayLabel = #32452#21035#21517#31216
      FieldName = 'PRODUCT_GROUP_NAME'
      Size = 30
    end
    object qryD08UNIT_CODE: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_CODE'
      Size = 5
    end
    object qryD08UNIT_NAME: TStringField
      DisplayLabel = #21333#20301#21517#31216
      FieldName = 'UNIT_NAME'
    end
    object qryD08DEPT_CODE: TStringField
      DisplayLabel = #37096#38376#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object qryD08DEPT_NAME: TStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object qryD08ttype_c: TStringField
      DisplayLabel = #31867#21035
      FieldName = 'ttype_c'
      ReadOnly = True
      Size = 6
    end
    object qryD08remark: TMemoField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      BlobType = ftMemo
    end
    object qryD08total_cost: TBCDField
      DisplayLabel = #24635#25104#26412
      FieldName = 'total_cost'
      Precision = 10
      Size = 2
    end
    object qryD08WORKHOUSE: TBCDField
      DisplayLabel = #24037#26102
      FieldName = 'WORKHOUSE'
      Precision = 10
      Size = 2
    end
    object qryD08create_date: TDateTimeField
      FieldName = 'create_date'
    end
    object qryD08employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
  end
  object dsDS1_1: TDataSource
    DataSet = qryD08
    Left = 595
    Top = 90
  end
  object conADOCon_1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 332
    Top = 93
  end
end
