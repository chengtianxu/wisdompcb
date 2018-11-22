inherited find_CUSTOMER_PART_DESC_Form2: Tfind_CUSTOMER_PART_DESC_Form2
  Caption = 'find_CUSTOMER_PART_DESC_Form2'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Label1: TLabel
      Caption = #23458#25143#22411#21495#65306
    end
    inherited Edit1: TEdit
      OnChange = Edit1Change
    end
  end
  inherited DBGrid1: TDBGrid
    DataSource = DataSource1
    OnDblClick = DBGrid1DblClick
    OnKeyPress = DBGrid1KeyPress
    OnTitleClick = nil
    Columns = <
      item
        Expanded = False
        FieldName = 'CUSTOMER_PART_DESC'
        Title.Alignment = taCenter
        Visible = True
      end>
  end
  inherited Panel2: TPanel
    inherited Button1: TButton
      OnClick = Button1Click
    end
    inherited Button2: TButton
      OnClick = nil
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
