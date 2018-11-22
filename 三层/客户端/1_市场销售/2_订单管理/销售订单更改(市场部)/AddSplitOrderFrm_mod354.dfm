inherited frmAddSplitOrder_mod354: TfrmAddSplitOrder_mod354
  Caption = #26032#22686#25286#20998#35746#21333
  ClientHeight = 227
  ClientWidth = 274
  ExplicitWidth = 290
  ExplicitHeight = 266
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 274
    Height = 227
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 274
    ExplicitHeight = 227
    inherited pnl1: TPanel
      Width = 272
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 272
      inherited btnSave: TBitBtn
        OnClick = btnSaveClick
      end
      inherited btnSaveAll: TBitBtn
        Left = 181
        Align = alRight
        ExplicitLeft = 181
      end
      inherited btnCheck: TBitBtn
        Left = 211
        Align = alRight
        ExplicitLeft = 211
      end
      inherited btnPrint: TBitBtn
        Left = 241
        Align = alRight
        ExplicitLeft = 241
      end
    end
    inherited pnl2: TPanel
      Width = 272
      Height = 192
      ExplicitTop = 34
      ExplicitWidth = 272
      ExplicitHeight = 192
      object lbl1: TLabel
        Left = 63
        Top = 23
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = #35746#21333#32534#21495':'
      end
      object lbl2: TLabel
        Left = 37
        Top = 50
        Width = 78
        Height = 13
        Alignment = taRightJustify
        Caption = #35746#21333#25968#37327'(SET):'
      end
      object lbl3: TLabel
        Left = 63
        Top = 108
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = #23458#25143#20132#26399':'
      end
      object lbl4: TLabel
        Left = 63
        Top = 136
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = #35745#21010#20132#26399':'
      end
      object lbl5: TLabel
        Left = 36
        Top = 79
        Width = 79
        Height = 13
        Alignment = taRightJustify
        Caption = #35746#21333#25968#37327'(PCS):'
      end
      object edt_orderNO: TEdit
        Left = 122
        Top = 19
        Width = 97
        Height = 21
        TabOrder = 0
        OnExit = edt_orderNOExit
        OnKeyDown = edt_orderNOKeyDown
      end
      object edt_QtySet: TEdit
        Left = 123
        Top = 47
        Width = 96
        Height = 21
        TabOrder = 1
        Text = '0'
        OnExit = edt_QtySetExit
        OnKeyDown = edt_QtySetKeyDown
        OnKeyPress = edt_QtySetKeyPress
      end
      object edt_CustDate: TMaskEdit
        Left = 121
        Top = 103
        Width = 98
        Height = 21
        EditMask = '!0000/90/90;1;_'
        MaxLength = 10
        TabOrder = 2
        Text = '    -  -  '
        OnExit = edt_CustDateExit
        OnKeyDown = edt_CustDateKeyDown
      end
      object edt_PDate: TMaskEdit
        Left = 121
        Top = 130
        Width = 99
        Height = 21
        EditMask = '!0000/90/90;1;_'
        MaxLength = 10
        TabOrder = 3
        Text = '    -  -  '
        OnExit = edt_PDateExit
        OnKeyDown = edt_PDateKeyDown
      end
      object edt_QtyPcs: TEdit
        Left = 121
        Top = 76
        Width = 98
        Height = 21
        TabOrder = 4
        Text = '0'
        OnExit = edt_QtyPcsExit
        OnKeyDown = edt_QtyPcsKeyDown
        OnKeyPress = edt_QtyPcsKeyPress
      end
    end
  end
end
