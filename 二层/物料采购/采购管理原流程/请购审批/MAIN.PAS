unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, Menus, ExtCtrls;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn3: TBitBtn;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    RadioGroup1: TRadioGroup;
    N7: TMenuItem;
    Panel1: TPanel;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    Panel2: TPanel;
    Splitter1: TSplitter;
    Panel3: TPanel;
    procedure BitBtn1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn3Exit(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N6Click(Sender: TObject);
    function  curr_auth(app: integer):boolean;
    procedure RadioGroup1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    PROCEDURE auth_last();
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
 //  hMapFile: THandle;
//   MapFilePointer: Pointer;
   server_date:tdatetime;
   v_colwidth: array[0..7] of integer;
   procedure send_message(rkey05:integer; pr, empl:string);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
implementation
uses damo, auth_search, req_details, note, auth_info,common;
{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 application.Terminate;
end;

procedure TForm1.N1Click(Sender: TObject);
var
 i:word;
 rkey68,rkey23:integer;
begin
 DateSeparator := '-';
 ShortDateFormat := 'yyyy-mm-dd';

if dbgrid1.SelectedRows.Count>1 then //一次更新多条记录
begin
for i := 0 to dbgrid1.SelectedRows.Count-1 do
begin
 dbgrid1.DataSource.DataSet.Bookmark := dbgrid1.SelectedRows.Items[i];
 if self.curr_auth(dm.AQ0068appd_by.Value) then
 begin
  with dm.ads276 do
   begin
    Close;
    Parameters[1].Value := dm.AQ0068rkey.Value;
    Open;
   end;
  while not dm.ads276.Eof do
   begin
    if (dm.ads276ranking.Value < dm.AQ0068ranking.Value) and (dm.ads276auth_date.AsVariant = null) then
     begin
      messagedlg('因审批顺序不对，审批操作不成功!按顺序重来一次',mtinformation,[mbcancel],0);
      break;
     end
    else
     if dm.ads276ranking.Value-dm.AQ0068ranking.Value=1 then
      begin               //给下一个审批用户赋值
       dm.AQ0068.Edit;
       dm.AQ0068auth_date.value := server_date;            //子表276授权日期
       dm.AQ0068appd_by.Value := dm.ads276user_ptr.Value;  //68 当前审批人
       dm.AQ0068edited_date.Value := server_date;          //审批日期68
       if dm.AQ0068status.Value = 4 then dm.AQ0068status.Value := 2;
       try                     //如是先前是未审批，那幺标识成提交审批
        dm.AQ0068.Post;
       except
        rkey68:=dm.AQ0068rkey.Value;
        rkey23:=dm.ads276user_ptr.Value;
        with dm.ADOQuery1 do       //如果第一审批人授权第二审批人当第二审批人
         begin                     //第二次审批同一pr时出错没有更新appd_by值
          close;                   //出错后单独更新该值
          sql.Clear;
          sql.Add('update data0068');
          sql.Add('set appd_by='+inttostr(rkey23));
          sql.Add(',edited_date='''+datetimetostr(server_date)+'''');
          sql.Add('where rkey='+inttostr(rkey68));
          ExecSQL;
         end;
        dm.AQ0068.Close;
        dm.AQ0068.Open;
       end;
       break;
      end
     else
      if dm.ads276.RecNo = dm.ads276.RecordCount then//如果是最后一条记录
       begin
        dm.AQ0068.Edit;
        dm.AQ0068auth_date.Value := server_date;   // 授权日期 276
        dm.AQ0068edited_date.Value := server_date; //68
        dm.AQ0068status.Value:=3;                  //表示请购已经完成审批68
        try
         dm.AQ0068.Post;
         if dm.AQ0068buyer_ptr.Value>0 then    //发送短信给采购人员
         self.send_message(dm.AQ0068buyer_ptr.Value,dm.AQ0068po_req_number.Value,dm.AQ0068EMPLOYEE_NAME.Value);
        except
         rkey68:=dm.AQ0068rkey.Value;
         with dm.ADOQuery1 do       //如果第一审批人授权第二审批人当第二审批人
         begin                     //第二次审批同一pr时出错没有更新appd_by值
          close;                   //出错后单独更新该值
          sql.Clear;
          sql.Add('update data0068');
          sql.Add('set status=3');
          sql.Add(',edited_date='''+datetimetostr(server_date)+'''');
          sql.Add('where rkey='+inttostr(rkey68));
          ExecSQL;
         end;
         dm.AQ0068.Close;
         dm.AQ0068.Open;
        end;
       end;
     dm.ads276.Next;
   end;
 end;
end;
end
else  //一次审批一条记录
 self.auth_last();
end;

procedure TForm1.Edit1Click(Sender: TObject);
begin
 if edit1.Font.Color = clwindowtext then
  begin
   edit1.Font.Color := clblue;
   edit1.SelectAll;
  end;
end;

procedure TForm1.FormActivate(Sender: TObject);
var
 rpl_pr:integer;
begin
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('SELECT rpl_pr_ptr FROM Data0073');
   sql.Add('where RKEY ='+rkey73);
   open;
   rpl_pr := FieldValues['rpl_pr_ptr'];
  end;
 if rpl_pr<>strtoint(rkey73) then
  begin
   with dm.ADOQuery1 do
    begin
     close;
     sql.Clear;
     sql.Add('SELECT user_full_name FROM Data0073');
     sql.Add('where RKEY ='+inttostr(rpl_pr));
     open;
     messagedlg('您已经将请购单审批授权给用户：'+fieldvalues['user_full_name']+
     ' 请首先取消授权',mtinformation,[mbok],0);
    end;
   application.Terminate;
  end;


 dm.AQ0005.Open;
 dm.AQ0068.Close;
 dm.AQ0068.Parameters.ParamValues['rkey731'] := rkey73;
 dm.AQ0068.Parameters.ParamValues['rkey732'] := rkey73;
 dm.AQ0068.Open;
 with dm.ADOQuery1 do
  begin
   active:=false;
   sql.Clear;
   sql.Add('select v_dt = getdate()');
   active:=true;   //读取系统时间,长日期格式
   server_date := fieldvalues['v_dt'];
  end;

end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
if dm.AQ0068.IsEmpty then
 begin
  n1.Enabled := false;
  n2.Enabled := false;
  n3.Enabled := false;
  n5.Enabled := false;
  n6.Enabled := false;
 end
else
 begin
  if dm.AQ0068auth_date.AsVariant <> null then    //状态为批准
   begin
    n1.Enabled := false;
    n2.Enabled := true;
   end
  else
   begin
    if self.curr_auth(dm.AQ0068appd_by.Value) then
     n1.Enabled := true
    else
     n1.Enabled := false;
    n2.Enabled := false;
   end;
  n3.Enabled := true;
  n5.Enabled := true;
  n6.Enabled := true;
 end;
end;

procedure TForm1.Edit1Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn2') and (activecontrol.Name<>'BitBtn3')
   and (trim(edit1.Text)<>'') then
 try
  form_auth:=tform_auth.Create(application);
  form_auth.Edit1.Text := trim(edit1.Text);
 if comparetext(trim(edit1.text),trim(form_auth.ADOQuery1.Fieldbyname('code').AsString))=0 then
  begin
   edit1.Text := form_auth.ADOQuery1.FieldValues['code'];
   edit1.Font.Color := clwindowtext;
   label2.Caption := form_auth.ADOQuery1.FieldValues['purchase_approv_desc'];
   with dm.AQ0068 do
    begin
     Close;
     sql.Delete(18);
     sql.Insert(18,'data0068.auth_type = :rkey94 AND');
     Parameters.ParamValues['rkey94'] :=form_auth.ADOQuery1.FieldValues['rkey'];
     Open;
    end;
  end
 else
  begin
   messagedlg('授权代码不正确,请重新输入或选择',mtinformation,[mbok],0);
   label2.Caption := '';
   edit1.SetFocus;
  end;
 finally
  form_auth.Free;
 end
else
if (activecontrol.Name<>'BitBtn3') and (activecontrol.Name<>'BitBtn2')
 and (trim(edit1.Text)='') then
begin
  with dm.AQ0068 do
   begin
    Close;
    sql.Delete(18);
    sql.Insert(18,' ');
    Open;
   end;
 label2.Caption:=''
end;
end;

procedure TForm1.BitBtn3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 form_auth:=tform_auth.Create(application);
 form_auth.Edit1.Text := trim(edit1.Text);
 if form_auth.ADOQuery1.IsEmpty then
  begin
   messagedlg('没有找到相关记录!',mtinformation,[mbok],0);
   edit1.SetFocus;
  end
 else
 if form_auth.ShowModal=mrok then
 begin
   with dm.AQ0068 do
    begin
     Close;
     sql.Delete(18);
     sql.Insert(18,'data0068.auth_type = :rkey94 AND');
     Parameters.ParamValues['rkey94'] :=form_auth.ADOQuery1.FieldValues['rkey'];
     Open;
    end;

  edit1.Text := form_auth.ADOQuery1.FieldValues['code'];
  edit1.Font.Color := clwindowtext;
  label2.Caption := form_auth.ADOQuery1.FieldValues['purchase_approv_desc'];
  dbgrid1.SetFocus;
 end
 else
  edit1.SetFocus;
end;

procedure TForm1.BitBtn3Exit(Sender: TObject);
begin
 form_auth.free; //将此语句写在MOUSEDOWN语句中当右键进入返回出错
end;

procedure TForm1.N5Click(Sender: TObject);
var
 i:byte;
begin
 DateSeparator := '-';
 ShortDateFormat := 'yyyy-mm-dd';

try
 form2:=tform2.Create(application);
 if dm.AQ0068flag.Value='S' then
  begin
   form2.Caption := '生产物料采购请求细目';
   form2.DBGrid2.Visible := false;
  end
 else
  begin
   form2.Caption := '非生产物料采购请求细目';
   form2.DBGrid1.Visible := false;
  end;
 if not self.curr_auth(dm.AQ0068appd_by.Value) then
  begin
   form2.Button2.Enabled:=false;
   form2.Button3.Enabled:=false;
  end;
case form2.ShowModal of
 mrok: self.auth_last();
 mrcancel:
 try
  edit_note:=tedit_note.Create(application);
  edit_note.Caption := '采购请求退回记事本:'+dbgrid1.Columns[0].Field.value;
  with dm.AQ106811 do
   begin
    close;
    Parameters[2].Value := dm.AQ0068rkey.Value;
    open;
    if not isempty then
     for i:=1 to 4 do
      edit_note.Memo1.Lines.Add(fieldbyname('note_pad_line_'+inttostr(i)).AsString);
   end;
  if edit_note.ShowModal=mrok then
   begin
    if (not dm.AQ106811.IsEmpty) and (trim(edit_note.Memo1.Text)<>'') then
     begin             //原记录有记事本而且修改了
      dm.AQ106811.Edit;
      for i:=1 to 4 do
       if edit_note.Memo1.Lines.Count >= i then
        dm.AQ106811.fieldbyname('note_pad_line_'+inttostr(i)).asstring := edit_note.Memo1.Lines[i-1]
       else
        dm.AQ106811.fieldbyname('note_pad_line_'+inttostr(i)).asstring:='';
      dm.AQ106811.Post;
     end
    else
     if (not dm.AQ106811.IsEmpty) and (trim(edit_note.Memo1.Text)='') then   //如果原记录有记事本但被删除了
       dm.AQ106811.Delete
     else
      if (dm.AQ106811.IsEmpty) and  (trim(edit_note.memo1.Text)<>'') then    //如果原记录没有本，但新增了记事本
       begin
        dm.AQ106811.Append;
        dm.AQ106811.Fieldvalues['file_pointer'] :=dm.AQ0068.FieldValues['rkey'];
        dm.AQ106811.Fieldvalues['source_type']:=1068;
        for i:=1 to edit_note.memo1.Lines.Count do
        dm.AQ106811.fieldbyname('note_pad_line_'+inttostr(i)).asstring:=edit_note.Memo1.Lines[i-1];
        dm.AQ106811.post;
       end;
    if trim(edit_note.memo1.Text)<>'' then
     begin
      dm.AQ0068.Edit;
      dm.AQ0068status.Value := 4;    //状态设置成未批退回
      dm.AQ0068auth_date.AsVariant := null;
      dm.AQ0068.Post;
     end
    else
     messagedlg('对不起,因退回原因为空导致退回操作不成功!',mtinformation,[mbok],0);
   end;
 finally
  edit_note.free;
 end;
mrabort:;
end;
 finally
  form2.free;
 end;
end;

procedure TForm1.N2Click(Sender: TObject);   //取消审批
begin
if dbgrid1.SelectedRows.Count>1 then
begin
 showmessage('对不起,取消审批不能一次取消多条记录,只能单条记录取消');
end
else
 begin
  dm.AQ0068.Edit;
  dm.AQ0068auth_date.AsVariant := null;   // 取消审批
  dm.AQ0068appd_by.Value := dm.AQ0068user_ptr.Value;
  if (dm.AQ0068status.Value = 3) or (dm.AQ0068status.Value = 4) then
   dm.AQ0068status.Value := 2;   //将请购设置为未完成审批工作
  try
   dm.AQ0068.Post;
   dm.AQ0068.Close;
   dm.AQ0068.Open;   
  except
   messagedlg('取消操作不成功，请再来一次',mtinformation,[mbok],0);
   dm.AQ0068.Close;
   dm.AQ0068.Open;
  end;
 end;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var
 rkey68:integer;
begin
 rkey68:=dm.AQ0068rkey.Value;
 dm.AQ0068.Close;
 dm.AQ0068.Open;
 if rkey68>0 then dm.AQ0068.Locate('rkey',rkey68,[]);
end;

procedure TForm1.DBGrid1DblClick(Sender: TObject);
begin
 if not dm.AQ0068.IsEmpty then
  n5click(sender);
end;

procedure TForm1.N3Click(Sender: TObject);
var
 i:byte;
begin
 try
  edit_note:=tedit_note.Create(application);
  edit_note.Caption := '采购请求退回记事本:'+dbgrid1.Columns[0].Field.value;
  with dm.AQ106811 do
   begin
    close;
    Parameters[2].Value := dm.AQ0068rkey.Value;
    open;
    if not isempty then
    for i:=1 to 4 do
    edit_note.Memo1.Lines.Add(fieldbyname('note_pad_line_'+inttostr(i)).AsString);
   end;
  if edit_note.ShowModal=mrok then
   begin
    if (not dm.AQ106811.IsEmpty) and (trim(edit_note.Memo1.Text)<>'') then
     begin             //原记录有记事本而且修改了
      dm.AQ106811.Edit;
      for i:=1 to 4 do
       if edit_note.Memo1.Lines.Count>=i then
        dm.AQ106811.fieldbyname('note_pad_line_'+inttostr(i)).asstring:=edit_note.Memo1.Lines[i-1]
       else
        dm.AQ106811.fieldbyname('note_pad_line_'+inttostr(i)).asstring:='';
      dm.AQ106811.Post;
     end
    else
     if (not dm.AQ106811.IsEmpty) and (trim(edit_note.Memo1.Text)='') then   //如果原记录有记事本但被删除了
       dm.AQ106811.Delete
     else
      if (dm.AQ106811.IsEmpty) and  (trim(edit_note.memo1.Text)<>'') then    //如果原记录没有本，但新增了记事本
       begin
        dm.AQ106811.Append;
        dm.AQ106811.Fieldvalues['file_pointer'] :=dm.AQ0068.FieldValues['rkey'];
        dm.AQ106811.Fieldvalues['source_type']:=1068;
        for i:=1 to edit_note.memo1.Lines.Count do
        dm.AQ106811.fieldbyname('note_pad_line_'+inttostr(i)).asstring:=edit_note.Memo1.Lines[i-1];
        dm.AQ106811.post;
       end;
    if trim(edit_note.memo1.Text)<>'' then
     begin
      dm.AQ0068.Edit;
      dm.AQ0068status.Value := 4;    //状态设置成未批退回
      dm.AQ0068auth_date.AsVariant := null;
      dm.AQ0068.Post;
     end
    else
     messagedlg('对不起,因退回原因为空导致退回操作不成功!',mtinformation,[mbok],0);
   end;
 finally
  edit_note.free;
 end;
end;

procedure TForm1.FormCreate(Sender: TObject);

begin
if not app_init_2(dm.ADOConnection1) then
 begin
  showmsg('程序启动失败,请与管理员联系!',1);
  application.Terminate;
 end;
  self.Caption:=application.Title;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
end;

procedure TForm1.FormShow(Sender: TObject);
var
 i:byte;
begin
 for i:=0 to 7 do
  self.v_colwidth[i]:=dbgrid1.Columns[i].Width;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
 try
  form3 := tform3.Create(application);
  dm.ads276.Close;
  dm.ads276.Parameters[1].Value := dm.AQ0068rkey.Value;
  dm.ads276.Open;
  form3.ShowModal;
 finally
  form3.Free;
  dm.ads276.Close;
 end;
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
 case radiogroup1.ItemIndex of
 0:begin
   with dm.AQ0068 do
    begin
     Close;
     sql.Delete(20);
     sql.Add('and (data0068.appd_by IN (SELECT rkey FROM data0073 WHERE rpl_pr_ptr = :rkey732))');
     Parameters.ParamValues['rkey731'] := rkey73;
     Parameters.ParamValues['rkey732'] := rkey73;
     Open;
    end;
   end;
 1:begin
   with dm.AQ0068 do
    begin
     Close;
     sql.Delete(20);
     sql.Add('');
     Parameters.ParamValues['rkey731'] := rkey73;
     Open;
    end;
   end;
 end;
end;

procedure TForm1.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
 if dm.AQ0068status.Value=4 then
  DBGrid1.Canvas.Font.Color := clBlue;
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key = 13) and  (not dm.AQ0068.IsEmpty) then
 n5click(sender);
if (chr(key)='S') and (ssalt in shift) then
  showmessage(dm.AQ0068.SQL.Text);
end;

procedure TForm1.DBGrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 if button = mbRight then
  dbgrid1.SetFocus;
end;

function  Tform1.curr_auth(app: integer):boolean;
begin
curr_auth:=false;
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select rkey from data0073');
   sql.Add('where rpl_pr_ptr ='+rkey73);
   open;
  end;
 while not dm.ADOQuery1.Eof do
  begin
   if dm.ADOQuery1.FieldValues['rkey']=app then
    begin
     curr_auth:=true;
     break;
    end;
   dm.ADOQuery1.Next;
  end;
end;

procedure TForm1.auth_last;
var
 rkey68,rkey23:integer;
begin
if self.curr_auth(dm.AQ0068appd_by.Value) then //如果系统用户是当前审批用户
begin
 with dm.ads276 do
  begin
   Close;
   Parameters[1].Value := dm.AQ0068rkey.Value;
   Open;
  end;
 while not dm.ads276.Eof do
  begin                      //如果在当前系统用户之前有没有审批的用户
   if (dm.ads276ranking.Value<dm.AQ0068ranking.Value) and (dm.ads276auth_date.AsVariant=null)  then
    begin
     messagedlg('因审批顺序不对，审批操作不成功!按顺序重来一次',mtinformation,[mbcancel],0);
     break;
    end
   else
    if dm.ads276ranking.Value - dm.AQ0068ranking.Value = 1 then
     begin               //给下一个审批用户赋值
      dm.AQ0068.Edit;
      dm.AQ0068auth_date.value := server_date;   // 授权日期 276
      dm.AQ0068appd_by.Value := dm.ads276user_ptr.Value;  //68
      dm.AQ0068edited_date.Value := server_date;   //最后审批日期68
      if dm.AQ0068status.Value=4 then dm.AQ0068status.Value:=2;//如果该单是退回的状态那  标识为审批状态
       try
        dm.AQ0068.Post;
       except
        rkey68:=dm.AQ0068rkey.Value;
        rkey23:=dm.ads276user_ptr.Value;
        with dm.ADOQuery1 do       //如果第一审批人授权第二审批人当第二审批人
         begin                     // 第二次审批同一pr时出错没有更新appd_by值
          close;                   //出错后单独更新该值
          sql.Clear;
          sql.Add('update data0068');
          sql.Add('set appd_by='+inttostr(rkey23));
          sql.Add(',edited_date='''+datetimetostr(server_date)+'''');
          sql.Add('where rkey='+inttostr(rkey68));
          ExecSQL;
         end;
        dm.AQ0068.Close;
        dm.AQ0068.Open;
       end;
      break;
     end
    else
     if dm.ads276.RecNo = dm.ads276.RecordCount then//如果是最后一条记录
      begin
       dm.AQ0068.Edit;
       dm.AQ0068auth_date.value := server_date;  // 授权日期     276
       dm.AQ0068edited_date.Value := server_date;   //最后审批日期68
       dm.AQ0068status.Value := 3;                  //表示请购已经完成审批
       try
        dm.AQ0068.Post;
        if dm.AQ0068buyer_ptr.Value>0 then    //发送短信给采购人员
        self.send_message(dm.AQ0068buyer_ptr.Value,dm.AQ0068po_req_number.Value,dm.AQ0068EMPLOYEE_NAME.Value);
       except
        rkey68:=dm.AQ0068rkey.Value;
        with dm.ADOQuery1 do       //如果第一审批人授权第二审批人当第二审批人
         begin                     //第二次审批同一pr时出错没有更新appd_by值
          close;                   //出错后单独更新该值
          sql.Clear;
          sql.Add('update data0068');
          sql.Add('set status=3');
          sql.Add(',edited_date='''+datetimetostr(server_date)+'''');
          sql.Add('where rkey='+inttostr(rkey68));
          ExecSQL;
         end;
        dm.AQ0068.Close;
        dm.AQ0068.Open;
       end;
      end;
    dm.ads276.Next;
  end;
end;

end;

procedure TForm1.FormResize(Sender: TObject);
var
 i:byte;
begin
for i:=0 to 7 do
  dbgrid1.Columns[i].Width:=v_colwidth[i]+round((dbgrid1.Width-759)*v_colwidth[i]/732);
end;

procedure TForm1.send_message(rkey05:integer; pr, empl:string);
var
 rkey14:integer;
begin

 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select * from data0014 where rkey is null');
   open;
   append;
   fieldvalues['MESSAGE'] := '有一张请购单需要通过您采购,请购编号:'+#13+
                             pr+'请购人员:'+empl;
   fieldvalues['whosend']:= strtoint(rkey73);
   post;
   rkey14:=fieldvalues['rkey'];
  end;

  with dm.adoquery1 do
   begin
    close;
    sql.Clear;
    sql.Text:='insert into data0314 (emp_ptr,d14_ptr) '+
    'SELECT Data0073.RKEY,'+inttostr(rkey14)+' as d14_ptr '+
    'from Data0073 '+
    'where Data0073.EMPLOYEE_PTR='+inttostr(rkey05);
    ExecSQL;
   end;

end;


end.
