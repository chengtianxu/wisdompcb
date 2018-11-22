unit UMainfrm_Mod38OutToReq;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UMod38Common, uCommFunc,
  uBaseSinglePickListFrm, uBaseEditFrm,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB,
  Data.Win.ADODB, Vcl.Menus, Datasnap.DBClient, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.StdCtrls, Vcl.Mask, RzEdit, RzBtnEdt,
  uRKeyBtnEdit, Vcl.Buttons, Vcl.ExtCtrls, USel468MtlFrm_mod38, frxClass;

type
  TfrmMain_Mod38OutToReq = class(TfrmBaseEdit)
    pnl3: TPanel;
    lbl4: TLabel;
    lbl3: TLabel;
    lbl2: TLabel;
    lbl1: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    edtWH: TRKeyRzBtnEdit;
    edtReqBillNo: TRKeyRzBtnEdit;
    edtOutBillNo: TRKeyRzBtnEdit;
    edtRemark: TRKeyRzBtnEdit;
    edtDept: TRKeyRzBtnEdit;
    edtReqMan: TRKeyRzBtnEdit;
    chkPrt: TCheckBox;
    pnl4: TPanel;
    eh468: TDBGridEh;
    pnl5: TPanel;
    eh207: TDBGridEh;
    cdstemp: TClientDataSet;
    cds457: TClientDataSet;
    ds457: TDataSource;
    pm468: TPopupMenu;
    mniSend: TMenuItem;
    mniSended: TMenuItem;
    mniReSet: TMenuItem;
    mniSendToBom: TMenuItem;
    mniCancelSendToBom: TMenuItem;
    qry1: TADOQuery;
    cdsLookUp17: TClientDataSet;
    cds207: TClientDataSet;
    ds207: TDataSource;
    ds468: TDataSource;
    cds468: TClientDataSet;
    pm207: TPopupMenu;
    mniDel2: TMenuItem;
    chkClose: TCheckBox;
    btnAutoSend: TButton;
    mniReBackReq: TMenuItem;
    mniPrt: TMenuItem;
    qry1INV_PART_NUMBER: TStringField;
    qry1INV_NAME: TStringField;
    qry1INV_PART_DESCRIPTION: TStringField;
    qry1rohs: TStringField;
    qry1UNIT_NAME: TStringField;
    qry1QUANTITY: TBCDField;
    qry1ABBR_NAME: TStringField;
    qry1SUPPLIER2: TStringField;
    frxrprt1: TfrxReport;
    lbl7: TLabel;
    btnGoClose: TButton;
    procedure edtWHButtonClick(Sender: TObject);
    procedure edtDeptButtonClick(Sender: TObject);
    procedure edtReqManButtonClick(Sender: TObject);
    procedure edtReqBillNoButtonClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnAutoSendClick(Sender: TObject);
    procedure mniDel2Click(Sender: TObject);
    procedure mniSendClick(Sender: TObject);
    procedure mniSendedClick(Sender: TObject);
    procedure mniReSetClick(Sender: TObject);
    procedure mniSendToBomClick(Sender: TObject);
    procedure mniReBackReqClick(Sender: TObject);
    procedure mniCancelSendToBomClick(Sender: TObject);
    procedure mniPrtClick(Sender: TObject);
    procedure btnGoCloseClick(Sender: TObject);
    procedure pm468Popup(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtReqBillNoExit(Sender: TObject);
    procedure edtReqManExit(Sender: TObject);
    procedure eh468DblClick(Sender: TObject);
  private
    { Private declarations }
    Ffrm: TFrmSel468Mtl_mod38;
    Frkey268: string;
    FDept_ptr,F05_ptr:Integer;
    FBillNo:string;
    function IsStatusChanged468: Boolean;
    function IsStatusChanged22: Boolean;
    procedure GetData468(ARkey268: string);
    procedure Apend207(Afrm: TFrmSel468Mtl_mod38);
    function IsFinished(Anumber: string): Boolean;
    procedure ReSet;
    procedure SendToBom(ARkey: string);

  public
    { Public declarations }
    procedure init;
    procedure GetData(ARkey: string);
    procedure Append457;
  end;

var
  frmMain_Mod38OutToReq: TfrmMain_Mod38OutToReq;

implementation

uses uReportFrm_mod38;
{$R *.dfm}

function TfrmMain_Mod38OutToReq.IsFinished(Anumber: string): Boolean;
var
  Lsql: string;
begin
  result := false;
  Lsql := 'select data0468.rkey from data0468 inner join data0268' + #13 +
    'on data0468.flow_no=data0268.rkey' + #13 + 'where data0468.status=0' + #13
    + 'and DATA0268.number=''' + Anumber + ''' ';
  gSvrIntf.IntfGetDataBySql(Lsql, cdstemp);

  if cdstemp.IsEmpty then
    result := true;
end;

function TfrmMain_Mod38OutToReq.IsStatusChanged22: Boolean;
var
  Lsql: string;
begin
  result := false;

  cds207.First;
  while not cds207.Eof do
  begin
    Lsql := 'select rkey from data0022' + #13 + 'where rkey =' +
      cds207.FieldByName('D0022_PTR').AsString;
    gSvrIntf.IntfGetDataBySql(Lsql, cdstemp);
    if cdstemp.IsEmpty then
    begin
      result := true;
      break;
    end;
    cds207.Next;
  end;

end;

procedure TfrmMain_Mod38OutToReq.Apend207(Afrm: TFrmSel468Mtl_mod38);
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
  cdsLookUp17.FieldByName('INV_Name').value :=
    Afrm.cdsPick.FieldByName('INV_Name').AsString;
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

  cds468.Edit;
  cds468.FieldByName('QUAN_ISSUED').value := cds468.FieldByName('QUAN_ISSUED')
    .value + Afrm.Fqty;
  if cds468.FieldByName('QUAN_ISSUED').value >= cds468.FieldByName('QUAN_BOM').value
  then
    cds468.FieldByName('status').value := 1;

  cds468.Post;

end;

procedure TfrmMain_Mod38OutToReq.Append457;
begin
  cds457.Edit;
  cds457.FieldByName('GON_NUMBER').value := ffunc.GetMaxOutBillNo;
  cds457.Post;
end;

procedure TfrmMain_Mod38OutToReq.btnAutoSendClick(Sender: TObject);
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

    if cds468.IsEmpty then
    begin
      showmessage('请先选择领料单');
      exit;
    end;

    if edtWH.Text = '' then
    begin
      showmessage('请首先输入发料工厂信息!');
      exit;
    end;

    cds468.First;
    while not cds468.Eof do
    begin
      // alloc
      if (cds468.FieldByName('alloc').value > 0) and
        (cds468.FieldByName('quan_issued').value.value = 0) then
        SendToBom(cds468.FieldByName('rkey').AsString)
      else if (cds468.FieldByName('alloc').value = 0) and
        (cds468.FieldByName('quan_bom').value > cds468.FieldByName
        ('quan_issued').value) then
      begin

        Ffrm.cdsPick.filter := ' warehouse_ptr=' +
          cds457.FieldByName('warehouse_ptr').AsString + ' and INVENTORY_PTR = '
          + cds468.FieldByName('invent_ptr').AsString;

        Ffrm.cdsPick.filtered := true;

        Ffrm.cdsPick.First;
        while not Ffrm.cdsPick.Eof do
        begin
          if  ((Ffrm.cdsPick.FieldByName('EXPIRE_DATE').value >=
            gFunc.GetSvrDateTime) or   ( (Ffrm.cdsPick.FieldByName('EXPIRE_DATE').value=null) ))   and
            (Ffrm.cdsPick.FieldByName('QUAN_ON_HAND').value > 0)   then
          begin
            if Ffrm.cdsPick.FieldByName('QUAN_ON_HAND').value >=
              cds468.FieldByName('QUAN_BOM').value -
              cds468.FieldByName('QUAN_ISSUED').value then
            begin

              cdsLookUp17.FieldByName('rkey').ReadOnly := false;
              cdsLookUp17.Append;
              cdsLookUp17.FieldByName('rkey').value :=
                Ffrm.cdsPick.FieldByName('INVENTORY_PTR').value;
              cdsLookUp17.FieldByName('INV_PART_NUMBER').value :=
                Ffrm.cdsPick.FieldByName('INV_PART_NUMBER').AsString;
              cdsLookUp17.FieldByName('INV_NAME').value :=
                Ffrm.cdsPick.FieldByName('INV_NAME').AsString;
              cdsLookUp17.FieldByName('INV_DESCRIPTION').value :=
                Ffrm.cdsPick.FieldByName('INV_DESCRIPTION').AsString;
              cdsLookUp17.FieldByName('rohs').value :=
                Ffrm.cdsPick.FieldByName('rohs').AsString;
              cdsLookUp17.FieldByName('unit_name').value :=
                Ffrm.cdsPick.FieldByName('unit_name').AsString;
              cdsLookUp17.FieldByName('ABBR_NAME').value :=
                Ffrm.cdsPick.FieldByName('ABBR_NAME').AsString;
              cdsLookUp17.FieldByName('SUPPLIER2').value :=
                Ffrm.cdsPick.FieldByName('SUPPLIER2').AsString;
              cdsLookUp17.Post;

              cds207.Append;
              cds207.FieldByName('INVENTORY_PTR').value :=
                Ffrm.cdsPick.FieldByName('INVENTORY_PTR').value;

              cds207.FieldByName('QUANTITY').value :=
                cds468.FieldByName('QUAN_BOM').value -
                cds468.FieldByName('QUAN_ISSUED').value;

              cds207.FieldByName('D0022_ptr').value :=
                Ffrm.cdsPick.FieldByName('RKEY').value; // rkey22
              cds207.FieldByName('STANDARD_COST').value :=
                Ffrm.cdsPick.FieldByName('STD_COST').AsString;
              cds207.FieldByName('D0468_ptr').value :=
                cds468.FieldByName('rkey').asinteger;

              cds207.Post;

              eh207.DataSource := nil;
              eh207.DataSource := ds207;


              cds468.Edit;
              cds468.FieldByName('QUAN_ISSUED').value :=
                cds468.FieldByName('QUAN_BOM').value;
              if (cds468.FieldByName('QUAN_ISSUED').value >=
                cds468.FieldByName('QUAN_BOM').value) then
                cds468.FieldByName('status').value := 1; // 468发放完毕状态
              cds468.Post;

              // 更新22的qty

               Ffrm.cdsPick.ReadOnly := false;
              Ffrm.cdsPick.Edit;
              Ffrm.cdsPick.FieldByName('QUAN_ON_HAND').value :=
                Ffrm.cdsPick.FieldByName('QUAN_ON_HAND').value -
                cds468.FieldByName('QUAN_BOM').value +
                cds468.FieldByName('QUAN_ISSUED').value;
              Ffrm.cdsPick.Post;

              break;
            end
            else
            begin

              cdsLookUp17.FieldByName('rkey').ReadOnly := false;
              cdsLookUp17.Append;
              cdsLookUp17.FieldByName('rkey').value :=
                Ffrm.cdsPick.FieldByName('INVENTORY_PTR').value;
              cdsLookUp17.FieldByName('INV_PART_NUMBER').value :=
                Ffrm.cdsPick.FieldByName('INV_PART_NUMBER').AsString;
              cdsLookUp17.FieldByName('INV_NAME').value :=
                Ffrm.cdsPick.FieldByName('INV_NAME').AsString;
              cdsLookUp17.FieldByName('INV_DESCRIPTION').value :=
                Ffrm.cdsPick.FieldByName('INV_DESCRIPTION').AsString;
              cdsLookUp17.FieldByName('rohs').value :=
                Ffrm.cdsPick.FieldByName('rohs').AsString;
              cdsLookUp17.FieldByName('unit_name').value :=
                Ffrm.cdsPick.FieldByName('unit_name').AsString;
              cdsLookUp17.FieldByName('ABBR_NAME').value :=
                Ffrm.cdsPick.FieldByName('ABBR_NAME').AsString;
              cdsLookUp17.FieldByName('SUPPLIER2').value :=
                Ffrm.cdsPick.FieldByName('SUPPLIER2').AsString;
              cdsLookUp17.Post;

              cds207.Append;
              cds207.FieldByName('QUANTITY').value :=
                Ffrm.cdsPick.FieldByName('QUAN_ON_HAND').AsString;

              cds207.FieldByName('INVENTORY_PTR').value :=
                Ffrm.cdsPick.FieldByName('INVENTORY_PTR').AsString;
              cds207.FieldByName('D0022_ptr').value :=
                Ffrm.cdsPick.FieldByName('RKEY').AsString; // rkey22
              cds207.FieldByName('STANDARD_COST').value :=
                Ffrm.cdsPick.FieldByName('STD_COST').AsString;
              cds207.FieldByName('D0468_ptr').value :=
                cds468.FieldByName('rkey').asinteger;
              if cds468.FieldByName('status').tag = 3 then
                cds207.FieldByName('QUANTITY').tag := 3;
              cds207.Post;

              eh207.DataSource := nil;
              eh207.DataSource := ds207;

              cds468.Edit;
              cds468.FieldByName('QUAN_ISSUED').value :=
                cds468.FieldByName('QUAN_ISSUED').value +
                Ffrm.cdsPick.FieldByName('QUAN_ON_HAND').value;
              if (cds468.FieldByName('QUAN_ISSUED').value >=
                cds468.FieldByName('QUAN_BOM').value) then
                cds468.FieldByName('status').value := 1; // 468发放完毕状态
              cds468.Post;

              // 更新22的qty
              Ffrm.cdsPick.ReadOnly := false;
              Ffrm.cdsPick.Edit;
              Ffrm.cdsPick.FieldByName('QUAN_ON_HAND').value := 0;
              Ffrm.cdsPick.Post;
            end;
          end;
          Ffrm.cdsPick.Next;
        end;
      end;
      cds468.Next;
    end;

    showmessage('分配成功！');

    if cds207.recordcount < 1 then
      edtReqBillNo.enabled := false;

  except
    on e: exception do
    begin
      showmessage('错误:' + e.Message);
      exit;
    end;
  end;
end;

procedure TfrmMain_Mod38OutToReq.btnCloseClick(Sender: TObject);
begin
  inherited;

  close;
  // frmMain_Mod38OutToReq:=nil;
  // ffrm:=nil;
end;

procedure TfrmMain_Mod38OutToReq.btnGoCloseClick(Sender: TObject);
var
  Lsql: string;
begin
  inherited;
  if trim(edtReqBillNo.Text) = '' then
  begin
    showmessage('请选择领料单!');
    edtReqBillNo.SetFocus;
    exit;
  end;

  if messagedlg('关闭领料申请单,将是不可逆操作您确认?', mtconfirmation, [mbyes, mbno], 0) = mryes
  then
  begin
    Lsql := 'select * from  data0268' + #13 + 'where  DATA0268.number=' +
      quotedstr(trim(edtReqBillNo.Text));
    gSvrIntf.IntfGetDataBySql(Lsql, cdstemp);

    cdstemp.Edit;
    cdstemp.FieldByName('status').value := 4;
    cdstemp.FieldByName('prted').value := 1;
    cdstemp.Post;

    if gSvrIntf.IntfPostDataByTable('data0268', cdstemp.delta) then
      messagedlg('关闭领料申请单操作成功', mtconfirmation, [mbok], 0);

    ReSet;

  end;
end;

procedure TfrmMain_Mod38OutToReq.btnSaveClick(Sender: TObject);
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
  cds268: TClientDataSet;
  Lcds468Save: TClientDataSet;
  LDSArr: OleVariant;
  Lsql, LFileName: string;
  LrkeyStr17, LrkeyStr22, LrkeyStr468, LrkeyStr22_468: string;
  Lstr:string;
begin
  inherited;
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
//
//  if Trim(edtReqMan.Text) = '' then
//  begin
//    ShowMessage('领料人员不能为空!');
//    edtReqMan.SetFocus;
//    exit;
//  end;

  cds22 := TClientDataSet.Create(nil);
  cdstemp := TClientDataSet.Create(nil);
  cds04 := TClientDataSet.Create(nil);
  cds14 := TClientDataSet.Create(nil);
  cds314 := TClientDataSet.Create(nil);
  cds17 := TClientDataSet.Create(nil);
  cds475 := TClientDataSet.Create(nil);
  cds403 := TClientDataSet.Create(nil);
  cds268 := TClientDataSet.Create(nil);
  Lcds468Save := TClientDataSet.Create(nil);
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

      Lstr := trim(edtOutBillNo.Text);

      if IsStatusChanged468 then
      begin
        messagedlg('材料发放不成功领料单状态发生变化!请重新选择库存发放', mterror, [mbcancel], 0);
        ReSet;
       // edtReqBillNoExit(edtReqBillNo);
        exit;
      end;

      if IsStatusChanged22 then
      begin
        messagedlg('材料发放不成功库存记录发生变化!请重新选择库存发放', mterror, [mbcancel], 0);
        ReSet;
        //edtReqBillNoExit(edtReqBillNo);
        exit;
      end;

      cds457.Edit;
      cds457.FieldByName('IDKEy').value := gFunc.CreateIDKey;
      cds457.FieldByName('GON_NUMBER').value := ffunc.GetMaxOutBillNo;
      cds457.FieldByName('create_date').value := gFunc.GetSvrDateTime;
      cds457.FieldByName('create_by').value := gVar.rkey05;
      cds457.FieldByName('TType').value := 3;
      cds457.FieldByName('status').value := 0;
      cds457.Post;

      gSvrIntf.IntfGetDataBySql
        ('select cast(getdate() as smalldatetime) as NDate ', cdstemp);

       // 得到cds207所有的d222rkey 和D17rkey
      LrkeyStr22 := ffunc.GetRkeyStr(cds207, 'D0022_PTR');
      LrkeyStr17 := ffunc.GetRkeyStr(cds207, 'INVENTORY_PTR');
      LrkeyStr468 := ffunc.GetRkeyStr(cds207, 'D0468_ptr');
      LrkeyStr22_468 := ffunc.GetTwoRkeyStr(cds207, 'D0022_ptr', 'D0468_ptr');

      gSvrIntf.IntfGetDataBySql
        ('select  rkey22,rkey468   from data0475 where cast(rkey22 as varchar)+''-''+cast(rkey468 as varchar) in '
        + LrkeyStr22_468, cds475);

      gSvrIntf.IntfGetDataBySql('select * from data0022 where rkey in ' +
        LrkeyStr22, cds22);

      gSvrIntf.IntfGetDataBySql('select * from data0017 where rkey in  ' +
        LrkeyStr17, cds17);

      gSvrIntf.IntfGetDataBySql('select * from data0468 where rkey in ' +
        LrkeyStr468, Lcds468Save);

      cds457.DisableControls;
      cds207.DisableControls;
      cds207.First;
      while not cds207.Eof do
      begin
        cds207.Edit;
        cds207.FieldByName('TTYPE').value := 2;
        cds207.FieldByName('DEPT_PTR').value := cds457.FieldByName('dept_ptr')
          .asinteger;
        if not cdstemp.IsEmpty then
          cds207.FieldByName('TDATE').value :=
            cdstemp.FieldByName('NDate').value;
        cds207.FieldByName('D457_IDKey').value :=
          cds457.FieldByName('IDKey').AsString;
        cds207.FieldByName('RTN_QUANTITY').value := 0;
        cds207.FieldByName('STANDARD_COST').value := 0;
        cds207.FieldByName('Invent_or').value := 0;
        cds207.Post;

         //22
        if cds22.Locate('rkey', cds207.FieldByName('D0022_ptr').asinteger, [])
        then
        begin

          if cds22.FieldByName('quan_on_hand').value -
            cds22.FieldByName('QUAN_TO_BE_STOCKED').value <
            cds207.FieldByName('QUANTITY').value then
          begin
            showmessage('发料失败,可能多用户同时发放了同一批物料且导致库存出现负数!请重发');
            Ffrm.cdsPick.CancelUpdates;
            ReSet;
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

        //17
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
          // if cds468.FieldByName('QUAN_ISSUED').value >= cds468.FieldByName('QUAN_BOM').value then
          // begin
          // Lcds468Save.Edit;
          // Lcds468Save.FieldByName('status').value :=1;
          // Lcds468Save.post;
          // end;
        end;
        cds207.Next;
      end;

      // 删除分配记录
      Lsql := 'select * from data0475   where cast(data0475.rkey22 as varchar)+''-''+cast(data0475.rkey468 as varchar) in '
        + LrkeyStr22_468 + ' ';
      gSvrIntf.IntfGetDataBySql(Lsql, cds475);
      if not cds475.IsEmpty then
        cds475.Delete;

      if (chkClose.Checked) then      //or (IsFinished(trim(edtReqBillNo.Text)))
      begin
        Lsql := 'select * from  data0268 where  DATA0268.number=''' +
          trim(edtReqBillNo.Text) + ''' ';
        gSvrIntf.IntfGetDataBySql(Lsql, cds268);
        cds268.Edit;
        cds268.FieldByName('status').value := 4;
        cds268.Post;
      end;

      // 更新销售订单物料提前分配表403  :
      // Lsql := ' select * from  DATA0403 ' + ' where exists            ' +
      // '(select d468.rkey ' + ' FROM  dbo.Data0468 d468 ' +
      // ' INNER JOIN  dbo.Data0060  d60 ON d468.SO_NO = d60.SALES_ORDER' +
      // ' WHERE   data0403.rkey60=d60.rkey' +
      // ' and  data0403.rkey34=d468.DEPT_PTR ' + ' and d468.rkey in ' +
      // LrkeyStr468 + ')';
      // // showmessage(Lsql);
      // gSvrIntf.IntfGetDataBySql(Lsql, cds403);
      // ffunc.Update403(LrkeyStr468,cds403,cds207);

      // 更新出库编号
      gSvrIntf.IntfGetDataBySql('select * from data0004 where rkey=56 ', cds04);
      ffunc.UpdateBillNo(trim(edtOutBillNo.Text), cds04);

      // 发信息
      gSvrIntf.IntfGetDataBySql('select * from data0014 where rkey=0 ', cds14);
      gSvrIntf.IntfGetDataBySql('select * from data0314 where rkey=0 ', cds314);
      ffunc.send_message(LrkeyStr17, cds14, cds314);


     //  showmessage('17:' + LrkeyStr17 + '-22:' + LrkeyStr22 + '-468:'+LrkeyStr468);


      LDSArr := VarArrayCreate([0, 10], varVariant);
      if cds457.ChangeCount > 0 then
        LDSArr[0] := cds457.delta;
      if cds207.ChangeCount > 0 then
        LDSArr[1] := cds207.delta;
      if cds22.ChangeCount > 0 then
        LDSArr[2] := cds22.delta;
      if cds17.ChangeCount > 0 then
        LDSArr[3] := cds17.delta;
      if cds475.ChangeCount > 0 then
        LDSArr[4] := cds475.delta;
      if cds04.ChangeCount > 0 then
        LDSArr[5] := cds04.delta;
      if cds14.ChangeCount > 0 then
        LDSArr[6] := cds14.delta;
      if cds314.ChangeCount > 0 then
        LDSArr[7] := cds314.delta;
      if cds403.ChangeCount > 0 then
        LDSArr[8] := cds403.delta;
       if Lcds468Save.ChangeCount > 0 then
        LDSArr[9] := Lcds468Save.delta;
      if cds268.ChangeCount > 0 then
        LDSArr[10] := cds268.delta;


      if gSvrIntf.IntfPostModData('公共基础', 38, LDSArr, 3) then
      begin
       if  (IsFinished(trim(edtReqBillNo.Text))) then
       begin
        Lsql := 'select * from  data0268 where  DATA0268.number=''' +
          trim(edtReqBillNo.Text) + ''' ';
        gSvrIntf.IntfGetDataBySql(Lsql, cdstemp);
        cdstemp.Edit;
        cdstemp.FieldByName('status').value := 4;
        cdstemp.Post;
        gSvrIntf.IntfPostDataByTable('data0268',cdstemp.Delta);
       end;

        cds457.MergeChangeLog;
        cds207.MergeChangeLog;
        showmessage('发到领料单成功!');
      end
      else
        exit;

      if chkPrt.Checked then
      begin
        gSvrIntf.IntfGetDataBySql('select * from data0457 where GON_NUMBER=''' +
          trim(edtOutBillNo.Text) + ''' ', cdstemp);
        try
          frmReport_mod38 := TfrmReport_mod38.Create(Self);
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
      ReSet;
     Ffrm:=nil;
    except
      on e: exception do
      begin
        showmessage('错误:' + e.Message);
        exit;
      end;
    end;

  finally
   cds457.EnableControls;
   cds207.EnableControls;
    cds22.free;
    cdstemp.free;
    cds04.free;
    cds14.free;
    cds314.free;
    cds17.free;
    cds475.free;
    cds403.free;
    cds268.free;
    Lcds468Save.free;
    Ffrm:=nil;
  end;
end;

procedure TfrmMain_Mod38OutToReq.edtDeptButtonClick(Sender: TObject);
var
  LFrm: TfrmSinglePickList;
begin

  LFrm := TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(38, 1);
    LFrm.showmodal;
  finally
    LFrm.free;
  end;
end;

procedure TfrmMain_Mod38OutToReq.edtReqBillNoButtonClick(Sender: TObject);
var
  LFrm: TfrmSinglePickList;
begin
  LFrm := TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(38, 4);
    if LFrm.showmodal = mrOk then
    begin
      GetData468(LFrm.cdsPick.FieldByName('rkey').AsString); // 268的rkey
      Frkey268 := LFrm.cdsPick.FieldByName('rkey').AsString;
      cds457.Edit;
      cds457.FieldByName('REF_NUMBER').value :=
        LFrm.cdsPick.FieldByName('number').value;
      cds457.FieldByName('warehouse_ptr').value :=
        LFrm.cdsPick.FieldByName('warehouse_ptr').value;
      cds457.FieldByName('Dept_ptr').value :=
        LFrm.cdsPick.FieldByName('Dept_ptr').value;
      cds457.FieldByName('RECD_BY').value :=
        LFrm.cdsPick.FieldByName('empl_ptr').value;

       cds457.FieldByName('cut_no').value :=
        LFrm.cdsPick.FieldByName('reference').value;

      cds457.Post;
    end;
  finally
    LFrm.free;
  end;

end;

procedure TfrmMain_Mod38OutToReq.edtReqBillNoExit(Sender: TObject);
var
  Lsql: string;
begin
  inherited;

  if trim(edtReqBillNo.Text) = '' then  exit;

  FBillNo:=trim(edtReqBillNo.Text);

  Lsql := ' SELECT  DATA0268.rkey, DATA0268.number, Data0034.DEPT_CODE,  Data0034.DEPT_NAME,'
    + ' DATA0268.DATE, Data0005.EMPLOYEE_NAME,Data0005.EMPL_CODE, ' +
    ' DATA0268.dept_ptr, DATA0268.EMPL_PTR, DATA0268.reference, ' +
    ' data0015.WAREHOUSE_CODE,data0015.ABBR_NAME,data0268.warehouse_ptr, ' +
    ' case data0268.TTYPE when 0 then ''部门领料'' when 1 then ''BOM领料''  ' +
    ' when 2 then ''维修'' when 3 then ''维护'' when 4 then ''工程'' when 5 then ''公用'' end as vttype'
    + ' FROM  DATA0268 ' +
    ' INNER JOIN  Data0034 ON dbo.DATA0268.dept_ptr = Data0034.RKEY' +
    ' INNER JOIN  Data0005 ON dbo.DATA0268.EMPL_PTR = Data0005.RKEY ' +
    ' inner join  data0015 on data0268.warehouse_ptr = data0015.rkey  ' +
    ' where data0268.status=2 and data0268.allow_submit in (0,2) and DATA0268.number=''' +
    trim(edtReqBillNo.Text) + ''' ';
  // showmessage(Lsql);

  gSvrIntf.IntfGetDataBySql(Lsql, cdstemp);

  if not cdstemp.isempty   then
  begin
  GetData468(cdstemp.FieldByName('rkey').AsString); // 268的rkey

  Frkey268 := cdstemp.FieldByName('rkey').AsString;
  cds457.Edit;
  cds457.FieldByName('REF_NUMBER').value := cdstemp.FieldByName('number').value;
  cds457.FieldByName('warehouse_ptr').value :=
    cdstemp.FieldByName('warehouse_ptr').value;
  cds457.FieldByName('Dept_ptr').value := cdstemp.FieldByName('Dept_ptr').value;
  cds457.FieldByName('RECD_BY').value := cdstemp.FieldByName('empl_ptr').value;

  cds457.FieldByName('cut_no').value := cdstemp.FieldByName('reference').value;

  if cdstemp.FieldByName('Dept_ptr').value>0 then
  FDept_ptr:= cdstemp.FieldByName('Dept_ptr').value;
  if cdstemp.FieldByName('empl_ptr').value>0  then
  F05_ptr:= cdstemp.FieldByName('empl_ptr').value;
  cds457.Post;
  end;

end;

procedure TfrmMain_Mod38OutToReq.edtReqManButtonClick(Sender: TObject);
var
  LFrm: TfrmSinglePickList;
begin
  LFrm := TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(38, 2);
    if LFrm.showmodal = mrOk then
    begin
      cds457.Edit;
      cds457.FieldByName('Recd_by').value :=
        LFrm.cdsPick.FieldByName('rkey').value;
      cds457.Post;
    end;
  finally
    LFrm.free;
  end;

end;

procedure TfrmMain_Mod38OutToReq.edtReqManExit(Sender: TObject);
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

procedure TfrmMain_Mod38OutToReq.edtWHButtonClick(Sender: TObject);
var
  LFrm: TfrmSinglePickList;
begin

  LFrm := TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(38, 0);
    LFrm.showmodal;
  finally
    LFrm.free;
  end;
end;

procedure TfrmMain_Mod38OutToReq.eh468DblClick(Sender: TObject);
begin
  inherited;
  if cds468.IsEmpty  then Exit;
  mniSendClick(mniSend);
end;

procedure TfrmMain_Mod38OutToReq.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  Action := caFree;
  frmMain_Mod38OutToReq := nil;
 // Ffrm := nil;

end;

procedure TfrmMain_Mod38OutToReq.FormCreate(Sender: TObject);
begin
  inherited;
//  Ffrm := TFrmSel468Mtl_mod38.Create(Self);
//  Ffrm.InitWithPickID(38, 8);
//  Ffrm.height := 800;
//  Ffrm.width := 800;
  Self.tag := 1;
end;

procedure TfrmMain_Mod38OutToReq.FormShow(Sender: TObject);
begin
  inherited;
  edtReqBillNo.enabled := true;

end;

procedure TfrmMain_Mod38OutToReq.GetData(ARkey: string);
var
  LsqlLookUp17, Lsql457, Lsql207: string;
begin
  inherited;
  LsqlLookUp17 :=
    ' select  d17.RKEY ,  d17.INV_PART_NUMBER,d17.INV_NAME,d17.INV_DESCRIPTION, '
    + ' d22.rohs,d02.UNIT_NAME,d23.ABBR_NAME ,d22.SUPPLIER2 ,d207.quantity ' +
    ' from Data0207 d207' +
    ' inner join data0017 d17 on d207.INVENTORY_PTR=d17.RKEY' +
    ' inner join Data0022 d22 on d207.D0022_PTR=d22.rkey' +
    ' inner join Data0002 d02 on d22.LOCATION_PTR_FROM=d02.RKEY' +
    ' INNER JOIN dbo.Data0456 d456 ON d22.GRN_PTR = d456.RKEY' +
    ' inner join Data0023 d23 on d456.SUPP_PTR = d23.RKEY' +
    ' where d207.GON_PTR = ' + ARkey;

  Lsql457 := 'select * from data0457  where rkey= ' + ARkey;
  Lsql207 := 'select * from data0207  where rkey= ' + ARkey;;

  gSvrIntf.IntfGetDataBySqlArr(vararrayof([LsqlLookUp17, Lsql457, Lsql207]),
    [cdsLookUp17, cds457, cds207]);

end;

procedure TfrmMain_Mod38OutToReq.GetData468(ARkey268: string);
var
  Lsql: string;
begin
  Lsql := ' SELECT TOP 100 PERCENT Data0268.number, DATA0268.reference,  Data0468.INVENT_PTR, Data0468.RKEY,  '
    + ' Data0468.STATUS, Data0017.STOCK_UNIT_PTR, Data0017.INV_PART_NUMBER,' +
    ' Data0017.INV_NAME, Data0017.INV_DESCRIPTION, Data0468.QUAN_BOM,' +
    ' Data0468.QUAN_ISSUED, Data0002.UNIT_NAME, data0002.UNIT_CODE, data0468.VENDOR,'
    + ' data0017.quan_on_hand-data0017.QUAN_ASSIGN as quan_on_hand,data0468.quan_alloc,'
    + ' data0468.quan_alloc as alloc,case data0468.PRINTIT when ''N'' then ''VMI库存'' else ''普通库存'' end as sotck_type '
    + ' FROM data0268 INNER JOIN' +
    ' Data0468 ON data0268.rkey = Data0468.flow_no INNER JOIN' +
    ' Data0002 INNER JOIN' +
    ' Data0017 ON Data0002.RKEY = Data0017.STOCK_UNIT_PTR ON' +
    ' Data0468.INVENT_PTR = Data0017.RKEY' + ' WHERE (Data0468.flow_no = ' +
    ARkey268 + ') AND' + ' (Data0468.STATUS = 0) AND' +
    ' (data0268.status = 2) and' + ' (data0468.invent_or=0)' +
  // ' and data0017.quan_on_hand-data0017.QUAN_ASSIGN>0 '+
    ' order by Data0268.number';
  // showmessage(Lsql);
  gSvrIntf.IntfGetDataBySql(Lsql, cds468);
end;

procedure TfrmMain_Mod38OutToReq.init;
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

    LLKField := TStringField.Create(cds207);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'ABBR_NAME';
    LLKField.KeyFields := 'INVENTORY_PTR';
    LLKField.LookupDataSet := cdsLookUp17;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'ABBR_NAME';
    LLKField.DataSet := cds207;

    LLKField := TStringField.Create(cds207);
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

function TfrmMain_Mod38OutToReq.IsStatusChanged468: Boolean;
var
  Lsql: string;
begin
  result := false;

  cds207.First;
  while not cds207.Eof do
  begin
    Lsql := 'select data0468.rkey from data0468 inner join data0268' + #13 +
      'on data0468.flow_no=data0268.rkey' + #13 + 'where data0468.status = 0' +
      #13 + 'and data0268.status = 2' + #13 + 'and data0468.rkey=' +
      cds207.FieldByName('D0468_PTR').AsString;
    gSvrIntf.IntfGetDataBySql(Lsql, cdstemp);
    if cdstemp.IsEmpty then
    begin
      result := true;
      break;
    end;
    cds207.Next;
  end;
end;

procedure TfrmMain_Mod38OutToReq.mniCancelSendToBomClick(Sender: TObject);
begin
  inherited;
  try
    Ffrm.cdsPick.filter := '';

    cds468.Edit;
    cds468.FieldByName('quan_alloc').value := cds468.FieldByName('alloc').value;
    cds468.FieldByName('QUAN_ISSUED').value := cds468.FieldByName('QUAN_ISSUED')
      .value - cds468.FieldByName('alloc').value;

    if cds468.FieldByName('QUAN_ISSUED').value < cds468.FieldByName('QUAN_BOM').value   then
       cds468.FieldByName('status').value := 0; // 468发放完毕状态
    cds468.Post;

    cds207.First;
    while not cds207.Eof do
    begin
      if cds207.FieldByName('D0468_ptr').value = cds468.FieldByName('rkey').value
      then
      begin
        if (Ffrm.cdsPick.Locate('rkey', cds207.FieldByName('D0022_ptr')
          .value, [])) then
        begin
         // Ffrm.cdsPick.ReadOnly:=false;
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
      cds207.Next;
    end;
  except
    on e: exception do
    begin
      showmessage('错误:' + e.Message);
      exit;
    end;
  end;

end;

procedure TfrmMain_Mod38OutToReq.mniDel2Click(Sender: TObject);
begin
  inherited;
  try
    if cds207.IsEmpty then
      exit;

    Ffrm.cdsPick.filter := '';
    cds468.First;
    if cds468.Locate('rkey', cds207.FieldByName('D0468_ptr').asinteger, []) then
      if cds468.FieldByName('alloc').value > 0 then
        showmessage('按分配发放的材料不能单项删除,请从发放处整体取消发放!')
      else
      begin
        Ffrm.cdsPick.filter := '';
        if (Ffrm.cdsPick.Locate('rkey', cds207.FieldByName('D0022_ptr')
          .asinteger, [])) and
          (cds468.Locate('rkey', cds207.FieldByName('D0468_ptr').asinteger, []))
        then
        begin
           Ffrm.cdsPick.readonly:=false;
          Ffrm.cdsPick.Edit;
          Ffrm.cdsPick.FieldByName('QUAN_ON_HAND').value :=
            Ffrm.cdsPick.FieldByName('QUAN_ON_HAND').value +
            cds207.FieldByName('quantity').value;
          Ffrm.cdsPick.Post;



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
  except
    on e: exception do
    begin
      showmessage('错误:' + e.Message);
      exit;
    end;
  end;
end;

procedure TfrmMain_Mod38OutToReq.mniPrtClick(Sender: TObject);
begin
  inherited;
  if cds468.IsEmpty then
    exit;
  gFunc.Export_dbGridEH_to_Excel(eh468);
end;

procedure TfrmMain_Mod38OutToReq.mniReBackReqClick(Sender: TObject);
var
  Lsql: string;
begin
  inherited;
  try
    Lsql := 'SELECT  Data0468.QUAN_ISSUED, DATA0268.number' + #13 +
      'FROM         dbo.Data0468 INNER JOIN' + #13 +
      'dbo.DATA0268 ON dbo.Data0468.FLOW_NO = dbo.DATA0268.rkey' + #13 +
      'WHERE     ((dbo.Data0468.QUAN_ISSUED > 0) OR' + #13 +
      '         (dbo.DATA0268.status <> 2))' + #13 + 'and DATA0268.number=' +
      quotedstr(trim(edtReqBillNo.Text));

    gSvrIntf.IntfGetDataBySql(Lsql, cdstemp);

    if not cdstemp.IsEmpty then
    begin
      showmessage('申领单状态或者数量发生变化，退回操作不成功');
      exit;
    end;

    if messagedlg('申请单退回将是不可逆操作您确认?', mtconfirmation, [mbyes, mbno], 0) = mrno
    then
      exit;

    // 更新268
    gSvrIntf.IntfGetDataBySql('select * from data0268  where number=''' +
      trim(edtReqBillNo.Text) + '''  ', cdstemp);
    cdstemp.Edit;
    cdstemp.FieldByName('status').value := 3;
    cdstemp.FieldByName('auth_emplptr').value := null;
    cdstemp.FieldByName('auth_date').value := null;
    cdstemp.Post;

    if gSvrIntf.IntfPostDataByTable('data0268', cdstemp.delta) then
      messagedlg('申请单退回操作成功', mtconfirmation, [mbok], 0);

    if not cds207.IsEmpty then
    begin
      while cds207.recordcount > 0 do
        cds207.Delete;
    end;
    GetData468(Frkey268);
    edtReqBillNo.enabled := true;
  except
    on e: exception do
    begin
      showmessage('错误:' + e.Message);
      exit;
    end;
  end;
end;

procedure TfrmMain_Mod38OutToReq.mniReSetClick(Sender: TObject);
var
  Lcds468Save: TClientDataSet;
begin
  inherited;


  Lcds468Save := TClientDataSet.Create(nil);
  try
    gSvrIntf.IntfGetDataBySql('select * from data0468 where rkey = ' +
      cds468.FieldByName('rkey').AsString, Lcds468Save);

    Lcds468Save.Edit;
    Lcds468Save.FieldByName('status').value := 0;
    Lcds468Save.Post;

    if Lcds468Save.ChangeCount > 0 then
      gSvrIntf.IntfPostDataByTable('data0468', Lcds468Save.delta);


    cds468.Edit;
    cds468.FieldByName('status').value := 0;
    cds468.Post;

  finally
    Lcds468Save.free;
  end;
end;

procedure TfrmMain_Mod38OutToReq.mniSendClick(Sender: TObject);
begin
  inherited;

  if trim(edtWH.Text) = '' then
  begin
    showmessage('请首先输入发料工厂信息!');
    exit;
  end;

  try

  if Ffrm=nil then
   begin
   Ffrm := TFrmSel468Mtl_mod38.create(Self);
   Ffrm.InitWithPickID(38, 8);
   Ffrm.height := 800;
   Ffrm.width := 800;
   end;

  Ffrm.cdsPick.filter := '  warehouse_ptr=' + cds457.FieldByName
    ('warehouse_ptr').AsString + ' and INVENTORY_PTR = ' +
    cds468.FieldByName('invent_ptr').AsString;
  Ffrm.cdsPick.filtered := true;

  Ffrm.FParentCallBack := Apend207;
  Ffrm.FType := 1; // 按领料单 发放；
  Ffrm.quan_bom := cds468.FieldByName('quan_bom').AsString;
  Ffrm.quan_Issued := cds468.FieldByName('quan_Issued').AsString;
  Ffrm.edtFilter.Text := '';
  Ffrm.showmodal;

  Ffrm.invent_ptr := cds468.FieldByName('INVENT_PTR').AsString;

  Ffrm.cbbWH.ItemIndex := Ffrm.cbbWH.Items.IndexOf
    (edtWH.DisplayNoteLabel.Caption);

    if cds207.recordcount > 0 then
    edtReqBillNo.enabled := false;
  except
    on e: exception do
    begin
      showmessage('错误:' + e.Message);
      exit;
    end;
  end;

end;

procedure TfrmMain_Mod38OutToReq.mniSendedClick(Sender: TObject);
var
  Lcds468Save: TClientDataSet;
begin
  inherited;

  Lcds468Save := TClientDataSet.Create(nil);
  try
    gSvrIntf.IntfGetDataBySql('select * from data0468 where rkey = ' +
      cds468.FieldByName('rkey').AsString, Lcds468Save);

    Lcds468Save.Edit;
    Lcds468Save.FieldByName('status').value := 1;
    Lcds468Save.Post;

    if Lcds468Save.ChangeCount > 0 then
      gSvrIntf.IntfPostDataByTable('data0468', Lcds468Save.delta);

    cds468.Edit;
    cds468.FieldByName('status').value := '1';
    cds468.Post;

  finally
    Lcds468Save.free;
  end;
end;

procedure TfrmMain_Mod38OutToReq.mniSendToBomClick(Sender: TObject);
begin
  inherited;
  try
  SendToBom(cds468.FieldByName('rkey').AsString);
  except
    on e: exception do
    begin
      showmessage('错误:' + e.Message);
      exit;
    end;
  end;
end;

procedure TfrmMain_Mod38OutToReq.pm468Popup(Sender: TObject);
begin
  inherited;
  try
    if cds468.IsEmpty then
    begin
      mniSend.enabled := false;
      mniSended.enabled := false;
      mniReSet.enabled := false;
      mniSendToBom.enabled := false;
      mniCancelSendToBom.enabled := false;
      mniReBackReq.enabled := false;
      mniPrt.enabled := false;
    end
    else
    begin
      mniReSet.enabled := true;
      mniPrt.enabled := true;
      if cds468.FieldByName('STATUS').value = 0 then // 状态为有效
      begin
        if cds468.FieldByName('alloc').value = 0 then // 正常发放
        begin
          mniSend.enabled := true;
          mniSended.enabled := true;
          mniSendToBom.enabled := false;
          mniCancelSendToBom.enabled := false;
        end
        else // 按分配发放
        begin
          mniSend.enabled := false;
          mniSended.enabled := false;
          if cds468.FieldByName('QUAN_ISSUED').value = 0 then // 未发放
          begin
            mniSendToBom.enabled := true;
            mniCancelSendToBom.enabled := false;
          end
          else // 已发放
          begin
            mniSendToBom.enabled := false;
            mniCancelSendToBom.enabled := true;
          end;
        end;
        mniReSet.enabled := false;
      end
      else // 状态为无效
      begin
        mniSend.enabled := false;
        mniSended.enabled := false;
        mniSendToBom.enabled := false;
        mniCancelSendToBom.enabled := false;
        mniReSet.enabled := true;
      end;
    end;
  except
    on e: exception do
    begin
      showmessage('错误:' + e.Message);
      exit;
    end;
  end;
end;

procedure TfrmMain_Mod38OutToReq.ReSet;
begin
  edtReqBillNo.enabled := true;
  GetData('-1');
  GetData468('-1');
  cds457.Edit;
  cds457.FieldByName('GON_NUMBER').value := ffunc.GetMaxOutBillNo;
  cds457.FieldByName('recd_BY').value := F05_ptr;
  cds457.FieldByName('dept_ptr').value := FDept_ptr;
  cds457.Post;
  edtReqBillNo.enabled := true;

end;

procedure TfrmMain_Mod38OutToReq.SendToBom(ARkey: string);
var
  Lsql: string;
begin

  Lsql := 'SELECT dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME,' + #13 +
    'dbo.Data0017.INV_DESCRIPTION, dbo.Data0022.rohs, dbo.Data0002.UNIT_NAME,' +
    #13 + 'dbo.DATA0475.quan_alloc, dbo.Data0022.INVENTORY_PTR,' + #13 +
    'dbo.Data0022.RKEY, dbo.Data0017.STD_COST, dbo.Data0022.SUPPLIER2,' + #13 +
    'dbo.Data0023.ABBR_NAME' + #13 + 'FROM  dbo.DATA0475 INNER JOIN' + #13 +
    'dbo.Data0022 ON dbo.DATA0475.rkey22 = dbo.Data0022.RKEY INNER JOIN' + #13 +
    'dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR = dbo.Data0017.RKEY INNER JOIN'
    + #13 + 'dbo.Data0002 ON dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0002.RKEY INNER JOIN'
    + #13 + 'dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY INNER JOIN'
    + #13 + 'dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY' + #13 +
    'where DATA0475.rkey468=' + ARkey;
  gSvrIntf.IntfGetDataBySql(Lsql, cdstemp);

  if cdstemp.IsEmpty then
  begin
    showmessage('按分配发放失败,可能被其用户发放或者取消分配了');
    exit;
  end;

  Ffrm.cdsPick.filter := '';

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
    cds207.FieldByName('INVENTORY_PTR').value :=
      cdstemp.FieldByName('INVENTORY_PTR').AsString;

    cds207.FieldByName('QUANTITY').value :=
      cdstemp.FieldByName('quan_alloc').AsString;

    cds207.FieldByName('D0022_ptr').value := cdstemp.FieldByName('RKEY')
      .AsString; // rkey22
    cds207.FieldByName('STANDARD_COST').value :=
      cdstemp.FieldByName('STD_COST').AsString;
    cds207.FieldByName('D0468_ptr').value := cds468.FieldByName('rkey')
      .asinteger;

    cds207.Post;

    eh207.DataSource := nil;
    eh207.DataSource := ds207;

    // 更新22的qty

    if (Ffrm.cdsPick.Locate('rkey', cdstemp.FieldByName('RKEY').value, [])) then
      Ffrm.cdsPick.Edit;
    Ffrm.cdsPick.FieldByName('QUAN_ON_HAND').value :=
      Ffrm.cdsPick.FieldByName('QUAN_ON_HAND').value -
      cdstemp.FieldByName('quan_alloc').value;
    Ffrm.cdsPick.Post;

    cdstemp.Next;
  end;

  // 更新界面的468：

  cds468.Edit;
  cds468.FieldByName('QUAN_ISSUED').value := cds468.FieldByName('QUAN_ISSUED')
    .value + cds468.FieldByName('quan_alloc').value;
  cds468.FieldByName('quan_alloc').value := 0;
  if cds468.FieldByName('QUAN_ISSUED').value >= cds468.FieldByName('QUAN_BOM').value
  then
    cds468.FieldByName('status').value := 1; // 468发放完毕状态
  cds468.Post;


  if cds207.recordcount >0 then
    edtReqBillNo.enabled := false;
end;

end.
