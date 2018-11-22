object Form4: TForm4
  Left = 199
  Top = 155
  Width = 825
  Height = 542
  Caption = #36755#20837#30424#28857#25968#37327
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnResize = FormResize
  OnShow = FormShow
  DesignSize = (
    809
    504)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 382
    Top = 11
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Anchors = [akTop]
    Caption = ' '#21019#24314#26085#26399':'
  end
  object Label2: TLabel
    Left = 382
    Top = 37
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Anchors = [akTop]
    Caption = ' '#21019#24314#20154#21592':'
  end
  object Label3: TLabel
    Left = 192
    Top = 36
    Width = 40
    Height = 13
    Alignment = taRightJustify
    Anchors = [akTop]
    Caption = ' '#24037#21378':'
  end
  object Label4: TLabel
    Left = 145
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
  object Panel1: TPanel
    Left = 0
    Top = 460
    Width = 809
    Height = 44
    Align = alBottom
    TabOrder = 6
    DesignSize = (
      809
      44)
    object Button1: TButton
      Left = 314
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
      Left = 400
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #21462#28040
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object DBEdit1: TDBEdit
    Left = 457
    Top = 7
    Width = 121
    Height = 21
    TabStop = False
    Anchors = [akTop]
    Color = cl3DLight
    DataField = 'DATE_CREATED'
    DataSource = DM.DataSource1
    ReadOnly = True
    TabOrder = 0
  end
  object DBEdit4: TDBEdit
    Left = 245
    Top = 7
    Width = 120
    Height = 21
    TabStop = False
    Anchors = [akTop]
    Color = cl3DLight
    DataField = 'FG_COUNT_CODE'
    DataSource = DM.DataSource1
    ReadOnly = True
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 244
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
    Left = 457
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
  object SGrid1: TStringGrid
    Left = 0
    Top = 63
    Width = 817
    Height = 407
    Anchors = [akLeft, akTop, akRight, akBottom]
    ColCount = 8
    Ctl3D = False
    DefaultRowHeight = 19
    FixedCols = 6
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing, goThumbTracking]
    ParentCtl3D = False
    PopupMenu = PopupMenu1
    ScrollBars = ssVertical
    TabOrder = 4
    OnDrawCell = SGrid1DrawCell
    OnExit = SGrid1Exit
    OnKeyPress = SGrid1KeyPress
    OnMouseDown = SGrid1MouseDown
    OnSelectCell = SGrid1SelectCell
    ColWidths = (
      138
      62
      72
      130
      87
      94
      82
      122)
    RowHeights = (
      19
      19)
  end
  object SGrid2: TStringGrid
    Left = 97
    Top = 304
    Width = 209
    Height = 153
    ColCount = 4
    DefaultRowHeight = 19
    FixedCols = 0
    RowCount = 2
    TabOrder = 5
    Visible = False
    ColWidths = (
      51
      46
      46
      39)
  end
  object SGrid3: TStringGrid
    Left = 16
    Top = 304
    Width = 73
    Height = 153
    ColCount = 1
    DefaultRowHeight = 19
    FixedCols = 0
    RowCount = 2
    ScrollBars = ssVertical
    TabOrder = 7
    Visible = False
  end
  object Button3: TButton
    Left = 696
    Top = 32
    Width = 103
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #25353#27719#24635#25968#36755#20837
    TabOrder = 8
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 696
    Top = 5
    Width = 103
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #22797#21046#31995#32479#25968#37327
    TabOrder = 9
    OnClick = Button4Click
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 24
    Top = 472
    object N2: TMenuItem
      Caption = #22312#30424#28857#28165#21333#20013#22686#21152#37096#20214
      OnClick = N2Click
    end
    object N1: TMenuItem
      Caption = #20174#30424#28857#28165#21333#20013#21024#38500#37096#20214
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
