object frmOldInfo: TfrmOldInfo
  Left = 375
  Top = 164
  Width = 819
  Height = 528
  Caption = #20197#21069#20837#31163#32844#36164#26009
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 811
    Height = 497
    Align = alClient
    TabOrder = 0
    object pnl2: TPanel
      Left = 1
      Top = 1
      Width = 809
      Height = 41
      Align = alTop
      TabOrder = 0
      object lbl_field: TLabel
        Left = 319
        Top = 11
        Width = 26
        Height = 13
        Alignment = taRightJustify
        Caption = #24037#21495
      end
      object lbl1: TLabel
        Left = 24
        Top = 8
        Width = 267
        Height = 13
        Caption = #35813#36523#20221#35777#23545#24212#30340#20154#24050#22312#21508#21378#30340#19978#29677#24773#20917' '#22914#19979#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object edt_value: TEdit
        Left = 351
        Top = 8
        Width = 91
        Height = 21
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = edt_valueChange
      end
    end
    object pnl3: TPanel
      Left = 1
      Top = 42
      Width = 809
      Height = 454
      Align = alClient
      TabOrder = 1
      object eh1: TDBGridEh
        Left = 1
        Top = 1
        Width = 807
        Height = 452
        Align = alClient
        DataSource = ds1
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -13
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnKeyDown = eh1KeyDown
        OnTitleClick = eh1TitleClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'employeecode'
            Footers = <>
            Title.Caption = #24037#21495
            Width = 57
          end
          item
            EditButtons = <>
            FieldName = 'chinesename'
            Footers = <>
            Title.Caption = #22995#21517
            Width = 82
          end
          item
            EditButtons = <>
            FieldName = 'company'
            Footers = <>
            Title.Caption = #24037#21378
            Width = 85
          end
          item
            EditButtons = <>
            FieldName = 'ondutytime'
            Footers = <>
            Title.Caption = #20837#32844#26085#26399
            Width = 106
          end
          item
            EditButtons = <>
            FieldName = 'alterdate'
            Footers = <>
            Title.Caption = #31163#32844#26085#26399
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'item'
            Footers = <>
            Title.Caption = #31163#32844#31867#22411
            Width = 90
          end
          item
            EditButtons = <>
            FieldName = 'reason'
            Footers = <>
            Title.Caption = #31163#32844#21407#22240
          end
          item
            EditButtons = <>
            FieldName = 'hire'
            Footers = <>
            Title.Caption = #27704#19981#24405#29992
            Width = 87
          end>
      end
    end
  end
  object ds1: TDataSource
    DataSet = qry1
    Left = 177
    Top = 138
  end
  object qry1: TADOQuery
    Connection = FDM.con1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'p1'
        Size = -1
        Value = Null
      end
      item
        Name = 'p2'
        Size = -1
        Value = Null
      end
      item
        Name = 'p3'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'select  e.employeecode ,e.chinesename,'#39#28145#22323#20116#26666#39' as company,e.onduty' +
        'time, a.alterdate,de.item,r.item as reason,case e.neverhire  whe' +
        'n 0 then '#39#26080#39' when 1 then '#39#27704#19981#24405#29992#39' end as hire'
      'from  [172.16.0.8].sj_v20_live.dbo.employee_alteration a '
      
        'inner join [172.16.0.8].sj_v20_live.dbo.datadetail de  on a.type' +
        '=de.rkey'
      
        'inner join [172.16.0.8].sj_v20_live.dbo.datadetail R  on a.reaso' +
        'n=R.rkey'
      
        'inner join [172.16.0.8].sj_v20_live.dbo.employeemsg e on a.emplo' +
        'yeeid=e.rkey '
      'where de.dictid=9 and r.dictid=10   and e.status=2'
      'and e.IDCard=:p1 '
      'union all '
      
        'select  e.employeecode ,e.chinesename,'#39#19996#33694#20116#26666#39' as company,e.onduty' +
        'time, a.alterdate,de.item,r.item as reason,case e.neverhire  whe' +
        'n 0 then '#39#26080#39' when 1 then '#39#27704#19981#24405#29992#39' end as hire'
      'from  [172.18.0.8].wisdompcb.dbo.employee_alteration a '
      
        'inner join [172.18.0.8].wisdompcb.dbo.datadetail de  on a.type=d' +
        'e.rkey'
      
        'inner join [172.18.0.8].wisdompcb.dbo.datadetail R  on a.reason=' +
        'R.rkey'
      
        'inner join [172.18.0.8].wisdompcb.dbo.employeemsg e on a.employe' +
        'eid=e.rkey '
      'where de.dictid=9  and r.dictid=10  and e.status=2'
      'and e.IDCard=:p2 '
      'union all '
      
        'select  e.employeecode ,e.chinesename,'#39#26757#24030#20116#26666#39' as company,e.onduty' +
        'time, a.alterdate,de.item,r.item as reason,case e.neverhire  whe' +
        'n 0 then '#39#26080#39' when 1 then '#39#27704#19981#24405#29992#39' end as hire'
      'from  [172.17.0.187].wisdompcb.dbo.employee_alteration a '
      
        'inner join [172.17.0.187].wisdompcb.dbo.datadetail de  on a.type' +
        '=de.rkey'
      
        'inner join [172.17.0.187].wisdompcb.dbo.datadetail R  on a.reaso' +
        'n=R.rkey'
      
        'inner join [172.17.0.187].wisdompcb.dbo.employeemsg e on a.emplo' +
        'yeeid=e.rkey '
      'where de.dictid=9  and r.dictid=10 and e.status=2'
      'and e.IDCard=:p3')
    Left = 305
    Top = 130
    object wdstrngfldqry1employeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object wdstrngfldqry1chinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object strngfldqry1company: TStringField
      FieldName = 'company'
      ReadOnly = True
      Size = 8
    end
    object dtmfldqry1ondutytime: TDateTimeField
      FieldName = 'ondutytime'
    end
    object dtmfldqry1alterdate: TDateTimeField
      FieldName = 'alterdate'
    end
    object wdstrngfldqry1item: TWideStringField
      FieldName = 'item'
      Size = 50
    end
    object wdstrngfldqry1reason: TWideStringField
      FieldName = 'reason'
      Size = 50
    end
    object qry1hire: TStringField
      FieldName = 'hire'
    end
  end
end
