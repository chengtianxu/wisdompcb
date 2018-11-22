object Form_alloc: TForm_alloc
  Left = 259
  Top = 219
  Width = 870
  Height = 500
  Caption = #23558#35201#21462#28040#30340#20998#37197#35760#24405#26126#32454#65288#65300#22825#21069#20998#37197#65289
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
  object Panel1: TPanel
    Left = 0
    Top = 416
    Width = 854
    Height = 46
    Align = alBottom
    TabOrder = 0
    object Button1: TButton
      Left = 320
      Top = 16
      Width = 75
      Height = 25
      Caption = #30830#35748
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 416
      Top = 16
      Width = 75
      Height = 25
      Cancel = True
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 854
    Height = 375
    Align = alClient
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'INV_PART_NUMBER'
        Title.Color = clRed
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_DESCRIPTION'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quan_alloc'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'alloc_datetime'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'number'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUT_NO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROD_CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRODUCT_NAME'
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 854
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Label1: TLabel
      Left = 251
      Top = 16
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #26448#26009#32534#30721
    end
    object Edit1: TEdit
      Left = 308
      Top = 12
      Width = 140
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
    object BitBtn4: TBitBtn
      Left = 65
      Top = 5
      Width = 57
      Height = 30
      Hint = #23548#20986#25968#25454'Excel'
      Caption = #23548#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
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
  object ads475: TADODataSet
    Connection = DM.ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterOpen = ads475AfterOpen
    CommandText = 
      'SELECT     dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, ' +
      'dbo.Data0017.INV_DESCRIPTION, dbo.DATA0475.quan_alloc, dbo.Data0' +
      '005.EMPLOYEE_NAME, '#13#10'                      dbo.DATA0475.alloc_da' +
      'tetime, dbo.DATA0268.number, dbo.DATA0268.CUT_NO, dbo.DATA0268.D' +
      'ATE, dbo.Data0008.PROD_CODE, '#13#10'                      dbo.Data000' +
      '8.PRODUCT_NAME'#13#10'FROM         dbo.Data0017 INNER JOIN'#13#10'          ' +
      '            dbo.Data0022 INNER JOIN'#13#10'                      dbo.D' +
      'ATA0475 ON dbo.Data0022.RKEY = dbo.DATA0475.rkey22 INNER JOIN'#13#10' ' +
      '                     dbo.Data0468 ON dbo.DATA0475.rkey468 = dbo.' +
      'Data0468.RKEY INNER JOIN'#13#10'                      dbo.DATA0268 ON ' +
      'dbo.Data0468.FLOW_NO = dbo.DATA0268.rkey ON dbo.Data0017.RKEY = ' +
      'dbo.Data0022.INVENTORY_PTR INNER JOIN'#13#10'                      dbo' +
      '.Data0005 ON dbo.DATA0475.alloc_userptr = dbo.Data0005.RKEY LEFT' +
      ' OUTER JOIN'#13#10'                      dbo.Data0008 RIGHT OUTER JOIN' +
      #13#10'                      dbo.data0492 ON dbo.Data0008.RKEY = dbo.' +
      'data0492.BOM_PTR ON dbo.DATA0268.CUT_NO = dbo.data0492.CUT_NO'#13#10'w' +
      'here datediff(day,data0475.alloc_datetime,getdate())>4'
    IndexFieldNames = 'INV_PART_NUMBER'
    Parameters = <>
    Left = 56
    Top = 72
    object ads475INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      DisplayWidth = 15
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ads475INV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      DisplayWidth = 18
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ads475INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      DisplayWidth = 30
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ads475quan_alloc: TBCDField
      DisplayLabel = #20998#37197#25968#37327
      DisplayWidth = 11
      FieldName = 'quan_alloc'
      Precision = 10
    end
    object ads475EMPLOYEE_NAME: TStringField
      DisplayLabel = #20998#37197#20154#21592
      DisplayWidth = 16
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ads475alloc_datetime: TDateTimeField
      DisplayLabel = #20998#37197#26102#38388
      DisplayWidth = 18
      FieldName = 'alloc_datetime'
    end
    object ads475number: TStringField
      DisplayLabel = #39046#26009#21333#21495
      DisplayWidth = 10
      FieldName = 'number'
      Size = 10
    end
    object ads475CUT_NO: TStringField
      DisplayLabel = #29983#20135#21333#21495
      DisplayWidth = 12
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object ads475DATE: TDateTimeField
      DisplayLabel = #30003#39046#26085#26399
      DisplayWidth = 18
      FieldName = 'DATE'
    end
    object ads475PROD_CODE: TStringField
      DisplayLabel = #20135#21697#32534#30721
      DisplayWidth = 15
      FieldName = 'PROD_CODE'
      Size = 15
    end
    object ads475PRODUCT_NAME: TStringField
      DisplayLabel = #20135#21697#21517#31216
      DisplayWidth = 30
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
  end
  object DataSource1: TDataSource
    DataSet = ads475
    Left = 56
    Top = 104
  end
end
