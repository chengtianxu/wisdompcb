object frm_Address: Tfrm_Address
  Left = 397
  Top = 144
  Width = 466
  Height = 563
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #23458#25143#35013#36816#22320#22336
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
    Width = 450
    Height = 41
    Align = alTop
    TabOrder = 0
    DesignSize = (
      450
      41)
    object Label1: TLabel
      Left = 116
      Top = 13
      Width = 52
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #35013#36816#22320#22336
    end
    object Edit1: TEdit
      Left = 176
      Top = 10
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
    object BitBtn1: TBitBtn
      Left = 304
      Top = 10
      Width = 25
      Height = 21
      TabOrder = 1
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
    Top = 484
    Width = 450
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 136
      Top = 8
      Width = 75
      Height = 25
      Caption = #30830' '#23450
      TabOrder = 0
      OnClick = DBGridEh1DblClick
    end
    object Button2: TButton
      Left = 232
      Top = 8
      Width = 75
      Height = 25
      Caption = #21462' '#28040
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 41
    Width = 450
    Height = 443
    Align = alClient
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGridEh1DblClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'LOCATION'
        Footers = <>
        Width = 103
      end
      item
        EditButtons = <>
        FieldName = 'ship_to_address_1'
        Footers = <>
        Title.Caption = #35013#36816#22320#22336
        Width = 312
      end>
  end
  object ADO12: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'select Data0012.rkey,Data0012.ship_to_address_1,Data0012.LOCATIO' +
      'N,Data0189.state_tax,data0012.SHIP_TO_CONTACT, data0012.SHIP_TO_' +
      'PHONE'#13#10'from   Data0012 INNER JOIN Data0189 ON Data0012.SHIP_CTAX' +
      '_PTR=Data0189.RKEY '#13#10'where customer_ptr=:customer_ptr'
    Parameters = <
      item
        Name = 'customer_ptr'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 352
    Top = 487
    object ADO12rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO12ship_to_address_1: TStringField
      FieldName = 'ship_to_address_1'
      Size = 100
    end
    object ADO12LOCATION: TStringField
      DisplayLabel = #35013#36816#22320#28857
      FieldName = 'LOCATION'
      Size = 80
    end
    object ADO12state_tax: TBCDField
      FieldName = 'state_tax'
      Precision = 4
      Size = 2
    end
    object ADO12SHIP_TO_CONTACT: TStringField
      FieldName = 'SHIP_TO_CONTACT'
    end
    object ADO12SHIP_TO_PHONE: TStringField
      FieldName = 'SHIP_TO_PHONE'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADO12
    OnDataChange = DataSource1DataChange
    Left = 408
    Top = 487
  end
end
