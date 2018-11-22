inherited frmMod474ModSet_Edit: TfrmMod474ModSet_Edit
  Caption = #27169#22359#35774#32622
  ClientHeight = 562
  ClientWidth = 792
  OnClose = FormClose
  ExplicitWidth = 808
  ExplicitHeight = 601
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl1: TPanel
    Width = 792
    ExplicitWidth = 792
    inherited btnSave: TBitBtn
      OnClick = btnSaveClick
    end
    inherited btnClose: TBitBtn
      OnClick = btnCloseClick
    end
  end
  inherited pnl2: TPanel
    Width = 792
    Height = 532
    ExplicitWidth = 792
    ExplicitHeight = 532
    object pgc1: TPageControl
      Left = 1
      Top = 1
      Width = 790
      Height = 530
      Align = alClient
      MultiLine = True
      TabOrder = 0
      TabPosition = tpLeft
    end
    object pgc2: TPageControl
      Left = 1
      Top = 1
      Width = 790
      Height = 530
      ActivePage = ts1
      Align = alClient
      TabOrder = 1
      object ts1: TTabSheet
        Caption = #27169#22359#21151#33021#35774#32622
        object pnl4: TPanel
          Left = 0
          Top = 0
          Width = 782
          Height = 32
          Align = alTop
          TabOrder = 0
          object dbtxtDESCRIPTION: TDBText
            Left = 88
            Top = 6
            Width = 176
            Height = 19
            AutoSize = True
            DataField = 'DESCRIPTION'
            DataSource = ds419
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = #40657#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbtxtDESCRIPTION1: TDBText
            Left = 10
            Top = 6
            Width = 187
            Height = 19
            AutoSize = True
            DataField = 'ModID'
            DataSource = ds419
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = #40657#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object pnl5: TPanel
          Left = 0
          Top = 32
          Width = 782
          Height = 470
          Align = alClient
          TabOrder = 1
          object eh1: TDBGridEh
            Left = 1
            Top = 1
            Width = 328
            Height = 468
            Align = alLeft
            DataSource = dsMOdOperators
            DynProps = <>
            PopupMenu = pm1
            ReadOnly = True
            TabOrder = 0
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'OperatorID'
                Footers = <>
                Title.Caption = #21151#33021#20195#30721
                Width = 70
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'OperatorName'
                Footers = <>
                Title.Caption = #21151#33021#21517#23383
                Width = 70
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'OperatorDesc'
                Footers = <>
                Title.Caption = #21151#33021#25551#36848
                Width = 150
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
          object pnl3: TPanel
            Left = 416
            Top = 1
            Width = 365
            Height = 468
            Align = alRight
            TabOrder = 1
            object eh2: TDBGridEh
              Left = 1
              Top = 1
              Width = 363
              Height = 303
              Align = alClient
              DataSource = dsModAuthCards
              DynProps = <>
              PopupMenu = pm2
              TabOrder = 0
              Columns = <
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'AuthCardName'
                  Footers = <>
                  ReadOnly = True
                  Title.Caption = #20196#29260#21517#31216
                  Width = 120
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'AuthCardDesc'
                  Footers = <>
                  ReadOnly = True
                  Title.Caption = #20196#29260#25551#36848
                  Width = 120
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'Status'
                  Footers = <>
                  KeyList.Strings = (
                    '1'
                    '0')
                  PickList.Strings = (
                    #26377#25928
                    #26080#25928)
                  Title.Caption = #29366#24577
                  Width = 60
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
            object ehAuthCardOperators: TDBGridEh
              Left = 1
              Top = 304
              Width = 363
              Height = 163
              Align = alBottom
              DataSource = dsAuthCardOperators
              DynProps = <>
              PopupMenu = pm3
              ReadOnly = True
              TabOrder = 1
              Columns = <
                item
                  ButtonStyle = cbsNone
                  DynProps = <>
                  EditButton.Visible = False
                  EditButtons = <>
                  FieldName = 'OperatorID'
                  Footers = <>
                  Title.Caption = #21151#33021#20195#30721
                  Width = 70
                end
                item
                  ButtonStyle = cbsNone
                  DynProps = <>
                  EditButton.Visible = False
                  EditButtons = <>
                  FieldName = 'OperatorName'
                  Footers = <>
                  Title.Caption = #21151#33021#21517#23383
                  Width = 70
                end
                item
                  ButtonStyle = cbsNone
                  DynProps = <>
                  EditButton.Visible = False
                  EditButtons = <>
                  FieldName = 'OperatorDesc'
                  Footers = <>
                  Title.Caption = #21151#33021#25551#36848
                  Width = 150
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
          end
          object btnAddToModAuthCard: TButton
            Left = 335
            Top = 104
            Width = 75
            Height = 25
            Caption = #28155#21152#21040#20196#29260
            TabOrder = 2
            OnClick = btnAddToModAuthCardClick
          end
        end
      end
    end
  end
  object cds419: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 176
    Top = 120
  end
  object ds419: TDataSource
    DataSet = cds419
    Left = 176
    Top = 173
  end
  object cdsModOperators: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 112
    Top = 256
  end
  object dsMOdOperators: TDataSource
    DataSet = cdsModOperators
    Left = 112
    Top = 312
  end
  object cdsModAuthCards: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = cdsModAuthCardsAfterScroll
    Left = 528
    Top = 224
  end
  object dsModAuthCards: TDataSource
    DataSet = cdsModAuthCards
    Left = 624
    Top = 224
  end
  object cdsAuthCardOperators: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 488
    Top = 456
  end
  object dsAuthCardOperators: TDataSource
    DataSet = cdsAuthCardOperators
    Left = 616
    Top = 456
  end
  object pm1: TPopupMenu
    OnPopup = pm1Popup
    Left = 208
    Top = 272
    object mniAddNewOperator: TMenuItem
      Caption = #26032#22686
      OnClick = mniAddNewOperatorClick
    end
    object mniEditModOperator: TMenuItem
      Caption = #32534#36753
      OnClick = mniEditModOperatorClick
    end
    object mniDeleModOperator: TMenuItem
      Caption = #21024#38500
      OnClick = mniDeleModOperatorClick
    end
  end
  object pm2: TPopupMenu
    OnPopup = pm2Popup
    Left = 608
    Top = 176
    object mniAddNewCard: TMenuItem
      Caption = #26032#22686
      OnClick = mniAddNewCardClick
    end
    object mniEditModCard: TMenuItem
      Caption = #32534#36753
      OnClick = mniEditModCardClick
    end
    object mniDeleModCard: TMenuItem
      Caption = #21024#38500
      OnClick = mniDeleModCardClick
    end
  end
  object pm3: TPopupMenu
    Left = 680
    Top = 432
    object N3: TMenuItem
      Caption = #21024#38500
      OnClick = N3Click
    end
  end
end
