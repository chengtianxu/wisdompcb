inherited frmModify_Mod599: TfrmModify_Mod599
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #22238#22797#20132#26399#21464#26356
  ClientHeight = 435
  ClientWidth = 476
  ExplicitWidth = 492
  ExplicitHeight = 473
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 476
    Height = 435
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 476
    ExplicitHeight = 435
    inherited pnl1: TPanel
      Width = 474
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 474
      inherited btnSave: TBitBtn
        OnClick = btnSaveClick
      end
      inherited btnClose: TBitBtn
        ModalResult = 2
      end
    end
    inherited pnl2: TPanel
      Width = 474
      Height = 400
      ExplicitLeft = 1
      ExplicitTop = 34
      ExplicitWidth = 474
      ExplicitHeight = 400
      object Panel1: TPanel
        Left = 1
        Top = 208
        Width = 472
        Height = 191
        Align = alBottom
        TabOrder = 0
        object DBGridEh1: TDBGridEh
          Left = 1
          Top = 1
          Width = 470
          Height = 189
          Align = alClient
          DataSource = ds175
          DynProps = <>
          PopupMenu = pm175
          ReadOnly = True
          TabOrder = 0
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'finish_Date'
              Footers = <>
              Title.Caption = #23436#24037#26085#26399
              Width = 91
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'finish_quantity'
              Footers = <>
              Title.Caption = #23436#24037#25968#37327
              Width = 89
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object Panel2: TPanel
        Left = 1
        Top = 1
        Width = 472
        Height = 207
        Align = alClient
        TabOrder = 1
        object Label1: TLabel
          Left = 21
          Top = 24
          Width = 48
          Height = 13
          Caption = #38144#21806#35746#21333
        end
        object Label2: TLabel
          Left = 3
          Top = 54
          Width = 66
          Height = 13
          Caption = #35746#21333#25968#37327'SET'
        end
        object Label4: TLabel
          Left = 21
          Top = 83
          Width = 48
          Height = 13
          Caption = #23458#25143#20132#26399
        end
        object Label6: TLabel
          Left = 9
          Top = 113
          Width = 60
          Height = 13
          Caption = #21407#22238#22797#20132#26399
        end
        object Label8: TLabel
          Left = 45
          Top = 143
          Width = 24
          Height = 13
          Caption = #22791#27880
        end
        object Label7: TLabel
          Left = 240
          Top = 110
          Width = 60
          Height = 13
          Caption = #26032#22238#22797#20132#26399
        end
        object Label5: TLabel
          Left = 252
          Top = 81
          Width = 48
          Height = 13
          Caption = #35745#21010#20132#26399
        end
        object Label3: TLabel
          Left = 233
          Top = 53
          Width = 67
          Height = 13
          Caption = #35746#21333#25968#37327'PCS'
        end
        object DBEdit3: TDBEdit
          Left = 78
          Top = 107
          Width = 121
          Height = 21
          DataField = 'oldReply_Date'
          DataSource = ds174
          Enabled = False
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 75
          Top = 80
          Width = 121
          Height = 21
          DataField = 'ORIG_REQUEST_DATE'
          DataSource = ds174
          Enabled = False
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit1: TDBEdit
          Left = 78
          Top = 50
          Width = 121
          Height = 21
          DataField = 'PARTS_ORDERED'
          DataSource = ds174
          Enabled = False
          ReadOnly = True
          TabOrder = 2
        end
        object edtOrder: TRKeyRzBtnEdit
          Left = 78
          Top = 21
          Width = 121
          Height = 21
          Text = ''
          TabOrder = 3
          ButtonKind = bkFind
          AltBtnWidth = 15
          ButtonWidth = 15
          OnButtonClick = edtOrderButtonClick
          DataSource = ds174
          DataSourceField = 'so_ptr'
          DispalyTableName = 'Data0060'
          DisplaytextField = 'SALES_ORDER'
          DisplayRetKeyField = 'rkey'
          DisplayPickID = '0'
          DisplayModID = 599
          ForceOnFocus = True
        end
        object DBMemo1: TDBMemo
          Left = 78
          Top = 143
          Width = 357
          Height = 58
          DataField = 'remark'
          DataSource = ds174
          TabOrder = 4
        end
        object DBCheckBox1: TDBCheckBox
          Left = 232
          Top = 24
          Width = 217
          Height = 17
          Caption = #26159#21542#21516#27493#20462#25913#20316#19994#21333#35745#21010#23436#24037#26085#26399
          DataField = 'planned_FLAG'
          DataSource = ds174
          TabOrder = 5
          ValueChecked = 'Y'
          ValueUnchecked = 'N'
        end
        object DBEdit4: TDBEdit
          Left = 314
          Top = 51
          Width = 121
          Height = 21
          DataField = 'set_ordered'
          DataSource = ds174
          Enabled = False
          ReadOnly = True
          TabOrder = 6
        end
        object DBEdit5: TDBEdit
          Left = 314
          Top = 79
          Width = 121
          Height = 21
          DataField = 'ORIG_SCHED_SHIP_DATE'
          DataSource = ds174
          Enabled = False
          ReadOnly = True
          TabOrder = 7
        end
        object dtpDate: TRzDBDateTimePicker
          Left = 314
          Top = 106
          Width = 121
          Height = 21
          Date = 43077.000000000000000000
          Format = ''
          Time = 43077.000000000000000000
          TabOrder = 8
          DataField = 'newReply_Date'
          DataSource = ds174
        end
      end
    end
  end
  object cds174: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT Data0174.*,Data0060.PARTS_ORDERED,Data0060.set_ordered'#13#10#9 +
      ',Data0060.ORIG_REQUEST_DATE,Data0060.ORIG_SCHED_SHIP_DATE'#13#10#9',Dat' +
      'a0060.SCH_DATE'#13#10'From Data0174'#13#10#9'inner join Data0060 on Data0174.' +
      'so_ptr = Data0060.rkey'#13#10
    Params = <>
    Left = 328
    Top = 264
  end
  object ds174: TDataSource
    DataSet = cds174
    Left = 368
    Top = 264
  end
  object cds175: TClientDataSet
    Aggregates = <>
    CommandText = 'SELECT * FROM Data0175'
    IndexFieldNames = 'finish_Date'
    Params = <>
    Left = 328
    Top = 320
  end
  object ds175: TDataSource
    DataSet = cds175
    Left = 368
    Top = 320
  end
  object pm175: TPopupMenu
    Left = 152
    Top = 288
    object NAdd: TMenuItem
      Caption = #26032#22686
      OnClick = NAddClick
    end
    object NEdit: TMenuItem
      Caption = #32534#36753
      OnClick = NEditClick
    end
    object NDel: TMenuItem
      Caption = #21024#38500
      OnClick = NDelClick
    end
  end
end
