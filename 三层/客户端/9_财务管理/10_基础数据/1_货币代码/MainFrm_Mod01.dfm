inherited FrmMain_Mod01: TFrmMain_Mod01
  Caption = 'FrmMain_Mod01'
  ClientHeight = 437
  ClientWidth = 843
  Font.Charset = GB2312_CHARSET
  Font.Height = -13
  Font.Name = #23435#20307
  ExplicitWidth = 851
  ExplicitHeight = 461
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 843
    Height = 437
    ExplicitWidth = 843
    ExplicitHeight = 437
    inherited pnlDisplayMain: TPanel
      Width = 843
      Height = 437
      ExplicitWidth = 843
      ExplicitHeight = 437
      inherited pnlChildMain: TPanel
        Width = 841
        Height = 435
        ExplicitWidth = 841
        ExplicitHeight = 435
        inherited pnlEhMainDisplay: TPanel
          Width = 839
          Height = 404
          ExplicitWidth = 839
          ExplicitHeight = 404
          inherited ehMain: TDBGridEh
            Width = 837
            Height = 402
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CURR_CODE'
                Footers = <>
                Title.Caption = #36135#24065#20195#30721
                Width = 70
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CURR_NAME'
                Footers = <>
                Title.Caption = #36135#24065#21517#31216
                Width = 100
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'EXCH_RATE'
                Footers = <>
                Title.Caption = #35760#36134#27719#29575
                Width = 80
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'exch1'
                Footers = <>
                Title.Caption = #20195#30721'/'#22522#20934#36135#24065
                Width = 90
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'BASE_TO_OTHER'
                Footers = <>
                Title.Caption = #35760#36134#27719#29575
                Width = 80
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'exch2'
                Footers = <>
                Title.Caption = #22522#20934#36135#24065'/'#20195#30721
                Width = 90
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'QTE_EXCH_RATE'
                Footers = <>
                Title.Caption = #25253#20215#27719#29575
                Width = 80
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'exch3'
                Footers = <>
                Title.Caption = #20195#30721'/'#22522#20934#36135#24065
                Width = 90
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'QTE_BASE_TO_OTHER'
                Footers = <>
                Title.Caption = #25253#20215#27719#29575
                Width = 80
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'exch4'
                Footers = <>
                Title.Caption = #22522#20934#36135#24065'/'#20195#30721
                Width = 90
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'TDATE'
                Footers = <>
                Title.Caption = #26085#26399
                Width = 100
              end>
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 839
          ExplicitWidth = 839
          inherited lblFilter: TLabel
            Left = 463
            Width = 52
            Visible = False
            ExplicitLeft = 463
            ExplicitWidth = 52
          end
          inherited edtFliter: TEdit
            Visible = False
          end
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    CommandText = 
      'select RKEY,CURR_CODE,CURR_NAME,EXCH_RATE,CURR_CODE+'#39'/'#26412#20301#24065#39' as ex' +
      'ch1,TDATE,BASE_TO_OTHER,'#39#26412#20301#24065'/'#39'+CURR_CODE as exch2,'#13#10'QUOTE_BASED,' +
      'QTE_EXCH_RATE,CURR_CODE+'#39'/'#26412#20301#24065#39' as exch3,QTE_BASE_TO_OTHER,'#39#26412#20301#24065'/'#39 +
      '+CURR_CODE as exch4  from data0001'#13#10
    ProviderName = 'DataSetProvider1'
    OnCalcFields = cdsMainCalcFields
    Top = 184
    object cdsMainCURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      ReadOnly = True
      Size = 5
    end
    object cdsMainCURR_NAME: TStringField
      FieldName = 'CURR_NAME'
      ReadOnly = True
    end
    object cdsMainEXCH_RATE: TFloatField
      FieldName = 'EXCH_RATE'
      ReadOnly = True
      DisplayFormat = '0.00000000'
    end
    object cdsMainexch1: TStringField
      FieldName = 'exch1'
      ReadOnly = True
      Size = 12
    end
    object cdsMainBASE_TO_OTHER: TFloatField
      FieldName = 'BASE_TO_OTHER'
      ReadOnly = True
      DisplayFormat = '0.00000000'
    end
    object cdsMainexch2: TStringField
      FieldName = 'exch2'
      ReadOnly = True
      Size = 12
    end
    object cdsMainQTE_EXCH_RATE: TFloatField
      FieldName = 'QTE_EXCH_RATE'
      ReadOnly = True
      DisplayFormat = '0.00000000'
    end
    object cdsMainexch3: TStringField
      FieldName = 'exch3'
      ReadOnly = True
      Size = 12
    end
    object cdsMainQTE_BASE_TO_OTHER: TFloatField
      FieldName = 'QTE_BASE_TO_OTHER'
      ReadOnly = True
      DisplayFormat = '0.00000000'
    end
    object cdsMainexch4: TStringField
      FieldName = 'exch4'
      ReadOnly = True
      Size = 12
    end
    object cdsMainTDATE: TDateTimeField
      FieldName = 'TDATE'
      ReadOnly = True
    end
    object cdsMainRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
      Visible = False
    end
  end
  inherited dsMain: TDataSource
    Left = 472
    Top = 184
  end
  inherited pmZD: TPopupMenu
    Left = 248
    Top = 88
  end
  inherited pmMain: TPopupMenu
    Left = 536
    Top = 184
    object N_Add: TMenuItem
      Caption = #26032#22686
      OnClick = N_AddClick
    end
    object N_Edit: TMenuItem
      Caption = #32534#36753
      OnClick = N_EditClick
    end
    object N_Copy: TMenuItem
      Caption = #22797#21046
      OnClick = N_CopyClick
    end
    object N_Delete: TMenuItem
      Caption = #21024#38500
      OnClick = N_DeleteClick
    end
  end
  inherited cdsMainWhereInit: TClientDataSet
    Left = 336
    Top = 88
  end
  object cds01: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 616
    Top = 176
  end
end
