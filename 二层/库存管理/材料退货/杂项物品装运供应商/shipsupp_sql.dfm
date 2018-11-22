object Form3: TForm3
  Left = 134
  Top = 161
  Width = 856
  Height = 504
  Caption = #38750#29983#20135#29289#21697#35013#36816#35760#24405#26597#35810
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 848
    Height = 458
    Align = alClient
    DataSource = DM.DataSource2
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
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
        FieldName = 'ABBR_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPTION'
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
        FieldName = 'DESCRIPTION2'
        Width = 70
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
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRAN_DATE'
        Width = 110
        Visible = True
      end>
  end
  object MainMenu1: TMainMenu
    Left = 248
    Top = 72
    object N1: TMenuItem
      Caption = #25805#20316
      object Excel1: TMenuItem
        Caption = #23548#20986#25968#25454#21040'Excel'
        OnClick = Excel1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object N4: TMenuItem
        Caption = #20851#38381
        ShortCut = 16465
        OnClick = N4Click
      end
    end
    object N2: TMenuItem
      Caption = #36807#28388
      object N5: TMenuItem
        Caption = #25353#20379#24212#21830
        OnClick = N5Click
      end
      object N6: TMenuItem
        Caption = #25353#29289#21697#21517#31216
        OnClick = N6Click
      end
      object N7: TMenuItem
        Caption = #25353#35013#36816#20154#21592
        OnClick = N7Click
      end
      object N9: TMenuItem
        Caption = #20840#37096
        OnClick = N9Click
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 216
    Top = 72
    object N8: TMenuItem
      Caption = #37325#21360#36864#36135#35013#36816#21333
      OnClick = N8Click
    end
  end
end
