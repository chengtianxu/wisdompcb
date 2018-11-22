inherited frmVMIzhiruku: TfrmVMIzhiruku
  Caption = #30452#25509#20837#24211
  ClientHeight = 485
  ClientWidth = 984
  ExplicitWidth = 1000
  ExplicitHeight = 524
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 984
    Height = 485
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 984
    ExplicitHeight = 485
    inherited pnl1: TPanel
      Width = 982
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 982
      inherited btnSave: TBitBtn
        OnClick = btnSaveClick
      end
      inherited btnClose: TBitBtn
        OnClick = btnCloseClick
      end
    end
    inherited pnl2: TPanel
      Width = 982
      Height = 450
      ExplicitLeft = 1
      ExplicitTop = 34
      ExplicitWidth = 982
      ExplicitHeight = 450
      object Panel1: TPanel
        Left = 1
        Top = 1
        Width = 980
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
          AltBtnWidth = 15
          ButtonWidth = 15
          DataSource = ds133
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
          OnButtonClick = redt2ButtonClick
          DataSource = ds133
          DataSourceField = 'warehouse_ptr'
          DispalyTableName = 'data0015'
          DisplaytextField = 'WAREHOUSE_CODE'
          DisplayRetKeyField = 'Rkey'
          DisplayNoteField = 'WAREHOUSE_Name'
          DisplayPickID = '0'
          DisplayModID = 564
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
          DataSource = ds133
          DataSourceField = 'SUPP_PTR'
          DispalyTableName = 'data0023'
          DisplaytextField = 'CODE'
          DisplayRetKeyField = 'Rkey'
          DisplayNoteField = 'ABBR_NAME'
          DisplayPickID = '1'
          DisplayModID = 564
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
          DataSource = ds133
          DataSourceField = 'currency_ptr'
          DispalyTableName = 'data0001'
          DisplaytextField = 'CURR_CODE'
          DisplayRetKeyField = 'Rkey'
          DisplayNoteField = 'CURR_NAME'
          DisplayPickID = '2'
          DisplayModID = 564
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
          AltBtnWidth = 15
          ButtonWidth = 15
          DataSource = ds133
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
          AltBtnWidth = 15
          ButtonWidth = 15
          DataSource = ds133
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
          AltBtnWidth = 15
          ButtonWidth = 15
          DataSource = ds133
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
          AltBtnWidth = 15
          ButtonWidth = 15
          DataSource = ds133
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
      end
      object Panel2: TPanel
        Left = 1
        Top = 152
        Width = 980
        Height = 297
        Align = alClient
        TabOrder = 1
        object DBGridEh1: TDBGridEh
          Left = 1
          Top = 1
          Width = 978
          Height = 295
          Align = alClient
          DataSource = ds134
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
              FieldName = 'INV_PART_NUMBER'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #26448#26009#32534#30721
              Width = 138
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'INV_name'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #26448#26009#21517#31216
              Width = 116
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'inv_DESCRIPTION'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #26448#26009#35268#26684
              Width = 172
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'LOCATION'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #20179#24211
              Width = 60
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'UNIT_NAME'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #24211#23384#21333#20301
              Width = 54
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'QUANTITY'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #20837#24211#25968#37327
              Width = 57
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'tax_price'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #21547#31246#20215
              Width = 45
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'TAX_2'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #31246#29575
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'BARCODE_ID'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #22791#27880
              Width = 97
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'rohs'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #29615#20445#26631#35782
              Width = 55
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'MANU_DATE'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #21046#36896#26085#26399
              Width = 81
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
  end
  object cds133: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 80
  end
  object ds133: TDataSource
    DataSet = cds133
    Left = 272
    Top = 80
  end
  object cds134: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 208
    Top = 296
  end
  object ds134: TDataSource
    DataSet = cds134
    Left = 256
    Top = 296
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 472
    Top = 272
    object IQC1: TMenuItem
      Caption = #26032#22686
      OnClick = IQC1Click
    end
    object N1: TMenuItem
      Caption = #21024#38500' '
      OnClick = N1Click
    end
  end
  object cds04: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 200
  end
  object ds17: TDataSource
    DataSet = cdsLookUp17
    Left = 304
    Top = 208
  end
  object cdsLookUp17: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 368
    Top = 208
  end
  object cdsLookUp16: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 512
    Top = 208
  end
  object ds16: TDataSource
    DataSet = cdsLookUp16
    Left = 448
    Top = 208
  end
end
