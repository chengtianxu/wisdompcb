object FrmMain: TFrmMain
  Left = 326
  Top = 125
  Width = 1090
  Height = 682
  Caption = #24211#23384#26448#26009#26377#25928#26399#26126#32454#26597#35810
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btn_QryProdName: TButton
    Left = 188
    Top = 39
    Width = 28
    Height = 22
    Caption = '..'
    TabOrder = 0
    OnClick = btn_QryProdNameClick
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 1082
    Height = 651
    Align = alClient
    TabOrder = 1
    object pnl3: TPanel
      Left = 1
      Top = 1
      Width = 1080
      Height = 104
      Align = alTop
      TabOrder = 0
      object lbl1: TLabel
        Left = 7
        Top = 10
        Width = 65
        Height = 13
        Caption = #26448#26009#32534#30721#65306
      end
      object lbl2: TLabel
        Left = 4
        Top = 41
        Width = 65
        Height = 13
        Caption = #26448#26009#21517#31216#65306
      end
      object lbl3: TLabel
        Left = 229
        Top = 8
        Width = 65
        Height = 13
        Caption = #26448#26009#35268#26684#65306
      end
      object lbl4: TLabel
        Left = 228
        Top = 40
        Width = 65
        Height = 13
        Caption = #24037#21378#20195#30721#65306
      end
      object lbl5: TLabel
        Left = 465
        Top = 11
        Width = 65
        Height = 13
        Caption = #20179#24211#20195#30721#65306
      end
      object lbl6: TLabel
        Left = 452
        Top = 41
        Width = 78
        Height = 13
        Caption = #20379#24212#21830#20195#30721#65306
      end
      object lbl7: TLabel
        Left = 690
        Top = 11
        Width = 65
        Height = 13
        Caption = #26448#26009#32452#21035#65306
      end
      object lbl8: TLabel
        Left = 690
        Top = 40
        Width = 65
        Height = 13
        Caption = #26448#26009#31867#21035#65306
      end
      object lbl9: TLabel
        Left = 24
        Top = 72
        Width = 707
        Height = 16
        Caption = #26597#35810#21508#26448#26009#36817'6'#20010#26376#21450'6'#20010#26376#20197#21069#30340#20837#24211#25968#37327#25110#37329#39069#26126#32454','#21487#20998#21035#25353#20837#24211#26085#26399#21644#26377#25928#26085#26399#26597#35810#27719#24635
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edt_ProdID: TEdit
        Left = 66
        Top = 8
        Width = 121
        Height = 21
        TabOrder = 0
      end
      object edt_ProdName: TEdit
        Left = 66
        Top = 40
        Width = 121
        Height = 21
        TabOrder = 1
      end
      object edt_Desc: TEdit
        Left = 288
        Top = 5
        Width = 121
        Height = 21
        TabOrder = 2
      end
      object edt_Fac: TEdit
        Left = 288
        Top = 37
        Width = 121
        Height = 21
        TabOrder = 3
      end
      object edt_WH: TEdit
        Left = 525
        Top = 6
        Width = 121
        Height = 21
        TabOrder = 4
      end
      object edt_ventorID: TEdit
        Left = 525
        Top = 38
        Width = 121
        Height = 21
        TabOrder = 5
      end
      object edt_MGroup: TEdit
        Left = 750
        Top = 5
        Width = 121
        Height = 21
        TabOrder = 6
      end
      object edt_MType: TEdit
        Left = 750
        Top = 37
        Width = 121
        Height = 21
        TabOrder = 7
      end
      object btn_Qry: TButton
        Left = 952
        Top = 64
        Width = 75
        Height = 25
        Caption = #26597#35810
        TabOrder = 8
        OnClick = btn_QryClick
      end
      object btn_QryProdID: TButton
        Left = 189
        Top = 7
        Width = 28
        Height = 22
        Caption = '..'
        TabOrder = 9
        OnClick = btn_QryProdIDClick
      end
      object btn_QryDesc: TButton
        Left = 411
        Top = 4
        Width = 28
        Height = 22
        Caption = '..'
        TabOrder = 10
        OnClick = btn_QryDescClick
      end
      object btn_QryFac: TButton
        Left = 409
        Top = 36
        Width = 28
        Height = 22
        Caption = '..'
        TabOrder = 11
        OnClick = btn_QryFacClick
      end
      object btn_QryWH: TButton
        Left = 648
        Top = 5
        Width = 28
        Height = 22
        Caption = '..'
        TabOrder = 12
        OnClick = btn_QryWHClick
      end
      object btn_QryVentorID: TButton
        Left = 648
        Top = 37
        Width = 28
        Height = 22
        Caption = '..'
        TabOrder = 13
        OnClick = btn_QryVentorIDClick
      end
      object btn_QryMGroup: TButton
        Left = 873
        Top = 4
        Width = 28
        Height = 22
        Caption = '..'
        TabOrder = 14
        OnClick = btn_QryMGroupClick
      end
      object btn_QryMType: TButton
        Left = 871
        Top = 35
        Width = 28
        Height = 22
        Caption = '..'
        TabOrder = 15
        OnClick = btn_QryMTypeClick
      end
      object rg_IE: TRadioGroup
        Left = 906
        Top = 5
        Width = 155
        Height = 40
        Caption = #20837#24211#26085#26399'/'#36807#26399#26085#26399
        Columns = 2
        Font.Charset = ANSI_CHARSET
        Font.Color = clBtnText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          #20837#24211#26085#26399
          #26377#25928#26085#26399)
        ParentFont = False
        TabOrder = 16
      end
      object btnExcel: TBitBtn
        Left = 837
        Top = 64
        Width = 60
        Height = 25
        Hint = #23548#20986#25968#25454'Excel'
        Caption = #23548#20986
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 17
        OnClick = btnExcelClick
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
      object btn1: TButton
        Left = 189
        Top = 39
        Width = 28
        Height = 22
        Caption = '..'
        TabOrder = 18
        OnClick = btn_QryProdNameClick
      end
    end
    object pnl2: TPanel
      Left = 1
      Top = 105
      Width = 1080
      Height = 545
      Align = alClient
      TabOrder = 1
      object rg_QM: TRadioGroup
        Left = 890
        Top = 19
        Width = 155
        Height = 40
        Caption = #25968#37327'/'#37329#39069
        Columns = 2
        Font.Charset = ANSI_CHARSET
        Font.Color = clBtnText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          #25968#37327
          #37329#39069)
        ParentFont = False
        TabOrder = 1
        Visible = False
      end
      object dbgrdh1: TDBGridEh
        Left = 1
        Top = 1
        Width = 1078
        Height = 543
        Align = alClient
        DataSource = ds_Main
        FooterColor = clWindow
        FooterFont.Charset = ANSI_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -13
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        FrozenCols = 9
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnDrawColumnCell = dbgrdh1DrawColumnCell
        OnTitleClick = dbgrdh1TitleClick
      end
    end
  end
  object ds_Main: TDataSource
    DataSet = qry_main
    Left = 272
    Top = 225
  end
  object qry_main: TADOQuery
    Connection = DM.con1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'QryProdDetail '#39#39','#39#39','#39#39','#39#39','#39#39','#39#39','#39#39','#39#39',0,0')
    Left = 160
    Top = 233
  end
end
