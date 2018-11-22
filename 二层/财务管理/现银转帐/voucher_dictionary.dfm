object Form_dictionary: TForm_dictionary
  Left = 276
  Top = 162
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20973#35777#25688#35201#23383#20856
  ClientHeight = 466
  ClientWidth = 412
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 96
    Top = 9
    Width = 52
    Height = 13
    Caption = #25688#35201#31867#22411
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 32
    Width = 412
    Height = 391
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = #25688#35201#31867#22411
        Width = 125
        Visible = True
      end
      item
        Expanded = False
        FieldName = #25688#35201#25551#36848
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 121
    Top = 433
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 2
  end
  object Button2: TButton
    Left = 201
    Top = 433
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 3
  end
  object Edit1: TEdit
    Left = 152
    Top = 5
    Width = 121
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = DBGrid1KeyDown
  end
  object aq513: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'select data0512. DICT_GRP as '#25688#35201#31867#22411','#13#10'data0513.DESCRIPTION as '#25688#35201#25551#36848 +
      #13#10'from data0513 inner join data0512'#13#10'on data0513.GRP_PTR=data051' +
      '2.rkey'#13#10
    IndexFieldNames = #25688#35201#31867#22411
    Parameters = <>
    Left = 40
    Top = 360
    object aq513DSDesigner: TStringField
      DisplayWidth = 18
      FieldName = #25688#35201#31867#22411
      FixedChar = True
      Size = 30
    end
    object aq513DSDesigner2: TStringField
      DisplayWidth = 37
      FieldName = #25688#35201#25551#36848
      FixedChar = True
      Size = 30
    end
  end
  object DataSource1: TDataSource
    DataSet = aq513
    Left = 8
    Top = 360
  end
end
