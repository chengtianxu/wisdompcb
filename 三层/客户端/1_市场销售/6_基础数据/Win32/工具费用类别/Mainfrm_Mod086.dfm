inherited Mainfrm_Mod86: TMainfrm_Mod86
  BorderStyle = bsSingle
  Caption = #24037#20855#36153#29992#31867#21035
  ClientHeight = 421
  ClientWidth = 569
  ExplicitWidth = 575
  ExplicitHeight = 449
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 569
    Height = 421
    ExplicitWidth = 569
    ExplicitHeight = 421
    inherited pnlDisplayMain: TPanel
      Width = 569
      Height = 421
      ExplicitWidth = 569
      ExplicitHeight = 421
      inherited pnlChildMain: TPanel
        Width = 567
        Height = 419
        ExplicitWidth = 567
        ExplicitHeight = 419
        inherited pnlEhMainDisplay: TPanel
          Width = 565
          Height = 388
          ExplicitWidth = 565
          ExplicitHeight = 388
          inherited ehMain: TDBGridEh
            Width = 563
            Height = 386
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CATEGORY'
                Footers = <>
                Title.Caption = #31867#21035#21517#31216
                Width = 102
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PTR_TO_GL_ACCT'
                Footers = <>
                Title.Caption = #39033#30446#20195#30721
                Width = 128
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'TAX_FLAG'
                Footers = <>
                Title.Caption = #24449#31246
                Width = 146
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'COMMISSION_FLAG'
                Footers = <>
                Title.Caption = #20323#37329
                Width = 75
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'rkey'
                Footers = <>
                Width = 0
              end>
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 565
          ExplicitWidth = 565
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    CommandText = 'select *  from Data0061'
  end
  inherited pmZD: TPopupMenu
    Left = 192
    Top = 65520
  end
  inherited pmMain: TPopupMenu
    object N1: TMenuItem
      Caption = #26032#22686
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #32534#36753
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #21024#38500
    end
  end
  object ClientDataSet2: TClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    Left = 256
    Top = 264
  end
  object cds86: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 336
    Top = 248
  end
  object Query1: TQuery
    DataSource = dsMain
    SQL.Strings = (
      
        'select gl_acc_number,GL_DESCRIPTION from data0103 where rkey=:PT' +
        'R_TO_GL_ACCT')
    Left = 224
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PTR_TO_GL_ACCT'
        ParamType = ptUnknown
      end>
  end
end
