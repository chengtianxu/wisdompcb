object Frm_Edit: TFrm_Edit
  Left = 250
  Top = 197
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Frm_Edit'
  ClientHeight = 521
  ClientWidth = 734
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 28
    Top = 60
    Width = 52
    Height = 13
    Caption = #24037#31243#32534#30721
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 28
    Top = 86
    Width = 52
    Height = 13
    Caption = #20135#21697#21517#31216
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 28
    Top = 112
    Width = 52
    Height = 13
    Caption = #20135#21697#35268#26684
  end
  object Label4: TLabel
    Left = 546
    Top = 60
    Width = 39
    Height = 13
    Caption = #24635#24211#23384
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 533
    Top = 82
    Width = 52
    Height = 13
    Caption = #26368#23567#24211#23384
    FocusControl = DBEdit5
  end
  object Label6: TLabel
    Left = 533
    Top = 104
    Width = 52
    Height = 13
    Caption = #26368#22823#24211#23384
    FocusControl = DBEdit6
  end
  object Label8: TLabel
    Left = 28
    Top = 171
    Width = 52
    Height = 13
    Caption = #20135#21697#32452#21035
  end
  object Label9: TLabel
    Left = 28
    Top = 223
    Width = 52
    Height = 13
    Caption = #23384#36135#21333#20301
  end
  object Label10: TLabel
    Left = 28
    Top = 197
    Width = 52
    Height = 13
    Caption = #21046#36896#37096#38376
  end
  object Label11: TLabel
    Left = 538
    Top = 167
    Width = 52
    Height = 13
    Caption = #26368#26032#20215#26684
    FocusControl = DBEdit7
  end
  object SpeedButton3: TSpeedButton
    Left = 175
    Top = 167
    Width = 23
    Height = 22
    Glyph.Data = {
      EE000000424DEE000000000000007600000028000000100000000F0000000100
      04000000000078000000130B0000130B00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      888800000888880000080F000888880F00080F000888880F0008000000080000
      000800F000000F00000800F000800F00000800F000800F000008800000000000
      0088880F00080F000888880000080000088888800088800088888880F08880F0
      888888800088800088888888888888888888}
    OnClick = SpeedButton3Click
  end
  object Label12: TLabel
    Left = 200
    Top = 141
    Width = 6
    Height = 12
    Font.Charset = ANSI_CHARSET
    Font.Color = clTeal
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton4: TSpeedButton
    Tag = 1
    Left = 175
    Top = 219
    Width = 23
    Height = 22
    Glyph.Data = {
      EE000000424DEE000000000000007600000028000000100000000F0000000100
      04000000000078000000130B0000130B00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      888800000888880000080F000888880F00080F000888880F0008000000080000
      000800F000000F00000800F000800F00000800F000800F000008800000000000
      0088880F00080F000888880000080000088888800088800088888880F08880F0
      888888800088800088888888888888888888}
    OnClick = SpeedButton3Click
  end
  object Label13: TLabel
    Left = 200
    Top = 190
    Width = 6
    Height = 12
    Font.Charset = ANSI_CHARSET
    Font.Color = clTeal
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton5: TSpeedButton
    Tag = 2
    Left = 175
    Top = 193
    Width = 23
    Height = 22
    Glyph.Data = {
      EE000000424DEE000000000000007600000028000000100000000F0000000100
      04000000000078000000130B0000130B00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      888800000888880000080F000888880F00080F000888880F0008000000080000
      000800F000000F00000800F000800F00000800F000800F000008800000000000
      0088880F00080F000888880000080000088888800088800088888880F08880F0
      888888800088800088888888888888888888}
    OnClick = SpeedButton3Click
  end
  object Label14: TLabel
    Left = 200
    Top = 168
    Width = 6
    Height = 12
    Font.Charset = ANSI_CHARSET
    Font.Color = clTeal
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 54
    Top = 270
    Width = 26
    Height = 13
    Caption = #22791#27880
  end
  object Label15: TLabel
    Left = 564
    Top = 190
    Width = 26
    Height = 13
    Caption = #24037#26102
    FocusControl = DBEdit3
  end
  object Label16: TLabel
    Left = 28
    Top = 248
    Width = 52
    Height = 13
    Caption = #23384#25918#20301#32622
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 734
    Height = 37
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 12
    object SpeedButton1: TSpeedButton
      Left = 3
      Top = 2
      Width = 50
      Height = 33
      Hint = #20445#23384
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
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 53
      Top = 2
      Width = 50
      Height = 33
      Hint = #20851#38381
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
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton2Click
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 343
    Width = 734
    Height = 178
    ActivePage = TabSheet2
    Align = alBottom
    TabOrder = 13
    object TabSheet1: TTabSheet
      Caption = #24403#21069#24211#23384
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 0
        Width = 717
        Height = 150
        Align = alClient
        DataSource = DM.DS2
        FooterColor = clWindow
        FooterFont.Charset = ANSI_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -13
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnKeyDown = DBGridEh1KeyDown
        Columns = <
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'CODE'
            Footers = <>
            Width = 62
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'LOCATION'
            Footers = <>
            Width = 112
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'qty_on_hand'
            Footers = <>
            ReadOnly = True
            Width = 112
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = #22270#32440#26723#26696
      ImageIndex = 1
      object DBGridEh2: TDBGridEh
        Left = 0
        Top = 0
        Width = 726
        Height = 150
        Align = alClient
        DataSource = DataSource1
        FooterColor = clWindow
        FooterFont.Charset = ANSI_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -13
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
        PopupMenu = PopupMenu1
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnKeyDown = DBGridEh2KeyDown
        Columns = <
          item
            EditButtons = <>
            FieldName = 'ProdFileName'
            Footers = <>
            Width = 193
          end
          item
            EditButtons = <>
            FieldName = 'uploaddate'
            Footers = <>
            Width = 151
          end
          item
            EditButtons = <>
            FieldName = 'user_full_name'
            Footers = <>
            Width = 51
          end
          item
            EditButtons = <>
            FieldName = 'user_login_name'
            Footers = <>
            Width = 53
          end
          item
            EditButtons = <>
            FieldName = 'remark'
            Footers = <>
            Width = 228
          end>
      end
      object pnl1: TPanel
        Left = 68
        Top = -7
        Width = 273
        Height = 157
        TabOrder = 1
        Visible = False
        object lbl2: TLabel
          Left = 24
          Top = 24
          Width = 52
          Height = 13
          Caption = #26381#21153#22120#65306
        end
        object lbl3: TLabel
          Left = 24
          Top = 52
          Width = 52
          Height = 13
          Caption = #29992#25143#21517#65306
        end
        object lbl4: TLabel
          Left = 27
          Top = 80
          Width = 39
          Height = 13
          Caption = #23494#30721#65306
        end
        object lbl5: TLabel
          Left = 24
          Top = 104
          Width = 52
          Height = 13
          Caption = #25991#20214#22841#65306
        end
        object btn3: TButton
          Left = 112
          Top = 124
          Width = 75
          Height = 25
          Caption = #30830#23450
          TabOrder = 0
          OnClick = btn3Click
        end
        object edtftpip: TEdit
          Left = 80
          Top = 19
          Width = 185
          Height = 21
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          TabOrder = 1
          Text = '172.18.12.2'
        end
        object edtftpusername: TEdit
          Left = 80
          Top = 45
          Width = 185
          Height = 21
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          TabOrder = 2
          Text = 'erpupload'
        end
        object edtftppassword: TEdit
          Left = 79
          Top = 73
          Width = 185
          Height = 21
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          PasswordChar = '*'
          TabOrder = 3
          Text = '7rXNkqmo'
        end
        object edtftpdir: TEdit
          Left = 79
          Top = 97
          Width = 185
          Height = 21
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          TabOrder = 4
        end
      end
      object Pnl2: TPanel
        Left = 480
        Top = 40
        Width = 185
        Height = 65
        TabOrder = 2
        Visible = False
        object Label17: TLabel
          Left = 8
          Top = 10
          Width = 39
          Height = 13
          Caption = #22791#27880#65306
        end
        object Edit1: TEdit
          Left = 56
          Top = 8
          Width = 121
          Height = 21
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          TabOrder = 0
        end
        object Button1: TButton
          Left = 48
          Top = 38
          Width = 75
          Height = 25
          Caption = #30830#35748
          TabOrder = 1
          OnClick = Button1Click
        end
      end
    end
  end
  object DBEdit1: TDBEdit
    Left = 88
    Top = 56
    Width = 195
    Height = 21
    DataField = 'PROD_CODE'
    DataSource = DM.DS3
    TabOrder = 0
    OnExit = DBEdit1Exit
  end
  object DBEdit2: TDBEdit
    Left = 88
    Top = 82
    Width = 195
    Height = 21
    DataField = 'PRODUCT_NAME'
    DataSource = DM.DS3
    TabOrder = 1
  end
  object DBEdit4: TDBEdit
    Left = 591
    Top = 54
    Width = 89
    Height = 21
    Color = clScrollBar
    DataField = 'qty_onhand'
    DataSource = DM.DS3
    ReadOnly = True
    TabOrder = 7
  end
  object DBEdit5: TDBEdit
    Left = 591
    Top = 78
    Width = 89
    Height = 21
    DataField = 'min_qty'
    DataSource = DM.DS3
    TabOrder = 8
    OnEnter = DBEdit5Enter
    OnExit = DBEdit5Exit
    OnKeyPress = DBEdit5KeyPress
  end
  object DBEdit6: TDBEdit
    Left = 591
    Top = 101
    Width = 89
    Height = 21
    DataField = 'max_qty'
    DataSource = DM.DS3
    TabOrder = 9
    OnEnter = DBEdit5Enter
    OnExit = DBEdit5Exit
    OnKeyPress = DBEdit5KeyPress
  end
  object DBRadioGroup1: TDBRadioGroup
    Left = 536
    Top = 127
    Width = 144
    Height = 32
    Caption = #31867#21035
    Columns = 2
    DataField = 'TTYPE'
    DataSource = DM.DS3
    Items.Strings = (
      #21322#25104#21697
      #25104#21697)
    TabOrder = 10
    Values.Strings = (
      '0'
      '1')
  end
  object DBEdit7: TDBEdit
    Left = 591
    Top = 163
    Width = 89
    Height = 21
    DataField = 'new_price'
    DataSource = DM.DS3
    TabOrder = 11
    OnEnter = DBEdit5Enter
    OnExit = DBEdit5Exit
    OnKeyPress = DBEdit5KeyPress
  end
  object EdtGrp: TEdit
    Left = 88
    Top = 167
    Width = 89
    Height = 21
    TabOrder = 3
    OnEnter = EdtGrpEnter
    OnExit = EdtGrpExit
  end
  object EdtUnit: TEdit
    Left = 88
    Top = 219
    Width = 89
    Height = 21
    TabOrder = 4
    OnEnter = EdtUnitEnter
    OnExit = EdtUnitExit
  end
  object EdtDept: TEdit
    Left = 88
    Top = 193
    Width = 89
    Height = 21
    TabOrder = 5
    OnEnter = EdtDeptEnter
    OnExit = EdtDeptExit
  end
  object DBMemo1: TDBMemo
    Left = 88
    Top = 108
    Width = 360
    Height = 53
    DataField = 'PRODUCT_DESC'
    DataSource = DM.DS3
    TabOrder = 2
  end
  object DBMemo2: TDBMemo
    Left = 88
    Top = 269
    Width = 593
    Height = 57
    DataField = 'remark'
    DataSource = DM.DS3
    ScrollBars = ssVertical
    TabOrder = 6
  end
  object DBEdit3: TDBEdit
    Left = 592
    Top = 187
    Width = 89
    Height = 21
    DataField = 'WORKHOUSE'
    DataSource = DM.DS3
    TabOrder = 14
  end
  object DBEdit8: TDBEdit
    Left = 88
    Top = 243
    Width = 193
    Height = 21
    DataField = 'specific_location'
    DataSource = DM.DS3
    TabOrder = 15
  end
  object CheckBox1: TCheckBox
    Left = 584
    Top = 216
    Width = 97
    Height = 17
    Caption = #26159#21542#31649#25511
    TabOrder = 16
  end
  object IdFTP1: TIdFTP
    MaxLineAction = maException
    ReadTimeout = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 636
    Top = 335
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 332
    Top = 392
    object ftp1: TMenuItem
      Caption = 'ftp'#35774#32622
      OnClick = ftp1Click
    end
    object ftp2: TMenuItem
      Caption = #19978#20256#25991#20214#21040'ftp'
      OnClick = ftp2Click
    end
    object ftp3: TMenuItem
      Caption = #20174'ftp'#19979#36733#25991#20214
      OnClick = ftp3Click
    end
    object N1: TMenuItem
      Caption = #20462#25913#22791#27880
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #21024#38500#25152#36873#25991#20214
      OnClick = N2Click
    end
  end
  object dlgOpen1: TOpenDialog
    Left = 332
    Top = 336
  end
  object ADS0080: TADODataSet
    Connection = DM.ADOCon
    CursorType = ctStatic
    BeforeDelete = ADS0080BeforeDelete
    CommandText = 
      'select wzcp0080.rkey,wzcp0080.rkey0008,wzcp0080.ProdFileName,'#13#10'w' +
      'zcp0080.uploaddate,wzcp0080.remark,wzcp0080.rkey73,'#13#10'data0073.us' +
      'er_full_name,data0073.user_login_name '#13#10'from wzcp0080 left join ' +
      'data0073 on wzcp0080.rkey73=data0073.rkey '#13#10'where rkey0008 =:rke' +
      'y08'
    Parameters = <
      item
        Name = 'rkey08'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 212
    Top = 367
    object ADS0080rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADS0080rkey0008: TIntegerField
      FieldName = 'rkey0008'
    end
    object ADS0080ProdFileName: TStringField
      DisplayLabel = #25991#20214#36335#24452
      FieldName = 'ProdFileName'
      Size = 50
    end
    object ADS0080uploaddate: TDateTimeField
      DisplayLabel = #19978#20256#26102#38388
      FieldName = 'uploaddate'
    end
    object ADS0080remark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 50
    end
    object ADS0080rkey73: TIntegerField
      FieldName = 'rkey73'
    end
    object ADS0080user_full_name: TStringField
      DisplayLabel = #22995#21517
      FieldName = 'user_full_name'
      Size = 30
    end
    object ADS0080user_login_name: TStringField
      DisplayLabel = #24037#21495
      FieldName = 'user_login_name'
      Size = 15
    end
  end
  object DataSource1: TDataSource
    DataSet = ADS0080
    OnDataChange = DataSource1DataChange
    Left = 268
    Top = 367
  end
  object dlgSave1: TSaveDialog
    Left = 267
    Top = 412
  end
end
