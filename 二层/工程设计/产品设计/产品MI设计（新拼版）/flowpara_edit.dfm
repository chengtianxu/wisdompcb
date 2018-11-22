object Form_flowpara: TForm_flowpara
  Left = 415
  Top = 126
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #24037#24207#21046#31243#21442#25968#36755#20837
  ClientHeight = 679
  ClientWidth = 908
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
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
    Width = 908
    Height = 249
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 343
      Top = 57
      Width = 59
      Height = 13
      Caption = #24403#21069#27493#39588':'
    end
    object Label2: TLabel
      Left = 343
      Top = 5
      Width = 59
      Height = 13
      Caption = #24037#24207#20195#30721':'
    end
    object DBText1: TDBText
      Left = 494
      Top = 4
      Width = 49
      Height = 13
      AutoSize = True
      DataField = 'DEPT_NAME'
      DataSource = DM.DataSource4
    end
    object Label3: TLabel
      Left = 16
      Top = 7
      Width = 59
      Height = 13
      Caption = #26412#21378#32534#21495':'
    end
    object DBText2: TDBText
      Left = 197
      Top = 7
      Width = 49
      Height = 13
      AutoSize = True
      DataField = 'MANU_PART_DESC'
      DataSource = DM.DataSource2
    end
    object Label4: TLabel
      Left = 174
      Top = 30
      Width = 59
      Height = 13
      Caption = #24037#20855#29256#26412':'
    end
    object Label5: TLabel
      Left = 343
      Top = 30
      Width = 59
      Height = 13
      Caption = #20135#20986#31995#25968':'
    end
    object Label6: TLabel
      Left = 0
      Top = 30
      Width = 72
      Height = 13
      Caption = #26087#24037#20855#29256#26412':'
    end
    object Label7: TLabel
      Left = 12
      Top = 58
      Width = 59
      Height = 13
      Caption = #21152#24037#25351#31034':'
    end
    object DBEdit1: TDBEdit
      Left = 404
      Top = 53
      Width = 52
      Height = 21
      Color = cl3DLight
      DataField = 'STEP_NUMBER'
      DataSource = DM.DataSource4
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      ReadOnly = True
      TabOrder = 8
    end
    object DBEdit2: TDBEdit
      Left = 404
      Top = 1
      Width = 84
      Height = 21
      Color = cl3DLight
      DataField = 'DEPT_CODE'
      DataSource = DM.DataSource4
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 76
      Top = 3
      Width = 114
      Height = 21
      Color = cl3DLight
      DataField = 'MANU_PART_NUMBER'
      DataSource = DM.DataSource2
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit4: TDBEdit
      Left = 236
      Top = 26
      Width = 84
      Height = 21
      DataField = 'tooling_rev'
      DataSource = DM.DataSource4
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      TabOrder = 3
    end
    object DBMemo1: TDBMemo
      Left = 0
      Top = 86
      Width = 908
      Height = 106
      Align = alBottom
      DataField = 'DEF_ROUT_INST'
      DataSource = DM.DataSource4
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      MaxLength = 400
      ScrollBars = ssVertical
      TabOrder = 10
    end
    object DBNavigator1: TDBNavigator
      Left = 473
      Top = 51
      Width = 188
      Height = 25
      DataSource = DM.DataSource4
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 6
      OnClick = DBNavigator1Click
    end
    object DBEdit5: TDBEdit
      Left = 404
      Top = 26
      Width = 52
      Height = 21
      DataField = 'OUTP_SPFC'
      DataSource = DM.DataSource4
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      TabOrder = 4
    end
    object DBCheckBox1: TDBCheckBox
      Left = 496
      Top = 29
      Width = 49
      Height = 17
      Caption = #36807#25968
      Color = clBtnFace
      DataField = 'BARCODE_ENTRY_FLAG'
      DataSource = DM.DataSource4
      Enabled = False
      ParentColor = False
      ReadOnly = True
      TabOrder = 5
      ValueChecked = 'Y'
      ValueUnchecked = 'N'
    end
    object CheckBox1: TCheckBox
      Left = 193
      Top = 57
      Width = 143
      Height = 17
      Caption = #21046#31243#21442#25968#20998#27493#39588#26174#31034
      Checked = True
      State = cbChecked
      TabOrder = 9
      OnClick = CheckBox1Click
    end
    object DBEdit6: TDBEdit
      Left = 75
      Top = 26
      Width = 84
      Height = 21
      Color = cl3DLight
      DataField = 'tool_old_rev'
      DataSource = DM.DataSource4
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      ReadOnly = True
      TabOrder = 2
    end
    object BitBtn2: TBitBtn
      Left = 75
      Top = 52
      Width = 75
      Height = 25
      Caption = #25991#24211
      TabOrder = 7
      OnClick = BitBtn2Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADA000000000000ADAD0FFFFFFFFFF0DADA0F00F00000F0ADAD0FFFFFFFFFF0
        DADA0F00F00000F0ADAD0FFFFFFFFFF0DADA0FFFFFFF0FF0ADAD0FF0FFF080F0
        DAD40F080F0808000D440FF08080808880440000080808888844DADAD0808888
        8844ADADAD0888888044DADADAD000000A44ADADADADADADADAD}
    end
    object pnl1: TPanel
      Left = 0
      Top = 192
      Width = 908
      Height = 57
      Align = alBottom
      TabOrder = 11
      object lbl1: TLabel
        Left = 1
        Top = 1
        Width = 25
        Height = 55
        Align = alLeft
        AutoSize = False
        Caption = #31561#32423#25351#31034
        WordWrap = True
      end
      object mmograde_note: TDBMemo
        Left = 26
        Top = 1
        Width = 881
        Height = 55
        Align = alClient
        DataField = 'grade_note'
        DataSource = DM.DataSource4
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 640
    Width = 908
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 338
      Top = 9
      Width = 75
      Height = 27
      Caption = #30830#23450
      TabOrder = 1
      OnClick = BitBtn1Click
    end
    object BitBtn3: TBitBtn
      Left = 22
      Top = 6
      Width = 57
      Height = 30
      Hint = #20174#24037#24207#20195#30721#20013#21462#26368#26032#21046#31243#21442#25968
      Caption = #26356#26032
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BitBtn3Click
      Glyph.Data = {
        BE060000424DBE06000000000000360400002800000024000000120000000100
        0800000000008802000000000000000000000001000000000000000000000000
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
        0404040404040303030303030303030303FFF8F8F8F8F8F803FF030303030302
        0403030402020202020204040303030303F8F8FF03F8030303030303F8F8FF03
        030303020204040202020202020202020403030303F8FFF8F80303FFFFFFFFFF
        0303F8FF030303020202020202FAFAFAFAFA02020204030303F8FF030303FFF8
        F8F8F8F8FF0303F8FF03030202020202FA0303030303FA020202040303F8FF03
        03FFF80303030303F8FF0303F8FF03020202020203030303030303FA02020403
        03F8FF0303F803030303030303F8FF03F8FF03020202020202030303030303FA
        0404040303F8FFFFFFFFF8FF0303030303F8F8F8F80303FAFAFAFAFAFAFA0303
        030303030303030303F8F8F8F8F8F8F803030303030303030303030303030303
        030303030303030303030303030303030303030303030303FFFFFFFFFFFF0303
        030303030303030303030404040404040303FFFFFFFF030303030303F8F8F8F8
        F8F803FA040404030303030303FA02020202020403F8F8F8F8FF0303030303F8
        FF03030303F803FA02020403030303030303FA020202020403F8FF03F8FF0303
        03030303F803030303F80303FA0202040303030303040402020202040303F803
        03F8FFFFFFFFFFF8F803030303F80303FA020202040404040402020202020204
        0303F8FF0303F8F8F8F8F8030303FFFF03F8030303FA02020202020202020202
        FAFA0204030303F8FFFF030303030303FFFFF8F8FFF803030303FAFA02020202
        0202FAFA0303FA0303030303F8F8FFFFFFFFFFFFF8F80303F803030303030303
        FAFAFAFAFAFA030303030303030303030303F8F8F8F8F8F80303030303030303
        0303030303030303030303030303030303030303030303030303030303030303
        0303}
      NumGlyphs = 2
    end
    object btnBom: TBitBtn
      Left = 88
      Top = 6
      Width = 75
      Height = 31
      Caption = #29983#25104'BOM'
      TabOrder = 2
      OnClick = btnBomClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 249
    Width = 908
    Height = 391
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object pgc1: TPageControl
      Left = 0
      Top = 0
      Width = 908
      Height = 391
      ActivePage = tsParam
      Align = alClient
      TabOrder = 0
      OnChange = pgc1Change
      object tsParam: TTabSheet
        Caption = #24037#24207#21442#25968
        object DBGrid1: TDBGrid
          Left = 0
          Top = 0
          Width = 900
          Height = 363
          Hint = #35831#27880#24847#24178#33180#20026#36127#29255#26102#65292#30005#38208#21402#24230#20540#26159#21542#22635#20889#27491#30830#65281
          Align = alClient
          DataSource = DM.DataSource5
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ParentShowHint = False
          PopupMenu = PopupMenu1
          ShowHint = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          OnCellClick = DBGrid1CellClick
          OnColExit = DBGrid1ColExit
          OnDrawColumnCell = DBGrid1DrawColumnCell
          OnKeyDown = DBGrid1KeyDown
          OnKeyPress = DBGrid1KeyPress
          Columns = <
            item
              Color = cl3DLight
              Expanded = False
              FieldName = 'step_number'
              ReadOnly = True
              Width = 29
              Visible = True
            end
            item
              Color = cl3DLight
              Expanded = False
              FieldName = 'PARAMETER_NAME'
              ReadOnly = True
              Visible = True
            end
            item
              Color = cl3DLight
              Expanded = False
              FieldName = 'PARAMETER_DESC'
              ReadOnly = True
              Width = 80
              Visible = True
            end
            item
              Color = cl3DLight
              Expanded = False
              FieldName = 'UNIT_NAME'
              ReadOnly = True
              Width = 40
              Visible = True
            end
            item
              Color = cl3DLight
              Expanded = False
              FieldName = 'DATATYPE'
              ReadOnly = True
              Width = 49
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PARAMETER_VALUE'
              Width = 140
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TaskLowLimt'
              Title.Caption = #35268#33539#19979#38480
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TaskTopLimt'
              Title.Caption = #35268#33539#19978#38480
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'InnerLowLimt'
              Title.Caption = #20869#25511#19979#38480
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'InnerTopLimt'
              Title.Caption = #20869#25511#19978#38480
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SpecialNote'
              Title.Caption = #29305#21035#35828#26126
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Doc_Flag'
              PickList.Strings = (
                'Y'
                'N')
              Width = 28
              Visible = True
            end
            item
              ButtonStyle = cbsNone
              Expanded = False
              FieldName = 'after_flag'
              PickList.Strings = (
                'Y'
                'N')
              ReadOnly = True
              Width = 28
              Visible = True
            end
            item
              ButtonStyle = cbsNone
              Expanded = False
              FieldName = 'flow_spfc_flag'
              PickList.Strings = (
                'Y'
                'N')
              ReadOnly = True
              Width = 28
              Visible = True
            end
            item
              ButtonStyle = cbsNone
              Expanded = False
              FieldName = 'seq_no'
              ReadOnly = True
              Width = 28
              Visible = True
            end>
        end
      end
      object tsBom: TTabSheet
        Caption = 'BOM'
        ImageIndex = 1
        object ehBOM: TDBGridEh
          Left = 0
          Top = 0
          Width = 900
          Height = 363
          Align = alClient
          DataSource = DM.ds26
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -13
          FooterFont.Name = #23435#20307
          FooterFont.Style = []
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          PopupMenu = pm1
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          OnCellClick = ehBOMCellClick
          Columns = <
            item
              EditButtons = <>
              FieldName = 'ROUTE_STEP_NO'
              Footers = <>
              Width = 45
            end
            item
              EditButtons = <>
              FieldName = 'DEPT_NAME'
              Footers = <>
              Width = 75
            end
            item
              AlwaysShowEditButton = True
              AutoDropDown = True
              ButtonStyle = cbsEllipsis
              DropDownBox.Columns = <
                item
                end>
              EditButtons = <>
              FieldName = 'BOM_NAME'
              Footers = <>
              Width = 101
              OnEditButtonClick = ehBOMColumns0EditButtonClick
            end
            item
              AlwaysShowEditButton = True
              ButtonStyle = cbsEllipsis
              EditButtons = <>
              FieldName = 'INV_PART_NUMBER'
              Footers = <>
              Width = 139
              OnEditButtonClick = ehBOMColumns3EditButtonClick
            end
            item
              EditButtons = <>
              FieldName = 'INV_NAME'
              Footers = <>
              Width = 104
            end
            item
              EditButtons = <>
              FieldName = 'INV_DESCRIPTION'
              Footers = <>
              Width = 176
            end
            item
              AlwaysShowEditButton = True
              ButtonStyle = cbsEllipsis
              EditButtons = <>
              FieldName = 'ABBR_NAME'
              Footers = <>
              Width = 100
              OnEditButtonClick = ehBOMColumns4EditButtonClick
            end
            item
              EditButtons = <>
              FieldName = 'QTY_BOM'
              Footers = <>
              Width = 108
            end
            item
              EditButtons = <>
              FieldName = 'UNIT_CODE'
              Footers = <>
              Width = 55
            end
            item
              EditButtons = <>
              FieldName = 'DOC_FLAG'
              Footers = <>
              Width = 58
            end
            item
              EditButtons = <>
              FieldName = 'VENDOR'
              Footers = <>
              Width = 96
            end>
        end
      end
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 32
    Top = 379
    object N1: TMenuItem
      Caption = #26032#22686
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #25554#20837
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #21024#38500
      OnClick = N3Click
    end
  end
  object pm1: TPopupMenu
    Left = 516
    Top = 409
    object N4: TMenuItem
      Caption = #26032#22686#26448#26009
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = #21024#38500#26448#26009
      OnClick = N5Click
    end
  end
end
