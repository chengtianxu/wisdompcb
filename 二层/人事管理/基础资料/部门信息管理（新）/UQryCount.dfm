object FrmQryCount: TFrmQryCount
  Left = 392
  Top = 194
  Width = 838
  Height = 515
  Caption = #21508#37096#38376#20154#21592#26597#35810#27719#24635
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
    Width = 822
    Height = 33
    Align = alTop
    TabOrder = 0
    object lblFilter: TLabel
      Left = 256
      Top = 11
      Width = 48
      Height = 13
      Alignment = taRightJustify
      Caption = #37096#38376#20195#30721
    end
    object btnExport: TBitBtn
      Left = 598
      Top = -5
      Width = 63
      Height = 38
      Caption = #23548#20986
      TabOrder = 0
      OnClick = btnExportClick
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
    object edtFilter: TEdit
      Left = 308
      Top = 7
      Width = 121
      Height = 21
      TabOrder = 1
      OnChange = edtFilterChange
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 33
    Width = 822
    Height = 444
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 1
    object dbgrdh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 820
      Height = 442
      Align = alClient
      DataSource = ds1
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
      OnTitleClick = dbgrdh1TitleClick
      Columns = <
        item
          EditButtons = <>
          FieldName = #37096#38376#21517#31216
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = #23450#39069#20154#25968
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = #29616#26377#20154#25968
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = #19968#32447#20154#25968
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = #20108#32447#20154#25968
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = #31649#29702#20154#25968
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = #25216#26415#31867#20154#25968
          Footers = <>
          Width = 67
        end>
    end
  end
  object qry1: TADOQuery
    Connection = DM.ADOConnection1
    Parameters = <>
    SQL.Strings = (
      ''
      
        'select  a.departmentName  as '#37096#38376#21517#31216', isnull(a.departmentration,0)a' +
        's '#23450#39069#20154#25968',isnull(a.departmentcount,0) as '#29616#26377#20154#25968','
      
        'isnull(bb.'#19968#32447#20154#25968',0)'#19968#32447#20154#25968'  ,isnull(bb.'#20108#32447#20154#25968',0)'#20108#32447#20154#25968' ,isnull(bb.'#31649#29702#20154#25968',0)' +
        #31649#29702#20154#25968',isnull(bb.'#25216#26415#31867#20154#25968',0)'#25216#26415#31867#20154#25968
      'from  datadepartment a'
      'left join '
      '(select   departmentid, '
      'sum('#19968#32447#20154#25968')'#19968#32447#20154#25968',sum('#20108#32447#20154#25968')'#20108#32447#20154#25968',sum('#31649#29702#20154#25968')'#31649#29702#20154#25968',sum('#25216#26415#31867#20154#25968')'#25216#26415#31867#20154#25968
      'from '
      '('
      'select   a.departmentid, '
      
        'case  when ( charindex('#39#21592#24037#39',b.item)>0 ) then 1  else 0  end as '#19968 +
        #32447#20154#25968','
      
        'case  when ( charindex('#39#21592#24037#39',b.item)>0 ) then 0  else 1  end as '#20108 +
        #32447#20154#25968','
      ''
      
        'case  when ( charindex('#39#20027#31649#39',b.item)>0 or charindex('#39#32463#29702#39',b.item)>' +
        '0  or charindex('#39#21103#24635#39',b.item)>0  or charindex('#39#24635#30417#39',b.item)>0 )'
      ' then 1  else 0  end as '#31649#29702#20154#25968','
      ''
      
        'case  when ( charindex('#39#24037#31243#24072#39',b.item)>0 or charindex('#39#25216#26415#21592#39',b.item' +
        ')>0  ) then 1  else 0  end as '#25216#26415#31867#20154#25968
      ''
      'FROM  employeemsg a'
      'inner JOIN dbo.datadetail b ON  a.Position = b.rkey '
      'inner join datadepartment c  on a.departmentid=c.rkey '
      'WHERE ( a.status=1  or a.status=0)  and c.invalid=0'
      ')aa'
      'group by  departmentid)bb'
      'on a.rkey=bb.departmentid'
      'where a.invalid=0')
    Left = 256
    Top = 184
    object wdstrngfldqry1DSDesigner: TWideStringField
      FieldName = #37096#38376#21517#31216
    end
    object intgrfldqry1DSDesigner2: TIntegerField
      FieldName = #23450#39069#20154#25968
      ReadOnly = True
    end
    object intgrfldqry1DSDesigner3: TIntegerField
      FieldName = #29616#26377#20154#25968
      ReadOnly = True
    end
    object intgrfldqry1DSDesigner4: TIntegerField
      FieldName = #19968#32447#20154#25968
      ReadOnly = True
    end
    object intgrfldqry1DSDesigner5: TIntegerField
      FieldName = #20108#32447#20154#25968
      ReadOnly = True
    end
    object intgrfldqry1DSDesigner6: TIntegerField
      FieldName = #31649#29702#20154#25968
      ReadOnly = True
    end
    object intgrfldqry1DSDesigner7: TIntegerField
      FieldName = #25216#26415#31867#20154#25968
      ReadOnly = True
    end
  end
  object ds1: TDataSource
    DataSet = qry1
    Left = 512
    Top = 144
  end
end
