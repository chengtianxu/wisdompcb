object frm_stdTimeCons: Tfrm_stdTimeCons
  Left = 196
  Top = 201
  Width = 979
  Height = 563
  Caption = #26631#20934#28040#32791#26102#38388#35774#32622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 971
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 13
      Top = 16
      Width = 52
      Height = 13
      Caption = #35774#22791#20195#30721
    end
    object Edt_Fielter: TEdit
      Left = 76
      Top = 9
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = Edt_FielterChange
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 41
    Width = 971
    Height = 488
    Align = alClient
    DataSource = DM.DataSource3
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    PopupMenu = PopupMenu1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGridEh1KeyDown
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'FASSET_CODE'
        Footers = <>
        Title.Caption = #35774#22791#20195#30721
        Title.Color = clRed
        Title.SortIndex = 1
        Title.SortMarker = smUpEh
      end
      item
        EditButtons = <>
        FieldName = 'FASSET_NAME'
        Footers = <>
        Title.Caption = #35774#22791#21517#31216
      end
      item
        EditButtons = <>
        FieldName = 'DEPT_CODE'
        Footers = <>
        Title.Caption = #37096#38376#20195#30721
      end
      item
        EditButtons = <>
        FieldName = 'DEPT_NAME'
        Footers = <>
        Title.Caption = #37096#38376#21517#31216
      end
      item
        EditButtons = <>
        FieldName = 'MainCycl'
        Footers = <>
        Title.Caption = #20445#20859#21608#26399
      end
      item
        EditButtons = <>
        FieldName = 'StdTimeCons'
        Footers = <>
        Title.Caption = #26631#20934#26102#38388
      end>
  end
  object PopupMenu1: TPopupMenu
    Left = 448
    Top = 136
    object N1: TMenuItem
      Caption = #26032#22686
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #32534#36753
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #21024#38500
      OnClick = N3Click
    end
  end
end
