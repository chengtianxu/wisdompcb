inherited FrmMain_Mod638: TFrmMain_Mod638
  Caption = #23458#25143#35746#21333#21495#30721#31649#29702
  ClientHeight = 434
  ClientWidth = 786
  ExplicitWidth = 802
  ExplicitHeight = 472
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 786
    Height = 434
    ExplicitWidth = 786
    ExplicitHeight = 434
    inherited pnlDisplayMain: TPanel
      Width = 786
      Height = 434
      ExplicitWidth = 786
      ExplicitHeight = 434
      inherited pnlChildMain: TPanel
        Width = 784
        Height = 432
        ExplicitWidth = 784
        ExplicitHeight = 432
        inherited pnlEhMainDisplay: TPanel
          Width = 782
          Height = 401
          ExplicitWidth = 782
          ExplicitHeight = 401
          inherited ehMain: TDBGridEh
            Width = 780
            Height = 399
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PO_NUMBER'
                Footers = <>
                Title.Caption = #23458#25143#35746#21333#21495#30721
                Width = 86
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PO_DATE'
                Footers = <>
                Title.Caption = #35746#21333#26085#26399
                Width = 90
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CUST_CODE'
                Footers = <>
                Title.Caption = #23458#25143#20195#30721
                Width = 72
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ABBR_NAME'
                Footers = <>
                Title.Caption = #23458#25143#31616#31216
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CUSTOMER_NAME'
                Footers = <>
                Title.Caption = #23458#25143#21517#31216
                Width = 87
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'OPEN_SOS'
                Footers = <>
                Title.Caption = #35746#21333#26126#32454#25968#30446
                Width = 80
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'filename'
                Footers = <>
                Title.Caption = #25991#26723#21517#31216
                Width = 107
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'EMPLOYEE_NAME'
                Footers = <>
                Title.Caption = #21019#24314#20154#21592
                Width = 99
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'remark'
                Footers = <>
                Title.Caption = #22791#27880
                Width = 160
              end>
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 782
          ExplicitWidth = 782
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    CommandText = 
      'SELECT t97.RKEY,t97.PO_NUMBER,t97.PO_DATE,t97.OPEN_SOS,t97.remar' +
      'k,t97.filename,'#13#10'       t10.CUST_CODE,t10.CUSTOMER_NAME,t10.ABBR' +
      '_NAME,t5.EMPLOYEE_NAME'#13#10'FROM Data0097 t97 LEFT OUTER JOIN Data00' +
      '10 t10 ON t97.CUSTOMER_PTR = t10.RKEY'#13#10'LEFT OUTER JOIN Data0005 ' +
      't5 ON t97.dept_ptr = t5.RKEY'#13#10'WHERE 1=1'#13#10
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
      Caption = #26816#26597
    end
    object N4: TMenuItem
      Caption = #22797#21046
    end
    object N5: TMenuItem
      Caption = #21024#38500
    end
    object N6: TMenuItem
      Caption = #25171#24320#25991#26723
    end
  end
end
