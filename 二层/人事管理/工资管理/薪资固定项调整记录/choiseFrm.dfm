object frmChoise: TfrmChoise
  Left = 681
  Top = 369
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #36873#25321#22120
  ClientHeight = 335
  ClientWidth = 278
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 278
    Height = 335
    Align = alClient
    DataSource = DM.ds3
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'datafield'
        Title.Caption = #34218#36164#31185#30446#20195#30721
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'itemname'
        Title.Caption = #34218#36164#31185#30446#21517#31216
        Width = 150
        Visible = True
      end>
  end
end
