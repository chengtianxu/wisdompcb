object Form_misctooliv: TForm_misctooliv
  Left = 305
  Top = 199
  Width = 675
  Height = 513
  Caption = #20854#23427#36153#29992#21457#31080#25628#32034
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 447
    Width = 667
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      667
      39)
    object Button1: TButton
      Left = 243
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #30830#23450
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 321
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Cancel = True
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
    object CheckBox1: TCheckBox
      Left = 35
      Top = 12
      Width = 57
      Height = 17
      Caption = #20840#36873
      TabOrder = 2
      OnClick = CheckBox1Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 667
    Height = 447
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'INVOICE_NO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = #31867#22411
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_DATE'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MATL_TOT'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MISC_TOT'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FED_TAX'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_TOTAL'
        Width = 77
        Visible = True
      end>
  end
  object ads112: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT  Data0107.rkey, INVOICE_NO,  INV_DATE,'#13#10'INV_TOTAL,MATL_TO' +
      'T, FED_TAX, MISC_TOT,'#13#10'CASE INV_TP '#13#10'WHEN 0 THEN '#39#26631#20934'PO'#39#13#10'WHEN 1 ' +
      'THEN '#39#26434#39033'PO'#39#13#10'WHEN 2 THEN '#39#30452#25509#20837#20179#39' '#13#10'WHEN 3 THEN '#39#22996#22806#21152#24037#39' '#13#10'WHEN 4 TH' +
      'EN '#39#20854#23427#36153#29992#39' END AS '#31867#22411','#13#10' GL_HEADER_PTR, INV_TP, '#39'0'#39'as sType'#13#10'FROM ' +
      '        dbo.Data0107'#13#10'WHERE  (STATUS = 1) AND (GLPTR_STATUS = 0)' +
      #13#10
    IndexFieldNames = 'INVOICE_NO'
    Parameters = <>
    Prepared = True
    Left = 104
    Top = 88
    object ads112rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ads112INVOICE_NO: TStringField
      DisplayLabel = #21457#31080#32534#30721
      FieldName = 'INVOICE_NO'
      Size = 16
    end
    object ads112INV_DATE: TDateTimeField
      DisplayLabel = #21457#31080#26085#26399
      FieldName = 'INV_DATE'
    end
    object ads112INV_TOTAL: TBCDField
      DisplayLabel = #24635#35745#37329#39069
      FieldName = 'INV_TOTAL'
      Precision = 19
    end
    object ads112MATL_TOT: TBCDField
      DisplayLabel = #19981#21547#31246#37329#39069
      FieldName = 'MATL_TOT'
      Precision = 19
    end
    object ads112FED_TAX: TBCDField
      DisplayLabel = #31246#37329
      FieldName = 'FED_TAX'
      Precision = 19
    end
    object ads112MISC_TOT: TBCDField
      DisplayLabel = #26434#39033#36153#29992
      FieldName = 'MISC_TOT'
      Precision = 19
    end
    object ads112DSDesigner: TStringField
      FieldName = #31867#22411
      ReadOnly = True
      Size = 8
    end
    object ads112GL_HEADER_PTR: TIntegerField
      FieldName = 'GL_HEADER_PTR'
    end
    object ads112INV_TP: TStringField
      FieldName = 'INV_TP'
      FixedChar = True
      Size = 1
    end
    object ads112sType: TStringField
      FieldName = 'sType'
      ReadOnly = True
      Size = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = ads112
    OnDataChange = DataSource1DataChange
    Left = 72
    Top = 88
  end
end
