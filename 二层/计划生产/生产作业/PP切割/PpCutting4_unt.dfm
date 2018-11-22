object PpCutting4_frm: TPpCutting4_frm
  Left = 323
  Top = 323
  BorderStyle = bsDialog
  Caption = #36873#25321#26448#26009
  ClientHeight = 290
  ClientWidth = 895
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object pnl2: TPanel
    Left = 0
    Top = 25
    Width = 895
    Height = 265
    Align = alClient
    BevelOuter = bvNone
    Caption = 'pnl2'
    TabOrder = 0
    object Panel1: TPanel
      Left = 0
      Top = 224
      Width = 895
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      object bt_OK: TButton
        Left = 258
        Top = 8
        Width = 75
        Height = 25
        Caption = #30830#23450
        ModalResult = 1
        TabOrder = 0
      end
      object Button2: TButton
        Left = 389
        Top = 8
        Width = 75
        Height = 25
        Caption = #21462#28040
        TabOrder = 1
        OnClick = Button2Click
      end
    end
    object Dgh1: TDBGridEh
      Left = 0
      Top = 0
      Width = 895
      Height = 224
      Align = alClient
      DataSource = ds1
      FooterColor = clWindow
      FooterFont.Charset = GB2312_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -12
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnDblClick = dgh1DblClick
      OnTitleClick = dgh1TitleClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'ABBR_NAME'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'QUAN_ON_HAND_1'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'QUAN_ON_HAND_2'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'REF_NUMBER'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'EXPIRE_DATE'
          Footers = <>
          Width = 73
        end
        item
          EditButtons = <>
          FieldName = 'SUPPLIER2'
          Footers = <>
          Width = 85
        end
        item
          EditButtons = <>
          FieldName = 'BARCODE_ID'
          Footers = <>
          Width = 87
        end
        item
          EditButtons = <>
          FieldName = 'INV_PART_NUMBER'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'INV_NAME'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'INV_DESCRIPTION'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'UNIT_CODE'
          Footers = <>
        end>
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 895
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object bt1: TSpeedButton
      Left = 236
      Top = 2
      Width = 24
      Height = 22
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF005656560056565600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005656
        560092DC00007AB9000026262600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003E3E
        3E007AB90000AAFF25007AB9000026262600FFFFFF00FFFFFF00FFFFFF000000
        0000000000000000000000000000000000000000000056565600FFFFFF00FFFF
        FF003E3E3E0062960000AAFF25006296000056565600FFFFFF00FFFFFF003E3E
        3E007AB900007AB90000629600006296000056565600FFFFFF00FFFFFF00FFFF
        FF00FFFFFF005656560092DC000092DC000056565600FFFFFF00FFFFFF003E3E
        3E00C6FF6B008FFF6B007AB900006E6E6E00B6B6B600FFFFFF00FFFFFF00FFFF
        FF00FFFFFF007A7A7A007AB90000AAFF250026262600FFFFFF00FFFFFF003E3E
        3E00D4FF8E00ABFF8E00B8FF48006296000056565600FFFFFF00FFFFFF00FFFF
        FF00FFFFFF007A7A7A007AB90000D4FF8E0026262600FFFFFF00FFFFFF003E3E
        3E00E2FFB100AAAAAA0092DC0000AAFF25006296000056565600FFFFFF00FFFF
        FF00FFFFFF00565656007AB90000AAFF250026262600FFFFFF00FFFFFF005656
        560056565600B6B6B6005656560092DC0000D4FF8E0062960000565656003E3E
        3E003E3E3E006296000092DC000092DC000056565600FFFFFF00FFFFFF005656
        5600FFFFFF00FFFFFF00FFFFFF00565656007AB90000D4FF8E007AB900007AB9
        00007AB900007AB9000092DC0000629600007A7A7A00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00565656007AB9000092DC0000AAFF
        2500AAFF2500AAFF25007AB9000056565600FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007A7A7A00565656005656
        560056565600565656007A7A7A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      OnClick = bt1Click
    end
    object Label1: TLabel
      Left = 76
      Top = 5
      Width = 36
      Height = 12
      Caption = 'Label1'
    end
    object Edit1: TEdit
      Left = 112
      Top = 2
      Width = 122
      Height = 20
      TabOrder = 0
      OnChange = Edit1Change
    end
    object CheckBox2: TCheckBox
      Left = 280
      Top = 5
      Width = 97
      Height = 17
      Caption = #31934#30830#26597#25214
      TabOrder = 1
    end
  end
  object ds1: TDataSource
    DataSet = PpCutting_1_frm.cds0730
    Left = 136
    Top = 97
  end
end
