object frmBomBaoJiaTypeEdit: TfrmBomBaoJiaTypeEdit
  Left = 0
  Top = 0
  Caption = 'BOM'#25253#20215#27169#26495#32534#36753
  ClientHeight = 484
  ClientWidth = 636
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 636
    Height = 39
    Align = alTop
    TabOrder = 0
    object btn1: TRzButton
      Left = 17
      Top = 7
      Caption = #20445#23384
      TabOrder = 0
      OnClick = btn1Click
    end
    object btn2: TRzButton
      Left = 113
      Top = 7
      Caption = #36864#20986
      TabOrder = 1
      OnClick = btn2Click
    end
  end
  object pg1: TRzPageControl
    Left = 0
    Top = 39
    Width = 636
    Height = 445
    Hint = ''
    ActivePage = tsTabSheet1
    Align = alClient
    TabIndex = 0
    TabOrder = 1
    FixedDimension = 19
    object tsTabSheet1: TRzTabSheet
      Caption = #24037#24207
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnl1: TRzPanel
        Left = 0
        Top = 0
        Width = 632
        Height = 422
        Align = alClient
        TabOrder = 0
        object lbl1: TRzLabel
          Left = 2
          Top = 2
          Width = 48
          Height = 13
          Align = alTop
          Alignment = taCenter
          Caption = #24037#24207#27969#31243
        end
        object ehBP01: TDBGridEh
          Left = 2
          Top = 15
          Width = 628
          Height = 405
          Align = alClient
          DataSource = dsBP01
          DynProps = <>
          IndicatorOptions = [gioShowRowIndicatorEh]
          PopupMenu = pm1
          ReadOnly = True
          TabOrder = 0
          Columns = <
            item
              ButtonStyle = cbsNone
              DynProps = <>
              EditButtons = <>
              FieldName = 'Selforder'
              Footers = <>
              Title.Caption = #27493#39588
            end
            item
              ButtonStyle = cbsNone
              DynProps = <>
              EditButtons = <>
              FieldName = 'Dept_Name'
              Footers = <>
              Title.Caption = #24037#24207#21517#31216
            end
            item
              ButtonStyle = cbsNone
              DynProps = <>
              EditButtons = <>
              FieldName = 'Dept_Code'
              Footers = <>
              Title.Caption = #24037#24207#20195#30721
            end
            item
              ButtonStyle = cbsNone
              DynProps = <>
              EditButtons = <>
              FieldName = 'BeiShu'
              Footers = <>
              Title.Caption = #32463#36807#27425#25968
              Width = 80
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
    object tsTabSheet2: TRzTabSheet
      Caption = #20840#23616#21442#25968
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnl2: TRzPanel
        Left = 0
        Top = 0
        Width = 632
        Height = 422
        Align = alClient
        TabOrder = 0
        object lbl2: TRzLabel
          Left = 2
          Top = 2
          Width = 48
          Height = 13
          Align = alTop
          Alignment = taCenter
          Caption = #20840#23616#21442#25968
        end
        object ehBP05: TDBGridEh
          Left = 2
          Top = 15
          Width = 628
          Height = 405
          Align = alClient
          DataSource = dsBP05
          DynProps = <>
          IndicatorOptions = [gioShowRowIndicatorEh]
          PopupMenu = pm2
          ReadOnly = True
          TabOrder = 0
          Columns = <
            item
              ButtonStyle = cbsNone
              DynProps = <>
              EditButtons = <>
              FieldName = 'ParamCode'
              Footers = <>
              Title.Caption = #21442#25968#20195#30721
              Width = 80
            end
            item
              ButtonStyle = cbsNone
              DynProps = <>
              EditButtons = <>
              FieldName = 'ParamName'
              Footers = <>
              Title.Caption = #21442#25968#21517#23383
              Width = 100
            end
            item
              ButtonStyle = cbsNone
              DynProps = <>
              EditButtons = <>
              FieldName = 'UnitName'
              Footers = <>
              Title.Caption = #21333#20301
              Width = 60
            end
            item
              ButtonStyle = cbsNone
              DynProps = <>
              EditButtons = <>
              FieldName = 'Datatype'
              Footers = <>
              Title.Caption = #31867#22411
              Width = 80
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
    object tsTabSheet3: TRzTabSheet
      Caption = #21387#21512#25991#26412
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnl7: TRzPanel
        Left = 0
        Top = 0
        Width = 632
        Height = 33
        Align = alTop
        TabOrder = 0
        object btn9: TRzButton
          Left = 192
          Top = 4
          Caption = #23548#20837#25991#26412
          TabOrder = 0
          OnClick = btn9Click
        end
      end
      object mmoYaHeTxt: TRzDBMemo
        Left = 0
        Top = 33
        Width = 632
        Height = 389
        Align = alClient
        DataField = 'YaHeText'
        DataSource = dsBP00
        TabOrder = 1
      end
    end
    object tsTabSheet4: TRzTabSheet
      Caption = #21387#21512#22270#29255
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object imgYaHe: TImage
        Left = 0
        Top = 33
        Width = 632
        Height = 389
        Align = alClient
        ExplicitLeft = 152
        ExplicitTop = 176
        ExplicitWidth = 105
        ExplicitHeight = 105
      end
      object pnl6: TRzPanel
        Left = 0
        Top = 0
        Width = 632
        Height = 33
        Align = alTop
        TabOrder = 0
        object btn10: TRzButton
          Left = 208
          Top = 4
          Caption = #23548#20837#22270#29255
          TabOrder = 0
          OnClick = btn10Click
        end
        object chk1: TCheckBox
          Left = 320
          Top = 8
          Width = 97
          Height = 17
          Caption = #25289#20280#26174#31034
          TabOrder = 1
          OnClick = chk1Click
        end
        object btn11: TRzButton
          Left = 423
          Top = 4
          Caption = #28165#31354#22270#29255
          TabOrder = 2
          OnClick = btn11Click
        end
      end
    end
  end
  object cdsBP01: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 192
    Top = 112
    object strngfldBP01IDKey: TStringField
      FieldName = 'IDKey'
      FixedChar = True
      Size = 38
    end
    object strngfldBP01BP02_ptr: TStringField
      FieldName = 'BP02_ptr'
      FixedChar = True
      Size = 38
    end
    object intgrfldBP01BeiShu: TIntegerField
      FieldName = 'BeiShu'
    end
    object intgrfldBP01Selforder: TIntegerField
      FieldName = 'Selforder'
    end
    object intgrfldBP01D34_ptr: TIntegerField
      FieldName = 'D34_ptr'
    end
    object strngfldBP01Dept_Code: TStringField
      FieldKind = fkLookup
      FieldName = 'Dept_Code'
      LookupDataSet = dm1.cdslookup34
      LookupKeyFields = 'RKEY'
      LookupResultField = 'DEPT_CODE'
      KeyFields = 'D34_ptr'
      Lookup = True
    end
    object strngfldBP01Dept_Name: TStringField
      FieldKind = fkLookup
      FieldName = 'Dept_Name'
      LookupDataSet = dm1.cdslookup34
      LookupKeyFields = 'RKEY'
      LookupResultField = 'DEPT_NAME'
      KeyFields = 'D34_ptr'
      Lookup = True
    end
    object strngfldBP01BP00_Ptr: TStringField
      FieldName = 'BP00_Ptr'
      Size = 38
    end
  end
  object cdsBP05: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'd278_ptr'
    Params = <>
    Left = 192
    Top = 272
    object strngfldBP05IDKey: TStringField
      FieldName = 'IDKey'
      FixedChar = True
      Size = 38
    end
    object intgrfldBP05D278_ptr: TIntegerField
      FieldName = 'D278_ptr'
    end
    object strngfldBP05ParamCode: TStringField
      FieldKind = fkLookup
      FieldName = 'ParamCode'
      LookupDataSet = dm1.cdsLookup278
      LookupKeyFields = 'rkey'
      LookupResultField = 'PARAMETER_NAME'
      KeyFields = 'D278_ptr'
      Lookup = True
    end
    object strngfldBP05ParamName: TStringField
      FieldKind = fkLookup
      FieldName = 'ParamName'
      LookupDataSet = dm1.cdsLookup278
      LookupKeyFields = 'rkey'
      LookupResultField = 'PARAMETER_DESC'
      KeyFields = 'D278_ptr'
      Lookup = True
    end
    object strngfldBP05UnitName: TStringField
      FieldKind = fkLookup
      FieldName = 'UnitName'
      LookupDataSet = dm1.cdsLookup278
      LookupKeyFields = 'rkey'
      LookupResultField = 'UNIT_CODE'
      KeyFields = 'D278_ptr'
      Lookup = True
    end
    object strngfldBP05Datatype: TStringField
      FieldKind = fkLookup
      FieldName = 'Datatype'
      LookupDataSet = dm1.cdsLookup278
      LookupKeyFields = 'rkey'
      LookupResultField = 'datatype'
      KeyFields = 'D278_ptr'
      Size = 0
      Lookup = True
    end
    object strngfldBP05bp00_ptr: TStringField
      FieldName = 'bp00_ptr'
      Size = 38
    end
  end
  object dsBP01: TDataSource
    DataSet = cdsBP01
    Left = 264
    Top = 112
  end
  object dsBP05: TDataSource
    DataSet = cdsBP05
    Left = 264
    Top = 272
  end
  object pm1: TPopupMenu
    OnPopup = pm1Popup
    Left = 264
    Top = 176
    object mniAppend: TMenuItem
      Caption = #26032#22686
      OnClick = mniAppendClick
    end
    object mniEdit: TMenuItem
      Caption = #32534#36753
      OnClick = mniEditClick
    end
    object mniDele: TMenuItem
      Caption = #21024#38500
      OnClick = mniDeleClick
    end
    object mniInsert: TMenuItem
      Caption = #25554#20837
      OnClick = mniInsertClick
    end
    object mniMoRenCaiLiao: TMenuItem
      Caption = #40664#35748#26448#26009
      OnClick = mniMoRenCaiLiaoClick
    end
  end
  object pm2: TPopupMenu
    Left = 264
    Top = 328
    object mniN1: TMenuItem
      Caption = #26032#22686
      OnClick = mniN1Click
    end
    object mniN2: TMenuItem
      Caption = #32534#36753
      OnClick = mniN2Click
    end
    object mniN3: TMenuItem
      Caption = #21024#38500
      OnClick = mniN3Click
    end
  end
  object cdsBP00: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 440
    Top = 112
  end
  object dsBP00: TDataSource
    DataSet = cdsBP00
    Left = 496
    Top = 112
  end
  object opdg1: TOpenDialog
    Left = 384
    Top = 120
  end
  object cdsBP15: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 144
    Top = 176
    object strngfldBP15idkey: TStringField
      FieldName = 'idkey'
      FixedChar = True
      Size = 38
    end
    object strngfldBP15BP00_ptr: TStringField
      FieldName = 'BP00_ptr'
      FixedChar = True
      Size = 38
    end
    object strngfldBP15BP01_ptr: TStringField
      FieldName = 'BP01_ptr'
      FixedChar = True
      Size = 38
    end
    object intgrfldBP15d34_ptr: TIntegerField
      FieldName = 'd34_ptr'
    end
    object intgrfldBP15d17_ptr: TIntegerField
      FieldName = 'd17_ptr'
    end
    object intgrfldBP15d494_ptr: TIntegerField
      FieldName = 'd496_ptr'
    end
    object intgrfldBP15d28_ptr: TIntegerField
      FieldName = 'd28_ptr'
    end
    object intgrfldBP15beishu: TIntegerField
      FieldName = 'beishu'
    end
  end
  object dsBP15: TDataSource
    DataSet = cdsBP15
    Left = 200
    Top = 176
  end
end
