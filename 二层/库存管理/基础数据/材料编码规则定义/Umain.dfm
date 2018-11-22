object Form_main: TForm_main
  Left = 210
  Top = 205
  Width = 870
  Height = 640
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #26448#26009#32534#30721#35268#21017#23450#20041
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object Splitter1: TSplitter
    Left = 0
    Top = 380
    Width = 852
    Height = 8
    Cursor = crVSplit
    Align = alTop
    Color = clAqua
    ParentColor = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 852
    Height = 46
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 319
      Top = 15
      Width = 72
      Height = 16
      Alignment = taRightJustify
      Caption = #31867#22411#21517#31216' '
    end
    object BitBtn1: TBitBtn
      Left = 7
      Top = 6
      Width = 71
      Height = 37
      Cursor = crHandPoint
      Hint = #36864#20986
      Caption = #36864#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BitBtn1Click
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
    object BitBtn4: TBitBtn
      Left = 158
      Top = 6
      Width = 70
      Height = 37
      Hint = #23548#20986#25968#25454'Excel'
      Caption = #23548#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BitBtn4Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DADADADADADA
        DADAADADADADADADADADDADADADADAD00000000000000006666007777777706E
        EF0AA0E6666606EEF0ADDA0E66606EEF060AADA0E606EEF0000DDADA006EEF0A
        DADAADAD06EEF00DADADDAD06EEF0670DADAAD06EEF0E6670DADD06EEF0A0E66
        70DA0FFFF0ADA0EEEE0D00000ADADA00000AADADADADADADADAD}
    end
    object Edit1: TEdit
      Left = 395
      Top = 10
      Width = 149
      Height = 21
      TabOrder = 3
      OnChange = Edit1Change
    end
    object BitBtn2: TBitBtn
      Left = 82
      Top = 6
      Width = 71
      Height = 38
      Hint = #21047#26032#24403#21069#25968#25454
      Caption = #21047#26032
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BitBtn2Click
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
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 46
    Width = 852
    Height = 334
    Align = alTop
    DataSource = dsMain
    FooterColor = clWindow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -16
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGridEh1KeyDown
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'TYPE_CODE'
        Footers = <>
        Width = 255
      end
      item
        EditButtons = <>
        FieldName = 'TYPE_NAME'
        Footers = <>
        Width = 343
      end
      item
        EditButtons = <>
        FieldName = 'LENGTH'
        Footers = <>
        Width = 104
      end>
  end
  object DBGridEh2: TDBGridEh
    Left = 0
    Top = 388
    Width = 852
    Height = 207
    Align = alClient
    DataSource = ds596
    FooterColor = clWindow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -16
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'rec_no'
        Footers = <>
        Width = 274
      end
      item
        EditButtons = <>
        FieldName = 'invt_ttyename'
        Footers = <>
        Width = 270
      end>
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 260
    Top = 140
    object mni_new: TMenuItem
      Caption = #26032#24314
      OnClick = mni_newClick
    end
    object N_Edit: TMenuItem
      Caption = #32534#36753
      OnClick = N_EditClick
    end
    object N_Check: TMenuItem
      Caption = #26597#30475
      OnClick = N_CheckClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N_Del: TMenuItem
      Caption = #21024#38500
      OnClick = N_DelClick
    end
  end
  object qry_Main: TADOQuery
    Connection = DM.con1
    CursorType = ctStatic
    AfterScroll = qry_MainAfterScroll
    Parameters = <>
    SQL.Strings = (
      'SELECT     dbo.DATA0595.*'
      'FROM         dbo.DATA0595')
    Left = 792
    Top = 56
    object qry_MainRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object qry_MainTYPE_CODE: TStringField
      DisplayLabel = #31867#22411#20195#30721
      FieldName = 'TYPE_CODE'
      Size = 15
    end
    object qry_MainTYPE_NAME: TWideStringField
      DisplayLabel = #31867#22411#21517#31216
      FieldName = 'TYPE_NAME'
      Size = 30
    end
    object qry_MainLENGTH: TIntegerField
      DisplayLabel = #38271#24230
      FieldName = 'LENGTH'
    end
  end
  object dsMain: TDataSource
    DataSet = qry_Main
    Left = 792
    Top = 124
  end
  object qry_596: TADOQuery
    Connection = DM.con1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey595'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.DATA0596.*, dbo.DATA0593.invt_ttyename, dbo.DATA0' +
        '595.TYPE_NAME, dbo.DATA0596.rkey595 AS Expr1, dbo.DATA0596.rkey5' +
        '93 AS Expr2, '
      '                      dbo.DATA0596.rec_no AS Expr3'
      'FROM         dbo.DATA0596 INNER JOIN'
      
        '                      dbo.DATA0593 ON dbo.DATA0596.rkey593 = dbo' +
        '.DATA0593.rkey INNER JOIN'
      
        '                      dbo.DATA0595 ON dbo.DATA0596.rkey595 = dbo' +
        '.DATA0595.RKEY'
      'where rkey595= :rkey595')
    Left = 788
    Top = 332
    object qry_596rkey595: TIntegerField
      DisplayLabel = #26448#26009#32534#30721#31867#22411
      FieldName = 'rkey595'
    end
    object qry_596rkey593: TIntegerField
      DisplayLabel = #26448#26009#32534#30721#20998#31867
      FieldName = 'rkey593'
    end
    object qry_596rec_no: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'rec_no'
    end
    object qry_596invt_ttyename: TWideStringField
      DisplayLabel = #32534#30721#20998#31867
      FieldName = 'invt_ttyename'
      Size = 30
    end
    object qry_596TYPE_NAME: TWideStringField
      DisplayLabel = #32534#30721#31867#22411
      FieldName = 'TYPE_NAME'
      Size = 30
    end
    object qry_596Expr1: TIntegerField
      FieldName = 'Expr1'
    end
    object qry_596Expr2: TIntegerField
      FieldName = 'Expr2'
    end
    object qry_596Expr3: TIntegerField
      FieldName = 'Expr3'
    end
  end
  object ds596: TDataSource
    DataSet = qry_596
    Left = 788
    Top = 392
  end
end
