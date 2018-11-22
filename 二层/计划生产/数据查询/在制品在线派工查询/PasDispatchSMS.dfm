object FrmDispatchSMS: TFrmDispatchSMS
  Left = 402
  Top = 141
  BorderStyle = bsDialog
  Caption = #27966#24037#36229#26102#30701#20449#25509#25910#20154#21592#23450#20041
  ClientHeight = 482
  ClientWidth = 403
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 32
    Width = 403
    Height = 450
    Hint = '|'#13'Insert'#25554#20837#35760#24405
    Align = alClient
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ShowHint = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnEditButtonClick = DBGridEh1EditButtonClick
    Columns = <
      item
        ButtonStyle = cbsEllipsis
        EditButtons = <>
        FieldName = 'DEPT_CODE'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #24037#24207#20195#30721
        Width = 90
      end
      item
        EditButtons = <>
        FieldName = 'DEPT_NAME'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #24037#24207#21517#31216
        Width = 110
      end
      item
        ButtonStyle = cbsEllipsis
        EditButtons = <>
        FieldName = 'USER_LOGIN_NAME'
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #29992#25143#32534#21495
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'USER_FULL_NAME'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #22995#21517
        Width = 60
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 403
    Height = 32
    Align = alTop
    TabOrder = 1
    object Label2: TLabel
      Left = 185
      Top = 12
      Width = 39
      Height = 13
      Caption = #24037#24207#65306
    end
    object Edit3: TEdit
      Left = 218
      Top = 7
      Width = 96
      Height = 21
      TabOrder = 0
      OnChange = Edit3Change
    end
    object BitBtn5: TBitBtn
      Left = 3
      Top = 2
      Width = 61
      Height = 30
      Caption = #20851#38381
      ModalResult = 2
      TabOrder = 1
      OnClick = BitBtn5Click
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
      Left = 64
      Top = 2
      Width = 59
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
  end
  object ads59: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    CommandText = 
      'select data0059.USER_LOGIN_NAME,data0059.d34_Ptr,data0034.DEPT_C' +
      'ODE,data0034.DEPT_NAME,data0073.USER_FULL_NAME'#13#10'from data0059 in' +
      'ner join data0073'#13#10'on data0059.USER_LOGIN_NAME=data0073.USER_LOG' +
      'IN_NAME inner join'#13#10'dbo.data0034 on dbo.data0059.d34_Ptr=dbo.dat' +
      'a0034.Rkey'#13#10
    Parameters = <>
    Left = 40
    Top = 240
    object ads59USER_LOGIN_NAME: TStringField
      FieldName = 'USER_LOGIN_NAME'
      Size = 15
    end
    object ads59d34_Ptr: TIntegerField
      FieldName = 'd34_Ptr'
    end
    object ads59DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ads59DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ads59USER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
  end
  object DataSource1: TDataSource
    DataSet = ads59
    Left = 96
    Top = 240
  end
  object PopupMenu1: TPopupMenu
    Left = 208
    Top = 216
    object N1: TMenuItem
      Caption = #21024#38500
      OnClick = N1Click
    end
  end
  object Ado59: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select * from data0059')
    Left = 56
    Top = 320
    object Ado59USER_LOGIN_NAME: TStringField
      FieldName = 'USER_LOGIN_NAME'
      Size = 15
    end
    object Ado59d34_Ptr: TIntegerField
      FieldName = 'd34_Ptr'
    end
  end
end
