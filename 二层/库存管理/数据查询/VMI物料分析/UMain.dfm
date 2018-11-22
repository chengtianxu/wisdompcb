object FrmMain: TFrmMain
  Left = 454
  Top = 146
  Width = 1088
  Height = 563
  Caption = 'VMI'#29289#26009#20998#26512
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 1080
    Height = 532
    Align = alClient
    TabOrder = 0
    object pnl2: TPanel
      Left = 1
      Top = 1
      Width = 1078
      Height = 40
      Align = alTop
      TabOrder = 0
      object lbl_field: TLabel
        Left = 392
        Top = 16
        Width = 59
        Height = 13
        Caption = ' '#20837#24211#21333#21495
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object edt_value: TEdit
        Left = 453
        Top = 11
        Width = 121
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ImeMode = imDisable
        ParentFont = False
        TabOrder = 0
        OnChange = edt_valueChange
      end
      object btn_quit: TBitBtn
        Left = -12
        Top = 2
        Width = 60
        Height = 28
        Caption = #36864#20986
        TabOrder = 1
        OnClick = btn_quitClick
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          08000000000000020000710B0000710B00000001000000000000000000003300
          00006600000099000000CC000000FF0000000033000033330000663300009933
          0000CC330000FF33000000660000336600006666000099660000CC660000FF66
          000000990000339900006699000099990000CC990000FF99000000CC000033CC
          000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
          0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
          330000333300333333006633330099333300CC333300FF333300006633003366
          33006666330099663300CC663300FF6633000099330033993300669933009999
          3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
          330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
          66006600660099006600CC006600FF0066000033660033336600663366009933
          6600CC336600FF33660000666600336666006666660099666600CC666600FF66
          660000996600339966006699660099996600CC996600FF99660000CC660033CC
          660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
          6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
          990000339900333399006633990099339900CC339900FF339900006699003366
          99006666990099669900CC669900FF6699000099990033999900669999009999
          9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
          990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
          CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
          CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
          CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
          CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
          CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
          FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
          FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
          FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
          FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
          000000808000800000008000800080800000C0C0C00080808000191919004C4C
          4C00B2B2B200E5E5E5005A1E1E00783C3C0096646400C8969600FFC8C800465F
          82005591B9006EB9D7008CD2E600B4E6F000D8E9EC0099A8AC00646F7100E2EF
          F100C56A31000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000EEEEEEEEEEEE
          F1EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEF1EEEEEEEEEEEEEEEEEEEEEEEEF1E3AC
          E3F1EEEEEEEEEEEEEEEEEEEEEEF1EEACE3F1EEEEEEEEEEEEEEEEEEF1E3E28257
          57E2ACE3F1EEEEEEEEEEEEF1EEE2818181E2ACEEF1EEEEEEEEEEE382578282D7
          578181E2E3EEEEEEEEEEEE81818181D7818181E2EEEEEEEEEEEE57828989ADD7
          57797979F1EEEEEEEEEE8181DEDEACD781818181F1EEEEEEEEEE57898989ADD7
          57AAAAA2D7ADEEEEEEEE81DEDEDEACD781DEDE81D7ACEEEEEEEE57898989ADD7
          57AACEA3AD10EEEEEEEE81DEDEDEACD781DEAC81AC81EEEEEEEE5789825EADD7
          57ABCFE21110EEEEEEEE81DE8181ACD781ACACE28181EEEEEEEE578957D7ADD7
          57ABDE101010101010EE81DE56D7ACD781ACDE818181818181EE57898257ADD7
          57EE10101010101010EE81DE8156ACD781E381818181818181EE57898989ADD7
          57EE82101010101010EE81DEDEDEACD781E381818181818181EE57898989ADD7
          57ACF1821110EEEEEEEE81DEDEDEACD781ACF1818181EEEEEEEE57898989ADD7
          57ABEEAB8910EEEEEEEE81DEDEDEACD781ACE3ACDE81EEEEEEEE57828989ADD7
          57ACEEA3EE89EEEEEEEE8181DEDEACD781ACE381EEDEEEEEEEEEEEDE5E8288D7
          57A2A2A2EEEEEEEEEEEEEEDE8181DED781818181EEEEEEEEEEEEEEEEEEAC8257
          57EEEEEEEEEEEEEEEEEEEEEEEEAC818181EEEEEEEEEEEEEEEEEE}
        NumGlyphs = 2
      end
      object btn_refresh: TBitBtn
        Left = 48
        Top = 2
        Width = 60
        Height = 28
        Caption = #21047#26032
        TabOrder = 2
        OnClick = btn_refreshClick
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
      object btn_qry: TBitBtn
        Left = 110
        Top = 2
        Width = 49
        Height = 28
        Caption = #26597#35810
        TabOrder = 3
        OnClick = btn_qryClick
      end
      object btn_Outport: TBitBtn
        Left = 158
        Top = 2
        Width = 60
        Height = 28
        Caption = #23548#20986
        TabOrder = 4
        OnClick = btn_OutportClick
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
    object pnl3: TPanel
      Left = 1
      Top = 41
      Width = 1078
      Height = 490
      Align = alClient
      TabOrder = 1
      object dbgrdh1: TDBGridEh
        Left = 1
        Top = 1
        Width = 1076
        Height = 488
        Align = alClient
        DataSource = ds1
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        FrozenCols = 5
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrdh1DrawColumnCell
        OnTitleClick = dbgrdh1TitleClick
        Columns = <
          item
            EditButtons = <>
            FieldName = #20837#24211#21333#21495
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #26448#26009#32534#21495
            Footers = <>
            Width = 81
          end
          item
            EditButtons = <>
            FieldName = #35268#26684
            Footers = <>
            Width = 176
          end
          item
            EditButtons = <>
            FieldName = #21517#31216
            Footers = <>
            Width = 108
          end
          item
            Color = clHighlightText
            EditButtons = <>
            FieldName = #29366#24577
            Footers = <>
            Width = 41
          end
          item
            EditButtons = <>
            FieldName = #21333#20301
            Footers = <>
            Width = 41
          end
          item
            EditButtons = <>
            FieldName = #20379#24212#21830
            Footers = <>
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = #20179#24211
            Footers = <>
            Width = 53
          end
          item
            EditButtons = <>
            FieldName = #24037#21378
            Footers = <>
            Width = 108
          end
          item
            EditButtons = <>
            FieldName = #20837#24211#26085#26399
            Footers = <>
            Width = 106
          end
          item
            EditButtons = <>
            FieldName = #26377#25928#26399
            Footers = <>
            Width = 67
          end
          item
            EditButtons = <>
            FieldName = #26377#25928#22825#25968
            Footers = <>
            Width = 55
          end
          item
            EditButtons = <>
            FieldName = #25968#37327
            Footers = <>
            Width = 35
          end
          item
            EditButtons = <>
            FieldName = #26412#24065#37329#39069
            Footers = <>
            Width = 53
          end>
      end
    end
  end
  object qry_Main: TADOQuery
    Connection = DM.con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select  a.GRN_NUMBER as '#20837#24211#21333#21495', c.inv_part_number as '#26448#26009#32534#21495', c.inv_p' +
        'art_description '#35268#26684' , '
      'c.inv_name '#21517#31216', d.unit_name '#21333#20301','
      
        'case  when (datediff(day,getdate(),b.EXPIRE_DATE)<=60) and ( dat' +
        'ediff(day,getdate(),b.EXPIRE_DATE)>30) then '#39#36229#26399#39
      
        '      when datediff(day,getdate(),b.EXPIRE_DATE)<=30 then '#39#24322#24120#39' e' +
        'lse '#39#27491#24120#39
      '      end as '#39#29366#24577#39','
      'e.abbr_name '#20379#24212#21830',h.location as '#20179#24211', i.warehouse_name as '#24037#21378','
      'a.ship_DATE as '#20837#24211#26085#26399',EXPIRE_DATE as '#26377#25928#26399'  ,c.SHELF_LIFE as '#26377#25928#22825#25968','
      'ROUND(b.QUAN_ON_HAND,2)  as '#25968#37327',    '
      'ROUND(b.QUAN_ON_HAND * b.tax_price * a.exch_rate, 2)  as '#26412#24065#37329#39069'   '
      'from  data0134  b'
      'inner join data0133 a  on a.rkey=b.GRN_ptr'
      'left join data0017  c on  c.rkey=b.INVENTORY_PTR'
      'left join  data0002 d  on b.UNIT_PTR=d.rkey'
      'left join  data0023  e on e.rkey=a.SUPP_PTR'
      'left  JOIN  Data0496  f ON c.GROUP_PTR = f.RKEY    '
      'left  JOIN  Data0019  g ON f.group_ptr = g.rkey  '
      'left  JOIN  data0016  h  on b.LOCATION_PTR=h.rkey'
      'left  JOIN   data0015 i  on a.warehouse_ptr=i.rkey'
      'where  b.QUAN_ON_HAND>0 and  1=1 ')
    Left = 121
    Top = 161
    object strngfld_MainDSDesigner: TStringField
      FieldName = #20837#24211#21333#21495
      Size = 10
    end
    object strngfld_MainDSDesigner2: TStringField
      FieldName = #26448#26009#32534#21495
      Size = 25
    end
    object strngfld_MainDSDesigner3: TStringField
      FieldName = #35268#26684
      ReadOnly = True
      Size = 100
    end
    object strngfld_MainDSDesigner4: TStringField
      FieldName = #21517#31216
      Size = 30
    end
    object strngfld_MainDSDesigner5: TStringField
      FieldName = #21333#20301
    end
    object strngfld_MainDSDesigner6: TStringField
      FieldName = #20379#24212#21830
      Size = 16
    end
    object strngfld_MainDSDesigner7: TStringField
      FieldName = #20179#24211
    end
    object strngfld_MainDSDesigner8: TStringField
      FieldName = #24037#21378
      Size = 70
    end
    object dtmfld_MainDSDesigner9: TDateTimeField
      FieldName = #20837#24211#26085#26399
    end
    object dtmfld_MainDSDesigner10: TDateTimeField
      FieldName = #26377#25928#26399
    end
    object smlntfld_MainDSDesigner11: TSmallintField
      FieldName = #26377#25928#22825#25968
    end
    object strngfld_MainDSDesigner12: TStringField
      FieldName = #29366#24577
      ReadOnly = True
      Size = 4
    end
    object bcdfld_MainDSDesigner13: TBCDField
      FieldName = #25968#37327
      ReadOnly = True
      Precision = 19
    end
    object bcdfld_MainDSDesigner14: TBCDField
      FieldName = #26412#24065#37329#39069
      ReadOnly = True
      Precision = 32
      Size = 9
    end
  end
  object qry1: TADOQuery
    Parameters = <>
    Left = 337
    Top = 273
  end
  object ds1: TDataSource
    DataSet = qry_Main
    Left = 177
    Top = 153
  end
end
