object Form_allmx: TForm_allmx
  Left = 215
  Top = 197
  Width = 870
  Height = 640
  Caption = #20840#37096#20998#37197#26126#32454
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 41
    Width = 854
    Height = 561
    Align = alClient
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyDown = DBGridEh1KeyDown
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = #26448#26009#32534#30721
        Footers = <>
        Width = 92
      end
      item
        EditButtons = <>
        FieldName = #26448#26009#21517#31216
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #21333#20301
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #20998#37197#25968#37327
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #26448#26009#35268#26684
        Footers = <>
        Width = 193
      end
      item
        EditButtons = <>
        FieldName = #20998#37197#20154#21592
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #26412#21378#32534#21495
        Footers = <>
        Width = 88
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 854
    Height = 41
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 367
      Top = 14
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #20135#21697#20195#30721
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object BitBtn1: TBitBtn
      Left = 2
      Top = 5
      Width = 57
      Height = 30
      Hint = #36864#20986#31995#32479
      Caption = #36864#20986
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ModalResult = 3
      ParentFont = False
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
    object BitBtn3: TBitBtn
      Left = 61
      Top = 5
      Width = 57
      Height = 30
      Hint = #21047#26032#24403#21069#25968#25454
      Caption = #21047#26032
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BitBtn3Click
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
    object BitBtn2: TBitBtn
      Left = 119
      Top = 5
      Width = 57
      Height = 30
      Hint = #23548#20986#25968#25454#21040'Excel'
      Caption = #23548#20986
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BitBtn2Click
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
      Left = 428
      Top = 10
      Width = 121
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      ParentFont = False
      TabOrder = 3
      OnChange = Edit1Change
    end
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     dbo.DATA0475.quan_alloc AS '#20998#37197#25968#37327', dbo.Data0017.INV_PAR' +
        'T_NUMBER AS '#26448#26009#32534#30721', dbo.Data0017.INV_NAME AS '#26448#26009#21517#31216', '
      
        '                      dbo.Data0017.INV_DESCRIPTION AS '#26448#26009#35268#26684', dbo.' +
        'Data0005.ABBR_NAME AS '#20998#37197#20154#21592', dbo.Data0002.UNIT_NAME AS '#21333#20301', '
      '                      dbo.Data0025.MANU_PART_NUMBER AS '#26412#21378#32534#21495
      'FROM         dbo.Data0025 INNER JOIN'
      
        '                      dbo.data0492 ON dbo.Data0025.RKEY = dbo.da' +
        'ta0492.BOM_PTR RIGHT OUTER JOIN'
      '                      dbo.Data0022 INNER JOIN'
      '                      dbo.DATA0475 INNER JOIN'
      
        '                      dbo.WZCP0492 ON dbo.DATA0475.cp492_ptr = d' +
        'bo.WZCP0492.Rkey ON dbo.Data0022.RKEY = dbo.DATA0475.rkey22 INNE' +
        'R JOIN'
      
        '                      dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR' +
        ' = dbo.Data0017.RKEY INNER JOIN'
      
        '                      dbo.Data0005 ON dbo.DATA0475.alloc_userptr' +
        ' = dbo.Data0005.RKEY INNER JOIN'
      
        '                      dbo.Data0002 ON dbo.Data0022.LOCATION_PTR_' +
        'FROM = dbo.Data0002.RKEY ON dbo.data0492.rkey = dbo.WZCP0492.D49' +
        '2_ptr')
    Left = 444
    Top = 172
    object ADOQuery1DSDesigner: TBCDField
      FieldName = #20998#37197#25968#37327
      Precision = 10
      Size = 2
    end
    object ADOQuery1DSDesigner2: TStringField
      FieldName = #26448#26009#32534#30721
      Size = 25
    end
    object ADOQuery1DSDesigner3: TStringField
      FieldName = #26448#26009#21517#31216
      Size = 30
    end
    object ADOQuery1DSDesigner4: TStringField
      FieldName = #26448#26009#35268#26684
      Size = 70
    end
    object ADOQuery1DSDesigner5: TStringField
      FieldName = #20998#37197#20154#21592
      Size = 10
    end
    object ADOQuery1DSDesigner6: TStringField
      FieldName = #21333#20301
    end
    object ADOQuery1DSDesigner7: TStringField
      FieldName = #26412#21378#32534#21495
      Size = 30
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 540
    Top = 172
  end
end
