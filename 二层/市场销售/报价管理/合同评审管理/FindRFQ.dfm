object frmFindRFQ: TfrmFindRFQ
  Left = 467
  Top = 279
  Width = 641
  Height = 410
  Caption = #26597#25214'RFQ'#36164#26009
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 625
    Height = 43
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 92
      Top = 16
      Width = 6
      Height = 12
      Alignment = taRightJustify
    end
    object sbtnRefresh: TSpeedButton
      Left = 228
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
    object edtRFQNo: TEdit
      Left = 101
      Top = 11
      Width = 121
      Height = 20
      TabOrder = 0
      OnChange = edtRFQNoChange
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 43
    Width = 625
    Height = 329
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object DBGridEh1: TDBGridEh
      Left = 0
      Top = 0
      Width = 625
      Height = 288
      Align = alClient
      DataSource = dm.dsFindRFQ
      FooterColor = clWindow
      FooterFont.Charset = ANSI_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -12
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnDblClick = DBGridEh1DblClick
      OnTitleClick = DBGridEh1TitleClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'RKEY'
          Footers = <>
          Title.Alignment = taCenter
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'RFQNo'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'Status'
          Footers = <>
          Title.Alignment = taCenter
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'Cust_Id'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'Cust_Name'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'Cust_Addr'
          Footers = <>
          Title.Alignment = taCenter
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'SalesMan'
          Footers = <>
          Title.Alignment = taCenter
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'TechContact'
          Footers = <>
          Title.Alignment = taCenter
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'Tel'
          Footers = <>
          Title.Alignment = taCenter
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'Mail'
          Footers = <>
          Title.Alignment = taCenter
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'FileName'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'FilePath'
          Footers = <>
          Title.Alignment = taCenter
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'PartsId'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'POType'
          Footers = <>
          Title.Alignment = taCenter
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'CreateId'
          Footers = <>
          Title.Alignment = taCenter
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'CreateDate'
          Footers = <>
          Title.Alignment = taCenter
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'LastModifyId'
          Footers = <>
          Title.Alignment = taCenter
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'LastModifyDate'
          Footers = <>
          Title.Alignment = taCenter
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'AuditId'
          Footers = <>
          Title.Alignment = taCenter
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'AuditDate'
          Footers = <>
          Title.Alignment = taCenter
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'TPOType'
          Footers = <>
          Title.Alignment = taCenter
        end>
    end
    object Panel3: TPanel
      Left = 0
      Top = 288
      Width = 625
      Height = 41
      Align = alBottom
      TabOrder = 1
      DesignSize = (
        625
        41)
      object Button1: TButton
        Left = 226
        Top = 8
        Width = 75
        Height = 25
        Anchors = [akTop]
        Caption = #30830#23450
        ModalResult = 1
        TabOrder = 0
      end
      object Button2: TButton
        Left = 323
        Top = 9
        Width = 75
        Height = 25
        Anchors = [akTop]
        Caption = #21462#28040
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
end
