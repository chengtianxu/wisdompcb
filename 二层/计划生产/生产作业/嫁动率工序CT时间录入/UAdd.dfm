object FrmAdd: TFrmAdd
  Left = 317
  Top = 120
  Width = 1145
  Height = 651
  Caption = #26126#32454#24405#20837
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 1129
    Height = 613
    Align = alClient
    TabOrder = 0
    object pnl2: TPanel
      Left = 1
      Top = 1
      Width = 1127
      Height = 32
      Align = alTop
      TabOrder = 0
      object lbl7: TLabel
        Left = 60
        Top = 8
        Width = 39
        Height = 13
        Caption = #24037#33402#65306
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lbl1: TLabel
        Left = 320
        Top = 8
        Width = 476
        Height = 16
        Caption = #26032#21152#19968#34892#26102#25353#21521#19979#26041#21521#38190#65292#28155#21152#26102#35831#27880#24847#36873#25321#23233#21160#29575#31867#22411#21450#24037#33402
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cbb_craft: TComboBox
        Left = 106
        Top = 3
        Width = 113
        Height = 21
        ItemHeight = 13
        TabOrder = 0
      end
    end
    object pnl3: TPanel
      Left = 1
      Top = 33
      Width = 1127
      Height = 538
      Align = alClient
      TabOrder = 1
      object Label1: TLabel
        Left = 808
        Top = 208
        Width = 42
        Height = 13
        Caption = 'Label1'
      end
      object dbgrdh1: TDBGridEh
        Left = 1
        Top = 1
        Width = 1125
        Height = 536
        Align = alClient
        DataSource = ds_add
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -13
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnColExit = dbgrdh1ColExit
        OnEditButtonClick = dbgrdh1EditButtonClick
        OnKeyDown = dbgrdh1KeyDown
        Columns = <
          item
            EditButtons = <>
            FieldName = 'rkey'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'CID'
            Footers = <>
            Visible = False
          end
          item
            ButtonStyle = cbsDropDown
            EditButtons = <>
            FieldName = 'ProdNo'
            Footers = <>
            Title.Caption = #26412#21378#32534#21495'ID'
            Visible = False
            Width = 76
          end
          item
            AlwaysShowEditButton = True
            AutoDropDown = True
            ButtonStyle = cbsDropDown
            EditButtons = <>
            FieldName = 'manu_part_number'
            Footers = <>
            Title.Caption = #26412#21378#32534#21495
            Width = 131
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'layer'
            Footers = <>
            ReadOnly = True
            Title.Caption = #23618#25968
          end
          item
            AlwaysShowEditButton = True
            AutoDropDown = True
            ButtonStyle = cbsDropDown
            EditButtons = <>
            FieldName = 'Machine'
            Footers = <>
            Title.Caption = #26426#21488' '
            Width = 65
          end
          item
            EditButtons = <>
            FieldName = 'PID'
            Footers = <>
            Visible = False
          end
          item
            AlwaysShowEditButton = True
            AutoDropDown = True
            ButtonStyle = cbsDropDown
            EditButtons = <>
            FieldName = 'dept_code'
            Footers = <>
            Title.Caption = #24037#24207#32534#21495
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'dept_name'
            Footers = <>
            ReadOnly = True
            Title.Caption = #24037#24207#21517#31216
            Width = 115
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'StackNum'
            Footers = <>
            Title.Caption = #21472#26495#25968
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'TCTTIme1'
            Footers = <>
            Title.Caption = #29702#35770'CT'#26102#38388
          end
          item
            EditButtons = <>
            FieldName = 'CTTime1'
            Footers = <>
            Title.Caption = #23454#38469'CT'#26102#38388'('#25110#38253#23556'S'#38754'CT'#26102#38388')'
            Width = 159
          end
          item
            EditButtons = <>
            FieldName = 'CTTime2'
            Footers = <>
            Title.Caption = #38253#23556'C'#38754'CT'#26102#38388
            Width = 85
          end
          item
            EditButtons = <>
            FieldName = 'AMan'
            Footers = <>
            ReadOnly = True
            Visible = False
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'user_full_name'
            Footers = <>
            ReadOnly = True
            Title.Caption = #32500#25252#20154
            Width = 49
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'Adate'
            Footers = <>
            ReadOnly = True
            Title.Caption = #32500#25252#26085#26399
            Width = 137
          end>
      end
    end
    object pnl4: TPanel
      Left = 1
      Top = 571
      Width = 1127
      Height = 41
      Align = alBottom
      TabOrder = 2
      object btn_save: TButton
        Left = 832
        Top = 9
        Width = 75
        Height = 25
        Caption = #20445#23384
        TabOrder = 0
        OnClick = btn_saveClick
      end
      object btn_cancel: TButton
        Left = 698
        Top = 13
        Width = 75
        Height = 25
        Caption = #21462#28040
        TabOrder = 1
        OnClick = btn_cancelClick
      end
    end
  end
  object pm1: TPopupMenu
    Left = 412
    Top = 160
    object N1: TMenuItem
      Caption = #26032#22686
    end
    object N3: TMenuItem
      Caption = #20462#25913
    end
    object mniReCheck: TMenuItem
      Caption = #26816#26597
    end
    object N2: TMenuItem
      Caption = #21024#38500
    end
  end
  object ds_add: TDataSource
    DataSet = qry_add
    Left = 321
    Top = 169
  end
  object qry_add: TADOQuery
    Connection = DM.con1
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      
        ' select  d581.* , d34.dept_code, d34.dept_name,d25. manu_part_nu' +
        'mber , d73.user_full_name'
      '  from data0581 d581 '
      '  inner join data0034  d34 on d581.pid=d34.rkey'
      '  inner join data0025   d25 on d581.prodno=d25.rkey'
      ' inner join data0073  d73  on d581.aman=d73.rkey'
      'where   1=2')
    Left = 241
    Top = 177
    object atncfld_mainrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object intgrfld_mainCID: TIntegerField
      FieldName = 'CID'
    end
    object intgrfld_mainProdNo: TIntegerField
      FieldName = 'ProdNo'
    end
    object strngfld_addmanu_part_number: TStringField
      FieldName = 'manu_part_number'
    end
    object strngfld_mainlayer: TStringField
      FieldName = 'layer'
      Size = 10
    end
    object strngfld_mainMachine: TStringField
      FieldName = 'Machine'
    end
    object intgrfld_mainPID: TIntegerField
      FieldName = 'PID'
    end
    object intgrfld_mainStackNum: TIntegerField
      FieldName = 'StackNum'
    end
    object strngfld_maindept_code: TStringField
      FieldName = 'dept_code'
      Size = 10
    end
    object strngfld_maindept_name: TStringField
      FieldName = 'dept_name'
      Size = 30
    end
    object intgrfld_addAMan: TIntegerField
      FieldName = 'AMan'
    end
    object dtmfld_addAdate: TDateTimeField
      FieldName = 'Adate'
    end
    object strngfld_adduser_full_name: TStringField
      FieldName = 'user_full_name'
      Size = 30
    end
    object intgrfld_addTCTTIme1: TIntegerField
      FieldName = 'TCTTIme1'
    end
    object fltfld_addCTTime1: TFloatField
      FieldName = 'CTTime1'
    end
    object fltfld_addCTTime2: TFloatField
      FieldName = 'CTTime2'
    end
  end
  object qry_value: TADOQuery
    Connection = DM.con1
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'rkey2'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'pName'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end>
    SQL.Strings = (
      'SELECT     data0494.parameter_value'
      'FROM         dbo.Data0025 INNER JOIN'
      
        '                      dbo.Data0038 ON dbo.Data0025.RKEY = dbo.Da' +
        'ta0038.SOURCE_PTR INNER JOIN'
      
        '                      dbo.Data0034 ON dbo.Data0038.DEPT_PTR = db' +
        'o.Data0034.RKEY INNER JOIN'
      
        '                      dbo.Data0494 ON dbo.Data0038.SOURCE_PTR = ' +
        'dbo.Data0494.custpart_ptr AND dbo.Data0038.STEP_NUMBER = dbo.Dat' +
        'a0494.step_number INNER JOIN'
      
        '                      dbo.Data0278 ON dbo.Data0494.PARAMETER_PTR' +
        ' = dbo.Data0278.RKEY'
      'where  data0025.rkey=:rkey'
      'and  data0034.rkey=:rkey2'
      'and data0278.parameter_desc=:pName')
    Left = 321
    Top = 290
  end
  object pm_TTime: TPopupMenu
    Left = 553
    Top = 209
    object N4: TMenuItem
      Caption = #20462#25913#29702#35770#26102#38388
    end
  end
  object qry_save: TADOQuery
    Connection = DM.con1
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select * from data0581 '
      'where 1=2')
    Left = 249
    Top = 385
    object atncfld_saverkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object intgrfld_saveCID: TIntegerField
      FieldName = 'CID'
    end
    object intgrfld_saveProdNo: TIntegerField
      FieldName = 'ProdNo'
    end
    object strngfld_savelayer: TStringField
      FieldName = 'layer'
      Size = 10
    end
    object strngfld_saveMachine: TStringField
      FieldName = 'Machine'
    end
    object intgrfld_savePID: TIntegerField
      FieldName = 'PID'
    end
    object intgrfld_saveStackNum: TIntegerField
      FieldName = 'StackNum'
    end
    object intgrfld_saveAMan: TIntegerField
      FieldName = 'AMan'
    end
    object dtmfld_saveAdate: TDateTimeField
      FieldName = 'Adate'
    end
    object intgrfld_saveTCTTIme1: TIntegerField
      FieldName = 'TCTTIme1'
    end
    object fltfld_saveCTTime1: TFloatField
      FieldName = 'CTTime1'
    end
    object fltfld_saveCTTime2: TFloatField
      FieldName = 'CTTime2'
    end
  end
end
