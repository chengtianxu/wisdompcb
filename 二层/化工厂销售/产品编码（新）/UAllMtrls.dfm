object frmAllMtrls: TfrmAllMtrls
  Left = 494
  Top = 121
  Width = 956
  Height = 535
  Caption = #25152#26377#29289#26009
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 948
    Height = 504
    Align = alClient
    TabOrder = 0
    object pnl2: TPanel
      Left = 1
      Top = 1
      Width = 946
      Height = 40
      Align = alTop
      TabOrder = 0
      object lbl2: TLabel
        Left = 496
        Top = 12
        Width = 52
        Height = 13
        Caption = #20135#21697#32534#30721
      end
      object lbl3: TLabel
        Left = 731
        Top = 12
        Width = 52
        Height = 13
        Caption = #20135#21697#21517#31216
      end
      object lbl_field: TLabel
        Left = 252
        Top = 17
        Width = 47
        Height = 13
        Caption = 'BOM'#21517#31216
      end
      object edt_PCode: TEdit
        Left = 549
        Top = 8
        Width = 170
        Height = 20
        Color = clScrollBar
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object edt_PName: TEdit
        Left = 785
        Top = 8
        Width = 115
        Height = 20
        Color = clScrollBar
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object btn_exit: TButton
        Left = 8
        Top = 2
        Width = 53
        Height = 31
        Caption = #20851#38381
        TabOrder = 2
        OnClick = btn_exitClick
      end
      object btn_refresh: TButton
        Left = 62
        Top = 2
        Width = 51
        Height = 32
        Caption = #21047#26032
        TabOrder = 3
        OnClick = btn_refreshClick
      end
      object btn_Export1: TBitBtn
        Left = 116
        Top = 2
        Width = 62
        Height = 31
        Hint = #23548#20986#24403#21069'BOM'
        Caption = #23548#20986
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = btn_Export1Click
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000120B0000120B00001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DADADADADADA
          DADAADADADADADADADADDADADADADAD00000000000000006666007777777706E
          EF0AA0E6666606EEF0ADDA0E66606EEF060AADA0E606EEF0000DDADA006EEF0A
          DADAADAD06EEF00DADADDAD06EEF0670DADAAD06EEF0E6670DADD06EEF0A0E66
          70DA0FFFF0ADA0EEEE0D00000ADADA00000AADADADADADADADAD}
      end
      object edt_value: TEdit
        Left = 306
        Top = 12
        Width = 140
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnChange = edt_valueChange
      end
    end
    object pnl3: TPanel
      Left = 1
      Top = 41
      Width = 946
      Height = 462
      Align = alClient
      TabOrder = 1
      object pgc1: TPageControl
        Left = 1
        Top = 1
        Width = 944
        Height = 460
        ActivePage = ts1
        Align = alClient
        TabOrder = 0
        OnChange = pgc1Change
        object ts1: TTabSheet
          Caption = #29289#26009#26126#32454
          object eh495Detail: TDBGridEh
            Left = 0
            Top = 0
            Width = 936
            Height = 432
            Align = alClient
            DataSource = ds495_detail
            FooterColor = clWindow
            FooterFont.Charset = DEFAULT_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -13
            FooterFont.Name = #23435#20307
            FooterFont.Style = []
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            OnKeyDown = eh495KeyDown
            OnTitleClick = eh495DetailTitleClick
            Columns = <
              item
                EditButtons = <>
                FieldName = 'part_name'
                Footers = <>
                Title.Caption = 'BOM'#21517#31216
                Width = 134
              end
              item
                EditButtons = <>
                FieldName = 'inv_part_number'
                Footers = <>
                Title.Caption = #29289#26009#32534#30721
                Width = 141
              end
              item
                EditButtons = <>
                FieldName = 'INV_NAME'
                Footers = <>
                Title.Caption = #29289#26009#21517#31216
                Width = 159
              end
              item
                EditButtons = <>
                FieldName = 'INV_PART_DESCRIPTION'
                Footers = <>
                Title.Caption = #35268#26684
                Width = 278
              end
              item
                EditButtons = <>
                FieldName = 'quantity'
                Footers = <>
                Title.Caption = #29992#37327
                Width = 77
              end
              item
                EditButtons = <>
                FieldName = 'UNIT_NAME'
                Footers = <>
                Title.Caption = #21333#20301
                Width = 54
              end>
          end
        end
        object ts2: TTabSheet
          Caption = #29289#26009#27719#24635
          ImageIndex = 1
          object eh495: TDBGridEh
            Left = 0
            Top = 0
            Width = 936
            Height = 432
            Align = alClient
            DataSource = ds495
            FooterColor = clWindow
            FooterFont.Charset = DEFAULT_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -13
            FooterFont.Name = #23435#20307
            FooterFont.Style = []
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            OnKeyDown = eh495KeyDown
            OnTitleClick = eh495TitleClick
            Columns = <
              item
                EditButtons = <>
                FieldName = 'inv_part_number'
                Footers = <>
                Title.Caption = #29289#26009#32534#30721
                Width = 161
              end
              item
                EditButtons = <>
                FieldName = 'INV_NAME'
                Footers = <>
                Title.Caption = #29289#26009#21517#31216
                Width = 130
              end
              item
                EditButtons = <>
                FieldName = 'INV_PART_DESCRIPTION'
                Footers = <>
                Title.Caption = #29289#26009#35268#26684
                Width = 374
              end
              item
                EditButtons = <>
                FieldName = 'UNIT_NAME'
                Footers = <>
                Title.Caption = #21333#20301
                Width = 49
              end
              item
                EditButtons = <>
                FieldName = 'quantity'
                Footers = <>
                Title.Caption = #38656#27714#37327
                Width = 88
              end>
          end
        end
      end
    end
  end
  object qry495: TADOQuery
    Connection = DM.ADOCon
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        ' with bomlist(parentptr,ior,rk08,rk140, rk148,quantity,repl_invt' +
        '_ptr) as '
      
        '(select  a.part_ptr,b.invent_or,b.invent_ptr as rk08 ,a.rkey as ' +
        'rk140,b.rkey as rk148,b.quan_bom  as quantity,b.repl_invt_ptr '
      'from data0140 as a join  '
      'data0148 as b  on a.rkey =b.part_ptr '
      'where  a.part_ptr=13128 '
      'union all    '
      
        'select  a.part_ptr,b.invent_or,b.invent_ptr,a.rkey as rk140,b.rk' +
        'ey as rk148, b.quan_bom*e.quantity as quan_bom ,b.repl_invt_ptr '
      'from data0140 as a                        '
      'join data0148 as b  on a.rkey=b.part_ptr   '
      'join  bomlist e on e.rk08= a.part_ptr  '
      'where  e.ior=1 and a.status=1)     '
      
        'select d17.inv_part_number,d17.INV_NAME,d17.INV_PART_DESCRIPTION' +
        ', d02.UNIT_NAME,sum(a.quantity)quantity '
      'from   bomlist a     '
      'inner join data0017 d17 on  a.rk08=d17.rkey    '
      'inner join data0002 d02 on d17.stock_unit_ptr=d02.rkey '
      'where  a.ior=0'
      
        'group by  d17.inv_part_number,d17.INV_NAME,d17.INV_PART_DESCRIPT' +
        'ION, d02.UNIT_NAME ')
    Left = 720
    Top = 152
    object qry495inv_part_number: TStringField
      FieldName = 'inv_part_number'
      Size = 25
    end
    object qry495INV_NAME: TStringField
      FieldName = 'INV_NAME'
      Size = 30
    end
    object qry495INV_PART_DESCRIPTION: TStringField
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object qry495UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object qry495quantity: TFloatField
      FieldName = 'quantity'
      ReadOnly = True
    end
  end
  object ds495: TDataSource
    DataSet = qry495
    Left = 760
    Top = 152
  end
  object qry495_detail: TADOQuery
    Connection = DM.ADOCon
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        ' select a.part_name, d17.inv_part_number,d17.INV_NAME,d17.INV_PA' +
        'RT_DESCRIPTION, d02.UNIT_NAME, b.QUAN_BOM  as quantity '
      ' from  wzcp0494 a             '
      ' inner join wzcp0495 b on a.rkey=b.partBOm_ptr  '
      ' inner join data0017 d17 on  b.INVENT_PTR=d17.rkey     '
      ' inner join data0002 d02 on d17.stock_unit_ptr=d02.rkey   '
      '  where a.status=1 and  a.part_ptr= '#39#39)
    Left = 128
    Top = 304
    object qry495_detailpart_name: TStringField
      FieldName = 'part_name'
      Size = 30
    end
    object qry495_detailinv_part_number: TStringField
      FieldName = 'inv_part_number'
      Size = 25
    end
    object qry495_detailINV_NAME: TStringField
      FieldName = 'INV_NAME'
      Size = 30
    end
    object qry495_detailINV_PART_DESCRIPTION: TStringField
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object qry495_detailUNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object qry495_detailquantity: TBCDField
      FieldName = 'quantity'
      Precision = 16
    end
  end
  object ds495_detail: TDataSource
    DataSet = qry495_detail
    Left = 216
    Top = 296
  end
end
