object FrmSelEmp: TFrmSelEmp
  Left = 389
  Top = 247
  Width = 582
  Height = 353
  Caption = #36873#25321#24037#21495
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 574
    Height = 322
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 572
      Height = 32
      Align = alTop
      TabOrder = 0
      DesignSize = (
        572
        32)
      object lbl_field: TLabel
        Left = 134
        Top = 8
        Width = 36
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #24037#21495#65306
      end
      object Label1: TLabel
        Left = 352
        Top = 8
        Width = 12
        Height = 13
        Caption = '00'
      end
      object edt_value: TEdit
        Left = 176
        Top = 4
        Width = 121
        Height = 21
        TabOrder = 0
        OnChange = edt_valueChange
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 33
      Width = 572
      Height = 247
      Align = alClient
      TabOrder = 1
      object dgh_emp: TDBGridEh
        Left = 1
        Top = 1
        Width = 570
        Height = 245
        Align = alClient
        DataSource = ds
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnTitleClick = dgh_empTitleClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'sel'
            Footers = <>
            Title.Caption = #36873#25321
            Width = 65
          end
          item
            EditButtons = <>
            FieldName = 'employeecode'
            Footers = <>
            Title.Caption = #21592#24037#24037#21495
          end
          item
            EditButtons = <>
            FieldName = 'chineseName'
            Footers = <>
            Title.Caption = #21592#24037#22995#21517
          end
          item
            EditButtons = <>
            FieldName = 'departmentName'
            Footers = <>
            Title.Caption = #25152#23646#37096#38376
            Width = 114
          end
          item
            EditButtons = <>
            FieldName = 'Accountname'
            Footers = <>
            Title.Caption = #34218' '#36164#36134#22871
            Width = 100
          end>
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 280
      Width = 572
      Height = 41
      Align = alBottom
      TabOrder = 2
      object btn_OK: TButton
        Left = 128
        Top = 8
        Width = 75
        Height = 25
        Caption = #30830#23450
        ModalResult = 1
        TabOrder = 0
      end
      object btn_cancel: TButton
        Left = 368
        Top = 8
        Width = 75
        Height = 25
        Caption = #21462#28040
        TabOrder = 1
        OnClick = btn_cancelClick
      end
      object ckb_all: TCheckBox
        Left = 24
        Top = 8
        Width = 97
        Height = 17
        Caption = #20840#36873
        TabOrder = 2
        OnClick = ckb_allClick
      end
    end
  end
  object ds: TDataSource
    DataSet = qry_SelEmp
    Left = 201
    Top = 114
  end
  object qry_SelEmp: TADOQuery
    Connection = DM.con1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'startDate'
        Size = -1
        Value = Null
      end
      item
        Name = 'endDate'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @TempTable table(sel bit)      '
      '  insert @TempTable'
      '  values (0)'
      
        'select   sel ,a.rkey,employeecode, chineseName,b.departmentName,' +
        ' ondutytime,outdutytime,s.Accountname '
      'from employeemsg a '
      'left join  datadepartment b on a.departmentid= b.rkey'
      'inner join  salaryaccount  s on s.rkey=a.wagetype'
      'join @TempTable c on 1=1'
      ' where (a.outdutytime is null or a.outdutytime>=:startDate )'
      '     and  a.ondutytime<=:endDate')
    Left = 152
    Top = 184
    object qry_SelEmpsel: TBooleanField
      FieldName = 'sel'
    end
    object qry_SelEmprkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object qry_SelEmpemployeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object qry_SelEmpchineseName: TWideStringField
      FieldName = 'chineseName'
    end
    object qry_SelEmpdepartmentName: TWideStringField
      FieldName = 'departmentName'
    end
    object qry_SelEmpondutytime: TDateTimeField
      FieldName = 'ondutytime'
    end
    object qry_SelEmpoutdutytime: TDateTimeField
      FieldName = 'outdutytime'
    end
    object wdstrngfld_SelEmpAccountname: TWideStringField
      FieldName = 'Accountname'
      Size = 50
    end
  end
end
