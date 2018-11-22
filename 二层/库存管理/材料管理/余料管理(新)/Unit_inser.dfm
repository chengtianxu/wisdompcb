object Form_inser: TForm_inser
  Left = 287
  Top = 139
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20313#26009#20837#20179#24211#23384#26597#35810
  ClientHeight = 463
  ClientWidth = 690
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
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
    Top = 38
    Width = 690
    Height = 425
    Align = alClient
    DataSource = dm.DataSource6
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = N8Click
    OnKeyDown = DBGrid1KeyDown
    OnKeyPress = DBGrid1KeyPress
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'MAT_CODE'
        Title.Color = clRed
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'mat_desc'
        Width = 187
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LEN_SIZE'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WEI_SIZE'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_ON_HAND'
        ReadOnly = False
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'remark'
        Width = 112
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 690
    Height = 38
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 209
      Top = 12
      Width = 52
      Height = 13
      Caption = #20313#26009#32534#21495
    end
    object BitBtn1: TBitBtn
      Left = 5
      Top = 4
      Width = 60
      Height = 30
      Caption = #36864#20986
      TabOrder = 0
      OnClick = BitBtn1Click
      Kind = bkClose
    end
    object BitBtn2: TBitBtn
      Left = 417
      Top = 6
      Width = 25
      Height = 25
      TabOrder = 1
      OnClick = BitBtn2Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADABFBFBDADADADADADDADADBFADADADADAADADAD000DADADADDADAD0FBF0DA
        DADAADAD0F7FBF0DADADDAD0F7F87BF0DADAAD0F7F87BFB70DADD0F7F87BFB78
        80DA000F87BFB78880ADDAD00BFB78880ADAADADA0B7888740ADDADADA088804
        440AADADADA000A04440DADADADADADA0440ADADADADADADA00D}
    end
    object Edit1: TEdit
      Left = 289
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 2
      OnChange = Edit1Change
      OnKeyPress = Edit1KeyPress
    end
    object BitBtn3: TBitBtn
      Left = 80
      Top = 5
      Width = 60
      Height = 29
      Caption = #20837#20179
      TabOrder = 3
      OnClick = N8Click
      OnKeyPress = BitBtn3KeyPress
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000D80E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777700000000000777770FFFFFFFFF0777770F8888888F0777770FFFFFFFFF0
        777770F888888FF0777770FFFFFFFFF0777770F8888888F0777770FFFFFFFFF0
        7777744444444444777774444444444477177777777777777717777777777771
        7177777777777771177777777777777111777777777777777777}
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 296
    Top = 136
    object N8: TMenuItem
      Caption = #20837#20179
      OnClick = N8Click
    end
  end
end
