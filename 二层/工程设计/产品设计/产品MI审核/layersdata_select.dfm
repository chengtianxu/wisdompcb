object Form_layersdata: TForm_layersdata
  Left = 389
  Top = 200
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #32447#36335#25968#25454#23618#36873#25321
  ClientHeight = 440
  ClientWidth = 406
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 399
    Width = 406
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object rkey25: TLabel
      Left = 40
      Top = 8
      Width = 7
      Height = 13
      Caption = '0'
      Visible = False
    end
    object BitBtn1: TBitBtn
      Left = 128
      Top = 8
      Width = 75
      Height = 25
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 216
      Top = 8
      Width = 75
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object TreeView1: TTreeView
    Left = 0
    Top = 0
    Width = 406
    Height = 399
    Align = alClient
    HideSelection = False
    Images = Form2.ImageList1
    Indent = 19
    ReadOnly = True
    RowSelect = True
    TabOrder = 1
    OnChange = TreeView1Change
  end
end
