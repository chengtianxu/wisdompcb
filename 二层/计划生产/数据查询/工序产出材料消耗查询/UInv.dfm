object Inv_Form: TInv_Form
  Left = 242
  Top = 150
  Width = 706
  Height = 514
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #36873#25321#26448#26009#20195#30721
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
    Width = 698
    Height = 441
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 696
      Height = 437
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = DataSource1
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      VertScrollBar.VisibleMode = sbNeverShowEh
      OnKeyDown = DBGridEh1KeyDown
      Columns = <
        item
          Checkboxes = True
          EditButtons = <>
          FieldName = 'isSel'
          Footers = <>
          Title.Caption = #36873#25321
        end
        item
          EditButtons = <>
          FieldName = 'INV_PART_NUMBER'
          Footers = <>
          Title.Caption = #26448#26009#20195#30721
        end
        item
          EditButtons = <>
          FieldName = 'INV_PART_DESCRIPTION'
          Footers = <>
          Title.Caption = #26448#26009#21517#31216
          Width = 351
        end
        item
          EditButtons = <>
          FieldName = 'UNIT_NAME'
          Footers = <>
          Title.Caption = #21333#20301
          Width = 76
        end
        item
          EditButtons = <>
          FieldName = 'group_id'
          Footers = <>
          Title.Caption = #32452#21035
          Width = 41
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 441
    Width = 698
    Height = 45
    Align = alTop
    TabOrder = 1
    DesignSize = (
      698
      45)
    object CheckBox1: TCheckBox
      Left = 16
      Top = 16
      Width = 52
      Height = 14
      Caption = #20840#36873
      TabOrder = 0
      OnClick = CheckBox1Click
    end
    object BitBtn3: TBitBtn
      Left = 391
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akTop]
      Cancel = True
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
    object BitBtn2: TBitBtn
      Left = 209
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #30830#23450
      TabOrder = 2
      OnClick = BitBtn2Click
    end
    object BitBtn1: TBitBtn
      Left = 209
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 3
      Visible = False
    end
  end
  object ADO136: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    AfterOpen = ADO136AfterOpen
    Parameters = <>
    SQL.Strings = (
      'SELECT   cast (0 as bit)as isSel,'
      '         dbo.Data0017.RKEY, '
      '         dbo.Data0017.INV_PART_NUMBER, '
      '         dbo.Data0017.INV_PART_DESCRIPTION, '
      '         dbo.Data0002.UNIT_NAME,'
      '         dbo.Data0015.WAREHOUSE_CODE, '
      '         dbo.Data0034.DEPT_CODE,'
      '         dbo.DATA0136.group_id,'
      '         dbo.DATA0136.stan_consume'
      
        'FROM     dbo.Data0017 INNER JOIN dbo.Data0002 ON dbo.Data0017.ST' +
        'OCK_UNIT_PTR = dbo.Data0002.RKEY INNER JOIN '
      
        '         dbo.DATA0136 ON dbo.Data0017.RKEY = dbo.DATA0136.invt_p' +
        'tr INNER JOIN '
      
        '         dbo.Data0015 ON dbo.DATA0136.warehouse_ptr = dbo.Data00' +
        '15.RKEY INNER JOIN '
      
        '         dbo.Data0034 ON dbo.DATA0136.dept_ptr = dbo.Data0034.RK' +
        'EY '
      'WHERE'
      '(1=1) '
      ''
      '')
    Left = 552
    Top = 24
    object ADO136RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO136INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      ReadOnly = True
      Size = 25
    end
    object ADO136INV_PART_DESCRIPTION: TStringField
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object ADO136UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
      ReadOnly = True
    end
    object ADO136WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      ReadOnly = True
      Size = 5
    end
    object ADO136DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      ReadOnly = True
      Size = 10
    end
    object ADO136isSel: TBooleanField
      FieldName = 'isSel'
    end
    object ADO136group_id: TWordField
      FieldName = 'group_id'
    end
    object ADO136stan_consume: TBCDField
      FieldName = 'stan_consume'
      Precision = 8
      Size = 2
    end
  end
  object DataSource1: TDataSource
    DataSet = CDS136
    Left = 424
    Top = 24
  end
  object CDS136: TClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <>
    Left = 488
    Top = 24
  end
  object DSP136: TDataSetProvider
    DataSet = ADO136
    Left = 520
    Top = 24
  end
end
