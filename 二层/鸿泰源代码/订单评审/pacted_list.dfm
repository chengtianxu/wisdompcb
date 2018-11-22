object Form6: TForm6
  Left = 242
  Top = 89
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #24050#35780#23457#35746#21333#31077#32454#20449#24687
  ClientHeight = 545
  ClientWidth = 810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 340
    Width = 810
    Height = 205
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      810
      205)
    object Label1: TLabel
      Left = 5
      Top = 32
      Width = 65
      Height = 12
      Alignment = taRightJustify
      AutoSize = False
      Caption = #22791#27880#20449#24687
    end
    object SpeedButton1: TSpeedButton
      Left = 78
      Top = 24
      Width = 28
      Height = 26
      Hint = #24120#29992#22791#27880#20449#24687
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADAADADADADAD00ADAD000000000910000A0FFFF0FF9F10FF0D0FF00009F10F
        FF0A0F0787701088FF0D0078E7F70FFFFF0A008E878F08888F0D00EFE7E80FFF
        FF0A007FF78708888F0D0F07E770FFFFFF0A0F8000088888FF0D0FFFF0FFFFFF
        FF0A444444444444444D444444444444444A444444444444444D}
      ParentShowHint = False
      ShowHint = True
    end
    object Label3: TLabel
      Left = 699
      Top = 9
      Width = 66
      Height = 13
      Caption = '  '#22238#22797#20132#26399
    end
    object Label4: TLabel
      Left = 465
      Top = 8
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = ' '#26412#21378#32534#21495':'
    end
    object Label5: TLabel
      Left = 465
      Top = 40
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = ' '#23458#25143#22411#21495':'
    end
    object Label8: TLabel
      Left = 295
      Top = 8
      Width = 66
      Height = 13
      Caption = '  '#35746#21333#25968#37327
    end
    object Label9: TLabel
      Left = 449
      Top = 8
      Width = 21
      Height = 13
      Caption = 'PCS'
    end
    object Label10: TLabel
      Left = 295
      Top = 40
      Width = 66
      Height = 13
      Caption = '  '#35746#21333#38754#31215
    end
    object Button1: TButton
      Left = 331
      Top = 176
      Width = 75
      Height = 24
      Anchors = [akTop]
      Caption = #21462#28040#35780#23457
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 413
      Top = 176
      Width = 75
      Height = 24
      Anchors = [akTop]
      Caption = #20851#38381
      ModalResult = 2
      TabOrder = 1
    end
    object Memo1: TMemo
      Left = 2
      Top = 65
      Width = 807
      Height = 101
      Anchors = [akLeft, akTop, akRight]
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit2: TDBEdit
      Left = 534
      Top = 4
      Width = 105
      Height = 21
      Color = cl3DLight
      DataField = 'MANU_PART_NUMBER'
      DataSource = DM.DataSource5
      ReadOnly = True
      TabOrder = 3
    end
    object DBEdit3: TDBEdit
      Left = 534
      Top = 36
      Width = 141
      Height = 21
      Color = cl3DLight
      DataField = 'MANU_PART_DESC'
      DataSource = DM.DataSource5
      ReadOnly = True
      TabOrder = 4
    end
    object DBCheckBox1: TDBCheckBox
      Left = 109
      Top = 6
      Width = 97
      Height = 17
      Caption = #25237#20135#26242#32531
      DataField = 'ONHOLD_PLANNING_FLAG'
      DataSource = DM.DataSource5
      ReadOnly = True
      TabOrder = 5
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBCheckBox2: TDBCheckBox
      Left = 185
      Top = 6
      Width = 109
      Height = 17
      Caption = #24037#21333#21457#20986#26242#32531
      DataField = 'ONHOLD_RELEASE_FLAG'
      DataSource = DM.DataSource5
      ReadOnly = True
      TabOrder = 6
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBCheckBox3: TDBCheckBox
      Left = 109
      Top = 38
      Width = 97
      Height = 17
      Caption = #20462#35746#26242#32531
      DataField = 'ALLOW_EDIT_FLAG'
      DataSource = DM.DataSource5
      ReadOnly = True
      TabOrder = 7
      ValueChecked = 'Y'
      ValueUnchecked = 'N'
    end
    object DBCheckBox4: TDBCheckBox
      Left = 185
      Top = 38
      Width = 97
      Height = 17
      Caption = #20572#27490#25509#21333
      DataField = 'ONHOLD_SALES_FLAG'
      DataSource = DM.DataSource5
      ReadOnly = True
      TabOrder = 8
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBEdit1: TDBEdit
      Left = 702
      Top = 36
      Width = 91
      Height = 21
      Color = cl3DLight
      DataField = 'sch_date'
      DataSource = DM.DataSource5
      ReadOnly = True
      TabOrder = 9
    end
    object DBEdit4: TDBEdit
      Left = 362
      Top = 4
      Width = 87
      Height = 21
      Color = cl3DLight
      DataField = 'PARTS_ORDERED'
      DataSource = DM.DataSource5
      ReadOnly = True
      TabOrder = 10
    end
    object DBEdit5: TDBEdit
      Left = 362
      Top = 36
      Width = 87
      Height = 21
      Color = cl3DLight
      DataField = 'parts_mianji'
      DataSource = DM.DataSource5
      ReadOnly = True
      TabOrder = 11
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 509
    Height = 340
    ActivePage = TabSheet1
    Align = alLeft
    MultiLine = True
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #35780#23457#21442#25968
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 501
        Height = 312
        Align = alClient
        Color = cl3DLight
        DataSource = DM.DataSource2
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CATEGORY_DESC'
            Width = 115
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'parameter_desc'
            Title.Caption = #35746#21333#35201#27714#39033#30446
            Width = 123
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'unit_name'
            Width = 53
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'tvalue'
            Width = 178
            Visible = True
          end>
      end
    end
    object TabSheet3: TTabSheet
      Caption = #21152#24037#25351#31034
      ImageIndex = 2
      object Label2: TLabel
        Left = 17
        Top = 5
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = ' '#24037#31243#22791#27880
      end
      object Label6: TLabel
        Left = 20
        Top = 103
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = ' '#21152#24037#25351#31034
      end
      object Label7: TLabel
        Left = 16
        Top = 211
        Width = 112
        Height = 13
        Alignment = taRightJustify
        Caption = '  '#38144#21806#35746#21333#35760#20107#26412':'
      end
      object Memo2: TMemo
        Left = 15
        Top = 22
        Width = 445
        Height = 80
        ReadOnly = True
        TabOrder = 0
      end
      object Memo3: TMemo
        Left = 14
        Top = 119
        Width = 446
        Height = 86
        ReadOnly = True
        TabOrder = 1
      end
      object Memo4: TMemo
        Left = 17
        Top = 228
        Width = 446
        Height = 79
        ReadOnly = True
        TabOrder = 2
      end
    end
  end
  object DBGrid3: TDBGrid
    Left = 509
    Top = 0
    Width = 301
    Height = 340
    Align = alClient
    Color = cl3DLight
    DataSource = DM.DataSource4
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DEPT_NAME'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'auth_flag'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'auth_date'
        Width = 92
        Visible = True
      end>
  end
end
