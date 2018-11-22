object Form_PackSearch: TForm_PackSearch
  Left = 162
  Top = 62
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #35013#36816#25351#27966#26126#32454#26597#25214
  ClientHeight = 529
  ClientWidth = 924
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 347
    Top = 8
    Width = 52
    Height = 13
    Alignment = taRightJustify
    Caption = #38144#21806#35746#21333
  end
  object Label2: TLabel
    Left = 613
    Top = 8
    Width = 77
    Height = 13
    Caption = 'SALES_ORDER'
    Visible = False
  end
  object Label4: TLabel
    Left = 4
    Top = 8
    Width = 79
    Height = 13
    Caption = #25351#27966#26085#26399' '#20174':'
  end
  object Label3: TLabel
    Left = 187
    Top = 8
    Width = 20
    Height = 13
    Caption = #21040':'
  end
  object Edit1: TEdit
    Left = 404
    Top = 4
    Width = 177
    Height = 21
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = Edit1KeyDown
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 28
    Width = 924
    Height = 460
    Align = alBottom
    DataSource = DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
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
        Title.Caption = #26412#21378#32534#21495
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_DESC'
        Title.Caption = #23458#25143#22411#21495
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
        FieldName = 'CURR_CODE'
        Title.Caption = #36135#24065
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cartons_no'
        Title.Caption = #31665#25968
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_SHIPPED'
        Title.Caption = #35013#36816#25968#37327
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rkey529_ptr'
        Title.Caption = #24050#25253#20851#25968#37327
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = #21487#25253#20851#25968#37327
        Title.Caption = #26410#25253#20851#25968#37327
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'assigntype'
        Title.Caption = #25351#27966
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbr_name'
        Title.Caption = #24037#21378
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATE_ASSIGN'
        Title.Caption = #25351#27966#26085#26399
        Width = 78
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 488
    Width = 924
    Height = 41
    Align = alBottom
    TabOrder = 2
    object Button1: TButton
      Left = 389
      Top = 9
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 473
      Top = 8
      Width = 75
      Height = 26
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object BtnBrush: TBitBtn
    Left = 582
    Top = 3
    Width = 26
    Height = 22
    Hint = #21047#26032#25968#25454
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000120B0000120B00001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
      DADABFBFBDADADADADADDADADBFADADADADAADADAD000DADADADDADAD0FBF0DA
      DADAADAD0F7FBF0DADADDAD0F7F87BF0DADAAD0F7F87BFB70DADD0F7F87BFB78
      80DA000F87BFB78880ADDAD00BFB78880ADAADADA0B7888740ADDADADA088804
      440AADADADA000A04440DADADADADADA0440ADADADADADADA00D}
  end
  object dtpk1: TDateTimePicker
    Left = 85
    Top = 3
    Width = 96
    Height = 21
    Date = 38847.000000000000000000
    Time = 38847.000000000000000000
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 4
    OnCloseUp = dtpk1Exit
    OnExit = dtpk1Exit
  end
  object dtpk2: TDateTimePicker
    Left = 211
    Top = 3
    Width = 96
    Height = 21
    Date = 38847.000000000000000000
    Time = 38847.000000000000000000
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 5
    OnCloseUp = dtpk1Exit
    OnExit = dtpk1Exit
  end
  object DataSource1: TDataSource
    DataSet = DM.ADO64
    Left = 240
    Top = 200
  end
end
