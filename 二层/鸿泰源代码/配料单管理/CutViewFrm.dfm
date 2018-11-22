object frmCutView: TfrmCutView
  Left = 437
  Top = 176
  Width = 606
  Height = 580
  Caption = #24320#26009#22270
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 590
    Height = 542
    Align = alClient
    Caption = 'pnl1'
    TabOrder = 0
    object pnl2: TPanel
      Left = 1
      Top = 1
      Width = 588
      Height = 88
      Align = alTop
      TabOrder = 0
      object lbl1: TLabel
        Left = 23
        Top = 8
        Width = 90
        Height = 13
        Caption = #21333#20803#23610#23544'(PCS)'#38271':'
      end
      object lbl2: TLabel
        Left = 23
        Top = 30
        Width = 90
        Height = 13
        Caption = #20132#36135#23610#23544'(SET)'#38271':'
      end
      object lbl3: TLabel
        Left = 9
        Top = 52
        Width = 102
        Height = 13
        Caption = #25340#29256#23610#23544'(SPELL)'#38271':'
      end
      object lbl4: TLabel
        Left = 194
        Top = 8
        Width = 16
        Height = 13
        Caption = 'mm'
      end
      object lbl5: TLabel
        Left = 194
        Top = 30
        Width = 16
        Height = 13
        Caption = 'mm'
      end
      object lbl6: TLabel
        Left = 195
        Top = 52
        Width = 16
        Height = 13
        Caption = 'mm'
      end
      object lbl7: TLabel
        Left = 312
        Top = 52
        Width = 16
        Height = 13
        Caption = 'mm'
      end
      object lbl8: TLabel
        Left = 312
        Top = 30
        Width = 16
        Height = 13
        Caption = 'mm'
      end
      object lbl9: TLabel
        Left = 312
        Top = 8
        Width = 16
        Height = 13
        Caption = 'mm'
      end
      object lbl10: TLabel
        Left = 233
        Top = 8
        Width = 15
        Height = 13
        Caption = #23485':'
      end
      object lbl11: TLabel
        Left = 233
        Top = 30
        Width = 15
        Height = 13
        Caption = #23485':'
      end
      object lbl12: TLabel
        Left = 234
        Top = 52
        Width = 15
        Height = 13
        Caption = #23485':'
      end
      object lbl13: TLabel
        Left = 337
        Top = 30
        Width = 63
        Height = 13
        Caption = #20132#36135#21333#20803#25968':'
      end
      object lbl14: TLabel
        Left = 337
        Top = 52
        Width = 63
        Height = 13
        Caption = #25340#29256#21333#20803#25968':'
      end
      object lbl15: TLabel
        Left = 509
        Top = 8
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Caption = #38754#31215
        Visible = False
      end
      object lbl16: TLabel
        Left = 361
        Top = 8
        Width = 48
        Height = 13
        Alignment = taRightJustify
        Caption = 'PCS'#38754#31215':'
        Visible = False
      end
      object edtpcs_lngth: TDBEdit
        Left = 135
        Top = 4
        Width = 57
        Height = 21
        DataField = 'pcs_lngth'
        DataSource = ds1
        ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
        ReadOnly = True
        TabOrder = 0
      end
      object edtpcs_width: TDBEdit
        Left = 250
        Top = 4
        Width = 57
        Height = 21
        DataField = 'pcs_width'
        DataSource = ds1
        ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
        ReadOnly = True
        TabOrder = 1
      end
      object edtset_lngth: TDBEdit
        Left = 135
        Top = 26
        Width = 57
        Height = 21
        DataField = 'set_lngth'
        DataSource = ds1
        ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
        ReadOnly = True
        TabOrder = 2
      end
      object edtset_width: TDBEdit
        Left = 250
        Top = 26
        Width = 57
        Height = 21
        DataField = 'set_width'
        DataSource = ds1
        ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
        ReadOnly = True
        TabOrder = 3
      end
      object edtspell_lngth: TDBEdit
        Left = 135
        Top = 48
        Width = 57
        Height = 21
        DataField = 'spell_lngth'
        DataSource = ds1
        ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
        ReadOnly = True
        TabOrder = 4
      end
      object edtspell_width: TDBEdit
        Left = 250
        Top = 48
        Width = 57
        Height = 21
        DataField = 'spell_width'
        DataSource = ds1
        ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
        ReadOnly = True
        TabOrder = 5
      end
      object edtset_qty: TDBEdit
        Left = 410
        Top = 26
        Width = 57
        Height = 21
        DataField = 'set_qty'
        DataSource = ds1
        ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
        ReadOnly = True
        TabOrder = 6
      end
      object edtspell_qty: TDBEdit
        Left = 410
        Top = 48
        Width = 57
        Height = 21
        DataField = 'spell_qty'
        DataSource = ds1
        ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
        ReadOnly = True
        TabOrder = 7
      end
      object edtunit_sq: TDBEdit
        Left = 470
        Top = 26
        Width = 73
        Height = 21
        Color = cl3DLight
        DataField = 'unit_sq'
        DataSource = ds1
        ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
        ReadOnly = True
        TabOrder = 8
        Visible = False
      end
      object edtspell_sq: TDBEdit
        Left = 470
        Top = 48
        Width = 73
        Height = 21
        Color = cl3DLight
        DataField = 'spell_sq'
        DataSource = ds1
        ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
        ReadOnly = True
        TabOrder = 9
        Visible = False
      end
      object edtpcs_sq: TDBEdit
        Left = 409
        Top = 4
        Width = 77
        Height = 21
        Color = cl3DLight
        DataField = 'pcs_sq'
        DataSource = ds1
        ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
        ReadOnly = True
        TabOrder = 10
        Visible = False
      end
    end
    object pnl3: TPanel
      Left = 1
      Top = 89
      Width = 588
      Height = 452
      Align = alClient
      TabOrder = 1
      object pgc1: TPageControl
        Left = 1
        Top = 1
        Width = 586
        Height = 450
        ActivePage = ts1
        Align = alClient
        TabOrder = 0
        object ts1: TTabSheet
          Caption = #22823#26009#22270
          object img1: TImage
            Left = 0
            Top = 0
            Width = 578
            Height = 422
            Align = alClient
            Stretch = True
          end
        end
        object ts2: TTabSheet
          Caption = 'A'#26495#22270
          ImageIndex = 1
          object img2: TImage
            Left = 0
            Top = 0
            Width = 578
            Height = 422
            Align = alClient
            Stretch = True
          end
        end
        object ts3: TTabSheet
          Caption = 'B'#26495#22270
          ImageIndex = 2
          object img3: TImage
            Left = 0
            Top = 0
            Width = 578
            Height = 422
            Align = alClient
            Stretch = True
          end
        end
      end
    end
  end
  object ads1: TADODataSet
    Connection = DM.ADOConnection1
    CommandText = 
      'SELECT rkey as rkey25, unit_sq,pcs_lngth,pcs_width,pcs_sq,set_ln' +
      'gth,set_width,set_qty,spell_lngth,spell_width,spell_qty,spell_sq' +
      ' FROM Data0025'#13#10'WHERE RKEY = :p1'
    Parameters = <
      item
        Name = 'p1'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 385
    Top = 81
    object ads1pcs_lngth: TBCDField
      FieldName = 'pcs_lngth'
      Precision = 7
      Size = 3
    end
    object ads1pcs_width: TBCDField
      FieldName = 'pcs_width'
      Precision = 7
      Size = 3
    end
    object ads1pcs_sq: TFloatField
      FieldName = 'pcs_sq'
    end
    object ads1set_lngth: TBCDField
      FieldName = 'set_lngth'
      Precision = 7
      Size = 3
    end
    object ads1set_width: TBCDField
      FieldName = 'set_width'
      Precision = 7
      Size = 3
    end
    object ads1set_qty: TIntegerField
      FieldName = 'set_qty'
    end
    object ads1spell_lngth: TBCDField
      FieldName = 'spell_lngth'
      Precision = 7
      Size = 3
    end
    object ads1spell_width: TBCDField
      FieldName = 'spell_width'
      Precision = 7
      Size = 3
    end
    object ads1spell_qty: TIntegerField
      FieldName = 'spell_qty'
    end
    object ads1spell_sq: TFloatField
      FieldName = 'spell_sq'
    end
    object ads1rkey25: TAutoIncField
      FieldName = 'rkey25'
      ReadOnly = True
    end
    object ads1unit_sq: TFloatField
      FieldName = 'unit_sq'
    end
  end
  object ds1: TDataSource
    DataSet = ads1
    Left = 433
    Top = 81
  end
  object ads502: TADODataSet
    Connection = DM.ADOConnection1
    AfterOpen = ads502AfterOpen
    CommandText = 
      'SELECT sheet_BMP,pnl_bmp,pnl2_bmp FROM data0502'#13#10'WHERE source_pt' +
      'r = :rkey25'
    DataSource = ds1
    MasterFields = 'rkey25'
    Parameters = <
      item
        Name = 'rkey25'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 390
    Top = 122
    object ads502sheet_BMP: TBlobField
      FieldName = 'sheet_BMP'
    end
    object ads502pnl_bmp: TBlobField
      FieldName = 'pnl_bmp'
    end
    object ads502pnl2_bmp: TBlobField
      FieldName = 'pnl2_bmp'
    end
  end
  object ds2: TDataSource
    DataSet = ads502
    Left = 438
    Top = 122
  end
end
