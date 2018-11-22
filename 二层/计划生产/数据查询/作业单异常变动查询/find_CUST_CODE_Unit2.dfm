inherited find_CUST_CODE_Form2: Tfind_CUST_CODE_Form2
  Left = 209
  Width = 373
  Height = 463
  Caption = 'find_CUST_CODE_Form2'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 365
    inherited Label1: TLabel
      Caption = #23458#25143#20195#30721#65306
    end
    inherited Edit1: TEdit
      OnChange = Edit1Change
    end
  end
  inherited DBGrid1: TDBGrid
    Width = 365
    Height = 351
    DataSource = DataSource1
    OnDblClick = DBGrid1DblClick
    OnKeyPress = DBGrid1KeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'CUST_CODE'
        Width = 347
        Visible = True
      end>
  end
  inherited Panel2: TPanel
    Top = 392
    Width = 365
    inherited Button1: TButton
      OnClick = Button1Click
    end
  end
  inherited DataSource1: TDataSource
    DataSet = ADOStoredProc1
  end
  inherited ADOStoredProc1: TADOStoredProc
    Active = True
    CursorType = ctStatic
    ProcedureName = 'wzcx48;8'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    object ADOStoredProc1CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
  end
end
