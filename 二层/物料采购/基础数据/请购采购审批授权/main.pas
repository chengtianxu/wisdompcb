unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Buttons;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    ADOConnection1: TADOConnection;
    BitBtn1: TBitBtn;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses cse_search,common;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);

begin
 if not app_init_2(self.ADOConnection1) then
  begin
   ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
   application.Terminate;
  end;
 self.Caption:=application.Title;
end;


procedure TForm1.FormShow(Sender: TObject);
begin
if ADOConnection1.Connected then
 begin

 end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 with adoquery1 do
  begin
   close;
   sql.Clear;
   sql.Add('SELECT user_full_name FROM Data0073');
   sql.Add('WHERE RPL_PR_PTR ='+rkey73);
   sql.Add('AND RKEY <>'+rkey73);
   open;
  end;   //查找是否有其它人将请购审批授权给自己

 if adoquery1.IsEmpty then  //如果没有
 try
  form_csi:=tform_csi.Create(application);
  with form_csi.ADOQuery1 do
   begin
    close;
    sql.Insert(sql.Count-1,'and rpl_pr_ptr=rkey');    //被授权的人，没有将权限授给别人
    Parameters[0].Value := strtoint(rkey73);
    Open;
   end;

 if form_csi.ShowModal=mrok then
  begin
   with adoquery2 do
    begin
     close;
     sql.Clear;
     sql.Add('update data0073 set rpl_pr_ptr='+form_csi.ADOQuery1rkey.AsString);
     sql.Add('where rkey='+rkey73);
     ExecSQL;
    end;
   messagedlg('请购单审批授权操作成功!',mtinformation,[mbok],0);
   button2.Enabled := true;
   button1.Enabled := false;
  end
finally
 form_csi.Free;
end
else
 messagedlg('对不起 '+trim(adoquery1.FieldValues['user_full_name'])+'已经将请购单审批授权给您,您不可以再授权给其他人',mtinformation,[mbok],0);
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
with adoquery1 do
 begin
  close;
  sql.Clear;
  sql.Add('SELECT rpl_pr_ptr FROM Data0073');
  sql.Add('where RKEY ='+rkey73);
  open;
 end;               //请购授权了
if adoquery1.FieldValues['rpl_pr_ptr']<>strtoint(rkey73) then
 begin
  button2.Enabled := true;
  button1.Enabled := false;
 end;

with adoquery1 do
 begin
  close;
  sql.Clear;
  sql.Add('SELECT rpl_po_ptr FROM Data0073');
  sql.Add('where RKEY ='+rkey73);
  open;
 end;               //采购授权了
if adoquery1.FieldValues['rpl_po_ptr']<>strtoint(rkey73) then
 begin
  button4.Enabled := true;
  button3.Enabled := false;
 end;

with adoquery1 do
 begin
  close;
  sql.Clear;
  sql.Add('SELECT epiboly_ptr FROM Data0073');
  sql.Add('where RKEY ='+rkey73);
  open;
 end;               //外发授权了
if adoquery1.FieldValues['epiboly_ptr']<>strtoint(rkey73) then
 begin
  button6.Enabled := true;
  button5.Enabled := false;
 end;

with adoquery1 do
 begin
  close;
  sql.Clear;
  sql.Add('SELECT draw_materiel_ptr FROM Data0073');
  sql.Add('where RKEY ='+rkey73);
  open;
 end;               //外发授权了
if adoquery1.FieldValues['draw_materiel_ptr']<>strtoint(rkey73) then
 begin
  button8.Enabled := true;
  button7.Enabled := false;
 end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
   with adoquery2 do
    begin
     close;
     sql.Clear;
     sql.Add('update data0073 set rpl_pr_ptr='+rkey73);
     sql.Add('where rkey='+rkey73);
     ExecSQL;
    end;
   messagedlg('取消请购单审批授权给他人操作成功!',mtinformation,[mbok],0);
   button2.Enabled := false;
   button1.Enabled := true;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
with adoquery1 do
 begin
  close;
  sql.Clear;
  sql.Add('SELECT user_full_name FROM Data0073');
  sql.Add('WHERE RPL_PO_PTR ='+rkey73);
  sql.Add('AND RKEY <>'+rkey73);
  open;
 end;
if adoquery1.IsEmpty then
try
 form_csi:=tform_csi.Create(application);
 with form_csi.ADOQuery1 do
  begin
   close;
   sql.Insert(sql.Count-1,'and rpl_po_ptr=rkey');
   Parameters[0].Value := strtoint(rkey73);
   Open;
  end;
 if form_csi.ShowModal=mrok then
  begin
   with adoquery2 do
    begin
     close;
     sql.Clear;
     sql.Add('update data0073 set rpl_po_ptr='+form_csi.ADOQuery1rkey.AsString);
     sql.Add('where rkey='+rkey73);
     ExecSQL;
    end;
   messagedlg('采购单审批授权操作成功!',mtinformation,[mbok],0);
   button4.Enabled := true;
   button3.Enabled := false;
  end
finally
 form_csi.Free;
end
else
 messagedlg('对不起 '+trim(adoquery1.FieldValues['user_full_name'])+'已经将采购单审批授权给您,您不可以再授权给其他人',mtinformation,[mbok],0);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
   with adoquery2 do
    begin
     close;
     sql.Clear;
     sql.Add('update data0073 set rpl_po_ptr='+rkey73);
     sql.Add('where rkey='+rkey73);
     ExecSQL;
    end;
   messagedlg('取消采购单审批授权给他人操作成功!',mtinformation,[mbok],0);
   button4.Enabled := false;
   button3.Enabled := true;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
with adoquery1 do
 begin
  close;
  sql.Clear;
  sql.Add('SELECT user_full_name FROM Data0073');
  sql.Add('WHERE epiboly_ptr ='+rkey73);
  sql.Add('AND RKEY <> '+rkey73);
  open;
 end;
if adoquery1.IsEmpty then
try
 form_csi:=tform_csi.Create(application);
 with form_csi.ADOQuery1 do
  begin
   close;
   sql.Insert(sql.Count-1,'and epiboly_ptr=rkey');
   Parameters[0].Value := strtoint(rkey73);
   Open;
  end;
 if form_csi.ShowModal=mrok then
  begin
   with adoquery2 do
    begin
     close;
     sql.Clear;
     sql.Add('update data0073 set epiboly_ptr='+form_csi.ADOQuery1rkey.AsString);
     sql.Add('where rkey='+rkey73);
     ExecSQL;
    end;
   messagedlg('外发审批授权操作成功!',mtinformation,[mbok],0);
   button6.Enabled := true;
   button5.Enabled := false;
  end
finally
 form_csi.Free;
end
else
 messagedlg('对不起 '+trim(adoquery1.FieldValues['user_full_name'])+
 '已经将外发审批授权给您,您不可以再授权给其他人',mtinformation,[mbok],0);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
 with adoquery2 do
  begin
   close;
   sql.Clear;
   sql.Add('update data0073 set epiboly_ptr='+rkey73);
   sql.Add('where rkey='+rkey73);
   ExecSQL;
  end;
 messagedlg('取消外发审批授权给他人操作成功!',mtinformation,[mbok],0);
 button6.Enabled := false;
 button5.Enabled := true;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
with adoquery1 do
 begin
  close;
  sql.Clear;
  sql.Add('SELECT user_full_name FROM Data0073');
  sql.Add('WHERE draw_materiel_ptr ='+rkey73);
  sql.Add('AND RKEY <> '+rkey73);
  open;
 end;
if adoquery1.IsEmpty then
try
 form_csi:=tform_csi.Create(application);
 with form_csi.ADOQuery1 do
  begin
   close;
   sql.Insert(sql.Count-1,'and draw_materiel_ptr=rkey');
   Parameters[0].Value := strtoint(rkey73);
   Open;
  end;
 if form_csi.ShowModal=mrok then
  begin
   with adoquery2 do
    begin
     close;
     sql.Clear;
     sql.Add('update data0073 set draw_materiel_ptr='+form_csi.ADOQuery1rkey.AsString);
     sql.Add('where rkey='+rkey73);
     ExecSQL;
    end;
   messagedlg('领料审批授权操作成功!',mtinformation,[mbok],0);
   button8.Enabled := true;
   button7.Enabled := false;
  end
finally
 form_csi.Free;
end
else
 messagedlg('对不起 '+trim(adoquery1.FieldValues['user_full_name'])+
 '已经将外发审批授权给您,您不可以再授权给其他人',mtinformation,[mbok],0);
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
 with adoquery2 do
  begin
   close;
   sql.Clear;
   sql.Add('update data0073 set draw_materiel_ptr='+rkey73);
   sql.Add('where rkey='+rkey73);
   ExecSQL;
  end;
 messagedlg('取消领料审批授权给他人操作成功!',mtinformation,[mbok],0);
 button8.Enabled := false;
 button7.Enabled := true;
end;

end.
