object Form1: TForm1
  Left = 496
  Top = 233
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20135#21697#32452#21035
  ClientHeight = 406
  ClientWidth = 770
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bar1: TStatusBar
    Left = 0
    Top = 387
    Width = 770
    Height = 19
    Panels = <>
    SimpleText = #25628#32034':'
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 770
    Height = 346
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = editClick
    OnKeyPress = FormKeyPress
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'PR_GRP_CODE'
        Title.Caption = #32452#21035#20195#30721
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRODUCT_GROUP_NAME'
        Title.Caption = #32452#21035#21517#31216
        Width = 174
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'active2'
        Title.Caption = #26159#21542#26377#25928
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 770
    Height = 41
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object vpass: TLabel
      Left = 721
      Top = 15
      Width = 7
      Height = 13
      Caption = '0'
      Visible = False
    end
    object lblFilter: TLabel
      Left = 249
      Top = 13
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #32452#21035#20195#30721
      Color = clBtnHighlight
      ParentColor = False
    end
    object BitBtn2: TBitBtn
      Left = 4
      Top = 4
      Width = 60
      Height = 30
      Caption = #36864#20986
      TabOrder = 0
      OnClick = bitbtn1Click
      Kind = bkClose
    end
    object edtFilter: TEdit
      Left = 303
      Top = 9
      Width = 109
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 1
      OnChange = edtFilterChange
    end
    object BtBrush: TBitBtn
      Left = 65
      Top = 7
      Width = 57
      Height = 26
      Caption = #21047#26032
      TabOrder = 2
      OnClick = BtBrushClick
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
    object BitBtn3: TBitBtn
      Left = 123
      Top = 6
      Width = 60
      Height = 27
      Caption = #23548#20986
      TabOrder = 3
      OnClick = BitBtn3Click
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
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 430
    Top = 312
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 460
    Top = 312
    object add: TMenuItem
      Caption = #26032#22686
      OnClick = addClick
    end
    object edit: TMenuItem
      Caption = #32534#36753
      OnClick = editClick
    end
    object copydate: TMenuItem
      Caption = #22797#21046
      OnClick = copydateClick
    end
    object delete: TMenuItem
      Caption = #21024#38500
      OnClick = deleteClick
    end
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 368
    Top = 312
  end
  object ADOTable1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    AfterDelete = ADO0741AfterDelete
    OnDeleteError = ADO0741DeleteError
    Parameters = <>
    SQL.Strings = (
      
        'select RKEY,PR_GRP_CODE,PRODUCT_GROUP_NAME,PR_GRP_SEEDVALUE,PR_G' +
        'RP_INCREMENTBY,AlterDay,custReciveDay,'
      
        'active2=case active when 1 then '#39#26159#39'  when null then '#39#39' when 0 th' +
        'en '#39#21542#39' end,active,REVIEW_DAYS from data0007')
    Left = 423
    Top = 218
    object ADOTable1RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOTable1PR_GRP_CODE: TStringField
      FieldName = 'PR_GRP_CODE'
      Size = 5
    end
    object ADOTable1PRODUCT_GROUP_NAME: TStringField
      FieldName = 'PRODUCT_GROUP_NAME'
      Size = 30
    end
    object ADOTable1PR_GRP_SEEDVALUE: TStringField
      FieldName = 'PR_GRP_SEEDVALUE'
    end
    object ADOTable1PR_GRP_INCREMENTBY: TSmallintField
      FieldName = 'PR_GRP_INCREMENTBY'
    end
    object ADOTable1active2: TStringField
      FieldName = 'active2'
      ReadOnly = True
      Size = 2
    end
    object ADOTable1active: TBooleanField
      FieldName = 'active'
    end
    object ADOTable1REVIEW_DAYS: TIntegerField
      DisplayLabel = #26377#25928#26399
      FieldName = 'REVIEW_DAYS'
    end
    object ADOTable1custReciveDay: TIntegerField
      FieldName = 'custReciveDay'
    end
    object ADOTable1AlterDay: TIntegerField
      FieldName = 'AlterDay'
    end
  end
end
