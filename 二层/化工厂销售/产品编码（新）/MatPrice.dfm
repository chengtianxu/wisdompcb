object frmMatPrice: TfrmMatPrice
  Left = 384
  Top = 155
  Width = 888
  Height = 560
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #25253#20215#26448#26009#28165#21333
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 880
    Height = 533
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 878
      Height = 240
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 878
        Height = 36
        Align = alTop
        TabOrder = 0
        object Label1: TLabel
          Left = 255
          Top = 12
          Width = 72
          Height = 12
          Caption = #25253#20215#20998#31867#21517#31216
        end
        object Label4: TLabel
          Left = 576
          Top = 11
          Width = 6
          Height = 12
        end
        object Label3: TLabel
          Left = 512
          Top = 12
          Width = 60
          Height = 12
          Caption = #20135#21697#32534#30721#65306
        end
        object btnClose: TBitBtn
          Left = 3
          Top = 3
          Width = 55
          Height = 30
          Hint = #36864#20986
          Caption = #20851#38381
          ParentShowHint = False
          ShowHint = False
          TabOrder = 0
          TabStop = False
          OnClick = btnCloseClick
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
            F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
            000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
            338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
            45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
            3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
            F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
            000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
            338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
            4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
            8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
            333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
            0000}
          NumGlyphs = 2
        end
        object btnRefresh: TBitBtn
          Left = 58
          Top = 3
          Width = 55
          Height = 30
          Caption = #21047#26032
          TabOrder = 1
          OnClick = btnRefreshClick
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
        object btnExport: TBitBtn
          Left = 113
          Top = 3
          Width = 64
          Height = 30
          Hint = #23548#20986#24403#21069'BOM'
          Caption = #23548#20986
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = btnExportClick
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            04000000000080000000120B0000120B00001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DADADADADADA
            DADAADADADADADADADADDADADADADAD00000000000000006666007777777706E
            EF0AA0E6666606EEF0ADDA0E66606EEF060AADA0E606EEF0000DDADA006EEF0A
            DADAADAD06EEF00DADADDAD06EEF0670DADAAD06EEF0E6670DADD06EEF0A0E66
            70DA0FFFF0ADA0EEEE0D00000ADADA00000AADADADADADADADAD}
        end
        object btnExportDtl: TBitBtn
          Left = 178
          Top = 3
          Width = 64
          Height = 30
          Hint = #23548#20986#24403#21069#25152#26377#24050#23457#26680'BOM'
          Caption = #23548#20986
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = btnExportDtlClick
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            08000000000000010000C40E0000C40E00000001000000000000000000003300
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
            EE0909EEEEEEEEEEEEEEEEEEEEEEEEEE09101009EEEEEEEEEEEEEEEEEEEEEE09
            1010101009EEEEEEEEEEEEEEEEEE0910101010101009EEEEEEEEEEEEEE091010
            10090910101009EEEEEEEEEE0910101009EEEE0910101009EEEEEEEE09101009
            EEEEEEEE09101009EEEEEEEE091009EEEE0909EEEE091009EEEEEEEE0909EEEE
            09101009EEEE0909EEEEEEEEEEEEEE091010101009EEEEEEEEEEEEEEEEEE0910
            101010101009EEEEEEEEEEEEEE09101010090910101009EEEEEEEEEE09101010
            09EEEE0910101009EEEEEEEE09101009EEEEEEEE09101009EEEEEEEE091009EE
            EEEEEEEEEE091009EEEEEEEE0909EEEEEEEEEEEEEEEE0909EEEE}
        end
        object Edit1: TEdit
          Left = 331
          Top = 7
          Width = 121
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          ParentFont = False
          TabOrder = 4
          OnChange = Edit1Change
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 36
        Width = 878
        Height = 204
        Align = alClient
        TabOrder = 1
        object DBGridEh1: TDBGridEh
          Left = 1
          Top = 1
          Width = 876
          Height = 202
          Align = alClient
          DataSource = DM.dsCP140
          FooterColor = clWindow
          FooterFont.Charset = ANSI_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -12
          FooterFont.Name = #23435#20307
          FooterFont.Style = []
          PopupMenu = PopupMenu1
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          OnTitleClick = DBGridEh1TitleClick
          Columns = <
            item
              EditButtons = <>
              FieldName = 'part_name'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #25253#20215#20998#31867#21517#31216
            end
            item
              EditButtons = <>
              FieldName = 'amount'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #25253#20215#37329#39069
            end
            item
              EditButtons = <>
              FieldName = 'status_c'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #29366#24577
            end
            item
              EditButtons = <>
              FieldName = 'auth_date'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #23457#26680#26085#26399
            end
            item
              EditButtons = <>
              FieldName = 'EMPL_CODE'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #23457#26680#20154#20195#30721
            end
            item
              EditButtons = <>
              FieldName = 'EMPLOYEE_NAME'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #23457#26680#20154#21517#31216
            end>
        end
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 241
      Width = 878
      Height = 291
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 878
        Height = 28
        Align = alTop
        TabOrder = 0
        object Label2: TLabel
          Left = 50
          Top = 7
          Width = 48
          Height = 12
          Caption = #26448#26009#20195#30721
        end
        object Edit2: TEdit
          Left = 109
          Top = 4
          Width = 121
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          ParentFont = False
          TabOrder = 0
          OnChange = Edit1Change
        end
      end
      object Panel7: TPanel
        Left = 0
        Top = 28
        Width = 878
        Height = 263
        Align = alClient
        TabOrder = 1
        object DBGridEh2: TDBGridEh
          Left = 1
          Top = 1
          Width = 876
          Height = 261
          Align = alClient
          DataSource = DM.dsCP148
          FooterColor = clWindow
          FooterFont.Charset = ANSI_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -12
          FooterFont.Name = #23435#20307
          FooterFont.Style = []
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          OnTitleClick = DBGridEh2TitleClick
          Columns = <
            item
              EditButtons = <>
              FieldName = 'INV_PART_NUMBER'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #26448#26009#20195#30721
              Width = 120
            end
            item
              EditButtons = <>
              FieldName = 'INV_NAME'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #26448#26009#21517#31216
              Width = 150
            end
            item
              EditButtons = <>
              FieldName = 'INV_DESCRIPTION'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #26448#26009#35215#26684
              Width = 220
            end
            item
              EditButtons = <>
              FieldName = 'QUAN_ON_HAND'
              Footers = <>
              Title.Caption = #24211#23384#25968#37327
              Width = 67
            end
            item
              EditButtons = <>
              FieldName = 'QUAN_BOM'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #37197#39069#29992#37327
              Width = 64
            end
            item
              EditButtons = <>
              FieldName = 'UNIT_NAME'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #21333#20301
              Width = 30
            end
            item
              EditButtons = <>
              FieldName = 'STD_COST'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #26631#20934#21333#20215
            end
            item
              EditButtons = <>
              FieldName = 'COST'
              Footers = <>
              Title.Caption = #37197#39069#25104#26412
            end
            item
              EditButtons = <>
              FieldName = 'VENDOR'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #22791#27880
              Width = 87
            end>
        end
      end
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 120
    Top = 112
    object N1: TMenuItem
      Caption = #26032#22686
      OnClick = N1Click
    end
    object N2: TMenuItem
      Tag = 1
      Caption = #20462#25913
      OnClick = N1Click
    end
    object N3: TMenuItem
      Tag = 2
      Caption = #21024#38500
      OnClick = N1Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N5: TMenuItem
      Tag = 3
      Caption = #23457#26680
      OnClick = N1Click
    end
    object N6: TMenuItem
      Tag = 4
      Caption = #21462#28040#23457#26680
      OnClick = N1Click
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object N8: TMenuItem
      Tag = 5
      Caption = #20316#24223
      OnClick = N1Click
    end
  end
end
