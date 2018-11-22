object Form1: TForm1
  Left = 241
  Top = 136
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26356#26032#31243#24207#29256#26412
  ClientHeight = 522
  ClientWidth = 754
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 754
    Height = 440
    Align = alClient
    DataSource = DataSource1
    PopupMenu = PopupMenu1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = #20027#27169#22359#21517#31216
        ReadOnly = True
        Visible = True
      end
      item
        Expanded = False
        FieldName = #23376#27169#22359#21517#31216
        ReadOnly = True
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPTION'
        Width = 165
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SEQ_NO'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PREV_TP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROGRAME'
        ReadOnly = True
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VerNo'
        ReadOnly = True
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 754
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label3: TLabel
      Left = 476
      Top = 15
      Width = 54
      Height = 13
      Caption = #31243#24207'EXE:'
    end
    object Label4: TLabel
      Left = 683
      Top = 2
      Width = 21
      Height = 13
      Caption = '   '
    end
    object Label5: TLabel
      Left = 666
      Top = 2
      Width = 46
      Height = 13
      Caption = #35760#24405#25968':'
    end
    object Button2: TButton
      Left = 673
      Top = 17
      Width = 64
      Height = 22
      Caption = #20840#37096#26356#26032
      TabOrder = 0
      OnClick = Button2Click
    end
    object Edit1: TEdit
      Left = 532
      Top = 12
      Width = 121
      Height = 21
      TabOrder = 1
      OnChange = Edit1Change
    end
    object Button1: TButton
      Left = 358
      Top = 10
      Width = 54
      Height = 25
      Caption = #36830#25509
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button3: TButton
      Left = 414
      Top = 10
      Width = 54
      Height = 25
      Caption = #26029#24320
      TabOrder = 3
      OnClick = Button3Click
    end
    object ComboBox3: TComboBox
      Left = 0
      Top = 11
      Width = 121
      Height = 21
      Style = csDropDownList
      DropDownCount = 20
      ItemHeight = 13
      TabOrder = 4
      OnChange = ComboBox3Change
    end
    object Edit2: TEdit
      Left = 122
      Top = 11
      Width = 115
      Height = 21
      TabOrder = 5
    end
    object Edit3: TEdit
      Left = 239
      Top = 11
      Width = 115
      Height = 21
      TabOrder = 6
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 481
    Width = 754
    Height = 41
    Align = alBottom
    TabOrder = 2
    object Button4: TButton
      Left = 8
      Top = 8
      Width = 64
      Height = 25
      Caption = #36864#20986
      TabOrder = 0
      OnClick = Button4Click
    end
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=wisdompcb1077;Persist Security Info' +
      '=True;User ID=sa;Initial Catalog=sj_v20_live;Data Source=172.16.' +
      '68.8'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 88
    Top = 176
  end
  object ADODataSet1: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    AfterOpen = ADODataSet1AfterOpen
    CommandText = 
      'SELECT data0419.PROGRAME, data0419.VerNo, '#13#10'data0419.DESCRIPTION' +
      ', data0419.SEQ_NO, data0419.PREV_TP, SYSTEM_MENU.DESCRIPTION as ' +
      #23376#27169#22359#21517#31216','#13#10' SYSTEM_MAIN.DESCRIPTION as '#20027#27169#22359#21517#31216#13#10'FROM dbo.Data0419 inn' +
      'er join SYSTEM_MENU'#13#10'on data0419.manu_ptr=SYSTEM_MENU.rkey inner' +
      ' join'#13#10' SYSTEM_MAIN on SYSTEM_MENU.main_ptr= SYSTEM_MAIN.rkey'#13#10'w' +
      'here manu_ptr>0'#13#10'order by SYSTEM_MAIN.seq_no, SYSTEM_MENU.seq_no' +
      ','#13#10'data0419.seq_no'
    Parameters = <>
    Left = 152
    Top = 176
    object ADODataSet1PROGRAME: TStringField
      DisplayLabel = #31243#24207'EXE'
      FieldName = 'PROGRAME'
      Size = 50
    end
    object ADODataSet1VerNo: TStringField
      DisplayLabel = #29256#26412#21495
      FieldName = 'VerNo'
      Size = 12
    end
    object ADODataSet1DESCRIPTION: TStringField
      DisplayLabel = #31243#24207#21517#31216
      FieldName = 'DESCRIPTION'
      Size = 50
    end
    object ADODataSet1SEQ_NO: TIntegerField
      DisplayLabel = #25490#24207#21495
      FieldName = 'SEQ_NO'
    end
    object ADODataSet1PREV_TP: TStringField
      DisplayLabel = #26435#38480#20449#24687
      FieldName = 'PREV_TP'
      FixedChar = True
      Size = 5
    end
    object ADODataSet1DSDesigner: TStringField
      FieldName = #23376#27169#22359#21517#31216
      Size = 12
    end
    object ADODataSet1DSDesigner2: TStringField
      FieldName = #20027#27169#22359#21517#31216
      Size = 12
    end
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 120
    Top = 176
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 152
    Top = 216
    object N1: TMenuItem
      Caption = #21333#39033#26356#26032#29256#26412
      OnClick = N1Click
    end
  end
end
