object frm_MainCyclDefinition: Tfrm_MainCyclDefinition
  Left = 524
  Top = 224
  Width = 372
  Height = 563
  Caption = #36873#25321#20445#20859#21608#26399
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
    Width = 364
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 59
      Height = 13
      Caption = #20445#20859#21608#26399':'
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
    Width = 364
    Height = 447
    Align = alClient
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
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
        Title.Caption = #36873#25321
        Width = 40
      end
      item
        EditButtons = <>
        FieldName = 'MainCycl'
        Footers = <>
        Title.Caption = #20445#20859#21608#26399
        Title.Color = clRed
        Title.SortIndex = 1
        Title.SortMarker = smUpEh
        Width = 130
      end
      item
        EditButtons = <>
        FieldName = 'cycl_duration'
        Footers = <>
        Title.Caption = #21608#26399#26102#38388
        Width = 128
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 488
    Width = 364
    Height = 41
    Align = alBottom
    TabOrder = 2
    object Button1: TButton
      Left = 112
      Top = 10
      Width = 75
      Height = 25
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 208
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
  object ADS816: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    BeforeInsert = ADS816BeforeInsert
    BeforeDelete = ADS816BeforeDelete
    CommandText = 
      'declare @TempTable table(selected bit)      '#13#10'insert @TempTable ' +
      ' values (0)'#13#10'select selected,rkey,MainCycl,cycl_duration'#13#10'from d' +
      'ata0816 inner join @TempTable on 1=1'
    IndexFieldNames = 'MainCycl'
    Parameters = <>
    Left = 264
    Top = 184
    object ADS816selected: TBooleanField
      FieldName = 'selected'
    end
    object ADS816MainCycl: TStringField
      FieldName = 'MainCycl'
      ReadOnly = True
      Size = 10
    end
    object ADS816cycl_duration: TIntegerField
      FieldName = 'cycl_duration'
      ReadOnly = True
    end
    object ADS816rkey: TWordField
      FieldName = 'rkey'
      ReadOnly = True
    end
  end
  object DataSource1: TDataSource
    DataSet = ADS816
    Left = 176
    Top = 176
  end
end
