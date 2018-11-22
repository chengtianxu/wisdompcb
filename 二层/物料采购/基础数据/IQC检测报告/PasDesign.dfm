object frmDesign: TfrmDesign
  Left = 538
  Top = 172
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #31867#22411#23450#20041
  ClientHeight = 518
  ClientWidth = 402
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 402
    Height = 41
    Align = alTop
    TabOrder = 0
    object lbFilter: TLabel
      Left = 99
      Top = 14
      Width = 78
      Height = 13
      Alignment = taRightJustify
      Caption = #26448#26009#31867#22411#32534#30721
    end
    object btnClose: TBitBtn
      Left = 3
      Top = 4
      Width = 75
      Height = 33
      Caption = #20851#38381
      ModalResult = 1
      TabOrder = 0
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
    end
    object edtFilter: TEdit
      Left = 184
      Top = 10
      Width = 121
      Height = 21
      TabOrder = 1
      OnChange = edtFilterChange
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 402
    Height = 477
    Align = alClient
    TabOrder = 1
    object dbType: TDBGridEh
      Left = 1
      Top = 1
      Width = 400
      Height = 475
      Align = alClient
      DataSource = DataSource1
      FooterColor = clWindow
      FooterFont.Charset = ANSI_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -13
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
      PopupMenu = PopupMenu1
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnTitleClick = dbTypeTitleClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'group_name'
          Footers = <>
          Title.Color = clRed
          Title.SortIndex = 1
          Title.SortMarker = smUpEh
          Width = 83
        end
        item
          EditButtons = <>
          FieldName = 'group_desc'
          Footers = <>
          Width = 162
        end
        item
          EditButtons = <>
          FieldName = 'reportname_c'
          Footers = <>
          Width = 106
        end>
    end
  end
  object adoDesign: TADODataSet
    Connection = DM.ADOConnection1
    LockType = ltReadOnly
    CommandText = 
      'select data0395.rkey496,data0395.reportname_c,data0496.group_nam' +
      'e,data0496.group_desc '#13#10'from data0395 inner join data0496 on dat' +
      'a0395.rkey496=data0496.rkey'
    IndexFieldNames = 'group_name'
    Parameters = <>
    Left = 352
    Top = 97
    object adoDesignrkey496: TIntegerField
      FieldName = 'rkey496'
    end
    object adoDesignreportname_c: TWideStringField
      DisplayLabel = #25253#34920#21517
      FieldName = 'reportname_c'
      Size = 10
    end
    object adoDesigngroup_name: TStringField
      DisplayLabel = #26448#26009#31867#22411#32534#30721
      FieldName = 'group_name'
      Size = 10
    end
    object adoDesigngroup_desc: TStringField
      DisplayLabel = #26448#26009#31867#22411#21517#31216
      FieldName = 'group_desc'
      Size = 30
    end
  end
  object DataSource1: TDataSource
    DataSet = adoDesign
    Left = 352
    Top = 136
  end
  object PopupMenu1: TPopupMenu
    Left = 168
    Top = 217
    object nAdd: TMenuItem
      Caption = #26032#22686
      OnClick = nAddClick
    end
    object nDelete: TMenuItem
      Caption = #21024#38500
      OnClick = nDeleteClick
    end
  end
end
