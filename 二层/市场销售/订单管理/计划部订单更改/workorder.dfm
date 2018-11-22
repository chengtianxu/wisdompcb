object Form2: TForm2
  Left = 294
  Top = 193
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #24037#20316#35746#21333
  ClientHeight = 331
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 32
    Width = 624
    Height = 299
    Align = alBottom
    DataSource = DM.DataSource2
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'WORK_ORDER_NUMBER'
        Width = 121
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUT_NO'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_SCH'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_REJ'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_PROD'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'wip_qty'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'v_status'
        Width = 81
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 6
    Top = 3
    Width = 41
    Height = 27
    Hint = #36864#20986
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
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
end
