object Form_micprice: TForm_micprice
  Left = 214
  Top = 288
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #38750#29983#20135#29289#26009#21382#21490#20215#26684
  ClientHeight = 242
  ClientWidth = 770
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
    Width = 770
    Height = 190
    Align = alTop
    DataSource = DataSource1
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
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GUI_GE'
        Width = 188
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTITY_REQUIRED'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_PRICE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REQ_DATE'
        Width = 65
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
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'in_out'
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 340
    Top = 210
    Width = 67
    Height = 24
    Caption = #20851#38381
    ModalResult = 1
    TabOrder = 1
    OnKeyDown = FormKeyDown
  end
  object DataSource1: TDataSource
    DataSet = DM.ADOmicprice
    Left = 200
    Top = 96
  end
end
