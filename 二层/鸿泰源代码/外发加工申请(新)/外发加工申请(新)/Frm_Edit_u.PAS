unit Frm_Edit_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DBCtrls, Mask, DB, ADODB,
  Menus, ComCtrls,raFunc, Spin, DBGridEh, ExtCtrls;

type
  TFrm_Edit = class(TForm)
    BitSve: TBitBtn;
    BitClose: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit4: TEdit;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn7: TBitBtn;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    BitBtn9: TBitBtn;
    Label6: TLabel;
    Edit5: TEdit;
    BitBtn8: TBitBtn;
    Label7: TLabel;
    PopupMenu3: TPopupMenu;
    N7: TMenuItem;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label3: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    DBEdit9: TDBEdit;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Splitter1: TSplitter;
    DBGridEh1: TDBGridEh;
    MaskEdit1: TMaskEdit;
    procedure BitCloseClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BitSveClick(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N7Click(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
    procedure BitSveEnter(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit5Enter(Sender: TObject);
    procedure Edit4Enter(Sender: TObject);
    procedure Edit2Enter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
  private

    v_close:byte; //正常退出标识

    FWHouse,FSupp,FDept,FAud:string;

    function svalid:boolean;
    procedure deldata(rkey300:Integer);
    procedure updateno(rkey300: Integer);
//    procedure updateno(rkey300:Integer);
  public
    Fmod:integer;
    warehouse_type:string;

    procedure initi;
  end;

var
  Frm_Edit: TFrm_Edit;

  function Power(x, y : extended) : extended;

implementation
 uses DM_U,common, Frm_EdtDetail_u,Frm_Auth_u,Pick_Item_Single,ConstVar,
  inv_search;

{$R *.dfm}

procedure TFrm_Edit.BitCloseClick(Sender: TObject);
begin
  ModalResult:=mrcancel;
end;

procedure TFrm_Edit.N1Click(Sender: TObject);     //add
var
 rec_count,rec_no:word;
 
begin
  if not svalid then exit;
  with TFrm_EdtDetail.Create(nil) do
  try
    Grd.Visible:=iFlag=1;
    DBEdit1.Enabled:=iFlag=0;

    FWHOUSE_PTR:=dm.adowz300warehouse_ptr.Value;
    FDept_ptr:=dm.adowz300dept_ptr.Value;
    mainsql:='';
    rec_count:=dm.ADO301.RecordCount;
    rec_no:=dm.ADO301.RecNo;
    
//    if mainsql='' then
    strkey:=getkey;


    dm.ADO301.Append;
    if dm.adowz300rkey.Value>0 then dm.ADO301EPIBOLY_PTR.Value:=dm.adowz300rkey.Value;

    DateTimePicker1.Date:=common.getsystem_date(dm.ADOQuery1,1);

    dm.ADO301UNIT_NAME.AsString:='PNL';

    ShowModal;

    if dm.ADO301.RecordCount=rec_count then dm.ADO301.MoveBy(rec_no-dm.ADO301.RecNo);
  finally
    Free;
  end;
end;

procedure TFrm_Edit.N2Click(Sender: TObject);         //edit
begin
  with TFrm_EdtDetail.Create(application) do
  try
//    Grd.Visible:=iFlag=1;
    Grd.Visible:=false;
    BitBtn3.Enabled:=false;
    EdtPart.Visible:=false;
    BitBtn3.Visible:=iFlag=0;
    DBComboBox1.Enabled:=false;
    DBEdit1.Enabled:=iFlag=0;
   // FWHOUSE_PTR:=dm.adowz300warehouse_ptr.Value;
    //FDept_ptr:=dm.adowz300dept_ptr.Value;
    dm.ADO301.Edit;
    DateTimePicker1.Date:=dm.ADO301REQ_DATE.Value;
    if ShowModal=mrok then
    begin
      dm.ADO301.Edit;
      dm.ADO301REQ_DATE.Value:=DateTimePicker1.Date;
      dm.ADO301.Post;
    end
    else
      dm.ADO301.Cancel;
  finally
    free;
  end;
end;

procedure TFrm_Edit.Edit1Click(Sender: TObject);
begin
  if (sender as tedit).Font.Color=clwindowtext then
  begin
    (sender as tedit).Font.Color :=clblue;
    (sender as tedit).SelectAll;
  end;
end;

procedure TFrm_Edit.DBGrid1DblClick(Sender: TObject);
begin
  if (not dm.ADO301.IsEmpty) and (bitSve.Visible=true) then
    n2click(sender);
end;

procedure TFrm_Edit.N3Click(Sender: TObject);
var
  i,j:Integer;
begin
  if dm.ADO301RECEVIED_QTY.Value>0 then
    showmessage('无法删除该记录已经有收货记录!')
  else if self.ActiveControl=DBGrid1 then
  begin
    j := 0;
    if DM.ADO301.RecNo=DM.ADO301.RecordCount then
    j := 1;
    dm.ADO301.Delete ;

    i:= DM.ADO301.RecNo;
    if j = 0 then
    while not DM.ADO301.Eof do
    begin
      DM.ado301.Edit;
      DM.ADO301seq_no.Value :=  DM.ADO301seq_no.Value-1;
      DM.ADO301.Post;
      DM.ADO301.Next;
    end
    else
    begin
      Exit;
    end;
//    ShowMessage(IntToStr(dm.ADO301.RecNo));
    dm.ADo301.MoveBy(i-dm.ADO301.RecNo);  //使距离当前若干行的记录成为当前记录
//    ShowMessage(IntToStr(dm.ADO301.RecNo));
//    ShowMessage(IntToStr(i));

    DM.ADO305.Filtered:=False;
    DM.ADO305.Filter:='seq_no>='+ IntToStr(i);
    DM.ADO305.Filtered:=true;
    while not DM.ADO305.Eof do
    begin
      DM.ADO305.Edit;
      DM.ADO305seq_no.Value := DM.ADO305seq_no.Value-1;
      DM.ADO305.Post;
      DM.ADO305.Next;
    end;
  end
  else
    DM.ADO305.Delete;
end;

procedure TFrm_Edit.PopupMenu1Popup(Sender: TObject);
begin
 if ActiveControl=DBGrid1  then
 begin
   n1.Enabled := true;
   n2.Enabled := not dm.ado301.IsEmpty;
   n3.Enabled := n2.Enabled;
 end else  begin
   n1.Enabled := false;
   n2.Enabled := false;
   n3.Enabled := not dm.ado305.IsEmpty;
 end;
end;

procedure TFrm_Edit.BitSveClick(Sender: TObject);
  procedure sv305 ;
  var i:integer;
      isNext:boolean;
  begin
    if iFlag=1 then
    begin

      isNext:=false;
      DM.ADO305.Filtered:=false;
      i:=0;

      dm.ado301.First;
      while not dm.ado301.Eof do
      begin

        DM.ADO305.First;
         while not DM.ADO305.Eof do
         begin
           if DM.ADO301EPIBOLY_PTR.Value=DM.ADO305EPIBOLY_PTR.Value then
           begin

             DM.ADO305.Next;
             isNext:=true;

           end else if DM.ADO305EPIBOLY_PTR.Value>0 then
             dm.ado301.Next
           else begin

             if ((i<>0) and (i<>DM.ADO305EPIBOLY_PTR.Value)) or isNext then
             begin

                DM.ADO301.Next;
                isNext:=false;
             end;

             i:=DM.ADO305EPIBOLY_PTR.Value;
             DM.ADO305.Edit;
             DM.ADO305rkey301.Value:=DM.ADO301rkey.Value;
             DM.ADO305EPIBOLY_PTR.Value := DM.ADO301EPIBOLY_PTR.Value;
//             DM.ADO305seq_no.Value := DM.ADO301seq_no.Value;
             DM.ADO305.Post;
             DM.ADO305.Next;
           end;
         end;
         DM.ADO301.Next;
      end;
      DM.ADO305.UpdateBatch(arAll);
      DM.ADO305.Filtered:=true;
    end;
  end;

begin
  dm.ADOConnection1.BeginTrans;
  try
    if (Fmod=0) or (Fmod=1) then //add
     DM.GetNo(MaskEdit1,'65',1);

     dm.adowz300epiboly_number.AsString:=MaskEdit1.Text;

    if dm.adowz300.State = dsedit then
     begin

      dm.adowz300.Post;
//      sv305;
//      dm.ADO301.First;
//      while not dm.ADO301.Eof do
//      begin
//        dm.ADO301.Edit;
//        dm.ADO301EPIBOLY_PTR.Value:=dm.adowz300rkey.Value;
//        dm.ADO301.Post;
//        dm.ADO301.Next;
//      end;
      deldata(DM.adowz300rkey.Value);
//      dm.ado301.UpdateBatch;
//      DM.ADO305.UpdateBatch(arAll);
//      updateno(DM.adowz300rkey.Value);
     end
    else
     begin    //开始新增
      dm.adowz300.Post;

      dm.ADO301.First;
      while not dm.ADO301.Eof do
      begin
        dm.ADO301.Edit;
        dm.ADO301EPIBOLY_PTR.Value:=dm.adowz300rkey.Value;
        dm.ADO301.Post;
        dm.ADO301.Next;
      end;
//        deldata(DM.adowz300rkey.Value);
      dm.ado301.UpdateBatch(arAll);
      sv305;
     end;

//    sv305;


    dm.ADOConnection1.CommitTrans;
    v_close := 1;
    ModalResult:=mrok;
  except
    on  E:Exception do
    begin
    dm.ADOConnection1.RollbackTrans;
    MessageDlg(E.Message,mtError,[mbCancel],0);
    showmessage('数据提交不成功请取消操作重来一次，或通知管理员');
    end;
  end;
end;

procedure TFrm_Edit.Edit2Exit(Sender: TObject);
begin
   if (Edit2.Text='') or (FAud=Edit2.Text)  then exit;
   DM.tmp.Close;
   DM.tmp.SQL.Text:='select data0094.rkey,data0094.code, data0094.PURCHASE_APPROV_DESC '+
                    'from data0094 inner join data0034 on data0094.dept_ptr=data0034.rkey '+
                    'where data0034.dept_code='''+dept_code+''' and data0094.type=1 '+
                    'and data0094.code='''+Edit2.Text+'''';
   DM.tmp.Open;
   if DM.tmp.IsEmpty then
   begin
     messagedlg('审批流程代码不正确,请重新输入或选择',mtinformation,[mbok],0);
     label10.Caption := '';
     Edit2.SetFocus;
   end else begin
     Edit2.Text:=DM.tmp.FieldValues['CODE'];
     label10.Caption:=DM.tmp.FieldValues['PURCHASE_APPROV_DESC'];
     dm.adowz300auth_ptr.Value :=DM.tmp.Fieldbyname('rkey').AsInteger;
   end;
{  if (activecontrol.Name<>'BitBtn3') and (activecontrol.Name<>'BitBtn5') and (trim(edit2.Text)<>'') then
  try
    form_auth:=tform_auth.Create(application);
    form_auth.Edit1.Text := trim(edit2.Text);
    if dm.adowz300auth_ptr.Value<>form_auth.ADOQuery1RKEY.Value then
    if comparetext(trim(edit2.text),trim(form_auth.ADOQuery1.Fieldbyname('code').AsString))=0 then
    begin
      edit2.Font.Color := clwindowtext;
      label10.Caption := form_auth.ADOQuery1.fieldvalues['PURCHASE_APPROV_DESC'];
      dm.adowz300auth_ptr.Value := form_auth.ADOQuery1.FieldValues['rkey'];
    end
    else
    begin
      messagedlg('审批代码不正确,请重新输入或选择',mtinformation,[mbok],0);
      label10.Caption := '';
      edit2.SetFocus;
    end;
  finally
    form_auth.Free;
  end; }
end;

procedure TFrm_Edit.Edit4Exit(Sender: TObject);
begin
   if (Edit4.Text='') or (FDept=Edit4.Text) then exit;
   DM.tmp.Close;
   DM.tmp.SQL.Text:='select rkey,dept_code,dept_name from data0034 where (OUT_SOURCE = 1) AND (TTYPE = 1) '+
                    'and dept_code='''+trim(Edit4.Text)+'''';
   DM.tmp.Open;
   if DM.tmp.IsEmpty then
   begin
     messagedlg('工序代码不正确,请重新输入或选择',mtinformation,[mbok],0);
     label12.Caption := '';
     Edit4.SetFocus;
   end else begin
     Edit4.Text:=DM.tmp.FieldValues['dept_code'];
     label12.Caption:=DM.tmp.FieldValues['dept_name'];
     dm.adowz300dept_ptr.Value :=DM.tmp.Fieldbyname('rkey').AsInteger;
   end;


  {if (activecontrol.Name<>'BitBtn3') and (activecontrol.Name<>'BitBtn7') and (trim(edit4.Text)<>'') then
  try
    form_technics:=tform_technics.Create(application);
    form_technics.Edit1.Text := trim(edit4.Text);
    if dm.adowz300dept_ptr.Value<>form_technics.ADOQuery1RKEY.Value then
    if comparetext(trim(edit4.text),trim(form_technics.ADOQuery1DEPT_CODE.Value))=0 then
    begin
      edit4.Font.Color := clwindowtext;
      label12.Caption := form_technics.ADOQuery1DEPT_NAME.Value;
      dm.adowz300dept_ptr.Value:=form_technics.ADOQuery1RKEY.Value;
    end else begin
      messagedlg('外发工序代码不正确,请重新输入或选择',mtinformation,[mbok],0);
      label12.Caption := '';
      edit4.SetFocus;
    end;
  finally
    form_technics.Free;
  end
  else if (activecontrol.Name<>'BitBtn3') and (activecontrol.Name<>'BitBtn7') and (trim(edit4.Text)='') then
  begin
   label12.Caption := '';
   dm.adowz300dept_ptr.AsVariant := null;
  end;
   }
end;

procedure TFrm_Edit.Edit1Exit(Sender: TObject);
begin
   if (Edit1.Text='') or (FWhouse=Edit1.Text) then exit;
   DM.tmp.Close;
   DM.tmp.SQL.Text:='select rkey,WAREHOUSE_CODE,WAREHOUSE_NAME from data0015 '+
                    'where WAREHOUSE_CODE='''+trim(Edit1.Text)+'''';
   DM.tmp.Open;
   if DM.tmp.IsEmpty then
   begin
     messagedlg('工厂代码不正确,请重新输入或选择',mtinformation,[mbok],0);
     label9.Caption := '';
     Edit1.SetFocus;
   end else begin
     Edit1.Text:=DM.tmp.FieldValues['WAREHOUSE_CODE'];
     label9.Caption:=DM.tmp.FieldValues['WAREHOUSE_NAME'];
     dm.adowz300warehouse_ptr.Value :=DM.tmp.Fieldbyname('rkey').AsInteger;
    // Edit1.tag:=DM.tmp.Fieldbyname('rkey').AsInteger;
   end;


 { if (activecontrol.Name<>'BitBtn3') and (activecontrol.Name<>'BitBtn4') and (trim(edit1.Text)<>'') then
  try
    form_wh:=tform_wh.Create(application);
    form_wh.Edit1.Text := trim(edit1.Text);
    if dm.adowz300warehouse_ptr.Value<>form_wh.ADOQuery1rkey.Value then
    if comparetext(trim(edit1.text),trim(form_wh.ADOQuery1.Fieldbyname('warehouse_code').AsString))=0 then
    begin
      edit1.Font.Color := clwindowtext;
      label9.Caption := form_wh.ADOQuery1.fieldvalues['warehouse_name'];
      dm.adowz300warehouse_ptr.Value := form_wh.ADOQuery1.FieldValues['rkey'];
      dm.adowz300deli_address.Value:= form_wh.ADOQuery1ADDRESS_LINE_3.Value;
    end else begin
      messagedlg('仓库代码不正确,请重新输入或选择',mtinformation,[mbok],0);
      label9.Caption := '';
      edit1.SetFocus;
    end;
  finally
    form_wh.Free;
  end; }
end;

procedure TFrm_Edit.BitBtn9Click(Sender: TObject);
begin
 close;
end;

procedure TFrm_Edit.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if iFlag=1 then DM.ADO305.close;
  DM.ADO301.close;
  DM.ADO301.Open;
  if iFlag=1 then  DM.ADO305.open;
  dm.adowz300.Cancel;
end;

procedure TFrm_Edit.N7Click(Sender: TObject);
begin
  with TFrm_EdtDetail.Create(nil) do
  try
    DateTimePicker1.Date:=dm.ADO301REQ_DATE.Value;
    DateTimePicker1.Enabled:=false;
    BitBtn3.Enabled:=false;
    dbcombobox1.Enabled:=false;
    dbcombobox2.Enabled:=false;
    dbedit1.Enabled := false;
    dbedit3.Enabled := false;
    dbedit4.Enabled := false;
    dbedit5.enabled := false;
    dbedit6.enabled := false;
    dbedit7.Enabled := false;
    dbedit8.enabled := false;
    dbedit9.enabled := false;
    EdtPart.Visible := false;
    Grd.Visible:=false;
    btSave.Visible:=false;
    button2.Caption:='关闭';
    ShowModal;
 finally
    free;
 end;
end;

procedure TFrm_Edit.Edit5Exit(Sender: TObject);
begin
   if (Edit5.Text='') or (FSupp=Edit5.Text) then exit;
   DM.tmp.Close;
   DM.tmp.SQL.Text:='select data0023.rkey,CODE,ABBR_NAME,SUPPLIER_NAME,CONTACT_NAME_1,CONT_PHONE_1,'+
                        'TAX_ID_NUMBER,ANALYSIS_CODE1,CURRENCY_PTR,data0001.CURR_NAME,data0001.BASE_TO_OTHER '+
                        'from data0023 inner join data0001 on data0023.CURRENCY_PTR=data0001.rkey '+
                        'where data0023.ttype<>0 and data0023.status=0 and data0023.CODE='''+Edit5.Text+'''';
   DM.tmp.Open;
   if DM.tmp.IsEmpty then
   begin
     messagedlg('外发供应商代码不正确,请重新输入或选择',mtinformation,[mbok],0);
     label7.Caption := '';
     Edit5.SetFocus;
   end else begin
     Edit5.Text:=DM.tmp.FieldValues['CODE'];
     label7.Caption:=DM.tmp.FieldValues['ABBR_NAME'];
   //  Edit5.tag:=DM.tmp.Fieldbyname('rkey').AsInteger;

     dm.adowz300.Edit;
     dm.adowz300supp_ptr.Value :=DM.tmp.Fieldbyname('rkey').Value; //供应商
     dm.adowz300currency_ptr.Value:=DM.tmp.Fieldbyname('CURRENCY_PTR').Value; //货币
     dm.adowz300exch_rate.Value:=DM.tmp.Fieldbyname('BASE_TO_OTHER').Value;//汇率
     dm.adowz300CONTACT_NAME.Value:=DM.tmp.Fieldbyname('CONTACT_NAME_1').AsString;
     dm.adowz300CONT_PHONE.Value:=DM.tmp.Fieldbyname('CONT_PHONE_1').AsString;
     dm.adowz300TAX_cate.Value:=DM.tmp.Fieldbyname('ANALYSIS_CODE1').AsString;    //票据种类
     dm.adowz300pay_method.Value:=DM.tmp.Fieldbyname('TAX_ID_NUMBER').Value;//付款方法
   end;
end;

procedure TFrm_Edit.BitSveEnter(Sender: TObject);
begin
  if MaskEdit1.Text='' then
  begin
    showmessage('外发申请编号不能为空!');
    MaskEdit1.SetFocus;
    exit;
  end;

  if dm.ado301.IsEmpty then
  begin
    messagedlg('至少需要一项外发申请!',mtinformation,[mbcancel],0);
    dbgrid1.SetFocus;
    exit;
  end;

  if trim(edit1.Text)='' then
  begin
    messagedlg('请输入正确的工厂代码!',mtinformation,[mbcancel],0);
    edit1.SetFocus;
    exit;
  end;

  if trim(edit2.Text)='' then
  begin
    messagedlg('请输入正确的授权代码!',mtinformation,[mbcancel],0);
    edit2.SetFocus;
    exit;
  end;

  if trim(edit4.Text)='' then
  begin
    messagedlg('请输入正确的外发工序!',mtinformation,[mbcancel],0);
    edit4.SetFocus;
    exit;
  end;

  if trim(edit5.Text)='' then
  begin
    messagedlg('请输入正确的供应商!',mtinformation,[mbcancel],0);
    edit5.SetFocus;
    exit;
  end;

end;


function Power(x, y : extended) : extended;
begin
 result := exp(y*ln(x));
end;

function TFrm_Edit.svalid: boolean;
begin
  result:=false;
  if MaskEdit1.Text='' then
  begin
    showmessage('外发编号不能为空');
    exit;
  end;
  if Edit1.Text='' then
  begin
    showmessage('工厂不能为空');
    exit;
  end;
  if Edit5.Text='' then
  begin
    showmessage('供应商不能为空');
    exit;
  end;
  if Edit4.Text='' then
  begin
    showmessage('外发工序不能为空');
    exit;
  end;
  if Edit2.Text='' then
  begin
    showmessage('审批流程不能为空');
    exit;
  end;

  result:=true;
end;

procedure TFrm_Edit.initi;
begin
  if iFlag=0 then
  begin
    DBGridEh1.Visible:=false;
    Splitter1.Visible:=false;
    DBGrid1.Align:=alClient;
  end else begin
//    DM.ADO305.Close;
//    DM.ADO305.Parameters[0].Value:=DM.adowz300rkey.Value;
    DM.ADO305.Close;
    DM.ADO305.Parameters[0].Value:=DM.ADO301seq_no.Value;
    DM.ADO305.Parameters[0].Value:=DM.ADO301EPIBOLY_PTR.Value;
    DM.ADO305.Open;
  end;

   if (Fmod=0) or (Fmod=1) then
   begin
     DM.tmp.Close;
     DM.tmp.SQL.Text:='select data0094.rkey,data0094.code, data0094.PURCHASE_APPROV_DESC '+
                      'from data0094 inner join data0034 on data0094.dept_ptr=data0034.rkey '+
                      'where data0034.dept_code='''+dept_code+''' and data0094.type=1';
     DM.tmp.Open;
     if DM.tmp.RecordCount=1 then
     begin
       Edit2.Text:=DM.tmp.FieldValues['CODE'];
       label10.Caption:=DM.tmp.FieldValues['PURCHASE_APPROV_DESC'];
       dm.adowz300auth_ptr.Value :=DM.tmp.Fieldbyname('rkey').AsInteger;
     end;
   end;
  if dm.adowz300.State=dsinsert then
   begin
    DM.GetNo(MaskEdit1,'65',0);
   { dm.AQ04.Close;
    dm.AQ04.Open;
    if dm.AQ04SEED_FLAG.Value<>1 then
    dm.adowz300epiboly_number.Value := dm.AQ04SEED_VALUE.Value;
    }
   end
  else
   begin
    with dm.ADOQuery1 do
     begin
       Close;
       sql.Text:='select SEED_FLAG from data0004 where rkey=65';
       open;
       if FieldByName('SEED_FLAG').AsInteger=4 then
       MaskEdit1.Enabled:=false;
     end;
    MaskEdit1.Text:=dm.adowz300epiboly_number.AsString;
    edit1.Text:=dm.wzdata300WAREHOUSE_CODE.Value;
    label9.Caption:=dm.wzdata300WAREHOUSE_NAME.Value;
    edit5.Text:=dm.wzdata300CODE.Value;
    label7.Caption:=dm.wzdata300SUPPLIER_NAME.Value;
    edit4.Text:=dm.wzdata300DEPT_CODE.Value;
    label12.Caption:=dm.wzdata300DEPT_NAME.Value;
    edit2.Text:=dm.wzdata300auth_code.Value;
    label10.Caption:=dm.wzdata300PURCHASE_APPROV_DESC.Value;
    edit1.Font.Color := clwindowtext;
    edit2.Font.Color := clwindowtext;
    edit4.Font.Color := clwindowtext;
    edit5.Font.Color := clwindowtext;
   end;
end;

procedure TFrm_Edit.BitBtn4Click(Sender: TObject);
 var InputVar: PDlgInput ;
begin
 if not DM.ADO301.IsEmpty then
 begin
   ShowMessage('已存在外发工序工单，不能修改工序');
 end;
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
  case Tcomponent(Sender).Tag of
    0:
    begin
      InputVar.Fields := 'WAREHOUSE_CODE/工厂代码/100,WAREHOUSE_NAME/工厂名称/200,abbr_NAME/工厂简称/200';
      InputVar.Sqlstr :='select rkey,WAREHOUSE_CODE,WAREHOUSE_NAME,abbr_NAME from data0015';
      inputvar.KeyField:='WAREHOUSE_CODE';
    end;
    1:
    begin
      InputVar.Fields :='CODE/供应商代码/100,SUPPLIER_NAME/供应商名称/200,ABBR_NAME/供应商简称/150' ;
      InputVar.Sqlstr :='select data0023.rkey,CODE,ABBR_NAME,SUPPLIER_NAME,CONTACT_NAME_1,CONT_PHONE_1,'+
                        'TAX_ID_NUMBER,ANALYSIS_CODE1,CURRENCY_PTR,data0001.CURR_NAME,data0001.BASE_TO_OTHER '+
                        'from data0023 inner join data0001 on data0023.CURRENCY_PTR=data0001.rkey '+
                        'where data0023.ttype<>0 and data0023.status=0';
      inputvar.KeyField:='CODE';
    end;
    2:
    begin
      InputVar.Fields :='DEPT_CODE/工序代码/120,DEPT_NAME/工序名称/250' ;
      InputVar.Sqlstr :='SELECT RKEY, DEPT_CODE,DEPT_NAME FROM Data0034 WHERE (OUT_SOURCE = 1) AND (TTYPE = 1)';
      inputvar.KeyField:='DEPT_CODE';
    end;
    3:
    begin
      InputVar.Fields :='CODE/审批流程代码/200,PURCHASE_APPROV_DESC/审批流程名称/250' ;
      InputVar.Sqlstr :='select data0094.rkey,data0094.code, data0094.PURCHASE_APPROV_DESC '+
                        'from data0094 inner join data0034 on data0094.dept_ptr=data0034.rkey '+
                        'where data0034.dept_code='''+dept_code+''' and data0094.type=1 '+
                        'order by code ';
      inputvar.KeyField:='CODE';
    end;
  end;
  InputVar.AdoConn := DM.ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    case Tcomponent(Sender).Tag of
     0:begin
         Edit1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_CODE']);
         label9.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_NAME']);
         dm.adowz300warehouse_ptr.Value :=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
         //Edit1.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
       end;
     1:begin
         Edit5.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['CODE']);
         label7.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['ABBR_NAME']);
        // Edit5.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
         dm.adowz300.Edit;
         dm.adowz300supp_ptr.Value := frmPick_Item_Single.adsPick.Fieldbyname('rkey').Value; //供应商
         dm.adowz300currency_ptr.Value:= frmPick_Item_Single.adsPick.Fieldbyname('CURRENCY_PTR').Value; //货币
         dm.adowz300exch_rate.Value:=frmPick_Item_Single.adsPick.Fieldbyname('BASE_TO_OTHER').Value;//汇率
         dm.adowz300CONTACT_NAME.Value:=frmPick_Item_Single.adsPick.Fieldbyname('CONTACT_NAME_1').AsString;
         dm.adowz300CONT_PHONE.Value:=frmPick_Item_Single.adsPick.Fieldbyname('CONT_PHONE_1').AsString;
         dm.adowz300TAX_cate.Value:=frmPick_Item_Single.adsPick.Fieldbyname('ANALYSIS_CODE1').AsString;    //票据种类
         dm.adowz300pay_method.Value:=frmPick_Item_Single.adsPick.Fieldbyname('TAX_ID_NUMBER').AsString;  //付款方法
       end;
     2:begin
         Edit4.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['DEPT_CODE']);
         label12.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['DEPT_Name']);
         dm.adowz300dept_ptr.Value :=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;;
        // Edit4.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
       end;
     3:begin
         Edit2.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['CODE']);
         label10.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['PURCHASE_APPROV_DESC']);
         dm.adowz300auth_ptr.Value :=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
        // Edit2.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
       end;
    end;
  end ;
 finally
   frmPick_Item_Single.Free ;
 end;


 { form_wh:=tform_wh.Create(application);
  try
    form_wh.Edit1.Text := trim(edit1.Text);
    if form_wh.ADOQuery1.IsEmpty then
    begin
      messagedlg('没有找到相关记录!',mtinformation,[mbok],0);
      edit1.SetFocus;
    end else if form_wh.ShowModal=mrok then
    begin
      edit1.Text := form_wh.ADOQuery1.fieldvalues['warehouse_code'];
      edit1.Font.Color := clwindowtext;
      label9.Caption := form_wh.ADOQuery1.fieldvalues['warehouse_name'];
      dm.adowz300warehouse_ptr.Value := form_wh.ADOQuery1.FieldValues['rkey'];
      dm.adowz300deli_address.Value:= form_wh.ADOQuery1ADDRESS_LINE_3.Value;
      edit5.SetFocus;
      //****************************//
      with DM.Tmp do
      begin
        Close;
        SQL.Text:='select data0094.rkey,data0094.code, data0094.PURCHASE_APPROV_DESC '+
                  'from data0094 inner join data0034 on data0094.dept_ptr=data0034.rkey '+
                  'where data0094.type=1 and data0034.dept_code='''+dept_code+'''';
        Open;
        if not isEmpty then
        begin
          edit2.Text := FieldValues['code'];
          label10.Caption := fieldvalues['PURCHASE_APPROV_DESC'];
          dm.adowz300auth_ptr.Value := FieldValues['rkey'];
        end;
        close;
      end;
      //*************************************//
    end else
     edit1.SetFocus;
  finally
    form_wh.Free;
  end; }
end;

procedure TFrm_Edit.Edit1Enter(Sender: TObject);
begin
  FWHouse:=edit1.Text;
end;

procedure TFrm_Edit.Edit5Enter(Sender: TObject);
begin
  FSupp:=edit5.Text;
end;

procedure TFrm_Edit.Edit4Enter(Sender: TObject);
begin
  FDept:=edit4.Text;
end;

procedure TFrm_Edit.Edit2Enter(Sender: TObject);
begin
  FAud:=edit2.Text;
end;

procedure TFrm_Edit.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
  self.SelectNext(self.ActiveControl,true,true);
end;

procedure TFrm_Edit.BitBtn5Click(Sender: TObject);
begin
  TFrm_Auth.getAuth(dept_code,Edit2,self.Label10);

end;

procedure TFrm_Edit.updateno(rkey300: Integer);
var
  aqtmp1,aqtmp2,aqtmp3:TADOQuery;
  ino:Integer;
begin
  with dm.ADO301 do
  begin
    First;
    while not DM.ADO301.Eof do
    begin
      if RecNo<>FieldByName('seq_no').AsInteger then
      begin
        DM.ADO305.Filtered:=False;
        DM.ADO305.Filter:='seq_no =' + DM.ADO301seq_no.AsString;
        DM.ADO305.Filtered:=True;
        with DM.ADO305 do
        begin
          First;
          while not Eof do
          begin
            Edit;
            DM.ADO305seq_no.Value:=DM.ADO301.RecNo;
            Post;
            Next;
          end;
        end;
        Edit;
        DM.ADO301seq_no.Value:=RecNo;
        Post;
      end;
      Next;
    end;
  end;
  DM.ADO301.UpdateBatch(arAll);
  DM.ado305.UpdateBatch(arAll);



//  i:=1;
//  aqtmp1:=TADOQuery.Create(nil);
//  aqtmp2:=TADOQuery.Create(nil);
//  aqtmp3:=TADOQuery.Create(nil);
//  aqtmp3.Connection:=DM.ADOConnection1;
//  aqtmp1.Connection:=DM.ADOConnection1;
//  aqtmp2.Connection:=DM.ADOConnection1;
//
//  with aqtmp1 do
//  begin
//    Close;
//    SQL.Clear;
//    SQL.Text:='select epiboly_ptr,seq_no from wzdata301 where wzdata301='+ IntToStr(rkey300);
//    Open;
//    First;
//    while not Eof do
//    begin
//      if RecNo<>FieldByName('seq_no').AsInteger then
//      begin
//
//        with aqtmp3 do
//        begin
//          Close;
//          SQL.Clear;
//          SQL.Text:='update wzdata301 set seq_no='+ IntToStr(RecNo) + ' where wzdata301='+ IntToStr(rkey300);
//          ExecSQL;
//        end;
//        with aqtmp2 do
//        begin
//          Close;
//          SQL.Clear;
//          SQL.Text:='update wzdata305 set seq_no='+ IntToStr(RecNo) + ' where epiboly_ptr='
//                      + fieldByName('epiboly_ptr').AsString + ',seq_no=' + fieldByName('seq_no').AsString;
//          ExecSQL;
//        end;
//      end;
//    end;
//  end;
end;

procedure TFrm_Edit.deldata(rkey300: Integer);
var
  EPIBOLY_PTR:Integer;
begin
  with DM.Tmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='delete from wzdata305 where epiboly_ptr='+ IntToStr(rkey300);
    ExecSQL;
  end;

  with DM.Tmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='delete from wzdata301 where epiboly_ptr='+ IntToStr(rkey300);
    ExecSQL;
  end;
   
   with DM.Tmp2 do
   begin
    Close;
    SQL.Clear;
    SQL.Text:='select  EPIBOLY_PTR, CUSTPART_PTR, QUANTITY, RECEVIED_QTY, RETURN_QTY, '+
        ' PRICE, UNIT_NAME, STANDARD, AREA_SQM, AREA_SQF, LAYER, THINK, MIN_aperture, '+
        ' REQ_DATE, REMARTK, reject_qty, set_qty, Cu_THK, prod_type, seq_no ,rkey' +#13+
        ' from wzdata301 where rkey is null ';
    Open;

    DM.ADO301.First;
//    EPIBOLY_PTR := DM.ADO301EPIBOLY_PTR.Value;
    while not DM.ADO301.Eof do
    begin

      AppendRecord([rkey300,DM.ADO301CUSTPART_PTR.Value,
                            DM.ADO301QUANTITY.Value,DM.ADO301RECEVIED_QTY.Value,
                            DM.ADO301RETURN_QTY.Value, DM.ADO301PRICE.Value,
                            DM.ADO301UNIT_NAME.Value,
                            DM.ADO301STANDARD.Value,DM.ADO301AREA_SQM.Value,
                            DM.ADO301AREA_SQF.Value,DM.ADO301LAYER.Value,
                            DM.ADO301THINK.Value,DM.ADO301MIN_aperture.Value,
                            DM.ADO301REQ_DATE.Value,DM.ADO301REMARTK.Value,
                            DM.ADO301reject_qty.Value,DM.ADO301set_qty.Value,
                            DM.ADO301Cu_THK.Value,
                            DM.ADO301prod_type.Value,DM.ADO301seq_no.Value,nil]);

//      DM.Tmp2.Append;
//
//      ShowMessage(DM.ADO301EPIBOLY_PTR.AsString);
//      ShowMessage(DM.ADO301QUANTITY.AsString);
//      DM.Tmp2.FieldByName('EPIBOLY_PTR').Value:= DM.ADO301EPIBOLY_PTR.Value;
//      DM.Tmp2.FieldByName('CUSTPART_PTR').Value:= DM.ADO301CUSTPART_PTR.Value;
//      DM.Tmp2.FieldByName('QUANTITY').Value:= DM.ADO301QUANTITY.Value;
//      DM.Tmp2.FieldByName('RECEVIED_QTY').Value:= DM.ADO301RECEVIED_QTY.Value;
//      DM.Tmp2.FieldByName('RETURN_QTY').Value:= DM.ADO301RETURN_QTY.Value;
//      DM.Tmp2.FieldByName('PRICE').Value:= DM.ADO301PRICE.Value;
//      DM.Tmp2.FieldByName('UNIT_NAME').Value:= DM.ADO301UNIT_NAME.Value;
//      DM.Tmp2.FieldByName('STANDARD').Value:= DM.ADO301STANDARD.Value;
//
//      DM.Tmp2.FieldByName('AREA_SQM').Value:= DM.ADO301AREA_SQM.Value;
//      DM.tmp2.FieldByName('AREA_SQF').Value:= DM.ADO301AREA_SQF.Value;
//      DM.Tmp2.FieldByName('LAYER').Value:= DM.ADO301LAYER.Value;
//      DM.tmp2.FieldByName('THINK').Value:= DM.ADO301THINK.Value;
//      DM.Tmp2.FieldByName('MIN_aperture').Value:= DM.ADO301MIN_aperture.Value;
//      DM.tmp2.FieldByName('REQ_DATE').Value:= DM.ADO301REQ_DATE.Value;
//      DM.Tmp2.FieldByName('REMARTK').Value:= DM.ADO301REMARTK.Value;
//      DM.tmp2.FieldByName('reject_qty').Value:= DM.ADO301reject_qty.Value;
//
//      DM.Tmp2.FieldByName('set_qty').Value:= DM.ADO301set_qty.Value;
//      DM.tmp2.FieldByName('Cu_THK').Value:= DM.ADO301Cu_THK.Value;
//      DM.Tmp2.FieldByName('prod_type').Value:= DM.ADO301prod_type.Value;
//      DM.tmp2.FieldByName('seq_no').Value:= DM.ADO301seq_no.Value;
//      DM.Tmp2.Post;
      if iFlag<>0 then
      with DM.Tmp3 do
      begin
        Close;
        SQL.Clear;
        SQL.Text:='select rkey301, wo_ptr, Quantity, EPIBOLY_PTR, seq_no from wzdata305 where rkey=0 ';
        Open;

        DM.ADO305.First;
        while not DM.ADO305.Eof do
        begin

          DM.Tmp3.AppendRecord([DM.tmp2.FieldByName('rkey').Value,
                                DM.ADO305wo_ptr.Value,DM.ADO305Quantity.Value,
                                DM.ADO305EPIBOLY_PTR.Value,DM.ADO305seq_no.Value]);
          DM.ado305.Next;
        end;
      end;


      DM.ado301.Next;
    end;
   end;


//  with DM.Tmp do
//  begin
//    Close;
//    SQL.Clear;
//    SQL.Text:='select  EPIBOLY_PTR, CUSTPART_PTR, QUANTITY, RECEVIED_QTY, RETURN_QTY, '+
//        ' PRICE, UNIT_NAME, STANDARD, AREA_SQM, AREA_SQF, LAYER, THINK, MIN_aperture, '+
//        ' REQ_DATE, REMARTK, reject_qty, set_qty, Cu_THK, prod_type, seq_no ' +#13+
//        ' from wzdata301 where rkey=0 ';
//    Open;
//    DM.ADO301.First;
//    while not DM.ADO301.Eof do
//    begin
//      AppendRecord([DM.ADO301EPIBOLY_PTR.Value,DM.ADO301CUSTPART_PTR.Value,
//                            DM.ADO301QUANTITY.Value,DM.ADO301RECEVIED_QTY.Value,
//                            DM.ADO301RETURN_QTY.Value, DM.ADO301PRICE.Value,
//                            DM.ADO301UNIT_NAME.Value,
//                            DM.ADO301STANDARD.Value,DM.ADO301AREA_SQM.Value,
//                            DM.ADO301AREA_SQF.Value,DM.ADO301LAYER.Value,
//                            DM.ADO301THINK.Value,DM.ADO301MIN_aperture.Value,
//                            DM.ADO301REQ_DATE.Value,DM.ADO301REMARTK.Value,
//                            DM.ADO301reject_qty.Value,DM.ADO301set_qty.Value,
//                            DM.ADO301Cu_THK.Value,
//                            DM.ADO301prod_type.Value,DM.ADO301seq_no.Value]);
//
//      DM.ado301.Next;
//    end;
//  end;


end;

end.
