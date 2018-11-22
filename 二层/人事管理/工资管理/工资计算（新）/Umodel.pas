unit Umodel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AppEvnts, Menus, StdCtrls, Grids, DBGrids, Buttons, ExtCtrls,
  DB, ADODB, ComCtrls;

type
  TFrmModel = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    Label_account: TLabel;
    Label1: TLabel;
    btn_Save: TBitBtn;
    btn_ReSet: TBitBtn;
    btn_Del: TBitBtn;
    btn_Add: TBitBtn;
    dbg_fields: TDBGrid;
    edt_FName: TEdit;
    btn_SelField: TBitBtn;
    cbb_account: TComboBox;
    rg_type: TRadioGroup;
    edt_MName: TEdit;
    Panel4: TPanel;
    dbg_model: TDBGrid;
    pm_fields: TPopupMenu;
    DataSource1: TDataSource;
    qry_model: TADOQuery;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    Panel5: TPanel;
    Panel6: TPanel;
    rg_DayShow: TRadioGroup;
    rg_DayImport: TRadioGroup;
    rg_show5: TRadioGroup;
    rg_import5: TRadioGroup;
    rg_Show6: TRadioGroup;
    rg_Import6: TRadioGroup;
    btn_OK: TBitBtn;
    btn_refesh: TBitBtn;
    pm_del: TPopupMenu;
    N_Del: TMenuItem;
    ApplicationEvents1: TApplicationEvents;
    rg5s: TRadioGroup;
    rg5i: TRadioGroup;
    procedure btn_ReSetClick(Sender: TObject);
    procedure cbb_accountSelect(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_AddClick(Sender: TObject);
    procedure btn_DelClick(Sender: TObject);
    procedure btn_refeshClick(Sender: TObject);
    procedure N_DelClick(Sender: TObject);
    procedure btn_OKClick(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure btn_SelFieldClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure item_click(sender: TObject);
    procedure  initSelModel();
  public
    { Public declarations }
  end;

var
  FrmModel: TFrmModel;

   implementation
    uses UDM,common, UMain;

{$R *.dfm}

procedure   TFrmModel.initSelModel();
var
  ssql: string;
   i,j,rkey: integer;
begin
  //选择模版页面init:
  try
     ssql:='select * from salaryaccount';
   dm.OpenQry(dm.qry_temp,ssql);
   if not dm.qry_temp.IsEmpty then 
  for i:=0 to dm.qry_temp.RecordCount-1 do
    begin
     rkey :=  strtoint(dm.qry_temp.FieldByName('rkey').asstring);
     if i=0 then
     begin
         rg_DayShow.Items.Clear;
         rg_DayShow.Items.Add('无');
         rg_DayImport.Items.Clear;
         rg_DayImport.Items.Add('无');
         rg_DayShow.Tag := rkey;
         rg_DayShow.Caption := dm.qry_temp.FieldByName('accountname').asString+'展示';
         rg_DayImport.Tag := rkey;
         rg_DayImport.Caption := dm.qry_temp.FieldByName('accountname').asString+'导入';
         ssql :=' select distinct model_name,[type] from '+
                               ' employeesalary_rpt_model '+
                               ' where accountid='+inttostr(rkey);
        dm.OpenQry(dm.qry_temp2,ssql);

       if not dm.qry_temp2.isempty then 
        for j:=0 to dm.qry_temp2.RecordCount-1 do
        begin
          if dm.qry_temp2.FieldByName('type').AsInteger=0 then
            rg_DayShow.Items.Add(dm.qry_temp2.FieldByName('model_name').AsString)
          else
            rg_DayImport.Items.Add(dm.qry_temp2.FieldByName('model_name').AsString) ;
          dm.qry_temp2.Next;
        end;


     end;
     if i=1 then
     begin
         rg_show5.Items.Clear;
         rg_show5.Items.Add('无');
         rg_import5.Items.Clear;
         rg_import5.Items.Add('无');
         rg_show5.Tag := rkey;
         rg_show5.Caption := dm.qry_temp.FieldByName('accountname').asString+'展示';
         rg_import5.Tag := rkey;
         rg_import5.Caption := dm.qry_temp.FieldByName('accountname').asString+'导入';
         ssql :=' select distinct model_name,[type] from '+
                               ' employeesalary_rpt_model '+
                               ' where accountid='+inttostr(rkey);
         dm.OpenQry(dm.qry_temp2,ssql);
         if not dm.qry_temp2.isempty then
        for j:=0 to dm.qry_temp2.RecordCount-1 do
        begin
          if dm.qry_temp2.FieldByName('type').AsInteger=0 then
            rg_show5.Items.Add(dm.qry_temp2.FieldByName('model_name').AsString)
          else
            rg_import5.Items.Add(dm.qry_temp2.FieldByName('model_name').AsString) ;
          dm.qry_temp2.Next;
        end;
        dm.qry_temp2.Close;
     end;
     if i=2 then
     begin
         rg_Show6.Items.Clear;
         rg_Show6.Items.Add('无');
         rg_Import6.Items.Clear;
         rg_Import6.Items.Add('无');
         rg_Show6.Tag := rkey;
         rg_Show6.Caption := dm.qry_temp.FieldByName('accountname').asString+'展示';
         rg_Import6.Tag := rkey;
         rg_Import6.Caption := dm.qry_temp.FieldByName('accountname').asString+'导入';

        ssql :=' select distinct model_name,[type] from '+
                               ' employeesalary_rpt_model '+
                               ' where accountid='+inttostr(rkey);
        dm.OpenQry(dm.qry_temp2,ssql);
        if not dm.qry_temp2.isempty then 
        for j:=0 to dm.qry_temp2.RecordCount-1 do
        begin
          if dm.qry_temp2.FieldByName('type').AsInteger=0 then
            rg_Show6.Items.Add(dm.qry_temp2.FieldByName('model_name').AsString)
          else
            rg_Import6.Items.Add(dm.qry_temp2.FieldByName('model_name').AsString) ;
          dm.qry_temp2.Next;
        end;
        dm.qry_temp2.Close;


     end;
     if i=3 then   //月薪5
     begin
         rg5s.Items.Clear;
         rg5S.Items.Add('无');
         rg5i.Items.Clear;
         rg5i.Items.Add('无');
         rg5s.Tag := rkey;
         rg5s.Caption := dm.qry_temp.FieldByName('accountname').asString+'展示';
         rg5i.Tag := rkey;
         rg5i.Caption := dm.qry_temp.FieldByName('accountname').asString+'导入';
         ssql :=' select distinct model_name,[type] from '+
                               ' employeesalary_rpt_model '+
                               ' where accountid='+inttostr(rkey);
         dm.OpenQry(dm.qry_temp2,ssql);
         if not dm.qry_temp2.isempty then
        for j:=0 to dm.qry_temp2.RecordCount-1 do
        begin
          if dm.qry_temp2.FieldByName('type').AsInteger=0 then
            rg5s.Items.Add(dm.qry_temp2.FieldByName('model_name').AsString)
          else
            rg5i.Items.Add(dm.qry_temp2.FieldByName('model_name').AsString) ;
          dm.qry_temp2.Next;
        end;
        dm.qry_temp2.Close;
     end;


     dm.qry_temp.Next;
    end;


  dm.qry_temp.Close;
  rg_DayShow.ItemIndex :=0 ;
  rg_DayImport.ItemIndex :=0 ;
  rg_show5.ItemIndex :=0 ;
  rg_Show6.ItemIndex :=0 ;
  rg_import5.ItemIndex :=0 ;
  rg_Import6.ItemIndex :=0 ;
   rg5i.ItemIndex :=0 ;
  rg5s.ItemIndex :=0 ;

 except on e:exception do
 begin
 ShowMessage('错误：'+e.Message);
 exit;
 end;
 end;

end;


procedure TFrmModel.btn_ReSetClick(Sender: TObject);
begin
dbg_fields.Columns.clear;
end;

procedure TFrmModel.cbb_accountSelect(Sender: TObject);
var
  i:integer;
  ssql: string;
  item: TMenuItem;
begin
 if cbb_account.Text= '' then
   begin
    showmessage('请选择帐套');
    exit;
   end;


    pm_fields.Items.Clear;
    i:=integer(cbb_account.Items.Objects[cbb_account.ItemIndex]);
    dm.qry_temp.SQL.Clear;
    if rg_Type.ItemIndex=0 then
    ssql :=
    ' select datafield,itemname from  dbo.DesignSalaryItem '+
    ' where accountid='+inttostr(i)+
    ' order by itemindex '
    else
       ssql :=
    ' select datafield,itemname from  dbo.DesignSalaryItem '+
    ' where accountid='+inttostr(i)+ ' and datasourcetype=0 '+
    //0是数值，1是公式，2是固定值
    ' order by itemindex ' ;
     dm.openqry(dm.qry_temp,ssql);

    for i:=0 to dm.qry_temp.RecordCount-1 do
      begin
       item := TmenuItem.Create(self) ;
       item.Caption := dm.qry_temp.FieldByName('itemname').asString;
       item.OnClick := item_click ;
       pm_fields.Items.Add(item) ;
       dm.qry_temp.Next;
      end;
end;

procedure TFrmModel.item_click(sender: TObject);
begin
  edt_FName.Text := (sender as tmenuItem).Caption;
end;


procedure TFrmModel.btn_SaveClick(Sender: TObject);
var
   i:integer;
   ssql:  string;
begin

if dbg_fields.Columns[0].Title.caption='' then
begin
 ShowMessage('请录入模版资料！');
 Exit;
end;

if Trim(edt_MName.text)='' then
begin
 ShowMessage('请录入模版名称！');
 edt_MName.SetFocus;
 Exit;
end;

 try
    ssql := 'select * from employeesalary_rpt_model where model_name='
                        + quotedStr(Trim(edt_MName.Text)) ;
    dm.openqry(dm.qry_temp,ssql);

    if dm.qry_temp.RecordCount>0   then
      begin
       showmessage('模板名称不能重复');
       exit;
      end;


  for i := 0 to dbg_fields.Columns.Count - 1 do
  begin
     ssql := 'insert into employeesalary_rpt_model    '+
       ' values ('+ quotedStr(edt_MName.Text)+','
       + QuotedStr(dbg_fields.Columns[i].Title.Caption)+','
       + #39+'F'+#39+','
       +IntToStr(i) +','
       +inttostr(integer(cbb_account.Items.Objects[cbb_account.ItemIndex]))+','
       +inttostr(rg_type.ItemIndex)
       +' )';
   dm.execsql(dm.qry_temp,ssql);

    ssql := ' update   employeesalary_rpt_model   '+       //更新英文字段名
       ' set datafield_f=b.datafield from '+
       ' employeesalary_rpt_model a join DesignSalaryItem b '+
       ' on a.datafield_name=b.itemname and a.accountid=b.accountid '+
       ' where a.datafield_f= '+#39+'F'+#39 ;
       dm.execsql(dm.qry_temp,ssql);
    end;

  edt_MName.Clear;

 qry_model.requery;
 
 except on e:exception do
 begin
 ShowMessage('错误：'+e.Message);
 exit;
 end;
 end;


end;

procedure TFrmModel.btn_AddClick(Sender: TObject);
var
  ssql: string;
begin
 if ((strtoint(vprev)=1)or(strtoint(vprev)=3)) then
  begin
    showmessage('没有操作权限');
    exit;
  end;

 if cbb_account.Text='' then
 begin
 ShowMessage('请先选择账套！');
 cbb_account.setfocus;
 Exit;
 end;
  if Trim(edt_MName.Text)='' then
 begin
 ShowMessage('请先录入模版名称！');
 edt_MName.SetFocus;
 Exit;
 end;

 if Trim(edt_FName.Text)='' then
 begin
 ShowMessage('请选择字段,然后按+号按钮。');
 edt_FName.SetFocus;
 Exit;
 end;

   with   dbg_fields.Columns.Add   do
  begin
    Title.Caption := Trim(edt_FName.Text);
    Visible := True;
    Width := 100;
  end;
  edt_FName.clear;



end;

procedure TFrmModel.btn_DelClick(Sender: TObject);
begin
   dbg_fields.Columns.Delete(dbg_fields.Columns.Count - 1);
end;

procedure TFrmModel.btn_refeshClick(Sender: TObject);
begin
initSelModel;
end;

procedure TFrmModel.N_DelClick(Sender: TObject);
var ssql : string;
begin

if  qry_model.IsEmpty then exit;

 try
 ssql:= 'delete from  employeesalary_rpt_model  where  model_name='''+qry_model.fieldByName('model_name').AsString+''' ';

  dm.execsql(dm.qry_temp,ssql);
 except on e:exception do
 begin
 ShowMessage('错误：'+e.Message);
 exit;
 end;
 end;


end;

procedure TFrmModel.btn_OKClick(Sender: TObject);
begin
 frmMain.btn_refresh.Click;
hide;
end;

procedure TFrmModel.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
if   (dbg_model.Focused)   And   (Msg.message   =   WM_MOUSEWHEEL)   then
 begin
          if   Msg.wParam   >   0   then
               SendMessage(dbg_model.Handle,   WM_KEYDOWN,   VK_UP,   0)
             else
                 SendMessage(dbg_model.Handle,   WM_KEYDOWN,   VK_DOWN,   0);
             Handled   :=   True;
 end;
end;

procedure TFrmModel.btn_SelFieldClick(Sender: TObject);
begin
    pm_fields.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TFrmModel.FormCreate(Sender: TObject);
var
  i,rkey:integer;
  item:TMenuItem;
  ssql: string;

begin
  if not qry_model.Active then qry_model.Open;
  // cbb_account页面init begin

  initSelModel;

 try
  cbb_account.Clear;
  ssql:='select * from salaryaccount';
  dm.OpenQry(dm.qry_temp,ssql);

    if not  dm.qry_temp.IsEmpty  then
    begin
    dm.qry_temp.first;
    while  not dm.qry_temp.eof do
    begin
     rkey :=  strtoint(dm.qry_temp.FieldByName('rkey').asstring);
     cbb_account.Items.AddObject(dm.qry_temp.FieldByName('accountname').asString,Tobject(rkey));
     dm.qry_temp.next;
    end;
    end;
  cbb_account.Text := '';

 //页面init end


 except on e:exception do
 begin
 ShowMessage('错误：'+e.Message);
 exit;
 end;
 end;

end;

end.
