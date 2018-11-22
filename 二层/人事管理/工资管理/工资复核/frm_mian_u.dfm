object frm_main: Tfrm_main
  Left = 437
  Top = 145
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #24037#36164#22797#26680
  ClientHeight = 412
  ClientWidth = 726
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 726
    Height = 33
    Align = alTop
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 1
      Top = 1
      Width = 73
      Height = 31
      Caption = #36864#20986
      TabOrder = 0
      OnClick = BitBtn1Click
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
  object Panel2: TPanel
    Left = 0
    Top = 33
    Width = 726
    Height = 379
    Align = alClient
    TabOrder = 1
    object lbl1: TLabel
      Left = 240
      Top = 8
      Width = 7
      Height = 13
      Cursor = crAppStart
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 724
      Height = 377
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = #24037#36164#22797#26680
        object BitBtn2: TBitBtn
          Left = 494
          Top = 37
          Width = 81
          Height = 25
          Caption = #26032#22686#26376#20221
          TabOrder = 0
          OnClick = BitBtn2Click
        end
        object BitBtn3: TBitBtn
          Left = 494
          Top = 87
          Width = 81
          Height = 25
          Caption = #23457#26680
          TabOrder = 1
          OnClick = BitBtn3Click
        end
        object BitBtn6: TBitBtn
          Left = 494
          Top = 138
          Width = 81
          Height = 25
          Caption = #21453#23457#26680
          TabOrder = 2
          OnClick = BitBtn6Click
        end
        object BitBtn4: TBitBtn
          Left = 494
          Top = 189
          Width = 81
          Height = 25
          Caption = #28608#27963#26376#20221
          TabOrder = 3
          OnClick = BitBtn4Click
        end
        object BitBtn5: TBitBtn
          Left = 494
          Top = 240
          Width = 81
          Height = 25
          Caption = #21021#22987#21270
          TabOrder = 4
          OnClick = BitBtn5Click
        end
        object DBGrid1: TDBGrid
          Left = 0
          Top = 0
          Width = 473
          Height = 349
          Align = alLeft
          DataSource = DM.DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'checkyearmonth'
              Title.Alignment = taCenter
              Title.Caption = #26376#20221
              Width = 120
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'S_actived'
              Title.Alignment = taCenter
              Title.Caption = #28608#27963
              Width = 65
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'S_ischeck'
              Title.Alignment = taCenter
              Title.Caption = #23457#26680
              Width = 50
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'S_checkman'
              Title.Alignment = taCenter
              Title.Caption = #23457#26680#20154
              Width = 60
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'checkdate'
              Title.Alignment = taCenter
              Title.Caption = #23457#26680#26085#26399
              Width = 65
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'checkdesc'
              Title.Alignment = taCenter
              Title.Caption = #22791#27880
              Width = 70
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'status'
              Title.Alignment = taCenter
              Visible = False
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'rkey'
              Title.Alignment = taCenter
              Visible = False
            end>
        end
      end
      object TabSheet2: TTabSheet
        Caption = #21608#26411#21152#29677#22825#35774#32622'('#28145#22323#29992')'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ImageIndex = 1
        ParentFont = False
        object lbl2: TLabel
          Left = 506
          Top = 3
          Width = 130
          Height = 13
          Alignment = taCenter
          Caption = #28155#21152#19968#34892#25353#21521#19979#31661#22836#65292
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object lbl3: TLabel
          Left = 506
          Top = 19
          Width = 137
          Height = 13
          Alignment = taCenter
          Caption = #22825#25968#40664#35748#20026'4'#22825#65292#21487#20462#25913
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object btn_save: TBitBtn
          Left = 526
          Top = 61
          Width = 81
          Height = 25
          Caption = #20445#23384
          TabOrder = 0
          OnClick = btn_saveClick
        end
        object btn_audit: TBitBtn
          Left = 526
          Top = 167
          Width = 81
          Height = 25
          Caption = #23457#26680
          TabOrder = 1
          OnClick = btn_auditClick
        end
        object btn_NoAudit: TBitBtn
          Left = 526
          Top = 202
          Width = 81
          Height = 25
          Caption = #21453#23457#26680
          TabOrder = 2
          OnClick = btn_NoAuditClick
        end
        object DBGrid2: TDBGrid
          Left = 0
          Top = 0
          Width = 489
          Height = 349
          Align = alLeft
          DataSource = ds
          PopupMenu = PopupMenu1
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'YearMonth'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Caption = #24180#26376
              Title.Color = clRed
              Width = 53
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'days'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Caption = #21608#26411#19978#29677#22825#25968
              Title.Color = clRed
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'remark'
              Title.Caption = #22791#27880
              Width = 130
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'status2'
              Title.Caption = #23457#26680
              Width = 54
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ODate'
              Title.Caption = #23457#26680#26085#26399
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'operator'
              Title.Caption = #23457#26680#20154
              Visible = True
            end>
        end
      end
    end
  end
  object qry_Main: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select a.rkey,a.YearMonth,days,a.remark,'
      'isnull(b.employee_name, '#39#39') as operator ,'
      'a.ODate,a.status,'
      '(case  when a.status=0  then '#39#26410#23457#26680#39' else '#39#24050#23457#26680#39' end)  as  status2'
      'from overworkset  a '
      'left join  data0005 b on  a.oper_id=b.rkey')
    Left = 189
    Top = 210
    object qry_MainYearMonth: TStringField
      FieldName = 'YearMonth'
      Size = 7
    end
    object qry_Mainremark: TStringField
      FieldName = 'remark'
      Size = 50
    end
    object qry_MainODate: TDateTimeField
      FieldName = 'ODate'
      ReadOnly = True
    end
    object qry_Mainstatus: TIntegerField
      FieldName = 'status'
      ReadOnly = True
    end
    object qry_Mainrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object qry_Mainstatus2: TStringField
      FieldName = 'status2'
      ReadOnly = True
      Size = 6
    end
    object qry_Mainoperator: TStringField
      FieldName = 'operator'
      ReadOnly = True
      Size = 16
    end
    object fltfld_Maindays: TFloatField
      FieldName = 'days'
    end
  end
  object ds: TDataSource
    DataSet = qry_Main
    Left = 261
    Top = 218
  end
  object PopupMenu1: TPopupMenu
    Left = 109
    Top = 210
    object N_del: TMenuItem
      Caption = #21024#38500
      OnClick = N_delClick
    end
  end
end
