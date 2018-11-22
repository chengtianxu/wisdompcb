object FrmAcctSearch: TFrmAcctSearch
  Left = 272
  Top = 140
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #24635#24080#24080#30446#25628#32034
  ClientHeight = 513
  ClientWidth = 579
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 0
    Width = 579
    Height = 40
    Cursor = crVSplit
    Align = alTop
  end
  object Label1: TLabel
    Left = 102
    Top = 12
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #31185#30446#32534#30721':'
  end
  object Edit1: TEdit
    Left = 164
    Top = 8
    Width = 162
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = DBGrid1KeyDown
  end
  object BitBtn1: TBitBtn
    Left = 330
    Top = 7
    Width = 25
    Height = 25
    Hint = #21047#26032
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
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
  object Button2: TButton
    Left = 307
    Top = 474
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 2
  end
  object Button1: TButton
    Left = 227
    Top = 474
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 3
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 40
    Width = 579
    Height = 430
    Align = alTop
    DataSource = DataSource1
    Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 4
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
        FieldName = 'GL_ACC_NUMBER'
        Title.Color = clRed
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'description_2'
        Width = 277
        Visible = True
      end
      item
        Expanded = False
        FieldName = #31867#22411
        ReadOnly = False
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = #22806#24065#26680#31639
        ReadOnly = False
        Width = 90
        Visible = True
      end>
  end
  object RadioGroup1: TRadioGroup
    Left = 364
    Top = -1
    Width = 172
    Height = 39
    Caption = #36807#28388#26041#24335
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #21069#26041#19968#33268
      #27169#31946#26597#25214)
    TabOrder = 5
  end
  object DataSource1: TDataSource
    DataSet = DM.ADOData0103
    OnDataChange = DataSource1DataChange
    Left = 219
    Top = 208
  end
end
