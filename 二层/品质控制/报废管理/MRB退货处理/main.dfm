object Form1: TForm1
  Left = 275
  Top = 162
  Width = 872
  Height = 480
  Caption = #36864#36135#25104#21697#26816#35270#26495
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
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
    Top = 41
    Width = 864
    Height = 405
    Align = alClient
    DataSource = DM.DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'number414'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_NUMBER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_DESC'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME10'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qty_rece'
        ReadOnly = False
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qty_to_be_reworked'
        ReadOnly = False
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qty_to_be_remaked'
        ReadOnly = False
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sys_date414'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'number415'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'v_status'
        Title.Caption = #29366#24577
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'area_rece'
        ReadOnly = False
        Title.Caption = #22788#29702#38754#31215
        Width = 67
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 864
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      864
      41)
    object Label1: TLabel
      Left = 257
      Top = 15
      Width = 76
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'MRB'#32534#21495
    end
    object Label2: TLabel
      Left = 571
      Top = 16
      Width = 21
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = '  '#20174':'
    end
    object Label3: TLabel
      Left = 686
      Top = 16
      Width = 21
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = '  '#21040':'
    end
    object Button1: TButton
      Left = 5
      Top = 5
      Width = 61
      Height = 30
      Caption = #36864#20986
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 69
      Top = 6
      Width = 61
      Height = 30
      Caption = #21047#26032
      TabOrder = 1
      OnClick = Button2Click
    end
    object Edit1: TEdit
      Left = 336
      Top = 11
      Width = 121
      Height = 21
      TabOrder = 2
      OnChange = Edit1Change
    end
    object dtpk2: TDateTimePicker
      Left = 712
      Top = 11
      Width = 85
      Height = 21
      Anchors = [akTop, akRight]
      Date = 38362.000000000000000000
      Time = 38362.000000000000000000
      TabOrder = 3
      OnCloseUp = dtpk1Exit
      OnExit = dtpk1Exit
    end
    object dtpk1: TDateTimePicker
      Left = 597
      Top = 11
      Width = 85
      Height = 21
      Anchors = [akTop, akRight]
      Date = 38362.000000000000000000
      Time = 38362.000000000000000000
      TabOrder = 4
      OnCloseUp = dtpk1Exit
      OnExit = dtpk1Exit
    end
    object Button3: TButton
      Left = 133
      Top = 6
      Width = 61
      Height = 30
      Caption = #23548#20986'Excel'
      TabOrder = 5
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 198
      Top = 6
      Width = 61
      Height = 30
      Caption = #25253#34920#23450#20041
      TabOrder = 6
      OnClick = Button4Click
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 248
    Top = 144
    object N1: TMenuItem
      Caption = #26032#22686
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #32534#36753
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #26816#26597
      OnClick = N3Click
    end
    object N5: TMenuItem
      Caption = #25552#20132#22788#29702
      OnClick = N5Click
    end
    object N4: TMenuItem
      Caption = #21024#38500
      OnClick = N4Click
    end
    object MRB1: TMenuItem
      Caption = #25171#21360'MRB'#21333
      OnClick = MRB1Click
    end
  end
end
