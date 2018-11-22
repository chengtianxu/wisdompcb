inherited frmReportBind_Mod664: TfrmReportBind_Mod664
  Left = 512
  Top = 179
  Caption = #25253#34920#32465#23450
  ClientHeight = 601
  ClientWidth = 467
  ExplicitLeft = 512
  ExplicitTop = 179
  ExplicitWidth = 483
  ExplicitHeight = 639
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 467
    Height = 601
    ExplicitWidth = 467
    ExplicitHeight = 601
    inherited pnlDisplayMain: TPanel
      Width = 467
      Height = 601
      ExplicitWidth = 467
      ExplicitHeight = 601
      inherited pnlChildMain: TPanel
        Width = 465
        Height = 599
        ExplicitWidth = 465
        ExplicitHeight = 599
        inherited pnlEhMainDisplay: TPanel
          Width = 463
          Height = 568
          ExplicitWidth = 463
          ExplicitHeight = 568
          inherited ehMain: TDBGridEh
            Width = 461
            Height = 566
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'group_name'
                Footers = <>
                Title.Caption = #31867#22411#32534#30721
                Width = 85
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'group_desc'
                Footers = <>
                Title.Caption = #31867#22411#21517#31216
                Width = 153
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'reportname_c'
                Footers = <>
                Title.Caption = #25253#34920#21517#31216
                Width = 187
              end>
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 463
          ExplicitWidth = 463
          inherited lblFilter: TLabel
            Left = 92
            Top = 7
            Caption = #31867#22411#32534#30721
            ExplicitLeft = 92
            ExplicitTop = 7
          end
          inherited btnRefresh: TBitBtn
            Left = 518
            Align = alCustom
            Visible = False
            ExplicitLeft = 518
          end
          inherited btnExportToExcel: TBitBtn
            Left = 398
            Align = alRight
            Visible = False
            ExplicitLeft = 589
            ExplicitTop = -5
          end
          inherited btnQry: TBitBtn
            Left = 582
            Align = alCustom
            Visible = False
            ExplicitLeft = 582
          end
          inherited btnZD: TBitBtn
            Left = 518
            Align = alCustom
            Visible = False
            ExplicitLeft = 518
          end
          inherited edtFliter: TEdit
            Left = 146
            Width = 143
            ExplicitLeft = 146
            ExplicitWidth = 143
          end
          inherited btnDY: TBitBtn
            Left = 582
            Align = alCustom
            ExplicitLeft = 582
          end
          inherited btnAuthDispatch: TBitBtn
            Left = 333
            Align = alRight
            Visible = False
            ExplicitLeft = 566
          end
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    CommandText = 
      'select data0395.rkey496,data0395.reportname_c,data0496.group_nam' +
      'e,data0496.group_desc '#13#10'from data0395 inner join data0496 on dat' +
      'a0395.rkey496=data0496.rkey'
    Left = 48
    Top = 392
  end
  inherited dsMain: TDataSource
    Left = 96
    Top = 392
  end
  inherited pmZD: TPopupMenu
    Left = 232
    Top = 80
  end
  inherited xpmnfst1: TXPManifest
    Left = 160
    Top = 80
  end
  inherited pmMain: TPopupMenu
    Left = 240
    Top = 272
    object mniadd: TMenuItem
      Caption = #26032#22686
      OnClick = mniaddClick
    end
    object mniDel: TMenuItem
      Caption = #21024#38500
      OnClick = mniDelClick
    end
  end
  inherited cdsMainWhereInit: TClientDataSet
    Left = 72
    Top = 64
  end
end
