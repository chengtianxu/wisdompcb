unit Frm_detail_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Spin, DBCtrls, StdCtrls, Mask, Grids, DBGrids, Buttons, ExtCtrls,
  ComCtrls, DBGridEh, Menus, DB, ADODB, DBCtrlsEh,SelectItemUnit;

type
  TFrm_detail = class(TForm)
    Panel1: TPanel;
    BitBtn9: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    EdtAsset: TEdit;
    Label10: TLabel;
    BtnSave: TBitBtn;
    EdtDept: TEdit;
    SpeedButton1: TSpeedButton;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    Label4: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    DBMemo1: TDBMemo;
    DBComboBox1: TDBComboBox;
    Label9: TLabel;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    Label11: TLabel;
    DBComboBox3: TDBComboBox;
    Label13: TLabel;
    Label14: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label12: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Edit1: TEdit;
    SpeedButton3: TSpeedButton;
    bit_FaultDesc: TBitBtn;
    Label17: TLabel;
    edt_FaultName: TDBEdit;
    edt1: TEdit;
    procedure BitBtn9Click(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure EdtAssetExit(Sender: TObject);
    procedure EdtDeptExit(Sender: TObject);
    procedure EdtDeptEnter(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure bit_FaultDescClick(Sender: TObject);
  private
    FDept:string;
  public
    Ftag:integer;
    procedure initd;
  end;

implementation
  uses DM_u,common,Pick_Item_Single,ConstVar;

{$R *.dfm}

procedure TFrm_detail.initd;
begin
  if Ftag=0 then
  begin
    self.Caption:='设备维修申请-新增';
    DM.tmp.SQL.Text:='select data0005.employee_id,data0034.dept_code,data0034.Dept_name '+
                     'from data0005 inner join data0034 on data0005.employee_id=data0034.rkey where data0005.rkey='+user_ptr;
    DM.tmp.Open;

    EdtDept.Text:=DM.tmp.Fields[1].AsString;
    label6.Caption:=DM.tmp.Fields[2].AsString;
    EdtDept.Tag:=DM.tmp.Fields[0].AsInteger;
    DM.GetNo(MaskEdit1,'59',0);

    DM.ADO567_1.Close;
    DM.ADO567_1.Parameters[0].Value:=-1;
    DM.ADO567_1.Open;
    DM.ADO567_1.Append;

    DM.tmp.Close;
    DM.tmp.SQL.Text:='select getdate()';
    DM.tmp.Open;
    DM.ADO567_1.FieldByName('failure_date').AsDateTime:=DM.tmp.Fields[0].AsDateTime;
    DM.ADO567_1.FieldByName('ent_date').AsDateTime:=DM.tmp.Fields[0].AsDateTime;

  end
  else
  begin
    self.Caption:='设备维修申请-修改';
    MaskEdit1.ReadOnly:=true;
    DM.ADO567_1.Close;
    DM.ADO567_1.Parameters[0].Value:=DM.ADO567rkey.Value;
    DM.ADO567_1.Open;

    EdtDept.Tag:=DM.ADO567_1.FieldByName('dept_ptr').AsInteger;
    EdtDept.Text:=DM.ADO567.FieldByName('dept_code').AsString;
    Label6.Caption:=DM.ADO567.FieldByName('dept_name').AsString;

    EdtAsset.Tag:=DM.ADO567_1.FieldByName('FAsset_ptr').AsInteger;
    EdtAsset.Text:=DM.ADO567.FieldByName('Fasset_code').AsString;
    Label4.Caption:=DM.ADO567.FieldByName('Fasset_name').AsString;

    Edit1.Tag:=DM.ADO567_1.FieldByName('whouse_ptr').AsInteger;
    Edit1.Text:=DM.ADO567.FieldByName('warehouse_code').AsString;
    Label16.Caption:=DM.ADO567.FieldByName('abbr_name').AsString;

    MaskEdit1.Text:=DM.ADO567_1.Fieldbyname('number').AsString;
    edt1.Text:=DM.ADO567_1.Fieldbyname('equipment_grade').AsString;

    if  (trim(DM.ADO567.FieldValues['FASSET_TYPE'])='基础杂务')or
        (trim(DM.ADO567.FieldValues['FASSET_TYPE'])='工程')or
        (trim(DM.ADO567.FieldValues['FASSET_TYPE'])='预防维护')then
      begin
        DBComboBox3.Tag:=1;
        DBComboBox3.ItemIndex:=-1;
        DBComboBox3.Enabled:=False;
        DBComboBox3.Color:=clInactiveCaption;
      end
    else
      begin
        DBComboBox3.Tag:=0;        //如果=0，保存时不能为空
        DBComboBox3.Enabled:=True;
        DBComboBox3.Color:=clWindow;
      end;
//    if DM.ADO567_1.Fieldbyname('equipment_grade').AsString='关键' then
//      ComboBox1.ItemIndex:=0;
//    if DM.ADO567_1.Fieldbyname('equipment_grade').AsString='重要' then
//      ComboBox1.ItemIndex:=1;
//    if DM.ADO567_1.Fieldbyname('equipment_grade').AsString='一般' then
//      ComboBox1.ItemIndex:=2;
//    if DM.ADO567_1.Fieldbyname('equipment_grade').AsString='其它' then
//      ComboBox1.ItemIndex:=3;
  end;
end;

procedure TFrm_detail.BtnSaveClick(Sender: TObject);
var
  strSQL:string;
begin
  if MaskEdit1.Text='' then
  begin
    showmessage('申请单号不能为空...');
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
//  if ComboBox1.Text='' then
//  begin
//    showmessage('设备级别不能为空...');
//    exit;
//  end;
  if DBComboBox1.Text='' then
  begin
    showmessage('故障级别不能为空...');
    exit;
  end;
  if DBComboBox3.Tag=0 then
  if DBComboBox3.Text='' then
  begin
    showmessage('影响程度不能为空...');
    exit;
  end;
  if Trim(DBEdit1.Text)='' then
  begin
    ShowMessage('使用地点不能为空...');
    Exit;
  end;
  if DBEdit2.Text='' then
  begin
    showmessage('联络人不能为空...');
    exit;
  end;
  if DBEdit3.Text='' then
  begin
   showmessage('联络电话不能为空...');
   exit;
  end;
  if Trim(DBMemo1.Text)='' then
  begin
    ShowMessage('故障情况说明不能为空...');
    Exit;
  end;

  strSQL:='select data0567.* from data0567 join data0417 on data0567.FASSET_PTR=data0417.rkey '
      +'where data0417. DEPT_PTR not in '
      +'(select rkey from data0034 where data0034.DEPT_NAME Like ''%设备部%'' or data0034.DEPT_NAME Like ''%公共设施组%'' )'
      +' and data0417.rkey='+intTostr(EdtAsset.Tag)
      +' and data0567.[STATUS] in (1,2) and data0567.ent_date>dateadd(day,-180,getdate())';
  with DM.tmp do
  begin
    Close;
    SQL.Text:=  strSQL;
    Open;
   // ShowMessage(SQL.Text);
    if IsEmpty=False then
    begin
      ShowMessage('该设备的前一次维修单号：“'+FieldByName('NUMBER').AsString+'”还没完成，'+#13+'现不允许新增！！！')  ;
      Exit;
    end;
  end;


  DM.ADO567_1.Edit;
  DM.ADO567_1.FieldByName('EMPL_PTR').AsString:=user_ptr;
  DM.ADO567_1.FieldByName('dept_ptr').AsInteger:=EdtDept.Tag;
  DM.ADO567_1.FieldByName('FAsset_ptr').AsInteger:=EdtAsset.Tag;
  DM.ADO567_1.FieldByName('status').AsInteger:=0;
  DM.ADO567_1.FieldByName('whouse_ptr').AsInteger:=Edit1.Tag;
  DM.ADO567_1.FieldByName('equipment_grade').AsString:=edt1.Text;
  DM.ADO567_1.FieldByName('D073_ptr').Value:=rkey73;
  DM.ADOCon.BeginTrans;
  try
    if (Ftag=0)  and not DM.GetNo(MaskEdit1,'59',1) then  abort;
    DM.ADO567_1.FieldByName('NUMBER').AsString:=MaskEdit1.Text;
    DM.ADO567_1.Post;
    DM.ADO567_1.UpdateBatch(arAll);
    DM.ADOCon.CommitTrans;
    Frkey567:=DM.ADO567_1.FieldByName('rkey').asinteger;
    modalresult:=mrok;
  except
    on e:Exception do
    begin
      DM.ADOCon.RollbackTrans;
      ShowMessage('保存数据失败...'+#13#10+e.Message);
    end;
  end;
end;

procedure TFrm_detail.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=vk_return) and not (self.ActiveControl is TDBMemo) then
    self.SelectNext(self.ActiveControl,true,true);
end;

procedure TFrm_detail.BitBtn9Click(Sender: TObject);
begin
  close;
end;


procedure TFrm_detail.SpeedButton1Click(Sender: TObject);
var
  InputVar: PDlgInput ;
  sg:string;
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
        if Trim(Edit1.Text)<>'' then
        begin
          if EdtDept.Text='' then
            InputVar.Sqlstr :='SELECT Data0514.FASSET_TYPE,Data0417.D840_ptr,Data0417.RKEY,Data0417.FASSET_CODE,isnull(Data0417.equipment_grade,'''') as equipment_grade,Data0417.FASSET_NAME,Data0417.FASSET_DESC,Data0417.LOCATION,'+
                              'Data0417.BOOK_DATE,Data0417.USER_DATE,data0034.dept_code,data0034.dept_name,data0034.rkey rkey34,'+
                              'Data0015.warehouse_code,Data0015.abbr_name,Data0015.rkey rkey15,isnull(Data0417.equipment_grade,'''') as equipment_grade '+
                              'FROM Data0417 INNER JOIN '+
                              'data0034 on Data0417.dept_ptr=data0034.rkey INNER JOIN '+
                              'Data0015 on Data0417.warehouse_ptr=Data0015.rkey '+
                              'LEFT OUTER JOIN Data0514 ON DATA0417.FASSET_TYPE_PTR = Data0514.RKEY '+
                              'where Data0417.active_flag in (2,3,4) and Data0417.warehouse_ptr='+inttostr(Edit1.tag)+' order by FASSET_CODE'
          else                                    //去掉1，即新进状态的设备不允许开单   1,
            InputVar.Sqlstr :='SELECT Data0514.FASSET_TYPE,Data0417.D840_ptr,Data0417.RKEY,Data0417.FASSET_CODE,isnull(Data0417.equipment_grade,'''') as equipment_grade,Data0417.FASSET_NAME,Data0417.FASSET_DESC,Data0417.LOCATION,'+
                              'Data0417.BOOK_DATE,Data0417.USER_DATE,data0034.dept_code,data0034.dept_name,data0034.rkey rkey34,'+
                              'Data0015.warehouse_code,Data0015.abbr_name,Data0015.rkey rkey15,isnull(Data0417.equipment_grade,'''') as equipment_grade '+
                              'FROM Data0417 INNER JOIN '+
                              'Data0034 on Data0417.dept_ptr=data0034.rkey INNER JOIN '+
                              'Data0015 on Data0417.warehouse_ptr=Data0015.rkey '+
                              'LEFT OUTER JOIN Data0514 ON DATA0417.FASSET_TYPE_PTR = Data0514.RKEY '+
                              'where Data0417.active_flag in (2,3,4) and Data0417.dept_ptr='+inttostr(EdtDept.Tag)+
                              ' and Data0417.warehouse_ptr='+inttostr(Edit1.tag)+
                              ' order by FASSET_CODE';    //去掉1，即新进状态的设备不允许开单   1,
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
    InputVar.AdoConn := DM.ADOCon ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      case Tcomponent(Sender).Tag of
        0:
        begin
          EdtDept.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['Dept_code']);
          label6.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['Dept_name']);
          EdtDept.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
          EdtAsset.Text:='';
          label4.Caption:='' ;
          EdtAsset.tag:=0;
          DM.ADO567_1.Edit;
          DM.ADO567_1.FieldByName('place').AsString:='';
        end;
        1:
        begin
          if EdtDept.Text='' then
          begin
            EdtDept.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['Dept_code']);
            label6.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['Dept_name']);
            EdtDept.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey34').AsInteger;
          end;
          if Trim(Edit1.Text)='' then
          begin
            Edit1.Text:=Trim(frmPick_Item_Single.adsPick.FieldValues['warehouse_code']);
            Label16.Caption:=Trim(frmPick_Item_Single.adsPick.FieldValues['abbr_name']);
            Edit1.Tag:=StrToInt(Trim(frmPick_Item_Single.adsPick.FieldValues['rkey15']));
          end;
          EdtAsset.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['FASSET_CODE']);
          label4.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['FASSET_NAME']);
          EdtAsset.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
          edt1.Text:=Trim(frmPick_Item_Single.adsPick.FieldValues['equipment_grade']);
          DM.ADO567_1.Edit;
          DM.ADO567_1.FieldByName('place').AsString:=frmPick_Item_Single.adsPick.Fieldbyname('LOCATION').AsString;
          DM.ADO567_1.FieldByName('D840_ptr').AsString:=frmPick_Item_Single.adsPick.Fieldbyname('D840_ptr').AsString;
          if  (trim(frmPick_Item_Single.adsPick.FieldValues['FASSET_TYPE'])='基础杂务')or
              (trim(frmPick_Item_Single.adsPick.FieldValues['FASSET_TYPE'])='工程')or
              (trim(frmPick_Item_Single.adsPick.FieldValues['FASSET_TYPE'])='预防维护')then
            begin
              DBComboBox3.Tag:=1;
              DBComboBox3.ItemIndex:=-1;
              DBComboBox3.Enabled:=False;
              DBComboBox3.Color:=clInactiveCaption;
            end
          else
            begin
              DBComboBox3.Tag:=0;        //如果=0，保存时不能为空
              DBComboBox3.Enabled:=True;
              DBComboBox3.Color:=clWindow;
            end;
        end;
      end;
    end ;
  finally
   frmPick_Item_Single.Free ;
  end;
end;

procedure TFrm_detail.EdtAssetExit(Sender: TObject);
var
  sg:string;
begin
   if EdtAsset.Text=''  then exit;
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
     label4.Caption := '';
     EdtAsset.SetFocus;
   end
   else
   begin
     EdtAsset.Text:=DM.tmp.FieldValues['FASSET_CODE'];
     label4.Caption:=DM.tmp.FieldValues['FASSET_NAME'];
     EdtAsset.tag:=DM.tmp.Fieldbyname('rkey').AsInteger;
     if Trim(EdtDept.Text)='' then
     begin
       EdtDept.Text:=trim(DM.tmp.FieldValues['Dept_code']);
       label6.Caption:=trim(DM.tmp.FieldValues['Dept_name']);
       EdtDept.tag:=DM.tmp.Fieldbyname('rkey34').AsInteger;
     end;
     if Trim(Edit1.Text)='' then
     begin
       Edit1.Text:=trim(DM.tmp.FieldValues['warehouse_code']);
       Label16.Caption:=trim(DM.tmp.FieldValues['abbr_name']);
       Edit1.Tag:=DM.tmp.Fieldbyname('rkey15').AsInteger;
     end;
     edt1.Text:=Trim(DM.tmp.FieldValues['equipment_grade']);
//     sg:=
//     if sg='关键' then
//       ComboBox1.ItemIndex:=0;
//     if sg='重要' then
//       ComboBox1.ItemIndex:=1;
//     if sg='一般' then
//       ComboBox1.ItemIndex:=2;
//     if sg='其它' then
//       ComboBox1.ItemIndex:=3;
//     ComboBox1.SetFocus;

     if (DM.tmp.Fieldbyname('LOCATION').IsNull=False) and(DM.tmp.Fieldbyname('LOCATION').AsString<>'')then
     begin
       DM.ADO567_1.Edit;
       DM.ADO567_1.FieldByName('place').AsString:=DM.tmp.Fieldbyname('LOCATION').AsString;
     end;
   end;
end;

procedure TFrm_detail.EdtDeptExit(Sender: TObject);
begin
   if EdtDept.Text='' then  Label6.Caption:='';

   if (EdtDept.Text='') or (FDept=EdtDept.Text) then exit;
   DM.tmp.Close;
   DM.tmp.SQL.Text:='select rkey,dept_code,dept_name from data0034 where (ttype in (1,4,5) or is_cost_dept=1) '+
                    'and dept_code='''+trim(EdtDept.Text)+'''';
   DM.tmp.Open;
   if DM.tmp.IsEmpty then
   begin
     messagedlg('部门代码不正确,请重新输入或选择',mtinformation,[mbok],0);
     label6.Caption := '';
     EdtDept.SetFocus;
   end
   else
   begin
     EdtDept.Text:=DM.tmp.FieldValues['dept_code'];
     label6.Caption:=DM.tmp.FieldValues['dept_name'];
     EdtDept.tag:=DM.tmp.Fieldbyname('rkey').AsInteger;
//     EdtAsset.Text:='';
//     label4.Caption:='' ;
//     EdtAsset.tag:=0;
     DM.ADO567_1.Edit;
     DM.ADO567_1.FieldByName('place').AsString:='';
   end;
end;

procedure TFrm_detail.EdtDeptEnter(Sender: TObject);
begin
  FDept:=EdtDept.Text;
end;

procedure TFrm_detail.SpeedButton3Click(Sender: TObject);
var
  InputVar:PDlgInput;
begin
  frmPick_Item_Single:=Tfrmpick_item_single.Create(application);
  InputVar.Fields := 'warehouse_code/工厂代码/80,warehouse_name/工厂名称/200,abbr_name/工厂简称/100';
  InputVar.Sqlstr :='select rkey,warehouse_code,warehouse_name,abbr_name from data0015';
  InputVar.AdoConn := DM.ADOCon ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    Edit1.Text:=frmPick_Item_Single.adsPick.FieldValues['warehouse_code'];
    Label16.Caption:=frmPick_Item_Single.adsPick.FieldValues['abbr_name'];
    Edit1.Tag:=frmPick_Item_Single.adsPick.FieldValues['rkey'];

    //清空 申请部门、维修设备 的内容
    EdtDept.Text:='';
    label6.Caption:='';
    EdtDept.tag:=0;
    EdtAsset.Text:='';
    label4.Caption:='' ;
    EdtAsset.tag:=0;
  end;
end;

procedure TFrm_detail.bit_FaultDescClick(Sender: TObject);
var
  Vpoint:Tpoint;
begin
  if Trim(EdtAsset.Text)='' then
    Exit
  else
  with DM.qry_D0846 do
  begin
    Close;
    Parameters.ParamByName('vFASSET_CODE').Value:= Trim(EdtAsset.Text);
    Open;
  end;

  with  edt_FaultName  do
  begin
    Vpoint:= Parent.ClientToScreen(Point(Left,Top));
    if ShowAddListForm(self.Handle,DM.qry_D0846,'FaultName',Text,Vpoint.x,Vpoint.y+Height,400)then
    begin
     // Text:=  DM.qry_D0846.FieldByName('FaultName').Value;
      dm.ADO567_1D846_ptr.value:=   DM.qry_D0846.FieldByName('rkey').AsInteger;
    end;
  end
end;

end.
