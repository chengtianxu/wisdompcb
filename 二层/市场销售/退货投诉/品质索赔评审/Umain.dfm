object Form2: TForm2
  Left = 256
  Top = 238
  Width = 876
  Height = 640
  Caption = #21697#36136#32034#36180#30003#35831
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 230
    Width = 860
    Height = 2
    Cursor = crVSplit
    Align = alTop
    Color = clAqua
    ParentColor = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 860
    Height = 38
    Align = alTop
    TabOrder = 0
    object btn2: TBitBtn
      Left = 5
      Top = 7
      Width = 72
      Height = 28
      Hint = #21047#26032
      Caption = #36864#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TabStop = False
      OnClick = btn2Click
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
    object btn1: TBitBtn
      Left = 79
      Top = 6
      Width = 72
      Height = 29
      Hint = #36864#20986
      Caption = #21047#26032
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TabStop = False
      OnClick = BitBtn1Click
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
    object RadioGroup1: TRadioGroup
      Left = 688
      Top = 1
      Width = 171
      Height = 36
      Align = alRight
      Columns = 2
      Items.Strings = (
        #24403#21069#23457#25209
        #20840#37096#23457#25209)
      TabOrder = 2
      OnClick = RadioGroup1Click
    end
    object BitBtn8: TBitBtn
      Left = 154
      Top = 5
      Width = 85
      Height = 30
      Caption = #24494#20449#20851#27880
      TabOrder = 3
      OnClick = BitBtn8Click
      Glyph.Data = {
        36050000424D3605000000000000360000002800000014000000100000000100
        20000000000000050000000000000000000000000000000000004BB869FF4BB8
        69FF4BB869FF4BB869FF4BB869FF4BB869FF4BB869FF4BB869FF4BB869FF4AB8
        68FF4AB768FF4AB868FF4DB86AFF4EB86BFF4EB96BFF4CB869FF4FB86BFF7AC7
        8FFF4AB767FF4AB768FF4BB869FF4BB869FF4AB868FF4BB768FF4BB869FF4BB8
        69FF4BB869FF4BB869FF4AB768FF4AB868FF60BE79FFA6DAB4FFD5ECDCFFEBF5
        EEFFE7F4EAFFCAE9D2FFDEF1E3FFB0DEBDFF49B767FF4AB768FF4BB869FF4BB8
        69FF4AB667FF4AB767FF4BB869FF4BB869FF4BB869FF4BB869FF4AB768FF88CE
        9BFFF0F8F2FFFDFEFDFFFDFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFDFDFEFFDDF0
        E3FF64C07EFF4AB767FF4BB869FF4BB869FF68C180FF56BA71FF4AB768FF4AB7
        68FF4BB769FF4BB868FF75C68CFFF7FAF8FFFEFEFEFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFDFFE0F2E6FF58BB74FF4BB869FF4AB8
        68FF8BCF9EFFDEF0E3FF9BD6ACFF9ED7AFFFB8E1C3FF9AD6ABFFCCE9D5FFFDFD
        FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
        FFFFFDFEFEFFA7DBB6FF4AB767FF4AB768FF7EC992FFFBFDFCFFFEFEFEFFFEFE
        FEFFFDFEFDFFB5DFC1FFF2F9F5FFFEFEFEFFFFFFFFFFFEFEFEFFFEFEFEFFFFFF
        FFFFFFFFFFFFFEFEFEFFFEFEFEFFFFFFFFFFFEFEFFFFD6EDDDFF4AB767FF82CB
        95FFF0F8F2FFFDFEFDFFFFFFFFFFFFFFFFFFFEFEFEFFBFE3C9FFEAF6EEFFFEFE
        FEFFFFFFFFFFE0E0E0FFD6D6D6FFFEFEFEFFFEFEFEFFD5D5D5FFE0E0E0FFFEFE
        FEFFFEFEFEFFCFEAD6FF63BF7CFFEEF7F0FFFEFEFEFFFFFFFFFFFFFFFFFFFFFF
        FFFFFEFEFEFFE9F5EDFFB9E1C4FFFCFEFDFFFEFEFFFFA6A6A6FF8B8B8BFFFDFD
        FDFFFEFEFEFF8D8D8DFFA5A5A5FFFDFDFDFFFDFEFDFF93D2A4FFADDCBAFFFEFE
        FEFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFEFEFEFFB3DEC0FFDEF0
        E3FFFCFDFDFFF7F7F8FFF6F6F6FFFEFEFEFFFEFEFEFFF6F6F6FFF9F9F9FFFCFD
        FDFFC5E7CFFF50B86DFFD3ECDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFF6FAF8FFAFDCBCFFC5E5CFFFF5FAF7FFFDFEFEFFFDFE
        FEFFFDFEFDFFFDFDFDFFEFF8F1FFACDDB9FF55BB71FF4AB768FFD1EBD8FFFEFE
        FEFFFEFFFEFFFEFEFEFFFAFAFAFFFCFCFCFFFFFFFFFFFFFFFFFFFCFDFEFFF3F6
        F5FFD2EBDAFFB0DDBCFFBBE2C6FFC9E8D2FFAFDEBCFF8FD2A2FF65C17DFF4CB7
        68FF4AB768FF4BB869FFA5DAB3FFFDFDFDFFFEFEFEFFF2F2F2FF717171FF9D9D
        9DFFFFFFFFFFFFFFFFFFE3E3E3FF6B6B6BFFB1B1B1FFFCFDFCFFF2F9F4FFDDF0
        E3FF50B86CFF4BB768FF4AB868FF4BB768FF4BB869FF4BB869FF5CBC77FFEBF6
        EFFFFDFDFDFFF7F7F7FF929292FFB6B6B6FFFFFFFFFFFFFFFFFFEDEDEDFF8B8B
        8BFFC6C6C6FFFDFDFDFFFCFDFDFF96D4A8FF4AB768FF4BB869FF4BB869FF4BB8
        69FF4BB869FF4BB869FF4AB767FF78C78DFFEEF7F1FFFDFDFEFFFCFCFCFFFCFD
        FCFFFEFEFEFFFFFFFFFFFDFEFEFFFCFCFBFFFCFDFDFFFBFDFBFFACDCBAFF4DB7
        6AFF4AB767FF4BB869FF4BB869FF4BB869FF4BB869FF4BB869FF4AB868FF4BB7
        69FF65C07DFFC1E4CAFFF8FBF9FFFDFDFDFFFEFEFEFFFFFFFFFFFDFDFDFFFBFD
        FCFFD9EFE0FF82CC97FF4CB769FF4BB768FF4BB768FF4BB869FF4BB869FF4BB8
        69FF4BB869FF4BB869FF4BB869FF4BB869FF4AB767FF4BB869FF5DBD78FF86CE
        9AFF9FD7AEFFA3D9B1FF91D2A3FF6BC383FF4EB86BFF4AB768FF4AB768FF4BB8
        69FF4BB869FF4BB869FF4BB869FF4BB869FF4BB869FF4BB869FF}
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 38
    Width = 860
    Height = 192
    Align = alTop
    Caption = 'Panel3'
    TabOrder = 1
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 858
      Height = 190
      Align = alTop
      DataSource = DM.DataSource1
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = PopupMenu1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyDown = DBGridEh1KeyDown
      Columns = <
        item
          EditButtons = <>
          FieldName = 'spNumber'
          Footers = <>
          Title.Caption = #32534#21495
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'USER_FULL_NAME'
          Footers = <>
          Title.Caption = #21019#24314#20154#21592
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'EntryTime'
          Footers = <>
          Title.Caption = #21019#24314#26102#38388
          Width = 88
        end
        item
          EditButtons = <>
          FieldName = 'ABBR_NAME'
          Footers = <>
          Title.Caption = #23458#25143
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'CURR_NAME'
          Footers = <>
          Title.Caption = #24065#31181
          Width = 40
        end
        item
          EditButtons = <>
          FieldName = 'Number'
          Footers = <>
          Title.Caption = #25968#37327
          Width = 44
        end
        item
          EditButtons = <>
          FieldName = 'spmoney'
          Footers = <>
          Title.Caption = #37329#39069
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'debita'
          Footers = <>
          Title.Caption = #36130#21153#25187#27454
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'ABBR_NAME_1'
          Footers = <>
          Title.Caption = #24037#21378
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'yw05'
          Footers = <>
          Title.Caption = #20027#31649#19994#21153#21592
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'Remarks'
          Footers = <>
          Title.Caption = #23458#35785#22791#27880
          Width = 91
        end
        item
          EditButtons = <>
          FieldName = 'submit_date'
          Footers = <>
          Title.Caption = #25552#20132#26102#38388
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'ywexplain'
          Footers = <>
          Title.Caption = #22791#27880
          Width = 88
        end
        item
          EditButtons = <>
          FieldName = 'v_status'
          Footers = <>
          Title.Caption = #23457#25209#29366#24577
          Width = 55
        end>
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 472
    Width = 860
    Height = 130
    Align = alBottom
    Caption = 'Panel5'
    TabOrder = 2
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 858
      Height = 128
      Align = alClient
      Caption = 'Panel4'
      TabOrder = 0
      object DBGridEh3: TDBGridEh
        Left = 1
        Top = 1
        Width = 433
        Height = 126
        Align = alClient
        DataSource = DM.DataSource2
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            EditButtons = <>
            FieldName = 'seq_no'
            Footers = <>
            Title.Caption = #39034#24207
            Width = 70
          end
          item
            EditButtons = <>
            FieldName = 'USER_FULL_NAME'
            Footers = <>
            Title.Caption = #23457#25209#20154
            Width = 79
          end
          item
            EditButtons = <>
            FieldName = 'auth_date'
            Footers = <>
            Title.Caption = #26102#38388
            Width = 104
          end
          item
            EditButtons = <>
            FieldName = 'PUTH_INFO'
            Footers = <>
            Title.Caption = #22791#27880
            Width = 84
          end
          item
            EditButtons = <>
            FieldName = 'status1'
            Footers = <>
            Title.Caption = #23457#26680#29366#24577
            Width = 70
          end>
      end
      object Panel2: TPanel
        Left = 434
        Top = 1
        Width = 423
        Height = 126
        Align = alRight
        Caption = 'Panel2'
        TabOrder = 1
        object DBGridEh2: TDBGridEh
          Left = 1
          Top = 1
          Width = 421
          Height = 124
          Align = alClient
          DataSource = DM.DataSource3
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          PopupMenu = PopupMenu2
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              EditButtons = <>
              FieldName = 'rec_no'
              Footers = <>
              Title.Caption = #24207#21495
              Width = 70
            end
            item
              EditButtons = <>
              FieldName = 'FileName'
              Footers = <>
              Title.Caption = #25991#20214#21517
              Width = 70
            end
            item
              EditButtons = <>
              FieldName = 'UploadTime'
              Footers = <>
              Title.Caption = #19978#20256#26102#38388
              Width = 70
            end
            item
              EditButtons = <>
              FieldName = 'EMPLOYEE_NAME'
              Footers = <>
              Title.Caption = #19978#20256#20154#21592'E'
              Width = 70
            end>
        end
      end
    end
  end
  object DBGridEh4: TDBGridEh
    Left = 0
    Top = 232
    Width = 860
    Height = 240
    Align = alClient
    DataSource = DM.DS609
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'condate'
        Footers = <>
        Title.Caption = #30830#35748#26085#26399
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'remark'
        Footers = <>
        Title.Caption = #21046#36896#21378#21035
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_NUMBER'
        Footers = <>
        Title.Caption = #26412#21378#32534#21495
        Width = 104
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_DESC'
        Footers = <>
        Title.Caption = #23458#25143#26009#21495
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'rec_no'
        Footers = <>
        Title.Caption = #21378#20869#21608#26399
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'xingtai'
        Footers = <>
        Title.Caption = #20135#21697#24418#24577
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'explain'
        Footers = <>
        Title.Caption = #25253#24223#35828#26126
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'company'
        Footers = <>
        Title.Caption = #21333#20301
        Width = 44
      end
      item
        EditButtons = <>
        FieldName = 'Number'
        Footers = <>
        Title.Caption = #25968#37327
        Width = 50
      end
      item
        EditButtons = <>
        FieldName = 'spUnitPrice'
        Footers = <>
        Title.Caption = #39044#20272#21333#20215
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'spliable'
        Footers = <>
        Title.Caption = #23458#26381#25285#24403
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'spmonth'
        Footers = <>
        Title.Caption = #32034#36180'PCBA'#29983#20135#26376#20221
        Width = 131
      end>
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 264
    Top = 140
    object N1: TMenuItem
      Caption = #35780#23457
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #36864#22238
      OnClick = N2Click
    end
    object N4: TMenuItem
      Caption = #21462#28040#35780#23457
      OnClick = N4Click
    end
  end
  object PopupMenu2: TPopupMenu
    OnPopup = PopupMenu2Popup
    Left = 628
    Top = 441
    object N3: TMenuItem
      Caption = #25171#24320#38468#20214
      OnClick = N3Click
    end
  end
  object IdFTP1: TIdFTP
    MaxLineAction = maException
    ReadTimeout = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 752
    Top = 437
  end
  object OpenDialog1: TOpenDialog
    Left = 936
    Top = 400
  end
end
