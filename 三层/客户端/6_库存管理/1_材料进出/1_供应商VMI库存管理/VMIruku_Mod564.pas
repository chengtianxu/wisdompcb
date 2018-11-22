unit VMIruku_Mod564;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,ubasemainfrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Vcl.ExtCtrls, Data.DB, Vcl.XPMan,
  Datasnap.DBClient, Vcl.Menus, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.StdCtrls, Vcl.Buttons,ucommfunc, Vcl.ComCtrls, PasReport_Mod564,
  EditRemark_Mod564, VMILogoCard_Mod564;

type
  TfrmVMIruku_Mod564 = class(TfrmBaseMain)
    Splitter1: TSplitter;
    DBGridEh1: TDBGridEh;
    cdsDetail: TClientDataSet;
    dsDetail: TDataSource;
    cds133: TClientDataSet;
    cds70: TClientDataSet;
    cds391: TClientDataSet;
    cds71: TClientDataSet;
    cds134: TClientDataSet;
    PO1: TMenuItem;
    PO2: TMenuItem;
    N6 : TMenuItem;
    N3 : TMenuItem;
    N4 : TMenuItem;
    N1 : TMenuItem;
    N8 : TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    PopupMenu1: TPopupMenu;
    VMI1: TMenuItem;
    PopupMenu2: TPopupMenu;
    N9: TMenuItem;
    N15: TMenuItem;
    procedure cdsMainAfterScroll(DataSet: TDataSet);
    procedure btnQryClick(Sender: TObject);
    procedure PO2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure pmMainPopup(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure VMI1Click(Sender: TObject);
    procedure btnDYClick(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData();override;
    procedure getRefreshClick(cds:TClientDataSet);
    function ifDateCaseEdit(Ldate:TDateTime):Boolean;

  end;

var
  frmVMIruku_Mod564: TfrmVMIruku_Mod564;

implementation

uses
  uBaseSinglePickListFrm, uBaseMainWhereFrm,PoSearch_Mod564,
  POruku_Mod564, VMIzhiruku;
{$R *.dfm}
//
//procedure TfrmVMIruku_Mod564.getRefreshClick(cds:TClientDataSet);
//begin
//  btnRefreshClick(nil);
//end;

function TfrmVMIruku_Mod564.ifDateCaseEdit(Ldate: TDateTime): Boolean;
var Lcds:TClientDataSet;
    Lstr:string;
begin
  Lcds:=TClientDataSet.Create(Self);
  try
    Result:=True;
    Lstr:='select Max(cut_date) as max_cut_date from data0171';
    gSvrIntf.IntfGetDataBySql(Lstr,Lcds);
    if not Lcds.IsEmpty then
    begin
      if Lcds.FieldByName('max_cut_date').Value>Ldate then Result:=False;
    end;
  finally
    LCds.Free;
  end;
end;

procedure TfrmVMIruku_Mod564.btnDYClick(Sender: TObject);
begin
  inherited;
  PopupMenu1.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TfrmVMIruku_Mod564.btnExitClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmVMIruku_Mod564.btnQryClick(Sender: TObject);
begin
  if cdsMainWhereInit.IsEmpty then
  begin
    cdsMainWhereInit.Append;
    cdsMainWhereInit.FieldByName('FieldName').AsString := 'data0133.create_date';
    cdsMainWhereInit.FieldByName('Oper').AsString := '区间';
    cdsMainWhereInit.FieldByName('FieldValue').AsString := FormatDateTime('YYYY-MM-DD',gFunc.GetSvrDateTime-3) +
                                  ' AND ' + FormatDateTime('YYYY-MM-DD',gFunc.GetSvrDateTime+1);
    cdsMainWhereInit.FieldByName('SeqNo').AsString := '0';
    cdsMainWhereInit.Post;
  end;
  inherited;
end;

procedure TfrmVMIruku_Mod564.cdsMainAfterScroll(DataSet: TDataSet);
var
  lsql:string;
begin
  inherited;
  if (ehMain.DataSource.DataSet.IsEmpty) then
  begin
    cdsDetail.Active:=False;
  end;
  lsql:='select data0134.*,data0017.inv_part_number,data0017.inv_name,data0017.INV_DESCRIPTION,Data0017.SHELF_LIFE,'
       +'data0017.STOCK_BASE, data0016.location,data0002.unit_name,data0071.quan_ord,data0071.quan_recd,'
       +'  data0071.CONVERSION_FACTOR,D02_1.UNIT_NAME AS pr_unitname,Data0071.extra_req,'
       +' data0071.avl_flag,data0071.QUAN_IN_INSP,Data0071.INVT_PTR,Data0071.WO_PTR,0 as mark,data0134.Rkey391'
       +'   from data0134 inner join'
       +'   data0017 on data0134.inventory_ptr=data0017.rkey'
       +'   inner join'
       +'   data0016 on data0134.location_ptr=data0016.rkey'
       +'   inner join'
       +'   data0002 on data0134.unit_ptr=data0002.rkey'
       +'   left outer join'
       +'   data0071 on data0134.source_ptr=data0071.rkey left JOIN'
       +'   Data0002 D02_1 ON Data0071.WO_PTR = D02_1.RKEY'
       +'   where data0134.grn_ptr='+Inttostr(Dataset.FieldByName('RKEY').AsInteger);
  gSvrintf.IntfGetDataBySql(lsql,cdsDetail)
end;

procedure TfrmVMIruku_Mod564.getdata;
begin
  FMainFrmSql := cdsMain.CommandText;

  if FMainWhere.Trim = '' then
    FMainWhere := ' AND data0133.create_date BETWEEN ' + QuotedStr(FormatDateTime('yyyy-MM-dd',gFunc.GetSvrDateTime-3)) + ' AND ' + QuotedStr(FormatDateTime('yyyy-MM-dd',gFunc.GetSvrDateTime+1));

  FWhere2 := '';

  FOrderby := ' order by data0133.rkey desc ';
  inherited;
end;

procedure TfrmVMIruku_Mod564.getRefreshClick(cds: TClientDataSet);
begin
  btnRefreshClick(nil);
end;

procedure TfrmVMIruku_Mod564.N11Click(Sender: TObject);
var
  LSql33: string;
begin
  inherited;
  if not gFunc.CheckUserAuth(7,564) then Exit;
  LSql33 := 'select * from data0133 where rkey = ' + cdsMain.FieldByName('rkey').AsString;
  gSvrIntf.IntfGetDataBySql(LSql33,cds133);
  if not cds133.IsEmpty then
  begin
    if (cds133.FieldByName('tstatus').Value<>0) then
    begin
      ShowMessage('提交状态必须是未提交！');
      Exit;
    end;
    cds133.Edit;
    cds133.FieldByName('tstatus').Value:=1; //提交审核
    cds133.Post;
  end;
  if (cds133.ChangeCount>0) then
  if gSvrIntf.IntfPostDataByTable('data0133',cds133.delta) then
  begin
    cds133.MergeChangeLog;
    btnRefreshClick(nil);
  end;
end;

procedure TfrmVMIruku_Mod564.N12Click(Sender: TObject);
var
  LSql33: string;
begin
  inherited;
  if not gFunc.CheckUserAuth(7,564) then Exit;
  LSql33 := 'select * from data0133 where rkey = ' + cdsMain.FieldByName('rkey').AsString;
  gSvrIntf.IntfGetDataBySql(LSql33,cds133);
  if not cds133.IsEmpty then
  begin
    if (cds133.FieldByName('tstatus').Value<>1) then
    begin
      ShowMessage('取消提交的状态只针对已提交');
      Exit;
    end;
    cds133.Edit;
    cds133.FieldByName('tstatus').Value:=0; //取消提交
    cds133.Post;
  end;
  if (cds133.ChangeCount>0) then
  if gSvrIntf.IntfPostDataByTable('data0133',cds133.delta) then
  begin
    cds133.MergeChangeLog;
    btnRefreshClick(nil);
  end;
end;

procedure TfrmVMIruku_Mod564.N13Click(Sender: TObject);
var
  LSql33: string;
begin
  inherited;
  if not gFunc.CheckUserAuth(8,564) then Exit;
  LSql33 := 'select * from data0133 where rkey = ' + cdsMain.FieldByName('rkey').AsString;
  gSvrIntf.IntfGetDataBySql(LSql33,cds133);
  if not cds133.IsEmpty then
  begin
    if (cds133.FieldByName('tstatus').Value<>1) then
    begin
      ShowMessage('审核只针对已提交状态');
      Exit;
    end;
    cds133.Edit;
    cds133.FieldByName('tstatus').Value:=2;//通过审核
    cds133.Post;
  end;
  if (cds133.ChangeCount>0) then
  if gSvrIntf.IntfPostDataByTable('data0133',cds133.delta) then
  begin
    cds133.MergeChangeLog;
    btnRefreshClick(nil);
  end;
end;

procedure TfrmVMIruku_Mod564.N14Click(Sender: TObject);
var
  LSql33: string;
begin
  inherited;
  if not gFunc.CheckUserAuth(8,564) then Exit;
  LSql33 := 'select * from data0133 where rkey = ' + cdsMain.FieldByName('rkey').AsString;
  gSvrIntf.IntfGetDataBySql(LSql33,cds133);
  if not cds133.IsEmpty then
  begin
    if (cds133.FieldByName('tstatus').Value<>2) then
    begin
      ShowMessage('取消审核只针对状态为已审核');
      Exit;
    end;
    cds133.Edit;
    cds133.FieldByName('tstatus').Value:=1;//取消审核
    cds133.Post;
  end;
  if (cds133.ChangeCount>0) then
  if gSvrIntf.IntfPostDataByTable('data0133',cds133.delta) then
  begin
    cds133.MergeChangeLog;
    btnRefreshClick(nil);
  end;
end;

procedure TfrmVMIruku_Mod564.N15Click(Sender: TObject);
var
  LFrm:TfrmVMILogoCard_Mod564;
  LFileName:string;
begin
  inherited;
  LFrm:=TfrmVMILogoCard_Mod564.Create(Self);
  try
    LFrm.GetData(cdsDetail.FieldByName('rkey').AsString);
    LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),
      'ERP_3_TIER\', 'ERP_3_TIER\REPORTS\库存管理_材料进出\', [rfReplaceAll]) +
      'VMI物料标识卡.fr3';
    LFrm.frxReport1.LoadFromFile(LFileName, true);
    LFrm.frxReport1.ShowReport;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmVMIruku_Mod564.N1Click(Sender: TObject);
var
  LSql33,LSql34,LSq70,LSq71,LSq391: string;
  LRkey71str,Lrkey391str:string;
  LPostData: OleVariant;
begin
  inherited;
  if not gFunc.CheckUserAuth(4,564) then Exit;
  if messagedlg('你确定要删除这条记录吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
  begin
    if (cdsMain.FieldByName('TSTATUS').Value>0) then
    begin
      ShowMessage('删除必须是在未提交状态下进行');
      Exit;
    end;
    if not ifDateCaseEdit(cdsMain.FieldByName('CREATE_DATE').Value) then
    begin
      ShowMessage('创建时间小于财务截数时间,不能再做任何修改');
      Exit;
    end;
    // data0133
    LSql33 := 'select * from data0133 where rkey = ' + cdsMain.FieldByName('rkey').AsString;
    // data0134
    LSql34 := 'select * from data0134 where GRN_PTR = ' + cdsMain.FieldByName('rkey').AsString;
    if cdsMain.FieldByName('TTYPE').Value=1 then//按PO入库
    begin
      cdsDetail.First;
      LRkey71str:='';
      Lrkey391str:='';
      while not cdsDetail.Eof do
      begin
        if (cdsDetail.FieldByName('SOURCE_PTR').AsString<>'') then//71
        LRkey71str:=LRkey71str+cdsDetail.FieldByName('SOURCE_PTR').AsString+',';
        if (cdsDetail.FieldByName('Rkey391').AsString<>'') then
        Lrkey391str:=Lrkey391str+cdsDetail.FieldByName('Rkey391').AsString+',';
        cdsDetail.Next;
      end;
      // data0070
      LSq70 := 'select * from data0070 where Rkey = ' + cdsMain.FieldByName('PO_PTR').AsString;
      // data0071
      LSq71 := 'select * from data0071 where rkey in (' + LRkey71str+'-1)';
      // data0391
      LSq391 := 'select * from data0391 where rkey in (' + Lrkey391str+'-1)';
      if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql33,LSql34,LSq70,LSq71,LSq391]),[cds133,cds134,cds70,cds71,cds391]) then Exit;
      cdsDetail.First;
      while not cdsDetail.Eof do
      begin
        if cds134.FieldByName('QUAN_ON_HAND').Value<>cds134.FieldByName('QUANTITY').Value then
        begin
          ShowMessage('入库数量已发生变化，不能删除');
          Exit;
        end;
      //edit391
        cds391.Filtered:=False;
        cds391.Filter:='';
        cds391.Filter:='Rkey ='+cdsDetail.FieldByName('Rkey391').AsString;
        cds391.Filtered:=True;
        if not cds391.IsEmpty then
        begin
          cds391.Edit;
          cds391.FieldByName('stock_over').Value:=0;
          cds391.Post;
        end;
      //edit71
        cds71.Filtered:=False;
        cds71.Filter:='';
        cds71.Filter:='Rkey ='+cdsDetail.FieldByName('SOURCE_PTR').AsString;
        cds71.Filtered:=True;
        if not cds71.IsEmpty then
        begin
          cds71.Edit;
          cds71.FieldByName('QUAN_RECD').Value:=cds71.FieldByName('QUAN_RECD').Value-cdsDetail.FieldByName('QUANTITY').AsInteger/cdsDetail.FieldByName('CONVERSION_FACTOR').AsFloat; //已接收的数量
          cds71.Post;
        end;
        cdsDetail.Next;
      end;
      //edit70
      cds70.Edit;
      cds70.FieldByName('status').Value:=5;
      cds70.Post;
      //dele133
      cds133.Delete;
    end;
    if cdsMain.FieldByName('TTYPE').Value=3 then//直接入库
    begin
      if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql33,LSql34]),[cds133,cds134]) then Exit;
      cds133.Delete;
    end;
    if cds133.State in [dsEdit,dsInsert] then cds133.Post;
    if cds134.State in [dsEdit,dsInsert] then cds134.Post;
    if cds71.State in [dsEdit,dsInsert] then cds71.Post;
    if cds391.State in [dsEdit,dsInsert] then cds391.Post;
    if cds70.State in [dsEdit,dsInsert] then cds70.Post;

    LPostData := VarArrayCreate([0,5],varVariant);
    if cds133.ChangeCount > 0 then
      LPostData[0] := cds133.Delta;
    if cds134.ChangeCount > 0 then
      LPostData[1] := cds134.Delta;
    if cds70.ChangeCount > 0 then
      LPostData[3] := cds70.Delta;
    if cds391.ChangeCount > 0 then
      LPostData[4] := cds391.Delta;
    if cds71.ChangeCount > 0 then
      LPostData[5] := cds71.Delta;
    if gSvrIntf.IntfPostModData('公共基础',564,LPostData) then
    begin
      if cds133.ChangeCount > 0 then cds133.MergeChangeLog;
      if cds134.ChangeCount > 0 then cds134.MergeChangeLog;
      if cds70.ChangeCount > 0 then cds70.MergeChangeLog;
      if cds391.ChangeCount > 0 then cds391.MergeChangeLog;
      if cds71.ChangeCount > 0 then cds71.MergeChangeLog;
      ShowMessage('删除成功');
      btnRefreshClick(nil);
    end;
  end;
end;

procedure TfrmVMIruku_Mod564.N3Click(Sender: TObject);
var
  i,j:Integer;
begin
  inherited;
  if not gFunc.CheckUserAuth(2,564) then Exit;
  if (cdsMain.FieldByName('TSTATUS').Value>0) then
  begin
    ShowMessage('编辑必须是在未提交状态下进行');
    Exit;
  end;
  if not ifDateCaseEdit(cdsMain.FieldByName('CREATE_DATE').Value) then
  begin
    ShowMessage('创建时间小于财务截数时间,不能再做任何修改');
    Exit;
  end;
  if cdsMain.FieldByName('TTYPE').Value=1 then//按PO入库
  begin
    if frmPOruku_Mod564 = nil then
    begin
      frmPOruku_Mod564 := TfrmPOruku_Mod564.Create(Self);
    end;
    frmPOruku_Mod564.FEditType:=1;
    frmPOruku_Mod564.GetData(cdsMain.FieldByName('rkey').AsString);
    frmPOruku_Mod564.init;
    frmPOruku_Mod564.EnableEdit;
    frmPOruku_Mod564.get_location;
    frmPOruku_Mod564.dtpReqDate.DateTime:=cdsMain.FieldByName('ship_DATE').Value;
    frmPOruku_Mod564.Button2.Enabled:=False;
    frmPOruku_Mod564.CBloc.Visible:=False;
    frmPOruku_Mod564.btnSave.Enabled:=True;
    frmPOruku_Mod564.StringGrid1.Enabled:=True;
    frmPOruku_Mod564.cds133.ReadOnly:=False;
    frmPOruku_Mod564.Show;
    i:=0;
    if not cdsDetail.IsEmpty then
    begin
      cdsDetail.First;
      while not cdsDetail.Eof do
      begin
        for j := 0 to frmPOruku_Mod564.str_list.Count -1 do
        begin
          if (cdsDetail.FieldByName(frmPOruku_Mod564.str_list.Values[frmPOruku_Mod564.StringGrid1.Cells[j,0]]).IsNull = False) then
            frmPOruku_Mod564.StringGrid1.Cells[j,i+1] := cdsDetail.FieldByName(frmPOruku_Mod564.str_list.Values[frmPOruku_Mod564.StringGrid1.Cells[j,0]]).Value;
        end;
        frmPOruku_Mod564.StringGrid1.Cells[frmPOruku_Mod564.str_list.IndexOfName('已接收'),i+1] := cdsDetail.FieldByName('QUAN_RECD').Value-cdsDetail.FieldByName('QUANTITY').Value/cdsDetail.FieldByName('CONVERSION_FACTOR').Value;
        frmPOruku_Mod564.StringGrid1.Cells[frmPOruku_Mod564.str_list.IndexOfName('含税价'),i+1] :=formatfloat('0.000',cdsDetail.FieldByName('tax_PRICE').Value/cdsDetail.FieldByName('CONVERSION_FACTOR').Value);
        i:=i+1;
        frmPOruku_Mod564.StringGrid1.RowCount:=frmPOruku_Mod564.StringGrid1.RowCount+1;
        cdsDetail.Next;
      end;
    end;
    frmPOruku_Mod564.StringGrid1.RowCount:=frmPOruku_Mod564.StringGrid1.RowCount-1;
  end;
  if cdsMain.FieldByName('TTYPE').Value=3 then//直接入库
  begin
    if frmVMIzhiruku = nil then
    begin
      frmVMIzhiruku := TfrmVMIzhiruku.Create(Self);
      frmVMIzhiruku.AddLookup134;
    end;
    frmVMIzhiruku.FEditType:=1;
    frmVMIzhiruku.getdata(cdsMain.FieldByName('rkey').AsString);
    frmVMIzhiruku.dtpReqDate.DateTime:=cdsMain.FieldByName('ship_DATE').Value;
    frmVMIzhiruku.redt1.ReadOnly:=True;
    frmVMIzhiruku.redt2.ReadOnly:=True;
    frmVMIzhiruku.redt3.ReadOnly:=True;
    frmVMIzhiruku.redt4.ReadOnly:=True;
    frmVMIzhiruku.redt8.ReadOnly:=True;
    frmVMIzhiruku.btnSave.Enabled:=True;
    frmVMIzhiruku.cds133.ReadOnly:=False;
    frmVMIzhiruku.DBGridEh1.ReadOnly:=False;
    frmVMIzhiruku.Show;
  end;
  btnRefreshClick(nil);
end;

procedure TfrmVMIruku_Mod564.N4Click(Sender: TObject);
var
  i,j:Integer;
begin
  inherited;
  if not gFunc.CheckUserAuth(3,564) then Exit;
  if cdsMain.FieldByName('TTYPE').Value=1 then//按PO入库
  begin
    if frmPOruku_Mod564 = nil then
    begin
      frmPOruku_Mod564 := TfrmPOruku_Mod564.Create(Self);
    end;
    frmPOruku_Mod564.FEditType:=3;
    frmPOruku_Mod564.GetData(cdsMain.FieldByName('rkey').AsString);
    frmPOruku_Mod564.init;
    frmPOruku_Mod564.EnableEdit;
    frmPOruku_Mod564.get_location;
    frmPOruku_Mod564.btnSave.Enabled:=False;
    frmPOruku_Mod564.StringGrid1.Enabled:=False;
//    frmPOruku_Mod564.cds133.ReadOnly:=True;
    frmPOruku_Mod564.Show;
    i:=0;
    if not cdsDetail.IsEmpty then
    begin
      cdsDetail.First;
      while not cdsDetail.Eof do
      begin
        for j := 0 to frmPOruku_Mod564.str_list.Count -1 do
        begin
          if (cdsDetail.FieldByName(frmPOruku_Mod564.str_list.Values[frmPOruku_Mod564.StringGrid1.Cells[j,0]]).IsNull = False) then
            frmPOruku_Mod564.StringGrid1.Cells[j,i+1] := cdsDetail.FieldByName(frmPOruku_Mod564.str_list.Values[frmPOruku_Mod564.StringGrid1.Cells[j,0]]).Value;
        end;
        frmPOruku_Mod564.StringGrid1.Cells[frmPOruku_Mod564.str_list.IndexOfName('已接收'),i+1] := cdsDetail.FieldByName('QUAN_RECD').Value-cdsDetail.FieldByName('QUANTITY').Value/cdsDetail.FieldByName('CONVERSION_FACTOR').Value;
        frmPOruku_Mod564.StringGrid1.Cells[frmPOruku_Mod564.str_list.IndexOfName('含税价'),i+1] :=formatfloat('0.000',cdsDetail.FieldByName('tax_PRICE').Value/cdsDetail.FieldByName('CONVERSION_FACTOR').Value);
        i:=i+1;
        frmPOruku_Mod564.StringGrid1.RowCount:=frmPOruku_Mod564.StringGrid1.RowCount+1;
        cdsDetail.Next;
      end;
    end;
    frmPOruku_Mod564.StringGrid1.RowCount:=frmPOruku_Mod564.StringGrid1.RowCount-1;
  end;
  if cdsMain.FieldByName('TTYPE').Value=3 then//直接入库
  begin
    if frmVMIzhiruku = nil then
    begin
      frmVMIzhiruku := TfrmVMIzhiruku.Create(Self);
      frmVMIzhiruku.AddLookup134;
    end;
    frmVMIzhiruku.FEditType:=3;
    frmVMIzhiruku.getdata(cdsMain.FieldByName('rkey').AsString);
    frmVMIzhiruku.btnSave.Enabled:=False;
    frmVMIzhiruku.cds133.ReadOnly:=True;
    frmVMIzhiruku.DBGridEh1.ReadOnly:=True;
    frmVMIzhiruku.Show;
  end;
end;

procedure TfrmVMIruku_Mod564.N6Click(Sender: TObject);
begin
  inherited;
  if not gFunc.CheckUserAuth(1,564) then Exit;
  if frmVMIzhiruku = nil then
  begin
    frmVMIzhiruku := TfrmVMIzhiruku.Create(Self);
    frmVMIzhiruku.refresh:= self.getRefreshClick;
    frmVMIzhiruku.AddLookup134;
  end;
  frmVMIzhiruku.getdata('0');
  frmVMIzhiruku.Append133;
  frmVMIzhiruku.FEditType:=0;
  frmVMIzhiruku.Show;
  btnRefreshClick(nil);
end;

procedure TfrmVMIruku_Mod564.N8Click(Sender: TObject);
var
  LFrm:TfrmReport_Mod564;
  LFileName:string;
begin
  inherited;
  if not gFunc.CheckUserAuth(5,564) then Exit;
  LFrm:=TfrmReport_Mod564.Create(Self);
  try
    LFrm.GetData(cdsMain.FieldByName('rkey').AsString);
    LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),
      'ERP_3_TIER\', 'ERP_3_TIER\REPORTS\库存管理_材料进出\', [rfReplaceAll]) +
      'VMI材料入库报表.fr3';
    LFrm.frxReport1.LoadFromFile(LFileName, true);
    LFrm.frxReport1.ShowReport;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmVMIruku_Mod564.N9Click(Sender: TObject);
begin
  inherited;
  frmEditRemark_Mod564 := TfrmEditRemark_Mod564.Create(Self);
  try
    frmEditRemark_Mod564.Edit1.Text:=cdsDetail.FieldByName('rohs').AsString;
    frmEditRemark_Mod564.Edit1.Tag:=cdsDetail.FieldByName('Rkey').AsInteger;//134rkey
    frmEditRemark_Mod564.Memo1.Text:=cdsDetail.FieldByName('SUPPLIER2').AsString;//详细位置
    frmEditRemark_Mod564.Memo2.Text:=cdsDetail.FieldByName('BARCODE_ID').AsString;//特别要求
    if frmEditRemark_Mod564.ShowModal = mrOk then
    begin
      btnRefreshClick(nil);
    end;
  finally
    frmEditRemark_Mod564.Free;
  end;
end;

procedure TfrmVMIruku_Mod564.pmMainPopup(Sender: TObject);
begin
  inherited;

  if cdsMain.IsEmpty then
  begin
    PO1.Enabled:=True;
    N3.Enabled:=False;
    N4.Enabled:=False;
    N1.Enabled:=False;
    N11.Enabled:=False;
    N12.Enabled:=False;
    N13.Enabled:=False;
    N14.Enabled:=False;
  end else
  begin
    PO1.Enabled:=True;
    N3.Enabled:=cdsMain.FieldByName('TSTATUS').Value=0;
    N4.Enabled:=True;
    N1.Enabled:=cdsMain.FieldByName('TSTATUS').Value=0;
    N11.Enabled:=cdsMain.FieldByName('TSTATUS').Value=0;
    N12.Enabled:=cdsMain.FieldByName('TSTATUS').Value=1;
    N13.Enabled:=N12.Enabled;
    N14.Enabled:=cdsMain.FieldByName('TSTATUS').Value=2;
  end;
end;

procedure TfrmVMIruku_Mod564.PO2Click(Sender: TObject);
var Lcds:TClientDataSet;
begin
  inherited;
  if not gFunc.CheckUserAuth(1,564) then Exit;
  Lcds:=TClientDataSet.Create(Self);
  try
    gSvrIntf.IntfGetDataBySql('select * from data0171 where status=0',Lcds);
    if not Lcds.IsEmpty then
    begin
      ShowMessage('对不起,在线有材料截数还未完成,不能进行入库,请联系财务部!');
      Exit;
    end;
    if frmPoSearch_Mod564 = nil then
    begin
      frmPoSearch_Mod564 := TfrmPoSearch_Mod564.Create(Self);
    end;
    frmPoSearch_Mod564 := TfrmPoSearch_Mod564.Create(pnlMain,FModID);
    btnRefreshClick(nil);
  finally
    LCds.Free;
  end;
end;

procedure TfrmVMIruku_Mod564.VMI1Click(Sender: TObject);
var
  LFrm:TfrmReport_Mod564;
  LFileName:string;
begin
  inherited;
  LFrm:=TfrmReport_Mod564.Create(Self);
  try
    LFrm.GetData(cdsMain.FieldByName('rkey').AsString);
    LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),
      'ERP_3_TIER\', 'ERP_3_TIER\REPORTS\库存管理_材料进出\', [rfReplaceAll]) +
      'VMI材料入库报表.fr3';
    LFrm.frxReport1.LoadFromFile(LFileName, true);
    LFrm.frxReport1.DesignReport;
  finally
    LFrm.Free;
  end;
end;

end.
