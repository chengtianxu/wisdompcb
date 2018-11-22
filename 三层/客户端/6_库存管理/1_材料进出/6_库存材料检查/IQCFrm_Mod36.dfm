inherited FrmIQC_Mod36: TFrmIQC_Mod36
  BorderStyle = bsSingle
  Caption = 'IQC'#19994#21153#22788#29702
  ClientHeight = 375
  ClientWidth = 534
  Font.Height = -13
  Font.Name = #23435#20307
  OnClose = FormClose
  ExplicitWidth = 540
  ExplicitHeight = 404
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 534
    Height = 375
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 534
    ExplicitHeight = 375
    inherited pnl1: TPanel
      Width = 532
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 532
      inherited btnSave: TBitBtn
        OnClick = btnSaveClick
      end
      inherited btnClose: TBitBtn
        OnClick = btnCloseClick
      end
    end
    inherited pnl2: TPanel
      Width = 532
      Height = 340
      ExplicitLeft = 1
      ExplicitTop = 34
      ExplicitWidth = 532
      ExplicitHeight = 340
      object Label1: TLabel
        Left = 35
        Top = 8
        Width = 59
        Height = 13
        Caption = #36865#36135#26085#26399':'
      end
      object Label2: TLabel
        Left = 36
        Top = 31
        Width = 59
        Height = 13
        Caption = #26448#26009#20195#30721':'
      end
      object Label3: TLabel
        Left = 35
        Top = 53
        Width = 59
        Height = 13
        Caption = #26448#26009#21517#31216':'
      end
      object Label4: TLabel
        Left = 35
        Top = 75
        Width = 59
        Height = 13
        Caption = #24453#26816#25968#37327':'
      end
      object Label5: TLabel
        Left = 35
        Top = 99
        Width = 59
        Height = 13
        Caption = #25253#24223#25968#37327':'
      end
      object Label6: TLabel
        Left = 35
        Top = 121
        Width = 59
        Height = 13
        Caption = #36864#36135#25968#37327':'
      end
      object Label7: TLabel
        Left = 11
        Top = 144
        Width = 85
        Height = 13
        Caption = #36865#20132#36135#20179#25968#37327':'
      end
      object Label9: TLabel
        Left = 274
        Top = 8
        Width = 59
        Height = 13
        Caption = #23384#36135#21333#20301':'
      end
      object Label10: TLabel
        Left = 273
        Top = 31
        Width = 59
        Height = 13
        Caption = #29615#20445#26631#35782':'
      end
      object Label8: TLabel
        Left = 285
        Top = 54
        Width = 46
        Height = 13
        Caption = #26377#25928#26399':'
      end
      object Label11: TLabel
        Left = 297
        Top = 75
        Width = 33
        Height = 13
        Caption = #20179#24211':'
      end
      object RKeyRzBtnEdit1: TRKeyRzBtnEdit
        Left = 94
        Top = 27
        Width = 148
        Height = 21
        Text = ''
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 0
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds22
        DataSourceField = 'INVENTORY_PTR'
        DispalyTableName = 'data0017'
        DisplaytextField = 'INV_PART_NUMBER'
        DisplayRetKeyField = 'rkey'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RKeyRzBtnEdit2: TRKeyRzBtnEdit
        Left = 94
        Top = 50
        Width = 148
        Height = 21
        Text = ''
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 1
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds22
        DataSourceField = 'INVENTORY_PTR'
        DispalyTableName = 'data0017'
        DisplaytextField = 'INV_NAME'
        DisplayRetKeyField = 'rkey'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RKeyRzBtnEdit3: TRKeyRzBtnEdit
        Left = 94
        Top = 73
        Width = 148
        Height = 21
        Text = ''
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 2
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds22
        DataSourceField = 'QUAN_IN_INSP'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RKeyRzBtnEdit6: TRKeyRzBtnEdit
        Left = 94
        Top = 4
        Width = 148
        Height = 21
        Text = ''
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 3
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds22
        DataSourceField = 'GRN_PTR'
        DispalyTableName = 'data0456'
        DisplaytextField = 'ship_DATE'
        DisplayRetKeyField = 'rkey'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RKeyRzBtnEdit8: TRKeyRzBtnEdit
        Left = 331
        Top = 2
        Width = 121
        Height = 21
        Text = ''
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 4
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds22
        DataSourceField = 'LOCATION_PTR_FROM'
        DispalyTableName = 'data0002'
        DisplaytextField = 'UNIT_NAME'
        DisplayRetKeyField = 'rkey'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RKeyRzBtnEdit9: TRKeyRzBtnEdit
        Left = 331
        Top = 27
        Width = 121
        Height = 21
        Text = ''
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 5
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds22
        DataSourceField = 'rohs'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RKeyRzBtnEdit11: TRKeyRzBtnEdit
        Left = 331
        Top = 73
        Width = 121
        Height = 21
        Text = ''
        TabOrder = 6
        ButtonKind = bkFind
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds22
        DataSourceField = 'LOCATION_PTR'
        DispalyTableName = 'data0016'
        DisplaytextField = 'code'
        DisplayRetKeyField = 'rkey'
        DisplayNoteField = 'location'
        DisplayPickID = '1'
        DisplayModID = 36
        ForceOnFocus = True
      end
      object DBDateTimeEditEh1: TDBDateTimeEditEh
        Left = 331
        Top = 50
        Width = 121
        Height = 21
        DataField = 'EXPIRE_DATE'
        DataSource = ds22
        DynProps = <>
        EditButtons = <>
        Kind = dtkDateEh
        TabOrder = 7
        Visible = True
      end
      object Edit1: TEdit
        Left = 94
        Top = 142
        Width = 148
        Height = 21
        TabOrder = 8
        Text = '0'
        OnExit = Edit1Exit
        OnKeyPress = Edit1KeyPress
      end
      object DBGridEh1: TDBGridEh
        Left = 1
        Top = 181
        Width = 530
        Height = 158
        Align = alBottom
        DataSource = DataSource1
        DynProps = <>
        PopupMenu = PopupMenu1
        TabOrder = 9
        Columns = <
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'handlemethod'
            Footers = <>
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'quantity'
            Footers = <>
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'code'
            Footers = <>
            Width = 104
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'reject_description'
            Footers = <>
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object EdtBFSL: TEdit
        Left = 94
        Top = 96
        Width = 148
        Height = 21
        ReadOnly = True
        TabOrder = 10
        Text = '0'
      end
      object EdtTHSL: TEdit
        Left = 94
        Top = 119
        Width = 148
        Height = 21
        ReadOnly = True
        TabOrder = 11
        Text = '0'
      end
    end
  end
  object cds22: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 128
    Top = 56
  end
  object ds22: TDataSource
    DataSet = cds22
    Left = 176
    Top = 56
  end
  object PopupMenu1: TPopupMenu
    Left = 208
    Top = 248
    object N1: TMenuItem
      Caption = #26032#22686
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #21024#38500
      OnClick = N2Click
    end
  end
  object cds95: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 128
    Top = 112
  end
  object cds96: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 128
    Top = 160
  end
  object cds17: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 216
    Top = 168
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 344
    Top = 136
    object ClientDataSet1handlemethod: TStringField
      DisplayLabel = #22788#29702#26041#24335
      FieldName = 'handlemethod'
    end
    object ClientDataSet1quantity: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'quantity'
    end
    object ClientDataSet1code: TStringField
      DisplayLabel = #32570#38519#32534#21495
      FieldName = 'code'
      Size = 30
    end
    object ClientDataSet1reject_description: TStringField
      DisplayLabel = #32570#38519#25551#36848
      FieldName = 'reject_description'
      Size = 30
    end
    object ClientDataSet1rkey76: TIntegerField
      FieldName = 'rkey76'
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 424
    Top = 136
  end
  object cds22_2: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 488
    Top = 256
  end
end
