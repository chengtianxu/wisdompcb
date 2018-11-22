object Form1: TForm1
  Left = 203
  Top = 134
  Width = 733
  Height = 480
  Caption = #20379#24212#21830#21457#31080#20837#24080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 725
    Height = 43
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 186
      Top = 17
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #21457#31080#32534#30721
    end
    object BitBtn1: TBitBtn
      Left = 0
      Top = 10
      Width = 56
      Height = 25
      Hint = #36864#20986#31995#32479
      Caption = #36864#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 115
      Top = 10
      Width = 62
      Height = 25
      Hint = #23548#20986#25968#25454#21040'Excel'
      Caption = #23548#20986'Excel'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BitBtn2Click
    end
    object Edit1: TEdit
      Left = 244
      Top = 13
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
    object GroupBox2: TGroupBox
      Left = 372
      Top = 0
      Width = 243
      Height = 41
      Caption = #21457#31080#26085#26399
      TabOrder = 1
      object Label2: TLabel
        Left = 5
        Top = 20
        Width = 13
        Height = 13
        Caption = #20174
      end
      object Label3: TLabel
        Left = 125
        Top = 20
        Width = 13
        Height = 13
        Caption = #21040
      end
      object dtpk1: TDateTimePicker
        Left = 23
        Top = 16
        Width = 95
        Height = 21
        CalAlignment = dtaLeft
        Date = 38763
        Time = 38763
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 0
        OnCloseUp = dtpk1CloseUp
        OnExit = dtpk1CloseUp
      end
      object dtpk2: TDateTimePicker
        Left = 140
        Top = 16
        Width = 100
        Height = 21
        CalAlignment = dtaLeft
        Date = 38763
        Time = 38763
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 1
        OnCloseUp = dtpk1CloseUp
        OnExit = dtpk1CloseUp
      end
    end
    object BitBtn3: TBitBtn
      Left = 56
      Top = 10
      Width = 58
      Height = 25
      Hint = #21047#26032
      Caption = #21047#26032
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = BitBtn3Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 43
    Width = 725
    Height = 366
    Align = alClient
    DataSource = dm.DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'INVOICE_NO'
        Title.Color = clRed
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODE'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_NAME'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_TOTAL'
        ReadOnly = False
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_RATE'
        ReadOnly = False
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_DATE'
        ReadOnly = False
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'v_type'
        ReadOnly = False
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'v_status'
        ReadOnly = False
        Width = 63
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 409
    Width = 725
    Height = 44
    Align = alBottom
    Caption = #21457#31080#29366#24577
    TabOrder = 2
    object user_ptr: TLabel
      Left = 16
      Top = 16
      Width = 7
      Height = 13
      Caption = '3'
      Visible = False
    end
    object vprev: TLabel
      Left = 40
      Top = 16
      Width = 7
      Height = 13
      Visible = False
    end
    object db_ptr: TLabel
      Left = 64
      Top = 16
      Width = 7
      Height = 13
      Caption = '0'
      Visible = False
    end
    object Label5: TLabel
      Left = 256
      Top = 16
      Width = 105
      Height = 13
      Caption = #24212#20184#24635#35745'('#26412#20301#24065')'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object CheckBox1: TCheckBox
      Left = 48
      Top = 16
      Width = 60
      Height = 17
      Caption = #26377#25928#30340
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = CheckBox1Click
    end
    object CheckBox2: TCheckBox
      Left = 120
      Top = 16
      Width = 68
      Height = 17
      Caption = #24050#20184#27454
      TabOrder = 1
      OnClick = CheckBox1Click
    end
    object CheckBox3: TCheckBox
      Left = 192
      Top = 16
      Width = 64
      Height = 17
      Caption = #34987#26242#32531
      TabOrder = 2
      OnClick = CheckBox1Click
    end
    object Edit3: TEdit
      Left = 362
      Top = 12
      Width = 99
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 3
      Text = '0.00'
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 160
    Top = 120
    object N1: TMenuItem
      Caption = #26032#22686
      object N9: TMenuItem
        Caption = #26448#26009#20837#20179#20184#27454
        OnClick = N9Click
      end
      object N11: TMenuItem
        Caption = #20854#23427#36153#29992
        OnClick = N11Click
      end
    end
    object N2: TMenuItem
      Caption = #32534#36753
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #26816#26597
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #21024#38500
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object N8: TMenuItem
      Caption = #31246#31080#26631#35760
      OnClick = N8Click
    end
    object N6: TMenuItem
      Caption = #26242#32531#20184#27454
      OnClick = N6Click
    end
    object N7: TMenuItem
      Caption = #24674#22797#20184#27454
      OnClick = N7Click
    end
  end
end
