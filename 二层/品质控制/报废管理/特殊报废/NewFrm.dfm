object frmNew: TfrmNew
  Left = 425
  Top = 200
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #26032#22686
  ClientHeight = 491
  ClientWidth = 637
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 637
    Height = 491
    Align = alClient
    TabOrder = 0
    object grp1: TGroupBox
      Left = 1
      Top = 1
      Width = 635
      Height = 489
      Align = alClient
      TabOrder = 0
      object lbl6: TLabel
        Left = 15
        Top = 430
        Width = 5
        Height = 19
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object grp2: TGroupBox
        Left = 269
        Top = 9
        Width = 340
        Height = 118
        TabOrder = 1
        object lbl1: TLabel
          Left = 13
          Top = 93
          Width = 60
          Height = 13
          Caption = #25253#24223#24037#21378#65306
        end
        object edtBFDH: TLabeledEdit
          Left = 75
          Top = 9
          Width = 206
          Height = 21
          TabStop = False
          Color = clScrollBar
          EditLabel.Width = 60
          EditLabel.Height = 13
          EditLabel.Caption = #25253#24223#21333#21495#65306
          LabelPosition = lpLeft
          ReadOnly = True
          TabOrder = 0
        end
        object edtTime: TLabeledEdit
          Left = 75
          Top = 36
          Width = 206
          Height = 21
          TabStop = False
          Color = clScrollBar
          EditLabel.Width = 60
          EditLabel.Height = 13
          EditLabel.Caption = #25253#24223#26102#38388#65306
          LabelPosition = lpLeft
          ReadOnly = True
          TabOrder = 1
        end
        object edtSQGX: TLabeledEdit
          Left = 75
          Top = 63
          Width = 206
          Height = 21
          TabStop = False
          Color = clScrollBar
          EditLabel.Width = 60
          EditLabel.Height = 13
          EditLabel.Caption = #30003#35831#24037#24207#65306
          LabelPosition = lpLeft
          ReadOnly = True
          TabOrder = 2
        end
        object cbxBFGC: TComboBox
          Left = 75
          Top = 89
          Width = 206
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 3
          TabStop = False
        end
      end
      object grp3: TGroupBox
        Left = 21
        Top = 9
        Width = 234
        Height = 416
        Caption = #36755#20837
        TabOrder = 0
        object lbl2: TLabel
          Left = 16
          Top = 64
          Width = 60
          Height = 13
          Caption = #20316#19994#21333#21495#65306
        end
        object lbl4: TLabel
          Left = 16
          Top = 92
          Width = 60
          Height = 13
          Caption = #32570#38519#20195#30721#65306
        end
        object lbl9: TLabel
          Left = 16
          Top = 145
          Width = 60
          Height = 13
          Caption = #36131#20219#37096#38376#65306
        end
        object btn1: TSpeedButton
          Left = 202
          Top = 60
          Width = 23
          Height = 22
          Caption = '...'
          OnClick = btn1Click
        end
        object btn2: TSpeedButton
          Tag = 1
          Left = 202
          Top = 87
          Width = 23
          Height = 22
          Caption = '...'
          OnClick = btn1Click
        end
        object lbl3: TLabel
          Left = 16
          Top = 119
          Width = 60
          Height = 13
          Caption = #32570#38519#21517#31216#65306
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbl5: TLabel
          Left = 16
          Top = 350
          Width = 75
          Height = 16
          Caption = #25253#24223#31867#22411#65306
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblQXMC: TLabel
          Left = 97
          Top = 119
          Width = 12
          Height = 13
          Caption = '    '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblBFLX: TLabel
          Left = 97
          Top = 350
          Width = 20
          Height = 16
          Caption = '     '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbl15: TLabel
          Left = 40
          Top = 254
          Width = 36
          Height = 13
          Caption = #22791#27880#65306
        end
        object btn4: TSpeedButton
          Tag = 2
          Left = 202
          Top = 141
          Width = 23
          Height = 22
          Caption = '...'
          OnClick = btn1Click
        end
        object lblNote: TLabel
          Left = 79
          Top = 42
          Width = 78
          Height = 13
          Caption = #20316#19994#21333#21495#26080#25928
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object btn5: TSpeedButton
          Left = 174
          Top = 196
          Width = 23
          Height = 22
          Glyph.Data = {
            66010000424D6601000000000000760000002800000014000000140000000100
            040000000000F000000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
            DDDDDDDD0000DDDD777777777777DDDD0000DDD00000000000007DDD0000DD0F
            EFEFEFEFEFEF07DD0000DD0E00000E00000E07DD0000DD0F88880F88880F07DD
            0000DD0EFEFEFEFEFEFE07DD0000DD0F00E00F00E00F07DD0000DD0E80F80E80
            F80E07DD0000DD0FEFEFEFEFEFEF07DD0000DD0E00F00E00F00E07DD0000DD0F
            80E80F80E80F07DD0000DD0EFEFEFEFEFEFE07DD0000DD0F00000000000F07DD
            0000DD0E08181881880E07DD0000DD0F08818818180F07DD0000DD0E00000000
            000E07DD0000DD0FEFEFEFEFEFEF0DDD0000DDD0000000000000DDDD0000DDDD
            DDDDDDDDDDDDDDDD0000}
          OnClick = btn5Click
        end
        object btn6: TSpeedButton
          Left = 174
          Top = 223
          Width = 23
          Height = 22
          Glyph.Data = {
            66010000424D6601000000000000760000002800000014000000140000000100
            040000000000F000000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
            DDDDDDDD0000DDDD777777777777DDDD0000DDD00000000000007DDD0000DD0F
            EFEFEFEFEFEF07DD0000DD0E00000E00000E07DD0000DD0F88880F88880F07DD
            0000DD0EFEFEFEFEFEFE07DD0000DD0F00E00F00E00F07DD0000DD0E80F80E80
            F80E07DD0000DD0FEFEFEFEFEFEF07DD0000DD0E00F00E00F00E07DD0000DD0F
            80E80F80E80F07DD0000DD0EFEFEFEFEFEFE07DD0000DD0F00000000000F07DD
            0000DD0E08181881880E07DD0000DD0F08818818180F07DD0000DD0E00000000
            000E07DD0000DD0FEFEFEFEFEFEF0DDD0000DDD0000000000000DDDD0000DDDD
            DDDDDDDDDDDDDDDD0000}
          OnClick = btn6Click
        end
        object lbl7: TLabel
          Left = 16
          Top = 174
          Width = 60
          Height = 13
          Caption = #36131#20219#37096#38376#65306
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblZRBM: TLabel
          Left = 97
          Top = 174
          Width = 15
          Height = 13
          Caption = '     '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbl16: TLabel
          Left = 13
          Top = 319
          Width = 60
          Height = 13
          Caption = #25253#24223#22352#26631#65306
        end
        object edtPCS: TLabeledEdit
          Left = 79
          Top = 196
          Width = 89
          Height = 21
          EditLabel.Width = 67
          EditLabel.Height = 13
          EditLabel.Caption = #25253#24223'PCS'#25968#65306
          LabelPosition = lpLeft
          TabOrder = 4
          Text = '0'
          OnExit = edtPCSExit
          OnKeyPress = edtPCSKeyPress
        end
        object edtPNL: TLabeledEdit
          Left = 79
          Top = 224
          Width = 89
          Height = 21
          EditLabel.Width = 66
          EditLabel.Height = 13
          EditLabel.Caption = #25253#24223'PNL'#25968#65306
          LabelPosition = lpLeft
          TabOrder = 5
          Text = '0'
          OnKeyPress = edtPCSKeyPress
        end
        object edtZYDH: TEdit
          Left = 79
          Top = 60
          Width = 121
          Height = 21
          TabOrder = 1
          OnExit = edtZYDHExit
        end
        object edtQXDM: TEdit
          Left = 79
          Top = 88
          Width = 121
          Height = 21
          TabOrder = 2
          OnExit = edtQXDMExit
        end
        object edtBZ: TEdit
          Left = 79
          Top = 252
          Width = 146
          Height = 21
          TabOrder = 6
        end
        object edtFSGX: TEdit
          Left = 79
          Top = 142
          Width = 121
          Height = 21
          TabOrder = 3
          OnExit = edtFSGXExit
        end
        object edt1: TEdit
          Left = 79
          Top = 284
          Width = 146
          Height = 21
          TabOrder = 7
        end
        object cbx1: TCheckBox
          Left = 6
          Top = 287
          Width = 67
          Height = 17
          Caption = #21305#37197#26009#21495
          TabOrder = 8
          OnClick = cbx1Click
        end
        object edt2: TEdit
          Left = 79
          Top = 317
          Width = 146
          Height = 21
          TabOrder = 9
        end
        object edt3: TEdit
          Left = 71
          Top = 16
          Width = 146
          Height = 21
          TabOrder = 0
          Visible = False
        end
        object cbx2: TCheckBox
          Left = 16
          Top = 18
          Width = 49
          Height = 17
          Caption = '8421'
          TabOrder = 10
          OnClick = cbx2Click
        end
      end
      object grp4: TGroupBox
        Left = 269
        Top = 130
        Width = 340
        Height = 161
        Caption = #22312#32447#20449#24687
        TabOrder = 2
        object lbl8: TLabel
          Left = 12
          Top = 16
          Width = 60
          Height = 13
          Caption = #26412#21378#32534#21495#65306
        end
        object lbl10: TLabel
          Left = 17
          Top = 65
          Width = 55
          Height = 13
          Caption = #22312#32447'PCS'#65306
        end
        object lbl11: TLabel
          Left = 19
          Top = 115
          Width = 53
          Height = 13
          Caption = 'PCS/PNL'#65306
        end
        object lbl12: TLabel
          Left = 12
          Top = 40
          Width = 60
          Height = 13
          Caption = #23458#25143#22411#21495#65306
        end
        object lbl13: TLabel
          Left = 18
          Top = 90
          Width = 54
          Height = 13
          Caption = #22312#32447'PNL'#65306
        end
        object lbl14: TLabel
          Left = 12
          Top = 140
          Width = 60
          Height = 13
          Caption = #24050#25253#24223#25968#65306
        end
        object lblBCBH: TLabel
          Left = 83
          Top = 16
          Width = 20
          Height = 16
          Caption = 'lbl8'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblZXPCS: TLabel
          Left = 83
          Top = 65
          Width = 20
          Height = 16
          Caption = 'lbl8'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblPCSPERPNL: TLabel
          Left = 83
          Top = 115
          Width = 20
          Height = 16
          Caption = 'lbl8'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblKHXH: TLabel
          Left = 83
          Top = 40
          Width = 20
          Height = 16
          Caption = 'lbl8'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblZXPNL: TLabel
          Left = 83
          Top = 90
          Width = 20
          Height = 16
          Caption = 'lbl8'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblYBFS: TLabel
          Left = 83
          Top = 140
          Width = 20
          Height = 16
          Caption = 'lbl8'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
      end
      object btn3: TButton
        Left = 281
        Top = 438
        Width = 75
        Height = 42
        Caption = #20445#23384
        TabOrder = 3
        OnClick = btn3Click
      end
      object grpIn: TGroupBox
        Left = 269
        Top = 296
        Width = 340
        Height = 129
        Caption = #20869#23618#39044#25253#24223#20449#24687
        TabOrder = 4
        object ehIn: TDBGridEh
          Left = 2
          Top = 15
          Width = 336
          Height = 112
          Align = alClient
          DataSource = dm1.dsIN
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'Tahoma'
          FooterFont.Style = []
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              EditButtons = <>
              FieldName = 'MANU_PART_NUMBER'
              Footers = <>
              Width = 91
            end
            item
              EditButtons = <>
              FieldName = 'REJECT_DESCRIPTION'
              Footers = <>
              Width = 63
            end
            item
              EditButtons = <>
              FieldName = 'DEPT_NAME'
              Footers = <>
              Width = 73
            end
            item
              EditButtons = <>
              FieldName = 'QTY_REJECT'
              Footers = <>
              Width = 42
            end
            item
              EditButtons = <>
              FieldName = 'PANELS'
              Footers = <>
              Width = 45
            end
            item
              EditButtons = <>
              FieldName = 'WORK_ORDER_NUMBER'
              Footers = <>
              Width = 133
            end>
        end
      end
    end
  end
end
