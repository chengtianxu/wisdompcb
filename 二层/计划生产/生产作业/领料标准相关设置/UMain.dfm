object frmMain: TfrmMain
  Left = 349
  Top = 224
  Width = 1052
  Height = 563
  Caption = #39046#26009#35774#32622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 1036
    Height = 525
    Align = alClient
    TabOrder = 0
    object pnl2: TPanel
      Left = 1
      Top = 1
      Width = 1034
      Height = 41
      Align = alTop
      TabOrder = 0
      object lbl_field: TLabel
        Left = 314
        Top = 12
        Width = 52
        Height = 13
        Caption = #24037#21378#31616#31216
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object edt_value: TEdit
        Left = 389
        Top = 8
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
      object btn_refresh: TBitBtn
        Left = 64
        Top = 7
        Width = 60
        Height = 21
        Caption = #21047#26032
        TabOrder = 1
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
      object btn_quit: TBitBtn
        Left = 4
        Top = 7
        Width = 60
        Height = 21
        Caption = #36864#20986
        TabOrder = 2
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
    end
    object pnl3: TPanel
      Left = 1
      Top = 42
      Width = 1034
      Height = 482
      Align = alClient
      TabOrder = 1
      object pgc1: TPageControl
        Left = 1
        Top = 1
        Width = 1032
        Height = 480
        ActivePage = ts2
        Align = alClient
        TabOrder = 0
        object ts2: TTabSheet
          Caption = #25918#20551#21069#19968#22825#39046#26009#22825#35774#32622
          object pnl6: TPanel
            Left = 0
            Top = 0
            Width = 1024
            Height = 411
            Align = alClient
            TabOrder = 0
            object dbgrdh1: TDBGridEh
              Left = 1
              Top = 1
              Width = 1022
              Height = 409
              Align = alClient
              DataSource = ds_day
              FooterColor = clWindow
              FooterFont.Charset = DEFAULT_CHARSET
              FooterFont.Color = clWindowText
              FooterFont.Height = -11
              FooterFont.Name = 'MS Sans Serif'
              FooterFont.Style = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              PopupMenu = pm_day
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnTitleClick = dbgrdh1TitleClick
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'abbr_name'
                  Footers = <>
                  Title.Caption = #24037#21378#21333#31216
                  Width = 82
                end
                item
                  EditButtons = <>
                  FieldName = 'dept_name'
                  Footers = <>
                  Title.Caption = #24037#24207#21517#31216
                  Width = 110
                end
                item
                  EditButtons = <>
                  FieldName = 'ReqDate'
                  Footers = <>
                  Title.Caption = #25918#20551#21069#26085#26399
                  Width = 70
                end
                item
                  EditButtons = <>
                  FieldName = 'FreeDays'
                  Footers = <>
                  Title.Caption = #38656#22810#39046#26009#22825#25968
                  Width = 74
                end
                item
                  EditButtons = <>
                  FieldName = 'remark'
                  Footers = <>
                  Title.Caption = #22791#27880
                  Width = 351
                end>
            end
          end
          object pnl7: TPanel
            Left = 0
            Top = 411
            Width = 1024
            Height = 41
            Align = alBottom
            TabOrder = 1
            object lbl2: TLabel
              Left = 24
              Top = 7
              Width = 855
              Height = 13
              Caption = 
                #25353#20135#20986#22240#32032#39046#26009#26102#65306#25918#20551#21069#26085#26399#22914'2016-07-16'#26159#21608#20845#65292#21608#26085#20179#24211#19981#21457#26009#65292' '#37027#20040#21608#20845#39046#26009#26102#21487#20197#22810#39046#21608#26085#19968#22825#30340#26009#65292#21363#22810#39046#22825#25968#20026'1'#65292 +
                ' '#22914#26524#21518#38754#36830#32493#19977#22825#25918#20551#65292' '#21017#20026'3'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
          end
        end
        object ts1: TTabSheet
          Caption = #24037#24207#39046#26009#25511#21046#35774#32622
          ImageIndex = 1
          object pnl4: TPanel
            Left = 0
            Top = 411
            Width = 1024
            Height = 41
            Align = alBottom
            TabOrder = 0
            object lbl1: TLabel
              Left = 128
              Top = 7
              Width = 240
              Height = 13
              Caption = #35774#32622#21518#24517#39035#25353#26631#20934#39046#26009#65292#27809#26377#26631#20934#19981#20801#35768#39046#26009
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
          end
          object pnl5: TPanel
            Left = 0
            Top = 0
            Width = 1024
            Height = 411
            Align = alClient
            TabOrder = 1
            object dbgrdh2: TDBGridEh
              Left = 1
              Top = 1
              Width = 1022
              Height = 409
              Align = alClient
              DataSource = ds1_process
              FooterColor = clWindow
              FooterFont.Charset = DEFAULT_CHARSET
              FooterFont.Color = clWindowText
              FooterFont.Height = -11
              FooterFont.Name = 'MS Sans Serif'
              FooterFont.Style = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              PopupMenu = pm_process
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnTitleClick = dbgrdh2TitleClick
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'abbr_name'
                  Footers = <>
                  Title.Caption = #24037#21378#31616#31216
                  Width = 115
                end
                item
                  EditButtons = <>
                  FieldName = 'dept_name'
                  Footers = <>
                  Title.Caption = #37096#38376#21517#31216
                end>
            end
          end
        end
      end
    end
  end
  object ds1_process: TDataSource
    DataSet = qry_process
    Left = 605
    Top = 137
  end
  object qry_process: TADOQuery
    Connection = DM.con1
    Parameters = <>
    SQL.Strings = (
      'select a.* ,b.abbr_name,c.dept_name'
      'from data0589 a '
      'inner join data0015 b  on a.fac_ptr=b.rkey'
      'inner join data0034 c  on a.cost_ptr=c.rkey')
    Left = 672
    Top = 137
    object atncfld_processrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object intgrfld_processFac_ptr: TIntegerField
      FieldName = 'Fac_ptr'
    end
    object intgrfld_processcost_ptr: TIntegerField
      FieldName = 'cost_ptr'
    end
    object strngfld_processabbr_name: TStringField
      FieldName = 'abbr_name'
      Size = 10
    end
    object strngfld_processdept_name: TStringField
      FieldName = 'dept_name'
      Size = 30
    end
  end
  object qry_day: TADOQuery
    Connection = DM.con1
    Parameters = <>
    SQL.Strings = (
      'select a.*,b.abbr_name,c.dept_name'
      'from data0590 a'
      'inner join data0015 b  on a.fac_ptr=b.rkey'
      'inner join data0034 c  on a.cost_ptr=c.rkey')
    Left = 37
    Top = 137
    object atncfld_dayrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object intgrfld_dayFac_ptr: TIntegerField
      FieldName = 'Fac_ptr'
    end
    object intgrfld_dayCost_ptr: TIntegerField
      FieldName = 'Cost_ptr'
    end
    object dtmfld_dayReqDate: TDateTimeField
      FieldName = 'ReqDate'
    end
    object fltfld_dayFreeDays: TFloatField
      FieldName = 'FreeDays'
    end
    object strngfld_dayremark: TStringField
      FieldName = 'remark'
      Size = 100
    end
    object strngfld_dayabbr_name: TStringField
      FieldName = 'abbr_name'
      Size = 10
    end
    object strngfld_daydept_name: TStringField
      FieldName = 'dept_name'
      Size = 30
    end
  end
  object ds_day: TDataSource
    DataSet = qry_day
    Left = 77
    Top = 137
  end
  object pm_day: TPopupMenu
    Left = 201
    Top = 225
    object mniN_Add: TMenuItem
      Tag = 1
      Caption = #26032#22686
      OnClick = mniN_AddClick
    end
    object mniN_edit: TMenuItem
      Tag = 2
      Caption = #32534#36753
      OnClick = mniN_editClick
    end
    object mni_del: TMenuItem
      Tag = 4
      Caption = #21024#38500
      OnClick = mni_delClick
    end
  end
  object pm_process: TPopupMenu
    Left = 353
    Top = 225
    object mniN_Add1: TMenuItem
      Tag = 1
      Caption = #26032#22686
      OnClick = mniN_Add1Click
    end
    object mniN_edit1: TMenuItem
      Tag = 2
      Caption = #32534#36753
      OnClick = mniN_edit1Click
    end
    object mni_del1: TMenuItem
      Tag = 4
      Caption = #21024#38500
      OnClick = mni_del1Click
    end
  end
end
