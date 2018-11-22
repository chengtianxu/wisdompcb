object F_main: TF_main
  Left = 254
  Top = 149
  Width = 788
  Height = 572
  Caption = #20135#21697#29305#27530#20837#20179
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 780
    Height = 36
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      780
      36)
    object Label1: TLabel
      Left = 264
      Top = 12
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #20837#20179#21333#21495
    end
    object Label2: TLabel
      Left = 522
      Top = 13
      Width = 20
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = #20174':'
    end
    object Label3: TLabel
      Left = 649
      Top = 12
      Width = 20
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = #21040':'
    end
    object db_ptr: TLabel
      Left = 467
      Top = 11
      Width = 7
      Height = 13
      Caption = '0'
      Visible = False
    end
    object vprev: TLabel
      Left = 483
      Top = 11
      Width = 7
      Height = 13
      Caption = '2'
      Visible = False
    end
    object Button1: TButton
      Left = 0
      Top = 5
      Width = 55
      Height = 24
      Caption = #36864#20986
      TabOrder = 1
      OnClick = Button1Click
    end
    object Edit1: TEdit
      Left = 319
      Top = 8
      Width = 122
      Height = 21
      ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
      TabOrder = 0
      OnChange = Edit1Change
    end
    object dtpk1: TDateTimePicker
      Left = 547
      Top = 8
      Width = 96
      Height = 21
      Anchors = [akTop, akRight]
      Date = 38362.000000000000000000
      Time = 38362.000000000000000000
      ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
      TabOrder = 2
      OnCloseUp = dtpk1Exit
      OnExit = dtpk1Exit
    end
    object dtpk2: TDateTimePicker
      Left = 671
      Top = 8
      Width = 96
      Height = 21
      Anchors = [akTop, akRight]
      Date = 38362.000000000000000000
      Time = 38362.000000000000000000
      ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
      TabOrder = 3
      OnCloseUp = dtpk1Exit
      OnExit = dtpk1Exit
    end
    object Button2: TButton
      Left = 57
      Top = 5
      Width = 55
      Height = 24
      HelpType = htKeyword
      Caption = #21047#26032
      TabOrder = 4
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 114
      Top = 5
      Width = 62
      Height = 24
      Caption = #23548#20986'Excel'
      TabOrder = 5
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 178
      Top = 5
      Width = 75
      Height = 24
      Caption = #23450#20041#25253#34920
      TabOrder = 6
      OnClick = Button4Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 36
    Width = 780
    Height = 473
    Align = alClient
    DataSource = DM.DataSource1
    ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'number'
        ReadOnly = True
        Title.Color = clRed
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALES_ORDER'
        ReadOnly = True
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rma_number'
        Title.Caption = #36864#36135#21333#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        ReadOnly = True
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WAREHOUSE_CODE'
        ReadOnly = True
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sys_date'
        ReadOnly = True
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantity'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'C_type'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cust_code'
        Title.Caption = #23458#25143#20195#30721
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'customer_name'
        Title.Caption = #23458#25143#21517#31216
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dept_code'
        Title.Caption = #37096#38376#20195#30721
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dept_name'
        Title.Caption = #37096#38376#21517#31216
        Width = 105
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 509
    Width = 780
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object CheckBox1: TCheckBox
      Left = 75
      Top = 8
      Width = 79
      Height = 17
      Caption = #30452#25509#20837#20179
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = CheckBox1Click
    end
    object CheckBox4: TCheckBox
      Left = 158
      Top = 8
      Width = 77
      Height = 17
      Caption = #36864#36135#20837#20179
      TabOrder = 1
      OnClick = CheckBox1Click
    end
    object CheckBox5: TCheckBox
      Left = 236
      Top = 8
      Width = 77
      Height = 17
      Caption = #29983#20135#20837#24211
      TabOrder = 2
      OnClick = CheckBox1Click
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 368
    Top = 104
    object N1: TMenuItem
      Caption = #26032#22686
      object N5: TMenuItem
        Caption = #30452#25509#20837#20179
        OnClick = N5Click
      end
      object N7: TMenuItem
        Caption = #36864#36135#20837#20179
        OnClick = N7Click
      end
    end
    object N2: TMenuItem
      Caption = #32534#36753
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #26816#26597
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #21024#38500
      OnClick = N4Click
    end
    object N8: TMenuItem
      Caption = #25171#21360#20837#20179#21333
      OnClick = N8Click
    end
  end
end
