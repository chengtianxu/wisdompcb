inherited frmedit_mod67: Tfrmedit_mod67
  Caption = 'frmedit_mod67'
  ClientHeight = 490
  ClientWidth = 861
  ExplicitWidth = 877
  ExplicitHeight = 529
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 861
    Height = 490
    ExplicitWidth = 861
    ExplicitHeight = 490
    inherited pnl1: TPanel
      Width = 859
      ExplicitWidth = 859
      inherited btnSave: TBitBtn
        OnClick = btnSaveClick
      end
      inherited btnClose: TBitBtn
        OnClick = btnCloseClick
      end
    end
    inherited pnl2: TPanel
      Width = 859
      Height = 455
      ExplicitWidth = 859
      ExplicitHeight = 455
      object pnl3: TPanel
        Left = 1
        Top = 1
        Width = 857
        Height = 144
        Align = alTop
        TabOrder = 0
        object lbl5: TLabel
          Left = 10
          Top = 24
          Width = 60
          Height = 13
          Caption = #27969#31243#20195#30721#65306
        end
        object lbl2: TLabel
          Left = 34
          Top = 57
          Width = 36
          Height = 13
          Caption = #35828#26126#65306
        end
        object lbl3: TLabel
          Left = 10
          Top = 86
          Width = 60
          Height = 13
          Caption = #25152#23646#37096#38376#65306
        end
        object rg_Type: TRadioGroup
          Left = 296
          Top = 21
          Width = 105
          Height = 81
          Caption = #23457#25209#31867#22411
          Items.Strings = (
            #35831#36141#23457#25209
            #22806#21457#23457#25209
            #39046#26009#23457#25209)
          TabOrder = 0
        end
        object rg_method: TRadioGroup
          Left = 424
          Top = 24
          Width = 97
          Height = 73
          Caption = #23457#25209#26041#24335
          Items.Strings = (
            #20018#34892#23457#25209
            #24182#34892#23457#25209)
          TabOrder = 1
        end
        object edt_ACode: TRKeyRzBtnEdit
          Left = 76
          Top = 21
          Width = 121
          Height = 21
          Text = ''
          TabOrder = 2
          ButtonKind = bkFind
          ButtonVisible = False
          AltBtnWidth = 15
          ButtonWidth = 15
          DataSource = ds94
          DataSourceField = 'code'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object edt_ADesc: TRKeyRzBtnEdit
          Left = 76
          Top = 50
          Width = 121
          Height = 21
          Text = ''
          TabOrder = 3
          ButtonKind = bkFind
          ButtonVisible = False
          AltBtnWidth = 15
          ButtonWidth = 15
          DataSource = ds94
          DataSourceField = 'PURCHASE_APPROV_DESC'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object edt_ADept: TRKeyRzBtnEdit
          Left = 76
          Top = 81
          Width = 121
          Height = 21
          Text = ''
          TabOrder = 4
          ButtonKind = bkFind
          AltBtnWidth = 15
          ButtonWidth = 15
          DataSource = ds94
          DataSourceField = 'dept_ptr'
          DispalyTableName = 'data0034'
          DisplaytextField = 'dept_code'
          DisplayRetKeyField = 'rkey'
          DisplayNoteField = 'dept_name'
          DisplayPickID = '1'
          DisplayModID = 67
          ForceOnFocus = True
        end
      end
      object eh275: TDBGridEh
        Left = 1
        Top = 145
        Width = 857
        Height = 309
        Align = alClient
        DataSource = ds275
        DynProps = <>
        PopupMenu = pm275
        TabOrder = 1
        Columns = <
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'USER_LOGIN_NAME'
            Footers = <>
            ReadOnly = True
            Title.Caption = #20154#21592#20195#30721
            Width = 70
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'USER_FULL_NAME'
            Footers = <>
            ReadOnly = True
            Title.Caption = #20154#21592#21517#31216
            Width = 91
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'LOWER_LIMIT'
            Footers = <>
            Title.Caption = #37329#39069#19978#38480
            Width = 78
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'UPPER_LIMIT'
            Footers = <>
            Title.Caption = #37329#39069#19979#38480
            Width = 84
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
  object ds94: TDataSource
    DataSet = cds94
    Left = 496
    Top = 32
  end
  object cds94: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from data0362'
    Params = <>
    Left = 552
    Top = 32
  end
  object qrytemp: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=62ddf8f60269678;Persist Security In' +
      'fo=True;User ID=WZPCBConnect;Initial Catalog=sj_v20_live;Data So' +
      'urce=172.16.8.112'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT   dbo.Data0275.*,'
      ' dbo.Data0073.USER_FULL_NAME, dbo.Data0073.USER_LOGIN_NAME'
      'FROM      dbo.Data0275 INNER JOIN'
      
        '                dbo.Data0073 ON dbo.Data0275.USER_PTR = dbo.Data' +
        '0073.RKEY'
      'where 1=2')
    Left = 552
    Top = 184
    object qrytempLOWER_LIMIT: TFloatField
      FieldName = 'LOWER_LIMIT'
    end
    object qrytempUPPER_LIMIT: TFloatField
      FieldName = 'UPPER_LIMIT'
    end
    object qrytempUSER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object qrytempUSER_LOGIN_NAME: TStringField
      FieldName = 'USER_LOGIN_NAME'
      Size = 15
    end
  end
  object ds275: TDataSource
    DataSet = cds275
    Left = 440
    Top = 368
  end
  object cds275: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT   dbo.Data0275.*,'#13#10' dbo.Data0073.USER_FULL_NAME, dbo.Data' +
      '0073.USER_LOGIN_NAME'#13#10'FROM      dbo.Data0275 INNER JOIN'#13#10'       ' +
      '         dbo.Data0073 ON dbo.Data0275.USER_PTR = dbo.Data0073.RK' +
      'EY'#13#10'where 1=1'
    Params = <>
    Left = 512
    Top = 216
  end
  object pm275: TPopupMenu
    Left = 336
    Top = 264
    object MenuItem1: TMenuItem
      Caption = #26032#22686
      OnClick = MenuItem1Click
    end
    object mniEdit: TMenuItem
      Caption = #20462#25913
      OnClick = mniEditClick
    end
    object mnDel: TMenuItem
      Caption = #21024#38500
      OnClick = mnDelClick
    end
  end
end
