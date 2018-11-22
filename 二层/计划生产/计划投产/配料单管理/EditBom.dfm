object FrmEditBom: TFrmEditBom
  Left = 129
  Top = 136
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20462#25913#26448#26009#28165#21333#65288'BOM'#65289
  ClientHeight = 520
  ClientWidth = 1436
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object stg2: TStringGrid
    Left = 0
    Top = 33
    Width = 1436
    Height = 325
    Align = alClient
    ColCount = 20
    DefaultRowHeight = 18
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
    PopupMenu = PopupMenu1
    TabOrder = 0
    OnDblClick = stg2DblClick
    OnMouseDown = stg2MouseDown
    ColWidths = (
      64
      42
      82
      97
      128
      44
      170
      57
      48
      40
      80
      23
      45
      52
      29
      77
      56
      89
      155
      216)
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1436
    Height = 33
    Align = alTop
    TabOrder = 1
    object Label2: TLabel
      Left = 24
      Top = 9
      Width = 65
      Height = 13
      Caption = #37197#26009#21333#21495#65306
    end
    object Label4: TLabel
      Left = 248
      Top = 10
      Width = 65
      Height = 13
      Caption = #26412#21378#32534#21495#65306
    end
    object Label6: TLabel
      Left = 444
      Top = 11
      Width = 65
      Height = 13
      Caption = #23458#25143#22411#21495#65306
    end
    object DBEdit1: TDBEdit
      Left = 88
      Top = 5
      Width = 121
      Height = 21
      Color = cl3DLight
      DataField = 'CUT_NO'
      DataSource = DM.DataSource1
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 312
      Top = 6
      Width = 121
      Height = 21
      Color = cl3DLight
      DataField = 'MANU_PART_NUMBER'
      DataSource = DM.DataSource1
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 509
      Top = 8
      Width = 196
      Height = 21
      Color = cl3DLight
      DataField = 'MANU_PART_DESC'
      DataSource = DM.DataSource1
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      ReadOnly = True
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 479
    Width = 1436
    Height = 41
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      1436
      41)
    object BitBtn1: TBitBtn
      Left = 269
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = #30830#23450
      Default = True
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object BitBtn2: TBitBtn
      Left = 1020
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #21462#28040
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 358
    Width = 1436
    Height = 121
    Align = alBottom
    TabOrder = 3
    object Label1: TLabel
      Left = 0
      Top = 4
      Width = 113
      Height = 13
      AutoSize = False
      Caption = #22791#27880#20449#24687#65306
    end
    object Label3: TLabel
      Left = 14
      Top = 92
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = #22823#26009#35268#26684':'
    end
    object DBMemo1: TDBMemo
      Left = 8
      Top = 24
      Width = 721
      Height = 57
      DataField = 'remark'
      DataSource = DM.DataSource1
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 0
    end
    object DBEdit4: TDBEdit
      Left = 80
      Top = 88
      Width = 169
      Height = 21
      DataField = 'ANALYSIS_CODE_3'
      DataSource = DM.DataSource1
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 1
    end
    object CheckBox1: TCheckBox
      Left = 774
      Top = 56
      Width = 123
      Height = 17
      Caption = #37197#26009#21333#33258#21160#20998#37197
      TabOrder = 2
      Visible = False
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 152
    Top = 120
    object N1: TMenuItem
      Caption = #26032#22686#37197#26009
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #32534#36753#37197#26009
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #21024#38500#37197#26009
      OnClick = N3Click
    end
  end
end
