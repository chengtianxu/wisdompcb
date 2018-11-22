object frmWork: TfrmWork
  Left = 430
  Top = 233
  Width = 700
  Height = 443
  Caption = #20316#19994#21333#36873#25321
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 684
    Height = 33
    Align = alTop
    TabOrder = 0
    object lbl1: TLabel
      Left = 36
      Top = 11
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'lbl1'
    end
    object lbl2: TLabel
      Left = 328
      Top = 10
      Width = 65
      Height = 13
      Caption = #25237#20135#26085#26399#20174
    end
    object lbl3: TLabel
      Left = 506
      Top = 11
      Width = 13
      Height = 13
      Caption = #33267
    end
    object edt1: TEdit
      Left = 72
      Top = 7
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = edt1Change
    end
    object dtp1: TDateTimePicker
      Left = 402
      Top = 7
      Width = 98
      Height = 21
      Date = 42846.000000000000000000
      Time = 42846.000000000000000000
      TabOrder = 1
    end
    object dtp2: TDateTimePicker
      Left = 525
      Top = 6
      Width = 98
      Height = 21
      Date = 42846.000000000000000000
      Time = 42846.000000000000000000
      TabOrder = 2
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 363
    Width = 684
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnCommit: TBitBtn
      Left = 200
      Top = 8
      Width = 75
      Height = 25
      Caption = #30830#35748
      ModalResult = 1
      TabOrder = 0
    end
    object btnCancel: TBitBtn
      Left = 376
      Top = 8
      Width = 75
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 33
    Width = 684
    Height = 330
    Align = alClient
    TabOrder = 2
    object eh06: TDBGridEh
      Left = 1
      Top = 1
      Width = 682
      Height = 328
      Align = alClient
      DataSource = dm1.ds1
      FooterColor = clWindow
      FooterFont.Charset = ANSI_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -13
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnDblClick = eh06DblClick
      OnKeyDown = eh06KeyDown
      OnTitleClick = eh06TitleClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'WORK_ORDER_NUMBER'
          Footers = <>
          Title.Color = clRed
          Title.SortIndex = 1
          Title.SortMarker = smDownEh
          Width = 109
        end
        item
          EditButtons = <>
          FieldName = 'MANU_PART_NUMBER'
          Footers = <>
          Width = 118
        end
        item
          EditButtons = <>
          FieldName = 'MANU_PART_DESC'
          Footers = <>
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'ABBR_NAME'
          Footers = <>
          Width = 65
        end
        item
          EditButtons = <>
          FieldName = 'STEP'
          Footers = <>
          Width = 53
        end
        item
          EditButtons = <>
          FieldName = 'DEPT_NAME'
          Footers = <>
          Width = 72
        end
        item
          EditButtons = <>
          FieldName = 'DEPT_CODE'
          Footers = <>
          Width = 68
        end
        item
          EditButtons = <>
          FieldName = 'QTY_BACKLOG'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'REFERENCE'
          Footers = <>
          Width = 75
        end
        item
          EditButtons = <>
          FieldName = 'FGZ'
          Footers = <>
          Width = 66
        end>
    end
  end
end
