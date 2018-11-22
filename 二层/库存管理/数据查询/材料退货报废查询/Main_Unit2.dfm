inherited MainTemForm2: TMainTemForm2
  Left = 224
  Top = 100
  Width = 911
  Height = 581
  Caption = #26448#26009#25253#24223#36864#36135#26597#35810
  Font.Height = -13
  Font.Name = #23435#20307
  OldCreateOrder = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 895
    Height = 41
    BevelInner = bvNone
    BevelOuter = bvNone
    Color = clBtnFace
    inherited BitBtn6: TBitBtn
      Top = 9
      Width = 75
      Height = 28
    end
    inherited BitBtn2: TBitBtn
      Left = 81
      Top = 9
      Width = 90
      Height = 28
      OnClick = BitBtn2Click
    end
    inherited BitBtn3: TBitBtn
      Left = 261
      Top = 9
      Width = 90
      Height = 28
      OnClick = BitBtn3Click
    end
    inherited BitBtn4: TBitBtn
      Left = 171
      Top = 9
      Width = 90
      Height = 28
      OnClick = BitBtn4Click
    end
    inherited BitBtn5: TBitBtn
      Left = 351
      Top = 9
      Width = 70
      Height = 28
      OnClick = BitBtn5Click
    end
  end
  inherited Temp_DBGridEh1: TDBGridEh
    Top = 41
    Width = 895
    Height = 502
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    OnTitleBtnClick = Temp_DBGridEh1TitleBtnClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'INV_PART_NUMBER'
        Footers = <>
        Title.SortIndex = 1
        Title.SortMarker = smDownEh
        Title.TitleButton = True
        Width = 98
      end
      item
        EditButtons = <>
        FieldName = 'INV_PART_DESCRIPTION'
        Footers = <>
        Title.TitleButton = True
        Width = 133
      end
      item
        EditButtons = <>
        FieldName = 'REJECT_DESCRIPTION'
        Footers = <>
        Title.TitleButton = True
        Width = 107
      end
      item
        EditButtons = <>
        FieldName = 'TDATE'
        Footers = <>
        Width = 132
      end
      item
        EditButtons = <>
        FieldName = 'QUAN_REJD'
        Footers = <>
        Width = 50
      end
      item
        EditButtons = <>
        FieldName = 'EMPLOYEE_NAME'
        Footers = <>
        Title.TitleButton = True
        Width = 49
      end
      item
        EditButtons = <>
        FieldName = 'ttype'
        Footers = <>
        Width = 47
      end
      item
        EditButtons = <>
        FieldName = 'curr_name'
        Footers = <>
        Title.Caption = #36135#24065
        Width = 46
      end
      item
        EditButtons = <>
        FieldName = 'PRICE'
        Footers = <>
        Title.Caption = #19981#21547#31246#21333#20215
        Width = 69
      end
      item
        EditButtons = <>
        FieldName = 'GRN_NUMBER'
        Footers = <>
        Title.Caption = #20837#24211#21333#21495
      end
      item
        EditButtons = <>
        FieldName = 'CREATE_DATE'
        Footers = <>
        Title.Caption = #20837#24211#26085#26399
      end
      item
        EditButtons = <>
        FieldName = 'PO_NUMBER'
        Footers = <>
        Title.Caption = #37319#36141#21333#21495
      end
      item
        EditButtons = <>
        FieldName = 'exch_rate'
        Footers = <>
        Title.Caption = #27719#29575
        Width = 45
      end
      item
        EditButtons = <>
        FieldName = 'abbr_name'
        Footers = <>
        Title.TitleButton = True
        Width = 105
      end>
  end
  inherited PopupMenu2: TPopupMenu
    Left = 759
  end
end
