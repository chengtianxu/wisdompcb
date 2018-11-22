object frmDetail: TfrmDetail
  Left = 176
  Top = 68
  Width = 1102
  Height = 740
  Caption = #21512#21516#35814#32454#36164#26009
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 12
  object pnlAll: TPanel
    Left = 0
    Top = 0
    Width = 1086
    Height = 701
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pnlTop: TPanel
      Left = 0
      Top = 32
      Width = 1086
      Height = 119
      Align = alTop
      BorderStyle = bsSingle
      TabOrder = 0
      object Label1: TLabel
        Left = 9
        Top = 12
        Width = 36
        Height = 12
        Caption = #21512#21516#21495
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 9
        Top = 39
        Width = 48
        Height = 12
        Caption = #21512#21516#37329#39069
        FocusControl = DBEdit2
      end
      object Label4: TLabel
        Left = 141
        Top = 68
        Width = 24
        Height = 12
        Caption = #24065#31181
      end
      object Label3: TLabel
        Left = 9
        Top = 67
        Width = 48
        Height = 12
        Caption = #23458#25143#20195#30721
        FocusControl = DBEdit4
      end
      object Label5000: TLabel
        Left = 141
        Top = 94
        Width = 36
        Height = 12
        Caption = #19994#21153#21592
        FocusControl = DBEdit5
      end
      object Label5: TLabel
        Left = 8
        Top = 94
        Width = 48
        Height = 12
        Caption = #36807#28388#32534#21495
        FocusControl = DBEdit4
      end
      object DBEdit1: TDBEdit
        Left = 64
        Top = 6
        Width = 175
        Height = 20
        Color = clScrollBar
        DataField = 'ContractNo'
        DataSource = ds167
        Enabled = False
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 64
        Top = 34
        Width = 175
        Height = 20
        Color = clScrollBar
        DataField = 'ContractAmt'
        DataSource = ds167
        Enabled = False
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit4: TDBEdit
        Left = 64
        Top = 62
        Width = 49
        Height = 20
        Color = clScrollBar
        DataField = 'Cust_Id'
        DataSource = ds167
        Enabled = False
        TabOrder = 2
      end
      object DBEdit5: TDBEdit
        Left = 176
        Top = 90
        Width = 63
        Height = 20
        DataField = 'SalesMan'
        DataSource = ds167
        TabOrder = 4
      end
      object btnLookCust: TBitBtn
        Left = 114
        Top = 61
        Width = 21
        Height = 23
        TabOrder = 5
        TabStop = False
        OnClick = btnLookCustClick
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
      object GroupBox1: TGroupBox
        Left = 267
        Top = 2
        Width = 636
        Height = 67
        Caption = #23458#25143#20449#24687
        TabOrder = 6
        object Label8: TLabel
          Left = 351
          Top = 18
          Width = 36
          Height = 12
          Caption = #32852#31995#20154
          FocusControl = DBEdit8
        end
        object Label9: TLabel
          Left = 481
          Top = 18
          Width = 24
          Height = 12
          Caption = #30005#35805
          FocusControl = DBEdit9
        end
        object Label10: TLabel
          Left = 481
          Top = 46
          Width = 24
          Height = 12
          Caption = #20256#30495
          FocusControl = DBEdit10
        end
        object Label6: TLabel
          Left = 8
          Top = 18
          Width = 48
          Height = 12
          Caption = #23458#25143#21517#31216
          FocusControl = DBEdit6
        end
        object Label7: TLabel
          Left = 8
          Top = 46
          Width = 48
          Height = 12
          Caption = #23458#25143#22320#22336
          FocusControl = DBEdit7
        end
        object DBEdit10: TDBEdit
          Left = 510
          Top = 41
          Width = 120
          Height = 20
          DataField = 'Fax'
          DataSource = ds167
          TabOrder = 0
        end
        object DBEdit7: TDBEdit
          Left = 64
          Top = 41
          Width = 400
          Height = 20
          Color = clScrollBar
          DataField = 'Cust_Addr'
          DataSource = ds167
          Enabled = False
          TabOrder = 1
        end
        object DBEdit9: TDBEdit
          Left = 510
          Top = 13
          Width = 120
          Height = 20
          DataField = 'Tel'
          DataSource = ds167
          TabOrder = 2
        end
        object DBEdit8: TDBEdit
          Left = 392
          Top = 13
          Width = 72
          Height = 20
          DataField = 'Contact'
          DataSource = ds167
          TabOrder = 3
        end
        object DBEdit6: TDBEdit
          Left = 64
          Top = 13
          Width = 270
          Height = 20
          Color = clScrollBar
          DataField = 'Cust_Name'
          DataSource = ds167
          Enabled = False
          TabOrder = 4
        end
      end
      object DBMemo1: TDBMemo
        Left = 267
        Top = 73
        Width = 636
        Height = 38
        DataField = 'Notes'
        DataSource = ds167
        TabOrder = 7
      end
      object DBComboBox1: TDBComboBox
        Left = 175
        Top = 62
        Width = 64
        Height = 20
        Color = clScrollBar
        DataField = 'CURR_CODE'
        DataSource = ds167
        Enabled = False
        ItemHeight = 12
        TabOrder = 3
        OnDropDown = DBComboBox1DropDown
      end
      object edtFilter: TEdit
        Left = 62
        Top = 90
        Width = 73
        Height = 20
        TabOrder = 8
      end
      object btn1: TBitBtn
        Left = 242
        Top = 86
        Width = 21
        Height = 23
        TabOrder = 9
        TabStop = False
        OnClick = btn1Click
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
    end
    object pnlTop_1: TPanel
      Left = 0
      Top = 151
      Width = 1086
      Height = 103
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object eh168: TDBGridEh
        Left = 0
        Top = 0
        Width = 1086
        Height = 103
        Align = alClient
        DataSource = ds168
        FooterColor = clWindow
        FooterFont.Charset = GB2312_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -12
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        PopupMenu = pmOp
        TabOrder = 0
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        Columns = <
          item
            EditButtons = <>
            FieldName = 'RKEY'
            Footers = <>
            Title.Alignment = taCenter
            Visible = False
          end
          item
            Checkboxes = True
            EditButtons = <>
            FieldName = 'Flag'
            Footers = <>
            KeyList.Strings = (
              '1'
              '0')
            Title.Alignment = taCenter
            Width = 40
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'RFQNo'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'RFQ'#32534#21495
            Width = 100
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'manu_part_number'
            Footers = <>
            ReadOnly = True
            Title.Caption = #26412#21378#32534#21495
            Width = 80
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'manu_part_desc'
            Footers = <>
            ReadOnly = True
            Title.Caption = #23458#25143#22411#21495
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'Qnty'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #35746#21333'PCS'#25968
            Width = 58
          end
          item
            EditButtons = <>
            FieldName = 'SetSize'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #21333'PCS'#38754#31215
            Width = 70
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'Area'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #35746#21333#38754#31215
            Width = 70
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'Price'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #21333#20215
            Width = 70
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'EngAmount'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #24037#31243#36153
            Width = 60
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'MakeAmount'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #21046#26495#36153
            Width = 60
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'TestAmount'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #27979#35797#36153
            Width = 60
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'OtherAmount'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #27169#20855#36153
            Width = 60
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'DueDays'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #20132#36135#21608#26399
            Width = 60
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'UrgentDays'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #21152#24613#22825#25968
            Width = 60
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'UrgentAmount'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #21152#24613#36153
            Width = 60
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'Discount'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #25240#25187#37329#39069
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'AftDiscountAmount'
            Footers = <>
            ReadOnly = True
            Title.Caption = #24635#20215
            Width = 80
          end>
      end
    end
    object pnlClient: TPanel
      Left = 0
      Top = 254
      Width = 1086
      Height = 447
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object pnlLeft: TPanel
        Left = 0
        Top = 0
        Width = 249
        Height = 447
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object ehRFQParam: TDBGridEh
          Left = 0
          Top = 0
          Width = 249
          Height = 447
          Align = alClient
          DataSource = ds166
          FooterColor = clWindow
          FooterFont.Charset = GB2312_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -12
          FooterFont.Name = #23435#20307
          FooterFont.Style = []
          FrozenCols = 1
          TabOrder = 0
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          Columns = <
            item
              Color = clScrollBar
              EditButtons = <>
              FieldName = 'PARAMETER_NAME'
              Footers = <>
              ReadOnly = True
              Title.Caption = #21442#25968#20195#30721
              Width = 60
            end
            item
              Color = clScrollBar
              EditButtons = <>
              FieldName = 'PARAMETER_DESC'
              Footers = <>
              ReadOnly = True
              Title.Caption = #21442#25968#25551#36848
              Width = 80
            end
            item
              AutoDropDown = True
              EditButtons = <>
              FieldName = 'Param_Value'
              Footers = <>
              Title.Caption = #21442#25968#20540
              Width = 70
            end>
        end
      end
      object pnlRight: TPanel
        Left = 249
        Top = 0
        Width = 837
        Height = 447
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object pnlDtl: TPanel
          Left = 0
          Top = 0
          Width = 837
          Height = 197
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object btnAddPrice: TSpeedButton
            Left = 3
            Top = 169
            Width = 96
            Height = 22
            Caption = #21152#36733#21152#20215#39033
            Flat = True
            ParentShowHint = False
            ShowHint = True
            OnClick = btnAddPriceClick
          end
          object Label31: TLabel
            Left = 322
            Top = 172
            Width = 36
            Height = 12
            Caption = '['#22791#27880']'
            FocusControl = DBEdit31
            Visible = False
          end
          object sbtnNotes: TSpeedButton
            Left = 663
            Top = 168
            Width = 83
            Height = 22
            Caption = #35745#31639#20844#24335#35828#26126
            Flat = True
            Font.Charset = GB2312_CHARSET
            Font.Color = clTeal
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
            Visible = False
            OnClick = sbtnNotesClick
          end
          object btnCalc: TSpeedButton
            Left = 107
            Top = 168
            Width = 73
            Height = 23
            Hint = #35745#31639
            Caption = #33258#21160#35745#31639
            Flat = True
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnCalcClick
          end
          object btnCalcAll: TSpeedButton
            Left = 189
            Top = 168
            Width = 96
            Height = 23
            Hint = #35745#31639
            Caption = #25163#21160#35745#31639
            Flat = True
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              08000000000000010000C40E0000C40E00000001000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A6000020400000206000002080000020A0000020C0000020E000004000000040
              20000040400000406000004080000040A0000040C0000040E000006000000060
              20000060400000606000006080000060A0000060C0000060E000008000000080
              20000080400000806000008080000080A0000080C0000080E00000A0000000A0
              200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
              200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
              200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
              20004000400040006000400080004000A0004000C0004000E000402000004020
              20004020400040206000402080004020A0004020C0004020E000404000004040
              20004040400040406000404080004040A0004040C0004040E000406000004060
              20004060400040606000406080004060A0004060C0004060E000408000004080
              20004080400040806000408080004080A0004080C0004080E00040A0000040A0
              200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
              200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
              200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
              20008000400080006000800080008000A0008000C0008000E000802000008020
              20008020400080206000802080008020A0008020C0008020E000804000008040
              20008040400080406000804080008040A0008040C0008040E000806000008060
              20008060400080606000806080008060A0008060C0008060E000808000008080
              20008080400080806000808080008080A0008080C0008080E00080A0000080A0
              200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
              200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
              200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
              2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
              2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
              2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
              2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
              2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
              2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
              2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0000009B9B9B9B
              9B9B9B9B9B9B9B9B00000000A407070707070707070707A400000000A407F7A4
              07F7A407F7A407A400000000A407070707070707070707A400000000A407F7A4
              07F7A407F7A407A400000000A407070707070707070707A400000000A408F7A4
              07F7A407F7A408A400000000A408070707070707070708A400000000A408F7A4
              07F7A4075F5F08A400000000A408080808080808080808A400000000F7080808
              08080808080808F700000000F7F6E2E2E2E2E2E2E2E2F6F700000000F7F6EBEB
              EBEBEBEBEBEBF6F700000000F7F6ECECECECECECECECF6F700000000F7FFF6F6
              F6F6F6F6F6F6FFF700000000F7F7F7F7F7F7F7F7F7F7F7F70000}
            ParentShowHint = False
            ShowHint = True
            OnClick = btnCalcAllClick
          end
          object gbDtl: TGroupBox
            Left = 0
            Top = 0
            Width = 837
            Height = 163
            Align = alTop
            TabOrder = 0
            object Label11: TLabel
              Left = 10
              Top = 16
              Width = 48
              Height = 12
              Caption = #26631#20934#21333#20215
              FocusControl = DBEdit11
              Font.Charset = GB2312_CHARSET
              Font.Color = clGreen
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object Label12: TLabel
              Left = 10
              Top = 41
              Width = 48
              Height = 12
              Caption = #21152#25104#27604#20363
              FocusControl = DBEdit12
            end
            object Label13: TLabel
              Left = 10
              Top = 65
              Width = 48
              Height = 12
              Caption = #21152#25104#25968#20540
              FocusControl = DBEdit13
            end
            object Label14: TLabel
              Left = 10
              Top = 90
              Width = 60
              Height = 12
              Caption = #21152#25104#21518#21333#20215
              FocusControl = DBEdit14
            end
            object Label15: TLabel
              Left = 10
              Top = 114
              Width = 24
              Height = 12
              Caption = #20215#26684
              FocusControl = DBEdit15
            end
            object Label16: TLabel
              Left = 10
              Top = 139
              Width = 36
              Height = 12
              Caption = #21046#26495#36153
              FocusControl = DBEdit16
            end
            object Label20: TLabel
              Left = 174
              Top = 17
              Width = 60
              Height = 12
              Caption = #26631#20934#24037#31243#36153
              FocusControl = edtStdEngAmount
              Font.Charset = GB2312_CHARSET
              Font.Color = clGreen
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object Label22: TLabel
              Left = 354
              Top = 101
              Width = 36
              Height = 12
              Caption = #27979#35797#36153
              FocusControl = DBEdit22
              Font.Charset = GB2312_CHARSET
              Font.Color = clGreen
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object Label25: TLabel
              Left = 355
              Top = 74
              Width = 36
              Height = 12
              Caption = #21152#24613#36153
              FocusControl = DBEdit25
              Font.Charset = GB2312_CHARSET
              Font.Color = clGreen
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object Label26: TLabel
              Left = 506
              Top = 45
              Width = 60
              Height = 12
              Caption = #24635#27604#20363#21152#25104
              FocusControl = DBEdit26
            end
            object Label27: TLabel
              Left = 506
              Top = 72
              Width = 60
              Height = 12
              Caption = #24635#37329#39069#21152#25104
              FocusControl = DBEdit27
            end
            object Label28: TLabel
              Left = 515
              Top = 17
              Width = 48
              Height = 12
              Caption = #25240#25187#37329#39069
              FocusControl = DBEdit28
              Font.Charset = GB2312_CHARSET
              Font.Color = clGreen
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object Label29: TLabel
              Left = 345
              Top = 16
              Width = 48
              Height = 12
              Caption = #21152#24613#22825#25968
              FocusControl = DBEdit29
              Font.Charset = GB2312_CHARSET
              Font.Color = clGreen
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object Label30: TLabel
              Left = 345
              Top = 45
              Width = 48
              Height = 12
              Caption = #20132#36135#22825#25968
              FocusControl = DBEdit30
              Font.Charset = GB2312_CHARSET
              Font.Color = clGreen
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object Label33: TLabel
              Left = 528
              Top = 97
              Width = 36
              Height = 12
              Caption = #24635#37329#39069
              FocusControl = DBEdit33
            end
            object lbl1: TLabel
              Left = 355
              Top = 128
              Width = 36
              Height = 12
              Caption = #27169#20855#36153
              FocusControl = DBEdit22
              Font.Charset = GB2312_CHARSET
              Font.Color = clGreen
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object lbl2: TLabel
              Left = 174
              Top = 41
              Width = 48
              Height = 12
              Caption = #21152#25104#27604#20363
              FocusControl = DBEdit12
            end
            object lbl3: TLabel
              Left = 174
              Top = 65
              Width = 48
              Height = 12
              Caption = #21152#25104#25968#20540
              FocusControl = DBEdit13
            end
            object lbl4: TLabel
              Left = 174
              Top = 90
              Width = 60
              Height = 12
              Caption = #26368#32456#24037#31243#36153
              FocusControl = DBEdit14
            end
            object DBEdit11: TDBEdit
              Left = 71
              Top = 12
              Width = 70
              Height = 20
              DataField = 'StandardPrice'
              DataSource = ds168
              TabOrder = 0
            end
            object DBEdit12: TDBEdit
              Left = 71
              Top = 37
              Width = 70
              Height = 20
              DataField = 'XS_Add'
              DataSource = ds168
              Enabled = False
              TabOrder = 1
            end
            object DBEdit13: TDBEdit
              Left = 71
              Top = 62
              Width = 70
              Height = 20
              DataField = 'Price_Add'
              DataSource = ds168
              Enabled = False
              TabOrder = 2
            end
            object DBEdit14: TDBEdit
              Left = 71
              Top = 87
              Width = 70
              Height = 20
              DataField = 'AfterPrice'
              DataSource = ds168
              Enabled = False
              TabOrder = 3
            end
            object DBEdit15: TDBEdit
              Left = 71
              Top = 112
              Width = 70
              Height = 20
              DataField = 'Price'
              DataSource = ds168
              Enabled = False
              TabOrder = 4
            end
            object DBEdit16: TDBEdit
              Left = 71
              Top = 137
              Width = 70
              Height = 20
              DataField = 'MakeAmount'
              DataSource = ds168
              Enabled = False
              TabOrder = 5
            end
            object edtStdEngAmount: TDBEdit
              Left = 240
              Top = 13
              Width = 70
              Height = 20
              DataField = 'StdEngAmount'
              DataSource = ds168
              TabOrder = 6
            end
            object DBEdit22: TDBEdit
              Left = 408
              Top = 97
              Width = 70
              Height = 20
              DataField = 'TestAmount'
              DataSource = ds168
              TabOrder = 7
            end
            object DBEdit25: TDBEdit
              Left = 407
              Top = 70
              Width = 70
              Height = 20
              DataField = 'UrgentAmount'
              DataSource = ds168
              TabOrder = 8
            end
            object DBEdit26: TDBEdit
              Left = 596
              Top = 41
              Width = 70
              Height = 20
              DataField = 'Add_Percent'
              DataSource = ds168
              TabOrder = 9
            end
            object DBEdit27: TDBEdit
              Left = 596
              Top = 67
              Width = 70
              Height = 20
              DataField = 'Add_TotalAmount'
              DataSource = ds168
              TabOrder = 10
            end
            object DBEdit28: TDBEdit
              Left = 596
              Top = 12
              Width = 70
              Height = 20
              DataField = 'Discount'
              DataSource = ds168
              TabOrder = 11
            end
            object DBEdit29: TDBEdit
              Left = 407
              Top = 12
              Width = 70
              Height = 20
              DataField = 'UrgentDays'
              DataSource = ds168
              TabOrder = 12
            end
            object DBEdit30: TDBEdit
              Left = 407
              Top = 41
              Width = 70
              Height = 20
              DataField = 'DueDays'
              DataSource = ds168
              TabOrder = 13
            end
            object DBEdit33: TDBEdit
              Left = 596
              Top = 93
              Width = 70
              Height = 20
              DataField = 'AftDiscountAmount'
              DataSource = ds168
              Enabled = False
              TabOrder = 14
            end
            object edtMujufei: TDBEdit
              Left = 408
              Top = 122
              Width = 70
              Height = 20
              DataField = 'OtherAmount'
              DataSource = ds168
              TabOrder = 15
            end
            object edtEngAmount: TDBEdit
              Left = 240
              Top = 37
              Width = 70
              Height = 20
              DataField = 'EngAddPrecent'
              DataSource = ds168
              TabOrder = 16
            end
            object edtEngAmount1: TDBEdit
              Left = 240
              Top = 61
              Width = 70
              Height = 20
              DataField = 'EngAddValue'
              DataSource = ds168
              TabOrder = 17
            end
            object edtEngAmount2: TDBEdit
              Left = 240
              Top = 85
              Width = 70
              Height = 20
              DataField = 'EngAmount'
              DataSource = ds168
              TabOrder = 18
            end
          end
          object DBEdit31: TDBEdit
            Left = 388
            Top = 169
            Width = 261
            Height = 20
            DataField = 'Notes'
            DataSource = ds168
            TabOrder = 1
            Visible = False
          end
        end
        object pnlDtlItem: TPanel
          Left = 0
          Top = 197
          Width = 837
          Height = 250
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object pgc1: TPageControl
            Left = 0
            Top = 0
            Width = 837
            Height = 250
            Align = alClient
            TabOrder = 0
          end
          object eh169: TDBGridEh
            Left = 0
            Top = 0
            Width = 837
            Height = 250
            Align = alClient
            DataSource = ds169
            FooterColor = clWindow
            FooterFont.Charset = GB2312_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -12
            FooterFont.Name = #23435#20307
            FooterFont.Style = []
            TabOrder = 1
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            UseMultiTitle = True
            Columns = <
              item
                Color = clScrollBar
                EditButtons = <>
                FieldName = 'code'
                Footers = <>
                ReadOnly = True
                Title.Caption = #21152#20215#21517#31216
                Width = 130
              end
              item
                Color = clScrollBar
                EditButtons = <>
                FieldName = 'AddType'
                Footers = <>
                KeyList.Strings = (
                  '0'
                  '1'
                  '2'
                  '3')
                PickList.Strings = (
                  #27604#20363
                  #25968#20540)
                ReadOnly = True
                Title.Caption = #21046#29256#36153'|'#21152#20215#31867#22411
                Width = 60
              end
              item
                EditButtons = <>
                FieldName = 'param_value'
                Footers = <>
                Title.Caption = #21046#29256#36153'|'#20540
                Width = 60
              end
              item
                Color = clScrollBar
                EditButtons = <>
                FieldName = 'AddTypeEng'
                Footers = <>
                KeyList.Strings = (
                  '0'
                  '1')
                PickList.Strings = (
                  #27604#20363
                  #25968#20540)
                ReadOnly = True
                Title.Caption = #24037#31243#36153'|'#21152#20215#31867#22411
                Width = 60
              end
              item
                EditButtons = <>
                FieldName = 'AddValueEng'
                Footers = <>
                Title.Caption = #24037#31243#36153'|'#20540
                Width = 60
              end
              item
                Color = clScrollBar
                EditButtons = <>
                FieldName = 'AddTypeTotal'
                Footers = <>
                KeyList.Strings = (
                  '0'
                  '1')
                PickList.Strings = (
                  #27604#20363
                  #25968#20540)
                ReadOnly = True
                Title.Caption = #21512#21516#24635#20540'|'#21152#20215#31867#22411
                Width = 60
              end
              item
                EditButtons = <>
                FieldName = 'AddValueTotal'
                Footers = <>
                Title.Caption = #21512#21516#24635#20540'|'#20540
                Width = 60
              end>
          end
        end
      end
    end
    object pnlTools: TPanel
      Left = 0
      Top = 0
      Width = 1086
      Height = 32
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      object btnSave: TBitBtn
        Left = 5
        Top = 2
        Width = 29
        Height = 29
        Hint = #20445#23384
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = btnSaveClick
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
      object btnCancel: TBitBtn
        Left = 34
        Top = 2
        Width = 29
        Height = 29
        Hint = #21462#28040
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = btnCancelClick
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
  end
  object pmOp: TPopupMenu
    OnPopup = pmOpPopup
    Left = 184
    Top = 193
    object nNew: TMenuItem
      Caption = #26032#22686
      OnClick = nNewClick
    end
    object nCopyNow: TMenuItem
      Caption = #22797#21046'-'#24403#21069
      OnClick = nCopyNowClick
    end
    object nCOpyHis: TMenuItem
      Caption = #22797#21046'-'#21382#21490
      OnClick = nCOpyHisClick
    end
    object ndelete: TMenuItem
      Caption = #21024#38500
      OnClick = ndeleteClick
    end
  end
  object pmSaveItem: TPopupMenu
    Left = 706
    Top = 494
    object N4: TMenuItem
      Caption = #20445#23384#20026#40664#35748#21152#20215#39033#30446
    end
    object N5: TMenuItem
      Caption = #21024#38500
    end
  end
  object ds166: TDataSource
    Left = 120
    Top = 422
  end
  object ds169: TDataSource
    Left = 681
    Top = 591
  end
  object ads165: TADODataSet
    Connection = dm.ADOConn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    MarshalOptions = moMarshalModifiedOnly
    CommandText = 
      'select d165.rkey,d165.rfqno,d165.rkey25,d165.rkey167 from data01' +
      '65 d165'#13#10'where rkey167 = :p1'#13#10
    Parameters = <
      item
        Name = 'p1'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 369
    Top = 192
    object ads165rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ads165rfqno: TStringField
      FieldName = 'rfqno'
      Size = 15
    end
    object ads165rkey25: TIntegerField
      FieldName = 'rkey25'
    end
    object ads165rkey167: TIntegerField
      FieldName = 'rkey167'
    end
  end
  object ads167: TADODataSet
    Connection = dm.ADOConn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    MarshalOptions = moMarshalModifiedOnly
    CommandText = 'Select * From Data0167'#13#10'Where RKEY = :RKEY'#13#10
    Parameters = <
      item
        Name = 'RKEY'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 136
    Top = 50
    object ads167RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ads167Status: TWordField
      FieldName = 'Status'
    end
    object ads167Cust_Id: TStringField
      FieldName = 'Cust_Id'
      Size = 10
    end
    object ads167Cust_Name: TStringField
      FieldName = 'Cust_Name'
      Size = 100
    end
    object ads167Cust_Addr: TStringField
      FieldName = 'Cust_Addr'
      Size = 100
    end
    object ads167SalesMan: TStringField
      FieldName = 'SalesMan'
      Size = 10
    end
    object ads167Contact: TStringField
      FieldName = 'Contact'
      Size = 10
    end
    object ads167Tel: TStringField
      FieldName = 'Tel'
    end
    object ads167Fax: TStringField
      FieldName = 'Fax'
    end
    object ads167Mail: TStringField
      FieldName = 'Mail'
      Size = 30
    end
    object ads167ContractAmt: TBCDField
      FieldName = 'ContractAmt'
      Precision = 18
      Size = 3
    end
    object ads167CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ads167Position: TStringField
      FieldName = 'Position'
      Size = 10
    end
    object ads167Notes: TStringField
      FieldName = 'Notes'
      Size = 4096
    end
    object ads167CreateId: TIntegerField
      FieldName = 'CreateId'
    end
    object ads167CreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object ads167LastModifyId: TIntegerField
      FieldName = 'LastModifyId'
    end
    object ads167LastModifyDate: TDateTimeField
      FieldName = 'LastModifyDate'
    end
    object ads167AuditId: TIntegerField
      FieldName = 'AuditId'
    end
    object ads167AuditDate: TDateTimeField
      FieldName = 'AuditDate'
    end
    object ads167ColorTag: TWordField
      FieldName = 'ColorTag'
    end
    object ads167rkey10: TIntegerField
      FieldKind = fkLookup
      FieldName = 'rkey10'
      LookupDataSet = dm.adslookup10
      LookupKeyFields = 'cust_code'
      LookupResultField = 'rkey'
      KeyFields = 'Cust_Id'
      Lookup = True
    end
    object ads167ContractNo: TStringField
      FieldName = 'ContractNo'
      Size = 15
    end
  end
  object ds167: TDataSource
    DataSet = ads167
    Left = 176
    Top = 49
  end
  object ads168: TADODataSet
    Connection = dm.ADOConn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    MarshalOptions = moMarshalModifiedOnly
    AfterScroll = ads168AfterScroll
    CommandText = 
      'SELECT d168.* FROM data0165 d165'#13#10'INNER JOIN Data0168 d168 ON d1' +
      '68.RKEY165 = d165.RKEY'#13#10'where d165.rkey167 = :p1'
    Parameters = <
      item
        Name = 'p1'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 72
    Top = 191
    object ads168RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ads168Flag: TWordField
      FieldName = 'Flag'
    end
    object ads168RKEY165: TIntegerField
      FieldName = 'RKEY165'
    end
    object ads168RFQNo: TStringField
      FieldName = 'RFQNo'
      Size = 250
    end
    object ads168FileName: TStringField
      FieldName = 'FileName'
      Size = 30
    end
    object ads168PartsId: TStringField
      FieldName = 'PartsId'
      Size = 30
    end
    object ads168BoardThick: TStringField
      FieldName = 'BoardThick'
      Size = 10
    end
    object ads168Layers: TWordField
      FieldName = 'Layers'
    end
    object ads168SetSize: TStringField
      FieldName = 'SetSize'
      OnChange = ads168SetSizeChange
      Size = 16
    end
    object ads168Qnty: TIntegerField
      FieldName = 'Qnty'
      OnChange = ads168SetSizeChange
    end
    object ads168UPS: TStringField
      FieldName = 'UPS'
      Size = 50
    end
    object ads168Price: TBCDField
      FieldName = 'Price'
      Precision = 18
      Size = 3
    end
    object ads168EngAmount: TBCDField
      FieldName = 'EngAmount'
      Precision = 18
      Size = 3
    end
    object ads168FLAmount: TBCDField
      FieldName = 'FLAmount'
      Precision = 18
      Size = 3
    end
    object ads168TestAmount: TBCDField
      FieldName = 'TestAmount'
      Precision = 18
      Size = 3
    end
    object ads168MakeAmount: TBCDField
      FieldName = 'MakeAmount'
      Precision = 18
      Size = 3
    end
    object ads168OtherAmount: TBCDField
      FieldName = 'OtherAmount'
      Precision = 18
      Size = 3
    end
    object ads168TotalAmount: TBCDField
      FieldName = 'TotalAmount'
      Precision = 18
      Size = 3
    end
    object ads168AftDiscountAmount: TBCDField
      FieldName = 'AftDiscountAmount'
      Precision = 18
      Size = 3
    end
    object ads168Area: TBCDField
      FieldName = 'Area'
      Precision = 18
      Size = 6
    end
    object ads168DueDate: TDateTimeField
      FieldName = 'DueDate'
    end
    object ads168File_Number: TStringField
      FieldName = 'File_Number'
      Size = 30
    end
    object ads168POType: TWordField
      FieldName = 'POType'
    end
    object ads168LAM2: TStringField
      FieldName = 'LAM2'
      Size = 30
    end
    object ads168SurfaceDeal: TStringField
      FieldName = 'SurfaceDeal'
      Size = 24
    end
    object ads168WCCPTH: TStringField
      FieldName = 'WCCPTH'
      Size = 12
    end
    object ads168NCCPTH: TStringField
      FieldName = 'NCCPTH'
      Size = 12
    end
    object ads168Version: TStringField
      FieldName = 'Version'
      Size = 10
    end
    object ads168TZFL: TStringField
      FieldName = 'TZFL'
      Size = 50
    end
    object ads168StandardPrice: TBCDField
      FieldName = 'StandardPrice'
      Precision = 18
      Size = 3
    end
    object ads168XS_Add: TBCDField
      FieldName = 'XS_Add'
      Precision = 18
      Size = 6
    end
    object ads168Price_Add: TBCDField
      FieldName = 'Price_Add'
      Precision = 18
      Size = 3
    end
    object ads168AfterPrice: TBCDField
      FieldName = 'AfterPrice'
      Precision = 18
      Size = 3
    end
    object ads168StdEngAmount: TBCDField
      FieldName = 'StdEngAmount'
      Precision = 18
      Size = 3
    end
    object ads168StdEngPrice: TBCDField
      FieldName = 'StdEngPrice'
      Precision = 18
      Size = 3
    end
    object ads168StdArea: TBCDField
      FieldName = 'StdArea'
      Precision = 18
      Size = 6
    end
    object ads168GoldFingerAmount: TBCDField
      FieldName = 'GoldFingerAmount'
      Precision = 18
      Size = 3
    end
    object ads168UrgentAmount: TBCDField
      FieldName = 'UrgentAmount'
      Precision = 18
      Size = 3
    end
    object ads168Add_Percent: TBCDField
      FieldName = 'Add_Percent'
      Precision = 18
      Size = 6
    end
    object ads168Add_TotalAmount: TBCDField
      FieldName = 'Add_TotalAmount'
      Precision = 18
      Size = 3
    end
    object ads168Discount: TBCDField
      FieldName = 'Discount'
      Precision = 18
      Size = 3
    end
    object ads168UrgentDays: TWordField
      FieldName = 'UrgentDays'
    end
    object ads168DueDays: TWordField
      FieldName = 'DueDays'
    end
    object ads168Notes: TStringField
      FieldName = 'Notes'
      Size = 255
    end
    object ads168rkey25: TIntegerField
      FieldName = 'rkey25'
    end
    object ads168manu_part_number: TStringField
      FieldKind = fkLookup
      FieldName = 'manu_part_number'
      LookupDataSet = dm.adsLookup25
      LookupKeyFields = 'rkey'
      LookupResultField = 'manu_part_number'
      KeyFields = 'rkey25'
      Lookup = True
    end
    object ads168manu_part_desc: TStringField
      FieldKind = fkLookup
      FieldName = 'manu_part_desc'
      LookupDataSet = dm.adsLookup25
      LookupKeyFields = 'rkey'
      LookupResultField = 'manu_part_desc'
      KeyFields = 'rkey25'
      Lookup = True
    end
    object ads168EngAddPrecent: TBCDField
      FieldName = 'EngAddPrecent'
      Precision = 18
      Size = 3
    end
    object ads168EngAddValue: TBCDField
      FieldName = 'EngAddValue'
      Precision = 18
      Size = 3
    end
  end
  object ds168: TDataSource
    DataSet = ads168
    Left = 120
    Top = 191
  end
end
