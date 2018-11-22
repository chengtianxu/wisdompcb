unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, Menus, StdCtrls, Buttons, ExtCtrls, DBGridEh;

type
  TForm1 = class(TForm)
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N20: TMenuItem;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DBGridEh1: TDBGridEh;
    Edit1: TEdit;
    Label1: TLabel;
    N2: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure update06_492(cut_no:string;new_rkey25:integer);
    procedure custpart_select();
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
   preColumn:TColumnEh;
   sql_text:string;
   function return_step(rkey25,dept_ptr:integer):Integer;
  public
    { Public declarations }

  end;

var
  Form1: TForm1;

implementation

uses damo, workorder, note, detail, cust_search, partsearch,
  date_fw,sales_edit,common, DB, Search,Unit3;

{$R *.dfm}

procedure TForm1.update06_492(cut_no:string;new_rkey25:integer);
begin
 dm.ADO492.Close;
 dm.ADO492.Parameters.ParamByName('CUT_NO').Value := cut_no;
 dm.ADO492.Open;

 dm.ADO492.Edit;
 dm.ADO492bom_ptr.Value := new_rkey25;
 dm.ADO492.Post;
end;

function TForm1.return_step(rkey25, dept_ptr: integer): Integer;
begin
 with dm.ADOQuery2 do
  begin
   Close;
   sql.Text:='select STEP_NUMBER from data0038 where SOURCE_PTR='+inttostr(rkey25)+
             ' and dept_ptr='+inttostr(dept_ptr);
   open;
   Result:=DM.ADOQuery2.fieldbyname('STEP_NUMBER').AsInteger;
  end;
end;

procedure TForm1.custpart_select();
var
 rkey60,i:integer;
 part_cpv:string;
begin
 form12:=tform12.Create(application);
 form12.Edit1.Text:=dm.ADO60SALES_ORDER.Value;
 form12.Edit2.Text:=dm.ADO60custcode.Value;
 form12.Label1.Caption:=dm.ADO60customer_name.Value;
 form12.Edit3.Text:=frmcustpart.ADOQuery1manu_part_number.Value;
 form12.Label3.Caption:=frmcustpart.ADOQuery1manu_part_desc.Value;
 form12.rkey12:=dm.ADO60CUST_SHIP_ADDR_PTR.Value;

 dm.aq492.Open;
 with dm.ado06 do
  begin
   close;
   sql.Delete(sql.Count-2);
   sql.Insert(sql.Count-1,'and (Data0006.PROD_STATUS <> 9)');   //作业单不等于已完工
   open;
  end;
 if form12.ShowModal=mrok then
  begin
   dm.ADOConnection1.BeginTrans;
   try
    if form12.CheckBox1.Checked then
    begin
      dm.aq492.First;
      while not dm.aq492.Eof do
      begin
        self.update06_492(dm.aq492CUT_NO.Value,Form12.find_rkey25(dm.aq492BOM_PTR.Value));
        dm.aq492.Next;
      end;
      dm.aq492.First;
    end;
    for i:=1 to form12.StringGrid4.RowCount-2 do
     begin
      dm.ado0006.Close;
      dm.ado0006.Parameters.ParamByName('rkey').Value :=
                        strtoint(form12.StringGrid4.Cells[9,i]);
      dm.ado0006.Open;
      dm.ado0006.Edit;
      dm.ado0006bom_ptr.Value := strtoint(form12.StringGrid4.Cells[11,i]);
      dm.ado0006.Post;
      with dm.ADOQuery2 do
        begin
         close;
         sql.Clear;
         sql.Text:='insert into data0117(Source_ptr,Source_Type,Empl_ptr,Tdate,Action,Remark) '+
          ' values ('
          +dm.ado0006rkey.AsString+',2,'+User_ptr+',getdate(),7,'
          +QuotedStr('订单更改升级作业单版本'+dm.ADO60MANU_PART_NUMBER.Value+
          ':'+frmcustpart.ADOQuery1manu_part_number.Value)+
          ')';
         ExecSQL;
        end;
      with dm.ADOQuery1 do
        begin
          Close;
          SQL.Text:='select DEPT_PTR,STEP from data0056 where WO_PTR='+dm.ado0006rkey.AsString;
          open;
          if not IsEmpty then
          if DM.ADOQuery1.fieldbyname('STEP').AsInteger<>
             Self.return_step(dm.ado0006bom_ptr.Value,
               DM.ADOQuery1.fieldbyname('DEPT_PTR').AsInteger) then
          begin
            Edit;
            DM.ADOQuery1.fieldbyname('STEP').AsInteger:=
               Self.return_step(dm.ado0006bom_ptr.Value,
                 DM.ADOQuery1.fieldbyname('DEPT_PTR').AsInteger);
            Post;
          end;
        end;

     end;
    part_cpv:=dm.ADO60MANU_PART_NUMBER.Value;
    dm.ADO60.Edit;
    dm.ADO60CUST_PART_PTR.Value := frmcustpart.ADOQuery1rkey.Value;
    dm.ADO60.Post;

     with dm.ADOQuery1 do
      begin
       close;                  //记录销售订单产品版本更改情况(日志文件)
       sql.Clear;
       sql.Add('insert into data0318 (SALES_ORDER_PTR,TRANS_TYPE,TRANS_DESCRIPTION,');
       sql.Add('FROM_string,TO_string,USER_PTR,TRANS_DATE,PROGRAM_SOURCE)');
       sql.Add('values ('+dm.ADO60rkey.AsString+',9,''更改销售订单不同客户产品版本  '',');
       sql.Add(''''+part_cpv+''','''+frmcustpart.ADOQuery1manu_part_number.Value+''','+rkey73+',');
       sql.add('getdate(),109)');
       ExecSQL;
      end;

     if dm.ADO60part_price.Value<>0 then
     with dm.ADOQuery1 do
      begin
       close;
       sql.Clear;
       sql.Add('update data0025');
       sql.Add('set latest_price=:last_price');
       sql.Add('where rkey='+dm.ADO60CUST_PART_PTR.AsString);
       if dm.ADO60tax_in_price.Value='N' then
        Parameters.ParamByName('last_price').Value:=
         formatfloat('0.0000',dm.ADO60part_price.Value/dm.ADO60EXCH_RATE.Value)
       else
        Parameters.ParamByName('last_price').Value:=
         formatfloat('0.0000',dm.ADO60part_price.Value/dm.ADO60EXCH_RATE.Value/
                              (1+dm.ADO60RUSH_CHARGE.Value*0.01));
       ExecSQL;
      end;

      rkey60 := dm.ADO60rkey.Value;
      dm.ADO60.Close;
      dm.ADO60.Open;
      dm.ADO60.Locate('rkey',rkey60,[]);

      dm.ADOConnection1.CommitTrans;
      showmessage('更新操作成功!');
      dm.ado0006.Close;
      dm.ADO492.Close;
      dm.ado06.Close;
      dm.aq492.Close;
   except
     on E: Exception do
      begin
       dm.ADOConnection1.RollbackTrans;
       messagedlg(E.Message,mterror,[mbcancel],0);
      end;
   end;
  end;
  form12.Free
end;

procedure TForm1.N1Click(Sender: TObject);
begin
if (dm.ADO60status.Value=1) then
 with dm.ado06 do
  begin
   close;
   sql.Delete(sql.Count-2);
   sql.Insert(sql.Count-1,'and (Data0006.PROD_STATUS <= 6)');
   open;
  end
else
 with dm.ado06 do
  begin
   close;
   sql.Delete(sql.Count-2);
   sql.Insert(sql.Count-1,'and (Data0006.PROD_STATUS = 103 or Data0006.PROD_STATUS = 102)');
   open;
  end;
 form2:=tform2.Create(application);
 form2.ShowModal;
 form2.Free;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
 application.Terminate;
end;

procedure TForm1.N8Click(Sender: TObject);
var
 v_state:string;
begin
if (strtoint(vprev)<>4) then
 messagedlg('对不起,您本程序该功能的权限!',mtinformation,[mbok],0)
else
if messagedlg('暂缓已投产的订单将暂缓/取消工作单您确定?',mtConfirmation,[mbyes,mbno],0)=mryes then
try
 edit_note:=tedit_note.Create(application);
 edit_note.Label9.Caption:=' 文件号/暂停原因:';
 edit_note.iMenu:=0;// 暂停
//20170209tang修改销售记录本取60.
  with dm.ADOQuery5 do
  begin
    if active=true then active:=false;
    sql.Clear;
    sql.Text:='select RemarkSO from data0060 where Rkey='+dm.ADO60rkey.AsString;
    active:=true;
    if not isempty then
      edit_note.Memo1.Lines.Add(fieldbyname('RemarkSO').AsString);
  end;
// with dm.ADOS6011 do
//  begin
//   close;
//   Parameters[2].Value:=dm.ADO60rkey.Value;
//   open;
//   if not isempty then edit_note.Memo1.Text:=dm.ADOS6011memo_text.Value;
//  end;
  if edit_note.ShowModal=mrok then
  begin
    if (not dm.ADOQuery5.IsEmpty) and (trim(edit_note.Memo1.Text)<>'') then
    begin             //原记录有记事本而且修改了
      dm.ADOQuery5.Edit;
      dm.ADOQuery5.fieldbyname('RemarkSO').asstring:=edit_note.Memo1.Lines.Text;
      dm.ADOQuery5.Post;
    end;
//end 20170209tang

//   if (not dm.ados6011.IsEmpty) and (trim(edit_note.Memo1.Text)<>'') then
//    begin             //原记录有记事本而且修改了
//     dm.ados6011.Edit;
//     dm.ADOS6011memo_text.Value:=edit_note.Memo1.Text;
//     dm.ados6011.Post;
//    end
//   else
//    if (not dm.ados6011.IsEmpty) and (trim(edit_note.Memo1.Text)='') then//如果原记录有记事本但被删除了
//     dm.ados6011.Delete
//    else
//     if (dm.ados6011.IsEmpty) and  (trim(edit_note.memo1.Text)<>'') then//如果原记录没有记事本，但新增了记事本
//      begin
//       dm.ados6011.Append;
//       dm.ados6011file_pointer.Value:=dm.ADO60rkey.Value;
//       dm.ados6011source_type.Value:=60;
//       dm.ADOS6011memo_text.Value:=edit_note.Memo1.Text;
//       dm.ados6011.post;
//      end;
//     dm.ADOS6011.Close;
   v_state:=dm.ADO60v_status.Value;
   dm.ADO60.Edit;            //准备修改状态及工作单
   dm.ADO60status.Value:=2;  //暂缓070915改以前是取消
   dm.ADO60.Post;

    with dm.ADOQuery1 do
    begin
     close;                  //记录销售订单状态更改(日志文件)
     sql.Clear;
     sql.Add('insert into data0318 (SALES_ORDER_PTR,TRANS_TYPE,TRANS_DESCRIPTION,');
     sql.Add('FROM_string,TO_string,USER_PTR,TRANS_DATE,PROGRAM_SOURCE,file_number)');
     sql.Add('values ('+dm.ADO60rkey.AsString+',10,''更改销售订单状态为缓暂'',');
     sql.Add(''''+v_state+''','''+dm.ADO60v_status.Value+''','+rkey73+',');
     sql.add('getdate(),109,'''+trim(edit_note.Edit1.Text)+''')');
     ExecSQL;
    end;

   with dm.ado06 do
    begin
     close;
     sql.Delete(sql.Count-2);
     sql.Insert(sql.Count-1,'and (Data0006.PROD_STATUS <= 4)');
     open;
     while not eof do
      begin
       if dm.ado06PROD_STATUS.Value=4 then
        with dm.ADOQuery2 do
         begin
          close;
          sql.Clear;
          sql.Text:='insert into data0117(Source_ptr,Source_Type,Empl_ptr,Tdate,Action,Remark) '+
           ' values ('+dm.ado06RKEY.AsString+',2,'+User_ptr+',getdate(),1,'+QuotedStr('订单更改暂缓导致外发工单暂缓')+')';
          ExecSQL;
         end
       else
        with dm.ADOQuery2 do
        begin
         close;
         sql.Clear;
         sql.Text:='insert into data0117(Source_ptr,Source_Type,Empl_ptr,Tdate,Action,Remark) '+
          ' values ('+dm.ado06rkey.AsString+',2,'+User_ptr+',getdate(),1,'+QuotedStr('订单更改暂缓导致工单暂缓')+')';
         ExecSQL;
        end;

       edit;
       dm.ado06ENGG_STATUS.Value:=dm.ado06PROD_STATUS.Value;
       if dm.ado06PROD_STATUS.Value=2 then
        dm.ado06PROD_STATUS.Value:=102
       else
        dm.ado06PROD_STATUS.Value:=103;
       post;
       next;
      end;
     close;
    end;
  end;
finally
 edit_note.Free;
end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
  n1.Enabled:=true;    //查看将要修改的WO
  n9.Enabled:=true;   //查看SO详情
  n20.Enabled:=true;  //更改产品版本
//  n21.Enabled:=true; //更改交货数量
  n10.Enabled:=false;

case dm.ADO60status.Value of
 1,6:      //有效
  begin
   n8.Enabled:=true;     //取消
  end;
 2: //暂缓
  begin
   n8.Enabled:=false;     //取消
   n10.Enabled:=true;   //起动
   n20.Enabled:=false;
//   n21.Enabled:=false;
  end;
 5:
  begin
   n8.Enabled:=false;
   n10.Enabled:=true;
   n20.Enabled:=false;
//   n21.Enabled:=false;
  end
 else
  begin
   n8.Enabled:=false;
   n10.Enabled:=false;
   n1.Enabled:=false;    //查看将要修改的WO
   n9.Enabled:=false;    //查看SO详情
   n20.Enabled:=false;   //更改产品型号
//   n21.Enabled:=false;   //更改交货数量
  end;
end;

end;

procedure TForm1.N10Click(Sender: TObject);
var
 v_state:string;
begin
if (strtoint(vprev)<>4) then
 messagedlg('对不起,您本程序该功能的权限!',mtinformation,[mbok],0)
else 
if messagedlg('重新起动订单将重新起动工作单您确定?',mtConfirmation,[mbyes,mbno],0)=mryes then
try
 edit_note:=tedit_note.Create(application);
 edit_note.Label9.Caption:=' 文件号/重新启动原因:';
 edit_note.iMenu:=1;//重起
//20170209tang修改销售记录本取60.
  with dm.ADOQuery5 do
  begin
    if active=true then active:=false;
    sql.Clear;
    sql.Text:='select RemarkSO from data0060 where Rkey='+dm.ADO60rkey.AsString;
    active:=true;
    if not isempty then
      edit_note.Memo1.Lines.Add(fieldbyname('RemarkSO').AsString);
  end;
// with dm.ADOS6011 do
//  begin
//   close;
//   Parameters[2].Value:=dm.ADO60rkey.Value;
//   open;
//   if not isempty then edit_note.Memo1.Text := dm.ADOS6011memo_text.Value;
//  end;
  if edit_note.ShowModal=mrok then
  begin
    if (not dm.ADOQuery5.IsEmpty) and (trim(edit_note.Memo1.Text)<>'') then
    begin             //原记录有记事本而且修改了
      dm.ADOQuery5.Edit;
      dm.ADOQuery5.fieldbyname('RemarkSO').asstring:=edit_note.Memo1.Lines.Text;
      dm.ADOQuery5.Post;
    end;
//end 20170209tang

//   if (not dm.ados6011.IsEmpty) and (trim(edit_note.Memo1.Text)<>'') then
//    begin             //原记录有记事本而且修改了
//     dm.ados6011.Edit;
//     dm.ADOS6011memo_text.Value := edit_note.Memo1.Text;
//     dm.ados6011.Post;
//    end
//   else
//    if (not dm.ados6011.IsEmpty) and (trim(edit_note.Memo1.Text)='') then   //如果原记录有记事本但被删除了
//     dm.ados6011.Delete
//    else
//     if (dm.ados6011.IsEmpty) and  (trim(edit_note.memo1.Text)<>'') then    //如果原记录没有记事本，但新增了记事本
//      begin
//       dm.ados6011.Append;
//       dm.ados6011file_pointer.Value:=dm.ADO60rkey.Value;
//       dm.ados6011source_type.Value:=60;
//       dm.ADOS6011memo_text.Value := edit_note.Memo1.Text;
//       dm.ados6011.post;
//      end;
//     dm.ADOS6011.Close;
   //准备修改状态及工作单
   v_state:=dm.ADO60v_status.Value;
   dm.ADO60.Edit;
   dm.ADO60status.Value:=1; //有效
   dm.ADO60.Post;
    with dm.ADOQuery1 do
     begin
      close;                  //记录销售订状态更改情况(日志文件)
      sql.Clear;
      sql.Add('insert into data0318 (SALES_ORDER_PTR,TRANS_TYPE,TRANS_DESCRIPTION,');
      sql.Add('FROM_string,TO_string,USER_PTR,TRANS_DATE,PROGRAM_SOURCE,file_number)');
      sql.Add('values ('+dm.ADO60rkey.AsString+',10,''更改销售订单状态为有效'',');
      sql.Add(''''+v_state+''','''+dm.ADO60v_status.Value+''','+rkey73+',');
      sql.add('getdate(),109,'''+trim(edit_note.Edit1.Text)+''')');
      ExecSQL;
     end;

   with dm.ado06 do
    begin
     close;
     sql.Delete(sql.Count-2);
     sql.Insert(sql.Count-1,'and (Data0006.PROD_STATUS = 103 or Data0006.PROD_STATUS = 102)');
     open;
     while not eof do
      begin
       edit;
       dm.ado06PROD_STATUS.Value:=dm.ado06ENGG_STATUS.Value;
       dm.ado06ENGG_STATUS.AsVariant:=null;
       post;
        with dm.ADOQuery2 do
        begin
         close;
         sql.Clear;
         sql.Text:='insert into data0117(Source_ptr,Source_Type,Empl_ptr,Tdate,Action,Remark) '+
          ' values ('+dm.ado06rkey.AsString+',2,'+User_ptr+',getdate(),2,'+QuotedStr('订单更改生效导致工单生效')+')';
         ExecSQL;
        end;
       next;
      end;
     close;
    end;
  end;
finally
 edit_note.Free;
end;
end;

procedure TForm1.N9Click(Sender: TObject);
begin
if not dm.ADO60.IsEmpty then
 begin
  form8:=tform8.Create(application);
  dm.ADOQuery3.Close;
  dm.ADOQuery3.Parameters[1].Value:=dm.ADO60rkey.Value;
  dm.ADOQuery3.Open;
  form8.ShowModal;
  dm.ADOQuery3.Close;
  form8.Free;
 end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  if not app_init_2(dm.ADOConnection1) then
  begin
    showmsg('程序起动失败,请联系管理员!',1);
    application.Terminate;
  end;

//  DM.ADOConnection1.Open;
//  vprev:='4';
//  rkey73:='209';

  self.Caption:=application.Title;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

//  if GetServerRegion(DM.ADOConnection1) = '深圳' then
//  begin
//    ShowMessage('旧版本已经停用，请使用新版系统，请联系ERP，谢谢');
//    application.Terminate;
//  end;


end;

procedure TForm1.FormActivate(Sender: TObject);
begin
if dm.ADOConnection1.Connected then
 begin

   with dm.adoquery1 do
   begin
     close;
     sql.Clear;
     sql.Add('select EMPLOYEE_PTR from data0073');
     sql.Add('where rkey='+rkey73);
     open;
     user_ptr:=fieldbyname('employee_ptr').asstring;
   end;

   dm.ADO60.Close;
   dm.ADO60.Parameters[0].Value:=StrToDate(FormatDateTime('yyyy-mm-dd',getsystem_date(dm.ADOQuery1,1)-15));
   dm.ADO60.Parameters[1].Value:=StrToDate(FormatDateTime('yyyy-mm-dd',getsystem_date(dm.ADOQuery1,1)+1));
   dm.ADO60.Open;
   sql_text:=dm.ADO60.CommandText;
   preColumn:=DBGridEh1.Columns[0];
 end;
end;

procedure TForm1.N20Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起,您只有本程序的只读权限',mtinformation,[mbok],0)
  else
  try
    frmcustpart := tfrmcustpart.Create(application);
    dm.aq192.Open;
    if dm.ADO60qty_plannned.Value > 0 then
      with frmcustpart.ADOQuery1 do
      begin   //SO 已经有投产记录,那么新产品应该允许投产
        close;
        sql.Insert(sql.Count-1,'and (data0025.onhold_planning_flag=0)');
        if (dm.aq192custcoTool.Value <> 'Y') then            //一个产品只允许许销售给同一客户
        sql.Insert(sql.Count-1,'and data0025.customer_ptr='+dm.ADO60CUSTOMER_PTR.asstring);
        open;
      end
    else    
    with frmcustpart.ADOQuery1 do
     begin
      close;
      if (dm.aq192custcoTool.Value <> 'Y') then
        sql.Insert(sql.Count-1,'and data0025.customer_ptr='+dm.ADO60CUSTOMER_PTR.asstring);
      open;
     end;

   if frmcustpart.ADOQuery1.IsEmpty then
     showmessage('请不起,没有找到该客户产品版本不同的型号!')
   else
   if frmcustpart.ShowModal = mrok then
     self.custpart_select();
   dm.aq192.Close;
  finally
    frmcustpart.Free;
  end;
end;

procedure TForm1.N23Click(Sender: TObject);
begin
form5:=tform5.Create(application);
if form5.ShowModal=mrok then
 begin
  dm.ADO60.Close;
  dm.ADO60.Parameters[0].Value:=form5.DTpk1.Date;
  dm.ADO60.Parameters[1].Value:=form5.DTpk2.Date+1;
  dm.ADO60.Open;
 end;
form5.Free;
end;

procedure TForm1.N25Click(Sender: TObject);
var
 rkey60:integer;
begin
rkey60:=dm.ADO60rkey.Value;
dm.ADO60.Close;
dm.ADO60.Open;
if rkey60>0 then dm.ADO60.Locate('rkey',rkey60,[]);
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  DM.ADO60.Close;
  DM.ADO60.Open;
end;

procedure TForm1.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if dm.ADO60status.Value=5 then
  DBGridEh1.Canvas.Font.Color := clBlue;
  DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm1.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(dm.ado60.CommandText);
end;

procedure TForm1.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if Column.Title.SortMarker=smUpEh then
  begin
    DM.ADO60.IndexFieldNames:=Column.FieldName+' DESC';
    Column.Title.SortMarker:=smDownEh;
  end
  else
  begin
    dm.ADO60.IndexFieldNames:=Column.FieldName;
    Column.Title.SortMarker:=smUpEh;
  end;
  if Column.Tag<>1 then
  begin
  if preColumn.FieldName<>Column.FieldName then
  begin
    Label1.Caption:=Column.Title.Caption;
    Column.Title.Color:=clRed;
    preColumn.Title.Color:=clBtnFace;
    preColumn:=Column;
    Edit1.SetFocus;
  end;
  end;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  if Trim(Edit1.Text)<>'' then
    DM.ADO60.Filter:=preColumn.FieldName+' like ''%'+trim(Edit1.Text)+'%'''
  else
    DM.ADO60.Filter:='';
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var
  i:Byte;
begin
  Frm_Search:=TFrm_Search.Create(Application);
  Frm_Search.dtpk1.Date:=dm.ADO60.Parameters[0].Value;
  Frm_Search.dtpk2.Date:=dm.ADO60.Parameters[1].Value;
  if Frm_Search.ShowModal=mrok then
  begin
    with DM.ADO60 do
    begin
      Close;
      CommandText:=sql_text;

      for i := 1 to Frm_Search.SGrd1.RowCount-2 do
        CommandText:=CommandText+Frm_Search.SGrd1.Cells[2,i];

      Parameters[0].Value:=Frm_Search.dtpk1.Date;
      Parameters[1].Value:=Frm_Search.dtpk2.Date;
      Open;
    end;
  end;
end;



procedure TForm1.N2Click(Sender: TObject);
begin
   if not dm.ADO60.IsEmpty then
 begin
  form3:=tform3.Create(application);
  dm.qry1.Close;
  dm.qry1.Parameters[0].Value:=dm.ADO60rkey.Value;
  dm.qry1.Open;

  dm.qry2.Close;
  dm.qry2.Parameters[0].Value:=dm.ADO60rkey.Value;
  dm.qry2.Open;



  form3.ShowModal;
  dm.qry1.Close;
  form3.Free;
 end;
end;

end.
