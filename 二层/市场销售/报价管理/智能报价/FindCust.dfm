object frmFindCust: TfrmFindCust
  Left = 336
  Top = 268
  Width = 414
  Height = 329
  Caption = #26597#25214#23458#25143
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 398
    Height = 43
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 48
      Height = 12
      Caption = #23458#25143#21517#31216
    end
    object sbtnRefresh: TSpeedButton
      Left = 193
      Top = 10
      Width = 21
      Height = 22
      Hint = #21047#26032
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        8080800000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000FFFF00000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000080808000FFFF0000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000080808000FFFF00000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000808080FFFFFF00FFFF0000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000808080FFFFFF00
        FFFF000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000FFFFFF00FFFF0000000000000000000000
        00000000000000000000000000000000808080C0C0C0FFFFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF000000000000000000000000000000000000000000000000
        000000808080C0C0C0FFFFFF00FFFF0000000000000000000000000000000000
        00000000000000000000000000000000000000000000808080C0C0C0FFFFFF00
        FFFF000000000000000000000000000000000000000000000000000000000000
        000000000000808080C0C0C0FFFFFFFFFFFF00FFFF0000000000000000000000
        00000000000000000000000000000000000000000000000000808080C0C0C0FF
        FFFFFFFFFF00FFFF000000000000000000000000000000000000000000000000
        000000000000000000000000808080C0C0C0FFFFFFFFFFFF00FFFF0000000000
        00000000000000000000000000000000000000000000000000000000808080C0
        C0C0FFFFFFFFFFFFFFFFFF00FFFF000000000000000000000000}
      ParentShowHint = False
      ShowHint = True
      OnClick = sbtnRefreshClick
    end
    object edtCust: TEdit
      Left = 66
      Top = 11
      Width = 121
      Height = 20
      TabOrder = 0
      OnChange = edtCustChange
    end
    object rdgCondition: TRadioGroup
      Left = 218
      Top = 2
      Width = 188
      Height = 34
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        #23458#25143#20195#30721
        #23458#25143#21517#31216)
      TabOrder = 1
      Visible = False
      OnClick = rdgConditionClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 43
    Width = 398
    Height = 248
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object DBGridEh1: TDBGridEh
      Left = 0
      Top = 0
      Width = 398
      Height = 248
      Align = alClient
      DataSource = dm.dsFindCust
      FooterColor = clWindow
      FooterFont.Charset = GB2312_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -12
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnDblClick = DBGridEh1DblClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'CUST_CODE'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'CUSTOMER_NAME'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'BILLING_ADDRESS_1'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'SALES_REP_NAME'
          Footers = <>
          Title.Alignment = taCenter
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'CURR_CODE'
          Footers = <>
          Title.Alignment = taCenter
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'PHONE'
          Footers = <>
          Title.Alignment = taCenter
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'FAX'
          Footers = <>
          Title.Alignment = taCenter
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'GEN_EMAIL_ADDRESS'
          Footers = <>
          Title.Alignment = taCenter
          Visible = False
        end>
    end
    object DBGridEh2: TDBGridEh
      Left = 0
      Top = 96
      Width = 406
      Height = 163
      DataSource = dm.dsParamName
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
      OnDblClick = DBGridEh1DblClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'PARAMETER_NAME'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #21442#25968#21517#31216
          Width = 107
        end
        item
          EditButtons = <>
          FieldName = 'PARAMETER_DESC'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #21442#25968#25551#36848
          Width = 197
        end
        item
          EditButtons = <>
          FieldName = 'UNIT_CODE'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #21333#20301
          Width = 66
        end>
    end
  end
end
