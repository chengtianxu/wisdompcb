object empl_search: Templ_search
  Left = 596
  Top = 248
  Width = 364
  Height = 420
  Caption = #21592#24037#26597#25214
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 25
    Top = 11
    Width = 52
    Height = 13
    Caption = #21592#24037#24037#21495
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object MaskEdit1: TMaskEdit
    Left = 88
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 0
    OnChange = MaskEdit1Change
    OnKeyDown = DBGrid1KeyDown
  end
  object BitBtn1: TBitBtn
    Left = 229
    Top = 5
    Width = 75
    Height = 25
    Caption = #28165#38500
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 40
    Width = 297
    Height = 297
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'employeecode'
        Title.Caption = #21592#24037#24037#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'chinesename'
        Title.Caption = #21592#24037#22995#21517
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 64
    Top = 348
    Width = 75
    Height = 25
    Caption = #30830#35748
    ModalResult = 1
    TabOrder = 3
  end
  object Button2: TButton
    Left = 192
    Top = 348
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 4
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    OnDataChange = DataSource1DataChange
    Left = 280
    Top = 336
  end
  object ADOQuery1: TADODataSet
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'if Exists   (select * from sysobjects where name= '#39'employeemsg'#39' ' +
      'and type= '#39'U'#39') '#13#10'select  employeecode , chinesename '#13#10'from emplo' +
      'yeemsg '#13#10'where  status = 1'#13#10'else '#13#10'select '#39'code'#39' as employeecode' +
      ','#39'name'#39' as chinesename '#13#10'where 1 = 2'
    Parameters = <>
    Left = 312
    Top = 336
    object ADOQuery1employeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object ADOQuery1chinesename: TWideStringField
      FieldName = 'chinesename'
    end
  end
end
