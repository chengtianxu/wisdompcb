inherited frmMain_Mod33: TfrmMain_Mod33
  Caption = #25353#37319#36141#35746#21333#25509#25910#26448#26009#20837#20179
  ClientHeight = 466
  ClientWidth = 1085
  ExplicitWidth = 1101
  ExplicitHeight = 505
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 1085
    Height = 466
    ExplicitWidth = 1085
    ExplicitHeight = 466
    inherited pnlDisplayMain: TPanel
      Width = 1085
      Height = 466
      ExplicitWidth = 1085
      ExplicitHeight = 466
      inherited pnlChildMain: TPanel
        Width = 1083
        Height = 464
        ExplicitWidth = 1083
        ExplicitHeight = 464
        inherited pnlEhMainDisplay: TPanel
          Width = 1081
          Height = 433
          ExplicitWidth = 1081
          ExplicitHeight = 433
          object Splitter1: TSplitter [0]
            Left = 1
            Top = 255
            Width = 1079
            Height = 3
            Cursor = crVSplit
            Align = alBottom
            ExplicitTop = 241
            ExplicitWidth = 150
          end
          inherited ehMain: TDBGridEh
            Width = 1079
            Height = 254
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'GRN_NUMBER'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #20837#20179#21333#21495
                Width = 95
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'DELIVER_NUMBER'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #36865#36135#21333#21495
                Width = 85
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PO_NUMBER'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #37319#36141#35746#21333#21495
                Width = 110
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ABBR_NAME'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #20379#24212#21830#31616#31216
                Width = 100
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ship_DATE'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #36865#36135#26085#26399
                Width = 90
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'EMPLOYEE_NAME'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #25910#36135#21592#24037
                Width = 65
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'v_status'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #29366#24577
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'v_type'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #20837#20179#31867#22411
                Width = 80
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PRINTED'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #21015#21360
                Width = 40
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'DEPT_NAME'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #35831#36141#37096#38376
                Width = 120
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'FacNm'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #24037#21378
                Width = 80
              end>
          end
          object Panel1: TPanel
            Left = 1
            Top = 258
            Width = 1079
            Height = 144
            Align = alBottom
            TabOrder = 1
            object DBGridEh1: TDBGridEh
              Left = 1
              Top = 1
              Width = 1077
              Height = 142
              Align = alTop
              DataSource = dsDetail2
              DynProps = <>
              TabOrder = 0
              Columns = <
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'goods_name'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #29289#21697#21517#31216
                  Width = 140
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'goods_guige'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #35268#26684
                  Width = 180
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'goods_type'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #29289#21697#31867#21035
                  Width = 80
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'UNIT_NAME'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #21333#20301
                  Width = 65
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'QUAN_RECD'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #25509#25910#25968#37327
                  Width = 70
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'LOCATION'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #23384#36135#20301#32622
                  Width = 90
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'DEPT_NAME'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #35831#36141#37096#38376
                  Width = 80
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'EMPLOYEE_NAME'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #35831#36141#20154#21592
                  Width = 65
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'REF_NUMBER'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #22791#27880
                  Width = 120
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
            object DBGridEh2: TDBGridEh
              Left = 1
              Top = 143
              Width = 1077
              Height = 0
              Align = alClient
              DataSource = dsDetail1
              DynProps = <>
              PopupMenu = PopupMenu2
              TabOrder = 1
              Columns = <
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'INV_PART_NUMBER'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #26448#26009#32534#30721
                  Width = 110
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'INV_NAME'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #26448#26009#21517#31216
                  Width = 120
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'INV_DESCRIPTION'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #26448#26009#35268#26684
                  Width = 150
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'QUANTITY'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #25509#25910#25968#37327
                  Width = 55
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'UNIT_NAME'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #21333#20301
                  Width = 40
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'LOCATION'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #20179#24211#20301#32622
                  Width = 65
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'EXPIRE_DATE'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #26377#25928#26399
                  Width = 90
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'BARCODE_ID'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #22791#27880
                  Width = 120
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'spec_place'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #35814#32454#20301#32622
                  Width = 60
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'DEPT_NAME'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #35831#36141#37096#38376
                  Width = 80
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'EMPLOYEE_NAME'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #35831#36141#20154#21592
                  Width = 60
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
          end
          object Panel2: TPanel
            Left = 1
            Top = 402
            Width = 1079
            Height = 30
            Align = alBottom
            TabOrder = 2
            DesignSize = (
              1079
              30)
            object Label3: TLabel
              Left = 424
              Top = 8
              Width = 28
              Height = 13
              Caption = #24037#21378
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label2: TLabel
              Left = 610
              Top = 7
              Width = 144
              Height = 16
              Anchors = [akLeft, akTop, akBottom]
              Caption = #26377#36864#22238#30340#26448#26009#20837#24211#21333
              Font.Charset = GB2312_CHARSET
              Font.Color = clRed
              Font.Height = -16
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
              Visible = False
            end
            object CheckBox1: TCheckBox
              Left = 11
              Top = 7
              Width = 64
              Height = 17
              Caption = #26410#25552#20132
              Checked = True
              State = cbChecked
              TabOrder = 0
              OnClick = CheckBox1Click
            end
            object CheckBox2: TCheckBox
              Left = 80
              Top = 7
              Width = 64
              Height = 17
              Caption = #24453#23457#26680
              Checked = True
              State = cbChecked
              TabOrder = 1
              OnClick = CheckBox1Click
            end
            object CheckBox3: TCheckBox
              Left = 149
              Top = 7
              Width = 64
              Height = 17
              Caption = #24050#23457#26680
              TabOrder = 2
              OnClick = CheckBox1Click
            end
            object CheckBox4: TCheckBox
              Left = 218
              Top = 7
              Width = 64
              Height = 17
              Caption = #24050#35760#24080
              TabOrder = 3
              OnClick = CheckBox1Click
            end
            object CheckBox5: TCheckBox
              Left = 288
              Top = 7
              Width = 64
              Height = 17
              Caption = #24050#20184#27454
              TabOrder = 4
              OnClick = CheckBox1Click
            end
            object CheckBox6: TCheckBox
              Left = 354
              Top = 6
              Width = 64
              Height = 17
              Caption = #34987#36864#22238
              TabOrder = 5
              OnClick = CheckBox1Click
            end
            object ComboBox1: TComboBox
              Left = 454
              Top = 4
              Width = 119
              Height = 21
              Style = csDropDownList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = [fsBold]
              ItemIndex = 0
              ParentFont = False
              TabOrder = 6
              Text = #25152#26377
              OnChange = CheckBox1Click
              Items.Strings = (
                #25152#26377)
            end
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 1081
          ExplicitWidth = 1081
          inherited btnDY: TBitBtn
            Left = 390
            Hint = #26631#35782#23436#25104
            Caption = #32467#26463#25910#36135
            Glyph.Data = {00000000}
            Visible = True
            OnClick = btnDYClick
            ExplicitLeft = 390
          end
          inherited btnAuthDispatch: TBitBtn
            Left = 455
            Hint = ''
            Glyph.Data = {00000000}
            Visible = False
            ExplicitLeft = 455
          end
          object BitBtn1: TBitBtn
            Left = 325
            Top = 0
            Width = 65
            Height = 29
            Hint = #29992#25143#33258#23450#20041#25253#34920#26684#24335
            Align = alLeft
            Caption = #23450#20041
            ParentShowHint = False
            ShowHint = True
            TabOrder = 8
            OnClick = BitBtn1Click
          end
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    CommandText = 
      'SELECT dbo.Data0456.RKEY, dbo.Data0456.GRN_NUMBER, '#13#10'      dbo.D' +
      'ata0456.DELIVER_NUMBER, dbo.Data0023.CODE, '#13#10'      dbo.Data0023.' +
      'SUPPLIER_NAME, dbo.Data0023.ABBR_NAME, '#13#10'      dbo.Data0456.ship' +
      '_DATE, dbo.Data0456.STATUS, dbo.Data0456.TTYPE, '#13#10'      dbo.Data' +
      '0456.REF_NUMBER, dbo.Data0070.PO_NUMBER, dbo.Data0456.PO_PTR, '#13#10 +
      '      dbo.Data0005.EMPLOYEE_NAME, dbo.Data0005.EMPL_CODE, '#13#10'    ' +
      '  dbo.Data0015.WAREHOUSE_CODE, dbo.Data0015.WAREHOUSE_NAME, '#13#10'  ' +
      '    dbo.Data0456.ship_BY, dbo.Data0001.CURR_CODE, dbo.Data0001.C' +
      'URR_NAME, '#13#10'      dbo.Data0456.warehouse_ptr, dbo.Data0034.DEPT_' +
      'NAME, dbo.Data0456.SUPP_PTR,dbo.Data0456.create_date, '#13#10'      db' +
      'o.Data0456.PRINTED, dbo.Data0456.currency_ptr, dbo.Data0456.exch' +
      '_rate,data0724.gon_number,data0724.rkey as rkey724,'#13#10'case data04' +
      '56.ttype'#13#10'when 1 then '#39#32534#30721#20837#24211#39' when  2 then '#39#26434#39033#20837#24211#39#13#10'when 3 then '#39#30452 +
      #25509#20837#24211#39' when  5 then '#39'VMI'#20837#24211#39'  when 6 then '#39#26434#39033#30452#20837#39' end as v_type,data' +
      '0015.abbr_name FacNm,Data0070.PO_TYPE,'#13#10'case Data0456.STATUS whe' +
      'n 1 then '#39#26410#25552#20132#39' when 2 then '#39#24453#23457#26680#39' when 3 then '#39#24050#23457#26680#39' when 4 then '#39 +
      #24050#35760#24080#39' when 5 then '#39#24050#20184#27454#39' when 6 then '#39#34987#36864#22238#39' end as v_status'#13#10'FROM d' +
      'bo.Data0456 INNER JOIN'#13#10'      dbo.Data0023 ON dbo.Data0456.SUPP_' +
      'PTR = dbo.Data0023.RKEY INNER JOIN'#13#10'      dbo.Data0005 ON dbo.Da' +
      'ta0456.CREATE_BY = dbo.Data0005.RKEY INNER JOIN'#13#10'      dbo.Data0' +
      '015 ON dbo.Data0456.warehouse_ptr = dbo.Data0015.RKEY INNER JOIN' +
      #13#10'      dbo.Data0001 ON '#13#10'      dbo.Data0456.currency_ptr = dbo.' +
      'Data0001.RKEY LEFT OUTER JOIN'#13#10'      dbo.Data0070 ON dbo.Data045' +
      '6.PO_PTR = dbo.Data0070.RKEY LEFT OUTER JOIN'#13#10'      dbo.Data0034' +
      ' ON dbo.Data0070.PO_REV_NO = dbo.Data0034.DEPT_CODE left outer j' +
      'oin'#13#10'      dbo.data0724  ON  dbo.data0456.VMIOUT_PTR=dbo.data072' +
      '4.rkey'#13#10'where data0456.ttype<>4'
    AfterScroll = cdsMainAfterScroll
  end
  inherited pmMain: TPopupMenu
    OnPopup = pmMainPopup
    Left = 248
    Top = 152
    object N1: TMenuItem
      Caption = #26032#24314#25910#36135
      object PO1: TMenuItem
        Caption = #25353'PO'#25910#36135
        OnClick = PO1Click
      end
      object N2: TMenuItem
        Caption = #30452#25509#20837#20179#29983#20135#29289#26009
        OnClick = N2Click
      end
      object N3: TMenuItem
        Caption = #30452#25509#20837#20179#26434#39033#29289#26009
        OnClick = N3Click
      end
      object VMI1: TMenuItem
        Caption = 'VMI'#20837#20179
        OnClick = VMI1Click
      end
    end
    object N4: TMenuItem
      Caption = #32534#36753
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = #26816#26597
      OnClick = N5Click
    end
    object N6: TMenuItem
      Caption = #25552#20132#23457#26680
      OnClick = N6Click
    end
    object N7: TMenuItem
      Caption = #21462#28040#25552#20132
      OnClick = N7Click
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object N9: TMenuItem
      Caption = #21333#29420#21015#21360
      OnClick = N9Click
    end
    object N10: TMenuItem
      Caption = #36830#32493#21015#21360
      OnClick = N10Click
    end
    object N11: TMenuItem
      Caption = #21024#38500
      OnClick = N11Click
    end
  end
  object cdsDetail1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 352
  end
  object dsDetail1: TDataSource
    DataSet = cdsDetail1
    Left = 280
    Top = 352
  end
  object cdsDetail2: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 408
    Top = 352
  end
  object dsDetail2: TDataSource
    DataSet = cdsDetail2
    Left = 488
    Top = 352
  end
  object cds456: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 520
    Top = 200
  end
  object cds134: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 576
    Top = 200
  end
  object cds70: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 632
    Top = 200
  end
  object cds391: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 688
    Top = 200
  end
  object cds71: TClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <>
    Left = 744
    Top = 200
  end
  object cds17: TClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <>
    Left = 800
    Top = 200
  end
  object cds72: TClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <>
    Left = 856
    Top = 200
  end
  object cds724: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 912
    Top = 200
  end
  object PopupMenu2: TPopupMenu
    OnPopup = PopupMenu2Popup
    Left = 592
    Top = 333
    object MenuItem1: TMenuItem
      Caption = #20462#25913#22791#27880
      OnClick = MenuItem1Click
    end
    object N15: TMenuItem
      Caption = #25171#21360#29289#26009#26631#35782#21345
      OnClick = N15Click
    end
  end
  object cds28: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 584
    Top = 120
  end
  object cds70_Close: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 976
    Top = 200
  end
  object Timer1: TTimer
    Interval = 30000
    OnTimer = Timer1Timer
    Left = 416
    Top = 88
  end
  object PopupMenu1: TPopupMenu
    Left = 336
    Top = 88
    object N12: TMenuItem
      Caption = #35774#35745#32534#30721#29289#26009#20837#24211#21333#25253#34920
      OnClick = N12Click
    end
    object N13: TMenuItem
      Caption = #35774#35745#26434#39033#29289#26009#20837#24211#21333#25253#34920
      OnClick = N13Click
    end
    object N14: TMenuItem
      Caption = #23384#20179#20301#32622#23450#20041
      OnClick = N14Click
    end
    object N16: TMenuItem
      Caption = #35774#35745#29289#26009#26631#35782#21345#25253#34920
      OnClick = N16Click
    end
  end
  object cds134_2: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 792
    Top = 96
  end
  object cds207: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1032
    Top = 200
  end
end
