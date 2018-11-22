object frmMain: TfrmMain
  Left = 308
  Top = 139
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20316#19994#21333#29983#20135#21069#20998#37197
  ClientHeight = 684
  ClientWidth = 976
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 976
    Height = 684
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 974
      Height = 41
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 280
        Top = 15
        Width = 60
        Height = 13
        Caption = #20316#19994#21333#21495#65306
      end
      object btnExit: TBitBtn
        Left = 8
        Top = 8
        Width = 75
        Height = 25
        Caption = #36864#20986'(&Q)'
        TabOrder = 0
        OnClick = btnExitClick
      end
      object btnRefresh: TBitBtn
        Left = 82
        Top = 8
        Width = 75
        Height = 25
        Caption = #21047#26032'(&F)'
        TabOrder = 1
        OnClick = btnRefreshClick
      end
      object btnQuery: TBitBtn
        Left = 156
        Top = 8
        Width = 75
        Height = 25
        Caption = #26597#35810
        TabOrder = 2
        Visible = False
        OnClick = btnQueryClick
      end
      object edtBarCode: TEdit
        Left = 344
        Top = 10
        Width = 121
        Height = 21
        Hint = #20351#29992#26465#30721#26538#26102#35831#23558#40736#26631#28966#28857#31227#33267#27492#22788
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnEnter = edtBarCodeEnter
        OnKeyDown = edtBarCodeKeyDown
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 42
      Width = 974
      Height = 396
      Align = alTop
      TabOrder = 1
      object DBGridEh1: TDBGridEh
        Left = 1
        Top = 1
        Width = 972
        Height = 394
        Align = alClient
        DataSource = DM.dsIn
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnKeyDown = DBGridEh1KeyDown
        Columns = <
          item
            Checkboxes = True
            EditButtons = <>
            FieldName = 'IsSelected'
            Footers = <>
            KeyList.Strings = (
              '1'
              '0')
            Title.Alignment = taCenter
            Title.Caption = #36873#20013
            Width = 28
          end
          item
            EditButtons = <>
            FieldName = 'RKEY'
            Footers = <>
            Title.Alignment = taCenter
            Visible = False
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'WORK_ORDER_NUMBER'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #20869#23618#20316#19994#21333#21495
            Width = 110
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'MANU_PART_NUMBER'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #26412#21378#32534#21495
            Width = 100
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'MANU_PART_DESC'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #23458#25143#22411#21495
            Width = 120
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'SO_NO'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #35746#21333#32534#21495
            Visible = False
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'ENT_DATETIME'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #25237#20135#26102#38388
            Visible = False
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'Quan_Sch'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #25237#20135'PCS'#25968
            Width = 65
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'PARTS_PER_PANEL'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = 'Units'
            Width = 30
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'Qty_BackLog'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #22312#32447'PCS'#25968
            Width = 65
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'PANELS'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #22312#32447'PNL'#25968
            Width = 65
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'QUAN_REJ'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #25253#24223'PCS'#25968
            Width = 65
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'QUAN_PROD'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #24050#21457#25918'PCS'#25968
            Width = 75
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'TransQty'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #26412#27425#21457#25918'PCS'#25968
            Width = 90
          end
          item
            EditButtons = <>
            FieldName = 'TransPNLQty'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #26412#27425#21457#25918'PNL'#25968
            Width = 90
          end>
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 438
      Width = 974
      Height = 42
      Align = alTop
      TabOrder = 2
      object sbtPress: TSpeedButton
        Left = 274
        Top = 2
        Width = 40
        Height = 38
        Hint = #21387#21512'(F9)'
        Flat = True
        Glyph.Data = {
          76020000424D7602000000000000760000002800000020000000200000000100
          04000000000000020000C40E0000C40E00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF000000000000EEEEEEEEEEEE
          EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE8EEEEEEEEEEEEEEEEEEEEEEEEEEE
          EEE088EEEEEEEEEEEEEEEEEEEEEEEEEEEEE088EEEEEEEEEEEEEEEEEEEEEEEEEE
          EE00888EEEEEEEEEEEEEEEEEEEEEEEEEEE00888EEEEEEEEEEEEEEEEEEEEEEEEE
          E0008888EEEEEEEEEEEEEEEEEEEEEEEEE0008888EEEEEEEEEEEEEEEEEEEEEEEE
          000088888EEEEEEEEEEEEEEEEEEEEEEE000088888EEEEEEEEEEEEEEEEEEEEEE0
          0000888888EEEEEEEEEEEEEEEEEEEEE00000888888EEEEEEEEEEEEEEEEEEEE00
          00008888888EEEEEEEEEEEEEEEEEEE0000008888888EEEEEEEEEEEEEEEEEE000
          000088888888EEEEEEEEEEEEEEEEE000000088888888EEEEEEEEEEEEEEEE0000
          0000888888888EEEEEEEEEEEEEEE00000000888888888EEEEEEEEEEEEEE00000
          00008888888888EEEEEEEEEEEEE0000000008888888888EEEEEEEEEEEE000000
          000088888888888EEEEEEEEEEE000000000088888888888EEEEEEEEEE0000000
          0000888888888888EEEEEEEEE00000000000888888888888EEEEEEEE00000000
          00008888888888888EEEEEEE0000000000008888888888888EEEEEE000000000
          077778888888888888EEEEE000000077777777778888888888EEEE0000077777
          7777777777788888888EEE00777777777777777777777788888EE07777777777
          77777777777777777888E7777777777777777777777777777777}
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtPressClick
      end
      object Label4: TLabel
        Left = 328
        Top = 8
        Width = 384
        Height = 12
        Caption = #65297'.'#20869#23618'PNL'#25968#22914#26524#19981#19968#27425#21457#25918#23436#65292#37027#20040#38750#26368#21518#19968#27425#21457#25918#19981#20801#35768#20351#29992#21333#25253#26495
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 328
        Top = 24
        Width = 396
        Height = 12
        Caption = #65298'.'#20869#23618'PNL'#25968#22914#26524#19981#19968#27425#21457#25918#23436#65292#37027#20040#21457#25918'PNL'#25968'*Units'#24517#39035#23567#20110#22312#32447'PCS'#25968
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object pnlQty: TPanel
        Left = 5
        Top = 4
        Width = 268
        Height = 35
        BevelOuter = bvNone
        TabOrder = 0
        Visible = False
        object Label2: TLabel
          Left = 135
          Top = 10
          Width = 57
          Height = 13
          Caption = 'PCS'#25968#37327#65306
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 0
          Top = 11
          Width = 57
          Height = 13
          Caption = 'PNL'#25968#37327#65306
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object edtPCS: TEdit
          Left = 188
          Top = 7
          Width = 77
          Height = 21
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          TabOrder = 1
          OnKeyPress = edtPCSKeyPress
        end
        object edtPNL: TEdit
          Left = 54
          Top = 7
          Width = 77
          Height = 21
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          TabOrder = 0
          OnKeyPress = edtPCSKeyPress
        end
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 480
      Width = 974
      Height = 203
      Align = alClient
      TabOrder = 3
      object DBGridEh2: TDBGridEh
        Left = 273
        Top = 1
        Width = 700
        Height = 201
        Align = alClient
        DataSource = DM.dsOut
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        PopupMenu = pm1
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnKeyDown = DBGridEh1KeyDown
        Columns = <
          item
            Checkboxes = True
            EditButtons = <>
            FieldName = 'IsSelected'
            Footers = <>
            KeyList.Strings = (
              '1'
              '0')
            Title.Alignment = taCenter
            Title.Caption = #36873#20013
            Width = 28
          end
          item
            EditButtons = <>
            FieldName = 'RKEY'
            Footers = <>
            Title.Alignment = taCenter
            Visible = False
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'WORK_ORDER_NUMBER'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #22806#23618#20316#19994#21333#21495
            Width = 110
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'MANU_PART_NUMBER'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #26412#21378#32534#21495
            Width = 100
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'MANU_PART_DESC'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #23458#25143#22411#21495
            Width = 120
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'ENT_DATETIME'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #25237#20135#26085#26399
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'QUAN_SCH'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #35745#21010'PCS'#25968#37327
            Width = 75
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'PANELS'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #35745#21010'PNL'#25968#37327
            Width = 75
          end>
      end
      object Panel6: TPanel
        Left = 1
        Top = 1
        Width = 272
        Height = 201
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object TreeView1: TTreeView
          Left = 0
          Top = 0
          Width = 272
          Height = 201
          Align = alClient
          Indent = 19
          TabOrder = 0
        end
      end
    end
  end
  object pm1: TPopupMenu
    OnPopup = pm1Popup
    Left = 284
    Top = 523
    object N1: TMenuItem
      Caption = #20851#38381#20316#19994#21333
      Visible = False
      OnClick = N1Click
    end
  end
end
