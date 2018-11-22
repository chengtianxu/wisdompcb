object Form19: TForm19
  Left = 226
  Top = 151
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #37319#36141#25910#36135#20449#24687
  ClientHeight = 383
  ClientWidth = 580
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 26
    Width = 580
    Height = 130
    Align = alTop
    DataSource = DM.DataSource6
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = FormKeyDown
  end
  object Button1: TButton
    Left = 254
    Top = 339
    Width = 70
    Height = 26
    Caption = #20851#38381
    ModalResult = 1
    TabOrder = 1
    OnKeyDown = FormKeyDown
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 190
    Width = 580
    Height = 134
    Align = alTop
    DataSource = DM.DataSource7
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = FormKeyDown
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 580
    Height = 26
    Align = alTop
    BevelOuter = bvNone
    Caption = #35746#36141#20449#24687
    TabOrder = 3
  end
  object Panel2: TPanel
    Left = 0
    Top = 156
    Width = 580
    Height = 34
    Align = alTop
    BevelOuter = bvNone
    Caption = #20179#24211#25910#36135#20449#24687
    TabOrder = 4
  end
end
