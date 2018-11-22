unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Menus, DB, ADODB,
  DBGridEh, ComCtrls ,StrUtils;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    btnRefresh: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    sgrid1: TStringGrid;
    pgc1: TPageControl;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    eh1: TDBGridEh;
    eh2: TDBGridEh;
    btnModiyWeight: TBitBtn;
    pnl1: TPanel;
    lbl1: TLabel;
    cbb1: TComboBox;
    dtp1: TDateTimePicker;
    lbl2: TLabel;
    dtp2: TDateTimePicker;
    ts1: TTabSheet;
    eh0: TDBGridEh;
    pnl2: TPanel;
    edtFilter251Sum: TLabeledEdit;
    pnl3: TPanel;
    edtFilter25: TLabeledEdit;
    edtFilter251: TLabeledEdit;
    ads25: TADODataSet;
    ds25: TDataSource;
    ds251: TDataSource;
    ads251: TADODataSet;
    ds251Sum: TDataSource;
    ads251Sum: TADODataSet;
    ads25MANU_PART_NUMBER: TStringField;
    ads25MANU_PART_DESC: TStringField;
    ads25rkey25: TAutoIncField;
    ads25OnLinePCS: TFloatField;
    ads25OnLinePnl: TIntegerField;
    ads25ABBR_NAME: TStringField;
    ads25CUST_CODE: TStringField;
    ads25ORIG_CUSTOMER: TStringField;
    ads251manu_part_number: TStringField;
    ads251manu_part_desc: TStringField;
    ads251REPORT_UNIT_VALUE1: TBCDField;
    ads251WORK_ORDER_NUMBER: TStringField;
    ads251ctime: TDateTimeField;
    ads251cpcs: TIntegerField;
    ads251cpnl: TIntegerField;
    ads251cuser: TStringField;
    ads251ABBR_NAME: TStringField;
    ads251sales_order: TStringField;
    ads251PO_NUMBER: TStringField;
    ads251ouser: TStringField;
    ads251otime: TDateTimeField;
    ads251status: TIntegerField;
    ads251BKNote: TStringField;
    ads251rkey251: TAutoIncField;
    ads251rkey60: TIntegerField;
    ads251wo_ptr: TIntegerField;
    pm1: TPopupMenu;
    nPost: TMenuItem;
    nN4: TMenuItem;
    nUnDoPost: TMenuItem;
    ads25REPORT_UNIT_VALUE1: TBCDField;
    ts2: TTabSheet;
    ads06: TADODataSet;
    ds06: TDataSource;
    pnl4: TPanel;
    edt06Filter: TLabeledEdit;
    eh3: TDBGridEh;
    ads06MANU_PART_NUMBER: TStringField;
    ads06MANU_PART_DESC: TStringField;
    ads06WORK_ORDER_NUMBER: TStringField;
    ads06QTY_BACKLOG: TFloatField;
    ads06PANELS: TIntegerField;
    ads06rkey06: TIntegerField;
    ads06rkey56: TIntegerField;
    ads06PARTS_PER_PANEL: TFloatField;
    ads06ABBR_NAME: TStringField;
    ads06CUST_CODE: TStringField;
    ads06ORIG_CUSTOMER: TStringField;
    ads06rkey60: TIntegerField;
    ads06cust_po: TStringField;
    ads06SALES_ORDER: TStringField;
    ads06FLOW_NO: TSmallintField;
    ads06cut_no: TStringField;
    ads06INTIME: TDateTimeField;
    strngfldads251ZhouQi: TStringField;
    intgrfldads06Panel_A_B: TIntegerField;
    wrdfldads06wtype06: TWordField;
    smlntfldads06wtype56: TSmallintField;
    mniOKFast: TMenuItem;
    mniOkNomal: TMenuItem;
    mniWeiShuNomal: TMenuItem;
    intgrfldads06rkey25: TIntegerField;
    ads25auth_Storage: TBooleanField;
    ads06bom_ptr: TIntegerField;
    ads25PWeight: TBCDField;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure n1Click(Sender: TObject);
    procedure cbb1Change(Sender: TObject);
    procedure eh0KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnRefreshClick(Sender: TObject);
    procedure eh0TitleClick(Column: TColumnEh);
    procedure edtFilter25Change(Sender: TObject);
    procedure nPostClick(Sender: TObject);
    procedure btnModiyWeightClick(Sender: TObject);
    procedure pm1Popup(Sender: TObject);
    procedure nUnDoPostClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure mniOKFastClick(Sender: TObject);
  private
    { Private declarations }
    FHotColumn0,FHotColumn1,FHotColumn2,FHotColumn3: TColumnEh;
    FMainSql0,FMainSql1,FMainSql2,FMainSql3:string;
    FWhere: string;
  public
    { Public declarations }
    procedure Get25Data;
    procedure Get251Data;
    procedure GetSum251Data;
    procedure Get06Data;
    function PostToStock(AWO_ptr,APO_Ptr,APCS,APNL: Integer; AWeight: Single; ABZ: string): Boolean;
  end;

var
  frmMain: TfrmMain;

implementation

uses DM, DateUtils, ModifyUnitWeight_U, WZ_gUnit, PostFrm, Post06, FastPostFrm;

{$R *.dfm}

procedure TfrmMain.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  pgc1.ActivePageIndex := 1;
  dtp1.DateTime := IncDay(dm1.GetServerDatetime,-7);
  dtp2.DateTime := dm1.GetServerDatetime;

  FMainSql0 := ads25.CommandText;
  FMainSql1 := ads251.CommandText;
  FMainSql2 := ads251Sum.CommandText;
  FMainSql3 := ads06.CommandText;

  Get25Data;
  Get251Data;
  GetSum251Data;
  Get06Data;

  FHotColumn0 := eh0.Columns[0];
  FHotColumn1 := eh1.Columns[0];
  FHotColumn2 := eh2.Columns[0];
  FHotColumn3 := eh3.Columns[0];

end;

procedure TfrmMain.n1Click(Sender: TObject);

begin
  if dm1.IS_Stock_Inventorying then
  begin
    ShowMessage('在线产品正在盘点,当前不能提交入库');
    Exit;
  end;
  if (gUser.User_Permit = '1') or (gUser.User_Permit = '3') then
  begin
    ShowMessage('你只有检查权限，不能更改数数据！！');
    Exit;
  end;
//  if dm1.SqlOpen('select 1 from data0006 where wtype in(2,4) and RKEY = ' + dm1.adsWOrkey06.AsString) then
//  begin
//    if not dm1.qrytmp.IsEmpty then
//    begin
//      ShowMessage('作业单状态为待返工或待报废！暂不允许提交入库');
//      Exit;
//    end;
//  end;
//  if dm1.SqlOpen('select 1 from data0006 where wtype in(2,4) and from_wo_ptr = ' + dm1.adsWOrkey06.AsString) then
//  begin
//    if not dm1.qrytmp.IsEmpty then
//    begin
//      ShowMessage('存在待返工或待报废的子作业单！暂不允许提交入库');
//      Exit;
//    end;
//  end;

//  LSql := ' select 1 from data0006 ' +
//          ' inner join data0492 on data0006.CUT_NO=data0492.CUT_NO ' +
//          ' inner join data0414 on data0492.mrb_ptr=data0414.rkey ' +
//          ' inner join data0415 on data0414.d415_ptr=data0415.rkey ' +
//          ' inner join data0098 on data0415.rma_ptr=data0098.rkey ' +
//          ' where data0006.rkey= '+dm1.adsWOrkey06.AsString;
//  if dm1.SqlOpen(LSql) then
//  begin
//    if not dm1.qrytmp.IsEmpty then
//    begin
//      LSql := 'select confirm_pack from data0492 d492 inner join data0006 d06 on ' +
//              ' d06.CUT_NO = d492.CUT_NO where d06.rkey = ' + dm1.adsWO.fieldbyname('rkey06').AsString;
//      if dm1.SqlOpen(LSql) then
//      begin
//        if not dm1.qrytmp.IsEmpty then
//        begin
//          if dm1.qrytmp.FieldByName('confirm_pack').AsInteger = 0 then
//          begin
//            ShowMessage('退货返工作业单还未确认包装入库,请先让品质部确认!');
//            exit;
//          end;
//        end;
//      end;
//    end;
//  end;

end;

procedure TfrmMain.Get251Data;
begin
  ads251.Close;
  ads251.CommandText := FMainSql1 + FWhere +
    ' ORDER BY d25.MANU_PART_NUMBER, d25.MANU_PART_DESC, d06.WORK_ORDER_NUMBER ';
  ads251.Parameters.ParamByName('P1').Value := cbb1.ItemIndex;
  ads251.Parameters.ParamByName('t1').Value := DateOf(dtp1.Date);
  ads251.Parameters.ParamByName('t2').Value := IncSecond(DateOf(dtp2.Date),86399);
  ads251.Open;
end;

procedure TfrmMain.cbb1Change(Sender: TObject);
begin
  Get251Data;
end;


function TfrmMain.PostToStock(AWO_ptr, APO_Ptr, APCS, APNL: Integer;
  AWeight: Single; ABZ: string): Boolean;
var
  LSql: string;
  LNowDateTime: TDateTime;
  LOldWeight: Single;
  LPO_Number: string;
  LRkey25: Integer;
begin
  Result := False;
  
  if dm1.IS_Stock_Inventorying then
  begin
    ShowMessage('在线产品正在盘点,当前不能提交入库');
    Exit;
  end;

  try
    LNowDateTime := dm1.GetServerDatetime;

    //251表插入
    LSql := 'select * from data0251 where rkey = -1';
    if dm1.SqlOpen(LSql) then
    begin
      dm1.qrytmp.Append;
      dm1.qrytmp.FieldByName('wo_ptr').AsInteger := AWO_ptr;
      if APO_Ptr > 0 then
        dm1.qrytmp.FieldByName('po_ptr').AsInteger := APO_Ptr;
      dm1.qrytmp.FieldByName('ctime').AsDateTime := LNowDateTime;
      dm1.qrytmp.FieldByName('cuser_ptr').AsString := gUser.User_Ptr;
      dm1.qrytmp.FieldByName('cpcs').AsInteger := APCS;
      dm1.qrytmp.FieldByName('cpnl').AsInteger := APNL;
      dm1.qrytmp.FieldByName('status').AsInteger := 0;
      dm1.qrytmp.FieldByName('BKNote').AsString := ABZ;
      dm1.qrytmp.Post;
    end;

    //56表操作
    if APO_Ptr > 0 then
    begin
      LSql := 'select PO_Number from data0097 where rkey = (select PURCHASE_ORDER_PTR from data0060 where rkey = ' + IntToStr(APO_Ptr) + ')';
      if dm1.SqlOpen(LSql) then
      begin
        if not dm1.qrytmp.IsEmpty then
        begin
          LPO_Number := dm1.qrytmp.fieldbyname('PO_Number').AsString;
        end;
      end;     
    end;
    LSql := 'select * from data0056 where wo_ptr = ' + IntToStr(AWO_ptr);
    if dm1.SqlOpen(LSql) then
    begin
      dm1.qrytmp.Edit;
      dm1.qrytmp.FieldByName('TO_BE_STOCKED').AsInteger := dm1.qrytmp.FieldByName('TO_BE_STOCKED').AsInteger + APCS;
      dm1.qrytmp.FieldByName('TO_BE_CANCD').AsInteger := dm1.qrytmp.FieldByName('TO_BE_CANCD').AsInteger + APNL;
      dm1.qrytmp.FieldByName('QTY_BACKLOG').AsInteger := dm1.qrytmp.FieldByName('QTY_BACKLOG').AsInteger - APCS;
      dm1.qrytmp.FieldByName('PANELS').AsInteger := dm1.qrytmp.FieldByName('PANELS').AsInteger - APNL;
      dm1.qrytmp.FieldByName('employee_ptr').AsString := gUser.User_Ptr;
      dm1.qrytmp.FieldByName('tobestock_date').AsDateTime := LNowDateTime;
      dm1.qrytmp.FieldByName('REFERENCE').AsString := Trim(ABZ);
      dm1.qrytmp.FieldByName('PO_NUMBER').AsString := LPO_Number ;
      dm1.qrytmp.FieldByName('UNIT_PTR').AsInteger := APO_Ptr;
      dm1.qrytmp.Post;
    end;

    //60表操作
    if APO_Ptr > 0 then
    begin
      LSql := 'select * from data0060 where rkey = ' + IntToStr(APO_Ptr);
      if dm1.SqlOpen(LSql) then
      begin
        if not dm1.qrytmp.IsEmpty then
        begin
          dm1.qrytmp.Edit;
          dm1.qrytmp.FieldByName('REPUT_APPR_BY').AsInteger := dm1.qrytmp.FieldByName('REPUT_APPR_BY').AsInteger + APCS;
          dm1.qrytmp.Post;
        end;
      end;
    end;

    //产品重量
    LSql := 'select rkey,report_unit_value1 from data0025 where rkey= (select bom_ptr from data0006 where rkey = ' + IntToStr(AWO_ptr) + ')';
    if dm1.SqlOpen(LSql) then
    begin
      LRkey25 := dm1.qrytmp.fieldbyname('rkey').AsInteger;
      lOldWeight := dm1.qrytmp.fieldbyname('report_unit_value1').AsFloat;
      if Abs(dm1.qrytmp.FieldByName('report_unit_value1').AsFloat - AWeight) > 0.000001 then
      begin
        dm1.qrytmp.Edit;
        dm1.qrytmp.FieldByName('report_unit_value1').AsFloat := AWeight;
        dm1.qrytmp.Post;

        //更改产品重量写日志
        LSql := 'select * from data0318 where rkey = -1';
        if dm1.SqlOpen(LSql) then
        begin
          dm1.qrytmp.Append;
          dm1.qrytmp.FieldByName('CUSTOMER_PART_PTR').AsInteger := LRkey25;
          dm1.qrytmp.FieldByName('TRANS_TYPE').AsInteger := 25;
          dm1.qrytmp.FieldByName('TRANS_DESCRIPTION').AsString := '提交入库时变更产品单重';
          dm1.qrytmp.FieldByName('FROM_STRING').AsString := FloatToStr(LOldWeight);
          dm1.qrytmp.FieldByName('TO_STRING').AsString := floattostr(AWeight);
          dm1.qrytmp.FieldByName('USER_PTR').AsString := gUser.User_Ptr; 
          dm1.qrytmp.FieldByName('TRANS_DATE').AsDateTime := LNowDateTime;
          dm1.qrytmp.FieldByName('PROGRAM_SOURCE').AsInteger := 22;
          dm1.qrytmp.Post;
        end;
      end;
    end;
    Result := True;
  except
    on e: Exception do
    begin
      if dm1.con1.InTransaction then dm1.con1.RollbackTrans;
      Result := False;
      ShowMessage(e.Message);
    end;
  end;
end;


procedure TfrmMain.GetSum251Data;
begin
  ads251Sum.Close;
  ads251Sum.CommandText := FMainSql2 + FWhere +
      ' group by d25.manu_part_number,d25.manu_part_desc,d15.abbr_name,d97.po_number ' +
      ' having (sum(d251.cpcs) > 0) ' +
      ' order by d25.manu_part_number asc,d25.manu_part_desc asc ';
  ads251Sum.Open;
end;


procedure TfrmMain.Get25Data;
begin
  ads25.Close;
  ads25.CommandText := FMainSql0 + FWhere + ' order by d25.rkey asc ';
  ads25.Open;
end;

procedure TfrmMain.eh0KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Char(Key) = 'S') and (ssalt in Shift) then
  begin
    ShowMessage(TADODataSet(TDBGridEh(Sender).DataSource.DataSet).CommandText);
  end;
end;

procedure TfrmMain.btnRefreshClick(Sender: TObject);
begin
  ads25.Requery();
  ads251Sum.Requery();
  ads251.Requery();
  ads06.Requery();
  eh1.SumList.RecalcAll;
end;

procedure TfrmMain.eh0TitleClick(Column: TColumnEh);
begin
  case pgc1.ActivePageIndex of
    0:
    begin
      FHotColumn0 := Column;
      edtFilter25.EditLabel.Caption := FHotColumn0.Title.Caption;
    end;
    2:
    begin
      FHotColumn1 := Column;
      edtFilter251.EditLabel.Caption := FHotColumn1.Title.Caption;
    end;
    3:
    begin
      FHotColumn2 := Column;
      edtFilter251Sum.EditLabel.Caption := FHotColumn2.Title.Caption;
    end;
    1:
    begin
      FHotColumn3 := Column;
      edt06Filter.EditLabel.Caption := FHotColumn3.Title.Caption;
    end;
  end;

  if (Column.Title.SortMarker = smNoneEh) or (Column.Title.SortMarker = smDownEh) then
  begin
    TCustomAdoDataSet(Column.Field.DataSet).Sort :=Column.Field.FieldName+' ASC';
    Column.Title.SortMarker := smUpEh;
  end
  else
  if Column.Title.SortMarker = smUpEh then
  begin
    TCustomAdoDataSet(Column.Field.DataSet).Sort :=Column.Field.FieldName+' DESC';
    Column.Title.SortMarker := smDownEh;
  end ;

end;

procedure TfrmMain.edtFilter25Change(Sender: TObject);
var
  tmpstr,sFilter: string;
  DATASET: TCustomADoDATASET;
  LHotColumn: TColumnEh;
begin
  case pgc1.ActivePageIndex of
    0:
    begin
      LHotColumn := FHotColumn0;
    end;
    2:
    begin
      LHotColumn := FHotColumn1;
    end;
    3:
    begin
      LHotColumn := FHotColumn2;
    end;
    1:
    begin
      LHotColumn := FHotColumn3;
    end;
  else
    LHotColumn := FHotColumn0;
  end;

  DATASET := TCustomAdoDataSet(LHotColumn.Field.DataSet);
  if not DATASET.Active then Exit;
  tmpstr:= trim((Sender as TLabeledEdit).Text);
  if TmpStr='' then
  begin
    DATASET.Filtered:= False;
  end else
  begin
    if (LHotColumn.Field.DataType in [ftString,ftWideString,ftMemo]) then
    begin
      sFilter := '*'+uppercase(TmpStr)+'*';
      DATASET.Filter := LHotColumn.Field.FieldName+' Like '+ QuotedStr(sFilter);
      DATASET.Filtered:= true;
    end else
    if LHotColumn.Field.DataType in [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftBCD,ftLargeint] then
    begin
      try
        StrToFloat(tmpstr);
      except
        DATASET.Filtered := False;
        Exit;
      end;
      sFilter := LHotColumn.Field.FieldName+'>='+TmpStr;
      DATASET.Filter := sFilter;
      DATASET.Filtered:= true;
    end else
    if LHotColumn.Field.DataType in [ftDate, ftDateTime] then
    begin
      try
        tmpstr := FormatDateTime('YYYY-MM-DD hh:mm:ss',StrToDateTime(TmpStr));
      except
        Exit;
      end;
      sFilter := '>='+QuotedStr(TmpStr);
      DATASET.Filter := LHotColumn.Field.FieldName + sFilter;
      DATASET.Filtered:= true;
    end;
  end;
end;

procedure TfrmMain.nPostClick(Sender: TObject);
var
  LFrm2: TfrmPost06;
  LSql: string;
begin

  if dm1.IS_Stock_Inventorying then
  begin
    ShowMessage('在线产品正在盘点,当前不能提交入库');
    Exit;
  end;
  if (gUser.User_Permit = '1') or (gUser.User_Permit = '3') then
  begin
    ShowMessage('你只有检查权限，不能更改数数据！！');
    Exit;
  end;
  if pgc1.ActivePageIndex = 0 then
  begin
    ShowMessage('请使用按作业单提交入库');
    Exit;
//    LFrm := TfrmPost.Create(Self);
//    try
//      LFrm.FRkey25 := ads25.fieldbyname('rkey25').AsString;
//      LFrm.edtmanupart.Text := ads25.fieldbyname('manu_part_number').AsString;
//      LFrm.edtwight.Text := ads25.fieldbyname('REPORT_UNIT_VALUE1').AsString;
//      LFrm.FbWeiShu := (Sender as TMenuItem).Tag = 1;
//      if LFrm.ShowModal = mrok then
//      begin
//        BitBtn3Click(BitBtn3);
//      end;
//    finally
//      LFrm.Free;
//    end;
  end else
  if pgc1.ActivePageIndex = 1 then
  begin
    //w开头的工单进行判断
    if UpperCase(ads06.FieldByName('work_order_number').AsString[1]) = 'W' then
    begin
      LSql := 'select ppc_control3 from data0192';
      dm1.SqlOpen(LSql);
      if dm1.qrytmp.FieldByName('ppc_control3').AsInteger = 1 then
      begin
        LSql := ' SELECT d492.confirm_pack from data0006 d06 ' +
                ' INNER JOIN data0492 d492 on d06.CUT_NO = d492.CUT_NO ' +
                ' INNER JOIN data0414 d414 ON d414.rkey = d492.mrb_ptr ' +
                ' INNER JOIN data0415 d415 ON d414.d415_ptr = d415.rkey ' +
                ' INNER JOIN data0098 d98 ON d98.RKEY = d415.rma_ptr ' +
                ' WHERE d06.RKEY = ' + ads06.fieldbyname('rkey06').AsString;
        dm1.SqlOpen(LSql);
        if not dm1.qrytmp.IsEmpty then
        begin
          if dm1.qrytmp.FieldByName('confirm_pack').AsInteger <> 1 then
          begin
            ShowMessage('W 开头的工单入仓必须要品质确认才可以');
            Exit;
          end;
        end;
      end;
    end;

    LSql := 'select auth_Storage from data0025 where rkey = ' +  ads06.fieldbyname('bom_ptr').AsString ;
        dm1.SqlOpen(LSql);
        if not dm1.qrytmp.IsEmpty then
        begin
          if not dm1.qrytmp.FieldByName('auth_Storage').AsBoolean then
          begin
            ShowMessage('品质锁定，请解锁后才可以入库');
            Exit;
          end;
        end;



//    dm1.SqlOpen('select 1 from data0006 where wtype in(2,4) and from_wo_ptr = ' + ads06.fieldbyname('rkey06').AsString);
//    if not dm1.qrytmp.IsEmpty then
//    begin
//      ShowMessage('该工单存在待入库或待返工的子工单，不可以提交');
//      Exit;
//    end;
    LSql := ' SELECT d06.WORK_ORDER_NUMBER from data0006 d06 ' +
        ' INNER JOIN data0056 d56 ON d56.WO_PTR = d06.RKEY ' +
        ' WHERE d06.CUT_NO = ' + QuotedStr(ads06.fieldbyname('CUT_NO').AsString) + ' and d06.FLOW_NO = ' + ads06.fieldbyname('FLOW_NO').AsString +
        ' and D06.Panel_A_B='+ ads06.fieldbyName('Panel_A_B').AsString +
        ' and D06.wtype = '+ ads06.fieldbyName('wtype06').AsString+
        ' and D06.wtype<>3 '+
        ' and d56.wtype='+ads06.fieldbyName('wtype56').AsString+
        ' and d06.PROD_STATUS = 5' +
        ' and d06.WORK_ORDER_NUMBER < ' + QuotedStr(ads06.fieldbyname('WORK_ORDER_NUMBER').AsString) +
        ' and d56.QTY_BACKLOG > 0';
    dm1.SqlOpen(LSql);
    if not dm1.qrytmp.IsEmpty then
    begin
      ShowMessage('请按工单顺序先提交 ' + dm1.qrytmp.fieldbyname('WORK_ORDER_NUMBER').AsString);
      Exit;
    end;

    LFrm2 := TfrmPost06.Create(Self);
    try
      LFrm2.FRkey06 := ads06.fieldbyname('rkey06').AsString;
      LFrm2.FRkey60 := IntToStr(ads06.fieldbyname('rkey60').asinteger);
      LFrm2.cbxweishu.checked := (Sender as TMenuItem).Tag = 1;
      if LFrm2.ShowModal = mrok then
      begin
        ads06.Requery();
      end;
    finally
      LFrm2.Free;
    end;
  end;

end;

procedure TfrmMain.btnModiyWeightClick(Sender: TObject);
begin
  if pgc1.ActivePageIndex <> 0 then
  begin
    ShowMessage('只能在按本场编号提交页面使用');
    Exit;
  end;
  FrmModifyUnitWeight := TFrmModifyUnitWeight.Create(Self);
  FrmModifyUnitWeight.cbx1.Enabled := gUser.User_Permit = '4'; 
  // FrmModifyUnitWeight.user_ptr:=user_ptr;
  try
    if not ads25.IsEmpty then
    begin
      FrmModifyUnitWeight.edtManuPartNumber.Text := ads25.fieldbyname('manu_part_number').AsString;
      FrmModifyUnitWeight.edt_OPWeight.Text := ads25.fieldbyname('PWeight').AsString;
      FrmModifyUnitWeight.cbx1.Checked := ads25.FieldByName('auth_Storage').AsBoolean;
    end;
    FrmModifyUnitWeight.ShowModal;
  finally
    FrmModifyUnitWeight.Free;
  end;
end;

procedure TfrmMain.pm1Popup(Sender: TObject);
begin
  nPost.Visible := pgc1.ActivePageIndex in [0,1];
  mniOKFast.Visible := pgc1.ActivePageIndex in [0,1];
  //nWeiShuPost.Visible := pgc1.ActivePageIndex in [0,1];
  nUnDoPost.Visible := pgc1.ActivePageIndex = 2;

  nUnDoPost.Enabled := (ads251.FieldByName('status').AsInteger = 0) and (not ads251.IsEmpty)
                      and ((gUser.User_Permit = '2') or (gUser.User_Permit = '4'));
  if pgc1.ActivePageIndex = 0 then
  begin
    nPost.Enabled := (not ads25.IsEmpty) and ((gUser.User_Permit = '5') or (gUser.User_Permit = '2') or (gUser.User_Permit = '4')) and (ads25.FieldByName('OnLinePCS').AsInteger > 0);
  end else
  begin
    nPost.Enabled := (not ads06.IsEmpty) and ((gUser.User_Permit = '5') or (gUser.User_Permit = '2') or (gUser.User_Permit = '4')) and (ads06.FieldByName('QTY_BACKLOG').AsInteger > 0);
  end;
  mniOKFast.Enabled := nPost.Enabled;
//  nWeiShuPost.Enabled := nPost.Enabled;
end;

procedure TfrmMain.nUnDoPostClick(Sender: TObject);
var
  LSql: string;
  LNowTime: TDateTime;
begin
  if (gUser.User_Permit = '1') or (gUser.User_Permit = '3') then
  begin
    ShowMessage('你只有检查权限，不能更改数数据！！');
    Exit;
  end;

  LSql := 'select * from data0251 where rkey = ' + ads251.fieldbyname('rkey251').AsString + ' and status = 0';
  if dm1.SqlOpen(LSql) then
  begin
    if dm1.qrytmp.IsEmpty then
    begin
      ShowMessage('本条记录状态发生改变，操作失败，请刷新后继续');
      Exit;
    end;
  end;

  dm1.con1.BeginTrans;
  try
    LNowTime := dm1.GetServerDatetime;
    //251
    LSql := 'select * from data0251 where rkey =' + ads251.fieldbyname('rkey251').AsString;
    if dm1.SqlOpen(LSql) then
    begin
      dm1.qrytmp.Edit;
      dm1.qrytmp.FieldByName('ouser_ptr').AsString := gUser.User_Ptr;
      dm1.qrytmp.FieldByName('otime').AsDateTime := LNowTime;
      dm1.qrytmp.FieldByName('status').AsInteger := 2;
      dm1.qrytmp.Post;
    end else Exit;

    //56
    LSql := 'select * from data0056 where wo_ptr = ' + ads251.fieldbyname('wo_ptr').AsString;
    if dm1.SqlOpen(LSql) then
    begin
      dm1.qrytmp.Edit;
      dm1.qrytmp.FieldByName('TO_BE_STOCKED').AsInteger := dm1.qrytmp.FieldByName('TO_BE_STOCKED').AsInteger - ads251.fieldbyname('cpcs').AsInteger;
      dm1.qrytmp.FieldByName('TO_BE_CANCD').AsInteger := dm1.qrytmp.FieldByName('TO_BE_CANCD').AsInteger - ads251.fieldbyname('cpnl').AsInteger;;
      dm1.qrytmp.FieldByName('QTY_BACKLOG').AsInteger := dm1.qrytmp.FieldByName('QTY_BACKLOG').AsInteger + ads251.fieldbyname('cpcs').AsInteger;
      dm1.qrytmp.FieldByName('PANELS').AsInteger := dm1.qrytmp.FieldByName('PANELS').AsInteger + ads251.fieldbyname('cpnl').AsInteger;;
      dm1.qrytmp.Post;
    end else Exit;

    //60
    LSql := 'select REPUT_APPR_BY from data0060 where rkey = ' + IntToStr(ads251.fieldbyname('rkey60').AsInteger);
    if dm1.SqlOpen(LSql) then
    begin
      if not dm1.qrytmp.IsEmpty then
      begin
        dm1.qrytmp.Edit;
        dm1.qrytmp.FieldByName('REPUT_APPR_BY').AsInteger := dm1.qrytmp.FieldByName('REPUT_APPR_BY').AsInteger - ads251.fieldbyname('cpcs').AsInteger;;
        dm1.qrytmp.Post;
      end;
    end else Exit;
    
    dm1.con1.CommitTrans;
    btnRefreshClick(btnRefresh);
  finally
    if dm1.con1.InTransaction then
    begin
      dm1.con1.RollbackTrans;
      ShowMessage('操作失败');
    end;
  end;
end;

procedure TfrmMain.BitBtn2Click(Sender: TObject);
begin
  if pgc1.ActivePageIndex = 0 then
  begin
    if not ads25.IsEmpty then
    begin
      Export_dbGridEH_to_Excel(eh0,'可提交入库');
    end;
  end
  else if pgc1.ActivePageIndex = 2 then
  begin
    if not ads251.IsEmpty then
    begin
      Export_dbGridEH_to_Excel(eh1,'待入库明细');
    end;
  end
  else if pgc1.ActivePageIndex = 3 then
  begin
    if not ads251Sum.IsEmpty then
    begin
      Export_dbGridEH_to_Excel(eh2,'待入库汇总');
    end;
  end
  else if pgc1.ActivePageIndex = 1 then
  begin
    if not ads06.IsEmpty then
    begin
      Export_dbGridEH_to_Excel(eh3,'在线待入库');
    end;
  end;
end;

procedure TfrmMain.Get06Data;
begin
  ads06.Close;
  ads06.CommandText := FMainSql3 + FWhere + ' order by d06.WORK_ORDER_NUMBER asc ';
  ads06.open;
end;

procedure TfrmMain.mniOKFastClick(Sender: TObject);
var
  LFrm: TfrmFastPost;
  LSql: string;
begin


  if dm1.IS_Stock_Inventorying then
  begin
    ShowMessage('在线产品正在盘点,当前不能提交入库');
    Exit;
  end;
  if (gUser.User_Permit = '1') or (gUser.User_Permit = '3') then
  begin
    ShowMessage('你只有检查权限，不能更改数数据！！');
    Exit;
  end;

  if pgc1.ActivePageIndex = 0 then
  begin
  if not ads25.FieldByName('auth_Storage').AsBoolean then
  begin
    ShowMessage('品质锁定，请解锁后才可以入库');
    Exit;
  end;

    LFrm := TfrmFastPost.Create(Self);
    try
      LFrm.cds60.CreateDataSet;
      LFrm.FRkey25 := ads25.fieldbyname('rkey25').AsString;
      //LFrm.FNowrkey06 := ads06.fieldbyname('rkey06').AsString;
      LFrm.lblManu_part_number.Caption := ads25.fieldbyname('manu_part_number').AsString;
      //LFrm.lblwork_order_number.Caption := ads06.fieldbyname('work_order_number').AsString;
      LFrm.GetAll06By25(LFrm.FRkey25);
      while True do
      begin
        LFrm.FNowrkey06 := LFrm.GetNext06;
        if LFrm.FNowrkey06 = '' then Break;
        if LFrm.IS06CanPost(lfrm.FNowrkey06) then
        begin
          LFrm.GetData06(LFrm.FNowrkey06);
          LFrm.AutoFillPostNumByQty(LFrm.edtPostPcs.Text);
          Break;
        end;
      end;
//      if LFrm.FAll60Lst.IndexOf(ads06.fieldbyname('rkey06').AsString) <> -1 then
//      begin
//        LFrm.FAll60Lst.Delete(LFrm.FAll60Lst.IndexOf(ads06.fieldbyname('rkey06').AsString));
//      end;
      LFrm.ShowModal;
    finally
      LFrm.Free;
    end;
  end else
  if pgc1.ActivePageIndex = 1 then
  begin
    //w开头的工单进行判断
    if UpperCase(ads06.FieldByName('work_order_number').AsString[1]) = 'W' then
    begin
      LSql := 'select ppc_control3 from data0192';
      dm1.SqlOpen(LSql);
      if dm1.qrytmp.FieldByName('ppc_control3').AsInteger = 1 then
      begin
        LSql := ' SELECT d492.confirm_pack from data0006 d06 ' +
                ' INNER JOIN data0492 d492 on d06.CUT_NO = d492.CUT_NO ' +
                ' INNER JOIN data0414 d414 ON d414.rkey = d492.mrb_ptr ' +
                ' INNER JOIN data0415 d415 ON d414.d415_ptr = d415.rkey ' +
                ' INNER JOIN data0098 d98 ON d98.RKEY = d415.rma_ptr ' +
                ' WHERE d06.RKEY = ' + ads06.fieldbyname('rkey06').AsString;
        dm1.SqlOpen(LSql);
        if not dm1.qrytmp.IsEmpty then
        begin
          if dm1.qrytmp.FieldByName('confirm_pack').AsInteger <> 1 then
          begin
            ShowMessage('W 开头的工单入仓必须要品质确认才可以');
            Exit;
          end;
        end;
      end;
    end;


//    dm1.SqlOpen('select 1 from data0006 where wtype in(2,4) and from_wo_ptr = ' + ads06.fieldbyname('rkey06').AsString);
//    if not dm1.qrytmp.IsEmpty then
//    begin
//      ShowMessage('该工单存在待入库或待返工的子工单，不可以提交');
//      Exit;
//    end;
    LSql := ' SELECT d06.WORK_ORDER_NUMBER from data0006 d06 ' +
        ' INNER JOIN data0056 d56 ON d56.WO_PTR = d06.RKEY ' +
        ' WHERE d06.CUT_NO = ' + QuotedStr(ads06.fieldbyname('CUT_NO').AsString) + ' and d06.FLOW_NO = ' + ads06.fieldbyname('FLOW_NO').AsString +
        ' and D06.Panel_A_B='+ ads06.fieldbyName('Panel_A_B').AsString +
        ' and D06.wtype = '+ ads06.fieldbyName('wtype06').AsString+
        ' and D06.wtype<>3 '+
        ' and d56.wtype='+ads06.fieldbyName('wtype56').AsString+
        ' and d06.PROD_STATUS = 5' +
        ' and d06.WORK_ORDER_NUMBER < ' + QuotedStr(ads06.fieldbyname('WORK_ORDER_NUMBER').AsString) +
        ' and d56.QTY_BACKLOG > 0';
    dm1.SqlOpen(LSql);
    if not dm1.qrytmp.IsEmpty then
    begin
      ShowMessage('请按工单顺序先提交 ' + dm1.qrytmp.fieldbyname('WORK_ORDER_NUMBER').AsString);
      Exit;
    end;

    LFrm := TfrmFastPost.Create(Self);
    try
      LFrm.cds60.CreateDataSet;
      LFrm.FRkey25 := ads06.fieldbyname('rkey25').AsString;
      LFrm.FNowrkey06 := ads06.fieldbyname('rkey06').AsString;
      LFrm.lblManu_part_number.Caption := ads06.fieldbyname('manu_part_number').AsString;
      LFrm.lblwork_order_number.Caption := ads06.fieldbyname('work_order_number').AsString;
      LFrm.GetAll06By25(LFrm.FRkey25);
      if LFrm.FAll60Lst.IndexOf(ads06.fieldbyname('rkey06').AsString) <> -1 then
      begin
        LFrm.FAll60Lst.Delete(LFrm.FAll60Lst.IndexOf(ads06.fieldbyname('rkey06').AsString));
      end;
      LFrm.GetData06(ads06.fieldbyname('rkey06').AsString);
      lfrm.edtPostPcs.Text := IntToStr(LFrm.Get56PCSOnLine(ads06.fieldbyname('rkey06').AsString));
      LFrm.AutoFillPostNumByQty(LFrm.edtPostPcs.Text);
      LFrm.ShowModal;
    finally
      LFrm.Free;
    end;
  end;
  btnRefreshClick(btnRefresh);
end;

end.
