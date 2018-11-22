inherited frmMain_Mod664: TfrmMain_Mod664
  Left = 295
  Top = 203
  Caption = 'frmMain_Mod664'
  ClientHeight = 605
  ClientWidth = 1010
  ExplicitWidth = 1026
  ExplicitHeight = 644
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 1010
    Height = 605
    ExplicitWidth = 1010
    ExplicitHeight = 605
    inherited pnlDisplayMain: TPanel
      Width = 1010
      Height = 605
      ExplicitWidth = 1010
      ExplicitHeight = 605
      inherited pnlChildMain: TPanel
        Width = 1008
        Height = 603
        ExplicitWidth = 1008
        ExplicitHeight = 603
        inherited pnlEhMainDisplay: TPanel
          Width = 1006
          Height = 572
          ExplicitWidth = 1006
          ExplicitHeight = 572
          inherited ehMain: TDBGridEh
            Width = 1004
            Height = 570
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
            OnDrawColumnCell = ehMainDrawColumnCell
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'iqc_number'
                Footers = <>
                Title.Caption = 'IQC'#32534#21495
                Title.Color = clRed
                Title.SortIndex = 1
                Title.SortMarker = smUpEh
                Width = 83
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PO_NUMBER'
                Footers = <>
                Title.Caption = #35746#21333#32534#21495
                Width = 83
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_PART_NUMBER'
                Footers = <>
                Title.Caption = #26448#26009#32534#30721
                Width = 148
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_NAME'
                Footers = <>
                Title.Caption = #26448#26009#21517#31216
                Visible = False
                Width = 115
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_DESCRIPTION'
                Footers = <>
                Title.Caption = #26448#26009#35268#26684
                Width = 159
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'supplier_model'
                Footers = <>
                Title.Caption = #22411#21495
                Width = 77
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'unit_name'
                Footers = <>
                Title.Caption = #21333#20301
                Width = 63
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'GROUP_DESC'
                Footers = <>
                Title.Caption = #26448#26009#31867#22411
                Width = 85
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'purchase_name'
                Footers = <>
                Title.Caption = #37319#36141#20154#21592
                Width = 63
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'req_name'
                Footers = <>
                Title.Caption = #35831#36141#20154#21592
                Width = 69
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'reason'
                Footers = <>
                Title.Caption = #35831#36141#21407#22240
                Width = 164
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'extra_req'
                Footers = <>
                Title.Caption = #29305#27530#35201#27714
                Width = 72
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CODE'
                Footers = <>
                Title.Caption = #20379#24212#21830#20195#30721
                Width = 68
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ABBR_NAME'
                Footers = <>
                Title.Caption = #20379#24212#21830#21517#31216
                Width = 71
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'strStatus'
                Footers = <>
                Title.Caption = #29366#24577
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'sgs_no'
                Footers = <>
                Title.Caption = 'SGS'#32534#21495
                Width = 90
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'sgs_date'
                Footers = <>
                Title.Caption = 'SGS'#26085#26399
                Width = 76
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'rece_qty'
                Footers = <>
                Title.Caption = #26469#26009#25968#37327
                Width = 62
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'iqc_qty'
                Footers = <>
                Title.Caption = #26816#26597#25968#37327
                Width = 74
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'barch_no'
                Footers = <>
                Title.Caption = #25209#21495
                Width = 86
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'halogen'
                Footers = <>
                Title.Caption = #26080#21348#32032
                Width = 64
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'appearance'
                Footers = <>
                Title.Caption = #22806#35266#24773#20917
                Width = 201
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'part_size'
                Footers = <>
                Title.Caption = #20135#21697#23610#23544
                Width = 81
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'part_thickness'
                Footers = <>
                Title.Caption = #26495#26009#21402#24230
                Width = 71
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'tong_thickness'
                Footers = <>
                Title.Caption = #38080#31636#21402#24230
                Width = 69
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'thick_tolerance'
                Footers = <>
                Title.Caption = #21402#24230#20844#24046
                Width = 75
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ht_remark'
                Footers = <>
                Title.Caption = #26159#21542#21547#38108
                Width = 63
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'if_standard'
                Footers = <>
                Title.Caption = #26159#21542#31526#21512#35268#33539
                Width = 84
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'extrl_date'
                Footers = <>
                Title.Caption = #26377#25928#26399#33267
                Width = 73
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'judge_result'
                Footers = <>
                Title.Caption = #21028#23450#32467#26524
                Width = 69
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'employee_name'
                Footers = <>
                Title.Caption = #30003#35831#20154
                Width = 58
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'appl_date'
                Footers = <>
                Title.Caption = #30003#35831#26085#26399
                Width = 132
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'user_appr'
                Footers = <>
                Title.Caption = #26816#26597#20154
                Width = 71
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'appr_date'
                Footers = <>
                Title.Caption = #26816#26597#26085#26399
                Width = 132
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'user_auth'
                Footers = <>
                Title.Caption = #23457#26680#20154
                Width = 58
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'auth_date'
                Footers = <>
                Title.Caption = #23457#26680#26085#26399
                Width = 120
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'remark'
                Footers = <>
                Title.Caption = #22791#27880
                Width = 190
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'manufacture_TDATE'
                Footers = <>
                Title.Caption = #21046#36896#26085#26399
                Width = 90
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'package'
                Footers = <>
                Title.Caption = #21253#35013#21512#26684
                Width = 59
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'qty'
                Footers = <>
                Title.Caption = #25968#37327#21512#26684
                Width = 62
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'haReport'
                Footers = <>
                Title.Caption = #20986#36135#25253#21578
                Width = 66
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'IF_CAF'
                Footers = <>
                Title.Caption = #26159#21542'CAF'
                Width = 53
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'AUDIUSER'
                Footers = <>
                Title.Caption = 'SGS'#23457#26680#20154
                Width = 62
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'strstock'
                Footers = <>
                Title.Caption = #26159#21542#20837#24211
              end>
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 1006
          ExplicitWidth = 1006
          inherited lblFilter: TLabel
            Left = 539
            ExplicitLeft = 539
          end
          object lbl1: TLabel [1]
            Left = 968
            Top = 8
            Width = 24
            Height = 13
            Anchors = [akRight]
            Caption = #24110#21161
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = lbl1Click
          end
          inherited edtFliter: TEdit
            Left = 593
            Top = 3
            ExplicitLeft = 593
            ExplicitTop = 3
          end
          inherited btnDY: TBitBtn
            Left = 390
            PopupMenu = pmDesign
            Visible = True
            OnClick = btnDYClick
            ExplicitLeft = 390
          end
          inherited btnAuthDispatch: TBitBtn
            Left = 879
            Top = -1
            Align = alCustom
            ExplicitLeft = 879
            ExplicitTop = -1
          end
          object cbxStatus: TCheckBox
            Left = 800
            Top = 7
            Width = 97
            Height = 17
            Caption = #26174#31034#25152#26377#25253#21578
            TabOrder = 8
            OnClick = cbxStatusClick
          end
          object btnType: TBitBtn
            Left = 325
            Top = 0
            Width = 65
            Height = 29
            Align = alLeft
            Caption = #31867#22411
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              04000000000080000000120B0000120B00001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
              DADA000000000000ADAD0FFFFFFFFFF0DADA0F00F00000F0ADAD0FFFFFFFFFF0
              DADA0F00F00000F0ADAD0FFFFFFFFFF0DADA0FFFFFFF0FF0ADAD0FF0FFF080F0
              DAD40F080F0808000D440FF08080808880440000080808888844DADAD0808888
              8844ADADAD0888888044DADADAD000000A44ADADADADADADADAD}
            TabOrder = 9
            OnClick = btnTypeClick
          end
          object btnSum: TBitBtn
            Left = 455
            Top = 0
            Width = 65
            Height = 29
            Align = alLeft
            Caption = #27719#24635
            Glyph.Data = {
              36060000424D3606000000000000360400002800000020000000100000000100
              08000000000000020000420B0000420B00000001000000000000000000003300
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
              EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
              EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE5E095EEEEE
              EEEEEEEEEEEEEEEEEEEEEEAC81ACEEEEEEEEEEEEEEEEEEEEEEEEEE090909EEEE
              0000000000000000EEEEEE818181EEEE8181818181818181EEEEEE5E095EEEEE
              EEEEEEEEEEEEEEEEEEEEEEAC81ACEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
              EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
              EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE5E095EEEEE
              EEEEEEEEEEEEEEEEEEEEEEAC81ACEEEEEEEEEEEEEEEEEEEEEEEEEE090909EEEE
              0000000000000000EEEEEE818181EEEE8181818181818181EEEEEE5E095EEEEE
              EEEEEEEEEEEEEEEEEEEEEEAC81ACEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
              EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
              EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE5E095EEEEE
              EEEEEEEEEEEEEEEEEEEEEEAC81ACEEEEEEEEEEEEEEEEEEEEEEEEEE090909EEEE
              0000000000000000EEEEEE818181EEEE8181818181818181EEEEEE5E095EEEEE
              EEEEEEEEEEEEEEEEEEEEEEAC81ACEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
              EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE}
            NumGlyphs = 2
            TabOrder = 10
            OnClick = btnSumClick
          end
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    CommandText = 
      'SELECT    dbo.Data0070.PO_NUMBER, dbo.Data0002.UNIT_NAME'#13#10#9#9', db' +
      'o.Data0071.reason , dbo.Data0071.extra_req '#13#10#9#9', D05_appr.EMPLOY' +
      'EE_NAME AS user_appr'#13#10#9#9', D05_auth.EMPLOYEE_NAME AS user_auth'#13#10#9 +
      #9', D05_req.EMPLOYEE_NAME AS req_name'#13#10#9#9', D05_purchase.EMPLOYEE_' +
      'NAME AS purchase_name'#13#10'                                , Data000' +
      '5.EMPLOYEE_NAME,dbo.data0071.IF_CAF'#13#10#9#9', dbo.Data0017.INV_PART_N' +
      'UMBER, dbo.Data0017.INV_NAME'#13#10#9#9', dbo.Data0017.INV_DESCRIPTION'#13#10 +
      #9#9', dbo.Data0017.GROUP_PTR, dbo.Data0017.IES_PARAMETER_VALUE2'#13#10#9 +
      #9', dbo.Data0017.IES_PARAMETER_VALUE3, dbo.Data0017.IES_PARAMETER' +
      '_VALUE4'#13#10#9#9', dbo.Data0017.IES_PARAMETER_VALUE8, dbo.Data0496.GRO' +
      'UP_DESC'#13#10#9#9', dbo.Data0023.ABBR_NAME, dbo.Data0023.CODE'#13#10#9#9', dbo.' +
      'Data0073.USER_FULL_NAME AS AUDIUSER '#13#10#9#9', CASE dbo.data0391.pack' +
      'age_qualified WHEN 1 THEN '#39#21512#26684#39' WHEN 0 THEN '#39#19981#21512#26684#39' END AS package ' +
      #13#10#9#9', CASE dbo.data0391.qty_qualified WHEN 1 THEN '#39#21512#26684#39' WHEN 0 TH' +
      'EN '#39#19981#21512#26684#39' END AS qty '#13#10#9#9', CASE dbo.data0391.hasheepreport WHEN 1' +
      ' THEN '#39#26377#39' WHEN 0 THEN '#39#26080#39' END AS haReport'#13#10#9#9', CASE data0391.if_' +
      'halogen WHEN 1 THEN '#39#26159#39' ELSE '#39#21542#39' END AS halogen '#13#10#9#9', CASE dbo.d' +
      'ata0391.status WHEN 1 THEN '#39#24453#23457#26680#39' WHEN 2 THEN '#39#24050#23457#26680#39' when 3 then '#39 +
      #23457#26680#19981#21512#26684#39' END AS strStatus'#13#10'                                , CASE ' +
      'dbo.data0391.stock_over when 0 then '#39#26410#20837#24211#39' when 1 then '#39#24050#20837#24211#39' end ' +
      'as strstock'#13#10#9#9', dbo.DATA0391.*'#13#10'FROM         dbo.DATA0391 INNER' +
      ' JOIN'#13#10'                      dbo.Data0017 ON dbo.DATA0391.rkey17' +
      ' = dbo.Data0017.RKEY INNER JOIN'#13#10'                      dbo.Data0' +
      '071 ON dbo.DATA0391.rkey71 = dbo.Data0071.RKEY INNER JOIN'#13#10'     ' +
      '                 dbo.Data0002 ON dbo.Data0071.PURCHASE_UNIT_PTR ' +
      '= dbo.Data0002.RKEY INNER JOIN'#13#10'                      dbo.Data00' +
      '70 ON dbo.Data0071.PO_PTR = dbo.Data0070.RKEY INNER JOIN'#13#10'      ' +
      '                dbo.Data0005 AS D05_purchase ON dbo.Data0070.EMP' +
      'LOYEE_POINTER = D05_purchase.RKEY INNER JOIN'#13#10'                  ' +
      '    dbo.Data0023 ON dbo.Data0070.SUPPLIER_POINTER = dbo.Data0023' +
      '.RKEY INNER JOIN'#13#10'                      dbo.Data0496 ON dbo.Data' +
      '0017.GROUP_PTR = dbo.Data0496.RKEY INNER JOIN'#13#10'                 ' +
      '     dbo.Data0005 ON dbo.DATA0391.appl_user_ptr = dbo.Data0005.R' +
      'KEY LEFT OUTER JOIN'#13#10'                      dbo.Data0005 AS D05_a' +
      'ppr ON dbo.DATA0391.appr_user_ptr = D05_appr.RKEY LEFT OUTER JOI' +
      'N'#13#10'                      dbo.Data0005 AS D05_auth ON dbo.DATA039' +
      '1.auth_user_ptr = D05_auth.RKEY LEFT OUTER JOIN'#13#10'               ' +
      '       dbo.Data0069 ON dbo.Data0069.RKEY = dbo.Data0071.rkey69 L' +
      'EFT OUTER JOIN'#13#10'                      dbo.Data0068 ON dbo.Data00' +
      '68.RKEY = dbo.Data0069.PURCH_REQ_PTR LEFT OUTER JOIN'#13#10'          ' +
      '            dbo.Data0005 AS D05_req ON dbo.Data0068.REQ_BY = D05' +
      '_req.RKEY LEFT OUTER JOIN'#13#10'                      dbo.Data0028 ON' +
      ' dbo.Data0071.INVT_PTR = dbo.Data0028.INVENTORY_PTR AND '#13#10'      ' +
      '                dbo.Data0070.SUPPLIER_POINTER = dbo.Data0028.SUP' +
      'PLIER_PTR LEFT OUTER JOIN'#13#10'                      dbo.data0805 ON' +
      ' dbo.Data0028.prot_report_ptr = dbo.data0805.rkey LEFT OUTER JOI' +
      'N'#13#10'                      dbo.Data0073 ON dbo.data0805.Audi_ptr =' +
      ' dbo.Data0073.RKEY'#13#10'WHERE 1=1'#13#10
  end
  inherited pmZD: TPopupMenu
    Left = 288
  end
  inherited pmMain: TPopupMenu
    OnPopup = pmMainPopup
    Left = 288
    Top = 208
    object mniAdd: TMenuItem
      Caption = #26032#22686
      OnClick = mniAddClick
    end
    object mniEdit: TMenuItem
      Caption = #32534#36753
      OnClick = mniEditClick
    end
    object mniCheck: TMenuItem
      Caption = #26816#26597
      OnClick = mniCheckClick
    end
    object mniDelete: TMenuItem
      Caption = #21024#38500
      OnClick = mniDeleteClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mniAuth: TMenuItem
      Caption = #23457#26680#21512#26684
      OnClick = mniAuthClick
    end
    object mniAuthFalse: TMenuItem
      Caption = #23457#26680#19981#21512#26684
      OnClick = mniAuthFalseClick
    end
    object mniUnAuth: TMenuItem
      Caption = #36864#22238#23457#26680
      OnClick = mniUnAuthClick
    end
    object mniBadRecord: TMenuItem
      Caption = #19981#33391#29289#26009#30331#35760#34920
      OnClick = mniBadRecordClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object mniTongZhiDan: TMenuItem
      Caption = #29289#26009#26816#39564#36890#30693#21333
      Hint = #29289#26009#26816#39564#36890#30693#21333'.fr3'
      OnClick = mniTongZhiDanClick
    end
    object mniTongBan: TMenuItem
      Tag = 1
      Caption = #38108#26495#26469#26009#26816#39564#25253#21578
      Hint = #38108#26495#26469#26009#26816#39564#25253#21578'.fr3'
      OnClick = mniTongBanClick
    end
    object mniDrill: TMenuItem
      Tag = 2
      Caption = #38075#21632#38179#20992#26816#39564#27979#37327#25253#21578
      Hint = #38075#21632#38179#20992#26816#39564#27979#37327#25253#21578'.fr3'
      OnClick = mniDrillClick
    end
    object mniCheLiang: TMenuItem
      Tag = 3
      Caption = #26469#26009#26816#39564#27979#37327#25253#21578
      Hint = #26469#26009#26816#39564#27979#37327#25253#21578'.fr3'
      OnClick = mniCheLiangClick
    end
    object mniGaoPingBan: TMenuItem
      Tag = 4
      Caption = #39640#39057#26495#26469#26009#26816#39564#25253#21578
      Hint = #39640#39057#26495#26469#26009#26816#39564#25253#21578'.fr3'
      OnClick = mniGaoPingBanClick
    end
  end
  inherited cdsMainWhereInit: TClientDataSet
    Left = 352
    Top = 48
  end
  object pmDesign: TPopupMenu
    Left = 424
    Top = 40
    object N3: TMenuItem
      Caption = #29289#26009#26816#39564#36890#30693#21333#23450#20041
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #38108#26495#26469#26009#26816#39564#25253#21578#23450#20041
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = #38075#21632#38179#20992#26816#39564#27979#37327#25253#21578#23450#20041
      OnClick = N5Click
    end
    object N6: TMenuItem
      Caption = #26469#26009#26816#39564#27979#37327#25253#21578#23450#20041
      OnClick = N6Click
    end
    object N7: TMenuItem
      Caption = #39640#39057#26495#26469#26009#26816#39564#25253#21578#23450#20041
      OnClick = N7Click
    end
  end
end
