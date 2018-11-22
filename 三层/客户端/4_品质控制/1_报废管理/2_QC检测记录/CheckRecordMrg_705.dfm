inherited FrmCheckRecordMrg_705: TFrmCheckRecordMrg_705
  Caption = #26816#27979#35760#24405#31649#29702
  ClientHeight = 577
  ClientWidth = 1042
  OldCreateOrder = True
  WindowState = wsMaximized
  ExplicitWidth = 1058
  ExplicitHeight = 616
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 1042
    Height = 577
    ExplicitWidth = 1042
    ExplicitHeight = 577
    inherited pnlDisplayMain: TPanel
      Width = 1042
      Height = 577
      ExplicitWidth = 1042
      ExplicitHeight = 577
      inherited pnlChildMain: TPanel
        Width = 1040
        Height = 575
        ExplicitWidth = 1040
        ExplicitHeight = 575
        inherited pnlEhMainDisplay: TPanel
          Width = 1038
          Height = 544
          ExplicitWidth = 1038
          ExplicitHeight = 544
          inherited ehMain: TDBGridEh
            Width = 1036
            Height = 542
            OnDblClick = ehMainDblClick
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'rkey'
                Footers = <>
                Visible = False
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'QCDate'
                Footers = <>
                Title.Caption = #26816#27979#26085#26399
                Width = 104
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'TypeName'
                Footers = <>
                Title.Caption = #37096#38376
                Width = 87
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'WORK_ORDER_NUMBER'
                Footers = <>
                Title.Caption = #20316#19994#21333#21495
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'MANU_PART_NUMBER'
                Footers = <>
                Title.Caption = #26412#21378#32534#21495
                Width = 130
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'QCTestName'
                Footers = <>
                Title.Caption = #27979#35797#39033#30446
                Width = 78
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'QCTestRound'
                Footers = <>
                Title.Caption = #27979#35797#27425#25968
                Width = 75
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'AllQty'
                Footers = <>
                Title.Caption = #36865#26816#25968#37327
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PassQty'
                Footers = <>
                Title.Caption = #33391#21697#25968
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'FailQty'
                Footers = <>
                Title.Caption = #19981#33391#25968
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'BakNote'
                Footers = <>
                Title.Caption = #22791#27880
                Width = 125
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'employee_name'
                Footers = <>
                Title.Caption = #24403#20837#20154#21592
                Width = 54
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'QCDateTime'
                Footers = <>
                Title.Caption = #24405#20837#26102#38388
                Width = 97
              end>
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 1038
          ExplicitWidth = 1038
          inherited lblFilter: TLabel
            Left = 523
            Top = 10
            ExplicitLeft = 523
            ExplicitTop = 10
          end
          object lbl1: TLabel [1]
            Left = 712
            Top = 7
            Width = 36
            Height = 13
            Caption = #26085#26399#65306
            Color = clBtnFace
            ParentColor = False
            Visible = False
          end
          object lbl2: TLabel [2]
            Left = 880
            Top = 7
            Width = 12
            Height = 13
            Caption = #33267
            Color = clBtnFace
            ParentColor = False
            Visible = False
          end
          inherited edtFliter: TEdit [3]
            Left = 577
            Top = 7
            Width = 108
            ExplicitLeft = 577
            ExplicitTop = 7
            ExplicitWidth = 108
          end
          inherited btnExit: TBitBtn [4]
          end
          inherited btnRefresh: TBitBtn [5]
          end
          inherited btnExportToExcel: TBitBtn [6]
          end
          inherited btnQry: TBitBtn [7]
          end
          inherited btnZD: TBitBtn [8]
            Left = 305
            Visible = False
            ExplicitLeft = 305
          end
          inherited btnDY: TBitBtn
            Left = 370
            ExplicitLeft = 370
          end
          inherited btnAuthDispatch: TBitBtn
            Left = 435
            ExplicitLeft = 435
          end
          object btnPrint: TBitBtn
            Left = 260
            Top = 0
            Width = 45
            Height = 29
            Hint = #25171#21360'MI'#25110'ECN'#23653#21382#34920'(Ctrl+P)'
            Align = alLeft
            Glyph.Data = {
              26050000424D26050000000000003604000028000000100000000F0000000100
              080000000000F000000000000000000000000001000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
              A400000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707070707
              0707070707070707070707070000000000000000000000070707070007070707
              0707070707000700070700000000000000000000000000070007000707070707
              07FBFBFB07070000000700070707070707101010070700070007000000000000
              0000000000000007070000070707070707070707070007000700070000000000
              00000000000700070000070700FFFFFFFFFFFFFFFF000700070007070700FF00
              00000000FF000000000707070700FFFFFFFFFFFFFFFF000707070707070700FF
              0000000000FF000707070707070700FFFFFFFFFFFFFFFF000707070707070700
              00000000000000000707}
            ParentShowHint = False
            ShowHint = True
            TabOrder = 8
            Visible = False
          end
          object dtp1: TDateTimePicker
            Left = 751
            Top = 3
            Width = 113
            Height = 21
            Date = 42755.000000000000000000
            Time = 42755.000000000000000000
            TabOrder = 9
            Visible = False
          end
          object dtp2: TDateTimePicker
            Left = 904
            Top = 3
            Width = 113
            Height = 21
            Date = 42755.999988425930000000
            Time = 42755.999988425930000000
            TabOrder = 10
            Visible = False
          end
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    Left = 40
    Top = 400
  end
  inherited dsMain: TDataSource
    Left = 96
    Top = 400
  end
  inherited pmZD: TPopupMenu
    Left = 688
    Top = 65528
  end
  inherited xpmnfst1: TXPManifest
    Left = 96
  end
  inherited pmMain: TPopupMenu
    Left = 648
    Top = 144
    object mni_edit: TMenuItem
      Caption = #32534#36753
      OnClick = mni_editClick
    end
    object mni_check: TMenuItem
      Caption = #26597#30475
      OnClick = mni_checkClick
    end
    object mni_Del: TMenuItem
      Caption = #21024#38500
      OnClick = mni_DelClick
    end
  end
  inherited cdsMainWhereInit: TClientDataSet
    Left = 48
    Top = 64
  end
  object test: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=62ddf8f60269678;Persist Security In' +
      'fo=True;User ID=WZPCBConnect;Initial Catalog=wisdompcb;Data Sour' +
      'ce=172.18.0.8'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select a.rkey, a.QCDate, d06.WORK_ORDER_NUMBER,d25.MANU_PART_NUM' +
        'BER,c.TypeName,a.QCTestName,QCTestRound, a.AllQty, A.PassQty, A.' +
        'FailQty,'
      'D05.employee_name,QCDateTime,BakNote'
      'from  QC_ReportMain a '
      'inner join data0006 d06 on  a.d06_ptr=d06.rkey '
      'inner join data0025 d25 on d06.BOM_PTR=d25.RKEY'
      'inner join QC_DeptBugDef c  on a.TypeID = c.ID '
      'inner join data0005 d05 on a.d05_ptr=d05.rkey'
      'where 1=0')
    Left = 72
    Top = 224
    object testrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object testQCDate: TDateTimeField
      FieldName = 'QCDate'
    end
    object testWORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object testMANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object testTypeName: TStringField
      FieldName = 'TypeName'
      Size = 50
    end
    object testQCTestName: TStringField
      FieldName = 'QCTestName'
      Size = 100
    end
    object testQCTestRound: TIntegerField
      FieldName = 'QCTestRound'
    end
    object testAllQty: TIntegerField
      FieldName = 'AllQty'
    end
    object testPassQty: TIntegerField
      FieldName = 'PassQty'
    end
    object testFailQty: TIntegerField
      FieldName = 'FailQty'
    end
    object testemployee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object testQCDateTime: TDateTimeField
      FieldName = 'QCDateTime'
    end
    object testBakNote: TStringField
      FieldName = 'BakNote'
      Size = 200
    end
  end
  object cdstempt: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 192
    Top = 304
  end
end
