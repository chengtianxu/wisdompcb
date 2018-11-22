object Form3: TForm3
  Left = 194
  Top = 129
  Width = 877
  Height = 586
  Caption = 'WIP'#30424#28857#25968#37327#36755#20837
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 500
    Width = 861
    Height = 47
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      861
      47)
    object Button1: TButton
      Left = 332
      Top = 11
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #20445#23384
      ModalResult = 1
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 438
      Top = 11
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #21462#28040
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object StG1: TStringGrid
    Left = 0
    Top = 57
    Width = 861
    Height = 443
    Align = alClient
    ColCount = 12
    Ctl3D = False
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
    ParentCtl3D = False
    PopupMenu = PopupMenu1
    TabOrder = 1
    OnDrawCell = StG1DrawCell
    OnExit = StG1Exit
    OnKeyPress = StG1KeyPress
    OnMouseDown = StG1MouseDown
    OnSelectCell = StG1SelectCell
    ColWidths = (
      74
      54
      144
      44
      134
      38
      62
      64
      53
      73
      64
      184)
    RowHeights = (
      20
      20)
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 861
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      861
      57)
    object Label1: TLabel
      Left = 171
      Top = 10
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop]
      AutoSize = False
      Caption = #30424#28857#20195#30721':'
    end
    object Label2: TLabel
      Left = 196
      Top = 35
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop]
      AutoSize = False
      Caption = #24037#21378':'
    end
    object Label3: TLabel
      Left = 446
      Top = 10
      Width = 47
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop]
      AutoSize = False
      Caption = #21019#24314#20154':'
    end
    object Label4: TLabel
      Left = 435
      Top = 35
      Width = 58
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop]
      AutoSize = False
      Caption = #21019#24314#26085#26399':'
    end
    object DBEdit1: TDBEdit
      Left = 254
      Top = 6
      Width = 120
      Height = 21
      Anchors = [akTop]
      Color = cl3DLight
      DataField = 'wip_code'
      DataSource = DM.DataSource1
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 254
      Top = 32
      Width = 121
      Height = 21
      Anchors = [akTop]
      Color = cl3DLight
      DataField = 'WAREHOUSE_NAME'
      DataSource = DM.DataSource1
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 514
      Top = 6
      Width = 120
      Height = 21
      Anchors = [akTop]
      Color = cl3DLight
      DataField = 'EMPLOYEE_NAME'
      DataSource = DM.DataSource1
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 514
      Top = 31
      Width = 121
      Height = 21
      Anchors = [akTop]
      Color = cl3DLight
      DataField = 'ent_date'
      DataSource = DM.DataSource1
      ReadOnly = True
      TabOrder = 3
    end
    object Button3: TButton
      Left = 742
      Top = 28
      Width = 107
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #22797#21046#31995#32479#25968#37327'Pcs'
      TabOrder = 4
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 742
      Top = 3
      Width = 107
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #23548#20986#25968#25454#21040'Excel'
      TabOrder = 5
      OnClick = Button4Click
    end
  end
  object StG2: TStringGrid
    Left = 8
    Top = 314
    Width = 225
    Height = 179
    ColCount = 3
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 2
    TabOrder = 3
    Visible = False
    ColWidths = (
      70
      64
      64)
  end
  object PopupMenu1: TPopupMenu
    Left = 256
    Top = 392
    object N1: TMenuItem
      Caption = #22312#28165#21333#20013#22686#21152#24037#21333
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #20174#28165#21333#20013#21024#38500#28165#21333
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object N4: TMenuItem
      Caption = #26356#25913#40664#35748#28165#28857#20154#21592
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = #26356#25913#40664#35748#25253#24223#21407#22240
      OnClick = N5Click
    end
  end
end
