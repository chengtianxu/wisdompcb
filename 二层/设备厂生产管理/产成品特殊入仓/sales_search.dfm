object Form_so: TForm_so
  Left = 362
  Top = 265
  Width = 654
  Height = 428
  Caption = #38144#21806#24320#21333#25628#32034
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 357
    Width = 646
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  object Panel1: TPanel
    Left = 0
    Top = 360
    Width = 646
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      646
      41)
    object Button1: TButton
      Left = 244
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 332
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 646
    Height = 34
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 246
      Top = 12
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #38144#21806#35746#21333
    end
    object Label2: TLabel
      Left = 3
      Top = 10
      Width = 13
      Height = 13
      Caption = #20174
    end
    object Label3: TLabel
      Left = 118
      Top = 10
      Width = 13
      Height = 13
      Caption = #21040
    end
    object Edit1: TEdit
      Left = 302
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object DateTimePicker1: TDateTimePicker
      Left = 19
      Top = 7
      Width = 94
      Height = 21
      Date = 38822.000000000000000000
      Time = 38822.000000000000000000
      TabOrder = 1
      OnChange = DateTimePicker1Change
    end
    object DateTimePicker2: TDateTimePicker
      Left = 134
      Top = 7
      Width = 94
      Height = 21
      Date = 38822.000000000000000000
      Time = 38822.000000000000000000
      TabOrder = 2
      OnChange = DateTimePicker1Change
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 34
    Width = 646
    Height = 323
    Align = alClient
    DataSource = DM.ds98
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'RMA_NUMBER'
        Title.Caption = #36864#36135#21333#21495
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RMA_DATE'
        Title.Caption = #36864#36135#26085#26399
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTY_AUTH'
        Title.Caption = #36864#36135#25968#37327
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUST_CODE'
        Title.Caption = #23458#25143#20195#30721
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUSTOMER_NAME'
        Title.Caption = #23458#25143#21517#31216
        Width = 125
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Title.Caption = #36755#20837#20154#21592
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20986#20179#21333#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20986#20179#26085#26399
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sales_order'
        Title.Caption = #38144#21806#21333#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TStatus'
        Title.Caption = #29366#24577
        Visible = True
      end>
  end
end
