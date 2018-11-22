object frmSameQry: TfrmSameQry
  Left = 390
  Top = 161
  Width = 692
  Height = 638
  Caption = #30456#20284#26495#26597#35810
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 65
    Width = 676
    Height = 535
    Align = alClient
    TabOrder = 0
    object eh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 674
      Height = 533
      Align = alClient
      DataSource = ds1
      FooterColor = clWindow
      FooterFont.Charset = ANSI_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -13
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = 'manu_part_number'
          Footers = <>
          Title.Caption = #26412#21378#32534#21495
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'setLength'
          Footers = <>
          Title.Caption = 'SET'#38271
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'setWidth'
          Footers = <>
          Title.Caption = 'SET'#23485
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'PnlPcsNum'
          Footers = <>
          Title.Caption = 'PCS'#25968'/PNL'
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'SetPcsNum'
          Footers = <>
          Title.Caption = 'PCS'#25968'/SET'
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'rkey'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'SETPERPNL'
          Footers = <>
          Title.Caption = 'SET'#25968'/PNL'
        end>
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 0
    Width = 676
    Height = 65
    Align = alTop
    TabOrder = 1
    object lbl1: TLabel
      Left = 24
      Top = 14
      Width = 47
      Height = 13
      Caption = 'Set'#38271#65306
    end
    object lbl2: TLabel
      Left = 24
      Top = 38
      Width = 47
      Height = 13
      Caption = 'Set'#23485#65306
    end
    object lbl3: TLabel
      Left = 232
      Top = 14
      Width = 75
      Height = 13
      Caption = 'Set/PNL'#25968#65306
    end
    object lbl4: TLabel
      Left = 232
      Top = 40
      Width = 107
      Height = 13
      Caption = 'SET'#23610#23544#30456#24046'+/-'#65306
    end
    object lbl5: TLabel
      Left = 156
      Top = 14
      Width = 14
      Height = 13
      Caption = 'mm'
    end
    object lbl6: TLabel
      Left = 156
      Top = 40
      Width = 14
      Height = 13
      Caption = 'mm'
    end
    object lbl7: TLabel
      Left = 420
      Top = 14
      Width = 13
      Height = 13
      Caption = #20010
    end
    object lbl8: TLabel
      Left = 420
      Top = 40
      Width = 14
      Height = 13
      Caption = 'mm'
    end
    object edt1: TEdit
      Left = 74
      Top = 10
      Width = 79
      Height = 21
      TabOrder = 0
      Text = '1'
      OnExit = edt1Exit
      OnKeyPress = edt1KeyPress
    end
    object edt2: TEdit
      Left = 74
      Top = 34
      Width = 79
      Height = 21
      TabOrder = 1
      Text = '1'
      OnExit = edt1Exit
      OnKeyPress = edt1KeyPress
    end
    object edt3: TEdit
      Left = 344
      Top = 10
      Width = 73
      Height = 21
      TabOrder = 2
      Text = '1'
      OnExit = edt1Exit
      OnKeyPress = edt3KeyPress
    end
    object edt4: TEdit
      Left = 344
      Top = 34
      Width = 73
      Height = 21
      TabOrder = 3
      Text = '0.5'
      OnExit = edt1Exit
      OnKeyPress = edt1KeyPress
    end
    object btn1: TButton
      Left = 512
      Top = 16
      Width = 75
      Height = 25
      Caption = #26597#35810
      TabOrder = 4
      OnClick = btn1Click
    end
  end
  object ds1: TDataSource
    DataSet = adsSameQry
    Left = 608
    Top = 553
  end
  object adsSameQry: TADODataSet
    Connection = DM.ADOConnection1
    CommandText = 
      #13#10'IF OBJECT_ID (N'#39'Tempdb..#TmpSame'#39', N'#39'U'#39') IS NOT NULL DROP TABL' +
      'E #TmpSame'#13#10';'#13#10'with tmp1 as'#13#10'('#13#10'select case when set_lngth >= se' +
      't_width then set_lngth when set_lngth < set_width then set_width' +
      ' end as setLength,'#13#10'case when set_lngth >= set_width then set_wi' +
      'dth when set_lngth < set_width then set_lngth end as setWidth,'#13#10 +
      'manu_part_number,rkey '#13#10'from data0025'#13#10'where PARENT_PTR is null'#13 +
      #10'),'#13#10'tmp2 as '#13#10'('#13#10'select d25.rkey,d279.PARAMETER_VALUE from data' +
      '0025 d25'#13#10'inner join data0279 d279 on d279.source_ptr = d25.rkey' +
      #13#10'inner join data0278 d278 on d278.rkey = d279.PARAMETER_PTR'#13#10'wh' +
      'ere d278.spec_rkey = '#39'3'#39#13#10'),'#13#10'tmp3 as'#13#10'('#13#10'select d25.rkey,d279.P' +
      'ARAMETER_VALUE from data0025 d25'#13#10'inner join data0279 d279 on d2' +
      '79.source_ptr = d25.rkey'#13#10'inner join data0278 d278 on d278.rkey ' +
      '= d279.PARAMETER_PTR'#13#10'where d278.spec_rkey = '#39'JN'#39#13#10'),'#13#10'tmp4 as'#13#10 +
      '('#13#10'select tmp1.*,tmp2.PARAMETER_VALUE as PnlPcsNum, tmp3.PARAMET' +
      'ER_VALUE as SetPcsNum,'#13#10'((case when ISNUMERIC(tmp2.PARAMETER_VAL' +
      'UE) = 1 then cast(tmp2.PARAMETER_VALUE as int) else 0 end) / '#13#10'(' +
      'case when ISNUMERIC(tmp3.PARAMETER_VALUE) = 1 then nullif(cast(t' +
      'mp3.PARAMETER_VALUE as int),0) else 1 end) ) as SETPERPNL'#13#10'from ' +
      'tmp1 '#13#10'inner join tmp2 on tmp1.rkey = tmp2.rkey'#13#10'inner join tmp3' +
      ' on tmp1.rkey = tmp3.rkey'#13#10')'#13#10'select * into #TmpSame from tmp4'#13#10 +
      #13#10'select * from #TmpSame'#13#10'where abs(setlength - :PLen) <= :P1 an' +
      'd abs(setWidth - :PWidth) <= :P2'#13#10'and manu_part_number <> :P3 an' +
      'd SETPERPNL = :P4'
    Parameters = <
      item
        Name = 'PLen'
        Size = -1
        Value = Null
      end
      item
        Name = 'P1'
        Size = -1
        Value = Null
      end
      item
        Name = 'PWidth'
        Size = -1
        Value = Null
      end
      item
        Name = 'P2'
        Size = -1
        Value = Null
      end
      item
        Name = 'P3'
        Size = -1
        Value = Null
      end
      item
        Name = 'P4'
        Size = -1
        Value = Null
      end>
    Left = 560
    Top = 553
    object adsSameQrysetLength: TBCDField
      FieldName = 'setLength'
      Precision = 7
      Size = 3
    end
    object adsSameQrysetWidth: TBCDField
      FieldName = 'setWidth'
      Precision = 7
      Size = 3
    end
    object strngfldSameQrymanu_part_number: TStringField
      FieldName = 'manu_part_number'
    end
    object intgrfldSameQryrkey: TIntegerField
      FieldName = 'rkey'
    end
    object strngfldSameQryPnlPcsNum: TStringField
      FieldName = 'PnlPcsNum'
      Size = 30
    end
    object strngfldSameQrySetPcsNum: TStringField
      FieldName = 'SetPcsNum'
      Size = 30
    end
    object intgrfldSameQrySETPERPNL: TIntegerField
      FieldName = 'SETPERPNL'
    end
  end
end
