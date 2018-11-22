object Form_micprice: TForm_micprice
  Left = 214
  Top = 288
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #38750#29983#20135#29289#26009#21382#21490#20215#26684
  ClientHeight = 242
  ClientWidth = 642
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
    Width = 642
    Height = 190
    Align = alTop
    DataSource = DM.DataSource9
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
        FieldName = 'DESCRIPTION_1'
        Width = 127
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GUI_GE'
        Width = 189
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTITY_REQUIRED'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_PRICE'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REQ_DATE'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_NAME'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'in_out'
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 281
    Top = 210
    Width = 71
    Height = 25
    Caption = #20851#38381
    ModalResult = 1
    TabOrder = 1
    OnKeyDown = FormKeyDown
  end
end
