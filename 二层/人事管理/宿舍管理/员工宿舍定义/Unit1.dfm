object Form1: TForm1
  Left = 276
  Top = 134
  Width = 1021
  Height = 610
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 217
    Height = 564
    Align = alLeft
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 224
      Width = 140
      Height = 13
      Caption = 'electricity_standard'
    end
    object TreeView1: TTreeView
      Left = 0
      Top = 0
      Width = 217
      Height = 564
      Align = alClient
      Images = il1
      Indent = 35
      TabOrder = 0
      OnClick = TreeView1Click
    end
  end
  object Panel2: TPanel
    Left = 217
    Top = 0
    Width = 796
    Height = 564
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel2'
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 796
      Height = 564
      ActivePage = TabSheet2
      Align = alClient
      TabOrder = 0
      object sheet_Floor: TTabSheet
        Caption = #23487#33293#27004
        object dgh_Dormitorymsg: TDBGridEh
          Left = 0
          Top = 0
          Width = 788
          Height = 536
          Align = alClient
          DataSource = ds_Dormitorymsg
          EditActions = [geaCopyEh]
          FooterColor = clWindow
          FooterFont.Charset = GB2312_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -13
          FooterFont.Name = #23435#20307
          FooterFont.Style = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          PopupMenu = PopupMenu_Dormitorymsg
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          OnDblClick = dgh_DormitorymsgDblClick
          OnDrawColumnCell = dgh_DormitorymsgDrawColumnCell
          OnGetCellParams = dgh_DormitorymsgGetCellParams
          OnKeyDown = dgh_DormitorymsgKeyDown
          OnKeyPress = dgh_DormitorymsgKeyPress
          Columns = <
            item
              EditButtons = <>
              FieldName = 'effective'
              Footers = <>
              Width = 38
            end
            item
              EditButtons = <>
              FieldName = 'rkey'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'D_code'
              Footers = <>
              Width = 119
            end
            item
              EditButtons = <>
              FieldName = 'D_name'
              Footers = <>
              Width = 114
            end
            item
              EditButtons = <>
              FieldName = 'D_floor'
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'remark'
              Footers = <>
              Width = 371
            end
            item
              EditButtons = <>
              FieldName = 'water_price'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'electricity_price'
              Footers = <>
              Visible = False
            end>
        end
      end
      object TabSheet2: TTabSheet
        Caption = #25151#38388
        ImageIndex = 1
        object Splitter1: TSplitter
          Left = 0
          Top = 313
          Width = 788
          Height = 8
          Cursor = crVSplit
          Align = alTop
        end
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 788
          Height = 313
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Panel3'
          TabOrder = 0
          object dgh_Bedroommsg: TDBGridEh
            Left = 0
            Top = 0
            Width = 788
            Height = 313
            Align = alClient
            DataSource = ds_Bedroommsg
            EditActions = [geaCopyEh]
            FooterColor = clWindow
            FooterFont.Charset = GB2312_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -13
            FooterFont.Name = #23435#20307
            FooterFont.Style = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
            PopupMenu = PopupMenu_Bedroommsg
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            OnDblClick = dgh_BedroommsgDblClick
            OnDrawColumnCell = dgh_BedroommsgDrawColumnCell
            OnGetCellParams = dgh_BedroommsgGetCellParams
            OnKeyDown = dgh_BedroommsgKeyDown
            OnKeyPress = dgh_BedroommsgKeyPress
            Columns = <
              item
                EditButtons = <>
                FieldName = 'effective'
                Footers = <>
                PickList.Strings = (
                  #26377#25928
                  #26080#25928)
                Width = 40
              end
              item
                EditButtons = <>
                FieldName = 'D_name'
                Footers = <>
                Width = 72
              end
              item
                EditButtons = <>
                FieldName = 'rkey'
                Footers = <>
                Visible = False
              end
              item
                EditButtons = <>
                FieldName = 'dormitoryid'
                Footers = <>
                Visible = False
              end
              item
                EditButtons = <>
                FieldName = 'R_code'
                Footers = <>
                Width = 83
              end
              item
                EditButtons = <>
                FieldName = 'R_name'
                Footers = <>
                Width = 80
              end
              item
                EditButtons = <>
                FieldName = 'bedcount'
                Footers = <>
                Width = 49
              end
              item
                EditButtons = <>
                FieldName = 'floor'
                Footers = <>
                Width = 58
              end
              item
                EditButtons = <>
                FieldName = 'type'
                Footers = <>
                PickList.Strings = (
                  #30007'  '
                  #22899
                  #23478#24237)
                Width = 55
              end
              item
                EditButtons = <>
                FieldName = 'grade'
                Footers = <>
                PickList.Strings = (
                  #32844#24037
                  #24178#37096)
                Width = 60
              end
              item
                EditButtons = <>
                FieldName = 'monitor'
                Footers = <>
                Visible = False
                Width = 47
              end
              item
                EditButtons = <>
                FieldName = 'employeecode'
                Footers = <>
                Width = 61
              end
              item
                EditButtons = <>
                FieldName = 'chinesename'
                Footers = <>
                Width = 61
              end
              item
                EditButtons = <>
                FieldName = 'equipment_remark'
                Footers = <>
                Width = 261
              end
              item
                EditButtons = <>
                FieldName = 'remark'
                Footers = <>
                Width = 278
              end
              item
                EditButtons = <>
                FieldName = 'basic_rent'
                Footers = <>
                Visible = False
              end
              item
                EditButtons = <>
                FieldName = 'electricity_standard'
                Footers = <>
                Visible = False
              end
              item
                EditButtons = <>
                FieldName = 'water_standard'
                Footers = <>
                Visible = False
              end>
          end
        end
        object Panel4: TPanel
          Left = 0
          Top = 321
          Width = 788
          Height = 215
          Align = alClient
          BevelOuter = bvNone
          Caption = 'Panel4'
          TabOrder = 1
          object dgh_Bedmsg: TDBGridEh
            Left = 0
            Top = 0
            Width = 788
            Height = 215
            Align = alClient
            DataSource = ds_Bedmsg
            EditActions = [geaCopyEh]
            FooterColor = clWindow
            FooterFont.Charset = GB2312_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -13
            FooterFont.Name = #23435#20307
            FooterFont.Style = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
            PopupMenu = PopupMenu_Bedmsg
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            OnDblClick = dgh_BedmsgDblClick
            OnDrawColumnCell = dgh_BedmsgDrawColumnCell
            OnGetCellParams = dgh_BedmsgGetCellParams
            OnKeyDown = dgh_BedmsgKeyDown
            OnKeyPress = dgh_BedmsgKeyPress
            Columns = <
              item
                EditButtons = <>
                FieldName = 'effective'
                Footers = <>
                PickList.Strings = (
                  #26377#25928
                  #26080#25928)
                Width = 40
              end
              item
                EditButtons = <>
                FieldName = 'R_code'
                Footers = <>
                Width = 77
              end
              item
                EditButtons = <>
                FieldName = 'R_name'
                Footers = <>
                Width = 82
              end
              item
                EditButtons = <>
                FieldName = 'B_code'
                Footers = <>
                Width = 89
              end
              item
                EditButtons = <>
                FieldName = 'remark'
                Footers = <>
                Width = 257
              end
              item
                EditButtons = <>
                FieldName = 'employeecode'
                Footers = <>
                Width = 89
              end
              item
                EditButtons = <>
                FieldName = 'chinesename'
                Footers = <>
                Width = 81
              end
              item
                EditButtons = <>
                FieldName = 'factoryarea'
                Footers = <>
                Width = 74
              end
              item
                EditButtons = <>
                FieldName = 'departmentname'
                Footers = <>
                Width = 105
              end
              item
                EditButtons = <>
                FieldName = 'position'
                Footers = <>
                Width = 62
              end
              item
                EditButtons = <>
                FieldName = 'ondutytime'
                Footers = <>
                Width = 79
              end
              item
                EditButtons = <>
                FieldName = 'Province'
                Footers = <>
                Width = 107
              end
              item
                EditButtons = <>
                FieldName = 'birthday'
                Footers = <>
                Width = 81
              end
              item
                EditButtons = <>
                FieldName = 'phone'
                Footers = <>
                Width = 84
              end
              item
                EditButtons = <>
                FieldName = 'rkey'
                Footers = <>
                Visible = False
              end
              item
                EditButtons = <>
                FieldName = 'bedroomid'
                Footers = <>
                Visible = False
              end
              item
                EditButtons = <>
                FieldName = 'employeeid'
                Footers = <>
                Visible = False
              end>
          end
        end
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 564
    Width = 1013
    Height = 19
    Panels = <>
  end
  object dsp_Dormitorymsg: TDataSetProvider
    DataSet = AQ_Dormitorymsg
    Options = [poPropogateChanges, poAllowCommandText]
    AfterUpdateRecord = dsp_DormitorymsgAfterUpdateRecord
    OnGetTableName = dsp_DormitorymsgGetTableName
    Left = 317
    Top = 109
  end
  object dsp_Bedroommsg: TDataSetProvider
    DataSet = AQ_Bedroommsg
    Options = [poPropogateChanges, poAllowCommandText]
    AfterUpdateRecord = dsp_BedroommsgAfterUpdateRecord
    Left = 317
    Top = 157
  end
  object dsp_Bedroommsg_count: TDataSetProvider
    DataSet = AQ_Bedroommsg_count
    Options = [poPropogateChanges, poAllowCommandText]
    Left = 317
    Top = 205
  end
  object dsp_Bedmsg: TDataSetProvider
    DataSet = AQ_Bedmsg
    Options = [poPropogateChanges, poAllowCommandText]
    AfterUpdateRecord = dsp_BedmsgAfterUpdateRecord
    Left = 317
    Top = 253
  end
  object cds_Dormitorymsg: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select *,'#13#10' '#39'('#39'+ cast(( select count(*) from dbo.Bedmsg'#13#10' join d' +
      'bo.Bedroommsg b on b.rkey=Bedmsg.bedroomid where b.dormitoryid=D' +
      'ormitorymsg.rkey and employeeid is not null'#13#10' )as varchar(10))+'#39 +
      '/'#39'+'#13#10'cast(( select count(*) from dbo.Bedmsg'#13#10' join dbo.Bedroomms' +
      'g b on b.rkey=Bedmsg.bedroomid where b.dormitoryid=Dormitorymsg.' +
      'rkey '#13#10' )as varchar(10))+'#39')'#39' as tc'#13#10' from Dormitorymsg'
    Params = <>
    ProviderName = 'dsp_Dormitorymsg'
    AfterInsert = cds_DormitorymsgAfterInsert
    BeforeCancel = cds_DormitorymsgBeforeCancel
    AfterCancel = cds_DormitorymsgAfterCancel
    AfterScroll = cds_DormitorymsgAfterScroll
    OnReconcileError = cds_DormitorymsgReconcileError
    Left = 384
    Top = 109
    object cds_Dormitorymsgrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
    object cds_Dormitorymsgeffective: TBooleanField
      DisplayLabel = #26377#25928
      FieldName = 'effective'
    end
    object cds_DormitorymsgD_code: TStringField
      DisplayLabel = #23487#33293#27004#32534#21495
      FieldName = 'D_code'
      Size = 50
    end
    object cds_DormitorymsgD_name: TWideStringField
      DisplayLabel = #23487#33293#27004#21517#31216
      FieldName = 'D_name'
      Size = 50
    end
    object cds_DormitorymsgD_floor: TIntegerField
      DisplayLabel = #27004#23618#24635#25968
      FieldName = 'D_floor'
    end
    object cds_Dormitorymsgremark: TWideStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cds_Dormitorymsgwater_price: TFloatField
      FieldName = 'water_price'
      Visible = False
    end
    object cds_Dormitorymsgelectricity_price: TFloatField
      FieldName = 'electricity_price'
      Visible = False
    end
    object cds_Dormitorymsgtc: TStringField
      FieldName = 'tc'
      ProviderFlags = []
      ReadOnly = True
      Size = 23
    end
  end
  object cds_Bedroommsg: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select employeemsg_extra.employeecode,employeemsg_extra.chinesen' +
      'ame,Dormitorymsg.D_name,'#13#10'  Bedroommsg.* from dbo.Bedroommsg'#13#10'  ' +
      'join Dormitorymsg on Bedroommsg.dormitoryid=Dormitorymsg.rkey'#13#10' ' +
      ' left join employeemsg_extra on employeemsg_extra.rkey=monitor'#13#10 +
      #13#10'  order by R_name'
    FieldDefs = <
      item
        Name = 'employeecode'
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'chinesename'
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'D_name'
        DataType = ftWideString
        Size = 50
      end
      item
        Name = 'rkey'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'dormitoryid'
        DataType = ftInteger
      end
      item
        Name = 'R_code'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'bedcount'
        DataType = ftInteger
      end
      item
        Name = 'floor'
        DataType = ftInteger
      end
      item
        Name = 'type'
        DataType = ftInteger
      end
      item
        Name = 'grade'
        DataType = ftWideString
        Size = 10
      end
      item
        Name = 'monitor'
        DataType = ftInteger
      end
      item
        Name = 'remark'
        DataType = ftWideString
        Size = 50
      end
      item
        Name = 'effective'
        DataType = ftInteger
      end
      item
        Name = 'R_name'
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'basic_rent'
        DataType = ftBCD
        Precision = 19
        Size = 4
      end
      item
        Name = 'electricity_standard'
        DataType = ftFloat
      end
      item
        Name = 'water_standard'
        DataType = ftFloat
      end
      item
        Name = 'equipment_remark'
        DataType = ftWideString
        Size = 50
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    Params = <>
    ProviderName = 'dsp_Bedroommsg'
    StoreDefs = True
    AfterOpen = cds_BedroommsgAfterOpen
    AfterInsert = cds_BedroommsgAfterInsert
    AfterScroll = cds_BedroommsgAfterScroll
    OnReconcileError = cds_BedroommsgReconcileError
    AfterApplyUpdates = cds_BedroommsgAfterApplyUpdates
    Left = 384
    Top = 157
    object cds_Bedroommsgeffective: TIntegerField
      DisplayLabel = #26377#25928
      FieldName = 'effective'
      OnGetText = cds_BedroommsgeffectiveGetText
      OnSetText = cds_BedroommsgeffectiveSetText
    end
    object cds_BedroommsgD_name: TWideStringField
      DisplayLabel = #23487#33293#27004
      FieldName = 'D_name'
      ProviderFlags = []
      Size = 50
    end
    object cds_Bedroommsgrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object cds_Bedroommsgdormitoryid: TIntegerField
      FieldName = 'dormitoryid'
    end
    object cds_BedroommsgR_code: TStringField
      DisplayLabel = #25151#38388#32534#21495
      FieldName = 'R_code'
      Size = 50
    end
    object cds_BedroommsgR_name: TWideStringField
      DisplayLabel = #25151#38388#21517
      FieldName = 'R_name'
      ProviderFlags = [pfInUpdate]
    end
    object cds_Bedroommsgbedcount: TIntegerField
      DisplayLabel = #24202#20301#25968
      FieldName = 'bedcount'
    end
    object cds_Bedroommsgfloor: TIntegerField
      DisplayLabel = #25152#22312#27004#23618
      FieldName = 'floor'
    end
    object cds_Bedroommsgtype: TIntegerField
      DisplayLabel = #23487#33293#31867#22411
      FieldName = 'type'
      OnGetText = cds_BedroommsgtypeGetText
      OnSetText = cds_BedroommsgtypeSetText
    end
    object cds_Bedroommsggrade: TWideStringField
      DisplayLabel = #23487#33293#32423#21035
      FieldName = 'grade'
      OnGetText = cds_BedroommsggradeGetText
      OnSetText = cds_BedroommsggradeSetText
      Size = 10
    end
    object cds_Bedroommsgmonitor: TIntegerField
      DisplayLabel = #23487#33293#38271
      FieldName = 'monitor'
    end
    object cds_Bedroommsgemployeecode: TWideStringField
      DisplayLabel = #38599#21592#20195#30721
      FieldName = 'employeecode'
      ProviderFlags = []
      OnChange = cds_BedroommsgemployeecodeChange
    end
    object cds_Bedroommsgchinesename: TWideStringField
      DisplayLabel = #23487#33293#38271
      FieldName = 'chinesename'
      ProviderFlags = []
    end
    object cds_Bedroommsgremark: TWideStringField
      DisplayLabel = #20854#20182#22791#27880
      FieldName = 'remark'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cds_Bedroommsgbasic_rent: TBCDField
      FieldName = 'basic_rent'
      ProviderFlags = [pfInUpdate]
      Precision = 19
    end
    object cds_Bedroommsgelectricity_standard: TFloatField
      FieldName = 'electricity_standard'
      ProviderFlags = [pfInUpdate]
    end
    object cds_Bedroommsgwater_standard: TFloatField
      FieldName = 'water_standard'
      ProviderFlags = [pfInUpdate]
    end
    object cds_Bedroommsgequipment_remark: TWideStringField
      DisplayLabel = #35774#22791#22791#27880
      FieldName = 'equipment_remark'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
  end
  object cds_Bedroommsg_count: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select distinct dormitoryid, [floor],'#13#10' '#39'('#39'+cast((select count(*' +
      ') from dbo.Bedmsg where bedroomid in '#13#10'  (select rkey from Bedro' +
      'ommsg where [floor]=b.[floor] and dormitoryid=b.dormitoryid)and ' +
      'employeeid is not null)as varchar(10))+'#39'/'#39'+'#13#10' cast((select count' +
      '(*) from dbo.Bedmsg where bedroomid in '#13#10'  (select rkey from Bed' +
      'roommsg where [floor]=b.[floor] and dormitoryid=b.dormitoryid))a' +
      's varchar(10))+'#39')'#39' as tc '#13#10'from Bedroommsg b'#13#10'order by dormitory' +
      'id,[floor]'
    Params = <>
    ProviderName = 'dsp_Bedroommsg_count'
    Left = 384
    Top = 197
    object cds_Bedroommsg_countdormitoryid: TIntegerField
      FieldName = 'dormitoryid'
    end
    object cds_Bedroommsg_countfloor: TIntegerField
      FieldName = 'floor'
    end
    object cds_Bedroommsg_counttc: TStringField
      FieldName = 'tc'
      ReadOnly = True
      Size = 23
    end
  end
  object cds_Bedmsg: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select '#13#10'employeemsg_extra.chinesename /*'#22995#21517'*/,'#13#10'employeemsg_extr' +
      'a.employeecode ,'#13#10'employeemsg_extra.factoryarea'#9' /*'#24037#21378#21306#22495'*/,'#13#10'empl' +
      'oyeemsg_extra.departmentname /*'#37096#38376'*/,'#13#10'employeemsg_extra.position' +
      ' /*'#32844#20301'*/,'#13#10'employeemsg_extra.ondutytime /*'#20837#32844#26085#26399'*/,'#13#10'employeemsg_ex' +
      'tra.Province,  --'#31821#36143#13#10'employeemsg_extra.birthday,--'#9#29983#26085#13#10'employeem' +
      'sg_extra.phone,--'#32852#31995#30005#35805#13#10'Bedroommsg.R_code,Bedroommsg.R_name,'#13#10'Bed' +
      'msg.*'#13#10'from Bedmsg'#13#10'left join employeemsg_extra on Bedmsg.employ' +
      'eeid=employeemsg_extra.rkey'#13#10'join dbo.Bedroommsg on Bedmsg.bedro' +
      'omid=Bedroommsg.rkey'#13#10'where bedroomid=:vBedroomid'#13#10'order by b_co' +
      'de'
    Params = <
      item
        DataType = ftString
        Name = 'vBedroomid'
        ParamType = ptUnknown
        Value = '0'
      end>
    ProviderName = 'dsp_Bedmsg'
    AfterInsert = cds_BedmsgAfterInsert
    AfterScroll = cds_BedmsgAfterScroll
    OnReconcileError = cds_BedmsgReconcileError
    Left = 384
    Top = 253
    object cds_Bedmsgemployeecode: TWideStringField
      DisplayLabel = #38599#21592#20195#30721
      FieldName = 'employeecode'
      ProviderFlags = []
      OnChange = cds_BedmsgemployeecodeChange
    end
    object cds_Bedmsgchinesename: TWideStringField
      DisplayLabel = #22995#21517
      FieldName = 'chinesename'
      ProviderFlags = []
    end
    object cds_Bedmsgfactoryarea: TWideStringField
      DisplayLabel = #24037#21378#21306#22495
      FieldName = 'factoryarea'
      ProviderFlags = []
    end
    object cds_Bedmsgdepartmentname: TWideStringField
      DisplayLabel = #37096#38376
      FieldName = 'departmentname'
      ProviderFlags = []
    end
    object cds_Bedmsgposition: TWideStringField
      DisplayLabel = #32844#20301
      FieldName = 'position'
      ProviderFlags = []
    end
    object cds_Bedmsgondutytime: TWideStringField
      DisplayLabel = #20837#32844#26085#26399
      FieldName = 'ondutytime'
      ProviderFlags = []
    end
    object cds_BedmsgR_code: TStringField
      DisplayLabel = #25151#38388#32534#21495
      FieldName = 'R_code'
      ProviderFlags = []
      Size = 50
    end
    object cds_BedmsgR_name: TWideStringField
      DisplayLabel = #25151#38388#21517
      FieldName = 'R_name'
      ProviderFlags = []
    end
    object cds_Bedmsgrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object cds_Bedmsgbedroomid: TIntegerField
      FieldName = 'bedroomid'
    end
    object cds_Bedmsgeffective: TIntegerField
      DisplayLabel = #26377#25928
      FieldName = 'effective'
      OnGetText = cds_BedmsgeffectiveGetText
      OnSetText = cds_BedmsgeffectiveSetText
    end
    object cds_BedmsgB_code: TStringField
      DisplayLabel = #24202#32534#21495
      FieldName = 'B_code'
      Size = 50
    end
    object cds_Bedmsgemployeeid: TIntegerField
      FieldName = 'employeeid'
    end
    object cds_Bedmsgremark: TWideStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cds_BedmsgProvince: TWideStringField
      DisplayLabel = #31821#36143
      FieldName = 'Province'
      ProviderFlags = []
    end
    object cds_Bedmsgbirthday: TWideStringField
      DisplayLabel = #29983#26085
      FieldName = 'birthday'
      ProviderFlags = []
    end
    object cds_Bedmsgphone: TWideStringField
      DisplayLabel = #32852#31995#30005#35805
      FieldName = 'phone'
      ProviderFlags = []
      Size = 50
    end
  end
  object ds_Dormitorymsg: TDataSource
    DataSet = cds_Dormitorymsg
    OnStateChange = ds_DormitorymsgStateChange
    Left = 453
    Top = 109
  end
  object ds_Bedroommsg: TDataSource
    DataSet = cds_Bedroommsg
    OnStateChange = ds_BedroommsgStateChange
    Left = 445
    Top = 157
  end
  object ds_Bedroommsg_count: TDataSource
    DataSet = cds_Bedroommsg_count
    Left = 453
    Top = 205
  end
  object ds_Bedmsg: TDataSource
    DataSet = cds_Bedmsg
    OnStateChange = ds_BedmsgStateChange
    Left = 453
    Top = 253
  end
  object il1: TImageList
    Height = 32
    Width = 32
    Left = 96
    Top = 160
    Bitmap = {
      494C010101000A00040020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      00000000000036000000280000008000000060000000010020000000000000C0
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7F7F700EFEFEF00F7F7F700F7F7
      F700F7F7F700F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700EFEFEF00F7F7F700F7F7
      F700F7F7F700F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700EFEFEF00F7F7F700F7F7
      F700F7F7F700F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7F7F700F7F7F700F7F7F700F7F7
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7F7FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700F7F7F700F7F7F700F7F7
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7F7FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700F7F7F700F7F7F700F7F7
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7F7FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000ADCEDE0094BDD60094BDD6008CB5D6008CBDD60094BDD60094BDD6006384
      9C0000186300002973000018520000105A000018630000186300001039000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFF7FF00F7FF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008CBDDE00E7EFF700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFF7FF00F7FF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008CBDDE00E7EFF700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFF7FF00F7FF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008CBDDE00E7EFF700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000039424200D6E7EF00C6DE
      E700B5D6E700A5C6DE0094BDD6009CC6DE009CC6DE0094C6DE0094C6DE0094BD
      DE0000297B000039840000428C00004A940000529C00005AA500006BAD000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7F7FF00A5C6E7008CBD
      E7009CC6EF0094CEF700F7FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00DEEFFF0084A5C600EFEFF700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7F7FF00A5C6E7008CBD
      E7009CC6EF0094CEF700F7FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00DEEFFF0084A5C600EFEFF700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7F7FF00A5C6E7008CBD
      E7009CC6EF0094CEF700F7FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00DEEFFF0084A5C600EFEFF700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000EFF7F700DEE7EF00E7F7F700DEEFF700B5D6
      E700BDD6E700ADCEDE009CCEDE009CC6DE009CC6DE009CC6DE009CC6DE009CC6
      DE000829730010317B000821630008216300082973001063A50094BDD60094BD
      D6008CB5D6008CB5CE000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEEFFF00A5C6E700D6CECE00C6C6
      CE00DECECE00A5CEF700EFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EFF7FF008CB5DE00BDCEDE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEEFFF00A5C6E700D6CECE00C6C6
      CE00DECECE00A5CEF700EFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EFF7FF008CB5DE00BDCEDE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEEFFF00A5C6E700D6CECE00C6C6
      CE00DECECE00A5CEF700EFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EFF7FF008CB5DE00BDCEDE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000008080800EFF7FF00E7EFF700F7F7FF00EFF7FF00D6E7EF00D6E7F700CEE7
      EF00B5D6E700ADCEE700A5CEE700A5CEE700A5CEE700A5CEDE009CC6DE0094BD
      D6001029730010317B0010317B001029730008216300527BA50094BDD6008CB5
      D60094BDD60094BDD6000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00D6EFFF00ADCEE700DED6D600DED6D600DED6
      D600DED6CE00C6DEF700F7FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7FFFF0094C6E70094B5CE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00D6EFFF00ADCEE700DED6D600DED6D600DED6
      D600DED6CE00C6DEF700F7FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7FFFF0094C6E70094B5CE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00D6EFFF00ADCEE700DED6D600DED6D600DED6
      D600DED6CE00C6DEF700F7FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7FFFF0094C6E70094B5CE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000007B8C9400CEDE
      EF00DEEFF700E7F7F700DEE7EF00E7F7F700C6D6E7009CBDCE00DECEA500C6DE
      EF00B5D6E700ADD6E700ADD6E700ADD6E700A5CEDE009CC6DE00A5CEDE00A5CE
      E7001031840018397B0018397B0018317B00102963005273A50094BDD6009CC6
      DE009CC6DE009CC6DE000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CEEFFF00B5CEE700E7DED600EFDED600EFDED600E7DE
      D600E7D6D600BDCED600BDE7F700FFFFFF00FFFFFF00E7F7FF00FFFFFF00FFFF
      FF00F7FFFF009CCEEF00A5C6E700DEEFF700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CEEFFF00B5CEE700E7DED600EFDED600EFDED600E7DE
      D600E7D6D600BDCED600BDE7F700FFFFFF00FFFFFF00E7F7FF00FFFFFF00FFFF
      FF00F7FFFF009CCEEF00A5C6E700DEEFF700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CEEFFF00B5CEE700E7DED600EFDED600EFDED600E7DE
      D600E7D6D600BDCED600BDE7F700FFFFFF00FFFFFF00E7F7FF00FFFFFF00FFFF
      FF00F7FFFF009CCEEF00A5C6E700DEEFF700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000CEE7F700D6E7
      F700C6DEE700DEEFF700A5BDCE00ADBDBD00DEC6A500DEC6A500D6BD9C00C6DE
      EF00BDDEEF00A5CEDE00ADD6E700A5CEDE00A5CEE700ADD6E700ADD6E7009CC6
      D60008428400214A8C0021428C002139840010296B005273A500A5CEDE00A5CE
      DE009CCEDE009CC6DE000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6E7FF00BDD6E700F7DEDE00F7DEDE00F7DEDE00F7DEDE00EFDE
      DE00EFDEDE00EFDEDE00A5BDCE00CEEFFF00D6F7FF008CC6EF00C6E7FF00F7FF
      FF009CD6EF00C6D6E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6E7FF00BDD6E700F7DEDE00F7DEDE00F7DEDE00F7DEDE00EFDE
      DE00EFDEDE00EFDEDE00A5BDCE00CEEFFF00D6F7FF008CC6EF00C6E7FF00F7FF
      FF009CD6EF00C6D6E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6E7FF00BDD6E700F7DEDE00F7DEDE00F7DEDE00F7DEDE00EFDE
      DE00EFDEDE00EFDEDE00A5BDCE00CEEFFF00D6F7FF008CC6EF00C6E7FF00F7FF
      FF009CD6EF00C6D6E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000C6E7EF00CEE7
      F700CEE7F700ADBDC600E7D6AD00DECEA500CEBD9400CEBD9400BDA58400BDDE
      EF00B5DEEF00ADD6E700ADCEE700B5D6EF00B5D6EF00B5D6EF00ADD6EF00ADD6
      E70008529400295A9C0029529400214A8C00183173004A739C00A5CEE700A5CE
      E700A5CEE700A5CEDE000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00BDE7FF008CC6EF00A5ADBD00EFDEDE00FFE7E700D6CEC600DECECE00D6CE
      CE00F7E7E700EFDEDE00DED6D60094BDD6008CBDDE00BDCEDE0094C6EF009CD6
      EF00BDD6E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00BDE7FF008CC6EF00A5ADBD00EFDEDE00FFE7E700D6CEC600DECECE00D6CE
      CE00F7E7E700EFDEDE00DED6D60094BDD6008CBDDE00BDCEDE0094C6EF009CD6
      EF00BDD6E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00BDE7FF008CC6EF00A5ADBD00EFDEDE00FFE7E700D6CEC600DECECE00D6CE
      CE00F7E7E700EFDEDE00DED6D60094BDD6008CBDDE00BDCEDE0094C6EF009CD6
      EF00BDD6E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000B5DEEF00CEE7
      F700CEEFF700ADC6CE00EFDECE00D6C6AD00CEB59C00D6C6A500DECEB500ADCE
      DE00B5D6E700ADD6E700B5DEEF00B5DEEF00B5DEEF00B5DEEF00B5DEEF00B5D6
      E700085A9C00296BA500295A9C0029529400183973004A6B9C00ADD6E700ADD6
      E700A5CEDE009CC6DE000000000000000000FFFFFF00FFFFFF00FFFFFF00C6E7
      F70094D6F70094D6F7009CCEE700F7EFE700FFEFEF00DED6D600E7DED600E7DE
      DE00FFEFEF00F7E7DE00DED6D600CEDEE700D6E7EF00FFFFFF00D6E7EF00B5CE
      E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6E7
      F70094D6F70094D6F7009CCEE700F7EFE700FFEFEF00DED6D600E7DED600E7DE
      DE00FFEFEF00F7E7DE00DED6D600CEDEE700D6E7EF00FFFFFF00D6E7EF00B5CE
      E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6E7
      F70094D6F70094D6F7009CCEE700F7EFE700FFEFEF00DED6D600E7DED600E7DE
      DE00FFEFEF00F7E7DE00DED6D600CEDEE700D6E7EF00FFFFFF00D6E7EF00B5CE
      E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000CEEFF700C6E7
      EF00CEEFF700A5BDCE00E7D6C600EFDED600DED6C600E7DECE00E7D6CE00B5D6
      E700A5CEDE00A5C6DE00BDDEEF00BDDEEF00BDDEEF00BDDEEF00ADD6E700ADD6
      E7000863A5003173AD00316BA50031639C00213973004A6B9C00ADD6E700A5CE
      DE00ADCEE700ADD6E7000000000000000000FFFFFF00FFFFFF00FFFFFF00F7F7
      FF00CEDEF700BDDEF70094CEEF00FFF7F700FFF7EF00C6BDB500D6CEC600D6CE
      CE00FFF7F700FFF7EF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7
      FF00CEDEF700BDDEF70094CEEF00FFF7F700FFF7EF00C6BDB500D6CEC600D6CE
      CE00FFF7F700FFF7EF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7
      FF00CEDEF700BDDEF70094CEEF00FFF7F700FFF7EF00C6BDB500D6CEC600D6CE
      CE00FFF7F700FFF7EF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000CEEFFF00BDE7
      F700CEEFF700ADC6D600F7EFEF00F7EFE700E7E7D600ADD6DE00B5D6E700A5CE
      DE009CBDD60094BDD600C6E7F700BDE7F700B5DEEF00ADD6E700B5DEEF00BDDE
      EF00006BAD003984B5003973AD00396BA50021427B00426B9C00ADD6E700B5DE
      EF00B5DEEF00B5D6EF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E7FFFF00A5D6EF00FFFFF700FFF7F700EFE7E700EFEFE700EFEF
      EF00FFFFF700FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E7FFFF00A5D6EF00FFFFF700FFF7F700EFE7E700EFEFE700EFEF
      EF00FFFFF700FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E7FFFF00A5D6EF00FFFFF700FFF7F700EFE7E700EFEFE700EFEF
      EF00FFFFF700FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000CEEFF700C6E7
      F700B5DEE700ADCED600C6D6DE00ADCEDE00B5D6E700ADCEDE009CBDD60094C6
      D6008CBDCE007BADC600BDE7F700B5D6E700BDDEEF00C6E7F700C6E7F700BDE7
      F700006BAD000863A500085294000842840008317B00426B9C00BDDEEF00BDDE
      EF00B5DEEF00B5DEEF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00D6FFFF00B5D6EF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E7E7E700DEDEDE00EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00D6FFFF00B5D6EF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E7E7E700DEDEDE00EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00D6FFFF00B5D6EF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E7E7E700DEDEDE00EFEFEF00FFFFFF000000000000000000C6E7EF00C6E7
      EF00BDDEE700BDDEE700B5D6E700ADCEDE00A5CEDE009CC6D6008CBDCE0084B5
      CE007BADC6006BA5BD00BDDEEF00C6E7F700C6E7F700C6E7F700C6E7F700C6E7
      F700C6E7F700B5DEEF0042639C000829730008317B00426B9C00BDE7F700BDE7
      F700BDDEEF00B5DEEF000000000000000000FFFFFF00FFFFFF00DEDEDE00C6C6
      C600BDBDBD0073B5D6008494AD00EFD6CE00EFD6D600EFD6D600EFD6D600EFDE
      D600EFDED600D6CEC600C6C6C600D6D6D600E7E7E700E7E7E700E7E7E700E7E7
      E700EFEFEF00EFEFEF00EFEFEF00EFEFEF00F7F7F700F7F7F700EFEFEF00DEDE
      DE00B5B5B500BDBDBD00DEDEDE00F7F7F700FFFFFF00FFFFFF00DEDEDE00C6C6
      C600BDBDBD0073B5D6008494AD00EFD6CE00EFD6D600EFD6D600EFD6D600EFDE
      D600EFDED600D6CEC600C6C6C600D6D6D600E7E7E700E7E7E700E7E7E700E7E7
      E700EFEFEF00EFEFEF00EFEFEF00EFEFEF00F7F7F700F7F7F700EFEFEF00DEDE
      DE00B5B5B500BDBDBD00DEDEDE00F7F7F700FFFFFF00FFFFFF00DEDEDE00C6C6
      C600BDBDBD0073B5D6008494AD00EFD6CE00EFD6D600EFD6D600EFD6D600EFDE
      D600EFDED600D6CEC600C6C6C600D6D6D600E7E7E700E7E7E700E7E7E700E7E7
      E700EFEFEF00EFEFEF00EFEFEF00EFEFEF00F7F7F700F7F7F700EFEFEF00DEDE
      DE00B5B5B500BDBDBD00DEDEDE00F7F7F7000000000000000000ADD6DE00BDDE
      E700B5D6E700A5C6D600A5CEDE009CC6D6008CB5CE0084B5CE007BADC6006BA5
      BD0018218C005A9CB500CEEFF700CEEFF700CEEFF700CEEFF700CEEFF700C6E7
      F700B5DEEF00BDDEEF00C6E7F700C6E7F700C6E7F700C6E7F700C6E7F700C6E7
      F700B5DEEF00B5D6E7000000000000000000FFFFFF00FFFFFF00FFFFFF00E7E7
      E700E7E7E70063CEE7009CA5C600FFE7DE00FFE7E700FFE7E700FFEFE700FFEF
      E700FFEFEF00DED6CE00BDBDBD00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE00C6C6C600C6C6C600C6C6C600C6C6C600BDBDBD00B5B5B500A5A5
      A500A5A5A500BDBDBD00E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7
      E700E7E7E70063CEE7009CA5C600FFE7DE00FFE7E700FFE7E700FFEFE700FFEF
      E700FFEFEF00DED6CE00BDBDBD00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE00C6C6C600C6C6C600C6C6C600C6C6C600BDBDBD00B5B5B500A5A5
      A500A5A5A500BDBDBD00E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7
      E700E7E7E70063CEE7009CA5C600FFE7DE00FFE7E700FFE7E700FFEFE700FFEF
      E700FFEFEF00DED6CE00BDBDBD00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE00C6C6C600C6C6C600C6C6C600C6C6C600BDBDBD00B5B5B500A5A5
      A500A5A5A500BDBDBD00E7E7E700FFFFFF000000000000000000B5D6E700A5C6
      D600A5C6D60094C6D6008CB5CE0084B5CE0073ADC60018298C00006BE700006B
      E7000073EF001821B500B5D6E700CEEFFF00CEEFFF00CEEFF700BDE7EF00BDDE
      EF00C6E7F700CEEFF700CEEFF700C6EFF700C6E7F700C6E7F700BDE7EF00B5D6
      E700BDDEEF00C6E7F7000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0052C6EF00BDC6DE00FFE7DE00C6ADA500AD9C9C00A5948C00D6C6
      C600FFEFEF00FFF7EF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700CECECE00CECE
      CE00E7E7E700F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0052C6EF00BDC6DE00FFE7DE00C6ADA500AD9C9C00A5948C00D6C6
      C600FFEFEF00FFF7EF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700CECECE00CECE
      CE00E7E7E700F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0052C6EF00BDC6DE00FFE7DE00C6ADA500AD9C9C00A5948C00D6C6
      C600FFEFEF00FFF7EF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700CECECE00CECE
      CE00E7E7E700F7F7F700FFFFFF00FFFFFF0000000000000000009CC6D60094BD
      CE008CBDCE0084B5C60021318C000042CE00004ACE000052D600005ADE00006B
      E7000073EF000084F7002121AD00B5D6E700C6E7F700BDDEEF00C6E7F700CEEF
      FF009CBDCE00A5BDCE00B5D6E700CEEFF700C6E7F700BDDEEF00BDDEEF00C6EF
      F700C6EFF700C6E7F7000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0031BDEF00D6D6DE00FFE7E700CEBDB500D6C6C600CEBDB500EFDE
      DE00FFF7EF00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0031BDEF00D6D6DE00FFE7E700CEBDB500D6C6C600CEBDB500EFDE
      DE00FFF7EF00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0031BDEF00D6D6DE00FFE7E700CEBDB500D6C6C600CEBDB500EFDE
      DE00FFF7EF00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000008CB5CE002939
      94000029B5000031AD000031B5000042BD000042C6000052D600005ADE000063
      E7000073EF000084F700008CF7002929AD00ADCEDE00CEEFFF00CEEFFF00CEEF
      FF00D6C69C00DEC6A500CEBD9400E7D6AD0094B5CE00C6E7F700C6EFFF00C6EF
      FF00C6EFFF00B5D6E7001018290008183100FFFFFF00FFFFFF00ADEFFF00B5EF
      FF00ADEFFF0021ADEF00F7DEDE00FFE7E700B59C9C00C6B5B500AD9C9400E7DE
      D600FFF7EF00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADEFFF00B5EF
      FF00ADEFFF0021ADEF00F7DEDE00FFE7E700B59C9C00C6B5B500AD9C9400E7DE
      D600FFF7EF00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADEFFF00B5EF
      FF00ADEFFF0021ADEF00F7DEDE00FFE7E700B59C9C00C6B5B500AD9C9400E7DE
      D600FFF7EF00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000004A000018A500002194000021
      940000299C000029A5000031AD000039B5000042BD00004ACE00005AD6000063
      E7000073EF00007BF700008CF700009CFF003139AD00ADD6DE00C6EFFF00C6EF
      FF00BDA57B00BDAD8400C6B59400E7D6C60094B5CE00C6EFFF00C6EFFF00C6EF
      FF00B5D6E7007BA5D6003963D60000000000FFFFFF00FFFFFF007BDEFF00189C
      EF0029A5EF002994D600FFE7DE00FFE7E700C6B5B500E7D6D600DECEC600F7E7
      E700FFF7EF00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007BDEFF00189C
      EF0029A5EF002994D600FFE7DE00FFE7E700C6B5B500E7D6D600DECEC600F7E7
      E700FFF7EF00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007BDEFF00189C
      EF0029A5EF002994D600FFE7DE00FFE7E700C6B5B500E7D6D600DECEC600F7E7
      E700FFF7EF00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000018840000188C000021
      940000219C000029A5000031A5000039B5000042BD00004AC6000052D600005A
      DE00006BE700007BEF000084F700008CF700009CFF004A52AD00A5CEDE00BDE7
      F700DED6BD00E7DECE00DECEBD00EFEFDE0094B5CE00BDE7F700BDE7F700ADD6
      E700739CC600315ACE000000000000000000FFFFFF00FFFFFF00F7FFFF0039CE
      FF00C6DEE700FFDEDE00FFE7DE00FFE7E700FFEFE700FFEFE700FFEFEF00FFF7
      EF00FFF7EF00F7EFE700BDADAD009CF7FF0094F7FF00FFFFFF00FFFFFF0063EF
      FF00B5F7FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7FFFF0039CE
      FF00C6DEE700FFDEDE00FFE7DE00FFE7E700FFEFE700FFEFE700FFEFEF00FFF7
      EF00FFF7EF00F7EFE700BDADAD009CF7FF0094F7FF00FFFFFF00FFFFFF0063EF
      FF00B5F7FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7FFFF0039CE
      FF00C6DEE700FFDEDE00FFE7DE00FFE7E700FFEFE700FFEFE700FFEFEF00FFF7
      EF00FFF7EF00F7EFE700BDADAD009CF7FF0094F7FF00FFFFFF00FFFFFF0063EF
      FF00B5F7FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000000000188C000021
      940000219C0000299C000029A5000031AD000039B5000042BD00004ACE00005A
      DE000063E7000073EF00007BEF000084F700008CF7000094FF005263AD008CBD
      CE00B5E7F700BDE7F700ADD6E700D6E7E70094BDCE00BDE7F7009CCEDE00739C
      BD003152CE00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00B5EF
      FF004AD6F700EFDED600FFE7DE00FFE7E700FFEFE700FFEFE700FFEFEF00FFEF
      EF00FFF7EF00DECECE0084B5B50042D6F70039BDE700B5FFFF009CF7FF0063BD
      D600219CBD00C6F7FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5EF
      FF004AD6F700EFDED600FFE7DE00FFE7E700FFEFE700FFEFE700FFEFEF00FFEF
      EF00FFF7EF00DECECE0084B5B50042D6F70039BDE700B5FFFF009CF7FF0063BD
      D600219CBD00C6F7FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5EF
      FF004AD6F700EFDED600FFE7DE00FFE7E700FFEFE700FFEFE700FFEFEF00FFEF
      EF00FFF7EF00DECECE0084B5B50042D6F70039BDE700B5FFFF009CF7FF0063BD
      D600219CBD00C6F7FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000018
      8C00002194000021940000299C000031A5000031AD000042BD000042C6000052
      D600005ADE000063E7000073EF00007BEF000084F700008CF700008CF7006B7B
      B5009CCEDE00B5E7F700B5E7F700B5E7F700ADDEF7008CBDD60073A5BD00294A
      C60000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF005ADEFF008CDEEF00FFDED600FFE7DE00FFE7E700FFEFE700FFEFE700FFEF
      E700EFDEDE008C9C9C0039D6F700D6EFFF00D6E7F70031BDE70063E7FF00FFFF
      FF009CADBD0029B5DE00D6F7FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF005ADEFF008CDEEF00FFDED600FFE7DE00FFE7E700FFEFE700FFEFE700FFEF
      E700EFDEDE008C9C9C0039D6F700D6EFFF00D6E7F70031BDE70063E7FF00FFFF
      FF009CADBD0029B5DE00D6F7FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF005ADEFF008CDEEF00FFDED600FFE7DE00FFE7E700FFEFE700FFEFE700FFEF
      E700EFDEDE008C9C9C0039D6F700D6EFFF00D6E7F70031BDE70063E7FF00FFFF
      FF009CADBD0029B5DE00D6F7FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000188C000021940000299C0000299C000031A5000039B5000042BD00004A
      CE000052D600005ADE000063E700006BEF000073EF00007BEF00007BF7000084
      F7007394BD0094C6DE00ADDEF7009CCEE70084BDD60073ADC6002139C6000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E7F7FF0031D6FF00D6DEDE00FFDEDE00FFE7DE00FFE7E700FFE7E700FFEF
      E700BDADAD0042D6EF00ADDEF700FFFFFF00FFFFFF00BDD6EF00EFFFFF00FFFF
      FF00FFFFFF0084B5E70039C6F700E7FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E7F7FF0031D6FF00D6DEDE00FFDEDE00FFE7DE00FFE7E700FFE7E700FFEF
      E700BDADAD0042D6EF00ADDEF700FFFFFF00FFFFFF00BDD6EF00EFFFFF00FFFF
      FF00FFFFFF0084B5E70039C6F700E7FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E7F7FF0031D6FF00D6DEDE00FFDEDE00FFE7DE00FFE7E700FFE7E700FFEF
      E700BDADAD0042D6EF00ADDEF700FFFFFF00FFFFFF00BDD6EF00EFFFFF00FFFF
      FF00FFFFFF0084B5E70039C6F700E7FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000188C000021940000299C0000299C000031AD000039B5000042
      BD00004ACE000052D600005ADE000063E700006BE7000073E7000073EF000073
      EF00007BEF006B94B50073ADC6008CC6DE007BADC6001829BD00000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0094E7FF005ADEF700F7DED600FFDEDE00FFE7DE00FFE7DE00FFE7
      DE00DEE7E70063DEF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF006BB5F70042CEF700F7FFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0094E7FF005ADEF700F7DED600FFDEDE00FFE7DE00FFE7DE00FFE7
      DE00DEE7E70063DEF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF006BB5F70042CEF700F7FFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0094E7FF005ADEF700F7DED600FFDEDE00FFE7DE00FFE7DE00FFE7
      DE00DEE7E70063DEF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF006BB5F70042CEF700F7FFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000188C000021940000299C000029A5000031AD000039
      B5000042BD00004ACE000052D600005AD600005ADE000063DE000063E700006B
      E700006BE7000073EF0073A5BD0073ADC6001018B50000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0042CEFF009CD6E700EFC6C600EFCEC600DEBDBD00EFCE
      CE00D6DEE7007BDEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F7FFFF0052ADEF0052C6FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0042CEFF009CD6E700EFC6C600EFCEC600DEBDBD00EFCE
      CE00D6DEE7007BDEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F7FFFF0052ADEF0052C6FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0042CEFF009CD6E700EFC6C600EFCEC600DEBDBD00EFCE
      CE00D6DEE7007BDEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F7FFFF0052ADEF0052C6FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000218C000021940000299C000029A5000031
      AD000039B5000042BD00004AC600004ACE000052D600005AD600005ADE00005A
      DE00005ADE00005AE7000073EF000810AD000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CEEFFF0029C6FF00CECECE00D6B5AD00AD9C9400DEC6
      BD00CEDEE7007BD6FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EFF7FF0042A5EF0063C6FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CEEFFF0029C6FF00CECECE00D6B5AD00AD9C9400DEC6
      BD00CEDEE7007BD6FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EFF7FF0042A5EF0063C6FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CEEFFF0029C6FF00CECECE00D6B5AD00AD9C9400DEC6
      BD00CEDEE7007BD6FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EFF7FF0042A5EF0063C6FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000218C0000219C0000299C000029
      A5000031AD000039B5000039BD000042C600004AC600004ACE000852D6001863
      DE002973DE00397BDE0008101800000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0073DEFF006BD6F700BDCECE0094D6F700F7EF
      EF00CEEFF70084DEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6E7F7002194EF0063C6FF0073BD
      F700DEE7EF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0073DEFF006BD6F700BDCECE0094D6F700F7EF
      EF00CEEFF70084DEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6E7F7002194EF0063C6FF0073BD
      F700DEE7EF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0073DEFF006BD6F700BDCECE0094D6F700F7EF
      EF00CEEFF70084DEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6E7F7002194EF0063C6FF0073BD
      F700DEE7EF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000219400002194000029
      9C000029A5000031AD000842B5001852C6003163CE001029520000187B000821
      7B0010319C000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EFFFFF0031CEFF0029C6F70029CEFF0031D6
      FF0029CEFF0094DEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CEE7F7003194EF002184EF00187B
      D6008CADD600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EFFFFF0031CEFF0029C6F70029CEFF0031D6
      FF0029CEFF0094DEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CEE7F7003194EF002184EF00187B
      D6008CADD600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EFFFFF0031CEFF0029C6F70029CEFF0031D6
      FF0029CEFF0094DEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CEE7F7003194EF002184EF00187B
      D6008CADD600FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000010319C002142
      A50029427B00000000000000000000000000000000000000000000187B000821
      8C00102984000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5EFFF007BC6EF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7EFF7004AA5F7002184
      EF003984C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5EFFF007BC6EF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7EFF7004AA5F7002184
      EF003984C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5EFFF007BC6EF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7EFF7004AA5F7002184
      EF003984C600FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CEBDB500C6B5
      AD00EFE7DE000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007BB5
      EF00217BDE00D6DEEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007BB5
      EF00217BDE00D6DEEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007BB5
      EF00217BDE00D6DEEF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EFDED600ADA5AD000018
      7300CEC6CE00F7EFEF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00ADCEEF00CEDEEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00ADCEEF00CEDEEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00ADCEEF00CEDEEF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CEBD
      B500000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00424D3E000000000000003E000000
      2800000080000000600000000100010000000000000600000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFF0101F000000000000000000000000
      FFC00007000000000000000000000000FF000001000000000000000000000000
      F8000001000000000000000000000000E0000001000000000000000000000000
      C0000001000000000000000000000000C0000001000000000000000000000000
      C0000001000000000000000000000000C0000001000000000000000000000000
      C0000001000000000000000000000000C0000001000000000000000000000000
      C0000001000000000000000000000000C0000001000000000000000000000000
      C0000001000000000000000000000000C0000001000000000000000000000000
      C0000001000000000000000000000000C0000001000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      80000001000000000000000000000000C0000003000000000000000000000000
      E0000007000000000000000000000000F000000F000000000000000000000000
      F800001F000000000000000000000000FC00003F000000000000000000000000
      FE00007F000000000000000000000000FF0001FF000000000000000000000000
      FF8003FF000000000000000000000000FFC3C3FF000000000000000000000000
      FFFF81FF000000000000000000000000FFFF81FF000000000000000000000000
      FFFFE7FF00000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object AQ_Dormitorymsg: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from dbo.Dormitorymsg')
    Left = 248
    Top = 112
    object AQ_Dormitorymsgrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object AQ_DormitorymsgD_code: TStringField
      FieldName = 'D_code'
      Size = 50
    end
    object AQ_DormitorymsgD_name: TWideStringField
      FieldName = 'D_name'
      Size = 50
    end
    object AQ_DormitorymsgD_floor: TIntegerField
      FieldName = 'D_floor'
    end
    object AQ_Dormitorymsgremark: TWideStringField
      FieldName = 'remark'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object AQ_Dormitorymsgwater_price: TFloatField
      FieldName = 'water_price'
    end
    object AQ_Dormitorymsgelectricity_price: TFloatField
      FieldName = 'electricity_price'
    end
    object AQ_Dormitorymsgeffective: TBooleanField
      FieldName = 'effective'
    end
    object AQ_Dormitorymsgtc: TStringField
      FieldName = 'tc'
      ProviderFlags = []
      ReadOnly = True
      Size = 23
    end
  end
  object AQ_Bedroommsg: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select D_name,Bedroommsg.* '
      
        'from dbo.Bedroommsg join Dormitorymsg on Bedroommsg.dormitoryid=' +
        'Dormitorymsg.rkey'
      'order by R_name')
    Left = 248
    Top = 159
    object AQ_Bedroommsgemployeecode: TWideStringField
      FieldName = 'employeecode'
      ProviderFlags = []
    end
    object AQ_Bedroommsgchinesename: TWideStringField
      FieldName = 'chinesename'
      ProviderFlags = []
    end
    object AQ_BedroommsgD_name: TWideStringField
      FieldName = 'D_name'
      ProviderFlags = []
      Size = 50
    end
    object AQ_Bedroommsgrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object AQ_Bedroommsgdormitoryid: TIntegerField
      FieldName = 'dormitoryid'
    end
    object AQ_BedroommsgR_code: TStringField
      FieldName = 'R_code'
      Size = 50
    end
    object AQ_Bedroommsgbedcount: TIntegerField
      FieldName = 'bedcount'
    end
    object AQ_Bedroommsgfloor: TIntegerField
      FieldName = 'floor'
    end
    object AQ_Bedroommsgtype: TIntegerField
      FieldName = 'type'
    end
    object AQ_Bedroommsggrade: TWideStringField
      FieldName = 'grade'
      FixedChar = True
      Size = 10
    end
    object AQ_Bedroommsgmonitor: TIntegerField
      FieldName = 'monitor'
    end
    object AQ_Bedroommsgremark: TWideStringField
      FieldName = 'remark'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object AQ_Bedroommsgeffective: TIntegerField
      FieldName = 'effective'
    end
    object AQ_BedroommsgR_name: TWideStringField
      FieldName = 'R_name'
      ProviderFlags = [pfInUpdate]
    end
    object AQ_Bedroommsgbasic_rent: TBCDField
      FieldName = 'basic_rent'
      ProviderFlags = [pfInUpdate]
      Precision = 19
    end
    object AQ_Bedroommsgelectricity_standard: TFloatField
      FieldName = 'electricity_standard'
      ProviderFlags = [pfInUpdate]
    end
    object AQ_Bedroommsgwater_standard: TFloatField
      FieldName = 'water_standard'
      ProviderFlags = [pfInUpdate]
    end
    object AQ_Bedroommsgequipment_remark: TWideStringField
      FieldName = 'equipment_remark'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
  end
  object AQ_Bedroommsg_count: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select distinct dormitoryid, [floor] from Bedroommsg order by do' +
        'rmitoryid,[floor]')
    Left = 248
    Top = 204
    object AQ_Bedroommsg_countdormitoryid: TIntegerField
      FieldName = 'dormitoryid'
    end
    object AQ_Bedroommsg_countfloor: TIntegerField
      FieldName = 'floor'
    end
    object AQ_Bedroommsg_counttc: TStringField
      FieldName = 'tc'
      ReadOnly = True
      Size = 23
    end
  end
  object AQ_Bedmsg: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'vBedroomid'
        DataType = ftString
        Size = 1
        Value = '0'
      end>
    Left = 248
    Top = 250
    object AQ_BedmsgR_code: TStringField
      FieldName = 'R_code'
      ProviderFlags = []
      Size = 50
    end
    object AQ_BedmsgR_name: TWideStringField
      FieldName = 'R_name'
      ProviderFlags = []
    end
    object AQ_Bedmsgchinesename: TWideStringField
      FieldName = 'chinesename'
      ProviderFlags = []
    end
    object AQ_Bedmsgemployeecode: TWideStringField
      FieldName = 'employeecode'
      ProviderFlags = []
    end
    object AQ_Bedmsgfactoryarea: TWideStringField
      FieldName = 'factoryarea'
      ProviderFlags = []
    end
    object AQ_Bedmsgdepartmentname: TWideStringField
      FieldName = 'departmentname'
      ProviderFlags = []
    end
    object AQ_Bedmsgposition: TWideStringField
      FieldName = 'position'
      ProviderFlags = []
    end
    object AQ_Bedmsgondutytime: TWideStringField
      FieldName = 'ondutytime'
      ProviderFlags = []
    end
    object AQ_BedmsgProvince: TWideStringField
      FieldName = 'Province'
      ProviderFlags = []
    end
    object AQ_Bedmsgbirthday: TWideStringField
      FieldName = 'birthday'
      ProviderFlags = []
    end
    object AQ_Bedmsgphone: TWideStringField
      FieldName = 'phone'
      ProviderFlags = []
      Size = 50
    end
    object AQ_Bedmsgrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object AQ_Bedmsgbedroomid: TIntegerField
      FieldName = 'bedroomid'
    end
    object AQ_BedmsgB_code: TStringField
      FieldName = 'B_code'
      Size = 50
    end
    object AQ_Bedmsgemployeeid: TIntegerField
      FieldName = 'employeeid'
    end
    object AQ_Bedmsgremark: TWideStringField
      FieldName = 'remark'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object AQ_Bedmsgeffective: TIntegerField
      FieldName = 'effective'
    end
  end
  object cds_Copy: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 533
    Top = 109
  end
  object PopupMenu_Dormitorymsg: TPopupMenu
    OnPopup = PopupMenu_DormitorymsgPopup
    Left = 573
    Top = 221
    object N1_See: TMenuItem
      Caption = #26597#30475
      ShortCut = 16450
      OnClick = N1_SeeClick
    end
    object N1_Append: TMenuItem
      Caption = #26032#24314
      Enabled = False
      ShortCut = 16449
      OnClick = N1_AppendClick
    end
    object N1_Edit: TMenuItem
      Caption = #32534#36753
      Enabled = False
      ShortCut = 16453
      OnClick = N1_EditClick
    end
    object N1_Delete: TMenuItem
      Caption = #21024#38500
      Enabled = False
      OnClick = N1_DeleteClick
    end
  end
  object PopupMenu_Bedroommsg: TPopupMenu
    OnPopup = PopupMenu_BedroommsgPopup
    Left = 845
    Top = 141
    object N2_See: TMenuItem
      Caption = #26597#30475
      ShortCut = 16450
      OnClick = N2_SeeClick
    end
    object N2_Append: TMenuItem
      Caption = #26032#24314
      Enabled = False
      ShortCut = 16449
      OnClick = N2_AppendClick
    end
    object N2_Edit: TMenuItem
      Caption = #32534#36753
      Enabled = False
      ShortCut = 16453
      OnClick = N2_EditClick
    end
    object N2_delete: TMenuItem
      Caption = #21024#38500
      Enabled = False
      OnClick = N2_deleteClick
    end
  end
  object PopupMenu_Bedmsg: TPopupMenu
    OnPopup = PopupMenu_BedmsgPopup
    Left = 677
    Top = 437
    object N3_See: TMenuItem
      Caption = #26597#30475
      ShortCut = 16450
      OnClick = N3_SeeClick
    end
    object N3_Append: TMenuItem
      Caption = #26032#24314
      Enabled = False
      ShortCut = 16449
      OnClick = N3_AppendClick
    end
    object N3_Edit: TMenuItem
      Caption = #32534#36753
      Enabled = False
      ShortCut = 16453
      OnClick = N3_EditClick
    end
    object N3_Delete: TMenuItem
      Caption = #21024#38500
      Enabled = False
      OnClick = N3_DeleteClick
    end
  end
end
