inherited find_SALES_ORDER_Form2: Tfind_SALES_ORDER_Form2
  Left = 231
  Top = 125
  Width = 314
  Height = 453
  Caption = 'find_SALES_ORDER_Form2'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 306
    inherited Label1: TLabel
      Left = 6
      Caption = #35746#21333#32534#21495#65306
    end
    inherited Edit1: TEdit
      Left = 75
      OnChange = Edit1Change
    end
    inherited BitBtn1: TBitBtn
      Left = 222
    end
  end
  inherited DBGrid1: TDBGrid
    Width = 306
    Height = 344
    DataSource = DataSource1
    OnDblClick = DBGrid1DblClick
    OnKeyPress = DBGrid1KeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'sales_order'
        Width = 273
        Visible = True
      end>
  end
  inherited Panel2: TPanel
    Top = 385
    Width = 306
    inherited Button1: TButton
      Left = 48
      OnClick = Button1Click
    end
    inherited Button2: TButton
      Left = 152
    end
  end
  inherited DataSource1: TDataSource
    DataSet = ADOStoredProc1
  end
  inherited ADOStoredProc1: TADOStoredProc
    CursorType = ctStatic
    ProcedureName = 'wzcx48;4'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    object ADOStoredProc1sales_order: TStringField
      DisplayLabel = #35746#21333#32534#21495
      FieldName = 'sales_order'
      FixedChar = True
      Size = 12
    end
  end
end
