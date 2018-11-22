unit Frm_Enter_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGridEh, Buttons, DB, ComCtrls,
  ADODB, Menus, Provider, DBClient;

type
  TFrm_Enter = class(TForm)
    Panel1: TPanel;
    Edit2: TEdit;
    Label2: TLabel;
    BtSave: TBitBtn;
    BtClose: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    BitBtn3: TBitBtn;
    Label4: TLabel;
    Edit3: TEdit;
    ds251: TDataSource;
    Label5: TLabel;
    Edit4: TEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGridEh2: TDBGridEh;
    DS2: TDataSource;
    Panel2: TPanel;
    eh1: TDBGridEh;
    cbxSelectAll: TCheckBox;
    Label6: TLabel;
    edtFilter1: TEdit;
    ADOQ0056_1: TADOQuery;
    ADOQ0056_1MANU_PART_NUMBER: TStringField;
    ADOQ0056_1MANU_PART_DESC: TStringField;
    ADOQ0056_1SALES_ORDER: TStringField;
    ADOQ0056_1qty: TFloatField;
    ADOQ0056_1noship: TFloatField;
    Label7: TLabel;
    EdtSum: TEdit;
    Panel3: TPanel;
    Label8: TLabel;
    Edit6: TEdit;
    ComboBox1: TComboBox;
    Label9: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    ADOQ0056_1po_number: TStringField;
    cds251: TClientDataSet;
    dsp1: TDataSetProvider;
    cds251checked: TBooleanField;
    cds251manu_part_number: TStringField;
    cds251manu_part_desc: TStringField;
    cds251work_order_number: TStringField;
    cds251cpcs: TIntegerField;
    cds251cpnl: TIntegerField;
    cds251ctime: TDateTimeField;
    cds251EMPLOYEE_NAME: TStringField;
    cds251sales_order: TStringField;
    cds251po_number: TStringField;
    cds251BKNote: TStringField;
    cds251rkey251: TAutoIncField;
    cds251rkey60: TAutoIncField;
    cds251rkey56: TAutoIncField;
    cds251cust_code: TStringField;
    cds251rkey06: TAutoIncField;
    cds251LOC_PTR: TIntegerField;
    cds251cdept_ptr: TIntegerField;
    cds251cstep: TIntegerField;
    cds251intime: TDateTimeField;
    cds251FLOW_NO: TSmallintField;
    cds251EMPLOYEE_PTR: TIntegerField;
    cds251PUT_TYPE: TSmallintField;
    cds251TTYPE492: TSmallintField;
    cds251rkey25: TAutoIncField;
    cds251rkey492: TAutoIncField;
    ads251: TADODataSet;
    ads251checked: TBooleanField;
    ads251manu_part_number: TStringField;
    ads251manu_part_desc: TStringField;
    ads251work_order_number: TStringField;
    ads251cpcs: TIntegerField;
    ads251cpnl: TIntegerField;
    ads251ctime: TDateTimeField;
    ads251EMPLOYEE_NAME: TStringField;
    ads251sales_order: TStringField;
    ads251po_number: TStringField;
    ads251BKNote: TStringField;
    ads251rkey251: TAutoIncField;
    ads251rkey60: TAutoIncField;
    ads251rkey56: TAutoIncField;
    ads251rkey06: TAutoIncField;
    ads251cdept_ptr: TIntegerField;
    ads251cust_code: TStringField;
    ads251LOC_PTR: TIntegerField;
    ads251cstep: TSmallintField;
    ads251intime: TDateTimeField;
    ads251FLOW_NO: TSmallintField;
    ads251EMPLOYEE_PTR: TIntegerField;
    ads251PUT_TYPE: TWordField;
    ads251TTYPE492: TWordField;
    ads251rkey25: TAutoIncField;
    ads251rkey492: TAutoIncField;
    cds251xh: TIntegerField;
    grp1: TGroupBox;
    cbx2: TCheckBox;
    strngfldads251SO_NO: TStringField;
    strngfldcds251SO_NO: TStringField;
    intgrfldads251ischaban: TIntegerField;
    strngfldads251zhouqi: TStringField;
    intgrfldcds251ischaban: TIntegerField;
    strngfldcds251zhouqi: TStringField;
    procedure FormShow(Sender: TObject);
    procedure BtSaveClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure cbxSelectAllClick(Sender: TObject);
    procedure edtFilter1Change(Sender: TObject);
    procedure eh1TitleClick(Column: TColumnEh);
    procedure eh1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit6Change(Sender: TObject);
    procedure DBGridEh2TitleClick(Column: TColumnEh);
    procedure ComboBox1Change(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BtCloseClick(Sender: TObject);
    procedure cds251CalcFields(DataSet: TDataSet);
    procedure cds251checkedChange(Sender: TField);
  private
    //field_name, field_name1: string;
    //PreColumn, PreColumn1: TColumnEh;
    FHotColum: TColumnEh;
    FisHint: boolean;
    Fsql1, Fsql2: string;
    procedure Get251Data;
    function RefreshBefrotSave: Boolean;

  public
    function AccpectToStock: Boolean;
  end;

implementation

uses
  DM_u, Frm_Loc_u,DateUtils;

{$R *.dfm}

function IncSeedValue(AOldSeedValue: string): string;
var
  I: Integer;
  nIndex: Integer;
  tmps: string;
begin
  nIndex := -1;
  for I := 1 to Length(AOldSeedValue) do
  begin
    if AOldSeedValue[I] in ['0'..'9'] then
    begin
      if nIndex = -1 then nIndex := I-1;
      tmps := tmps + AOldSeedValue[I];
    end else
    begin
      nIndex := -1;
      tmps := '';
    end;
  end;
  if nIndex = -1 then
    Result := AOldSeedValue + Format('%.1d',[StrToIntDef(tmps,1)+1])
  else
    Result := Copy(AOldSeedValue,1,nIndex) + Format('%.1d',[StrToIntDef(tmps,1)+1]);
end;

procedure TFrm_Enter.FormShow(Sender: TObject);
var
  LSql: string;
begin
  Fsql1 := ads251.CommandText;
  Fsql2 := ADOQ0056_1.SQL.Text;
  LSql := ' select rkey,abbr_name  from data0015 where active_flag = ' + QuotedStr('Y') +
          ' order by rkey asc';
  if DM.SqlOpen(LSql) then
  begin
    while not dm.qrytmp.Eof do
    begin
      ComboBox1.AddItem(dm.qrytmp.fieldbyname('abbr_name').AsString,Pointer(dm.qrytmp.fieldbyname('rkey').asinteger));
      dm.qrytmp.Next;
    end;
  end;
  LSql := 'select SEED_VALUE  from data0004  where rkey =5';
  if dm.SqlOpen(LSql) then
  begin
    Edit2.Text := dm.qrytmp.fieldbyname('seed_value').asstring;
  end;

  
//  field_name := 'MANU_PART_NUMBER';
//  PreColumn := Grd1.Columns[2];
//
//  field_name1 := 'MANU_PART_NUMBER';
//  PreColumn1 := DBGridEh2.Columns[0];
  eh1TitleClick(eh1.Columns[2]);
  FisHint := true;
end;


procedure TFrm_Enter.BtSaveClick(Sender: TObject);
begin
  dm.qrytmp.Close;
  dm.qrytmp.SQL.Text := 'select rkey from data0214 where status=''0''';
  dm.qrytmp.Open;
  if not dm.qrytmp.IsEmpty then
  begin
    showmessage('当前正在盘点中,不能进行入库....');
    exit;
  end;

  if trim(Edit1.Text) = '' then
  begin
    BitBtn3.SetFocus;
    showmessage('仓库不允许为空!');
    exit;
  end;

  if  (trim(Edit3.Text) = '') and (cbx2.Checked=False) and (pos('尾数仓',Label3.Caption)>0)  then
  begin
  showmessage('存放位置不能为空!');
  exit;
  end;

//  if (FisHint) and (Length(LSelArr) > 49) then
//  begin
//    showmessage('入库记录较多,请您再仔细核对一次,再保存');
//    FisHint := false;
//    exit;
//  end;

  if not RefreshBefrotSave then Exit;

  if StrToIntDef(EdtSum.Text,0) <= 0 then
  begin
    ShowMessage('没有选中项，请重新确认');
    Exit;
  end;

  dm.con1.BeginTrans;
  try
    cds251.DisableControls;
    if cbx2.Checked then
    begin
      cds251.Filter := 'checked = 1';
      cds251.Filtered := True;
      cds251.First;
      while not cds251.Eof do
      begin
        if cds251.FieldByName('rkey60').AsInteger <= 0 then
        begin
          if DM.con1.InTransaction then dm.con1.RollbackTrans;
          cds251.Filtered := False;
          ShowMessage('仓库已经绑定销售订单，入库时候必须有销售订单');
          Exit;
        end;
        cds251.Next;
      end
    end;
    if AccpectToStock then
    begin
      dm.con1.CommitTrans;
      ModalResult := mrOk;
    end;
  finally
    cds251.EnableControls;
    if DM.con1.InTransaction then
    begin
      dm.con1.RollbackTrans;
      ShowMessage('保存失败');
    end;
  end;

end;

function TFrm_Enter.AccpectToStock: Boolean;
var
  LSql: string;
  LRkey416: Integer;
  LRkey53: Integer;
  LSvrTime: TDateTime;
  ltmp: Integer;
  ltmpneed: Integer;
begin
  Result := False;
  try
    LSql := 'select getdate() as svrtime';
    if DM.SqlOpen(LSql) then
    begin
      LSvrTime := DM.qrytmp.fieldbyname('svrtime').AsDateTime;
    end else Exit;

    //取得最新的入库单号
    LSql := 'select SEED_VALUE from data0004  where rkey =5';
    if dm.SqlOpen(LSql) then Edit2.Text := DM.qrytmp.fieldbyname('seed_value').AsString
    else Exit;

    //增加416
    LSql := 'select * from data0416 where rkey is null';
    if dm.SqlOpen(LSql) then
    begin
      dm.qrytmp.Append;
      dm.qrytmp.FieldByName('number').asstring := trim(Edit2.Text); // 入仓单号
      dm.qrytmp.FieldByName('type').AsInteger := 2; // 过数入仓
      dm.qrytmp.FieldByName('empl_ptr').AsInteger := strtoint(user_ptrCaption);// 入库人员
      dm.qrytmp.FieldByName('sys_date').Value := LSvrTime; // 入库日期
      dm.qrytmp.FieldByName('quantity').AsInteger := strtoint(EdtSum.Text);// 入库总Qty
      dm.qrytmp.FieldByName('reference').asstring := Edit4.Text; // remark
      dm.qrytmp.Post;
      LRkey416 := dm.qrytmp.FieldByName('rkey').AsInteger;        
    end else Exit;

    //循环
    cds251.Filter := 'checked = 1';
    cds251.Filtered := True;
    cds251.First;
    while not cds251.Eof do
    begin
      if cds251.FieldByName('checked').AsBoolean then
      begin
        //操作360表
        if cds251.FieldByName('rkey60').AsInteger <> 0 then
        begin
          LSql := ' SELECT * FROM data0360 WHERE (isnull(complete_qty,0) < isnull(quantity,0) ) AND so_ptr = ' + cds251.FieldByName('rkey60').AsString +
                  ' order BY sch_date ASC ';
          DM.SqlOpen(LSql);
          if not DM.qrytmp.IsEmpty then
          begin
            ltmp := cds251.fieldbyname('cpcs').AsInteger;
            while not DM.qrytmp.Eof do
            begin
              ltmpneed := dm.qrytmp.FieldByName('quantity').AsInteger - dm.qrytmp.FieldByName('complete_qty').AsInteger - ltmp;
              if ltmpneed > 0 then
              begin
                dm.qrytmp.Edit;
                DM.qrytmp.FieldByName('complete_qty').AsInteger := DM.qrytmp.FieldByName('complete_qty').AsInteger + ltmp;
                dm.qrytmp.Post;
                ltmp := 0;
              end;
              if ltmpneed <= 0 then
              begin
                ltmp := Abs(ltmpneed);
                dm.qrytmp.Edit;
                DM.qrytmp.FieldByName('complete_qty').AsInteger := DM.qrytmp.FieldByName('quantity').AsInteger;
                DM.qrytmp.FieldByName('complete_FLAG').AsBoolean := LSvrTime <  IncHour(IncDay(DM.qrytmp.FieldByName('sch_date').AsDateTime),8);
                DM.qrytmp.FieldByName('complete_date').AsDateTime := LSvrTime;
                dm.qrytmp.Post;
              end;
              if ltmp = 0 then Break;      
              DM.qrytmp.Next;
            end;
          end;
        end;

      //操作56表
        LSql := 'select to_be_cancd,to_be_stocked from data0056 where rkey =' + cds251.fieldbyname('rkey56').AsString;
        if DM.SqlOpen(LSql) then
        begin
          if not DM.qrytmp.IsEmpty then
          begin
            DM.qrytmp.edit;
            DM.qrytmp.FieldByName('to_be_stocked').AsInteger := DM.qrytmp.FieldByName('to_be_stocked').AsInteger - cds251.fieldbyname('cpcs').AsInteger;
            DM.qrytmp.FieldByName('to_be_cancd').AsInteger := DM.qrytmp.FieldByName('to_be_cancd').AsInteger - cds251.fieldbyname('cpnl').AsInteger;
            dm.qrytmp.Post;
          end else
          begin
            ShowMessage('没有找到在线数据');
            Exit;
          end;
        end else
          Exit;

        //06表
        LSql := 'select * from data0006 where rkey = ' + cds251.fieldbyname('rkey06').AsString;
        if dm.SqlOpen(LSql) then
        begin
          if not DM.qrytmp.IsEmpty then
          begin
            dm.qrytmp.Edit;
            DM.qrytmp.FieldByName('quan_prod').AsInteger := DM.qrytmp.FieldByName('quan_prod').AsInteger + cds251.fieldbyname('cpcs').AsInteger;
            dm.qrytmp.FieldByName('ACT_COMPL_DATE').AsDateTime := LSvrTime;
            dm.qrytmp.Post;
          end else
          begin
            ShowMessage('没有找到对应的06作业单');
            Exit;
          end;
        end else
          Exit;


        //25表
        LSql := 'select QTY_ON_HAND from data0025 where rkey = ' + cds251.fieldbyname('rkey25').AsString;
        if DM.SqlOpen(LSql) then
        begin
          if not DM.qrytmp.IsEmpty then
          begin
            DM.qrytmp.Edit;
            DM.qrytmp.FieldByName('QTY_ON_HAND').AsInteger := DM.qrytmp.FieldByName('QTY_ON_HAND').AsInteger + cds251.fieldbyname('cpcs').AsInteger;
            DM.qrytmp.Post;
          end else
          begin
            ShowMessage('没有找到对应的25MI数据');
            Exit;
          end;
        end else
          Exit;

        //492表
        LSql := 'select FG_QTY,wip_qty from data0492 where rkey = ' + cds251.fieldbyname('rkey492').AsString;
        if dm.SqlOpen(LSql) then
        begin
          if not DM.qrytmp.IsEmpty then
          begin
            dm.qrytmp.Edit;
            DM.qrytmp.FieldByName('FG_QTY').AsInteger := DM.qrytmp.FieldByName('FG_QTY').AsInteger + cds251.fieldbyname('cpcs').AsInteger;
            DM.qrytmp.FieldByName('wip_qty').AsInteger := DM.qrytmp.FieldByName('wip_qty').AsInteger - cds251.fieldbyname('cpcs').AsInteger;
            DM.qrytmp.Post;
          end else
          begin
            ShowMessage('没有找到对应的492数据');
            Exit;
          end;
        end else
          Exit; 

        //新增53表入库单明细
        LSql := 'select * from data0053 where rkey = -1';
        if dm.SqlOpen(LSql) then
        begin
          dm.qrytmp.Append;
          dm.qrytmp.FieldByName('npad_ptr').AsInteger := LRkey416;
          dm.qrytmp.FieldByName('whse_ptr').AsInteger := cds251.fieldbyname('LOC_PTR').AsInteger;//0056工厂指针
          DM.qrytmp.FieldByName('loc_ptr').AsInteger := Edit1.Tag; 
          dm.qrytmp.FieldByName('work_order_ptr').AsInteger := cds251.fieldbyname('rkey06').AsInteger;
          dm.qrytmp.fieldbyname('CUST_part_ptr').AsInteger := cds251.fieldbyname('rkey25').AsInteger;
          dm.qrytmp.FieldByName('quantity').AsInteger := cds251.fieldbyname('cpcs').AsInteger;
          dm.qrytmp.FieldByName('qty_on_hand').AsInteger := cds251.fieldbyname('cpcs').AsInteger;
          dm.qrytmp.FieldByName('panels').AsInteger := cds251.fieldbyname('cpnl').AsInteger;
          DM.qrytmp.FieldByName('mfg_date').AsDateTime := LSvrTime;
          dm.qrytmp.FieldByName('reference_NUMBER').AsString := cds251.fieldbyname('bknote').AsString;
          dm.qrytmp.FieldByName('dept_ptr').AsInteger := cds251.fieldbyname('cdept_ptr').AsInteger;
          dm.qrytmp.FieldByName('step').AsInteger := cds251.fieldbyname('cstep').AsInteger;
          dm.qrytmp.FieldByName('po_number').AsString := cds251.fieldbyname('po_number').AsString;
          if cds251.fieldbyname('rkey60').AsInteger <> 0 then
            dm.qrytmp.FieldByName('barcode_ptr').AsInteger := cds251.fieldbyname('rkey60').AsInteger;
          dm.qrytmp.FieldByName('spec_place').AsString := Edit3.Text;
          dm.qrytmp.FieldByName('ischaban').AsInteger := cds251.fieldbyname('ischaban').AsInteger;
          dm.qrytmp.FieldByName('zhouqi').AsString := cds251.fieldbyname('zhouqi').AsString;
          if cds251.FieldByName('put_type').AsInteger > 0 then//2-返修重检入仓
            DM.qrytmp.FieldByName('rma_ptr').AsInteger := 2
          else
          if cds251.FieldByName('TTYPE492').AsInteger = 3 then//退货重检入仓
            dm.qrytmp.FieldByName('rma_ptr').AsInteger := 1
          else
            dm.qrytmp.FieldByName('rma_ptr').AsInteger := 0; //正常过数入仓
          DM.qrytmp.Post;
          LRkey53 := DM.qrytmp.fieldbyname('rkey').AsInteger;
        end else
          Exit;


        //生成48产出记录
        LSql := 'select * from data0048 where rkey = -1';
        if DM.SqlOpen(LSql) then
        begin
          dm.qrytmp.Append;
          dm.qrytmp.FieldByName('wo_ptr').AsInteger := cds251.fieldbyname('rkey06').AsInteger;
          dm.qrytmp.FieldByName('fm_dept_ptr').AsInteger := cds251.fieldbyname('cdept_ptr').AsInteger;
          dm.qrytmp.FieldByName('work_center_ptr').AsInteger := cds251.fieldbyname('cdept_ptr').AsInteger;
          dm.qrytmp.FieldByName('intime').AsDateTime := cds251.fieldbyname('intime').AsDateTime;
          dm.qrytmp.FieldByName('outtime').AsDateTime := LSvrTime;
          dm.qrytmp.FieldByName('qty_prod').AsInteger := cds251.fieldbyname('cpcs').AsInteger;
          dm.qrytmp.FieldByName('PANELS').AsInteger := cds251.fieldbyname('cpnl').AsInteger;
          dm.qrytmp.FieldByName('qty_reject').AsInteger := 0;
          dm.qrytmp.FieldByName('FLOW_NO').AsInteger := cds251.fieldbyname('FLOW_NO').AsInteger;
          dm.qrytmp.FieldByName('step_no').AsInteger := cds251.fieldbyname('cstep').AsInteger;
          dm.qrytmp.FieldByName('empl_ptr').Value := cds251.fieldbyname('EMPLOYEE_PTR').Value;
          dm.qrytmp.FieldByName('warehouse_ptr').AsInteger :=  cds251.fieldbyname('LOC_PTR').AsInteger;
          if (cds251.FieldByName('TTYPE492').AsInteger = 3) or (cds251.FieldByName('PUT_TYPE').AsInteger > 0) then
            dm.qrytmp.FieldByName('wtype').AsInteger := 2
          else
            DM.qrytmp.FieldByName('wtype').AsInteger := 0;
          dm.qrytmp.Post;
        end else
          Exit;

        //生产完成
        LSql := 'select * from data0056 where rkey = ' + cds251.fieldbyname('rkey56').AsString;
        if DM.SqlOpen(LSql) then
        begin
          if (DM.qrytmp.FieldByName('QTY_BACKLOG').AsInteger <= 0) and
             (DM.qrytmp.FieldByName('to_be_stocked').AsInteger <= 0)
          then
          begin
            LSql := 'update data0006 set prod_status=9,proj_compl_date=getdate() where rkey = ' + cds251.fieldbyname('rkey06').AsString;
            if not DM.SqlExec(LSql) then Exit;
            LSql := 'delete from data0056 where rkey = ' + cds251.fieldbyname('rkey56').AsString;
            if not DM.SqlExec(LSql) then Exit;
          end;
        end else
          Exit;

        //修改251的状态
        LSql := 'select status,ouser_ptr,otime,d53_ptr from data0251 where status = 0 and rkey = ' + cds251.fieldbyname('rkey251').AsString;
        if DM.SqlOpen(LSql) then
        begin
          if not DM.qrytmp.IsEmpty then
          begin
            //删除251的记录 2018-3-19日，王总培训BS架构时候决定
            DM.qrytmp.Delete;
//            DM.qrytmp.Edit;
//            DM.qrytmp.FieldByName('d53_ptr').AsInteger := LRkey53;
//            DM.qrytmp.FieldByName('status').AsInteger := 1;
//            dm.qrytmp.FieldByName('ouser_ptr').AsInteger := strtoint(user_ptrCaption);
//            DM.qrytmp.FieldByName('otime').AsDateTime := LSvrTime;
//            dm.qrytmp.Post;
          end else
          begin
            ShowMessage('没有找到对应的251数据，请重试');
            Exit;
          end;
        end else
          Exit;
      end;

      cds251.Next;
    end;

    LSql := ' update data0060 ' +
            ' set ' +
            ' complete_date=getdate(), ' +
            ' CONSUME_FORECASTS=case when GETDATE() <= Data0060.ORIG_REQUEST_DATE then 1 ELSE 0 end, ' +
            ' reg_tax_fixed_unused = CASE WHEN GETDATE() <= Data0060.SCH_DATE THEN 1 ELSE 0 end ' +
            ' FROM         dbo.Data0060 INNER JOIN ' +
            ' (SELECT     dbo.Data0053.barcode_ptr ' +
            ' FROM          dbo.data0416 INNER JOIN ' +
            ' dbo.Data0053 ON dbo.data0416.rkey = dbo.Data0053.NPAD_PTR ' +
            ' WHERE      (dbo.data0416.rkey = ' + IntToStr(LRkey416) + ') AND (dbo.Data0053.barcode_ptr IS NOT NULL) ' +
            ' GROUP BY dbo.Data0053.barcode_ptr) AS derivedtbl_1 ON dbo.Data0060.RKEY = derivedtbl_1.barcode_ptr ' +
            ' WHERE   (dbo.Data0060.REPUT_APPR_BY >= dbo.Data0060.PARTS_ORDERED + dbo.Data0060.PARTS_RETURNED) ' +
            ' and Data0060.complete_date is null ';

        if not DM.SqlExec(LSql) then
        begin
          ShowMessage(LSql);
          exit;
        end;

    //入仓单号加1
    LSql := 'update data0004 set seed_value = ' + QuotedStr(IncSeedValue(Edit2.Text)) + ' where rkey = 5 ';
    if not dm.SqlExec(LSql) then Exit;

    Result := True;
  except
    on e: Exception do
    begin
      if dm.con1.InTransaction then DM.con1.RollbackTrans;
      Result := False;
      ShowMessage(e.Message);
    end;
  end;
end;



procedure TFrm_Enter.BitBtn3Click(Sender: TObject);
var
  LFrm: TFrm_Loc;
begin
  if ComboBox1.ItemIndex = -1 then
  begin
    showmessage('请先选择工厂');
    exit;
  end;
  LFrm := TFrm_Loc.Create(Self);
  try
    LFrm.FaID :=  Integer(ComboBox1.Items.Objects[ComboBox1.ItemIndex]);
    if LFrm.ShowModal = mrok then
    begin
      Edit1.Tag := LFrm.ADOQuery1.fieldbyname('rkey').AsInteger;
      Edit1.Text := LFrm.ADOQuery1code.asstring;
      Label3.Caption := LFrm.ADOQuery1location.asstring;
      Edit3.Text := LFrm.EdtLoc.Text;
      cbx2.Checked := LFrm.ADOQuery1relationOrder.AsBoolean;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TFrm_Enter.cbxSelectAllClick(Sender: TObject);
var
  LOldRecNo: Integer;
begin
  LOldRecNo := cds251.RecNo;
  cds251.DisableControls;
  try
    cds251.First;
    while not cds251.Eof do
    begin
      if  cds251.FieldByName('checked').AsBoolean <> cbxSelectAll.Checked then
      begin
        cds251.Edit;
        cds251.FieldByName('checked').AsBoolean := cbxSelectAll.Checked;
        cds251.Post;
      end;
      cds251.Next;
    end;
    cds251.RecNo := LOldRecNo;
  finally
    cds251.EnableControls;
  end;
end;

procedure TFrm_Enter.edtFilter1Change(Sender: TObject);
begin
  if (edtFilter1.Text) = '' then
  begin
    cds251.Filter := '';
    cds251.Filtered := False;
  end else
  begin
    cds251.Filter := FHotColum.FieldName + ' like ''%' + UpperCase(edtFilter1.Text) + '%''';
    cds251.Filtered := True;
  end;
end;

procedure TFrm_Enter.eh1TitleClick(Column: TColumnEh);
begin
//  if not cds251.Active then
//    exit;
//  if (Column.Field.FullName = 'OUTSOURCE') or (Column.Field.FullName = 'xh')
//  then
//    exit;
//  if Column.Title.SortMarker = smDownEh then
//  begin
//    Column.Title.SortMarker := smUpEh;
//    cds251.Sort := Column.FieldName;
//  end
//  else
//  begin
//    Column.Title.SortMarker := smDownEh;
//    cds251.Sort := Column.FieldName + ' DESC';
//  end;
//
//  if (field_name <> Column.FieldName) and (Column.Index in [2, 3, 4, 10]) then
//  begin
//    Label6.Caption := Column.Title.Caption;
//    field_name := Column.FieldName;
//    Edit5.SetFocus;
//    PreColumn.Title.Color := clBtnFace;
//    Column.Title.Color := clred;
//    PreColumn := Column;
//    Edit5Change(nil);
//  end
//  else
//    Edit5.SetFocus;

  FHotColum := Column;
  Label6.Caption := FHotColum.Title.Caption;
end;

procedure TFrm_Enter.eh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift) and (Key = 86) then
  begin
    ShowMessage(ads251.CommandText);
  end;
end;

procedure TFrm_Enter.Edit6Change(Sender: TObject);
begin
//  if (Edit6.Text) = '' then
//    ADOQ0056_1.Filter := ''
//  else
//  begin
//    ADOQ0056_1.Filter := '';
//    ADOQ0056_1.Filter := field_name1 + ' like ''%' + Edit6.Text + '%''';
//  end;
end;

procedure TFrm_Enter.DBGridEh2TitleClick(Column: TColumnEh);
begin
//  if not ADOQ0056_1.Active then
//    exit;
//  if Column.Title.SortMarker = smDownEh then
//  begin
//    Column.Title.SortMarker := smUpEh;
//    ADOQ0056_1.Sort := Column.FieldName;
//  end
//  else
//  begin
//    Column.Title.SortMarker := smDownEh;
//    ADOQ0056_1.Sort := Column.FieldName + ' DESC';
//  end;
//
//  if (field_name1 <> Column.FieldName) and (Column.Index in [0, 1, 2]) then
//  begin
//    Label8.Caption := Column.Title.Caption;
//    field_name1 := Column.FieldName;
//    Edit6.SetFocus;
//    PreColumn1.Title.Color := clBtnFace;
//    Column.Title.Color := clred;
//    PreColumn1 := Column;
//    Edit6Change(nil);
//  end
//  else
//    Edit6.SetFocus;
end;

procedure TFrm_Enter.ComboBox1Change(Sender: TObject);
begin
  EdtSum.Text := '0';
  Edit1.Text := '';
  Label3.Caption := '';
  Get251Data;
end;

procedure TFrm_Enter.N1Click(Sender: TObject);
var
  s: string;
begin
  s := cds251.fieldbyname('bknote').AsString;
  if inputQuery('备注修改','备注',s) then
  begin
    DM.con1.BeginTrans;
    try
      cds251.Edit;
      cds251.FieldByName('bknote').AsString := s;
      cds251.Post;
      if dm.SqlOpen('select bknote from data0251 where rkey = ' + cds251.fieldbyname('rkey251').AsString) then
      begin
        DM.qrytmp.Edit;
        DM.qrytmp.FieldByName('bknote').AsString := s;
        DM.qrytmp.Post;
      end;
      dm.con1.CommitTrans;
    except
      on e: Exception do
      begin
        if DM.con1.InTransaction then dm.con1.RollbackTrans;
        ShowMessage(e.Message);
      end;
    end;
  end;
end;

procedure TFrm_Enter.PopupMenu1Popup(Sender: TObject);
begin
  N1.Enabled := not cds251.IsEmpty;
end;

procedure TFrm_Enter.BtCloseClick(Sender: TObject);
begin
  Modalresult := mrCancel;
end;

procedure TFrm_Enter.cds251CalcFields(DataSet: TDataSet);
begin
  if DataSet.RecNo <> -1 then
    cds251.FieldByName('xh').AsInteger := DataSet.RecNo
  else
    cds251.FieldByName('xh').AsInteger := 1;
end;

procedure TFrm_Enter.cds251checkedChange(Sender: TField);
begin
  if cds251.FieldByName('checked').AsBoolean then
    EdtSum.Text := IntToStr(StrToInt(EdtSum.Text) + cds251.FieldByName('cpcs').AsInteger)
  else
    EdtSum.Text := IntToStr(StrToInt(EdtSum.Text) - cds251.FieldByName('cpcs').AsInteger);
end;

procedure TFrm_Enter.Get251Data;
begin
  ADOQ0056_1.Close;
  ADOQ0056_1.SQL.Text := Fsql2 + 'and data0056.loc_ptr=' +
    IntToStr(Integer(ComboBox1.Items.Objects[ComboBox1.ItemIndex])) +
    ' GROUP BY Data0060.SALES_ORDER, Data0060.PARTS_ORDERED,' +
    'Data0060.PARTS_SHIPPED, Data0025.MANU_PART_NUMBER,' +
    'Data0025.MANU_PART_DESC,data0056.po_number ' +
    'order by Data0025.MANU_PART_NUMBER,Data0060.SALES_ORDER';
  ADOQ0056_1.Open;

  ads251.Close;
  ads251.CommandText := Fsql1 + 'and d56.loc_ptr=' + inttostr(Integer(ComboBox1.Items.Objects[ComboBox1.ItemIndex])) +
    ' order by d251.ctime desc, d25.MANU_PART_NUMBER,d06.WORK_ORDER_NUMBER';
  ads251.Open;
  cds251.Data := dsp1.Data;
  ads251.Close;

end;

function TFrm_Enter.RefreshBefrotSave: Boolean;
var
  LSql: string;
  LOldRecNO: Integer;
  LSelArr: array of Integer;
  I: Integer;
begin
  Result := False;
  LSql := 'select SEED_VALUE  from data0004  where rkey =5';
  if dm.SqlOpen(LSql) then
  begin
    Edit2.Text := dm.qrytmp.fieldbyname('seed_value').asstring;
  end;

  LOldRecNO := cds251.RecNo;
  cds251.DisableControls;
  cds251.Filter := 'checked = 1';
  cds251.Filtered := True;
  SetLength(LSelArr,0);
  try
    cds251.First;
    while not cds251.Eof do
    begin
      if cds251.FieldByName('checked').AsBoolean then
      begin
        SetLength(LSelArr,Length(LSelArr)+1);
        LSelArr[High(LSelArr)] := cds251.fieldbyname('rkey251').AsInteger;
      end;
      cds251.Next;
    end;
    //cds251.RecNo := LOldRecNO;
  finally
    cds251.EnableControls;
  end;
  if Length(LSelArr) = 0 then
  begin
    showmessage('没有记录被选中');
    exit;
  end;
  
  Get251Data;
  EdtSum.Text := '0';
  cds251.Filtered := False;
  cds251.DisableControls;
  try
    for I := 0 to Length(LSelArr) - 1 do
    begin
      if cds251.Locate('rkey251',LSelArr[I],[]) then
      begin
        cds251.Edit;
        cds251.FieldByName('checked').AsBoolean := True;
        cds251.Post;
      end;
    end;
    //cds251.RecNo := LOldRecNO;
  finally
    cds251.EnableControls;
  end;

  Result := True;
end;

end.
