inherited find_CUST_CODE_Form2: Tfind_CUST_CODE_Form2
  Left = 264
  Top = 157
  Width = 417
  Height = 423
  Caption = 'find_CUST_CODE_Form2'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Temp_DBGridEh1: TDBGridEh
    Width = 409
    Height = 311
    OnDblClick = Temp_DBGridEh1DblClick
    OnTitleBtnClick = Temp_DBGridEh1TitleBtnClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'CUST_CODE'
        Footers = <>
        Title.Alignment = taCenter
        Title.SortIndex = 1
        Title.SortMarker = smDownEh
        Title.TitleButton = True
        Width = 146
      end
      item
        EditButtons = <>
        FieldName = 'ABBR_NAME'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
        Width = 243
      end>
  end
  inherited Panel1: TPanel
    Width = 409
    inherited Label1: TLabel
      Left = 8
      Width = 66
      Caption = ' '#23458#25143#20195#30721#65306' '
    end
    inherited Edit1: TEdit
      OnChange = Edit1Change
    end
  end
  inherited Panel2: TPanel
    Top = 352
    Width = 409
  end
  inherited ADOStoredProc1: TADOStoredProc
    Active = True
    CursorType = ctStatic
    ProcedureName = 'wzcx98;8'
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
    object ADOStoredProc1ABBR_NAME: TStringField
      DisplayLabel = #23458#25143#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
  end
end
