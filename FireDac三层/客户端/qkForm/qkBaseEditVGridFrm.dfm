inherited frmqkbaseeditvgrid: Tfrmqkbaseeditvgrid
  Caption = ''
  ClientHeight = 326
  ClientWidth = 354
  ExplicitWidth = 370
  ExplicitHeight = 365
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBase1: TPanel
    Width = 354
    Height = 326
    ExplicitWidth = 354
    ExplicitHeight = 326
    inherited pnlTop: TPanel
      Width = 352
      ExplicitWidth = 352
      inherited pnlTopTool: TPanel
        Width = 350
        ExplicitWidth = 350
        inherited btnSave: TRzBitBtn
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitHeight = 23
        end
        inherited btnClose: TRzBitBtn
          ExplicitLeft = 75
          ExplicitTop = 0
          ExplicitHeight = 23
        end
      end
    end
    object pnlBaseForVEditGrid: TPanel
      Left = 1
      Top = 26
      Width = 352
      Height = 299
      Align = alClient
      TabOrder = 1
      ExplicitLeft = 88
      ExplicitTop = 144
      ExplicitWidth = 185
      ExplicitHeight = 41
      object pnlBase2: TPanel
        Left = 1
        Top = 1
        Width = 350
        Height = 297
        Align = alClient
        TabOrder = 0
        ExplicitTop = 26
        ExplicitWidth = 352
        ExplicitHeight = 299
        object spl1: TSplitter
          Left = 344
          Top = 1
          Width = 5
          Height = 295
          Align = alRight
          ExplicitLeft = 407
          ExplicitTop = 0
          ExplicitHeight = 514
        end
        object veh1: TDBVertGridEh
          Left = 1
          Top = 1
          Width = 343
          Height = 295
          Align = alClient
          AllowedSelections = []
          RowCategories.CategoryProps = <>
          LabelColParams.Color = clWhite
          LabelColParams.Font.Charset = GB2312_CHARSET
          LabelColParams.Font.Color = clWindowText
          LabelColParams.Font.Height = -13
          LabelColParams.Font.Name = #23435#20307
          LabelColParams.Font.Style = []
          LabelColParams.ParentFont = False
          LabelColParams.SecondColor = clWhite
          PrintService.ColorSchema = pcsFullColorEh
          DataSource = ds1
          DrawGraphicData = True
          DrawMemoText = True
          FixedColor = clWhite
          GridLineParams.VertEmptySpaceStyle = dessNonEh
          OptionsEh = [dgvhHighlightFocusEh, dgvhClearSelectionEh, dgvhEnterToNextRowEh, dgvhTabToNextRowEh, dgvhRowsIsTabControlsEh]
          TabOrder = 0
          LabelColWidth = 80
          OnKeyDown = veh1KeyDown
          Rows = <
            item
              DynProps = <>
              EditButtons = <>
              OnUpdateData = veh1Rows0UpdateData
            end>
        end
      end
    end
  end
  object ds1: TDataSource
    Left = 272
    Top = 457
  end
end
