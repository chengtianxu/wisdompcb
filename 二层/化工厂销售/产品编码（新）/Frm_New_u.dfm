object Frm_New: TFrm_New
  Left = 365
  Top = 344
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #26032#36141#21407#26448#26009
  ClientHeight = 265
  ClientWidth = 458
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 37
    Top = 65
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #26448#26009#32534#30721':'
  end
  object Label2: TLabel
    Left = 30
    Top = 93
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#26448#26009#21517#31216':'
  end
  object Label3: TLabel
    Left = 31
    Top = 21
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#26448#26009#31867#21035':'
  end
  object Label4: TLabel
    Left = 30
    Top = 146
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#23384#36135#21333#20301':'
  end
  object Label5: TLabel
    Left = 30
    Top = 177
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#37319#36141#21333#20301':'
  end
  object Label7: TLabel
    Left = 225
    Top = 19
    Width = 7
    Height = 13
  end
  object Label8: TLabel
    Left = 224
    Top = 146
    Width = 21
    Height = 13
    Caption = '   '
  end
  object Label9: TLabel
    Left = 224
    Top = 177
    Width = 28
    Height = 13
    Caption = '    '
  end
  object ctype: TLabel
    Left = 109
    Top = 44
    Width = 75
    Height = 13
    AutoSize = False
  end
  object Label12: TLabel
    Left = 30
    Top = 118
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#26448#26009#35268#26684':'
  end
  object Edit1: TEdit
    Left = 105
    Top = 16
    Width = 83
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Edit1Click
    OnExit = Edit1Exit
  end
  object Edit2: TEdit
    Left = 104
    Top = 142
    Width = 83
    Height = 21
    Enabled = False
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = Edit2Click
    OnExit = Edit2Exit
  end
  object Edit3: TEdit
    Left = 104
    Top = 173
    Width = 83
    Height = 21
    Enabled = False
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = Edit3Click
    OnExit = Edit3Exit
  end
  object BitBtn1: TBitBtn
    Left = 193
    Top = 15
    Width = 25
    Height = 25
    TabOrder = 0
    TabStop = False
    OnClick = BitBtn1Click
    Glyph.Data = {
      EE000000424DEE000000000000007600000028000000100000000F0000000100
      04000000000078000000130B0000130B00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      888800000888880000080F000888880F00080F000888880F0008000000080000
      000800F000000F00000800F000800F00000800F000800F000008800000000000
      0088880F00080F000888880000080000088888800088800088888880F08880F0
      888888800088800088888888888888888888}
  end
  object BitBtn2: TBitBtn
    Left = 192
    Top = 141
    Width = 25
    Height = 25
    Enabled = False
    TabOrder = 3
    TabStop = False
    OnClick = BitBtn2Click
    Glyph.Data = {
      EE000000424DEE000000000000007600000028000000100000000F0000000100
      04000000000078000000130B0000130B00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      888800000888880000080F000888880F00080F000888880F0008000000080000
      000800F000000F00000800F000800F00000800F000800F000008800000000000
      0088880F00080F000888880000080000088888800088800088888880F08880F0
      888888800088800088888888888888888888}
  end
  object BitBtn3: TBitBtn
    Left = 192
    Top = 172
    Width = 25
    Height = 25
    Enabled = False
    TabOrder = 5
    TabStop = False
    OnClick = BitBtn3Click
    Glyph.Data = {
      EE000000424DEE000000000000007600000028000000100000000F0000000100
      04000000000078000000130B0000130B00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      888800000888880000080F000888880F00080F000888880F0008000000080000
      000800F000000F00000800F000800F00000800F000800F000008800000000000
      0088880F00080F000888880000080000088888800088800088888880F08880F0
      888888800088800088888888888888888888}
  end
  object BtnOk: TButton
    Left = 163
    Top = 232
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 7
    OnClick = BtnOkClick
  end
  object Button2: TButton
    Left = 243
    Top = 231
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 8
    OnClick = Button2Click
  end
  object MaskEdit1: TMaskEdit
    Left = 104
    Top = 61
    Width = 238
    Height = 21
    Enabled = False
    MaxLength = 25
    TabOrder = 2
  end
  object Edit4: TEdit
    Left = 104
    Top = 115
    Width = 241
    Height = 21
    Enabled = False
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    MaxLength = 70
    ParentFont = False
    TabOrder = 9
    OnClick = Edit2Click
    OnExit = Edit2Exit
  end
  object Edit5: TEdit
    Left = 104
    Top = 88
    Width = 191
    Height = 21
    Enabled = False
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    MaxLength = 30
    ParentFont = False
    TabOrder = 10
    OnClick = Edit2Click
    OnExit = Edit2Exit
  end
  object qrytemp: TADOQuery
    Connection = DM.ADOCon
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      
        'if not exists ( SELECT   Data0496.RKEY, Data0496.GROUP_NAME, dat' +
        'a0496.if_flag,'
      
        '         Data0496.GROUP_DESC, Data0496.ttype, data0496.mask_inv_' +
        'number,'
      '         Data0019.inv_group_name,Data0019.inv_group_desc'
      'FROM     Data0019 INNER JOIN'
      '         Data0496 ON Data0019.rkey = Data0496.group_ptr'
      
        'where    GROUP_PTR  in (select rkey from data0019 where inv_grou' +
        'p_name='#39'vwj'#39' )'
      ' ) '
      'begin'
      
        ' SELECT  top 1    Data0496.RKEY, Data0496.GROUP_NAME, data0496.i' +
        'f_flag,'
      
        '         Data0496.GROUP_DESC, Data0496.ttype, data0496.mask_inv_' +
        'number,'
      '         Data0019.inv_group_name,Data0019.inv_group_desc'
      'FROM     Data0019 INNER JOIN'
      '         Data0496 ON Data0019.rkey = Data0496.group_ptr'
      'end'
      'else'
      'begin'
      
        'SELECT  top 1  Data0496.RKEY, Data0496.GROUP_NAME, data0496.if_f' +
        'lag,'
      
        '         Data0496.GROUP_DESC, Data0496.ttype, data0496.mask_inv_' +
        'number,'
      '         Data0019.inv_group_name,Data0019.inv_group_desc'
      'FROM     Data0019 INNER JOIN'
      '         Data0496 ON Data0019.rkey = Data0496.group_ptr'
      
        'where    GROUP_PTR  in (select rkey from data0019 where inv_grou' +
        'p_name='#39'vwj'#39' )'
      'order by  data0496.group_name'
      'end')
    Left = 419
    Top = 46
  end
end
