inherited frmZazhiruku_Mod33: TfrmZazhiruku_Mod33
  Caption = #26434#39033#29289#26009#30452#25509#20837#20179
  ClientHeight = 436
  ClientWidth = 949
  ExplicitWidth = 957
  ExplicitHeight = 463
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 949
    Height = 436
    ExplicitWidth = 949
    ExplicitHeight = 436
    inherited pnl1: TPanel
      Width = 947
      ExplicitWidth = 947
      inherited btnSave: TBitBtn
        OnClick = btnSaveClick
      end
      inherited btnClose: TBitBtn
        OnClick = btnCloseClick
      end
    end
    inherited pnl2: TPanel
      Width = 947
      Height = 401
      ExplicitWidth = 947
      ExplicitHeight = 401
      object Panel1: TPanel
        Left = 1
        Top = 1
        Width = 945
        Height = 151
        Align = alTop
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 12
          Width = 52
          Height = 13
          Caption = #20837#24211#21333#21495
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label12: TLabel
          Left = 34
          Top = 39
          Width = 26
          Height = 13
          Caption = #24037#21378
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label9: TLabel
          Left = 21
          Top = 65
          Width = 39
          Height = 13
          Caption = #20379#24212#21830
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label11: TLabel
          Left = 34
          Top = 94
          Width = 26
          Height = 13
          Caption = #36135#24065
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label14: TLabel
          Left = 34
          Top = 122
          Width = 26
          Height = 13
          Caption = #27719#29575
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 450
          Top = 94
          Width = 24
          Height = 13
          Caption = #22791#27880
        end
        object Label13: TLabel
          Left = 390
          Top = 65
          Width = 84
          Height = 13
          Caption = #20379#24212#21830#36865#36135#21333#21495
        end
        object Label16: TLabel
          Left = 426
          Top = 39
          Width = 48
          Height = 13
          Caption = #36865#36135#20154#21592
        end
        object Label3: TLabel
          Left = 422
          Top = 12
          Width = 52
          Height = 13
          Caption = #36865#36135#26085#26399
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object redt1: TRKeyRzBtnEdit
          Left = 63
          Top = 7
          Width = 148
          Height = 21
          Text = ''
          TabOrder = 0
          ButtonKind = bkFind
          ButtonVisible = False
          DataSource = ds456
          DataSourceField = 'GRN_NUMBER'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object redt2: TRKeyRzBtnEdit
          Left = 63
          Top = 34
          Width = 98
          Height = 21
          Text = ''
          TabOrder = 1
          ButtonKind = bkFind
          AltBtnWidth = 15
          ButtonWidth = 15
          DataSource = ds456
          DataSourceField = 'warehouse_ptr'
          DispalyTableName = 'data0015'
          DisplaytextField = 'WAREHOUSE_CODE'
          DisplayRetKeyField = 'Rkey'
          DisplayNoteField = 'WAREHOUSE_Name'
          DisplayPickID = '0'
          DisplayModID = 33
          ForceOnFocus = True
        end
        object redt3: TRKeyRzBtnEdit
          Left = 63
          Top = 62
          Width = 98
          Height = 21
          Text = ''
          TabOrder = 2
          ButtonKind = bkFind
          AltBtnWidth = 15
          ButtonWidth = 15
          OnButtonClick = redt3ButtonClick
          DataSource = ds456
          DataSourceField = 'SUPP_PTR'
          DispalyTableName = 'data0023'
          DisplaytextField = 'CODE'
          DisplayRetKeyField = 'Rkey'
          DisplayNoteField = 'ABBR_NAME'
          DisplayPickID = '1'
          DisplayModID = 33
          ForceOnFocus = True
        end
        object redt4: TRKeyRzBtnEdit
          Left = 63
          Top = 90
          Width = 98
          Height = 21
          Text = ''
          TabOrder = 3
          ButtonKind = bkFind
          AltBtnWidth = 15
          ButtonWidth = 15
          OnButtonClick = redt4ButtonClick
          DataSource = ds456
          DataSourceField = 'currency_ptr'
          DispalyTableName = 'data0001'
          DisplaytextField = 'CURR_CODE'
          DisplayRetKeyField = 'Rkey'
          DisplayNoteField = 'CURR_NAME'
          DisplayPickID = '2'
          DisplayModID = 33
          ForceOnFocus = True
        end
        object redt5: TRKeyRzBtnEdit
          Left = 477
          Top = 91
          Width = 332
          Height = 21
          Text = ''
          TabOrder = 4
          ButtonKind = bkFind
          ButtonVisible = False
          DataSource = ds456
          DataSourceField = 'REF_NUMBER'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object redt6: TRKeyRzBtnEdit
          Left = 477
          Top = 35
          Width = 148
          Height = 21
          Text = ''
          TabOrder = 5
          ButtonKind = bkFind
          ButtonVisible = False
          DataSource = ds456
          DataSourceField = 'ship_BY'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object redt7: TRKeyRzBtnEdit
          Left = 477
          Top = 62
          Width = 148
          Height = 21
          Text = ''
          TabOrder = 6
          ButtonKind = bkFind
          ButtonVisible = False
          DataSource = ds456
          DataSourceField = 'DELIVER_NUMBER'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object redt8: TRKeyRzBtnEdit
          Left = 63
          Top = 117
          Width = 98
          Height = 21
          Text = ''
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 7
          ButtonKind = bkFind
          ButtonVisible = False
          DataSource = ds456
          DataSourceField = 'exch_rate'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object dtpReqDate: TDateTimePicker
          Left = 477
          Top = 8
          Width = 148
          Height = 21
          Date = 42626.476985127320000000
          Time = 42626.476985127320000000
          Color = clWhite
          TabOrder = 8
        end
        object CheckBox2: TCheckBox
          Left = 459
          Top = 122
          Width = 132
          Height = 17
          Caption = #20445#23384#21518#25171#21360#20837#20179#21333
          TabOrder = 9
        end
        object CheckBox3: TCheckBox
          Left = 594
          Top = 122
          Width = 145
          Height = 17
          Caption = #23384#20179#20301#32622#25353#24037#21378#36807#28388
          Checked = True
          State = cbChecked
          TabOrder = 10
        end
      end
      object Panel2: TPanel
        Left = 1
        Top = 152
        Width = 945
        Height = 248
        Align = alClient
        TabOrder = 1
        object DBGridEh1: TDBGridEh
          Left = 1
          Top = 1
          Width = 943
          Height = 246
          Align = alClient
          DataSource = ds235
          DynProps = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          FooterParams.Color = clWindow
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          PopupMenu = PopupMenu1
          ReadOnly = True
          TabOrder = 0
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'goods_name'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #29289#21697#21517#31216
              Width = 120
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'goods_guige'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #29289#21697#35268#26684
              Width = 130
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
              FieldName = 'LOCATION'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #20179#24211#20301#32622
              Width = 70
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
              FieldName = 'QUAN_RECD'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #25968#37327
              Width = 60
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'unit_price'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #21547#31246#20215#26684
              Width = 80
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'state_tax'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #31246#29575
              Width = 60
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'REF_NUMBER'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #22791#27880
              Width = 120
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'rohs'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #29615#20445#26631#35782
              Width = 60
            end
            item
              DisplayFormat = 'yyyy-MM-dd'
              DynProps = <>
              EditButtons = <>
              FieldName = 'DATE_RECD'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #21046#36896#26085#26399
              Width = 90
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
  end
  object cds456: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 80
  end
  object ds456: TDataSource
    DataSet = cds456
    Left = 272
    Top = 80
  end
  object cds04: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 256
    Top = 232
  end
  object ds75: TDataSource
    DataSet = cdsLookUp75
    Left = 296
    Top = 232
  end
  object cdsLookUp75: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 344
    Top = 232
  end
  object ds16: TDataSource
    DataSet = cdsLookUp16
    Left = 408
    Top = 232
  end
  object cdsLookUp16: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 464
    Top = 232
  end
  object ds235: TDataSource
    DataSet = cds235
    Left = 296
    Top = 304
  end
  object cds235: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 256
    Top = 304
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 168
    Top = 264
    object N1: TMenuItem
      Caption = #22686#21152
      ShortCut = 16449
      OnClick = N1Click
    end
    object N3: TMenuItem
      Caption = #32534#36753
      ShortCut = 16453
      OnClick = N3Click
    end
    object N2: TMenuItem
      Caption = #21024#38500
      ShortCut = 16452
      OnClick = N2Click
    end
  end
end
