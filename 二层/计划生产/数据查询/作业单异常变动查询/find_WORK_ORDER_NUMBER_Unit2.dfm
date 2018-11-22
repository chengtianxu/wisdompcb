inherited find_WORK_ORDER_NUMBERForm2: Tfind_WORK_ORDER_NUMBERForm2
  Left = 310
  Top = 138
  Width = 372
  Height = 456
  Caption = #26597#38271#20316#19994#21333#21495
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 364
    inherited Label1: TLabel
      Caption = #23458#25143#22411#21495#65306
    end
    inherited Edit1: TEdit
      OnChange = Edit1Change
    end
  end
  inherited DBGrid1: TDBGrid
    Width = 364
    Height = 347
    DataSource = DataSource1
    OnDblClick = DBGrid1DblClick
    OnKeyPress = DBGrid1KeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'WORK_ORDER_NUMBER'
        Title.Alignment = taCenter
        Width = 340
        Visible = True
      end>
  end
  inherited Panel2: TPanel
    Top = 388
    Width = 364
    inherited Button1: TButton
      OnClick = Button1Click
    end
  end
  inherited DataSource1: TDataSource
    DataSet = ADOStoredProc1
    Left = 88
    Top = 184
  end
  inherited ADOStoredProc1: TADOStoredProc
    CursorType = ctStatic
    ProcedureName = 'wzcx0006;14'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    object ADOStoredProc1WORK_ORDER_NUMBER: TStringField
      DisplayLabel = #20316#19994#21333#21495
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
  end
end
