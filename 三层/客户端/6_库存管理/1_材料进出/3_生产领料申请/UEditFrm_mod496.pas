unit UEditFrm_mod496;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.strutils, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseEditFrm, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Mask, RzEdit, RzBtnEdt, uRKeyBtnEdit, Vcl.ComCtrls,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh, Data.DB, Datasnap.DBClient, Data.Win.ADODB,
  uCommFunc,
  uLookupDM, Vcl.Menus, uBaseSinglePickListFrm, UMtlCheckFrm_mod496;

type
  TAfterAppendEvent_Mod496 = procedure of object;

  TfrmEdit_Mod496 = class(TfrmBaseEdit)
    pnl3: TPanel;
    pnl4: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    edt_BillNo: TRKeyRzBtnEdit;
    edt_Dept: TRKeyRzBtnEdit;
    edt_Audit: TRKeyRzBtnEdit;
    edt_WH: TRKeyRzBtnEdit;
    edt_PBillNo: TRKeyRzBtnEdit;
    dtpReqDate: TDateTimePicker;
    cds268: TClientDataSet;
    ds268: TDataSource;
    cds468: TClientDataSet;
    ds468: TDataSource;
    cdsLookUp17: TClientDataSet;
    edt_remark: TRKeyRzBtnEdit;
    pm468: TPopupMenu;
    mniAdd: TMenuItem;
    mniDel: TMenuItem;
    eh468: TDBGridEh;
    cds04: TClientDataSet;
    cdstemp: TClientDataSet;
    procedure mniAddClick(Sender: TObject);
    procedure edt_DeptExit(Sender: TObject);
    procedure mniDelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure edt_AuditButtonClick(Sender: TObject);
    procedure edt_remarkButtonClick(Sender: TObject);
    procedure edt_DeptButtonClick(Sender: TObject);
    procedure edt_PBillNoButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edt_WHChange(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eh468CellClick(Column: TColumnEh);
    procedure eh468ColExit(Sender: TObject);
    procedure eh468ColEnter(Sender: TObject);
    procedure pm468Popup(Sender: TObject);
  private
    { Private declarations }
    function GetNo(edt: TRKeyRzBtnEdit; ikey: string; Acds04: TClientDataSet;
      tp: integer = 0): Boolean;
    function GetMaxBillNo: string;
  public
    { Public cdsTemp2 }
    AddRefresh: TAfterAppendEvent_Mod496;
    EFlag: integer; // 1新增，2编辑，3查看
    procedure InsertRecord(AFrm: TfrmMtlCheck);
    procedure Init;
    procedure GetData(srkey: string);
    procedure Append268;
  end;

var
  frmEdit_Mod496: TfrmEdit_Mod496;

implementation

uses USelBomFrm_mod496, USelAuditCodeFrm_mod496;
{$R *.dfm}
{ TForm2 }

procedure TfrmEdit_Mod496.Append268;
var
  ssql: string;
  Lcdstemp: TClientDataSet;
begin
  // 单号
  //
  edt_Dept.Enabled := true;
  edt_WH.Enabled := true;
  Lcdstemp := TClientDataSet.Create(nil);
  try
  cds268.edit;
  cds268.FieldByName('number').ReadOnly := false;
  if GetNo(edt_BillNo, '36', cds04, 0) then
    cds268.FieldByName('number').value := edt_BillNo.text;

  // a:=edt_billno.text;
  cds268.FieldByName('EMPL_PTR').value := gVar.rkey05;
  cds268.FieldByName('status').value := 0;
  cds268.FieldByName('IDKey').value := gFunc.CreateIDKey;

  gSvrIntf.IntfGetDataBySql
    ('select cast(getdate() as smalldatetime) as NDate ', Lcdstemp);

  self.dtpReqDate.Datetime := Lcdstemp.FieldByName('NDate').value;;

  ssql := 'SELECT  Data0034.rkey as rkey34 , data0094.rkey as rkey94,data0073.warehouse_ptr '+
   '  FROM Data0005   '+
   '  INNER JOIN  Data0034 ON Data0005.EMPLOYEE_ID = Data0034.RKEY  '+
   '  INNER JOIN Data0073 ON Data0005.RKEY = Data0073.EMPLOYEE_PTR  '+
   '  INNER JOIN Data0094 ON  data0094.dept_ptr=data0034.rkey        '+
   ' where dbo.Data0094.type=2 and  data0073.rkey= ' + gVar.rkey73;

  if gSvrIntf.IntfGetDataBySql(ssql, Lcdstemp) then
  begin
    cds268.FieldByName('dept_ptr').value := Lcdstemp.FieldByName('rkey34')
      .asinteger; // 部门
    cds268.FieldByName('auth_ptr').value := Lcdstemp.FieldByName('rkey94')
      .asinteger; // 审核流程：
    cds268.FieldByName('warehouse_ptr').value :=
      Lcdstemp.FieldByName('warehouse_ptr').asinteger; // 审核流程：
    if trim(edt_WH.text) <> '' then
      edt_WH.Enabled := false;
  end;

  if cds268.State in [dsEdit, dsInsert] then
    cds268.Post;

  //cds268.FieldByName('number').ReadOnly := true;

  finally
    Lcdstemp.Free;
  end;
end;

procedure TfrmEdit_Mod496.btnCloseClick(Sender: TObject);
begin
  inherited;
  //close;
end;

procedure TfrmEdit_Mod496.btnSaveClick(Sender: TObject);
var
  LPostData, AParamArr: OleVariant;
  CFlag, k: integer;
  // sflag: integer;
  Pname, Ptype, ssql: string;
  NowQty: Double;
  lst: TStringList;
  cds136, cdssp: TClientDataSet;
begin
  inherited;
 try
   cds268.disableControls;
   cds468.disableControls;
   lst := TStringList.Create;
   cds136 := TClientDataSet.Create(nil);
   cdssp := TClientDataSet.Create(nil);

  if cds468.RecordCount < 1 then
  begin
    showmessage('不能保存空记录...');
    exit;
  end;
  if trim(edt_BillNo.text) = '' then
  begin
    showmessage('申请单号不能为空...');
    edt_BillNo.SetFocus;
    exit;
  end;
  if trim(edt_Dept.text) = '' then
  begin
    showmessage('申请部门不能为空...');
    edt_Dept.SetFocus;
    exit;
  end;
  if trim(edt_Audit.text) = '' then
  begin
    showmessage('审核流程不能为空...');
    edt_Audit.SetFocus;
    exit;
  end;
  if trim(edt_WH.text) = '' then
  begin
    showmessage('工厂不能为空...');
    edt_WH.SetFocus;
    exit;
  end;
  if trim(edt_remark.text) = '' then
  begin
    if MessageBox(Handle, '备注为空，是否继续？', '提示', MB_YESNO + MB_ICONWARNING +
      MB_DEFBUTTON2) = IDNO then
      exit;
  end;
   cds468.edit;
  try



    cds268.edit;
    cds268.FieldByName('date').AsDateTime := dtpReqDate.Datetime; // 请购日期
    cds268.Post;

    case EFlag of
//     1: // 新增
//        begin
//          GetNo(edt_BillNo, '36', cds04, 1);
//          cds268.FieldByName('number').ReadOnly := false;
//          cds268.Edit;
//          cds268.FieldByName('number').Value:=edt_BillNo.Text;
//          cds268.Post;
//          cds268.FieldByName('number').ReadOnly := true;
//        end;
      2: // 编辑
        begin
          if (cds268.FieldByName('status').value = 3) then
          begin
          cds268.edit;
          cds268.FieldByName('status').value := 0; // 请购日期
          cds268.Post;
          end;

        end;
    end;

    // 20160811检查领料是否符合标准：
    CFlag := 0; // 不检查
    cds268.edit;
    cds268.FieldByName('allow_submit').asinteger := 0;
    cds268.FieldByName('prted').value := 0;
    cds268.FieldByName('TTYPE').asinteger := 0;

    cds268.Post;

    NowQty := 0;
    cds468.First;
    while not cds468.Eof do
    begin
      if cds468.FieldByName('quan_bom').value <= 0 then
      begin
        showmessage('数量不能为负数或0!');
        exit;
      end;
      // quan_alloc
//      if cds468.FieldByName('quan_bom').value > cds468.FieldByName('IsIn')
//        .value then
//      begin
//        showmessage('数量不能大于现有库存!');
//        exit;
//      end;

      if cds468.FieldByName('control_name').AsString <> '' then
      begin
        CFlag := 1; // 有标准需要检查
        lst.Add(cds468.FieldByName('control_name').AsString);
        lst.Sorted := true;
        lst.Duplicates := dupIgnore;
        lst.Add(cds468.FieldByName('control_name').AsString);
      end;
      cds468.Next;
    end;

    if CFlag = 1 then
    begin
//       cds268.edit;
//       cds268.FieldByName('allow_submit').asinteger := 1;
//       cds268.Post;
      for k := 0 to lst.Count - 1 do
      begin
        cds468.First;
        while not cds468.Eof do
        begin
          if cds468.FieldByName('control_name').AsString = lst[k] then
          begin
            NowQty := NowQty + StrToFloat(cds468.FieldByName('QUAN_BOM')
              .AsString);
            Ptype := Copy(cds468.FieldByName('standards').AsString, 0, 1);
            Pname := cds468.FieldByName('control_name').AsString;
          end;
          cds468.Next;
        end;

        ssql := 'select rkey from data0136 where rtrim(control_name)=''' +
          Pname + ''' ';
         // ShowMessage(Pname);
        gSvrIntf.IntfGetDataBySql(ssql, cds136);


        AParamArr := varArrayCreate([0, 5], varVariant);
        AParamArr[0] := Ptype;
        //ShowMessage('Ptype:'+Ptype);
        AParamArr[1] := cds268.FieldByName('warehouse_ptr').asinteger;
        AParamArr[2] := cds136.FieldByName('rkey').asinteger;
       // ShowMessage('rkey136:'+cds136.FieldByName('rkey').asstring);
        AParamArr[3] := cds268.FieldByName('dept_ptr').asinteger;
        //ShowMessage('dept_ptr:'+cds268.FieldByName('dept_ptr').asstring);
        AParamArr[4] := dtpReqDate.Date;
        AParamArr[5] :=0;// cds468.FieldByName('QUAN_BOM').asfloat;;

        gSvrIntf.IntfspGetData('sp_GetEveryQty_3', AParamArr, cdssp);
            // ShowMessage(cdssp.FieldByName('smessage').value);

        cds468.First;
        while not cds468.Eof do
        begin
          if (cds468.FieldByName('control_name').AsString = lst[k]) then
          begin
            cds468.edit;
           // cds468.FieldByName('remark').ReadOnly := false;
            cds468.FieldByName('remark').value :=
              cdssp.FieldByName('smessage').value;;
            cds468.Post;
          //  cds468.FieldByName('remark').ReadOnly := true;
          end;
          cds468.Next;
        end;

        NowQty := 0;

      end;

    end;

    // 检测end

    cds468.First;
    while not cds468.Eof do
    begin
      cds468.edit;
      if cds468.FieldByName('D268_IDKey').AsString = '' then
        cds468.FieldByName('D268_IDKey').value :=
          cds268.FieldByName('IDKeY').AsString;

      if cds468.FieldByName('QUAN_ISSUED').AsString = '' then
        cds468.FieldByName('QUAN_ISSUED').value := 0;

      if cds468.FieldByName('quan_alloc').AsString = '' then
        cds468.FieldByName('quan_alloc').value := 0;

      if cds468.FieldByName('offcut_qty').AsString = '' then
        cds468.FieldByName('offcut_qty').value := 0;

        if cds468.FieldByName('offcut_status').AsString = '' then
        cds468.FieldByName('offcut_status').value := 0;

      // if ((eflag=2) and (cds268.FieldByName('status').value=3)) or (eflag=1) then
      if cds468.FieldByName('status').AsString = '' then
        cds468.FieldByName('status').value := 0;

      if cds468.FieldByName('step').AsString = '' then
        cds468.FieldByName('step').value := 0; // 有材料为1无为0
      cds468.FieldByName('dept_ptr').value := cds268.FieldByName('dept_ptr')
        .asinteger;
      if cds468.FieldByName('overproof').AsString = '' then
        cds468.FieldByName('overproof').value := 0;

      if cds468.FieldByName('Invent_or').AsString = '' then
        cds468.FieldByName('Invent_or').value := false;

      cds468.Post;

      if (Copy(cds468.FieldByName('remark').AsString, 0, 1) = 'X') then
      begin
        cds268.edit;
        cds268.FieldByName('allow_submit').asinteger := 1;
        cds268.Post;
        if (cds468.FieldByName('ExReason').value = '') then
        begin
          showmessage('超领的请录入超领理由!');
         //eh468.ReadOnly:=false;
        // if cds468.State in [dsedit,dsinsert] then
          //cds468.Cancel;
          exit;
        end;
      end;
      cds468.Next;
    end;
    cds468.First;


        if  EFlag =1 then    // 新增
        begin
           ssql := 'select * from data0004 where rkey=36';
          gSvrIntf.IntfGetDataBySql(ssql,cds04);
          GetNo(edt_BillNo, '36', cds04, 1);
          cds268.FieldByName('number').ReadOnly := false;
          cds268.Edit;
          cds268.FieldByName('number').Value:=edt_BillNo.Text;
          cds268.Post;
          cds268.FieldByName('number').ReadOnly := true;
        end;



    if cds268.State in [dsEdit, dsInsert] then
      cds268.Post;
    if cds468.State in [dsEdit, dsInsert] then
      cds468.Post;

    LPostData := varArrayCreate([0, 2], varVariant);
    if cds268.ChangeCount > 0 then
      LPostData[0] := cds268.Delta;
    if cds468.ChangeCount > 0 then
      LPostData[1] := cds468.Delta;
    if cds04.ChangeCount > 0 then
      LPostData[2] := cds04.Delta;

    if gSvrIntf.IntfPostModData('公共基础', 496, LPostData) then
    begin
      cds268.MergeChangeLog;
      cds468.MergeChangeLog;
      showmessage('保存成功');
      close;
      AddRefresh;
    end;


  except
    on e: Exception do
    begin
      showmessage('错误：' + e.message);
      cds468.edit;
      cds468.first;
      exit;
    end;
  end;

  finally
  cds268.EnableControls;
  cds468.EnableControls;
  cdssp.Free;
  cds136.Free;
  end
end;

procedure TfrmEdit_Mod496.edt_AuditButtonClick(Sender: TObject);
var
  Lfrm: TFrmSelAuditCode;
begin
  inherited;
  if trim(edt_Dept.text) = '' then
  begin
    showmessage('请先选择部门!');
    edt_Dept.SetFocus;
    exit;
  end;
  Lfrm := TFrmSelAuditCode.Create(self);
  try
    Lfrm.InitWithPickID(496, 2, ' and Data0034.DEPT_CODE= ''' +
      trim(edt_Dept.text) + ''' ');

    if Lfrm.ShowModal = mrok then
    begin
      cds268.edit;
      cds268.FieldByName('auth_ptr').value := Lfrm.cdsPick.FieldByName('rkey')
        .asinteger;
      cds268.Post;
    end;
  finally
    Lfrm.Free;
  end;
end;

procedure TfrmEdit_Mod496.edt_DeptButtonClick(Sender: TObject);
var
  Lfrm: TfrmSinglePickList;
  Lsql:string;
begin
  inherited;
  Lfrm := TfrmSinglePickList.Create(self);
  try
    Lfrm.InitWithPickID(496, 1);
    if Lfrm.ShowModal = mrok then
    begin
      cds268.edit;
      cds268.FieldByName('dept_ptr').value := Lfrm.cdsPick.FieldByName('rkey')
        .asinteger;
      cds268.Post;

     Lsql:= 'select data0094.rkey,data0094.code, data0094.PURCHASE_APPROV_DESC '+
           'from data0094 inner join data0034 on data0094.dept_ptr=data0034.rkey ' +
            'where dbo.Data0094.type=2 and data0034.dept_code=''' + edt_Dept.Text + ''' ';
      if gSvrIntf.IntfGetDataBySql(Lsql,cdstemp) then
      begin
      if cdstemp.RecordCount=1 then
      begin
      cds268.edit;
      cds268.FieldByName('auth_ptr').value := cdstemp.FieldByName('rkey').AsInteger;
      cds268.Post;
      end
      else
      begin
      cds268.edit;
      cds268.FieldByName('auth_ptr').value := null;
      cds268.Post;
      end;
      end;
    end;
  finally
    Lfrm.Free;
  end;
end;

procedure TfrmEdit_Mod496.edt_DeptExit(Sender: TObject);
// var
// ssql:string;
begin
  // inherited;
  // ssql:='select rkey,dept_code,dept_name from data0034 where (ttype in (4,5) or is_cost_dept=1) '+
  // 'and dept_code='''+trim(edt_Dept.Text)+'''';
  // if   gSvrintf.IntfGetDataBySql(ssql,cdsTemp) then

end;

procedure TfrmEdit_Mod496.edt_PBillNoButtonClick(Sender: TObject);
var
  // lsql: string;
  Lfrm: TFrmSelBom_mod496;
begin
  inherited;
  if trim(edt_Dept.text) = '' then
    MessageDlg('请首先确认领料部门!', mtError, [mbCancel], 0);

  Lfrm := TFrmSelBom_mod496.Create(self);
  try
    // lsql:='and data0492.ISSUE_DATE>=getdate() and data0492.ISSUE_DATE<=dateadd(dd,1,getdate())';
    Lfrm.InitWithPickID(496, 4); // , lsql
    if Lfrm.ShowModal = mrok then
    begin
      cds268.edit;
      cds268.FieldByName('cut_no').value := Lfrm.cdsPick.FieldByName('rkey')
        .asinteger;
      cds268.Post;
    end;

  finally
    Lfrm.Free;
  end;
end;

procedure TfrmEdit_Mod496.edt_remarkButtonClick(Sender: TObject);
var
  Lfrm: TfrmSinglePickList;
begin
  inherited;
  Lfrm := TfrmSinglePickList.Create(self);
  try
    Lfrm.InitWithPickID(496, 1);
    if Lfrm.ShowModal = mrok then
    begin
      cds268.edit;
      cds268.FieldByName('reference').value :=
        Lfrm.cdsPick.FieldByName('dept_name').AsString;
      cds268.Post;
    end;
  finally
    Lfrm.Free;
  end;
end;

procedure TfrmEdit_Mod496.edt_WHChange(Sender: TObject);
begin
  inherited;
  if not cds468.IsEmpty then
    edt_WH.Enabled := false;

end;

procedure TfrmEdit_Mod496.eh468CellClick(Column: TColumnEh);
begin
  inherited;
// if  (Column.Index=9) or  (Column.Index=2)  then
//  eh468.ReadOnly:=false
// else
// eh468.readonly:=true;

end;

procedure TfrmEdit_Mod496.eh468ColEnter(Sender: TObject);
begin
  inherited;
// if (eh468.SelectedField.FieldName='ExReason')  then    // or (eh468.SelectedField.FieldName='QUAN_BOM')
//   eh468.ReadOnly:=false
// else
//  eh468.ReadOnly:=true;
end;

procedure TfrmEdit_Mod496.eh468ColExit(Sender: TObject);
begin
  inherited;
// if (eh468.SelectedField.FieldName='ExReason')   then   //or (eh468.SelectedField.FieldName='QUAN_BOM')
//   //eh468.ReadOnly:=false
//   cds468.FieldByName('ExReason').ReadOnly := true
// else
//  eh468.ReadOnly:=true;
end;

procedure TfrmEdit_Mod496.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := cafree;
  frmEdit_Mod496 := nil;

end;

procedure TfrmEdit_Mod496.FormShow(Sender: TObject);
begin
  inherited;
  // if  (EFlag = 1) or (EFlag = 2) then
  // begin
  // self.dtpReqDate.Enabled:=true;
  /// /self.edt_BillNo.Enabled:=false;
  // self.edt_Dept.Enabled:=true;
  // self.edt_Audit.Enabled:=true;
  // self.edt_WH.Enabled:=true;
  // self.edt_PBillNo.Enabled:=true;
  // self.edt_remark.Enabled:=true;
  // end
  // else if  (EFlag = 3)  then
  // begin
  // self.dtpReqDate.Enabled:=false;
  /// /self.edt_BillNo.Enabled:=true;
  // self.edt_Dept.Enabled:=false;
  // self.edt_Audit.Enabled:=false;
  // self.edt_WH.Enabled:=false;
  // self.edt_PBillNo.Enabled:=false;
  // self.edt_remark.Enabled:=false;
  // end
end;

procedure TfrmEdit_Mod496.GetData(srkey: string);
var
  ssql04, ssql17, ssql268, ssql468: string;
begin
  ssql04 := 'select * from data0004 where rkey=36';

  ssql17 := 'SELECT  d17.rkey, d17.INV_PART_NUMBER, d17.INV_PART_DESCRIPTION,d2.rkey as rkey02,d2.unit_name,d136.rkey as rkey136,d136.control_name '
    + ' FROM  dbo.Data0468 d468  ' +
    '  left JOIN  dbo.Data0017 d17  ON d468.INVENT_PTR = d17.RKEY ' +
    ' left join Data0002 d2 on d468.Runit=d2.rkey ' +
    ' left join   data0136 d136 on d468.control_ptr=d136.rkey ' +
    ' where  d468.flow_no=' + srkey;

  ssql268 := 'select * from data0268 where rkey = ' + srkey;
  ssql468 := 'select * from data0468 where flow_no=' + srkey;

  if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([ssql04, ssql17, ssql268,
    ssql468]), [cds04, cdsLookUp17, cds268, cds468]) then
    exit;
end;

function TfrmEdit_Mod496.GetMaxBillNo: string;
var
  Lcdstemp: TClientDataSet;
begin
  Lcdstemp := TClientDataSet.Create(nil);
  try
    result := '';
    if gSvrIntf.IntfGetDataBySql
      ('select SEED_VALUE  from data0004  where rkey =36 ', Lcdstemp) then
      result := Lcdstemp.Fields[0].AsString;

  finally
    Lcdstemp.Free;
  end;
end;

procedure TfrmEdit_Mod496.Init;
var
  LLKField: TField;
  I: integer;
begin
  gSvrIntf.IntfGetDataBySql('SELECT * FROM data0468 WHERE 1=0', cds468);
  // 在数据集关闭的情况下新增加一个字段
  try
    cds468.close;
    cds468.FieldDefs.BeginUpdate;
    for I := 0 to cds468.FieldDefList.Count - 1 do
    begin
      cds468.FieldDefList.FieldDefs[I].CreateField(self);
    end;

    // INV_PART_NUMBER
    LLKField := TStringField.Create(cds468);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'INV_PART_NUMBER';
    LLKField.KeyFields := 'INVENT_PTR';
    LLKField.LookupDataSet := cdsLookUp17;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'INV_PART_NUMBER';
    LLKField.DataSet := cds468;

    // INV_PART_DESCRIPTION
    LLKField := TStringField.Create(cds468);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'INV_PART_DESCRIPTION';
    LLKField.KeyFields := 'INVENT_PTR';
    LLKField.LookupDataSet := cdsLookUp17;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'INV_PART_DESCRIPTION';
    LLKField.DataSet := cds468;

    // unit_name
    LLKField := TStringField.Create(cds468);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'unit_name';
    LLKField.KeyFields := 'Runit';
    LLKField.LookupDataSet := cdsLookUp17;
    LLKField.LookupKeyFields := 'rkey02';
    LLKField.LookupResultField := 'unit_name';
    LLKField.DataSet := cds468;
    // control_name
    LLKField := TStringField.Create(cds468);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'control_name';
    LLKField.KeyFields := 'control_ptr';
    LLKField.LookupDataSet := cdsLookUp17;
    LLKField.LookupKeyFields := 'rkey136';
    LLKField.LookupResultField := 'control_name';
    LLKField.DataSet := cds468;

  finally
    cds468.FieldDefs.EndUpdate;
  end;

end;

procedure TfrmEdit_Mod496.InsertRecord(AFrm: TfrmMtlCheck);
var
  LField: TField;
  // s: string;
begin
   if cds468.Locate('INVENT_PTR;supplier_ptr',VarArrayOf([AFrm.cds468_sel.FieldByName('INVENT_PTR').AsInteger,AFrm.cds468_sel.FieldByName('supplier_ptr').AsInteger]),[]) then
   begin
   cds468.Edit;
   cds468.FieldByName('quan_bom').AsFloat:=cds468.FieldByName('quan_bom').AsFloat+strtofloat(trim(AFrm.edt_ReqQty.Text));
   cds468.Post;
   end
  else
  begin
    AFrm.ReqDate := dtpReqDate.Date;

  // cdsLookUp17
    cdsLookUp17.FieldByName('rkey').ReadOnly := false;
    cdsLookUp17.FieldByName('INV_PART_DESCRIPTION').ReadOnly := false;
    cdsLookUp17.FieldByName('rkey136').ReadOnly := false;
    cdsLookUp17.FieldByName('rkey02').ReadOnly := false;

    cdsLookUp17.Append;
    cdsLookUp17.FieldByName('rkey').asinteger := AFrm.cds468_sel.FieldByName
      ('rkey17').asinteger;
    cdsLookUp17.FieldByName('INV_PART_NUMBER').AsString := AFrm.edt_ProdNo.text;
    cdsLookUp17.FieldByName('INV_PART_DESCRIPTION').AsString :=
      AFrm.edt_ProdDesc.text;
    cdsLookUp17.FieldByName('rkey02').AsString :=
      AFrm.cds468_sel.FieldByName('Runit').AsString;

    cdsLookUp17.FieldByName('unit_name').AsString :=
      AFrm.cds468_sel.FieldByName('unit_name').AsString;
    cdsLookUp17.FieldByName('rkey136').AsString :=
      AFrm.cds468_sel.FieldByName('control_ptr').AsString;
    cdsLookUp17.FieldByName('control_name').AsString :=
      AFrm.cds468_sel.FieldByName('control_name').AsString;
    cdsLookUp17.Post;


    cds468.Append;
    for LField in cds468.Fields do
    begin
      if IndexText(LField.FieldName, ['rkey']) <> -1 then
        Continue;
      if AFrm.cds468_sel.FindField(LField.FieldName) <> nil then
      begin
        LField.value := AFrm.cds468_sel.FindField(LField.FieldName).value;
      end;
    end;

    cds468.FieldByName('QUAN_BOM').value := StrToFloat(AFrm.edt_ReqQty.text);
    cds468.FieldByName('exreason').value := AFrm.mmo_remark.text;
    cds468.FieldByName('remark').value:=AFrm.cds468_sel.FieldByName('remark').value;
    cds468.FieldByName('D268_IDKey').AsString :=
      cds268.FieldByName('IDKey').AsString;
    cds468.Post;
  end;

  eh468.DataSource := nil;
  eh468.DataSource := ds468;

  if not cds468.IsEmpty then
  begin
    edt_Dept.Enabled := false;
  end;
end;

procedure TfrmEdit_Mod496.mniAddClick(Sender: TObject);
var
  Lfrm: TfrmMtlCheck;
  // I: integer;
  s, Lrkey17: string;
begin
  inherited;
  //
  if trim(edt_WH.text) = '' then
  begin
    showmessage('请先选择工厂!');
    edt_WH.SetFocus;
    exit;
  end;

  s := '';
  if cds468.RecordCount > 0 then
  begin
    cds468.First;
    while not cds468.Eof do
    begin
      s := s + cds468.FieldByName('invent_ptr').AsString + ',';
      cds468.Next;
    end;
  end;

  if s = '' then
    Lrkey17 := '' // 'rkey in '+ '(' + '-1' + ')'
  else
    Lrkey17 := ' and rkey not in ' + '(' + s + '-1)';

  Lfrm := TfrmMtlCheck.Create(nil);
  try
    Lfrm.FParentCallBack := InsertRecord;
    Lfrm.GetData;
    Lfrm.Dept_ptr := cds268.FieldByName('dept_ptr').asinteger;
    Lfrm.wh_ptr := cds268.FieldByName('warehouse_ptr').asinteger;
    Lfrm.Frkey17 := Lrkey17;
    Lfrm.ShowModal;
  finally
    Lfrm.Free;
  end;
  if not cds468.IsEmpty then
    edt_WH.Enabled := false;

end;

procedure TfrmEdit_Mod496.mniDelClick(Sender: TObject);
begin
  inherited;
  cds468.Delete;
  cdsLookUp17.Delete;

end;

procedure TfrmEdit_Mod496.pm468Popup(Sender: TObject);
begin
  inherited;
   mniDel.Enabled:=(not cds468.IsEmpty);
   mniAdd.Enabled:=btnSave.Enabled;
end;

function TfrmEdit_Mod496.GetNo(edt: TRKeyRzBtnEdit; ikey: string;
  Acds04: TClientDataSet; tp: integer = 0): Boolean;
var
  I, iL: integer;
  ssql, s, sL: string;
  B: Boolean;
  table_name: string;
  cdstemp, cdstemp2, cdstemp3: TClientDataSet;
begin
  result := false;
  cdstemp := TClientDataSet.Create(nil);
  cdstemp2 := TClientDataSet.Create(nil);
  cdstemp3 := TClientDataSet.Create(nil);
  // cds04 := TClientDataSet.Create(nil);

  // ssql04 := ' select  * from data0004 ' + 'where rkey=' + ikey +
  // ' and SEED_VALUE=''' + edt.text + '''';
  // gSvrintf.IntfGetDataBySql(ssql04, cds04);

 try
  if not gSvrIntf.IntfGetDataBySql
    ('select SEED_VALUE,seed_flag,table_name  from data0004  where rkey =' +
    ikey, cdstemp) then
    exit;

  if cdstemp.IsEmpty or (cdstemp.Fields[1].asinteger = 1) then // 完全手动
  begin
    result := true;
    exit;
  end;

  s := trim(cdstemp.Fields[0].AsString);
  table_name := trim(cdstemp.Fields[2].AsString);
  if cdstemp.Fields[1].asinteger = 2 then // 固定字首,系统可自动产生号码，也可输入号码(填充断号)
  begin
    iL := length(s);
    for I := iL downto 1 do
      if not(s[I] in ['0' .. '9']) then
      begin
        sL := inttostr(I);
        break;
      end;

    edt.editmask := Copy(s, 1, I) + '!' + Copy('9999999999', I + 1,
      iL - I) + ';1;_';
    edt.ReadOnly := false;
    if tp = 0 then
      edt.text := s
    else
    begin

      if not gSvrIntf.IntfGetDataBySql('select top 1 number from ' + table_name
        + ' where number=''' + edt.text + '''', cdstemp2) then
        exit;

      if not cdstemp2.IsEmpty then
      begin
        showmessage('单号重复,请重新输入...');
        exit;
      end;

      if not gSvrIntf.IntfGetDataBySql('select top 1 number from ' + table_name
        + ' order by number desc', cdstemp2) then
        exit;

      if cdstemp2.IsEmpty or (cdstemp2.Fields[0].AsString <= edt.text) then
      begin
        if sL <> '' then
        begin
          ssql := ' select  SEED_VALUE, ' + ' left(SEED_VALUE,' + sL +
            ')+right(''00000''+cast(cast(right(SEED_VALUE,len(SEED_VALUE)-' + sL
            + ') as int)+1 as varchar(6)),6) as SEED_VALUE2  ' +
            ' from data0004 ' + 'where rkey=' + ikey + ' and SEED_VALUE=''' +
            edt.text + '''';
        end
        else
        begin
          ssql := ' select  SEED_VALUE, ' +
            ' cast(SEED_VALUE as int)+1 as  SEED_VALUE2   from data0004  ' +
            'where rkey=' + ikey + ' and SEED_VALUE=''' + edt.text + '''';
        end;

        gSvrIntf.IntfGetDataBySql(ssql, cdstemp3);
        Acds04.edit;
        Acds04.FieldByName('SEED_VALUE').value :=
          cdstemp3.FieldByName('SEED_VALUE2').AsString;
        Acds04.Post;
        // gSvrintf.IntfPostDataByTable('data0004', cds04.Delta);
      end;

    end;
  end
  else if cdstemp.Fields[1].asinteger = 3 then
  begin // 系统产生，但可修改
    edt.ReadOnly := false;
    if tp = 0 then
      edt.text := cdstemp.Fields[0].AsString
    else
    begin
      iL := length(s);
      for I := iL downto 1 do
        if not(s[I] in ['0' .. '9']) then
        begin
          sL := inttostr(I);
          break;
        end;

      if sL <> '' then
      begin
        ssql := ' select  SEED_VALUE, ' + ' left(SEED_VALUE,' + sL +
          ')+right(''00000''+cast(cast(right(SEED_VALUE,len(SEED_VALUE)-' + sL +
          ') as int)+1 as varchar(6)),6) as SEED_VALUE2  ' + ' from data0004 ' +
          'where rkey=' + ikey + ' and SEED_VALUE=''' + edt.text + '''';
      end
      else
      begin
        ssql := ' select  SEED_VALUE, ' +
          ' cast(SEED_VALUE as int)+1 as  SEED_VALUE2   from data0004  ' +
          'where rkey=' + ikey + ' and SEED_VALUE=''' + edt.text + '''';
      end;

      gSvrIntf.IntfGetDataBySql(ssql, cdstemp3);
      Acds04.edit;
      Acds04.FieldByName('SEED_VALUE').value :=
        cdstemp3.FieldByName('SEED_VALUE2').AsString;
      Acds04.Post;
      // gSvrintf.IntfPostDataByTable('data0004', cds04.Delta);

    end;
  end
  else if cdstemp.Fields[1].asinteger = 4 then
  begin // 只能系统产生
    edt.ReadOnly := true;
    if tp = 0 then
    begin
      edt.text := cdstemp.Fields[0].AsString;
      result := true;
    end
    else
    begin
      iL := length(s);
      for I := iL downto 1 do
        if not(s[I] in ['0' .. '9']) then
        begin
          sL := inttostr(I);
          break;
        end;
      B := true;
      while B do
      begin
        if sL <> '' then
        begin
          ssql := ' select  SEED_VALUE, ' + ' left(SEED_VALUE,' + sL +
            ')+right(''00000''+cast(cast(right(SEED_VALUE,len(SEED_VALUE)-' + sL
            + ') as int)+1 as varchar(6)),6) as SEED_VALUE2  ' +
            ' from data0004 ' + 'where rkey=' + ikey + '  ';

        end
        else
        begin
          ssql := ' select  SEED_VALUE, ' +
            ' cast(SEED_VALUE as int)+1 as  SEED_VALUE2   from data0004  ' +
            'where rkey=' + ikey + ' ';
        end;

         gSvrIntf.IntfGetDataBySql(ssql, cdstemp3);
        Acds04.edit;
        Acds04.FieldByName('SEED_VALUE').value :=
          cdstemp3.FieldByName('SEED_VALUE2').AsString;
        Acds04.Post;

        edt.text := cdstemp3.FieldByName('SEED_VALUE').AsString;
         result := true;

        // if gSvrintf.IntfPostDataByTable('data0004', cds04.Delta) then
        // begin
        // if gSvrintf.IntfGetDataBySql
        // ('select SEED_VALUE  from data0004  where rkey =' + ikey, cdstemp2)
        // then
        // edt.text := cdstemp2.Fields[0].AsString;
        //
        // end;
        B := false;
      end;
    end;
  end;
 finally
   cdstemp.Free;
   cdstemp2.Free;
   cdstemp3.Free;
 end;
end;

end.
