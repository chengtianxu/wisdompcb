object frmFSHReq1: TfrmFSHReq1
  Left = 596
  Top = 370
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #21453#23457#26680#30003#35831
  ClientHeight = 226
  ClientWidth = 390
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 390
    Height = 226
    Align = alClient
    TabOrder = 0
    object lbl1: TLabel
      Left = 24
      Top = 88
      Width = 48
      Height = 13
      Caption = #30003#35831#20154#65306
    end
    object lbl2: TLabel
      Left = 24
      Top = 120
      Width = 60
      Height = 13
      Caption = #30003#35831#26102#38388#65306
    end
    object lbl3: TLabel
      Left = 24
      Top = 152
      Width = 60
      Height = 13
      Caption = #30003#35831#35828#26126#65306
    end
    object lbl6: TLabel
      Left = 24
      Top = 16
      Width = 60
      Height = 13
      Caption = #25253#24223#21333#21495#65306
    end
    object lbl4: TLabel
      Left = 200
      Top = 16
      Width = 60
      Height = 13
      Caption = #32570#38519#20195#30721#65306
    end
    object lbl5: TLabel
      Left = 24
      Top = 45
      Width = 60
      Height = 13
      Caption = #25253#24223#26102#38388#65306
    end
    object lbl7: TLabel
      Left = 200
      Top = 45
      Width = 60
      Height = 13
      Caption = #25253#24223#25968#37327#65306
    end
    object lblBFDH: TLabel
      Left = 90
      Top = 16
      Width = 16
      Height = 13
      Caption = '----'
    end
    object lblBFSJ: TLabel
      Left = 90
      Top = 45
      Width = 16
      Height = 13
      Caption = '----'
    end
    object lblQXDM: TLabel
      Left = 266
      Top = 16
      Width = 16
      Height = 13
      Caption = '----'
    end
    object lblBFSL: TLabel
      Left = 266
      Top = 45
      Width = 16
      Height = 13
      Caption = '----'
    end
    object lbl8: TLabel
      Left = 232
      Top = 97
      Width = 60
      Height = 13
      Caption = #25509#25910#24037#24207#65306
    end
    object btn1: TButton
      Left = 160
      Top = 185
      Width = 75
      Height = 25
      Caption = #25552#20132#30003#35831
      TabOrder = 0
      OnClick = btn1Click
    end
    object edtSQR: TEdit
      Left = 90
      Top = 85
      Width = 121
      Height = 21
      Color = clSilver
      ReadOnly = True
      TabOrder = 1
    end
    object edtSQTime: TEdit
      Left = 90
      Top = 117
      Width = 121
      Height = 21
      Color = clSilver
      ReadOnly = True
      TabOrder = 2
    end
    object edtSQSM: TEdit
      Left = 90
      Top = 149
      Width = 263
      Height = 21
      TabOrder = 3
    end
    object edtJSGX: TEdit
      Left = 232
      Top = 115
      Width = 121
      Height = 21
      Color = clSilver
      ReadOnly = True
      TabOrder = 4
    end
  end
  object sp1: TADOStoredProc
    Connection = dm1.con1
    ProcedureName = 'AddFSHReq'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
      end
      item
        Name = '@A58Rkey'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
      end
      item
        Name = '@ARkey05'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
      end
      item
        Name = '@ABakNote'
        Attributes = [paNullable]
        DataType = ftString
        Size = 200
      end
      item
        Name = '@LErrMsg'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
      end>
    Left = 304
    Top = 72
  end
end
