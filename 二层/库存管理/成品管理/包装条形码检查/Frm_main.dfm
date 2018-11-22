object Form1: TForm1
  Left = 245
  Top = 151
  Width = 882
  Height = 664
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #21253#35013#26465#30721#26816#27979
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
    Left = 12
    Top = 19
    Width = 100
    Height = 24
    Caption = #22806#31665#26465#30721
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -24
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 12
    Top = 72
    Width = 100
    Height = 24
    Caption = #26412#21378#32534#21495
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -24
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 12
    Top = 123
    Width = 100
    Height = 24
    Caption = #23458#25143#22411#21495
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -24
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 358
    Top = 93
    Width = 125
    Height = 24
    Caption = #23458#25143#29289#26009#21495
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -24
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 63
    Top = 167
    Width = 50
    Height = 24
    Caption = #21608#26399
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -24
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 380
    Top = 177
    Width = 100
    Height = 24
    Caption = #22806#31665#25968#37327
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -24
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 13
    Top = 270
    Width = 75
    Height = 24
    Caption = #25195#25551#21495
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 337
    Top = 227
    Width = 150
    Height = 24
    Caption = #20869#31665#25968#37327#21512#35745
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 380
    Top = 123
    Width = 100
    Height = 24
    Caption = #23458#35746#21333#21495
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -24
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label11: TLabel
    Left = 120
    Top = 561
    Width = 450
    Height = 29
    Caption = #35686#21578#65306#20869#31665#24635#25968#24050#32463#36229#36807#22806#31665#25968#65281
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -29
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object dbtxt1: TDBText
    Left = 134
    Top = 71
    Width = 84
    Height = 27
    AutoSize = True
    DataField = 'MANU_PART_NUMBER'
    DataSource = dsoutbar
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
  end
  object DBText1: TDBText
    Left = 500
    Top = 93
    Width = 98
    Height = 27
    AutoSize = True
    DataField = 'ANALYSIS_CODE_2'
    DataSource = dsoutbar
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
  end
  object DBText2: TDBText
    Left = 134
    Top = 119
    Width = 98
    Height = 27
    AutoSize = True
    DataField = 'MANU_PART_DESC'
    DataSource = dsoutbar
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
  end
  object DBText3: TDBText
    Left = 500
    Top = 122
    Width = 98
    Height = 27
    AutoSize = True
    DataField = 'PO_NUMBER'
    DataSource = dsoutbar
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
  end
  object DBText4: TDBText
    Left = 134
    Top = 167
    Width = 98
    Height = 27
    AutoSize = True
    DataField = 'lotno'
    DataSource = dsoutbar
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
  end
  object DBText5: TDBText
    Left = 500
    Top = 175
    Width = 98
    Height = 27
    AutoSize = True
    DataField = 'qty'
    DataSource = dsoutbar
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
  end
  object lbl1: TLabel
    Left = 325
    Top = 270
    Width = 50
    Height = 24
    Caption = #31665#21495
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 39
    Top = 215
    Width = 75
    Height = 24
    Caption = #22806#31665#21495
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -24
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl3: TLabel
    Left = 136
    Top = 216
    Width = 56
    Height = 27
    Caption = 'lbl3'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
  end
  object lblHasCmp: TLabel
    Left = 406
    Top = 61
    Width = 125
    Height = 24
    Caption = #24050#32463#21305#37197#36807
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -24
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object lbl4: TLabel
    Left = 700
    Top = 150
    Width = 60
    Height = 13
    Caption = #25171#21360#26631#31614#65306
  end
  object lbl5: TLabel
    Left = 700
    Top = 174
    Width = 60
    Height = 13
    Caption = #24050#29992#26631#31614#65306
  end
  object lblAllPrintTagNum: TLabel
    Left = 763
    Top = 150
    Width = 3
    Height = 13
  end
  object lblUsePrintTagNum: TLabel
    Left = 763
    Top = 174
    Width = 3
    Height = 13
  end
  object lbl6: TLabel
    Left = 700
    Top = 194
    Width = 60
    Height = 13
    Caption = #25253#24223#26631#31614#65306
  end
  object lblbaofeiTag: TLabel
    Left = 763
    Top = 194
    Width = 3
    Height = 13
  end
  object Edit1: TEdit
    Left = 132
    Top = 11
    Width = 611
    Height = 45
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    ParentFont = False
    TabOrder = 0
    OnKeyPress = Edit1KeyPress
  end
  object mmo1: TMemo
    Left = 104
    Top = 268
    Width = 209
    Height = 280
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    ParentFont = False
    TabOrder = 1
    OnKeyPress = mmo1KeyPress
  end
  object Button1: TButton
    Left = 744
    Top = 461
    Width = 75
    Height = 25
    Caption = #20851#38381
    TabOrder = 2
    OnClick = Button1Click
  end
  object edtPCS: TEdit
    Left = 494
    Top = 220
    Width = 255
    Height = 45
    Color = clMenuBar
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
    Text = '0'
  end
  object Button2: TButton
    Left = 747
    Top = 356
    Width = 75
    Height = 25
    Caption = #28165#38500
    TabOrder = 4
    OnClick = Button2Click
  end
  object Edit9: TEdit
    Left = 741
    Top = 328
    Width = 92
    Height = 21
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 5
    Visible = False
    OnKeyDown = Edit9KeyDown
  end
  object btn1: TButton
    Left = 768
    Top = 40
    Width = 75
    Height = 25
    Caption = #26597#30475#35760#24405
    TabOrder = 6
    OnClick = btn1Click
  end
  object mmo2: TMemo
    Left = 378
    Top = 268
    Width = 335
    Height = 280
    TabStop = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    ParentFont = False
    TabOrder = 7
    OnKeyPress = mmo1KeyPress
  end
  object ADOCon: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 144
    Top = 224
  end
  object qrytmp: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 144
    Top = 264
  end
  object adsOutBar: TADODataSet
    Connection = ADOCon
    CursorType = ctStatic
    CommandText = 
      'select data0699.* from data0699 '#13#10'inner join data0698 on data069' +
      '9.pack_ptr = data0698.rkey'#13#10'where pack_ptr = :p1 and order_no = ' +
      ':p2 and data0698.type = '#39#22806#31665#39
    Parameters = <
      item
        Name = 'p1'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'p2'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end>
    Left = 184
    Top = 224
    object adsOutBarpack_ptr: TIntegerField
      FieldName = 'pack_ptr'
    end
    object adsOutBarorder_no: TSmallintField
      FieldName = 'order_no'
    end
    object adsOutBarMANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object adsOutBarMANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object adsOutBarANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      Size = 50
    end
    object adsOutBarPO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object adsOutBardescription: TStringField
      FieldName = 'description'
      Size = 50
    end
    object adsOutBarcode: TStringField
      FieldName = 'code'
      Size = 15
    end
    object adsOutBarqty: TIntegerField
      FieldName = 'qty'
    end
    object adsOutBarlotno: TStringField
      FieldName = 'lotno'
      Size = 10
    end
    object adsOutBarnotes: TStringField
      FieldName = 'notes'
      Size = 50
    end
    object adsOutBarbarcode_id: TStringField
      FieldName = 'barcode_id'
      Size = 80
    end
    object adsOutBarCaseNo: TStringField
      FieldName = 'CaseNo'
      Size = 7
    end
    object adsOutBarparam1: TStringField
      FieldName = 'param1'
      Size = 80
    end
    object adsOutBarParam2: TStringField
      FieldName = 'Param2'
      Size = 150
    end
    object adsOutBarwo_ptr: TIntegerField
      FieldName = 'wo_ptr'
    end
  end
  object dsoutbar: TDataSource
    DataSet = adsOutBar
    Left = 232
    Top = 224
  end
end
