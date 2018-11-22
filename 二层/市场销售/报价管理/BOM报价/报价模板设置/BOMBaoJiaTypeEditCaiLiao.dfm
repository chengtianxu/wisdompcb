object frmBomBaoJiaTypeEditCaiLiao: TfrmBomBaoJiaTypeEditCaiLiao
  Left = 0
  Top = 0
  Caption = #40664#35748#26448#26009
  ClientHeight = 336
  ClientWidth = 534
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnl11: TRzPanel
    Left = 0
    Top = 0
    Width = 534
    Height = 44
    Align = alTop
    TabOrder = 0
    object lbl17: TRzLabel
      Left = 2
      Top = 2
      Width = 530
      Height = 13
      Align = alTop
      Alignment = taCenter
      Caption = #24037#24207#19968#31867#26448#26009
      ExplicitWidth = 72
    end
    object lbl38: TRzLabel
      Left = 52
      Top = 21
      Width = 60
      Height = 13
      Caption = #26448#26009#31867#22411#65306
    end
    object btn4: TSpeedButton
      Left = 436
      Top = 16
      Width = 23
      Height = 22
      Caption = #36873
      OnClick = btn4Click
    end
    object cbx1: TRzComboBox
      Left = 123
      Top = 17
      Width = 306
      Height = 21
      Style = csDropDownList
      TabOrder = 0
    end
  end
  object eh3: TDBGridEh
    Left = 0
    Top = 44
    Width = 534
    Height = 251
    Align = alClient
    DataSource = dsBP15
    DynProps = <>
    IndicatorOptions = [gioShowRowIndicatorEh]
    PopupMenu = pm1
    TabOrder = 1
    Columns = <
      item
        ButtonStyle = cbsNone
        DynProps = <>
        EditButtons = <>
        FieldName = 'MGroupname'
        Footers = <>
        Title.Caption = #31867#21035#20195#30721
        Width = 70
      end
      item
        ButtonStyle = cbsNone
        DynProps = <>
        EditButtons = <>
        FieldName = 'MGroupDesc'
        Footers = <>
        Title.Caption = #31867#21035#21517#31216
        Width = 102
      end
      item
        AlwaysShowEditButton = True
        ButtonStyle = cbsEllipsis
        DynProps = <>
        EditButtons = <>
        FieldName = 'MName'
        Footers = <>
        Title.Caption = #19968#31867#26448#26009
        Width = 220
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'beishu'
        Footers = <>
        Title.Caption = #20493#25968
        Width = 60
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object pnl1: TRzPanel
    Left = 0
    Top = 295
    Width = 534
    Height = 41
    Align = alBottom
    TabOrder = 2
    object btn2: TRzButton
      Left = 280
      Top = 8
      Caption = #21462#28040
      TabOrder = 0
      OnClick = btn2Click
    end
    object btn1: TRzButton
      Left = 128
      Top = 8
      Caption = #30830#23450
      TabOrder = 1
      OnClick = btn1Click
    end
  end
  object dsBP15: TDataSource
    DataSet = cdsBP15
    Left = 200
    Top = 176
  end
  object cdsBP15: TClientDataSet
    Aggregates = <>
    Params = <>
    OnCalcFields = cdsBP15CalcFields
    Left = 144
    Top = 176
    object strngfldBP15idkey: TStringField
      FieldName = 'idkey'
      FixedChar = True
      Size = 38
    end
    object strngfldBP15BP00_ptr: TStringField
      FieldName = 'BP00_ptr'
      FixedChar = True
      Size = 38
    end
    object strngfldBP15BP01_ptr: TStringField
      FieldName = 'BP01_ptr'
      FixedChar = True
      Size = 38
    end
    object intgrfldBP15d34_ptr: TIntegerField
      FieldName = 'd34_ptr'
    end
    object intgrfldBP15d17_ptr: TIntegerField
      FieldName = 'd17_ptr'
    end
    object strngfldBP15MGroupname: TStringField
      FieldKind = fkLookup
      FieldName = 'MGroupname'
      LookupDataSet = dm1.cdslookup496
      LookupKeyFields = 'rkey'
      LookupResultField = 'GROUP_NAME'
      KeyFields = 'D496_ptr'
      Lookup = True
    end
    object strngfldBP15MGroupDesc: TStringField
      FieldKind = fkLookup
      FieldName = 'MGroupDesc'
      LookupDataSet = dm1.cdslookup496
      LookupKeyFields = 'rkey'
      LookupResultField = 'GROUP_DESC'
      KeyFields = 'D496_ptr'
      Lookup = True
    end
    object strngfldBP15MName: TStringField
      FieldKind = fkCalculated
      FieldName = 'MName'
      Size = 512
      Calculated = True
    end
    object intgrfldBP15beishu: TIntegerField
      FieldName = 'beishu'
    end
    object intgrfldBP15d496_ptr: TIntegerField
      FieldName = 'd496_ptr'
    end
    object intgrfldBP15d28_ptr: TIntegerField
      FieldName = 'd28_ptr'
    end
  end
  object pm1: TPopupMenu
    OnPopup = pm1Popup
    Left = 304
    Top = 208
    object mnidelete: TMenuItem
      Caption = #21024#38500
      OnClick = mnideleteClick
    end
  end
end
