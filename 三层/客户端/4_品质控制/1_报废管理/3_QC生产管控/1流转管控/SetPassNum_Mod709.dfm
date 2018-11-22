inherited frmSetPassNum_Mod709: TfrmSetPassNum_Mod709
  Caption = #27969#36716#31649#25511
  ClientHeight = 471
  ClientWidth = 997
  OnClose = FormClose
  ExplicitWidth = 1005
  ExplicitHeight = 498
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 997
    Height = 471
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 997
    ExplicitHeight = 471
    inherited pnl1: TPanel
      Width = 995
      Visible = False
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 995
    end
    inherited pnl2: TPanel
      Width = 995
      Height = 436
      ExplicitLeft = 1
      ExplicitTop = 34
      ExplicitWidth = 995
      ExplicitHeight = 436
      object Panel1: TPanel
        Left = 1
        Top = 1
        Width = 304
        Height = 434
        Align = alLeft
        TabOrder = 0
        object Label1: TLabel
          Left = 11
          Top = 49
          Width = 60
          Height = 13
          Caption = #20316#19994#21333#21495#65306
        end
        object Label4: TLabel
          Left = 11
          Top = 78
          Width = 60
          Height = 13
          Caption = #25918#34892#25968#37327#65306
        end
        object Label2: TLabel
          Left = 11
          Top = 18
          Width = 60
          Height = 13
          Caption = #24037#24207#21517#31216#65306
        end
        object Label3: TLabel
          Left = 169
          Top = 16
          Width = 3
          Height = 13
        end
        object edtNo: TEdit
          Left = 69
          Top = 44
          Width = 145
          Height = 21
          TabOrder = 0
          OnExit = edtNoExit
          OnKeyPress = edtNoKeyPress
        end
        object Edit2: TEdit
          Left = 69
          Top = 75
          Width = 74
          Height = 21
          TabOrder = 1
          OnKeyPress = Edit2KeyPress
        end
        object GroupBox1: TGroupBox
          Left = 44
          Top = 108
          Width = 193
          Height = 58
          Caption = #26159#21542#29983#25928
          TabOrder = 2
          object RadioButton1: TRadioButton
            Left = 113
            Top = 26
            Width = 44
            Height = 17
            Caption = #26080#25928
            TabOrder = 0
          end
          object RadioButton2: TRadioButton
            Left = 37
            Top = 25
            Width = 56
            Height = 17
            Caption = #29983#25928
            Checked = True
            TabOrder = 1
            TabStop = True
          end
        end
        object Button1: TButton
          Left = 95
          Top = 194
          Width = 82
          Height = 32
          Caption = #38145' '#23450
          TabOrder = 3
          OnClick = Button1Click
        end
        object Edit1: TEdit
          Left = 69
          Top = 11
          Width = 74
          Height = 21
          TabOrder = 4
        end
        object BitBtn2: TBitBtn
          Tag = 1
          Left = 140
          Top = 9
          Width = 26
          Height = 25
          Glyph.Data = {
            EE000000424DEE000000000000007600000028000000100000000F0000000100
            04000000000078000000130B0000130B00001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            888800000888880000080F000888880F00080F000888880F0008000000080000
            000800F000000F00000800F000800F00000800F000800F000008800000000000
            0088880F00080F000888880000080000088888800088800088888880F08880F0
            888888800088800088888888888888888888}
          TabOrder = 5
          OnClick = BitBtn2Click
        end
        object BitBtn1: TBitBtn
          Tag = 1
          Left = 211
          Top = 42
          Width = 26
          Height = 25
          Glyph.Data = {
            EE000000424DEE000000000000007600000028000000100000000F0000000100
            04000000000078000000130B0000130B00001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            888800000888880000080F000888880F00080F000888880F0008000000080000
            000800F000000F00000800F000800F00000800F000800F000008800000000000
            0088880F00080F000888880000080000088888800088800088888880F08880F0
            888888800088800088888888888888888888}
          TabOrder = 6
          OnClick = BitBtn1Click
        end
      end
      object Panel2: TPanel
        Left = 305
        Top = 1
        Width = 689
        Height = 434
        Align = alClient
        TabOrder = 1
        object DBGridEh1: TDBGridEh
          Left = 1
          Top = 1
          Width = 687
          Height = 432
          Align = alClient
          DataSource = dspassNum
          DynProps = <>
          FooterParams.Color = clWindow
          Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          OnDblClick = DBGridEh1DblClick
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'WORK_ORDER_NUMBER'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #20316#19994#21333#21495
              Width = 130
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'DEPT_CODE'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #24037#24207#20195#30721
              Width = 80
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'DEPT_NAME'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #24037#24207#21517#31216
              Width = 120
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'PassNum'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #33391#21697#25968#20540
              Width = 80
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'EMPLOYEE_NAME'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #36755#20837#20154#21592
              Width = 60
            end
            item
              DisplayFormat = 'yyyy-MM-dd'
              DynProps = <>
              EditButtons = <>
              FieldName = 'InputDate'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #36755#20837#26102#38388
              Width = 140
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'sEnable'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #29366#24577
              Width = 60
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
  end
  object dspassNum: TDataSource
    DataSet = cdsPassNum
    Left = 608
    Top = 144
  end
  object cdsPassNum: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 504
    Top = 144
  end
  object cdsSave: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 704
    Top = 144
  end
end
