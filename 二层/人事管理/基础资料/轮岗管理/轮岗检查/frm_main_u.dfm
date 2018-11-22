object frm_main: Tfrm_main
  Left = 249
  Top = 177
  Width = 800
  Height = 585
  Caption = #20154#20107#36718#23703#26816#26597
  Color = clWindow
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 30
    Align = alTop
    TabOrder = 0
    DesignSize = (
      792
      30)
    object btn2: TBitBtn
      Left = 6
      Top = 3
      Width = 65
      Height = 25
      Anchors = []
      Caption = #36864#20986
      TabOrder = 0
      OnClick = btn2Click
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 530
    Width = 792
    Height = 21
    Align = alBottom
    TabOrder = 2
  end
  object pnl3: TPanel
    Left = 0
    Top = 30
    Width = 792
    Height = 500
    Align = alClient
    TabOrder = 1
    object pgc1: TPageControl
      Left = 1
      Top = 1
      Width = 790
      Height = 498
      ActivePage = ts1
      Align = alClient
      PopupMenu = pm1
      TabOrder = 0
      OnChange = pgc1Change
      object ts1: TTabSheet
        Caption = #23703#20301#26816#26597'                    '
        object Grd1: TDBGridEh
          Left = 0
          Top = 29
          Width = 782
          Height = 400
          Align = alClient
          AllowedOperations = []
          DataSource = DM.ds1
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          PopupMenu = pm1
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = Grd1DrawColumnCell
          OnTitleClick = Grd1TitleClick
          Columns = <
            item
              EditButtons = <>
              FieldName = 'departmentname'
              Footers = <>
              Title.Caption = #37096#38376
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'employeecode'
              Footers = <>
              Title.Caption = #24037#21495
              Width = 45
            end
            item
              EditButtons = <>
              FieldName = 'chinesename'
              Footers = <>
              Title.Caption = #22995#21517
              Width = 50
            end
            item
              EditButtons = <>
              FieldName = 'position_item'
              Footers = <>
              Title.Caption = #32844#21153
              Width = 75
            end
            item
              EditButtons = <>
              FieldName = 'begindate'
              Footers = <>
              Title.Caption = #20219#21629#26085#26399
              Width = 65
            end
            item
              EditButtons = <>
              FieldName = 'position_keeptime_char'
              Footers = <>
              Title.Caption = #22312#23703#26376#25968
              Width = 70
            end
            item
              EditButtons = <>
              FieldName = 'position_keeptime'
              Footers = <>
              Title.Caption = #22312#23703#26376#25968
              Width = 55
            end
            item
              EditButtons = <>
              FieldName = 'circle'
              Footers = <>
              Title.Caption = #20219#26399#39044#23450#26376#25968
              Width = 75
            end
            item
              EditButtons = <>
              FieldName = 'extra_month'
              Footers = <>
              Title.Caption = #24310#21152#26376#25968
              Width = 55
            end
            item
              EditButtons = <>
              FieldName = 'remain_month'
              Footers = <>
              Title.Caption = #20219#26399#24635#26376#25968
              Width = 70
            end
            item
              EditButtons = <>
              FieldName = 'month_left'
              Footers = <>
              Title.Caption = #21097#20313#26376#25968
              Width = 55
            end
            item
              EditButtons = <>
              FieldName = 'ondutytime'
              Footers = <>
              Title.Caption = #20837#32844#26102#38388
              Width = 65
            end
            item
              EditButtons = <>
              FieldName = 'workyear'
              Footers = <>
              Title.Caption = #24037#40836
              Width = 70
            end
            item
              EditButtons = <>
              FieldName = 'workage'
              Footers = <>
              Title.Caption = #24037#40836#26376
              Width = 40
            end
            item
              EditButtons = <>
              FieldName = 'extra_remark'
              Footers = <>
              Title.Caption = #22791#27880
              Width = 140
            end
            item
              EditButtons = <>
              FieldName = 'departmentid'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'position'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'rkey'
              Footers = <>
              Visible = False
            end>
        end
        object pnl4: TPanel
          Left = 0
          Top = 0
          Width = 782
          Height = 29
          Align = alTop
          TabOrder = 0
          object Label1: TLabel
            Left = 149
            Top = 10
            Width = 84
            Height = 13
            AutoSize = False
          end
          object Edit1: TEdit
            Left = 236
            Top = 7
            Width = 121
            Height = 19
            TabOrder = 2
            OnChange = Edit1Change
          end
          object btn1: TBitBtn
            Left = 8
            Top = 4
            Width = 65
            Height = 21
            Caption = #21047#26032
            TabOrder = 0
            OnClick = btn1Click
          end
          object btn3: TBitBtn
            Left = 76
            Top = 4
            Width = 65
            Height = 21
            Caption = #23548#20986
            TabOrder = 1
            OnClick = btn3Click
          end
        end
        object pnl6: TPanel
          Left = 0
          Top = 429
          Width = 782
          Height = 41
          Align = alBottom
          Caption = 'pnl6'
          TabOrder = 2
          object rg1: TRadioGroup
            Left = 1
            Top = 1
            Width = 780
            Height = 39
            Align = alClient
            Columns = 4
            Items.Strings = (
              #20840#37096
              #20219#26399#21097'3'#20010#26376#20197#19978
              #20219#26399#21097'3'#20010#26376#20197#20869
              #36229#36807#20219#26399)
            TabOrder = 0
            OnClick = rg1Click
          end
        end
      end
      object ts2: TTabSheet
        Caption = #36718#23703#22791#27880'                     '
        ImageIndex = 1
        object pnl5: TPanel
          Left = 0
          Top = 0
          Width = 782
          Height = 29
          Align = alTop
          TabOrder = 0
          object Label2: TLabel
            Left = 149
            Top = 10
            Width = 84
            Height = 13
            AutoSize = False
          end
          object BitBtn1: TBitBtn
            Left = 76
            Top = 4
            Width = 65
            Height = 21
            Caption = #23548#20986
            TabOrder = 1
            OnClick = BitBtn1Click
          end
          object BitBtn2: TBitBtn
            Left = 8
            Top = 4
            Width = 65
            Height = 21
            Caption = #21047#26032
            TabOrder = 0
            OnClick = BitBtn2Click
          end
          object Edit2: TEdit
            Left = 236
            Top = 7
            Width = 121
            Height = 19
            TabOrder = 2
            OnChange = Edit2Change
          end
        end
        object grd2: TDBGridEh
          Left = 0
          Top = 29
          Width = 782
          Height = 448
          Align = alClient
          DataSource = DM.ds2
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          PopupMenu = pm1
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnTitleClick = grd2TitleClick
          Columns = <
            item
              EditButtons = <>
              FieldName = 'departmentname'
              Footers = <>
              Title.Caption = #37096#38376
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'employeecode'
              Footers = <>
              Title.Caption = #24037#21495
              Width = 50
            end
            item
              EditButtons = <>
              FieldName = 'chinesename'
              Footers = <>
              Title.Caption = #22995#21517
              Width = 50
            end
            item
              EditButtons = <>
              FieldName = 'item'
              Footers = <>
              Title.Caption = #32844#21153
              Width = 75
            end
            item
              EditButtons = <>
              FieldName = 'startdate'
              Footers = <>
              Title.Caption = #20219#32844#26085#26399
              Width = 75
            end
            item
              EditButtons = <>
              FieldName = 'circle'
              Footers = <>
              Title.Caption = #23703#20301#21608#26399
              Width = 55
            end
            item
              EditButtons = <>
              FieldName = 'extra_month'
              Footers = <>
              Title.Caption = #24310#38271#26376#25968
              Width = 60
            end
            item
              EditButtons = <>
              FieldName = 'enddate'
              Footers = <>
              Title.Caption = #20219#28385#26085#26399
              Width = 75
            end
            item
              EditButtons = <>
              FieldName = 'employee_name'
              Footers = <>
              Title.Caption = #25805#20316#21592
              Width = 75
            end
            item
              EditButtons = <>
              FieldName = 'operate_date'
              Footers = <>
              Title.Caption = #25805#20316#26085#26399
              Width = 120
            end
            item
              EditButtons = <>
              FieldName = 'extra_remark'
              Footers = <>
              Title.Caption = #22791#27880
              Width = 200
            end
            item
              EditButtons = <>
              FieldName = 'rkey'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'employeeid'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'oper_0005'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'Positionid'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'departmentid'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'visible'
              Footers = <>
              Visible = False
            end>
        end
      end
    end
  end
  object pm1: TPopupMenu
    OnPopup = pm1Popup
    Left = 293
    Top = 226
    object N1: TMenuItem
      Caption = '-'
    end
    object N2: TMenuItem
      Tag = 1
      Caption = #28155#21152#24310#29992#22791#27880
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object N4: TMenuItem
      Tag = 2
      Caption = #20462#25913#24310#29992#22791#27880
      OnClick = N2Click
    end
    object N5: TMenuItem
      Caption = '-'
    end
  end
end
