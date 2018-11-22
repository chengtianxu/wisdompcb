unit UMainfrm_Mod38OutToBill;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCommFunc, uBaseSinglePickListFrm,
  uBaseFrm,
  uBaseEditFrm, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, RzEdit,
  RzBtnEdt, uRKeyBtnEdit, Data.DB, Data.Win.ADODB, Vcl.Menus, Datasnap.DBClient,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh, USel468MtlFrm_mod38, UMod38Common, frxClass;

type
  TfrmMain_Mod38OutToBill = class(TfrmBaseEdit)
    pnl3: TPanel;
    pnl4: TPanel;
    pnl5: TPanel;
    lbl4: TLabel;
    lbl3: TLabel;
    lbl2: TLabel;
    lbl1: TLabel;
    edtWH: TRKeyRzBtnEdit;
    edtReqBillNo: TRKeyRzBtnEdit;
    lbl5: TLabel;
    edtOutBillNo: TRKeyRzBtnEdit;
    edtRemark: TRKeyRzBtnEdit;
    lbl6: TLabel;
    edtDept: TRKeyRzBtnEdit;
    edtReqMan: TRKeyRzBtnEdit;
    Label1: TLabel;
    cdstemp: TClientDataSet;
    cds457: TClientDataSet;
    ds457: TDataSource;
    pm468: TPopupMenu;
    mniSend: TMenuItem;
    mniSended: TMenuItem;
    cdsLookUp17: TClientDataSet;
    cds207: TClientDataSet;
    ds207: TDataSource;
    eh468: TDBGridEh;
    eh207: TDBGridEh;
    ds468: TDataSource;
    cds468: TClientDataSet;
    pm207: TPopupMenu;
    mniDel2: TMenuItem;
    mniReSet: TMenuItem;
    mniSendToBom: TMenuItem;
    mniCancelSendToBom: TMenuItem;
    chkPrt: TCheckBox;
    qry1: TADOQuery;
    atncfldqry1rkey17: TAutoIncField;
    strngfldqry1INV_PART_NUMBER: TStringField;
    strngfldqry1INV_NAME: TStringField;
    strngfldqry1INV_PART_DESCRIPTION: TStringField;
    strngfldqry1rohs: TStringField;
    strngfldqry1UNIT_NAME: TStringField;
    strngfldqry1ABBR_NAME: TStringField;
    strngfldqry1SUPPLIER2: TStringField;
    qry1quantity: TBCDField;
    frxrprt1: TfrxReport;
    edtPBillNo: TEdit;
    procedure edtWHButtonClick(Sender: TObject);
    procedure edtDeptButtonClick(Sender: TObject);
    procedure mniDel2Click(Sender: TObject);
    procedure mniSendClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure mniSendedClick(Sender: TObject);
    procedure mniReSetClick(Sender: TObject);
    procedure mniSendToBomClick(Sender: TObject);
    procedure mniCancelSendToBomClick(Sender: TObject);
    procedure edtReqManButtonClick(Sender: TObject);
    procedure edtPBillNoChange(Sender: TObject);
    procedure pm468Popup(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure eh207DblClick(Sender: TObject);
    procedure eh468DblClick(Sender: TObject);
    procedure edtDeptExit(Sender: TObject);
    procedure edtWHExit(Sender: TObject);
    procedure edtReqManExit(Sender: TObject);
    procedure eh468TitleClick(Column: TColumnEh);
  private
    { Private declarations }
    Ffrm: TFrmSel468Mtl_mod38;
    FDept_ptr,F05_ptr,FWH_ptr:Integer;
    procedure GetData468(Dept_ptr, WH_ptr, PBillNo: string);
    function IsStatusChanged: Boolean;
    procedure Apend207(Afrm: TFrmSel468Mtl_mod38);
    procedure ReSet;
    procedure ReSet2;

  public
    { Public declarations }
    procedure init;
    procedure GetData(ARKey: string);
    procedure Append457;

  end;

var
  frmMain_Mod38OutToBill: TfrmMain_Mod38OutToBill;

implementation

uses uReportFrm_mod38;
{$R *.dfm}

procedure TfrmMain_Mod38OutToBill.Apend207(Afrm: TFrmSel468Mtl_mod38);
begin
  gSvrIntf.IntfGetDataBySql
    ('select cast(getdate() as smalldatetime) as NDate ', cdstemp);

  cdsLookUp17.FieldByName('rkey').ReadOnly := false;
  cdsLookUp17.FieldByName('INV_DESCRIPTION').ReadOnly := false;

  cdsLookUp17.Append;
  cdsLookUp17.FieldByName('rkey').value :=
    Afrm.cdsPick.FieldByName('INVENTORY_PTR').asinteger;
  cdsLookUp17.FieldByName('INV_PART_NUMBER').value :=
    Afrm.cdsPick.FieldByName('INV_PART_NUMBER').AsString;
  cdsLookUp17.FieldByName('INV_name').value :=
    Afrm.cdsPick.FieldByName('INV_name').AsString;
  cdsLookUp17.FieldByName('INV_DESCRIPTION').value :=
    Afrm.cdsPick.FieldByName('INV_DESCRIPTION').AsString;
  cdsLookUp17.FieldByName('unit_name').value :=
    Afrm.cdsPick.FieldByName('unit_name').AsString;
  cdsLookUp17.FieldByName('rohs').value :=
    Afrm.cdsPick.FieldByName('rohs').AsString;
  cdsLookUp17.FieldByName('abbr_name').value :=
    Afrm.cdsPick.FieldByName('abbr_name').AsString;
  cdsLookUp17.FieldByName('SUPPLIER2').value :=
    Afrm.cdsPick.FieldByName('SUPPLIER2').AsString;
  cdsLookUp17.Post;

  cds207.Append;
  cds207.FieldByName('INVENTORY_PTR').value :=
    Afrm.cdsPick.FieldByName('INVENTORY_PTR').asinteger;
  cds207.FieldByName('D0022_PTR').value := Afrm.cdsPick.FieldByName('RKEY')
    .asinteger;

  cds207.FieldByName('D0468_PTR').value := cds468.FieldByName('RKEY').asinteger;
  if not cdstemp.IsEmpty then
    cds207.FieldByName('TDATE').value := cdstemp.FieldByName('NDate').value;
  cds207.FieldByName('QUANTITY').value := Afrm.Fqty;


  cds207.Post;

  eh207.DataSource := nil;
  eh207.DataSource := ds207;

  // 更新468

  cds468.Edit;
  cds468.FieldByName('QUAN_ISSUED').value := cds468.FieldByName('QUAN_ISSUED')
    .value + Afrm.Fqty;
  if cds468.FieldByName('QUAN_ISSUED').value >= cds468.FieldByName('QUAN_BOM').value
  then
    cds468.FieldByName('status').value := 1;
  cds468.Post;


end;

procedure TfrmMain_Mod38OutToBill.Append457;
//var
//Lsql:string;
begin
//   Lsql:='select dept_name from data0034 where  ';
//   gSvrIntf.
  cds457.Edit;
  cds457.FieldByName('GON_NUMBER').value := ffunc.GetMaxOutBillNo;
  cds457.Post;
end;

procedure TfrmMain_Mod38OutToBill.btnCloseClick(Sender: TObject);
begin
  inherited;
  close;
  // frmMain_Mod38OutToBill:=nil;
  // ffrm:=nil;
end;

procedure TfrmMain_Mod38OutToBill.btnSaveClick(Sender: TObject);
var
  Lnumber: string;
  LNnumber: string;
  cds22: TClientDataSet;

  cdstemp: TClientDataSet;
  cds14: TClientDataSet;
  cds314: TClientDataSet;
  cds17: TClientDataSet;

  cds04: TClientDataSet;
  cds475: TClientDataSet;
  cds403: TClientDataSet;
  Lcds468Save: TClientDataSet;

  LDSArr: OleVariant;
  Lsql, LFileName: string;
  LrkeyStr17, LrkeyStr22, LrkeyStr468, LrkeyStr22_468: string;
begin
  inherited;

  cds22 := TClientDataSet.create(nil);

  cdstemp := TClientDataSet.create(nil);

  cds04 := TClientDataSet.create(nil);
  cds14 := TClientDataSet.create(nil);
  cds314 := TClientDataSet.create(nil);
  cds17 := TClientDataSet.create(nil);

  cds475 := TClientDataSet.create(nil);
  cds403 := TClientDataSet.create(nil);
  Lcds468Save := TClientDataSet.create(nil);


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

  if Trim(edtReqMan.Text) = '' then
  begin
    ShowMessage('领料人员不能为空!');
    edtReqMan.SetFocus;
    exit;
  end;



  try
    try
      if ffunc.IsStockCheck(Lnumber) then
      begin
        messagedlg('仓库正在进行材料盘点暂时不能操作该程序,盘点代码及人员:' + Lnumber, mtinformation,
          [mbcancel], 0);
        exit;
      end;

      Lnumber := trim(edtOutBillNo.Text);
      if ffunc.IsBillNorepeated(Lnumber, LNnumber) then
      begin
        edtOutBillNo.Text := LNnumber;
        cds457.Edit;
        cds457.FieldByName('GON_NUMBER').Value:= LNnumber;
        cds457.Post;
        messagedlg('出仓单号重复,可能有多台计算机同时新增,系统自动更新编号为:' + LNnumber, mtinformation,
          [mbok], 0);
      end;

      if IsStatusChanged then
      begin
        messagedlg('材料发放不成功库存记录发生变化!请重新选择库存发放', mterror, [mbcancel], 0);
        // GetData('-1');
        exit;
      end;

      cds457.Edit;
      // if cds457.FieldByName('IDKEy').value = '' then
      cds457.FieldByName('IDKEy').value := gFunc.CreateIDKey;
      cds457.FieldByName('GON_NUMBER').value := ffunc.GetMaxOutBillNo;
      cds457.FieldByName('create_date').value := gFunc.GetSvrDateTime;
      cds457.FieldByName('status').value := 0;
      cds457.FieldByName('create_by').value := gVar.rkey05;
      cds457.FieldByName('TType').value := 1;
      cds457.Post;

      gSvrIntf.IntfGetDataBySql
        ('select cast(getdate() as smalldatetime) as NDate ', cdstemp);


      // 得到cds207所有的d222rkey 和D17rkey ,468rkey
      LrkeyStr22 := ffunc.GetRkeyStr(cds207, 'D0022_PTR');
      LrkeyStr17 := ffunc.GetRkeyStr(cds207, 'INVENTORY_PTR');
      LrkeyStr468 := ffunc.GetRkeyStr(cds207, 'D0468_ptr');
      LrkeyStr22_468 := ffunc.GetTwoRkeyStr(cds207, 'D0022_ptr', 'D0468_ptr');

     //showmessage('17:' + LrkeyStr17 + '-22:' + LrkeyStr22 + '-468:'+LrkeyStr468);

      gSvrIntf.IntfGetDataBySql('select * from data0022 where rkey in  ' +
        LrkeyStr22, cds22);

      gSvrIntf.IntfGetDataBySql('select * from data0017 where rkey in ' +
        LrkeyStr17, cds17);

      gSvrIntf.IntfGetDataBySql('select * from data0468 where rkey in ' +
        LrkeyStr468, Lcds468Save);

      Lsql := 'select  *   from data0475 where cast(rkey22 as varchar)+''-''+cast(rkey468 as varchar) in '
        + LrkeyStr22_468;
      if not gSvrIntf.IntfGetDataBySql(Lsql, cds475) then
      begin
        showmessage('cdstemp475错误!');
        exit;
      end;

      cds457.DisableControls;
      cds207.DisableControls;
      cds207.First;
      while not cds207.Eof do
      begin
        cds207.Edit;
        cds207.FieldByName('TTYPE').value := 1;
        cds207.FieldByName('DEPT_PTR').value := cds457.FieldByName('dept_ptr')
          .asinteger;
        if not cdstemp.IsEmpty then
          cds207.FieldByName('TDATE').value :=
            cdstemp.FieldByName('NDate').value;
        cds207.FieldByName('RTN_QUANTITY').value := 0;
        cds207.FieldByName('STANDARD_COST').value := 0;
        cds207.FieldByName('Invent_or').value := 0;

        cds207.FieldByName('D457_IDKey').value :=
          cds457.FieldByName('IDKey').AsString;
        cds207.Post;

      // 1.减去22现有库存  set data0022.quan_on_hand=data0022.quan_on_hand-d1.qty
      // 2.减去22已分配的库存  'set QUAN_TO_BE_STOCKED=data0022.QUAN_TO_BE_STOCKED-d1.qty'+#13+
      // 1.减去库存17中已分配的数量  set QUAN_ASSIGN=Data0017.QUAN_ASSIGN-d1.total_QUANTITY
      // 减去库存17中的库数量   set Data0017.QUAN_ON_HAND=Data0017.QUAN_ON_HAND-d1.total_QUANTITY

        // 1.更新22
        if cds22.Locate('rkey', cds207.FieldByName('D0022_ptr').asinteger, [])
        then
        begin

          if cds22.FieldByName('quan_on_hand').value <
            cds207.FieldByName('QUANTITY').value then
          begin
            showmessage('发料失败,可能多用户同时发放了同一批物料且导致库存出现负数!请重发');
            Ffrm.cdsPick.CancelUpdates;
            // ReSet;
            exit;
          end;

          cds22.Edit;
          cds22.FieldByName('quan_on_hand').value :=
            cds22.FieldByName('quan_on_hand').value -
            cds207.FieldByName('QUANTITY').value;
          cds22.Post;

          if cds475.Locate('rkey22;rkey468',
            vararrayof([cds207.FieldByName('D0022_ptr').asinteger,
            cds207.FieldByName('D0468_ptr').asinteger]), []) then
          begin
            cds22.Edit;
            cds22.FieldByName('QUAN_TO_BE_STOCKED').value :=
              cds22.FieldByName('QUAN_TO_BE_STOCKED').value -
              cds207.FieldByName('QUANTITY').value;
            cds22.Post;
          end;
        end;

        //更新17
        if cds17.Locate('rkey', cds207.FieldByName('INVENTORY_PTR')
          .asinteger, []) then
        begin
          cds17.Edit;
          cds17.FieldByName('quan_on_hand').value :=
            cds17.FieldByName('quan_on_hand').value -
            cds207.FieldByName('QUANTITY').value;
          cds17.Post;

          if cds475.Locate('rkey22;rkey468',
            vararrayof([cds207.FieldByName('D0022_ptr').asinteger,
            cds207.FieldByName('D0468_ptr').asinteger]), []) then
          begin
            cds17.Edit;
            cds17.FieldByName('QUAN_ASSIGN').value :=
              cds17.FieldByName('QUAN_ASSIGN').value -
              cds207.FieldByName('QUANTITY').value;
            cds17.Post;
          end;
        end;

        // 更新468:
        if Lcds468Save.Locate('rkey', cds207.FieldByName('D0468_ptr')
          .asinteger, []) then
        begin
          // if  cds207.FieldByName('QUANTITY').tag=3 then
          // begin
          // Lcds468Save.Edit;
          // Lcds468Save.FieldByName('status').value :=1;
          // Lcds468Save.post;
          // end;

          if Lcds468Save.FieldByName('quan_alloc').value > 0 then
          begin
            Lcds468Save.Edit;
            Lcds468Save.FieldByName('QUAN_ISSUED').value := // 已发放数
              Lcds468Save.FieldByName('QUAN_ISSUED').value +
              cds207.FieldByName('QUANTITY').value;
            Lcds468Save.FieldByName('quan_alloc').value :=
              Lcds468Save.FieldByName('quan_alloc').value -
              cds207.FieldByName('QUANTITY').value; //
            if Lcds468Save.FieldByName('QUAN_ISSUED').value >=
              Lcds468Save.FieldByName('QUAN_BOM').value then
              Lcds468Save.FieldByName('status').value := 1; // 468发放完毕状态
            Lcds468Save.Post;
          end
          else
          begin
            Lcds468Save.Edit;
            Lcds468Save.FieldByName('QUAN_ISSUED').value := // 已发放数
              Lcds468Save.FieldByName('QUAN_ISSUED').value +
              cds207.FieldByName('QUANTITY').value;
            if Lcds468Save.FieldByName('QUAN_ISSUED').value >=
              Lcds468Save.FieldByName('QUAN_BOM').value then
              Lcds468Save.FieldByName('status').value := 1; // 468发放完毕状态
            Lcds468Save.Post;
          end;

          // if cds468.Locate('rkey', cds207.FieldByName('D0468_ptr').asinteger, []) then
          // begin
          // if cds468.FieldByName('QUAN_ISSUED').value >= cds468.FieldByName('QUAN_BOM').value then
          // begin
          //
          // Lcds468Save.Edit;
          // Lcds468Save.FieldByName('status').value :=1;
          // Lcds468Save.post;
          // end
          // else if cds468.FieldByName('status').tag=3 then
          // begin
          // Lcds468Save.Edit;
          // Lcds468Save.FieldByName('status').value :=1;
          // Lcds468Save.post;
          // end;
          // end;

        end;
        cds207.next;
      end;

      // 删除分配记录
      gSvrIntf.IntfGetDataBySql(Lsql, cds475);
      while cds475.recordcount > 0 do
        cds475.Delete;

      // 更新出库编号
      gSvrIntf.IntfGetDataBySql('select * from data0004 where rkey=56 ', cds04);
      ffunc.UpdateBillNo(trim(edtOutBillNo.Text), cds04);

      // 发信息
      gSvrIntf.IntfGetDataBySql('select * from data0014 where rkey=0 ', cds14);
      gSvrIntf.IntfGetDataBySql('select * from data0314 where rkey=0 ', cds314);
      ffunc.send_message(LrkeyStr17, cds14, cds314);

      LDSArr := VarArrayCreate([0, 9], varVariant);
      if cds457.ChangeCount > 0 then
        LDSArr[0] := cds457.delta;
      if cds207.ChangeCount > 0 then
        LDSArr[1] := cds207.delta;

      if cds04.ChangeCount > 0 then
        LDSArr[2] := cds04.delta;
      if Lcds468Save.ChangeCount > 0 then
        LDSArr[3] := Lcds468Save.delta;
      if cds22.ChangeCount > 0 then
        LDSArr[4] := cds22.delta;
      if cds17.ChangeCount > 0 then
        LDSArr[5] := cds17.delta;
      if cds14.ChangeCount > 0 then
        LDSArr[6] := cds14.delta;
      if cds314.ChangeCount > 0 then
        LDSArr[7] := cds314.delta;
      if cds403.ChangeCount > 0 then
        LDSArr[8] := cds403.delta;
      if cds475.ChangeCount > 0 then
        LDSArr[9] := cds475.delta;

      if gSvrIntf.IntfPostModData('公共基础', 38, LDSArr, 10) then
      begin
        cds457.MergeChangeLog;
        cds207.MergeChangeLog;
        showmessage('发到配料单成功!');
      end
      else
        exit;

      if chkPrt.Checked then
      begin
        gSvrIntf.IntfGetDataBySql('select * from data0457 where GON_NUMBER=''' +
          trim(edtOutBillNo.Text) + ''' ', cdstemp);
        try
          frmReport_mod38 := TfrmReport_mod38.create(Self);
          frmReport_mod38.GetData(cdstemp.FieldByName('rkey').AsString);

          LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),
            'ERP_3_TIER\', 'ERP_3_TIER\REPORTS\库存管理_材料进出\', [rfReplaceAll]) +
            '材料出库单.fr3';
          frxrprt1.LoadFromFile(LFileName, true);
          frxrprt1.ShowReport;
        finally
          frmReport_mod38.free;
        end;
      end;

     FDept_ptr:= cds457.FieldByName('Dept_ptr').value;
     F05_ptr:= cds457.FieldByName('recd_by').value;
     FWH_ptr:=  cds457.FieldByName('warehouse_ptr').value;
      ReSet2;

     // edtDeptButtonClick(sender);
     Ffrm:=nil;
    except
      on e: exception do
      begin
        showmessage('错误:' + e.Message);
        exit;
      end;
    end;

  finally
    cds207.EnableConstraints;
    cds457.EnableControls;
    cds22.free;

    cdstemp.free;
    cds14.free;
    cds314.free;
    cds17.free;

    cds04.free;
    cds475.free;
    cds403.free;
    Lcds468Save.free;
    Ffrm:=nil;

  end;

end;

procedure TfrmMain_Mod38OutToBill.edtDeptButtonClick(Sender: TObject);
var
  Lfrm: TfrmSinglePickList;
begin

  Lfrm := TfrmSinglePickList.create(Self);
  try
    Lfrm.InitWithPickID(38, 1);
    if Lfrm.showmodal = mrok then
    begin
      cds457.Edit;
      cds457.FieldByName('Dept_ptr').value :=
        Lfrm.cdsPick.FieldByName('rkey').value;
      cds457.Post;

      if trim(edtWH.Text) <> '' then
        GetData468(cds457.FieldByName('Dept_ptr').AsString,
          cds457.FieldByName('warehouse_ptr').AsString, '-1');
    end;
  finally
    Lfrm.free;
  end;
end;

procedure TfrmMain_Mod38OutToBill.edtDeptExit(Sender: TObject);
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

      if trim(edtWH.Text) <> '' then
        GetData468(cds457.FieldByName('Dept_ptr').AsString,
        cds457.FieldByName('warehouse_ptr').AsString, '-1');

 end;

end;

procedure TfrmMain_Mod38OutToBill.edtPBillNoChange(Sender: TObject);
begin
  inherited;
  if trim(edtPBillNo.Text) <> '' then
  begin
    // Lsql:='INV_PART_NUMBER like ''%'+trim(edtPBillNo.text)+'%'' ';
    if edtPBillNo.Hint<>'' then
    cds468.Filter :=edtPBillNo.Hint+ ' like ''%' + trim(edtPBillNo.Text)
      + '%'' '
      else
     cds468.Filter := 'CUT_NO like ''%' + trim(edtPBillNo.Text)
      + '%'' '  ;
    cds468.Filtered := true;
  end
  else
    cds468.Filter := '';

end;

procedure TfrmMain_Mod38OutToBill.edtReqManButtonClick(Sender: TObject);
var
  Lfrm: TfrmSinglePickList;
begin

  Lfrm := TfrmSinglePickList.create(Self);
  try
    Lfrm.InitWithPickID(38, 2);
    if Lfrm.showmodal = mrok then
    begin
      cds457.Edit;
      cds457.FieldByName('Recd_by').value :=
        Lfrm.cdsPick.FieldByName('rkey').value;
      cds457.Post;
    end;
  finally
    Lfrm.free;
  end;
end;

procedure TfrmMain_Mod38OutToBill.edtReqManExit(Sender: TObject);
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

procedure TfrmMain_Mod38OutToBill.edtWHButtonClick(Sender: TObject);
var
  Lfrm: TfrmSinglePickList;
begin

  Lfrm := TfrmSinglePickList.create(Self);
  try
    Lfrm.InitWithPickID(38, 0);
    if Lfrm.showmodal = mrok then
    begin
      cds457.Edit;
      cds457.FieldByName('warehouse_ptr').value :=
        Lfrm.cdsPick.FieldByName('rkey').value;
      cds457.Post;

      if trim(edtDept.Text) <> '' then
        GetData468(cds457.FieldByName('Dept_ptr').AsString,
          cds457.FieldByName('warehouse_ptr').AsString, '');
    end;
  finally
    Lfrm.free;
  end;
end;

procedure TfrmMain_Mod38OutToBill.edtWHExit(Sender: TObject);
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

procedure TfrmMain_Mod38OutToBill.eh207DblClick(Sender: TObject);
begin
  inherited;
  if (cds468.FieldByName('status').value = 0) and (not cds468.IsEmpty) then
    edtReqBillNo.Text := cds468.FieldByName('cut_no').value;
end;

procedure TfrmMain_Mod38OutToBill.eh468DblClick(Sender: TObject);
begin
  inherited;
  if (cds468.FieldByName('status').value = 0) and (not cds468.IsEmpty) then
    begin
    edtReqBillNo.Text := cds468.FieldByName('cut_no').value;
    cds457.Edit;
    cds457.FieldByName('ref_number').Value:= cds468.FieldByName('cut_no').value;
    cds457.Post;
    end;
end;

procedure TfrmMain_Mod38OutToBill.eh468TitleClick(Column: TColumnEh);
begin
  inherited;
   edtPBillNo.Hint:= Column.FieldName;
  Label1.Caption:=Column.Title.Caption;
end;

procedure TfrmMain_Mod38OutToBill.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmMain_Mod38OutToBill := nil;
 //Ffrm := nil;    //0801

end;

procedure TfrmMain_Mod38OutToBill.FormCreate(Sender: TObject);
begin
  inherited;
//  Ffrm := TFrmSel468Mtl_mod38.create(Self);
//  Ffrm.InitWithPickID(38, 8);
//  Ffrm.height := 800;
//  Ffrm.width := 800;
  Self.Tag := 1;
end;

procedure TfrmMain_Mod38OutToBill.FormShow(Sender: TObject);
begin
  inherited;
  edtWH.Enabled := true;
  edtDept.Enabled := true;
end;

procedure TfrmMain_Mod38OutToBill.GetData(ARKey: string);
var
  LsqlLookUp17, Lsql457, Lsql207: string;
begin
  inherited;
  LsqlLookUp17 :=
    ' select  d17.RKEY as rkey,  d17.INV_PART_NUMBER,d17.INV_NAME,d17.INV_DESCRIPTION, '
    + ' d22.rohs,d02.UNIT_NAME,d23.ABBR_NAME ,d22.SUPPLIER2 ,d207.quantity ' +
    ' from Data0207 d207' +
    ' inner join data0017 d17 on d207.INVENTORY_PTR=d17.RKEY' +
    ' inner join Data0022 d22 on d207.D0022_PTR=d22.rkey' +
    ' inner join Data0002 d02 on d22.LOCATION_PTR_FROM=d02.RKEY' +
    ' INNER JOIN dbo.Data0456 d456 ON d22.GRN_PTR = d456.RKEY' +
    ' inner join Data0023 d23 on d456.SUPP_PTR = d23.RKEY' +
    ' where d207.GON_PTR = ' + ARKey;

  Lsql457 := 'select * from data0457  where rkey= ' + ARKey;
  Lsql207 := 'select * from data0207  where rkey= ' + ARKey;;

  gSvrIntf.IntfGetDataBySqlArr(vararrayof([LsqlLookUp17, Lsql457, Lsql207]),
    [cdsLookUp17, cds457, cds207]);

end;

procedure TfrmMain_Mod38OutToBill.GetData468(Dept_ptr, WH_ptr, PBillNo: string);
var
  Lsql: string;
begin
  Lsql := ' SELECT TOP 100 PERCENT Data0468.CUT_NO, Data0468.INVENT_PTR, Data0468.RKEY,  '
    + '  Data0468.STATUS, Data0017.STOCK_UNIT_PTR, Data0017.INV_PART_NUMBER,         '
    + ' Data0017.INV_NAME, Data0017.INV_DESCRIPTION, Data0468.QUAN_BOM, data0023.abbr_name,'
    + ' Data0468.QUAN_ISSUED, Data0002.UNIT_NAME, data0002.UNIT_CODE, data0492.ISSUE_DATE,'
    + ' data0017.quan_on_hand-data0017.QUAN_ASSIGN as quan_on_hand,data0468.quan_alloc, data0468.VENDOR,'
    + ' data0468.quan_alloc as alloc,case data0468.PRINTIT when ''N'' then ''VMI库存'' else ''普通库存'' end as sotck_type'
    + ' FROM data0492 INNER JOIN' +
    ' Data0468 ON data0492.CUT_NO = Data0468.CUT_NO INNER JOIN' +
    ' Data0002 INNER JOIN' +
    ' Data0017 ON Data0002.RKEY = Data0017.STOCK_UNIT_PTR ON' +
    ' Data0468.INVENT_PTR = Data0017.RKEY left join data0023' +
    ' on data0468.supplier_ptr=data0023.rkey' + ' WHERE (Data0468.DEPT_PTR =' +
    Dept_ptr + ') AND' + ' (data0492.WHOUSE_PTR =' + WH_ptr + ') And' +
    ' (Data0468.STATUS = 0) AND' + ' (data0492.Con_Flag = 2) and' +
    ' (data0468.invent_or=0)' + 'and  ''' + PBillNo +
    ''' in (''-1'', Data0468.INVENT_PTR) ' + ' order by Data0468.CUT_NO';
  // showmessage(Lsql);
  gSvrIntf.IntfGetDataBySql(Lsql, cds468);

end;

procedure TfrmMain_Mod38OutToBill.init;
var
  LLKField: TField;
  i: integer;
begin
  gSvrIntf.IntfGetDataBySql('SELECT * FROM data0207 WHERE 1=0', cds207);
  // 在数据集关闭的情况下新增加一个字段
  try
    cds207.close;
    cds207.FieldDefs.BeginUpdate;
    for i := 0 to cds207.FieldDefList.Count - 1 do
    begin
      cds207.FieldDefList.FieldDefs[i].CreateField(Self);
    end;
    // Add New Field
    // 增加新的字段
    LLKField := TStringField.create(cds207);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'INV_PART_NUMBER';
    LLKField.KeyFields := 'INVENTORY_PTR';
    LLKField.LookupDataSet := cdsLookUp17;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'INV_PART_NUMBER';
    LLKField.DataSet := cds207;

    LLKField := TStringField.create(cds207);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'inv_name';
    LLKField.KeyFields := 'INVENTORY_PTR';
    LLKField.LookupDataSet := cdsLookUp17;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'inv_name';
    LLKField.DataSet := cds207;

    LLKField := TStringField.create(cds207);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'INV_DESCRIPTION';
    LLKField.KeyFields := 'INVENTORY_PTR';
    LLKField.LookupDataSet := cdsLookUp17;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'INV_DESCRIPTION';
    LLKField.DataSet := cds207;

    LLKField := TStringField.create(cds207);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'unit_name';
    LLKField.KeyFields := 'INVENTORY_PTR';
    LLKField.LookupDataSet := cdsLookUp17;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'unit_name';
    LLKField.DataSet := cds207;

    LLKField := TStringField.create(cds207);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'rohs';
    LLKField.KeyFields := 'INVENTORY_PTR';
    LLKField.LookupDataSet := cdsLookUp17;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'rohs';
    LLKField.DataSet := cds207;

    LLKField := TStringField.create(cds207);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'ABBR_NAME';
    LLKField.KeyFields := 'INVENTORY_PTR';
    LLKField.LookupDataSet := cdsLookUp17;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'ABBR_NAME';
    LLKField.DataSet := cds207;

    LLKField := TStringField.create(cds207);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'SUPPLIER2';
    LLKField.KeyFields := 'INVENTORY_PTR';
    LLKField.LookupDataSet := cdsLookUp17;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'SUPPLIER2';
    LLKField.DataSet := cds207;

  finally
    cds207.FieldDefs.EndUpdate;
  end;

end;

function TfrmMain_Mod38OutToBill.IsStatusChanged: Boolean;
// var
// Lsql: string;
begin
  result := false;

  cds207.First;
  while not cds207.Eof do
  begin
    gSvrIntf.IntfGetDataBySql('select rkey from data0022  where rkey =' +
      cds207.FieldByName('D0022_ptr').AsString + ' ', cdstemp);
    if cdstemp.IsEmpty then
    begin
      result := true;
      break;
    end;
    cds207.next;
  end;

end;

procedure TfrmMain_Mod38OutToBill.mniCancelSendToBomClick(Sender: TObject);
begin
  inherited;

  Ffrm.cdsPick.Filter := '';
  cds468.Edit;
  cds468.FieldByName('quan_alloc').value := cds468.FieldByName('alloc').value;
  cds468.FieldByName('QUAN_ISSUED').value := cds468.FieldByName('QUAN_ISSUED')
    .value - cds468.FieldByName('alloc').value;
  cds468.Post;

  cds207.DisableControls;
  try
    try
      cds207.First;
      while not cds207.Eof do
      begin
        if cds207.FieldByName('D0468_ptr').value = cds468.FieldByName('rkey').value
        then
        begin
          if (Ffrm.cdsPick.Locate('rkey', cds207.FieldByName('D0022_ptr').value,
            [])) then
          begin
            Ffrm.cdsPick.readonly:=false;
            Ffrm.cdsPick.Edit;
            Ffrm.cdsPick.FieldByName('QUAN_ON_HAND').value :=
              Ffrm.cdsPick.FieldByName('QUAN_ON_HAND').value +
              cds207.FieldByName('QUANTITY').value;
            Ffrm.cdsPick.Post;

          end;
          cdsLookUp17.Delete;
           cds207.Delete;


        end
        else
          cds207.next;
      end;

    except
      on e: exception do
      begin
        showmessage('错误:' + e.Message);
        exit;
      end;
    end;

  finally
    cds207.EnableControls;
  end;

end;

procedure TfrmMain_Mod38OutToBill.mniDel2Click(Sender: TObject);

begin
  inherited;

  if cds207.IsEmpty then
    exit;

  Ffrm.cdsPick.Filter := '';

  if cds468.Locate('rkey', cds207.FieldByName('D0468_ptr').asinteger, []) then
    if cds468.FieldByName('alloc').value > 0 then
      showmessage('按分配发放的材料不能单项删除,请从发放处整体取消发放!')
    else
    begin
      Ffrm.cdsPick.Filter := '';
      if (Ffrm.cdsPick.Locate('rkey', cds207.FieldByName('D0022_ptr').asinteger,
        [])) and (cds468.Locate('rkey', cds207.FieldByName('D0468_ptr')
        .asinteger, [])) then
      begin
         Ffrm.cdsPick.ReadOnly := false;
        Ffrm.cdsPick.Edit;
        Ffrm.cdsPick.FieldByName('QUAN_ON_HAND').value :=
          Ffrm.cdsPick.FieldByName('QUAN_ON_HAND').value +
          cds207.FieldByName('quantity').value;
        Ffrm.cdsPick.Post;


       // cds468.ReadOnly := false;
        cds468.Edit;
        cds468.FieldByName('QUAN_ISSUED').value :=
          cds468.FieldByName('QUAN_ISSUED').value -
          cds207.FieldByName('quantity').value;
        if cds468.FieldByName('STATUS').value = 1 then
          cds468.FieldByName('STATUS').value := 0;
        cds468.Post;

          cdsLookUp17.Delete;
          cds207.Delete;



      end
      else
        messagedlg('删除操作不成功!', mterror, [mbcancel], 0);
    end;

end;

procedure TfrmMain_Mod38OutToBill.mniReSetClick(Sender: TObject);
var
  Lcds468Save: TClientDataSet;
begin
  inherited;

  Lcds468Save := TClientDataSet.create(nil);
  try
    gSvrIntf.IntfGetDataBySql('select * from data0468 where rkey = ' +
      cds468.FieldByName('rkey').AsString, Lcds468Save);

    Lcds468Save.Edit;
    Lcds468Save.FieldByName('status').value := 0;
    Lcds468Save.Post;

    if Lcds468Save.ChangeCount > 0 then
      gSvrIntf.IntfPostDataByTable('data0468', Lcds468Save.delta);

    // 界面状态修改；
    cds468.Edit;
    cds468.FieldByName('status').value := 0;
    cds468.Post;

  finally
    Lcds468Save.free;
  end;
end;

procedure TfrmMain_Mod38OutToBill.mniSendClick(Sender: TObject);
begin
  inherited;

  if trim(edtWH.Text) = '' then
  begin
    showmessage('请首先输入发料工厂信息!');
    exit;
  end;
  if cds207.recordcount > 0 then
  begin
    edtWH.Enabled := false;
    edtDept.Enabled := false;
  end;

   if Ffrm=nil then
   begin
   Ffrm := TFrmSel468Mtl_mod38.create(Self);
   Ffrm.InitWithPickID(38, 8);
   Ffrm.height := 800;
   Ffrm.width := 800;
   end;


  Ffrm.cdsPick.Filter := '   warehouse_ptr=' + cds457.FieldByName
    ('warehouse_ptr').AsString + ' and INVENTORY_PTR = ' +
    cds468.FieldByName('invent_ptr').AsString;
  Ffrm.cdsPick.Filtered := true;

  Ffrm.FType := 0; // 搂配料单 发放；
  Ffrm.quan_bom := cds468.FieldByName('quan_bom').AsString;
  Ffrm.quan_Issued := cds468.FieldByName('quan_Issued').AsString;
  Ffrm.invent_ptr := cds468.FieldByName('INVENT_PTR').AsString;
  Ffrm.cbbWH.ItemIndex := Ffrm.cbbWH.Items.IndexOf
    (edtWH.DisplayNoteLabel.Caption);
  Ffrm.FParentCallBack := Apend207;
  Ffrm.edtFilter.Text := '';
  Ffrm.showmodal;

  if cds207.recordcount > 0 then
  begin
    edtWH.Enabled := false;
    edtDept.Enabled := false;
  end;
end;

procedure TfrmMain_Mod38OutToBill.mniSendedClick(Sender: TObject);
var
  Lcds468Save: TClientDataSet;
begin
  inherited;



  Lcds468Save := TClientDataSet.create(nil);
  try
    gSvrIntf.IntfGetDataBySql('select * from data0468 where rkey = ' +
      cds468.FieldByName('rkey').AsString, Lcds468Save);

    Lcds468Save.Edit;
    Lcds468Save.FieldByName('status').value := 1;
    Lcds468Save.Post;

    if Lcds468Save.ChangeCount > 0 then
      gSvrIntf.IntfPostDataByTable('data0468', Lcds468Save.delta);

    // 界面状态修改；

    cds468.Edit;
    cds468.FieldByName('status').value := 1;
    cds468.Post;

  finally
    Lcds468Save.free;
  end;
end;

procedure TfrmMain_Mod38OutToBill.mniSendToBomClick(Sender: TObject);
var
  Lsql: string;
begin
  inherited;
  try
  if Ffrm=nil then
   begin
   Ffrm := TFrmSel468Mtl_mod38.create(Self);
   Ffrm.InitWithPickID(38, 8);
   Ffrm.height := 800;
   Ffrm.width := 800;
   end;

    Ffrm.cdsPick.Filter := '';

    Lsql := 'SELECT     dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME,' +
      #13 + 'dbo.Data0017.INV_DESCRIPTION, dbo.Data0022.rohs, dbo.Data0002.UNIT_NAME,'
      + #13 + 'dbo.DATA0475.quan_alloc, dbo.Data0022.INVENTORY_PTR,' + #13 +
      'dbo.Data0022.RKEY, dbo.Data0017.STD_COST, dbo.Data0022.SUPPLIER2,' + #13
      + 'dbo.Data0023.ABBR_NAME' + #13 + 'FROM dbo.DATA0475 INNER JOIN' + #13 +
      'dbo.Data0022 ON dbo.DATA0475.rkey22 = dbo.Data0022.RKEY INNER JOIN' + #13
      + 'dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR = dbo.Data0017.RKEY INNER JOIN'
      + #13 + 'dbo.Data0002 ON dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0002.RKEY INNER JOIN'
      + #13 + 'dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY INNER JOIN'
      + #13 + 'dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY' + #13
      + 'where DATA0475.rkey468=' + cds468.FieldByName('rkey').AsString;
    gSvrIntf.IntfGetDataBySql(Lsql, cdstemp);

    if cdstemp.IsEmpty then
    begin
      showmessage('自动发放失败,可能被其用户发放或者取消分配了');
      exit;
    end;

    cdstemp.First;
    while not cdstemp.Eof do
    begin

      cdsLookUp17.FieldByName('rkey').ReadOnly := false;
      cdsLookUp17.Append;
      cdsLookUp17.FieldByName('rkey').value :=
        cdstemp.FieldByName('INVENTORY_PTR').AsString;
      cdsLookUp17.FieldByName('INV_PART_NUMBER').value :=
        cdstemp.FieldByName('INV_PART_NUMBER').AsString;
      cdsLookUp17.FieldByName('INV_NAME').value :=
        cdstemp.FieldByName('INV_NAME').AsString;
      cdsLookUp17.FieldByName('INV_DESCRIPTION').value :=
        cdstemp.FieldByName('INV_DESCRIPTION').AsString;
      cdsLookUp17.FieldByName('rohs').value :=
        cdstemp.FieldByName('rohs').AsString;
      cdsLookUp17.FieldByName('unit_name').value :=
        cdstemp.FieldByName('unit_name').AsString;
      cdsLookUp17.FieldByName('ABBR_NAME').value :=
        cdstemp.FieldByName('ABBR_NAME').AsString;
      cdsLookUp17.FieldByName('SUPPLIER2').value :=
        cdstemp.FieldByName('SUPPLIER2').AsString;
      cdsLookUp17.Post;

      cds207.Append;
      cds207.FieldByName('quantity').value :=
        cdstemp.FieldByName('quan_alloc').AsString;
      cds207.FieldByName('INVENTORY_PTR').value :=
        cdstemp.FieldByName('INVENTORY_PTR').AsString;
      cds207.FieldByName('D0022_ptr').value :=
        cdstemp.FieldByName('RKEY').AsString;
      cds207.FieldByName('STANDARD_COST').value :=
        cdstemp.FieldByName('STD_COST').AsString;
      cds207.FieldByName('D0468_PTR').value := cds468.FieldByName('rkey')
        .asinteger;

      cds207.Post;

      eh207.DataSource := nil;
      eh207.DataSource := ds207;

      // 更新22的qty

      if (Ffrm.cdsPick.Locate('rkey', cdstemp.FieldByName('RKEY').value, []))
      then
       Ffrm.cdsPick.ReadOnly := false;
      Ffrm.cdsPick.Edit;
      Ffrm.cdsPick.FieldByName('QUAN_ON_HAND').value :=
        Ffrm.cdsPick.FieldByName('QUAN_ON_HAND').value -
        cdstemp.FieldByName('quan_alloc').value;
      Ffrm.cdsPick.Post;
      cdstemp.next;
    end;

    // 更新界面的468：
    cds468.Edit;
    cds468.FieldByName('QUAN_ISSUED').value := cds468.FieldByName('QUAN_ISSUED')
      .value + cds468.FieldByName('quan_alloc').value;
    cds468.FieldByName('quan_alloc').value := 0;
    if cds468.FieldByName('QUAN_ISSUED').value >= cds468.FieldByName('QUAN_BOM')
      .value then
      cds468.FieldByName('status').value := 1; // 468发放完毕状态
    cds468.Post;

    if cds207.recordcount > 0 then
    begin
      edtWH.Enabled := false;
      edtDept.Enabled := false;
    end;
  except
    on e: exception do
    begin
      showmessage('错误:' + e.Message);
      exit;
    end;
  end;

end;

procedure TfrmMain_Mod38OutToBill.pm468Popup(Sender: TObject);
begin
  inherited;
  if cds468.IsEmpty then
  begin
    mniSend.Enabled := false;
    mniSended.Enabled := false;
    mniReSet.Enabled := false;
    mniSendToBom.Enabled := false;
    mniCancelSendToBom.Enabled := false;
  end
  else
  begin
    if cds468.FieldByName('STATUS').value = 0 then
    begin
      if cds468.FieldByName('alloc').value = 0 then // 正常发放
      begin
        mniSend.Enabled := true;
        mniSended.Enabled := true;
        mniSendToBom.Enabled := false;
        mniCancelSendToBom.Enabled := false;
      end
      else // 按分配发放
      begin
        mniSend.Enabled := false;
        mniSended.Enabled := false;
        if cds468.FieldByName('QUAN_ISSUED').value = 0 then // 未发放
        begin
          mniSendToBom.Enabled := true;
          mniCancelSendToBom.Enabled := false;
        end
        else // 已发放
        begin
          mniSendToBom.Enabled := false;
          mniCancelSendToBom.Enabled := true;
        end;
      end;

      mniReSet.Enabled := false;
    end
    else
    begin
      mniSend.Enabled := false;
      mniSended.Enabled := false;
      mniSendToBom.Enabled := false;
      mniCancelSendToBom.Enabled := false;
      mniReSet.Enabled := true;
    end;
  end;
end;

procedure TfrmMain_Mod38OutToBill.ReSet;
begin
  GetData468('-1', '-1', '-1');
  GetData('-1');
  cds457.Edit;
  cds457.FieldByName('GON_NUMBER').value := ffunc.GetMaxOutBillNo;
  cds457.FieldByName('recd_BY').value := F05_ptr;
  cds457.FieldByName('dept_ptr').value := FDept_ptr;
  cds457.Post;
  edtWH.Enabled := true;
  edtDept.Enabled := true;
  edtPBillNo.Text := '';
end;

procedure TfrmMain_Mod38OutToBill.ReSet2;
begin
  GetData468(IntToStr(FDept_ptr),IntToStr(FWH_ptr),'-1');
  GetData('-1');
  cds457.Edit;
  cds457.FieldByName('GON_NUMBER').value := ffunc.GetMaxOutBillNo;
  cds457.FieldByName('recd_BY').value := F05_ptr;
  cds457.FieldByName('dept_ptr').value := FDept_ptr;
  cds457.FieldByName('warehouse_ptr').value := FWH_ptr;
  cds457.Post;

  edtWH.Enabled := true;
  edtDept.Enabled := true;
  edtPBillNo.Text := '';
end;

end.
