object frmMain_062: TfrmMain_062
  Left = 297
  Top = 152
  Width = 718
  Height = 505
  Caption = #24037#24207#36164#26009#35774#32622
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 607
    Top = 41
    Width = 103
    Height = 414
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    object btnNew: TButton
      Left = 16
      Top = 78
      Width = 75
      Height = 25
      Caption = #26032#22686
      TabOrder = 0
      OnClick = btnNewClick
    end
    object btnEdit: TButton
      Left = 16
      Top = 124
      Width = 75
      Height = 25
      Caption = #32534#36753
      TabOrder = 1
      OnClick = btnEditClick
    end
    object btnDelete: TButton
      Left = 16
      Top = 169
      Width = 75
      Height = 25
      Caption = #21024#38500
      TabOrder = 2
      OnClick = btnDeleteClick
    end
    object Button4: TButton
      Left = 16
      Top = 328
      Width = 75
      Height = 25
      Caption = #20851#38381
      TabOrder = 3
      OnClick = Button4Click
    end
    object btnRefresh: TButton
      Left = 16
      Top = 32
      Width = 75
      Height = 25
      Caption = #21047#26032
      TabOrder = 4
      OnClick = btnRefreshClick
    end
    object Button1: TButton
      Left = 16
      Top = 209
      Width = 75
      Height = 25
      Caption = #23548#20986'EXCEL'
      TabOrder = 5
      OnClick = Button1Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 607
    Height = 414
    Align = alClient
    DataSource = dsMaster
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = N6Click
    OnKeyPress = DBGrid1KeyPress
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Dept_Code'
        Title.Alignment = taCenter
        Title.Caption = #24037#24207#20195#30721
        Title.Color = clRed
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Dept_Name'
        Title.Alignment = taCenter
        Title.Caption = #24037#24207#21517#31216
        Width = 161
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BARCODE_ENTRY_FLAG'
        Title.Caption = #26159#21542#36807#25968
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = #26159#21542#26377#25928
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SEQ_NR'
        Title.Caption = #24207#21495
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GroupCode'
        Title.Alignment = taCenter
        Title.Caption = #29677#32452#20195#30721
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GroupName'
        Title.Alignment = taCenter
        Title.Caption = #29677#32452#21517#31216
        Width = 119
        Visible = True
      end>
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 455
    Width = 710
    Height = 19
    Panels = <
      item
        Text = #25628#32034#65306
        Width = 50
      end
      item
        Width = 150
      end
      item
        Width = 100
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 710
    Height = 41
    Align = alTop
    TabOrder = 3
    object label_Key_Field: TLabel
      Left = 8
      Top = 16
      Width = 105
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #26597#25214#65306#24037#24207#20195#30721
    end
    object edtKeyValue: TEdit
      Left = 120
      Top = 8
      Width = 169
      Height = 21
      TabOrder = 0
      OnChange = edtKeyValueChange
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 240
    Top = 112
    object N1: TMenuItem
      Caption = #26032#22686
      OnClick = btnNewClick
    end
    object N2: TMenuItem
      Caption = #32534#36753
      OnClick = btnEditClick
    end
    object N6: TMenuItem
      Caption = #26816#26597
      OnClick = N6Click
    end
    object N3: TMenuItem
      Caption = #22797#21046
      Visible = False
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object N4: TMenuItem
      Caption = #21024#38500
      OnClick = btnDeleteClick
    end
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 64
    Top = 96
  end
  object adsMaster: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select M.rKey,M.Dept_Code,M.Dept_Name,M.Big_Dept_ptr,D.Dept_Code' +
      ' as GroupCode,D.Dept_Name as GroupName,M.BARCODE_ENTRY_FLAG,M.SE' +
      'Q_NR,'#13#10' case M.ACTIVE_FLAG when 0 then '#39#26377#25928#39' when 1 then '#39#26080#25928#39' end' +
      ' as '#39#26159#21542#26377#25928#39' from data0034 M left join'#13#10'(select rKey,Dept_Code,Dep' +
      't_Name from data0034 where ttype=5)D on '#13#10'M.Big_Dept_ptr=D.rkey'#13 +
      #10'where M.ttype=1'#13#10'order by M.Dept_code'
    Parameters = <>
    Left = 192
    Top = 200
  end
  object dsMaster: TDataSource
    DataSet = adsMaster
    Left = 152
    Top = 104
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 112
    Top = 152
  end
end
