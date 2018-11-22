object frmSelMaterial: TfrmSelMaterial
  Left = 463
  Top = 164
  Width = 730
  Height = 422
  Caption = #29289#26009#36873#25321
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 722
    Height = 391
    Align = alClient
    TabOrder = 0
    object pnl2: TPanel
      Left = 1
      Top = 1
      Width = 720
      Height = 41
      Align = alTop
      TabOrder = 0
      object lbl_field: TLabel
        Left = 71
        Top = 11
        Width = 52
        Height = 13
        Caption = #26448#26009#32534#30721
      end
      object lbl2: TLabel
        Left = 352
        Top = 11
        Width = 26
        Height = 13
        Caption = #24037#21378
        Visible = False
      end
      object edt_value: TEdit
        Left = 136
        Top = 6
        Width = 129
        Height = 21
        TabOrder = 0
        OnChange = edt_valueChange
      end
      object cbb_fac: TComboBox
        Left = 384
        Top = 6
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnChange = cbb_facChange
      end
    end
    object pnl3: TPanel
      Left = 1
      Top = 42
      Width = 720
      Height = 307
      Align = alClient
      TabOrder = 1
      object eh17: TDBGridEh
        Left = 1
        Top = 1
        Width = 718
        Height = 305
        Align = alClient
        DataSource = ds17
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -13
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnDblClick = btn_OKClick
        OnTitleClick = eh17TitleClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'INV_PART_NUMBER'
            Footers = <>
            Title.Caption = #26448#26009#32534#30721
            Width = 84
          end
          item
            EditButtons = <>
            FieldName = 'INV_PART_DESCRIPTION'
            Footers = <>
            Title.Caption = #35268#26684
            Width = 177
          end
          item
            EditButtons = <>
            FieldName = 'GROUP_DESC'
            Footers = <>
            Title.Caption = #26448#26009#32452#21035
            Width = 122
          end
          item
            EditButtons = <>
            FieldName = 'Qty'
            Footers = <>
            Title.Caption = #25968#37327
            Width = 81
          end
          item
            EditButtons = <>
            FieldName = 'UNIT_NAME'
            Footers = <>
            Title.Caption = #37319#36141#21333#20301
            Width = 61
          end
          item
            EditButtons = <>
            FieldName = 'ABBR_NAME'
            Footers = <>
            Title.Caption = #20379#24212#21830
            Width = 78
          end
          item
            EditButtons = <>
            FieldName = 'LOCATION'
            Footers = <>
            Title.Caption = #20179#24211
            Width = 70
          end
          item
            EditButtons = <>
            FieldName = 'XY'
            Footers = <>
            Title.Caption = 'VMI'#24211#23384
          end
          item
            EditButtons = <>
            FieldName = #24037#21378
            Footers = <>
          end>
      end
    end
    object pnl4: TPanel
      Left = 1
      Top = 349
      Width = 720
      Height = 41
      Align = alBottom
      TabOrder = 2
      object btn_OK: TBitBtn
        Left = 360
        Top = 8
        Width = 75
        Height = 25
        Caption = #30830#23450
        Default = True
        TabOrder = 0
        OnClick = btn_OKClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
      object btn_close: TBitBtn
        Left = 504
        Top = 8
        Width = 75
        Height = 25
        Caption = #21462#28040
        TabOrder = 1
        Kind = bkClose
      end
    end
  end
  object ds17: TDataSource
    DataSet = DM.qry17
    Left = 297
    Top = 162
  end
end
