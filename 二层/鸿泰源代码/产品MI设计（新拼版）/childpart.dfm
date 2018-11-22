object Form_childpart: TForm_childpart
  Left = 427
  Top = 164
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #21019#24314#26631#20934#23376#37096#20214
  ClientHeight = 408
  ClientWidth = 386
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 72
    Top = 388
    Width = 7
    Height = 13
    Caption = '0'
  end
  object Label2: TLabel
    Left = 5
    Top = 389
    Width = 59
    Height = 13
    Caption = #22686#21152#39033#25968':'
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 386
    Height = 361
    Align = alTop
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGridEh1KeyDown
    Columns = <
      item
        Checkboxes = True
        EditButtons = <>
        FieldName = 'if_select'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'part_name'
        Footers = <>
        ReadOnly = True
        Width = 153
      end
      item
        EditButtons = <>
        FieldName = 'OPT_LOT_SIZE'
        Footers = <>
        ReadOnly = True
        Width = 81
      end
      item
        EditButtons = <>
        FieldName = 'LAYERS'
        Footers = <>
        ReadOnly = True
      end>
  end
  object Button1: TButton
    Left = 104
    Top = 376
    Width = 75
    Height = 25
    Caption = #30830#35748
    Enabled = False
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 208
    Top = 376
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 2
  end
  object ads37: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filter = 'if_select =0'
    Filtered = True
    LockType = ltBatchOptimistic
    CommandText = 
      'select part_name, if_select, OPT_LOT_SIZE, LAYERS'#13#10' from DATA003' +
      '7'
    Parameters = <>
    Left = 64
    Top = 152
    object ads37part_name: TStringField
      DisplayLabel = #37096#20214#32534#21495
      DisplayWidth = 20
      FieldName = 'part_name'
      Size = 50
    end
    object ads37if_select: TBooleanField
      DisplayLabel = #36873#25321
      DisplayWidth = 5
      FieldName = 'if_select'
      OnChange = ads37if_selectChange
    end
    object ads37OPT_LOT_SIZE: TIntegerField
      DisplayLabel = #26368#20339#27969#36716#25209#37327
      DisplayWidth = 10
      FieldName = 'OPT_LOT_SIZE'
    end
    object ads37LAYERS: TIntegerField
      DisplayLabel = #23618#25968
      DisplayWidth = 10
      FieldName = 'LAYERS'
    end
  end
  object DataSource1: TDataSource
    DataSet = ads37
    Left = 32
    Top = 152
  end
end
