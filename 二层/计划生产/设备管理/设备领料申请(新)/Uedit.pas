unit Uedit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, DB, ADODB, StdCtrls, Buttons, Mask, ComCtrls, Grids, DBGridEh, Menus, StrUtils;

type
  TfrmEdit = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    pnl5: TPanel;
    pnl6: TPanel;
    ds468: TDataSource;
    qry268: TADOQuery;
    pnl7: TPanel;
    btn1: TBitBtn;
    btnBtnSave: TBitBtn;
    lbl1: TLabel;
    lbl2: TLabel;
    RDate: TDateTimePicker;
    edt_RNo: TMaskEdit;
    lbl4: TLabel;
    lbl5: TLabel;
    edt_AuditCode: TEdit;
    edt_Dept: TEdit;
    btn_SelAudit: TSpeedButton;
    lbl6: TLabel;
    lbl7: TLabel;
    eh468: TDBGridEh;
    edt_RMan: TEdit;
    edt_AuditName: TEdit;
    lbl20: TLabel;
    edt_AuditDate: TEdit;
    lbl21: TLabel;
    edt_status: TEdit;
    edt_WH: TEdit;
    btn_selWH: TSpeedButton;
    qry468_save: TADOQuery;
    pm468: TPopupMenu;
    mni_add: TMenuItem;
    mni_del: TMenuItem;
    qry268_save: TADOQuery;
    chk_prt: TCheckBox;
    pnl10: TPanel;
    pnl12: TPanel;
    Label1: TLabel;
    edt_DeptCode: TEdit;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    edt_DeptName2: TEdit;
    edt_group: TEdit;
    SpeedButton2: TSpeedButton;
    remark: TMemo;
    Label3: TLabel;
    pnl11: TPanel;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    pnl8: TPanel;
    lbl18: TLabel;
    btn_SelMDate: TSpeedButton;
    lbl19: TLabel;
    btn_SelE: TSpeedButton;
    edt_E: TEdit;
    edt_En: TEdit;
    ts3: TTabSheet;
    pnl9: TPanel;
    lbl15: TLabel;
    btn_selWNO: TSpeedButton;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    edt_BNO: TEdit;
    edt_DeptName: TEdit;
    edt_W: TEdit;
    edt_Wremark: TMemo;
    rg1: TRadioGroup;
    pnl13: TPanel;
    lbl8: TLabel;
    lbl9: TLabel;
    edt_ECode: TEdit;
    edt_RPNo: TEdit;
    btn_selBillNo: TSpeedButton;
    edt_eName: TEdit;
    edt_FReason: TMemo;
    lbl10: TLabel;
    lbl11: TLabel;
    edt_repairRec: TMemo;
    edt_MDate: TMaskEdit;
    procedure btn1Click(Sender: TObject);
    procedure rg1Click(Sender: TObject);
    procedure btn_selBillNoClick(Sender: TObject);
    procedure btn_SelMDateClick(Sender: TObject);
    procedure btn_SelEClick(Sender: TObject);
    procedure btn_selWNOClick(Sender: TObject);
    procedure btn_SelDeptClick(Sender: TObject);
    procedure btn_SelGoupClick(Sender: TObject);
    procedure btn_selWHClick(Sender: TObject);
    procedure btn_SelAuditClick(Sender: TObject);
    procedure btnBtnSaveClick(Sender: TObject);
    procedure mni_delClick(Sender: TObject);
    procedure mni_addClick(Sender: TObject);
    procedure edt_AuditCodeExit(Sender: TObject);
    procedure edt_WHExit(Sender: TObject);
    procedure edt_RPNoExit(Sender: TObject);
    procedure edt_EExit(Sender: TObject);
    procedure edt_BNOExit(Sender: TObject);
    procedure edt_DeptCodeExit(Sender: TObject);
    procedure edt_groupExit(Sender: TObject);
  private
    { Private declarations }
    rgIndex: Integer;
    OutPtr: string;
    OutPtr_edt: TEdit;
    function GetRkeyList: string;
    function checkNo: boolean;
  public
    { Public declarations }
    FEditType: integer;
    procedure Getdata(arkey: string);
  end;

var
  frmEdit: TfrmEdit;

implementation

uses
  UDM, common, Pick_Item_Single, ConstVar, USelMaterial;
{$R *.dfm}

procedure TfrmEdit.btn1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmEdit.rg1Click(Sender: TObject);
begin

  if rg1.ItemIndex = 0 then
  begin
    pgc1.ActivePageIndex := 0;
    pgc1.Visible := true;
    pnl8.Visible := false;
    pnl9.Visible := True;
    rgIndex := 2;
  end
  else if rg1.ItemIndex = 1 then
  begin
    pgc1.Visible := true;
    pgc1.ActivePageIndex := 1;
    pnl8.Visible := true;
    pnl9.Visible := false;
    rgIndex := 3;
  end
  else if rg1.ItemIndex = 2 then
  begin
    pgc1.Visible := true;
    pgc1.ActivePageIndex := 2;
    pnl8.Visible := false;
    pnl9.Visible := True;
    rgIndex := 4;
  end
  else if rg1.ItemIndex = 3 then
  begin
    rgIndex := 5;
    pgc1.Visible := false;
  end;

end;

procedure TfrmEdit.btn_selBillNoClick(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  if (rg1.ItemIndex <> 0) and (rg1.ItemIndex <> 1) then
  begin
    ShowMessage('选择相应的领料类型才能录入！');
    Exit;
  end;
  frmPick_Item_Single := TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields := 'NUMBER/维修单号/100,V_stat/状态/150,FASSET_CODE/设备代码/100,FASSET_NAME/设备名称/100,DEPT_NAME/部门名称/100,failure_circs/故障情况说明/100,maintain_text/维修记录说明/100,Location/责任小组/100,ABBR_NAME/工厂/80';
    InputVar.Sqlstr := ' select complete_date,dbo.data0567.rkey,dbo.data0567.NUMBER,dbo.DATA0417.FASSET_CODE, ' + ' dbo.DATA0417.FASSET_NAME,Data0034.rkey as rkey34,Data0034.dept_code,dbo.Data0034.DEPT_NAME,failure_circs,maintain_text,' + ' case data0567.status when 0 then ''未提交'' when 1 then ''待受理'' when 2 then ''已受理''' + '      when 3 then ''已完工'' when 4 then ''已验收'' when 5 then ''被退回'' when 6 then ''已暂停''' +
      '      when 8 then ''验收退回''  end as V_stat, Data0034.DEPT_CODE,DATA0417.EquiType,data0840.Location,data0567.WHOUSE_PTR,data0015.ABBR_NAME' + ',data0840.rkey as rkey840,data0015.rkey as rkey15' + ' from dbo.data0567' + ' join dbo.DATA0417 on dbo.data0567.Fasset_ptr=dbo.DATA0417.rkey' + ' join  dbo.Data0034 on dbo.DATA0417.DEPT_PTR=dbo.Data0034.rkey' + ' left join data0840 on data0567.d840_ptr=data0840.rkey' + ' inner join data0015 on data0567.WHOUSE_PTR=data0015.rkey' + '  where   ( STATUS in (1,2,6))  or ' + ' ( (STATUS in (3,4)) and  complete_date>= cast(CONVERT(varchar(7),getdate(),120)+''-1'' as datetime))';

    inputvar.KeyField := 'rkey';
    InputVar.AdoConn := DM.con1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal = mrok then
    begin
    //btn_selBillNo.Tag:=  frmPick_Item_Single.adsPick.Fieldbyname('rkey34').AsInteger;

      edt_RPNo.Tag := frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
      edt_RPNo.Text := frmPick_Item_Single.adsPick.Fieldbyname('NUMBER').asstring;
      edt_ecode.Text := frmPick_Item_Single.adsPick.Fieldbyname('FASSET_CODE').asstring;
      edt_eName.text := frmPick_Item_Single.adsPick.Fieldbyname('FASSET_NAME').asstring;
      edt_FReason.Text := frmPick_Item_Single.adsPick.Fieldbyname('failure_circs').asstring;
      edt_repairRec.Text := frmPick_Item_Single.adsPick.Fieldbyname('maintain_text').asstring;

      edt_DeptCode.tag := frmPick_Item_Single.adsPick.Fieldbyname('rkey34').AsInteger;
      edt_DeptCode.text := frmPick_Item_Single.adsPick.Fieldbyname('dept_code').asstring;
      edt_DeptName2.text := frmPick_Item_Single.adsPick.Fieldbyname('dept_name').asstring;

    //工厂：
      edt_WH.Tag := frmPick_Item_Single.adsPick.Fieldbyname('WHOUSE_PTR').asinteger;
      edt_WH.text := frmPick_Item_Single.adsPick.Fieldbyname('ABBR_NAME').asstring;

     //责任小组：
      edt_group.Tag := frmPick_Item_Single.adsPick.Fieldbyname('rkey840').asinteger;
      edt_group.text := frmPick_Item_Single.adsPick.Fieldbyname('Location').asstring;

      Outptr := 'D567_ptr';
      OutPtr_edt := edt_RPNo;

    end;
  finally
    frmPick_Item_Single.Free;
  end;

end;

procedure TfrmEdit.btn_SelMDateClick(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  if (rg1.ItemIndex <> 0) and (rg1.ItemIndex <> 1) then
  begin
    ShowMessage('选择相应的领料类型才能录入！');
    Exit;
  end;
  frmPick_Item_Single := TfrmPick_Item_Single.Create(nil);
  try

    InputVar.Fields := 'DEPT_NAME/部门名称/100,PlanMainDate/保养日期/150,DeviNumb/设备代码/100,FASSET_NAME/设备名称/100,MainCycl/保养周期/100,DEPT_CODE/部门代码/100,Location/责任小组/100';
    InputVar.Sqlstr := 'select dbo.data0831.rkey,convert(varchar(10),PlanMainDate,120)PlanMainDate,DeviNumb,dbo.DATA0417.FASSET_NAME,MainCycl, ' + ' Data0034.DEPT_CODE,Data0034.DEPT_NAME,DATA0417.EquiType,data0840.Location' + ',d15.rkey as rkey15,d15.ABBR_NAME,data0840.rkey as rkey840,data0034.rkey as rkey34' + ' from dbo.data0831' + ' join dbo.DATA0417 on dbo.data0831.DeviNumb=dbo.DATA0417.FASSET_CODE' + ' join  dbo.Data0034 on dbo.DATA0417.DEPT_PTR=dbo.Data0034.rkey' + ' join data0840 on DATA0417.d840_ptr=data0840.rkey' + ' join data0015 d15 on data0840.D015_ptr=d15.rkey' + ' where RKEY832<>2';
    inputvar.KeyField := 'rkey';
    InputVar.AdoConn := DM.con1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if Trim(edt_MDate.Text) <> '-  -' then
    begin
      frmPick_Item_Single.adsPick.Filtered := false;
      frmPick_Item_Single.adsPick.Filter := ' PlanMainDate=''' + Trim(edt_MDate.Text) + ''' ';
      frmPick_Item_Single.adsPick.Filtered := true;
    end;
    if frmPick_Item_Single.ShowModal = mrok then
    begin
      edt_MDate.Tag := frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
      edt_MDate.Text := frmPick_Item_Single.adsPick.Fieldbyname('PlanMainDate').asstring;
      edt_E.text := frmPick_Item_Single.adsPick.Fieldbyname('DeviNumb').asstring;
      edt_EN.text := frmPick_Item_Single.adsPick.Fieldbyname('FASSET_NAME').asstring;
      edt_e.Tag := frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
        //工厂：
      edt_WH.Tag := frmPick_Item_Single.adsPick.Fieldbyname('rkey15').asinteger;
      edt_WH.text := frmPick_Item_Single.adsPick.Fieldbyname('ABBR_NAME').asstring;

     //责任小组：
      edt_group.Tag := frmPick_Item_Single.adsPick.Fieldbyname('rkey840').asinteger;
      edt_group.text := frmPick_Item_Single.adsPick.Fieldbyname('Location').asstring;

    //设备所在部门
      edt_DeptCode.Tag := frmPick_Item_Single.adsPick.Fieldbyname('rkey34').AsInteger;
      edt_DeptCode.Text := frmPick_Item_Single.adsPick.Fieldbyname('DEPT_CODE').asstring;
      edt_DeptName2.Text := frmPick_Item_Single.adsPick.Fieldbyname('DEPT_NAME').asstring;

      with DM.qrytemp do
      begin
        Close;
        SQL.Text:='SELECT dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION  '+#13+
                  '            , dbo.Data0821.Quantity, dbo.Data0002.UNIT_NAME   '+#13+
                  '            ,dbo.Data0821.Rkey, dbo.Data0821.Rkey831, dbo.Data0821.Rkey17   '+#13+
                  '            ,dbo.Data0821.unit_ptr    '+#13+
                  '  FROM         dbo.Data0821 INNER JOIN '+#13+
                  '                        dbo.Data0017 ON dbo.Data0821.Rkey17 = dbo.Data0017.RKEY INNER JOIN  '+#13+
                  '                        dbo.Data0002 ON dbo.Data0821.unit_ptr = dbo.Data0002.RKEY   '+#13+
                  '  where data0821.Rkey831 = ' + frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsString;
        Open;
        if not IsEmpty then
        begin
          while not Eof do
          begin

            dm.qry468.append;
            dm.qry468.FieldByName('INV_part_NUMBER').value :=fieldbyname('INV_PART_NUMBER').Value;
            dm.qry468.FieldByName('INV_name').value :=fieldbyname('INV_NAME').Value;
            dm.qry468.FieldByName('INV_DESCRIPTION').value :=fieldbyname('INV_DESCRIPTION').asstring;//
            dm.qry468.FieldByName('unit_name').value :=fieldbyname('UNIT_NAME').Value;
            dm.qry468.FieldByName('QUAN_BOM').value :=fieldbyname('Quantity').Value;
            dm.qry468.FieldByName('STEP').value :=0;
            dm.qry468.FieldByName('INVENT_PTR').value:=fieldbyname('Rkey17').Value;
            dm.qry468.FieldByName('Invent_or').value:= 0;
            dm.qry468.FieldByName('Runit').value:= fieldbyname('unit_ptr').Value;
//            if  dm.qry17.fieldbyname('XY').asstring='普通库存' then
//            dm.qry468.FieldByName('PRINTIT').value := 'Y'
//            else   dm.qry468.FieldByName('PRINTIT').value := 'N';
             dm.qry468.FieldByName('PRINTIT').value := 'Y' ;
//            dm.qry468.FieldByName('VENDOR').value :=Lfrm.cbb_Vendor.text;
//            dm.qry468.FieldByName('supplier_ptr').value:= Lfrm.cbb_Vendor.tag;
            dm.qry468.post;

            Next;
          end;
        end;
      end;
    end;
  finally
    frmPick_Item_Single.Free;
  end;

end;

procedure TfrmEdit.btn_SelEClick(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(nil);
  try

    InputVar.Fields := 'DEPT_NAME/部门名称/100,PlanMainDate/保养日期/150,DeviNumb/设备代码/100,FASSET_NAME/设备名称/100,MainCycl/保养周期/100,DEPT_CODE/部门代码/100,Location/责任小组/100';
    InputVar.Sqlstr := 'select dbo.data0831.rkey,PlanMainDate,DeviNumb,dbo.DATA0417.FASSET_NAME,MainCycl,' + ' Data0034.DEPT_CODE,Data0034.DEPT_NAME,DATA0417.EquiType,data0840.Location' + ' from dbo.data0831' + ' join dbo.DATA0417 on dbo.data0831.DeviNumb=dbo.DATA0417.FASSET_CODE' + ' join  dbo.Data0034 on dbo.DATA0417.DEPT_PTR=dbo.Data0034.rkey' + ' join data0840 on DATA0417.d840_ptr=data0840.rkey' + ' where RKEY832<>2';

    inputvar.KeyField := 'rkey';
    InputVar.AdoConn := DM.con1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal = mrok then
    begin
      edt_e.Tag := frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
      edt_e.Text := frmPick_Item_Single.adsPick.Fieldbyname('DeviNumb').asstring;
      edt_eN.Text := frmPick_Item_Single.adsPick.Fieldbyname('FASSET_NAME').asstring;

      edt_MDate.Tag := frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
      edt_MDate.Text := frmPick_Item_Single.adsPick.Fieldbyname('PlanMainDate').asstring;

      with DM.qrytemp do
      begin
        Close;
        SQL.Text:='SELECT dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION  '+#13+
                  '            , dbo.Data0821.Quantity, dbo.Data0002.UNIT_NAME   '+#13+
                  '            ,dbo.Data0821.Rkey, dbo.Data0821.Rkey831, dbo.Data0821.Rkey17   '+#13+
                  '            ,dbo.Data0821.unit_ptr    '+#13+
                  '  FROM         dbo.Data0821 INNER JOIN '+#13+
                  '                        dbo.Data0017 ON dbo.Data0821.Rkey17 = dbo.Data0017.RKEY INNER JOIN  '+#13+
                  '                        dbo.Data0002 ON dbo.Data0821.unit_ptr = dbo.Data0002.RKEY   '+#13+
                  '  where data0821.Rkey831 = ' + frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsString;
        Open;
        if not IsEmpty then
        begin
          while not Eof do
          begin
            dm.qry468.append;
            dm.qry468.FieldByName('INV_part_NUMBER').value :=fieldbyname('INV_PART_NUMBER').Value;
            dm.qry468.FieldByName('INV_name').value :=fieldbyname('INV_NAME').Value;
            dm.qry468.FieldByName('INV_DESCRIPTION').value :=fieldbyname('INV_DESCRIPTION').asstring;//
            dm.qry468.FieldByName('unit_name').value :=fieldbyname('UNIT_NAME').Value;
            dm.qry468.FieldByName('QUAN_BOM').value :=fieldbyname('Quantity').Value;
            dm.qry468.FieldByName('STEP').value :=0;
            dm.qry468.FieldByName('INVENT_PTR').value:=fieldbyname('Rkey17').Value;
            dm.qry468.FieldByName('Invent_or').value:= 0;
            dm.qry468.FieldByName('Runit').value:= fieldbyname('unit_ptr').Value;
//            if  dm.qry17.fieldbyname('XY').asstring='普通库存' then
//                  dm.qry468.FieldByName('PRINTIT').value := 'Y'
//            else   dm.qry468.FieldByName('PRINTIT').value := 'N';
             dm.qry468.FieldByName('PRINTIT').value := 'Y';

//            dm.qry468.FieldByName('VENDOR').value :=Lfrm.cbb_Vendor.text;
//            dm.qry468.FieldByName('supplier_ptr').value:= Lfrm.cbb_Vendor.tag;
            dm.qry468.post;

            Next;
          end;
        end;
      end;      
    end;
  finally
    frmPick_Item_Single.Free;
  end;

end;

procedure TfrmEdit.btn_selWNOClick(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  if (rg1.ItemIndex <> 0) and (rg1.ItemIndex <> 2) then
  begin
    ShowMessage('选择相应的领料类型才能录入！');
    Exit;
  end;

  frmPick_Item_Single := TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields := 'WorkOrder/工作单号/100,DeptName/部门名称/150,WorkName/任务名称/100,WorkExpl/任务说明/100';
    InputVar.Sqlstr := ' select dbo.data0835.rkey,WorkOrder,dbo.Data0830.DeptName, dbo.Data0836.WorkName,WorkExpl ' +
                //  ',d15.rkey as rkey15 '+
      ' from dbo.data0835' + ' join  dbo.Data0830 on dbo.data0835.DEPT_PTR=dbo.Data0830.rkey' + ' join dbo.Data0836 on dbo.data0835.Work_ptr=dbo.Data0836.rkey' +
                //  ' inner join data0015 d15 on data0835.D015_ptr=d15.rkey'+
      ' where Status <>2 ';

    inputvar.KeyField := 'rkey';
    InputVar.AdoConn := DM.con1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal = mrok then
    begin
      edt_BNO.Tag := frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
      edt_BNO.Text := frmPick_Item_Single.adsPick.Fieldbyname('WorkOrder').asstring;
      edt_DeptName.Text := frmPick_Item_Single.adsPick.Fieldbyname('DeptName').asstring;
      edt_W.Text := frmPick_Item_Single.adsPick.Fieldbyname('WorkName').asstring;
      edt_Wremark.Text := frmPick_Item_Single.adsPick.Fieldbyname('WorkExpl').asstring;
      Outptr := 'D835_ptr';
      OutPtr_edt := edt_BNO;
    end;
  finally
    frmPick_Item_Single.Free;
  end;

end;

procedure TfrmEdit.btn_SelDeptClick(Sender: TObject);
var
  InputVar: PDlgInput;
begin
//  if rg1.ItemIndex<>3  then
//  begin
//  ShowMessage('选择相应的领料类型才能录入！');
//  Exit;
//  end;

  frmPick_Item_Single := TfrmPick_Item_Single.Create(nil);
  try

    InputVar.Fields := 'DEPT_CODE/部门代码/100,DEPT_NAME/部门名称/150';
    InputVar.Sqlstr := 'select RKEY,DEPT_CODE,DEPT_NAME from data0034 ' + ' where (ttype in (4,1) or is_cost_dept=1)and (ACTIVE_FLAG=0)' + ' and RKEY in (select DEPT_PTR from data0417 )';
    inputvar.KeyField := 'rkey';
    InputVar.AdoConn := DM.con1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal = mrok then
    begin
      edt_DeptCode.Tag := frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
      edt_DeptCode.Text := frmPick_Item_Single.adsPick.Fieldbyname('DEPT_CODE').asstring;
      edt_DeptName2.Text := frmPick_Item_Single.adsPick.Fieldbyname('DEPT_NAME').asstring;
    end;
  finally
    frmPick_Item_Single.Free;
  end;

end;

procedure TfrmEdit.btn_SelGoupClick(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(nil);
  try

    InputVar.Fields := 'location/设备责任小组/100';
    InputVar.Sqlstr := 'select * from data0840 where active=1';
    inputvar.KeyField := 'rkey';
    InputVar.AdoConn := DM.con1;
    frmPick_Item_Single.InitForm_New(InputVar);
    frmPick_Item_Single.Height := 600;
    frmPick_Item_Single.Width := 400;

    if frmPick_Item_Single.ShowModal = mrok then
    begin
      edt_group.Tag := frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
      edt_group.Text := frmPick_Item_Single.adsPick.Fieldbyname('Location').asstring;
    end;
  finally
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmEdit.btn_selWHClick(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(nil);
  try

    InputVar.Fields := 'WAREHOUSE_CODE/工厂代码/100,ABBR_NAME/简称/150,WAREHOUSE_NAME/工厂名称/100';
    InputVar.Sqlstr := 'select RKEY,WAREHOUSE_CODE,WAREHOUSE_NAME,ABBR_NAME from data0015 where active_flag=''Y'' ';
    inputvar.KeyField := 'rkey';
    InputVar.AdoConn := DM.con1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal = mrok then
    begin
      edt_WH.Tag := frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
      edt_WH.Text := frmPick_Item_Single.adsPick.Fieldbyname('ABBR_NAME').Value;
    end;
  finally
    frmPick_Item_Single.Free;
  end;

end;

procedure TfrmEdit.btn_SelAuditClick(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(nil);
  try

    InputVar.Fields := 'CODE/审核代码/100,PURCHASE_APPROV_DESC/审核名称/150';
    InputVar.Sqlstr := 'select data0094.RKEY,CODE,PURCHASE_APPROV_DESC  ' + ' from data0094  join data0034 on data0094.dept_ptr=data0034.rkey  join data0005 on data0005.EMPLOYEE_ID=data0034.rkey ' + ' where data0005.rkey=' + user_ptr + ' and dbo.Data0094.type=2 and (data0034.ACTIVE_FLAG=0) ';
    inputvar.KeyField := 'rkey';
    InputVar.AdoConn := DM.con1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal = mrok then
    begin
      edt_AuditCode.Tag := frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
      edt_AuditCode.Text := frmPick_Item_Single.adsPick.Fieldbyname('CODE').Value;
      edt_AuditName.text := frmPick_Item_Single.adsPick.Fieldbyname('PURCHASE_APPROV_DESC').Value;
    end;
  finally
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmEdit.Getdata(arkey: string);
var
  Lsql, Lsql268, Lsql468: string;
begin
  try

    Lsql268 := qry268.SQL.Text + ' and data0268.rkey=' + arkey;
   //ShowMessage(Lsql268);
    dm.OpenQry(qry268, Lsql268);

    Lsql268 := qry268_save.SQL.Text + ' and data0268.rkey=' + arkey;
    dm.OpenQry(qry268_save, Lsql268);

    Lsql468 := dm.FSql468 + ' and  FLOW_NO=' + arkey;
    dm.OpenQry(dm.qry468, Lsql468);
  // ShowMessage(Lsql468);

    if not qry468_save.Active then
      qry468_save.Open;

    remark.text := '';
    edt_Wremark.text := '';
    edt_repairRec.text := '';
    edt_FReason.text := '';

    if FEditType = 0 then //新增
    begin
      pnl7.Enabled := true;
      pnl8.Enabled := true;
      pnl9.Enabled := true;
      pnl12.Enabled := true;
      pnl13.Enabled := true;
      rg1.Enabled := True;

      btnBtnSave.Enabled := true;
      DM.GetNo(edt_RNo, '36', 0);
      RDate.date := common.getsystem_date(DM.qrytemp, 1);
      rg1.ItemIndex := 0;
      remark.text := '';
      edt_Wremark.text := '';
      edt_repairRec.text := '';
      edt_FReason.text := '';

      Lsql := 'select a.EMPLOYEE_NAME,b.DEPT_NAME  from data0005 a inner join data0034 b on a.EMPLOYEE_ID=b.rkey  where a.rkey=' + common.user_ptr;
      dm.OpenQry(DM.qrytemp, Lsql);
      edt_RMan.Text := dm.qrytemp.Fields[0].Value;
      edt_Dept.Text := dm.qrytemp.Fields[1].Value;

      Lsql := 'select data0094.RKEY,CODE,PURCHASE_APPROV_DESC  ' + ' from data0094  join data0034 on data0094.dept_ptr=data0034.rkey  join data0005 on data0005.EMPLOYEE_ID=data0034.rkey ' + ' where data0005.rkey=' + user_ptr + ' and dbo.Data0094.type=2 and (data0034.ACTIVE_FLAG=0) ';
      dm.OpenQry(DM.qrytemp, Lsql);
      if not dm.qrytemp.IsEmpty then
      begin
        if dm.qrytemp.RecordCount = 1 then
        begin
          edt_AuditCode.tag := dm.qrytemp.fieldbyname('RKEY').AsInteger;
          edt_AuditCode.text := dm.qrytemp.fieldbyname('CODE').AsString;
          edt_AuditName.text := dm.qrytemp.fieldbyname('PURCHASE_APPROV_DESC').AsString;
        end;
      end
    end
    else if FEditType in [1, 2] then //编辑
    begin
      edt_RNo.Text := qry268.fieldbyname('number').AsString;
      RDate.date := qry268.fieldbyname('date').AsDateTime;
      edt_RMan.text := qry268.fieldbyname('abbr_name').AsString;
      edt_Dept.text := qry268.fieldbyname('DEPT_NAME').AsString;
      edt_Dept.Tag := qry268.fieldbyname('DEPT_ptr').asinteger;
      edt_AuditCode.tag := qry268.fieldbyname('auth_ptr').asinteger;
      edt_AuditCode.Text := qry268.fieldbyname('code').AsString;
      edt_AuditName.text := qry268.fieldbyname('PURCHASE_APPROV_DESC').AsString;
      edt_AuditDate.text := qry268.fieldbyname('auth_date').AsString;
      edt_status.text := qry268.fieldbyname('status_c').AsString;
      edt_WH.tag := qry268.fieldbyname('warehouse_ptr').asinteger;
      edt_WH.text := qry268.fieldbyname('fac_name').AsString;
      remark.text := qry268.fieldbyname('reference').AsString;

      if qry268.fieldbyname('prted').AsBoolean = true then
        chk_prt.Checked := True
      else
        chk_prt.Checked := false;

      rg1Click(rg1);

      case qry268.fieldbyname('TType').asinteger of
        3:
          begin
            pgc1.ActivePageIndex := 1;
            rg1.ItemIndex := 1;
          end;
        4:
          begin
            pgc1.ActivePageIndex := 2;
            rg1.ItemIndex := 2;
          end;
        2:
          begin
            pgc1.ActivePageIndex := 0;
            rg1.ItemIndex := 0;
          end;
        5:
          begin
            rg1.ItemIndex := 3;
            pgc1.Visible := false;
          end;
      end;

      if qry268.fieldbyname('D831_ptr').asstring <> '' then
      begin
        Lsql := 'select dbo.data0831.rkey,PlanMainDate,DeviNumb,dbo.DATA0417.FASSET_NAME,MainCycl, ' + 'data0034.rkey as rkey34, Data0034.DEPT_CODE,Data0034.DEPT_NAME,DATA0417.EquiType,data0840.rkey as rkey840,data0840.Location' + ' from dbo.data0831' + ' join dbo.DATA0417 on dbo.data0831.DeviNumb=dbo.DATA0417.FASSET_CODE' + ' join  dbo.Data0034 on dbo.DATA0417.DEPT_PTR=dbo.Data0034.rkey' + ' join data0840 on DATA0417.d840_ptr=data0840.rkey' + ' where  data0831.RKEY=' + qry268.fieldbyname('D831_ptr').asstring;
        dm.OpenQry(dm.qrytemp, Lsql);
        if not dm.qrytemp.isempty then
        begin
          edt_MDate.tag := dm.qrytemp.fieldbyname('rkey').asinteger;
          edt_MDate.text := dm.qrytemp.fieldbyname('PlanMainDate').asstring;
          edt_E.text := dm.qrytemp.fieldbyname('DeviNumb').asstring;
          edt_En.text := dm.qrytemp.fieldbyname('FASSET_NAME').asstring;
          //840
          edt_DeptCode.tag := dm.qrytemp.fieldbyname('rkey34').asinteger;
          edt_DeptCode.text := dm.qrytemp.fieldbyname('DEPT_CODE').asstring;
          edt_DeptName2.texT := dm.qrytemp.fieldbyname('DEPT_NAME').asstring;
          edt_group.tag := dm.qrytemp.fieldbyname('rkey840').asinteger;
          edt_group.text := dm.qrytemp.fieldbyname('Location').asstring;
          pgc1.activepageindex := 1;
        end;
      end;

      if qry268.fieldbyname('D835_ptr').asstring <> '' then
      begin
        Lsql := 'select dbo.data0835.rkey,WorkOrder,dbo.Data0830.DeptName, dbo.Data0836.WorkName,WorkExpl, ' + ' data0840.rkey as rkey840,data0840.Location, ' + ' data0034.rkey as rkey34, Data0034.DEPT_CODE,Data0034.DEPT_NAME' + ' from   data0268 ' + ' inner join dbo.data0835 on data0268.D835_ptr=data0835.rkey' + ' join  dbo.Data0830 on dbo.data0835.DEPT_PTR=dbo.Data0830.rkey' + ' join dbo.Data0836 on dbo.data0835.Work_ptr=dbo.Data0836.rkey' + ' left join data0840 on data0268.D840_ptr=data0840.rkey' + ' join  dbo.Data0034 on dbo.data0268.DEPT_PTR=dbo.Data0034.rkey' + ' where  data0835.RKEY=' + qry268.fieldbyname('D835_ptr').asstring;
        dm.OpenQry(dm.qrytemp, Lsql);
        if not dm.qrytemp.isempty then
        begin
          edt_BNO.tag := dm.qrytemp.fieldbyname('rkey').asinteger;
          edt_BNO.text := dm.qrytemp.fieldbyname('WorkOrder').asstring;
          edt_DeptName.text := dm.qrytemp.fieldbyname('DeptName').asstring;
          edt_W.text := dm.qrytemp.fieldbyname('WorkName').asstring;
          edt_Wremark.text := dm.qrytemp.fieldbyname('WorkExpl').asstring;
          //840
          edt_DeptCode.tag := dm.qrytemp.fieldbyname('rkey34').asinteger;
          edt_DeptCode.text := dm.qrytemp.fieldbyname('DEPT_CODE').asstring;
          edt_DeptName2.texT := dm.qrytemp.fieldbyname('DEPT_NAME').asstring;
          edt_group.tag := dm.qrytemp.fieldbyname('rkey840').asinteger;
          edt_group.text := dm.qrytemp.fieldbyname('Location').asstring;
          pgc1.activepageindex := 2;
        end;
      end;

      if qry268.fieldbyname('D567_ptr').asstring <> '' then
      begin
        Lsql := 'select complete_date,dbo.data0567.rkey,dbo.data0567.NUMBER,dbo.DATA0417.FASSET_CODE, ' + ' dbo.DATA0417.FASSET_NAME,data0034.rkey as rkey34,dbo.Data0034.DEPT_NAME,failure_circs,maintain_text,' + ' Data0034.DEPT_CODE,DATA0417.EquiType,data0840.rkey as rkey840,data0840.Location' + ' from dbo.data0567' + ' join dbo.DATA0417 on dbo.data0567.Fasset_ptr=dbo.DATA0417.rkey' + ' join  dbo.Data0034 on dbo.DATA0417.DEPT_PTR=dbo.Data0034.rkey   ' + ' left join data0840 on data0567.d840_ptr=data0840.rkey' + ' where  data0567.RKEY=' + qry268.fieldbyname('D567_ptr').asstring;

         // showmessage(Lsql);
        dm.OpenQry(dm.qrytemp, Lsql);
        if not dm.qrytemp.isempty then
        begin
          edt_RPNo.tag := dm.qrytemp.fieldbyname('rkey').asinteger;
          edt_RPNo.text := dm.qrytemp.fieldbyname('number').asstring;
          edt_ECode.text := dm.qrytemp.fieldbyname('FASSET_CODE').asstring;
          edt_eName.text := dm.qrytemp.fieldbyname('FASSET_NAME').asstring;
          edt_FReason.text := dm.qrytemp.fieldbyname('failure_circs').asstring;
          edt_repairRec.text := dm.qrytemp.fieldbyname('maintain_text').asstring;
          //840
          edt_DeptCode.tag := dm.qrytemp.fieldbyname('rkey34').asinteger;
          edt_DeptCode.text := dm.qrytemp.fieldbyname('DEPT_CODE').asstring;
          edt_DeptName2.texT := dm.qrytemp.fieldbyname('DEPT_NAME').asstring;
          edt_group.tag := dm.qrytemp.fieldbyname('rkey840').asinteger;
          edt_group.text := dm.qrytemp.fieldbyname('Location').asstring;
          pgc1.activepageindex := 0;
        end;
      end;

      if qry268.fieldbyname('D840_ptr').asstring <> '' then
      begin

        Lsql := 'select data0840.rkey as rkey840,data0840.Location, ' + 'data0034.rkey as rkey34, Data0034.DEPT_CODE,Data0034.DEPT_NAME' + ' from   data0268 ' + ' left join data0840 on data0268.D840_ptr=data0840.rkey' + ' join  dbo.Data0034 on dbo.data0268.DEPT_PTR=dbo.Data0034.rkey' + ' where  data0840.RKEY=' + qry268.fieldbyname('D840_ptr').asstring;
        dm.OpenQry(dm.qrytemp, Lsql);
        if not dm.qrytemp.isempty then
        begin
          //840
          edt_DeptCode.tag := dm.qrytemp.fieldbyname('rkey34').asinteger;
          edt_DeptCode.text := dm.qrytemp.fieldbyname('DEPT_CODE').asstring;
          edt_DeptName2.texT := dm.qrytemp.fieldbyname('DEPT_NAME').asstring;
          edt_group.tag := dm.qrytemp.fieldbyname('rkey840').asinteger;
          edt_group.text := dm.qrytemp.fieldbyname('Location').asstring;
        end;
      end;

//       ShowMessage('--d567_ptr:'+qry268.fieldbyname('d567_ptr').AsString+
//       '--d831_ptr:'+qry268.fieldbyname('d831_ptr').AsString+'--d835_ptr:'+qry268.fieldbyname('d835_ptr').AsString+'--d840_ptr:'+qry268.fieldbyname('d840_ptr').AsString);

      Lsql := 'select * from data0840 where rkey=' + inttostr(qry268.fieldbyname('d840_ptr').AsInteger);
      dm.OpenQry(dm.qrytemp, Lsql);
      if not dm.qrytemp.IsEmpty then
      begin
        edt_group.tag := dm.qrytemp.fieldbyname('rkey').asinteger;
        edt_group.text := dm.qrytemp.fieldbyname('location').AsString;
      end;

      if FEditType = 1 then
      begin
        pnl7.Enabled := true;
        pnl8.Enabled := true;
        pnl9.Enabled := true;
        pnl12.Enabled := true;
        pnl13.Enabled := true;
        rg1.Enabled := true;
        btnBtnSave.Enabled := true;
      end
      else if FEditType = 2 then //查看
      begin
        pnl7.Enabled := false;
        pnl8.Enabled := false;
        pnl9.Enabled := false;
        pnl12.Enabled := false;
        pnl13.Enabled := false;
        rg1.Enabled := false;
      //pgc1.Enabled:=true;
        btnBtnSave.Enabled := false;
      end;
    end;

  except
    on e: Exception do
    begin
      ShowMessage('错误：' + Lsql);
      exit;
    end;
  end;
end;

procedure TfrmEdit.btnBtnSaveClick(Sender: TObject);
var
  i: integer;
  LField: Tfield;
  Lsql: string;
begin

  if dm.qry468.isempty then
  begin
    ShowMessage('请输入领料明细！');
    Exit;
  end;

  if trim(edt_AuditCode.text) = '' then
  begin
    ShowMessage('审批流程不能为空！');
    Exit;
  end;

  if trim(edt_WH.text) = '' then
  begin
    ShowMessage('工厂不能为空！');
    Exit;
  end;

  if trim(edt_DeptCode.text) = '' then
  begin
    ShowMessage('设备所在部门不能为空');
    Exit;
  end;

//   if rg1.itemindex=0  then   //edt_RPNo
//   begin
//    if trim(edt_RPNo.text)='' then
//    begin
//    ShowMessage('维修单号不能为空！');
//    //edt_RPNo.setfocus;
//    Exit;
//    end;
//   end;

//   if rg1.itemindex=1  then   //edt_MDate
//   begin
//    if trim(edt_MDate.text)='' then
//    begin
//    ShowMessage('保养日期不能为空！');
//    //edt_MDate.setfocus;
//    Exit;
//    end;
//   end;

//   if rg1.itemindex=2  then   //edt_BNO
//   begin
//    if trim(edt_BNO.text)='' then
//    begin
//    ShowMessage('空调事业部门工作单号不能为空！');
//    //edt_BNO.setfocus;
//    Exit;
//    end;
//   end;

     //edt_group
  if rg1.itemindex = 3 then   //edt_group
  begin
    if trim(edt_group.text) = '' then
    begin
      ShowMessage('设备责任小组不能为空！');
    //edt_group.setfocus;
      Exit;
    end;
  end;
  
    dm.con1.begintrans;
   try
    if FEditType = 0 then
    begin
      if checkNo = false then
        DM.GetNo(edt_RNo, '36', 0);
      qry268_save.append;
    end
    else
      qry268_save.edit;

    qry268_save.FieldByName('number').value := Trim(edt_RNo.text);
    qry268_save.FieldByName('dept_ptr').value := edt_DeptCode.tag;
    qry268_save.FieldByName('DATE').value := common.getsystem_date(DM.qrytemp, 0);
    qry268_save.FieldByName('EMPL_PTR').value := common.user_ptr;
    qry268_save.FieldByName('status').value := 0;
    qry268_save.FieldByName('reference').value := Trim(remark.Text);
    qry268_save.FieldByName('auth_ptr').value := edt_AuditCode.tag;
    qry268_save.FieldByName('warehouse_ptr').value := edt_WH.tag;
    qry268_save.FieldByName('prted').value := false;
    qry268_save.FieldByName('TTYPE').value := rgIndex;
    if (edt_group.tag <> 0) and (trim(edt_group.text) <> '') then
      qry268_save.FieldByName('D840_ptr').value := edt_group.tag
    else
    begin
     ShowMessage('请重新选择设备责任小组！');
     exit;
    end;

  //if outptr_edt<>nil then
  //qry268_save.FieldByName(outptr).value:=outptr_edt.tag;
    if (edt_RPNo.tag > 0) and (trim(edt_RPNo.text) <> '') then
      qry268_save.FieldByName('D567_ptr').value := edt_RPNo.tag;

    if (edt_MDate.tag > 0) and (trim(edt_MDate.text) <> '') then
      qry268_save.FieldByName('D831_ptr').value := edt_MDate.tag;

    if (edt_BNO.tag > 0) and (trim(edt_BNO.text) <> '') then
      qry268_save.FieldByName('D835_ptr').value := edt_BNO.tag;

    qry268_save.post;

//   if  checkNo=false  then
//    DM.GetNo(edt_RNo, '36', 0);
//  qry268_save.edit;
//  qry268_save.FieldByName('number').value:=Trim(edt_RNo.text);
//  qry268_save.post;

    qry268_save.updatebatch(arall);

    if (FEditType = 1) then
    begin
      LsqL := 'delete  from data0468 where flow_no=' + qry268.fieldbyname('rkey').asstring;
      dm.execsql(dm.qrytemp, Lsql);
    end;

    dm.qry468.first;
    while not dm.qry468.eof do
    begin
      dm.qry468.edit;
      dm.qry468.FieldByName('dept_ptr').value := qry268_save.fieldbyname('dept_ptr').asinteger;
      dm.qry468.FieldByName('flow_no').value := qry268_save.fieldbyname('rkey').asinteger;
      dm.qry468.fieldbyname('QUAN_ISSUED').value := 0;
      dm.qry468.fieldbyname('STATUS').value := 0;
      dm.qry468.fieldbyname('quan_alloc').value := 0;
      dm.qry468.fieldbyname('overproof').value := 0;
      dm.qry468.fieldbyname('offcut_qty').value := 0;
      dm.qry468.fieldbyname('offcut_status').value := false;

      dm.qry468.post;

      qry468_save.Append;
      for i := 1 to qry468_save.FieldCount - 1 do
      begin
        qry468_save.fieldvalues[qry468_save.fields[i].fieldname] := dm.qry468.fieldvalues[qry468_save.fields[i].fieldname];
      end;
      qry468_save.post;

      dm.qry468.next;
    end;
    qry468_save.updatebatch(arall);
    DM.GetNo(edt_RNo, '36', 1);
    dm.con1.CommitTrans;
    self.ModalResult := mrok;

  except
    on e: exception do
    begin
      dm.con1.rollbacktrans;
      ShowMessage('出错！请联系管理员！');
    end;
  end;

end;

procedure TfrmEdit.mni_delClick(Sender: TObject);
begin
  if dm.qry468.isempty then
    exit;
  if FEditType = 2 then
    exit;
  dm.qry468.delete;

end;

procedure TfrmEdit.mni_addClick(Sender: TObject);
var
  Lfrm: TfrmSelMaterial;
  Lstr: string;
begin
  if FEditType > 1 then
    Exit;
  Lfrm := TfrmSelMaterial.create(nil);
  try
    LFrm.getdata(GetRkeyList);
    LFrm.showmodal;
  finally
    Lfrm.free;
  end;
end;

function TfrmEdit.GetRkeyList: string;
var
  Lstr: string;
begin
  result := '(-1)';
  if not dm.qry468.isempty then
  begin
    dm.qry468.first;
    Lstr := '';
    while not dm.qry468.eof do
    begin
      if Lstr = '' then
        Lstr := dm.qry468.fieldbyname('INVENT_PTR').asstring
      else
        Lstr := Lstr + ',' + dm.qry468.fieldbyname('INVENT_PTR').asstring;
      dm.qry468.next;
    end;
    Lstr := '(' + LStr + ',-1)';
    result := Lstr;
  end;
end;

procedure TfrmEdit.edt_AuditCodeExit(Sender: TObject);
var
  Lsql: string;
begin
  if trim(edt_AuditCode.text) = '' then
    exit;
  Lsql := 'select data0094.RKEY,CODE,PURCHASE_APPROV_DESC  ' + ' from data0094  join data0034 on data0094.dept_ptr=data0034.rkey  join data0005 on data0005.EMPLOYEE_ID=data0034.rkey ' + ' where data0005.rkey=' + user_ptr + ' and dbo.Data0094.type=2 and (data0034.ACTIVE_FLAG=0) and code=''' + trim(edt_AuditCode.text) + ''' ';
  dm.OpenQry(dm.qrytemp, Lsql);
  if not dm.qrytemp.isempty then
  begin
    edt_AuditCode.Tag := dm.qrytemp.Fieldbyname('rkey').AsInteger;
    //edt_AuditCode.Text:=dm.qrytemp.Fieldbyname('CODE').Value;
    edt_AuditName.text := dm.qrytemp.Fieldbyname('PURCHASE_APPROV_DESC').Value;
  end
  else
  begin
    ShowMessage('审核代码不存在！');
    edt_AuditCode.setfocus;
    exit;
  end;

end;

procedure TfrmEdit.edt_WHExit(Sender: TObject);
var
  Lsql: string;
begin
  if trim(edT_wh.text) = '' then
    exit;
  Lsql := 'select RKEY,WAREHOUSE_CODE,WAREHOUSE_NAME,ABBR_NAME from data0015 where abbr_name=''' + trim(edT_wh.text) + ''' ';
  dm.OpenQry(dm.qrytemp, Lsql);
  if not dm.qrytemp.isempty then
  begin
    edt_WH.Tag := dm.qrytemp.Fieldbyname('rkey').AsInteger;
    //edt_WH.Text:=frmPick_Item_Single.adsPick.Fieldbyname('ABBR_NAME').Value;
  end
  else
  begin
    ShowMessage('工厂不存在！');
    edt_WH.setfocus;
    exit;
  end;
end;

procedure TfrmEdit.edt_RPNoExit(Sender: TObject);
var
  Lsql: string;
begin
  if trim(edt_RPNo.text) = '' then
    exit;
//    Lsql := ' select complete_date,dbo.data0567.rkey,dbo.data0567.NUMBER,dbo.DATA0417.FASSET_CODE, '+
//      ' dbo.DATA0417.FASSET_NAME,Data0034.rkey as rkey34,Data0034.dept_code,dbo.Data0034.DEPT_NAME,failure_circs,maintain_text,'+
//      ' case data0567.status when 0 then ''未提交'' when 1 then ''待受理'' when 2 then ''已受理'''+
//      '      when 3 then ''已完工'' when 4 then ''已验收'' when 5 then ''被退回'' when 6 then ''已暂停'''+
//      '      when 8 then ''验收退回''  end as V_stat, Data0034.DEPT_CODE,DATA0417.EquiType,data0840.Location'+
//      ' from dbo.data0567'+
//      ' join dbo.DATA0417 on dbo.data0567.Fasset_ptr=dbo.DATA0417.rkey'+
//      ' join  dbo.Data0034 on dbo.DATA0417.DEPT_PTR=dbo.Data0034.rkey'+
//      ' left join data0840 on data0567.d840_ptr=data0840.rkey'+
//      ' where (STATUS in (1,2,6))or('+
//      ' (STATUS in (3,4))'+
//      ' and(complete_date>=cast(cast(year  (getdate())as char(4))+''-''+cast(month(getdate())as char(2))+''-1''as datetime)))' +
//      ' and data0567.NUMBER='''+trim(edt_RPNo.text)+''' ';

  Lsql := 'select complete_date,dbo.data0567.rkey,dbo.data0567.NUMBER,dbo.DATA0417.FASSET_CODE, ' + ' dbo.DATA0417.FASSET_NAME,data0034.rkey as rkey34,dbo.Data0034.DEPT_NAME,failure_circs,maintain_text,' + ' Data0034.DEPT_CODE,DATA0417.EquiType,data0840.rkey as rkey840,data0840.Location,data0567.WHOUSE_PTR,data0015.ABBR_NAME' + ' from dbo.data0567' + ' join dbo.DATA0417 on dbo.data0567.Fasset_ptr=dbo.DATA0417.rkey' + ' join  dbo.Data0034 on dbo.DATA0417.DEPT_PTR=dbo.Data0034.rkey   ' + ' inner join data0015 on data0567.WHOUSE_PTR=data0015.rkey' + ' left join data0840 on data0567.d840_ptr=data0840.rkey' + ' where  STATUS in (1,2,3,4,6) and data0567.NUMBER=''' + trim(edt_RPNo.text) + ''' ';
  dm.OpenQry(dm.qrytemp, Lsql);
  if not dm.qrytemp.isempty then
  begin
    edt_RPNo.Tag := dm.qrytemp.Fieldbyname('rkey').AsInteger;
    //edt_RPNo.Text:=frmPick_Item_Single.adsPick.Fieldbyname('NUMBER').asstring;
    edt_ecode.Text := dm.qrytemp.Fieldbyname('FASSET_CODE').asstring;
    edt_eName.text := dm.qrytemp.Fieldbyname('FASSET_NAME').asstring;
    edt_FReason.Text := dm.qrytemp.Fieldbyname('failure_circs').asstring;
    edt_repairRec.Text := dm.qrytemp.Fieldbyname('maintain_text').asstring;

    edt_DeptCode.tag := dm.qrytemp.Fieldbyname('rkey34').AsInteger;
    edt_DeptCode.text := dm.qrytemp.Fieldbyname('dept_code').asstring;
    edt_DeptName2.text := dm.qrytemp.Fieldbyname('dept_name').asstring;

        //工厂：
    edt_WH.Tag := dm.qrytemp.Fieldbyname('WHOUSE_PTR').asinteger;
    edt_WH.text := dm.qrytemp.Fieldbyname('ABBR_NAME').asstring;

  end
  else
  begin
    ShowMessage('维修单号不存在！');
    edt_RPNo.setfocus;
    exit;
  end;

end;

procedure TfrmEdit.edt_EExit(Sender: TObject);
var
  Lsql: string;
begin
  if trim(edt_E.text) = '' then
    exit;
  Lsql := 'select dbo.data0831.rkey,PlanMainDate,DeviNumb,dbo.DATA0417.FASSET_NAME,MainCycl,' + ' Data0034.DEPT_CODE,Data0034.DEPT_NAME,DATA0417.EquiType,data0840.Location' + ' from dbo.data0831' + ' join dbo.DATA0417 on dbo.data0831.DeviNumb=dbo.DATA0417.FASSET_CODE' + ' join  dbo.Data0034 on dbo.DATA0417.DEPT_PTR=dbo.Data0034.rkey' + ' join data0840 on DATA0417.d840_ptr=data0840.rkey' + ' where RKEY832<>2 and DeviNumb=''' + trim(edt_E.text) + '''';
  dm.OpenQry(dm.qrytemp, Lsql);
  if not dm.qrytemp.isempty then
  begin
    edt_e.Tag := dm.qrytemp.Fieldbyname('rkey').AsInteger;
    //edt_e.Text:=frmPick_Item_Single.adsPick.Fieldbyname('DeviNumb').asstring;
    edt_eN.Text := dm.qrytemp.Fieldbyname('FASSET_NAME').asstring;

    edt_MDate.Tag := dm.qrytemp.Fieldbyname('rkey').AsInteger;
    edt_MDate.Text := dm.qrytemp.Fieldbyname('PlanMainDate').asstring;
  end
  else
  begin
    ShowMessage('设备代码不存在！');
    edt_E.setfocus;
    exit;
  end;
end;

procedure TfrmEdit.edt_BNOExit(Sender: TObject);
var
  Lsql: string;
begin
  if trim(edt_BNO.text) = '' then
    exit;
  Lsql := ' select dbo.data0835.rkey,WorkOrder,dbo.Data0830.DeptName, dbo.Data0836.WorkName,WorkExpl ' + ' from dbo.data0835' + ' join  dbo.Data0830 on dbo.data0835.DEPT_PTR=dbo.Data0830.rkey' + ' join dbo.Data0836 on dbo.data0835.Work_ptr=dbo.Data0836.rkey' + ' where Status <>2  and WorkOrder=''' + trim(edt_BNO.text) + ''' ';
  dm.OpenQry(dm.qrytemp, Lsql);
  if not dm.qrytemp.isempty then
  begin
    edt_BNO.Tag := dm.qrytemp.Fieldbyname('rkey').AsInteger;
    //edt_BNO.Text:=frmPick_Item_Single.adsPick.Fieldbyname('WorkOrder').asstring;
    edt_DeptName.Text := dm.qrytemp.Fieldbyname('DeptName').asstring;
    edt_W.Text := dm.qrytemp.Fieldbyname('WorkName').asstring;
    edt_Wremark.Text := dm.qrytemp.Fieldbyname('WorkExpl').asstring;
  end
  else
  begin
    ShowMessage('工作单号不存在！');
    edt_BNO.setfocus;
    exit;
  end;
end;

procedure TfrmEdit.edt_DeptCodeExit(Sender: TObject);
var
  Lsql: string;
begin
  if trim(edt_DeptCode.text) = '' then
    exit;
  Lsql := 'select RKEY,DEPT_CODE,DEPT_NAME from data0034 ' + ' where (ttype in (4,1) or is_cost_dept=1)and (ACTIVE_FLAG=0)' + ' and RKEY in (select DEPT_PTR from data0417 ) and DEPT_CODE=''' + trim(edt_DeptCode.text) + '''';
  dm.OpenQry(dm.qrytemp, Lsql);
  if not dm.qrytemp.isempty then
  begin
    edt_DeptCode.Tag := dm.qrytemp.Fieldbyname('rkey').AsInteger;
    //edt_DeptCode.Text:=frmPick_Item_Single.adsPick.Fieldbyname('DEPT_CODE').asstring;
    edt_DeptName2.Text := dm.qrytemp.Fieldbyname('DEPT_NAME').asstring;
  end
  else
  begin
    ShowMessage('部门代码不存在！');
    edt_DeptCode.setfocus;
    exit;
  end;
end;

procedure TfrmEdit.edt_groupExit(Sender: TObject);
var
  Lsql: string;
begin
  if trim(edt_group.text) = '' then
    exit;
  LSql := 'select * from data0840 where active=1 and location=''' + trim(edt_group.text) + ''' ';
  dm.OpenQry(dm.qrytemp, Lsql);
  if not dm.qrytemp.isempty then
  begin
    edt_group.Tag := dm.qrytemp.Fieldbyname('rkey').AsInteger;
    //edt_group.Text:=frmPick_Item_Single.adsPick.Fieldbyname('Location').asstring;
  end
  else
  begin
    ShowMessage('责任小组不存在！');
    edt_group.setfocus;
    exit;
  end;
end;

function TfrmEdit.checkNo: boolean;
var
  Lsql: string;
begin
  result := true;
  Lsql := 'select rkey from data0268  where number=''' + Trim(edt_RNo.text) + ''' ';
  dm.OpenQry(dm.qrytemp, Lsql);
  if not dm.qrytemp.IsEmpty then
    result := false;
end;

end.


