object frmCreateOutTag: TfrmCreateOutTag
  Left = 546
  Top = 221
  Width = 895
  Height = 710
  Caption = #29983#25104#22806#31665#26631#31614
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 879
    Height = 37
    Align = alTop
    TabOrder = 0
    Visible = False
    object lbl1: TLabel
      Left = 16
      Top = 8
      Width = 87
      Height = 19
      Caption = #22806#31665'PCS'#25968
    end
    object edtPcsNum: TEdit
      Left = 109
      Top = 4
      Width = 121
      Height = 27
      ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
      TabOrder = 0
      OnKeyPress = edtPcsNumKeyPress
    end
    object btnSetPCS: TButton
      Left = 237
      Top = 5
      Width = 75
      Height = 25
      Caption = #35774#32622
      TabOrder = 1
      OnClick = btnSetPCSClick
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 37
    Width = 879
    Height = 634
    Align = alClient
    TabOrder = 1
    object pnl3: TPanel
      Left = 1
      Top = 592
      Width = 877
      Height = 41
      Align = alBottom
      TabOrder = 0
      object lbl5: TLabel
        Left = 883
        Top = 10
        Width = 48
        Height = 19
        Caption = #28014#21160'%'
      end
      object lblTargetWeight: TLabel
        Left = 488
        Top = 5
        Width = 57
        Height = 19
        AutoSize = False
        Caption = '0'
      end
      object lbl6: TLabel
        Left = 426
        Top = 4
        Width = 57
        Height = 19
        Caption = #26495#37325#65306
      end
      object lbl7: TLabel
        Left = 561
        Top = 4
        Width = 57
        Height = 19
        Caption = #34955#37325#65306
        OnDblClick = lbl7DblClick
      end
      object lblPWeight: TLabel
        Left = 618
        Top = 4
        Width = 10
        Height = 19
        Caption = '0'
      end
      object btnPrint: TButton
        Left = 344
        Top = 10
        Width = 75
        Height = 25
        Caption = #25171#21360
        TabOrder = 0
        OnClick = btnPrintClick
      end
      object edt1: TEdit
        Left = 953
        Top = 7
        Width = 88
        Height = 27
        ReadOnly = True
        TabOrder = 1
        Text = '4'
      end
    end
    object pnl4: TPanel
      Left = 1
      Top = 1
      Width = 877
      Height = 41
      Align = alTop
      TabOrder = 1
      object lbl2: TLabel
        Left = 16
        Top = 8
        Width = 76
        Height = 19
        Caption = #26465#30721#25195#25551
      end
      object lblAllQty: TDBText
        Left = 608
        Top = 8
        Width = 65
        Height = 17
        DataField = 'AllQty'
        DataSource = dsIn
      end
      object lbl4: TLabel
        Left = 480
        Top = 8
        Width = 247
        Height = 19
        Caption = #25195#25551#38169#35823#65292#35831#37325#32622#37325#26032#26469#36807#65281
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -19
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object edtBarInPut: TEdit
        Left = 107
        Top = 8
        Width = 257
        Height = 27
        Enabled = False
        ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
        TabOrder = 0
        OnKeyPress = edtBarInPutKeyPress
      end
      object btnRefresh: TButton
        Left = 370
        Top = 8
        Width = 75
        Height = 25
        Caption = #37325#26469
        Enabled = False
        TabOrder = 1
        OnClick = btnRefreshClick
      end
    end
    object dbgrd1: TDBGrid
      Left = 169
      Top = 42
      Width = 709
      Height = 550
      Align = alClient
      DataSource = dsIn
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -19
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'MANU_PART_NUMBER'
          Title.Caption = #26412#21378#32534#21495
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MANU_PART_DESC'
          Title.Caption = #23458#25143#22411#21495
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'qty'
          Title.Caption = #25968#37327
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'lotno'
          Title.Caption = #21608#26399
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CaseNo'
          Title.Caption = #31665#21495
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'barcode_id'
          Title.Caption = #26465#30721
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ANALYSIS_CODE_2'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PO_NUMBER'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'description'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'code'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'notes'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'param1'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Param2'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'wo_ptr'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'outpackkey'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IncNO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'idkey'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'pack_ptr'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'order_no'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LotOrder'
          Title.Caption = 'LOT'#21495
          Visible = True
        end>
    end
    object pnl5: TPanel
      Left = 1
      Top = 42
      Width = 168
      Height = 550
      Align = alLeft
      TabOrder = 3
      object lbl3: TLabel
        Left = 1
        Top = 1
        Width = 166
        Height = 19
        Align = alTop
        Caption = #20869#31665#19968#33268#26816#26597#39033#30446
      end
      object lst1: TCheckListBox
        Left = 1
        Top = 20
        Width = 166
        Height = 529
        OnClickCheck = lst1ClickCheck
        Align = alClient
        ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
        ItemHeight = 19
        TabOrder = 0
      end
    end
  end
  object cdsIn: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    Left = 144
    Top = 217
    object intgrfldInpack_ptr: TIntegerField
      FieldName = 'pack_ptr'
    end
    object smlntfldInorder_no: TSmallintField
      FieldName = 'order_no'
    end
    object strngfldInMANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object strngfldInMANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object strngfldInANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      Size = 50
    end
    object strngfldInPO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object strngfldIndescription: TStringField
      FieldName = 'description'
      Size = 50
    end
    object strngfldIncode: TStringField
      FieldName = 'code'
      Size = 15
    end
    object intgrfldInqty: TIntegerField
      FieldName = 'qty'
    end
    object strngfldInlotno: TStringField
      FieldName = 'lotno'
      Size = 50
    end
    object strngfldInnotes: TStringField
      FieldName = 'notes'
      Size = 50
    end
    object strngfldInbarcode_id: TStringField
      FieldName = 'barcode_id'
      Size = 80
    end
    object strngfldInCaseNo: TStringField
      FieldName = 'CaseNo'
      Size = 7
    end
    object strngfldInparam1: TStringField
      FieldName = 'param1'
      Size = 80
    end
    object strngfldInParam2: TStringField
      FieldName = 'Param2'
      Size = 150
    end
    object intgrfldInwo_ptr: TIntegerField
      FieldName = 'wo_ptr'
    end
    object intgrfldInoutpackkey: TIntegerField
      FieldName = 'outpackkey'
    end
    object intgrfldInIncNO: TIntegerField
      FieldName = 'IncNO'
    end
    object strngfldInidkey: TStringField
      FieldName = 'idkey'
      Size = 30
    end
    object strngfldInLotOrder: TStringField
      FieldName = 'LotOrder'
      Size = 128
    end
    object agrgtfldInAllQty: TAggregateField
      DefaultExpression = 'sum(qty)'
      FieldName = 'AllQty'
      Visible = True
      Active = True
      Expression = 'sum(qty)'
    end
  end
  object dsIn: TDataSource
    DataSet = cdsIn
    Left = 200
    Top = 217
  end
end
