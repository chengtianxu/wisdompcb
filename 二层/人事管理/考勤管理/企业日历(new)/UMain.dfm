object frmMain: TfrmMain
  Left = 325
  Top = 122
  Width = 732
  Height = 589
  Caption = #20225#19994#26085#21382
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 716
    Height = 551
    Align = alClient
    TabOrder = 0
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 368
      Height = 549
      Align = alClient
      TabOrder = 0
      object Panel2: TPanel
        Left = 1
        Top = 1
        Width = 366
        Height = 48
        Align = alTop
        TabOrder = 0
        object lbl1: TLabel
          Left = 88
          Top = 16
          Width = 36
          Height = 13
          Caption = #26376#20221#65306
          Visible = False
        end
        object Label1: TLabel
          Left = 160
          Top = 16
          Width = 36
          Height = 13
          Caption = #36134#22871#65306
          Visible = False
        end
        object cbb_yearMonth: TComboBox
          Left = 121
          Top = 12
          Width = 32
          Height = 21
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ItemHeight = 13
          TabOrder = 0
          Visible = False
          OnChange = cbb_yearMonthChange
        end
        object cbb_SAcc: TComboBox
          Left = 193
          Top = 12
          Width = 48
          Height = 21
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ItemHeight = 13
          TabOrder = 1
          Visible = False
          OnChange = cbb_SAccChange
        end
        object btn_refresh: TButton
          Left = 43
          Top = 2
          Width = 41
          Height = 44
          Caption = #21047#26032
          TabOrder = 2
          OnClick = btn_refreshClick
        end
        object btn_exit: TButton
          Left = 2
          Top = 1
          Width = 41
          Height = 44
          Caption = #36864#20986
          TabOrder = 3
          OnClick = btn_exitClick
        end
      end
      object ehFC: TDBGridEh
        Left = 1
        Top = 49
        Width = 366
        Height = 499
        Align = alClient
        DataSource = dsFC
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        PopupMenu = pmFC
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnTitleClick = ehFCTitleClick
        Columns = <
          item
            EditButtons = <>
            FieldName = #36134#22871
            Footers = <>
            Width = 65
          end
          item
            EditButtons = <>
            FieldName = 'RestDate'
            Footers = <>
            Title.Caption = #26085#26399
            Width = 128
          end
          item
            EditButtons = <>
            FieldName = 'color'
            Footers = <>
            Title.Caption = #39068#33394
            Visible = False
            Width = 41
          end
          item
            EditButtons = <>
            FieldName = 'resttype_name'
            Footers = <>
            Title.Caption = #20551#26085#31867#21035
            Width = 145
          end>
      end
    end
    object pnl2: TPanel
      Left = 369
      Top = 1
      Width = 346
      Height = 549
      Align = alRight
      TabOrder = 1
      object StringGrid1: TStringGrid
        Left = 1
        Top = 1
        Width = 344
        Height = 547
        Align = alClient
        RowCount = 2
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        ParentFont = False
        TabOrder = 0
        OnDrawCell = StringGrid1DrawCell
      end
    end
  end
  object dsFC: TDataSource
    DataSet = qryFC
    Left = 81
    Top = 353
  end
  object qryFC: TADOQuery
    Connection = DM.con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select  a.rkey,  case when CalendarID=0 then '#39#26085#34218#24080#39
      '             when CalendarID=1 then '#39#26376#34218'6'#39
      '             when CalendarID=2 then '#39#26376#34218'5.5'#39
      '             when CalendarID=3 then '#39#26376#34218'5'#39
      
        '             else '#39#20854#23427#39' end as '#36134#22871',RestDate, b.resttype_name,b.col' +
        'or'
      ' from dbo.FactoryCalendar   a '
      '  inner join  Resttypemsg b   on a.Type=b.rkey'
      '  order by a.rkey desc ')
    Left = 129
    Top = 297
    object qryFCrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object qryFCDSDesigner: TStringField
      FieldName = #36134#22871
      ReadOnly = True
      Size = 7
    end
    object qryFCRestDate: TDateTimeField
      FieldName = 'RestDate'
    end
    object qryFCresttype_name: TWideStringField
      FieldName = 'resttype_name'
      Size = 50
    end
    object qryFCcolor: TWideStringField
      FieldName = 'color'
      Size = 12
    end
  end
  object dsRT: TDataSource
    DataSet = qryRT
    Left = 192
    Top = 161
  end
  object qryRT: TADOQuery
    Connection = DM.con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select  * from  Resttypemsg')
    Left = 224
    Top = 249
    object qryRTrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object qryRTresttype_name: TWideStringField
      FieldName = 'resttype_name'
      Size = 50
    end
    object qryRTcolor: TWideStringField
      FieldName = 'color'
      Size = 12
    end
    object qryRTremark: TWideStringField
      FieldName = 'remark'
      Size = 50
    end
  end
  object qryTemp: TADOQuery
    Connection = DM.con1
    Parameters = <>
    Left = 169
    Top = 393
  end
  object pmFC: TPopupMenu
    Left = 105
    Top = 113
    object mni_add: TMenuItem
      Caption = #28155#21152
      OnClick = mni_addClick
    end
    object mni_edit: TMenuItem
      Caption = #32534#36753' '
      OnClick = mni_editClick
    end
    object mni_del: TMenuItem
      Caption = #21024#38500
      OnClick = mni_delClick
    end
  end
  object pm_RT: TPopupMenu
    Left = 153
    Top = 113
    object mni_rAdd: TMenuItem
      Caption = #28155#21152
      OnClick = mni_rAddClick
    end
    object mni_Redit: TMenuItem
      Caption = #32534#36753' '
      Enabled = False
      OnClick = mni_ReditClick
    end
    object mni_Rdel: TMenuItem
      Caption = #21024#38500
      Enabled = False
      OnClick = mni_RdelClick
    end
  end
end
