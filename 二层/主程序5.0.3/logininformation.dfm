object Form_logininformation: TForm_logininformation
  Left = 309
  Top = 176
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #30331#20837#26085#24535#26597#35810
  ClientHeight = 460
  ClientWidth = 462
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 462
    Height = 410
    Align = alTop
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'compute_name'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'network_ip'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'login_date'
        Width = 147
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'type'
        Visible = True
      end>
  end
  object Button3: TButton
    Left = 288
    Top = 424
    Width = 75
    Height = 25
    Caption = #20851#38381
    ModalResult = 2
    TabOrder = 1
  end
  object Button1: TButton
    Left = 192
    Top = 424
    Width = 92
    Height = 25
    Caption = #21024#38500#24403#21069#35760#24405
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 96
    Top = 424
    Width = 92
    Height = 25
    Caption = #21024#38500#20840#37096#35760#24405
    TabOrder = 3
    OnClick = Button2Click
  end
  object ADS173: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT compute_name, network_ip, login_date, type'#13#10'FROM Data0173' +
      #13#10'WHERE csi_ptr=:RKEY'
    DataSource = DM.DataSource1
    IndexFieldNames = 'login_date'
    MasterFields = 'RKEY'
    Parameters = <
      item
        Name = 'RKEY'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 32
    Top = 136
    object ADS173compute_name: TStringField
      DisplayLabel = #30331#20837#30005#33041
      FieldName = 'compute_name'
      Size = 50
    end
    object ADS173network_ip: TStringField
      DisplayLabel = #30331#20837'IP'
      FieldName = 'network_ip'
      Size = 15
    end
    object ADS173login_date: TDateTimeField
      DisplayLabel = #30331#20837#26102#38388
      FieldName = 'login_date'
    end
    object ADS173type: TBooleanField
      DisplayLabel = #30331#20837#29366#24577
      FieldName = 'type'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADS173
    Left = 72
    Top = 136
  end
end
