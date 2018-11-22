object frmBOMBaoJiaDeptEdit: TfrmBOMBaoJiaDeptEdit
  Left = 0
  Top = 0
  Caption = 'BOM'#25253#20215#25104#26412#20013#24515#35774#32622
  ClientHeight = 476
  ClientWidth = 778
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
    Width = 778
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
    Width = 778
    Height = 437
    Hint = ''
    ActivePage = ts1
    Align = alClient
    UseColoredTabs = True
    TabIndex = 0
    TabOrder = 1
    TabOrientation = toLeft
    TabSequence = tsReverse
    TabStyle = tsCutCorner
    FixedDimension = 63
    object ts1: TRzTabSheet
      Caption = #24037#24207#21442#25968
      object eh1: TDBGridEh
        Left = 0
        Top = 0
        Width = 713
        Height = 435
        Align = alClient
        DataSource = dsbp03
        DynProps = <>
        PopupMenu = pm1
        TabOrder = 0
        Columns = <
          item
            ButtonStyle = cbsNone
            DynProps = <>
            EditButton.Visible = False
            EditButtons = <>
            FieldName = 'param_code'
            Footers = <>
            Title.Caption = #21442#25968#20195#30721
          end
          item
            ButtonStyle = cbsNone
            DynProps = <>
            EditButton.Visible = False
            EditButtons = <>
            FieldName = 'param_name'
            Footers = <>
            Title.Caption = #21442#25968#21517#31216
          end
          item
            ButtonStyle = cbsNone
            DynProps = <>
            EditButton.Visible = False
            EditButtons = <>
            FieldName = 'unitcode'
            Footers = <>
            Title.Caption = #21333#20301
            Width = 70
          end
          item
            ButtonStyle = cbsNone
            DynProps = <>
            EditButton.Visible = False
            EditButtons = <>
            FieldName = 'datatype'
            Footers = <>
            Title.Caption = #31867#22411
            Width = 70
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'Param_Value'
            Footers = <>
            Title.Caption = #21442#25968#20540
            Width = 150
          end
          item
            AutoDropDown = True
            ButtonStyle = cbsDropDown
            DynProps = <>
            EditButton.Visible = True
            EditButtons = <>
            FieldName = 'color'
            Footers = <>
            KeyList.Strings = (
              'clred'
              'clblue'
              'clblack')
            PickList.Strings = (
              #32418#33394
              #34013#33394
              #40657#33394)
            Title.Caption = #39068#33394
            Width = 80
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object ts2: TRzTabSheet
      Caption = #19968#31867#26448#26009
      object eh2: TDBGridEh
        Left = 0
        Top = 0
        Width = 713
        Height = 435
        Align = alClient
        DataSource = dsBP04
        DynProps = <>
        PopupMenu = pm2
        ReadOnly = True
        TabOrder = 0
        Columns = <
          item
            ButtonStyle = cbsNone
            DynProps = <>
            EditButton.Visible = False
            EditButtons = <>
            FieldName = 'groupname'
            Footers = <>
            Title.Caption = #26448#26009#31867#21035#20195#30721
            Width = 100
          end
          item
            ButtonStyle = cbsNone
            DynProps = <>
            EditButton.Visible = False
            EditButtons = <>
            FieldName = 'groupdesc'
            Footers = <>
            Title.Caption = #26448#26009#31867#21035#21517#31216
            Width = 120
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object ts3: TRzTabSheet
      Caption = #20854#20182#36153#29992
      object lbl1: TRzLabel
        Left = 13
        Top = 36
        Width = 60
        Height = 13
        Caption = #20108#31867#26448#26009#65306
      end
      object lbl2: TRzLabel
        Left = 13
        Top = 137
        Width = 60
        Height = 13
        Caption = #20154#24037#36153#29992#65306
      end
      object lbl3: TRzLabel
        Left = 13
        Top = 229
        Width = 60
        Height = 13
        Caption = #27700#30005#36153#29992#65306
      end
      object lbl4: TRzLabel
        Left = 13
        Top = 332
        Width = 60
        Height = 13
        Caption = #25240#26087#36153#29992#65306
      end
      object lbl5: TLabel
        Left = 13
        Top = 5
        Width = 111
        Height = 13
        Caption = #35745#31639#20844#24335'('#27599'PCS'#28040#32791')'
      end
      object mmoP3: TRzDBMemo
        Left = 80
        Top = 134
        Width = 617
        Height = 90
        DataField = 'P3'
        DataSource = dsbp02
        TabOrder = 0
      end
      object mmoP4: TRzDBMemo
        Left = 80
        Top = 229
        Width = 617
        Height = 90
        DataField = 'P4'
        DataSource = dsbp02
        TabOrder = 1
      end
      object mmoP5: TRzDBMemo
        Left = 80
        Top = 329
        Width = 617
        Height = 90
        DataField = 'P5'
        DataSource = dsbp02
        TabOrder = 2
      end
      object mmoP6: TRzDBMemo
        Left = 80
        Top = 38
        Width = 617
        Height = 90
        DataField = 'P2'
        DataSource = dsbp02
        TabOrder = 3
      end
    end
  end
  object cdsbp03: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp1'
    AfterScroll = cdsbp03AfterScroll
    Left = 160
    Top = 56
    object strngfldcdsbp03IDKey: TStringField
      FieldName = 'IDKey'
      FixedChar = True
      Size = 38
    end
    object strngfldcdsbp03BP02_ptr: TStringField
      FieldName = 'BP02_ptr'
      FixedChar = True
      Size = 38
    end
    object intgrfldcdsbp03D34_ptr: TIntegerField
      FieldName = 'D34_ptr'
    end
    object intgrfldcdsbp03D278_ptr: TIntegerField
      FieldName = 'D278_ptr'
    end
    object strngfldcdsbp03Param_Value: TStringField
      FieldName = 'Param_Value'
      Size = 255
    end
    object strngfldcdsbp03param_code: TStringField
      FieldKind = fkLookup
      FieldName = 'param_code'
      LookupDataSet = dm1.cdsLookup278
      LookupKeyFields = 'rkey'
      LookupResultField = 'PARAMETER_NAME'
      KeyFields = 'D278_ptr'
      Lookup = True
    end
    object strngfldcdsbp03param_name: TStringField
      FieldKind = fkLookup
      FieldName = 'param_name'
      LookupDataSet = dm1.cdsLookup278
      LookupKeyFields = 'rkey'
      LookupResultField = 'PARAMETER_DESC'
      KeyFields = 'D278_ptr'
      Lookup = True
    end
    object strngfldcdsbp03unitcode: TStringField
      FieldKind = fkLookup
      FieldName = 'unitcode'
      LookupDataSet = dm1.cdsLookup278
      LookupKeyFields = 'rkey'
      LookupResultField = 'UNIT_CODE'
      KeyFields = 'D278_ptr'
      Lookup = True
    end
    object strngfldcdsbp03datatype: TStringField
      FieldKind = fkLookup
      FieldName = 'datatype'
      LookupDataSet = dm1.cdsLookup278
      LookupKeyFields = 'rkey'
      LookupResultField = 'datatype'
      KeyFields = 'D278_ptr'
      Lookup = True
    end
    object cdsbp03color: TStringField
      FieldName = 'color'
    end
  end
  object dsbp03: TDataSource
    DataSet = cdsbp03
    Left = 216
    Top = 56
  end
  object pm1: TPopupMenu
    OnPopup = pm1Popup
    Left = 264
    Top = 56
    object mniNewParam: TMenuItem
      Caption = #26032#22686
      OnClick = mniNewParamClick
    end
    object mniEditParem: TMenuItem
      Caption = #32534#36753
      OnClick = mniEditParemClick
    end
    object mniDeleParam: TMenuItem
      Caption = #21024#38500
      OnClick = mniDeleParamClick
    end
    object mniView: TMenuItem
      Caption = #26597#30475
      OnClick = mniViewClick
    end
  end
  object cdsBP04: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp1'
    Left = 200
    Top = 128
    object strngfldBP04IDKey: TStringField
      FieldName = 'IDKey'
      FixedChar = True
      Size = 38
    end
    object strngfldBP04BP02_ptr: TStringField
      FieldName = 'BP02_ptr'
      FixedChar = True
      Size = 38
    end
    object intgrfldBP04D34_ptr: TIntegerField
      FieldName = 'D34_ptr'
    end
    object intgrfldBP04D496_ptr: TIntegerField
      FieldName = 'D496_ptr'
    end
    object strngfldBP04calcstr: TStringField
      FieldName = 'calcstr'
      Size = 1024
    end
    object strngfldBP04groupname: TStringField
      FieldKind = fkLookup
      FieldName = 'groupname'
      LookupDataSet = dm1.cdslookup496
      LookupKeyFields = 'rkey'
      LookupResultField = 'GROUP_NAME'
      KeyFields = 'D496_ptr'
      Size = 0
      Lookup = True
    end
    object strngfldBP04groupdesc: TStringField
      FieldKind = fkLookup
      FieldName = 'groupdesc'
      LookupDataSet = dm1.cdslookup496
      LookupKeyFields = 'rkey'
      LookupResultField = 'GROUP_DESC'
      KeyFields = 'D496_ptr'
      Lookup = True
    end
    object strngfldBP04MP_calcstr: TStringField
      FieldName = 'MP_calcstr'
      Size = 1024
    end
  end
  object dsBP04: TDataSource
    DataSet = cdsBP04
    Left = 256
    Top = 128
  end
  object pm2: TPopupMenu
    OnPopup = pm2Popup
    Left = 312
    Top = 128
    object mniNewCaiLiao: TMenuItem
      Caption = #26032#22686
      OnClick = mniNewCaiLiaoClick
    end
    object mniEditCaiLiao: TMenuItem
      Caption = #32534#36753
      OnClick = mniEditCaiLiaoClick
    end
    object mniDeleCailiao: TMenuItem
      Caption = #21024#38500
      OnClick = mniDeleCailiaoClick
    end
    object mniViewCaiLiao: TMenuItem
      Caption = #26597#30475
      OnClick = mniViewCaiLiaoClick
    end
  end
  object cdsbp02: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp1'
    Left = 216
    Top = 200
    object strngfldcdsbp02IDKey: TStringField
      FieldName = 'IDKey'
      FixedChar = True
      Size = 38
    end
    object strngfldcdsbp02P2: TStringField
      FieldName = 'P2'
      Size = 1024
    end
    object strngfldcdsbp02P3: TStringField
      FieldName = 'P3'
      Size = 1024
    end
    object strngfldcdsbp02P4: TStringField
      FieldName = 'P4'
      Size = 1024
    end
    object strngfldcdsbp02P5: TStringField
      FieldName = 'P5'
      Size = 1024
    end
    object intgrfldcdsbp02D34_ptr: TIntegerField
      FieldName = 'D34_ptr'
    end
  end
  object dsbp02: TDataSource
    DataSet = cdsbp02
    Left = 272
    Top = 200
  end
end
