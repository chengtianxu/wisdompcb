object FrmSelected_Mod63: TFrmSelected_Mod63
  Left = 0
  Top = 0
  Caption = #36873#25321#29289#26009#31867#22411
  ClientHeight = 418
  ClientWidth = 540
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 540
    Height = 41
    Align = alTop
    TabOrder = 0
    object labelKey: TLabel
      Left = 142
      Top = 19
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = #25628#32034#65306
    end
    object edtKey: TEdit
      Left = 174
      Top = 15
      Width = 142
      Height = 21
      TabOrder = 0
      OnChange = edtKeyChange
    end
    object CheckBox1: TCheckBox
      Left = 384
      Top = 18
      Width = 97
      Height = 17
      Caption = #20840#36873
      TabOrder = 1
      OnClick = CheckBox1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 377
    Width = 540
    Height = 41
    Align = alBottom
    TabOrder = 1
    object OKBtn: TButton
      Left = 151
      Top = 6
      Width = 75
      Height = 25
      Caption = #30830#23450'(Y)'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object CancelBtn: TButton
      Left = 279
      Top = 6
      Width = 75
      Height = 25
      Cancel = True
      Caption = #21462#28040'(&C)'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 41
    Width = 540
    Height = 336
    Align = alClient
    TabOrder = 2
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 538
      Height = 334
      Align = alClient
      DataSource = ds496
      DynProps = <>
      TabOrder = 0
      Columns = <
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'checked'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'Dept_Code'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'Dept_Name'
          Footers = <>
          Width = 345
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object cds496: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 264
    Top = 240
    object cds496checked: TBooleanField
      DisplayLabel = #36873#20013
      FieldName = 'checked'
    end
    object cds496rKey: TAutoIncField
      FieldName = 'rKey'
      ReadOnly = True
    end
    object cds496Dept_Code: TStringField
      DisplayLabel = #31867#22411#20195#30721
      FieldName = 'Dept_Code'
      ReadOnly = True
    end
    object cds496Dept_Name: TStringField
      DisplayLabel = #29289#26009#21517#31216
      FieldName = 'Dept_Name'
      ReadOnly = True
      Size = 61
    end
  end
  object ds496: TDataSource
    DataSet = cds496
    Left = 144
    Top = 248
  end
end
