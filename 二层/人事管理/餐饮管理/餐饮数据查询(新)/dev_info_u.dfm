object Devinfo: TDevinfo
  Left = 273
  Top = 312
  Width = 440
  Height = 260
  BorderIcons = [biSystemMenu]
  Caption = #39184#27425#20215#26684#35774#32622
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object DBText1: TDBText
    Left = 351
    Top = 6
    Width = 42
    Height = 12
    AutoSize = True
    DataField = 'devid'
    DataSource = DM.ds2
  end
  object Label1: TLabel
    Left = 292
    Top = 7
    Width = 48
    Height = 12
    Caption = #26426#22120#21495#30721
  end
  object Label2: TLabel
    Left = 291
    Top = 28
    Width = 24
    Height = 12
    Caption = #39184#27425
  end
  object DBText2: TDBText
    Left = 323
    Top = 29
    Width = 42
    Height = 12
    AutoSize = True
    DataField = 'position'
    DataSource = DM.ds2
  end
  object Label3: TLabel
    Left = 291
    Top = 49
    Width = 48
    Height = 12
    Caption = #27491#39184#23450#20215
  end
  object Label4: TLabel
    Left = 291
    Top = 73
    Width = 48
    Height = 12
    Caption = #26089#39184#23450#20215
  end
  object Label5: TLabel
    Left = 291
    Top = 97
    Width = 48
    Height = 12
    Caption = #21320#39184#23450#20215
  end
  object Label6: TLabel
    Left = 291
    Top = 121
    Width = 48
    Height = 12
    Caption = #26202#39184#23450#20215
  end
  object Label7: TLabel
    Left = 291
    Top = 145
    Width = 48
    Height = 12
    Caption = #22812#23477#23450#20215
  end
  object Label8: TLabel
    Left = 291
    Top = 169
    Width = 48
    Height = 12
    Caption = #34917#21161#37329#39069
  end
  object Label9: TLabel
    Left = 400
    Top = 168
    Width = 24
    Height = 12
    Caption = #24110#21161
    OnMouseEnter = Label9MouseEnter
    OnMouseLeave = Label9MouseLeave
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 281
    Height = 226
    Align = alLeft
    DataSource = DM.ds2
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect]
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'devid'
        Title.Caption = #26426#21495
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'position'
        Title.Caption = #39184#27425#21517#31216
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dev_ip'
        Title.Caption = #26426#22120'IP'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'price'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'pbreakfast'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'plunch'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'psupper'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'pnysnack'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'pallowance'
        Visible = False
      end>
  end
  object DBEdit1: TDBEdit
    Left = 346
    Top = 45
    Width = 41
    Height = 20
    DataField = 'price'
    DataSource = DM.ds2
    ReadOnly = True
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 346
    Top = 69
    Width = 41
    Height = 20
    DataField = 'pbreakfast'
    DataSource = DM.ds2
    ReadOnly = True
    TabOrder = 2
  end
  object DBEdit3: TDBEdit
    Left = 346
    Top = 93
    Width = 41
    Height = 20
    DataField = 'plunch'
    DataSource = DM.ds2
    ReadOnly = True
    TabOrder = 3
  end
  object DBEdit4: TDBEdit
    Left = 346
    Top = 117
    Width = 41
    Height = 20
    DataField = 'psupper'
    DataSource = DM.ds2
    ReadOnly = True
    TabOrder = 4
  end
  object DBEdit5: TDBEdit
    Left = 346
    Top = 141
    Width = 41
    Height = 20
    DataField = 'pnysnack'
    DataSource = DM.ds2
    ReadOnly = True
    TabOrder = 5
  end
  object DBEdit6: TDBEdit
    Left = 346
    Top = 165
    Width = 41
    Height = 20
    DataField = 'pallowance'
    DataSource = DM.ds2
    ReadOnly = True
    TabOrder = 6
  end
  object Button1: TButton
    Left = 297
    Top = 196
    Width = 71
    Height = 25
    Caption = #30830#23450
    TabOrder = 7
    Visible = False
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 389
    Top = 197
    Width = 39
    Height = 25
    Caption = #21462#28040
    TabOrder = 8
    Visible = False
    OnClick = Button2Click
  end
  object Panel1: TPanel
    Left = 48
    Top = 64
    Width = 145
    Height = 89
    BorderWidth = 6
    TabOrder = 9
    Visible = False
    object Label10: TLabel
      Left = 7
      Top = 7
      Width = 131
      Height = 75
      Align = alClient
      AutoSize = False
      Caption = 
        #20462#25913#39184#39278#26426#39184#27425#26680#31639#20215#26684#13#10'            '#20026#21363#26102#29983#25928#13#10#35831#22312#26087#20215#26684#26680#31639#23436#27605#21518#13#10'          '#20877#20462#25913#26032#21333#20215#13#10#24037#36164 +
        #37096#20998#13#10'    '#25165#33021#25353#26102#38388#37325#26032#26680#31639
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 246
    Top = 166
    object N1: TMenuItem
      Caption = #32534#36753
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #26174#31034#31105#29992
      OnClick = N2Click
    end
  end
end
