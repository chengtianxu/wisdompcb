unit UMainfrm_Mod38OutToDept;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseEditFrm, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls,
  DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.Mask, RzEdit,

  RzBtnEdt, uRKeyBtnEdit, Vcl.DBCtrls, Data.DB, Datasnap.DBClient, Vcl.Menus,
  uCommFunc, uBaseSinglePickListFrm, USel17Materialfrm_Mod38,
  frxClass, Data.Win.ADODB,UMod38Common;//,Utest;

type

  TfrmMain_Mod38OutToDept = class(TfrmBaseEdit)
    eh207: TDBGridEh;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    edtReqBillNo: TRKeyRzBtnEdit;
    edtWH: TRKeyRzBtnEdit;
    lbl5: TLabel;
    edtOutBillNo: TRKeyRzBtnEdit;
    lbl6: TLabel;
    edtRemark: TRKeyRzBtnEdit;
    ds457: TDataSource;
    ds207: TDataSource;
    cds457: TClientDataSet;
    cds207: TClientDataSet;
    pm207: TPopupMenu;
    mniAdd: TMenuItem;
    mniDel: TMenuItem;
    chkPrt: TCheckBox;
    cdsLookUp17: TClientDataSet;
    cdstemp: TClientDataSet;
    frxrprt1: TfrxReport;
    pnl4: TPanel;
    Panel1: TPanel;
    edtDept: TRKeyRzBtnEdit;
    edtReqMan: TRKeyRzBtnEdit;
    qry1: TADOQuery;
    qry1INV_PART_NUMBER: TStringField;
    qry1INV_NAME: TStringField;
    qry1rohs: TStringField;
    qry1UNIT_NAME: TStringField;
    qry1QUANTITY: TBCDField;
    qry1INVENTORY_PTR: TIntegerField;
    qry1DEPT_PTR: TIntegerField;
    qry1INV_DESCRIPTION: TStringField;
    procedure edtWHButtonClick(Sender: TObject);
    procedure edtDeptButtonClick(Sender: TObject);
    procedure edtReqManButtonClick(Sender: TObject);
    procedure mniDelClick(Sender: TObject);
    procedure mniAddClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtWHExit(Sender: TObject);
    procedure edtReqManExit(Sender: TObject);
    procedure edtDeptExit(Sender: TObject);
  private
    FDept_ptr: integer;
    procedure GetData17(AFrm: TfrmSel17Material_Mod38);
    procedure ReSet;

  public
    { Public declarations }
    procedure init;
    procedure GetData;
    procedure append457;

  end;

var
  frmMain_Mod38OutToDept: TfrmMain_Mod38OutToDept;

implementation

uses UReportFrm_mod38;
{$R *.dfm}

procedure TfrmMain_Mod38OutToDept.edtDeptButtonClick(Sender: TObject);
var
  LFrm: TfrmSinglePickList;
begin
    LFrm := TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(38, 1);
   if  LFrm.showmodal=mrok then
    begin
    cds457.edit;
    cds457.FieldByName('Dept_ptr').Value:=Lfrm.cdsPick.FieldByName('rkey').Value;
    cds457.post;
    end;
  finally
    LFrm.free;
  end;
end;

procedure TfrmMain_Mod38OutToDept.edtDeptExit(Sender: TObject);
var
Lsql:string;
begin
  inherited;
 if Trim(edtDept.Text)='' then Exit;
  lsql:='select rkey,dept_code,dept_name,case when ttype=4 then  ''部门''  when ttype=5 then ''班组'' else ''工序''  end xz '+
        ' from data0034   '+
        ' where (ttype in (4,5) or is_cost_dept=1)  and (ACTIVE_FLAG=0)  and dept_code='''+Trim(edtDept.Text)+''' ';
 if   gSvrIntf.IntfGetDataBySql(Lsql,cdstemp) then
 begin
    cds457.Edit;
      cds457.FieldByName('Dept_ptr').value :=
        cdstemp.FieldByName('rkey').value;
      cds457.Post;
 end;
end;

procedure TfrmMain_Mod38OutToDept.edtReqManButtonClick(Sender: TObject);
var
  LFrm: TfrmSinglePickList;
begin
   LFrm := TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(38, 2);
   if  LFrm.showmodal=mrok then
    begin
    cds457.edit;
    cds457.FieldByName('Recd_by').Value:=Lfrm.cdsPick.FieldByName('rkey').Value;
    cds457.post;
    end;
  finally
    LFrm.free;
  end;

end;

procedure TfrmMain_Mod38OutToDept.edtReqManExit(Sender: TObject);
var
Lsql:string;
begin
  inherited;
 if Trim(edtReqMan.Text)='' then Exit;
  lsql:='select rkey from data0005 where empl_code='''+Trim(edtReqMan.Text)+''' ';
 if   gSvrIntf.IntfGetDataBySql(Lsql,cdstemp) then
 begin
    cds457.Edit;
      cds457.FieldByName('Recd_by').value :=
        cdstemp.FieldByName('rkey').value;
      cds457.Post;
 end;
end;

procedure TfrmMain_Mod38OutToDept.edtWHButtonClick(Sender: TObject);
var
  LFrm: TfrmSinglePickList;
  str:string;
begin
      LFrm := TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(38, 0);
    if  LFrm.showmodal=mrok then
    begin
    cds457.edit;
    cds457.FieldByName('warehouse_ptr').Value:=Lfrm.cdsPick.FieldByName('rkey').Value;
    cds457.post;
    end;
  finally
    LFrm.free;
  end;
 str:=cds457.fieldbyname('GON_NUMBER').asstring;

end;



procedure TfrmMain_Mod38OutToDept.edtWHExit(Sender: TObject);
var
Lsql:string;
begin
  inherited;
 if Trim(edtWH.Text)='' then Exit;
  lsql:='select rkey from data0015 where warehouse_code='''+Trim(edtWH.Text)+''' ';
 if   gSvrIntf.IntfGetDataBySql(Lsql,cdstemp) then
 begin
    cds457.Edit;
      cds457.FieldByName('warehouse_ptr').value :=
        cdstemp.FieldByName('rkey').value;
      cds457.Post;
 end;
end;

procedure TfrmMain_Mod38OutToDept.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
 // pnlmain.Visible := False;
Action:= caFree;
frmMain_Mod38OutToDept:= nil;

frmSel17Material_Mod38:=nil;

end;

procedure TfrmMain_Mod38OutToDept.append457;
begin
    cds457.edit;
    cds457.FieldByName('IDKEy').Value := gFunc.CreateIDKey;
    cds457.FieldByName('GON_NUMBER').Value :=   ffunc.GetMaxOutBillNo;
    cds457.FieldByName('status').value := 0;
    cds457.FieldByName('create_date').Value := gFunc.GetSvrDateTime;
    cds457.FieldByName('create_by').Value := gVar.rkey05;
    cds457.FieldByName('TType').Value := 2;
    cds457.Post;

end;

procedure TfrmMain_Mod38OutToDept.GetData;
var
  Lsql17, Lsql457, Lsql207: string;
begin
  inherited;
    Lsql17 := ' select d17.rkey,  d17.INV_PART_NUMBER,d17.INV_NAME,d17.INV_DESCRIPTION,d02.UNIT_NAME,d22.rohs '
    + '  from Data0207 d207                                                                                '
    + '  inner join data0017 d17 on d207.INVENTORY_PTR=d17.RKEY                                              '
    + '  inner join Data0002 d02 on d17.STOCK_UNIT_PTR=d02.RKEY                                                '
    + '  inner join DATA0022 d22  on d207.D0022_PTR=d22.RKEY                                                     '
    + '  where d207.RKEY=0 ';

  Lsql457 := 'select * from data0457  where rkey=0';
  Lsql207 := 'select * from data0207  where rkey=0';


   gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([Lsql17, Lsql457, Lsql207]),
     [cdsLookUp17, cds457, cds207]);

end;

procedure TfrmMain_Mod38OutToDept.GetData17
  (AFrm: TfrmSel17Material_Mod38);
 // var  n : integer;
begin

  gSvrIntf.IntfGetDataBySql
    ('select cast(getdate() as smalldatetime) as NDate ', cdstemp);

    cdsLookUp17.FieldByName('rkey').ReadOnly := false;
  cdsLookUp17.FieldByName('INV_DESCRIPTION').ReadOnly := false;

  cdsLookUp17.Append;
  cdsLookUp17.FieldByName('rkey').value := AFrm.cdsPick.FieldByName('INVENTORY_PTR').asinteger;
  cdsLookUp17.FieldByName('INV_PART_NUMBER').value := AFrm.cdsPick.FieldByName('INV_PART_NUMBER').AsString;
  cdsLookUp17.FieldByName('INV_NAME').value := AFrm.cdsPick.FieldByName('INV_NAME').AsString;
  cdsLookUp17.FieldByName('INV_DESCRIPTION').value :=AFrm.cdsPick.FieldByName('INV_DESCRIPTION').AsString;
  cdsLookUp17.FieldByName('rohs').Value := AFrm.cdsPick.FieldByName('rohs').Value;
  cdsLookUp17.FieldByName('unit_name').value :=AFrm.cdsPick.FieldByName('unit_name').AsString;
  cdsLookUp17.Post;


    cds207.append;
    cds207.FieldByName('INVENTORY_PTR').Value :=
    AFrm.cdsPick.FieldByName('INVENTORY_PTR').AsInteger;
    cds207.FieldByName('D0022_PTR').Value := AFrm.cdsPick.FieldByName('RKEY').AsInteger;


  if not cdstemp.IsEmpty then
  cds207.FieldByName('TDATE').Value := cdstemp.FieldByName('NDate').Value;

  cds207.FieldByName('QUANTITY').Value := AFrm.Fqty;
  cds207.Post;

   eh207.DataSource := nil;
  eh207.DataSource := ds207;


end;





procedure TfrmMain_Mod38OutToDept.init;
var
  LLKField: TField;
  i: integer;
begin
  gSvrIntf.IntfGetDataBySql('SELECT * FROM data0207 WHERE 1=0', cds207);
  // 在数据集关闭的情况下新增加一个字段
  try
    cds207.Close;
    cds207.FieldDefs.BeginUpdate;
    for i := 0 to cds207.FieldDefList.Count - 1 do
    begin
      cds207.FieldDefList.FieldDefs[i].CreateField(Self);
    end;
    // Add New Field
    // 增加新的字段
    LLKField := TStringField.Create(cds207);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'INV_PART_NUMBER';
    LLKField.KeyFields := 'INVENTORY_PTR';
    LLKField.LookupDataSet := cdsLookUp17;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'INV_PART_NUMBER';
    LLKField.DataSet := cds207;

    LLKField := TStringField.Create(cds207);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'inv_name';
    LLKField.KeyFields := 'INVENTORY_PTR';
    LLKField.LookupDataSet := cdsLookUp17;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'inv_name';
    LLKField.DataSet := cds207;

    LLKField := TStringField.Create(cds207);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'INV_DESCRIPTION';
    LLKField.KeyFields := 'INVENTORY_PTR';
    LLKField.LookupDataSet := cdsLookUp17;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'INV_DESCRIPTION';
    LLKField.DataSet := cds207;

    LLKField := TStringField.Create(cds207);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'unit_name';
    LLKField.KeyFields := 'INVENTORY_PTR';
    LLKField.LookupDataSet := cdsLookUp17;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'unit_name';
    LLKField.DataSet := cds207;

    LLKField := TStringField.Create(cds207);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'rohs';
    LLKField.KeyFields := 'INVENTORY_PTR';
    LLKField.LookupDataSet := cdsLookUp17;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'rohs';
    LLKField.DataSet := cds207;

  finally
    cds207.FieldDefs.EndUpdate;
  end;

end;





procedure TfrmMain_Mod38OutToDept.mniAddClick(Sender: TObject);
//var
//  LFrm: TfrmSelMaterial_Mod38OutToDept;
begin
  inherited;
  if Trim(edtWH.Text) = '' then
  begin
    ShowMessage('请先选择工工厂!');
    edtWH.SetFocus;
    exit;
  end;
    if cds207.IsEmpty then
    frmSel17Material_Mod38:=nil;


    if frmSel17Material_Mod38=nil then
    begin
    frmSel17Material_Mod38 := TfrmSel17Material_Mod38.Create(self);
    frmSel17Material_Mod38.InitWithPickID(38, 3);
    frmSel17Material_Mod38.width:=1200;
    frmSel17Material_Mod38.height:=800;

    frmSel17Material_Mod38.btnOK.Left:=400-frmSel17Material_Mod38.btnOK.Width div 2;
    frmSel17Material_Mod38.btnCancelPick.Left:=800-frmSel17Material_Mod38.btnCancelPick.Width div 2;

    end;

    frmSel17Material_Mod38.FFlag:=1; //编码物料2来料检查
    frmSel17Material_Mod38.FParentCallBack := GetData17;
    frmSel17Material_Mod38.cbbWH.ItemIndex:=
    frmSel17Material_Mod38.cbbWH.Items.IndexOf(edtWH.DisplayNoteLabel.Caption);
    frmSel17Material_Mod38.edtFilter.Text:='';
    frmSel17Material_Mod38.showmodal;

end;

procedure TfrmMain_Mod38OutToDept.mniDelClick(Sender: TObject);
begin
  inherited;
  if cds207.IsEmpty then
    exit;
     cdsLookUp17.Delete;
    cds207.Delete ;

    cds207.Last;


end;

procedure TfrmMain_Mod38OutToDept.ReSet;
begin
 GetData;
 append457;
 self.edtOutBillNo.Text:=ffunc.GetMaxOutBillNo;
 cds457.Edit;
 cds457.FieldByName('dept_ptr').value := FDept_ptr;
 cds457.Post;
 edtWh.Enabled:=true;
 edtDept.Enabled:=true;
 edtreqMan.Enabled:=true;
end;





procedure TfrmMain_Mod38OutToDept.btn1Click(Sender: TObject);
begin
  inherited;
//frmTest:=TfrmTest.create(self);
//frmTest.getdata;
//frmTest.showmodal;
end;

procedure TfrmMain_Mod38OutToDept.btnCloseClick(Sender: TObject);
begin
  inherited;
   close;

end;

procedure TfrmMain_Mod38OutToDept.btnSaveClick(Sender: TObject);
var
  Lnumber, LNewNumber: string;
 // i: integer;
  cds22: TClientDataSet;
  cds14: TClientDataSet;
  cds314: TClientDataSet;
  cds17: TClientDataSet;
  cds04: TClientDataSet;
  cdstemp22: TClientDataSet;
  cdstemp207: TClientDataSet;

  Lsql: string;
  LrkeyStr22: string;
  Lrkeystr17: string;

  LDSArr: OleVariant;
  LfrmReport: TfrmReport_mod38;
  LFileName: string;

begin
  inherited;
  cds22 := TClientDataSet.Create(nil);
  cds14 := TClientDataSet.Create(nil);
  cds314 := TClientDataSet.Create(nil);
  cds17 := TClientDataSet.Create(nil);
  cds04 := TClientDataSet.Create(nil);
  cdstemp207 :=TClientDataSet.Create(nil);
  cdstemp22 :=TClientDataSet.Create(nil);
try


  try

  gSvrIntf.IntfGetDataBySql('select * from data0014 where 1=0', cds14);
  gSvrIntf.IntfGetDataBySql('select * from data0314 where 1=0', cds314);

  if cds207.RecordCount < 1 then
  begin
    ShowMessage('请先录入发放材料!');
    exit;
  end;

  if Trim(edtReqBillNo.Text) = '' then
  begin
    ShowMessage('领料单号不能为空!');
    edtReqBillNo.SetFocus;
    exit;
  end;

  if Trim(edtDept.Text) = '' then
  begin
    ShowMessage('领料部门不能为空!');
    edtDept.SetFocus;
    exit;
  end;

//  if Trim(edtReqMan.Text) = '' then
//  begin
//    ShowMessage('领料人员不能为空!');
//    edtReqMan.SetFocus;
//    exit;
//  end;

  if ffunc.IsStockCheck(Lnumber) then
  begin
    messagedlg('仓库正在进行材料盘点暂时不能操作该程序,盘点代码及人员:' + Lnumber, mtinformation,
      [mbcancel], 0);
    exit;
  end;

    Lnumber := Trim(edtOutBillNo.Text);
    if ffunc.IsBillNorepeated(Lnumber, LNewNumber) then
    begin
      edtOutBillNo.Text := LNewNumber;
      cds457.Edit;
      cds457.FieldByName('GON_NUMBER').Value:= LNewNumber;

      cds457.Post;
      messagedlg('出仓单号重复,可能有多台计算机同时新增,系统自动更新编号为:' + LNewNumber, mtinformation,
        [mbok], 0);
    end;

      // 减去库存22中的库数量
     LrkeyStr22:= ffunc.GetRkeyStr(cds207,'D0022_PTR');
     LrkeyStr17:=ffunc.GetRkeyStr(cds207,'INVENTORY_PTR');

      gSvrIntf.IntfGetDataBySql('select * from data0022 where rkey in ' +
        LrkeyStr22, cds22);

      gSvrIntf.IntfGetDataBySql('select * from data0017 where rkey in ' +
        LrkeyStr17, cds17);

    cds457.DisableControls;
    cds207.DisableControls;
    cds207.First;

   while not cds207.Eof do
   begin
    Lsql := ' select rkey from  data0022 where rkey=' +
      cds207.FieldByName('D0022_PTR').asstring;
    gSvrIntf.IntfGetDataBySql(Lsql, cdstemp);
    if cdstemp.IsEmpty then
    begin
      messagedlg('材料发放不成功库存记录发生变化!请重新选择库存发放', mterror, [mbcancel], 0);
      ReSet;
      exit;
    end;
      //初始化
      cds207.edit;
      cds207.FieldByName('TTYPE').Value := 2;
      cds207.FieldByName('DEPT_PTR').Value := cds457.FieldByName('dept_ptr')
        .AsInteger;
      cds207.FieldByName('D457_IDKey').Value := cds457.FieldByName('IDKey')
        .asstring;
     cds207.FieldByName('RTN_QUANTITY').value := 0;
     cds207.FieldByName('STANDARD_COST').value := 0;
     cds207.FieldByName('Invent_or').value := 0;
      cds207.Post;


      //更新22
      if cds22.Locate('rkey', cds207.FieldByName('D0022_ptr').asinteger, [])
      then
      begin

        if cds22.FieldByName('quan_on_hand').value <
          cds207.FieldByName('QUANTITY').value then
        begin
          showmessage('发料失败,可能多用户同时发放了同一批物料且导致库存出现负数!请重发');
         // Ffrm.cdsPick.CancelUpdates;
          ReSet;
          exit;
        end;

        cds22.Edit;
        cds22.FieldByName('quan_on_hand').value :=
          cds22.FieldByName('quan_on_hand').value -
          cds207.FieldByName('QUANTITY').value;
        cds22.Post;

      end;

      //17
      if cds17.Locate('rkey', cds207.FieldByName('INVENTORY_PTR')
        .asinteger, []) then
      begin
        cds17.Edit;
        cds17.FieldByName('quan_on_hand').value :=
          cds17.FieldByName('quan_on_hand').value -
          cds207.FieldByName('QUANTITY').value;
        cds17.Post;
      end;
      cds207.next;
   end;

    // showmessage('17:' + LrkeyStr17 + '-22:' + LrkeyStr22);

      gSvrIntf.IntfGetDataBySql('select * from data0004 where rkey=56 ',cds04);

      ffunc.UpdateBillNo(Trim(edtOutBillNo.Text),cds04); // 更新出库编号

      ffunc.send_message(LrkeyStr17, cds14, cds314);

      LDSArr :=VarArrayCreate([0, 6], varVariant);

      if cds457.ChangeCount > 0 then
        LDSArr[0] := cds457.delta;
      if cds207.ChangeCount > 0 then
        LDSArr[1] := cds207.delta;
      if cds22.ChangeCount > 0 then
        LDSArr[2] := cds22.delta;
      if cds17.ChangeCount > 0 then
        LDSArr[3] := cds17.delta;
      if cds04.ChangeCount > 0 then
        LDSArr[4] := cds04.delta;
      if cds14.ChangeCount > 0 then
        LDSArr[5] := cds14.delta;
      if cds314.ChangeCount > 0 then
        LDSArr[6] := cds314.delta;


      if gSvrIntf.IntfPostModData('公共基础', 38, LDSArr) then
      begin
        cds457.MergeChangeLog;
        cds207.MergeChangeLog;
        ShowMessage('发料成功!');
      end;

      if chkPrt.Checked then
      begin
        LfrmReport := TfrmReport_mod38.Create(Self);
        try
         gSvrIntf.IntfGetDataBySql('select * from data0457 where GON_NUMBER='''+trim(edtOutBillNo.text)+''' ',cdstemp);

          LfrmReport.GetData(cdstemp.FieldByName('rkey').asstring);

          LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),
            'ERP_3_TIER\', 'ERP_3_TIER\REPORTS\库存管理_材料进出\', [rfReplaceAll]) +
            '材料出库单.fr3';
          frxrprt1.LoadFromFile(LFileName, true);
          frxrprt1.ShowReport;
        finally
          LfrmReport.free;
        end;
      end;
     FDept_ptr:= cds457.FieldByName('Dept_ptr').value;
     reset;
     frmSel17Material_Mod38:=nil;
    except on e:exception do
    begin
    showmessage('错误:'+e.Message);
    exit;
    end;
    end;

  finally
  cds207.EnableControls;
  cds457.EnableControls;
  cds22.free;
  cds14.free;
  cds314.free;
  cds17.free;
  cds04.free;
  cdstemp207.free;
  cdstemp22.free;
  end;

end;

end.
