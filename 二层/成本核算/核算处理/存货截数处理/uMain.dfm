object FrmMain: TFrmMain
  Left = 452
  Top = 112
  Width = 785
  Height = 612
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = '--'#23384#36135#32467#31639#22788#29702
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 777
    Height = 518
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CUT_DATE'
        Title.Caption = #36130#21153#32467#31639#26085#26399
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MATL_DATE'
        Title.Caption = #21407#26448#26009#32467#31639#26102#38388
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WIP_DATE'
        Title.Caption = #22312#21046#21697#32467#31639#26102#38388
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SFG_DATE'
        Title.Caption = #21322#25104#21697#32467#31639#26102#38388
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FG_DATE'
        Title.Caption = #25104#21697#32467#31639#26102#38388
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'employee_name'
        Title.Caption = #22788#29702#20154
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLOSED'
        Title.Caption = #26680#31639
        Width = 40
        Visible = True
      end>
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 559
    Width = 777
    Height = 19
    Panels = <
      item
        Text = #24403#21069#26102#38388'('#26381#21153#22120#26102#38388'):'
        Width = 150
      end
      item
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 777
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object vprev: TLabel
      Left = 456
      Top = 12
      Width = 7
      Height = 13
      Visible = False
    end
    object Label1: TLabel
      Left = 129
      Top = 12
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = #24180#24230':'
    end
    object BitBtn1: TBitBtn
      Left = 8
      Top = 5
      Width = 32
      Height = 30
      Hint = #36864#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
    end
    object SpinEdit1: TSpinEdit
      Left = 163
      Top = 9
      Width = 78
      Height = 22
      MaxValue = 2222
      MinValue = 2000
      TabOrder = 1
      Value = 2006
      OnChange = SpinEdit1Change
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 304
    Top = 216
    object N2: TMenuItem
      Caption = #26032#25130#25968#22788#29702'(&A)'
      OnClick = N2Click
    end
    object N9: TMenuItem
      Caption = #24037#24207#32467#23384#26448#26009#36755#20837'(&S)'
      OnClick = N9Click
    end
    object N1: TMenuItem
      Caption = #26816#35270#26723#26696'(&C)'
      object N4: TMenuItem
        Caption = #20179#24211#21407#26448#26009#23384#36135'(&M)'
        OnClick = N4Click
      end
      object N5: TMenuItem
        Caption = #22312#21046#21697#23384#36135'(&W)'
        OnClick = N5Click
      end
      object N6: TMenuItem
        Caption = #20135#25104#21697#23384#36135'(&F)'
        OnClick = N6Click
      end
      object N15: TMenuItem
        Caption = #24037#24207#32467#23384#26448#26009'(&G)'
        OnClick = N15Click
      end
    end
    object N3: TMenuItem
      Caption = #21024#38500#26723#26696'(&D)'
      OnClick = N3Click
    end
    object N8: TMenuItem
      Caption = '-'
    end
  end
  object DataSource1: TDataSource
    DataSet = DM.DS444
    Left = 208
    Top = 216
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 496
    Top = 288
  end
end
