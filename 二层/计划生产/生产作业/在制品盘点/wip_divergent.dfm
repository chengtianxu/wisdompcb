object Form11: TForm11
  Left = 203
  Top = 156
  Width = 855
  Height = 515
  Caption = #30424#28857#24046#24322#25968#25454
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  DesignSize = (
    847
    481)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 44
    Width = 846
    Height = 431
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DM.DataSource2
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'MANU_PART_NUMBER'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_DESC'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WORK_ORDER_NUMBER'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEPT_CODE'
        Title.Caption = #24037#24207#20195#30721
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEPT_NAME'
        Title.Caption = #24037#24207#21517#31216
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'wip_ptr'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REJECT_DESCRIPTION'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'wip_system_qty'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'physical_count_qty'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'divergent'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'physical_PANELS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'panels'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'divergent_pan'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'mianji'
        Title.Caption = #21333#25903#38754#31215
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MJ'
        Title.Caption = #24046#24322#38754#31215
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'check_no'
        Width = 146
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 7
    Top = 8
    Width = 67
    Height = 30
    Caption = #20851#38381
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 74
    Top = 8
    Width = 68
    Height = 30
    Caption = #23548#20986#25968#25454
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 142
    Top = 8
    Width = 68
    Height = 30
    Caption = #23383#27573
    TabOrder = 3
    OnClick = Button3Click
  end
  object RadioGroup2: TRadioGroup
    Left = 385
    Top = -1
    Width = 84
    Height = 45
    Anchors = [akTop, akRight]
    Caption = #38754#31215
    ItemIndex = 0
    Items.Strings = (
      #19981#21547#26495#36793
      #21547#26495#36793)
    TabOrder = 4
    OnClick = RadioGroup2Click
  end
  object PopupMenu1: TPopupMenu
    AutoHotkeys = maManual
    Left = 384
    Top = 128
  end
end
