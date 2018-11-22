object Form1: TForm1
  Left = 208
  Top = 125
  Width = 767
  Height = 565
  Caption = #35831#36141#21333#23457#26680
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object csi_rkey: TLabel
    Left = 394
    Top = 3
    Width = 7
    Height = 13
    Caption = '4'
    Visible = False
  end
  object db_ptr: TLabel
    Left = 414
    Top = 3
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object vprev: TLabel
    Left = 430
    Top = 3
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object Splitter1: TSplitter
    Left = 0
    Top = 368
    Width = 759
    Height = 8
    Cursor = crVSplit
    Align = alBottom
  end
  object Panel1: TPanel
    Left = 0
    Top = 376
    Width = 759
    Height = 162
    Align = alBottom
    Alignment = taLeftJustify
    BevelOuter = bvNone
    TabOrder = 0
    object DBGrid3: TDBGrid
      Left = 0
      Top = 0
      Width = 759
      Height = 162
      Align = alClient
      DataSource = DM.DataSource3
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnKeyDown = DBGrid3KeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'DESCRIPTION_1'
          Width = 134
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'gui_ge'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'reason'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIT_NAME'
          Width = 34
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QUANTITY_REQUIRED'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tax_price'
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tax'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'abbr_name'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'in_out'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPTION_2'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'reply_date'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'req_date'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'curr_name'
          Width = 82
          Visible = True
        end>
    end
    object DBGrid2: TDBGrid
      Left = 0
      Top = 0
      Width = 759
      Height = 162
      Align = alClient
      DataSource = DM.DataSource2
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnKeyDown = DBGrid2KeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'inv_number'
          Width = 149
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'inv_part_number'
          Width = 138
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'inv_part_description'
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'reason'
          Width = 98
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'req_QUANTITY'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIT_NAME'
          Width = 59
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tax_price'
          Width = 68
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tax'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'stack_qty'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantity_zaitu'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'abbr_name'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'curr_name'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REQ_DATE'
          Width = 76
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'reply_DATE'
          Width = 92
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'extra_req'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'inv_group_desc'
          Width = 108
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GROUP_DESC'
          Width = 108
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 759
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 129
      Top = 14
      Width = 40
      Height = 13
      Alignment = taRightJustify
      Caption = ' '#20998#31867':'
    end
    object Label2: TLabel
      Left = 310
      Top = 14
      Width = 7
      Height = 13
    end
    object BitBtn1: TBitBtn
      Left = 12
      Top = 4
      Width = 56
      Height = 31
      Hint = #21462#28040#36864#20986
      Caption = #36864#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TabStop = False
      OnClick = BitBtn1Click
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
    object BitBtn2: TBitBtn
      Left = 68
      Top = 4
      Width = 53
      Height = 31
      Hint = #21047#26032
      Caption = #21047#26032
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TabStop = False
      OnClick = BitBtn2Click
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
    object BitBtn3: TBitBtn
      Left = 272
      Top = 7
      Width = 29
      Height = 28
      TabOrder = 2
      TabStop = False
      OnExit = BitBtn3Exit
      OnMouseDown = BitBtn3MouseDown
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
    object Edit1: TEdit
      Left = 170
      Top = 10
      Width = 87
      Height = 21
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = Edit1Click
      OnExit = Edit1Exit
    end
    object RadioGroup1: TRadioGroup
      Left = 584
      Top = 1
      Width = 169
      Height = 40
      Caption = #23457#25209
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #38656#23457#25209
        #20840#37096)
      TabOrder = 4
      OnClick = RadioGroup1Click
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 41
    Width = 759
    Height = 327
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 759
      Height = 327
      Hint = #25552#31034#65306#25353#20303'Ctrl'#38190#21487#20197#36873#25321#22810#26465#35760#21516#26102#25209#20934
      Align = alClient
      DataSource = DM.DataSource1
      Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentShowHint = False
      PopupMenu = PopupMenu1
      ShowHint = False
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnDblClick = DBGrid1DblClick
      OnKeyDown = DBGrid1KeyDown
      OnMouseDown = DBGrid1MouseDown
      Columns = <
        item
          Expanded = False
          FieldName = 'po_req_number'
          Title.Caption = #35831#27714#32534#21495
          Width = 102
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'abbr_name'
          Title.Caption = #24037#21378
          Width = 67
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMPLOYEE_NAME'
          Title.Caption = #35831#36141#20154
          Width = 92
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'USER_FULL_NAME'
          Width = 108
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'req_date'
          Title.Caption = #35831#36141#26085#26399
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'total'
          Title.Alignment = taRightJustify
          Title.Caption = #24635#35745#37329#39069
          Title.Color = cl3DLight
          Width = 103
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'v_status'
          Title.Caption = #29366#24577
          Width = 94
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'v_type'
          Title.Caption = #31867#22411
          Width = 88
          Visible = True
        end>
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 544
    Top = 6
    object N1: TMenuItem
      Caption = #25209#20934
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #21462#28040#23457#25209
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #36864#22238#35831#36141#32773
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N5: TMenuItem
      Caption = #26816#26597'/'#23457#25209
      OnClick = N5Click
    end
    object N6: TMenuItem
      Caption = #23457#25209#20449#24687
      OnClick = N6Click
    end
    object N7: TMenuItem
      Caption = #21047#26032
      OnClick = BitBtn2Click
    end
  end
end
