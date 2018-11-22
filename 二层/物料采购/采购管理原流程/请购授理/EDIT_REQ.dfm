object Form2: TForm2
  Left = 211
  Top = 148
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #37319#36141#35831#27714
  ClientHeight = 493
  ClientWidth = 761
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 61
    Top = 52
    Width = 68
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #35831#36141#32534#21495':'
  end
  object Label2: TLabel
    Left = 96
    Top = 80
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #24037#21378':'
  end
  object Label3: TLabel
    Left = 401
    Top = 138
    Width = 67
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '   '#39044#31639#20195#30721':'
  end
  object Label4: TLabel
    Left = 61
    Top = 165
    Width = 68
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #23457#25209#20195#30721':'
  end
  object Label5: TLabel
    Left = 61
    Top = 138
    Width = 68
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #37319#36141#20154#21592':'
  end
  object Label8: TLabel
    Left = 61
    Top = 192
    Width = 68
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #35831#36141#37096#38376':'
  end
  object Label9: TLabel
    Left = 255
    Top = 80
    Width = 357
    Height = 13
    AutoSize = False
  end
  object Label10: TLabel
    Left = 256
    Top = 166
    Width = 193
    Height = 13
    AutoSize = False
  end
  object Label11: TLabel
    Left = 479
    Top = 166
    Width = 226
    Height = 13
    AutoSize = False
    Caption = '               '
  end
  object Label12: TLabel
    Left = 256
    Top = 137
    Width = 145
    Height = 13
    AutoSize = False
  end
  object Label14: TLabel
    Left = 400
    Top = 53
    Width = 68
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #35831#36141#26085#26399':'
  end
  object Label16: TLabel
    Left = 503
    Top = 462
    Width = 40
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#24635#35745':'
  end
  object Label17: TLabel
    Left = 304
    Top = 462
    Width = 70
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '    '#21487#29992#39044#31639':'
  end
  object Label18: TLabel
    Left = 329
    Top = 5
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object Label19: TLabel
    Left = 400
    Top = 109
    Width = 68
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #39044#31639#24180#24230':'
  end
  object Label20: TLabel
    Left = 560
    Top = 109
    Width = 67
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #39044#31639#26376#20221':'
  end
  object Label6: TLabel
    Left = 62
    Top = 109
    Width = 67
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #38656#27714#29992#25143':'
  end
  object Label7: TLabel
    Left = 256
    Top = 109
    Width = 145
    Height = 13
    AutoSize = False
  end
  object Label13: TLabel
    Left = 385
    Top = 190
    Width = 85
    Height = 13
    Alignment = taRightJustify
    Caption = #26368#21518#32534#36753#20154#21592':'
    Visible = False
  end
  object DBGrid2: TDBGrid
    Left = 7
    Top = 221
    Width = 745
    Height = 227
    DataSource = DM.DataSource4
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu2
    ReadOnly = True
    TabOrder = 20
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid2DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'DESCRIPTION_1'
        Title.Caption = #29289#21697#21517#31216
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GUI_GE'
        Title.Caption = #29289#21697#35268#26684
        Width = 208
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbr_name'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTITY_REQUIRED'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tax_price'
        Title.Caption = #20215#26684
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REQ_DATE'
        Title.Caption = #35201#27714#26085#26399
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'curr_name'
        Title.Caption = #36135#24065
        Width = 57
        Visible = True
      end>
  end
  object DBGrid1: TDBGrid
    Left = 7
    Top = 221
    Width = 745
    Height = 228
    DataSource = DM.DataSource3
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 17
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'inv_part_number'
        Title.Caption = #29289#26009#21517#31216
        Width = 171
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inv_part_description'
        Title.Caption = #29289#26009#35268#26684
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbr_name'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'unit_name'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTITY'
        Title.Caption = #25968#37327
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tax_price'
        Title.Caption = #20215#26684
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REQ_DATE'
        Title.Caption = #35201#27714#21040#36151#26085#26399
        Width = 92
        Visible = True
      end>
  end
  object StringGrid1: TStringGrid
    Left = 3
    Top = 326
    Width = 758
    Height = 120
    ColCount = 17
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 2
    TabOrder = 24
    Visible = False
    ColWidths = (
      64
      64
      64
      64
      64
      46
      51
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64)
  end
  object BitBtn9: TBitBtn
    Left = 8
    Top = 8
    Width = 28
    Height = 28
    Cursor = crHandPoint
    Hint = #20851#38381
    ParentShowHint = False
    ShowHint = True
    TabOrder = 21
    Visible = False
    OnClick = BitBtn9Click
    Glyph.Data = {
      EE000000424DEE000000000000007600000028000000100000000F0000000100
      0400000000007800000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFF0FFFFFF
      FFFFFFFF00FFFFFFFFFFFFF030FFFFFFFFFFFF0330FFFFFFFFFF003330000000
      0FFFF03330FF0FFFFFFFF03300FF0FFFF4FFF03330FF0FFF44FFF03330FF0FF4
      4444F03330FF0F444444F03330FF0FF44444F0330FFF0FFF44FFF030FFFF0FFF
      F4FFF00FFFFF0FFFFFFFF00000000FFFFFFF}
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 8
    Width = 28
    Height = 28
    Cursor = crHandPoint
    Hint = #20445#23384
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    TabStop = False
    OnClick = BitBtn1Click
    OnMouseDown = BitBtn1MouseDown
    Glyph.Data = {
      56070000424D5607000000000000360400002800000028000000140000000100
      0800000000002003000000000000000000000001000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
      0303030303030303030303030303030303030303030303030303030303030303
      0303030303030303030303030303030303030303030303030303030303030303
      0303030303030303030303030303030303030303030303030303030303030303
      030303FFFFFFFFFFFFFFFFFFFFFFFF030303030303F800000000000000000000
      0000F803030303030303F8F8F8F8F8F8F8F8F8F8F8F803FF030303030300FCFC
      00F8FCFCFF070700FCFC00030303030303F8FF03F8FF0303030303F8FF03F8FF
      030303030300FCFC00F8FCFCFF070700FCFC00030303030303F8FF03F8FF0303
      030303F8FF03F8FF030303030300FCFC0007F8F807070700FCFC000303030303
      03F8FF03F8FFFFFFFFFFFFF80303F8FF030303030300FCFC0600000000000006
      FCFC00030303030303F8FF0303F8F8F8F8F8F8030303F8FF030303030300FCFC
      FCFCFCFCFCFCFCFCFCFC00030303030303F8FF0303FFFFFFFFFFFFFFFF03F8FF
      030303030300FC06000000000000000006FC00030303030303F8FF03F8F8F8F8
      F8F8F8F803FFF8FF030303030300FC00FFFFFFFFFFFFFFFF00FC000303030303
      03F8FFF8FF03030303030303F8FFF8FF030303030300FC00FFFFFFFFFFFFFFFF
      00FC00030303030303F8FFF8FF03030303030303F8FFF8FF030303030300FC00
      FFFFFFFFFFFFFFFF00FC00030303030303F8FFF8FF03030303030303F8FFF8FF
      030303030300FC00FFFFFFFFFFFFFFFF00FC00030303030303F8FFF8FF030303
      03030303F8FFF8FF0303030303000000FFFFFFFFFFFFFFFF0000000303030303
      03F8FFF8FF03030303030303F8FFF8FF030303030300FC00FFFFFFFFFFFFFFFF
      00FC00030303030303F8FFF8FFFFFFFFFFFFFFFFF8FFF8030303030303F80000
      00000000000000000000F803030303030303F8F8F8F8F8F8F8F8F8F8F8F80303
      0303030303030303030303030303030303030303030303030303030303030303
      0303030303030303030303030303030303030303030303030303030303030303
      0303030303030303030303030303030303030303030303030303030303030303
      0303030303030303030303030303030303030303030303030303}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 37
    Top = 8
    Width = 28
    Height = 28
    Cursor = crHandPoint
    Hint = #35760#20107#26412
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    TabStop = False
    OnClick = BitBtn2Click
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
  object BitBtn3: TBitBtn
    Left = 66
    Top = 8
    Width = 28
    Height = 28
    Cursor = crHandPoint
    Hint = #21462#28040
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    TabStop = False
    OnClick = BitBtn3Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333FFFFF333333000033333388888833333333333F888888FFF333
      000033338811111188333333338833FFF388FF33000033381119999111833333
      38F338888F338FF30000339119933331111833338F388333383338F300003391
      13333381111833338F8F3333833F38F3000039118333381119118338F38F3338
      33F8F38F000039183333811193918338F8F333833F838F8F0000391833381119
      33918338F8F33833F8338F8F000039183381119333918338F8F3833F83338F8F
      000039183811193333918338F8F833F83333838F000039118111933339118338
      F3833F83333833830000339111193333391833338F33F8333FF838F300003391
      11833338111833338F338FFFF883F83300003339111888811183333338FF3888
      83FF83330000333399111111993333333388FFFFFF8833330000333333999999
      3333333333338888883333330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object MaskEdit1: TMaskEdit
    Left = 135
    Top = 49
    Width = 121
    Height = 21
    TabStop = False
    MaxLength = 15
    ReadOnly = True
    TabOrder = 3
  end
  object Edit1: TEdit
    Left = 135
    Top = 76
    Width = 84
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    MaxLength = 5
    ParentFont = False
    TabOrder = 4
    OnClick = Edit1Click
    OnExit = Edit1Exit
  end
  object Edit2: TEdit
    Left = 135
    Top = 161
    Width = 84
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    MaxLength = 5
    ParentFont = False
    TabOrder = 7
    OnClick = Edit1Click
    OnExit = Edit2Exit
  end
  object Edit3: TEdit
    Left = 476
    Top = 133
    Width = 121
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    TabOrder = 12
    OnClick = Edit1Click
    OnExit = Edit3Exit
  end
  object Edit4: TEdit
    Left = 135
    Top = 133
    Width = 84
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    MaxLength = 5
    ParentFont = False
    TabOrder = 6
    OnClick = Edit1Click
    OnExit = Edit4Exit
  end
  object DBEdit2: TDBEdit
    Left = 135
    Top = 188
    Width = 85
    Height = 21
    Color = cl3DLight
    DataField = 'DEPARTMENT_NAME'
    DataSource = DM.DataSource2
    ReadOnly = True
    TabOrder = 8
  end
  object BitBtn4: TBitBtn
    Left = 224
    Top = 75
    Width = 25
    Height = 25
    TabOrder = 13
    TabStop = False
    OnExit = BitBtn4Exit
    OnMouseDown = BitBtn4MouseDown
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
  object BitBtn5: TBitBtn
    Left = 224
    Top = 160
    Width = 25
    Height = 25
    TabOrder = 14
    TabStop = False
    OnClick = BitBtn5Click
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
  object BitBtn6: TBitBtn
    Left = 603
    Top = 131
    Width = 25
    Height = 25
    TabOrder = 15
    TabStop = False
    OnClick = BitBtn6Click
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
  object BitBtn7: TBitBtn
    Left = 224
    Top = 131
    Width = 25
    Height = 25
    TabOrder = 16
    TabStop = False
    OnClick = BitBtn7Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
      333333777777777F33333330B00000003333337F7777777F3333333000000000
      333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
      333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
      03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
      03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
      3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
      333333333377F7F33333333333330F03333333333337F7F33333333333330B03
      3333333333373733333333333333303333333333333373333333}
    NumGlyphs = 2
  end
  object MaskEdit2: TMaskEdit
    Left = 477
    Top = 49
    Width = 92
    Height = 21
    EditMask = '!0000-!90-90;1;_'
    MaxLength = 10
    ReadOnly = True
    TabOrder = 9
    Text = '    -  -  '
    OnExit = MaskEdit2Exit
  end
  object Edit8: TEdit
    Left = 379
    Top = 458
    Width = 121
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 18
    Text = '0.000'
  end
  object DBEdit3: TDBEdit
    Left = 544
    Top = 458
    Width = 121
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'TOTAL'
    DataSource = DM.DataSource2
    ReadOnly = True
    TabOrder = 19
  end
  object SpinEdit1: TSpinEdit
    Left = 477
    Top = 105
    Width = 76
    Height = 22
    MaxLength = 4
    MaxValue = 2050
    MinValue = 2000
    TabOrder = 10
    Value = 2000
  end
  object SpinEdit2: TSpinEdit
    Left = 636
    Top = 105
    Width = 76
    Height = 22
    MaxValue = 12
    MinValue = 1
    TabOrder = 11
    Value = 1
  end
  object Button1: TButton
    Left = 636
    Top = 130
    Width = 75
    Height = 25
    Caption = #39044#31639#32454#33410
    Enabled = False
    TabOrder = 22
    OnClick = Button1Click
  end
  object Edit5: TEdit
    Left = 135
    Top = 105
    Width = 83
    Height = 21
    TabOrder = 5
    OnClick = Edit1Click
    OnExit = Edit5Exit
    OnKeyPress = Edit5KeyPress
  end
  object BitBtn8: TBitBtn
    Left = 224
    Top = 103
    Width = 25
    Height = 25
    TabOrder = 23
    TabStop = False
    OnClick = BitBtn8Click
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
  object Edit6: TEdit
    Left = 477
    Top = 186
    Width = 121
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 25
    Visible = False
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 395
    Top = 5
    object N1: TMenuItem
      Caption = #28155#21152#35831#27714
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #32534#36753#35831#27714
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #21024#38500#35831#27714
      OnClick = N3Click
    end
  end
  object PopupMenu2: TPopupMenu
    OnPopup = PopupMenu2Popup
    Left = 427
    Top = 5
    object N4: TMenuItem
      Caption = #28155#21152#35831#27714
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = #32534#36753#35831#27714
      OnClick = N5Click
    end
    object N6: TMenuItem
      Caption = #21024#38500#35831#27714
      OnClick = N6Click
    end
  end
  object PopupMenu3: TPopupMenu
    Left = 480
    Top = 16
    object N7: TMenuItem
      Caption = #26816#26597
      OnClick = N7Click
    end
  end
  object PopupMenu4: TPopupMenu
    Left = 520
    Top = 16
    object N8: TMenuItem
      Caption = #26816#26597
      OnClick = N8Click
    end
  end
end
