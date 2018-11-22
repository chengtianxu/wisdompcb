object frmOpenFile: TfrmOpenFile
  Left = 299
  Top = 231
  Width = 569
  Height = 364
  Caption = 'frmOpenFile'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Dgh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 561
    Height = 330
    Align = alClient
    DataGrouping.GroupLevels = <>
    DataSource = ds1
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    RowDetailPanel.Color = clBtnFace
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = Dgh1DblClick
    OnGetCellParams = Dgh1GetCellParams
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object Dt1: TADODataSet
    LockType = ltReadOnly
    Parameters = <>
    Left = 352
    Top = 80
  end
  object ds1: TDataSource
    DataSet = Dt1
    Left = 392
    Top = 80
  end
  object dlgOpen1: TOpenDialog
    Left = 272
    Top = 168
  end
end
