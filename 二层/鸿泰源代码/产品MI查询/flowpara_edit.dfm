object Form_flowpara: TForm_flowpara
  Left = 276
  Top = 131
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #24037#24207#21046#31243#21442#25968#36755#20837
  ClientHeight = 581
  ClientWidth = 653
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 653
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
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 404
      Top = 1
      Width = 84
      Height = 21
      Color = cl3DLight
      DataField = 'DEPT_CODE'
      DataSource = DM.DataSource4
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 76
      Top = 3
      Width = 114
      Height = 21
      Color = cl3DLight
      DataField = 'MANU_PART_NUMBER'
      DataSource = DM.DataSource2
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 236
      Top = 26
      Width = 84
      Height = 21
      DataField = 'tooling_rev'
      DataSource = DM.DataSource4
      TabOrder = 3
    end
    object DBMemo1: TDBMemo
      Left = 0
      Top = 86
      Width = 653
      Height = 106
      Align = alBottom
      DataField = 'DEF_ROUT_INST'
      DataSource = DM.DataSource4
      ScrollBars = ssVertical
      TabOrder = 4
    end
    object DBNavigator1: TDBNavigator
      Left = 465
      Top = 51
      Width = 188
      Height = 25
      DataSource = DM.DataSource4
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 5
      OnClick = DBNavigator1Click
    end
    object DBEdit5: TDBEdit
      Left = 404
      Top = 26
      Width = 52
      Height = 21
      DataField = 'OUTP_SPFC'
      DataSource = DM.DataSource4
      TabOrder = 6
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
      TabOrder = 7
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
      TabOrder = 8
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
      ReadOnly = True
      TabOrder = 9
    end
    object BitBtn2: TBitBtn
      Left = 75
      Top = 52
      Width = 75
      Height = 25
      Caption = #25991#24211
      TabOrder = 10
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
      Width = 653
      Height = 57
      Align = alBottom
      TabOrder = 11
      object lbl1: TLabel
        Left = 5
        Top = 2
        Width = 25
        Height = 57
        AutoSize = False
        Caption = #31561#32423#25351#31034
        WordWrap = True
      end
      object dbmmograde_note: TDBMemo
        Left = 27
        Top = 1
        Width = 625
        Height = 55
        Align = alRight
        DataField = 'grade_note'
        DataSource = DM.DataSource4
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 542
    Width = 653
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 281
      Top = 9
      Width = 75
      Height = 27
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 249
    Width = 653
    Height = 293
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 653
      Height = 293
      Align = alClient
      DataSource = DM.DataSource5
      PopupMenu = PopupMenu1
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
          Width = 117
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
          Width = 167
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Doc_Flag'
          PickList.Strings = (
            'Y'
            'N')
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'after_flag'
          PickList.Strings = (
            'Y'
            'N')
          Width = 36
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'flow_spfc_flag'
          PickList.Strings = (
            'Y'
            'N')
          Width = 32
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'seq_no'
          Width = 30
          Visible = True
        end>
    end
    object DBComboBox1: TDBComboBox
      Left = 329
      Top = 19
      Width = 168
      Height = 21
      DataField = 'PARAMETER_VALUE'
      DataSource = DM.DataSource5
      ItemHeight = 13
      TabOrder = 1
      Visible = False
      OnKeyDown = DBComboBox1KeyDown
      OnKeyPress = DBComboBox1KeyPress
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 224
    Top = 371
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
end
