inherited frmMainAuditFLow_mod67: TfrmMainAuditFLow_mod67
  Caption = 'frmMainAuditFLow_mod67'
  ClientHeight = 465
  ClientWidth = 765
  ExplicitWidth = 781
  ExplicitHeight = 504
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 765
    Height = 465
    ExplicitWidth = 765
    ExplicitHeight = 465
    inherited pnlDisplayMain: TPanel
      Width = 765
      Height = 465
      ExplicitWidth = 765
      ExplicitHeight = 465
      inherited pnlChildMain: TPanel
        Width = 763
        Height = 463
        ExplicitWidth = 763
        ExplicitHeight = 463
        inherited pnlEhMainDisplay: TPanel
          Width = 761
          Height = 432
          ExplicitWidth = 761
          ExplicitHeight = 432
          inherited ehMain: TDBGridEh
            Width = 759
            Height = 256
            Align = alTop
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CODE'
                Footers = <>
                Title.Caption = #23457#25209#20195#30721
                Width = 107
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PURCHASE_APPROV_DESC'
                Footers = <>
                Title.Caption = #35828#26126' '
                Width = 190
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'DEPT_CODE'
                Footers = <>
                Title.Caption = #37096#38376#20195#30721
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'DEPT_NAME'
                Footers = <>
                Title.Caption = #37096#38376#21517#31216
                Width = 162
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'type_c'
                Footers = <>
                Title.Caption = #23457#25209#31867#21035
                Width = 71
              end>
          end
          object eh275: TDBGridEh
            Left = 1
            Top = 257
            Width = 759
            Height = 174
            Align = alClient
            DataSource = ds275
            DynProps = <>
            ReadOnly = True
            TabOrder = 1
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'USER_LOGIN_NAME'
                Footers = <>
                Title.Caption = #20154#21592#20195#30721
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'USER_FULL_NAME'
                Footers = <>
                Title.Caption = #20154#21592#21517#31216
                Width = 96
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'LOWER_LIMIT'
                Footers = <>
                Title.Caption = #37329#39069#19978#38480
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'UPPER_LIMIT'
                Footers = <>
                Title.Caption = #37329#39069#19979#38480
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ACTIVE_FLAG'
                Footers = <>
                Title.Caption = #26159#21542#31163#32844#20154#21592
                Width = 84
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 761
          ExplicitWidth = 761
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    CommandText = 
      'SELECT    dbo.Data0094.RKEY, dbo.Data0094.CODE, dbo.Data0094.PUR' +
      'CHASE_APPROV_DESC, dbo.Data0094.dept_ptr, dbo.Data0094.mode, '#13#10' ' +
      '               dbo.Data0094.type, dbo.Data0034.DEPT_CODE, dbo.Da' +
      'ta0034.DEPT_NAME,'#13#10'      case  when Data0094.type=0 then '#39#35831#36141#23457#25209#39#13 +
      #10'                when Data0094.type=1 then '#39#22806#21457#23457#25209#39' '#13#10'            ' +
      '    when Data0094.type=2 then '#39#39046#26009#23457#25209#39' end type_c'#13#10'FROM      dbo.D' +
      'ata0094 INNER JOIN'#13#10'                dbo.Data0034 ON dbo.Data0094' +
      '.dept_ptr = dbo.Data0034.RKEY'#13#10'where 1=1'
    AfterScroll = cdsMainAfterScroll
    Left = 360
    Top = 144
  end
  inherited dsMain: TDataSource
    Left = 328
    Top = 144
  end
  inherited pmZD: TPopupMenu
    Left = 280
    Top = 64
  end
  inherited pmMain: TPopupMenu
    Top = 96
    object mniAdd: TMenuItem
      Caption = #26032#24314
      OnClick = mniAddClick
    end
    object mniEdit: TMenuItem
      Caption = #32534#36753
      OnClick = mniEditClick
    end
    object mniCheck: TMenuItem
      Caption = #26816#26597
      OnClick = mniCheckClick
    end
    object mniCopy: TMenuItem
      Caption = #22797#21046
      OnClick = mniCopyClick
    end
    object mniDel: TMenuItem
      Caption = #21024#38500
      OnClick = mniDelClick
    end
    object mniDepOEmp: TMenuItem
      Caption = #21024#38500#31163#32844#20154#21592
      OnClick = mniDepOEmpClick
    end
  end
  inherited cdsMainWhereInit: TClientDataSet
    Left = 712
    Top = 8
  end
  object ds275: TDataSource
    DataSet = cds275
    Left = 288
    Top = 272
  end
  object cds275: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT    dbo.Data0275.RKEY, dbo.Data0275.USER_PTR, dbo.Data0275' +
      '.AUTH_GROUP_PTR, dbo.Data0275.LOWER_LIMIT, dbo.Data0275.UPPER_LI' +
      'MIT, '#13#10'                dbo.Data0073.USER_FULL_NAME, dbo.Data0073' +
      '.USER_LOGIN_NAME,'#13#10'       case  dbo.Data0073.ACTIVE_FLAG when '#39'1' +
      #39' then '#39#31163#32844#20154#21592#39'  else '#39#22312#32844#20154#21592#39' end  as '#39'ACTIVE_FLAG'#39#13#10'FROM      dbo.' +
      'Data0275 INNER JOIN'#13#10'                dbo.Data0073 ON dbo.Data027' +
      '5.USER_PTR = dbo.Data0073.RKEY'#13#10'where 1=1'#13#10
    Params = <>
    Left = 344
    Top = 272
  end
  object cdsTemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 696
    Top = 120
  end
  object qrytemp: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=62ddf8f60269678;Persist Security In' +
      'fo=True;User ID=WZPCBConnect;Initial Catalog=sj_v20_live;Data So' +
      'urce=172.16.8.112'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT    dbo.Data0275.RKEY, dbo.Data0275.USER_PTR, dbo.Data0275' +
        '.AUTH_GROUP_PTR, dbo.Data0275.LOWER_LIMIT, dbo.Data0275.UPPER_LI' +
        'MIT, '
      
        '                dbo.Data0073.USER_FULL_NAME, dbo.Data0073.USER_L' +
        'OGIN_NAME,'
      
        '       case  dbo.Data0073.ACTIVE_FLAG when '#39'1'#39' then '#39#31163#32844#20154#21592#39'  else' +
        ' '#39#22312#32844#20154#21592#39' end  as '#39'ACTIVE_FLAG'#39
      'FROM      dbo.Data0275 INNER JOIN'
      
        '                dbo.Data0073 ON dbo.Data0275.USER_PTR = dbo.Data' +
        '0073.RKEY'
      'where 1=2')
    Left = 560
    Top = 232
    object qrytempLOWER_LIMIT: TFloatField
      FieldName = 'LOWER_LIMIT'
    end
    object qrytempUPPER_LIMIT: TFloatField
      FieldName = 'UPPER_LIMIT'
    end
    object qrytempUSER_LOGIN_NAME: TStringField
      FieldName = 'USER_LOGIN_NAME'
      Size = 15
    end
    object qrytempUSER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object qrytempACTIVE_FLAG: TStringField
      FieldName = 'ACTIVE_FLAG'
      ReadOnly = True
      Size = 8
    end
  end
end
