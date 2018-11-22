inherited frmEdit_mod274: TfrmEdit_mod274
  Caption = #26448#26009#35831#36141#23457#25209#39069#24230
  ClientHeight = 440
  ClientWidth = 439
  OnCreate = FormCreate
  ExplicitWidth = 455
  ExplicitHeight = 479
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 439
    Height = 440
    ExplicitWidth = 439
    ExplicitHeight = 440
    inherited pnl1: TPanel
      Width = 437
      ExplicitWidth = 437
      inherited btnSave: TBitBtn
        OnClick = btnSaveClick
      end
      inherited btnClose: TBitBtn
        OnClick = btnCloseClick
      end
    end
    inherited pnl2: TPanel
      Width = 437
      Height = 405
      ExplicitWidth = 437
      ExplicitHeight = 405
      object lbl1: TLabel
        Left = 12
        Top = 24
        Width = 48
        Height = 13
        Caption = #23457#25209#31867#22411
      end
      object lbl2: TLabel
        Left = 36
        Top = 56
        Width = 24
        Height = 13
        Caption = #24037#21378
      end
      object lbl3: TLabel
        Left = 36
        Top = 88
        Width = 24
        Height = 13
        Caption = #29992#25143
      end
      object lbl4: TLabel
        Left = 36
        Top = 120
        Width = 24
        Height = 13
        Caption = #39034#24207
      end
      object lbl5: TLabel
        Left = 12
        Top = 152
        Width = 48
        Height = 13
        Caption = #39069#24230#19979#38480
      end
      object lbl6: TLabel
        Left = 9
        Top = 182
        Width = 51
        Height = 13
        Caption = #39069#24230#19979#38480' '
      end
      object cbb_type: TComboBox
        Left = 68
        Top = 23
        Width = 145
        Height = 21
        TabOrder = 0
      end
      object edt_WH: TRKeyRzBtnEdit
        Left = 66
        Top = 55
        Width = 146
        Height = 21
        Text = ''
        TabOrder = 1
        ButtonKind = bkFind
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds77
        DataSourceField = 'warehouse_ptr'
        DispalyTableName = 'data0015'
        DisplaytextField = 'warehouse_code'
        DisplayRetKeyField = 'rkey'
        DisplayNoteField = 'ABBR_NAME'
        DisplayPickID = '1'
        DisplayModID = 274
        ForceOnFocus = True
      end
      object edt_NO: TRKeyRzBtnEdit
        Left = 68
        Top = 114
        Width = 146
        Height = 21
        Text = ''
        TabOrder = 2
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds77
        DataSourceField = 'seq_no'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object edt_LLimit: TRKeyRzBtnEdit
        Left = 68
        Top = 145
        Width = 146
        Height = 21
        Text = ''
        TabOrder = 3
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds77
        DataSourceField = 'lower_limit'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object edt_ULimit: TRKeyRzBtnEdit
        Left = 68
        Top = 175
        Width = 146
        Height = 21
        Text = ''
        TabOrder = 4
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds77
        DataSourceField = 'upper_limit'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object edt_User: TRKeyRzBtnEdit
        Left = 67
        Top = 82
        Width = 146
        Height = 21
        Text = ''
        TabOrder = 5
        ButtonKind = bkFind
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds77
        DataSourceField = 'user_ptr'
        DispalyTableName = 'data0073'
        DisplaytextField = 'USER_LOGIN_NAME'
        DisplayRetKeyField = 'rkey'
        DisplayNoteField = 'USER_FULL_NAME'
        DisplayPickID = '2'
        DisplayModID = 274
        ForceOnFocus = True
      end
    end
  end
  object ds77: TDataSource
    DataSet = cds77
    Left = 304
    Top = 40
  end
  object cds77: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from data0362'
    Params = <>
    Left = 355
    Top = 40
  end
  object cdstemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 328
    Top = 168
  end
end
