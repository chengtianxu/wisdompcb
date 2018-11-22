inherited frmAddNewDispathOperator: TfrmAddNewDispathOperator
  Caption = #27169#22359#25480#26435
  ClientHeight = 496
  ClientWidth = 641
  OnCreate = FormCreate
  ExplicitWidth = 657
  ExplicitHeight = 535
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl1: TPanel
    Width = 641
    ExplicitWidth = 641
    inherited btnSave: TBitBtn
      OnClick = btnSaveClick
    end
    inherited btnClose: TBitBtn
      OnClick = btnCloseClick
    end
  end
  inherited pnl2: TPanel
    Width = 641
    Height = 466
    ExplicitWidth = 641
    ExplicitHeight = 466
    object pnl3: TPanel
      Left = 1
      Top = 1
      Width = 639
      Height = 32
      Align = alTop
      TabOrder = 0
      object lbl1: TLabel
        Left = 22
        Top = 9
        Width = 60
        Height = 13
        Caption = #36873#25321#29992#25143#65306
      end
      object lbl3: TLabel
        Left = 450
        Top = 10
        Width = 12
        Height = 13
        Caption = #33267
      end
      object lbl2: TLabel
        Left = 242
        Top = 8
        Width = 84
        Height = 13
        Caption = #25480#26435#26377#25928#26085#26399#65306
      end
      object dtpEnd: TDateTimePicker
        Left = 472
        Top = 5
        Width = 110
        Height = 21
        Date = 72686.999988425930000000
        Time = 72686.999988425930000000
        TabOrder = 0
      end
      object dtpBegin: TDateTimePicker
        Left = 328
        Top = 5
        Width = 110
        Height = 21
        Date = 42669.000000000000000000
        Time = 42669.000000000000000000
        TabOrder = 1
      end
      object edt1: TRzButtonEdit
        Left = 80
        Top = 6
        Width = 145
        Height = 21
        Text = ''
        TabOrder = 2
        ButtonKind = bkFind
        AltBtnWidth = 15
        ButtonWidth = 15
        OnButtonClick = edt1ButtonClick
      end
    end
    object pnl4: TPanel
      Left = 1
      Top = 33
      Width = 639
      Height = 432
      Align = alClient
      TabOrder = 1
      object grp1: TGroupBox
        Left = 1
        Top = 1
        Width = 637
        Height = 430
        Align = alClient
        Caption = #21487#25480#26435#21151#33021#39033#30446
        TabOrder = 0
        object pnl6: TPanel
          Left = 2
          Top = 15
          Width = 633
          Height = 413
          Align = alClient
          TabOrder = 0
          object eh1: TDBGridEh
            Left = 1
            Top = 1
            Width = 631
            Height = 411
            Align = alClient
            DataSource = dsAuthCardOperator
            DynProps = <>
            TabOrder = 0
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'Checked'
                Footers = <>
                Title.Caption = #36873
                Width = 30
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'OperatorID'
                Footers = <>
                ReadOnly = True
                Title.Caption = #21151#33021#21495
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'OperatorName'
                Footers = <>
                ReadOnly = True
                Title.Caption = #21151#33021#21517#31216
                Width = 120
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'OperatorDesc'
                Footers = <>
                ReadOnly = True
                Title.Caption = #21151#33021#25551#36848
                Width = 180
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
        end
      end
    end
  end
  object cdsAuthCardOperator: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT Checked,Tier3_UserModAuthCards.IDKey as MasterCardIDKey,T' +
      'ier3_ModOperators.IDKey as OperatorIDKey,OperatorID,OperatorName' +
      ',OperatorDesc FROM Tier3_UserModAuthCards'#13#10'INNER JOIN Tier3_ModA' +
      'uthCardOperators on Tier3_ModAuthCardOperators.ModAuthCard_IDKey' +
      ' = Tier3_UserModAuthCards.ModAuthCard_IDKey'#13#10'INNER JOIN Tier3_Mo' +
      'dOperators on Tier3_ModOperators.IDKey = ModOperator_IDKey'#13#10'Inne' +
      'r Join Tier3_Checked on 1=1'
    Params = <>
    Left = 96
    Top = 184
    object cdsAuthCardOperatorMasterCardIDKey: TStringField
      FieldName = 'MasterCardIDKey'
      FixedChar = True
      Size = 38
    end
    object cdsAuthCardOperatorOperatorIDKey: TStringField
      FieldName = 'OperatorIDKey'
      FixedChar = True
      Size = 38
    end
    object cdsAuthCardOperatorOperatorID: TIntegerField
      FieldName = 'OperatorID'
    end
    object cdsAuthCardOperatorOperatorName: TStringField
      FieldName = 'OperatorName'
      Size = 200
    end
    object cdsAuthCardOperatorOperatorDesc: TStringField
      FieldName = 'OperatorDesc'
      Size = 512
    end
    object cdsAuthCardOperatorChecked: TBooleanField
      FieldName = 'Checked'
    end
  end
  object dsAuthCardOperator: TDataSource
    DataSet = cdsAuthCardOperator
    Left = 96
    Top = 256
  end
  object cdsAddUserOperator: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 352
    Top = 184
  end
  object dsAddUserOperator: TDataSource
    Left = 352
    Top = 256
  end
end
