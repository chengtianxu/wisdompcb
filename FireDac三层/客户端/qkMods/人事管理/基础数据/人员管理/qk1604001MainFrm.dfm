inherited frmqk1604001MainFrm: Tfrmqk1604001MainFrm
  Caption = 'frmqk1604001MainFrm'
  ClientHeight = 572
  ClientWidth = 1058
  ExplicitWidth = 1074
  ExplicitHeight = 611
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlbase: TPanel
    Width = 1058
    Height = 572
    ExplicitWidth = 1058
    ExplicitHeight = 572
    object spl1: TSplitter [0]
      Left = 681
      Top = 1
      Width = 25
      Height = 570
      ExplicitLeft = 409
      ExplicitTop = 26
    end
    inherited pnlbaseforGrid: TPanel
      Width = 680
      Height = 570
      Align = alLeft
      ExplicitWidth = 680
      ExplicitHeight = 570
      inherited pnlbaseGrid: TPanel
        Width = 509
        Height = 544
        ExplicitWidth = 348
        ExplicitHeight = 544
        inherited eh1: TDBGridEh
          Width = 507
          Height = 542
          PopupMenu = pm1
          OnDrawColumnCell = eh1DrawColumnCell
        end
      end
      inherited pnlTop: TPanel
        Width = 678
        ExplicitWidth = 517
        inherited lblModID: TLabel
          Left = 621
          ExplicitLeft = 460
        end
        inherited pnlFilter: TPanel
          Left = 153
          ExplicitLeft = 153
        end
        inherited pnlTopTool: TPanel
          Width = 152
          ExplicitWidth = 152
          inherited btnDisplay: TRzBitBtn
            Visible = False
          end
          inherited btnWhere: TRzBitBtn
            Visible = False
          end
          inherited btnExportXls: TRzBitBtn
            Visible = False
          end
        end
      end
      inherited pnlWhere: TPanel
        Height = 544
        ExplicitHeight = 544
      end
    end
    object pnlPeop: TPanel
      Left = 706
      Top = 1
      Width = 351
      Height = 570
      Align = alClient
      Color = clWhite
      TabOrder = 1
      ExplicitLeft = 545
      ExplicitWidth = 512
    end
  end
  object mteh1: TMemTableEh
    CachedUpdates = True
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    SortOrder = 'SeqNo asc'
    StoreDefs = True
    TreeList.DefaultNodeExpanded = True
    AfterScroll = mteh1AfterScroll
    Left = 400
    Top = 456
  end
  object pm1: TPopupMenu
    OnPopup = pm1Popup
    Left = 320
    Top = 120
    object mniDept: TMenuItem
      Caption = #37096#38376
      object mniNewDept: TMenuItem
        Tag = 101
        Caption = #26032#22686#21516#32423
        OnClick = mniNewDeptClick
      end
      object mniNewChildDept: TMenuItem
        Tag = 102
        Caption = #26032#22686#19979#32423
        OnClick = mniNewChildDeptClick
      end
      object mniEditDept: TMenuItem
        Tag = 103
        Caption = #32534#36753#24403#21069
        OnClick = mniEditDeptClick
      end
      object mniN10: TMenuItem
        Caption = '-'
      end
      object mniDeleDept: TMenuItem
        Tag = 104
        Caption = #21024#38500#37096#38376
        OnClick = mniDeleDeptClick
      end
    end
    object mniWork: TMenuItem
      Caption = #23703#20301
      object mniNewWork: TMenuItem
        Tag = 105
        Caption = #26032#24314#23703#20301
        OnClick = mniNewWorkClick
      end
      object mniEditWork: TMenuItem
        Tag = 106
        Caption = #32534#36753#23703#20301
        OnClick = mniEditDeptClick
      end
      object mniSetErpRight: TMenuItem
        Tag = 107
        Caption = #35774#32622'ERP'#26435#38480
        OnClick = mniSetErpRightClick
      end
      object mniN12: TMenuItem
        Caption = '-'
      end
      object mniDeleWork: TMenuItem
        Tag = 108
        Caption = #21024#38500#23703#20301
        OnClick = mniDeleDeptClick
      end
    end
    object mniN1: TMenuItem
      Caption = #20154#21592
      object mniNewPeop: TMenuItem
        Tag = 109
        Caption = #26032#22686#20154#21592
        OnClick = mniNewPeopClick
      end
    end
  end
  object il1: TImageList
    Left = 528
    Top = 264
    Bitmap = {
      494C010103000400740010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C600B5B5B500A5A5A5009C9C9C00A5A5
      A500B5B5B500000000000000000000000000000000000000000000000000C6C6
      C600C6C6C600BDBDBD00B5B5B500B5B5B500B5B5B500B5B5B500BDBDBD00BDBD
      BD00C6C6C600C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C9C940094633900A56B4200A56B4200A56B42009C6B
      4200A56B4200735A4A00BDBDBD00000000000000000000000000C6C6C600ADAD
      AD00949494006B6B6B004A4A4A0042424200424242004A4A4A00636363008C8C
      8C0094949400B5B5B500C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BDBDBD00BDBDBD009C6B4A009C6331009C6331009C633100A56B42009C5A
      3100945A29007B5231007B6B6300000000000000000000000000BDBDBD005A42
      3100947352008C7352008C7352007B5A4200846B4A00846B4A00846B4A008463
      42005239290094949400C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADADAD0000000000393939005A5A
      5A000000000000000000BDBDBD00949494003139390073737300B5B5B500C6C6
      C6000000000000000000000000000000000000000000C6C6C600ADADAD004A5A
      5A0039525200394A3900A56B39009C5A3100A5633100A5632900BDA58C00A563
      31009C633100845229007B5A4200000000000000000000000000636363008C73
      520094735A00947B5A00947B5A00846B5200A58C73008C73520084634A008463
      4A007B6342004A4A4A00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADADAD0000000000F7F7F700ADAD
      AD006B6B6B0039424A00526B7B00849CB5007394AD007B94B500738CA5004A63
      730031424A0039424200848484000000000000000000A5A5A50029736B000063
      5A0000635A0000635200B57B4A00AD6B3100B56B3100B5734200EFE7DE00AD6B
      3100A56331009C63310084736B000000000000000000000000007B7B7B00947B
      5A009C7B63009C846300A5846B00A5948400CEBDAD0094735200F7F7EF008C6B
      4A008C6B4A0063636300C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADADAD0000000000F7F7F700949C
      9C00637B9400738CA5007394A50063849C00425A6B005263730039424A00424A
      52004A525A00525A6300293139000000000000000000315A5A0000524A00086B
      5A00086B6300006B63009C633100AD6B3100BD845200B59C8400B5B5B5009C63
      3900A5633100AD734A0000000000000000000000000000000000000000007363
      5A00A5846B00AD8C7300A58C6B00FFFFFF00FFFFFF009C8463009C7B63009473
      5A0042312900C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADADAD0000000000FFFFFF00A5A5
      A50094ADC6009CB5CE0094ADBD007B8CA500849CB5008CA5B50063738400C6C6
      C600000000000000000000000000000000000000000039635A00006B5A00086B
      630008736B0008736B0000736B00AD6B39003184AD0039A5E70039A5E700299C
      DE008C634A00B5B5B5000000000000000000000000000000000000000000C6C6
      C600524A4200C6AD94008C735A00000010000000080063524200947363003129
      2100BDBDBD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADADAD0000000800FFFFFF00ADA5
      A500B5C6DE00BDCEE700BDCEE700BDD6E700D6E7EF00DEE7F7006B7B8400C6C6
      C60000000000000000000000000000000000000000008C8C8C00218473000873
      6B000873630008635A0008635A0000739400319CE70042A5E70042A5E7002194
      DE00319CE7000000000000000000000000000000000000000000000000000000
      0000000000006B6B6B001073D6000831630008315A00105AAD0052525200C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADADAD0018181800ADADAD007B7B
      7B00848C8C00B5B5B500B5B5B500ADADAD00737B7B007B7B7B00000000000000
      000000000000000000000000000000000000000000000000000021525200187B
      730008526300185A8C00185A84002994D6005AADE7007BC6EF0073BDEF0042A5
      E70039A5E700C6C6C60000000000000000000000000000000000000000000000
      0000C6C6C60021314A001073CE0008427B0008427B00106BC60018294200B5B5
      B500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000842
      6300186B9C00186B9C0010639400298CCE0063B5EF009CD6F70084C6EF004AAD
      E70039A5E7000000000000000000000000000000000000000000000000000000
      0000C6C6C60008294A00187BD600187BCE00187BCE001873D60000213900B5B5
      B500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002973
      A5003184B500398CC600297BB500106B9C0063BDEF006BB5EF0063B5EF0039A5
      E700297BB5000000000000000000000000000000000000000000000000000000
      000000000000081010002184E700218CEF00218CE700187BDE0000000800BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000317B
      B5004294CE005AADE700398CC600186BA50018639400318CCE00319CDE00527B
      9400000000000000000000000000000000000000000000000000000000000000
      000000000000292929000000000000000000000000000000000029292900C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002163
      9400318CBD004294CE003184BD00186B9C00526B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600216394003184B5002973A500315A73000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000737373007373730000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      000000000000000000000000FFFFFF00FFFFFFFFFFFF0000FFFFFE07E0030000
      FFFFFC01C0010000FFFFF001C00100000C0F8001C001000000018001C0010000
      00018003E0030000000F8003E0070000000F8007F80F0000003FC003F00F0000
      FFFFE007F00F0000FFFFE007F80F0000FFFFE00FF80F0000FFFFE07FFC1F0000
      FFFFE0FFFE7F0000FFFFFFFFFFFF000000000000000000000000000000000000
      000000000000}
  end
end
