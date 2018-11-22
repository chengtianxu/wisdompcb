object frm_detail: Tfrm_detail
  Left = 169
  Top = 118
  Width = 773
  Height = 488
  Caption = #36820#24037#30003#35831#26126#32454
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 765
    Height = 244
    Align = alTop
    TabOrder = 0
    object pnl3: TPanel
      Left = 1
      Top = 1
      Width = 763
      Height = 20
      Align = alTop
      TabOrder = 0
      object lbl1: TLabel
        Left = 2
        Top = 5
        Width = 287
        Height = 13
        AutoSize = False
        Caption = #22312#32447#20316#19994#21333#36820#24037#30003#35831#26126#32454
      end
    end
    object dbgrd1: TDBGrid
      Left = 1
      Top = 21
      Width = 763
      Height = 222
      Align = alClient
      DataSource = DM.DataSource3
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = #24037#21333#21495
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = #37197#26009#21333#21495
          Width = 61
          Visible = True
        end
        item
          Expanded = False
          FieldName = #20316#19994#21333#25351#38024
          Visible = False
        end
        item
          Expanded = False
          FieldName = #26412#21378#32534#21495
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = #24403#21069#24037#24207#21517#31216
          Title.Caption = #24403#21069#24037#24207
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = #24403#21069#24037#24207
          Visible = False
        end
        item
          Expanded = False
          FieldName = #25552#20132#26102#36873#25321#30340#38144#21806#35746#21333
          Visible = False
        end
        item
          Expanded = False
          FieldName = #24403#21069#36807#25968#20154#25351#38024
          Visible = False
        end
        item
          Expanded = False
          FieldName = #27969#31243#21495
          Width = 54
          Visible = True
        end
        item
          Expanded = False
          FieldName = #24403#21069#27493#39588
          Width = 51
          Visible = True
        end
        item
          Expanded = False
          FieldName = #24403#21069#36807#25968#20154#21592
          Width = 74
          Visible = True
        end
        item
          Expanded = False
          FieldName = #24403#21069#22312#32447#25968#37327'PCS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = #24403#21069#22312#32447#25968#37327'pan'
          Width = 91
          Visible = True
        end
        item
          Expanded = False
          FieldName = #25509#25910#26102#38388
          Visible = True
        end
        item
          Expanded = False
          FieldName = #24453#20837#24211#25968#37327
          Visible = True
        end
        item
          Expanded = False
          FieldName = #21019#24314#26085#26399
          Visible = True
        end
        item
          Expanded = False
          FieldName = #20020#26102#24037#21378#25351#38024
          Visible = False
        end
        item
          Expanded = False
          FieldName = #20020#26102#24037#21378#21517#31216
          Visible = True
        end
        item
          Expanded = False
          FieldName = #36820#24037#20043#21069#27493#39588#21495
          Visible = True
        end
        item
          Expanded = False
          FieldName = #22791#27880
          Visible = True
        end
        item
          Expanded = False
          FieldName = #24453#20837#24211'PNL'#25968
          Visible = True
        end
        item
          Expanded = False
          FieldName = #27491#24120#37325#26816#21019#24314#30340#22312#32447
          Visible = True
        end
        item
          Expanded = False
          FieldName = #20837#24211#23457#26680#26102#26159#21542#36873#25321
          Visible = True
        end
        item
          Expanded = False
          FieldName = #25552#20132#20837#24211#26085#26399
          Visible = True
        end
        item
          Expanded = False
          FieldName = #23458#25143#35746#21333#21495
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'rkey'
          Visible = False
        end>
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 244
    Width = 765
    Height = 217
    Align = alClient
    TabOrder = 1
    object pnl4: TPanel
      Left = 1
      Top = 1
      Width = 763
      Height = 20
      Align = alTop
      TabOrder = 0
      object lbl2: TLabel
        Left = 4
        Top = 6
        Width = 317
        Height = 13
        AutoSize = False
        Caption = #36820#24037#20316#19994#21333#36820#24037#24037#24207#26126#32454
      end
    end
    object dbgrd2: TDBGrid
      Left = 1
      Top = 21
      Width = 763
      Height = 195
      Align = alClient
      DataSource = DM.DataSource4
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'rkey203'
          Title.Alignment = taCenter
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'dept_name'
          Title.Alignment = taCenter
          Title.Caption = #24037#24207
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DEPT_PTR'
          Title.Alignment = taCenter
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DEF_ROUT_INST'
          Title.Alignment = taCenter
          Title.Caption = #21152#24037#25351#31034
          Width = 240
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STEP_NUMBER'
          Title.Alignment = taCenter
          Title.Caption = #26032#27493#39588#21495
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tooling_rev'
          Title.Alignment = taCenter
          Title.Caption = #24037#20855#29256#26412
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOOL_REMARK'
          Title.Alignment = taCenter
          Title.Caption = #24037#20855#29256#26412#22791#27880
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Old_Step_NO'
          Title.Alignment = taCenter
          Title.Caption = #21407#27969#31243#27493#39588#21495
          Visible = True
        end>
    end
  end
end
