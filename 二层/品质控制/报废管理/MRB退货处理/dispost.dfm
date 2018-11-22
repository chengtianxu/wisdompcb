object Form2: TForm2
  Left = 272
  Top = 135
  BorderStyle = bsSingle
  Caption = #25104#21697#26816#35270
  ClientHeight = 503
  ClientWidth = 578
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
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
    Left = 32
    Top = 53
    Width = 54
    Height = 13
    Alignment = taRightJustify
    Caption = 'MRB'#32534#21495':'
  end
  object Label2: TLabel
    Left = 53
    Top = 198
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #22791#27880':'
  end
  object Label3: TLabel
    Left = 378
    Top = 112
    Width = 47
    Height = 13
    Alignment = taRightJustify
    Caption = '  '#26085#26399':'
  end
  object Label4: TLabel
    Left = 27
    Top = 82
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #20986#20179#21333#21495':'
  end
  object Label5: TLabel
    Left = 379
    Top = 141
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = #24050#37325#21046':'
    Visible = False
  end
  object Label6: TLabel
    Left = 227
    Top = 141
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = #24050#36820#24037':'
  end
  object Label7: TLabel
    Left = 27
    Top = 170
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #26816#35270#25968#37327':'
  end
  object Label8: TLabel
    Left = 379
    Top = 170
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = #24453#37325#21046':'
    Visible = False
  end
  object Label9: TLabel
    Left = 228
    Top = 170
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = #24453#36820#24037':'
  end
  object Label10: TLabel
    Left = 193
    Top = 53
    Width = 80
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#26412#21378#32534#21495':'
  end
  object Label11: TLabel
    Left = 366
    Top = 53
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #23458#25143#22411#21495':'
  end
  object Label14: TLabel
    Left = 27
    Top = 112
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #20986#20179#25968#37327':'
  end
  object Label13: TLabel
    Left = 40
    Top = 141
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = #24050#26816#35270':'
  end
  object Label15: TLabel
    Left = 280
    Top = 84
    Width = 56
    Height = 13
    Caption = '        '
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 8
    Width = 58
    Height = 25
    Hint = #20445#23384#31243#24207
    Caption = #20445#23384
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    TabStop = False
    OnClick = BitBtn1Click
    NumGlyphs = 2
  end
  object BitBtn4: TBitBtn
    Left = 68
    Top = 8
    Width = 58
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 8
  end
  object Edit1: TEdit
    Left = 94
    Top = 49
    Width = 115
    Height = 21
    MaxLength = 15
    TabOrder = 0
  end
  object DBEdit1: TDBEdit
    Left = 428
    Top = 108
    Width = 121
    Height = 21
    Color = cl3DLight
    DataField = 'sys_date'
    DataSource = DM.DataSource2
    ReadOnly = True
    TabOrder = 9
  end
  object Edit2: TEdit
    Left = 94
    Top = 78
    Width = 114
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 10
  end
  object BitBtn2: TBitBtn
    Left = 212
    Top = 77
    Width = 61
    Height = 25
    Caption = #26597#25214
    TabOrder = 1
    OnClick = BitBtn2Click
    Glyph.Data = {
      EE000000424DEE000000000000007600000028000000100000000F0000000100
      04000000000078000000130B0000130B00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      888800000888880000080F000888880F00080F000888880F0008000000080000
      000800F000000F00000800F000800F00000800F000800F000008800000000000
      0088880F00080F000888880000080000088888800088800088888880F08880F0
      888888800088800088888888888888888888}
  end
  object DBEdit5: TDBEdit
    Left = 94
    Top = 166
    Width = 89
    Height = 21
    DataField = 'qty_rece'
    DataSource = DM.DataSource2
    TabOrder = 2
    OnExit = DBEdit5Exit
    OnKeyPress = DBEdit5KeyPress
  end
  object DBEdit6: TDBEdit
    Left = 429
    Top = 166
    Width = 90
    Height = 21
    DataField = 'qty_to_be_remaked'
    DataSource = DM.DataSource2
    TabOrder = 4
    Visible = False
    OnExit = DBEdit6Exit
    OnKeyPress = DBEdit5KeyPress
    OnKeyUp = DBEdit6KeyUp
  end
  object DBEdit7: TDBEdit
    Left = 277
    Top = 166
    Width = 89
    Height = 21
    DataField = 'qty_to_be_reworked'
    DataSource = DM.DataSource2
    Enabled = False
    ReadOnly = True
    TabOrder = 3
    OnExit = DBEdit7Exit
    OnKeyPress = DBEdit5KeyPress
    OnKeyUp = DBEdit7KeyUp
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 264
    Width = 578
    Height = 239
    Align = alBottom
    DataSource = DM.DataSource3
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'rej_code'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rej_desc'
        Width = 144
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'v_type'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTITY'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REFERENCE_NUMBER'
        Visible = True
      end>
  end
  object Edit3: TEdit
    Left = 278
    Top = 50
    Width = 87
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 11
  end
  object Edit4: TEdit
    Left = 429
    Top = 50
    Width = 124
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 12
  end
  object Edit6: TEdit
    Left = 94
    Top = 107
    Width = 89
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 13
    Text = '0'
  end
  object Edit5: TEdit
    Left = 94
    Top = 137
    Width = 90
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 14
    Text = '0'
  end
  object DBEdit2: TDBEdit
    Left = 277
    Top = 137
    Width = 89
    Height = 21
    Color = cl3DLight
    DataField = 'QTY_REWORKED'
    DataSource = DM.DataSource2
    ReadOnly = True
    TabOrder = 15
    OnKeyPress = DBEdit5KeyPress
  end
  object DBEdit3: TDBEdit
    Left = 429
    Top = 137
    Width = 90
    Height = 21
    Color = cl3DLight
    DataField = 'QTY_REMAKED'
    DataSource = DM.DataSource2
    ReadOnly = True
    TabOrder = 16
    Visible = False
    OnKeyPress = DBEdit5KeyPress
  end
  object DBMemo1: TDBMemo
    Left = 93
    Top = 193
    Width = 423
    Height = 65
    DataField = 'reference'
    DataSource = DM.DataSource2
    ScrollBars = ssVertical
    TabOrder = 5
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 48
    Top = 384
    object N1: TMenuItem
      Caption = #22686#21152
      OnClick = N1Click
    end
    object N3: TMenuItem
      Caption = #21024#38500
      OnClick = N3Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 48
    Top = 344
  end
end
