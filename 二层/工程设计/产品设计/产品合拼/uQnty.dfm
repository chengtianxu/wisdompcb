object frmQnty: TfrmQnty
  Left = 422
  Top = 285
  Width = 544
  Height = 307
  Caption = #21512#25340'Set'#25968#37327
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 528
    Height = 228
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 24
      Width = 72
      Height = 13
      Caption = #26032#20135#21697#32534#21495#65306
    end
    object DBGridEh1: TDBGridEh
      Left = 32
      Top = 56
      Width = 473
      Height = 169
      DataSource = DataSource1
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = 'PONO'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #35746#21333#32534#21495
          Width = 118
        end
        item
          EditButtons = <>
          FieldName = 'MANU_PART_NUMBER'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #26412#21378#32534#21495
        end
        item
          EditButtons = <>
          FieldName = 'SetQty'
          Footer.ValueType = fvtCount
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = 'SET'#25968#37327
          Width = 75
        end>
    end
    object edtProdNo: TEdit
      Left = 125
      Top = 17
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 228
    Width = 528
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnOK: TBitBtn
      Left = 168
      Top = 8
      Width = 75
      Height = 25
      Caption = #30830#23450
      Default = True
      TabOrder = 0
      OnClick = btnOKClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object btnCancel: TBitBtn
      Left = 304
      Top = 8
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object cdsOrder: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 464
    Top = 24
    Data = {
      850000009619E0BD010000001800000005000000000003000000850006524B45
      593235040001000000000006524B45593630040001000000000004504F4E4F01
      0049000000010005574944544802000200140006536574517479040001000000
      0000104D414E555F504152545F4E554D42455201004900000001000557494454
      480200020014000000}
    object cdsOrderRKEY25: TIntegerField
      FieldName = 'RKEY25'
    end
    object cdsOrderRKEY60: TIntegerField
      FieldName = 'RKEY60'
    end
    object cdsOrderPONO: TStringField
      FieldName = 'PONO'
    end
    object cdsOrderSetQty: TIntegerField
      FieldName = 'SetQty'
    end
    object cdsOrderMANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsOrder
    Left = 504
    Top = 32
  end
  object aspCompare38: TADOStoredProc
    Connection = dm.con1
    ProcedureName = 'Compare_38;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@rkey25'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@rkey25_new'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 328
    Top = 24
  end
end
