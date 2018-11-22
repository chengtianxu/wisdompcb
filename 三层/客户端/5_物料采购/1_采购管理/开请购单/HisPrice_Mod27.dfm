inherited frmHisPrice_Mod27: TfrmHisPrice_Mod27
  Caption = #29983#20135#29289#26009#21382#21490#20215#26684
  ClientHeight = 346
  ClientWidth = 584
  ExplicitWidth = 592
  ExplicitHeight = 373
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 584
    Height = 313
    Align = alTop
    DataSource = ds69
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Title.Caption = #20379#24212#21830
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_NAME'
        Title.Caption = #36135#24065
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTITY'
        Title.Caption = #37319#36141#25968#37327
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Title.Caption = #21333#20301
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tax_price'
        Title.Caption = #21547#31246#20215#26684
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tax'
        Title.Caption = #31246#29575
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REQ_DATE'
        Title.Caption = #35831#36141#26085#26399
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'in_out'
        Title.Caption = #37319#36141#22320#28857
        Width = 54
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 246
    Top = 320
    Width = 74
    Height = 24
    Caption = #20851#38381
    ModalResult = 1
    TabOrder = 1
  end
  object cds69: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 280
    Top = 136
  end
  object ds69: TDataSource
    DataSet = cds69
    Left = 336
    Top = 144
  end
end
