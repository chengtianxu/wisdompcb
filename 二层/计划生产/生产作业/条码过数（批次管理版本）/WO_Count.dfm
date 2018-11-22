object frmWO_Count: TfrmWO_Count
  Left = 341
  Top = 73
  Width = 632
  Height = 588
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #20316#19994#21333#36807#25968#20449#24687
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 616
    Height = 511
    Align = alClient
    TabOrder = 1
    object Label15: TLabel
      Left = 400
      Top = 15
      Width = 65
      Height = 13
      Alignment = taRightJustify
      Caption = #24403#21069#27493#39588#65306
    end
    object Label5: TLabel
      Left = 107
      Top = 11
      Width = 65
      Height = 13
      Alignment = taRightJustify
      Caption = #20316#19994#21333#21495#65306
    end
    object Label6: TLabel
      Left = 107
      Top = 61
      Width = 65
      Height = 13
      Alignment = taRightJustify
      Caption = #23458#25143#22411#21495#65306
    end
    object Label7: TLabel
      Left = 107
      Top = 86
      Width = 65
      Height = 13
      Alignment = taRightJustify
      Caption = #29983#20135#20132#26399#65306
    end
    object Label12: TLabel
      Left = 107
      Top = 36
      Width = 65
      Height = 13
      Alignment = taRightJustify
      Caption = #26412#21378#32534#21495#65306
    end
    object Label14: TLabel
      Left = 426
      Top = 38
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = #32467#23384#65306
    end
    object Label8: TLabel
      Left = 426
      Top = 64
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = #20135#20986#65306
    end
    object Label4: TLabel
      Left = 400
      Top = 91
      Width = 65
      Height = 13
      Alignment = taRightJustify
      Caption = #36807#25968#20154#21592#65306
    end
    object Label1: TLabel
      Left = 105
      Top = 134
      Width = 70
      Height = 13
      Alignment = taRightJustify
      Caption = #36807#25968#24037#24207#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 53
      Top = 158
      Width = 122
      Height = 13
      Alignment = taRightJustify
      Caption = #22312#32447'(PCS/PNLS)'#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 246
      Top = 156
      Width = 9
      Height = 16
      Alignment = taRightJustify
      Caption = '/'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 107
      Top = 110
      Width = 65
      Height = 13
      Alignment = taRightJustify
      Caption = #25237#20135#25968#37327#65306
    end
    object Label13: TLabel
      Left = 359
      Top = 122
      Width = 106
      Height = 13
      Alignment = taRightJustify
      Caption = #25253#24223'/'#24453#25253#24223'PCS'#65306
    end
    object Label16: TLabel
      Left = 398
      Top = 156
      Width = 70
      Height = 13
      Alignment = taRightJustify
      Caption = #36807#25968#24037#21378#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label19: TLabel
      Left = 536
      Top = 120
      Width = 9
      Height = 16
      Alignment = taRightJustify
      Caption = '/'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label20: TLabel
      Left = 60
      Top = 181
      Width = 114
      Height = 13
      Alignment = taRightJustify
      Caption = #22791#27880'('#36807#25968#25289#32447')'#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label21: TLabel
      Left = 683
      Top = 10
      Width = 126
      Height = 13
      Alignment = taRightJustify
      Caption = #24050#20998#37197#22909#30340#20316#19994#21333#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label22: TLabel
      Left = 249
      Top = 336
      Width = 124
      Height = 13
      Caption = #36873#25321#36807#25968#21512#21345#30340#24037#21333':'
    end
    object DBEdit1: TDBEdit
      Left = 171
      Top = 7
      Width = 145
      Height = 21
      DataField = 'WORK_ORDER_NUMBER'
      DataSource = dmcon.dsWOInfo
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 171
      Top = 31
      Width = 145
      Height = 21
      DataField = 'MANU_PART_NUMBER'
      DataSource = dmcon.dsWOInfo
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit3: TDBEdit
      Left = 171
      Top = 55
      Width = 145
      Height = 21
      DataField = 'MANU_PART_DESC'
      DataSource = dmcon.dsWOInfo
      ReadOnly = True
      TabOrder = 4
    end
    object DBEdit4: TDBEdit
      Left = 171
      Top = 79
      Width = 145
      Height = 21
      DataField = 'SCH_COMPL_DATE'
      DataSource = dmcon.dsWOInfo
      ReadOnly = True
      TabOrder = 6
    end
    object DBEdit5: TDBEdit
      Left = 464
      Top = 7
      Width = 145
      Height = 21
      DataField = 'STEP'
      DataSource = dmcon.dsWOInfo
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit9: TDBEdit
      Left = 464
      Top = 31
      Width = 145
      Height = 21
      DataField = 'QTY_BACKLOG'
      DataSource = dmcon.dsWOInfo
      ReadOnly = True
      TabOrder = 3
    end
    object DBEdit10: TDBEdit
      Left = 464
      Top = 58
      Width = 145
      Height = 21
      DataField = 'QTY_BACKLOG'
      DataSource = dmcon.dsWOInfo
      ReadOnly = True
      TabOrder = 5
    end
    object DBEdit11: TDBEdit
      Left = 464
      Top = 86
      Width = 145
      Height = 21
      DataField = 'LOGIN_NAME'
      DataSource = dmcon.DS
      ReadOnly = True
      TabOrder = 7
    end
    object DBEdit6: TDBEdit
      Left = 171
      Top = 129
      Width = 145
      Height = 21
      DataField = 'DEPT_NAME'
      DataSource = dmcon.dsWOInfo
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 10
    end
    object EdtPNL: TDBEdit
      Left = 257
      Top = 153
      Width = 59
      Height = 21
      DataField = 'PANELS'
      DataSource = dmcon.dsWOInfo
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 12
    end
    object EdtPcs: TDBEdit
      Left = 171
      Top = 153
      Width = 73
      Height = 21
      DataField = 'QTY_BACKLOG'
      DataSource = dmcon.dsWOInfo
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 11
    end
    object rgType: TRadioGroup
      Left = 152
      Top = 197
      Width = 457
      Height = 41
      Caption = #31867#22411
      Columns = 3
      Enabled = False
      ItemIndex = 0
      Items.Strings = (
        #27491#24120#29983#20135
        #36820#24037#29983#20135
        #22806#21457#29983#20135)
      TabOrder = 13
    end
    object DBEdit12: TDBEdit
      Left = 171
      Top = 103
      Width = 145
      Height = 21
      DataField = 'Quan_Sch'
      DataSource = dmcon.dsWOInfo
      ReadOnly = True
      TabOrder = 8
    end
    object DBEdit13: TDBEdit
      Left = 464
      Top = 117
      Width = 73
      Height = 21
      DataField = 'Quan_Rej'
      DataSource = dmcon.dsWOInfo
      ReadOnly = True
      TabOrder = 9
    end
    object ComboBox1: TComboBox
      Left = 465
      Top = 152
      Width = 145
      Height = 21
      Style = csDropDownList
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ItemHeight = 13
      ParentFont = False
      TabOrder = 14
    end
    object GroupBox2: TGroupBox
      Left = 33
      Top = 241
      Width = 562
      Height = 88
      Caption = #19979#24037#24207
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 15
      object Label17: TLabel
        Left = 26
        Top = 27
        Width = 134
        Height = 13
        Caption = #25509#21463#25968#37327'PCS/PNLS'#65306
      end
      object Label10: TLabel
        Left = 238
        Top = 25
        Width = 9
        Height = 16
        Alignment = taRightJustify
        Caption = '/'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label18: TLabel
        Left = 337
        Top = 27
        Width = 70
        Height = 13
        Alignment = taRightJustify
        Caption = #29983#20135#24037#21378#65306
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtNewPCS: TEdit
        Left = 160
        Top = 23
        Width = 78
        Height = 21
        TabOrder = 0
        OnExit = edtNewPCSExit
        OnKeyPress = edtNewPCSKeyPress
      end
      object edtNewPNL: TEdit
        Left = 249
        Top = 23
        Width = 71
        Height = 21
        TabOrder = 1
        OnExit = edtNewPNLExit
        OnKeyPress = edtNewPCSKeyPress
      end
      object CheckBox3: TCheckBox
        Left = 54
        Top = 58
        Width = 129
        Height = 17
        Caption = #25171#21360#31616#26131#20316#19994#21333
        TabOrder = 2
      end
      object CheckBox1: TCheckBox
        Left = 328
        Top = 58
        Width = 54
        Height = 17
        Caption = #22806#21457
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object CheckBox2: TCheckBox
        Left = 205
        Top = 58
        Width = 77
        Height = 17
        Caption = 'PNLS'#28165'0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
      end
      object ComboBox2: TComboBox
        Left = 409
        Top = 23
        Width = 145
        Height = 21
        Style = csDropDownList
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ItemHeight = 13
        ParentFont = False
        TabOrder = 5
      end
      object CheckBox4: TCheckBox
        Left = 439
        Top = 58
        Width = 77
        Height = 17
        Caption = #36807#25968#21512#21345
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        OnClick = CheckBox4Click
      end
    end
    object edtDiscardQty: TDBEdit
      Left = 544
      Top = 117
      Width = 65
      Height = 21
      DataField = 'QUAN_ALLREJ'
      DataSource = dmcon.dsWOInfo
      ReadOnly = True
      TabOrder = 16
    end
    object ComboBox3: TComboBox
      Left = 171
      Top = 177
      Width = 438
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ItemHeight = 13
      ParentFont = False
      TabOrder = 17
    end
    object lv1: TListView
      Left = 28
      Top = 348
      Width = 580
      Height = 157
      Checkboxes = True
      Columns = <
        item
          Caption = #36873#20013
        end
        item
          Alignment = taCenter
          Caption = #20316#19994#21333#21495
          Width = 200
        end
        item
          Alignment = taCenter
          Caption = #21051#21360#20869#23481
          Width = 100
        end
        item
          Alignment = taCenter
          Caption = #22312#32447#25968#37327
          Width = 78
        end
        item
          Alignment = taCenter
          Caption = #22312#32447'PNL'
          Width = 70
        end
        item
          Alignment = taCenter
          Caption = #24403#21069#27493#39588
          Width = 78
        end
        item
          Caption = #26631#35782
          Width = 0
        end>
      GridLines = True
      RowSelect = True
      TabOrder = 18
      ViewStyle = vsReport
      OnExit = lv1Exit
      OnMouseDown = lv1MouseDown
      OnSelectItem = lv1SelectItem
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 511
    Width = 616
    Height = 38
    Align = alBottom
    BevelOuter = bvSpace
    TabOrder = 0
    object SpeedButton2: TSpeedButton
      Left = 359
      Top = 6
      Width = 80
      Height = 25
      Caption = #36864#20986
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000710B0000710B00000001000000000000000000003300
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
        F1EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEF1EEEEEEEEEEEEEEEEEEEEEEEEF1E3AC
        E3F1EEEEEEEEEEEEEEEEEEEEEEF1EEACE3F1EEEEEEEEEEEEEEEEEEF1E3E28257
        57E2ACE3F1EEEEEEEEEEEEF1EEE2818181E2ACEEF1EEEEEEEEEEE382578282D7
        578181E2E3EEEEEEEEEEEE81818181D7818181E2EEEEEEEEEEEE57828989ADD7
        57797979F1EEEEEEEEEE8181DEDEACD781818181F1EEEEEEEEEE57898989ADD7
        57AAAAA2D7ADEEEEEEEE81DEDEDEACD781DEDE81D7ACEEEEEEEE57898989ADD7
        57AACEA3AD10EEEEEEEE81DEDEDEACD781DEAC81AC81EEEEEEEE5789825EADD7
        57ABCFE21110EEEEEEEE81DE8181ACD781ACACE28181EEEEEEEE578957D7ADD7
        57ABDE101010101010EE81DE56D7ACD781ACDE818181818181EE57898257ADD7
        57EE10101010101010EE81DE8156ACD781E381818181818181EE57898989ADD7
        57EE82101010101010EE81DEDEDEACD781E381818181818181EE57898989ADD7
        57ACF1821110EEEEEEEE81DEDEDEACD781ACF1818181EEEEEEEE57898989ADD7
        57ABEEAB8910EEEEEEEE81DEDEDEACD781ACE3ACDE81EEEEEEEE57828989ADD7
        57ACEEA3EE89EEEEEEEE8181DEDEACD781ACE381EEDEEEEEEEEEEEDE5E8288D7
        57A2A2A2EEEEEEEEEEEEEEDE8181DED781818181EEEEEEEEEEEEEEEEEEAC8257
        57EEEEEEEEEEEEEEEEEEEEEEEEAC818181EEEEEEEEEEEEEEEEEE}
      NumGlyphs = 2
      OnClick = SpeedButton2Click
    end
    object btnOk: TBitBtn
      Left = 190
      Top = 6
      Width = 74
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = btnOkClick
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000320B0000320B00000001000000000000000000003300
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
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE0909
        EEEEEEEEEEEEEEEEEEEEEEEEEEEE8181EEEEEEEEEEEEEEEEEEEEEEEEEE091010
        09EEEEEEEEEEEEEEEEEEEEEEEE81ACAC81EEEEEEEEEEEEEEEEEEEEEE09101010
        1009EEEEEEEEEEEEEEEEEEEE81ACACACAC81EEEEEEEEEEEEEEEEEE0910101010
        101009EEEEEEEEEEEEEEEE81ACACACACACAC81EEEEEEEEEEEEEEEE0910100909
        10101009EEEEEEEEEEEEEE81ACAC8181ACACAC81EEEEEEEEEEEEEE091009EEEE
        0910101009EEEEEEEEEEEE81AC81EEEE81ACACAC81EEEEEEEEEEEE0909EEEEEE
        EE0910101009EEEEEEEEEE8181EEEEEEEE81ACACAC81EEEEEEEEEEEEEEEEEEEE
        EEEE0910101009EEEEEEEEEEEEEEEEEEEEEE81ACACAC81EEEEEEEEEEEEEEEEEE
        EEEEEE0910101009EEEEEEEEEEEEEEEEEEEEEE81ACACAC81EEEEEEEEEEEEEEEE
        EEEEEEEE09101009EEEEEEEEEEEEEEEEEEEEEEEE81ACAC81EEEEEEEEEEEEEEEE
        EEEEEEEEEE091009EEEEEEEEEEEEEEEEEEEEEEEEEE81AC81EEEEEEEEEEEEEEEE
        EEEEEEEEEEEE0909EEEEEEEEEEEEEEEEEEEEEEEEEEEE8181EEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE}
      NumGlyphs = 2
    end
  end
end
