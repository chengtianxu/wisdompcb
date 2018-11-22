object frmadmin: Tfrmadmin
  Left = 252
  Top = 249
  Width = 1088
  Height = 563
  Caption = #32463#29702#32423#20197#19978#21512#21516#23558#21040#26399
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 1080
    Height = 45
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 111
      Top = 23
      Width = 46
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #24037#21495':'
    end
    object Button1: TButton
      Left = 2
      Top = 3
      Width = 73
      Height = 40
      Caption = #36864#20986
      TabOrder = 0
      OnClick = Button1Click
    end
    object Edit1: TEdit
      Left = 192
      Top = 19
      Width = 71
      Height = 21
      TabOrder = 1
      OnChange = Edit1Change
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 45
    Width = 529
    Height = 491
    Align = alLeft
    TabOrder = 1
    object pnl4: TPanel
      Left = 1
      Top = 1
      Width = 527
      Height = 29
      Align = alTop
      TabOrder = 0
      DesignSize = (
        527
        29)
      object Label4: TLabel
        Left = 6
        Top = 5
        Width = 211
        Height = 13
        AutoSize = False
        Caption = #32463#29702'/'#21103#32463#29702' '#25552#21069#21322#24180#26174#31034
      end
      object BitBtn4: TBitBtn
        Left = 468
        Top = 3
        Width = 55
        Height = 22
        Hint = #23548#20986#25968#25454'Excel'
        Anchors = [akTop, akRight]
        Caption = #23548#20986
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
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
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 30
      Width = 527
      Height = 460
      Align = alClient
      DataSource = DM.DataSource5
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnEnter = DBGridEh1Enter
      OnTitleClick = DBGridEh1TitleClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'departmentname'
          Footers = <>
          Title.Caption = #37096#38376
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'employeecode'
          Footers = <>
          Title.Caption = #24037#21495
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'chinesename'
          Footers = <>
          Title.Caption = #22995#21517
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'position'
          Footers = <>
          Title.Caption = #32844#21153
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'code'
          Footers = <>
          Title.Caption = #21512#21516#32534#21495
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'startdate'
          Footers = <>
          Title.Caption = #24320#22987#26085#26399
          Width = 75
        end
        item
          EditButtons = <>
          FieldName = 'enddate'
          Footers = <>
          Title.Caption = #32467#26463#26085#26399
          Width = 75
        end
        item
          EditButtons = <>
          FieldName = 'employee_typeitem'
          Footers = <>
          Title.Caption = #21512#21516#31867#22411
          Width = 70
        end>
    end
  end
  object pnl3: TPanel
    Left = 529
    Top = 45
    Width = 551
    Height = 491
    Align = alClient
    TabOrder = 2
    object pnl5: TPanel
      Left = 1
      Top = 1
      Width = 549
      Height = 29
      Align = alTop
      TabOrder = 0
      DesignSize = (
        549
        29)
      object Label5: TLabel
        Left = 6
        Top = 7
        Width = 211
        Height = 16
        AutoSize = False
        Caption = #24635'/'#21103#24635'  '#25552#21069#19968#24180#26174#31034
      end
      object BitBtn1: TBitBtn
        Left = 486
        Top = 3
        Width = 55
        Height = 22
        Hint = #23548#20986#25968#25454'Excel'
        Anchors = [akTop, akRight]
        Caption = #23548#20986
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = BitBtn1Click
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
    object DBGridEh2: TDBGridEh
      Left = 1
      Top = 30
      Width = 549
      Height = 460
      Align = alClient
      DataSource = DM.DataSource6
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnEnter = DBGridEh2Enter
      OnTitleClick = DBGridEh2TitleClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'departmentname'
          Footers = <>
          Title.Caption = #37096#38376
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'employeecode'
          Footers = <>
          Title.Caption = #24037#21495
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'chinesename'
          Footers = <>
          Title.Caption = #22995#21517
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'position'
          Footers = <>
          Title.Caption = #32844#21153
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'code'
          Footers = <>
          Title.Caption = #21512#21516#32534#21495
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'startdate'
          Footers = <>
          Title.Caption = #24320#22987#26085#26399
          Width = 75
        end
        item
          EditButtons = <>
          FieldName = 'enddate'
          Footers = <>
          Title.Caption = #32467#26463#26085#26399
          Width = 75
        end
        item
          EditButtons = <>
          FieldName = 'employee_typeitem'
          Footers = <>
          Title.Caption = #21512#21516#31867#22411
          Width = 70
        end>
    end
  end
end
