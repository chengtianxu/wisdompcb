object Frm_Materiel: TFrm_Materiel
  Left = 234
  Top = 205
  Width = 924
  Height = 522
  Caption = #36873#25321#26448#26009
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 908
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 59
      Height = 13
      Caption = #26448#26009#20195#30721':'
    end
    object Edit1: TEdit
      Left = 72
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 41
    Width = 908
    Height = 402
    Align = alClient
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
    OnKeyDown = DBGridEh1KeyDown
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'selected'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'INV_PART_NUMBER'
        Footers = <>
        Title.Color = clRed
        Title.SortIndex = 1
        Title.SortMarker = smUpEh
        Width = 125
      end
      item
        EditButtons = <>
        FieldName = 'INV_NAME'
        Footers = <>
        Width = 132
      end
      item
        EditButtons = <>
        FieldName = 'INV_DESCRIPTION'
        Footers = <>
        Width = 379
      end
      item
        EditButtons = <>
        FieldName = 'STOP_PURCH1'
        Footers = <>
        Width = 102
      end
      item
        EditButtons = <>
        FieldName = 'UNIT_NAME'
        Footers = <>
        Width = 84
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 443
    Width = 908
    Height = 41
    Align = alBottom
    TabOrder = 2
    object Button1: TButton
      Left = 394
      Top = 10
      Width = 75
      Height = 25
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 490
      Top = 10
      Width = 75
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
    object CheckBox1: TCheckBox
      Left = 16
      Top = 16
      Width = 97
      Height = 17
      Caption = #20840#36873
      TabOrder = 2
      OnClick = CheckBox1Click
    end
  end
  object DataSource1: TDataSource
    DataSet = ADS17
    Left = 176
    Top = 176
  end
  object ADS17: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    CommandText = 
      'declare @TempTable table(selected bit)      '#13#10'  insert @TempTabl' +
      'e  values (0)'#13#10'SELECT selected,data0017.RKEY, data0017.INV_PART_' +
      'NUMBER,data0017. INV_NAME,'#13#10' data0017. INV_DESCRIPTION,Data0002.' +
      'UNIT_NAME,Data0017.STOCK_UNIT_PTR,'#13#10' case data0017.STOP_PURCH wh' +
      'en '#39'Y'#39' then '#39#26159#39' when '#39'N'#39' then '#39#21542#39' end as STOP_PURCH1'#13#10'FROM      ' +
      '   dbo.Data0017 inner join data0002 on data0002.rkey=data0017.ST' +
      'OCK_UNIT_PTR'#13#10' join @TempTable on 1=1'#13#10'where  data0017.STOP_PURC' +
      'H = '#39'N'#39#13#10#13#10
    DataSource = DM.DataSource1
    IndexFieldNames = 'INV_PART_NUMBER'
    Parameters = <>
    Left = 360
    Top = 176
    object ADS17selected: TBooleanField
      DisplayLabel = #36873#25321
      FieldName = 'selected'
    end
    object ADS17RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADS17INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#20195#30721
      FieldName = 'INV_PART_NUMBER'
      ReadOnly = True
      Size = 25
    end
    object ADS17INV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      ReadOnly = True
      Size = 30
    end
    object ADS17INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35215#26684
      FieldName = 'INV_DESCRIPTION'
      ReadOnly = True
      Size = 70
    end
    object ADS17STOP_PURCH1: TStringField
      DisplayLabel = #26159#21542#24050#20572#27490#37319#36141
      FieldName = 'STOP_PURCH1'
      ReadOnly = True
      Size = 2
    end
    object ADS17UNIT_NAME: TStringField
      DisplayLabel = #21333#20301#21517#31216
      FieldName = 'UNIT_NAME'
    end
    object ADS17STOCK_UNIT_PTR: TIntegerField
      FieldName = 'STOCK_UNIT_PTR'
    end
  end
end
