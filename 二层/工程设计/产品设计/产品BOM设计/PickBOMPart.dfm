object frmPickBOMPart: TfrmPickBOMPart
  Left = 408
  Top = 202
  BorderStyle = bsDialog
  Caption = #36873#25321'BOM'#26448#26009
  ClientHeight = 277
  ClientWidth = 468
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 40
    Top = 55
    Width = 385
    Height = 163
    Shape = bsFrame
  end
  object labelroute: TLabel
    Left = 80
    Top = 32
    Width = 40
    Height = 13
    Caption = #24037#24207': '
  end
  object Label2: TLabel
    Left = 80
    Top = 73
    Width = 59
    Height = 13
    Caption = #26448#26009#32534#30721':'
  end
  object Label3: TLabel
    Left = 80
    Top = 103
    Width = 54
    Height = 13
    Caption = #21333'   '#20301':'
  end
  object Label4: TLabel
    Left = 80
    Top = 134
    Width = 59
    Height = 13
    Caption = #26448#26009#21517#31216':'
  end
  object Label5: TLabel
    Left = 80
    Top = 165
    Width = 59
    Height = 13
    Caption = #26631#20934#29992#37327':'
  end
  object labelUnit: TLabel
    Left = 144
    Top = 103
    Width = 7
    Height = 13
    Caption = ' '
  end
  object SpeedButton1: TSpeedButton
    Left = 344
    Top = 67
    Width = 22
    Height = 22
    Glyph.Data = {
      EE000000424DEE000000000000007600000028000000100000000F0000000100
      04000000000078000000130B0000130B00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      888800000888880000080F000888880F00080F000888880F0008000000080000
      000800F000000F00000800F000800F00000800F000800F000008800000000000
      0088880F00080F000888880000080000088888800088800088888880F08880F0
      888888800088800088888888888888888888}
    OnClick = SpeedButton1Click
  end
  object labelPartName: TLabel
    Left = 144
    Top = 133
    Width = 7
    Height = 13
    Caption = ' '
  end
  object ComboBox1: TComboBox
    Left = 144
    Top = 24
    Width = 193
    Height = 21
    ItemHeight = 13
    TabOrder = 0
  end
  object CheckBox1: TCheckBox
    Left = 144
    Top = 190
    Width = 97
    Height = 17
    Caption = #25171#21360#22312'MI'#19978
    TabOrder = 4
  end
  object edtPartNo: TEdit
    Left = 144
    Top = 67
    Width = 193
    Height = 21
    TabOrder = 1
    OnExit = edtPartNoExit
  end
  object edtQty: TEdit
    Left = 144
    Top = 158
    Width = 121
    Height = 21
    TabOrder = 2
    OnKeyPress = edtQtyKeyPress
  end
  object Button1: TButton
    Left = 128
    Top = 234
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 264
    Top = 234
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 5
  end
  object adsPart: TADODataSet
    Connection = dmcon.ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select M.rkey,Inv_Part_Number,Inv_Part_Description,U.Unit_Code f' +
      'rom data0017 M inner join data0002 U on M.STOCK_UNIT_PTR=U.rKey ' +
      'where M.Inv_Part_Number=:F01'
    Parameters = <
      item
        Name = 'F01'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 25
        Value = Null
      end>
    Left = 376
    Top = 128
  end
  object adsRoute: TADODataSet
    Connection = dmcon.ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'SELECT d38.Step_Number,D34.RKey,D34.DEPT_CODE, D34.DEPT_NAME'#13#10'FR' +
      'OM dbo.Data0038 D38 INNER JOIN'#13#10'      dbo.Data0034 D34 ON D38.DE' +
      'PT_PTR = D34.RKEY '#13#10'WHERE (D34.IS_COST_DEPT = 1) and D38.Source_' +
      'Ptr=:F01'#13#10
    Parameters = <
      item
        Name = 'F01'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 352
    Top = 16
  end
end
