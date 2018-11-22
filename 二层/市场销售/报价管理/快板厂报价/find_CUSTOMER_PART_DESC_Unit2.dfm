inherited find_CUSTOMER_PART_DESC_Form2: Tfind_CUSTOMER_PART_DESC_Form2
  Left = 204
  Top = 125
  Width = 372
  Height = 456
  Caption = 'find_CUSTOMER_PART_DESC_Form2'
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
        FieldName = 'CUSTOMER_PART_DESC'
        Title.Alignment = taCenter
        Width = 342
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
  end
  inherited ADOStoredProc1: TADOStoredProc
    CursorType = ctStatic
    ProcedureName = 'wzcx48;7'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    object ADOStoredProc1CUSTOMER_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'CUSTOMER_PART_DESC'
      Size = 40
    end
  end
end
