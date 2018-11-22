object Form_Main: TForm_Main
  Left = 222
  Top = 114
  Width = 600
  Height = 563
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #25968#25454#23383#20856
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 592
    Height = 33
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 3
      Top = 3
      Width = 57
      Height = 29
      Caption = #36864#20986
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
  end
  object Panel2: TPanel
    Left = 0
    Top = 33
    Width = 592
    Height = 503
    Align = alClient
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 1
      Top = 25
      Width = 590
      Height = 477
      ActivePage = TabSheet2
      Align = alClient
      TabOrder = 0
      OnChange = PageControl1Change
      object TabSheet1: TTabSheet
        Caption = '   '#25968#25454#31867#21035'   '
        object Grd1: TDBGridEh
          Left = 0
          Top = 0
          Width = 582
          Height = 449
          Align = alClient
          DataSource = DM.DSDict
          FooterColor = clWindow
          FooterFont.Charset = ANSI_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -13
          FooterFont.Name = #23435#20307
          FooterFont.Style = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          OnTitleClick = Grd1TitleClick
          Columns = <
            item
              EditButtons = <>
              FieldName = 'item'
              Footers = <>
              Title.Caption = #31867#22411#21517#31216
              Title.SortIndex = 1
              Title.SortMarker = smUpEh
            end>
        end
      end
      object TabSheet2: TTabSheet
        Caption = '   '#31867#21035#26126#32454'   '
        ImageIndex = 1
        object Grd2: TDBGridEh
          Left = 0
          Top = 0
          Width = 582
          Height = 449
          Align = alClient
          DataSource = DM.DSDetail
          FooterColor = clWindow
          FooterFont.Charset = ANSI_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -13
          FooterFont.Name = #23435#20307
          FooterFont.Style = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          PopupMenu = PopupMenu1
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          OnDblClick = Grd2DblClick
          OnTitleClick = Grd2TitleClick
          Columns = <
            item
              EditButtons = <>
              FieldName = 'item'
              Footers = <>
              Title.Caption = #31867#21035#26126#32454#21517#31216
              Title.SortIndex = 1
              Title.SortMarker = smUpEh
              Width = 95
            end
            item
              EditButtons = <>
              FieldName = 'memo'
              Footers = <>
              Width = 199
            end
            item
              EditButtons = <>
              FieldName = 'train_flag'
              Footers = <>
              Width = 57
            end
            item
              EditButtons = <>
              FieldName = 'user_defined1'
              Footers = <>
              Width = 97
            end
            item
              EditButtons = <>
              FieldName = 'user_defined2'
              Footers = <>
              Width = 85
            end>
        end
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 590
      Height = 24
      Align = alTop
      TabOrder = 1
      object Label1: TLabel
        Left = 4
        Top = 4
        Width = 99
        Height = 13
        AutoSize = False
        Caption = #31867#21035#26126#32454#21517#31216
      end
      object Edit1: TEdit
        Left = 105
        Top = 0
        Width = 121
        Height = 21
        TabOrder = 0
        OnChange = Edit1Change
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 272
    Top = 113
    object N4_See: TMenuItem
      Caption = #26597#30475
      OnClick = N4_SeeClick
    end
    object N1: TMenuItem
      Caption = #26032#24314
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #32534#36753
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #21024#38500
      OnClick = N3Click
    end
  end
end
