unit AddMaintenance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls;

type
  Tfrm_AddMaintenance = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    EdtCONTACT_PHONE: TEdit;
    EdtCONTACT_NAME: TEdit;
    EdtPLACE: TEdit;
    DateTimePicker1: TDateTimePicker;
    Edit1: TEdit;
    Label9: TLabel;
    EdtWarehouse: TEdit;
    Label10: TLabel;
    EdtDept: TEdit;
    Label11: TLabel;
    EdtAsset: TEdit;
    Edtequiment_grade: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    Cbbfailure_grade: TComboBox;
    Label14: TLabel;
    Cbbfailure_degree: TComboBox;
    Label15: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label16: TLabel;
    Label17: TLabel;
    CbbFaultName: TComboBox;
    Memo1: TMemo;
    BitSave: TBitBtn;
    BitCancel: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure CbbFaultNameEnter(Sender: TObject);
    procedure BitSaveClick(Sender: TObject);
    procedure EdtDeptEnter(Sender: TObject);
    procedure EdtDeptExit(Sender: TObject);
    procedure EdtWarehouseExit(Sender: TObject);
    procedure EdtAssetExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
   FDept,D840_ptr:string;
   CommitDay:TDateTime;
   function invo_number_error(number: string): boolean;
    { Private declarations }
  public
    v_status,rkey567:Integer;
    { Public declarations }
  end;

var
  frm_AddMaintenance: Tfrm_AddMaintenance;

implementation

uses damo,common,MyClass,Pick_Item_Single,ConstVar,Math;

{$R *.dfm}



procedure Tfrm_AddMaintenance.FormShow(Sender: TObject);
begin

  if v_status=0 then
  begin
    DM.tmp.Close;
    DM.tmp.SQL.Text:='select  CONTROL_NO_LENGTH, SEED_VALUE, SEED_FLAG '+
                     'from Data0004 where rkey=59';
    DM.tmp.Open;

    if DM.tmp.FieldByName('SEED_FLAG').AsInteger <>1 then
      Edit1.Text := DM.tmp.FieldByName('SEED_VALUE').AsString;
    if DM.tmp.FieldByName('SEED_FLAG').AsInteger =4 then
     Edit1.ReadOnly := True;

    self.Caption:='设备维修申请-新增';
    DM.tmp.Close;
    DM.tmp.SQL.Text:='select data0005.employee_id,data0034.dept_code,data0034.Dept_name '+
    'from data0005 inner join data0034 on data0005.employee_id=data0034.rkey where data0005.rkey='+user_ptr;
    DM.tmp.Open;

    EdtDept.Text:=DM.tmp.Fields[1].AsString;
    label16.Caption:=DM.tmp.Fields[2].AsString;
    EdtDept.Tag:=DM.tmp.Fields[0].AsInteger;
    DateTimePicker1.Date := common.getsystem_date(dm.tmp,0);
    Self.CommitDay := common.getsystem_date(dm.tmp,0);

  end
  else
  begin
    self.Caption:='设备维修申请-修改';
    DM.tmp.Close;
    DM.tmp.SQL.Text:='select  CONTROL_NO_LENGTH, SEED_VALUE, SEED_FLAG '+
                     'from Data0004 where rkey=59';
    DM.tmp.Open;
    if DM.tmp.FieldByName('SEED_FLAG').AsInteger =4 then
     Edit1.ReadOnly := True;

    Edit1.Text:=DM.ADS567.Fieldbyname('number').AsString;
    EdtDept.Tag:=DM.ADS567.FieldByName('dept_ptr').AsInteger;
    EdtDept.Text:=DM.ADS567.FieldByName('dept_code').AsString;
    Label16.Caption:=DM.ADS567.FieldByName('dept_name').AsString;
    D840_ptr := DM.ADS567.fieldbyname('D840_ptr').AsString;
    EdtAsset.Tag:=DM.ADS567.FieldByName('FAsset_ptr').AsInteger;
    EdtAsset.Text:=DM.ADS567.FieldByName('Fasset_code').AsString;
    Label17.Caption:=DM.ADS567.FieldByName('Fasset_name').AsString;

    EdtWarehouse.Tag:=DM.ADS567.FieldByName('whouse_ptr').AsInteger;
    EdtWarehouse.Text:=DM.ADS567.FieldByName('warehouse_code').AsString;
    Label15.Caption:=DM.ADS567.FieldByName('abbr_name').AsString;
    Edtequiment_grade.Text:=DM.ADS567.Fieldbyname('equipment_grade').AsString;
    EdtPLACE.Text := DM.ADS567PLACE.Value;
    DateTimePicker1.Date := DM.ADS567failure_dat.Value;
    Self.CommitDay :=DM.ADS567ent_date.Value;
    EdtCONTACT_NAME.Text := DM.ADS567CONTACT_NAME.Value;
    EdtCONTACT_PHONE.Text := DM.ADS567CONTACT_PHONE.Value;

    DM.tmp.Close;
    DM.tmp.SQL.Text:= 'select data0846.rkey,data0846.FaultName,data0567.rkey from data0846 inner join data0845 on data0845.rkey=data0846.D845_ptr'+
      ' inner join DATA0417 on data0845.rkey=DATA0417.D845_ptr inner join data0567 on data0846.rkey=data0567.D846_ptr where'+
      ' data0567.rkey='+dm.ADS567RKEY.AsString +'  and  data0417.FASSET_CODE = '+QuotedStr(Trim(EdtAsset.Text));
    DM.tmp.Open;
    
    DM.tmp.First;
    CbbFaultName.Items.Clear;
    while not DM.tmp.Eof do
    begin
      CbbFaultName.Items.AddObject(DM.tmp.FieldValues['FaultName'],Pointer(DM.tmp.FieldByName('rkey').AsInteger));
      DM.tmp.Next;
    end;
    CbbFaultName.ItemIndex := CbbFaultName.Items.IndexOf(DM.tmp.FieldByName('FaultName').AsString);
    
    Cbbfailure_grade.ItemIndex := Cbbfailure_grade.Items.IndexOf(DM.ADS567failure_grade.Value);
    Cbbfailure_degree.ItemIndex := Cbbfailure_degree.Items.IndexOf(DM.ADS567failure_degree.Value);
    Memo1.Lines.Text := DM.ADS567failure_circs.Value;
    
    if  (trim(DM.ADS567.FieldValues['FASSET_TYPE'])='基础杂务')or
        (trim(DM.ADS567.FieldValues['FASSET_TYPE'])='工程')or
        (trim(DM.ADS567.FieldValues['FASSET_TYPE'])='预防维护')then
      begin
        Cbbfailure_degree.Tag:=1;
        Cbbfailure_degree.ItemIndex:=-1;
        Cbbfailure_degree.Enabled:=False;
        Cbbfailure_degree.Color:=clInactiveCaption;
      end
    else
      begin
        Cbbfailure_degree.Tag:=0;        //如果=0，保存时不能为空
        Cbbfailure_degree.Enabled:=True;
        Cbbfailure_degree.Color:=clWindow;
      end;
  end;
end;

procedure Tfrm_AddMaintenance.BitBtn1Click(Sender: TObject);
var
  InputVar:PDlgInput;
begin
  frmPick_Item_Single:=Tfrmpick_item_single.Create(application);
  InputVar.Fields := 'warehouse_code/工厂代码/80,warehouse_name/工厂名称/200,abbr_name/工厂简称/100';
  InputVar.Sqlstr :='select rkey,warehouse_code,warehouse_name,abbr_name from data0015';
  InputVar.AdoConn := DM.ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    EdtWarehouse.Text:=frmPick_Item_Single.adsPick.FieldValues['warehouse_code'];
    Label15.Caption:=frmPick_Item_Single.adsPick.FieldValues['abbr_name'];
    EdtWarehouse.Tag:=frmPick_Item_Single.adsPick.FieldValues['rkey'];

    //清空 申请部门、维修设备 的内容
    EdtDept.Text:='';
    label16.Caption:='';
    EdtDept.tag:=0;
    EdtAsset.Text:='';
    label17.Caption:='' ;
    EdtAsset.tag:=0;
  end;

end;

procedure Tfrm_AddMaintenance.BitBtn2Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    case Tcomponent(Sender).Tag of
      0:
      begin
        InputVar.Fields:= 'Dept_code/部门编号/100,dept_name/部门名称/150,xz/性质/100';
        InputVar.Sqlstr:='SELECT DISTINCT Data0034.RKEY as rkey, Data0034.DEPT_CODE as DEPT_CODE, '
          + 'Data0034.DEPT_NAME, CASE WHEN ttype = 4 THEN ''部门'' WHEN ttype = 5 THEN ''班组'' '
          + 'ELSE ''工序'' END xz FROM dbo.Data0034 '
          + 'INNER JOIN dbo.DATA0417 ON dbo.Data0034.RKEY = dbo.DATA0417.DEPT_PTR '
          + 'WHERE (data0034.TTYPE IN (1, 4, 5)) OR (data0034.IS_COST_DEPT = 1)';
        inputvar.KeyField:='Dept_code';
      end;
      1:
      begin
        InputVar.Fields :='FASSET_CODE/设备代码/100,FASSET_NAME/设备名称/100,equipment_grade/设备级别/60,FASSET_DESC/设备规格/150,LOCATION/位  置/60,BOOK_DATE/入帐日期/100,dept_code/部门/40,abbr_name/工厂/60' ;
        if Trim(EdtWarehouse.Text)<>'' then
        begin
          if EdtDept.Text='' then
            InputVar.Sqlstr :='SELECT Data0514.FASSET_TYPE,Data0417.D840_ptr,Data0417.RKEY,Data0417.FASSET_CODE,isnull(Data0417.equipment_grade,'''') as equipment_grade,Data0417.FASSET_NAME,Data0417.FASSET_DESC,Data0417.LOCATION,'+
                              'Data0417.BOOK_DATE,Data0417.USER_DATE,data0034.dept_code,data0034.dept_name,data0034.rkey rkey34,'+
                              'Data0015.warehouse_code,Data0015.abbr_name,Data0015.rkey rkey15,isnull(Data0417.equipment_grade,'''') as equipment_grade '+
                              'FROM Data0417 INNER JOIN data0034 on Data0417.dept_ptr=data0034.rkey INNER JOIN '+
                              'Data0015 on Data0417.warehouse_ptr=Data0015.rkey LEFT OUTER JOIN Data0514 ON DATA0417.FASSET_TYPE_PTR = Data0514.RKEY '+
                              'where Data0417.active_flag in (2,3,4) and Data0417.warehouse_ptr='+inttostr(EdtWarehouse.tag)+' order by FASSET_CODE'
          else                                    //去掉1，即新进状态的设备不允许开单   1,
            InputVar.Sqlstr :='SELECT Data0514.FASSET_TYPE,Data0417.D840_ptr,Data0417.RKEY,Data0417.FASSET_CODE,isnull(Data0417.equipment_grade,'''') as equipment_grade,Data0417.FASSET_NAME,Data0417.FASSET_DESC,Data0417.LOCATION,'+
                              'Data0417.BOOK_DATE,Data0417.USER_DATE,data0034.dept_code,data0034.dept_name,data0034.rkey rkey34,'+
                              'Data0015.warehouse_code,Data0015.abbr_name,Data0015.rkey rkey15,isnull(Data0417.equipment_grade,'''') as equipment_grade '+
                              'FROM Data0417 INNER JOIN Data0034 on Data0417.dept_ptr=data0034.rkey INNER JOIN '+
                              'Data0015 on Data0417.warehouse_ptr=Data0015.rkey '+
                              'LEFT OUTER JOIN Data0514 ON DATA0417.FASSET_TYPE_PTR = Data0514.RKEY '+
                              'where Data0417.active_flag in (2,3,4) and Data0417.dept_ptr='+inttostr(EdtDept.Tag)+
                              ' and Data0417.warehouse_ptr='+inttostr(EdtWarehouse.tag)+' order by FASSET_CODE';    //去掉1，即新进状态的设备不允许开单   1,
        end
        else
        begin
          if EdtDept.Text='' then
            InputVar.Sqlstr :='SELECT Data0514.FASSET_TYPE,Data0417.D840_ptr,Data0417.RKEY,Data0417.FASSET_CODE,isnull(Data0417.equipment_grade,'''') as equipment_grade,Data0417.FASSET_NAME,Data0417.FASSET_DESC,Data0417.LOCATION,'+
                            'Data0417.BOOK_DATE,Data0417.USER_DATE,data0034.dept_code,data0034.dept_name,data0034.rkey rkey34,'+
                            'Data0015.warehouse_code,Data0015.abbr_name,Data0015.rkey rkey15,isnull(Data0417.equipment_grade,'''') as equipment_grade '+
                            'FROM Data0417 INNER JOIN '+
                            'data0034 on Data0417.dept_ptr=data0034.rkey INNER JOIN '+
                            'Data0015 on Data0417.warehouse_ptr=Data0015.rkey '+
                            'LEFT OUTER JOIN Data0514 ON DATA0417.FASSET_TYPE_PTR = Data0514.RKEY '+
                            'where Data0417.active_flag in (2,3,4) order by FASSET_CODE'
          else                                  //去掉1，即新进状态的设备不允许开单   1,
            InputVar.Sqlstr :='SELECT Data0514.FASSET_TYPE,Data0417.D840_ptr,Data0417.RKEY,Data0417.FASSET_CODE,isnull(Data0417.equipment_grade,'''') as equipment_grade,Data0417.FASSET_NAME,Data0417.FASSET_DESC,Data0417.LOCATION,'+
                              'Data0417.BOOK_DATE,Data0417.USER_DATE,data0034.dept_code,data0034.dept_name,data0034.rkey rkey34,'+
                              'Data0015.warehouse_code,Data0015.abbr_name,Data0015.rkey rkey15,isnull(Data0417.equipment_grade,'''') as equipment_grade '+
                              'FROM Data0417 INNER JOIN '+
                              'Data0034 on Data0417.dept_ptr=data0034.rkey INNER JOIN '+
                              'Data0015 on Data0417.warehouse_ptr=Data0015.rkey '+
                              'LEFT OUTER JOIN Data0514 ON DATA0417.FASSET_TYPE_PTR = Data0514.RKEY '+
                              'where Data0417.active_flag in (2,3,4) and Data0417.dept_ptr='+inttostr(EdtDept.Tag)+
                              ' order by FASSET_CODE';
        end;                                //去掉1，即新进状态的设备不允许开单   1,
        inputvar.KeyField:='FASSET_CODE';
      end;
    end;
    InputVar.AdoConn := DM.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      case Tcomponent(Sender).Tag of
        0:
        begin
          EdtDept.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['Dept_code']);
          label16.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['Dept_name']);
          EdtDept.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
          EdtAsset.Text:='';
          label17.Caption:='' ;
          EdtAsset.tag:=0;
          EdtPLACE.Text:='';
        end;
        1:
        begin
          if EdtDept.Text='' then
          begin
            EdtDept.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['Dept_code']);
            label16.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['Dept_name']);
            EdtDept.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey34').AsInteger;
          end;
          if Trim(EdtWarehouse.Text)='' then
          begin
            EdtWarehouse.Text:=Trim(frmPick_Item_Single.adsPick.FieldValues['warehouse_code']);
            Label15.Caption:=Trim(frmPick_Item_Single.adsPick.FieldValues['abbr_name']);
            EdtWarehouse.Tag:=StrToInt(Trim(frmPick_Item_Single.adsPick.FieldValues['rkey15']));
          end;
          EdtAsset.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['FASSET_CODE']);
          label17.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['FASSET_NAME']);
          EdtAsset.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
          Edtequiment_grade.Text:=Trim(frmPick_Item_Single.adsPick.FieldValues['equipment_grade']);
//          DM.ADO567_1.Edit;
//          DM.ADO567_1.FieldByName('place').AsString:=frmPick_Item_Single.adsPick.Fieldbyname('LOCATION').AsString;
          D840_ptr:=frmPick_Item_Single.adsPick.Fieldbyname('D840_ptr').AsString;
          EdtPLACE.Text := frmPick_Item_Single.adsPick.Fieldbyname('LOCATION').AsString;

          if  (trim(frmPick_Item_Single.adsPick.FieldValues['FASSET_TYPE'])='基础杂务')or
              (trim(frmPick_Item_Single.adsPick.FieldValues['FASSET_TYPE'])='工程')or
              (trim(frmPick_Item_Single.adsPick.FieldValues['FASSET_TYPE'])='预防维护')then
            begin
              Cbbfailure_degree.Tag:=1;
              Cbbfailure_degree.ItemIndex:=-1;
              Cbbfailure_degree.Enabled:=False;
              Cbbfailure_degree.Color:=clInactiveCaption;
            end
          else
            begin
              Cbbfailure_degree.Tag:=0;        //如果=0，保存时不能为空
              Cbbfailure_degree.Enabled:=True;
              Cbbfailure_degree.Color:=clWindow;
            end;
        end;
      end;
    end ;
  finally
   frmPick_Item_Single.Free ;
  end;
end;

procedure Tfrm_AddMaintenance.CbbFaultNameEnter(Sender: TObject);
begin

  if Trim(EdtAsset.Text)='' then  Exit;

  with DM.tmp do
  begin
    Close;
    SQL.Text := 'select data0846.rkey,data0846.FaultName from data0846 inner join data0845 on data0845.rkey=data0846.D845_ptr'+
    ' inner join DATA0417 on data0845.rkey=DATA0417.D845_ptr where data0417.FASSET_CODE = '+QuotedStr(Trim(EdtAsset.Text));
    Open;
  end;
  DM.tmp.First;
  CbbFaultName.Items.Clear;
  while not DM.tmp.Eof do
  begin
    CbbFaultName.Items.AddObject(DM.tmp.FieldValues['FaultName'],Pointer(DM.tmp.FieldByName('rkey').AsInteger));
    DM.tmp.Next;
  end;
end;

function Tfrm_AddMaintenance.invo_number_error(number: string): boolean;
begin
  result:=false;
  with dm.tmp do
  begin
    close;
    SQL.Text:='select rkey, number from Data0567 where number='+QuotedStr(number);
    open;
    if not IsEmpty then
    result:=true;
  end;
end;

procedure Tfrm_AddMaintenance.BitSaveClick(Sender: TObject);
var
  SEED_VALUE:string;
  SEED_FLAG:Integer;
begin
  if Edit1.Text='' then
  begin
    showmessage('申请单号不能为空...');
    exit;
  end;
  if EdtWarehouse.Text='' then
  begin
    showmessage('工厂不能为空...');
    exit;
  end;
  if EdtDept.Text='' then
  begin
    showmessage('申请部门不能为空...');
    exit;
  end;
  if EdtAsset.Text='' then
  begin
    showmessage('维修设备不能为空...');
    exit;
  end;
  if Cbbfailure_grade.Text='' then
  begin
    showmessage('故障级别不能为空...');
    exit;
  end;
  if Cbbfailure_degree.Tag=0 then
  if Cbbfailure_degree.Text='' then
  begin
    showmessage('影响程度不能为空...');
    exit;
  end;
  if Trim(EdtPLACE.Text)='' then
  begin
    ShowMessage('使用地点不能为空...');
    Exit;
  end;
  if EdtCONTACT_NAME.Text='' then
  begin
    showmessage('联络人不能为空...');
    exit;
  end;
  if EdtCONTACT_PHONE.Text='' then
  begin
   showmessage('联络电话不能为空...');
   exit;
  end;
  if Trim(Memo1.Text)='' then
  begin
    ShowMessage('故障情况说明不能为空...');
    Exit;
  end;

//  with DM.tmp do
//  begin
//    Close;
//    SQL.Text:= 'select data0567.* from data0567 join data0417 on data0567.FASSET_PTR=data0417.rkey '
//      +'where data0417. DEPT_PTR not in '
//      +'(select rkey from data0034 where data0034.DEPT_NAME Like ''%设备部%'' or data0034.DEPT_NAME Like ''%公共设施组%'' )'
//      +' and data0417.rkey='+intTostr(EdtAsset.Tag)
//      +' and data0567.[STATUS] in (1,2) and data0567.ent_date>dateadd(day,-180,getdate())';
//    Open;
//    if IsEmpty=False then
//    begin
//      ShowMessage('该设备的前一次维修单号：“'+FieldByName('NUMBER').AsString+'”还没完成，'+#13+'现不允许新增！！！')  ;
//      Exit;
//    end;
//  end;

    if v_status=0 then
    begin
      DM.tmp.Close;
      DM.tmp.SQL.Text:='select  CONTROL_NO_LENGTH, SEED_VALUE, SEED_FLAG '+
                       'from Data0004 where rkey=59';
      DM.tmp.Open;
      SEED_VALUE:=DM.tmp.FieldByName('SEED_VALUE').AsString;
      SEED_FLAG:= DM.tmp.FieldByName('SEED_FLAG').AsInteger;
      if self.invo_number_error(trim(edit1.Text)) then
      begin
        if SEED_FLAG <>1 then
        begin
          Edit1.Text:=SEED_VALUE;
          messagedlg('申请单号重复可能多人同时新增,系统已自动更新编号!',mterror,[mbcancel],0);
        end
        else
        begin
          messagedlg('申请单号重复!请手工重新输入',mterror,[mbok],0);
          Edit1.SetFocus;
          exit;
        end;
      end;
    end;
    
  try
    DM.ADOConnection1.BeginTrans;
    if v_status=0 then
    begin
     if (SEED_FLAG <>1) then        //新增保存之后处理04初始值加1
      common.Update_Seed(59);

      with DM.tmp do
      begin
        Close;
        SQL.Text := 'SELECT rkey,NUMBER,STATUS,DEPT_PTR,FASSET_PTR,PLACE,equipment_grade,failure_grade,'+
                    'failure_degree,failure_date,EMPL_PTR,ent_date,referring_date,CONTACT_NAME,CONTACT_PHONE,'+
                    'failure_circs,disposal_emplptr,disposal_date,maintain_empl,maintain_text,complete_date,'+
                    'validate_emplptr,validate_date,validate_appraise,fail_type,WHOUSE_PTR,suspended_reason,'+
                    'stoppage_time,recovery_time,completion_emplptr,stop_house,maintain_house,validate_Description,'+
                    'D846_ptr,Staff_Sum_house,D840_ptr,D073_ptr FROM DATA0567 where rkey=null';

        Open;
      end;
      DM.tmp.Append
    end
    else
    if v_status=1 then
    begin
      with DM.tmp do
      begin
        Close;
        SQL.Text := 'SELECT rkey,NUMBER,STATUS,DEPT_PTR,FASSET_PTR,PLACE,equipment_grade,failure_grade,'+
                    'failure_degree,failure_date,EMPL_PTR,ent_date,referring_date,CONTACT_NAME,CONTACT_PHONE,'+
                    'failure_circs,disposal_emplptr,disposal_date,maintain_empl,maintain_text,complete_date,'+
                    'validate_emplptr,validate_date,validate_appraise,fail_type,WHOUSE_PTR,suspended_reason,'+
                    'stoppage_time,recovery_time,completion_emplptr,stop_house,maintain_house,validate_Description,'+
                    'D846_ptr,Staff_Sum_house,D840_ptr,D073_ptr FROM DATA0567 where rkey='+dm.ADS567RKEY.AsString;
        Open;
      end;
      DM.tmp.Edit;
    end;

    DM.tmp.FieldByName('NUMBER').AsString:=Edit1.Text;
    DM.tmp.FieldByName('EMPL_PTR').AsString:=common.user_ptr;
    DM.tmp.FieldByName('dept_ptr').AsInteger:=EdtDept.Tag;
    DM.tmp.FieldByName('FAsset_ptr').AsInteger:=EdtAsset.Tag;
    DM.tmp.FieldByName('status').AsInteger:=0;
    DM.tmp.FieldByName('whouse_ptr').AsInteger:=EdtWarehouse.Tag;
    DM.tmp.FieldByName('equipment_grade').AsString:=Edtequiment_grade.Text;
    DM.tmp.FieldByName('D073_ptr').Value:=common.rkey73;
    DM.tmp.FieldByName('D840_ptr').AsString := D840_ptr;
    DM.tmp.FieldByName('ent_date').AsDateTime:=Self.CommitDay;
    DM.tmp.FieldByName('failure_date').AsDateTime:=DateTimePicker1.Date;
    DM.tmp.FieldByName('PLACE').AsString := EdtPLACE.Text;
    DM.tmp.FieldByName('CONTACT_NAME').AsString := EdtCONTACT_NAME.Text;
    DM.tmp.FieldByName('CONTACT_PHONE').AsString := EdtCONTACT_PHONE.Text;
    if CbbFaultName.ItemIndex=-1 then
     DM.tmp.FieldByName('D846_ptr').Value :=null
    else
     DM.tmp.FieldByName('D846_ptr').AsInteger := Integer(CbbFaultName.Items.Objects[CbbFaultName.ItemIndex]);
    DM.tmp.FieldByName('failure_grade').AsString := Cbbfailure_grade.Text;
    DM.tmp.FieldByName('failure_degree').AsString := Cbbfailure_degree.Text;
    DM.tmp.FieldByName('failure_circs').AsString :=Memo1.Lines.Text;
    DM.tmp.Post;
    rkey567:=DM.tmp.FieldByName('rkey').asinteger;
    DM.ADOConnection1.CommitTrans;
    ModalResult := mrOk;
  except
    on E:Exception do
    begin
      DM.ADOConnection1.RollbackTrans;
      MessageDlg(E.Message,mtError,[mbCancel],0);
    end;
  end;
end;



procedure Tfrm_AddMaintenance.EdtDeptEnter(Sender: TObject);
begin
  FDept:=EdtDept.Text;
end;

procedure Tfrm_AddMaintenance.EdtDeptExit(Sender: TObject);
begin
  if EdtDept.Text='' then  Label16.Caption:='';
  if (EdtDept.Text='') or (FDept=EdtDept.Text) then exit;
  DM.tmp.Close;
  DM.tmp.SQL.Text:='select rkey,dept_code,dept_name from data0034 where (ttype in (1,4,5) or is_cost_dept=1) '+
                   'and dept_code='''+trim(EdtDept.Text)+'''';
  DM.tmp.Open;
  if DM.tmp.IsEmpty then
   begin
     messagedlg('部门代码不正确,请重新输入或选择',mtinformation,[mbok],0);
     label16.Caption := '';
     EdtDept.SetFocus;
   end
  else
   begin
     EdtDept.Text:=DM.tmp.FieldValues['dept_code'];
     label16.Caption:=DM.tmp.FieldValues['dept_name'];
     EdtDept.tag:=DM.tmp.Fieldbyname('rkey').AsInteger;
   end;
end;   
procedure Tfrm_AddMaintenance.EdtWarehouseExit(Sender: TObject);
begin
  if EdtWarehouse.Text='' then
  begin
    Label15.Caption:='';
  
  end;

end;

procedure Tfrm_AddMaintenance.EdtAssetExit(Sender: TObject);
begin
  if EdtAsset.Text=''  then
  begin
    Label17.Caption := '';
    exit;
  end;
  DM.tmp.Close;
  if EdtDept.Text<>'' then
    DM.tmp.SQL.Text:='SELECT Data0417.RKEY,Data0417.FASSET_CODE,Data0417.FASSET_NAME,Data0417.FASSET_DESC,data0417.LOCATION,isnull(Data0417.equipment_grade,'''') as equipment_grade '+
                     'FROM Data0417 '+
                     'where Data0417.active_flag in (1,2,3,4) and Data0417.dept_ptr='+inttostr(EdtDept.Tag)+'and Data0417.FASSET_CODE='''+EdtAsset.Text+''''
  else                                              //这个地方也有添加1
    DM.tmp.SQL.Text :='SELECT Data0417.RKEY,Data0417.FASSET_CODE,Data0417.FASSET_NAME,Data0417.FASSET_DESC,'+
                      'Data0417.LOCATION,Data0417.BOOK_DATE,Data0417.id_code,Data0417.USER_DATE,'+
                      'data0034.dept_code,data0034.dept_name,data0034.rkey rkey34,'+
                      'Data0015.warehouse_code,Data0015.abbr_name,Data0015.rkey rkey15,'+
                      'isnull(Data0417.equipment_grade,'''') as equipment_grade '+
                      'FROM Data0417 inner join data0034 on data0417.DEPT_PTR=data0034.rkey '+
                      'inner join data0015 on data0417.warehouse_ptr=data0015.rkey '+
                      'where Data0417.active_flag in (1,2,3,4) and Data0417.FASSET_CODE='''+EdtAsset.Text+'''';
  DM.tmp.Open;                                       //这个地方也有添加1
  if DM.tmp.IsEmpty then
   begin
     messagedlg('设备资产编码不正确,请重新输入或选择',mtinformation,[mbok],0);
     label17.Caption := '';
     EdtAsset.SetFocus;
   end
  else
   begin
   //  EdtAsset.Text:=DM.tmp.FieldValues['FASSET_CODE'];
     label17.Caption:=DM.tmp.FieldValues['FASSET_NAME'];
     EdtAsset.tag:=DM.tmp.Fieldbyname('rkey').AsInteger;
     if Trim(EdtDept.Text)='' then
     begin
       EdtDept.Text:=trim(DM.tmp.FieldValues['Dept_code']);
       label16.Caption:=trim(DM.tmp.FieldValues['Dept_name']);
       EdtDept.tag:=DM.tmp.Fieldbyname('rkey34').AsInteger;
     end;
     if Trim(EdtWarehouse.Text)='' then
     begin
       EdtWarehouse.Text:=trim(DM.tmp.FieldValues['warehouse_code']);
       Label15.Caption:=trim(DM.tmp.FieldValues['abbr_name']);
       EdtWarehouse.Tag:=DM.tmp.Fieldbyname('rkey15').AsInteger;
     end;
     Edtequiment_grade.Text:=Trim(DM.tmp.FieldValues['equipment_grade']);
     if (DM.tmp.Fieldbyname('LOCATION').IsNull=False) and(DM.tmp.Fieldbyname('LOCATION').AsString<>'')then
     begin
       EdtPLACE.Text := DM.tmp.Fieldbyname('LOCATION').AsString;
     end;
   end;

end;

procedure Tfrm_AddMaintenance.FormCreate(Sender: TObject);
begin
  MyDataClass :=TMyDataClass.Create(dm.ADOConnection1);
end;

end.


