object frmBMList: TfrmBMList
  Left = 350
  Top = 121
  Width = 648
  Height = 636
  Caption = #37096#38376
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 632
    Height = 41
    Align = alTop
    TabOrder = 0
    object edtFilter: TLabeledEdit
      Left = 128
      Top = 8
      Width = 121
      Height = 21
      EditLabel.Width = 72
      EditLabel.Height = 15
      EditLabel.Caption = 'edtFilter'
      EditLabel.Font.Charset = ANSI_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -15
      EditLabel.Font.Name = #40657#20307
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      LabelPosition = lpLeft
      TabOrder = 0
      OnChange = edtFilterChange
      OnKeyPress = edtFilterKeyPress
    end
    object rg1: TRadioGroup
      Left = 272
      Top = -2
      Width = 233
      Height = 41
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #30456#20851#24037#24207
        #20840#37096#24037#24207)
      TabOrder = 1
      OnClick = rg1Click
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 41
    Width = 632
    Height = 517
    Align = alClient
    TabOrder = 1
    object ehBMlist: TDBGridEh
      Left = 177
      Top = 1
      Width = 454
      Height = 515
      Align = alClient
      DataSource = ds1
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = ehBMlistDblClick
      OnTitleClick = ehBMlistTitleClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'steptype'
          Footers = <>
          Title.Caption = #27493#39588#31867#22411
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'step_no'
          Footers = <>
          Title.Caption = #27493#39588#21495
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'dept_code'
          Footers = <>
          Title.Caption = #37096#38376#20195#30721
          Width = 90
        end
        item
          EditButtons = <>
          FieldName = 'dept_name'
          Footers = <>
          Title.Caption = #37096#38376#21517#31216
          Width = 200
        end
        item
          EditButtons = <>
          FieldName = 'rkey34'
          Footers = <>
          Visible = False
        end>
    end
    object tv1: TTreeView
      Left = 1
      Top = 1
      Width = 176
      Height = 515
      Align = alLeft
      Indent = 19
      ReadOnly = True
      TabOrder = 1
      OnChange = tv1Change
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 558
    Width = 632
    Height = 39
    Align = alBottom
    TabOrder = 2
    object btnOK: TButton
      Left = 120
      Top = 8
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnCancel: TButton
      Left = 304
      Top = 8
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
      OnClick = btnCancelClick
    end
  end
  object ds1: TDataSource
    DataSet = adsBMList
    Left = 440
    Top = 513
  end
  object adsBMList: TADODataSet
    Connection = dm1.con1
    CommandText = 
      'select case d48.wtype when 0 then '#39#27491#24120#39' when 2 then '#39#36820#24037#39' when 3 t' +
      'hen '#39#22806#21457#39' end as steptype,'#13#10'd48.step_no,d34.dept_code,d34.dept_na' +
      'me,d34.rkey as rkey34'#13#10'from data0048 d48'#13#10'inner join data0034 d3' +
      '4 on d34.rkey = d48.fm_dept_ptr'#13#10'where d48.wo_ptr = 1'#13#10'group by ' +
      'd48.step_no,d34.dept_code,d34.dept_name, d48.wtype,d34.rkey '#13#10'un' +
      'ion all'#13#10'select '#39#24403#21069#24037#24207#39' as steptype,d56.step as step_no,d34.dept_' +
      'code,d34.dept_name,d34.rkey as rkey34'#13#10'from data0056 d56'#13#10'inner ' +
      'join data0034 d34 on d56.dept_ptr = d34.rkey'#13#10'where d56.wo_ptr =' +
      ' 1 and d34.ACTIVE_FLAG = 0 '#13#10'order by step_no asc'
    Parameters = <>
    Prepared = True
    Left = 400
    Top = 513
    object strngfldBMListsteptype: TStringField
      FieldName = 'steptype'
      ReadOnly = True
      Size = 8
    end
    object adsBMListstep_no: TSmallintField
      FieldName = 'step_no'
      ReadOnly = True
    end
    object strngfldBMListdept_code: TStringField
      FieldName = 'dept_code'
      ReadOnly = True
      Size = 10
    end
    object strngfldBMListdept_name: TStringField
      FieldName = 'dept_name'
      ReadOnly = True
      Size = 30
    end
    object intgrfldBMListrkey34: TIntegerField
      FieldName = 'rkey34'
      ReadOnly = True
    end
  end
end
