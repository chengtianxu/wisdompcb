inherited find_Form3: Tfind_Form3
  Left = 335
  Top = 163
  Width = 342
  Height = 416
  Caption = 'find_Form3'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 334
    inherited Label1: TLabel
      Caption = #21407#22240#21517#31216#65306
    end
    inherited Edit1: TEdit
      OnChange = Edit1Change
    end
  end
  inherited DBGrid1: TDBGrid
    Width = 334
    Height = 304
    DataSource = DataSource1
    OnDblClick = DBGrid1DblClick
    OnKeyPress = DBGrid1KeyPress
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'REJECT_DESCRIPTION'
        Width = 326
        Visible = True
      end>
  end
  inherited Panel2: TPanel
    Top = 345
    Width = 334
    inherited Button1: TButton
      OnClick = Button1Click
    end
  end
  inherited DataSource1: TDataSource
    DataSet = ADOStoredProc1
  end
  inherited ADOStoredProc1: TADOStoredProc
    CursorType = ctStatic
    ProcedureName = 'wzcx96;10'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    object ADOStoredProc1REJECT_DESCRIPTION: TStringField
      DisplayLabel = #21407#22240#21517#31216
      FieldName = 'REJECT_DESCRIPTION'
      Size = 30
    end
  end
end
