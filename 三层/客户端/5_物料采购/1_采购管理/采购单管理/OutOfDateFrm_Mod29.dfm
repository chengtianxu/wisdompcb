inherited frmOutOfDay_Mod29: TfrmOutOfDay_Mod29
  Left = 329
  Top = 282
  Caption = #22312#36884#29289#26009#26597#35810
  ClientHeight = 573
  ClientWidth = 884
  ExplicitWidth = 900
  ExplicitHeight = 612
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 884
    Height = 573
    ExplicitWidth = 884
    ExplicitHeight = 573
    inherited pnlDisplayMain: TPanel
      Width = 884
      Height = 573
      ExplicitWidth = 884
      ExplicitHeight = 573
      inherited pnlChildMain: TPanel
        Width = 882
        Height = 571
        ExplicitWidth = 882
        ExplicitHeight = 571
        inherited pnlEhMainDisplay: TPanel
          Width = 880
          Height = 540
          ExplicitWidth = 880
          ExplicitHeight = 540
          inherited ehMain: TDBGridEh
            Width = 878
            Height = 538
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
            OnDrawColumnCell = ehMainDrawColumnCell
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_PART_NUMBER'
                Footers = <>
                Title.Caption = #26448#26009#32534#30721
                Width = 77
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_NAME'
                Footers = <>
                Title.Caption = #26448#26009#21517#31216
                Width = 72
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_DESCRIPTION'
                Footers = <>
                Title.Caption = #26448#26009#35268#26684
                Width = 147
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PO_NUMBER'
                Footers = <>
                Title.Caption = #37319#36141#35746#21333#21495
                Width = 70
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PO_DATE'
                Footers = <>
                Title.Caption = #35746#21333#26085#26399
                Width = 74
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ABBR_NAME'
                Footers = <>
                Title.Caption = #20379#24212#21830
                Width = 74
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'QUAN_ORD'
                Footers = <>
                Title.Caption = #35746#21333#25968#37327
                Width = 72
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'QUAN_RECD'
                Footers = <>
                Title.Caption = #25509#25910#25968#37327
                Width = 58
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = #27424#36135#25968#37327
                Footers = <>
                Width = 58
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'UNIT_NAME'
                Footers = <>
                Title.Caption = #21333#20301
                Width = 53
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'tax_price'
                Footers = <>
                Title.Caption = #21547#31246#20215
                Width = 77
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = #35201#27714#21040#36135#26085#26399
                Footers = <>
                Width = 88
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = #26368#21518#25910#36135#26085#26399
                Footers = <>
                Width = 81
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = #37319#36141#20154#21592
                Footers = <>
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = #26159#21542#32039#24613
                Footers = <>
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = #29305#21035#35201#27714
                Footers = <>
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = #35831#36141#21407#22240
                Footers = <>
                Width = 76
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = #29615#20445#31561#32423
                Footers = <>
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'TAX_2'
                Footers = <>
                Title.Caption = #31246#29575
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CURR_NAME'
                Footers = <>
                Title.Caption = #36135#24065
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'EXCHANGE_RATE'
                Footers = <>
                Title.Caption = #27719#29575
                Width = 36
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'abbr_name15'
                Footers = <>
                Title.Caption = #24037#21378
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = #35831#36141#20154#21592
                Footers = <>
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = #35831#36141#37096#38376
                Footers = <>
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = #35831#36141#32534#21495
                Footers = <>
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = #29366#24577
                Footers = <>
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = #31867#22411
                Footers = <>
                Width = 60
              end>
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 880
          ExplicitWidth = 880
          inherited lblFilter: TLabel
            Left = 190
            Caption = #26448#26009#21517#31216
            ExplicitLeft = 190
          end
          object lbl1: TLabel [1]
            Left = 521
            Top = 9
            Width = 48
            Height = 13
            Caption = #37319#36141#26085#26399
          end
          object lbl2: TLabel [2]
            Left = 692
            Top = 10
            Width = 12
            Height = 13
            Caption = #33267
          end
          inherited btnZD: TBitBtn [3]
            Left = 838
            Top = -1
            Width = 76
            Align = alCustom
            Visible = False
            ExplicitLeft = 838
            ExplicitTop = -1
            ExplicitWidth = 76
          end
          inherited btnDY: TBitBtn [4]
            Left = 838
            Top = -3
            Align = alCustom
            ExplicitLeft = 838
            ExplicitTop = -3
          end
          inherited btnAuthDispatch: TBitBtn [5]
            Left = 838
            Align = alCustom
            Visible = False
            ExplicitLeft = 838
          end
          inherited btnExit: TBitBtn [6]
          end
          inherited btnRefresh: TBitBtn [7]
            Align = alCustom
            Visible = False
          end
          inherited btnExportToExcel: TBitBtn [8]
            Left = 65
            ExplicitLeft = 65
          end
          inherited btnQry: TBitBtn [9]
            Left = 838
            Top = -3
            Align = alCustom
            Visible = False
            ExplicitLeft = 838
            ExplicitTop = -3
          end
          inherited edtFliter: TEdit [10]
            Left = 244
            Top = 3
            Width = 111
            ExplicitLeft = 244
            ExplicitTop = 3
            ExplicitWidth = 111
          end
          object chk1: TCheckBox
            Left = 389
            Top = 7
            Width = 49
            Height = 17
            Caption = #22312#36884
            Checked = True
            State = cbChecked
            TabOrder = 8
            OnClick = chk1Click
          end
          object chk2: TCheckBox
            Left = 447
            Top = 7
            Width = 73
            Height = 17
            Caption = #24050#21040#20132#26399
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 9
            OnClick = chk2Click
          end
          object dtp1: TDateTimePicker
            Left = 575
            Top = 5
            Width = 111
            Height = 21
            Date = 43021.000000000000000000
            Time = 43021.000000000000000000
            TabOrder = 10
            OnExit = chk2Click
          end
          object dtp2: TDateTimePicker
            Left = 710
            Top = 5
            Width = 107
            Height = 21
            Date = 43021.000000000000000000
            Time = 43021.000000000000000000
            TabOrder = 11
            OnExit = chk2Click
          end
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    CommandText = 
      'SELECT dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION, '#13#10'  ' +
      '    dbo.Data0023.ABBR_NAME, dbo.Data0070.PO_NUMBER, dbo.Data0071' +
      '.REQ_DATE, '#13#10'      dbo.Data0071.QUAN_ORD, dbo.Data0071.QUAN_RECD' +
      ', '#13#10'      dbo.Data0071.QUAN_ORD - dbo.Data0071.QUAN_RECD AS quan' +
      '_qh, '#13#10'      dbo.Data0002.UNIT_NAME,data0070.PO_TYPE'#13#10'FROM dbo.D' +
      'ata0017 INNER JOIN'#13#10'      dbo.Data0071 ON dbo.Data0017.RKEY = db' +
      'o.Data0071.INVT_PTR INNER JOIN'#13#10'      dbo.Data0070 ON dbo.Data00' +
      '71.PO_PTR = dbo.Data0070.RKEY INNER JOIN'#13#10'      dbo.Data0023 ON ' +
      #13#10'      dbo.Data0070.SUPPLIER_POINTER = dbo.Data0023.RKEY INNER ' +
      'JOIN'#13#10'      dbo.Data0002 ON '#13#10'      dbo.Data0071.PURCHASE_UNIT_P' +
      'TR = dbo.Data0002.RKEY'#13#10'WHERE (dbo.Data0071.QUAN_RECD < dbo.Data' +
      '0071.QUAN_ORD) AND '#13#10'      (dbo.Data0071.REQ_DATE < GETDATE()) A' +
      'ND (dbo.Data0070.STATUS = 5)'#13#10'UNION'#13#10'SELECT dbo.Data0072.DESCRIP' +
      'TION, dbo.Data0072.GUI_GE, dbo.Data0023.ABBR_NAME, '#13#10'      dbo.D' +
      'ata0070.PO_NUMBER, dbo.Data0072.DEL_DATE, dbo.Data0072.QUAN_ORD,' +
      ' '#13#10'      dbo.Data0072.QUANTITY_RECEIVED, '#13#10'      dbo.Data0072.QU' +
      'AN_ORD - dbo.Data0072.QUANTITY_RECEIVED AS quan_qh, '#13#10'      dbo.' +
      'Data0002.UNIT_NAME,data0070.PO_TYPE'#13#10'FROM dbo.Data0023 INNER JOI' +
      'N'#13#10'      dbo.Data0070 ON '#13#10'      dbo.Data0023.RKEY = dbo.Data007' +
      '0.SUPPLIER_POINTER INNER JOIN'#13#10'      dbo.Data0072 ON dbo.Data007' +
      '0.RKEY = dbo.Data0072.POPTR INNER JOIN'#13#10'      dbo.Data0002 ON db' +
      'o.Data0072.UNIT_PTR = dbo.Data0002.RKEY'#13#10'WHERE (dbo.Data0072.QUA' +
      'N_INVD < dbo.Data0072.QUAN_ORD) AND '#13#10'      (dbo.Data0072.DEL_DA' +
      'TE < GETDATE()) AND (dbo.Data0070.STATUS = 5)'
  end
end
