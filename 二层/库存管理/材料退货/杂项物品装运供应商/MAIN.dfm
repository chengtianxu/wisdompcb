object Form1: TForm1
  Left = 220
  Top = 125
  Width = 707
  Height = 494
  Caption = #35013#36816#21040#20379#24212#21830'('#38750#29983#20135#29289#26009')'
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 46
    Width = 699
    Height = 421
    Align = alClient
    DataSource = DM.DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'DESCRIPTION'
        Title.Color = clRed
        Width = 136
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GUI_GE'
        Width = 198
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPTION2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quan_to_ship'
        ReadOnly = False
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Width = 64
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 699
    Height = 46
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      699
      46)
    object Label1: TLabel
      Left = 134
      Top = 21
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = #29289#21697#21517#31216':'
    end
    object Label2: TLabel
      Left = 312
      Top = 23
      Width = 7
      Height = 13
    end
    object user_ptr: TLabel
      Left = 382
      Top = 6
      Width = 7
      Height = 13
      Caption = '0'
      Visible = False
    end
    object BitBtn1: TBitBtn
      Left = 615
      Top = 12
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Hint = #36864#20986
      Anchors = [akTop, akRight]
      Caption = #36864#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TabStop = False
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
    object Edit1: TEdit
      Left = 196
      Top = 17
      Width = 157
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
    object Button1: TButton
      Left = 529
      Top = 12
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = #35013#36816#26597#35810
      TabOrder = 2
      OnClick = Button1Click
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 32
    Top = 8
    object N1: TMenuItem
      Caption = #35013#36816
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #21047#26032
      OnClick = N2Click
    end
  end
end
