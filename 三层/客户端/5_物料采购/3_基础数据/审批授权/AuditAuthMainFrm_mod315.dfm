inherited frmMainAuditAuth_mod315: TfrmMainAuditAuth_mod315
  Caption = 'frmMainAuditAuth_mod315'
  ClientHeight = 422
  ClientWidth = 916
  ExplicitWidth = 932
  ExplicitHeight = 461
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 916
    Height = 422
    ExplicitWidth = 399
    ExplicitHeight = 367
    inherited pnlDisplayMain: TPanel
      Width = 916
      Height = 422
      ExplicitWidth = 399
      ExplicitHeight = 367
      inherited pnlChildMain: TPanel
        Width = 914
        Height = 420
        ExplicitWidth = 397
        ExplicitHeight = 365
        inherited pnlEhMainDisplay: TPanel
          Width = 912
          Height = 389
          ExplicitLeft = 0
          ExplicitTop = 36
          ExplicitWidth = 395
          ExplicitHeight = 334
          inherited ehMain: TDBGridEh
            Width = 40
            Height = 32
            Align = alNone
            Visible = False
          end
          object btn_ReqAudit: TButton
            Left = 314
            Top = 72
            Width = 106
            Height = 25
            Caption = #35831#36141#21333#23457#25209#25480#26435
            TabOrder = 1
            OnClick = btn_ReqAuditClick
          end
          object btn_NoReqAudit: TButton
            Left = 444
            Top = 72
            Width = 121
            Height = 25
            Caption = #21462#28040#35831#36141#21333#23457#25209#25480#26435
            TabOrder = 2
            OnClick = btn_NoReqAuditClick
          end
          object btn_PurAudit: TButton
            Left = 314
            Top = 103
            Width = 106
            Height = 25
            Caption = #37319#36141#21333#23457#25209#25480#26435
            TabOrder = 3
            OnClick = btn_PurAuditClick
          end
          object btn_NoPurAudit: TButton
            Left = 444
            Top = 103
            Width = 121
            Height = 25
            Caption = #21462#28040#37319#36141#21333#23457#25209#25480#26435
            TabOrder = 4
            OnClick = btn_NoPurAuditClick
          end
          object btn_Out: TButton
            Left = 314
            Top = 134
            Width = 106
            Height = 25
            Caption = #22806#21457#23457#25209#25480#26435
            TabOrder = 5
            OnClick = btn_OutClick
          end
          object btn_NoOut: TButton
            Left = 444
            Top = 134
            Width = 121
            Height = 25
            Caption = #21462#28040#22806#21457#23457#25209#25480#26435
            TabOrder = 6
            OnClick = btn_NoOutClick
          end
          object btn_DMtrl: TButton
            Left = 314
            Top = 165
            Width = 106
            Height = 25
            Caption = #39046#26009#23457#25209#25480#26435
            TabOrder = 7
            OnClick = btn_DMtrlClick
          end
          object btn_NoDMtrl: TButton
            Left = 444
            Top = 165
            Width = 106
            Height = 25
            Caption = #21462#28040#39046#26009#23457#25209#25480#26435
            TabOrder = 8
            OnClick = btn_NoDMtrlClick
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 912
          Visible = False
          ExplicitWidth = 395
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    Left = 200
    Top = 280
  end
  inherited dsMain: TDataSource
    Left = 136
    Top = 280
  end
  inherited pmZD: TPopupMenu
    Top = 280
  end
  inherited pmMain: TPopupMenu
    Left = 72
    Top = 272
  end
  inherited cdsMainWhereInit: TClientDataSet
    Left = 56
    Top = 232
  end
  object cdstemp: TClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    Left = 320
    Top = 240
  end
end
