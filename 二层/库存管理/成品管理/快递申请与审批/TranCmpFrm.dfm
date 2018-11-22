object frmTranBaseInfo: TfrmTranBaseInfo
  Left = 402
  Top = 276
  Width = 686
  Height = 444
  Caption = #24555#36882#20844#21496
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl2: TPanel
    Left = 0
    Top = 0
    Width = 449
    Height = 406
    Align = alLeft
    TabOrder = 0
    object eh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 447
      Height = 404
      Align = alClient
      DataSource = ds818
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = 'TranCode'
          Footers = <>
          Title.Caption = #20195#30721
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'TranEasyName'
          Footers = <>
          Title.Caption = #31616#31216
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'TranName'
          Footers = <>
          Title.Caption = #24555#36882#20844#21496#20840#31216
          Width = 180
        end
        item
          EditButtons = <>
          FieldName = 'RegCode'
          Footers = <>
          Title.Caption = #20851#32852#36134#21495
          Width = 80
        end>
    end
  end
  object pnl3: TPanel
    Left = 449
    Top = 0
    Width = 221
    Height = 406
    Align = alClient
    TabOrder = 1
    object lbl1: TLabel
      Left = 24
      Top = 80
      Width = 36
      Height = 13
      Caption = #20195#30721#65306
    end
    object lbl2: TLabel
      Left = 24
      Top = 120
      Width = 36
      Height = 13
      Caption = #31616#31216#65306
    end
    object lbl3: TLabel
      Left = 24
      Top = 179
      Width = 36
      Height = 13
      Caption = #20840#31216#65306
    end
    object lbl4: TLabel
      Left = 27
      Top = 151
      Width = 60
      Height = 13
      Caption = #20851#32852#36134#21495#65306
    end
    object btn1: TButton
      Left = 71
      Top = 26
      Width = 75
      Height = 25
      Caption = #26032#22686
      TabOrder = 0
      OnClick = btn1Click
    end
    object btn2: TButton
      Left = 78
      Top = 320
      Width = 75
      Height = 25
      Caption = #20445#23384
      TabOrder = 1
      OnClick = btn2Click
    end
    object edttrancode: TEdit
      Left = 64
      Top = 76
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'edttrancode'
    end
    object edttraneasyname: TEdit
      Left = 64
      Top = 115
      Width = 121
      Height = 21
      TabOrder = 3
      Text = 'edttraneasyname'
    end
    object edtRegCode: TEdit
      Left = 96
      Top = 144
      Width = 89
      Height = 21
      TabOrder = 4
      Text = 'edtRegCode'
    end
    object mmoFullName: TMemo
      Left = 24
      Top = 200
      Width = 161
      Height = 81
      Lines.Strings = (
        'mmoFullName')
      TabOrder = 5
    end
  end
  object ads818: TADODataSet
    Connection = dm1.con1
    AfterScroll = ads818AfterScroll
    CommandText = 'select * from data0818'
    Parameters = <>
    Left = 56
    Top = 120
    object ads818TranCode: TStringField
      FieldName = 'TranCode'
      Size = 50
    end
    object ads818TranName: TStringField
      FieldName = 'TranName'
      Size = 250
    end
    object ads818TranEasyName: TStringField
      FieldName = 'TranEasyName'
      Size = 250
    end
    object ads818RegCode: TStringField
      FieldName = 'RegCode'
      Size = 150
    end
  end
  object ds818: TDataSource
    DataSet = ads818
    Left = 104
    Top = 120
  end
end
