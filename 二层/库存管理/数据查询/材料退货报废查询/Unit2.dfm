inherited find_Form2: Tfind_Form2
  Left = 258
  Top = 157
  Width = 371
  Height = 416
  Caption = 'find_Form2'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 363
    inherited Label1: TLabel
      Left = 8
      Width = 113
      AutoSize = False
      Caption = #26448#26009#32534#30721#65306
    end
    inherited Edit1: TEdit
      OnChange = Edit1Change
    end
  end
  inherited DBGrid1: TDBGrid
    Width = 363
    Height = 304
    DataSource = DataSource1
    OnDblClick = DBGrid1DblClick
    OnKeyPress = DBGrid1KeyPress
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'INV_PART_NUMBER'
        Title.Color = clRed
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_PART_DESCRIPTION'
        Visible = True
      end>
  end
  inherited Panel2: TPanel
    Top = 345
    Width = 363
    inherited Button1: TButton
      OnClick = Button1Click
    end
  end
  inherited DataSource1: TDataSource
    DataSet = ADOStoredProc1
  end
  inherited ADOStoredProc1: TADOStoredProc
    CursorType = ctStatic
    ProcedureName = 'wzcx96;9'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    object ADOStoredProc1INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADOStoredProc1INV_PART_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
  end
end
