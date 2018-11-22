inherited frmMainPurBuget_Mod25: TfrmMainPurBuget_Mod25
  Caption = 'frmMainPurBuget_Mod25'
  ClientHeight = 437
  ClientWidth = 805
  ExplicitWidth = 821
  ExplicitHeight = 476
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 805
    Height = 437
    ExplicitWidth = 805
    ExplicitHeight = 437
    inherited pnlDisplayMain: TPanel
      Width = 805
      Height = 437
      ExplicitWidth = 805
      ExplicitHeight = 437
      inherited pnlChildMain: TPanel
        Width = 803
        Height = 435
        ExplicitWidth = 803
        ExplicitHeight = 435
        inherited pnlEhMainDisplay: TPanel
          Width = 801
          Height = 404
          ExplicitWidth = 801
          ExplicitHeight = 404
          inherited ehMain: TDBGridEh
            Width = 799
            Height = 160
            Align = alTop
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CODE'
                Footers = <>
                Title.Caption = #39044#31639#20195#30721
                Width = 63
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'DESCRIPTION'
                Footers = <>
                Title.Caption = #39044#31639#21517#31216
                Width = 109
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'bud_year'
                Footers = <>
                Title.Caption = #39044#31639#24180#26376
                Width = 99
              end>
          end
          object pnlDetail: TPanel
            Left = 1
            Top = 161
            Width = 799
            Height = 242
            Align = alClient
            TabOrder = 1
            object eh363: TDBGridEh
              Left = 1
              Top = 1
              Width = 797
              Height = 240
              Align = alClient
              DataSource = ds363
              DynProps = <>
              ReadOnly = True
              TabOrder = 0
              Columns = <
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'USER_FULL_NAME'
                  Footers = <>
                  Title.Caption = #29992#25143#22995#21517
                  Width = 117
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'USER_LOGIN_NAME'
                  Footers = <>
                  Title.Caption = #29992#25143#32534#30721
                  Width = 114
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'ACTIVE_FLAG'
                  Footers = <>
                  Title.Caption = #26159#21542#31163#32844#20154#21592
                  Width = 97
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 801
          ExplicitWidth = 801
          inherited btnDY: TBitBtn
            Visible = True
          end
          object btn1: TButton
            Left = 711
            Top = 2
            Width = 75
            Height = 25
            Caption = 'btn1'
            TabOrder = 8
            Visible = False
            OnClick = btn1Click
          end
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    CommandText = 
      'select RKEY ,CODE,DESCRIPTION,bud_year '#13#10', BUDGET_PERIOD_1, BUDG' +
      'ET_PERIOD_2, '#13#10'BUDGET_PERIOD_3, BUDGET_PERIOD_4,'#13#10' BUDGET_PERIOD' +
      '_5, BUDGET_PERIOD_6, '#13#10'BUDGET_PERIOD_7, BUDGET_PERIOD_8, '#13#10'BUDGE' +
      'T_PERIOD_9, BUDGET_PERIOD_10, '#13#10'BUDGET_PERIOD_11, BUDGET_PERIOD_' +
      '12,'#13#10'USED_PERIOD_1, USED_PERIOD_2, USED_PERIOD_3,'#13#10' USED_PERIOD_' +
      '4, USED_PERIOD_5, USED_PERIOD_6,'#13#10' USED_PERIOD_7, USED_PERIOD_8,' +
      ' USED_PERIOD_9,'#13#10' USED_PERIOD_10, USED_PERIOD_11, USED_PERIOD_12' +
      #13#10'from data0362'#13#10'where 1= 1'
    AfterScroll = cdsMainAfterScroll
    Left = 352
    Top = 120
  end
  inherited dsMain: TDataSource
    Left = 304
    Top = 120
  end
  inherited pmMain: TPopupMenu
    OnPopup = pmMainPopup
    Left = 176
    Top = 80
    object mniAdd: TMenuItem
      Caption = #26032#24314
      OnClick = mniAddClick
    end
    object mniEdit: TMenuItem
      Caption = #32534#36753
      OnClick = mniEditClick
    end
    object mniCopy: TMenuItem
      Caption = #22797#21046
      OnClick = mniCopyClick
    end
    object mniDel: TMenuItem
      Caption = #21024#38500
      OnClick = mniDelClick
    end
    object mniDelOEmp: TMenuItem
      Caption = #21024#38500#31163#32844#20154#21592
      OnClick = mniDelOEmpClick
    end
  end
  object ds363: TDataSource
    DataSet = cds363
    Left = 288
    Top = 216
  end
  object cds363: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT     Data0073.USER_FULL_NAME, Data0073.USER_LOGIN_NAME, '#13#10 +
      'case Data0073.ACTIVE_FLAG when '#39'1'#39' then '#39#31163#32844#20154#21592#39'  else '#39#22312#32844#20154#21592#39' end ' +
      ' as '#39'ACTIVE_FLAG'#39','#13#10'Data0363.USER_PTR,'#13#10'data0363.BUDGET_PTR'#13#10'FRO' +
      'M         '#13#10'Data0363 INNER JOIN '#13#10'Data0073 ON Data0363.USER_PTR ' +
      '= Data0073.RKEY'#13#10'where 1=1'
    Params = <>
    Left = 344
    Top = 224
  end
  object qrytemp: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=62ddf8f60269678;Persist Security In' +
      'fo=True;User ID=WZPCBConnect;Initial Catalog=sj_v20_live;Data So' +
      'urce=172.16.8.112'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT     Data0073.USER_FULL_NAME, Data0073.USER_LOGIN_NAME, '
      
        'case Data0073.ACTIVE_FLAG when '#39'1'#39' then '#39#31163#32844#20154#21592#39'  else '#39#22312#32844#20154#21592#39' end ' +
        ' as '#39'ACTIVE_FLAG'#39','
      'Data0363.USER_PTR,'
      'data0363.BUDGET_PTR'
      'FROM         '
      'Data0363 INNER JOIN '
      'Data0073 ON Data0363.USER_PTR = Data0073.RKEY'
      'where data0363.BUDGET_PTR =-1')
    Left = 560
    Top = 232
    object qrytempUSER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object qrytempUSER_LOGIN_NAME: TStringField
      FieldName = 'USER_LOGIN_NAME'
      Size = 15
    end
    object qrytempACTIVE_FLAG: TStringField
      FieldName = 'ACTIVE_FLAG'
      ReadOnly = True
      Size = 8
    end
  end
  object cdsTemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 488
    Top = 304
  end
end
