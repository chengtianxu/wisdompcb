object Form4: TForm4
  Left = 229
  Top = 159
  Width = 904
  Height = 573
  Caption = #36755#20837#30424#28857#25968#37327
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
    Top = 491
    Width = 888
    Height = 44
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      888
      44)
    object Button1: TButton
      Left = 348
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 443
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object SGrid1: TStringGrid
    Left = 0
    Top = 63
    Width = 888
    Height = 428
    Align = alClient
    ColCount = 10
    Ctl3D = False
    DefaultRowHeight = 19
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goEditing, goThumbTracking]
    ParentCtl3D = False
    PopupMenu = PopupMenu1
    TabOrder = 1
    OnDrawCell = SGrid1DrawCell
    OnExit = SGrid1Exit
    OnKeyPress = SGrid1KeyPress
    OnMouseDown = SGrid1MouseDown
    OnSelectCell = SGrid1SelectCell
    ColWidths = (
      55
      116
      121
      83
      68
      67
      78
      83
      86
      96)
    RowHeights = (
      19
      19)
  end
  object SGrid2: TStringGrid
    Left = 470
    Top = 240
    Width = 202
    Height = 178
    ColCount = 3
    DefaultRowHeight = 19
    FixedCols = 0
    RowCount = 2
    TabOrder = 2
    Visible = False
  end
  object SGrid3: TStringGrid
    Left = 388
    Top = 241
    Width = 73
    Height = 176
    ColCount = 1
    DefaultRowHeight = 19
    FixedCols = 0
    RowCount = 2
    ScrollBars = ssVertical
    TabOrder = 3
    Visible = False
    ColWidths = (
      64)
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 888
    Height = 63
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 4
    DesignSize = (
      888
      63)
    object Label1: TLabel
      Left = 399
      Top = 11
      Width = 80
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop]
      Caption = '   '#21019#24314#26085#26399':'
    end
    object Label2: TLabel
      Left = 399
      Top = 37
      Width = 80
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop]
      Caption = '   '#21019#24314#20154#21592':'
    end
    object Label3: TLabel
      Left = 198
      Top = 36
      Width = 54
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop]
      Caption = '   '#20179#24211':'
    end
    object Label4: TLabel
      Left = 164
      Top = 11
      Width = 85
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop]
      Caption = #23454#38469#30424#28857#20195#30721':'
    end
    object rkey05: TLabel
      Left = 24
      Top = 15
      Width = 42
      Height = 13
      Caption = 'rkey05'
      Visible = False
    end
    object empl_name: TLabel
      Left = 24
      Top = 36
      Width = 63
      Height = 13
      Caption = 'empl_name'
      Visible = False
    end
    object DBEdit1: TDBEdit
      Left = 502
      Top = 7
      Width = 121
      Height = 21
      TabStop = False
      Anchors = [akTop]
      Color = cl3DLight
      DataField = 'TDATE'
      DataSource = DM.DataSource1
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit4: TDBEdit
      Left = 275
      Top = 7
      Width = 120
      Height = 21
      TabStop = False
      Anchors = [akTop]
      Color = cl3DLight
      DataField = 'PHY_COUNT_NO'
      DataSource = DM.DataSource1
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit2: TDBEdit
      Left = 273
      Top = 32
      Width = 121
      Height = 21
      TabStop = False
      Anchors = [akTop]
      Color = cl3DLight
      DataField = 'warehouse_name'
      DataSource = DM.DataSource1
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit3: TDBEdit
      Left = 502
      Top = 32
      Width = 121
      Height = 21
      TabStop = False
      Anchors = [akTop]
      Color = cl3DLight
      DataField = 'employee_name'
      DataSource = DM.DataSource1
      ReadOnly = True
      TabOrder = 3
    end
    object Button4: TButton
      Left = 780
      Top = 33
      Width = 108
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #22797#21046#31995#32479#25968#37327
      TabOrder = 4
      OnClick = Button4Click
    end
    object Button3: TButton
      Left = 780
      Top = 5
      Width = 107
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #23548#20986#25968#25454#21040'Excel'
      TabOrder = 5
      OnClick = Button3Click
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 8
    Top = 448
    object N2: TMenuItem
      Caption = #22312#30424#28857#28165#21333#20013#22686#21152#24211#23384#26448#26009
      OnClick = N2Click
    end
    object N1: TMenuItem
      Caption = #20174#30424#28857#28165#21333#20013#21024#38500#26448#26009
      OnClick = N1Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object N4: TMenuItem
      Caption = #26356#25913#40664#35748#28165#28857#20154#21592
      OnClick = N4Click
    end
  end
end
