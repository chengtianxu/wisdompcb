object Form_bominvt: TForm_bominvt
  Left = 297
  Top = 110
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'BOM'#26448#26009#28165#21333#20449#24687
  ClientHeight = 592
  ClientWidth = 629
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 551
    Width = 629
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      629
      41)
    object BitBtn1: TBitBtn
      Left = 222
      Top = 6
      Width = 76
      Height = 29
      Anchors = [akTop]
      Caption = #30830#23450
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000610B0000610B00000001000000000000000000003300
        00006600000099000000CC000000FF0000000033000033330000663300009933
        0000CC330000FF33000000660000336600006666000099660000CC660000FF66
        000000990000339900006699000099990000CC990000FF99000000CC000033CC
        000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
        0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
        330000333300333333006633330099333300CC333300FF333300006633003366
        33006666330099663300CC663300FF6633000099330033993300669933009999
        3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
        330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
        66006600660099006600CC006600FF0066000033660033336600663366009933
        6600CC336600FF33660000666600336666006666660099666600CC666600FF66
        660000996600339966006699660099996600CC996600FF99660000CC660033CC
        660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
        6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
        990000339900333399006633990099339900CC339900FF339900006699003366
        99006666990099669900CC669900FF6699000099990033999900669999009999
        9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
        990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
        CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
        CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
        CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
        CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
        CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
        FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
        FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
        FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
        FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
        000000808000800000008000800080800000C0C0C00080808000191919004C4C
        4C00B2B2B200E5E5E5005A1E1E00783C3C0096646400C8969600FFC8C800465F
        82005591B9006EB9D7008CD2E600B4E6F000D8E9EC0099A8AC00646F7100E2EF
        F100C56A31000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000EEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE180C
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEE2DFEEEEEEEEEEEEEEEEEEEEEEEEEE181212
        0CEEEEEEEEEEEEEEEEEEEEEEEEE28181DFEEEEEEEEEEEEEEEEEEEEEE18121212
        120CEEEEEEEEEEEEEEEEEEEEE281818181DFEEEEEEEEEEEEEEEEEE1812121212
        12120CEEEEEEEEEEEEEEEEE2818181818181DFEEEEEEEEEEEEEEEE1812120C18
        1212120CEEEEEEEEEEEEEEE28181DFE2818181DFEEEEEEEEEEEEEE18120CEEEE
        181212120CEEEEEEEEEEEEE281DFEEEEE2818181DFEEEEEEEEEEEE180CEEEEEE
        EE181212120CEEEEEEEEEEE2DFEEEEEEEEE2818181DFEEEEEEEEEEEEEEEEEEEE
        EEEE181212120CEEEEEEEEEEEEEEEEEEEEEEE2818181DFEEEEEEEEEEEEEEEEEE
        EEEEEE181212120CEEEEEEEEEEEEEEEEEEEEEEE2818181DFEEEEEEEEEEEEEEEE
        EEEEEEEE1812120CEEEEEEEEEEEEEEEEEEEEEEEEE28181DFEEEEEEEEEEEEEEEE
        EEEEEEEEEE18120CEEEEEEEEEEEEEEEEEEEEEEEEEEE281DFEEEEEEEEEEEEEEEE
        EEEEEEEEEEEE180CEEEEEEEEEEEEEEEEEEEEEEEEEEEEE2DFEEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE}
      NumGlyphs = 2
    end
    object BitBtn2: TBitBtn
      Left = 321
      Top = 6
      Width = 76
      Height = 29
      Anchors = [akTop]
      Cancel = True
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
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
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 629
    Height = 257
    Align = alTop
    Caption = 'Panel2'
    TabOrder = 1
    object Label1: TLabel
      Left = 29
      Top = 51
      Width = 59
      Height = 13
      Caption = #37197#26009#21333#21495':'
    end
    object Label2: TLabel
      Left = 298
      Top = 51
      Width = 59
      Height = 13
      Caption = #26412#21378#32534#21495':'
    end
    object Label3: TLabel
      Left = 29
      Top = 80
      Width = 59
      Height = 13
      Caption = #24037#24207#20195#30721':'
    end
    object Label4: TLabel
      Left = 236
      Top = 80
      Width = 7
      Height = 13
    end
    object Label5: TLabel
      Left = 29
      Top = 137
      Width = 59
      Height = 13
      Caption = #26448#26009#32534#30721':'
    end
    object Label6: TLabel
      Left = 29
      Top = 169
      Width = 59
      Height = 13
      Caption = #26448#26009#21517#31216':'
    end
    object Label7: TLabel
      Left = 29
      Top = 201
      Width = 59
      Height = 13
      Caption = #26448#26009#35268#26684':'
    end
    object Label8: TLabel
      Left = 55
      Top = 234
      Width = 33
      Height = 13
      Caption = #37197#39069':'
    end
    object Label9: TLabel
      Left = 255
      Top = 234
      Width = 46
      Height = 13
      Caption = #20379#24212#21830':'
    end
    object Label10: TLabel
      Left = 379
      Top = 137
      Width = 33
      Height = 13
      Caption = #21333#20301':'
    end
    object Label11: TLabel
      Left = 55
      Top = 22
      Width = 33
      Height = 13
      Caption = #31867#22411':'
    end
    object Label12: TLabel
      Left = 55
      Top = 108
      Width = 33
      Height = 13
      Caption = #27493#39588':'
    end
    object Label13: TLabel
      Left = 285
      Top = 169
      Width = 72
      Height = 13
      Alignment = taRightJustify
      Caption = #24403#21069#24635#24211#23384':'
    end
    object rkey25: TLabel
      Left = 488
      Top = 48
      Width = 7
      Height = 13
      Caption = '0'
      Visible = False
    end
    object rkey34: TLabel
      Left = 488
      Top = 80
      Width = 7
      Height = 13
      Caption = '0'
      Visible = False
    end
    object rkey17: TLabel
      Left = 488
      Top = 136
      Width = 7
      Height = 13
      Caption = '0'
      Visible = False
    end
    object group_ptr: TLabel
      Left = 488
      Top = 168
      Width = 7
      Height = 13
      Caption = '0'
      Visible = False
    end
    object ComboBox1: TComboBox
      Left = 90
      Top = 47
      Width = 137
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = ComboBox1Change
    end
    object Edit1: TEdit
      Left = 358
      Top = 47
      Width = 121
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 1
    end
    object Edit2: TEdit
      Left = 90
      Top = 76
      Width = 103
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 2
    end
    object BitBtn3: TBitBtn
      Left = 200
      Top = 74
      Width = 25
      Height = 25
      TabOrder = 3
      OnClick = BitBtn3Click
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
    object Edit3: TEdit
      Left = 90
      Top = 133
      Width = 135
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 4
    end
    object Edit4: TEdit
      Left = 91
      Top = 165
      Width = 134
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 5
    end
    object Edit5: TEdit
      Left = 91
      Top = 197
      Width = 390
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 6
    end
    object Edit6: TEdit
      Left = 91
      Top = 230
      Width = 133
      Height = 21
      TabOrder = 7
      Text = '0'
      OnKeyPress = Edit6KeyPress
      OnKeyUp = Edit6KeyUp
    end
    object Edit7: TEdit
      Left = 303
      Top = 230
      Width = 250
      Height = 21
      MaxLength = 30
      TabOrder = 8
    end
    object BitBtn4: TBitBtn
      Left = 232
      Top = 131
      Width = 25
      Height = 25
      TabOrder = 9
      OnClick = BitBtn4Click
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
    object Edit8: TEdit
      Left = 413
      Top = 133
      Width = 69
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 10
    end
    object CheckBox1: TCheckBox
      Left = 191
      Top = 20
      Width = 58
      Height = 17
      Caption = #21015#21360
      Checked = True
      State = cbChecked
      TabOrder = 11
    end
    object ComboBox2: TComboBox
      Left = 90
      Top = 18
      Width = 73
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      ItemIndex = 0
      TabOrder = 12
      Text = #26631#20934
      OnChange = ComboBox2Change
      Items.Strings = (
        #26631#20934
        #20313#26009)
    end
    object Edit9: TEdit
      Left = 91
      Top = 105
      Width = 70
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 13
    end
    object Edit10: TEdit
      Left = 358
      Top = 165
      Width = 122
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 14
      Text = '0'
    end
    object Panel4: TPanel
      Left = 37
      Top = 261
      Width = 128
      Height = 53
      BevelOuter = bvNone
      TabOrder = 15
      Visible = False
      object Label14: TLabel
        Left = 3
        Top = 8
        Width = 46
        Height = 13
        Caption = #20313#26009#38271':'
      end
      object Label15: TLabel
        Left = 2
        Top = 32
        Width = 46
        Height = 13
        Caption = #20313#26009#23485':'
      end
      object Edit11: TEdit
        Left = 53
        Top = 4
        Width = 65
        Height = 21
        Color = cl3DLight
        ReadOnly = True
        TabOrder = 0
        Text = '0'
      end
      object Edit12: TEdit
        Left = 53
        Top = 28
        Width = 65
        Height = 21
        Color = cl3DLight
        ReadOnly = True
        TabOrder = 1
        Text = '0'
      end
    end
    object RadioGroup1: TRadioGroup
      Left = 262
      Top = 109
      Width = 96
      Height = 50
      Caption = #26448#26009#26597#25214#26041#24335
      ItemIndex = 0
      Items.Strings = (
        #25353#24211#23384
        #25353#32534#30721)
      TabOrder = 16
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 257
    Width = 629
    Height = 294
    Align = alClient
    Caption = 'Panel3'
    TabOrder = 2
    object Splitter1: TSplitter
      Left = 409
      Top = 1
      Height = 292
    end
    object DBGrid3: TDBGrid
      Left = 1
      Top = 1
      Width = 408
      Height = 292
      Align = alLeft
      DataSource = DM.DataSource5
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'step_number'
          Title.Alignment = taCenter
          Width = 26
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PARAMETER_NAME'
          Title.Alignment = taCenter
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PARAMETER_DESC'
          Title.Alignment = taCenter
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIT_NAME'
          Title.Alignment = taCenter
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATATYPE'
          Title.Alignment = taCenter
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PARAMETER_VALUE'
          Title.Alignment = taCenter
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Doc_Flag'
          PickList.Strings = (
            'Y'
            'N')
          Title.Alignment = taCenter
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'after_flag'
          PickList.Strings = (
            'Y'
            'N')
          Title.Alignment = taCenter
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'flow_spfc_flag'
          PickList.Strings = (
            'Y'
            'N')
          Title.Alignment = taCenter
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'seq_no'
          Title.Alignment = taCenter
          Width = 30
          Visible = True
        end>
    end
    object StringGrid1: TStringGrid
      Left = 412
      Top = 1
      Width = 216
      Height = 292
      Align = alClient
      ColCount = 4
      Ctl3D = True
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goRowSelect]
      ParentCtl3D = False
      TabOrder = 1
    end
  end
end
