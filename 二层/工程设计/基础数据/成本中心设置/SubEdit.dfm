object frmSubEdit: TfrmSubEdit
  Left = 434
  Top = 145
  Width = 737
  Height = 549
  Caption = #25104#26412#26680#31639#22522#30784#35774#32622
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
    Width = 721
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object ToolBar1: TToolBar
      Left = 0
      Top = 0
      Width = 721
      Height = 41
      ButtonHeight = 36
      ButtonWidth = 61
      Caption = 'ToolBar1'
      DisabledImages = ImageList2
      Flat = True
      Images = ImageList1
      ShowCaptions = True
      TabOrder = 0
      object btnSave: TToolButton
        Left = 0
        Top = 0
        Hint = #20445#23384#34920#21333
        Caption = #20445#23384'(&S)'
        ImageIndex = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = btnSaveClick
      end
      object btnCancel: TToolButton
        Left = 61
        Top = 0
        Hint = #25918#24323#32534#36753#20869#23481
        Caption = #21462#28040'(&C)'
        ImageIndex = 3
        ParentShowHint = False
        ShowHint = True
        Visible = False
        OnClick = btnCancelClick
      end
      object btnExit: TToolButton
        Left = 122
        Top = 0
        Hint = #36864#20986#30028#38754
        Caption = #36864#20986'(&E)'
        ImageIndex = 4
        ParentShowHint = False
        ShowHint = True
        OnClick = btnExitClick
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 721
    Height = 470
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 721
      Height = 470
      ActivePage = TabSheet3
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = #22522#26412#36164#26009
        object Label1: TLabel
          Left = 104
          Top = 32
          Width = 59
          Height = 13
          Caption = #24037#24207#20195#30721':'
        end
        object Label2: TLabel
          Left = 104
          Top = 64
          Width = 59
          Height = 13
          Caption = #24037#24207#21517#31216':'
        end
        object Label3: TLabel
          Left = 130
          Top = 96
          Width = 33
          Height = 13
          Caption = #37096#38376':'
        end
        object Label46: TLabel
          Left = 104
          Top = 140
          Width = 164
          Height = 13
          Alignment = taRightJustify
          Caption = #20316#19994#21333#20801#35768#20572#30041#26102#38388'('#23567#26102'):'
        end
        object DBEdit1: TDBEdit
          Left = 168
          Top = 24
          Width = 113
          Height = 21
          DataField = 'DEPT_CODE'
          DataSource = dmCon.dsMaster
          Enabled = False
          ImeName = #20013#25991' ('#31616#20307') - '#29579#30721#20116#31508#22411'86'#29256
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 168
          Top = 56
          Width = 177
          Height = 21
          DataField = 'DEPT_NAME'
          DataSource = dmCon.dsMaster
          Enabled = False
          ImeName = #20013#25991' ('#31616#20307') - '#29579#30721#20116#31508#22411'86'#29256
          TabOrder = 1
        end
        object edtDeptCode: TEdit
          Left = 168
          Top = 89
          Width = 177
          Height = 21
          Enabled = False
          ImeName = #20013#25991' ('#31616#20307') - '#29579#30721#20116#31508#22411'86'#29256
          TabOrder = 2
        end
        object DBEdit4: TDBEdit
          Left = 281
          Top = 136
          Width = 55
          Height = 21
          DataField = 'WO_DAYS'
          DataSource = dmCon.dsMaster
          Enabled = False
          ImeName = #20013#25991' ('#31616#20307') - '#29579#30721#20116#31508#22411'86'#29256
          TabOrder = 3
        end
        object GroupBox2: TGroupBox
          Left = 104
          Top = 160
          Width = 441
          Height = 113
          Enabled = False
          TabOrder = 4
          object DBCheckBox1: TDBCheckBox
            Left = 25
            Top = 24
            Width = 161
            Height = 17
            Caption = #36807#25968
            DataField = 'BARCODE_ENTRY_FLAG'
            DataSource = dmCon.dsMaster
            TabOrder = 0
            ValueChecked = 'Y'
            ValueUnchecked = 'False'
          end
          object DBCheckBox2: TDBCheckBox
            Left = 25
            Top = 43
            Width = 161
            Height = 17
            Caption = #20801#35768#25286#20998#20316#19994#21333
            DataField = 'Permit_split_lot'
            DataSource = dmCon.dsMaster
            TabOrder = 1
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox3: TDBCheckBox
            Left = 25
            Top = 62
            Width = 161
            Height = 17
            Caption = #36807#26399
            DataField = 'ACTIVE_FLAG'
            DataSource = dmCon.dsMaster
            TabOrder = 2
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox4: TDBCheckBox
            Left = 25
            Top = 82
            Width = 161
            Height = 17
            Caption = #35745#21010
            DataField = 'SCHEDULE_FLAG'
            DataSource = dmCon.dsMaster
            TabOrder = 3
            ValueChecked = 'Y'
            ValueUnchecked = 'False'
          end
          object DBCheckBox8: TDBCheckBox
            Left = 201
            Top = 82
            Width = 161
            Height = 17
            Caption = #22806#37096#36164#28304
            DataField = 'OUT_SOURCE'
            DataSource = dmCon.dsMaster
            TabOrder = 4
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox7: TDBCheckBox
            Left = 201
            Top = 62
            Width = 161
            Height = 17
            Caption = #20801#35768#19981#26174#31034#22312'MI'
            DataField = 'VISIBLE_IN_MI'
            DataSource = dmCon.dsMaster
            TabOrder = 5
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox6: TDBCheckBox
            Left = 201
            Top = 43
            Width = 200
            Height = 17
            Caption = #22312'WIP'#34920#20013#38656#29305#21035#26631#27880
            DataField = 'SPEC_FLAG'
            DataSource = dmCon.dsMaster
            TabOrder = 6
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox5: TDBCheckBox
            Left = 201
            Top = 24
            Width = 216
            Height = 17
            Caption = #22312'WIP'#34920#20013#22266#23450#29992'PCS'#20316#32479#35745#21333#20301
            DataField = 'PCS_AS_UNIT'
            DataSource = dmCon.dsMaster
            TabOrder = 7
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      object TabSheet5: TTabSheet
        Caption = #25104#26412#20013#24515
        ImageIndex = 4
        object GroupBox4: TGroupBox
          Left = 8
          Top = 8
          Width = 617
          Height = 337
          TabOrder = 0
          object Label4: TLabel
            Left = 80
            Top = 96
            Width = 85
            Height = 13
            Caption = #25152#23646#25104#26412#20013#24515':'
          end
          object Label5: TLabel
            Left = 80
            Top = 126
            Width = 85
            Height = 13
            Caption = #25104#26412#20013#24515#21517#31216':'
          end
          object SpeedButton1: TSpeedButton
            Left = 291
            Top = 88
            Width = 23
            Height = 22
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
              333333777777777F33333330B00000003333337F7777777F3333333000000000
              333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
              333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
              03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
              03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
              3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
              333333333377F7F33333333333330F03333333333337F7F33333333333330B03
              3333333333373733333333333333303333333333333373333333}
            NumGlyphs = 2
            OnClick = SpeedButton1Click
          end
          object DBCheckBox9: TDBCheckBox
            Left = 168
            Top = 56
            Width = 121
            Height = 17
            Caption = #26159#21542#25104#26412#26680#31639
            DataField = 'IS_COST_DEPT'
            DataSource = dmCon.dsMaster
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object edt_Cost_Dept_Code: TEdit
            Left = 168
            Top = 88
            Width = 121
            Height = 21
            ReadOnly = True
            TabOrder = 1
          end
          object DBEdit5: TDBEdit
            Left = 168
            Top = 120
            Width = 193
            Height = 21
            DataField = 'cost_name'
            DataSource = dmCon.dsMaster
            TabOrder = 2
            OnEnter = DBEdit5Enter
          end
          object GroupBox1: TGroupBox
            Left = 24
            Top = 176
            Width = 561
            Height = 57
            Caption = #36130#21153#35774#32622
            TabOrder = 3
            object Label6: TLabel
              Left = 56
              Top = 28
              Width = 85
              Height = 13
              Caption = #39046#26009#20250#35745#31185#30446':'
            end
            object SpeedButton2: TSpeedButton
              Left = 267
              Top = 20
              Width = 23
              Height = 22
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
                333333777777777F33333330B00000003333337F7777777F3333333000000000
                333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
                333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
                03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
                03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
                3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
                333333333377F7F33333333333330F03333333333337F7F33333333333330B03
                3333333333373733333333333333303333333333333373333333}
              NumGlyphs = 2
              OnClick = SpeedButton2Click
            end
            object labelAcctName: TLabel
              Left = 296
              Top = 24
              Width = 7
              Height = 13
              Caption = ' '
            end
            object edtAcctNo: TEdit
              Left = 144
              Top = 20
              Width = 121
              Height = 21
              TabOrder = 0
            end
          end
          object DBCheckBox10: TDBCheckBox
            Left = 368
            Top = 56
            Width = 209
            Height = 17
            Caption = #25353#23454#38469#39046#29992#26448#26009#26680#31639#25104#26412
            DataField = 'Inst_Flag'
            DataSource = dmCon.dsMaster
            TabOrder = 4
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = #19968#31867#21407#26448#26009
        ImageIndex = 1
        object Label7: TLabel
          Left = 8
          Top = 7
          Width = 60
          Height = 13
          Caption = 'BOM'#19968#35272#34920
        end
        object DBGridEh1: TDBGridEh
          Left = 8
          Top = 27
          Width = 705
          Height = 222
          DataSource = dmCon.dsMainMatrl
          FooterColor = clWindow
          FooterFont.Charset = ANSI_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -13
          FooterFont.Name = #23435#20307
          FooterFont.Style = []
          PopupMenu = PopupMenu1
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          OnKeyDown = DBGridEh1KeyDown
          Columns = <
            item
              ButtonStyle = cbsNone
              Color = clBtnFace
              EditButtons = <>
              FieldName = 'Mtrl_Group_Name'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #26448#26009#31867#21035
            end
            item
              ButtonStyle = cbsNone
              Color = clBtnFace
              EditButtons = <>
              FieldName = 'Mtrl_Group_Desc'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #31867#21035#25551#36848
            end
            item
              EditButtons = <>
              FieldName = 'BOM_NAME'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = 'BOM'#21517#31216
              Width = 89
            end
            item
              EditButtons = <>
              FieldName = 'DOC_FLAG'
              Footers = <>
              KeyList.Strings = (
                'Y'
                'N')
              PickList.Strings = (
                'Y'
                'N')
              Title.Alignment = taCenter
              Title.Caption = #25171#21360
              Width = 56
            end
            item
              EditButtons = <>
              FieldName = 'SEQ_NO'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #24207#21495
              Width = 50
            end
            item
              EditButtons = <>
              FieldName = 'required'
              Footers = <>
              KeyList.Strings = (
                'Y'
                'N')
              PickList.Strings = (
                'Y'
                'N')
              Title.Alignment = taCenter
              Title.Caption = #24517#36873
              Width = 47
            end>
        end
        object GroupBox3: TGroupBox
          Left = 8
          Top = 259
          Width = 705
          Height = 187
          Caption = #26448#26009#26631#20934#29992#37327#20844#24335#35774#32622
          TabOrder = 1
          object Label8: TLabel
            Left = 208
            Top = 24
            Width = 65
            Height = 13
            Caption = #24037#31243#34920#21333#65306
          end
          object SpeedButton15: TSpeedButton
            Left = 488
            Top = 16
            Width = 113
            Height = 22
            Caption = #20840#23616#21442#25968
            OnClick = SpeedButton15Click
          end
          object SpeedButton14: TSpeedButton
            Left = 488
            Top = 44
            Width = 49
            Height = 22
            Caption = #39564#35777
            OnClick = SpeedButton14Click
          end
          object SpeedButton13: TSpeedButton
            Left = 552
            Top = 44
            Width = 49
            Height = 22
            Caption = #28165#38500
            OnClick = SpeedButton13Click
          end
          object SpeedButton3: TSpeedButton
            Left = 208
            Top = 44
            Width = 23
            Height = 22
            Caption = '+'
            OnClick = SpeedButton3Click
          end
          object SpeedButton4: TSpeedButton
            Left = 231
            Top = 44
            Width = 23
            Height = 22
            Caption = '-'
            OnClick = SpeedButton3Click
          end
          object SpeedButton5: TSpeedButton
            Left = 254
            Top = 44
            Width = 22
            Height = 22
            Caption = '*'
            OnClick = SpeedButton3Click
          end
          object SpeedButton6: TSpeedButton
            Left = 276
            Top = 44
            Width = 22
            Height = 22
            Caption = '/'
            OnClick = SpeedButton3Click
          end
          object SpeedButton7: TSpeedButton
            Left = 298
            Top = 44
            Width = 22
            Height = 22
            Caption = '='
            OnClick = SpeedButton3Click
          end
          object SpeedButton8: TSpeedButton
            Left = 320
            Top = 44
            Width = 22
            Height = 22
            Caption = '<'
            OnClick = SpeedButton3Click
          end
          object SpeedButton9: TSpeedButton
            Left = 342
            Top = 44
            Width = 22
            Height = 22
            Caption = '>'
            OnClick = SpeedButton3Click
          end
          object SpeedButton10: TSpeedButton
            Left = 364
            Top = 44
            Width = 22
            Height = 22
            Caption = '<>'
            OnClick = SpeedButton3Click
          end
          object SpeedButton11: TSpeedButton
            Left = 386
            Top = 44
            Width = 22
            Height = 22
            Caption = '<='
            OnClick = SpeedButton3Click
          end
          object SpeedButton12: TSpeedButton
            Left = 408
            Top = 44
            Width = 22
            Height = 22
            Caption = '>='
            OnClick = SpeedButton3Click
          end
          object SpeedButton16: TSpeedButton
            Left = 430
            Top = 44
            Width = 22
            Height = 22
            Caption = 'IF'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            OnClick = SpeedButton3Click
          end
          object SpeedButton17: TSpeedButton
            Left = 452
            Top = 44
            Width = 22
            Height = 22
            Caption = '()'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            OnClick = SpeedButton3Click
          end
          object Label9: TLabel
            Left = 9
            Top = 24
            Width = 85
            Height = 13
            Caption = #23616#37096#21046#31243#21442#25968':'
          end
          object Label17: TLabel
            Left = 10
            Top = 50
            Width = 80
            Height = 13
            Alignment = taRightJustify
            Caption = #23616#37096'BOM'#21442#25968':'
          end
          object Combobox3: TComboBox
            Left = 272
            Top = 16
            Width = 201
            Height = 21
            ItemHeight = 0
            TabOrder = 0
            OnSelect = ComboBox1Select
          end
          object Memo1: TDBMemo
            Left = 8
            Top = 74
            Width = 689
            Height = 103
            DataField = 'FORMULA'
            DataSource = dmCon.dsMainMatrl
            TabOrder = 1
          end
          object ComboBox1: TComboBox
            Left = 97
            Top = 16
            Width = 97
            Height = 21
            Style = csDropDownList
            ItemHeight = 0
            TabOrder = 2
            OnSelect = ComboBox1Select
          end
          object ComboBox2: TComboBox
            Left = 97
            Top = 44
            Width = 97
            Height = 21
            Style = csDropDownList
            ItemHeight = 0
            TabOrder = 3
            OnSelect = ComboBox1Select
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = #20108#31867#21407#26448#26009
        ImageIndex = 2
        object Label11: TLabel
          Left = 8
          Top = 7
          Width = 60
          Height = 13
          Caption = 'BOM'#19968#35272#34920
        end
        object DBGrid1: TDBGrid
          Left = 2
          Top = 24
          Width = 705
          Height = 413
          DataSource = dmCon.dsSecondaryMatrl
          PopupMenu = PopupMenu2
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          OnKeyDown = DBGrid1KeyDown
          Columns = <
            item
              Color = clBtnFace
              Expanded = False
              FieldName = 'GroupName'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = #26448#26009#31867#21035
              Width = 95
              Visible = True
            end
            item
              Color = clBtnFace
              Expanded = False
              FieldName = 'INV_PART_NUMBER'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = #26448#26009#32534#21495
              Width = 166
              Visible = True
            end
            item
              Color = clBtnFace
              Expanded = False
              FieldName = 'INV_PART_DESCRIPTION'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = #26448#26009#21517#31216
              Width = 186
              Visible = True
            end
            item
              Color = clBtnFace
              Expanded = False
              FieldName = 'UnitCode'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = #21333#20301
              Width = 63
              Visible = True
            end
            item
              ButtonStyle = cbsNone
              Expanded = False
              FieldName = 'QTY_BOM_PER_SQFT'
              Title.Alignment = taCenter
              Title.Caption = #26631#20934#28040#32791'/'#29983#20135#24179#26041#31859
              Visible = True
            end>
        end
      end
      object TabSheet6: TTabSheet
        Caption = #21046#36896#36153#29992
        ImageIndex = 5
        object GroupBox5: TGroupBox
          Left = 48
          Top = 40
          Width = 609
          Height = 377
          Caption = #35774#32622#21046#36896#36153#29992'('#21333#20301':'#20803'/'#24179#26041#31859')'
          TabOrder = 0
          object Label10: TLabel
            Left = 56
            Top = 50
            Width = 52
            Height = 13
            Caption = #30452#25509#20154#24037
          end
          object Label12: TLabel
            Left = 56
            Top = 97
            Width = 52
            Height = 13
            Caption = #35774#22791#25240#26087
          end
          object Label13: TLabel
            Left = 56
            Top = 146
            Width = 52
            Height = 13
            Caption = #27700#30005#20854#23427
          end
          object lbl1: TLabel
            Left = 30
            Top = 188
            Width = 78
            Height = 13
            Caption = #22806#21457#29983#20135#36153#29992
          end
          object lbl2: TLabel
            Left = 54
            Top = 233
            Width = 52
            Height = 13
            Caption = #20108#31867#26448#26009
          end
          object DBEdit3: TDBEdit
            Left = 120
            Top = 44
            Width = 385
            Height = 21
            DataField = 'OVERHEAD_FORMULA'
            DataSource = dmCon.dsMaster
            TabOrder = 0
            OnKeyPress = DBEdit3KeyPress
          end
          object DBEdit6: TDBEdit
            Left = 120
            Top = 92
            Width = 385
            Height = 21
            DataField = 'OVERHEAD2_FORMULA'
            DataSource = dmCon.dsMaster
            TabOrder = 1
            OnKeyPress = DBEdit3KeyPress
          end
          object DBEdit7: TDBEdit
            Left = 120
            Top = 140
            Width = 385
            Height = 21
            DataField = 'OVERHEAD3_FORMULA'
            DataSource = dmCon.dsMaster
            TabOrder = 2
            OnKeyPress = DBEdit3KeyPress
          end
          object edtOVERHEAD3_FORMULA: TDBEdit
            Left = 120
            Top = 182
            Width = 385
            Height = 21
            DataField = 'OVERHEAD4_FORMULA'
            DataSource = dmCon.dsMaster
            TabOrder = 3
            OnKeyPress = DBEdit3KeyPress
          end
          object edtOVERHEAD3_FORMULA1: TDBEdit
            Left = 120
            Top = 227
            Width = 385
            Height = 21
            DataField = 'OVERHEAD5_FORMULA'
            DataSource = dmCon.dsMaster
            TabOrder = 4
            OnKeyPress = DBEdit3KeyPress
          end
        end
      end
      object TabSheet4: TTabSheet
        Caption = #21046#31243#21442#25968
        ImageIndex = 3
        object DBGridEh3: TDBGridEh
          Left = 0
          Top = 0
          Width = 713
          Height = 442
          Align = alClient
          DataSource = dmCon.dsIESParams
          FooterColor = clWindow
          FooterFont.Charset = ANSI_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -13
          FooterFont.Name = #23435#20307
          FooterFont.Style = []
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          Columns = <
            item
              Color = clWhite
              EditButtons = <>
              FieldName = 'Parameter_Name'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #21442#25968#20195#30721
              Width = 59
            end
            item
              Color = clWhite
              EditButtons = <>
              FieldName = 'Parameter_Desc'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #25551#36848
              Width = 123
            end
            item
              Color = clWhite
              EditButtons = <>
              FieldName = 'DataType'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #31867#22411
            end
            item
              EditButtons = <>
              FieldName = 'TValue'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #32570#30465#20540
            end
            item
              EditButtons = <>
              FieldName = 'Doc_Flag'
              Footers = <>
              PickList.Strings = (
                'Y'
                'N')
              Title.Alignment = taCenter
              Title.Caption = 'M.I.'
              Width = 35
            end
            item
              EditButtons = <>
              FieldName = 'flow_spfc_flag'
              Footers = <>
              PickList.Strings = (
                'Y'
                'N')
              Title.Alignment = taCenter
              Title.Caption = #24037#33402
              Width = 35
            end
            item
              EditButtons = <>
              FieldName = 'outp_spfc_flag'
              Footers = <>
              PickList.Strings = (
                'Y'
                'N')
              Title.Alignment = taCenter
              Title.Caption = #20135#20986
              Width = 29
            end
            item
              EditButtons = <>
              FieldName = 'after_flag'
              Footers = <>
              PickList.Strings = (
                'Y'
                'N')
              Title.Alignment = taCenter
              Title.Caption = #20505#34917
              Width = 37
            end
            item
              EditButtons = <>
              FieldName = 'MO'
              Footers = <>
              PickList.Strings = (
                'Y'
                'N')
              Title.Alignment = taCenter
              Title.Caption = 'M.O.'
              Width = 35
            end
            item
              EditButtons = <>
              FieldName = 'formula'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #35745#31639#20844#24335
              Width = 200
            end
            item
              EditButtons = <>
              FieldName = 'SEQ_NO'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #24207#21495
              Width = 46
            end>
        end
      end
    end
  end
  object ImageList1: TImageList
    Left = 624
    Top = 393
    Bitmap = {
      494C010105000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
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
      00000000000000000000E7EFF700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E7EF
      F700E7E7E700CECECE00E7E7E700E7EFF7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7EFF700E7E7E700B5B5
      B500CE9C9C009C6363009C636300B5B5B500CECECE00E7E7E700E7EFF7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7E7E700CE9C9C009C636300CE9C
      9C00CE9C9C00FFFFFF009C6363009C9C9C009C9C9C00B5B5B500E7E7E7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C636300CE9C9C00FFCE9C00FFCE
      9C00FFCECE00FFFFFF009C63630031639C0031639C0031639C00E7EFF7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C636300FFCE9C00FFCE9C00FFCE
      9C00FFCECE00FFFFFF009C63630063CECE0063CECE00009CCE00FFFFFF00FFCE
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C636300FFCE9C00FFCE9C00FFCE
      9C00FFCECE00FFFFFF009C63630063CECE0063CEFF00319CCE00FFCECE00CE63
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C636300FFCE9C00CE9C9C00CE9C
      6300FFCECE00FFFFFF009C6363009CCECE009CCEFF00B5B5B500FF630000CE63
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C636300FFCE9C009C636300FFFF
      FF00FFCECE00FFFFFF009C6363009CCECE00C6C6C600CE630000CE630000CE63
      0000CE630000CE630000CE630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C636300FFCE9C00CE9C9C009C63
      6300FFCECE00FFFFFF009C63630000000000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C636300FFCE9C00FFCE9C00FFCE
      9C00FFCECE00FFFFFF009C63630000000000CE9C9C00CE630000CE630000CE63
      0000CE630000CE630000CE630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C636300FFCE9C00FFCE9C00FFCE
      9C00FFCECE00FFFFFF009C636300CECECE00E7EFF700CE9C9C00FF630000CE63
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C636300FFCE9C00FFCE9C00FFCE
      9C00FFCECE00FFFFFF009C6363009CCECE00000000009CCECE00FFCE9C00CE63
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C636300CE9C9C00FFCE9C00FFCE
      9C00FFCECE00FFFFFF009C636300CECECE0000000000319CCE0000000000FFCE
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600CE9C6300CE9C
      9C00CECE9C00FFFFFF009C636300009CCE00009CCE00009CCE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CECE
      CE00CE9C9C009C6363009C636300000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000009C31
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CE630000000000000000000000000000CE9C6300CE9C
      6300CE9C6300CE9C6300CE9C6300CE9C6300CE9C6300CE9C6300CE9C6300CE9C
      6300CE9C6300CE9C6300000000000000000000000000000000009C3100009C31
      00009C3100009C3100009C3100009C3100009C3100009C3100009C3100009C31
      00009C3100009C3100009C310000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C310000CE63
      00009C3100000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CE9C6300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CE9C63000000000000000000000000009C310000CE630000CE63
      00009C310000E7E7E700CE6300009C310000E7E7E700E7E7E700E7E7E7009C31
      0000CE630000CE6300009C310000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C310000CE63
      0000CE6300009C31000000000000000000000000000000000000000000000000
      000000000000CE63000000000000000000000000000000000000CE9C6300FFFF
      FF00E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700FFFFFF00CE9C63000000000000000000000000009C310000CE630000CE63
      00009C310000E7E7E700CE6300009C310000E7E7E700E7E7E700E7E7E7009C31
      0000CE630000CE6300009C310000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009C31
      0000CE6300009C31000000000000000000000000000000000000000000000000
      0000CE6300000000000000000000000000000000000000000000CE9C6300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CE9C63000000000000000000000000009C310000CE630000CE63
      00009C310000E7E7E700CE6300009C310000E7E7E700E7E7E700E7E7E7009C31
      0000CE630000CE6300009C310000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C310000CE6300009C31000000000000000000000000000000000000CE63
      00009C3100000000000000000000000000000000000000000000CE9C6300FFFF
      FF00E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700FFFFFF00CE9C63000000000000000000000000009C310000CE630000CE63
      00009C310000E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E7009C31
      0000CE630000CE6300009C310000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CE9C
      63009C3100000000000000000000000000000000000000000000000000000000
      0000000000009C310000CE6300009C3100000000000000000000CE6300009C31
      0000000000000000000000000000000000000000000000000000CE9C6300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CE9C63000000000000000000000000009C310000CE630000CE63
      0000CE6300009C3100009C3100009C3100009C3100009C3100009C310000CE63
      0000CE630000CE6300009C3100000000000000000000000000009C3100009C31
      00009C3100009C3100009C310000000000000000000000000000000000000000
      00009C310000CE9C630000000000000000000000000000000000000000000000
      000000000000000000009C310000CE6300009C310000CE6300009C3100000000
      0000000000000000000000000000000000000000000000000000CE9C6300FFFF
      FF00E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700FFFFFF00CE9C63000000000000000000000000009C310000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE6300009C3100000000000000000000000000009C3100009C31
      00009C3100009C31000000000000000000000000000000000000000000000000
      0000000000009C31000000000000000000000000000000000000000000000000
      00000000000000000000000000009C310000CE6300009C310000000000000000
      0000000000000000000000000000000000000000000000000000CE9C6300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CE9C63000000000000000000000000009C310000CE630000CE63
      00009C3100009C3100009C3100009C3100009C3100009C3100009C3100009C31
      0000CE630000CE6300009C3100000000000000000000000000009C3100009C31
      00009C3100000000000000000000000000000000000000000000000000000000
      0000000000009C31000000000000000000000000000000000000000000000000
      000000000000000000009C310000CE6300009C310000CE6300009C3100000000
      0000000000000000000000000000000000000000000000000000CE9C6300FFFF
      FF00E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700FFFFFF00CE9C63000000000000000000000000009C310000CE6300009C31
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF009C310000CE6300009C3100000000000000000000000000009C3100009C31
      0000000000009C31000000000000000000000000000000000000000000000000
      0000000000009C31000000000000000000000000000000000000000000000000
      0000000000009C310000CE6300009C3100000000000000000000CE6300009C31
      0000000000000000000000000000000000000000000000000000CE9C6300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CE9C63000000000000000000000000009C310000CE6300009C31
      0000FFFFFF009C3100009C3100009C3100009C3100009C3100009C310000FFFF
      FF009C310000CE6300009C3100000000000000000000000000009C3100000000
      000000000000000000009C3100009C3100000000000000000000000000000000
      00009C310000CE9C630000000000000000000000000000000000000000009C31
      0000CE630000CE6300009C31000000000000000000000000000000000000CE63
      00009C3100000000000000000000000000000000000000000000CE9C6300FFFF
      FF00E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700FFFFFF00CE9C6300CE9C
      6300CE9C6300CE9C63000000000000000000000000009C310000CE6300009C31
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF009C310000CE6300009C310000000000000000000000000000000000000000
      0000000000000000000000000000000000009C3100009C3100009C3100009C31
      0000CE9C630000000000000000000000000000000000000000009C310000CE63
      0000CE6300009C31000000000000000000000000000000000000000000000000
      0000CE6300009C31000000000000000000000000000000000000CE9C6300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CE9C6300E7E7
      E700CE9C6300000000000000000000000000000000009C310000E7E7E7009C31
      0000FFFFFF009C3100009C3100009C3100009C3100009C3100009C310000FFFF
      FF009C3100009C3100009C310000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C3100009C31
      00009C3100000000000000000000000000000000000000000000000000000000
      00000000000000000000CE630000000000000000000000000000CE9C6300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CE9C6300CE9C
      630000000000000000000000000000000000000000009C310000CE6300009C31
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF009C310000CE6300009C310000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CE9C6300CE9C
      6300CE9C6300CE9C6300CE9C6300CE9C6300CE9C6300CE9C6300CE9C63000000
      000000000000000000000000000000000000000000009C3100009C3100009C31
      00009C3100009C3100009C3100009C3100009C3100009C3100009C3100009C31
      00009C3100009C3100009C310000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FDFF000000000000E0FF000000000000
      801F000000000000001F000000000000001F000000000000000F000000000000
      000F000000000000000F00000000000000010000000000000101000000000000
      0101000000000000000F000000000000008F00000000000000AF000000000000
      803F000000000000E1FF000000000000FFFFFFFFFFFFFFFFEFFDC003C001FFFF
      C7FFC0038001FFFFC3FBC0038001FFFFE3F7C0038001FFFFF1E7C0038001FFE7
      F8CFC0038001C1F3FC1FC0038001C3FBFE3FC0038001C7FBFC1FC0038001CBFB
      F8CFC0038001DCF3E1E7C0038001FF07C3F3C0078001FFFFC7FDC00F8001FFFF
      FFFFC01F8001FFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object ImageList2: TImageList
    Left = 656
    Top = 393
    Bitmap = {
      494C010105000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
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
      00000000000000000000E7EFF700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E7EF
      F70000000000CECECE00E7E7E700E7EFF7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7EFF70000000000B5B5
      B5009C9C9C009C9C9C009C9C9C00B5B5B500CECECE0000000000E7EFF7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C00FFFFFF009C9C9C009C9C9C009C9C9C00B5B5B500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C009C9C9C00C6C6C600C6C6
      C600CECECE00FFFFFF009C9C9C009C9C9C009C9C9C009C9C9C00E7EFF7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C00C6C6C600C6C6C600C6C6
      C600CECECE00FFFFFF009C9C9C00C6C6C600C6C6C6009C9C9C00FFFFFF00CECE
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C00C6C6C600C6C6C600C6C6
      C600CECECE00FFFFFF009C9C9C00C6C6C600CECECE009C9C9C00CECECE009C9C
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C00C6C6C6009C9C9C009C9C
      9C00CECECE00FFFFFF009C9C9C00CECECE00CECECE00B5B5B5009C9C9C009C9C
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C00C6C6C60063636300FFFF
      FF00CECECE00FFFFFF009C9C9C00CECECE00C6C6C6009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C00C6C6C6009C9C9C006363
      6300CECECE00FFFFFF009C9C9C00E7E7E7009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C00C6C6C600C6C6C600C6C6
      C600CECECE00FFFFFF009C9C9C00E7E7E7009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C00C6C6C600C6C6C600C6C6
      C600CECECE00FFFFFF009C9C9C00CECECE00E7EFF7009C9C9C009C9C9C009C9C
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C00C6C6C600C6C6C600C6C6
      C600CECECE00FFFFFF009C9C9C00CECECE00E7E7E700CECECE00C6C6C6009C9C
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C009C9C9C00C6C6C600C6C6
      C600CECECE00FFFFFF009C9C9C00CECECE00E7E7E7009C9C9C0000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C6009C9C9C009C9C
      9C00C6C6C600FFFFFF009C9C9C009C9C9C009C9C9C009C9C9C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CECE
      CE009C9C9C009C9C9C009C9C9C00000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000009C9C
      9C00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CECECE000000000000000000000000009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C00000000000000000000000000000000009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C9C9C00CECE
      CE009C9C9C000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C9C9C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF009C9C9C000000000000000000000000009C9C9C00CECECE00CECE
      CE009C9C9C00E7E7E700CECECE009C9C9C00E7E7E700E7E7E700E7E7E7009C9C
      9C00CECECE00CECECE009C9C9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C9C9C00E7E7
      E700CECECE009C9C9C0000000000000000000000000000000000000000000000
      000000000000CECECE00000000000000000000000000000000009C9C9C00FFFF
      FF00E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700FFFFFF009C9C9C000000000000000000000000009C9C9C00CECECE00CECE
      CE009C9C9C00E7E7E700CECECE009C9C9C00E7E7E700E7E7E700E7E7E7009C9C
      9C00CECECE00CECECE009C9C9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009C9C
      9C00E7E7E7009C9C9C0000000000000000000000000000000000000000000000
      0000CECECE0000000000000000000000000000000000000000009C9C9C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF009C9C9C000000000000000000000000009C9C9C00CECECE00CECE
      CE009C9C9C00E7E7E700CECECE009C9C9C00E7E7E700E7E7E700E7E7E7009C9C
      9C00CECECE00CECECE009C9C9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C9C9C00CECECE009C9C9C0000000000000000000000000000000000CECE
      CE009C9C9C0000000000000000000000000000000000000000009C9C9C00FFFF
      FF00E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700FFFFFF009C9C9C000000000000000000000000009C9C9C00CECECE00CECE
      CE009C9C9C00E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E7009C9C
      9C00CECECE00CECECE009C9C9C00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CECE
      CE009C9C9C000000000000000000000000000000000000000000000000000000
      0000000000009C9C9C00CECECE009C9C9C000000000000000000CECECE009C9C
      9C000000000000000000000000000000000000000000000000009C9C9C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF009C9C9C000000000000000000000000009C9C9C00CECECE00CECE
      CE00CECECE009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C00CECE
      CE00CECECE00CECECE009C9C9C000000000000000000000000009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C00000000000000000000000000000000000000
      00009C9C9C00CECECE0000000000000000000000000000000000000000000000
      000000000000000000009C9C9C00CECECE009C9C9C00CECECE009C9C9C000000
      00000000000000000000000000000000000000000000000000009C9C9C00FFFF
      FF00E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700FFFFFF009C9C9C000000000000000000000000009C9C9C00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE00CECECE009C9C9C000000000000000000000000009C9C9C009C9C
      9C009C9C9C009C9C9C0000000000000000000000000000000000000000000000
      0000000000009C9C9C0000000000000000000000000000000000000000000000
      00000000000000000000000000009C9C9C00CECECE009C9C9C00000000000000
      00000000000000000000000000000000000000000000000000009C9C9C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF009C9C9C000000000000000000000000009C9C9C00CECECE00CECE
      CE009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C00CECECE00CECECE009C9C9C000000000000000000000000009C9C9C009C9C
      9C009C9C9C000000000000000000000000000000000000000000000000000000
      0000000000009C9C9C0000000000000000000000000000000000000000000000
      000000000000000000009C9C9C00CECECE009C9C9C009C9C9C009C9C9C000000
      00000000000000000000000000000000000000000000000000009C9C9C00FFFF
      FF00E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700FFFFFF009C9C9C000000000000000000000000009C9C9C00CECECE009C9C
      9C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF009C9C9C00CECECE009C9C9C000000000000000000000000009C9C9C009C9C
      9C00000000009C9C9C0000000000000000000000000000000000000000000000
      0000000000009C9C9C0000000000000000000000000000000000000000000000
      0000000000009C9C9C00CECECE009C9C9C0000000000000000009C9C9C009C9C
      9C000000000000000000000000000000000000000000000000009C9C9C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF009C9C9C000000000000000000000000009C9C9C00CECECE009C9C
      9C00FFFFFF009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C00FFFF
      FF009C9C9C00CECECE009C9C9C000000000000000000000000009C9C9C000000
      000000000000000000009C9C9C009C9C9C000000000000000000000000000000
      00009C9C9C00CECECE0000000000000000000000000000000000000000009C9C
      9C00CECECE00CECECE009C9C9C00000000000000000000000000000000009C9C
      9C009C9C9C0000000000000000000000000000000000000000009C9C9C00FFFF
      FF00E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700FFFFFF009C9C9C009C9C
      9C009C9C9C009C9C9C000000000000000000000000009C9C9C00CECECE009C9C
      9C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF009C9C9C00CECECE009C9C9C00000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C009C9C9C009C9C9C009C9C
      9C00CECECE0000000000000000000000000000000000000000009C9C9C00E7E7
      E700CECECE009C9C9C0000000000000000000000000000000000000000000000
      00009C9C9C009C9C9C00000000000000000000000000000000009C9C9C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009C9C9C000000
      00009C9C9C00000000000000000000000000000000009C9C9C00E7E7E7009C9C
      9C00FFFFFF009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C00FFFF
      FF009C9C9C009C9C9C009C9C9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CECECE009C9C
      9C00CECECE000000000000000000000000000000000000000000000000000000
      000000000000000000009C9C9C000000000000000000000000009C9C9C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009C9C9C009C9C
      9C0000000000000000000000000000000000000000009C9C9C00CECECE009C9C
      9C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF009C9C9C00CECECE009C9C9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C000000
      000000000000000000000000000000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FDFF000000000000E8FF000000000000
      A05F000000000000803F000000000000001F000000000000000F000000000000
      000F000000000000000F00000000000000010000000000000001000000000000
      0001000000000000000F000000000000000F000000000000002F000000000000
      803F000000000000E1FF000000000000FFFFFFFFFFFFFFFFEFFDC003C001FFFF
      C7FFC0038001FFFFC3FBC0038001FFFFE3F7C0038001FFFFF1E7C0038001FFE7
      F8CFC0038001C1F3FC1FC0038001C3FBFE3FC0038001C7FBFC1FC0038001CBFB
      F8CFC0038001DCF3E1E7C0038001FF07C3F3C0178001FFFFC7FDC00F8001FFFF
      FFFFC01F8001FFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 668
    Top = 145
    object N1: TMenuItem
      Caption = #22686#21152'(&N)'
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #21024#38500'(&D)'
      OnClick = N2Click
    end
  end
  object PopupMenu2: TPopupMenu
    OnPopup = PopupMenu2Popup
    Left = 572
    Top = 177
    object N5: TMenuItem
      Caption = #22797#21046
      OnClick = N5Click
    end
    object N3: TMenuItem
      Caption = #22686#21152
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #21024#38500
      OnClick = N4Click
    end
    object N6: TMenuItem
      Caption = #23548#20986
      OnClick = N6Click
    end
  end
end
