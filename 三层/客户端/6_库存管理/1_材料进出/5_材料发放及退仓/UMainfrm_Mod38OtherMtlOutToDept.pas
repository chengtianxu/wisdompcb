unit UMainfrm_Mod38OtherMtlOutToDept;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCommFunc, uBaseEditFrm,
  uBaseSinglePickListFrm,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, frxClass,
  Vcl.Menus, Data.DB, Datasnap.DBClient, Vcl.StdCtrls, EhLibVCL, GridsEh,
  USel235Materialfrm_Mod38,
  DBAxisGridsEh, DBGridEh, Vcl.Mask, RzEdit, RzBtnEdt, uRKeyBtnEdit,
  Vcl.Buttons, Vcl.ExtCtrls, Data.Win.ADODB;

type
  TfrmMain_Mod38OtherMtlOutToDept = class(TfrmBaseEdit)
    pnl5: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    edtReqBillNo: TRKeyRzBtnEdit;
    edtWH: TRKeyRzBtnEdit;
    edtOutBillNo: TRKeyRzBtnEdit;
    edtRemark: TRKeyRzBtnEdit;
    pnl3: TPanel;
    eh208: TDBGridEh;
    chkPrt: TCheckBox;
    ds457: TDataSource;
    ds208: TDataSource;
    cds457: TClientDataSet;
    cds208: TClientDataSet;
    pm208: TPopupMenu;
    mniAdd: TMenuItem;
    mniDel: TMenuItem;
    cdsLookUp235: TClientDataSet;
    cdstemp: TClientDataSet;
    frxrprt1: TfrxReport;
    qry1: TADOQuery;
    qry1goods_name: TStringField;
    qry1goods_guige: TStringField;
    qry1goods_type: TStringField;
    qry1rohs: TStringField;
    qry1UNIT_NAME: TStringField;
    qry1QUANTITY: TFloatField;
    edtDept: TRKeyRzBtnEdit;
    edtReqMan: TRKeyRzBtnEdit;
    procedure mniAddClick(Sender: TObject);
    procedure mniDelClick(Sender: TObject);
    procedure edtWHButtonClick(Sender: TObject);
    procedure edtReqManButtonClick(Sender: TObject);
    procedure edtDeptButtonClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure edtWHExit(Sender: TObject);
    procedure edtReqManExit(Sender: TObject);
    procedure edtDeptExit(Sender: TObject);
  private
    { Private declarations }
    procedure GetData17(AFrm: TfrmSel235Material_Mod38);
    procedure ReSet;
  public
    { Public declarations }
    procedure init;
    procedure GetData;
    procedure append457;
  end;

var
  frmMain_Mod38OtherMtlOutToDept: TfrmMain_Mod38OtherMtlOutToDept;

implementation

uses UMod38Common, UReportOtheFrm;

{$R *.dfm}

procedure TfrmMain_Mod38OtherMtlOutToDept.mniAddClick(Sender: TObject);
// var
// LFrm: TfrmSel235Material_Mod38;
begin
  inherited;
  if Trim(edtWH.Text) = '' then
  begin
    ShowMessage('请先选择工工厂!');
    edtWH.SetFocus;
    exit;
  end;

   if cds208.IsEmpty then
    frmSel235Material_Mod38:=nil;

  if frmSel235Material_Mod38 = nil then
  begin
    frmSel235Material_Mod38 := TfrmSel235Material_Mod38.Create(self);
    frmSel235Material_Mod38.InitWithPickID(38, 7);
    frmSel235Material_Mod38.width := 700;
    frmSel235Material_Mod38.height := 800;
  end;

  frmSel235Material_Mod38.FParentCallBack := GetData17;
  frmSel235Material_Mod38.cbbWH.ItemIndex :=
    frmSel235Material_Mod38.cbbWH.Items.IndexOf(edtWH.DisplayNoteLabel.Caption);
    frmSel235Material_Mod38.edtFilter.Text:='';
   // frmSel235Material_Mod38.cdsPick.Filter:='';
  frmSel235Material_Mod38.showmodal;

end;

procedure TfrmMain_Mod38OtherMtlOutToDept.append457;
var
  cds04: TClientDataSet;
begin
    cds04 := TClientDataSet.Create(nil);
  try
    // 出仓单号：
    gSvrIntf.IntfGetDataBySql
      ('select SEED_VALUE,SEED_FLAG from data0004 where rkey=56', cds04);
    cds457.edit;
    cds457.FieldByName('IDKEy').Value := gFunc.CreateIDKey;
    cds457.FieldByName('GON_NUMBER').Value :=
      cds04.FieldByName('SEED_VALUE').asstring;
    cds457.FieldByName('create_date').Value := gFunc.GetSvrDateTime;
    cds457.FieldByName('create_by').Value := gVar.rkey05;
    cds457.FieldByName('TType').Value := 5;
    cds457.FieldByName('status').Value := 0;
    cds457.Post;
  finally
    cds04.Free;
  end;
end;

procedure TfrmMain_Mod38OtherMtlOutToDept.btnCloseClick(Sender: TObject);
begin
  inherited;
  close;
  
end;

procedure TfrmMain_Mod38OtherMtlOutToDept.btnSaveClick(Sender: TObject);
var
  Lnumber, LNnumber: string;
 // i: integer;
  // Lsql:string;
  cds14: TClientDataSet;
  cds314: TClientDataSet;
  // cds17: TClientDataSet;
  cds235: TClientDataSet;
  cds04: TClientDataSet;
  // cdstemp208: TClientDataSet;
  LRkeyStr235: string;
  LDSArr: OleVariant;
  LfrmReport: TfrmReportOther_mod38;
  LFileName: string;
begin
  inherited;
   cdstemp := TClientDataSet.Create(nil);
    cds14 := TClientDataSet.Create(nil);
    cds314 := TClientDataSet.Create(nil);
    // cds17 := TClientDataSet.Create(nil);
    cds04 := TClientDataSet.Create(nil);
    // cdstemp208 := TClientDataSet.Create(nil);
    cds235 := TClientDataSet.Create(nil);

  try
    if cds208.RecordCount < 1 then
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

//    if Trim(edtReqMan.Text) = '' then
//    begin
//      ShowMessage('领料人员不能为空!');
//      edtReqMan.SetFocus;
//      exit;
//    end;

    try

      if FFunc.IsStockCheck(Lnumber) then
      begin
        messagedlg('仓库正在进行材料盘点暂时不能操作该程序,盘点代码及人员:' + Lnumber, mtinformation,
          [mbcancel], 0);
        exit;
      end;

      Lnumber := Trim(edtOutBillNo.Text);

      if FFunc.IsBillNorepeated(Lnumber, LNnumber) then
      begin
        edtOutBillNo.Text := LNnumber;
        cds457.Edit;
        cds457.FieldByName('GON_NUMBER').Value:= LNnumber;
        cds457.Post;
        messagedlg('出仓单号重复,可能有多台计算机同时新增,系统自动更新编号为:' + LNnumber, mtinformation,
          [mbok], 0);
      end;

      LRkeyStr235 := FFunc.GetRkeyStr(cds208, 'SOURCE_PTR');

      gSvrIntf.IntfGetDataBySql('select * from data0235 where rkey in ' +
        LRkeyStr235, cds235);

     cds457.DisableControls;
     cds208.DisableControls;
      cds208.First;
      while not cds208.Eof do
      begin
        cds208.edit;
        cds208.FieldByName('DEPT_PTR').Value := cds457.FieldByName('dept_ptr')
          .AsInteger;
        cds208.FieldByName('D457_IDKey').Value :=
          cds457.FieldByName('IDKey').asstring;
        cds208.FieldByName('RTN_QUANTITY').Value := 0;
        cds208.Post;

      // 减去库存235中的库数量
        if cds235.Locate('rkey', cds208.FieldByName('source_PTR').AsInteger, [])
        then
          cds235.edit;
        if cds235.FieldByName('QUAN_ON_HAND').Value -
          cds208.FieldByName('QUANTITY').Value < 0 then
        begin
          ShowMessage('发料失败,可能多用户同时发放了同一批物料且导致库存出现负数!请重发');
          ReSet;
          exit;
        end
        else
          cds235.FieldByName('QUAN_ON_HAND').Value :=
            cds235.FieldByName('QUAN_ON_HAND').Value -
            cds208.FieldByName('QUANTITY').Value;
        cds235.Post;

        cds208.next;
      end;


      gSvrIntf.IntfGetDataBySql('select * from data0004 where rkey=56', cds04);
      FFunc.UpdateBillNo(Trim(edtOutBillNo.Text), cds04); // 更新出库编号

      gSvrIntf.IntfGetDataBySql('select * from data0014 where 1=0', cds14);
      gSvrIntf.IntfGetDataBySql('select * from data0314 where 1=0', cds314);

      FFunc.send_message(LRkeyStr235, cds14, cds314);

      LDSArr := VarArrayCreate([0, 5], varVariant);

      if cds457.ChangeCount > 0 then
        LDSArr[0] := cds457.delta;
      if cds208.ChangeCount > 0 then
        LDSArr[1] := cds208.delta;
      if cds235.ChangeCount > 0 then
        LDSArr[2] := cds235.delta;
      if cds04.ChangeCount > 0 then
        LDSArr[3] := cds04.delta;
      if cds14.ChangeCount > 0 then
        LDSArr[4] := cds14.delta;
      if cds314.ChangeCount > 0 then
        LDSArr[5] := cds314.delta;

      if gSvrIntf.IntfPostModData('公共基础', 38, LDSArr, 1) then
      begin
        cds457.MergeChangeLog;
        cds208.MergeChangeLog;
        ShowMessage('发料成功!');

      end;

      if chkPrt.Checked then
      begin
      LfrmReport := TfrmReportOther_mod38.Create(self);
        try
          gSvrIntf.IntfGetDataBySql('select * from data0457 where GON_NUMBER='''
            + Trim(edtOutBillNo.Text) + ''' ', cdstemp);


          LfrmReport.GetData(cdstemp.FieldByName('rkey').asstring);

          LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),
            'ERP_3_TIER\', 'ERP_3_TIER\REPORTS\库存管理_材料进出\', [rfReplaceAll]) +
            '杂物材料出库单.fr3';
          frxrprt1.LoadFromFile(LFileName, true);
          frxrprt1.ShowReport;
        finally
          LfrmReport.Free;
        end;
      end;

      ReSet;
      frmSel235Material_Mod38 := nil;
    except
      on e: exception do
      begin
        ShowMessage('错误:' + e.Message);
        exit;
      end;
    end;
  finally
    cds208.EnableControls;
    cds457.EnableControls;
    cdstemp.Free;
    cds14.Free;
    cds314.Free;
    cds04.Free;
    cds235.Free;
  end;

end;

procedure TfrmMain_Mod38OtherMtlOutToDept.edtDeptButtonClick(Sender: TObject);
var
  LFrm: TfrmSinglePickList;
begin
 LFrm := TfrmSinglePickList.Create(self);
  try

    LFrm.InitWithPickID(38, 1);
    if LFrm.showmodal = mrok then
    begin
      cds457.edit;
      cds457.FieldByName('Dept_ptr').Value :=
        LFrm.cdsPick.FieldByName('rkey').Value;
      cds457.Post;
    end;
  finally
    LFrm.Free;
  end;

end;

procedure TfrmMain_Mod38OtherMtlOutToDept.edtDeptExit(Sender: TObject);
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

procedure TfrmMain_Mod38OtherMtlOutToDept.edtReqManButtonClick(Sender: TObject);
var
  LFrm: TfrmSinglePickList;
begin
   LFrm := TfrmSinglePickList.Create(self);
  try
    LFrm.InitWithPickID(38, 2);
    if LFrm.showmodal = mrok then
    begin
      cds457.edit;
      cds457.FieldByName('RECD_By').Value :=
        LFrm.cdsPick.FieldByName('rkey').Value;
      cds457.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain_Mod38OtherMtlOutToDept.edtReqManExit(Sender: TObject);
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

procedure TfrmMain_Mod38OtherMtlOutToDept.edtWHButtonClick(Sender: TObject);
var
  LFrm: TfrmSinglePickList;
begin
  LFrm := TfrmSinglePickList.Create(self);
  try
    LFrm.InitWithPickID(38, 0);
    if LFrm.showmodal = mrok then
    begin
      cds457.edit;
      cds457.FieldByName('warehouse_ptr').Value :=
        LFrm.cdsPick.FieldByName('rkey').Value;
      cds457.Post;
    end;
  finally
    LFrm.Free;
  end;

end;

procedure TfrmMain_Mod38OtherMtlOutToDept.edtWHExit(Sender: TObject);
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

procedure TfrmMain_Mod38OtherMtlOutToDept.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
 // pnlmain.Visible := False;
  Action := caFree;
  frmMain_Mod38OtherMtlOutToDept := nil;
  frmSel235Material_Mod38 := nil;

end;

procedure TfrmMain_Mod38OtherMtlOutToDept.GetData;
var
  Lsql17, Lsql457, Lsql208: string;
begin
  inherited;
  Lsql17 := '  select b.rkey , b.goods_name ,b.goods_guige   , ' +
    '  b.goods_type  , b.rohs   ,   ' + ' c.UNIT_NAME    ' +
    ' from data0208  a               ' +
    ' inner join Data0235 b  on a.SOURCE_PTR=b.RKEY ' +
    ' inner join Data0002 c on b.unit_ptr=c.rkey' + ' where a.rkey=0';

  Lsql457 := 'select * from data0457  where rkey=0';
  Lsql208 := 'select * from data0208  where rkey=0';

  gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([Lsql17, Lsql457, Lsql208]),
    [cdsLookUp235, cds457, cds208]);
end;

procedure TfrmMain_Mod38OtherMtlOutToDept.GetData17
  (AFrm: TfrmSel235Material_Mod38);
begin

//  gSvrIntf.IntfGetDataBySql
//    ('select cast(getdate() as smalldatetime) as NDate ', cdstemp);

  cdsLookUp235.FieldByName('rkey').ReadOnly := False;
  cdsLookUp235.FieldByName('goods_guige').ReadOnly := False;

  cdsLookUp235.Append;
  cdsLookUp235.FieldByName('rkey').AsInteger := AFrm.cdsPick.FieldByName('rkey')
    .AsInteger;
  cdsLookUp235.FieldByName('goods_name').Value :=
    AFrm.cdsPick.FieldByName('goods_name').asstring;
  cdsLookUp235.FieldByName('goods_guige').Value :=
    AFrm.cdsPick.FieldByName('goods_guige').asstring;
  cdsLookUp235.FieldByName('goods_type').Value :=
    AFrm.cdsPick.FieldByName('goods_type').asstring;
  cdsLookUp235.FieldByName('rohs').Value :=
    AFrm.cdsPick.FieldByName('rohs').asstring;
     cdsLookUp235.FieldByName('unit_name').Value :=
    AFrm.cdsPick.FieldByName('unit_name').asstring;
  cdsLookUp235.Post;

  cds208.Append;

  cds208.FieldByName('SOURCE_PTR').Value := AFrm.cdsPick.FieldByName('rkey')
    .AsInteger;
  cds208.FieldByName('TDATE').Value := gFunc.GetSvrDateTime;

  cds208.FieldByName('QUANTITY').Value := AFrm.Fqty;

  cds208.Post;

  eh208.DataSource := nil;
  eh208.DataSource := ds208;

end;

procedure TfrmMain_Mod38OtherMtlOutToDept.init;
var
  LLKField: TField;
  i: integer;
begin
  gSvrIntf.IntfGetDataBySql('SELECT * FROM data0208 WHERE 1=0', cds208);
  // 在数据集关闭的情况下新增加一个字段
  try
    cds208.close;
    cds208.FieldDefs.BeginUpdate;
    for i := 0 to cds208.FieldDefList.Count - 1 do
    begin
      cds208.FieldDefList.FieldDefs[i].CreateField(self);
    end;

    // 增加新的字段
    LLKField := TStringField.Create(cds208);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'goods_name';
    LLKField.KeyFields := 'SOURCE_PTR';
    LLKField.LookupDataSet := cdsLookUp235;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'goods_name';
    LLKField.DataSet := cds208;

    LLKField := TStringField.Create(cds208);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'goods_guige';
    LLKField.KeyFields := 'SOURCE_PTR';
    LLKField.LookupDataSet := cdsLookUp235;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'goods_guige';
    LLKField.DataSet := cds208;

    LLKField := TStringField.Create(cds208);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'goods_type';
    LLKField.KeyFields := 'SOURCE_PTR';
    LLKField.LookupDataSet := cdsLookUp235;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'goods_type';
    LLKField.DataSet := cds208;

    LLKField := TStringField.Create(cds208);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'unit_name';
    LLKField.KeyFields := 'SOURCE_PTR';
    LLKField.LookupDataSet := cdsLookUp235;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'unit_name';
    LLKField.DataSet := cds208;

    LLKField := TStringField.Create(cds208);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'rohs';
    LLKField.KeyFields := 'SOURCE_PTR';
    LLKField.LookupDataSet := cdsLookUp235;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'rohs';
    LLKField.DataSet := cds208;

  finally
    cds208.FieldDefs.EndUpdate;
  end;
end;

procedure TfrmMain_Mod38OtherMtlOutToDept.mniDelClick(Sender: TObject);
begin
  inherited;
  if cds208.IsEmpty then
    exit;

   cdsLookUp235.Delete;
  cds208.Delete;

end;

procedure TfrmMain_Mod38OtherMtlOutToDept.ReSet;
begin
  GetData;
  append457;
  edtOutBillNo.Text := FFunc.GetMaxOutBillNo;
  edtWH.Enabled := true;
  edtDept.Enabled := true;
  edtReqMan.Enabled := true;
end;

end.
