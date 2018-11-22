inherited frmBaseCheck_Mod705: TfrmBaseCheck_Mod705
  Caption = 'frmBaseCheck_Mod705'
  ClientHeight = 550
  ClientWidth = 979
  KeyPreview = True
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  ExplicitWidth = 995
  ExplicitHeight = 589
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDisplay: TPanel
    Left = 0
    Top = 0
    Width = 979
    Height = 550
    Align = alClient
    TabOrder = 0
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 648
      Height = 548
      Align = alLeft
      TabOrder = 0
      object pnl4: TPanel
        Left = 1
        Top = 1
        Width = 384
        Height = 546
        Align = alLeft
        TabOrder = 0
        object pnl5: TPanel
          Left = 1
          Top = 1
          Width = 382
          Height = 31
          Align = alTop
          TabOrder = 0
          object btn_Cancel: TButton
            Left = 306
            Top = 1
            Width = 75
            Height = 29
            Align = alRight
            Caption = #37325#32622
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = #23435#20307
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = btn_CancelClick
          end
          object btn_Save: TButton
            Left = 1
            Top = 1
            Width = 75
            Height = 29
            Align = alLeft
            Caption = #20445#23384
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = #23435#20307
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = btn_SaveClick
          end
        end
        object pnl7: TPanel
          Left = 1
          Top = 32
          Width = 382
          Height = 513
          Align = alClient
          TabOrder = 1
          object pnl8: TPanel
            Left = 1
            Top = 1
            Width = 380
            Height = 511
            Align = alClient
            TabOrder = 0
            object lbl3: TLabel
              Left = 32
              Top = 41
              Width = 52
              Height = 13
              Caption = #20316#19994#21333#21495
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl5: TLabel
              Left = 36
              Top = 69
              Width = 48
              Height = 13
              Caption = #26412#21378#32534#21495
            end
            object lbl1: TLabel
              Left = 36
              Top = 97
              Width = 48
              Height = 13
              Caption = #26816#27979#26085#26399
            end
            object lbl2: TLabel
              Left = 36
              Top = 123
              Width = 48
              Height = 13
              Caption = #26816#27979#39033#30446
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label5: TLabel
              Left = 60
              Top = 147
              Width = 24
              Height = 13
              Caption = #29677#27425
            end
            object lbl12: TLabel
              Left = 266
              Top = 251
              Width = 55
              Height = 13
              Caption = #33391#21697'PCS'#25968
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label2: TLabel
              Left = 145
              Top = 249
              Width = 55
              Height = 13
              Caption = #19981#33391'PCS'#25968
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbl4: TLabel
              Left = 9
              Top = 252
              Width = 67
              Height = 13
              Caption = #26816#27979#24635'PCS'#25968
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbl7: TLabel
              Left = 59
              Top = 328
              Width = 24
              Height = 13
              Caption = #22791#27880
            end
            object lbl6: TLabel
              Left = 270
              Top = 146
              Width = 48
              Height = 13
              Caption = #26816#26597#36718#27425
            end
            object lbl15: TLabel
              Left = 163
              Top = 150
              Width = 36
              Height = 13
              Caption = #26426#21488#21495
            end
            object Label6: TLabel
              Left = 60
              Top = 177
              Width = 24
              Height = 13
              Caption = #23618#21035
            end
            object lbl11: TLabel
              Left = 175
              Top = 175
              Width = 24
              Height = 13
              Caption = #21402#24230
            end
            object lbl8: TLabel
              Left = 27
              Top = 201
              Width = 54
              Height = 13
              Caption = 'PNL'#36865#26816#25968
            end
            object Label3: TLabel
              Left = 146
              Top = 203
              Width = 54
              Height = 13
              Caption = 'PNL'#33391#21697#25968
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clDefault
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbl10: TLabel
              Left = 24
              Top = 226
              Width = 60
              Height = 13
              Caption = #36865#26816#38754#25968#37327
            end
            object Label4: TLabel
              Left = 154
              Top = 228
              Width = 48
              Height = 13
              Caption = #38754#33391#21697#25968
            end
            object Label1: TLabel
              Left = 20
              Top = 276
              Width = 60
              Height = 13
              Caption = #25805#20316#21592#26102#38388
            end
            object Label7: TLabel
              Left = 138
              Top = 277
              Width = 12
              Height = 13
              Caption = #21040
            end
            object lbl16: TLabel
              Left = 24
              Top = 301
              Width = 60
              Height = 13
              Caption = #25805#20316#21592#32534#21495
            end
            object lbl17: TLabel
              Left = 280
              Top = 171
              Width = 36
              Height = 13
              Caption = #25490#26495#25968
            end
            object edt_WorkNo: TRKeyRzBtnEdit
              Left = 90
              Top = 39
              Width = 133
              Height = 21
              Text = ''
              Color = clWhite
              TabOrder = 0
              OnExit = edt_WorkNoExit
              OnKeyDown = edt_WorkNoKeyDown
              ButtonKind = bkFind
              AltBtnWidth = 15
              ButtonWidth = 15
              OnButtonClick = edt_WorkNoButtonClick
              DataSource = dsRMain
              DataSourceField = 'D06_Ptr'
              DispalyTableName = 'data0006'
              DisplaytextField = 'WORK_ORDER_NUMBER'
              DisplayRetKeyField = 'rkey'
              DisplayPickID = '1'
              DisplayModID = 705
              ForceOnFocus = True
            end
            object edt_ProdNo: TRKeyRzBtnEdit
              Left = 87
              Top = 66
              Width = 133
              Height = 21
              Text = ''
              Color = clBtnFace
              Enabled = False
              FocusColor = clMoneyGreen
              TabOrder = 1
              ButtonKind = bkFind
              ButtonVisible = False
              AltBtnWidth = 15
              ButtonWidth = 15
              DataSource = dsRMain
              DisplayModID = 0
              ForceOnFocus = True
            end
            object dtpQC: TDateTimePicker
              Left = 87
              Top = 93
              Width = 133
              Height = 21
              Date = 42779.433050879630000000
              Format = 'yyyy-MM-dd'
              Time = 42779.433050879630000000
              TabOrder = 2
            end
            object cbb_ClassNo: TComboBox
              Left = 87
              Top = 144
              Width = 58
              Height = 21
              TabOrder = 3
              Items.Strings = (
                'A'#29677
                'B'#29677)
            end
            object edt_PassQty: TRKeyRzBtnEdit
              Left = 323
              Top = 246
              Width = 53
              Height = 21
              Text = ''
              Color = clBtnFace
              TabOrder = 4
              OnExit = edt_PassQtyExit
              OnKeyPress = edt_FailQtyKeyPress
              ButtonKind = bkFind
              ButtonVisible = False
              AltBtnWidth = 15
              ButtonWidth = 15
              DataSource = dsRMain
              DataSourceField = 'PassQty'
              DisplayModID = 0
              ForceOnFocus = True
            end
            object edt_FailQty: TRKeyRzBtnEdit
              Left = 206
              Top = 247
              Width = 49
              Height = 21
              Text = ''
              TabOrder = 5
              OnExit = edt_FailQtyExit
              OnKeyPress = edt_FailQtyKeyPress
              ButtonKind = bkFind
              ButtonVisible = False
              AltBtnWidth = 15
              ButtonWidth = 15
              DataSource = dsRMain
              DataSourceField = 'FailQty'
              DisplayModID = 0
              ForceOnFocus = True
            end
            object edt_Remark: TRKeyRzBtnEdit
              Left = 87
              Top = 325
              Width = 186
              Height = 21
              Text = ''
              TabOrder = 6
              ButtonKind = bkFind
              ButtonVisible = False
              AltBtnWidth = 15
              ButtonWidth = 15
              DataSource = dsRMain
              DataSourceField = 'bakNote'
              DisplayModID = 0
              ForceOnFocus = True
            end
            object edt_AllQty: TRKeyRzBtnEdit
              Left = 87
              Top = 246
              Width = 49
              Height = 21
              Text = ''
              TabOrder = 7
              OnExit = edt_AllQtyExit
              OnKeyDown = edt_AllQtyKeyDown
              OnKeyPress = edt_AllQtyKeyPress
              ButtonKind = bkFind
              ButtonVisible = False
              AltBtnWidth = 15
              ButtonWidth = 15
              DataSource = dsRMain
              DataSourceField = 'ALLQty'
              DisplayModID = 0
              ForceOnFocus = True
            end
            object edt_CheckCount: TRKeyRzBtnEdit
              Left = 320
              Top = 143
              Width = 52
              Height = 21
              Text = ''
              TabOrder = 8
              ButtonKind = bkFind
              ButtonVisible = False
              AltBtnWidth = 15
              ButtonWidth = 15
              DataSource = dsRMain
              DataSourceField = 'QCTestRound'
              DisplayModID = 0
              ForceOnFocus = True
            end
            object edt_MachineNo: TRKeyRzBtnEdit
              Left = 205
              Top = 144
              Width = 62
              Height = 21
              Text = ''
              TabOrder = 9
              ButtonKind = bkFind
              ButtonVisible = False
              AltBtnWidth = 15
              ButtonWidth = 15
              DataSource = dsRMain
              DataSourceField = 'MachineNO'
              DisplayModID = 0
              ForceOnFocus = True
            end
            object edt_PnlQty: TRKeyRzBtnEdit
              Left = 87
              Top = 196
              Width = 51
              Height = 21
              Text = ''
              TabOrder = 10
              OnExit = edt_PnlQtyExit
              OnKeyDown = edt_PnlQtyKeyDown
              OnKeyPress = edt_PnlQtyKeyPress
              ButtonKind = bkFind
              ButtonVisible = False
              AltBtnWidth = 15
              ButtonWidth = 15
              DataSource = dsRMain
              DataSourceField = 'PnlQty'
              DisplayModID = 0
              ForceOnFocus = True
            end
            object edt_PPassQty: TRKeyRzBtnEdit
              Left = 205
              Top = 197
              Width = 52
              Height = 21
              Text = ''
              TabOrder = 11
              OnKeyPress = edt_PPassQtyKeyPress
              ButtonKind = bkFind
              ButtonVisible = False
              AltBtnWidth = 15
              ButtonWidth = 15
              DataSource = dsRMain
              DataSourceField = 'PPassQty'
              DisplayModID = 0
              ForceOnFocus = True
            end
            object edt_SideQty: TRKeyRzBtnEdit
              Left = 87
              Top = 221
              Width = 51
              Height = 21
              Text = ''
              Color = clBtnFace
              Enabled = False
              TabOrder = 12
              OnExit = edt_SideQtyExit
              OnKeyDown = edt_SideQtyKeyDown
              OnKeyPress = edt_SideQtyKeyPress
              ButtonKind = bkFind
              ButtonVisible = False
              AltBtnWidth = 15
              ButtonWidth = 15
              DataSource = dsRMain
              DataSourceField = 'SideQty'
              DisplayModID = 0
              ForceOnFocus = True
            end
            object edt_SPassQty: TRKeyRzBtnEdit
              Left = 205
              Top = 222
              Width = 52
              Height = 21
              Text = ''
              TabOrder = 13
              OnKeyPress = edt_SPassQtyKeyPress
              ButtonKind = bkFind
              ButtonVisible = False
              AltBtnWidth = 15
              ButtonWidth = 15
              DataSource = dsRMain
              DataSourceField = 'SPassQty'
              DisplayModID = 0
              ForceOnFocus = True
            end
            object edt_BTime: TRKeyRzBtnEdit
              Left = 86
              Top = 272
              Width = 49
              Height = 21
              Text = ''
              TabOrder = 14
              ButtonKind = bkFind
              ButtonVisible = False
              AltBtnWidth = 15
              ButtonWidth = 15
              DataSource = dsRMain
              DataSourceField = 'BTime'
              DisplayModID = 0
              ForceOnFocus = True
            end
            object edt_ETime: TRKeyRzBtnEdit
              Left = 152
              Top = 272
              Width = 49
              Height = 21
              Text = ''
              TabOrder = 15
              ButtonKind = bkFind
              ButtonVisible = False
              AltBtnWidth = 15
              ButtonWidth = 15
              DataSource = dsRMain
              DataSourceField = 'ETime'
              DisplayModID = 0
              ForceOnFocus = True
            end
            object edt_WManNo: TRKeyRzBtnEdit
              Left = 87
              Top = 298
              Width = 121
              Height = 21
              Text = ''
              TabOrder = 16
              ButtonKind = bkFind
              ButtonVisible = False
              AltBtnWidth = 15
              ButtonWidth = 15
              DataSource = dsRMain
              DataSourceField = 'WManNo'
              DisplayModID = 0
              ForceOnFocus = True
            end
            object edt_PBCount: TRKeyRzBtnEdit
              Left = 319
              Top = 168
              Width = 52
              Height = 21
              Text = ''
              TabOrder = 17
              OnExit = edt_PBCountExit
              OnKeyDown = edt_PBCountKeyDown
              OnKeyPress = edt_PBCountKeyPress
              ButtonKind = bkFind
              ButtonVisible = False
              AltBtnWidth = 15
              ButtonWidth = 15
              DataSource = dsRMain
              DataSourceField = 'PBCount'
              DisplayModID = 0
              ForceOnFocus = True
            end
            object cbb_HDDesc: TComboBox
              Left = 205
              Top = 169
              Width = 62
              Height = 21
              TabOrder = 18
              Items.Strings = (
                '<mm'
                '>=mm')
            end
          end
        end
        object cbb_QCTestName: TComboBox
          Left = 92
          Top = 150
          Width = 133
          Height = 21
          TabOrder = 2
        end
        object cbb_LayerNo: TComboBox
          Left = 88
          Top = 204
          Width = 59
          Height = 21
          TabOrder = 3
        end
      end
      object pnl1: TPanel
        Left = 385
        Top = 1
        Width = 262
        Height = 546
        Align = alClient
        TabOrder = 1
        object ehRDetail: TDBGridEh
          Left = 1
          Top = 30
          Width = 260
          Height = 515
          Align = alClient
          DataSource = dsRDetail
          DynProps = <>
          PopupMenu = pmDetail
          TabOrder = 0
          OnTitleClick = ehRDetailTitleClick
          Columns = <
            item
              DynProps = <>
              EditButtons = <
                item
                  OnClick = ehRDetailColumns0EditButtons0Click
                end>
              FieldName = 'REJ_CODE'
              Footers = <>
              ReadOnly = True
              Title.Caption = #32570#38519#20195#30721
              Width = 52
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'REJECT_DESCRIPTION'
              Footers = <>
              ReadOnly = True
              Title.Caption = #19981#33391#39033#30446
              Width = 107
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'BugQty'
              Footers = <>
              Title.Caption = #19981#33391#25968#37327
              Width = 65
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object pnl6: TPanel
          Left = 1
          Top = 1
          Width = 260
          Height = 29
          Align = alTop
          TabOrder = 1
          object lblBugCode: TLabel
            Left = 39
            Top = 9
            Width = 53
            Height = 13
            Caption = 'lblBugCode'
          end
          object edtFilter: TEdit
            Left = 101
            Top = 4
            Width = 121
            Height = 21
            TabOrder = 0
            OnChange = edtFilterChange
          end
        end
      end
    end
    object pnl2: TPanel
      Left = 649
      Top = 1
      Width = 329
      Height = 548
      Align = alClient
      TabOrder = 1
      object pnl3: TPanel
        Left = 1
        Top = 1
        Width = 327
        Height = 546
        Align = alClient
        TabOrder = 0
      end
    end
  end
  object cdsRDetail: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 376
    Top = 472
  end
  object dsRDetail: TDataSource
    DataSet = cdsRDetail
    Left = 320
    Top = 472
  end
  object test: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=62ddf8f60269678;Persist Security In' +
      'fo=True;User ID=WZPCBConnect;Initial Catalog=sj_v20_live;Data So' +
      'urce=172.16.8.112'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      ' select   b.* ,d39.REJECT_DESCRIPTION'
      ' from  dbo.QC_ReportDetail b'
      ' inner join  Data0039   d39  on b.D39_ptr=d39.RKEY'
      ' where 1=0')
    Left = 672
    Top = 24
    object testREJECT_DESCRIPTION: TStringField
      FieldName = 'REJECT_DESCRIPTION'
      Size = 30
    end
    object testBugQty: TIntegerField
      FieldName = 'BugQty'
    end
  end
  object CdsRMain: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT PM.*,D10.CUST_CODE,PType.ReportFile FROM Pack_PrintMain P' +
      'M'#13#10'INNER JOIN Pack_PrintType PType on PM.PackID = PType.PackID'#13#10 +
      'INNER JOIN Data0010 d10 ON PType.D10_Ptr = d10.RKEY'#13#10'WHERE Print' +
      'Time BETWEEN :P1 AND :P2'#13#10
    Params = <
      item
        DataType = ftUnknown
        Name = 'P1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'P2'
        ParamType = ptUnknown
      end>
    Left = 672
    Top = 96
  end
  object dsRMain: TDataSource
    DataSet = CdsRMain
    Left = 704
    Top = 144
  end
  object cdsModel: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 528
    Top = 24
  end
  object cdsTemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 576
    Top = 24
  end
  object pmDetail: TPopupMenu
    Left = 272
    Top = 480
    object mni_Add: TMenuItem
      Caption = #28155#21152' '
      OnClick = mni_AddClick
    end
  end
end
