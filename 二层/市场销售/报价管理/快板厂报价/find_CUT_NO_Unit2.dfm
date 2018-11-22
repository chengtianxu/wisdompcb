inherited find_CUT_NO_Form2: Tfind_CUT_NO_Form2
  Width = 375
  Height = 464
  Caption = 'find_CUT_NO_Form2'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 367
    inherited Label1: TLabel
      Caption = #25237#26009#21333#21495#65306
    end
    inherited Edit1: TEdit
      OnChange = Edit1Change
    end
  end
  inherited DBGrid1: TDBGrid
    Width = 367
    Height = 355
    DataSource = DataSource1
    OnDblClick = DBGrid1DblClick
    OnKeyPress = DBGrid1KeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'CUT_NO'
        Title.Alignment = taCenter
        Width = 343
        Visible = True
      end>
  end
  inherited Panel2: TPanel
    Top = 396
    Width = 367
    inherited Button1: TButton
      OnClick = Button1Click
    end
  end
  inherited DataSource1: TDataSource
    DataSet = ADOStoredProc1
  end
  inherited ADOStoredProc1: TADOStoredProc
    CursorType = ctStatic
    ProcedureName = 'wzcx48;5'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    object ADOStoredProc1CUT_NO: TStringField
      DisplayLabel = #25237#26009#21333#21495
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
  end
end
