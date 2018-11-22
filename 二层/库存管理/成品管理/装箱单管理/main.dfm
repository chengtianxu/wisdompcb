object Form1: TForm1
  Left = 334
  Top = 159
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #35013#36816#25351#27966#25628#32034
  ClientHeight = 541
  ClientWidth = 752
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 190
    Top = 14
    Width = 52
    Height = 13
    Alignment = taRightJustify
    Caption = #38144#21806#35746#21333
  end
  object Label2: TLabel
    Left = 435
    Top = 14
    Width = 77
    Height = 13
    Caption = 'SALES_ORDER'
    Visible = False
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 39
    Width = 752
    Height = 460
    DataSource = DM.DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu2
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = Button1Click
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'SALES_ORDER'
        Title.Caption = #38144#21806#23450#21333
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_NUMBER'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_DESC'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUST_CODE'
        Title.Caption = #23458#25143#20195#30721
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORIG_CUSTOMER'
        Title.Caption = #20851#32852#21407#23458#25143
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_NUMBER'
        Title.Caption = #23458#25143#35746#21333#21495
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Title.Caption = #25351#27966#20154#21592
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHIPMENT_NO'
        Width = 28
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_SHIPPED'
        Title.Caption = #35013#36816#25968#37327
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'assigntype'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbr_name'
        Width = 76
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 292
    Top = 510
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 376
    Top = 509
    Width = 75
    Height = 26
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 3
  end
  object Edit1: TEdit
    Left = 247
    Top = 10
    Width = 177
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = Edit1KeyDown
  end
  object PopupMenu2: TPopupMenu
    Left = 36
    Top = 360
    object N4: TMenuItem
      Caption = #26597#30475#35814#32454#36164#26009
      OnClick = N4Click
    end
    object N1: TMenuItem
      Caption = #38144#21806#23450#21333#35760#20107#26412
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #30830#35748#35760#20107#26412
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #35013#36816#25351#27966#35760#20107#26412
      OnClick = N3Click
    end
    object SO1: TMenuItem
      Caption = 'SO '#35013#36816#35760#20107#26412
      OnClick = SO1Click
    end
    object N5: TMenuItem
      Caption = #21047#26032
      OnClick = N5Click
    end
  end
end
