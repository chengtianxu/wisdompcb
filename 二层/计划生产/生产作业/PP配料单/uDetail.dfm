object frmDetail: TfrmDetail
  Left = 250
  Top = 66
  Width = 969
  Height = 683
  Caption = #26126#32454
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
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
  object Splitter1: TSplitter
    Left = 0
    Top = 245
    Width = 961
    Height = 4
    Cursor = crVSplit
    Align = alTop
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 961
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
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
      Visible = False
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
  object Panel2: TPanel
    Left = 0
    Top = 33
    Width = 961
    Height = 212
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 961
      Height = 212
      ActivePage = TabSheet1
      Align = alClient
      Style = tsButtons
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = #22522#26412#20449#24687
        object GroupBox1: TGroupBox
          Left = 633
          Top = 0
          Width = 320
          Height = 182
          Align = alRight
          Caption = #21046#31243#21442#25968
          TabOrder = 0
          object DBGridEh2: TDBGridEh
            Left = 2
            Top = 14
            Width = 316
            Height = 166
            Align = alClient
            DataSource = DM.dsProcParam
            FooterColor = clWindow
            FooterFont.Charset = ANSI_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -12
            FooterFont.Name = #23435#20307
            FooterFont.Style = []
            TabOrder = 0
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            Columns = <
              item
                EditButtons = <>
                FieldName = 'seq_no'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'PARAMETER_PTR'
                Footers = <>
                Visible = False
              end
              item
                EditButtons = <>
                FieldName = 'PARAMETER_NAME'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'PARAMETER_DESC'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'PARAMETER_VALUE'
                Footers = <>
              end>
          end
        end
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 633
          Height = 182
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object Label1: TLabel
            Left = 72
            Top = 42
            Width = 36
            Height = 12
            Alignment = taRightJustify
            Caption = #25209#27425#21495
            FocusControl = DBEdit1
          end
          object Label2: TLabel
            Left = 60
            Top = 116
            Width = 48
            Height = 12
            Alignment = taRightJustify
            Caption = #26448#26009#21378#21830
            FocusControl = DBEdit2
          end
          object Label3: TLabel
            Left = 60
            Top = 140
            Width = 48
            Height = 12
            Alignment = taRightJustify
            Caption = #26448#26009#22411#21495
            FocusControl = DBEdit3
          end
          object Label4: TLabel
            Left = 368
            Top = 19
            Width = 102
            Height = 12
            Alignment = taRightJustify
            Caption = #29983#20135#24635#25968#37327'(panel)'
            FocusControl = DBEdit4
          end
          object Label5: TLabel
            Left = 398
            Top = 43
            Width = 72
            Height = 12
            Alignment = taRightJustify
            Caption = 'PP'#37197#26009#24635#24352#25968
            FocusControl = DBEdit5
          end
          object Label6: TLabel
            Left = 374
            Top = 67
            Width = 96
            Height = 12
            Alignment = taRightJustify
            Caption = 'PP'#37197#39069#24635#38271#24230'('#31859')'
            FocusControl = DBEdit6
          end
          object Label7: TLabel
            Left = 84
            Top = 162
            Width = 24
            Height = 12
            Alignment = taRightJustify
            Caption = #22791#27880
            FocusControl = DBEdit7
          end
          object Label8: TLabel
            Left = 60
            Top = 67
            Width = 48
            Height = 12
            Alignment = taRightJustify
            Caption = #26412#21378#32534#21495
            FocusControl = DBEdit8
          end
          object DBText1: TDBText
            Left = 261
            Top = 67
            Width = 65
            Height = 17
            DataField = 'MANU_PART_DESC'
            DataSource = DM.ds25
          end
          object SpeedButton1: TSpeedButton
            Left = 235
            Top = 62
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
            OnClick = SpeedButton1Click
          end
          object Label9: TLabel
            Left = 60
            Top = 91
            Width = 48
            Height = 12
            Alignment = taRightJustify
            Caption = #24037#24207#20195#30721
            FocusControl = DBEdit9
          end
          object SpeedButton2: TSpeedButton
            Left = 235
            Top = 86
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
            OnClick = SpeedButton1Click
          end
          object DBText2: TDBText
            Left = 261
            Top = 91
            Width = 65
            Height = 17
            DataField = 'DEPT_NAME'
            DataSource = DM.ds34
          end
          object Label10: TLabel
            Left = 422
            Top = 91
            Width = 48
            Height = 12
            Alignment = taRightJustify
            Caption = #21019#24314#20154#21592
            FocusControl = DBEdit10
          end
          object Label11: TLabel
            Left = 422
            Top = 139
            Width = 48
            Height = 12
            Alignment = taRightJustify
            Caption = #30830#35748#20154#21592
            FocusControl = DBEdit11
          end
          object Label12: TLabel
            Left = 422
            Top = 163
            Width = 48
            Height = 12
            Alignment = taRightJustify
            Caption = #30830#35748#26085#26399
            FocusControl = DBEdit11
          end
          object Label13: TLabel
            Left = 422
            Top = 115
            Width = 48
            Height = 12
            Alignment = taRightJustify
            Caption = #21019#24314#26085#26399
            FocusControl = DBEdit10
          end
          object DBEdit1: TDBEdit
            Left = 113
            Top = 38
            Width = 68
            Height = 20
            Color = clScrollBar
            DataField = 'rkey'
            DataSource = DM.ds731
            ReadOnly = True
            TabOrder = 0
          end
          object DBEdit2: TDBEdit
            Left = 113
            Top = 112
            Width = 100
            Height = 20
            DataField = 'lam2'
            DataSource = DM.ds731
            TabOrder = 1
          end
          object DBEdit3: TDBEdit
            Left = 113
            Top = 136
            Width = 100
            Height = 20
            DataField = 'lam_ty_gp'
            DataSource = DM.ds731
            TabOrder = 2
          end
          object DBEdit4: TDBEdit
            Left = 475
            Top = 15
            Width = 68
            Height = 20
            Color = clScrollBar
            DataField = 'manuf_qty'
            DataSource = DM.ds731
            ReadOnly = True
            TabOrder = 3
          end
          object DBEdit5: TDBEdit
            Left = 475
            Top = 39
            Width = 68
            Height = 20
            Color = clScrollBar
            DataField = 'panel_qty'
            DataSource = DM.ds731
            ReadOnly = True
            TabOrder = 4
          end
          object DBEdit6: TDBEdit
            Left = 475
            Top = 63
            Width = 68
            Height = 20
            Color = clScrollBar
            DataField = 'pp_quota_len'
            DataSource = DM.ds731
            ReadOnly = True
            TabOrder = 5
          end
          object DBEdit7: TDBEdit
            Left = 113
            Top = 158
            Width = 214
            Height = 20
            DataField = 'remark'
            DataSource = DM.ds731
            TabOrder = 6
          end
          object DBRadioGroup1: TDBRadioGroup
            Left = 21
            Top = 2
            Width = 306
            Height = 33
            Columns = 2
            DataField = 'TTYPE'
            DataSource = DM.ds731
            Enabled = False
            Items.Strings = (
              #27491#24120#37197#26009#21333
              #34917#26009#37197#26009#21333)
            TabOrder = 7
            Values.Strings = (
              '0'
              '1')
          end
          object DBEdit8: TDBEdit
            Left = 113
            Top = 63
            Width = 120
            Height = 20
            Color = clScrollBar
            DataField = 'MANU_PART_NUMBER'
            DataSource = DM.ds25
            ReadOnly = True
            TabOrder = 8
          end
          object DBEdit9: TDBEdit
            Left = 113
            Top = 87
            Width = 120
            Height = 20
            Color = clScrollBar
            DataField = 'DEPT_CODE'
            DataSource = DM.ds34
            ReadOnly = True
            TabOrder = 9
          end
          object DBEdit10: TDBEdit
            Left = 475
            Top = 87
            Width = 68
            Height = 20
            Color = clScrollBar
            DataField = 'EMPLOYEE_NAME'
            DataSource = DM.ds05
            ReadOnly = True
            TabOrder = 10
          end
          object DBEdit11: TDBEdit
            Left = 475
            Top = 135
            Width = 68
            Height = 20
            Color = clScrollBar
            DataField = 'EMPLOYEE_NAME'
            DataSource = DM.ds05_1
            ReadOnly = True
            TabOrder = 11
          end
          object DBDateTimeEditEh1: TDBDateTimeEditEh
            Left = 475
            Top = 111
            Width = 121
            Height = 20
            DataField = 'creare_date'
            DataSource = DM.ds731
            EditButtons = <>
            Kind = dtkDateEh
            ReadOnly = True
            TabOrder = 12
            Visible = True
          end
          object DBDateTimeEditEh2: TDBDateTimeEditEh
            Left = 475
            Top = 159
            Width = 121
            Height = 20
            DataField = 'confirm_time'
            DataSource = DM.ds731
            EditButtons = <>
            Kind = dtkDateEh
            ReadOnly = True
            TabOrder = 13
            Visible = True
          end
          object DBCheckBox1: TDBCheckBox
            Left = 236
            Top = 114
            Width = 97
            Height = 17
            Caption = #26080#21348#32032#35201#27714
            DataField = 'CURRENT_REV'
            DataSource = DM.ds25
            ReadOnly = True
            TabOrder = 14
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = #21387#21512#20449#24687
        ImageIndex = 1
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 500
          Height = 182
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object RadioGroup1: TRadioGroup
            Left = 0
            Top = 147
            Width = 500
            Height = 35
            Align = alBottom
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              #21407#22987#27604#29575
              #25289#20280#27604#29575)
            TabOrder = 0
            OnClick = RadioGroup1Click
          end
          object cxDBImage1: TcxDBImage
            Left = 0
            Top = 0
            Hint = #21387#21512#22270#29255
            Align = alClient
            DataBinding.DataField = 'layers_image'
            DataBinding.DataSource = DM.ds25
            Properties.GraphicClassName = 'TJPEGImage'
            TabOrder = 1
            Height = 147
            Width = 500
          end
        end
        object DBMemo1: TDBMemo
          Left = 500
          Top = 0
          Width = 453
          Height = 182
          Hint = #25991#26412#32467#26500
          Align = alClient
          BevelInner = bvSpace
          BevelKind = bkFlat
          DataField = 'layers_info'
          DataSource = DM.ds25
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 249
    Width = 961
    Height = 407
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object DBGridEh1: TDBGridEh
      Left = 0
      Top = 0
      Width = 961
      Height = 407
      Align = alClient
      DataSource = DM.ds732
      FooterColor = clWindow
      FooterFont.Charset = ANSI_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -12
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      FooterRowCount = 1
      PopupMenu = pm1
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      TitleLines = 2
      Columns = <
        item
          EditButtons = <>
          FieldName = 'rkey'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'rkey731'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'rkey06'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'rkey17'
          Footers = <>
          Visible = False
        end
        item
          Color = clScrollBar
          EditButtons = <
            item
              Visible = False
              OnClick = DBGridEh1Columns4EditButtons0Click
            end>
          FieldName = 'WORK_ORDER_NUMBER'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Width = 106
        end
        item
          EditButtons = <
            item
              OnClick = DBGridEh1Columns5EditButtons0Click
            end>
          FieldName = 'INV_PART_NUMBER'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Width = 148
        end
        item
          EditButtons = <>
          FieldName = 'INV_PART_DESCRIPTION'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Width = 244
        end
        item
          Color = clScrollBar
          EditButtons = <>
          FieldName = 'manuf_qty'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Width = 56
        end
        item
          EditButtons = <>
          FieldName = 'pp_quota'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          Color = clScrollBar
          EditButtons = <>
          FieldName = 'panel_qty'
          Footer.ValueType = fvtSum
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
        end
        item
          Color = clScrollBar
          EditButtons = <>
          FieldName = 'panel_ln'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Width = 60
        end
        item
          Color = clScrollBar
          EditButtons = <>
          FieldName = 'panel_wd'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'PP_TYP'
          Footers = <>
          Title.Alignment = taCenter
          Width = 68
        end
        item
          EditButtons = <>
          FieldName = 'pp_rc'
          Footers = <>
          Title.Alignment = taCenter
          Width = 62
        end
        item
          Color = clScrollBar
          EditButtons = <>
          FieldName = 'pp_tg'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Width = 44
        end
        item
          Color = clScrollBar
          EditButtons = <>
          FieldName = 'pp_quota_len'
          Footer.ValueType = fvtSum
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Width = 80
        end
        item
          Color = clScrollBar
          EditButtons = <>
          FieldName = 'pp_quota_roll'
          Footer.ValueType = fvtSum
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Width = 78
        end
        item
          EditButtons = <>
          FieldName = 'qg_flag'
          Footers = <>
          Visible = False
        end
        item
          Color = clScrollBar
          EditButtons = <>
          FieldName = 'qg'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Width = 53
        end
        item
          Color = clScrollBar
          EditButtons = <>
          FieldName = 'matrece'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Width = 53
        end
        item
          EditButtons = <>
          FieldName = 'remark'
          Footers = <>
          Title.Alignment = taCenter
          Width = 96
        end>
    end
  end
  object pm1: TPopupMenu
    Left = 648
    Top = 409
    object N1: TMenuItem
      Caption = #26032#22686
      object N4: TMenuItem
        Caption = #25353#21046#31243#21442#25968#26032#22686
        OnClick = N4Click
      end
      object N5: TMenuItem
        Caption = #25163#24037#26032#22686
        Visible = False
        OnClick = N5Click
      end
      object N6: TMenuItem
        Caption = #25163#24037#25209#37327#26032#22686
        OnClick = N6Click
      end
    end
    object N2: TMenuItem
      Caption = #32534#36753
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #21024#38500
      OnClick = N3Click
    end
  end
end
