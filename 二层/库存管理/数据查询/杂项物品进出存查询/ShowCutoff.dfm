object frmShowCutoff: TfrmShowCutoff
  Left = 459
  Top = 190
  BorderStyle = bsDialog
  Caption = #26434#39033#29289#21697#25130#25968#24211#23384
  ClientHeight = 363
  ClientWidth = 393
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 393
    Height = 30
    Align = alTop
    TabOrder = 0
    DesignSize = (
      393
      30)
    object Label1: TLabel
      Left = 21
      Top = 10
      Width = 20
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #20174':'
    end
    object Label2: TLabel
      Left = 170
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
      Left = 66
      Top = 5
      Width = 101
      Height = 21
      Anchors = [akTop, akRight]
      Date = 39052.000000000000000000
      Time = 39052.000000000000000000
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 1
      OnChange = dtpk1Change
    end
    object dtpk2: TDateTimePicker
      Left = 190
      Top = 5
      Width = 101
      Height = 21
      Anchors = [akTop, akRight]
      Date = 39052.000000000000000000
      Time = 39052.000000000000000000
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 2
      OnChange = dtpk2Change
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 30
    Width = 393
    Height = 333
    Align = alClient
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGridEh1KeyDown
    Columns = <
      item
        DisplayFormat = 'yyyy-MM-dd'
        EditButtons = <>
        FieldName = 'CutoffDate'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #25130#25968#26102#38388
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'EMPLOYEE_NAME'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #25805#20316#21592
        Width = 70
      end
      item
        DisplayFormat = 'yyyy-MM-dd HH:MM:SS'
        EditButtons = <>
        FieldName = 'OperatorDate'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #25805#20316#26102#38388
        Width = 150
      end>
  end
  object DataSource1: TDataSource
    DataSet = dm.AdoQry255
    Left = 176
    Top = 152
  end
  object PopupMenu1: TPopupMenu
    Left = 248
    Top = 112
    object N1: TMenuItem
      Caption = #21024#38500#25130#25968
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
      Caption = #25130#25968#26597#30475
      OnClick = N3Click
    end
  end
end
