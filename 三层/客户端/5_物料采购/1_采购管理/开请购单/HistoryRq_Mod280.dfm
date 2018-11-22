inherited frmHistoryRq_Mod280: TfrmHistoryRq_Mod280
  Caption = #21382#21490#35831#36141#26126#32454#26368#36817'15'#31508
  ClientHeight = 400
  ClientWidth = 789
  WindowState = wsMaximized
  ExplicitWidth = 797
  ExplicitHeight = 427
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 359
    Width = 789
    Height = 41
    Align = alBottom
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 331
      Top = 5
      Width = 70
      Height = 30
      Cancel = True
      Caption = #20851#38381
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 0
    end
    object BtnExcel: TBitBtn
      Left = 4
      Top = 5
      Width = 70
      Height = 30
      Caption = #23548#20986
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DADADADADADA
        DADAADADADADADADADADDADADADADAD00000000000000006666007777777706E
        EF0AA0E6666606EEF0ADDA0E66606EEF060AADA0E606EEF0000DDADA006EEF0A
        DADAADAD06EEF00DADADDAD06EEF0670DADAAD06EEF0E6670DADD06EEF0A0E66
        70DA0FFFF0ADA0EEEE0D00000ADADA00000AADADADADADADADAD}
      TabOrder = 1
      OnClick = BtnExcelClick
    end
  end
  object eh69: TDBGridEh
    Left = 0
    Top = 0
    Width = 789
    Height = 359
    Align = alClient
    DataSource = ds69
    DynProps = <>
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    ReadOnly = True
    TabOrder = 1
    Columns = <
      item
        DynProps = <>
        EditButtons = <>
        FieldName = #35831#36141#21333#21495
        Footers = <>
        Width = 130
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = #35831#36141#20154#21592
        Footers = <>
        Width = 64
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = #35831#36141#26085#26399
        Footers = <>
        Width = 84
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = #35831#36141#25968#37327
        Footers = <>
        Width = 59
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = #21333#20301
        Footers = <>
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = #35831#36141#21407#22240
        Footers = <>
        Width = 81
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = #29305#21035#35201#27714
        Footers = <>
        Width = 54
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = #26159#21542#32039#24613
        Footers = <>
        Width = 53
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = #20379#24212#21830
        Footers = <>
        Width = 64
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = #29366#24577
        Footers = <>
        Width = 60
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object cds69: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 440
    Top = 280
  end
  object ds69: TDataSource
    DataSet = cds69
    Left = 488
    Top = 279
  end
end
