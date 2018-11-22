object Form_Section: TForm_Section
  Left = 351
  Top = 151
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'VMI'#25130#25968#24211#23384
  ClientHeight = 443
  ClientWidth = 442
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 442
    Height = 30
    Align = alTop
    TabOrder = 0
    DesignSize = (
      442
      30)
    object Label1: TLabel
      Left = 70
      Top = 10
      Width = 20
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #20174':'
    end
    object Label2: TLabel
      Left = 195
      Top = 10
      Width = 20
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #21040':'
    end
    object BitBtn1: TBitBtn
      Left = 1
      Top = 1
      Width = 60
      Height = 27
      Hint = #36864#20986#31995#32479
      Caption = #36864#20986
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
    object dtpk1: TDateTimePicker
      Left = 91
      Top = 5
      Width = 101
      Height = 21
      Anchors = [akTop, akRight]
      Date = 39052.000000000000000000
      Time = 39052.000000000000000000
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 1
      OnCloseUp = dtpk1Exit
      OnExit = dtpk1Exit
    end
    object dtpk2: TDateTimePicker
      Left = 215
      Top = 5
      Width = 101
      Height = 21
      Anchors = [akTop, akRight]
      Date = 39052.000000000000000000
      Time = 39052.000000000000000000
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 2
      OnCloseUp = dtpk1Exit
      OnExit = dtpk1Exit
    end
    object CheckBox1: TCheckBox
      Left = 318
      Top = 7
      Width = 64
      Height = 17
      Anchors = [akTop, akRight]
      Caption = #26410#35299#38145
      Checked = True
      State = cbChecked
      TabOrder = 3
      OnClick = CheckBox1Click
    end
    object CheckBox2: TCheckBox
      Left = 376
      Top = 7
      Width = 64
      Height = 17
      Anchors = [akTop, akRight]
      Caption = #24050#35299#38145' '
      Checked = True
      State = cbChecked
      TabOrder = 4
      OnClick = CheckBox1Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 30
    Width = 442
    Height = 413
    Align = alClient
    DataSource = dm.DS171
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'cut_date'
        Title.Alignment = taCenter
        Title.Caption = #25130#25968#26399#26411#26085#26399
        Width = 154
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'employee_name'
        Title.Alignment = taCenter
        Title.Caption = #25805#20316#20154#21592
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'v_status'
        Title.Alignment = taCenter
        Title.Caption = #25130#25968#29366#24577
        Width = 113
        Visible = True
      end>
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 193
    Top = 127
    object N1: TMenuItem
      Caption = #24320#22987#25130#25968
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #23436#25104#25130#25968
      OnClick = N2Click
    end
    object N6: TMenuItem
      Caption = #21024#38500#25130#25968
      OnClick = N6Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
      Caption = #25130#23384#26597#30475
      object N7: TMenuItem
        Caption = #25130#23384#26126#32454
        OnClick = N3Click
      end
      object N8: TMenuItem
        Caption = #25130#23384#27719#24635
        OnClick = N8Click
      end
    end
    object N5: TMenuItem
      Caption = '-'
    end
  end
end
