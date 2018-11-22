inherited frmMain_Mod280: TfrmMain_Mod280
  Caption = #24320#35831#36141#21333
  ClientHeight = 557
  ClientWidth = 1092
  Position = poDesigned
  ExplicitWidth = 1100
  ExplicitHeight = 584
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 1092
    Height = 557
    ExplicitWidth = 1092
    ExplicitHeight = 557
    object Splitter1: TSplitter [0]
      Left = 0
      Top = 235
      Width = 1092
      Height = 3
      Cursor = crVSplit
      Align = alBottom
      ExplicitLeft = 1
      ExplicitTop = 244
      ExplicitWidth = 995
    end
    inherited pnlDisplayMain: TPanel
      Width = 1092
      Height = 235
      ExplicitWidth = 1092
      ExplicitHeight = 235
      inherited pnlChildMain: TPanel
        Width = 1090
        Height = 233
        ExplicitWidth = 1090
        ExplicitHeight = 233
        inherited pnlEhMainDisplay: TPanel
          Top = 33
          Width = 1088
          Height = 199
          ExplicitTop = 33
          ExplicitWidth = 1088
          ExplicitHeight = 199
          inherited ehMain: TDBGridEh
            Width = 1086
            Height = 197
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
            OnDblClick = ehMainDblClick
            OnDrawColumnCell = ehMainDrawColumnCell
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'po_req_number'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #35831#36141#21333#21495
                Width = 107
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'req_date'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #35831#36141#26085#26399
                Width = 71
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'department_name'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #35831#36141#37096#38376
                Width = 58
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'employee_name'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #35831#36141#20154#21592
                Width = 68
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'v_flag'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #31867#21035
                Width = 59
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'v_status'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #29366#24577
                Width = 52
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'abbr_name'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #24037#21378
                Width = 81
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ent_date'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #25552#20132#23457#25209#26085#26399
                Width = 94
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'edited_date'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #26368#21518#23457#25209#26085#26399
                Width = 94
              end>
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 1088
          Height = 32
          ExplicitWidth = 1088
          ExplicitHeight = 32
          inherited lblFilter: TLabel
            Left = 581
            Top = 10
            Caption = #35831#36141#21333#21495
            ExplicitLeft = 581
            ExplicitTop = 10
          end
          inherited btnExit: TBitBtn
            Height = 32
            ExplicitHeight = 32
          end
          inherited btnRefresh: TBitBtn
            Height = 32
            ExplicitHeight = 32
          end
          inherited btnExportToExcel: TBitBtn
            Height = 32
            ExplicitHeight = 32
          end
          inherited btnQry: TBitBtn
            Height = 32
            ExplicitHeight = 32
          end
          inherited btnZD: TBitBtn
            Left = 342
            Height = 32
            ExplicitLeft = 342
            ExplicitHeight = 32
          end
          inherited edtFliter: TEdit
            Left = 633
            Top = 6
            ExplicitLeft = 633
            ExplicitTop = 6
          end
          inherited btnDY: TBitBtn
            Left = 407
            Height = 32
            ExplicitLeft = 407
            ExplicitHeight = 32
          end
          inherited btnAuthDispatch: TBitBtn
            Left = 472
            Height = 32
            ExplicitLeft = 472
            ExplicitHeight = 32
          end
          object rgStatus: TRadioGroup
            Left = 903
            Top = 0
            Width = 185
            Height = 32
            Align = alRight
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              #24453#23457
              #20840#37096)
            TabOrder = 8
            Visible = False
            OnClick = rgStatusClick
          end
          object btnQryZt: TBitBtn
            Left = 260
            Top = 0
            Width = 82
            Height = 32
            Hint = #22312#36884#29289#26009#26597#35810
            Align = alLeft
            Caption = #22312#36884#26597#35810
            Glyph.Data = {
              C6050000424DC605000000000000360400002800000014000000140000000100
              08000000000090010000C40E0000C40E0000000100000000000000000000E8E0
              0000D0A000006060600038383800F0700000B8B8C00020202000A8B0B000F0F0
              F800B8400000C0600800A0A0A000E0E0E800D8D8E000B8100000D0D8D800C0A0
              8800B8300000F8F8080098989800B0504000B0908800B8706000E0A86000E0D8
              C000F070380088888800F0D8B0005858580008101000E0D0B000B8504000E8C8
              A000F0B85000E8D8A800C8C8C800D8982000D8C0B00050505000C8803800F0C8
              8800F8500800D8A040007078780008080800E8C0880028283000F8980000E8F0
              F00040404000B0B8B800B8A0A000C0682800E0A87800F0800000C8D0D000C898
              8000E0A88000D8904800E0E0E000F0A0000070707000E0783000B0888800E8D0
              6800C8B8A800C8700800D8885000B850180028282000B8887800F0F0D8001818
              1800F070180090909000D8C05800E8B09800F8F0E000F8F0F00048484800B8C0
              C800F0C06000F8F8F800F8805800F8F0C80080808000B8906000B0B0B000D090
              5000F8600000D8D0C800E0A05800B8585800B8B00000B8481000D0D0B000D078
              3000C0702000F0A86800C0602000E8E8E800A8A8A800F0C0B800B0201000F0A8
              4000E0B89000B8B8B80068686800F0F0E800F0982000D8D0A800E8C88000F0E0
              C000B8380800F0800800D8E0E000C0C0C000F0680800B0B0B800C0601800E0B8
              7800F0981000C8781800C0C8C80010101800C8A09000E0B8600030303000F0F0
              F000C0B8B80028282800E8E0E000F0F8F8003838400078787800F0D8B800D8C8
              B800F0C89000E0E8E800B8601000D0883800F8680800D8D0B800E8D08800C8C8
              D000D0D0D000B8B0B00058586000D8D8D8002820200010101000E8E8F000F8F8
              F000D8D0D000B8786000B8480000F0780000F0880000E0B08000B8C0C000B818
              0000C0A88800B8300800B0504800F0E0B000E8D0B000F0D08800F8501000F880
              0800ECFD7F0002000000000000001300E8000100000001000A0000884000F877
              78004B1B00000100000000998400E6775400F71200000101010001D8F8001200
              450090FB7700801FF80077FFFF00FFFF6000F8120000AD84E6007760F8001200
              D80084E677000000000000FFFF0000003800A8F8000038A8F800001800000000
              00000000000044F8120000400000000000000000000028F81200000000000000
              00000000000000000000000C000000000200000000000101120000872B00F877
              0000ECFD7F00000000000002000000006C00001A0200804B1B00007FFF00FFFF
              000000000000804B1B00000500000000870031E6770084F8120000218600E677
              9800F81200006713000010FFFF00000020000100000038A8F800000000000000
              7000F8120000ACF8120000D8F8001200100030001000F8400000105F5400E677
              200001000000D0F8120000D8F80012000800000000000E0000005331B2861D86
              1D861D861D861DF81DC57431F62C9824801414572C572C6C2C6C6C1D6C6C77B2
              6CB2B26C2CDF1232DF6C6CF86CF86C861D1B006C1D0E94530E8A6E8A24240E24
              24240E6F6CB294800E531D31550E4C245524242424515551B26C322453318655
              248A0E557780000086576C002CB20E5398536C31305A55F8CC1424511486B2F3
              1D802453535386534C229457536F066F06242CB2806C065353551D5353511D53
              638C12152477248680F8245353318653531D7755358D35121B57066FF66C2453
              98536C535380240EAA6F631557123551B26C24535353945353B2065398554D35
              776F0624C56C065353551D53536C6F53535355246F152451806C245353319453
              532480535353246F7E8D531D946C245398536C53535314F85353AA2453531480
              576C245353532C5353555314C557776F14002C246C5706535355575353315353
              551B6CF857146E146C2C24535331866C775353555353535353225A35C5B20653
              9853570E57535353535353535353AA08143153315353986C866C2C6C6C1D941D
              861D8680775398535355}
            ParentShowHint = False
            ShowHint = True
            TabOrder = 9
            OnClick = btnQryZtClick
          end
        end
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 238
      Width = 1092
      Height = 275
      Align = alBottom
      Caption = 'Panel1'
      TabOrder = 2
      object dbg204: TDBGridEh
        Left = 1
        Top = 1
        Width = 1090
        Height = 273
        Align = alClient
        DataSource = dsDetail
        DynProps = <>
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 1
        Columns = <
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'DESCRIPTION_1'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #29289#21697#21517#31216
            Width = 104
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'GUI_GE'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #35268#26684
            Width = 125
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'DESCRIPTION_2'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #29289#21697#31867#21035
            Width = 55
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'UNIT_NAME'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #21333#20301#21517#31216
            Width = 56
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'QUANTITY_REQUIRED'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #25968#37327
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'tax_price'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #20215#26684
            Visible = False
            Width = 54
          end
          item
            DisplayFormat = 'yyyy-mm-dd'
            DynProps = <>
            EditButtons = <>
            FieldName = 'REQ_DATE'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #38656#27714#26085#26399
            Width = 70
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'reason'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #35831#36141#21407#22240
            Width = 231
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'reply_date'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #22238#22797#20132#26399
            Width = 54
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'code'
            Footers = <>
            Title.Caption = #20379#24212#21830#20195#30721
            Visible = False
            Width = 70
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'IF_urgencys'
            Footers = <>
            Title.Caption = #26159#21542#32039#24613#29289#26009
            Width = 80
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'req_quantity'
            Footers = <>
            Title.Caption = #35831#36141#26102#38656#27714#25968#37327
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object dbg69: TDBGridEh
        Left = 1
        Top = 1
        Width = 1090
        Height = 273
        Align = alClient
        DataSource = dsDetail
        DynProps = <>
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        ReadOnly = True
        TabOrder = 0
        OnDrawColumnCell = dbg69DrawColumnCell
        Columns = <
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'inv_part_number'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #26448#26009#32534#30721
            Width = 140
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'inv_name'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #26448#26009#21517#31216
            Width = 90
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
            FieldName = 'unit_name'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #21333#20301#21517#31216
            Width = 53
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'QUANTITY'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #25968#37327
            Width = 59
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'tax_price'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #20215#26684
            Visible = False
            Width = 54
          end
          item
            DisplayFormat = 'yyyy-mm-dd'
            DynProps = <>
            EditButtons = <>
            FieldName = 'REQ_DATE'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #38656#27714#26085#26399
            Width = 70
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'extra_req'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #29305#21035#35201#27714
            Width = 61
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'reason'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #35831#36141#21407#22240
            Width = 97
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'code'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #20379#24212#21830#20195#30721
            Visible = False
            Width = 70
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'reply_date'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #22238#22797#20132#26399
            Width = 67
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'IF_urgencys'
            Footers = <>
            Title.Caption = #26159#21542#32039#24613#29289#26009
            Width = 80
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'req_quantity'
            Footers = <>
            Title.Caption = #35831#36141#26102#38656#27714#25968#37327
            Width = 95
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 513
      Width = 1092
      Height = 44
      Align = alBottom
      TabOrder = 1
      object GroupBox1: TGroupBox
        Left = 1
        Top = 1
        Width = 1090
        Height = 42
        Align = alClient
        Caption = #29366#24577
        TabOrder = 0
        object Label2: TLabel
          Left = 626
          Top = 16
          Width = 112
          Height = 16
          Caption = #26377#36864#22238#30340#35831#36141#21333
          Font.Charset = GB2312_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object lblFac: TLabel
          Left = 764
          Top = 19
          Width = 28
          Height = 13
          Caption = #24037#21378
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object cbx2: TCheckBox
          Tag = 1
          Left = 78
          Top = 16
          Width = 60
          Height = 17
          Caption = #24453#23457#25209
          Checked = True
          State = cbChecked
          TabOrder = 2
          OnClick = cbx1Click
        end
        object cbx4: TCheckBox
          Tag = 2
          Left = 219
          Top = 16
          Width = 62
          Height = 17
          Caption = #24453#37319#36141
          TabOrder = 4
          OnClick = cbx1Click
        end
        object cbx3: TCheckBox
          Tag = 3
          Left = 149
          Top = 16
          Width = 60
          Height = 17
          Caption = #24050#25209#20934
          TabOrder = 3
          OnClick = cbx1Click
        end
        object cbx5: TCheckBox
          Tag = 4
          Left = 291
          Top = 16
          Width = 63
          Height = 17
          Caption = #34987#36864#22238
          TabOrder = 5
          OnClick = cbx1Click
        end
        object cbx6: TCheckBox
          Tag = 5
          Left = 360
          Top = 16
          Width = 113
          Height = 17
          Caption = #35831#36141#23450#21333#24050#25764#28040
          TabOrder = 6
          OnClick = cbx1Click
        end
        object cbx7: TCheckBox
          Tag = 6
          Left = 474
          Top = 15
          Width = 121
          Height = 18
          Caption = #35831#36141#23450#21333#24050#22788#29702
          TabOrder = 0
          OnClick = cbx1Click
        end
        object cbx1: TCheckBox
          Tag = 7
          Left = 11
          Top = 16
          Width = 61
          Height = 17
          Caption = #26410#25552#20132
          Checked = True
          State = cbChecked
          TabOrder = 1
          OnClick = cbx1Click
        end
        object cmbFac: TComboBox
          Left = 794
          Top = 14
          Width = 108
          Height = 21
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ItemIndex = 0
          ParentFont = False
          TabOrder = 7
          Text = #25152#26377
          Visible = False
          OnChange = cmbFacChange
          Items.Strings = (
            #25152#26377)
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    CommandText = 
      'SELECT data0068.*,'#13#10'       data0005.empl_code,data0005.employee_' +
      'name,'#13#10'       data0015.abbr_name,data0015.warehouse_code,'#13#10'     ' +
      '  data0094.code code94,data0094.PURCHASE_APPROV_DESC ,'#13#10'       d' +
      'ata0362.code code362,data0362.DESCRIPTION,'#13#10'       CASE data0068' +
      '.FLAG WHEN '#39'S'#39' THEN  '#39#26631#20934#39' WHEN '#39'M'#39' THEN  '#39#26434#39033#39'  END v_flag,'#13#10'    ' +
      '   CASE data0068.status WHEN 1 THEN  '#39#24453#23457#25209#39' WHEN 2 THEN  '#39#24453#37319#36141#39#13#10' ' +
      '      WHEN 3 THEN  '#39#24050#25209#20934#39' WHEN 4 THEN  '#39#34987#36864#22238#39' WHEN 5 THEN  '#39#35831#36141#21333#24050#25764#28040 +
      #39#13#10'       WHEN 6 THEN  '#39#35831#36141#21333#24050#22788#29702#39' WHEN 7 THEN  '#39#26410#25552#20132#39' END v_status'#13 +
      #10'       from data0068 '#13#10'       inner join  data0005 on data0068.' +
      'req_by=data0005.rkey '#13#10'       inner join data0015 on data0068.WH' +
      'SE_PTR=data0015.rkey'#13#10'       inner join data0094 on data0068.aut' +
      'h_type=data0094.rkey '#13#10'       inner join data0362 on data0068.bu' +
      'dget_ptr=data0362.rkey'#13#10' where (1=1)'
    AfterScroll = cdsMainAfterScroll
    Left = 248
    Top = 176
  end
  inherited dsMain: TDataSource
    Left = 296
    Top = 168
  end
  inherited xpmnfst1: TXPManifest
    Left = 664
  end
  inherited pmMain: TPopupMenu
    OnPopup = pmMainPopup
    Left = 256
    Top = 96
    object mniNew: TMenuItem
      Caption = #26032#24314
      object mniNewSC: TMenuItem
        Caption = #29983#20135#29289#26009
        OnClick = mniNewSCClick
      end
      object mniNewZY: TMenuItem
        Caption = #26434#39033#29289#26009
        OnClick = mniNewZYClick
      end
    end
    object mniEdit: TMenuItem
      Caption = #32534#36753
      OnClick = mniEditClick
    end
    object mniDele: TMenuItem
      Caption = #21024#38500
      OnClick = mniDeleClick
    end
    object mniView: TMenuItem
      Caption = #26816#26597
      OnClick = mniViewClick
    end
    object mniCopy: TMenuItem
      Caption = #22797#21046
      OnClick = mniCopyClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object mniSubmit: TMenuItem
      Caption = #25552#20132#23457#25209
      OnClick = mniSubmitClick
    end
    object mniAppView: TMenuItem
      Caption = #23457#25209#20449#24687
      OnClick = mniAppViewClick
    end
    object mniRecView: TMenuItem
      Caption = #25910#36135#20449#24687
      OnClick = mniRecViewClick
    end
    object mniprint: TMenuItem
      Caption = #25171#21360#35831#36141#21333
      Visible = False
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object mniExpPur: TMenuItem
      Caption = #23548#20986#35831#36141#39033#30446
      OnClick = mniExpPurClick
    end
    object mniReason: TMenuItem
      Caption = #36864#22238#29702#30001
      OnClick = mniReasonClick
    end
  end
  inherited cdsMainWhereInit: TClientDataSet
    Left = 360
    Top = 48
  end
  object cdsDetail: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 352
  end
  object dsDetail: TDataSource
    DataSet = cdsDetail
    Left = 280
    Top = 352
  end
  object cds68: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 504
    Top = 80
  end
  object pmApprove: TPopupMenu
    OnPopup = pmApprovePopup
    Left = 368
    Top = 140
    object mniApprove: TMenuItem
      Caption = #25209#20934
      OnClick = mniApproveClick
    end
    object mniCancel: TMenuItem
      Tag = 1
      Caption = #21462#28040#23457#25209
      OnClick = mniCancelClick
    end
    object mniReturn: TMenuItem
      Tag = 2
      Caption = #36864#22238#35831#36141#32773
      OnClick = mniReturnClick
    end
    object N8: TMenuItem
      Tag = 4
      Caption = '-'
    end
    object mniExamView: TMenuItem
      Tag = 3
      Caption = #26816#26597'/'#23457#25209
      OnClick = mniExamViewClick
    end
    object mniAuthInfo: TMenuItem
      Tag = 4
      Caption = #23457#25209#20449#24687
      OnClick = mniAuthInfoClick
    end
  end
  object pmDelApp: TPopupMenu
    OnPopup = pmDelAppPopup
    Left = 496
    Top = 331
    object mniHisPrice: TMenuItem
      Caption = #26368#36817#21382#21490#20215#26684
      OnClick = mniHisPriceClick
    end
    object mniSuppliers: TMenuItem
      Caption = #20379#24212#21830#20449#24687
      OnClick = mniSuppliersClick
    end
  end
  object pm69: TPopupMenu
    Left = 628
    Top = 320
    object mniView69: TMenuItem
      Caption = #26816#26597
      OnClick = mniView69Click
    end
  end
  object pm204: TPopupMenu
    Left = 744
    Top = 320
    object mniView204: TMenuItem
      Caption = #26816#26597
      OnClick = mniView204Click
    end
  end
  object pmAward: TPopupMenu
    OnPopup = pmAwardPopup
    Left = 444
    Top = 160
    object mniAddAwd: TMenuItem
      Caption = #26032#24314
      object mniAwdSc: TMenuItem
        Caption = #29983#20135#29289#26009
        OnClick = mniAwdScClick
      end
      object mniAwdZx: TMenuItem
        Caption = #38750#29983#20135#29289#26009
        OnClick = mniAwdZxClick
      end
    end
    object mniAwdEdit: TMenuItem
      Caption = #32534#36753
      OnClick = mniAwdEditClick
    end
    object mniAwdView: TMenuItem
      Caption = #26816#26597
      OnClick = mniAwdViewClick
    end
    object mniAwdSub: TMenuItem
      Caption = #25552#20132#37319#36141
      OnClick = mniAwdSubClick
    end
    object mniAwdRej: TMenuItem
      Caption = #36864#22238#35831#36141#32773
      OnClick = mniAwdRejClick
    end
    object N12: TMenuItem
      Caption = '-'
    end
    object mniAwdAuth: TMenuItem
      Caption = #23457#25209#20449#24687
      OnClick = mniAppViewClick
    end
    object mniAwdSh: TMenuItem
      Caption = #25910#36135#20449#24687
      OnClick = mniRecViewClick
    end
    object mniAwdExp: TMenuItem
      Caption = #23548#20986#35831#36141#39033#30446
      OnClick = mniExpPurClick
    end
    object mniAwdCopy: TMenuItem
      Caption = #22797#21046
      OnClick = mniAwdCopyClick
    end
  end
end
