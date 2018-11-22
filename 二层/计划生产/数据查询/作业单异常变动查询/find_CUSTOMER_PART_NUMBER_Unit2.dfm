inherited find_CUSTOMER_PART_NUMBER_Form2: Tfind_CUSTOMER_PART_NUMBER_Form2
  Left = 271
  Top = 117
  Width = 413
  Height = 464
  Caption = #26597#25214#26412#21378#32534#21495
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 405
    inherited Label1: TLabel
      Caption = #26412#21378#32534#21495#65306
    end
    inherited Edit1: TEdit
      OnChange = Edit1Change
    end
  end
  inherited DBGrid1: TDBGrid
    Width = 405
    Height = 355
    DataSource = DataSource1
    Font.Height = -13
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    OnDblClick = DBGrid1DblClick
    OnKeyPress = DBGrid1KeyPress
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'MANU_PART_NUMBER'
        Title.Alignment = taCenter
        Title.Color = clRed
        Width = 375
        Visible = True
      end>
  end
  inherited Panel2: TPanel
    Top = 396
    Width = 405
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
    ProcedureName = 'wzcx0006;6'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    object ADOStoredProc1MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
  end
end
