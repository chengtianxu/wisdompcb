object Form_main: TForm_main
  Left = 187
  Top = 267
  Width = 962
  Height = 640
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #26448#26009#32534#30721#20998#31867#23450#20041
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
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
  object Splitter1: TSplitter
    Left = 0
    Top = 309
    Width = 946
    Height = 6
    Cursor = crVSplit
    Align = alTop
    Color = clAqua
    ParentColor = False
  end
  object DBGridEh2: TDBGridEh
    Left = 0
    Top = 315
    Width = 946
    Height = 287
    Align = alClient
    DataSource = ds594
    FooterColor = clWindow
    FooterFont.Charset = GB2312_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'rec_no'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'type_name'
        Footers = <>
        Width = 158
      end
      item
        EditButtons = <>
        FieldName = 'type_code'
        Footers = <>
        Width = 141
      end
      item
        EditButtons = <>
        FieldName = 'filter_name'
        Footers = <>
        Width = 209
      end>
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 37
    Width = 946
    Height = 272
    Align = alTop
    DataSource = dsMain
    FooterColor = clWindow
    FooterFont.Charset = GB2312_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'invt_ttyename'
        Footers = <>
        Width = 99
      end
      item
        EditButtons = <>
        FieldName = 'length'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'name'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'strguizhe'
        Footers = <>
        Width = 89
      end
      item
        EditButtons = <>
        FieldName = 'PARAMETER_NAME'
        Footers = <>
        Width = 121
      end
      item
        EditButtons = <>
        FieldName = 'PARAMETER_DESC'
        Footers = <>
        Width = 134
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 946
    Height = 37
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Label1: TLabel
      Left = 233
      Top = 12
      Width = 85
      Height = 13
      Alignment = taRightJustify
      Caption = #32534#30721#35268#21010#21517#31216' '
    end
    object BitBtn1: TBitBtn
      Left = 6
      Top = 5
      Width = 57
      Height = 30
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
      Left = 128
      Top = 5
      Width = 57
      Height = 30
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
      Left = 321
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 3
      OnChange = Edit1Change
    end
    object BitBtn2: TBitBtn
      Left = 67
      Top = 5
      Width = 57
      Height = 31
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
  object dsMain: TDataSource
    DataSet = qry_Main
    Left = 708
    Top = 88
  end
  object qry_594: TADOQuery
    Connection = DM.con1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey593'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from data0594'
      'where rkey593= :rkey593')
    Left = 684
    Top = 384
    object qry_594rkey593: TIntegerField
      FieldName = 'rkey593'
    end
    object qry_594rec_no: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'rec_no'
    end
    object qry_594type_name: TStringField
      DisplayLabel = #36873#39033#21517#31216
      FieldName = 'type_name'
      Size = 50
    end
    object qry_594type_code: TStringField
      DisplayLabel = #36873#39033#32534#30721
      FieldName = 'type_code'
      Size = 10
    end
    object qry_594filter_name: TStringField
      DisplayLabel = #36873#39033#36807#28388#21517#31216
      FieldName = 'filter_name'
      Size = 50
    end
  end
  object ds594: TDataSource
    DataSet = qry_594
    Left = 724
    Top = 380
  end
  object qry_Main: TADOQuery
    Connection = DM.con1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterScroll = qry_MainAfterScroll
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     dbo.Data0278.PARAMETER_NAME, dbo.Data0278.PARAMETER_D' +
        'ESC, dbo.DATA0593.invt_ttyename, DATA0593_1.invt_ttyename AS nam' +
        'e, dbo.DATA0593.guizhe, '
      
        '                      dbo.DATA0593.length, dbo.DATA0593.rkey, db' +
        'o.DATA0593.rkey593, dbo.DATA0593.PARAMETER_PTR, case  data0593.g' +
        'uizhe when  0 then '#39#33258#36873#39' when 1 then '#39#27969#27700#21495#39' end as strguizhe'
      'FROM         dbo.DATA0593 LEFT OUTER JOIN'
      
        '                      dbo.Data0278 ON dbo.DATA0593.PARAMETER_PTR' +
        ' = dbo.Data0278.RKEY LEFT OUTER JOIN'
      
        '                      dbo.DATA0593 AS DATA0593_1 ON dbo.DATA0593' +
        '.rkey593 = DATA0593_1.rkey')
    Left = 668
    Top = 92
    object qry_Mainrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object qry_Maininvt_ttyename: TWideStringField
      DisplayLabel = #32534#30721#20998#31867#21517#31216
      FieldName = 'invt_ttyename'
      Size = 30
    end
    object qry_Mainrkey593: TIntegerField
      DisplayLabel = #32534#30721#33258#20851#32852
      FieldName = 'rkey593'
    end
    object qry_Mainguizhe: TWordField
      DisplayLabel = #32534#30721#35268#21010
      FieldName = 'guizhe'
    end
    object qry_Mainlength: TWordField
      DisplayLabel = #32534#30721#38271#24230
      FieldName = 'length'
    end
    object qry_MainPARAMETER_PTR: TIntegerField
      DisplayLabel = #24037#31243#21442#25968#20195#30721
      FieldName = 'PARAMETER_PTR'
    end
    object qry_MainPARAMETER_NAME: TStringField
      DisplayLabel = #24037#31243#21442#25968#21517#31216
      FieldName = 'PARAMETER_NAME'
      Size = 10
    end
    object qry_MainPARAMETER_DESC: TStringField
      DisplayLabel = #24037#31243#21442#25968#20195#30721
      FieldName = 'PARAMETER_DESC'
    end
    object qry_Mainname: TWideStringField
      DisplayLabel = #33258#20851#32852#32534#30721
      FieldName = 'name'
      Size = 30
    end
    object qry_Mainstrguizhe: TStringField
      DisplayLabel = #32534#30721#35268#21017
      FieldName = 'strguizhe'
      ReadOnly = True
      Size = 4
    end
  end
end
