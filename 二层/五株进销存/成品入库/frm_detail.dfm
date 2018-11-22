object Form2: TForm2
  Left = 389
  Top = 128
  Width = 627
  Height = 434
  Caption = #25104#21697#20837#24211
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
  object Label1: TLabel
    Left = 24
    Top = 51
    Width = 65
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #20837#20179#21333#21495':'
  end
  object Label2: TLabel
    Left = 23
    Top = 82
    Width = 65
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #26412#21378#32534#21495':'
  end
  object Label3: TLabel
    Left = 303
    Top = 81
    Width = 65
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #23458#25143#22411#21495':'
  end
  object Label4: TLabel
    Left = 16
    Top = 112
    Width = 73
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #23458#25143#29289#26009#21495':'
  end
  object Label5: TLabel
    Left = 304
    Top = 112
    Width = 65
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #31867#21035#20195#30721':'
  end
  object Label6: TLabel
    Left = 22
    Top = 144
    Width = 65
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #23618#25968':'
  end
  object Label7: TLabel
    Left = 304
    Top = 140
    Width = 65
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #31867#21035#21517#31216':'
  end
  object Label8: TLabel
    Left = 22
    Top = 172
    Width = 65
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #23458#25143#20195#30721':'
  end
  object Label9: TLabel
    Left = 304
    Top = 171
    Width = 65
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #23458#25143#31616#31216':'
  end
  object Label10: TLabel
    Left = 22
    Top = 202
    Width = 65
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #20837#20179#25968#37327':'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label11: TLabel
    Left = 304
    Top = 202
    Width = 65
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #21333#20803#38754#31215':'
  end
  object Label12: TLabel
    Left = 20
    Top = 233
    Width = 65
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #20837#20179#38754#31215':'
  end
  object Label13: TLabel
    Left = 304
    Top = 233
    Width = 65
    Height = 15
    Alignment = taRightJustify
    AutoSize = False
    Caption = #21333#20803#37325#37327':'
  end
  object Label14: TLabel
    Left = 19
    Top = 262
    Width = 65
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #20837#20179#37325#37327':'
  end
  object Label15: TLabel
    Left = 304
    Top = 261
    Width = 65
    Height = 15
    Alignment = taRightJustify
    AutoSize = False
    Caption = #20837#20179#26085#26399':'
  end
  object Label16: TLabel
    Left = 17
    Top = 292
    Width = 65
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #24037#21378':'
  end
  object Label17: TLabel
    Left = 304
    Top = 291
    Width = 65
    Height = 15
    Alignment = taRightJustify
    AutoSize = False
    Caption = #20179#24211':'
  end
  object Label18: TLabel
    Left = 10
    Top = 325
    Width = 72
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #23458#25143#35746#21333#21495':'
  end
  object Label19: TLabel
    Left = 301
    Top = 323
    Width = 65
    Height = 15
    Alignment = taRightJustify
    AutoSize = False
    Caption = #20837#20179#31867#22411':'
  end
  object Label20: TLabel
    Left = 16
    Top = 355
    Width = 65
    Height = 15
    Alignment = taRightJustify
    AutoSize = False
    Caption = #38144#21806#31867#22411':'
  end
  object Label21: TLabel
    Left = 302
    Top = 355
    Width = 65
    Height = 15
    Alignment = taRightJustify
    AutoSize = False
    Caption = #25509#25910#20154#21592':'
  end
  object Splitter1: TSplitter
    Left = 0
    Top = 0
    Width = 619
    Height = 40
    Cursor = crArrow
    Align = alTop
    Beveled = True
  end
  object DBEdit2: TDBEdit
    Left = 91
    Top = 78
    Width = 153
    Height = 21
    DataField = 'MANU_PART_NUMBER'
    DataSource = dm.DataSource1
    TabOrder = 0
  end
  object DBEdit3: TDBEdit
    Left = 369
    Top = 75
    Width = 153
    Height = 21
    DataField = 'MANU_PART_DESC'
    DataSource = dm.DataSource1
    TabOrder = 1
  end
  object DBEdit4: TDBEdit
    Left = 92
    Top = 108
    Width = 153
    Height = 21
    DataField = 'ANALYSIS_CODE_2'
    DataSource = dm.DataSource1
    TabOrder = 2
  end
  object DBEdit5: TDBEdit
    Left = 369
    Top = 106
    Width = 153
    Height = 21
    DataField = 'PROD_CODE'
    DataSource = dm.DataSource1
    TabOrder = 3
  end
  object DBEdit6: TDBEdit
    Left = 91
    Top = 137
    Width = 153
    Height = 21
    DataField = 'LAYERS'
    DataSource = dm.DataSource1
    TabOrder = 4
  end
  object DBEdit7: TDBEdit
    Left = 369
    Top = 135
    Width = 153
    Height = 21
    DataField = 'PRODUCT_NAME'
    DataSource = dm.DataSource1
    TabOrder = 5
  end
  object DBEdit8: TDBEdit
    Left = 90
    Top = 168
    Width = 153
    Height = 21
    DataField = 'CUST_CODE'
    DataSource = dm.DataSource1
    TabOrder = 6
  end
  object DBEdit9: TDBEdit
    Left = 369
    Top = 165
    Width = 153
    Height = 21
    DataField = 'ABBR_NAME'
    DataSource = dm.DataSource1
    TabOrder = 7
  end
  object DBEdit16: TDBEdit
    Left = 91
    Top = 287
    Width = 153
    Height = 21
    DataField = 'WAREHOUSE_CODE'
    DataSource = dm.DataSource1
    TabOrder = 8
  end
  object DBEdit17: TDBEdit
    Left = 369
    Top = 287
    Width = 153
    Height = 21
    DataField = 'LOCATION'
    DataSource = dm.DataSource1
    TabOrder = 9
  end
  object DBEdit18: TDBEdit
    Left = 91
    Top = 320
    Width = 153
    Height = 21
    DataField = 'PO_NUMBER'
    DataSource = dm.DataSource1
    TabOrder = 10
  end
  object DBEdit19: TDBEdit
    Left = 369
    Top = 318
    Width = 153
    Height = 21
    DataField = 'incept_type'
    DataSource = dm.DataSource1
    TabOrder = 11
  end
  object DBEdit20: TDBEdit
    Left = 90
    Top = 351
    Width = 153
    Height = 21
    DataField = 'sales_type'
    DataSource = dm.DataSource1
    TabOrder = 12
  end
  object DBEdit21: TDBEdit
    Left = 369
    Top = 351
    Width = 153
    Height = 21
    DataField = 'employee_name'
    DataSource = dm.DataSource1
    TabOrder = 13
  end
  object BitBtn2: TBitBtn
    Left = 30
    Top = 9
    Width = 25
    Height = 25
    TabOrder = 14
    TabStop = False
    OnClick = BitBtn2Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333FFFFF333333000033333388888833333333333F888888FFF333
      000033338811111188333333338833FFF388FF33000033381119999111833333
      38F338888F338FF30000339119933331111833338F388333383338F300003391
      13333381111833338F8F3333833F38F3000039118333381119118338F38F3338
      33F8F38F000039183333811193918338F8F333833F838F8F0000391833381119
      33918338F8F33833F8338F8F000039183381119333918338F8F3833F83338F8F
      000039183811193333918338F8F833F83333838F000039118111933339118338
      F3833F83333833830000339111193333391833338F33F8333FF838F300003391
      11833338111833338F338FFFF883F83300003339111888811183333338FF3888
      83FF83330000333399111111993333333388FFFFFF8833330000333333999999
      3333333333338888883333330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object BitBtn1: TBitBtn
    Left = 5
    Top = 9
    Width = 25
    Height = 25
    TabOrder = 15
    TabStop = False
    OnClick = BitBtn1Click
    Glyph.Data = {
      56070000424D5607000000000000360400002800000028000000140000000100
      0800000000002003000000000000000000000001000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
      0303030303030303030303030303030303030303030303030303030303030303
      0303030303030303030303030303030303030303030303030303030303030303
      0303030303030303030303030303030303030303030303030303030303030303
      030303FFFFFFFFFFFFFFFFFFFFFFFF030303030303F800000000000000000000
      0000F803030303030303F8F8F8F8F8F8F8F8F8F8F8F803FF030303030300FCFC
      00F8FCFCFF070700FCFC00030303030303F8FF03F8FF0303030303F8FF03F8FF
      030303030300FCFC00F8FCFCFF070700FCFC00030303030303F8FF03F8FF0303
      030303F8FF03F8FF030303030300FCFC0007F8F807070700FCFC000303030303
      03F8FF03F8FFFFFFFFFFFFF80303F8FF030303030300FCFC0600000000000006
      FCFC00030303030303F8FF0303F8F8F8F8F8F8030303F8FF030303030300FCFC
      FCFCFCFCFCFCFCFCFCFC00030303030303F8FF0303FFFFFFFFFFFFFFFF03F8FF
      030303030300FC06000000000000000006FC00030303030303F8FF03F8F8F8F8
      F8F8F8F803FFF8FF030303030300FC00FFFFFFFFFFFFFFFF00FC000303030303
      03F8FFF8FF03030303030303F8FFF8FF030303030300FC00FFFFFFFFFFFFFFFF
      00FC00030303030303F8FFF8FF03030303030303F8FFF8FF030303030300FC00
      FFFFFFFFFFFFFFFF00FC00030303030303F8FFF8FF03030303030303F8FFF8FF
      030303030300FC00FFFFFFFFFFFFFFFF00FC00030303030303F8FFF8FF030303
      03030303F8FFF8FF0303030303000000FFFFFFFFFFFFFFFF0000000303030303
      03F8FFF8FF03030303030303F8FFF8FF030303030300FC00FFFFFFFFFFFFFFFF
      00FC00030303030303F8FFF8FFFFFFFFFFFFFFFFF8FFF8030303030303F80000
      00000000000000000000F803030303030303F8F8F8F8F8F8F8F8F8F8F8F80303
      0303030303030303030303030303030303030303030303030303030303030303
      0303030303030303030303030303030303030303030303030303030303030303
      0303030303030303030303030303030303030303030303030303030303030303
      0303030303030303030303030303030303030303030303030303}
    NumGlyphs = 2
  end
  object MFG_DATE: TDateTimePicker
    Left = 370
    Top = 256
    Width = 153
    Height = 21
    Date = 40625.689528715280000000
    Time = 40625.689528715280000000
    TabOrder = 16
  end
  object Edit1: TEdit
    Left = 92
    Top = 48
    Width = 153
    Height = 21
    TabOrder = 17
    Text = 'Edit1'
  end
  object DBEdit1: TDBEdit
    Left = 90
    Top = 197
    Width = 153
    Height = 21
    DataField = 'incept_qty'
    DataSource = dm.DataSource1
    TabOrder = 18
  end
  object DBEdit10: TDBEdit
    Left = 369
    Top = 197
    Width = 153
    Height = 21
    DataField = 'unit_sq'
    DataSource = dm.DataSource1
    TabOrder = 19
  end
  object DBEdit11: TDBEdit
    Left = 90
    Top = 228
    Width = 153
    Height = 21
    DataField = 'incept_area'
    DataSource = dm.DataSource1
    Enabled = False
    TabOrder = 20
  end
  object DBEdit12: TDBEdit
    Left = 368
    Top = 227
    Width = 153
    Height = 21
    DataField = 'pcs_weight'
    DataSource = dm.DataSource1
    TabOrder = 21
  end
  object DBEdit13: TDBEdit
    Left = 89
    Top = 258
    Width = 153
    Height = 21
    DataField = 'incept_weight'
    DataSource = dm.DataSource1
    Enabled = False
    TabOrder = 22
  end
end
