inherited FrmCheckRecordReport_705: TFrmCheckRecordReport_705
  Caption = #26816#27979#35760#24405#27719#24635#26597#35810#25253#34920
  ClientHeight = 611
  ClientWidth = 1047
  WindowState = wsMaximized
  ExplicitWidth = 1063
  ExplicitHeight = 650
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 1047
    Height = 611
    ExplicitWidth = 1047
    ExplicitHeight = 611
    inherited pnlDisplayMain: TPanel
      Width = 1047
      Height = 611
      ExplicitWidth = 1047
      ExplicitHeight = 611
      inherited pnlChildMain: TPanel
        Width = 1045
        Height = 609
        ExplicitWidth = 1045
        ExplicitHeight = 609
        inherited pnlEhMainDisplay: TPanel
          Top = 65
          Width = 1043
          Height = 543
          ExplicitTop = 65
          ExplicitWidth = 1043
          ExplicitHeight = 543
          inherited ehMain: TDBGridEh
            Width = 1041
            Height = 541
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 1043
          Height = 64
          ExplicitWidth = 1043
          ExplicitHeight = 64
          object lbl1: TLabel [0]
            Left = 661
            Top = 42
            Width = 36
            Height = 13
            Caption = #26085#26399#65306
            Color = clBtnFace
            ParentColor = False
          end
          object lbl2: TLabel [1]
            Left = 779
            Top = 42
            Width = 12
            Height = 13
            Caption = #33267
            Color = clBtnFace
            ParentColor = False
          end
          object lbl3: TLabel [2]
            Left = 473
            Top = 13
            Width = 24
            Height = 13
            Caption = #23458#25143
            Color = clBtnFace
            ParentColor = False
          end
          object Label5: TLabel [3]
            Left = 479
            Top = 42
            Width = 24
            Height = 13
            Caption = #29677#27425
          end
          inherited lblFilter: TLabel
            Left = 282
            Top = 14
            ExplicitLeft = 282
            ExplicitTop = 14
          end
          object Label1: TLabel [5]
            Left = 562
            Top = 41
            Width = 24
            Height = 13
            Caption = #22411#21495
          end
          inherited btnZD: TBitBtn [6]
            Left = 978
            Height = 64
            Align = alRight
            Visible = False
            ExplicitLeft = 978
            ExplicitHeight = 64
          end
          inherited btnDY: TBitBtn [7]
            Left = 960
            Width = 18
            Height = 64
            Align = alRight
            ExplicitLeft = 960
            ExplicitWidth = 18
            ExplicitHeight = 64
          end
          inherited btnAuthDispatch: TBitBtn [8]
            Left = 928
            Width = 32
            Height = 64
            Align = alRight
            Visible = False
            ExplicitLeft = 928
            ExplicitWidth = 32
            ExplicitHeight = 64
          end
          inherited btnExit: TBitBtn [9]
            Height = 64
            ExplicitHeight = 64
          end
          inherited btnRefresh: TBitBtn [10]
            Height = 64
            Visible = False
            ExplicitHeight = 64
          end
          inherited btnQry: TBitBtn [11]
            Height = 64
            ExplicitHeight = 64
          end
          inherited btnExportToExcel: TBitBtn [12]
            Height = 64
            ExplicitHeight = 64
          end
          object dtp1: TDateTimePicker [13]
            Left = 693
            Top = 38
            Width = 80
            Height = 21
            Date = 42755.000000000000000000
            Time = 42755.000000000000000000
            TabOrder = 8
          end
          object dtp2: TDateTimePicker [14]
            Left = 797
            Top = 38
            Width = 76
            Height = 21
            Date = 42755.999988425930000000
            Time = 42755.999988425930000000
            TabOrder = 9
          end
          object edt_CustNO: TRKeyRzBtnEdit [15]
            Left = 506
            Top = 9
            Width = 135
            Height = 21
            Text = ''
            TabOrder = 10
            ButtonKind = bkFind
            AltBtnWidth = 15
            ButtonWidth = 15
            OnButtonClick = edt_CustNOButtonClick
            DispalyTableName = 'data0010'
            DisplaytextField = 'cust_code'
            DisplayNoteField = 'abbr_name'
            DisplayPickID = '3'
            DisplayModID = 705
            ForceOnFocus = True
          end
          object rg_RType: TRadioGroup [16]
            Left = 659
            Top = -4
            Width = 214
            Height = 39
            Caption = #25253#34920#31867#22411
            Columns = 2
            Font.Charset = ANSI_CHARSET
            Font.Color = clBtnText
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            ItemIndex = 0
            Items.Strings = (
              #26085#26126#32454#25253#34920
              #27719#24635#25253#34920)
            ParentFont = False
            TabOrder = 11
          end
          object cbb_ClassNo: TComboBox [17]
            Left = 506
            Top = 37
            Width = 47
            Height = 21
            TabOrder = 12
            Items.Strings = (
              'A'#29677
              'B'#29677)
          end
          inherited edtFliter: TEdit [18]
            Left = 345
            Top = 9
            Width = 122
            ExplicitLeft = 345
            ExplicitTop = 9
            ExplicitWidth = 122
          end
          object edt_ProdNO: TEdit
            Left = 589
            Top = 37
            Width = 52
            Height = 21
            ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
            TabOrder = 13
            OnChange = edtFliterChange
          end
        end
      end
    end
  end
  inherited pmZD: TPopupMenu
    Top = 56
  end
  inherited cdsMainWhereInit: TClientDataSet
    Left = 312
    Top = 56
  end
end
