object FrmExpDetail: TFrmExpDetail
  Left = 358
  Top = 232
  Width = 786
  Height = 521
  Caption = #31038#20445#21040#26399#26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 770
    Height = 41
    Align = alTop
    TabOrder = 0
    object lbl1: TLabel
      Left = 203
      Top = 14
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = #24037#21495#65306
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object btnExit: TBitBtn
      Left = 2
      Top = 5
      Width = 64
      Height = 25
      Cursor = crHandPoint
      Hint = #36864#20986
      Caption = #36864#20986
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnExitClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
    end
    object btnExcel: TBitBtn
      Left = 93
      Top = 5
      Width = 64
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
    object edt_value: TEdit
      Left = 246
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 2
      OnChange = edt_valueChange
      OnKeyDown = edt_valueKeyDown
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 41
    Width = 770
    Height = 442
    Align = alClient
    TabOrder = 1
    object dbgrdhDetail: TDBGridEh
      Left = 1
      Top = 1
      Width = 768
      Height = 440
      Align = alClient
      DataSource = ds_Main
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnTitleClick = dbgrdhDetailTitleClick
      Columns = <
        item
          EditButtons = <>
          FieldName = #24037#21495
          Footers = <>
          Width = 53
        end
        item
          EditButtons = <>
          FieldName = #22995#21517
          Footers = <>
          Width = 62
        end
        item
          EditButtons = <>
          FieldName = #24615#21035
          Footers = <>
          Width = 41
        end
        item
          EditButtons = <>
          FieldName = #37096#38376
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = #20986#29983#26085#26399
          Footers = <>
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = #24180#40836
          Footers = <>
          Width = 41
        end
        item
          EditButtons = <>
          FieldName = #20855#20307#24180#40836
          Footers = <>
          Width = 101
        end
        item
          EditButtons = <>
          FieldName = #20837#32844#26085#26399
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = #36523#20221#35777#21495
          Footers = <>
        end>
    end
  end
  object qry_Main: TADOQuery
    Connection = FDM.con1
    Parameters = <>
    SQL.Strings = (
      ''
      '  select * '
      '  from '
      ' ('
      
        'select a.rkey as ID,a.employeecode as '#24037#21495', a.chineseName as '#22995#21517',ca' +
        'se when a.sex=0  then  '#39#22899#39' when a.sex=1 then '#39#30007#39' else '#39#39' end  as' +
        '  '#24615#21035','
      'b.departmentName as '#37096#38376', birthday as '#20986#29983#26085#26399','
      '  (datediff(month,birthday,getdate())-  '
      'case when day(birthday)>day(getdate()) then 1 else 0 end)/12  '
      'as '#24180#40836', '
      '  cast (   '
      '((datediff(month,birthday,getdate())-  '
      'case when day(birthday)>day(getdate()) then 1 else 0 end)/12)  '
      'as nvarchar(10))+'#39#23681#39'+  '
      'cast(  '
      ' ( (datediff(month,birthday,getdate())-  '
      'case when day(birthday)>day(getdate()) then 1 else 0 end)%12)  '
      'as nvarchar(10))+'#39#26376#39'+  '
      'cast(  '
      '(case when   '
      
        'dateadd(month,datediff(month,birthday,getdate()),birthday)>getda' +
        'te()    '
      'then day(getdate())+     '
      
        ' (datediff(day,birthday, dateadd(month,1,convert(datetime,(subst' +
        'ring(convert (nvarchar(20),birthday,120),1,7)+'#39'-01'#39'),120) ) )-1)' +
        '  '
      'else day(getdate())-day(birthday) end)  '
      
        ' as nvarchar(10))+'#39#22825#39' as  '#20855#20307#24180#40836', ondutytime as '#20837#32844#26085#26399',IDCard as '#36523#20221#35777 +
        #21495
      ' from employeemsg   a'
      ' inner join datadepartment b  on a.departmentid=b.rkey'
      ' where a.status<>2'
      ' )aa'
      ' where ('#24615#21035'='#39#22899#39' and  '#24180#40836'>=50) or  ('#24615#21035'='#39#30007#39' and  '#24180#40836'>=60)   '
      ' order by '#24615#21035', '#24180#40836)
    Left = 200
    Top = 121
    object atncfld_MainID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object wdstrngfld_MainDSDesigner: TWideStringField
      FieldName = #24037#21495
    end
    object wdstrngfld_MainDSDesigner2: TWideStringField
      FieldName = #22995#21517
    end
    object strngfld_MainDSDesigner3: TStringField
      FieldName = #24615#21035
      ReadOnly = True
      Size = 2
    end
    object wdstrngfld_MainDSDesigner4: TWideStringField
      FieldName = #37096#38376
    end
    object dtmfld_MainDSDesigner5: TDateTimeField
      FieldName = #20986#29983#26085#26399
    end
    object intgrfld_MainDSDesigner6: TIntegerField
      FieldName = #24180#40836
      ReadOnly = True
    end
    object wdstrngfld_MainDSDesigner7: TWideStringField
      FieldName = #20855#20307#24180#40836
      ReadOnly = True
      Size = 36
    end
    object dtmfld_MainDSDesigner8: TDateTimeField
      FieldName = #20837#32844#26085#26399
    end
    object wdstrngfld_MainDSDesigner9: TWideStringField
      FieldName = #36523#20221#35777#21495
    end
  end
  object ds_Main: TDataSource
    DataSet = qry_Main
    Left = 280
    Top = 137
  end
end
