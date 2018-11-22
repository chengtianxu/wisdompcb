object Frm_detailEdt: TFrm_detailEdt
  Left = 303
  Top = 204
  BorderStyle = bsDialog
  Caption = #20135#21697#26723
  ClientHeight = 379
  ClientWidth = 565
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 144
    Top = 345
    Width = 75
    Height = 25
    Caption = #30830#23450
    Default = True
    TabOrder = 2
    OnClick = BitBtn1Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 304
    Top = 345
    Width = 75
    Height = 25
    Caption = #20851#38381
    TabOrder = 3
    Kind = bkClose
  end
  object Grd1: TDBGridEh
    Left = 0
    Top = 34
    Width = 565
    Height = 295
    Align = alTop
    DataSource = DataSource1
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = BitBtn1Click
    OnTitleClick = Grd1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'PROD_CODE'
        Footers = <>
        Width = 97
      end
      item
        EditButtons = <>
        FieldName = 'PRODUCT_NAME'
        Footers = <>
        Width = 124
      end
      item
        EditButtons = <>
        FieldName = 'PRODUCT_DESC'
        Footers = <>
        Width = 142
      end
      item
        EditButtons = <>
        FieldName = 'CODE'
        Footers = <>
        Width = 57
      end
      item
        EditButtons = <>
        FieldName = 'LOCATION'
        Footers = <>
        Width = 57
      end
      item
        EditButtons = <>
        FieldName = 'qty_on_hand'
        Footers = <>
        Title.Caption = #24211#23384#25968
        Width = 44
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 565
    Height = 34
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 15
      Top = 11
      Width = 52
      Height = 13
      Caption = #20135#21697#32534#30721
    end
    object Edit1: TEdit
      Left = 80
      Top = 6
      Width = 129
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
  end
  object DataSource1: TDataSource
    DataSet = ADO08
    Left = 456
    Top = 224
  end
  object ADO08: TADOQuery
    Connection = DM.ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey08'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.Data0008.RKEY, dbo.Data0008.PROD_CODE, dbo.Data00' +
        '08.PRODUCT_NAME, dbo.Data0008.PRODUCT_DESC, dbo.Data0016.CODE, '
      
        '                      dbo.Data0016.LOCATION, dbo.WZCP0001.rkey r' +
        'keycp01, dbo.WZCP0001.location_ptr, dbo.WZCP0001.qty_on_hand'
      'FROM         dbo.Data0008 INNER JOIN'
      
        '                      dbo.WZCP0001 ON dbo.Data0008.RKEY = dbo.WZ' +
        'CP0001.proc_ptr INNER JOIN'
      
        '                      dbo.Data0016 ON dbo.WZCP0001.location_ptr ' +
        '= dbo.Data0016.RKEY'
      'where dbo.Data0008.RKEY=:rkey08 and dbo.WZCP0001.qty_on_hand>0')
    Left = 456
    Top = 272
    object ADO08RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO08PROD_CODE: TStringField
      DisplayLabel = #20135#21697#32534#30721
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object ADO08PRODUCT_NAME: TStringField
      DisplayLabel = #20135#21697#21517#31216
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADO08PRODUCT_DESC: TStringField
      DisplayLabel = #20135#21697#35268#26684
      FieldName = 'PRODUCT_DESC'
      Size = 50
    end
    object ADO08CODE: TStringField
      DisplayLabel = #20179#24211#20195#30721
      FieldName = 'CODE'
      FixedChar = True
      Size = 5
    end
    object ADO08LOCATION: TStringField
      DisplayLabel = #20179#24211#21517#31216
      FieldName = 'LOCATION'
      Size = 10
    end
    object ADO08rkeycp01: TAutoIncField
      FieldName = 'rkeycp01'
      ReadOnly = True
    end
    object ADO08location_ptr: TIntegerField
      FieldName = 'location_ptr'
    end
    object ADO08qty_on_hand: TBCDField
      DisplayLabel = #25968#37327
      FieldName = 'qty_on_hand'
      Precision = 10
      Size = 3
    end
  end
end
