unit Frm_detail_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Spin, DBCtrls, StdCtrls, Mask, Grids, DBGrids, Buttons, ExtCtrls,
  ComCtrls, DBGridEh, Menus, DB, ADODB;

type
  TFrm_detail = class(TForm)
    Panel1: TPanel;
    BitBtn9: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Label14: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    MEdtReqNo: TMaskEdit;
    EdtFac: TEdit;
    EdtAud: TEdit;
    EdtBug: TEdit;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    SpYear: TSpinEdit;
    SpMonth: TSpinEdit;
    DpReqDate: TDateTimePicker;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    EdtDept: TEdit;
    ADO68: TADOQuery;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ADO68RKEY: TAutoIncField;
    ADO68PO_REQ_NUMBER: TStringField;
    ADO68USER_PTR: TIntegerField;
    ADO68REQ_BY: TIntegerField;
    ADO68BUYER_PTR: TIntegerField;
    ADO68APPD_BY: TIntegerField;
    ADO68DATA275_PTR: TIntegerField;
    ADO68AUTH_TYPE: TIntegerField;
    ADO68WHSE_PTR: TIntegerField;
    ADO68budget_ptr: TIntegerField;
    ADO68NPAD_PTR: TIntegerField;
    ADO68ENT_DATE: TDateTimeField;
    ADO68REQ_DATE: TDateTimeField;
    ADO68AUTH_DATE: TDateTimeField;
    ADO68STATUS: TWordField;
    ADO68DEPARTMENT_NAME: TStringField;
    ADO68FLAG: TStringField;
    ADO68EDITED_DATE: TDateTimeField;
    ADO68EDITED_BY_USER_PTR: TIntegerField;
    ADO68EDITED_BY_EMP_PTR: TIntegerField;
    ADO68TOTAL: TBCDField;
    ADO68CURRENY_PTR: TIntegerField;
    ADO68EXCHANGE_RATE: TFloatField;
    ADO68v_year: TSmallintField;
    ADO68v_month: TSmallintField;
    ComboBox1: TComboBox;
    Label28: TLabel;
    ADO68REQ_TYPE: TStringField;
    Panel2: TPanel;
    Grd3: TDBGridEh;
    Grd2: TDBGridEh;
    Label9: TLabel;
    EdtUser: TEdit;
    BitBtn7: TBitBtn;
    Label10: TLabel;
    EdtPhone: TEdit;
    ADO68user_name: TStringField;
    ADO68user_phone: TStringField;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure EdtFacExit(Sender: TObject);
    procedure EdtAudExit(Sender: TObject);
    procedure EdtBugExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Grd2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private
    FsWare_type:string;
    Qry: TADOQuery;
    procedure svValue;
    function getReqNo(sWare_type,sPr_id:string):string;
  public
    Ftag:integer;
    procedure init;
  end;

var
  Frm_detail: TFrm_detail;

implementation
  uses DM_u,common,Pick_Item_Single,ConstVar,Frm_Auth_u,Frm_note_u,Frm_DetailEdit_u,Frm_DetailEdit1_u;

{$R *.dfm}

procedure TFrm_detail.init;
var i:integer;
begin

  BitBtn9.Visible:=Ftag=3;
  BitBtn1.Visible:=Ftag in [0,1,2,8];
  BitBtn3.Visible:=BitBtn1.Visible;

  BitBtn5.Enabled:=not BitBtn9.Visible;
  BitBtn6.Enabled:=not BitBtn9.Visible;

  EdtAud.Enabled:=BitBtn5.Enabled;
  ComboBox1.Enabled:=BitBtn5.Enabled;

  EdtUser.Enabled:=BitBtn5.Enabled;
  BitBtn7.Enabled:=BitBtn5.Enabled;
  EdtPhone.Enabled:=BitBtn5.Enabled;

  if (Ftag=0) or ((Ftag in [2,3,8]) and (DM.AQ68flag.Value='S')) then
    Qry:=DM.AQ69
  else
    Qry:=DM.AQ204 ;

  Qry.Close;
  if Ftag in [0,1] then
     Qry.Parameters[0].Value:=-1
  else
    Qry.Parameters[0].Value:=DM.AQ68rkey.Value;
  Qry.Open;

  case Ftag of
    0,1:
    begin
      Grd2.Visible:=Ftag=0;
      Grd3.Visible:=Ftag=1;
      EdtDept.Text:=dept_code;
      DM.tmp.Close;
      DM.tmp.SQL.Text:='select getdate() ,year(getdate()),month(getdate())';
      DM.tmp.Open;
      DpReqDate.Date:=DM.tmp.Fields[0].AsDateTime;
      SpYear.Value:=DM.tmp.Fields[1].AsInteger;
      SpMonth.Value:=DM.tmp.Fields[2].AsInteger;

      DM.tmp.Close;
      DM.tmp.SQL.Text:='select rkey,warehouse_code,warehouse_name,warehouse_type from data0015';
      DM.tmp.Open;
      if DM.tmp.RecordCount=1 then
      begin
         EdtFac.Text:=DM.tmp.FieldValues['warehouse_code'];
         label5.Caption:=DM.tmp.FieldValues['warehouse_name'];
         EdtFac.tag:=DM.tmp.Fieldbyname('rkey').AsInteger;
         FsWare_type:=DM.tmp.FieldValues['warehouse_type'];
         MEdtReqNo.Text:=getReqNo(FsWare_type, Pr_id);
      end;

      DM.tmp.Close;
      DM.tmp.SQL.Text:='select data0094.rkey,data0094.code, data0094.PURCHASE_APPROV_DESC '+
                       'from data0094 inner join data0034 on data0094.dept_ptr=data0034.rkey '+
                       'where data0094.type=0 and data0034.dept_code='''+dept_code+''' ';
      DM.tmp.Open;
      if DM.tmp.RecordCount=1 then
      begin
         EdtAud.Text:=DM.tmp.FieldValues['Code'];
         label6.Caption:=DM.tmp.FieldValues['PURCHASE_APPROV_DESC'];
         EdtAud.tag:=DM.tmp.Fieldbyname('rkey').AsInteger;
      end;

      DM.tmp.Close;
      DM.tmp.SQL.Text:='select data0362.rkey,data0362.code,data0362.DESCRIPTION from data0362 inner join '+
                       'data0363 on data0363.budget_ptr=data0362.rkey where data0362.bud_year='+inttostr(SpYear.Value)+
                       ' and data0363.user_ptr='+rkey73;
      DM.tmp.Open;
      if DM.tmp.RecordCount=1 then
      begin
         EdtBug.Text:=DM.tmp.FieldValues['Code'];
         label7.Caption:=DM.tmp.FieldValues['DESCRIPTION'];
         EdtBug.tag:=DM.tmp.Fieldbyname('rkey').AsInteger;
      end;

      if Qry=DM.AQ69 then
        Qry.Filter:='purch_req_ptr=0'
      else
        Qry.Filter:='purchase_req_ptr=0';
    end ;
    2,3,8:    //edit / look /copy
    begin
      Grd2.Visible:=DM.AQ68flag.Value='S';
      Grd3.Visible:=not Grd2.Visible;
      MEdtReqNo.Text:=DM.AQ68po_req_number.Value;
      EdtFac.Enabled:=false;
      BitBtn4.Enabled:=false;
      whs_ptr:=DM.AQ68WHSE_PTR.asstring;
      EdtFac.Text:=DM.AQ68warehouse_code.value;
      Label5.Caption:=DM.AQ68abbr_name.Value;

      EdtAud.Text:=DM.AQ68code94.value;
      Label6.Caption:=DM.AQ68PURCHASE_APPROV_DESC.value;
      EdtUser.Text:=DM.AQ68user_name.value;
      EdtPhone.Text:=DM.AQ68user_phone.value;

      EdtBug.Text:=DM.AQ68code362.value;
      Label7.Caption:=DM.AQ68DESCRIPTION.value;

      EdtDept.Text:=DM.AQ68department_name.Value;

      DpReqDate.Date:=DM.AQ68req_date.Value;
      SpYear.Value:=DM.AQ68v_year.Value;
      SpMonth.Value:=DM.AQ68v_month.Value;

      if DM.AQ68REQ_TYPE.AsString<>'' then
      begin
        if DM.AQ68REQ_TYPE.AsString='A' then ComboBox1.ItemIndex:=0 else
        if DM.AQ68REQ_TYPE.AsString='B' then ComboBox1.ItemIndex:=1 else
        if DM.AQ68REQ_TYPE.AsString='C' then ComboBox1.ItemIndex:=2 else
        if DM.AQ68REQ_TYPE.AsString='D' then ComboBox1.ItemIndex:=3 else
        if DM.AQ68REQ_TYPE.AsString='E' then ComboBox1.ItemIndex:=4 else
        if DM.AQ68REQ_TYPE.AsString='F' then ComboBox1.ItemIndex:=5;
      end;


      if Ftag=8 then //copy
      begin
        DM.tmp.Close;
        DM.tmp.SQL.Text:='select getdate() ,year(getdate()),month(getdate())';
        DM.tmp.Open;
        DpReqDate.Date:=DM.tmp.Fields[0].AsDateTime;
        SpYear.Value:=DM.tmp.Fields[1].AsInteger;
        SpMonth.Value:=DM.tmp.Fields[2].AsInteger;

        EdtFacExit(nil);
        EdtAud.Tag:=DM.AQ68AUTH_TYPE.Value;
        EdtBug.Tag:=DM.AQ68budget_ptr.Value;

        DM.tmp1.Close;
        DM.tmp1.SQL.Text:=Qry.SQL.Text;
        DM.tmp1.Parameters[0].Value:=DM.AQ68rkey.Value;
        DM.tmp1.Open;

        Qry.Close;
        Qry.Parameters[0].Value:=0;
        Qry.Open;
        while not DM.tmp1.Eof do
        begin
          Qry.Append;
          for i:=0 to Qry.FieldCount-1 do
          begin
            if (uppercase(Qry.Fields[i].FieldName)='PURCH_REQ_PTR') OR (uppercase(Qry.Fields[i].FieldName)='PURCHASE_REQ_PTR') then
              Qry.Fields[i].Value:=0
            else if (uppercase(Qry.Fields[i].FieldName)='REQ_DATE') then
              Qry.Fields[i].Value:=system_date
            else if (Qry.Fields[i].FieldName='reply_date') then
              Qry.Fields[i].Value:=null
            else if (Qry.Fields[i].FieldKind=fkData) and not (Qry.Fields[i] is TAutoIncField) then
              Qry.Fields[i].Value:=DM.tmp1.Fieldbyname(Qry.Fields[i].FieldName).Value
            else
              continue;
          end;
          Qry.Post;
          DM.tmp1.Next;
        end;
        DM.tmp1.Close;
      end;
    end;
  end;
end;

procedure TFrm_detail.BitBtn4Click(Sender: TObject);
  var InputVar: PDlgInput ;
begin
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
  case Tcomponent(Sender).Tag of
    0:
    begin
      InputVar.Fields := 'warehouse_code/工厂编号/100,warehouse_name/工厂名称/200,abbr_name/工厂简称/200';
      InputVar.Sqlstr :='select rkey,warehouse_code,warehouse_name,warehouse_type,abbr_name from data0015 where active_flag=''Y''';
      inputvar.KeyField:='warehouse_code';
    end;
    1:
    begin
      InputVar.Fields :='code/审批代码/200,PURCHASE_APPROV_DESC/说  明/200' ;
      InputVar.Sqlstr :='select data0094.rkey,data0094.code, data0094.PURCHASE_APPROV_DESC '+
                        'from data0094 inner join data0034 on data0094.dept_ptr=data0034.rkey '+
                        'where data0094.type=0 and data0034.dept_code='''+dept_code+''' order by code';
      inputvar.KeyField:='code';
    end;
    2:
    begin
      InputVar.Fields := 'code/预算编号/200,DESCRIPTION/说  明/200';
      InputVar.Sqlstr:='select data0362.rkey,data0362.code,data0362.DESCRIPTION from data0362 inner join '+
                       'data0363 on data0363.budget_ptr=data0362.rkey where data0362.bud_year='+inttostr(SpYear.Value)+
                       ' and data0363.user_ptr='+rkey73;
      inputvar.KeyField:='code';
    end;
    3:
    begin
      InputVar.Fields := 'EMPL_CODE/人员编号/100,EMPLOYEE_NAME/姓 名/100,PHONE/电  话/200,DEPT_NAME/所在部门/100';
      InputVar.Sqlstr:='SELECT dbo.Data0005.RKEY, dbo.Data0005.EMPL_CODE, dbo.Data0005.EMPLOYEE_NAME, dbo.Data0005.PHONE, dbo.Data0034.DEPT_NAME '+
                        'FROM dbo.Data0005 INNER JOIN '+
                        'dbo.Data0034 ON dbo.Data0005.EMPLOYEE_ID = dbo.Data0034.RKEY '+
                        'WHERE (dbo.Data0005.ACTIVE_FLAG =''Y'') order by 2';
      inputvar.KeyField:='EMPL_CODE';
    end;
  end;
  InputVar.AdoConn := DM.ADOCon ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    case Tcomponent(Sender).Tag of
     0:begin
         EdtFac.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['warehouse_code']);
         label5.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['warehouse_name']);
         EdtFac.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
         FsWare_type:=frmPick_Item_Single.adsPick.Fieldbyname('warehouse_type').AsString;
         MEdtReqNo.Text:=getReqNo(FsWare_type, Pr_id);
         whs_ptr:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').asstring;
       end;
     1:begin
        EdtAud.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['code']);
        label6.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['PURCHASE_APPROV_DESC']);
        EdtAud.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
       end;
     2:begin
        EdtBug.Text:=trim(frmPick_Item_Single.adsPick.Fieldbyname('code').asstring);
        label7.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['DESCRIPTION']);
        EdtBug.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
       end;
     3:begin
        EdtUser.Text:=trim(frmPick_Item_Single.adsPick.Fieldbyname('EMPLOYEE_NAME').asstring);
        EdtPhone.Text:=trim(frmPick_Item_Single.adsPick.Fieldbyname('PHONE').asstring);
       end;
    end;
  end ;
 finally
   frmPick_Item_Single.Free ;
 end;

end;

procedure TFrm_detail.BitBtn3Click(Sender: TObject);
begin
  Qry.Filter:='';
  Qry.Close;
  Qry.Parameters[0].Value:=DM.AQ68rkey.AsInteger;
  Qry.Open;
  close;
end;

procedure TFrm_detail.BitBtn2Click(Sender: TObject);
begin
  with TFrm_note.Create(nil) do
  try
    BitBtn1.Enabled:=not (Ftag=3);
    if not DM.ADO11.Active then
    begin
      if (Ftag=0) or (Ftag=1) then
        DM.ADO11.Parameters[0].Value:=-1
      else
        DM.ADO11.Parameters[0].Value:=DM.AQ68rkey.Value;
      DM.ADO11.Open;
      if DM.ADO11.IsEmpty then
      begin
        DM.ADO11.Append;
        DM.ADO11.FieldByName('source_type').AsInteger:=68;
      end;
    end;
    if showmodal=mrok then DM.ADO11.Post else DM.ADO11.Cancel;
  finally
    free;
  end;
end;

procedure TFrm_detail.svValue;
var sSql:string;
    isReq:boolean;
    sFld,sReqNo:string;
    rkey68:integer;
begin
  if EdtFac.Text='' then
  begin
    showmessage('工厂代码不能为空...');
    abort;
  end;
  if EdtAud.Text='' then
  begin
    showmessage('审批代码不能为空...');
    abort;
  end;
  if EdtBug.Text='' then
  begin
    showmessage('预算代码不能为空...');
    abort;
  end;
  if (Grd2.Visible and (DM.AQ69.RecordCount=0)) or (Grd3.Visible and (DM.AQ204.RecordCount=0))  then
   begin
    showmessage('请购物料不能为空...');
    abort;
   end;
  try
    DM.ADOCon.BeginTrans;
   if Ftag in [0,1,8] then  //add /copy
    begin
      ADO68.Open;
      ADO68.Append;
      sReqNo:=MEdtReqNo.Text;
      EdtFacExit(nil);   //保存时重新产生单号
      isReq:=sReqNo<>MEdtReqNo.Text;
      
      ADO68PO_REQ_NUMBER.Value:=MEdtReqNo.Text;
      ADO68USER_PTR.Value:=strtoint(rkey73);
      ADO68REQ_BY.Value:=strtoint(rkey05);

      ADO68AUTH_TYPE.Value:=EdtAud.Tag;
      ADO68WHSE_PTR.Value:=EdtFac.Tag;
      ADO68budget_ptr.Value:=EdtBug.Tag;
      ADO68REQ_DATE.AsString:=formatdatetime('YYYY/MM/DD',DpReqDate.Date);
      ADO68STATUS.Value:=7;
      ADO68DEPARTMENT_NAME.Value:=dept_code;
      if ComboBox1.ItemIndex<>-1 then
        ADO68REQ_TYPE.Value:=copy(ComboBox1.Text,1,1);
      if Grd2.Visible then
      begin
        ADO68FLAG.Value:='S';
        sFld:='PURCH_REQ_PTR';
      end else begin
        ADO68FLAG.Value:='M';
        sFld:='PURCHASE_REQ_PTR';
      end;

      ADO68CURRENY_PTR.Value:=1;
      ADO68v_year.Value:=SpYear.Value;
      ADO68v_month.Value:=SpMonth.Value;

      ADO68user_name.value:=EdtUser.Text;
      ADO68user_phone.value:=EdtPhone.Text;

      ADO68.Post;
      
      rkey68:=ADO68rkey.Value;
      Qry.First;
      Qry.Filter:=sFld+'=0 or '+sFld+'='+ADO68rkey.AsString;
      while not Qry.Eof do
      begin
        Qry.Edit;
        Qry.FieldByName(sFld).AsInteger:=rkey68;
        Qry.Post;
        Qry.Next;
      end;
    end
   else
    if Ftag=2 then  //edit
    begin
      rkey68:=DM.AQ68rkey.AsInteger;
      sSql:='update data0068 set status=7,ent_date=null,';
      if EdtFac.Tag<>0 then sSql:=sSql+'WHSE_PTR='+inttostr(EdtFac.Tag)+',';
      if EdtAud.Tag<>0 then sSql:=sSql+'AUTH_TYPE='+inttostr(EdtAud.Tag)+',';
      if EdtBug.Tag<>0 then sSql:=sSql+'AUTH_TYPE='+inttostr(EdtBug.Tag)+',';
      sSql:=sSql+'user_name='''+EdtUser.Text+''',user_phone='''+EdtPhone.Text+''',';

      if ComboBox1.ItemIndex<>-1 then
       sSql:=sSql+'REQ_TYPE='''+copy(ComboBox1.Text,1,1)+''',';
      sSql:=sSql+'REQ_DATE='''+formatdatetime('YYYY/MM/DD',DpReqDate.Date)+''',v_year='+inttostr(SpYear.Value)+',v_month='+inttostr(SpMonth.Value) ;
      sSql:=sSql+' where rkey='+DM.AQ68rkey.AsString+' and status in (7,4)' ;
      DM.tmp.Close;
      DM.tmp.SQL.Text:=sSql;
      if DM.tmp.ExecSQL=0 then
      begin
        DM.ADOCon.RollbackTrans;
        showmessage('请购单状态发生改变而未能成功提交!');
        modalresult:=mrcancel;
        DM.ADO11.Close;
        DM.AQ68.Close;
        DM.AQ68.Open;
        exit;
      end;
    end ;

    if DM.ADO11.Active then
    begin
      DM.ADO11.Edit;
      DM.ADO11.FieldByName('file_pointer').AsInteger:=rkey68;
      DM.ADO11.FieldByName('source_type').AsInteger:=68;
      DM.ADO11.Post;
      DM.ADO11.UpdateBatch(arall);
    end;

    Qry.UpdateBatch(arAll);
    Qry.Filter:='';

    DM.ADOCon.CommitTrans;
    DM.ADO11.Close;
    modalresult:=mrok;
    DM.AQ68.Close;
    DM.AQ68.Open;
    DM.AQ68.Locate('rkey',rkey68,[]);
    if isReq then showmessage('由于原初始单号已被使用,系统产生一个新单号：'+ADO68PO_REQ_NUMBER.Value+',成功保存!');
  except
{    DM.ADOCon.RollbackTrans;
    showmessage('数据保存过程遇到错误未能成功提交,请与管理员联系!');
    }
  on E: Exception do
    begin
      dm.ADOCon.RollbackTrans;
      messagedlg(E.Message,mterror,[mbcancel],0);
      DM.ADO11.Close;
    end;

{    modalresult:=mrcancel;
    DM.ADO11.Close;
    DM.AQ68.Close;
    DM.AQ68.Open;
}
  end;
end;

procedure TFrm_detail.EdtFacExit(Sender: TObject);
begin
   if (EdtFac.Text='') or (Ftag=3) then exit;
   DM.tmp.Close;
   DM.tmp.SQL.Text:='select rkey,warehouse_code,warehouse_name,warehouse_type from data0015 where warehouse_code='''+EdtFac.Text+'''';
   DM.tmp.Open;
   if DM.tmp.IsEmpty then
   begin
     messagedlg('工厂代码不正确,请重新输入或选择',mtinformation,[mbok],0);
     label5.Caption := '';
     EdtFac.SetFocus;
   end else begin
     whs_ptr:=DM.tmp.Fieldbyname('rkey').asstring;
     EdtFac.Text:=DM.tmp.FieldValues['warehouse_code'];
     label5.Caption:=DM.tmp.FieldValues['warehouse_name'];
     EdtFac.tag:=DM.tmp.Fieldbyname('rkey').AsInteger;
     FsWare_type:=DM.tmp.Fieldbyname('warehouse_type').AsString;
     MEdtReqNo.Text:=getReqNo(FsWare_type, Pr_id);
   end;
end;

procedure TFrm_detail.EdtAudExit(Sender: TObject);
begin
   if (EdtAud.Text='') or (Ftag=3) then exit;
   DM.tmp.Close;
   DM.tmp.SQL.Text:='select data0094.rkey,data0094.code, data0094.PURCHASE_APPROV_DESC '+
                    'from data0094 inner join data0034 on data0094.dept_ptr=data0034.rkey '+
                    'where data0094.type=0 and data0034.dept_code='''+dept_code+''' and data0094.code='''+EdtAud.Text+'''';
   DM.tmp.Open;
   if DM.tmp.IsEmpty then
   begin
     messagedlg('审批代码不正确,请重新输入或选择',mtinformation,[mbok],0);
     label6.Caption := '';
     EdtAud.SetFocus;
   end else begin
     EdtAud.Text:=DM.tmp.FieldValues['Code'];
     label6.Caption:=DM.tmp.FieldValues['PURCHASE_APPROV_DESC'];
     EdtAud.tag:=DM.tmp.Fieldbyname('rkey').AsInteger;
   end;
end;

procedure TFrm_detail.EdtBugExit(Sender: TObject);
begin
   if (EdtBug.Text='') or (Ftag=3) then exit;
   DM.tmp.Close;
   DM.tmp.SQL.Text:='select data0362.rkey,data0362.code,data0362.DESCRIPTION from data0362 inner join '+
                    'data0363 on data0363.budget_ptr=data0362.rkey where data0362.bud_year='+inttostr(SpYear.Value)+
                    ' and data0363.user_ptr='+rkey73+' and data0362.code='''+EdtBug.Text+'''' ;
   DM.tmp.Open;
   if DM.tmp.IsEmpty then
   begin
     messagedlg('预算代码不正确,请重新输入或选择',mtinformation,[mbok],0);
     label7.Caption := '';
     EdtBug.SetFocus;
   end else begin
     EdtBug.Text:=DM.tmp.FieldValues['Code'];
     label7.Caption:=DM.tmp.FieldValues['DESCRIPTION'];
     EdtBug.tag:=DM.tmp.Fieldbyname('rkey').AsInteger;
   end;
end;

procedure TFrm_detail.BitBtn1Click(Sender: TObject);
begin
  svValue;
end;

function TFrm_detail.getReqNo(sWare_type, sPr_id: string): string;
var s:string;
    I:integer;
begin
  s:=sWare_type+sPr_id+'-'+copy(inttostr(SpYear.Value),3,2);

 if spmonth.Value < 10 then
  s := s+'0'+inttostr(self.spmonth.Value)
 else
  s := s+inttostr(self.spmonth.Value);          //月份


  DM.tmp.Close;
  DM.tmp.SQL.Text:='select top 1 po_req_number from data0068 where po_req_number like '''+s+'%'' order by po_req_number desc';
  DM.tmp.Open;
  if DM.tmp.IsEmpty then
    s:=s+'0001'
  else
   begin
    I := strtoint(copy(DM.tmp.fieldvalues['po_req_number'],length(trim(s))+1,4));
    I :=10000+I+1;
    s:=s+copy(inttostr(I),2,4);
   end;
  result:=s;
end;

procedure TFrm_detail.N1Click(Sender: TObject);
begin
  if (TComponent(Sender).Tag in [0,1]) and (EdtFac.text='') then
  begin
    showmessage('请先选择工厂...');
    exit;
  end;
  if  Grd2.Visible then
  begin
    if TComponent(Sender).Tag in [0,1,3] then
    begin
      Frm_DetailEdit:=TFrm_DetailEdit.Create(nil);
      try
        with Frm_DetailEdit do
        begin
          Frm_DetailEdit.Ftag:=TComponent(Sender).Tag;
          Edit1.Text:=self.Label5.Caption;
          case TComponent(Sender).Tag of
          0:  begin     //add
                DM.AQ69.Append;
                if self.Ftag=2 then Frkey68:=DM.AQ68rkey.Value;
              end;
          1:  begin       //edit
                initData;
                DM.AQ69.Edit;
                EdtMat.Text:=DBEdit1.Text;
                EdtMat.Enabled:=false;
                BitBtn4.Enabled:=false;
                GroupBox2.TabOrder:=0;
              end;
          3:  begin
                initData;
                BtSave.Enabled:=false;
                BtCan.Caption:='关闭';
                BitBtn4.Enabled:=false;
                EdtMat.visible:=false;
                GroupBox2.Enabled:=false;
              end;
          end;
          showmodal;
          if TComponent(Sender).Tag in [0,1] then
            if modalresult=mrok  then DM.AQ69.Post else DM.AQ69.Cancel;
        end;
      finally
        Frm_DetailEdit.free;
      end;
    end else
      DM.AQ69.Delete;
  end else begin
    if TComponent(Sender).Tag in [0,1,3] then
    begin
      Frm_DetailEdit1:=TFrm_DetailEdit1.Create(nil);
      try
        with Frm_DetailEdit1 do
        begin
          Frm_DetailEdit1.Ftag:=TComponent(Sender).Tag;
          initData;
          case TComponent(Sender).Tag of
          0:  begin     //add
                DM.AQ204.Append;
                if self.Ftag=2 then
                begin
                  Frkey68:=DM.AQ68rkey.Value;
                  DM.AQ204.FieldByName('purchase_req_ptr').AsInteger:=Frkey68;
                end;
              end;
          1:  begin       //edit
                DM.AQ204.Edit;
                Edit1.Text:=DBEdit3.Text; //unit
              end;
          3:  begin
                BtSave.Enabled:=false;
                BtCan.Caption:='关闭';
                BitBtn4.Enabled:=false;
                Edit1.visible:=false;
              end;
          end;
          showmodal;
          if TComponent(Sender).Tag in [0,1] then
            if modalresult=mrok  then DM.AQ204.Post else DM.AQ204.Cancel;
        end;
      finally
        Frm_DetailEdit1.free;
      end;
    end else
      DM.AQ204.Delete;
  end;
  BitBtn4.Enabled:=(self.Ftag in [0,1]) and ((Grd2.Visible and DM.AQ69.IsEmpty) or (Grd3.Visible and DM.AQ204.IsEmpty));
  EdtFac.Enabled:=BitBtn4.Enabled;
end;

procedure TFrm_detail.PopupMenu1Popup(Sender: TObject);
begin
  N1.Enabled:=Ftag in [0,1,2,8];
  N2.Enabled:=N1.Enabled and (Qry.RecordCount>0);
  N3.Enabled:=N2.Enabled;
  N5.Enabled:=Qry.RecordCount>0;
end;

procedure TFrm_detail.BitBtn9Click(Sender: TObject);
begin
  close;
end;

procedure TFrm_detail.BitBtn5Click(Sender: TObject);
begin
  if EdtDept.Text='' then
   showmessage('请先输入部门代码...')
  else
    TFrm_Auth.getAuth(EdtDept.Text,EdtAud,self.Label6);
end;

procedure TFrm_detail.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    self.SelectNext(self.ActiveControl,true,true);
end;

procedure TFrm_detail.Grd2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
 if dm.AQ69CRITICAL_MATL.Value='是' then
  Grd2.Canvas.Font.Color := clRed;

  Grd2.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
