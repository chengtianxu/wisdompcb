object Form1: TForm1
  Left = 231
  Top = 196
  Width = 828
  Height = 502
  Caption = #38144#21806#35746#21333#26356#25913'('#24066#22330#37096')'
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 820
    Height = 456
    Align = alClient
    DataSource = DM.DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = N9Click
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'SALES_ORDER'
        Title.Caption = #38144#21806#35746#21333
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUST_CODE'
        Title.Caption = #23458#25143
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUST_PART_PTR'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_NUMBER'
        Title.Caption = #26412#21378#32534#21495
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_DESC'
        Title.Caption = #23458#25143#22411#21495
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_NUMBER'
        Title.Caption = #23458#25143#35746#21333#21495
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FOB'
        Title.Caption = #21512#21516#21495
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Title.Caption = #36755#20837#21592#24037
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORIG_SCHED_SHIP_DATE'
        Title.Caption = #35745#21010#20132#26399
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PARTS_ORDERED'
        Title.Caption = #35746#21333#25968
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PARTS_SHIPPED'
        Title.Caption = #24050#35013#36816#25968
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'v_status'
        Title.Caption = #29366#24577
        Width = 55
        Visible = True
      end>
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 264
    Top = 88
    object N21: TMenuItem
      Caption = #26356#25913#25968#37327#20215#26684#20132#26399
      OnClick = N21Click
    end
    object N26: TMenuItem
      Caption = #26356#25913#23458#25143#20195#30721'/'#23458#25143#35746#21333#21495
      OnClick = N26Click
    end
    object N24: TMenuItem
      Caption = #25286#20998#38144#21806#35746#21333
      OnClick = N24Click
    end
    object N27: TMenuItem
      Caption = #26356#25913#24037#20855#36153#29992
      OnClick = N27Click
    end
    object N11: TMenuItem
      Caption = '-'
    end
    object N9: TMenuItem
      Caption = #26597#30475#38144#21806#35746#21333#35814#24773
      OnClick = N9Click
    end
  end
  object MainMenu1: TMainMenu
    Left = 144
    Top = 96
    object N2: TMenuItem
      Caption = #25991#20214
      object N13: TMenuItem
        Caption = '-'
      end
      object N7: TMenuItem
        Caption = #26597#30475#38144#21806#35746#21333#35814#24773
        OnClick = N9Click
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object N5: TMenuItem
        Caption = #36864#20986
        OnClick = N5Click
      end
    end
    object N14: TMenuItem
      Caption = #26597#25214
      object N15: TMenuItem
        Caption = #25353#23458#25143
        OnClick = N15Click
      end
      object N18: TMenuItem
        Caption = #25353#38144#21806#35746#21333
        OnClick = N18Click
      end
      object N16: TMenuItem
        Caption = #25353#20135#21697#32534#21495
        OnClick = N16Click
      end
      object N28: TMenuItem
        Caption = #25353#23458#25143#22411#21495
        OnClick = N28Click
      end
      object N17: TMenuItem
        Caption = #25353#23458#25143#35746#21333#21495
        OnClick = N17Click
      end
      object N19: TMenuItem
        Caption = #20840#37096
        OnClick = N19Click
      end
    end
    object N22: TMenuItem
      Caption = #26085#26399#33539#22260
      object N23: TMenuItem
        Caption = #26085#26399#33539#22260
        OnClick = N23Click
      end
      object N25: TMenuItem
        Caption = #21047#26032
        OnClick = N25Click
      end
    end
  end
end
