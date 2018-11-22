object Form_IQC: TForm_IQC
  Left = 389
  Top = 302
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'IQC'#19994#21153#22788#29702
  ClientHeight = 422
  ClientWidth = 495
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 495
    Height = 177
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 7
    object Label9: TLabel
      Left = 298
      Top = 20
      Width = 59
      Height = 13
      Caption = #23384#36135#21333#20301':'
    end
    object Label8: TLabel
      Left = 289
      Top = 118
      Width = 46
      Height = 13
      Caption = #26377#25928#26399':'
    end
    object Label7: TLabel
      Left = 8
      Top = 158
      Width = 85
      Height = 13
      Caption = #36865#20132#36135#20179#25968#37327':'
    end
    object Label6: TLabel
      Left = 31
      Top = 134
      Width = 59
      Height = 13
      Caption = #36864#36135#25968#37327':'
    end
    object Label3: TLabel
      Left = 35
      Top = 63
      Width = 59
      Height = 13
      Caption = #26448#26009#21517#31216':'
    end
    object Label5: TLabel
      Left = 34
      Top = 111
      Width = 59
      Height = 13
      Caption = #25253#24223#25968#37327':'
    end
    object Label4: TLabel
      Left = 33
      Top = 85
      Width = 59
      Height = 13
      Caption = #24453#26816#25968#37327':'
    end
    object Label2: TLabel
      Left = 36
      Top = 41
      Width = 59
      Height = 13
      Caption = #26448#26009#20195#21495':'
    end
    object Label1: TLabel
      Left = 36
      Top = 18
      Width = 59
      Height = 13
      Caption = #36865#36135#26085#26399':'
    end
    object Label10: TLabel
      Left = 297
      Top = 43
      Width = 59
      Height = 13
      Caption = #29615#20445#26631#35782':'
    end
    object Label11: TLabel
      Left = 303
      Top = 150
      Width = 33
      Height = 13
      Caption = #20179#24211':'
    end
    object lbl1: TLabel
      Left = 291
      Top = 67
      Width = 65
      Height = 13
      Caption = #29616#26377#24211#23384#65306
    end
    object Edit2: TEdit
      Left = 110
      Top = 83
      Width = 100
      Height = 21
      Color = cl3DLight
      Enabled = False
      ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
      TabOrder = 0
      Text = '0'
    end
    object DBEdit4: TDBEdit
      Left = 360
      Top = 40
      Width = 97
      Height = 21
      Color = cl3DLight
      DataField = 'rohs'
      DataSource = dm.DataSource1
      Enabled = False
      ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
      TabOrder = 1
    end
    object Edit3: TEdit
      Left = 110
      Top = 107
      Width = 100
      Height = 21
      Color = cl3DLight
      Enabled = False
      ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
      TabOrder = 2
      Text = '0'
    end
    object Edit4: TEdit
      Left = 110
      Top = 130
      Width = 100
      Height = 21
      Color = cl3DLight
      Enabled = False
      ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
      TabOrder = 3
      Text = '0'
    end
    object ComboBox1: TComboBox
      Left = 343
      Top = 144
      Width = 147
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
    end
    object dbeditQUAN_ON_HAND: TDBEdit
      Left = 360
      Top = 64
      Width = 98
      Height = 21
      Color = cl3DLight
      DataField = 'QUAN_ON_HAND'
      DataSource = dm.DataSource1
      ReadOnly = True
      TabOrder = 5
    end
  end
  object DBEdit1: TDBEdit
    Left = 110
    Top = 14
    Width = 172
    Height = 21
    Color = cl3DLight
    DataField = 'ship_DATE'
    DataSource = dm.DataSource1
    Enabled = False
    TabOrder = 3
  end
  object DBEdit2: TDBEdit
    Left = 110
    Top = 37
    Width = 172
    Height = 21
    Color = cl3DLight
    DataField = 'INV_PART_NUMBER'
    DataSource = dm.DataSource1
    Enabled = False
    TabOrder = 4
  end
  object DBEdit3: TDBEdit
    Left = 109
    Top = 63
    Width = 144
    Height = 21
    Color = cl3DLight
    DataField = 'INV_NAME'
    DataSource = dm.DataSource1
    Enabled = False
    TabOrder = 5
  end
  object DBEdit7: TDBEdit
    Left = 342
    Top = 113
    Width = 146
    Height = 21
    DataField = 'EXPIRE_DATE'
    DataSource = dm.DataSource1
    TabOrder = 1
  end
  object DBEdit8: TDBEdit
    Left = 360
    Top = 16
    Width = 97
    Height = 21
    Color = cl3DLight
    DataField = 'UNIT_NAME'
    DataSource = dm.DataSource1
    Enabled = False
    ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
    TabOrder = 6
  end
  object Edit1: TEdit
    Left = 110
    Top = 153
    Width = 100
    Height = 21
    TabOrder = 0
    Text = '0'
    OnExit = Edit1Exit
    OnKeyPress = Edit1KeyPress
  end
  object Panel2: TPanel
    Left = 0
    Top = 385
    Width = 495
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 8
    object Button1: TButton
      Left = 144
      Top = 8
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 272
      Top = 8
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object SGrid1: TStringGrid
    Left = 0
    Top = 177
    Width = 495
    Height = 208
    Align = alClient
    Ctl3D = False
    DefaultRowHeight = 22
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
    ParentCtl3D = False
    PopupMenu = PopupMenu1
    ScrollBars = ssVertical
    TabOrder = 2
    OnDrawCell = SGrid1DrawCell
    OnMouseDown = SGrid1MouseDown
    ColWidths = (
      80
      84
      87
      169
      64)
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 176
    Top = 240
    object N1: TMenuItem
      Caption = #26032#22686
      OnClick = N1Click
    end
    object N3: TMenuItem
      Caption = #21024#38500
      OnClick = N3Click
    end
  end
end
