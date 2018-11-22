object frmWO_INFO: TfrmWO_INFO
  Left = 357
  Top = 170
  Width = 653
  Height = 459
  Caption = #20316#19994#21333#30456#20851#20449#24687
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 36
    Width = 637
    Height = 385
    ActivePage = ts1
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = #21464#26356#35760#24405
      object Memo1: TMemo
        Left = 0
        Top = 0
        Width = 629
        Height = 357
        Align = alClient
        ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
        ReadOnly = True
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Caption = #25253#24223#20449#24687
      ImageIndex = 1
      object DBGrid2: TDBGrid
        Left = 0
        Top = 0
        Width = 629
        Height = 357
        Align = alClient
        DataSource = Dmcon.dsWO_INFO
        FixedColor = clActiveBorder
        ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'reject_description'
            Title.Caption = #32570#38519#25551#36848
            Width = 143
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dept_name'
            Title.Caption = #30003#35831#24037#24207
            Width = 89
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'resp_dept_name'
            Title.Caption = #36131#20219#37096#38376
            Width = 89
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'tdatetime'
            Title.Caption = #25253#24223#26085#26399
            Width = 96
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'qty_reject'
            Title.Alignment = taRightJustify
            Title.Caption = #25253#24223#25968#37327
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'panels'
            Title.Caption = 'PNL'#25968#37327
            Width = 51
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMPLOYEE_NAME'
            Title.Alignment = taCenter
            Title.Caption = #25253#24223#20154#21592
            Width = 59
            Visible = True
          end>
      end
    end
    object TabSheet3: TTabSheet
      Caption = #27969#36716#20449#24687
      ImageIndex = 2
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 629
        Height = 357
        Align = alClient
        DataSource = Dmcon.dsWO_INFO
        FixedColor = clActiveBorder
        ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'WORK_ORDER_NUMBER'
            Title.Alignment = taCenter
            Title.Caption = #20316#19994#21333#21495
            Width = 108
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dptname'
            Title.Alignment = taCenter
            Title.Caption = #24037#24207
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'INTIME'
            Title.Alignment = taCenter
            Title.Caption = #25910#26495#26102#38388
            Width = 97
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OUTTIME'
            Title.Alignment = taCenter
            Title.Caption = #36865#26495#26102#38388
            Width = 97
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTY_PROD'
            Title.Alignment = taCenter
            Title.Caption = #20135#20986#25968#37327
            Width = 62
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'wtype'
            Title.Alignment = taCenter
            Title.Caption = #36807#25968#31867#22411
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'employee_name'
            Title.Alignment = taCenter
            Title.Caption = #25509#25910#20154
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ACTION_REF'
            Title.Alignment = taCenter
            Title.Caption = #22791#27880
            Width = 60
            Visible = True
          end>
      end
    end
    object TabSheet4: TTabSheet
      Caption = #24037#33402#27969#31243
      ImageIndex = 3
      object DBGrid3: TDBGrid
        Left = 0
        Top = 0
        Width = 629
        Height = 357
        Align = alClient
        DataSource = Dmcon.dsWO_INFO
        ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
        PopupMenu = PopupMenu2
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'step_number'
            Title.Alignment = taCenter
            Title.Caption = #27493#39588
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dept_code'
            Title.Alignment = taCenter
            Title.Caption = #24037#33402#20195#21495
            Width = 105
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dept_name'
            Title.Alignment = taCenter
            Title.Caption = #24037#33402#21517#31216
            Width = 230
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'barcode_entry_flag'
            Title.Alignment = taCenter
            Title.Caption = #26159#21542#36807#25968
            Width = 78
            Visible = True
          end>
      end
    end
    object TabSheet5: TTabSheet
      Caption = #23436#24037#20449#24687
      ImageIndex = 4
      object DBGrid4: TDBGrid
        Left = 0
        Top = 0
        Width = 629
        Height = 357
        Align = alClient
        DataSource = Dmcon.dsWO_INFO
        FixedColor = clActiveBorder
        ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'WORK_ORDER_NUMBER'
            Title.Alignment = taCenter
            Title.Caption = #20316#19994#21333#21495
            Width = 157
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'mfg_date'
            Title.Alignment = taCenter
            Title.Caption = #20837#20179#26085#26399
            Width = 127
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'quantity'
            Title.Alignment = taCenter
            Title.Caption = #20837#20179#25968#37327
            Width = 118
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Warehouse_name'
            Title.Alignment = taCenter
            Title.Caption = #24037#21378
            Width = 197
            Visible = True
          end>
      end
    end
    object ts1: TTabSheet
      Caption = #24037#31243#25991#26723
      ImageIndex = 5
      object dbgrd1: TDBGrid
        Left = 0
        Top = 0
        Width = 629
        Height = 357
        Align = alClient
        DataSource = Dmcon.dsWO_INFO
        ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = pm1
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnDblClick = eh1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'rec_no'
            Title.Caption = #24207#21495
            Width = 38
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'file_name'
            Title.Caption = #25991#20214#21517
            Width = 139
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'in_date'
            Title.Caption = #19978#20256#26085#26399
            Width = 109
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'remark'
            Title.Caption = #22791#27880#35828#26126
            Width = 197
            Visible = True
          end>
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 637
    Height = 36
    Align = alTop
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 8
      Top = 5
      Width = 62
      Height = 26
      Hint = #36864#20986#31995#32479
      Caption = #36864#20986
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
  end
  object PopupMenu2: TPopupMenu
    Left = 316
    Top = 216
    object MenuItem1: TMenuItem
      Caption = #26597#30475#21046#31243#21442#25968
      OnClick = MenuItem1Click
    end
  end
  object pm1: TPopupMenu
    OnPopup = pm1Popup
    Left = 172
    Top = 204
    object nN1: TMenuItem
      Caption = #25171#24320#25991#26723
      OnClick = nN1Click
    end
  end
end
