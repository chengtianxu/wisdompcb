inherited frmMain_Mod38SendInfoForSafeQty: TfrmMain_Mod38SendInfoForSafeQty
  Caption = #23433#20840#24211#23384#30701#20449#36890#30693#23450#20041
  ClientHeight = 410
  ClientWidth = 527
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  ExplicitWidth = 543
  ExplicitHeight = 448
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 527
    Height = 410
    Align = alClient
    TabOrder = 0
    object eh21: TDBGridEh
      Left = 1
      Top = 1
      Width = 525
      Height = 408
      Hint = #21521#19979#38190#22686#21152#65292'Ctrl+Del'#21024#38500#19968#34892
      Align = alClient
      DataSource = ds21
      DynProps = <>
      PopupMenu = pmDel
      TabOrder = 0
      Columns = <
        item
          DynProps = <>
          EditButton.DefaultAction = False
          EditButtons = <
            item
              OnClick = eh21Columns0EditButtons0Click
            end>
          FieldName = #26448#26009#32452#21035#20195#30721
          Footers = <>
          Width = 112
        end
        item
          DynProps = <>
          EditButton.DefaultAction = False
          EditButtons = <
            item
              OnClick = eh21Columns1EditButtons0Click
            end>
          FieldName = #29992#25143#20195#30721
          Footers = <>
          Width = 108
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = #29992#25143#21517#31216
          Footers = <>
          ReadOnly = True
          Width = 156
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object ds21: TDataSource
    DataSet = cds21
    Left = 272
    Top = 104
  end
  object cds21: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select data0021.GROUP_NAME as '#26448#26009#32452#21035#20195#30721', data0021.USER_LOGIN_NAME a' +
      's '#29992#25143#20195#30721' ,data0073.USER_FULL_NAME as '#29992#25143#21517#31216',data0019.inv_group_desc ' +
      ' '#13#10'from data0021 '#13#10'inner join data0073 on data0021.USER_LOGIN_NA' +
      'ME=data0073.USER_LOGIN_NAME'#13#10'inner join data0019 on data0021.GRO' +
      'UP_NAME=data0019.inv_group_name'#13#10'order by data0021.GROUP_NAME'
    Params = <>
    Left = 208
    Top = 96
  end
  object qry1: TADOQuery
    ConnectionString = 
      'FILE NAME=C:\Program Files\Common Files\System\Ole DB\Data Links' +
      '\8.112.udl'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select data0021.GROUP_NAME as '#26448#26009#32452#21035#20195#30721', data0021.USER_LOGIN_NAME a' +
        's '#29992#25143#20195#30721' ,data0073.USER_FULL_NAME as '#29992#25143#21517#31216',data0019.inv_group_desc ' +
        ' '
      'from data0021 '
      
        'inner join data0073 on data0021.USER_LOGIN_NAME=data0073.USER_LO' +
        'GIN_NAME'
      
        'inner join data0019 on data0021.GROUP_NAME=data0019.inv_group_na' +
        'me'
      'order by data0021.GROUP_NAME')
    Left = 56
    Top = 80
    object strngfldqry1材料组别代码: TStringField
      FieldName = #26448#26009#32452#21035#20195#30721
    end
    object strngfldqry1用户代码: TStringField
      FieldName = #29992#25143#20195#30721
      Size = 15
    end
    object strngfldqry1用户名称: TStringField
      FieldName = #29992#25143#21517#31216
      Size = 30
    end
    object qry1inv_group_desc: TStringField
      FieldName = 'inv_group_desc'
      Size = 40
    end
  end
  object pmDel: TPopupMenu
    Left = 200
    Top = 240
    object mniDel: TMenuItem
      Caption = #21024#38500
      OnClick = mniDelClick
    end
    object mniN1: TMenuItem
      Caption = #21521#19979#38190#22686#21152
      Enabled = False
    end
  end
  object cdsSave21: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select data0021.GROUP_NAME as '#26448#26009#32452#21035#20195#30721', data0021.USER_LOGIN_NAME a' +
      's '#29992#25143#20195#30721' ,data0073.USER_FULL_NAME as '#29992#25143#21517#31216',data0019.inv_group_desc ' +
      ' '#13#10'from data0021 '#13#10'inner join data0073 on data0021.USER_LOGIN_NA' +
      'ME=data0073.USER_LOGIN_NAME'#13#10'inner join data0019 on data0021.GRO' +
      'UP_NAME=data0019.inv_group_name'#13#10'order by data0021.GROUP_NAME'
    Params = <>
    Left = 352
    Top = 200
  end
end
