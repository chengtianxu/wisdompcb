object frmPaperDetail: TfrmPaperDetail
  Left = 529
  Top = 154
  Width = 1077
  Height = 575
  Caption = #35797#39064#26126#32454
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 1069
    Height = 544
    Align = alClient
    TabOrder = 0
    object pnl2: TPanel
      Left = 1
      Top = 1
      Width = 1067
      Height = 41
      Align = alTop
      TabOrder = 0
      object lbl_field: TLabel
        Left = 345
        Top = 15
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Caption = #37096#38376
      end
      object btnExit: TBitBtn
        Left = 1
        Top = 2
        Width = 60
        Height = 39
        Hint = #36864#20986
        Caption = #36864#20986
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        TabStop = False
        OnClick = btnExitClick
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
      object btn_export3: TBitBtn
        Left = 116
        Top = 1
        Width = 60
        Height = 40
        Caption = #23548#20986
        TabOrder = 1
        OnClick = btn_export3Click
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
      object edt_value: TEdit
        Left = 375
        Top = 12
        Width = 91
        Height = 21
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnChange = edt_valueChange
      end
      object btn_refresh3: TBitBtn
        Left = 56
        Top = 2
        Width = 60
        Height = 38
        Caption = #21047#26032
        TabOrder = 3
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000CE0E0000C40E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777777777777777744447777777777444444447777777444777744
          4777777447777774477777447777777744777744777777774477774477777777
          4477774477777777447777744777747447777774477774444777777777777444
          7777777777777444477777777777777777777777777777777777}
      end
    end
    object pnl3: TPanel
      Left = 1
      Top = 42
      Width = 1067
      Height = 501
      Align = alClient
      TabOrder = 1
      object ehPaper: TDBGridEh
        Left = 1
        Top = 1
        Width = 1065
        Height = 499
        Align = alClient
        DataSource = ds1
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnTitleClick = ehPaperTitleClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'ccode'
            Footers = <>
            Title.Caption = #35838#31243#32534#21495
            Width = 85
          end
          item
            EditButtons = <>
            FieldName = 'Cname'
            Footers = <>
            Title.Caption = #35838#31243#21517#31216
            Width = 157
          end
          item
            EditButtons = <>
            FieldName = 'AScore'
            Footers = <>
            Title.Caption = #28385#20998
            Width = 53
          end
          item
            EditButtons = <>
            FieldName = 'Ascore_1'
            Footers = <>
            Title.Caption = #21333#39064#20998#25968
            Width = 54
          end
          item
            EditButtons = <>
            FieldName = 'type'
            Footers = <>
            Title.Caption = #39064#22411
            Width = 44
          end
          item
            EditButtons = <>
            FieldName = 'PNo'
            Footers = <>
            Title.Caption = #39064#21495
            Width = 34
          end
          item
            EditButtons = <>
            FieldName = 'PContent'
            Footers = <>
            Title.Caption = #39064#30446#20869#23481
            Width = 171
          end
          item
            EditButtons = <>
            FieldName = 'A'
            Footers = <>
            Title.Caption = 'A'#36873#39033
            Width = 108
          end
          item
            EditButtons = <>
            FieldName = 'B'
            Footers = <>
            Title.Caption = 'B'#36873#39033
            Width = 130
          end
          item
            EditButtons = <>
            FieldName = 'C'
            Footers = <>
            Title.Caption = 'C'#36873#39033
            Width = 107
          end
          item
            EditButtons = <>
            FieldName = 'D'
            Footers = <>
            Title.Caption = 'D'#36873#39033
            Width = 141
          end
          item
            EditButtons = <>
            FieldName = 'PRight'
            Footers = <>
            Title.Caption = #27491#30830#31572#26696
            Width = 54
          end>
      end
    end
  end
  object ds1: TDataSource
    DataSet = qry1
    Left = 305
    Top = 210
  end
  object qry1: TADOQuery
    Connection = DM.con
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select a.TC_ptr,a.AScore,c.ccode,c.Cname,case when b.Ptype=0 the' +
        'n '#39#21028#26029#39064#39' else '#39#36873#25321#39064#39' end as type,b.*'
      'from  PaperMain a '
      'inner join  PaperDetail  b on a.rkey=b.M_ptr '
      'inner join TrainClass c on a.TC_ptr=c.rkey'
      'where a.tc_ptr=:rkey')
    Left = 385
    Top = 210
  end
end
