inherited frmPackPrintEdit_525: TfrmPackPrintEdit_525
  Caption = #26631#31614#23383#27573#35774#35745
  ClientHeight = 637
  ClientWidth = 1118
  OnClose = FormClose
  ExplicitWidth = 1134
  ExplicitHeight = 676
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Top = 38
    Width = 1118
    Height = 599
    inherited pnlDisplayMain: TPanel
      Width = 1118
      Height = 599
      inherited pnlChildMain: TPanel
        Width = 1116
        Height = 597
        inherited pnlEhMainDisplay: TPanel
          Width = 1114
          Height = 595
          inherited ehMain: TDBGridEh
            Width = 1112
            Height = 593
            ReadOnly = False
          end
        end
      end
    end
  end
  object pnl1: TPanel [1]
    Left = 0
    Top = 0
    Width = 1118
    Height = 38
    Align = alTop
    TabOrder = 1
    object btnSave: TButton
      Left = 1
      Top = 1
      Width = 75
      Height = 36
      Align = alLeft
      Caption = #20445#23384
      TabOrder = 0
      OnClick = btnSaveClick
      ExplicitLeft = 96
      ExplicitTop = 10
      ExplicitHeight = 25
    end
    object btnCancel: TButton
      Left = 76
      Top = 1
      Width = 75
      Height = 36
      Align = alLeft
      Caption = #21462#28040
      TabOrder = 1
      OnClick = btnCancelClick
      ExplicitLeft = 208
      ExplicitTop = 10
      ExplicitHeight = 25
    end
  end
  inherited cdsMain: TClientDataSet
    CommandText = 
      'select * from Pack_PrintTypeDef where PackID = :p1'#13#10'order by Not' +
      'Null Desc,ReadOnly Desc,Seqno Asc'
    Params = <
      item
        DataType = ftUnknown
        Name = 'p1'
        ParamType = ptUnknown
      end>
  end
end
