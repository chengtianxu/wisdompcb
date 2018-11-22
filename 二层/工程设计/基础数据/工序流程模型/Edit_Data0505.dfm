object frmEdit_Data0505: TfrmEdit_Data0505
  Left = 226
  Top = 138
  Width = 783
  Height = 566
  Caption = #27969#31243#35774#35745#27169#22411
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 337
    Top = 0
    Width = 5
    Height = 539
    Beveled = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 337
    Height = 539
    Align = alLeft
    Alignment = taLeftJustify
    BevelOuter = bvNone
    TabOrder = 0
    object TreeView1: TTreeView
      Left = 0
      Top = 41
      Width = 337
      Height = 498
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      HideSelection = False
      Images = ImageList
      Indent = 23
      ParentFont = False
      PopupMenu = PopupMenu1
      ReadOnly = True
      TabOrder = 0
      OnChanging = TreeView1Changing
      OnClick = TreeView1Click
      OnCollapsed = TreeView1Collapsed
      OnExpanded = TreeView1Collapsed
      OnGetImageIndex = TreeView1GetImageIndex
      OnGetSelectedIndex = TreeView1GetSelectedIndex
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 337
      Height = 41
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 1
      object btnExpand: TSpeedButton
        Left = 8
        Top = 13
        Width = 65
        Height = 22
        Caption = #20840#37096#23637#24320
        Flat = True
        NumGlyphs = 2
        OnClick = btnExpandClick
      end
      object btnCollapse: TSpeedButton
        Left = 80
        Top = 13
        Width = 73
        Height = 22
        Caption = #20840#37096#25240#21472
        Flat = True
        OnClick = btnCollapseClick
      end
    end
  end
  object Panel3: TPanel
    Left = 342
    Top = 0
    Width = 433
    Height = 539
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 59
      Height = 13
      Caption = #27169#22411#21517#31216':'
    end
    object Label2: TLabel
      Left = 16
      Top = 56
      Width = 59
      Height = 13
      Caption = #27169#22411#25551#36848':'
    end
    object Label3: TLabel
      Left = 16
      Top = 88
      Width = 189
      Height = 13
      Caption = #35774#35745#27969#31243#32463#36807#26412#31449#28857#28385#36275#30340#26465#20214':'
    end
    object Panel4: TPanel
      Left = 14
      Top = 105
      Width = 411
      Height = 288
      BevelInner = bvLowered
      BevelOuter = bvSpace
      TabOrder = 0
      object SpeedButton3: TSpeedButton
        Left = 14
        Top = 48
        Width = 23
        Height = 22
        Caption = '+'
        OnClick = SpeedButton3Click
      end
      object SpeedButton4: TSpeedButton
        Left = 37
        Top = 48
        Width = 23
        Height = 22
        Caption = '-'
        OnClick = SpeedButton3Click
      end
      object SpeedButton5: TSpeedButton
        Left = 60
        Top = 48
        Width = 22
        Height = 22
        Caption = '*'
        OnClick = SpeedButton3Click
      end
      object SpeedButton6: TSpeedButton
        Left = 82
        Top = 48
        Width = 22
        Height = 22
        Caption = '/'
        OnClick = SpeedButton3Click
      end
      object SpeedButton7: TSpeedButton
        Left = 104
        Top = 48
        Width = 22
        Height = 22
        Caption = '='
        OnClick = SpeedButton3Click
      end
      object SpeedButton8: TSpeedButton
        Left = 126
        Top = 48
        Width = 22
        Height = 22
        Caption = '<'
        OnClick = SpeedButton3Click
      end
      object SpeedButton9: TSpeedButton
        Left = 148
        Top = 48
        Width = 22
        Height = 22
        Caption = '>'
        OnClick = SpeedButton3Click
      end
      object SpeedButton10: TSpeedButton
        Left = 170
        Top = 48
        Width = 22
        Height = 22
        Caption = '<>'
        OnClick = SpeedButton3Click
      end
      object SpeedButton11: TSpeedButton
        Left = 192
        Top = 48
        Width = 22
        Height = 22
        Caption = '<='
        OnClick = SpeedButton3Click
      end
      object SpeedButton12: TSpeedButton
        Left = 214
        Top = 48
        Width = 22
        Height = 22
        Caption = '>='
        OnClick = SpeedButton3Click
      end
      object SpeedButton13: TSpeedButton
        Left = 236
        Top = 48
        Width = 22
        Height = 22
        Caption = 'IF'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        OnClick = SpeedButton3Click
      end
      object SpeedButton14: TSpeedButton
        Left = 258
        Top = 48
        Width = 22
        Height = 22
        Caption = '()'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        OnClick = SpeedButton3Click
      end
      object SpeedButton15: TSpeedButton
        Left = 72
        Top = 256
        Width = 49
        Height = 22
        Caption = #28165#38500
        OnClick = SpeedButton15Click
      end
      object SpeedButton16: TSpeedButton
        Left = 16
        Top = 256
        Width = 49
        Height = 22
        Caption = #39564#35777
        OnClick = SpeedButton16Click
      end
      object Label6: TLabel
        Left = 14
        Top = 24
        Width = 65
        Height = 13
        Caption = #24037#31243#34920#21333#65306
      end
      object SpeedButton17: TSpeedButton
        Left = 300
        Top = 16
        Width = 49
        Height = 22
        Caption = #21442#25968
        OnClick = SpeedButton17Click
      end
      object SpeedButton18: TSpeedButton
        Left = 280
        Top = 48
        Width = 23
        Height = 22
        Caption = 'NOT'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        OnClick = SpeedButton3Click
      end
      object SpeedButton19: TSpeedButton
        Left = 303
        Top = 48
        Width = 23
        Height = 22
        Caption = 'AND'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        OnClick = SpeedButton3Click
      end
      object SpeedButton20: TSpeedButton
        Left = 326
        Top = 48
        Width = 23
        Height = 22
        Caption = 'OR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        OnClick = SpeedButton3Click
      end
      object spbtnSave: TSpeedButton
        Left = 293
        Top = 256
        Width = 49
        Height = 22
        Caption = #20445#23384
        OnClick = spbtnSaveClick
      end
      object SpeedButton22: TSpeedButton
        Left = 349
        Top = 256
        Width = 49
        Height = 22
        Caption = #36864#20986
        OnClick = SpeedButton22Click
      end
      object Combobox3: TComboBox
        Left = 78
        Top = 16
        Width = 209
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        OnChange = Combobox3Change
      end
      object Memo1: TDBMemo
        Left = 14
        Top = 77
        Width = 384
        Height = 164
        DataField = 'FORMULA'
        DataSource = dsData050
        TabOrder = 1
      end
      object checkboxNew: TCheckBox
        Left = 125
        Top = 260
        Width = 153
        Height = 17
        Caption = #21482#22788#29702#34987#32534#36753#31449#28857'/'#24037#24207
        TabOrder = 2
        Visible = False
      end
    end
    object DBEdit1: TDBEdit
      Left = 88
      Top = 16
      Width = 137
      Height = 21
      DataField = 'ENG_FLOW_NAME'
      DataSource = frmMain_097.dsMaster
      TabOrder = 1
      OnChange = DBEdit2Change
    end
    object DBEdit2: TDBEdit
      Left = 88
      Top = 48
      Width = 337
      Height = 21
      DataField = 'ENG_FLOW_DESC'
      DataSource = frmMain_097.dsMaster
      TabOrder = 2
      OnChange = DBEdit2Change
    end
    object DBGrid1: TDBGrid
      Left = 16
      Top = 400
      Width = 409
      Height = 137
      DataSource = dsParameters
      ReadOnly = True
      TabOrder = 3
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'PARAMETER_NAME'
          Title.Alignment = taCenter
          Title.Caption = #21442#25968#21517#31216
          Width = 104
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PARAMETER_DESC'
          Title.Alignment = taCenter
          Title.Caption = #25551#36848
          Width = 124
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Unit_Code'
          Title.Alignment = taCenter
          Title.Caption = #21333#20301
          Width = 53
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DataType'
          Title.Alignment = taCenter
          Title.Caption = #25968#25454#31867#22411
          Width = 74
          Visible = True
        end>
    end
  end
  object adsData0505: TADODataSet
    Connection = frmMain_097.ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    BeforeInsert = adsData0505BeforeInsert
    BeforeEdit = adsData0505BeforeEdit
    BeforeDelete = adsData0505BeforeDelete
    CommandText = 'select * from data0505 where eng_flow_ptr=:value'#13#10
    Parameters = <
      item
        Name = 'value'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 112
    Top = 184
  end
  object aqTmp: TADOQuery
    Parameters = <>
    Left = 192
    Top = 184
  end
  object dsData050: TDataSource
    DataSet = adsData0505
    Left = 152
    Top = 184
  end
  object adsTreeData: TADODataSet
    Connection = frmMain_097.ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      '/*'#13#10'exec Eng_Flow_Expand 14'#13#10'select m.*,d.Dept_code,d.Dept_Name ' +
      'from data0505 m left join data0034 d on m.Dept_ptr=d.rkey where ' +
      'eng_flow_ptr=:F01 order by step*/'
    Parameters = <
      item
        Name = 'F01'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 112
    Top = 112
  end
  object ImageList: TImageList
    Left = 176
    Top = 296
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001001000000000000008
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001863
      0000000000000000000000001863000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000104200000000104200000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E07FFF7FE07FFF7FE07F
      FF7FE07FFF7FE07F00000000000000000000000000000000E07F1863E07F1863
      E07F1863E07F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FE07FFF7FE07FFF7F
      E07FFF7FE07FFF7F0000000000000000000000000000E07F0000E07F1863E07F
      1863E07F1863E07F000000000000000000000000000000000000000000001863
      0000000000001863000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E07FFF7FE07FFF7FE07F
      FF7FE07FFF7FE07F0000000000000000000000000000E07FE07F0000E07F1863
      E07F1863E07F1863E07F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FE07FFF7FE07FFF7F
      E07FFF7FE07FFF7F0000000000000000000000000000FF7FE07FE07F00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E07FFF7FE07FFF7FE07F
      FF7FE07FFF7FE07F0000000000000000000000000000E07FFF7FE07F0000E07F
      0000E07F0000E07F00000000000000000000000000001F001F001F001F001F00
      000000001F001F00000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FE07FFF7FE07FFF7F
      E07FFF7FE07FFF7F0000000000000000000000000000FF7FE07FFF7FE07FFF7F
      E07FFF7FE07F000000000000000000000000000000001F000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E07FFF7FE07FFF7FE07F
      FF7F00000000000000000000000000000000000000001F000000000000000000
      00000000000000001F0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FE07FFF7FE07F
      000000000000000000000000000000000000000000000000E07FFF7FE07FFF7F
      000000000000000000000000000000000000000000001F001F001F001F001F00
      1F001F001F001F001F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010420000000000000000
      1042000000000000000000000000000000000000000010420000000000000000
      104200000000000000000000000000000000000000001F0018631F001F001F00
      1F0018631F0018631F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001F001F001F001F001F00
      1F001F001F001F001F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFF0000FFFFFFFFFFFF0000
      FFFFFFFFFCF30000C00FC03FFC630000800F801FFC030000800F800FC0030000
      800F8007E4030000800F8007FC030000800F800FC0070000800F800FDE670000
      801F801FDFEF0000C0FFC0FFC00F0000C0FFC0FFC00F0000FFFFFFFFC00F0000
      FFFFFFFFFFFF0000FFFFFFFFFFFF000000000000000000000000000000000000
      000000000000}
  end
  object PopupMenu1: TPopupMenu
    AutoHotkeys = maManual
    OnPopup = PopupMenu1Popup
    Left = 120
    Top = 296
    object N11: TMenuItem
      Caption = #28155#21152#31449#28857
      OnClick = N11Click
    end
    object N3: TMenuItem
      Caption = #25554#20837#31449#28857
      OnClick = N3Click
    end
    object N15: TMenuItem
      Caption = #28155#23376#31449#28857
      OnClick = N15Click
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object N12: TMenuItem
      Caption = #28155#21152#24037#24207
      OnClick = N12Click
    end
    object N4: TMenuItem
      Caption = #25554#20837#24037#24207
      OnClick = N4Click
    end
    object N7: TMenuItem
      Caption = #28155#23376#24037#24207
      OnClick = N7Click
    end
    object N13: TMenuItem
      Caption = '-'
    end
    object N8: TMenuItem
      Caption = #25913#21517
      OnClick = N8Click
    end
    object N14: TMenuItem
      Caption = #21024#38500
      OnClick = N14Click
    end
  end
  object ADOQuery1: TADOQuery
    Connection = frmMain_097.ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'SELECT * from data0278')
    Left = 280
    Top = 312
  end
  object adsUpdate_Sub: TADODataSet
    Connection = frmMain_097.ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from data0506 where Ttype=1 and source_ptr=:F01'
    Parameters = <
      item
        Name = 'F01'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 208
    Top = 368
  end
  object dsParameters: TDataSource
    DataSet = adsParameters
    Left = 248
    Top = 416
  end
  object adsParameters: TADODataSet
    Connection = frmMain_097.ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select u.Unit_Code,M.PARAMETER_PTR,D.PARAMETER_NAME,D.PARAMETER_' +
      'DESC,CASE DATA_TYPE WHEN 1 THEN '#39#25968#23383#22411#39' when 2 then '#39#23383#31526#22411#39' end as D' +
      'ataType from data0506 m inner join data0278 d on m.parameter_ptr' +
      '=d.rkey '#13#10'left join Data0002 U on U.rkey=d.unit_ptr'#13#10'where m.tty' +
      'pe=1 and m.source_ptr =:F01'#13#10
    Parameters = <
      item
        Name = 'F01'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 208
    Top = 416
  end
end
