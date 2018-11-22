inherited frmHisPriceZx_Mod27: TfrmHisPriceZx_Mod27
  Caption = #38750#29983#20135#29289#26009#21382#21490#20215#26684
  ClientHeight = 342
  ClientWidth = 757
  ExplicitWidth = 765
  ExplicitHeight = 369
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 757
    Height = 309
    Align = alTop
    DataSource = ds204
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
        FieldName = 'DESCRIPTION_1'
        Title.Caption = #29289#21697#21517#31216
        Width = 127
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GUI_GE'
        Title.Caption = #29289#21697#35268#26684
        Width = 189
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTITY_REQUIRED'
        Title.Caption = #35831#36141#25968#37327
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_PRICE'
        Title.Caption = #19981#21547#31246#20215#26684
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REQ_DATE'
        Title.Caption = #35831#36141#26085#26399
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_NAME'
        Title.Caption = #36135#24065#31181#31867
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Title.Caption = #20379#24212#21830
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Title.Caption = #37319#36141#21333#20301
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'in_out'
        Title.Caption = #37319#36141#22320#28857
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 353
    Top = 315
    Width = 71
    Height = 25
    Caption = #20851#38381
    ModalResult = 1
    TabOrder = 1
  end
  object cds204: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 216
    Top = 112
  end
  object ds204: TDataSource
    DataSet = cds204
    Left = 320
    Top = 112
  end
end
