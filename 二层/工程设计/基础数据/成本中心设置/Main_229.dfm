object frmMain_229: TfrmMain_229
  Left = 351
  Top = 184
  Width = 607
  Height = 490
  Caption = #25104#26412#26680#31639#22522#30784#35774#32622
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 488
    Top = 41
    Width = 103
    Height = 392
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    object btnNew: TButton
      Left = 16
      Top = 270
      Width = 75
      Height = 25
      Caption = #26032#22686
      TabOrder = 0
      Visible = False
      OnClick = btnNewClick
    end
    object btnEdit: TButton
      Left = 16
      Top = 80
      Width = 75
      Height = 25
      Caption = #32534#36753
      TabOrder = 1
      OnClick = btnEditClick
    end
    object btnDelete: TButton
      Left = 16
      Top = 224
      Width = 75
      Height = 25
      Caption = #21024#38500
      TabOrder = 2
      Visible = False
      OnClick = btnDeleteClick
    end
    object Button4: TButton
      Left = 16
      Top = 320
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
      Top = 128
      Width = 75
      Height = 25
      Caption = #23548#20986
      TabOrder = 5
      OnClick = Button1Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 488
    Height = 392
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
        FieldName = 'DEPT_CODE'
        Title.Alignment = taCenter
        Title.Caption = #24037#24207#20195#30721
        Title.Color = clRed
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEPT_NAME'
        Title.Alignment = taCenter
        Title.Caption = #24037#24207#21517#31216
        Width = 161
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cost_Dept_Code'
        Title.Alignment = taCenter
        Title.Caption = #25152#23646#25104#26412#20013#24515
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'costname'
        Title.Alignment = taCenter
        Title.Caption = #25104#26412#20013#24515#21517#31216
        Width = 135
        Visible = True
      end>
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 433
    Width = 591
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
    Width = 591
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
    Left = 232
    Top = 104
    object N1: TMenuItem
      Caption = #26032#22686
      Visible = False
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
      Visible = False
    end
    object N4: TMenuItem
      Caption = #21024#38500
      Visible = False
      OnClick = btnDeleteClick
    end
  end
  object adsMaster: TADODataSet
    Connection = dmCon.ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select M.*,D.Dept_Code as Cost_Dept_Code,d.cost_name as costname' +
      ' from data0034 M '#13#10'left join (select Dept_Code,rKey,cost_name fr' +
      'om data0034) D on M.Cost_Dept_ptr=D.rKey '#13#10'where ttype=1'#13#10'order ' +
      'by M.dept_code'#13#10
    Parameters = <>
    Left = 112
    Top = 104
  end
  object dsMaster: TDataSource
    DataSet = adsMaster
    Left = 152
    Top = 104
  end
end
