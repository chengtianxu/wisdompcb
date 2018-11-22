object frmApp_List: TfrmApp_List
  Left = 243
  Top = 160
  Width = 525
  Height = 396
  Caption = #26410#20851#38381#31243#24207
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    509
    358)
  PixelsPerInch = 96
  TextHeight = 13
  object ListView1: TListView
    Left = 0
    Top = 0
    Width = 509
    Height = 306
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    Columns = <
      item
        Caption = 'Function'
        Width = 100
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    IconOptions.AutoArrange = True
    LargeImages = ImageList1
    ReadOnly = True
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 208
    Top = 316
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #20851#38381
    ModalResult = 2
    TabOrder = 1
    NumGlyphs = 2
  end
  object ImageList1: TImageList
    Height = 32
    Width = 32
    Left = 152
    Top = 80
  end
  object PopupMenu1: TPopupMenu
    Left = 88
    Top = 224
    object N1: TMenuItem
      Caption = #24378#21046#32467#26463
      OnClick = N1Click
    end
  end
end
