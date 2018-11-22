object Form2: TForm2
  Left = 236
  Top = 166
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Form2'
  ClientHeight = 401
  ClientWidth = 746
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
  object Label1: TLabel
    Left = 69
    Top = 24
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #35831#27714#32534#21495':'
  end
  object Label2: TLabel
    Left = 69
    Top = 48
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #24037#21378#32534#21495':'
  end
  object Label3: TLabel
    Left = 69
    Top = 72
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #35831#27714#20154#21592':'
  end
  object Label4: TLabel
    Left = 69
    Top = 96
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #25480#26435#20195#30721':'
  end
  object Label5: TLabel
    Left = 69
    Top = 120
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #37319#36141#20154#21592':'
  end
  object Label8: TLabel
    Left = 69
    Top = 142
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #35831#36141#37096#38376':'
  end
  object DBText1: TDBText
    Left = 136
    Top = 22
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'po_req_number'
    DataSource = DM.DataSource1
  end
  object DBText2: TDBText
    Left = 136
    Top = 46
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'warehouse_code'
    DataSource = DM.DataSource1
  end
  object DBText3: TDBText
    Left = 196
    Top = 46
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'warehouse_name'
    DataSource = DM.DataSource1
  end
  object DBText4: TDBText
    Left = 136
    Top = 71
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'empl_code'
    DataSource = DM.DataSource1
  end
  object DBText5: TDBText
    Left = 196
    Top = 70
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'EMPLOYEE_NAME'
    DataSource = DM.DataSource1
  end
  object DBText6: TDBText
    Left = 136
    Top = 96
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'code'
    DataSource = DM.DataSource1
  end
  object DBText7: TDBText
    Left = 196
    Top = 96
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'purchase_approv_desc'
    DataSource = DM.DataSource1
  end
  object DBText8: TDBText
    Left = 136
    Top = 120
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'buyer_empl_code'
    DataSource = DM.DataSource1
  end
  object DBText9: TDBText
    Left = 196
    Top = 118
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'buyer_empl_name'
    DataSource = DM.DataSource1
  end
  object Label9: TLabel
    Left = 69
    Top = 163
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #24635#35745#37329#39069':'
  end
  object DBText13: TDBText
    Left = 136
    Top = 162
    Width = 56
    Height = 13
    AutoSize = True
    DataField = 'total'
    DataSource = DM.DataSource1
  end
  object DBText14: TDBText
    Left = 136
    Top = 140
    Width = 56
    Height = 13
    AutoSize = True
    DataField = 'department_name'
    DataSource = DM.DataSource1
  end
  object Label10: TLabel
    Left = 447
    Top = 138
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #35831#36141#26085#26399':'
  end
  object DBText15: TDBText
    Left = 516
    Top = 138
    Width = 56
    Height = 13
    AutoSize = True
    DataField = 'req_date'
    DataSource = DM.DataSource1
  end
  object Label11: TLabel
    Left = 463
    Top = 162
    Width = 43
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #29366#24577':'
  end
  object DBText16: TDBText
    Left = 516
    Top = 162
    Width = 56
    Height = 13
    AutoSize = True
    DataField = 'v_status'
    DataSource = DM.DataSource1
  end
  object Label12: TLabel
    Left = 446
    Top = 94
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #39044#31639#20195#30721':'
  end
  object DBText17: TDBText
    Left = 515
    Top = 93
    Width = 56
    Height = 13
    AutoSize = True
    DataField = 'bud_code'
    DataSource = DM.DataSource1
  end
  object DBText18: TDBText
    Left = 516
    Top = 114
    Width = 56
    Height = 13
    AutoSize = True
    DataField = 'DESCRIPTION'
    DataSource = DM.DataSource1
  end
  object Label13: TLabel
    Left = 469
    Top = 114
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #25551#36848':'
  end
  object Label6: TLabel
    Left = 256
    Top = 163
    Width = 89
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '('#26412#20301#24065#35745#31639')'
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 182
    Width = 743
    Height = 181
    Color = cl3DLight
    DataSource = DM.DataSource3
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu2
    TabOrder = 2
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = N2Click
    Columns = <
      item
        Expanded = False
        FieldName = 'DESCRIPTION_1'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'gui_ge'
        Width = 169
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'reason'
        Width = 161
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Width = 63
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
        FieldName = 'tax_price'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tax'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'curr_name'
        Title.Caption = #36135#24065#31867#22411
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbr_name'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'in_out'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPTION_2'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'req_date'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'reply_date'
        Width = 83
        Visible = True
      end>
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 182
    Width = 744
    Height = 181
    Color = cl3DLight
    DataSource = DM.DataSource2
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    TabOrder = 1
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = N1Click
    OnKeyDown = FormKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'inv_number'
        Width = 129
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inv_part_number'
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inv_part_description'
        Width = 153
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'reason'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'req_QUANTITY'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tax_price'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'curr_name'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'stack_qty'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantity_zaitu'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbr_name'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REQ_DATE'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'reply_DATE'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'extra_req'
        Title.Caption = #29305#27530#35828#26126
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inv_group_desc'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GROUP_DESC'
        Width = 90
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 419
    Top = 372
    Width = 75
    Height = 26
    Caption = #20851#38381
    ModalResult = 3
    TabOrder = 0
    OnKeyDown = FormKeyDown
  end
  object BitBtn1: TBitBtn
    Left = 568
    Top = 16
    Width = 25
    Height = 25
    Hint = #35760#20107#26412
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = BitBtn1Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555500000000
      0555555F7777777775F55500FFFFFFFFF0555577F5FFFFFFF7F550F0FEEEEEEE
      F05557F7F777777757F550F0FFFFFFFFF05557F7F5FFFFFFF7F550F0FEEEEEEE
      F05557F7F777777757F550F0FF777FFFF05557F7F5FFFFFFF7F550F0FEEEEEEE
      F05557F7F777777757F550F0FF7F777FF05557F7F5FFFFFFF7F550F0FEEEEEEE
      F05557F7F777777757F550F0FF77F7FFF05557F7F5FFFFFFF7F550F0FEEEEEEE
      F05557F7F777777757F550F0FFFFFFFFF05557F7FF5F5F5F57F550F00F0F0F0F
      005557F77F7F7F7F77555055070707070555575F7F7F7F7F7F55550507070707
      0555557575757575755555505050505055555557575757575555}
    NumGlyphs = 2
  end
  object Button2: TButton
    Left = 236
    Top = 372
    Width = 75
    Height = 25
    Caption = #25209#20934
    ModalResult = 1
    TabOrder = 4
  end
  object Button3: TButton
    Left = 328
    Top = 372
    Width = 75
    Height = 25
    Caption = #36864#22238#37319#36141#37096
    ModalResult = 2
    TabOrder = 5
  end
  object PopupMenu1: TPopupMenu
    Left = 632
    Top = 88
    object N1: TMenuItem
      Caption = #26368#36817#21382#21490#20215#26684
      OnClick = N1Click
    end
    object N3: TMenuItem
      Caption = #25152#26377#20379#24212#21830#20449#24687
      OnClick = N3Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 672
    Top = 88
    object N2: TMenuItem
      Caption = #26368#36817#21382#21490#20215#26684
      OnClick = N2Click
    end
  end
end
