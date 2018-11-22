inherited find_CUSTOMER_PART_NUMBER_Form2: Tfind_CUSTOMER_PART_NUMBER_Form2
  Caption = 'find_CUSTOMER_PART_NUMBER_Form2'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Label1: TLabel
      Caption = #26412#21378#32534#21495#65306
    end
    inherited Edit1: TEdit
      OnChange = Edit1Change
    end
  end
  inherited DBGrid1: TDBGrid
    DataSource = DataSource1
    OnDblClick = DBGrid1DblClick
    OnKeyPress = DBGrid1KeyPress
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CUSTOMER_PART_NUMBER'
        Title.Alignment = taCenter
        Title.Color = clRed
        Width = 229
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CP_REV'
        Title.Alignment = taCenter
        Width = 78
        Visible = True
      end>
  end
  inherited Panel2: TPanel
    inherited Button1: TButton
      Left = 64
      OnClick = Button1Click
    end
    inherited Button2: TButton
      Left = 208
    end
  end
  inherited DataSource1: TDataSource
    DataSet = ADOStoredProc1
  end
  inherited ADOStoredProc1: TADOStoredProc
    CursorType = ctStatic
    ProcedureName = 'wzcx48;6'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    object ADOStoredProc1CUSTOMER_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'CUSTOMER_PART_NUMBER'
    end
    object ADOStoredProc1CP_REV: TStringField
      DisplayLabel = #29256#26412
      FieldName = 'CP_REV'
      FixedChar = True
      Size = 5
    end
  end
end
