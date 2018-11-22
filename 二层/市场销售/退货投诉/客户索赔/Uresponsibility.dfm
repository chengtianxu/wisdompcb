object Form_FT: TForm_FT
  Left = 274
  Top = 213
  BorderStyle = bsDialog
  Caption = #36131#20219#20998#25674
  ClientHeight = 477
  ClientWidth = 429
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 20
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 32
    Width = 429
    Height = 445
    Align = alCustom
    DataSource = DM.DSft
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -16
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGridEh1DrawColumnCell
    Columns = <
      item
        EditButtons = <>
        FieldName = 'sel_n'
        Footers = <>
        Title.Caption = #24207#21495
        Width = 78
      end
      item
        EditButtons = <>
        FieldName = 'DEPT_NAME'
        Footers = <>
        Title.Caption = #37096#38376
        Width = 90
      end
      item
        EditButtons = <>
        FieldName = 'chinesename'
        Footers = <>
        Title.Caption = #20154#21592
        Width = 87
      end
      item
        EditButtons = <>
        FieldName = 'sp_money'
        Footers = <>
        Title.Caption = #37329#39069
        Width = 93
      end>
  end
  object ControlBar1: TControlBar
    Left = 0
    Top = 0
    Width = 429
    Height = 29
    Align = alTop
    TabOrder = 1
    object BitBtn2: TBitBtn
      Left = 11
      Top = 2
      Width = 38
      Height = 22
      Hint = #23548#20986#25968#25454#21040'Excel'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BitBtn2Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DADADADADADA
        DADAADADADADADADADADDADADADADAD00000000000000006666007777777706E
        EF0AA0E6666606EEF0ADDA0E66606EEF060AADA0E606EEF0000DDADA006EEF0A
        DADAADAD06EEF00DADADDAD06EEF0670DADAAD06EEF0E6670DADD06EEF0A0E66
        70DA0FFFF0ADA0EEEE0D00000ADADA00000AADADADADADADADAD}
    end
  end
end
