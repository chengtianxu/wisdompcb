object frm_marej: Tfrm_marej
  Left = 437
  Top = 201
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26448#26009#25298#25910#21697#25628#32034
  ClientHeight = 489
  ClientWidth = 428
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 100
    Top = 13
    Width = 65
    Height = 13
    Caption = #25298#25910#21697#20195#30721
  end
  object Edit1: TEdit
    Left = 168
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 40
    Width = 425
    Height = 393
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGridEh1DblClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'CODE'
        Footers = <>
        Title.Caption = #25298#25910#21697#20195#30721
        Width = 107
      end
      item
        EditButtons = <>
        FieldName = 'REJECT_DESCRIPTION'
        Footers = <>
        Title.Caption = #25298#25910#21697#25551#36848
        Width = 252
      end
      item
        EditButtons = <>
        FieldName = 'RKEY'
        Footers = <>
        Visible = False
      end>
  end
  object Button1: TButton
    Left = 104
    Top = 448
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 2
  end
  object Button2: TButton
    Left = 216
    Top = 448
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 3
  end
  object BitBtn1: TBitBtn
    Left = 296
    Top = 8
    Width = 25
    Height = 25
    TabOrder = 4
    OnClick = BitBtn1Click
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000120B0000120B00001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
      DADABFBFBDADADADADADDADADBFADADADADAADADAD000DADADADDADAD0FBF0DA
      DADAADAD0F7FBF0DADADDAD0F7F87BF0DADAAD0F7F87BFB70DADD0F7F87BFB78
      80DA000F87BFB78880ADDAD00BFB78880ADAADADA0B7888740ADDADADA088804
      440AADADADA000A04440DADADADADADA0440ADADADADADADA00D}
  end
  object ADS76: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 'SELECT     RKEY, CODE, REJECT_DESCRIPTION'#13#10'FROM         Data0076'
    IndexFieldNames = 'CODE'
    Parameters = <>
    Left = 216
    Top = 168
    object ADS76RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADS76CODE: TStringField
      FieldName = 'CODE'
      Size = 5
    end
    object ADS76REJECT_DESCRIPTION: TStringField
      FieldName = 'REJECT_DESCRIPTION'
      Size = 30
    end
  end
  object DataSource1: TDataSource
    DataSet = ADS76
    Left = 152
    Top = 160
  end
end
