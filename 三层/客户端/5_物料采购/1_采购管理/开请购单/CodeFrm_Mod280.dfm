inherited frmCode_Mod280: TfrmCode_Mod280
  Caption = #23457#25209#20195#30721
  ClientHeight = 460
  ClientWidth = 589
  ExplicitWidth = 605
  ExplicitHeight = 499
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 589
    Height = 460
    ExplicitWidth = 589
    ExplicitHeight = 460
    inherited pnlDisplayMain: TPanel
      Width = 589
      Height = 460
      ExplicitWidth = 589
      ExplicitHeight = 460
      inherited pnlChildMain: TPanel
        Width = 587
        Height = 458
        ExplicitWidth = 587
        ExplicitHeight = 458
        inherited pnlEhMainDisplay: TPanel
          Width = 585
          Height = 427
          ExplicitWidth = 585
          ExplicitHeight = 427
          inherited ehMain: TDBGridEh
            Width = 583
            Height = 200
            Align = alTop
            OnDblClick = ehMainDblClick
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CODE'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #23457#25209#20195#30721
                Width = 89
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PURCHASE_APPROV_DESC'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #35828#26126
                Width = 153
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'DEPT_CODE'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #37096#38376#20195#30721
                Width = 75
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'DEPT_NAME'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #37096#38376#21517#31216
                Width = 117
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'type_c'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #23457#25209#31867#22411
                Width = 84
              end>
          end
          object pnl1: TPanel
            Left = 1
            Top = 201
            Width = 583
            Height = 225
            Align = alClient
            TabOrder = 1
            object pnl2: TPanel
              Left = 1
              Top = 1
              Width = 581
              Height = 32
              Align = alTop
              TabOrder = 0
              object lbl1: TLabel
                Left = 16
                Top = 8
                Width = 48
                Height = 13
                Caption = #23457#25209#20154#21592
              end
            end
            object ehDetail: TDBGridEh
              Left = 1
              Top = 33
              Width = 581
              Height = 191
              Align = alClient
              DataSource = dsDetail
              DynProps = <>
              TabOrder = 1
              Columns = <
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'USER_LOGIN_NAME'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #20154#21592#20195#30721
                  Width = 85
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'USER_FULL_NAME'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #20154#21592#21517#31216
                  Width = 144
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'LOWER_LIMIT'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #37329#39069#19979#38480
                  Width = 83
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'UPPER_LIMIT'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #37329#39069#19978#38480
                  Width = 90
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 585
          ExplicitWidth = 585
          inherited lblFilter: TLabel
            Left = 155
            Top = 7
            Caption = #23457#25209#20195#30721
            ExplicitLeft = 155
            ExplicitTop = 7
          end
          inherited btnExit: TBitBtn
            Visible = False
          end
          inherited btnRefresh: TBitBtn
            Visible = False
          end
          inherited btnExportToExcel: TBitBtn
            Left = 260
            Align = alRight
            Visible = False
            ExplicitLeft = 260
          end
          inherited btnQry: TBitBtn
            Left = 325
            Align = alRight
            Visible = False
            ExplicitLeft = 325
          end
          inherited btnZD: TBitBtn
            Left = 520
            Align = alRight
            Visible = False
            ExplicitLeft = 520
          end
          inherited edtFliter: TEdit
            Left = 209
            Top = 2
            ExplicitLeft = 209
            ExplicitTop = 2
          end
          inherited btnDY: TBitBtn
            Left = 390
            Align = alRight
            ExplicitLeft = 390
          end
          inherited btnAuthDispatch: TBitBtn
            Left = 455
            Align = alRight
            Visible = False
            ExplicitLeft = 455
          end
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    CommandText = 
      'SELECT    dbo.Data0094.rkey, dbo.Data0094.CODE,dbo.Data0094.PURC' +
      'HASE_APPROV_DESC, dbo.Data0034.DEPT_CODE, dbo.Data0034.DEPT_NAME' +
      ','#13#10'case when Data0094.type=0 then '#39#35831#36141#23457#25209#39#13#10'      when Data0094.ty' +
      'pe=1 then '#39#22806#21457#23457#25209#39' '#13#10'      when Data0094.type=2 then '#39#39046#26009#23457#25209#39' end ty' +
      'pe_c'#13#10'FROM         dbo.Data0094 INNER JOIN'#13#10'                    ' +
      '  dbo.Data0034 ON dbo.Data0094.dept_ptr = dbo.Data0034.RKEY'#13#10'whe' +
      're  dbo.Data0094.type=0 and (data0034.ACTIVE_FLAG=0) '
    AfterScroll = cdsMainAfterScroll
    Left = 400
    Top = 152
  end
  inherited dsMain: TDataSource
    Left = 456
    Top = 152
  end
  inherited pmZD: TPopupMenu
    Left = 528
    Top = 104
  end
  inherited cdsMainWhereInit: TClientDataSet
    Left = 464
    Top = 96
  end
  object cdsDetail: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT     dbo.Data0275.*, dbo.Data0073.USER_FULL_NAME, dbo.Data' +
      '0073.USER_LOGIN_NAME'#13#10'FROM         dbo.Data0275 INNER JOIN'#13#10'    ' +
      '                  dbo.Data0073 ON dbo.Data0275.USER_PTR = dbo.Da' +
      'ta0073.RKEY'#13#10
    Params = <>
    Left = 408
    Top = 360
  end
  object dsDetail: TDataSource
    DataSet = cdsDetail
    Left = 480
    Top = 360
  end
end
