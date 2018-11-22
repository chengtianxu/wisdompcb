unit TagReadFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ExtCtrls, ComCtrls, DM, Grids, DBGridEh, DB,
  ADODB;

type
  TCustomType = (
    ctHW,//华为技术
    ctHWZD,//华为终端
    ctCDHW,//成都华为
    ctHWAJX,//华为安捷信
    ctMRMT,//明锐明泰
    //ctSAMSUNG,//三星
    //ctGreatWall,//长城
    ctCLS,//创力仕
    ctZXKX,//中兴康讯
    ctHS,//海思半导体
    ctDH,//大华
    ctDYH,//大运河
    ctHQ,//华勤
    ctWT,//闻泰
    ctTCL,//TCL
    ctUnknow//其他
  );

  TfrmTagRead = class(TForm)
    pm1: TPopupMenu;
    N2: TMenuItem;
    N1: TMenuItem;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    sg1: TStringGrid;
    pnl1: TPanel;
    mmo1: TMemo;
    lv1: TListView;
    N3: TMenuItem;
    pnl2: TPanel;
    lbl1: TLabel;
    pb1: TProgressBar;
    qry1: TADOQuery;
    N5: TMenuItem;
    N6: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sg1DrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure pm1Popup(Sender: TObject);
  private
    { Private declarations }
//    procedure FillListWithBarInfo(ARow: Integer;ABar: TBarInfo);
    procedure GetPackInfo(ARow: integer; APackID: string);
  public
    { Public declarations }
  end;

  TStrRecord = class
  public
    BarInfo: TBarInfo;
    Count: Integer;//箱数
    function IsEqualWithOutCOunt(ADest: TStrRecord): Boolean;
  end;

  procedure ShowFrmTagRead(AOwner: TComponent);

implementation

uses
  ComObj, WZ_gUnit, DateUtils, InOutFrm, InOutHisFrm;

{$R *.dfm}


function GetCustType(ACustCode: string): TCustomType;
{
  华为：1806(深圳),6169(东莞),0040(梅州)
  华为终端：1915(深圳),6005(东莞),0035(梅州),5249(梅州) ，2627(深圳)，7072(东莞)
  明泰明锐(友讯):2104(深圳),2109(深圳)
  成都华为: 1219(深圳),0138(梅州)
  华为安捷信: G1011(深圳)
  长城开发:1202 已经失效
  创力仕:1901
  三星:1850,1992,2157,2158  已经失效
  海思半导体: S2258,2258,2516
  中兴康讯：2303,2156(深圳), (0275,0276,0257,1001 梅州) ,(7053 东莞)
  大华：2390, 2622
  闻泰：6259东莞
  大运河：7100东莞,7101东莞
  华勤：6095东莞,6109东莞
  TCL：6298东莞
}
begin
  if StrInArr(ACustCode,['1806','6169','0040']) then Result := ctHW else
  if StrInArr(ACustCode,['1915','6005','0035','5249','2627','7072']) then Result := ctHWZD else
  if StrInArr(ACustCode,['2104','2109']) then Result := ctMRMT else
  if StrInArr(ACustCode,['1219','0138']) then Result := ctCDHW else
  if StrInArr(ACustCode,['G1011']) then Result := ctHWAJX else
  //if StrInArr(ACustCode,['1202']) then Result := ctGreatWall else
  if StrInArr(ACustCode,['1901']) then Result := ctCLS else
  //if StrInArr(ACustCode,['1850','1992','2157','2158']) then Result := ctSAMSUNG else
  if StrInArr(ACustCode,['2303','0275','0276','0257','2156','1001','7053']) then Result := ctZXKX else
  if StrInArr(ACustCode,['S2258','2258','2516']) then Result := ctHS else
  if StrInArr(ACustCode,['2390','2622']) then Result := ctDH else
  //
  if StrInArr(ACustCode,['6259']) then Result := ctWT else
  if StrInArr(ACustCode,['7100','7101']) then Result := ctDYH else
  if StrInArr(ACustCode,['6095','6109']) then Result := ctHQ else
  if StrInArr(ACustCode,['6298']) then Result := ctTCL else
  Result := ctUnknow;
end;

function ExtractTimeWithZQ(AZQ: string): TDateTime;
var
  tmpWeek: Integer;
  Y: string;

begin
  Y := '20'+ Copy(AZQ,1,2) + '-01-01';
  tmpWeek := StrToInt(Copy(AZQ,3,2));
  Result := StartOfAWeek(YearOf(gStrToDateTime(Y)),tmpWeek);
  Result := IncDay(Result,-1);//星期日为开始
end;

procedure ShowFrmTagRead(AOwner: TComponent);
var
  LFrm: TfrmTagRead;
begin
  LFrm := TfrmTagRead.Create(AOwner);
  try
    LFrm.ShowModal;
  finally
    FreeAndNil(LFrm);
  end;
end;

procedure TfrmTagRead.N2Click(Sender: TObject);
var
  LRow,LCol: Integer;
  XLApp:Variant;
  Sheet:Variant;
//  I: Integer;
//  LRkey698,Lid699: string;
begin
//  for I := 0 to mmo1.Lines.Count - 1 do
//  begin
//    if Trim(mmo1.Lines[I]) = '' then Continue;
//    LRkey698 := Copy(mmo1.Lines[I],1,Pos('-',mmo1.Lines[I])-1);
//    Lid699 := Copy(mmo1.Lines[I],Pos('-',mmo1.Lines[I])+1,Length(mmo1.Lines[I]) - Pos('-',mmo1.Lines[I]));
//    dm1.SqlOpen(DM1.qry1,'select 1 from data0405 where rkey698 = ' + IntToStr(StrToIntdef(LRkey698,0)) + ' and id699 = ' + IntToStr(StrToIntDef(Lid699,0)));
//    if dm1.qry1.IsEmpty then
//    begin
//      ShowMessage(mmo1.Lines[I] + ' 不在库存记录中,请先进行入库操作在导出!');
//      Exit;
//    end;
//  end;

  Screen.Cursor:=crHourGlass;
  if not VarIsEmpty(XLApp) then
  begin
    XLApp.DisplayAlerts:=False;
    XLApp.Quit;
    VarClear(XLApp);
  end;

  try
    XLApp:=CreateOleObject('Excel.Application');
  except
    Screen.Cursor:=crDefault;
    Exit;
  end;

  XLApp.WorkBooks.Add;
  XLApp.SheetsInNewWorkbook := 1;

  XLApp.WorkBooks[1].WorkSheets[1].Name := '条形码导出';
  Sheet := XLApp.Workbooks[1].WorkSheets['条形码导出'];

  for LCol := 0 to sg1.ColCount - 1 do
    for LRow := 0 to sg1.RowCount - 1 do
      Sheet.Cells[LRow+1,LCol+1] := sg1.Cells[LCol,LRow];

  XlApp.Visible := True;
  Screen.Cursor := crDefault;
end;

procedure TfrmTagRead.FormShow(Sender: TObject);
begin
  with sg1 do
  begin
    Cells[0,0] := '供应商代码';
    Cells[1,0] := '客户型号';
    Cells[2,0] := '版本';
    Cells[3,0] := '订单号';
    Cells[4,0] := '生产周期';
    Cells[5,0] := '数量';
    Cells[6,0] := '箱数';
    Cells[7,0] := '本厂编号';
    Cells[8,0] := '条形码';
    Cells[9,0] := '附加字段1';
    Cells[10,0] := '附加信息2';
    Cells[11,0] := '备注';
    Cells[12,0] := '唯一标识';
    Cells[13,0] := '作业单号';
    Cells[14,0] := '打印时间';
    Cells[15,0] := '标签打印人'

  end;
  mmo1.SetFocus;
end;

procedure TfrmTagRead.N1Click(Sender: TObject);
  function GetMemoValueLineCount(Ammo: TMemo): Integer;
  var
    I: Integer;
  begin
    Result := 0;
    for I := 0 to Ammo.Lines.Count - 1 do
      if Length(Trim(Ammo.Lines[I])) > 0 then
        Inc(Result,1);
  end;
var
  I: Integer;
  BarCode: string;
  n: Integer;
begin
  n := 1;
  try
    //if not dm1.Open699 then Exit;
    
    N1.Enabled := False;
    N2.Enabled := False;
    N3.Enabled := False;
    pb1.Max := GetMemoValueLineCount(mmo1);
    pb1.Position := 0;
    sg1.RowCount := GetMemoValueLineCount(mmo1) + 1;

    for I := 0 to mmo1.Lines.Count - 1 do
    begin
      BarCode := mmo1.Lines[I];
      if BarCode = '' then Continue;
      Application.ProcessMessages;
      pb1.Position := pb1.Position + 1;
      lbl1.Caption := '解析数： ' + IntToStr(pb1.Position) + ' / ' + IntToStr(pb1.Max);
      //FillListWithBarInfo(n,dm1.GetBarInfo(BarCode));
      GetPackInfo(n,BarCode);
      Inc(n);
    end;
  finally
    N1.Enabled := True;
    N2.Enabled := True;
    N3.Enabled := True;
  end;
end;

procedure TfrmTagRead.sg1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  if{ (sg1.Objects[5,ARow] = Pointer(clRed)) and } (Pos(';',sg1.Cells[3,ARow]) >0 ) then
  begin
    with sg1.Canvas do
    begin
      Font.Color := clRed;
      Brush.Color := clMoneyGreen;
      FillRect(Rect);
      TextOut(Rect.Left+2,Rect.Top+2,sg1.Cells[ACol,ARow]);
    end;
  end;
end;

procedure TfrmTagRead.N4Click(Sender: TObject);
var
  I: Integer;
  XLApp:Variant;
  Sheet:Variant;

  OPDG: TOpenDialog;
  FileName: string;
  LItem: TListItem;
begin
  OPDG := TOpenDialog.Create(Self);
  try
    OPDG.Filter := '*.xls';
    if OPDG.Execute and (OPDG.FileName <> '') then
      FileName := OPDG.FileName
    else
      Exit;
  finally
    OPDG.Free;
  end;

  Screen.Cursor:=crHourGlass;
  if not VarIsEmpty(XLApp) then
  begin
    XLApp.DisplayAlerts:=False;
    XLApp.Quit;
    VarClear(XLApp);
  end;

  try
    XLApp:=CreateOleObject('Excel.Application');
  except
    Screen.Cursor:=crDefault;
    Exit;
  end;

  XLApp.WorkBooks.Open(FileName);
  Sheet := XLApp.Workbooks[1].WorkSheets[1];

  for I := 2 to Sheet.UsedRange.rows.Count do
  begin
    LItem := lv1.Items.Add;
    with LItem do
    begin
      Caption := Sheet.Cells[I,1];
      SubItems.Add(Sheet.Cells[I,2]);
      SubItems.Add(Sheet.Cells[I,3]);
      SubItems.Add(Sheet.Cells[I,4]);
    end;
  end;

  XLApp.Quit;
  VarClear(XLApp);
  Screen.Cursor := crDefault;
end;

procedure TfrmTagRead.N3Click(Sender: TObject);
  function IsAddInList(var ALst: TList; AStr: TStrRecord): Boolean;
  var
    I: Integer;
    LStr: TStrRecord;
  begin
    Result := False;
    if ALst.Count = 0 then
    begin
      ALst.Add(AStr);
      Result := True;
      Exit;
    end;
    
    for I := 0 to ALst.Count - 1 do
    begin
      LStr := TStrRecord(ALst.Items[I]);
      if LStr.IsEqualWithOutCOunt(AStr) then
      begin
        LStr.Count := LStr.Count + AStr.Count;
        Exit;
      end;  
    end;
    
    ALst.Add(AStr);
    Result := True;
  end;
var
  I: Integer;
  LS: TList;
  StrC: TStrRecord;
begin
  LS := TList.Create;
  try
    for I := 1 to sg1.RowCount - 1 do
    begin
      StrC := TStrRecord.Create;
      with StrC do
      begin
        BarInfo.GongYingShangCode := sg1.Cells[0,I];
        BarInfo.HWCode := sg1.Cells[1,I];
        BarInfo.Ver := sg1.Cells[2,I];
        BarInfo.VPO := sg1.Cells[3,I];
        BarInfo.LotNum := sg1.Cells[4,I];
        BarInfo.Qty := StrToIntDef(sg1.Cells[5,I],0);
        Count := StrToIntDef(sg1.Cells[6,I],0);
        BarInfo.MANU_PART_NUMBER := sg1.Cells[7,I];
        BarInfo.BarCode := sg1.Cells[8,I];
        BarInfo.Param1 := sg1.Cells[9,I];
        BarInfo.addinfo := sg1.Cells[10,I];
      end;
      if not IsAddInList(LS,StrC) then StrC.Free;
    end;

    sg1.RowCount := LS.Count + 1;
    for I := 0 to LS.Count - 1 do
    begin
      StrC := TStrRecord(LS.Items[I]);
      sg1.Cells[0,I+1] := StrC.BarInfo.GongYingShangCode;
      sg1.Cells[1,I+1] := StrC.BarInfo.HWCode;
      sg1.Cells[2,I+1] := StrC.BarInfo.Ver;
      sg1.Cells[3,I+1] := StrC.BarInfo.VPO;
      sg1.Cells[4,I+1] := StrC.BarInfo.LotNum;
      sg1.Cells[5,I+1] := IntToStr(StrC.BarInfo.Qty);
      if StrC.Count = 0 then
        sg1.Cells[6,I+1] := ''
      else
        sg1.Cells[6,I+1] := IntToStr(StrC.Count);
      sg1.Cells[7,I+1] := StrC.BarInfo.MANU_PART_NUMBER;
      sg1.Cells[8,I+1] := StrC.BarInfo.BarCode;
      sg1.Cells[9,I+1] := StrC.BarInfo.Param1;
      sg1.Cells[10,I+1] := StrC.BarInfo.addinfo;
    end;

  finally
    for I := 0 to LS.Count - 1 do
      TStrRecord(LS.Items[I]).Free;
    LS.Free;
  end;

end;

{ TStrRecord }

function TStrRecord.IsEqualWithOutCOunt(ADest: TStrRecord): Boolean;
begin
  Result := False;
  while True do
  begin
    if BarInfo.GongYingShangCode <> ADest.BarInfo.GongYingShangCode then Break;
    if BarInfo.HWCode <> ADest.BarInfo.HWCode then Break;
    if BarInfo.Ver <> ADest.BarInfo.Ver then Break;
    if BarInfo.Qty <> ADest.BarInfo.Qty then Break;
    if BarInfo.LotNum <> ADest.BarInfo.LotNum then Break;
    if BarInfo.VPO <> ADest.BarInfo.VPO then Break;
    if BarInfo.MANU_PART_NUMBER <> ADest.BarInfo.MANU_PART_NUMBER then Break;
    if BarInfo.addinfo <> ADest.BarInfo.addinfo then Break;
    Result := True;
    Break;
  end;
end;


//procedure TfrmTagRead.FillListWithBarInfo(ARow: Integer; ABar: TBarInfo);
//begin
//  with sg1,ABar do
//  begin
//    Cells[0,ARow] := GongYingShangCode;
//    Cells[1,ARow] := HWCode;
//    if Ver <> '' then
//      Cells[2,ARow] := 'VER.' + Ver[Length(Ver)];
//    Cells[3,ARow] := VPO;
//    Cells[4,ARow] := LotNum;
//    Cells[5,ARow] := IntToStr(Qty);
//    Cells[6,ARow] := '1';
//    Cells[7,ARow] := ABar.MANU_PART_NUMBER;
//    Cells[8,ARow] := ABar.BarCode;
//    Cells[9,ARow] := ABar.Param1;
//  end;
//end;



procedure TfrmTagRead.GetPackInfo(ARow: integer; APackID: string);
var
  rkey698,order699: string;
  lsql: string;
  i: Integer;
  addInfo: string;
  FCust: TCustomType;
begin
  for I := 0 to sg1.ColCount - 1 do sg1.Cells[I,ARow] := '';
  rkey698 := Copy(APackID,1,Pos('-',APackID)-1);
  order699 := Copy(APackID,Pos('-',APackID)+1,Length(APackID)-Pos('-',APackID)+1);
  lsql := ' select d05.EMPLOYEE_NAME, d699.MANU_PART_NUMBER,d699.param1, d699.MANU_PART_DESC, d699.ANALYSIS_CODE_2, d699.PO_NUMBER, d699.description, d699.code ' +
          ' , d699.barcode_id,d699.qty, d699.lotno, d699.notes,  d698.pack_number, d698.so_ptr, d698.v_date, d698.empl_ptr ' +
          ' , d698.type, d698.surface, d698.netWeight, d698.grossWeight, d698.caseSpec, d60.SALES_ORDER , d698.notes as notes698' +
          ' , d10.cust_code, d10_2.cust_code as origcust,d698.notes,d06.work_order_number ' +
          ' from data0699 d699 inner join data0698 d698 on d699.pack_ptr = d698.rkey ' +
          ' inner join data0060 d60 on d60.rkey = d698.so_ptr ' +
          ' inner join data0010 d10 on d60.CUSTOMER_PTR = d10.rkey ' +
          ' left join data0025 d25 on d25.manu_part_number = d699.manu_part_number ' +
          ' left join data0010 d10_2 on d10_2.abbr_name = d25.ORIG_CUSTOMER ' +
          ' left join data0006 d06 on d06.rkey = d699.wo_ptr ' +
          ' left join data0005 d05 on d05.rkey = d698.empl_ptr' +
          ' where d699.pack_ptr = ' + rkey698 + ' and d699.order_no = ' + order699;
  if dm1.SqlOpen(qry1,lsql) then
  begin
    if qry1.IsEmpty then
    begin
      sg1.Cells[0,ARow] := APackID;
      sg1.Cells[1,ARow] := '没有该条码信息';
    end else
    begin
      if qry1.FieldByName('origcust').AsString <> '' then
      begin
        FCust := GetCustType(qry1.fieldbyname('origcust').AsString);
      end else
      begin
        FCust := GetCustType(qry1.fieldbyname('cust_code').AsString);
      end;    
      sg1.Cells[0,ARow] := qry1.FieldByName('code').AsString;
      sg1.Cells[1,ARow] := qry1.FieldByName('MANU_PART_DESC').AsString;
      if (FCust = ctHWZD) or (FCust = ctHW) then
      begin
        if qry1.FieldByName('ANALYSIS_CODE_2').AsString <> '' then
          sg1.Cells[2,ARow] := 'VER.' + qry1.FieldByName('ANALYSIS_CODE_2').AsString[Length(qry1.FieldByName('ANALYSIS_CODE_2').AsString)];
      end else
        sg1.Cells[2,ARow] := qry1.FieldByName('ANALYSIS_CODE_2').AsString;
      sg1.Cells[3,ARow] := qry1.FieldByName('PO_NUMBER').AsString;
      sg1.Cells[4,ARow] := qry1.FieldByName('lotno').AsString;
      sg1.Cells[5,ARow] := qry1.FieldByName('qty').asstring;
      sg1.Cells[6,ARow] := '1';
      sg1.Cells[7,ARow] := qry1.FieldByName('MANU_PART_NUMBER').AsString;
      sg1.Cells[8,ARow] := qry1.FieldByName('barcode_id').AsString;
      sg1.Cells[9,ARow] := qry1.FieldByName('Param1').AsString;

      if FCust =  ctzxkx then
      begin
//        addInfo := '生产日期:' + FormatDateTime('YYYY-MM-DD',ExtractTimeWithZQ(qry1.fieldbyname('lotno').AsString));
//        if Pos('@',qry1.FieldByName('notes698').AsString) > 0 then
//          addInfo := addInfo + ';烘烤日期:' + Copy(qry1.FieldByName('notes698').AsString,Pos('@', qry1.FieldByName('notes698').AsString)+1,10)
//        else
//          addInfo := addInfo + ';烘烤日期:';
//        if Pos('单叉板', qry1.FieldByName('notes698').AsString) > 0 then
//          addInfo := addInfo + ';' + '单叉板';
//        if Pos('双叉板', qry1.FieldByName('notes698').AsString) > 0 then
//          addInfo := addInfo + ';' + '双叉板';
      end;
      sg1.Cells[10,ARow] := qry1.FieldByName('notes698').AsString;
      //sg1.Cells[11,ARow] := qry1.fieldbyname('v_date').AsString;
      sg1.Cells[11,ARow] := qry1.fieldbyname('notes').AsString;
      sg1.Cells[12,ARow] := APackID;
      sg1.Cells[13,ARow] := qry1.fieldbyname('work_order_number').AsString;
      sg1.Cells[14,ARow] := qry1.fieldbyname('v_date').AsString;
      sg1.Cells[15,ARow] := qry1.fieldbyname('EMPLOYEE_NAME').AsString;
    end;
  end else
  begin
      sg1.Cells[0,ARow] := APackID;
      sg1.Cells[1,ARow] := '没有该条码信息';
  end;
end;

procedure TfrmTagRead.N5Click(Sender: TObject);
var
  I: Integer;
  LNowTime: TDateTime;
  LRkey698,Lid699: string;
begin
  frmInOut := TfrmInOut.Create(Self);
  try
    if frmInOut.ShowModal = mrok then
    begin
      if frmInOut.rg1.ItemIndex = 0 then  //入库
      begin
        dm1.con1.BeginTrans;
        try
          dm1.SqlOpen(dm1.qry1,'select getdate() as nowdatetime');
          LNowTime := dm1.qry1.fieldbyname('nowdatetime').AsDateTime;

          for I := 0 to mmo1.Lines.Count - 1 do
          begin
            if Trim(mmo1.Lines[I]) = '' then Continue;
            LRkey698 := Copy(mmo1.Lines[I],1,Pos('-',mmo1.Lines[I])-1);
            Lid699 := Copy(mmo1.Lines[I],Pos('-',mmo1.Lines[I])+1,Length(mmo1.Lines[I]) - Pos('-',mmo1.Lines[I]));
            dm1.SqlOpen(dm1.qry1,'select * from data0405 where rkey698 = ' + LRkey698 + ' and id699 = ' + Lid699);
            if not dm1.qry1.IsEmpty then
            begin
              dm1.qry1.Edit;
              dm1.qry1.FieldByName('inuser').AsString := gUser.User_Ptr;
              dm1.qry1.FieldByName('indatetime').AsDateTime := LNowTime;
              dm1.qry1.FieldByName('place').AsString := frmInOut.edt1.Text;
              dm1.qry1.FieldByName('status').AsInteger := 0;
              dm1.qry1.Post;
              Continue;
            end;
            dm1.SqlOpen(DM1.qry1,'select * from data0405 where rkey = -1');

            dm1.qry1.Append;
            dm1.qry1.FieldByName('rkey698').AsInteger := StrToIntDef(LRkey698,0);
            dm1.qry1.FieldByName('id699').AsInteger := StrToIntDef(Lid699,0);
            dm1.qry1.FieldByName('inuser').AsString := gUser.User_Ptr;
            dm1.qry1.FieldByName('indatetime').AsDateTime := LNowTime;
            dm1.qry1.FieldByName('place').AsString := frmInOut.edt1.Text;
            dm1.qry1.FieldByName('barid').AsString := LRkey698 + '-' + Lid699;
            dm1.qry1.Post;
          end;
          dm1.con1.CommitTrans;
          ShowMessage('保存成功');
        except
          on e: Exception do
          begin
            if dm1.con1.InTransaction then dm1.con1.RollbackTrans;
            ShowMessage('请勿插入重复记录保存失败' + e.Message);
          end;



        end;
      end else
      begin
        dm1.SqlOpen(dm1.qry1,'select getdate() as nowdatetime');
        LNowTime := dm1.qry1.fieldbyname('nowdatetime').AsDateTime;
        dm1.con1.BeginTrans;
        try
          for I := 0 to mmo1.Lines.Count - 1 do
          begin
            if Trim(mmo1.Lines[I]) = '' then Continue;
            LRkey698 := Copy(mmo1.Lines[I],1,Pos('-',mmo1.Lines[I])-1);
            Lid699 := Copy(mmo1.Lines[I],Pos('-',mmo1.Lines[I])+1,Length(mmo1.Lines[I]) - Pos('-',mmo1.Lines[I]));
            dm1.SqlOpen(DM1.qry1,'select * from data0405 where rkey698 = ' + IntToStr(StrToIntdef(LRkey698,0)) + ' and id699 = ' + IntToStr(StrToIntDef(Lid699,0)));
            if dm1.qry1.IsEmpty then
            begin
              ShowMessage(mmo1.Lines[I] + ' 不在库存记录中，本箱出库失败!');
              Continue;
            end;
            dm1.qry1.Edit;
            dm1.qry1.FieldByName('outuser').AsString := gUser.User_Ptr;
            dm1.qry1.FieldByName('outdatetime').AsDateTime := LNowTime;
            dm1.qry1.FieldByName('status').AsInteger := 1;
            dm1.qry1.Post;
          end;
          dm1.con1.CommitTrans;
          ShowMessage('保存成功');
        except
          if dm1.con1.InTransaction then dm1.con1.RollbackTrans;
          ShowMessage('保存失败');
        end;
      end;
    end;
  finally
    if dm1.con1.InTransaction then dm1.con1.RollbackTrans;
    frmInOut.Free;
  end;
end;

procedure TfrmTagRead.N6Click(Sender: TObject);
var
  LFrm: TfrmInOutHis;
begin
  LFrm := TfrmInOutHis.Create(Self);
  try
    LFrm.ShowModal;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmTagRead.pm1Popup(Sender: TObject);
begin
  N5.Visible := (gUser.User_Permit = '2') or (gUser.User_Permit = '4');
end;

end.
