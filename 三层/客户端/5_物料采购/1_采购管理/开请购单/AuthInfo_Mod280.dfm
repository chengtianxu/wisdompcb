inherited FrmAuthInfo_Mod280: TFrmAuthInfo_Mod280
  Caption = #23457#25209#20449#24687
  ClientHeight = 301
  ClientWidth = 490
  ExplicitWidth = 506
  ExplicitHeight = 339
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 11
    Top = 225
    Width = 75
    Height = 13
    Caption = ' '#25552#20132#23457#25209#26085#26399
  end
  object Label2: TLabel
    Left = 123
    Top = 225
    Width = 75
    Height = 13
    Caption = ' '#26368#21518#23457#25209#26085#26399
  end
  object Label3: TLabel
    Left = 236
    Top = 225
    Width = 75
    Height = 13
    Caption = ' '#25552#20132#37319#36141#26085#26399
  end
  object Label4: TLabel
    Left = 373
    Top = 222
    Width = 79
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#25552#20132#37319#36141#20154#21592':'
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 490
    Height = 209
    Align = alTop
    DataSource = ds276
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'user_id'
        Title.Caption = #23457#26680#21592#20195#30721
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USER_FULL_NAME'
        Title.Caption = #23457#26680#21592#21517#31216
        Width = 156
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'auth_flag'
        Title.Caption = #23457#26680#26631#24535
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'auth_date'
        Title.Caption = #23457#26680#26085#26399
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ranking'
        Title.Caption = #23457#26680#39034#24207
        Width = 72
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 202
    Top = 273
    Width = 75
    Height = 25
    Caption = #20851#38381
    ModalResult = 1
    TabOrder = 1
  end
  object RkyTjsprq: TRKeyRzBtnEdit
    Left = 8
    Top = 244
    Width = 109
    Height = 21
    Text = ''
    Color = clSilver
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    TabOrder = 2
    ButtonKind = bkFind
    ButtonVisible = False
    AltBtnWidth = 15
    ButtonWidth = 15
    DisplayModID = 0
    ForceOnFocus = True
  end
  object RkyZhsprq: TRKeyRzBtnEdit
    Left = 121
    Top = 244
    Width = 109
    Height = 21
    Text = ''
    Color = clSilver
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    TabOrder = 3
    ButtonKind = bkFind
    ButtonVisible = False
    AltBtnWidth = 15
    ButtonWidth = 15
    DisplayModID = 0
    ForceOnFocus = True
  end
  object RkyTjcgrq: TRKeyRzBtnEdit
    Left = 236
    Top = 244
    Width = 109
    Height = 21
    Text = ''
    Color = clSilver
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    TabOrder = 4
    ButtonKind = bkFind
    ButtonVisible = False
    AltBtnWidth = 15
    ButtonWidth = 15
    DisplayModID = 0
    ForceOnFocus = True
  end
  object RkyTjcgry: TRKeyRzBtnEdit
    Left = 351
    Top = 244
    Width = 109
    Height = 21
    Text = ''
    Color = clSilver
    TabOrder = 5
    ButtonKind = bkFind
    ButtonVisible = False
    AltBtnWidth = 15
    ButtonWidth = 15
    DataSourceField = 'req_quantity'
    DisplayModID = 0
    ForceOnFocus = True
  end
  object ds276: TDataSource
    DataSet = cds276
    Left = 328
    Top = 104
  end
  object cds276: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 104
  end
  object cds05: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 184
    Top = 48
  end
end
