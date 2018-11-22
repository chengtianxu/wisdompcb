object frmSetItem: TfrmSetItem
  Left = 380
  Top = 219
  Width = 459
  Height = 376
  Caption = #22522#30784#36164#26009#35774#32622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 375
    Height = 349
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 375
      Height = 349
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = #25253#20215#31867#22411#23450#20041
        object DBGridEh1: TDBGridEh
          Left = 0
          Top = 0
          Width = 367
          Height = 321
          Align = alClient
          DataSource = dm.dsSetItem
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
              FieldName = 'Code'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #25253#20215#31867#22411#20195#30721
              Width = 90
            end
            item
              EditButtons = <>
              FieldName = 'Name'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #25253#20215#31867#22411#21517#31216
              Width = 138
            end
            item
              EditButtons = <>
              FieldName = 'Time'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #26631#20934#26102#38388'('#20998#38047')'
              Width = 90
            end>
        end
      end
      object TabSheet2: TTabSheet
        Caption = #25509#25910#28040#24687#20154#21592#23450#20041
        ImageIndex = 1
        object DBGridEh2: TDBGridEh
          Left = 0
          Top = 0
          Width = 367
          Height = 321
          Align = alClient
          DataSource = dm.ds244
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
              FieldName = 'USER_FULL_NAME'
              Footers = <>
              Title.Alignment = taCenter
            end>
        end
      end
      object TabSheet3: TTabSheet
        Caption = #20135#21697#29992#36884
        ImageIndex = 2
        object DBGridEh3: TDBGridEh
          Left = 0
          Top = 0
          Width = 367
          Height = 321
          Align = alClient
          DataSource = dm.ds247
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
              FieldName = 'ProdUsageID'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #20135#21697#29992#36884#20195#30721
              Width = 94
            end
            item
              EditButtons = <>
              FieldName = 'ProdUsageName'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #24212#29992#39046#22495
            end>
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 375
    Top = 0
    Width = 76
    Height = 349
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    object btnAppend: TBitBtn
      Left = 1
      Top = 40
      Width = 75
      Height = 31
      Caption = #26032#22686
      TabOrder = 0
      OnClick = btnAppendClick
    end
    object btnEdit: TBitBtn
      Left = 1
      Top = 96
      Width = 75
      Height = 31
      Caption = #32534#36753
      TabOrder = 1
      OnClick = btnEditClick
    end
    object btnSave: TBitBtn
      Left = 1
      Top = 153
      Width = 75
      Height = 31
      Caption = #20445#23384
      TabOrder = 2
      OnClick = btnSaveClick
    end
    object btnDelete: TBitBtn
      Left = 1
      Top = 211
      Width = 75
      Height = 31
      Caption = #21024#38500
      TabOrder = 3
      OnClick = btnDeleteClick
    end
  end
end
