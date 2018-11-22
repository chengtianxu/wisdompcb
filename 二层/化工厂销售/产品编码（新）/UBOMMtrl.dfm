object frmBOMMtrl: TfrmBOMMtrl
  Left = 338
  Top = 76
  Width = 1078
  Height = 655
  Caption = #29289#25511'BOM'#31649#29702
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 1070
    Height = 624
    Align = alClient
    TabOrder = 0
    object pnl2: TPanel
      Left = 1
      Top = 1
      Width = 1068
      Height = 40
      Align = alTop
      TabOrder = 0
      object btn_Close: TBitBtn
        Left = 4
        Top = 4
        Width = 61
        Height = 28
        Hint = #36864#20986
        Caption = #20851#38381
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        TabStop = False
        OnClick = btn_CloseClick
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
      object btn_Refresh: TBitBtn
        Left = 65
        Top = 4
        Width = 61
        Height = 28
        Caption = #21047#26032
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btn_RefreshClick
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
      object btn_Export1: TBitBtn
        Left = 126
        Top = 4
        Width = 67
        Height = 28
        Hint = #23548#20986#24403#21069'BOM'
        Caption = #23548#20986'1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btn_Export1Click
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
      object btn_Export2: TBitBtn
        Left = 194
        Top = 4
        Width = 67
        Height = 28
        Hint = #23548#20986#24403#21069#25152#26377#24050#23457#26680'BOM'
        Caption = #23548#20986'2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = btn_Export2Click
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
      object btn_UpdateMtrl: TButton
        Left = 688
        Top = 5
        Width = 89
        Height = 28
        Caption = #26356#26032'BOM'#29289#26009
        TabOrder = 4
        OnClick = btn_UpdateMtrlClick
      end
    end
    object pnl3: TPanel
      Left = 1
      Top = 41
      Width = 1068
      Height = 227
      Align = alClient
      TabOrder = 1
      object eh494: TDBGridEh
        Left = 1
        Top = 33
        Width = 1066
        Height = 193
        Align = alClient
        DataSource = DM.ds_WZCp494
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -13
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        PopupMenu = pm494
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnKeyDown = eh494KeyDown
        OnTitleClick = eh494TitleClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'part_name'
            Footers = <>
            Title.Caption = 'BOM'#21517#31216
            Width = 86
          end
          item
            EditButtons = <>
            FieldName = 'prod_code'
            Footers = <>
            Title.Caption = #24037#31243#32534#30721
            Visible = False
            Width = 109
          end
          item
            EditButtons = <>
            FieldName = 'product_name'
            Footers = <>
            Title.Caption = #20135#21697#21517#31216
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'status_c'
            Footers = <>
            Title.Caption = #29366#24577
            Width = 48
          end
          item
            EditButtons = <>
            FieldName = 'EMPLOYEE_NAME_2'
            Footers = <>
            Title.Caption = #21019#24314#20154
            Width = 69
          end
          item
            EditButtons = <>
            FieldName = 'auth3_date'
            Footers = <>
            Title.Caption = #21019#24314#26085#26399
          end
          item
            EditButtons = <>
            FieldName = 'EMPLOYEE_NAME'
            Footers = <>
            Title.Caption = #24037#31243#23457#26680#20154
          end
          item
            EditButtons = <>
            FieldName = 'auth_date'
            Footers = <>
            Title.Caption = #24037#31243#23457#26680#26085#26399
          end
          item
            EditButtons = <>
            FieldName = 'EMPLOYEE_NAME_1'
            Footers = <>
            Title.Caption = #29289#25511#23457#26680#20154
          end
          item
            EditButtons = <>
            FieldName = 'auth2_date'
            Footers = <>
            Title.Caption = #29289#25511#23457#26680#26085#26399
            Width = 94
          end>
      end
      object pnl7: TPanel
        Left = 1
        Top = 1
        Width = 1066
        Height = 32
        Align = alTop
        TabOrder = 1
        object lbl_field1: TLabel
          Left = 20
          Top = 9
          Width = 47
          Height = 13
          Caption = 'BOM'#21517#31216
        end
        object edt_value1: TEdit
          Left = 82
          Top = 4
          Width = 140
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnChange = edt_value1Change
        end
      end
    end
    object pnl4: TPanel
      Left = 1
      Top = 268
      Width = 1068
      Height = 355
      Align = alBottom
      TabOrder = 2
      object pnl5: TPanel
        Left = 1
        Top = 1
        Width = 1066
        Height = 32
        Align = alTop
        TabOrder = 0
        object lbl_field2: TLabel
          Left = 19
          Top = 9
          Width = 52
          Height = 13
          Caption = #29289#26009#32534#30721
        end
        object edt_value2: TEdit
          Left = 81
          Top = 4
          Width = 140
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnChange = edt_value2Change
        end
        object btn_GetAppQty: TButton
          Left = 928
          Top = 4
          Width = 89
          Height = 25
          Caption = #26174#31034#30003#39046#25968#37327
          TabOrder = 1
          OnClick = btn_GetAppQtyClick
        end
      end
      object pnl6: TPanel
        Left = 1
        Top = 33
        Width = 1066
        Height = 321
        Align = alClient
        TabOrder = 1
        object eh495: TDBGridEh
          Left = 1
          Top = 1
          Width = 1064
          Height = 319
          Align = alClient
          DataSource = DM.ds_WZCp495
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -13
          FooterFont.Name = #23435#20307
          FooterFont.Style = []
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          OnKeyDown = eh495KeyDown
          OnTitleClick = eh495TitleClick
          Columns = <
            item
              EditButtons = <>
              FieldName = 'seq_no'
              Footers = <>
              Title.Caption = #24207#21495
              Width = 35
            end
            item
              EditButtons = <>
              FieldName = 'inv_part_number'
              Footers = <>
              Title.Caption = #29289#26009#32534#30721
              Width = 92
            end
            item
              EditButtons = <>
              FieldName = 'inv_name'
              Footers = <>
              Title.Caption = #29289#26009#21517#31216
              Width = 117
            end
            item
              EditButtons = <>
              FieldName = 'INV_DESCRIPTION'
              Footers = <>
              Title.Caption = #29289#26009#35268#26684
              Width = 122
            end
            item
              EditButtons = <>
              FieldName = 'QUAN_ISSUED'
              Footers = <>
              Title.Caption = #24050#30003#35831#25968#37327
              Width = 66
            end
            item
              EditButtons = <>
              FieldName = 'QUAN_BOM'
              Footers = <>
              Title.Caption = 'BOM'#38656#27714#25968
              Width = 69
            end
            item
              EditButtons = <>
              FieldName = 'QUAN_ON_HAND'
              Footers = <>
              Title.Caption = #24211#23384#25968
              Width = 52
            end
            item
              EditButtons = <>
              FieldName = 'p_code'
              Footers = <>
              Title.Caption = #37319#36141#20248#20808#31561#32423
              Width = 87
            end
            item
              EditButtons = <>
              FieldName = 'production_teamname'
              Footers = <>
              Title.Caption = #29983#20135#29677#32452
            end
            item
              EditButtons = <>
              FieldName = 'unit_name'
              Footers = <>
              Title.Caption = #21333#20301
              Width = 58
            end
            item
              EditButtons = <>
              FieldName = 'STD_COST'
              Footers = <>
              Title.Caption = #26631#20934#25104#26412
              Width = 73
            end
            item
              EditButtons = <>
              FieldName = 'TotalCost'
              Footers = <>
              Title.Caption = #24635#25104#26412
              Width = 72
            end
            item
              EditButtons = <>
              FieldName = 'VENDOR'
              Footers = <>
              Title.Caption = #22791#27880
              Width = 109
            end
            item
              EditButtons = <>
              FieldName = 'inv_name_r'
              Footers = <>
              Title.Caption = #26367#20195#29289#26009#21517#31216
              Width = 122
            end
            item
              EditButtons = <>
              FieldName = 'INV_DESCRIPTION_r'
              Footers = <>
              Title.Caption = #26367#20195#29289#26009#35268#26684
              Width = 124
            end
            item
              EditButtons = <>
              FieldName = 'inv_part_number_r'
              Footers = <>
              Title.Caption = #26367#20195#29289#26009#32534#30721
              Width = 111
            end
            item
              EditButtons = <>
              FieldName = 'STOP_PURCH'
              Footers = <>
              Title.Caption = #20572#27490#37319#36141
              Width = 63
            end
            item
              EditButtons = <>
              FieldName = 'STOP_PURCH1'
              Footers = <>
              Title.Caption = #26367#20195#29289#26009#20572#27490#37319#36141
              Width = 82
            end>
        end
      end
    end
  end
  object qrytemp: TADOQuery
    Connection = DM.ADOCon
    Parameters = <>
    Left = 169
    Top = 121
  end
  object pm494: TPopupMenu
    OnPopup = pm494Popup
    Left = 474
    Top = 139
    object mni_Add: TMenuItem
      Caption = #26032#22686
      OnClick = mni_AddClick
    end
    object mni_Edit: TMenuItem
      Tag = 1
      Caption = #20462#25913
      OnClick = mni_EditClick
    end
    object mni_Del: TMenuItem
      Tag = 2
      Caption = #21024#38500
      OnClick = mni_DelClick
    end
    object mniN4: TMenuItem
      Caption = '-'
    end
    object mni_EngAUdit: TMenuItem
      Tag = 3
      Caption = #24037#31243#23457#26680
      OnClick = mni_EngAUditClick
    end
    object mniEngNoAUdit: TMenuItem
      Tag = 4
      Caption = #24037#31243#21462#28040#23457#26680
      OnClick = mniEngNoAUditClick
    end
    object mniN10: TMenuItem
      Caption = '-'
    end
    object mni_MCtrlAudit: TMenuItem
      Tag = 7
      Caption = #29289#25511#23457#26680
      OnClick = mni_MCtrlAuditClick
    end
    object mni_MCtrNolAudit: TMenuItem
      Tag = 8
      Caption = #29289#25511#21462#28040#23457#26680
      OnClick = mni_MCtrNolAuditClick
    end
    object mniN7: TMenuItem
      Caption = '-'
    end
    object mni_ReCal: TMenuItem
      Tag = 6
      Caption = #37325#31639#20135#21697#26631#20934#25104#26412
      OnClick = mni_ReCalClick
    end
    object mni_Cancel: TMenuItem
      Tag = 5
      Caption = #20316#24223
      OnClick = mni_CancelClick
    end
  end
  object qry495S: TADOQuery
    Connection = DM.ADOCon
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select * from wzcp0495 where  1=0')
    Left = 434
    Top = 397
  end
  object qrytemp494: TADOQuery
    Connection = DM.ADOCon
    Parameters = <>
    Left = 233
    Top = 129
  end
end
