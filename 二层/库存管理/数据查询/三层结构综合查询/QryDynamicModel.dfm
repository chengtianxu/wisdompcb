inherited frmQryDynamicModel: TfrmQryDynamicModel
  Left = 191
  Top = 146
  Caption = #21160#24577#26597#35810#27169#22359#29238#31867
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Height = 49
    inherited labelKey: TLabel
      Left = 425
      Top = 23
    end
    inherited Label1: TLabel
      Left = 576
    end
    inherited ToolBar1: TToolBar
      inherited btnQry: TToolButton
        Visible = False
      end
    end
    inherited edtKey: TRzEdit
      Left = 440
      Width = 129
    end
    inherited dtpStartDate: TRzDateTimePicker
      Left = 440
    end
    inherited dtpEndDate: TRzDateTimePicker
      Left = 600
    end
  end
  inherited Panel2: TPanel
    Top = 49
    Height = 454
    inherited Splitter1: TSplitter
      Left = 313
      Width = 0
      Height = 450
      Visible = False
    end
    inherited Panel3: TPanel
      Width = 311
      Height = 450
      Visible = False
      inherited Panel4: TPanel
        Top = 396
        Width = 311
      end
      inherited RzPageControl1: TRzPageControl
        Width = 311
        Height = 396
        FixedDimension = 19
        inherited TabSheet1: TRzTabSheet
          inherited DBGrid1: TDBGridEh
            Width = 307
            Height = 373
          end
        end
      end
    end
    inherited Panel5: TPanel
      Left = 313
      Width = 469
      Height = 450
      inherited DBGrid3: TDBGridEh
        Width = 467
        Height = 429
        FooterColor = clWhite
        SumList.Active = True
        TitleHeight = 24
        OnColumnMoved = DBGrid3ColumnMoved
        OnColWidthsChanged = DBGrid3ColWidthsChanged
      end
      inherited StatusBar1: TStatusBar
        Top = 430
        Width = 467
        Panels = <
          item
            Text = #35760#24405#25968
            Width = 50
          end
          item
            Width = 60
          end
          item
            Width = 100
          end>
      end
    end
  end
  inherited PopupMenu2: TPopupMenu
    OnPopup = PopupMenu2Popup
    object N7: TMenuItem
      Caption = '-'
    end
    object N8: TMenuItem
      Caption = #26639#20301#26174#31034
      OnClick = N8Click
    end
    object N9: TMenuItem
      Caption = #20445#23384#26639#20301#35774#32622
      OnClick = N9Click
    end
  end
  object cdsColumnList: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 373
    Top = 219
  end
end
