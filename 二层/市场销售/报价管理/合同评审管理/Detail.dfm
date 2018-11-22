object frmDetail: TfrmDetail
  Left = 283
  Top = 139
  Width = 908
  Height = 673
  Caption = #21512#21516#35814#32454#36164#26009
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 12
  object pnlAll: TPanel
    Left = 0
    Top = 0
    Width = 892
    Height = 635
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pnlTop: TPanel
      Left = 0
      Top = 32
      Width = 892
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
        Left = 9
        Top = 94
        Width = 48
        Height = 12
        Caption = #31614#35746#22320#28857
        FocusControl = DBEdit4
      end
      object DBEdit1: TDBEdit
        Left = 64
        Top = 6
        Width = 175
        Height = 20
        Color = clScrollBar
        DataField = 'ContractNo'
        DataSource = dm.dsMain
        Enabled = False
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 64
        Top = 34
        Width = 175
        Height = 20
        Color = clScrollBar
        DataField = 'ContractAmt'
        DataSource = dm.dsMain
        Enabled = False
        TabOrder = 1
      end
      object DBEdit4: TDBEdit
        Left = 64
        Top = 62
        Width = 49
        Height = 20
        Color = clScrollBar
        DataField = 'Cust_Id'
        DataSource = dm.dsMain
        Enabled = False
        TabOrder = 2
      end
      object DBEdit5: TDBEdit
        Left = 176
        Top = 90
        Width = 63
        Height = 20
        DataField = 'SalesMan'
        DataSource = dm.dsMain
        TabOrder = 5
      end
      object btnLookCust: TBitBtn
        Left = 114
        Top = 61
        Width = 21
        Height = 23
        TabOrder = 6
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
        Left = 256
        Top = 2
        Width = 636
        Height = 67
        Caption = #23458#25143#20449#24687
        TabOrder = 7
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
          DataSource = dm.dsMain
          TabOrder = 0
        end
        object DBEdit7: TDBEdit
          Left = 64
          Top = 41
          Width = 400
          Height = 20
          Color = clScrollBar
          DataField = 'Cust_Addr'
          DataSource = dm.dsMain
          Enabled = False
          TabOrder = 1
        end
        object DBEdit9: TDBEdit
          Left = 510
          Top = 13
          Width = 120
          Height = 20
          DataField = 'Tel'
          DataSource = dm.dsMain
          TabOrder = 2
        end
        object DBEdit8: TDBEdit
          Left = 392
          Top = 13
          Width = 72
          Height = 20
          DataField = 'Contact'
          DataSource = dm.dsMain
          TabOrder = 3
        end
        object DBEdit6: TDBEdit
          Left = 64
          Top = 13
          Width = 270
          Height = 20
          Color = clScrollBar
          DataField = 'Cust_Name'
          DataSource = dm.dsMain
          Enabled = False
          TabOrder = 4
        end
      end
      object DBMemo1: TDBMemo
        Left = 256
        Top = 73
        Width = 636
        Height = 38
        DataField = 'Notes'
        DataSource = dm.dsMain
        TabOrder = 8
      end
      object DBComboBox1: TDBComboBox
        Left = 175
        Top = 62
        Width = 64
        Height = 20
        Color = clScrollBar
        DataField = 'CURR_CODE'
        DataSource = dm.dsMain
        Enabled = False
        ItemHeight = 12
        TabOrder = 3
        OnDropDown = DBComboBox1DropDown
      end
      object DBComboBox2: TDBComboBox
        Left = 64
        Top = 90
        Width = 72
        Height = 20
        DataField = 'Position'
        DataSource = dm.dsMain
        ItemHeight = 12
        Items.Strings = (
          #28145#22323
          #21271#20140
          #19978#28023
          #35199#23433
          #25104#37117
          #37325#24198)
        TabOrder = 4
      end
    end
    object pnlTop_1: TPanel
      Left = 0
      Top = 151
      Width = 892
      Height = 103
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object dbgDetail: TDBGridEh
        Left = 0
        Top = 0
        Width = 892
        Height = 103
        Align = alClient
        DataSource = dm.dsDetail
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
        OnKeyDown = dbgDtlItemKeyDown
        Columns = <
          item
            EditButtons = <>
            FieldName = 'RKEY'
            Footers = <>
            Title.Alignment = taCenter
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'PARAMETER_PTR'
            Footers = <>
            ReadOnly = True
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
          end
          item
            EditButtons = <>
            FieldName = 'RKEY165'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Visible = False
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'RFQNo'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'FileName'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #25991#20214#21517'('#23458#25143#22411#21495')'
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'PartsId'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Width = 120
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'BoardThick'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'Layers'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'SetSize'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
          end
          item
            EditButtons = <>
            FieldName = 'POType'
            Footers = <>
            KeyList.Strings = (
              '0'
              '1'
              '2')
            PickList.Strings = (
              #26032#21333
              #22797#25237#21333
              #22797#25237#21464#26356#21333)
            Title.Alignment = taCenter
          end
          item
            EditButtons = <>
            FieldName = 'Qnty'
            Footers = <>
            Title.Alignment = taCenter
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'Area'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'UPS'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'Price'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'EngAmount'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'FLAmount'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'TestAmount'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'MakeAmount'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'OtherAmount'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'TotalAmount'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'AftDiscountAmount'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
          end
          item
            EditButtons = <>
            FieldName = 'DueDate'
            Footers = <>
            Title.Alignment = taCenter
          end
          item
            EditButtons = <>
            FieldName = 'File_Number'
            Footers = <>
            Title.Alignment = taCenter
          end
          item
            EditButtons = <>
            FieldName = 'LAM2'
            Footers = <>
            Title.Alignment = taCenter
          end
          item
            EditButtons = <>
            FieldName = 'SurfaceDeal'
            Footers = <>
            Title.Alignment = taCenter
          end
          item
            EditButtons = <>
            FieldName = 'WCCPTH'
            Footers = <>
            Title.Alignment = taCenter
          end
          item
            EditButtons = <>
            FieldName = 'NCCPTH'
            Footers = <>
            Title.Alignment = taCenter
          end
          item
            EditButtons = <>
            FieldName = 'Version'
            Footers = <>
            Title.Alignment = taCenter
          end
          item
            EditButtons = <>
            FieldName = 'TZFL'
            Footers = <>
            Title.Alignment = taCenter
          end
          item
            EditButtons = <>
            FieldName = 'StandardPrice'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'XS_Add'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'Price_Add'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'AfterPrice'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'StdEngAmount'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'StdEngPrice'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'StdArea'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'GoldFingerAmount'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'UrgentAmount'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'Add_Percent'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'Add_TotalAmount'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'Discount'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'UrgentDays'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'DueDays'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'Notes'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Visible = False
          end>
      end
    end
    object pnlClient: TPanel
      Left = 0
      Top = 254
      Width = 892
      Height = 381
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object pnlLeft: TPanel
        Left = 0
        Top = 0
        Width = 218
        Height = 381
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object dbgRFQParam: TDBGridEh
          Left = 0
          Top = 0
          Width = 218
          Height = 381
          Align = alClient
          DataSource = dm.dsRFQParam
          FooterColor = clWindow
          FooterFont.Charset = GB2312_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -12
          FooterFont.Name = #23435#20307
          FooterFont.Style = []
          FrozenCols = 1
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          OnDblClick = dbgRFQParamDblClick
          Columns = <
            item
              EditButtons = <>
              FieldName = 'RKEY'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'PARAMETER_PTR'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'Group_Type'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'Group_Name'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'SEQ_NO'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'Param_ptr'
              Footers = <>
              Visible = False
            end
            item
              Color = clScrollBar
              EditButtons = <>
              FieldName = 'PARAMETER_DESC'
              Footers = <>
              Width = 96
            end
            item
              Color = clScrollBar
              EditButtons = <>
              FieldName = 'Param_Value'
              Footers = <>
              Width = 86
            end
            item
              EditButtons = <>
              FieldName = 'MustInput'
              Footers = <>
              Visible = False
            end>
        end
      end
      object pnlRight: TPanel
        Left = 218
        Top = 0
        Width = 674
        Height = 381
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object pnlDtl: TPanel
          Left = 0
          Top = 0
          Width = 674
          Height = 187
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object sbtnCalc: TSpeedButton
            Left = 1
            Top = 164
            Width = 22
            Height = 22
            Hint = #35745#31639
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
            OnClick = sbtnCalcClick
          end
          object Label31: TLabel
            Left = 322
            Top = 168
            Width = 36
            Height = 12
            Caption = '['#22791#27880']'
            FocusControl = DBEdit31
          end
          object sbtnNotes: TSpeedButton
            Left = 23
            Top = 164
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
            OnClick = sbtnNotesClick
          end
          object DBText1: TDBText
            Left = 110
            Top = 169
            Width = 113
            Height = 17
            Hint = #20132#36135#38754#31215'('#13217')'
            DataField = 'DueArea'
            DataSource = dm.dsDetail
            Font.Charset = GB2312_CHARSET
            Font.Color = clRed
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object gbDtl: TGroupBox
            Left = 0
            Top = 0
            Width = 631
            Height = 163
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
              Caption = #31995#25968#21152#25104
              FocusControl = DBEdit12
            end
            object Label13: TLabel
              Left = 10
              Top = 65
              Width = 48
              Height = 12
              Caption = #21333#20215#21152#25104
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
            object Label17: TLabel
              Left = 159
              Top = 16
              Width = 60
              Height = 12
              Caption = #26631#20934#24037#31243#36153
              FocusControl = DBEdit17
              Font.Charset = GB2312_CHARSET
              Font.Color = clGreen
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object Label18: TLabel
              Left = 159
              Top = 41
              Width = 72
              Height = 12
              Caption = #26631#20934#21152#25104#21333#20215
              FocusControl = DBEdit18
              Font.Charset = GB2312_CHARSET
              Font.Color = clGreen
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object Label19: TLabel
              Left = 159
              Top = 65
              Width = 72
              Height = 12
              Caption = #21152#25104#38754#31215#30028#38480
              FocusControl = DBEdit19
              Font.Charset = GB2312_CHARSET
              Font.Color = clGreen
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
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
              Left = 159
              Top = 90
              Width = 36
              Height = 12
              Caption = #24037#31243#36153
              FocusControl = DBEdit20
            end
            object Label21: TLabel
              Left = 159
              Top = 114
              Width = 36
              Height = 12
              Caption = #33778#26519#36153
              FocusControl = DBEdit21
              Font.Charset = GB2312_CHARSET
              Font.Color = clGreen
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object Label22: TLabel
              Left = 159
              Top = 139
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
            object Label23: TLabel
              Left = 322
              Top = 16
              Width = 48
              Height = 12
              Caption = #20854#20182#36153#29992
              FocusControl = DBEdit23
            end
            object Label24: TLabel
              Left = 322
              Top = 41
              Width = 48
              Height = 12
              Caption = #37329#25163#25351#36153
              FocusControl = DBEdit24
            end
            object Label25: TLabel
              Left = 322
              Top = 65
              Width = 36
              Height = 12
              Caption = #21152#24613#36153
              FocusControl = DBEdit25
            end
            object Label26: TLabel
              Left = 322
              Top = 90
              Width = 60
              Height = 12
              Caption = #24635#27604#20363#21152#25104
              FocusControl = DBEdit26
            end
            object Label27: TLabel
              Left = 322
              Top = 114
              Width = 60
              Height = 12
              Caption = #24635#37329#39069#21152#25104
              FocusControl = DBEdit27
            end
            object Label28: TLabel
              Left = 322
              Top = 139
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
              Left = 476
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
              Left = 476
              Top = 41
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
            object Label32: TLabel
              Left = 476
              Top = 65
              Width = 72
              Height = 12
              Caption = #25240#25187#21069#24635#37329#39069
              FocusControl = DBEdit32
            end
            object Label33: TLabel
              Left = 476
              Top = 90
              Width = 72
              Height = 12
              Caption = #25240#25187#21518#24635#37329#39069
              FocusControl = DBEdit33
            end
            object DBEdit11: TDBEdit
              Left = 71
              Top = 12
              Width = 70
              Height = 20
              DataField = 'StandardPrice'
              DataSource = dm.dsDetail
              TabOrder = 0
            end
            object DBEdit12: TDBEdit
              Left = 71
              Top = 37
              Width = 70
              Height = 20
              DataField = 'XS_Add'
              DataSource = dm.dsDetail
              Enabled = False
              TabOrder = 1
            end
            object DBEdit13: TDBEdit
              Left = 71
              Top = 62
              Width = 70
              Height = 20
              DataField = 'Price_Add'
              DataSource = dm.dsDetail
              Enabled = False
              TabOrder = 2
            end
            object DBEdit14: TDBEdit
              Left = 71
              Top = 87
              Width = 70
              Height = 20
              DataField = 'AfterPrice'
              DataSource = dm.dsDetail
              Enabled = False
              TabOrder = 3
            end
            object DBEdit17: TDBEdit
              Left = 234
              Top = 12
              Width = 70
              Height = 20
              DataField = 'StdEngAmount'
              DataSource = dm.dsDetail
              TabOrder = 4
            end
            object DBEdit18: TDBEdit
              Left = 234
              Top = 37
              Width = 70
              Height = 20
              DataField = 'StdEngPrice'
              DataSource = dm.dsDetail
              TabOrder = 5
            end
            object DBEdit19: TDBEdit
              Left = 234
              Top = 62
              Width = 70
              Height = 20
              DataField = 'StdArea'
              DataSource = dm.dsDetail
              TabOrder = 6
            end
            object DBEdit15: TDBEdit
              Left = 71
              Top = 112
              Width = 70
              Height = 20
              DataField = 'Price'
              DataSource = dm.dsDetail
              Enabled = False
              TabOrder = 7
            end
            object DBEdit16: TDBEdit
              Left = 71
              Top = 137
              Width = 70
              Height = 20
              DataField = 'MakeAmount'
              DataSource = dm.dsDetail
              Enabled = False
              TabOrder = 8
            end
            object DBEdit20: TDBEdit
              Left = 234
              Top = 87
              Width = 70
              Height = 20
              DataField = 'EngAmount'
              DataSource = dm.dsDetail
              Enabled = False
              TabOrder = 9
            end
            object DBEdit21: TDBEdit
              Left = 234
              Top = 112
              Width = 70
              Height = 20
              DataField = 'FLAmount'
              DataSource = dm.dsDetail
              TabOrder = 10
            end
            object DBEdit22: TDBEdit
              Left = 234
              Top = 137
              Width = 70
              Height = 20
              DataField = 'TestAmount'
              DataSource = dm.dsDetail
              TabOrder = 11
            end
            object DBEdit23: TDBEdit
              Left = 388
              Top = 12
              Width = 70
              Height = 20
              DataField = 'OtherAmount'
              DataSource = dm.dsDetail
              Enabled = False
              TabOrder = 12
            end
            object DBEdit24: TDBEdit
              Left = 388
              Top = 37
              Width = 70
              Height = 20
              DataField = 'GoldFingerAmount'
              DataSource = dm.dsDetail
              Enabled = False
              TabOrder = 13
            end
            object DBEdit25: TDBEdit
              Left = 388
              Top = 62
              Width = 70
              Height = 20
              DataField = 'UrgentAmount'
              DataSource = dm.dsDetail
              Enabled = False
              TabOrder = 14
            end
            object DBEdit26: TDBEdit
              Left = 388
              Top = 87
              Width = 70
              Height = 20
              DataField = 'Add_Percent'
              DataSource = dm.dsDetail
              Enabled = False
              TabOrder = 15
            end
            object DBEdit27: TDBEdit
              Left = 388
              Top = 112
              Width = 70
              Height = 20
              DataField = 'Add_TotalAmount'
              DataSource = dm.dsDetail
              Enabled = False
              TabOrder = 16
            end
            object DBEdit28: TDBEdit
              Left = 388
              Top = 137
              Width = 70
              Height = 20
              DataField = 'Discount'
              DataSource = dm.dsDetail
              TabOrder = 17
            end
            object DBEdit29: TDBEdit
              Left = 554
              Top = 12
              Width = 70
              Height = 20
              DataField = 'UrgentDays'
              DataSource = dm.dsDetail
              TabOrder = 18
            end
            object DBEdit30: TDBEdit
              Left = 554
              Top = 37
              Width = 70
              Height = 20
              DataField = 'DueDays'
              DataSource = dm.dsDetail
              TabOrder = 19
            end
            object DBEdit32: TDBEdit
              Left = 554
              Top = 62
              Width = 70
              Height = 20
              DataField = 'TotalAmount'
              DataSource = dm.dsDetail
              Enabled = False
              TabOrder = 20
            end
            object DBEdit33: TDBEdit
              Left = 554
              Top = 87
              Width = 70
              Height = 20
              DataField = 'AftDiscountAmount'
              DataSource = dm.dsDetail
              Enabled = False
              TabOrder = 21
            end
          end
          object DBEdit31: TDBEdit
            Left = 388
            Top = 165
            Width = 243
            Height = 20
            DataField = 'Notes'
            DataSource = dm.dsDetail
            TabOrder = 1
          end
        end
        object pnlDtlItem: TPanel
          Left = 0
          Top = 187
          Width = 674
          Height = 194
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object dbgDtlItem: TDBGridEh
            Left = 0
            Top = 0
            Width = 674
            Height = 194
            Align = alClient
            DataSource = dm.dsDtlItem
            FooterColor = clWindow
            FooterFont.Charset = GB2312_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -12
            FooterFont.Name = #23435#20307
            FooterFont.Style = []
            FrozenCols = 3
            PopupMenu = pmSaveItem
            TabOrder = 0
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            OnKeyDown = dbgDtlItemKeyDown
            Columns = <
              item
                EditButtons = <>
                FieldName = 'RKEY'
                Footers = <>
                Title.Alignment = taCenter
                Visible = False
              end
              item
                EditButtons = <>
                FieldName = 'PARAMETER_PTR'
                Footers = <>
                Title.Alignment = taCenter
                Visible = False
              end
              item
                EditButtons = <>
                FieldName = 'RKEY165'
                Footers = <>
                Title.Alignment = taCenter
                Visible = False
              end
              item
                EditButtons = <>
                FieldName = 'RFQNo'
                Footers = <>
                Title.Alignment = taCenter
                Visible = False
              end
              item
                EditButtons = <>
                FieldName = 'Param_ptr'
                Footers = <>
                Title.Alignment = taCenter
                Visible = False
              end
              item
                EditButtons = <>
                FieldName = 'SEQ_NO'
                Footers = <>
                Title.Alignment = taCenter
                Visible = False
              end
              item
                Color = clScrollBar
                EditButtons = <>
                FieldName = 'PARAMETER_DESC'
                Footers = <>
                ReadOnly = True
                Title.Alignment = taCenter
                Width = 96
              end
              item
                Color = clScrollBar
                EditButtons = <>
                FieldName = 'UNIT_NAME'
                Footers = <>
                ReadOnly = True
                Title.Alignment = taCenter
              end
              item
                Color = clScrollBar
                EditButtons = <>
                FieldName = 'Param_Value'
                Footers = <>
                ReadOnly = True
                Title.Alignment = taCenter
                Width = 86
              end
              item
                EditButtons = <>
                FieldName = 'Add_Type'
                Footers = <>
                KeyList.Strings = (
                  '0'
                  '1'
                  '2'
                  '3')
                PickList.Strings = (
                  #21046#26495#36153#21333#20215#27604#20363#21152#25104
                  #21046#26495#36153#21333#20215#37329#39069#21152#25104
                  #21512#21516#24635#20540#27604#20363#21152#25104
                  #21512#21516#24635#20540#37329#39069#21152#25104)
                Title.Alignment = taCenter
                Width = 138
              end
              item
                EditButtons = <>
                FieldName = 'Add_Value'
                Footers = <>
                Title.Alignment = taCenter
              end
              item
                EditButtons = <>
                FieldName = 'Add_Time'
                Footers = <>
                Title.Alignment = taCenter
              end
              item
                EditButtons = <>
                FieldName = 'Notes'
                Footers = <>
                Title.Alignment = taCenter
                Width = 172
              end>
          end
        end
      end
    end
    object pnlTools: TPanel
      Left = 0
      Top = 0
      Width = 892
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
      object btnPrint: TBitBtn
        Left = 63
        Top = 2
        Width = 29
        Height = 29
        Hint = #25171#21360
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btnPrintClick
        Glyph.Data = {
          26050000424D26050000000000003604000028000000100000000F0000000100
          080000000000F000000000000000000000000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
          A400000000000000000000000000000000000000000000000000000000000000
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
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707070707
          0707070707070707070707070000000000000000000000070707070007070707
          0707070707000700070700000000000000000000000000070007000707070707
          07FBFBFB07070000000700070707070707101010070700070007000000000000
          0000000000000007070000070707070707070707070007000700070000000000
          00000000000700070000070700FFFFFFFFFFFFFFFF000700070007070700FF00
          00000000FF000000000707070700FFFFFFFFFFFFFFFF000707070707070700FF
          0000000000FF000707070707070700FFFFFFFFFFFFFFFF000707070707070700
          00000000000000000707}
      end
    end
  end
  object pmOp: TPopupMenu
    Left = 184
    Top = 177
    object N1: TMenuItem
      Caption = #26032#22686
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #21024#38500
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #26356#26032
      OnClick = N3Click
    end
    object N6: TMenuItem
      Tag = 1
      Caption = #20135#21697#25253#20215#20998#26512#26723#26696#34920
      OnClick = N6Click
    end
  end
  object pmSaveItem: TPopupMenu
    Left = 706
    Top = 494
    object N4: TMenuItem
      Caption = #20445#23384#20026#40664#35748#21152#20215#39033#30446
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = #21024#38500
      OnClick = N5Click
    end
  end
end
