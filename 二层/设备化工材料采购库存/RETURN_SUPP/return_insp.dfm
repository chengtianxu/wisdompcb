object Form4: TForm4
  Left = 286
  Top = 218
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #36864#36824#33267#24102#26377#37319#36141#23450#21333#30340#20379#24212#21830
  ClientHeight = 315
  ClientWidth = 516
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 127
    Top = 38
    Width = 87
    Height = 13
    Alignment = taRightJustify
    Caption = '    '#24050#36864#36135#30340#25968#37327':'
  end
  object Label2: TLabel
    Left = 130
    Top = 64
    Width = 84
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#24453#35013#36816#30340#25968#37327':'
  end
  object BitBtn1: TBitBtn
    Left = 9
    Top = 9
    Width = 25
    Height = 25
    TabOrder = 0
    OnClick = BitBtn1Click
    Glyph.Data = {
      EE000000424DEE000000000000007600000028000000100000000F0000000100
      0400000000007800000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFF0FFFFFF
      FFFFFFFF00FFFFFFFFFFFFF030FFFFFFFFFFFF0330FFFFFFFFFF003330000000
      0FFFF03330FF0FFFFFFFF03300FF0FFFF4FFF03330FF0FFF44FFF03330FF0FF4
      4444F03330FF0F444444F03330FF0FF44444F0330FFF0FFF44FFF030FFFF0FFF
      F4FFF00FFFFF0FFFFFFFF00000000FFFFFFF}
  end
  object Edit1: TEdit
    Left = 219
    Top = 34
    Width = 99
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 219
    Top = 60
    Width = 99
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 2
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 90
    Width = 516
    Height = 225
    Align = alBottom
    DataSource = DM.DataSource3
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'employee_name'
        Title.Caption = #36864#36135#21592#24037
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tdate'
        Title.Caption = #36864#36135#26102#38388
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REJECT_DESCRIPTION'
        Title.Caption = #36864#36135#21407#22240
        Width = 191
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quan_rejd'
        Title.Caption = #36864#36135#25968#37327
        Width = 72
        Visible = True
      end>
  end
  object PopupMenu1: TPopupMenu
    Left = 384
    Top = 24
    object N1: TMenuItem
      Caption = #21024#38500
      OnClick = N1Click
    end
  end
end
