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
    517
    369)
  PixelsPerInch = 96
  TextHeight = 13
  object ListView1: TListView
    Left = 0
    Top = 0
    Width = 517
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
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 216
    Top = 324
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #21462#28040
    TabOrder = 1
    Kind = bkCancel
  end
  object BitBtn2: TBitBtn
    Left = 40
    Top = 323
    Width = 121
    Height = 25
    Caption = #20851#38381#25152#26377#31243#24207
    TabOrder = 2
    Visible = False
    OnClick = BitBtn2Click
  end
  object ImageList1: TImageList
    Height = 32
    Width = 32
    Left = 152
    Top = 80
  end
end
