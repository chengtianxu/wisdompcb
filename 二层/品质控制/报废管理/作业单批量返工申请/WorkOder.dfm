object Frm_WorkOder: TFrm_WorkOder
  Left = 333
  Top = 217
  BorderStyle = bsSingle
  Caption = #36873#25321#30456#20851#36820#24037#20316#19994#21333
  ClientHeight = 406
  ClientWidth = 655
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
  object Label1: TLabel
    Left = 5
    Top = 8
    Width = 52
    Height = 13
    Alignment = taRightJustify
    Caption = #20316#19994#21333#21495
  end
  object Label5: TLabel
    Left = 279
    Top = 9
    Width = 158
    Height = 13
    Caption = #25552#31034#65306#25353'Ctrl'#38190#21487#20197#22810#36873#65281
    Font.Charset = ANSI_CHARSET
    Font.Color = clFuchsia
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 372
    Width = 655
    Height = 34
    Align = alBottom
    TabOrder = 0
    object Button1: TButton
      Left = 228
      Top = 6
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 384
      Top = 5
      Width = 75
      Height = 26
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 40
    Width = 655
    Height = 332
    Align = alBottom
    DataSource = DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'WORK_ORDER_NUMBER'
        Title.Caption = #20316#19994#21333#21495
        Title.Color = clRed
        Width = 122
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUST_CODE'
        Title.Caption = #23458#25143#20195#30721
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_NUMBER'
        Title.Caption = #26412#21378#32534#21495
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_DESC'
        Title.Caption = #23458#25143#22411#21495
        Width = 146
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STEP'
        Title.Caption = #27493#39588
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEPT_NAME'
        Title.Caption = #24037#24207#21517#31216
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTY_BACKLOG'
        Title.Caption = #22312#32447#25968#37327
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PANELS'
        Title.Caption = #22312#32447'PNL'
        Width = 53
        Visible = True
      end>
  end
  object Edit1: TEdit
    Left = 63
    Top = 4
    Width = 177
    Height = 21
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 2
  end
  object BtnBrush: TBitBtn
    Left = 247
    Top = 3
    Width = 26
    Height = 22
    Hint = #21047#26032#25968#25454
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
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
  object DataSource1: TDataSource
    DataSet = DM.ADO06
    Left = 240
    Top = 160
  end
end
