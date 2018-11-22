object Form_PoSearch: TForm_PoSearch
  Left = 419
  Top = 186
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #37319#36141'PO'#25628#32034
  ClientHeight = 495
  ClientWidth = 826
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 826
    Height = 32
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 49
      Top = 9
      Width = 113
      Height = 13
      Alignment = taRightJustify
      Caption = '    '#37319#36141#35746#21333#21495#30721':'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 165
      Top = 5
      Width = 157
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
    object BitBtn1: TBitBtn
      Left = 329
      Top = 3
      Width = 25
      Height = 25
      TabOrder = 1
      TabStop = False
      OnClick = BitBtn1Click
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
  end
  object Panel2: TPanel
    Left = 0
    Top = 32
    Width = 826
    Height = 250
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 826
      Height = 250
      Align = alTop
      DataSource = DataSource1
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      OnKeyDown = DBGrid1KeyDown
      OnTitleClick = DBGrid1TitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'PO_NUMBER'
          Title.Caption = #37319#36141#35746#21333#21495#30721
          Title.Color = clRed
          Width = 95
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PO_DATE'
          ReadOnly = False
          Title.Caption = #35746#21333#26085#26399
          Width = 86
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'abbr_warename'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DEPT_NAME'
          Width = 59
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CONFIRMATION_NUMBER'
          Width = 74
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'abbr_suppname'
          Width = 80
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 282
    Width = 826
    Height = 213
    Align = alClient
    TabOrder = 2
    DesignSize = (
      826
      213)
    object Button1: TButton
      Left = 298
      Top = 179
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 441
      Top = 179
      Width = 75
      Height = 25
      Anchors = [akTop]
      Cancel = True
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
    object DBGrid2: TDBGrid
      Left = 1
      Top = 1
      Width = 824
      Height = 168
      Hint = #32418#33394#23383#20307#20026#37325#35201#29289#26009
      DataSource = DataSource2
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'INV_NAME'
          Title.Caption = #26448#26009#21517#31216
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'INV_DESCRIPTION'
          Title.Caption = #26448#26009#35268#26684
          Width = 145
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QUAN_ORD'
          Title.Caption = #35746#36141#25968#37327
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = #27424#36135#25968#37327
          Width = 61
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tax_price'
          Title.Caption = #21547#31246#20215
          Width = 58
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TAX_2'
          Title.Caption = #31246#29575
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIT_NAME'
          Title.Caption = #23384#36135#21333#20301
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'pr_unitname'
          Title.Caption = #37319#36141#21333#20301
          Width = 59
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REQ_DATE'
          Title.Caption = #38656#27714#26085#26399
          Width = 76
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'avl_flag'
          Title.Caption = #38656#35201'IQC'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QUAN_IN_INSP'
          Title.Caption = #36890#36807#25968#37327
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'rohs'
          Title.Caption = #29615#20445#26631#35782
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'extra_req'
          Title.Caption = #29305#27530#35828#26126
          Width = 91
          Visible = True
        end>
    end
  end
  object DataSource1: TDataSource
    DataSet = dm.ADS70
    Left = 320
    Top = 104
  end
  object DataSource2: TDataSource
    DataSet = dm.ADO71
    Left = 352
    Top = 346
  end
end
