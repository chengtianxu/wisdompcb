inherited FrmBadDetail_Mod664: TFrmBadDetail_Mod664
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #19981#33391#26126#32454
  ClientHeight = 560
  ClientWidth = 644
  ExplicitWidth = 650
  ExplicitHeight = 589
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 644
    Height = 560
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 644
    ExplicitHeight = 560
    inherited pnl1: TPanel
      Width = 642
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 642
      inherited btnSave: TBitBtn
        OnClick = btnSaveClick
      end
      inherited btnClose: TBitBtn
        ModalResult = 2
      end
    end
    inherited pnl2: TPanel
      Width = 642
      Height = 525
      ExplicitLeft = 1
      ExplicitTop = 34
      ExplicitWidth = 642
      ExplicitHeight = 525
      object lbl1: TLabel
        Left = 79
        Top = 32
        Width = 48
        Height = 13
        Caption = #20379#24212#21830#65306
      end
      object lbl2: TLabel
        Left = 67
        Top = 81
        Width = 60
        Height = 13
        Caption = #26448#26009#32534#30721#65306
      end
      object lbl5: TLabel
        Left = 67
        Top = 130
        Width = 60
        Height = 13
        Caption = #21457#29983#26085#26399#65306
      end
      object lbl6: TLabel
        Left = 312
        Top = 130
        Width = 100
        Height = 13
        Caption = #19981#33391#25968#37327'/'#19981#33391#29575#65306
      end
      object lbl7: TLabel
        Left = 67
        Top = 179
        Width = 60
        Height = 13
        Caption = #19981#33391#25209#21495#65306
      end
      object lbl8: TLabel
        Left = 79
        Top = 228
        Width = 48
        Height = 13
        Caption = #36319#36827#20154#65306
      end
      object lbl9: TLabel
        Left = 79
        Top = 277
        Width = 48
        Height = 13
        Caption = #38382#39064#28857#65306
      end
      object lbl10: TLabel
        Left = 67
        Top = 387
        Width = 60
        Height = 13
        Caption = #22788#29702#32467#26524#65306
      end
      object chkSend: TDBCheckBox
        Left = 349
        Top = 178
        Width = 100
        Height = 17
        Caption = #26159#21542#21457#36865'8D'#25913#21892#25253#21578
        DataField = 'IsReport'
        DataSource = dsBadRecord
        TabOrder = 0
      end
      object chkClose: TDBCheckBox
        Left = 349
        Top = 227
        Width = 97
        Height = 17
        Caption = #26159#21542#20851#38381#36319#36827
        DataField = 'IsClose'
        DataSource = dsBadRecord
        TabOrder = 1
      end
      object edtCode: TRKeyRzBtnEdit
        Left = 133
        Top = 29
        Width = 140
        Height = 21
        Text = ''
        TabOrder = 2
        ButtonKind = bkFind
        AltBtnWidth = 15
        ButtonWidth = 15
        OnButtonClick = edtCodeButtonClick
        DataSource = dsBadRecord
        DataSourceField = 'rkey23'
        DispalyTableName = 'data0023'
        DisplaytextField = 'abbr_name'
        DisplayRetKeyField = 'rkey'
        DisplayNoteField = 'SUPPLIER_NAME'
        DisplayPickID = '3'
        DisplayModID = 664
        ForceOnFocus = True
      end
      object edtINVT: TRKeyRzBtnEdit
        Left = 133
        Top = 78
        Width = 140
        Height = 21
        Text = ''
        TabOrder = 3
        ButtonKind = bkFind
        AltBtnWidth = 15
        ButtonWidth = 15
        OnButtonClick = edtINVTButtonClick
        DataSource = dsBadRecord
        DataSourceField = 'rkey17'
        DispalyTableName = 'data0017'
        DisplaytextField = 'INV_PART_NUMBER'
        DisplayRetKeyField = 'rkey'
        DisplayNoteField = 'INV_PART_DESCRIPTION'
        DisplayPickID = '4'
        DisplayModID = 664
        ForceOnFocus = True
      end
      object dbdtpk: TRzDBDateTimePicker
        Left = 133
        Top = 122
        Width = 140
        Height = 21
        Date = 42788.000000000000000000
        Format = ''
        Time = 42788.000000000000000000
        TabOrder = 4
        DataField = 'DiscoverDate'
        DataSource = dsBadRecord
      end
      object edtQuantity: TDBEdit
        Left = 418
        Top = 127
        Width = 121
        Height = 21
        DataField = 'BadQuantity'
        DataSource = dsBadRecord
        TabOrder = 5
        OnKeyPress = edtQuantityKeyPress
      end
      object edtTrancer: TRKeyRzBtnEdit
        Left = 133
        Top = 225
        Width = 84
        Height = 21
        Text = ''
        TabOrder = 6
        ButtonKind = bkFind
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = dsBadRecord
        DataSourceField = 'TrancertMen'
        DispalyTableName = 'DATA0073'
        DisplaytextField = 'USER_LOGIN_NAME'
        DisplayRetKeyField = 'rkey'
        DisplayNoteField = 'USER_FULL_NAME'
        DisplayPickID = '5'
        DisplayModID = 664
        ForceOnFocus = True
      end
      object dbedtBacth: TDBEdit
        Left = 133
        Top = 176
        Width = 140
        Height = 21
        DataField = 'BatchNO'
        DataSource = dsBadRecord
        TabOrder = 7
      end
      object dbmmo1: TDBMemo
        Left = 136
        Top = 280
        Width = 403
        Height = 69
        DataField = 'BadRemark'
        DataSource = dsBadRecord
        TabOrder = 8
      end
      object dbmmo2: TDBMemo
        Left = 133
        Top = 384
        Width = 406
        Height = 69
        DataField = 'Result'
        DataSource = dsBadRecord
        TabOrder = 9
      end
    end
  end
  object cdsBadRecord: TClientDataSet
    Aggregates = <>
    CommandText = 'SELECT  QC_IQCBadRecord.*  FROM QC_IQCBadRecord'
    Params = <>
    Left = 472
    Top = 32
  end
  object dsBadRecord: TDataSource
    DataSet = cdsBadRecord
    Left = 552
    Top = 32
  end
end
