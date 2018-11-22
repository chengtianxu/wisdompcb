object Form4: TForm4
  Left = 389
  Top = 185
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26356#25913#35746#21333#25968#37327
  ClientHeight = 350
  ClientWidth = 459
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 7
    Top = 72
    Width = 87
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#35746#21333#25968#37327'PCS:'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 33
    Top = 128
    Width = 61
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#20215#26684'PCS:'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 35
    Top = 163
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #23458#25143#20132#26399':'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 14
    Top = 41
    Width = 80
    Height = 13
    Alignment = taRightJustify
    Caption = #35746#21333#25968#37327'SET:'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 103
    Top = 219
    Width = 7
    Height = 13
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 22
    Top = 219
    Width = 72
    Height = 13
    Alignment = taRightJustify
    Caption = #20986#36135#26495#26041#24335':'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 40
    Top = 100
    Width = 54
    Height = 13
    Alignment = taRightJustify
    Caption = #20215#26684'SET:'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 28
    Top = 190
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#35745#21010#20132#26399':'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 22
    Top = 14
    Width = 72
    Height = 13
    Alignment = taRightJustify
    Caption = #20851#32852#25991#20214#21495':'
  end
  object Label10: TLabel
    Left = 61
    Top = 245
    Width = 33
    Height = 13
    Caption = #36135#24065':'
  end
  object Label11: TLabel
    Left = 162
    Top = 244
    Width = 33
    Height = 13
    Caption = #27719#29575':'
  end
  object Label12: TLabel
    Left = 41
    Top = 274
    Width = 53
    Height = 13
    Caption = #22686#20540#31246'%:'
  end
  object SpeedButton1: TSpeedButton
    Left = 307
    Top = 160
    Width = 57
    Height = 22
    Caption = #21462#28040
    Flat = True
    OnClick = SpeedButton1Click
  end
  object DBEdit1: TDBEdit
    Left = 101
    Top = 69
    Width = 102
    Height = 21
    DataField = 'PARTS_ORDERED'
    DataSource = DM.DataSource1
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnExit = DBEdit1Exit
    OnKeyDown = DBEdit1KeyDown
    OnKeyPress = DBEdit4KeyPress
  end
  object Button1: TButton
    Left = 142
    Top = 315
    Width = 68
    Height = 25
    Caption = #20445#23384
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 258
    Top = 315
    Width = 66
    Height = 25
    Caption = #21462#28040
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ModalResult = 2
    ParentFont = False
    TabOrder = 7
  end
  object DBEdit2: TDBEdit
    Left = 101
    Top = 125
    Width = 102
    Height = 21
    DataField = 'part_price'
    DataSource = DM.DataSource1
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnExit = DBEdit2Exit
    OnKeyDown = DBEdit2KeyDown
  end
  object DBEdit3: TDBEdit
    Left = 101
    Top = 159
    Width = 102
    Height = 21
    DataField = 'ORIG_REQUEST_DATE'
    DataSource = DM.DataSource1
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
    OnKeyDown = DBEdit3KeyDown
  end
  object DBEdit4: TDBEdit
    Left = 101
    Top = 38
    Width = 102
    Height = 21
    DataField = 'set_ordered'
    DataSource = DM.DataSource1
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnExit = DBEdit4Exit
    OnKeyDown = DBEdit4KeyDown
    OnKeyPress = DBEdit4KeyPress
  end
  object DBEdit5: TDBEdit
    Left = 101
    Top = 97
    Width = 102
    Height = 21
    DataField = 'set_price'
    DataSource = DM.DataSource1
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnExit = DBEdit5Exit
    OnKeyDown = DBEdit5KeyDown
  end
  object DBEdit6: TDBEdit
    Left = 100
    Top = 186
    Width = 102
    Height = 21
    DataField = 'ORIG_SCHED_SHIP_DATE'
    DataSource = DM.DataSource1
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnKeyDown = DBEdit6KeyDown
  end
  object Edit1: TEdit
    Left = 101
    Top = 10
    Width = 101
    Height = 21
    MaxLength = 50
    TabOrder = 0
    OnKeyDown = Edit1KeyDown
  end
  object BitBtn2: TBitBtn
    Left = 209
    Top = 124
    Width = 77
    Height = 25
    Caption = #25253#20215#21333#21495
    TabOrder = 9
    OnClick = BitBtn2Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
      333333777777777F33333330B00000003333337F7777777F3333333000000000
      333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
      333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
      03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
      03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
      3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
      333333333377F7F33333333333330F03333333333337F7F33333333333330B03
      3333333333373733333333333333303333333333333373333333}
    NumGlyphs = 2
  end
  object Edit2: TEdit
    Left = 216
    Top = 160
    Width = 87
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 10
  end
  object DBEdit7: TDBEdit
    Left = 104
    Top = 240
    Width = 49
    Height = 21
    DataField = 'CURR_CODE'
    DataSource = DM.DataSource1
    Enabled = False
    TabOrder = 11
  end
  object DBEdit8: TDBEdit
    Left = 203
    Top = 239
    Width = 84
    Height = 21
    DataField = 'EXCH_RATE'
    DataSource = DM.DataSource1
    Enabled = False
    TabOrder = 12
  end
  object DBEdit9: TDBEdit
    Left = 105
    Top = 269
    Width = 45
    Height = 21
    DataField = 'RUSH_CHARGE'
    DataSource = DM.DataSource1
    Enabled = False
    TabOrder = 13
  end
  object DBCheckBox1: TDBCheckBox
    Left = 216
    Top = 190
    Width = 79
    Height = 17
    Caption = #36716#21378#35746#21333
    DataField = 'COMMISION_ON_TOOLING'
    DataSource = DM.DataSource1
    ReadOnly = True
    TabOrder = 14
    ValueChecked = 'Y'
    ValueUnchecked = 'N'
  end
  object DBCheckBox2: TDBCheckBox
    Left = 202
    Top = 272
    Width = 97
    Height = 17
    Caption = #20215#26684#21547#31246
    DataField = 'tax_in_price'
    DataSource = DM.DataSource1
    ReadOnly = True
    TabOrder = 15
    ValueChecked = 'Y'
    ValueUnchecked = 'N'
  end
  object DBGridEh1: TDBGridEh
    Left = 208
    Top = 9
    Width = 244
    Height = 110
    DataSource = DM.ds360
    FooterColor = clRed
    FooterFont.Charset = GB2312_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    FooterRowCount = 1
    FrozenCols = 1
    PopupMenu = PopupMenu1
    SumList.Active = True
    TabOrder = 16
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnExit = DBGridEh1Exit
    OnKeyDown = DBGridEh1KeyDown
    Columns = <
      item
        Color = clScrollBar
        EditButtons = <>
        FieldName = 'sch_date'
        Footer.Value = #21512#35745
        Footer.ValueType = fvtStaticText
        Footers = <>
        ReadOnly = True
        Title.Caption = #23436#24037#26085#26399
      end
      item
        EditButtons = <>
        FieldName = 'quantity'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #23436#24037#25968#37327
      end>
  end
  object btn1: TBitBtn
    Left = 288
    Top = 124
    Width = 75
    Height = 25
    Caption = 'BOM'#21333#21495
    TabOrder = 17
    OnClick = btn1Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
      333333777777777F33333330B00000003333337F7777777F3333333000000000
      333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
      333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
      03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
      03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
      3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
      333333333377F7F33333333333330F03333333333337F7F33333333333330B03
      3333333333373733333333333333303333333333333373333333}
    NumGlyphs = 2
  end
  object PopupMenu1: TPopupMenu
    Left = 312
    Top = 192
    object N1: TMenuItem
      Caption = #21024#38500
      OnClick = N1Click
    end
  end
end
