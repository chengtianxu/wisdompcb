inherited frmMeasureEdit_Mod664: TfrmMeasureEdit_Mod664
  Left = 953
  Top = 335
  Caption = #32534#36753#27979#37327#25968#25454
  ClientHeight = 265
  ClientWidth = 371
  ExplicitWidth = 387
  ExplicitHeight = 304
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 371
    Height = 265
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 371
    ExplicitHeight = 265
    inherited pnl1: TPanel
      Width = 369
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 369
      inherited btnSave: TBitBtn
        OnClick = btnSaveClick
      end
      inherited btnClose: TBitBtn
        ModalResult = 2
      end
    end
    inherited pnl2: TPanel
      Width = 369
      Height = 230
      ExplicitLeft = 1
      ExplicitTop = 34
      ExplicitWidth = 369
      ExplicitHeight = 230
      object Label1: TLabel
        Left = 37
        Top = 62
        Width = 42
        Height = 13
        Caption = #20301#32622'1'#65306
      end
      object Label2: TLabel
        Left = 202
        Top = 62
        Width = 42
        Height = 13
        Caption = #20301#32622'2'#65306
      end
      object Label3: TLabel
        Left = 37
        Top = 94
        Width = 42
        Height = 13
        Caption = #20301#32622'3'#65306
      end
      object Label4: TLabel
        Left = 202
        Top = 97
        Width = 42
        Height = 13
        Caption = #20301#32622'4'#65306
      end
      object Label5: TLabel
        Left = 37
        Top = 126
        Width = 42
        Height = 13
        Caption = #20301#32622'5'#65306
      end
      object Label6: TLabel
        Left = 202
        Top = 129
        Width = 42
        Height = 13
        Caption = #20301#32622'6'#65306
      end
      object Label7: TLabel
        Left = 37
        Top = 159
        Width = 42
        Height = 13
        Caption = #20301#32622'7'#65306
      end
      object Label8: TLabel
        Left = 202
        Top = 159
        Width = 42
        Height = 13
        Caption = #20301#32622'8'#65306
      end
      object Label9: TLabel
        Left = 37
        Top = 187
        Width = 165
        Height = 13
        Caption = '* '#21508#20301#32622#27979#37327#21333#20301#22343#20026#27627#31859'(mm)'
      end
      object Label10: TLabel
        Left = 68
        Top = 28
        Width = 12
        Height = 13
        Caption = #31532
      end
      object Label11: TLabel
        Left = 141
        Top = 28
        Width = 72
        Height = 13
        Caption = #24352#26495#27979#37327#25968#25454
      end
      object edtMeasure_1: TEdit
        Left = 86
        Top = 59
        Width = 81
        Height = 21
        Hint = #20301#32622'1'
        TabOrder = 0
        OnExit = edtMeasure_1Exit
        OnKeyPress = edtMeasure_1KeyPress
      end
      object edtMeasure_2: TEdit
        Left = 253
        Top = 59
        Width = 81
        Height = 21
        Hint = #20301#32622'2'
        TabOrder = 1
        OnExit = edtMeasure_1Exit
        OnKeyPress = edtMeasure_1KeyPress
      end
      object edtMeasure_3: TEdit
        Left = 86
        Top = 91
        Width = 81
        Height = 21
        Hint = #20301#32622'3'
        TabOrder = 2
        OnExit = edtMeasure_1Exit
        OnKeyPress = edtMeasure_1KeyPress
      end
      object edtMeasure_4: TEdit
        Left = 253
        Top = 91
        Width = 81
        Height = 21
        Hint = #20301#32622'4'
        TabOrder = 3
        OnExit = edtMeasure_1Exit
        OnKeyPress = edtMeasure_1KeyPress
      end
      object edtMeasure_5: TEdit
        Left = 86
        Top = 123
        Width = 81
        Height = 21
        Hint = #20301#32622'5'
        TabOrder = 4
        OnExit = edtMeasure_1Exit
        OnKeyPress = edtMeasure_1KeyPress
      end
      object edtMeasure_6: TEdit
        Left = 253
        Top = 123
        Width = 81
        Height = 21
        Hint = #20301#32622'6'
        TabOrder = 5
        OnExit = edtMeasure_1Exit
        OnKeyPress = edtMeasure_1KeyPress
      end
      object edtMeasure_7: TEdit
        Left = 86
        Top = 155
        Width = 81
        Height = 21
        Hint = #20301#32622'7'
        TabOrder = 6
        OnExit = edtMeasure_1Exit
        OnKeyPress = edtMeasure_1KeyPress
      end
      object edtMeasure_8: TEdit
        Left = 253
        Top = 155
        Width = 81
        Height = 21
        Hint = #20301#32622'8'
        TabOrder = 7
        OnExit = edtMeasure_1Exit
        OnKeyPress = edtMeasure_1KeyPress
      end
      object edtCount: TEdit
        Left = 85
        Top = 24
        Width = 49
        Height = 21
        Hint = #24352#27425
        Enabled = False
        TabOrder = 8
      end
    end
  end
end
