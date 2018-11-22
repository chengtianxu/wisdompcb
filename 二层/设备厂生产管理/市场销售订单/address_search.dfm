object Form_address: TForm_address
  Left = 287
  Top = 145
  Width = 468
  Height = 481
  Caption = #35013#36816#22320#28857#25628#32034
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 460
    Height = 36
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 76
      Top = 12
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = #35013#36816#22320#28857':'
    end
    object Edit1: TEdit
      Left = 138
      Top = 8
      Width = 180
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
      OnKeyDown = DBCtrlGrid1KeyDown
    end
    object BitBtn1: TBitBtn
      Left = 322
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
    Top = 410
    Width = 460
    Height = 41
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      460
      41)
    object Button1: TButton
      Left = 154
      Top = 12
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 234
      Top = 12
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object DBCtrlGrid1: TDBCtrlGrid
    Left = 0
    Top = 36
    Width = 460
    Height = 374
    Align = alClient
    AllowDelete = False
    AllowInsert = False
    DataSource = DataSource1
    PanelHeight = 124
    PanelWidth = 442
    TabOrder = 2
    OnDblClick = DBCtrlGrid1DblClick
    OnKeyDown = DBCtrlGrid1KeyDown
    object Label2: TLabel
      Left = 4
      Top = 10
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = '  '#35013#36816#22320#28857
      FocusControl = DBEdit1
    end
    object Label3: TLabel
      Left = 21
      Top = 35
      Width = 47
      Height = 13
      Alignment = taRightJustify
      Caption = '  '#24030'/'#30465
      FocusControl = DBEdit2
    end
    object Label4: TLabel
      Left = 213
      Top = 34
      Width = 40
      Height = 13
      Alignment = taRightJustify
      Caption = '  '#37038#32534
      FocusControl = DBEdit3
    end
    object Label5: TLabel
      Left = 36
      Top = 63
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = ' '#22320#22336
    end
    object DBEdit1: TDBEdit
      Left = 76
      Top = 7
      Width = 350
      Height = 21
      DataField = 'location'
      DataSource = DataSource1
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 76
      Top = 32
      Width = 134
      Height = 21
      DataField = 'state'
      DataSource = DataSource1
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 257
      Top = 31
      Width = 134
      Height = 21
      DataField = 'zip'
      DataSource = DataSource1
      TabOrder = 2
    end
    object DBMemo1: TDBMemo
      Left = 75
      Top = 56
      Width = 359
      Height = 53
      DataField = 'ship_to_address_1'
      DataSource = DataSource1
      TabOrder = 3
    end
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey10'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select rkey,location,ship_to_address_1,state,zip,SHIP_CTAX_PTR,'
      'SHIP_TO_CONTACT,SHIP_TO_PHONE,SHIP_SHIPPING_METHOD,SHIP_FOB,'
      
        'STATE_SHIP_TAX_FLAG,STATE_PROD_TAX_FLAG,STATE_TOOL_TAX_FLAG,SHIP' +
        '_LEAD_TIME'
      'from data0012 where customer_ptr=:rkey10'
      'order by location')
    Left = 376
    Top = 384
    object ADOQuery1SHIP_TO_CONTACT: TStringField
      FieldName = 'SHIP_TO_CONTACT'
    end
    object ADOQuery1rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery1location: TStringField
      FieldName = 'location'
      Size = 80
    end
    object ADOQuery1ship_to_address_1: TStringField
      FieldName = 'ship_to_address_1'
      Size = 100
    end
    object ADOQuery1state: TStringField
      FieldName = 'state'
      Size = 10
    end
    object ADOQuery1zip: TStringField
      FieldName = 'zip'
      Size = 10
    end
    object ADOQuery1SHIP_CTAX_PTR: TIntegerField
      FieldName = 'SHIP_CTAX_PTR'
    end
    object ADOQuery1SHIP_TO_PHONE: TStringField
      FieldName = 'SHIP_TO_PHONE'
    end
    object ADOQuery1SHIP_SHIPPING_METHOD: TStringField
      FieldName = 'SHIP_SHIPPING_METHOD'
    end
    object ADOQuery1SHIP_FOB: TStringField
      FieldName = 'SHIP_FOB'
    end
    object ADOQuery1STATE_SHIP_TAX_FLAG: TStringField
      FieldName = 'STATE_SHIP_TAX_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1STATE_PROD_TAX_FLAG: TStringField
      FieldName = 'STATE_PROD_TAX_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1STATE_TOOL_TAX_FLAG: TStringField
      FieldName = 'STATE_TOOL_TAX_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1SHIP_LEAD_TIME: TSmallintField
      FieldName = 'SHIP_LEAD_TIME'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 344
    Top = 384
  end
end
