object FrmRoutParam: TFrmRoutParam
  Left = 221
  Top = 217
  Width = 665
  Height = 557
  Caption = #26597#30475#27969#31243#21442#25968#21450#21152#24037#25351#31034
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 266
    Top = 439
    Width = 60
    Height = 13
    Alignment = taRightJustify
    Caption = '  '#27493#39588#21495':'
    Visible = False
  end
  object Label13: TLabel
    Left = 200
    Top = 439
    Width = 7
    Height = 13
    Caption = '/'
    Visible = False
  end
  object Label12: TLabel
    Left = 215
    Top = 439
    Width = 26
    Height = 13
    AutoSize = False
    Caption = '10'
    Visible = False
  end
  object Label10: TLabel
    Left = 182
    Top = 439
    Width = 19
    Height = 13
    AutoSize = False
    Caption = '1'
    Visible = False
  end
  object Label11: TLabel
    Left = 114
    Top = 439
    Width = 47
    Height = 13
    Alignment = taRightJustify
    Caption = '  '#20301#32622':'
    Visible = False
  end
  object Label6: TLabel
    Left = 8
    Top = 11
    Width = 87
    Height = 13
    Caption = #21046#31243#21442#25968':    '
  end
  object Label7: TLabel
    Left = 6
    Top = 199
    Width = 94
    Height = 13
    Caption = '  '#21152#24037#25351#31034':   '
  end
  object lbl1: TLabel
    Left = 14
    Top = 327
    Width = 80
    Height = 13
    Caption = #31561#32423#25351#31034':   '
  end
  object UpDown1: TUpDown
    Left = 367
    Top = 434
    Width = 169
    Height = 21
    Associate = Edit2
    Min = 1
    Max = 30
    Orientation = udHorizontal
    Position = 2
    TabOrder = 2
    Visible = False
    OnClick = UpDown1Click
  end
  object DBGrid1: TDBGrid
    Left = 6
    Top = 29
    Width = 573
    Height = 156
    DataSource = dsIESParam
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    OnEnter = DBGrid1Enter
    Columns = <
      item
        Color = cl3DLight
        Expanded = False
        FieldName = 'parameter_name'
        Title.Caption = #21442#25968#21517#31216
        Width = 81
        Visible = True
      end
      item
        Color = cl3DLight
        Expanded = False
        FieldName = 'parameter_desc'
        Title.Caption = #25551#36848
        Width = 169
        Visible = True
      end
      item
        Color = cl3DLight
        Expanded = False
        FieldName = 'datatype'
        Title.Caption = #25968#25454#31867#22411
        Width = 57
        Visible = True
      end
      item
        Color = cl3DLight
        Expanded = False
        FieldName = 'unit_code'
        Title.Caption = #21333#20301
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'parameter_value'
        Title.Caption = #21442#25968#20540
        Width = 186
        Visible = True
      end>
  end
  object Edit2: TEdit
    Left = 338
    Top = 434
    Width = 29
    Height = 21
    ReadOnly = True
    TabOrder = 1
    Text = '2'
    Visible = False
  end
  object Memo1: TMemo
    Left = 8
    Top = 218
    Width = 569
    Height = 97
    ReadOnly = True
    TabOrder = 3
  end
  object BitBtn1: TBitBtn
    Left = 208
    Top = 475
    Width = 75
    Height = 25
    Caption = #30830#23450
    Default = True
    ModalResult = 1
    TabOrder = 4
    NumGlyphs = 2
  end
  object mmo2: TMemo
    Left = 9
    Top = 341
    Width = 569
    Height = 87
    ReadOnly = True
    TabOrder = 5
  end
  object PopupMenu1: TPopupMenu
    Left = 416
    Top = 30
    object Add1: TMenuItem
      Caption = 'Add'
    end
    object Delete1: TMenuItem
      Caption = 'Delete'
    end
  end
  object aqIESParam: TADOQuery
    Connection = frmMain.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'F01'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT D278.PARAMETER_NAME, D494.PARAMETER_VALUE, D38.STEP_NUMBE' +
        'R,'
      '      D278.DATA_TYPE, D02.UNIT_CODE, D278.PARAMETER_DESC'
      'FROM dbo.Data0038 D38 INNER JOIN'
      
        '      dbo.Data0494 D494 ON D38.SOURCE_PTR = D494.custpart_ptr AN' +
        'D '
      '      D38.STEP_NUMBER = D494.step_number INNER JOIN'
      
        '      dbo.Data0278 D278 ON D494.PARAMETER_PTR = D278.RKEY INNER ' +
        'JOIN'
      '      dbo.Data0002 D02 ON D278.UNIT_PTR = D02.RKEY'
      'where D38.rkey=:F01'
      'ORDER BY D494.seq_no')
    Left = 312
    Top = 88
  end
  object dsIESParam: TDataSource
    DataSet = aqIESParam
    Left = 352
    Top = 88
  end
end
