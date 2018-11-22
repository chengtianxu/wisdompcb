object frmMITree: TfrmMITree
  Left = 549
  Top = 276
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #25353#23618#25552#20132#23457#26680
  ClientHeight = 328
  ClientWidth = 295
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
  object tvMiTree: TTreeView
    Left = 0
    Top = 0
    Width = 295
    Height = 249
    Align = alTop
    Indent = 19
    ReadOnly = True
    TabOrder = 0
    OnClick = tvMiTreeClick
  end
  object cbxyxbj: TCheckBox
    Left = 9
    Top = 256
    Width = 81
    Height = 17
    Caption = #20801#35768#32534#36753
    TabOrder = 3
    Visible = False
  end
  object cbxgdfczh: TCheckBox
    Left = 97
    Top = 256
    Width = 97
    Height = 17
    Caption = #24037#21333#21457#20986#26242#32531
    TabOrder = 4
    Visible = False
  end
  object cbxtczh: TCheckBox
    Left = 208
    Top = 256
    Width = 81
    Height = 17
    Caption = #25237#20135#26242#32531
    TabOrder = 5
    Visible = False
  end
  object rgxgyx: TRadioGroup
    Left = 33
    Top = 282
    Width = 225
    Height = 41
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #38144#21806#26377#25928
      #38144#21806#26080#25928)
    TabOrder = 6
    Visible = False
  end
  object btn1: TButton
    Left = 40
    Top = 283
    Width = 75
    Height = 25
    Caption = #25552#20132
    TabOrder = 1
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 184
    Top = 283
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 2
    OnClick = btn2Click
  end
  object adsMiTree: TADODataSet
    Connection = DM.ADOConnection1
    CommandText = 
      ';WITH tmp(RKey,Lv,MANU_PART_NUMBER,PARENT_PTR,TSTATUS,BOM_STATUS' +
      ') AS '#13#10'(SELECT RKey,1,MANU_PART_NUMBER,PARENT_PTR,TSTATUS,BOM_ST' +
      'ATUS FROM Data0025 WHERE RKey =:p1'#13#10'UNION ALL '#13#10'SELECT D25.RKey,' +
      'tmp.Lv+1,D25.MANU_PART_NUMBER,d25.PARENT_PTR,d25.TSTATUS,d25.BOM' +
      '_STATUS  FROM Data0025 D25 '#13#10'INNER JOIN tmp ON D25.PARENT_PTR = ' +
      'tmp.RKey ) '#13#10'SELECT * FROM tmp ORDER BY lv '#13#10
    Parameters = <
      item
        Name = 'p1'
        DataType = ftInteger
        Value = Null
      end>
    Left = 16
    Top = 16
  end
end
