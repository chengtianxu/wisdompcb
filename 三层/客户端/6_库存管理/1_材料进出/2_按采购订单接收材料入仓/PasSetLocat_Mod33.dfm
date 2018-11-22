inherited frmSetLocat_Mod33: TfrmSetLocat_Mod33
  Caption = #23384#20179#35814#32454#20301#32622#23450#20041
  ClientHeight = 442
  ClientWidth = 749
  ExplicitWidth = 757
  ExplicitHeight = 469
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 749
    Height = 442
    inherited pnl1: TPanel
      Width = 747
      inherited btnSave: TBitBtn
        OnClick = btnSaveClick
      end
      inherited btnClose: TBitBtn
        OnClick = btnCloseClick
      end
    end
    inherited pnl2: TPanel
      Width = 747
      Height = 407
      object Panel1: TPanel
        Left = 1
        Top = 1
        Width = 208
        Height = 405
        Align = alLeft
        TabOrder = 0
        ExplicitLeft = -4
        object Label5: TLabel
          Left = 8
          Top = 16
          Width = 48
          Height = 13
          Caption = #20179#24211#20195#30721
        end
        object Label2: TLabel
          Left = 32
          Top = 45
          Width = 24
          Height = 13
          Caption = #20179#24211
        end
        object Label3: TLabel
          Left = 8
          Top = 75
          Width = 48
          Height = 13
          Caption = #24037#21378#31616#31216
        end
        object Label4: TLabel
          Left = 32
          Top = 106
          Width = 24
          Height = 13
          Caption = #31867#22411
        end
        object Label1: TLabel
          Left = 8
          Top = 137
          Width = 48
          Height = 13
          Caption = #35814#32454#20301#32622
        end
        object Edit1: TEdit
          Left = 58
          Top = 12
          Width = 112
          Height = 21
          ReadOnly = True
          TabOrder = 0
        end
        object Edit2: TEdit
          Left = 58
          Top = 41
          Width = 112
          Height = 21
          ReadOnly = True
          TabOrder = 1
        end
        object Edit3: TEdit
          Left = 58
          Top = 71
          Width = 112
          Height = 21
          ReadOnly = True
          TabOrder = 2
        end
        object Edit4: TEdit
          Left = 58
          Top = 102
          Width = 112
          Height = 21
          ReadOnly = True
          TabOrder = 3
        end
        object Edit5: TEdit
          Left = 58
          Top = 133
          Width = 112
          Height = 21
          TabOrder = 4
        end
        object BitBtn3: TBitBtn
          Tag = 1
          Left = 170
          Top = 9
          Width = 26
          Height = 25
          Glyph.Data = {
            EE000000424DEE000000000000007600000028000000100000000F0000000100
            04000000000078000000130B0000130B00001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            888800000888880000080F000888880F00080F000888880F0008000000080000
            000800F000000F00000800F000800F00000800F000800F000008800000000000
            0088880F00080F000888880000080000088888800088800088888880F08880F0
            888888800088800088888888888888888888}
          TabOrder = 5
          OnClick = BitBtn3Click
        end
      end
      object Panel2: TPanel
        Left = 209
        Top = 1
        Width = 537
        Height = 405
        Align = alClient
        TabOrder = 1
        ExplicitLeft = 344
        ExplicitTop = 72
        ExplicitWidth = 185
        ExplicitHeight = 41
        object DBGridEh1: TDBGridEh
          Left = 1
          Top = 1
          Width = 535
          Height = 403
          Align = alClient
          DataSource = ds176
          DynProps = <>
          PopupMenu = PopupMenu1
          TabOrder = 0
          OnDblClick = DBGridEh1DblClick
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'CODE'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #20179#24211#20195#30721
              Width = 80
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'LOCATION2'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #20179#24211#21517#31216
              Width = 120
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'abbr_name'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #24037#21378#31616#31216
              Width = 80
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'LOCATION'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #35814#32454#20301#32622
              Width = 120
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'stype'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #31867#22411
              Width = 60
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
  end
  object cds176: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 448
    Top = 112
  end
  object ds176: TDataSource
    DataSet = cds176
    Left = 360
    Top = 112
  end
  object PopupMenu1: TPopupMenu
    Left = 576
    Top = 112
    object N1: TMenuItem
      Caption = #21024#38500
      OnClick = N1Click
    end
  end
end
