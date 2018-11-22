inherited FrmMain_Mod63: TFrmMain_Mod63
  Caption = 'FrmMain_Mod63'
  ClientHeight = 363
  ClientWidth = 759
  ExplicitWidth = 767
  ExplicitHeight = 397
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 759
    Height = 363
    ExplicitWidth = 759
    ExplicitHeight = 363
    inherited pnlDisplayMain: TPanel
      Width = 759
      Height = 363
      ExplicitWidth = 759
      ExplicitHeight = 363
      inherited pnlChildMain: TPanel
        Width = 757
        Height = 361
        ExplicitWidth = 757
        ExplicitHeight = 361
        inherited pnlEhMainDisplay: TPanel
          Width = 755
          Height = 330
          ExplicitWidth = 755
          ExplicitHeight = 330
          inherited ehMain: TDBGridEh
            Width = 753
            Height = 328
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'code'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'supplier_name'
                Footers = <>
                Width = 182
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'abbr_name'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'status'
                Footers = <>
                Width = 35
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'brother_flag'
                Footers = <>
                Width = 92
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ADDRESS2_FOR_FORM'
                Footers = <>
                Width = 141
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ADDRESS1_FOR_FORM'
                Footers = <>
                Visible = False
                Width = 234
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ttype'
                Footers = <>
                Visible = False
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'VMI'
                Footers = <>
                Width = 86
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'suppier_ent_date'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'contact_name_1'
                Footers = <>
                Width = 76
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'cont_phone_1'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'phone'
                Footers = <>
                Width = 109
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'fax'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'telex'
                Footers = <>
                Visible = False
                Width = 136
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'curr_name'
                Footers = <>
                Width = 72
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'country_name'
                Footers = <>
                Width = 87
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'employee_name'
                Footers = <>
                Visible = False
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'update_date'
                Footers = <>
                Visible = False
                Width = 126
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'billing_address_1'
                Footers = <>
                Visible = False
                Width = 304
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'tax_id_number'
                Footers = <>
                Visible = False
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'analysis_code1'
                Footers = <>
                Visible = False
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'developer'
                Footers = <>
                Width = 96
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'invalid_explain'
                Footers = <>
              end>
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 755
          ExplicitWidth = 755
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    CommandText = 
      'select d23.rkey,d23.code,d23.supplier_name,d23.abbr_name,ADDRESS' +
      '2_FOR_FORM,'#13#10'case d23.status when 0 then '#39#26377#25928#39' when 1 then '#39#26080#25928#39' e' +
      'nd as status,ADDRESS1_FOR_FORM,'#13#10'case d23.brother_flag when 0 th' +
      'en '#39#21542#39' when 1 then '#39#26159#39' end as brother_flag,'#13#10'case d23.ttype when' +
      ' 0 then '#39#26448#26009#20379#24212#21830#39' when 1 then '#39#22806#21457#20379#24212#21830#39' when 2 then '#39#22806#21457#20860#26448#26009#39' end as t' +
      'type,'#13#10'case d23.EDI_OUT_NEW_PO when 0 then '#39#21542#39' when 1 then '#39#26159#39' e' +
      'nd as VMI,'#13#10'd23.suppier_ent_date,d23.contact_name_1 ,d23.cont_ph' +
      'one_1,d23.phone,d23.fax,d23.telex,'#13#10'd01.curr_name,d250.country_n' +
      'ame,d05.employee_name,d23.update_date,'#13#10'd23.billing_address_1,d2' +
      '3.tax_id_number,d23.developer,d23.invalid_explain,'#13#10'd23.po_note_' +
      'pad_ptr,d23.debmem_note_pad_ptr,d23.rfq_note_pad_ptr,'#13#10'd23.commo' +
      'n_pad_ptr,d23.analysis_code1,d23.EDI_OUT_NEW_PO,d23.EDI_FLAG_FOR' +
      '_PO'#13#10'from Data0023 d23 inner join data0001 d01 on d23.currency_p' +
      'tr=d01.rkey'#13#10'left join data0250 d250 on d23.country_ptr=d250.cou' +
      'ntry_rkey'#13#10'left join data0005 d05 on d23.user_ptr=d05.rkey '#13#10'whe' +
      're (1=1)'
    ProviderName = 'DataSetProvider1'
    object cdsMaincode: TStringField
      DisplayLabel = #20195#30721
      FieldName = 'code'
      Size = 10
    end
    object cdsMainsupplier_name: TStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldName = 'supplier_name'
      Size = 100
    end
    object cdsMainabbr_name: TStringField
      DisplayLabel = #21517#31216#32553#20889
      FieldName = 'abbr_name'
      Size = 16
    end
    object cdsMainstatus: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'status'
      ReadOnly = True
      Size = 4
    end
    object cdsMainbrother_flag: TStringField
      DisplayLabel = #20851#32852#20844#21496
      FieldName = 'brother_flag'
      ReadOnly = True
      Size = 2
    end
    object cdsMainADDRESS2_FOR_FORM: TStringField
      DisplayLabel = #20379#24212#21830#24615#36136
      FieldName = 'ADDRESS2_FOR_FORM'
      Size = 30
    end
    object cdsMainADDRESS1_FOR_FORM: TStringField
      DisplayLabel = #20379#24212#29289#26009
      FieldName = 'ADDRESS1_FOR_FORM'
      Size = 70
    end
    object cdsMainttype: TStringField
      DisplayLabel = #21512#20316#31867#22411
      FieldName = 'ttype'
      ReadOnly = True
      Size = 10
    end
    object cdsMainVMI: TStringField
      DisplayLabel = #26159#21542'VMI'#20379#24212#21830
      FieldName = 'VMI'
      ReadOnly = True
      Size = 2
    end
    object cdsMainsuppier_ent_date: TDateTimeField
      DisplayLabel = #21512#20316#26085#26399
      FieldName = 'suppier_ent_date'
    end
    object cdsMaincontact_name_1: TStringField
      DisplayLabel = #19994#21153#32852#31995#20154
      FieldName = 'contact_name_1'
    end
    object cdsMaincont_phone_1: TStringField
      DisplayLabel = #32852#31995#20154#30005#35805
      FieldName = 'cont_phone_1'
      FixedChar = True
      Size = 14
    end
    object cdsMainphone: TStringField
      DisplayLabel = #20379#24212#21830#30005#35805
      FieldName = 'phone'
    end
    object cdsMainfax: TStringField
      DisplayLabel = #20256#30495#21495#30721
      FieldName = 'fax'
    end
    object cdsMaintelex: TStringField
      DisplayLabel = #24320#25143#38134#34892
      FieldName = 'telex'
      Size = 40
    end
    object cdsMaincurr_name: TStringField
      DisplayLabel = #24065#31181
      FieldName = 'curr_name'
    end
    object cdsMaincountry_name: TStringField
      DisplayLabel = #22269#23478
      FieldName = 'country_name'
      Size = 30
    end
    object cdsMainemployee_name: TStringField
      DisplayLabel = #20462#25913#29992#25143
      FieldName = 'employee_name'
      Size = 16
    end
    object cdsMainupdate_date: TDateTimeField
      DisplayLabel = #20462#25913#26085#26399
      FieldName = 'update_date'
    end
    object cdsMainbilling_address_1: TStringField
      DisplayLabel = #35814#32454#22320#22336
      FieldName = 'billing_address_1'
      Size = 100
    end
    object cdsMaintax_id_number: TStringField
      DisplayLabel = #20184#27454#26041#24335
      FieldName = 'tax_id_number'
    end
    object cdsMainanalysis_code1: TStringField
      DisplayLabel = #31080#25454#31181#31867
      FieldName = 'analysis_code1'
    end
    object cdsMaindeveloper: TWideStringField
      DisplayLabel = #20379#24212#21830#24320#21457#20154#21592
      FieldName = 'developer'
      Size = 50
    end
    object cdsMaininvalid_explain: TWideStringField
      DisplayLabel = #20379#24212#21830#26080#25928#35828#26126
      FieldName = 'invalid_explain'
      Size = 50
    end
    object cdsMainrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object cdsMainpo_note_pad_ptr: TIntegerField
      FieldName = 'po_note_pad_ptr'
    end
    object cdsMaindebmem_note_pad_ptr: TIntegerField
      FieldName = 'debmem_note_pad_ptr'
    end
    object cdsMainrfq_note_pad_ptr: TIntegerField
      FieldName = 'rfq_note_pad_ptr'
    end
    object cdsMaincommon_pad_ptr: TIntegerField
      FieldName = 'common_pad_ptr'
    end
    object cdsMainEDI_OUT_NEW_PO: TSmallintField
      FieldName = 'EDI_OUT_NEW_PO'
    end
    object cdsMainEDI_FLAG_FOR_PO: TSmallintField
      FieldName = 'EDI_FLAG_FOR_PO'
    end
  end
  inherited pmZD: TPopupMenu
    OnPopup = pmZDPopup
  end
  inherited pmMain: TPopupMenu
    object N1: TMenuItem
      Caption = #26032#24314
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #32534#36753
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #22797#21046
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #26816#26597
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = #21024#38500
      OnClick = N5Click
    end
    object N6: TMenuItem
      Caption = #21464#26356#35760#24405
      OnClick = N6Click
    end
  end
end
