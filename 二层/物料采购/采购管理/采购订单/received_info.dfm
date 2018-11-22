object Form19: TForm19
  Left = 277
  Top = 207
  Width = 907
  Height = 591
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #37319#36141#25910#36135#20449#24687
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 26
    Width = 891
    Height = 147
    Align = alTop
    DataSource = DM.DataSource6
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = FormKeyDown
  end
  object Button1: TButton
    Left = 398
    Top = 519
    Width = 70
    Height = 26
    Caption = #20851#38381
    ModalResult = 1
    TabOrder = 1
    OnKeyDown = FormKeyDown
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 207
    Width = 891
    Height = 134
    Align = alTop
    DataSource = DM.DataSource7
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = FormKeyDown
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 891
    Height = 26
    Align = alTop
    BevelOuter = bvNone
    Caption = #35746#36141#20449#24687
    TabOrder = 3
  end
  object Panel2: TPanel
    Left = 0
    Top = 173
    Width = 891
    Height = 34
    Align = alTop
    BevelOuter = bvNone
    Caption = #27491#24335#20179#24211#25910#36135#20449#24687
    TabOrder = 4
  end
  object Panel3: TPanel
    Left = 0
    Top = 341
    Width = 891
    Height = 34
    Align = alTop
    BevelOuter = bvNone
    Caption = 'VMI'#20179#24211#25910#36135#20449#24687
    TabOrder = 5
  end
  object DBGrid3: TDBGrid
    Left = 0
    Top = 375
    Width = 891
    Height = 134
    Align = alTop
    DataSource = DM.DataSource8
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 6
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = FormKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'GRN_NUMBER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DELIVER_NUMBER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CREATE_DATE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTITY'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WAREHOUSE_NAME'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCATION'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BARCODE_ID'
        Width = 102
        Visible = True
      end>
  end
end
