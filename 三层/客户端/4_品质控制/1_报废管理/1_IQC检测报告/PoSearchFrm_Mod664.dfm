inherited frmPoSearch_Mod664: TfrmPoSearch_Mod664
  Left = 377
  Top = 238
  Caption = #36873#25321#37319#36141#35746#21333
  ClientHeight = 567
  ClientWidth = 801
  ExplicitWidth = 817
  ExplicitHeight = 606
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 801
    Height = 567
    ExplicitWidth = 801
    ExplicitHeight = 567
    inherited pnlDisplayMain: TPanel
      Width = 801
      Height = 567
      ExplicitWidth = 801
      ExplicitHeight = 567
      inherited pnlChildMain: TPanel
        Width = 799
        Height = 565
        ExplicitWidth = 799
        ExplicitHeight = 565
        inherited pnlEhMainDisplay: TPanel
          Width = 797
          Height = 534
          ExplicitWidth = 797
          ExplicitHeight = 534
          inherited ehMain: TDBGridEh
            Width = 795
            Height = 532
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
            OnDblClick = ehMainDblClick
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PO_NUMBER'
                Footers = <>
                Title.Caption = #37319#36141#21333#21495
                Title.Color = clRed
                Title.SortIndex = 1
                Title.SortMarker = smUpEh
                Width = 80
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_PART_NUMBER'
                Footers = <>
                Title.Caption = #26448#26009#32534#30721
                Width = 164
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_NAME'
                Footers = <>
                Title.Caption = #26448#26009#21517#31216
                Width = 139
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_DESCRIPTION'
                Footers = <>
                Title.Caption = #26448#26009#35268#26684
                Width = 249
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'extra_req'
                Footers = <>
                Title.Caption = #29305#27530#35201#27714
                Width = 107
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'UNIT_NAME'
                Footers = <>
                Title.Caption = #21333#20301
                Width = 45
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'QUAN_ORD'
                Footers = <>
                Title.Caption = #35746#21333#25968#37327
                Width = 63
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'NotCheck'
                Footers = <>
                Title.Caption = #24453#26816#27979#25968#37327
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'purchase_name'
                Footers = <>
                Title.Caption = #37319#36141#20154#21592
                Width = 65
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CODE'
                Footers = <>
                Title.Caption = #20379#24212#21830#20195#30721
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ABBR_NAME'
                Footers = <>
                Title.Caption = #20379#24212#21830#21517#31216
                Width = 108
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'REQ_DATE'
                Footers = <>
                Title.Caption = #21040#36135#26085#26399
                Width = 75
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'SGS_NO'
                Footers = <>
                Title.Caption = 'SGS'#32534#21495
                Width = 106
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'TestDate'
                Footers = <>
                Title.Caption = 'SGS'#27979#35797#26085#26399
                Width = 79
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'halogen_cn'
                Footers = <>
                Title.Caption = #26080#21348#32032
                Width = 45
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'HaTong'
                Footers = <>
                Title.Caption = #21547#38108
                Width = 67
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CAP'
                Footers = <>
                Title.Caption = #32784'CAF'
                Width = 42
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'rohs'
                Footers = <>
                Width = 40
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'imp'
                Footers = <>
                Title.Caption = #37325#35201#26631#35782
                Width = 36
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'murgency'
                Footers = <>
                Title.Caption = #32039#24613#29289#26009
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'hourwork'
                Footers = <>
                Title.Caption = #24037#21378
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'IES_PARAMETER_VALUE2'
                Footers = <>
                Title.Caption = #26495#26009#21402#24230
                Width = 70
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'IES_PARAMETER_VALUE3'
                Footers = <>
                Title.Caption = #38108#31636#21402#24230
                Width = 68
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'IES_PARAMETER_VALUE4'
                Footers = <>
                Title.Caption = #26495#26009#23610#23544
                Width = 60
              end>
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 797
          ExplicitWidth = 797
          inherited lblFilter: TLabel
            Left = 264
            Caption = #37319#36141#21333#21495
            ExplicitLeft = 264
          end
          inherited btnExit: TBitBtn
            Left = 65
            ExplicitLeft = 65
          end
          inherited btnRefresh: TBitBtn
            Left = 130
            Visible = False
            ExplicitLeft = 130
          end
          inherited btnExportToExcel: TBitBtn
            Left = 195
            Visible = False
            ExplicitLeft = 195
          end
          inherited btnQry: TBitBtn
            Left = 537
            Align = alRight
            Visible = False
            ExplicitLeft = 537
          end
          inherited btnZD: TBitBtn
            Left = 602
            Align = alRight
            Visible = False
            ExplicitLeft = 602
          end
          inherited edtFliter: TEdit
            Left = 321
            ExplicitLeft = 321
          end
          inherited btnDY: TBitBtn
            Left = 667
            Align = alRight
            ExplicitLeft = 667
          end
          inherited btnAuthDispatch: TBitBtn
            Left = 732
            Align = alRight
            Visible = False
            ExplicitLeft = 732
          end
          object btnS: TBitBtn
            Left = 0
            Top = 0
            Width = 65
            Height = 29
            Align = alLeft
            Caption = #30830#23450
            Glyph.Data = {
              36060000424D3606000000000000360400002800000020000000100000000100
              08000000000000020000750E0000750E00000001000000000000000000003300
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
              EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE09090909
              090909090909090909EEEEEE81818181818181818181818181EEEE09101009E3
              1009E3E3E309101009EEEE81ACAC81E3AC81E3E3E381ACAC81EEEE09101009E3
              1009E3E3E309101009EEEE81ACAC81E3AC81E3E3E381ACAC81EEEE09101009E3
              1009E3E3E309101009EEEE81ACAC81E3AC81E3E3E381ACAC81EEEE09101009E3
              E3E3E3E3E309101009EEEE81ACAC81E3E3E3E3E3E381ACAC81EEEE0910101009
              090909090910101009EEEE81ACACAC818181818181ACACAC81EEEE0910101010
              101010101010101009EEEE81ACACACACACACACACACACACAC81EEEE0910100909
              090909090909101009EEEE81ACAC8181818181818181ACAC81EEEE091009D7D7
              D7D7D7D7D7D7091009EEEE81AC81D7D7D7D7D7D7D7D781AC81EEEE091009D709
              0909090909D7091009EEEE81AC81D7818181818181D781AC81EEEE091009D7D7
              D7D7D7D7D7D7091009EEEE81AC81D7D7D7D7D7D7D7D781AC81EEEE09E309D709
              0909090909D7090909EEEE81E381D7818181818181D7818181EEEE091009D7D7
              D7D7D7D7D7D7091009EEEE81AC81D7D7D7D7D7D7D7D781AC81EEEE0909090909
              090909090909090909EEEE8181818181818181818181818181EEEEEEEEEEEEEE
              EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE}
            ModalResult = 1
            NumGlyphs = 2
            TabOrder = 8
          end
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    CommandText = 
      'SELECT         dbo.Data0017.GROUP_PTR, dbo.Data0071.RKEY,dbo.dat' +
      'a0017.RKEY as rkey17'#13#10#9#9#9', dbo.Data0071.INVT_PTR, dbo.Data0070.P' +
      'O_NUMBER'#13#10#9#9#9', dbo.Data0017.INV_PART_NUMBER, dbo.Data0023.CODE '#13 +
      #10#9#9#9', dbo.Data0023.ABBR_NAME, dbo.Data0017.INV_NAME'#13#10#9#9#9', dbo.Da' +
      'ta0017.INV_DESCRIPTION, dbo.Data0071.QUAN_ORD'#13#10#9#9#9', purchase.emp' +
      'loyee_name as purchase_name '#13#10#9#9#9', cast( dbo.Data0071.QUAN_ORD -' +
      ' dbo.Data0071.QUAN_REJD as decimal(13, 4))  AS NotCheck'#13#10#9#9#9', db' +
      'o.Data0071.REQ_DATE, dbo.Data0071.extra_req'#13#10#9#9#9', dbo.Data0071.I' +
      'F_CAF AS CAP,dbo.Data0071.rohs'#13#10#9#9#9', dbo.Data0002.UNIT_NAME, dbo' +
      '.data0805.SGS_NO'#13#10#9#9#9', dbo.data0805.TestDate '#13#10#9#9#9', CASE DATA002' +
      '8.qte_price2 WHEN 0 THEN DATA0017.SHELF_LIFE ELSE DATA0028.qte_p' +
      'rice2 END AS eff_Date'#13#10#9#9#9', CASE WHEN (Data0017.INV_NAME LIKE '#39'%' +
      #26080#21348'%'#39') or (Data0017.INV_DESCRIPTION LIKE '#39'%'#26080#21348'%'#39') THEN 1 ELSE 0 EN' +
      'D AS halogen '#13#10#9#9#9', CASE WHEN Data0017.INV_NAME LIKE '#39'%'#26080#21348'%'#39' or (' +
      'Data0017.INV_DESCRIPTION LIKE '#39'%'#26080#21348'%'#39') THEN '#39#26159#39' ELSE '#39#21542#39' END AS h' +
      'alogen_cn '#13#10#9#9#9', ISNULL(dbo.Data0017.IES_PARAMETER_VALUE8,dbo.Da' +
      'ta0017.IES_PARAMETER_VALUE6)  AS HaTong '#13#10#9#9#9', CASE data0017.CRI' +
      'TICAL_MATL_FLAG WHEN 0 THEN '#39#21542#39' WHEN 1 THEN '#39#26159#39' END AS imp, dbo.' +
      'Data0071.IF_urgency AS murgency '#13#10#9#9#9', dbo.Data0015.ABBR_NAME AS' +
      ' hourwork, dbo.Data0017.IES_PARAMETER_VALUE2'#13#10#9#9#9', dbo.Data0017.' +
      'IES_PARAMETER_VALUE3,dbo.Data0017.IES_PARAMETER_VALUE4,data0019.' +
      'inv_group_name'#13#10'FROM         dbo.Data0071 INNER JOIN'#13#10'          ' +
      '            dbo.Data0017 ON dbo.Data0071.INVT_PTR = dbo.Data0017' +
      '.RKEY  INNER JOIN'#13#10'                      dbo.Data0496 ON dbo.Dat' +
      'a0017.GROUP_PTR = dbo.Data0496.RKEY INNER JOIN'#13#10'                ' +
      '      dbo.Data0019 ON dbo.data0496.group_ptr= Data0019.rkey INNE' +
      'R JOIN'#13#10'                      dbo.Data0002 ON dbo.Data0071.PURCH' +
      'ASE_UNIT_PTR = dbo.Data0002.RKEY INNER JOIN'#13#10'                   ' +
      '   dbo.Data0070 ON dbo.Data0071.PO_PTR = dbo.Data0070.RKEY INNER' +
      ' JOIN'#13#10#9'      dbo.Data0005 as purchase ON dbo.Data0070.employee_' +
      'pointer = purchase.RKEY INNER JOIN'#13#10'                      dbo.Da' +
      'ta0023 ON dbo.Data0070.SUPPLIER_POINTER = dbo.Data0023.RKEY INNE' +
      'R JOIN'#13#10'                      dbo.Data0015 ON dbo.Data0070.WAREH' +
      'OUSE_POINTER = dbo.Data0015.RKEY LEFT OUTER JOIN'#13#10'              ' +
      '        dbo.Data0028 ON dbo.Data0071.INVT_PTR = dbo.Data0028.INV' +
      'ENTORY_PTR AND '#13#10'                      dbo.Data0070.SUPPLIER_POI' +
      'NTER = dbo.Data0028.SUPPLIER_PTR LEFT OUTER JOIN'#13#10'              ' +
      '        dbo.data0805 ON dbo.Data0028.prot_report_ptr = dbo.data0' +
      '805.rkey'#13#10'WHERE     (dbo.Data0071.avl_flag = '#39'Y'#39') AND (dbo.Data0' +
      '071.QUAN_ORD - dbo.Data0071.QUAN_REJD > 0) '#13#10'AND (dbo.Data0070.S' +
      'TATUS = 5)'#13#10
  end
  inherited pmMain: TPopupMenu
    Left = 376
    Top = 296
  end
end
