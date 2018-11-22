object Form_stdprice: TForm_stdprice
  Left = 294
  Top = 227
  Width = 538
  Height = 282
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #29983#20135#29289#26009#21382#21490#20215#26684
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 530
    Height = 211
    Align = alTop
    DataSource = DM.DataSource5
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = FormKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_NAME'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTITY'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_PRICE'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REQ_DATE'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'in_out'
        Width = 54
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 239
    Top = 224
    Width = 73
    Height = 26
    Caption = #20851#38381
    ModalResult = 1
    TabOrder = 1
    OnKeyDown = FormKeyDown
  end
end
