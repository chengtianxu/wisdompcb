inherited frmElecCheckEdit_705: TfrmElecCheckEdit_705
  Caption = #30005#27979#26816#27979#35760#24405#20462#25913
  ClientHeight = 569
  ClientWidth = 870
  ExplicitWidth = 886
  ExplicitHeight = 608
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlDisplay: TPanel
    Width = 870
    Height = 569
    ExplicitWidth = 870
    ExplicitHeight = 569
    inherited Panel1: TPanel
      Height = 567
      ExplicitHeight = 567
      inherited pnl4: TPanel
        Height = 565
        ExplicitHeight = 565
        inherited pnl5: TPanel
          inherited btn_Cancel: TButton
            Caption = #21462#28040
          end
        end
        inherited pnl7: TPanel
          Height = 532
          ExplicitHeight = 532
          inherited pnl8: TPanel
            Height = 530
            ExplicitHeight = 530
            inherited lbl12: TLabel
              Left = 158
              Top = 201
              Width = 60
              Font.Color = clRed
              Font.Style = [fsBold]
              ExplicitLeft = 158
              ExplicitTop = 201
              ExplicitWidth = 60
            end
            inherited Label2: TLabel
              Left = 9
              Top = 337
              Visible = False
              ExplicitLeft = 9
              ExplicitTop = 337
            end
            inherited lbl4: TLabel
              Top = 203
              Width = 73
              Font.Color = clRed
              Font.Style = [fsBold]
              ExplicitTop = 203
              ExplicitWidth = 73
            end
            inherited lbl7: TLabel
              Left = 58
              Top = 250
              ExplicitLeft = 58
              ExplicitTop = 250
            end
            inherited lbl6: TLabel
              Left = 166
              Top = 148
              ExplicitLeft = 166
              ExplicitTop = 148
            end
            object lbl14: TLabel [10]
              Left = 61
              Top = 175
              Width = 24
              Height = 13
              Caption = #21608#26399
            end
            inherited lbl15: TLabel
              Left = 175
              Top = 177
              ExplicitLeft = 175
              ExplicitTop = 177
            end
            inherited Label6: TLabel
              Left = 44
              Top = 369
              Visible = False
              ExplicitLeft = 44
              ExplicitTop = 369
            end
            inherited lbl11: TLabel
              Left = 159
              Top = 367
              Visible = False
              ExplicitLeft = 159
              ExplicitTop = 367
            end
            inherited lbl8: TLabel
              Left = 11
              Top = 393
              Visible = False
              ExplicitLeft = 11
              ExplicitTop = 393
            end
            inherited Label3: TLabel
              Left = 130
              Top = 395
              Visible = False
              ExplicitLeft = 130
              ExplicitTop = 395
            end
            inherited lbl10: TLabel
              Left = 32
              Top = 442
              Visible = False
              ExplicitLeft = 32
              ExplicitTop = 442
            end
            inherited Label4: TLabel
              Left = 156
              Top = 438
              Visible = False
              ExplicitLeft = 156
              ExplicitTop = 438
            end
            inherited Label1: TLabel
              Top = 227
              ExplicitTop = 227
            end
            inherited Label7: TLabel
              Left = 139
              Top = 225
              ExplicitLeft = 139
              ExplicitTop = 225
            end
            inherited lbl16: TLabel
              Left = 26
              Top = 464
              Visible = False
              ExplicitLeft = 26
              ExplicitTop = 464
            end
            inherited lbl17: TLabel
              Left = 264
              Top = 363
              Visible = False
              ExplicitLeft = 264
              ExplicitTop = 363
            end
            inherited edt_PassQty: TRKeyRzBtnEdit
              Left = 215
              Top = 198
              Width = 49
              ExplicitLeft = 215
              ExplicitTop = 198
              ExplicitWidth = 49
            end
            inherited edt_FailQty: TRKeyRzBtnEdit
              Left = 73
              Top = 335
              Color = clBtnFace
              Enabled = False
              Visible = False
              ExplicitLeft = 73
              ExplicitTop = 335
            end
            inherited edt_Remark: TRKeyRzBtnEdit
              Left = 86
              Top = 247
              ExplicitLeft = 86
              ExplicitTop = 247
            end
            inherited edt_AllQty: TRKeyRzBtnEdit
              Top = 197
              ExplicitTop = 197
            end
            inherited edt_CheckCount: TRKeyRzBtnEdit
              Left = 216
              Top = 145
              ExplicitLeft = 216
              ExplicitTop = 145
            end
            inherited edt_MachineNo: TRKeyRzBtnEdit
              Left = 215
              Top = 171
              Width = 66
              TabOrder = 19
              ExplicitLeft = 215
              ExplicitTop = 171
              ExplicitWidth = 66
            end
            inherited edt_PnlQty: TRKeyRzBtnEdit
              Left = 71
              Top = 388
              Visible = False
              ExplicitLeft = 71
              ExplicitTop = 388
            end
            inherited edt_PPassQty: TRKeyRzBtnEdit
              Left = 189
              Top = 389
              Visible = False
              ExplicitLeft = 189
              ExplicitTop = 389
            end
            inherited edt_SideQty: TRKeyRzBtnEdit
              Left = 98
              Top = 439
              Visible = False
              ExplicitLeft = 98
              ExplicitTop = 439
            end
            inherited edt_SPassQty: TRKeyRzBtnEdit
              Left = 207
              Top = 434
              Visible = False
              ExplicitLeft = 207
              ExplicitTop = 434
            end
            inherited edt_BTime: TRKeyRzBtnEdit
              Top = 223
              ExplicitTop = 223
            end
            inherited edt_ETime: TRKeyRzBtnEdit
              Left = 153
              Top = 223
              ExplicitLeft = 153
              ExplicitTop = 223
            end
            inherited edt_WManNo: TRKeyRzBtnEdit
              Left = 89
              Top = 461
              Visible = False
              ExplicitLeft = 89
              ExplicitTop = 461
            end
            inherited edt_PBCount: TRKeyRzBtnEdit
              Left = 303
              Top = 360
              Visible = False
              OnExit = nil
              ExplicitLeft = 303
              ExplicitTop = 360
            end
            inherited cbb_HDDesc: TComboBox
              Left = 166
              Top = 313
              Visible = False
              ExplicitLeft = 166
              ExplicitTop = 313
            end
            object edt_TPeriod: TRKeyRzBtnEdit
              Left = 87
              Top = 170
              Width = 58
              Height = 21
              Text = ''
              TabOrder = 9
              ButtonKind = bkFind
              ButtonVisible = False
              AltBtnWidth = 15
              ButtonWidth = 15
              DataSource = dsRMain
              DataSourceField = 'TPeriod'
              DisplayModID = 0
              ForceOnFocus = True
            end
          end
        end
        inherited cbb_QCTestName: TComboBox
          Items.Strings = (
            #39134#38024
            #30005#27979)
        end
        inherited cbb_LayerNo: TComboBox
          Left = 243
          Top = 346
          Visible = False
          ExplicitLeft = 243
          ExplicitTop = 346
        end
      end
      inherited pnl1: TPanel
        Height = 565
        ExplicitHeight = 565
        inherited ehRDetail: TDBGridEh
          Height = 534
        end
      end
    end
    inherited pnl2: TPanel
      Width = 220
      Height = 567
      ExplicitWidth = 220
      ExplicitHeight = 567
      inherited pnl3: TPanel
        Width = 218
        Height = 565
        ExplicitWidth = 218
        ExplicitHeight = 565
      end
    end
  end
end
