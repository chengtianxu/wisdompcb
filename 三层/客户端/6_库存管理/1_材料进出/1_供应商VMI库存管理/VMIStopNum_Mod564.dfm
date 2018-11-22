inherited frmVMIStopNum_Mod564: TfrmVMIStopNum_Mod564
  Caption = 'VMI'#25130#25968#24211#23384
  ClientHeight = 340
  ClientWidth = 770
  ExplicitWidth = 778
  ExplicitHeight = 367
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 770
    Height = 340
    ExplicitWidth = 770
    ExplicitHeight = 340
    inherited pnlDisplayMain: TPanel
      Width = 770
      Height = 340
      ExplicitWidth = 770
      ExplicitHeight = 340
      inherited pnlChildMain: TPanel
        Width = 768
        Height = 338
        ExplicitWidth = 768
        ExplicitHeight = 338
        inherited pnlEhMainDisplay: TPanel
          Width = 766
          Height = 307
          ExplicitWidth = 766
          ExplicitHeight = 307
          inherited ehMain: TDBGridEh
            Width = 764
            Height = 305
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'cut_date'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #25130#25968#26399#26411#26085#26399
                Width = 160
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'employee_name'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #25805#20316#20154#21592
                Width = 70
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'v_status'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #25130#25968#29366#24577
                Width = 70
              end>
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 766
          ExplicitWidth = 766
          inherited btnZD: TBitBtn
            Visible = False
          end
          inherited btnAuthDispatch: TBitBtn
            Visible = False
          end
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    CommandText = 
      'select data0171.*,data0005.employee_name,'#13#10'case data0171.status ' +
      'when 0 then '#39#26410#38145#39' when 1 then '#39#24050#38145#39' end as v_status'#13#10' from   data0' +
      '171 inner join data0005'#13#10'         on data0171.user_ptr=data0005.' +
      'rkey '#13#10'where 1=1'
  end
  inherited pmMain: TPopupMenu
    OnPopup = pmMainPopup
    Left = 120
    Top = 144
    object N1: TMenuItem
      Caption = #24320#22987#25130#25968
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #23436#25104#25130#25968
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #21024#38500#25130#25968
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N5: TMenuItem
      Caption = #25130#23384#26597#30475
      object N6: TMenuItem
        Caption = #25130#23384#26126#32454
        OnClick = N6Click
      end
      object N7: TMenuItem
        Caption = #25130#23384#27719#24635
        OnClick = N7Click
      end
    end
  end
  object cds171: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 384
    Top = 104
  end
end
