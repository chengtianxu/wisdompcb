object Form1: TForm1
  Left = 202
  Top = 141
  Width = 696
  Height = 480
  Caption = #20379#24212#21830#24212#20184#24080#27454#20511#39033#22791#24536
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 43
    Width = 688
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
        FieldName = 'MEMO_NUMBER'
        Title.Color = clRed
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODE'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AMOUNT'
        ReadOnly = False
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AVL_AMT'
        ReadOnly = False
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MEMO_DATE'
        ReadOnly = False
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_NAME'
        Width = 56
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
        Width = 71
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 43
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 233
      Top = 17
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #22791#24536#32534#21495
    end
    object BitBtn1: TBitBtn
      Left = 3
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
      Left = 117
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
      Left = 291
      Top = 13
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
    object GroupBox2: TGroupBox
      Left = 419
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
        Date = 38763.000000000000000000
        Time = 38763.000000000000000000
        TabOrder = 0
        OnCloseUp = dtpk1CloseUp
        OnExit = dtpk1CloseUp
      end
      object dtpk2: TDateTimePicker
        Left = 140
        Top = 16
        Width = 100
        Height = 21
        Date = 38763.000000000000000000
        Time = 38763.000000000000000000
        TabOrder = 1
        OnCloseUp = dtpk1CloseUp
        OnExit = dtpk1CloseUp
      end
    end
    object BitBtn3: TBitBtn
      Left = 59
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = 409
    Width = 688
    Height = 44
    Align = alBottom
    Caption = #25903#31080#31867#22411
    TabOrder = 2
    object user_ptr: TLabel
      Left = 336
      Top = 16
      Width = 7
      Height = 13
      Caption = '3'
      Visible = False
    end
    object vprev: TLabel
      Left = 360
      Top = 16
      Width = 7
      Height = 13
      Visible = False
    end
    object db_ptr: TLabel
      Left = 384
      Top = 16
      Width = 7
      Height = 13
      Caption = '0'
      Visible = False
    end
    object CheckBox1: TCheckBox
      Left = 75
      Top = 16
      Width = 75
      Height = 17
      Caption = #36864#36135#22791#24536
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = CheckBox1Click
    end
    object CheckBox2: TCheckBox
      Left = 161
      Top = 16
      Width = 68
      Height = 17
      Caption = #39044#20184#22791#24536
      Checked = True
      State = cbChecked
      TabOrder = 1
      OnClick = CheckBox1Click
    end
    object CheckBox3: TCheckBox
      Left = 243
      Top = 16
      Width = 79
      Height = 17
      Caption = #20854#23427#22791#24536
      Checked = True
      State = cbChecked
      TabOrder = 2
      OnClick = CheckBox1Click
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 216
    Top = 168
    object N1: TMenuItem
      Caption = #26032#22686
      object N5: TMenuItem
        Caption = #36864#36135#22791#24536
        OnClick = N5Click
      end
      object N6: TMenuItem
        Caption = #39044#20184#22791#24536
        OnClick = N6Click
      end
      object N7: TMenuItem
        Caption = #20854#23427#22791#24536
        OnClick = N7Click
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
  end
end
