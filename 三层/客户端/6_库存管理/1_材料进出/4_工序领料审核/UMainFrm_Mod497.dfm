inherited FrmMain_Mod497: TFrmMain_Mod497
  Caption = #24037#24207#39046#26009#23457#26680
  ClientHeight = 509
  ClientWidth = 1088
  OnShow = FormShow
  ExplicitWidth = 1104
  ExplicitHeight = 548
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 1088
    Height = 509
    ExplicitWidth = 1088
    ExplicitHeight = 509
    inherited pnlDisplayMain: TPanel
      Width = 1088
      Height = 509
      TabOrder = 1
      ExplicitWidth = 1088
      ExplicitHeight = 509
      inherited pnlChildMain: TPanel
        Width = 1086
        Height = 507
        ExplicitWidth = 1086
        ExplicitHeight = 507
        inherited pnlEhMainDisplay: TPanel
          Top = 41
          Width = 1084
          Height = 430
          ExplicitTop = 41
          ExplicitWidth = 1084
          ExplicitHeight = 430
          inherited ehMain: TDBGridEh
            Width = 1082
            Height = 160
            Align = alTop
            OnDrawColumnCell = ehMainDrawColumnCell
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'number'
                Footers = <>
                Title.Caption = #39046#26009#21333#21495
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'DEPT_NAME'
                Footers = <>
                Title.Caption = #39046#26009#37096#38376
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'DATE'
                Footers = <>
                Title.Caption = #39046#26009#26085#26399
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'EMPLOYEE_NAME'
                Footers = <>
                Title.Caption = #39046#26009#20154#21592
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'C_STATUS'
                Footers = <>
                Title.Caption = #29366#24577
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'auth_EMPLOYEE_NAME'
                Footers = <>
                Title.Caption = #23457#25209#20154
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'auth_date'
                Footers = <>
                Title.Caption = #23457#25209#26085#26399
                Width = 86
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'reference'
                Footers = <>
                Title.Caption = #22791#27880
              end>
          end
          object eh468: TDBGridEh
            Left = 1
            Top = 161
            Width = 1082
            Height = 268
            Align = alClient
            DataSource = dsDetail
            DynProps = <>
            TabOrder = 1
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_PART_NUMBER'
                Footers = <>
                Title.Caption = #29289#26009#32534#21495
                Width = 70
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_PART_DESCRIPTION'
                Footers = <>
                Title.Caption = #21517#31216'/'#35268#26684
                Width = 189
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'QUAN_BOM'
                Footers = <>
                Title.Caption = #30003#35831#25968#37327
                Width = 54
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'QUAN_ISSUED'
                Footers = <>
                Title.Caption = #24050#21457#25918#25968#37327
                Width = 57
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'UNIT_NAME'
                Footers = <>
                Title.Caption = #21333#20301
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'STATUS'
                Footers = <>
                Title.Caption = #29366#24577
                Width = 75
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'VENDOR'
                Footers = <>
                Title.Caption = #20379#24212#21830
                Width = 97
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 1084
          Height = 40
          ExplicitWidth = 1084
          ExplicitHeight = 40
          inherited lblFilter: TLabel
            Left = 379
            ExplicitLeft = 379
          end
          object lbl1: TLabel [1]
            Left = 596
            Top = 9
            Width = 64
            Height = 13
            Caption = #30003#39046#26085#26399#20174':'
          end
          object lbl2: TLabel [2]
            Left = 778
            Top = 9
            Width = 16
            Height = 13
            Caption = #21040':'
          end
          inherited btnExit: TBitBtn
            Height = 40
            ExplicitHeight = 40
          end
          inherited btnRefresh: TBitBtn
            Height = 40
            ExplicitHeight = 40
          end
          inherited btnExportToExcel: TBitBtn
            Height = 40
            ExplicitHeight = 40
          end
          inherited btnQry: TBitBtn
            Height = 40
            Visible = False
            ExplicitHeight = 40
          end
          inherited btnZD: TBitBtn
            Height = 40
            Visible = False
            ExplicitHeight = 40
          end
          inherited edtFliter: TEdit
            Left = 433
            Width = 125
            ExplicitLeft = 433
            ExplicitWidth = 125
          end
          inherited btnDY: TBitBtn
            Height = 40
            ExplicitHeight = 40
          end
          inherited btnAuthDispatch: TBitBtn
            Height = 40
            TabOrder = 10
            ExplicitHeight = 40
          end
          object chkTime: TCheckBox
            Left = 575
            Top = 5
            Width = 15
            Height = 17
            TabOrder = 7
            OnClick = chkTimeClick
          end
          object dtpk1: TDateTimePicker
            Left = 671
            Top = 5
            Width = 100
            Height = 21
            Date = 40023.000000000000000000
            Time = 40023.000000000000000000
            TabOrder = 8
          end
          object dtpk2: TDateTimePicker
            Left = 800
            Top = 5
            Width = 100
            Height = 21
            Date = 40023.000000000000000000
            Time = 40023.000000000000000000
            TabOrder = 9
          end
        end
        object pnl1: TPanel
          Left = 1
          Top = 471
          Width = 1084
          Height = 35
          Align = alBottom
          TabOrder = 2
          object chk0: TCheckBox
            Left = 0
            Top = 6
            Width = 63
            Height = 17
            Caption = #24453#25552#20132
            TabOrder = 0
            OnClick = chk0Click
          end
          object chk1: TCheckBox
            Left = 69
            Top = 5
            Width = 63
            Height = 17
            Caption = #24453#23457#26680
            Checked = True
            State = cbChecked
            TabOrder = 1
            OnClick = chk0Click
          end
          object chk2: TCheckBox
            Left = 130
            Top = 6
            Width = 62
            Height = 17
            Caption = #24050#23457#26680
            TabOrder = 2
            OnClick = chk0Click
          end
          object chk3: TCheckBox
            Left = 198
            Top = 6
            Width = 61
            Height = 17
            Caption = #34987#36864#22238
            TabOrder = 3
            OnClick = chk0Click
          end
          object chk4: TCheckBox
            Left = 265
            Top = 6
            Width = 61
            Height = 17
            Caption = #24050#21457#25918
            TabOrder = 4
            OnClick = chk0Click
          end
        end
      end
    end
    object rg1: TRadioGroup
      Left = 908
      Top = -1
      Width = 126
      Height = 37
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #26412#20154
        #20840#37096)
      TabOrder = 0
      OnClick = rg1Click
    end
  end
  inherited cdsMain: TClientDataSet
    ReadOnly = True
    AfterScroll = cdsMainAfterScroll
    Left = 432
    Top = 96
  end
  inherited dsMain: TDataSource
    Left = 488
  end
  inherited pmZD: TPopupMenu
    Left = 128
    Top = 72
  end
  inherited pmMain: TPopupMenu
    OnPopup = pmMainPopup
    Left = 744
    Top = 64
    object mniAudit: TMenuItem
      Caption = #23457#26680
      OnClick = mniAuditClick
    end
    object mniCancelAudit: TMenuItem
      Caption = #21462#28040#23457#26680
      OnClick = mniCancelAuditClick
    end
    object mniAuditInfo: TMenuItem
      Caption = #23457#25209#20449#24687
      OnClick = mniAuditInfoClick
    end
    object mniN1: TMenuItem
      Caption = '---------------'
    end
    object mniReBack: TMenuItem
      Caption = #36864#22238
      OnClick = mniReBackClick
    end
  end
  inherited cdsMainWhereInit: TClientDataSet
    Left = 312
    Top = 80
  end
  object dsDetail: TDataSource
    DataSet = cdsDetail
    Left = 448
    Top = 288
  end
  object cdsDetail: TClientDataSet
    Aggregates = <>
    Params = <>
    ReadOnly = True
    Left = 360
    Top = 296
  end
  object qry1: TADOQuery
    ConnectionString = 
      'FILE NAME=C:\Program Files\Common Files\System\Ole DB\Data Links' +
      '\8.112.udl'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     dbo.Data0468.RKEY, dbo.Data0468.FLOW_NO, dbo.Data0468' +
        '.STEP, dbo.Data0468.DEPT_PTR, dbo.Data0468.INVENT_PTR, '
      
        '                      dbo.Data0017.INV_PART_NUMBER, dbo.Data0017' +
        '.INV_PART_DESCRIPTION, dbo.Data0468.QUAN_BOM, dbo.Data0468.QUAN_' +
        'ISSUED, '
      
        '                      dbo.Data0002.UNIT_NAME, dbo.Data0468.STATU' +
        'S, dbo.Data0468.VENDOR'
      'FROM         dbo.Data0002 INNER JOIN'
      
        '                      dbo.Data0017 ON dbo.Data0002.RKEY = dbo.Da' +
        'ta0017.STOCK_UNIT_PTR INNER JOIN'
      
        '                      dbo.Data0468 ON dbo.Data0017.RKEY = dbo.Da' +
        'ta0468.INVENT_PTR'
      'where  1=0')
    Left = 240
    Top = 136
    object strngfldqry1INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object strngfldqry1INV_PART_DESCRIPTION: TStringField
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object fltfldqry1QUAN_BOM: TFloatField
      FieldName = 'QUAN_BOM'
    end
    object fltfldqry1QUAN_ISSUED: TFloatField
      FieldName = 'QUAN_ISSUED'
    end
    object strngfldqry1UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object smlntfldqry1STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object strngfldqry1VENDOR: TStringField
      FieldName = 'VENDOR'
      Size = 30
    end
  end
  object cdstempt: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 528
    Top = 24
  end
end
