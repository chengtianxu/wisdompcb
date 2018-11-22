inherited frmWorkRecord03: TfrmWorkRecord03
  Caption = #20174#21382#21490#35760#24405#28155#21152
  PixelsPerInch = 96
  TextHeight = 12
  inherited cxTabControl1: TcxTabControl
    inherited Splitter1: TSplitter
      Top = 171
    end
    inherited Panel2: TPanel
      Height = 166
      inherited Panel4: TPanel
        Height = 166
        inherited RzToolbar2: TRzToolbar
          Height = 166
          RowHeight = 26
          ToolbarControls = (
            btn1)
          inherited btn1: TButton
            Top = 3
          end
        end
      end
      inherited cxPageControl1: TcxPageControl
        Height = 166
        ClientRectBottom = 166
        inherited cxTabSheetMain1: TcxTabSheet
          inherited ToolBar2: TToolBar
            Height = 143
          end
          inherited DghMain: TDBGridEh
            Height = 143
            Columns = <
              item
                EditButtons = <>
                FieldName = #24037#20316#21333#21495
                Footers = <>
                ReadOnly = True
              end
              item
                EditButtons = <>
                FieldName = #37096#38376#21517#31216
                Footers = <>
                ReadOnly = True
                Width = 172
              end
              item
                EditButtons = <>
                FieldName = #24037#20316#20219#21153#21517#31216
                Footers = <>
                ReadOnly = True
                Width = 200
              end
              item
                EditButtons = <>
                FieldName = #29366#24577
                Footers = <>
                ReadOnly = True
              end
              item
                EditButtons = <>
                FieldName = #30003#35831#20154
                Footers = <>
                ReadOnly = True
                Width = 108
              end>
          end
        end
        inherited cxTabSheetMain2: TcxTabSheet
          TabVisible = False
        end
      end
      inherited Panel6: TPanel
        Height = 166
      end
    end
    inherited Panel3: TPanel
      Top = 178
      Height = 331
      inherited Panel5: TPanel
        Top = 296
        Height = 35
        object Label1: TLabel
          Left = 87
          Top = 5
          Width = 48
          Height = 12
          Caption = #24037#20316#26085#26399
        end
        object Button2: TButton
          Left = 296
          Top = 0
          Width = 70
          Height = 23
          Caption = #30830#23450
          TabOrder = 0
          OnClick = Button2Click
        end
        object Button3: TButton
          Left = 406
          Top = 0
          Width = 69
          Height = 23
          Caption = #21462#28040
          TabOrder = 1
          OnClick = Button3Click
        end
        object CheckBox1: TCheckBox
          Left = 19
          Top = 1
          Width = 51
          Height = 16
          Caption = #20840#36873
          TabOrder = 2
          OnClick = CheckBox1Click
        end
        object DBDateTimeEditEh1: TDBDateTimeEditEh
          Left = 137
          Top = 1
          Width = 111
          Height = 20
          EditButtons = <>
          Kind = dtkDateEh
          TabOrder = 3
          Visible = True
        end
      end
      inherited Panel7: TPanel
        Height = 296
        inherited Panel8: TPanel
          Height = 296
          inherited RzToolbar3: TRzToolbar
            Height = 296
            RowHeight = 26
            ToolbarControls = (
              btn2)
            inherited btn2: TButton
              Top = 3
            end
          end
        end
        inherited Panel9: TPanel
          Height = 296
          inherited Panel10: TPanel
            Top = 291
          end
          inherited Panel11: TPanel
            Height = 291
          end
          inherited cxPageControl2: TcxPageControl
            Height = 291
            ClientRectBottom = 291
            inherited cxTabSheetChild1: TcxTabSheet
              inherited ToolBar1: TToolBar
                Height = 268
              end
              inherited dghChild: TDBGridEh
                Height = 268
                Columns = <
                  item
                    EditButtons = <>
                    FieldName = 'selected'
                    Footers = <>
                  end
                  item
                    EditButtons = <>
                    FieldName = #24037#20316#26085#26399
                    Footers = <>
                  end
                  item
                    EditButtons = <>
                    FieldName = #24320#22987#26102#38388
                    Footers = <>
                  end
                  item
                    EditButtons = <>
                    FieldName = #32467#26463#26102#38388
                    Footers = <>
                  end
                  item
                    EditButtons = <>
                    FieldName = 'Empl_ptr'
                    Footers = <>
                    ReadOnly = True
                    Visible = False
                  end
                  item
                    EditButtons = <>
                    FieldName = #38599#21592
                    Footers = <>
                  end>
              end
            end
            inherited cxTabSheetChild2: TcxTabSheet
              TabVisible = False
            end
          end
        end
      end
    end
  end
  inherited dxBarManager: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    DockControlHeights = (
      0
      0
      39
      0)
    inherited dxBarManagerBar2: TdxBar
      ItemLinks = <
        item
          Visible = True
          ItemName = 'tblFind'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'tblFirst'
        end
        item
          Visible = True
          ItemName = 'tblPrior'
        end
        item
          Visible = True
          ItemName = 'tblNext'
        end
        item
          Visible = True
          ItemName = 'tblLast'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'tblHelp'
        end
        item
          Visible = True
          ItemName = 'tblExit'
        end>
    end
    inherited tblAdd: TdxBarLargeButton
      ImageIndex = 3
    end
    inherited tblEdit: TdxBarLargeButton
      ImageIndex = 4
    end
    inherited tblReject: TdxBarLargeButton
      ImageIndex = 130
    end
    inherited tblCancelFilter: TdxBarLargeButton
      ImageIndex = 129
    end
    inherited tblFilter: TdxBarLargeButton
      ImageIndex = 128
    end
    inherited tblExpand: TdxBarLargeButton
      ImageIndex = 131
    end
  end
  inherited dtMain: TADODataSet
    CursorType = ctStatic
    CommandText = 
      'select top 100 data0835.rkey,WorkOrder '#24037#20316#21333#21495',[DeptName]'#37096#38376#21517#31216',[Work' +
      'Name]'#24037#20316#20219#21153#21517#31216',MainExecStat '#29366#24577',USER_FULL_NAME '#30003#35831#20154#13#10'from data0835'#13#10'j' +
      'oin data0830 on data0835.[Dept_ptr]=data0830.rkey'#13#10'join data0836' +
      ' on data0835.[Work_ptr]=data0836.rkey'#13#10'join data0073 on data0835' +
      '.[Applican]=data0073.rkey'#13#10'join data0832 on data0835.[Status]  =' +
      'data0832.rkey'#13#10'where status<>1'#13#10'order by data0835.rkey desc'#13#10
  end
  inherited cdsMain: Tcds
    CommandText = 
      'select top 100 data0835.rkey,WorkOrder '#24037#20316#21333#21495',[DeptName]'#37096#38376#21517#31216',[Work' +
      'Name]'#24037#20316#20219#21153#21517#31216',MainExecStat '#29366#24577',USER_FULL_NAME '#30003#35831#20154#13#10'from data0835'#13#10'j' +
      'oin data0830 on data0835.[Dept_ptr]=data0830.rkey'#13#10'join data0836' +
      ' on data0835.[Work_ptr]=data0836.rkey'#13#10'join data0073 on data0835' +
      '.[Applican]=data0073.rkey'#13#10'join data0832 on data0835.[Status]  =' +
      'data0832.rkey'#13#10'where status<>1'#13#10'order by data0835.rkey desc'#13#10
    object cdsMainrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object cdsMainCDSDesigner: TStringField
      FieldName = #24037#20316#21333#21495
      Size = 15
    end
    object cdsMainCDSDesigner2: TStringField
      FieldName = #37096#38376#21517#31216
      Size = 50
    end
    object cdsMainCDSDesigner3: TStringField
      FieldName = #24037#20316#20219#21153#21517#31216
      Size = 50
    end
    object cdsMainCDSDesigner4: TStringField
      FieldName = #29366#24577
      Size = 10
    end
    object cdsMainCDSDesigner5: TStringField
      FieldName = #30003#35831#20154
      Size = 30
    end
  end
  inherited pp_Report1: TppReport
    DataPipelineName = 'pp_DBPipeline1'
    inherited ppDetailBand1: TppDetailBand
      inherited ppDBText1: TppDBText
        DataPipelineName = 'pp_DBPipeline1'
      end
      inherited ppDBText2: TppDBText
        DataPipelineName = 'pp_DBPipeline1'
      end
    end
  end
  inherited cdsChild: Tcds
    CommandText = 
      'select cast(0 as bit)selected,WorkDate '#24037#20316#26085#26399',BeginTime '#24320#22987#26102#38388',EndTi' +
      'me '#32467#26463#26102#38388','#13#10'EMPL_CODE '#38599#21592#20195#30721',EMPLOYEE_NAME '#38599#21592',Work_ptr'#13#10'from Data083' +
      '7'#13#10'join data0005 on Data0837.[Empl_ptr]=data0005.rkey'
    F_SQLSelectFrom = 
      'select cast(0 as bit)selected,WorkDate '#24037#20316#26085#26399',BeginTime '#24320#22987#26102#38388',EndTi' +
      'me '#32467#26463#26102#38388','#13#10'EMPL_CODE '#38599#21592#20195#30721',EMPLOYEE_NAME '#38599#21592',Work_ptr'#13#10'from Data083' +
      '7'#13#10'join data0005 on Data0837.[Empl_ptr]=data0005.rkey'
    F_Primarykey = 'rkey'
    F_Foreignkey = 'Work_ptr'
    object cdsChildselected: TBooleanField
      DisplayLabel = #36873#25321
      FieldName = 'selected'
    end
    object cdsChildCDSDesigner: TDateTimeField
      FieldName = #24037#20316#26085#26399
      ReadOnly = True
    end
    object cdsChildCDSDesigner2: TDateTimeField
      FieldName = #24320#22987#26102#38388
      ReadOnly = True
    end
    object cdsChildCDSDesigner3: TDateTimeField
      FieldName = #32467#26463#26102#38388
      ReadOnly = True
    end
    object cdsChildCDSDesigner4: TStringField
      FieldName = #38599#21592#20195#30721
      ReadOnly = True
      Size = 10
    end
    object cdsChildCDSDesigner5: TStringField
      FieldName = #38599#21592
      ReadOnly = True
      Size = 16
    end
    object cdsChildWork_ptr: TIntegerField
      FieldName = 'Work_ptr'
      ReadOnly = True
    end
  end
  inherited dtChild: TADODataSet
    CursorType = ctStatic
    CommandText = 
      'select cast(0 as bit)selected,WorkDate '#24037#20316#26085#26399',BeginTime '#24320#22987#26102#38388',EndTi' +
      'me '#32467#26463#26102#38388','#13#10'EMPL_CODE '#38599#21592#20195#30721',EMPLOYEE_NAME '#38599#21592',Work_ptr'#13#10'from Data083' +
      '7'#13#10'join data0005 on Data0837.[Empl_ptr]=data0005.rkey'
    object dtChildselected: TBooleanField
      FieldName = 'selected'
      ProviderFlags = []
    end
    object dtChildDSDesigner: TDateTimeField
      FieldName = #24037#20316#26085#26399
      ReadOnly = True
    end
    object dtChildDSDesigner2: TDateTimeField
      FieldName = #24320#22987#26102#38388
      ReadOnly = True
    end
    object dtChildDSDesigner3: TDateTimeField
      FieldName = #32467#26463#26102#38388
      ReadOnly = True
    end
    object dtChildDSDesigner4: TStringField
      FieldName = #38599#21592#20195#30721
      ReadOnly = True
      Size = 10
    end
    object dtChildDSDesigner5: TStringField
      FieldName = #38599#21592
      ReadOnly = True
      Size = 16
    end
    object dtChildWork_ptr: TIntegerField
      FieldName = 'Work_ptr'
      ReadOnly = True
    end
  end
end
