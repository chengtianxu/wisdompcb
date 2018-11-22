inherited frmMain_Mod29OrderManager: TfrmMain_Mod29OrderManager
  Left = 276
  Top = 204
  Caption = #37319#36141#21333#31649#29702
  ClientHeight = 567
  ClientWidth = 891
  ExplicitWidth = 907
  ExplicitHeight = 605
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 891
    Height = 567
    ExplicitWidth = 891
    ExplicitHeight = 567
    inherited pnlDisplayMain: TPanel
      Width = 891
      Height = 567
      ExplicitWidth = 891
      ExplicitHeight = 567
      inherited pnlChildMain: TPanel
        Width = 889
        Height = 565
        ExplicitWidth = 889
        ExplicitHeight = 565
        inherited pnlEhMainDisplay: TPanel
          Width = 887
          Height = 534
          ExplicitWidth = 887
          ExplicitHeight = 534
          inherited ehMain: TDBGridEh
            Width = 885
            Height = 496
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
            TabOrder = 1
            OnDblClick = ehMainDblClick
            OnDrawColumnCell = ehMainDrawColumnCell
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'po_number'
                Footers = <>
                Title.Caption = #37319#36141#21333#21495
                Title.Color = cl3DLight
                Width = 112
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'supp_abbrname'
                Footers = <>
                Title.Caption = #20379#24212#21830
                Width = 84
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ware_name'
                Footers = <>
                Title.Caption = #24037#21378
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PO_REV_NO'
                Footers = <>
                Title.Caption = #35831#36141#37096#38376
                Width = 83
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'employee_name'
                Footers = <>
                Title.Caption = #21019#24314#20154#21592
                Width = 76
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'po_date'
                Footers = <>
                Title.Caption = #36755#20837#26085#26399
                Width = 75
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'StrReport'
                Footers = <>
                Title.Caption = #25253#34920#26684#24335
                Width = 73
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'StrStatus'
                Footers = <>
                Title.Caption = #29366#24577
                Width = 70
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'StrType'
                Footers = <>
                Title.Caption = #31867#22411
                Width = 86
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'StrPrint'
                Footers = <>
                Title.Caption = #26159#21542#25171#21360
                Width = 64
              end>
          end
          object pnl1: TPanel
            Left = 1
            Top = 497
            Width = 885
            Height = 36
            Align = alBottom
            TabOrder = 0
            object grpStatus: TGroupBox
              Left = 5
              Top = -1
              Width = 612
              Height = 32
              Caption = #29366#24577
              TabOrder = 0
              object cbx1: TCheckBox
                Left = 94
                Top = 12
                Width = 57
                Height = 17
                Caption = #24453#23457#26680
                Checked = True
                State = cbChecked
                TabOrder = 0
                OnClick = cbx1Click
              end
              object cbx2: TCheckBox
                Left = 171
                Top = 12
                Width = 62
                Height = 17
                Caption = #34987#36864#22238
                Checked = True
                State = cbChecked
                TabOrder = 1
                OnClick = cbx1Click
              end
              object cbx3: TCheckBox
                Left = 251
                Top = 12
                Width = 57
                Height = 17
                Caption = #24050#20445#30041
                TabOrder = 2
                OnClick = cbx1Click
              end
              object cbx4: TCheckBox
                Left = 322
                Top = 12
                Width = 57
                Height = 17
                Caption = #24050#26242#32531
                TabOrder = 3
                OnClick = cbx1Click
              end
              object cbx5: TCheckBox
                Left = 395
                Top = 12
                Width = 57
                Height = 17
                Caption = #24050#23457#26680
                TabOrder = 4
                OnClick = cbx1Click
              end
              object cbx6: TCheckBox
                Left = 470
                Top = 12
                Width = 57
                Height = 17
                Caption = #24050#25910#36135
                TabOrder = 5
                OnClick = cbx1Click
              end
              object cbx7: TCheckBox
                Left = 545
                Top = 12
                Width = 57
                Height = 17
                Caption = #24050#23436#25104
                TabOrder = 6
                OnClick = cbx1Click
              end
              object cbx8: TCheckBox
                Left = 14
                Top = 12
                Width = 57
                Height = 17
                Caption = #26410#25552#20132
                Checked = True
                State = cbChecked
                TabOrder = 7
                OnClick = cbx1Click
              end
            end
            object rgPrint: TRadioGroup
              Left = 631
              Top = 0
              Width = 185
              Height = 31
              Caption = #26159#21542#25171#21360
              Columns = 3
              ItemIndex = 0
              Items.Strings = (
                #20840#37096
                #25171#21360
                #26410#25171#21360)
              TabOrder = 1
              OnClick = rgPrintClick
            end
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 887
          ExplicitWidth = 887
          inherited lblFilter: TLabel
            Left = 547
            Top = 7
            ExplicitLeft = 547
            ExplicitTop = 7
          end
          inherited btnZD: TBitBtn
            Left = 325
            ExplicitLeft = 325
          end
          inherited edtFliter: TEdit
            Left = 604
            Top = 3
            TabOrder = 6
            ExplicitLeft = 604
            ExplicitTop = 3
          end
          inherited btnDY: TBitBtn
            Left = 390
            PopupMenu = pmDY
            TabOrder = 5
            Visible = True
            OnClick = btnDYClick
            ExplicitLeft = 390
          end
          inherited btnAuthDispatch: TBitBtn
            Left = 455
            ExplicitLeft = 455
          end
          object btnWJH: TBitBtn
            Left = 260
            Top = 0
            Width = 65
            Height = 29
            Align = alLeft
            Caption = #22312#36884
            Glyph.Data = {
              36060000424D3606000000000000360400002800000020000000100000000100
              08000000000000020000A40E0000A40E00000001000000000000000000003300
              00006600000099000000CC000000FF0000000033000033330000663300009933
              0000CC330000FF33000000660000336600006666000099660000CC660000FF66
              000000990000339900006699000099990000CC990000FF99000000CC000033CC
              000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
              0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
              330000333300333333006633330099333300CC333300FF333300006633003366
              33006666330099663300CC663300FF6633000099330033993300669933009999
              3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
              330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
              66006600660099006600CC006600FF0066000033660033336600663366009933
              6600CC336600FF33660000666600336666006666660099666600CC666600FF66
              660000996600339966006699660099996600CC996600FF99660000CC660033CC
              660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
              6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
              990000339900333399006633990099339900CC339900FF339900006699003366
              99006666990099669900CC669900FF6699000099990033999900669999009999
              9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
              990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
              CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
              CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
              CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
              CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
              CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
              FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
              FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
              FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
              FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
              000000808000800000008000800080800000C0C0C00080808000191919004C4C
              4C00B2B2B200E5E5E5005A1E1E00783C3C0096646400C8969600FFC8C800465F
              82005591B9006EB9D7008CD2E600B4E6F000D8E9EC0099A8AC00646F7100E2EF
              F100C56A31000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000EEEEEEEEEEEE
              EEEEEEEEEEEEEE820982EEEEEEEEEEEEEEEEEEEEEEEEEEAC81ACEE5E5E5E5E5E
              5E5E5E5E5E5E82090909EE8181818181818181818181AC818181EE5ED7D7D7D7
              D7D7D7D7D7DF09090982EE81D7D7D7D7D7D7D7D7D7DF818181ACEE5ED7E3E3E3
              E3E35E5E5E09090982EEEE81D7E3E3E3E3E3DFDFDF818181ACEEEE5ED7D7D7D7
              E35EB3B3D7880982EEEEEE81D7D7D7D7E381E3E3D7E381ACEEEEEE5ED7E3E3E3
              89B3B3B3B3D75EEEEEEEEE81D7E3E3E381E3E3E3E3D756EEEEEEEE5ED7D7D7D7
              89B3D7B3B3B35EEEEEEEEE81D7D7D7D781E3D7E3E3E356EEEEEEEE5ED7E3E3E3
              89B3D7D7B3B35EEEEEEEEE81D7E3E3E381E3D7D7E3E356EEEEEEEE5ED7D7D7D7
              D789B3B3B35E5EEEEEEEEE81D7D7D7D7D781E3E3E381DFEEEEEEEE5ED7E3E3E3
              E3E3898989E35EEEEEEEEE81D7E3E3E3E3E3818181E381EEEEEEEE5ED7D7D7D7
              D7D7D7D7D7D75EEEEEEEEE81D7D7D7D7D7D7D7D7D7D781EEEEEEEE5ED7E3E3E3
              E3E3D75E5E5E5EEEEEEEEE81D7E3E3E3E3E3D781818181EEEEEEEE5ED7D7D7D7
              D7D7D75EE35EEEEEEEEEEE81D7D7D7D7D7D7D781E381EEEEEEEEEE5ED7D7D7D7
              D7D7D75E5EEEEEEEEEEEEE81D7D7D7D7D7D7D78181EEEEEEEEEEEE5E5E5E5E5E
              5E5E5E5EEEEEEEEEEEEEEE818181818181818181EEEEEEEEEEEEEEEEEEEEEEEE
              EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE}
            NumGlyphs = 2
            TabOrder = 8
            OnClick = btnWJHClick
          end
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    CommandText = 
      'SELECT data0070.rkey'#13#10',data0070.po_number'#13#10',data0070.PO_REV_NO'#9#13 +
      #10',data0070.DATE_EDITED'#13#10',data0070.po_date'#13#10',data0070.status'#13#10',da' +
      'ta0070.PO_TYPE'#13#10',data0070.STATE_TAX'#13#10',data0070.PURCHASE_ORDER_TY' +
      'PE'#9#13#10',data0070.shipping_cost'#9#13#10',data0070.fob'#9#13#10',data0070.MISC_CH' +
      'ARGE'#9#13#10',data0070.discount2_days'#9#13#10',data0070.SUPP_FAC_ADD_PTR'#13#10',d' +
      'ata0070.PRINT_TIME'#13#10',data0070.PURCHASE_TYPE'#9#13#10',data0070.PAYMENT_' +
      'TERMS'#9#13#10',data0070.sub_total'#9#13#10',data0070.EXCHANGE_RATE'#9#13#10',data007' +
      '0.SECOND_WHSE_PTR'#13#10',data0070.print_date'#13#10',data0070.CSI_USER_POIN' +
      'TER'#9#13#10',data0070.STATUS'#13#10',data0070.WAREHOUSE_POINTER'#13#10',data0070.r' +
      'emark1070'#13#10',data0070.Remark2070'#13#10',CASE data0070.STATUS '#13#10#9'WHEN 1' +
      ' THEN '#39#24453#23457#26680#39#13#10#9'WHEN 2 THEN '#39#34987#36864#22238#39#13#10#9'WHEN 3 THEN '#39#24050#20445#30041#39#13#10#9'WHEN 4 THE' +
      'N '#39#24050#26242#32531#39#13#10#9'WHEN 5 THEN '#39#24050#23457#26680#39#13#10#9'WHEN 6 THEN '#39#24050#25910#36135#39#13#10#9'WHEN 7 THEN '#39#24050 +
      #23436#25104#39#13#10#9'WHEN 8 THEN '#39#26410#25552#20132#39' END AS StrStatus'#13#10',data0070.PO_TYPE'#13#10',CA' +
      'SE data0070.PO_TYPE'#13#10#9'WHEN '#39'S'#39' THEN '#39#32534#30721#29289#26009#39#13#10#9'WHEN '#39'M'#39' THEN '#39#38750#32534#30721#29289 +
      #26009#39' END AS StrType'#13#10',data0070.discount2_days'#13#10',CASE data0070.disc' +
      'ount2_days'#13#10#9'WHEN 0 THEN '#39#26684#24335#19968#39#13#10#9'WHEN 1 THEN '#39#26684#24335#20108#39' END AS StrRep' +
      'ort'#13#10',CASE WHEN ISNULL(data0070.PRINT_DATE,0)=0 THEN '#39#26410#25171#21360#39' '#13#10#9'EL' +
      'SE '#39#24050#25171#21360#39' END AS StrPrint'#13#10',data0015.warehouse_name'#13#10',data0015.ab' +
      'br_name as ware_name'#13#10',data0005.employee_name'#13#10',data0023.code'#13#10',' +
      'data0023.supplier_name'#13#10',data0023.abbr_name as supp_abbrname'#13#10',d' +
      'ata0023.phone'#13#10',data0023.fax'#13#10',Data0023.BILLING_ADDRESS_1'#9#13#10#13#10'FR' +
      'OM data0070 inner join '#13#10'data0005 on data0070.employee_pointer=d' +
      'ata0005.rkey inner join'#13#10'data0023 on data0070.supplier_pointer=d' +
      'ata0023.rkey inner join '#13#10'data0015 on data0070.WAREHOUSE_POINTER' +
      '=data0015.rkey'
    Left = 328
    Top = 184
  end
  inherited dsMain: TDataSource
    Left = 616
    Top = 352
  end
  inherited pmZD: TPopupMenu
    Left = 352
    Top = 8
  end
  inherited xpmnfst1: TXPManifest
    Left = 608
  end
  inherited pmMain: TPopupMenu
    OnPopup = pmMainPopup
    Left = 312
    Top = 72
    object mniAdd: TMenuItem
      Caption = #26032#22686
      object mniAddS: TMenuItem
        Caption = #32534#30721#29289#26009#37319#36141#35746#21333
        OnClick = mniAddSClick
      end
      object mniAddM: TMenuItem
        Caption = #38750#32534#30721#29289#26009#37319#36141#35746#21333
        OnClick = mniAddMClick
      end
    end
    object mniImport: TMenuItem
      Caption = #23548#20837'PR'#37319#36141#35831#27714
      OnClick = mniImportClick
    end
    object mniEdit: TMenuItem
      Caption = #32534#36753
      OnClick = mniEditClick
    end
    object mniEditDate: TMenuItem
      Caption = #32534#36753#20132#36135#26085#26399
      OnClick = mniEditDateClick
    end
    object mniCheck: TMenuItem
      Caption = #26816#26597
      OnClick = mniCheckClick
    end
    object mniAuth: TMenuItem
      Caption = #25552#20132#23457#26680
      OnClick = mniAuthClick
    end
    object mniUnAuth: TMenuItem
      Caption = #21462#28040#23457#26680
      OnClick = mniUnAuthClick
    end
    object mniText: TMenuItem
      Caption = #20132#36135#35760#20107#26412
      OnClick = mniTextClick
    end
    object mniN1: TMenuItem
      Caption = '-'
    end
    object mniStop: TMenuItem
      Caption = #26242#32531#37319#36141#35746#21333
      OnClick = mniStopClick
    end
    object mniStart: TMenuItem
      Caption = #21457#25918#37319#36141#35746#21333
      OnClick = mniStartClick
    end
    object mniDel: TMenuItem
      Caption = #21024#38500#37319#36141#35746#21333
      OnClick = mniDelClick
    end
    object mniN2: TMenuItem
      Caption = '-'
    end
    object mniEnd: TMenuItem
      Caption = #32467#26463#37319#36141#35746#21333
      OnClick = mniEndClick
    end
    object mniReStart: TMenuItem
      Caption = #37325#26032#21551#29992#35746#21333
      OnClick = mniReStartClick
    end
    object mniN3: TMenuItem
      Caption = '-'
    end
    object mniAuthMsg: TMenuItem
      Caption = #23457#25209#20449#24687
      OnClick = mniAuthMsgClick
    end
    object mniReceivedMsg: TMenuItem
      Caption = #25910#36135#20449#24687
      OnClick = mniReceivedMsgClick
    end
    object mniASK: TMenuItem
      Caption = #35810#20215
      Hint = #35810#20215
      OnClick = mniASKClick
    end
    object mniPrintOnly: TMenuItem
      Caption = #21333#29420#25171#21360#25253#34920
      OnClick = mniPrintOnlyClick
    end
    object mniPrintMul: TMenuItem
      Caption = #36830#32493#25171#21360#25253#34920
      OnClick = mniPrintMulClick
    end
    object mniChangLog: TMenuItem
      Caption = #35746#21333#21464#26356#35760#24405
      OnClick = mniChangLogClick
    end
  end
  inherited cdsMainWhereInit: TClientDataSet
    Left = 208
    Top = 0
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 744
    Top = 165
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 680
    Top = 157
  end
  object cds78: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 18
    Top = 479
  end
  object cds14: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 98
    Top = 471
  end
  object cds314: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 146
    Top = 471
  end
  object cds70: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 50
    Top = 423
  end
  object cds362: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 101
    Top = 424
  end
  object cds68: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 242
    Top = 479
  end
  object cds69: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 282
    Top = 479
  end
  object cds204: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 322
    Top = 479
  end
  object cds78_2: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 58
    Top = 479
  end
  object pmDY: TPopupMenu
    Left = 410
    Top = 2
    object mniS: TMenuItem
      Caption = #26631#20934#35746#21333#25253#34920
      OnClick = mniSClick
    end
    object mniM: TMenuItem
      Caption = #26434#39033#35746#21333#25253#34920
      OnClick = mniMClick
    end
  end
end
