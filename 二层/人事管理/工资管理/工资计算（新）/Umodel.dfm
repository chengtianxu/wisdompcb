object FrmModel: TFrmModel
  Left = 457
  Top = 59
  Width = 789
  Height = 743
  Caption = #27169#29256
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 773
    Height = 705
    Align = alClient
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 771
      Height = 703
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = #36873#25321#27169#29256
        object BitBtn6: TBitBtn
          Left = 1
          Top = 0
          Width = 111
          Height = 25
          Caption = #27169#26495#32452#36873#23450
          ModalResult = 1
          TabOrder = 0
          Glyph.Data = {
            66010000424D6601000000000000760000002800000014000000140000000100
            040000000000F000000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            7777777700007777777777777777777700007777700777777777777700007777
            0990777777777777000077709999077777777777000077799999907777777777
            00007709999999077777777700007799999999907777777700007799997B9999
            07777777000077999977B99990777777000077B999777B99990777770000777B
            997777B99990777700007777BB77777B999907770000777777777777B9999077
            00007777777777777B999977000077777777777777B999770000777777777777
            777B997700007777777777777777777700007777777777777777777700007777
            77777777777777770000}
        end
        object BitBtn7: TBitBtn
          Left = 112
          Top = 0
          Width = 75
          Height = 25
          Caption = #21047#26032
          TabOrder = 1
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
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 763
          Height = 361
          Align = alTop
          TabOrder = 2
          DesignSize = (
            763
            361)
          object rg_show5: TRadioGroup
            Left = 2
            Top = 38
            Width = 394
            Height = 111
            Anchors = [akTop]
            Caption = #26376#34218'5.5'#23637#31034
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              #40664#35748)
            TabOrder = 0
          end
          object rg_import5: TRadioGroup
            Left = 394
            Top = 40
            Width = 375
            Height = 110
            Anchors = [akTop]
            Caption = #26376#34218'5.5'#23548#20837
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              #40664#35748)
            TabOrder = 1
          end
          object rg_Show6: TRadioGroup
            Left = 0
            Top = 147
            Width = 395
            Height = 107
            Anchors = [akTop, akRight]
            Caption = #26376#34218'6'#23637#31034
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              #40664#35748)
            TabOrder = 2
          end
          object rg_Import6: TRadioGroup
            Left = 393
            Top = 148
            Width = 377
            Height = 106
            Anchors = [akTop, akRight]
            Caption = #26376#34218'6'#23548#20837
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              #40664#35748)
            TabOrder = 3
          end
          object btn_OK: TBitBtn
            Left = 9
            Top = 8
            Width = 71
            Height = 25
            Caption = #30830#23450
            ModalResult = 1
            TabOrder = 4
            OnClick = btn_OKClick
            Glyph.Data = {
              66010000424D6601000000000000760000002800000014000000140000000100
              040000000000F000000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7777777700007777777777777777777700007777700777777777777700007777
              0990777777777777000077709999077777777777000077799999907777777777
              00007709999999077777777700007799999999907777777700007799997B9999
              07777777000077999977B99990777777000077B999777B99990777770000777B
              997777B99990777700007777BB77777B999907770000777777777777B9999077
              00007777777777777B999977000077777777777777B999770000777777777777
              777B997700007777777777777777777700007777777777777777777700007777
              77777777777777770000}
          end
          object btn_refesh: TBitBtn
            Left = 91
            Top = 8
            Width = 65
            Height = 24
            Caption = #21047#26032
            TabOrder = 5
            OnClick = btn_refeshClick
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
          object rg5s: TRadioGroup
            Left = 1
            Top = 251
            Width = 395
            Height = 107
            Anchors = [akTop, akRight]
            Caption = #26376#34218'5'#23637#31034
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              #40664#35748)
            TabOrder = 6
          end
          object rg5i: TRadioGroup
            Left = 395
            Top = 251
            Width = 377
            Height = 106
            Anchors = [akTop, akRight]
            Caption = #26376#34218'5'#23548#20837
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              #40664#35748)
            TabOrder = 7
          end
        end
        object Panel6: TPanel
          Left = 0
          Top = 361
          Width = 763
          Height = 314
          Align = alClient
          TabOrder = 3
          object rg_DayShow: TRadioGroup
            Left = 1
            Top = 1
            Width = 280
            Height = 312
            Align = alLeft
            Caption = #26085#34218#23637#31034
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              #40664#35748)
            TabOrder = 0
          end
          object rg_DayImport: TRadioGroup
            Left = 281
            Top = 1
            Width = 481
            Height = 312
            Align = alClient
            Caption = #26085#34218#23548#20837
            Columns = 3
            ItemIndex = 0
            Items.Strings = (
              #40664#35748)
            TabOrder = 1
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = #28155#21152#27169#29256
        ImageIndex = 1
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 763
          Height = 675
          Align = alClient
          TabOrder = 0
          object Panel3: TPanel
            Left = 1
            Top = 482
            Width = 761
            Height = 192
            Align = alBottom
            TabOrder = 0
            DesignSize = (
              761
              192)
            object Label2: TLabel
              Left = 6
              Top = 43
              Width = 78
              Height = 13
              Anchors = [akLeft, akBottom]
              Caption = #26174#31034#39033#30446#21517#31216
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object Label_account: TLabel
              Left = 59
              Top = 11
              Width = 30
              Height = 13
              Anchors = [akLeft, akBottom]
              AutoSize = False
              Caption = #24080#22871
            end
            object Label1: TLabel
              Left = 397
              Top = 9
              Width = 64
              Height = 15
              Anchors = [akLeft, akBottom]
              Caption = #27169#29256#21517#31216
              Color = clMenu
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -15
              Font.Name = #23435#20307
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object btn_Save: TBitBtn
              Left = 241
              Top = 162
              Width = 70
              Height = 22
              Anchors = [akLeft, akBottom]
              Caption = #20445#23384
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnClick = btn_SaveClick
              Glyph.Data = {
                C6050000424DC605000000000000360400002800000014000000140000000100
                08000000000090010000C40E0000C40E0000000100000000000000000000E8E0
                18008868080048484800D8D8E000C8C8C8001078F00070500000B0900800F8F8
                F800A8880800D0D8D800B8A81000A0800800C8D0D000E8E8E80068686800B0A0
                100098700800A8900800D0D0D000D8D8D80090700800B0981000C0A81000E0E0
                E0009878080090680800A0880800D8E0D800B8A01000B0901000000000000000
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
                0000000000000000000000000000000000000000000000000000000100000000
                000000130000301A1600000000000000E400F712000035A6FC00770000001300
                0700A7FC7700080613000083A600FC7700000000000035A5FC0077FFFF000000
                6800010000000000000000000000000000000000000000000000000000000000
                31000000000000E2EC0000640000660000004716000078011300000047001600
                780001130000F8461600000000000000C000F7120000C8F3EB007770F5001200
                0000ECFD7F0002000000000000001300AF000000000001000A0000884000F877
                30001A1600000100000000998400E6775400F71200000101010001D8F8001200
                450090FB7700801FF80077FFFF00FFFF6000F8120000AD84E6007760F8001200
                D80084E677000000000000FFFF000000C800E2EC0000C8E2EC00001800000000
                00000000000044F8120000400000000000000000000028F81200000000000000
                00000000000000000000000C000000000200000000000101120000872B00F877
                0000ECFD7F00000000000002000000006C00001A0200381A1600007FFF00FFFF
                000000000000381A1600000500000000870031E6770084F8120000218600E677
                9800F81200006713000010FFFF000000680001000000C8E2EC00000000000000
                7000F8120000ACF8120000D8F8001200100030001000F8400000105F5400E677
                680001000000D0F8120000D8F80012000800000000000E0000000F0505BF05BF
                05BF05BF05BF05BF05BF05BF05C7BF0000000000000000000000000000000000
                00050500E1138CE0E0E0E0E0E0E0E0E0E006BD1B00BFBF00031305050505BF05
                050505050505181B00050500C60705050F050FC70F050FC70FBF011B00BFBF00
                011B05A7C7090383BF0503030305011300050500010705091003050503031003
                0305011B00BFBF00011BBF031005BF03101010101005181300050500010705C7
                0FC709C70FC70FC70F05011300BFBF00011B03171017101710171017101B1B18
                00050500011318131813181B181318131813181300BFBF0001181BC601C618C6
                01C601C60101181800050500E11713000003C210050505050510C61800BFBF00
                01181B000010C705C705BF0FC71718C600050500E113180000100F0505000005
                A717C61800BFBF0001C61B000010C70505000005C71718C600050500E1171300
                00100F05050000050F10C60100BFBF00BD0101000010090F0510100FC7170101
                00E90500000000000300000000000000000000000005C705BF05BF0509E9BF05
                BF05BF05BF05BF05BF09}
            end
            object btn_ReSet: TBitBtn
              Left = 409
              Top = 162
              Width = 70
              Height = 22
              Anchors = [akLeft, akBottom]
              Caption = #37325#22635
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnClick = btn_ReSetClick
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
            object btn_Del: TBitBtn
              Left = 90
              Top = 66
              Width = 70
              Height = 22
              Anchors = [akLeft, akBottom]
              Caption = '-'
              Font.Charset = GB2312_CHARSET
              Font.Color = clWindowText
              Font.Height = -21
              Font.Name = #38582#20070
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
              OnClick = btn_DelClick
            end
            object btn_Add: TBitBtn
              Left = 20
              Top = 66
              Width = 70
              Height = 22
              Anchors = [akLeft, akBottom]
              Caption = '+'
              Font.Charset = GB2312_CHARSET
              Font.Color = clWindowText
              Font.Height = -21
              Font.Name = #38582#20070
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 3
              OnClick = btn_AddClick
            end
            object dbg_fields: TDBGrid
              Left = 13
              Top = 88
              Width = 723
              Height = 65
              Anchors = [akLeft, akRight, akBottom]
              TabOrder = 4
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
            end
            object edt_FName: TEdit
              Left = 89
              Top = 38
              Width = 137
              Height = 21
              Anchors = [akLeft, akBottom]
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
              TabOrder = 5
            end
            object btn_SelField: TBitBtn
              Left = 227
              Top = 37
              Width = 29
              Height = 23
              Anchors = [akLeft, akBottom]
              TabOrder = 6
              OnClick = btn_SelFieldClick
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
            object cbb_account: TComboBox
              Left = 91
              Top = 7
              Width = 142
              Height = 21
              Style = csDropDownList
              Anchors = [akLeft, akBottom]
              ItemHeight = 0
              TabOrder = 7
              OnSelect = cbb_accountSelect
            end
            object rg_type: TRadioGroup
              Left = 236
              Top = 0
              Width = 153
              Height = 33
              Anchors = [akLeft, akBottom]
              Columns = 2
              ItemIndex = 0
              Items.Strings = (
                #23637#31034
                #23548#20837)
              TabOrder = 8
            end
            object edt_MName: TEdit
              Left = 466
              Top = 5
              Width = 172
              Height = 21
              Anchors = [akLeft, akBottom]
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
              TabOrder = 9
            end
          end
          object Panel4: TPanel
            Left = 1
            Top = 1
            Width = 761
            Height = 481
            Align = alClient
            TabOrder = 1
            object dbg_model: TDBGrid
              Left = 1
              Top = 1
              Width = 759
              Height = 479
              Align = alClient
              DataSource = DataSource1
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'model_name'
                  Title.Caption = #27169#26495#21517#31216
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'accountname'
                  Title.Caption = #24080#22871
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'rpt_type'
                  Title.Caption = #27169#26495#31867#22411
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'datafield_name'
                  Title.Caption = #23383#27573#25490#21015
                  Width = 1000
                  Visible = True
                end>
            end
          end
        end
      end
    end
  end
  object pm_fields: TPopupMenu
    AutoHotkeys = maManual
    AutoLineReduction = maManual
    Left = 609
    Top = 4
  end
  object DataSource1: TDataSource
    DataSet = qry_model
    Left = 497
    Top = 1
  end
  object qry_model: TADOQuery
    Connection = DM.con1
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      
        'select distinct model_name ,b.accountname, case when [type]=1 th' +
        'en '#39#23548#20837#39'else  '#39#23637#31034#39'end  as [rpt_type], '
      'datafield_name=convert(varchar(500),'
      
        'STUFF((SELECT '#39','#39' + datafield_name from  employeesalary_rpt_mode' +
        'l'
      'where model_name=a.model_name'
      'FOR XML PATH('#39#39')), 1, 1, '#39#39')) '
      'from employeesalary_rpt_model  a '
      'join salaryaccount b on a.accountid=b.rkey')
    Left = 553
    Top = 1
  end
  object pm_del: TPopupMenu
    AutoHotkeys = maManual
    AutoLineReduction = maManual
    Left = 665
    Top = 12
    object N_Del: TMenuItem
      Caption = #21024#38500
      OnClick = N_DelClick
    end
  end
  object ApplicationEvents1: TApplicationEvents
    OnMessage = ApplicationEvents1Message
    Left = 424
    Top = 16
  end
end
