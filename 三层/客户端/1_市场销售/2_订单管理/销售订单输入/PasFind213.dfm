inherited frmFind213: TfrmFind213
  Caption = #39044#22788#29702#35746#21333#26597#25214
  ClientHeight = 336
  ClientWidth = 673
  ExplicitWidth = 681
  ExplicitHeight = 363
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 295
    Width = 673
    Height = 41
    Align = alBottom
    TabOrder = 0
    ExplicitLeft = 120
    ExplicitTop = 96
    ExplicitWidth = 185
    object Button1: TButton
      Left = 221
      Top = 6
      Width = 72
      Height = 27
      Caption = #30830' '#23450
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 329
      Top = 6
      Width = 72
      Height = 28
      Caption = #21462' '#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 673
    Height = 295
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 256
    ExplicitTop = 88
    ExplicitWidth = 185
    ExplicitHeight = 41
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 671
      Height = 293
      Align = alClient
      DataSource = ds213
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'MANU_PART_NUMBER'
          Title.Caption = #26412#21378#32534#21495
          Title.Color = clRed
          Width = 86
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MANU_PART_DESC'
          Title.Caption = #23458#25143#22411#21495
          Width = 107
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ANALYSIS_CODE_2'
          Title.Caption = #23458#25143#29289#26009#21495
          Width = 101
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PO_NUMBER'
          Title.Caption = #23458#25143#35746#21333#21495
          Width = 96
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PART_PRICE'
          Title.Caption = #21547#31246#20215#26684
          Width = 81
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PARTS_ORDERED'
          Title.Caption = #25968#37327
          Width = 51
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ORIG_REQUEST_DATE'
          Title.Caption = #20986#21378#26085#26399
          Width = 58
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ORIG_SCHED_SHIP_DATE'
          Title.Caption = #20132#36135#26085#26399
          Width = 72
          Visible = True
        end>
    end
  end
  object ds213: TDataSource
    DataSet = cds213
    Left = 232
    Top = 112
  end
  object cds213: TClientDataSet
    Aggregates = <>
    CommandText = 'SELECT  * FROM dbo.DATA0213'#13#10'WHERE    status=3'
    Params = <>
    Left = 312
    Top = 112
  end
end
