inherited frmEdit_mod25: TfrmEdit_mod25
  Caption = 'frmEdit_mod25'
  ClientHeight = 472
  ClientWidth = 692
  OnShow = FormShow
  ExplicitWidth = 708
  ExplicitHeight = 511
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 692
    Height = 472
    ExplicitWidth = 692
    ExplicitHeight = 472
    inherited pnl1: TPanel
      Width = 690
      ExplicitWidth = 690
      inherited btnSave: TBitBtn
        OnClick = btnSaveClick
        ExplicitLeft = -5
        ExplicitTop = -3
      end
      inherited btnClose: TBitBtn
        OnClick = btnCloseClick
      end
    end
    inherited pnl2: TPanel
      Width = 690
      Height = 437
      ExplicitWidth = 690
      ExplicitHeight = 437
      object pnl3: TPanel
        Left = 1
        Top = 1
        Width = 688
        Height = 104
        Align = alTop
        TabOrder = 0
        object lbl1: TLabel
          Left = 8
          Top = 80
          Width = 156
          Height = 13
          Caption = #39044#31639#35828#26126#65306#37329#39069#20197#26412#20301#24065#35745#31639
        end
        object lbl2: TLabel
          Left = 43
          Top = 47
          Width = 60
          Height = 13
          Caption = #39044#31639#21517#31216#65306
        end
        object lbl3: TLabel
          Left = 350
          Top = 22
          Width = 60
          Height = 13
          Caption = #39044#31639#24180#24230#65306
        end
        object lbl4: TLabel
          Left = 448
          Top = 88
          Width = 60
          Height = 13
          Caption = #38656#27714#20154#21592#65306
        end
        object lbl5: TLabel
          Left = 43
          Top = 22
          Width = 60
          Height = 13
          Caption = #39044#31639#20195#30721#65306
        end
        object edt_BCode: TRKeyRzBtnEdit
          Left = 104
          Top = 16
          Width = 121
          Height = 21
          Text = ''
          TabOrder = 0
          ButtonKind = bkFind
          ButtonVisible = False
          AltBtnWidth = 15
          ButtonWidth = 15
          DataSource = ds362
          DataSourceField = 'code'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object edt_BName: TRKeyRzBtnEdit
          Left = 104
          Top = 43
          Width = 121
          Height = 21
          Text = ''
          TabOrder = 1
          ButtonKind = bkFind
          ButtonVisible = False
          AltBtnWidth = 15
          ButtonWidth = 15
          DataSource = ds362
          DataSourceField = 'DESCRIPTION'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object se_BYear: TSpinEdit
          Left = 416
          Top = 16
          Width = 65
          Height = 22
          MaxValue = 2050
          MinValue = 2000
          TabOrder = 2
          Value = 2017
        end
      end
      object pnl4: TPanel
        Left = 1
        Top = 105
        Width = 688
        Height = 331
        Align = alClient
        TabOrder = 1
        object sg362: TStringGrid
          Left = 1
          Top = 1
          Width = 288
          Height = 329
          Align = alLeft
          ColCount = 3
          RowCount = 13
          TabOrder = 0
          OnDrawCell = sg362DrawCell
          OnExit = sg362Exit
          OnKeyPress = sg362KeyPress
          OnSelectCell = sg362SelectCell
        end
        object eh363: TDBGridEh
          Left = 289
          Top = 1
          Width = 398
          Height = 329
          Align = alClient
          DataSource = ds363
          DynProps = <>
          PopupMenu = pm363
          ReadOnly = True
          TabOrder = 1
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'USER_LOGIN_NAME'
              Footers = <>
              Title.Caption = #29992#25143#32534#30721
              Width = 71
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'USER_FULL_NAME'
              Footers = <>
              Title.Caption = #29992#25143#22995#21517
              Width = 132
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
  end
  object ds362: TDataSource
    DataSet = cds362
    Left = 512
    Top = 16
  end
  object ds363: TDataSource
    DataSet = cds363
    Left = 504
    Top = 376
  end
  object cds362: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from data0362'
    Params = <>
    Left = 544
    Top = 16
  end
  object cds363: TClientDataSet
    Aggregates = <>
    CommandText = 
      ' SELECT     Data0073.USER_FULL_NAME, Data0073.USER_LOGIN_NAME, '#13 +
      #10'case Data0073.ACTIVE_FLAG when '#39'1'#39' then '#39#31163#32844#20154#21592#39'  else '#39#22312#32844#20154#21592#39' end' +
      '  as '#39'ACTIVE_FLAG'#39','#13#10'Data0363.USER_PTR,'#13#10'data0363.BUDGET_PTR'#13#10'FR' +
      'OM         '#13#10'Data0363 INNER JOIN '#13#10'Data0073 ON Data0363.USER_PTR' +
      ' = Data0073.RKEY'#13#10'where 1=1'
    Params = <>
    Left = 544
    Top = 376
  end
  object pm363: TPopupMenu
    Left = 416
    Top = 248
    object mniAdd: TMenuItem
      Caption = #26032#22686
      OnClick = mniAddClick
    end
    object mniDel: TMenuItem
      Caption = #21024#38500
      OnClick = mniDelClick
    end
  end
  object qrytemp: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=62ddf8f60269678;Persist Security In' +
      'fo=True;User ID=WZPCBConnect;Initial Catalog=sj_v20_live;Data So' +
      'urce=172.16.8.112'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from data0362')
    Left = 488
    Top = 240
    object qrytempRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object qrytempCODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object qrytempDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 40
    end
    object intgrfld_year: TIntegerField
      FieldName = 'bud_year'
    end
    object intgrfldGL_PTR: TIntegerField
      FieldName = 'GL_PTR'
    end
    object qrytempBUDGET_PERIOD_1: TFloatField
      FieldName = 'BUDGET_PERIOD_1'
    end
    object qrytempBUDGET_PERIOD_2: TFloatField
      FieldName = 'BUDGET_PERIOD_2'
    end
    object qrytempBUDGET_PERIOD_3: TFloatField
      FieldName = 'BUDGET_PERIOD_3'
    end
    object qrytempBUDGET_PERIOD_4: TFloatField
      FieldName = 'BUDGET_PERIOD_4'
    end
    object qrytempBUDGET_PERIOD_5: TFloatField
      FieldName = 'BUDGET_PERIOD_5'
    end
    object qrytempBUDGET_PERIOD_6: TFloatField
      FieldName = 'BUDGET_PERIOD_6'
    end
    object qrytempBUDGET_PERIOD_7: TFloatField
      FieldName = 'BUDGET_PERIOD_7'
    end
    object qrytempBUDGET_PERIOD_8: TFloatField
      FieldName = 'BUDGET_PERIOD_8'
    end
    object qrytempBUDGET_PERIOD_9: TFloatField
      FieldName = 'BUDGET_PERIOD_9'
    end
    object qrytempBUDGET_PERIOD_10: TFloatField
      FieldName = 'BUDGET_PERIOD_10'
    end
    object qrytempBUDGET_PERIOD_11: TFloatField
      FieldName = 'BUDGET_PERIOD_11'
    end
    object qrytempBUDGET_PERIOD_12: TFloatField
      FieldName = 'BUDGET_PERIOD_12'
    end
    object qrytempBUDGET_PERIOD_13: TFloatField
      FieldName = 'BUDGET_PERIOD_13'
    end
    object qrytempUSED_PERIOD_1: TFloatField
      FieldName = 'USED_PERIOD_1'
    end
    object qrytempUSED_PERIOD_2: TFloatField
      FieldName = 'USED_PERIOD_2'
    end
    object qrytempUSED_PERIOD_3: TFloatField
      FieldName = 'USED_PERIOD_3'
    end
    object qrytempUSED_PERIOD_4: TFloatField
      FieldName = 'USED_PERIOD_4'
    end
    object qrytempUSED_PERIOD_5: TFloatField
      FieldName = 'USED_PERIOD_5'
    end
    object qrytempUSED_PERIOD_6: TFloatField
      FieldName = 'USED_PERIOD_6'
    end
    object qrytempUSED_PERIOD_7: TFloatField
      FieldName = 'USED_PERIOD_7'
    end
    object qrytempUSED_PERIOD_8: TFloatField
      FieldName = 'USED_PERIOD_8'
    end
    object qrytempUSED_PERIOD_9: TFloatField
      FieldName = 'USED_PERIOD_9'
    end
    object qrytempUSED_PERIOD_10: TFloatField
      FieldName = 'USED_PERIOD_10'
    end
    object qrytempUSED_PERIOD_11: TFloatField
      FieldName = 'USED_PERIOD_11'
    end
    object qrytempUSED_PERIOD_12: TFloatField
      FieldName = 'USED_PERIOD_12'
    end
    object qrytempUSED_PERIOD_13: TFloatField
      FieldName = 'USED_PERIOD_13'
    end
  end
end
