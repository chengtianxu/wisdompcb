object FrmAlert: TFrmAlert
  Left = 197
  Top = 157
  Width = 1088
  Height = 563
  Caption = #35797#29992#26399#39044#35686
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 1072
    Height = 525
    Align = alClient
    TabOrder = 0
    object pnl2: TPanel
      Left = 1
      Top = 1
      Width = 1070
      Height = 48
      Align = alTop
      TabOrder = 0
      object lbl1: TLabel
        Left = 8
        Top = 5
        Width = 457
        Height = 12
        Caption = '1.'#35797#29992#26399#25552#21069#39044#35686#65306#21103#32463#29702#32423#21450#20197#19978#25552#21069'2'#20010#26376#39044#35686#65292#20854#23427#21592#24037#25552#21069#19968#20010#26376#39044#35686
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lbl2: TLabel
        Left = 520
        Top = 5
        Width = 196
        Height = 13
        Caption = '2.'#24050#36807#35797#29992#26399#36824#26410#20570#36716#27491#22788#29702#30340#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object btnExcel: TBitBtn
        Left = 413
        Top = 21
        Width = 60
        Height = 25
        Hint = #23548#20986#25968#25454'Excel'
        Caption = #23548#20986
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = btnExcelClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000120B0000120B00001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DADADADADADA
          DADAADADADADADADADADDADADADADAD00000000000000006666007777777706E
          EF0AA0E6666606EEF0ADDA0E66606EEF060AADA0E606EEF0000DDADA006EEF0A
          DADAADAD06EEF00DADADDAD06EEF0670DADAAD06EEF0E6670DADD06EEF0A0E66
          70DA0FFFF0ADA0EEEE0D00000ADADA00000AADADADADADADADAD}
      end
      object btn1: TBitBtn
        Left = 989
        Top = 21
        Width = 60
        Height = 25
        Hint = #23548#20986#25968#25454'Excel'
        Caption = #23548#20986
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = btn1Click
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000120B0000120B00001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DADADADADADA
          DADAADADADADADADADADDADADADADAD00000000000000006666007777777706E
          EF0AA0E6666606EEF0ADDA0E66606EEF060AADA0E606EEF0000DDADA006EEF0A
          DADAADAD06EEF00DADADDAD06EEF0670DADAAD06EEF0E6670DADD06EEF0A0E66
          70DA0FFFF0ADA0EEEE0D00000ADADA00000AADADADADADADADAD}
      end
    end
    object pnl3: TPanel
      Left = 1
      Top = 49
      Width = 536
      Height = 475
      Align = alLeft
      TabOrder = 1
      object dbgrdh1: TDBGridEh
        Left = 1
        Top = 1
        Width = 534
        Height = 473
        Align = alClient
        DataSource = ds1
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -13
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        Columns = <
          item
            EditButtons = <>
            FieldName = 'employeecode'
            Footers = <>
            Title.Caption = #21592#24037#24037#21495
            Width = 65
          end
          item
            EditButtons = <>
            FieldName = 'chinesename'
            Footers = <>
            Title.Caption = #22995#21517
            Width = 65
          end
          item
            EditButtons = <>
            FieldName = 'departmentname'
            Footers = <>
            Title.Caption = #37096#38376
            Width = 106
          end
          item
            EditButtons = <>
            FieldName = 'position_item'
            Footers = <>
            Title.Caption = #32844#21153
            Width = 82
          end
          item
            EditButtons = <>
            FieldName = 'ondutytime'
            Footers = <>
            Title.Caption = #20837#32844#26085#26399
            Width = 81
          end
          item
            EditButtons = <>
            FieldName = 'adate'
            Footers = <>
            Title.Caption = #35797#29992#36716#27491#21040#26399#26085
            Width = 102
          end>
      end
    end
    object pnl4: TPanel
      Left = 537
      Top = 49
      Width = 534
      Height = 475
      Align = alClient
      TabOrder = 2
      object dbgrdh2: TDBGridEh
        Left = 1
        Top = 1
        Width = 532
        Height = 473
        Align = alClient
        DataSource = ds2
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -13
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        Columns = <
          item
            EditButtons = <>
            FieldName = 'employeecode'
            Footers = <>
            Title.Caption = #21592#24037#24037#21495
            Width = 62
          end
          item
            EditButtons = <>
            FieldName = 'chinesename'
            Footers = <>
            Title.Caption = #22995#21517
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'departmentname'
            Footers = <>
            Title.Caption = #37096#38376
            Width = 113
          end
          item
            EditButtons = <>
            FieldName = 'position_item'
            Footers = <>
            Title.Caption = #32844#21153
            Width = 102
          end
          item
            EditButtons = <>
            FieldName = 'ondutytime'
            Footers = <>
            Title.Caption = #20837#32844#26085#26399
            Width = 78
          end
          item
            EditButtons = <>
            FieldName = 'adate'
            Footers = <>
            Title.Caption = #35797#29992#36716#27491#26085
            Width = 83
          end>
      end
    end
  end
  object ds1: TDataSource
    DataSet = qry1
    Left = 393
    Top = 305
  end
  object ds2: TDataSource
    DataSet = qry2
    Left = 857
    Top = 337
  end
  object qry1: TADOQuery
    Connection = FDM.con1
    Parameters = <>
    SQL.Strings = (
      
        'select  a.employeecode,chinesename,departmentname,position_item,' +
        'ondutytime, adate '
      'from v_employeemsg  a   '
      'where datediff(month,ondutytime,adate)>3'
      'and   datediff(month, getdate(),adate)<=2'
      'and status<>2'
      'and formal=0'
      'union all'
      
        'select  a.employeecode,chinesename,departmentname,position_item,' +
        'ondutytime, adate '
      'from v_employeemsg  a   '
      'where datediff(month,ondutytime,adate)<=3'
      'and   datediff(month, getdate(),adate)<=1'
      'and status<>2'
      'and formal=0')
    Left = 329
    Top = 313
    object wdstrngfldqry1employeecode: TWideStringField
      FieldName = 'employeecode'
      ReadOnly = True
    end
    object wdstrngfldqry1chinesename: TWideStringField
      FieldName = 'chinesename'
      ReadOnly = True
    end
    object wdstrngfldqry1departmentname: TWideStringField
      FieldName = 'departmentname'
      ReadOnly = True
    end
    object wdstrngfldqry1position_item: TWideStringField
      FieldName = 'position_item'
      ReadOnly = True
      Size = 50
    end
    object dtmfldqry1ondutytime: TDateTimeField
      FieldName = 'ondutytime'
      ReadOnly = True
    end
    object dtmfldqry1adate: TDateTimeField
      FieldName = 'adate'
      ReadOnly = True
    end
  end
  object qry2: TADOQuery
    Connection = FDM.con1
    Parameters = <>
    SQL.Strings = (
      
        'select  a.employeecode,chinesename,departmentname,position_item,' +
        'ondutytime, adate '
      'from v_employeemsg  a   '
      'where datediff(day,adate,getdate())>0'
      'and status<>2'
      'and formal=0')
    Left = 801
    Top = 329
    object wdstrngfldqry2employeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object wdstrngfldqry2chinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object wdstrngfldqry2departmentname: TWideStringField
      FieldName = 'departmentname'
    end
    object wdstrngfldqry2position_item: TWideStringField
      FieldName = 'position_item'
      ReadOnly = True
      Size = 50
    end
    object dtmfldqry2ondutytime: TDateTimeField
      FieldName = 'ondutytime'
    end
    object dtmfldqry2adate: TDateTimeField
      FieldName = 'adate'
    end
  end
end
