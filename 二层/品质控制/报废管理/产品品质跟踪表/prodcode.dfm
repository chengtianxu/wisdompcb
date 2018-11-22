object Form_prodcode: TForm_prodcode
  Left = 340
  Top = 128
  Width = 440
  Height = 484
  Caption = #31867#22411#20195#30721#25628#32034
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 55
    Top = 12
    Width = 75
    Height = 13
    Alignment = taRightJustify
    Caption = #20135#21697#31867#22411#20195#30721':'
  end
  object Edit1: TEdit
    Left = 134
    Top = 8
    Width = 167
    Height = 21
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 0
    OnChange = Edit1Change
  end
  object BitBtn1: TBitBtn
    Left = 308
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 35
    Width = 426
    Height = 378
    Ctl3D = True
    DataSource = DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'PROD_CODE'
        Title.Caption = #20135#21697#31867#22411#20195#30721
        Title.Color = clRed
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRODUCT_NAME'
        Title.Caption = #20135#21697#20195#30721#21517#31216
        Width = 285
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 131
    Top = 425
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 3
  end
  object Button2: TButton
    Left = 211
    Top = 425
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 4
  end
  object DataSource1: TDataSource
    DataSet = adoquery1
    Left = 335
    Top = 420
  end
  object adoquery1: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT RKEY, PROD_CODE, PRODUCT_NAME, LEAD_TIME, OPT_LOT_SIZE, '#13 +
      #10'      MAX_DAYS_EARLY_BUILD, EST_SCRAP, EST_SCRAP1, IESMODEL_PTR' +
      ','#13#10'est_scrap_ltm, est_scrap1_lmt'#13#10'FROM dbo.Data0008'#13#10
    IndexFieldNames = 'PROD_CODE'
    Parameters = <>
    Left = 368
    Top = 421
    object adoquery1RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object adoquery1PROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object adoquery1PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object adoquery1LEAD_TIME: TSmallintField
      FieldName = 'LEAD_TIME'
    end
    object adoquery1OPT_LOT_SIZE: TIntegerField
      FieldName = 'OPT_LOT_SIZE'
    end
    object adoquery1MAX_DAYS_EARLY_BUILD: TSmallintField
      FieldName = 'MAX_DAYS_EARLY_BUILD'
    end
    object adoquery1EST_SCRAP: TFloatField
      FieldName = 'EST_SCRAP'
    end
    object adoquery1EST_SCRAP1: TFloatField
      FieldName = 'EST_SCRAP1'
    end
    object adoquery1IESMODEL_PTR: TIntegerField
      FieldName = 'IESMODEL_PTR'
    end
    object adoquery1est_scrap_ltm: TFloatField
      FieldName = 'est_scrap_ltm'
    end
    object adoquery1est_scrap1_lmt: TFloatField
      FieldName = 'est_scrap1_lmt'
    end
  end
end
