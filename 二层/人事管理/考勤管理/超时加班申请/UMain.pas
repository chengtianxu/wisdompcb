unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, ADODB, Grids, DBGridEh, Menus;

type
  TFrmMain = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    lbl_field: TLabel;
    edt_value: TEdit;
    Label4: TLabel;
    lbl_count: TLabel;
    dgh_main: TDBGridEh;
    ds: TDataSource;
    qry_main: TADOQuery;
    btn_quit: TBitBtn;
    btn_refresh: TBitBtn;
    btn_qry: TBitBtn;
    btn_import: TBitBtn;
    btn_Outport: TBitBtn;
    rg_status: TRadioGroup;
    pm_Main: TPopupMenu;
    N_Add: TMenuItem;
    N_edit: TMenuItem;
    n_view: TMenuItem;
    N_audit: TMenuItem;
    n_NoAudit: TMenuItem;
    n_del: TMenuItem;
    qry_mainrkey: TAutoIncField;
    qry_mainemployeeid: TStringField;
    qry_mainYearMonth: TStringField;
    qry_mainAtype: TIntegerField;
    qry_maindays: TFloatField;
    qry_mainstatus: TIntegerField;
    qry_mainOdate: TDateTimeField;
    qry_mainremark: TStringField;
    qry_mainemployeecode: TWideStringField;
    qry_mainchinesename: TWideStringField;
    qry_mainatype2: TStringField;
    qry_mainstatus2: TStringField;
    qry_maindepartmentName: TWideStringField;
    qry_mainondutytime: TDateTimeField;
    qry_maindepartmentid: TAutoIncField;
    N1: TMenuItem;
    procedure dgh_mainTitleClick(Column: TColumnEh);
    procedure edt_valueChange(Sender: TObject);
    procedure rg_statusClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure n_delClick(Sender: TObject);
    procedure N_auditClick(Sender: TObject);
    procedure n_NoAuditClick(Sender: TObject);
    procedure N_AddClick(Sender: TObject);
    procedure btn_OutportClick(Sender: TObject);
    procedure btn_refreshClick(Sender: TObject);
    procedure btn_importClick(Sender: TObject);
    procedure btn_quitClick(Sender: TObject);
    procedure btn_qryClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure pm_MainPopup(Sender: TObject);
  private
    { Private declarations }
     field_name ,mysql,ymsql, statussql:  string;
    PreColumn: TColumnEh;

  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation
       uses UDM,common, UAdd, UImport, Uqry, UEdit;
{$R *.dfm}

procedure TFrmMain.dgh_mainTitleClick(Column: TColumnEh);
begin
  if qry_main.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    qry_main.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    qry_main.Sort:=Column.FieldName+' DESC';
  end;

  if qry_Main.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  
  if (field_name <> column.FieldName) then
  begin
    lbl_field.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edt_value.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred ;
    PreColumn := column ; 
  end else
    edt_value.SetFocus;
end;

procedure TFrmMain.edt_valueChange(Sender: TObject);
begin
   qry_Main.Filtered:=false;
  if qry_Main.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if qry_Main.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(edt_value.text) <> '' then
    begin
      if qry_main.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        qry_main.Filter:=field_name + ' like ''%' + trim(edt_value.text) + '%'' ' //+ statussql
      else if qry_Main.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        qry_Main.Filter:=  field_name+' >= ' + inttostr(strtointdef(edt_value.text,0));//+ statussql;
    end else
       qry_Main.Filter:='';
  end;

  qry_Main.Filtered:=true;
    lbl_count.caption:=IntToStr(qry_main.recordcount);
end;

procedure TFrmMain.rg_statusClick(Sender: TObject);
//var
 //ssql: string;
begin

   if rg_status.itemindex=0 then
    statussql:= ' and  a.status= 0   '
     else  if rg_status.itemindex=1 then
    statussql:=   '  and a.status= 1' ;




   with qry_main do
   begin

     close;
     sql.clear;
     sql.text:=mysql+statussql;
     open;
   end;

    lbl_Count.Caption := inttostr(qry_main.recordcount);

end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
   //
 // rg_status.itemindex:=0 ;


// statussql :=  ' and a.status= 0 ';

  mysql:=qry_main.sql.text;
 ymsql:= ' and yearmonth =(select top 1 checkyearmonth from salarycheck where actived=1) ';


    if rg_status.itemindex=0 then
    statussql:= ' and  a.status= 0   '
     else  if rg_status.itemindex=1 then
    statussql:=   '  and a.status= 1' ;



  //打开要计算工资月份的数据
  btn_refreshClick(sender);

 PreColumn:=dgh_main.columns[0];
field_name:= dgh_main.columns[0].fieldname;
dgh_main.columns[0].title.Color:=clRed;
 dgh_main.columns[0].Title.SortMarker:=smUpEh;
qry_main.Sort:=field_name;



  // rg_status.ItemIndex:=0;

  
   
end;

procedure TFrmMain.n_delClick(Sender: TObject);
var ssql: string;
begin
//
if qry_main.IsEmpty then exit;

 if (StrToInt(vprev) <> 2) and (StrToInt(vprev) <> 4) then
    begin
      ShowMessage('您的权限不够！');
      Exit;
    end;


  if qry_main.FieldByName('status').AsInteger=1 then
    begin
     ShowMessage('已审核不能删除!');
    exit;
    end;

 try
 ssql:=' delete from  overworkapply where  rkey = '+qry_main.fieldbyname('rkey').AsString+' ';
 dm.execsql(dm.qry_temp,ssql);
 qry_main.Requery;
   lbl_count.caption:=IntToStr(qry_main.recordcount);
 except on e:exception do
 begin
 ShowMessage('错误：'+e.Message);
 exit;
 end;
end;


end;

procedure TFrmMain.N_auditClick(Sender: TObject);
var
  ssql: string;
  i: integer;
begin
  if qry_main.IsEmpty then exit;

    if  (StrToInt(vprev) <> 4) then
    begin
      ShowMessage('您的权限不够！');
      Exit;
    end;

  if qry_main.FieldByName('status2').asstring='已审核'  then
  begin
  ShowMessage('已审核');
  Exit;
  end;

 try
  for i:=0 to dgh_main.SelectedRows.Count-1 do
  begin
    qry_main.GotoBookmark(Pointer(dgh_main.SelectedRows.items[i]));
   ssql:= ' update overworkapply set status =1  where  rkey = '+qry_main.fieldbyname('rkey').AsString+' ';
   dm.execsql(dm.qry_temp,ssql);
  end;

  btn_refreshClick(sender);

 except on e:exception do
 begin
 ShowMessage('错误：'+e.Message);
 exit;
 end;
 end;

end;

procedure TFrmMain.n_NoAuditClick(Sender: TObject);
var i :integer;
ssql: string;
begin
 if qry_main.IsEmpty then exit;
 
   if  (StrToInt(vprev) <> 4) then
    begin
      ShowMessage('您的权限不够！');
      Exit;
    end;

  if qry_main.FieldByName('status2').asstring='未审核'  then
  begin
  ShowMessage('还未审核');
  Exit;
  end;

 try
  for i:=0 to dgh_main.SelectedRows.Count-1 do
  begin
    qry_main.GotoBookmark(Pointer(dgh_main.SelectedRows.items[i]));
   ssql:= ' update overworkapply set status =0  where  rkey = '+qry_main.fieldbyname('rkey').AsString+' ';
   dm.execsql(dm.qry_temp,ssql);
  end;
    qry_main.Requery;
 except on e:exception do
 begin
 ShowMessage('错误：'+e.Message);
 exit;
 end;
 end;
end;

procedure TFrmMain.N_AddClick(Sender: TObject);
begin


    case Tmenuitem(Sender).Tag of
   1:
   begin
     if (StrToInt(vprev) <> 2) and (StrToInt(vprev) <> 4) then
    begin
      ShowMessage('您的权限不够！');
      Exit;
    end;

    try
    FrmAdd := TFrmAdd.create(nil);
     frmadd.pflag:=1;
    frmadd.ShowModal;

  
    finally
    FrmAdd.free;
    end;
   end;

   2:
   begin
      if (StrToInt(vprev) <> 2) and (StrToInt(vprev) <> 4) then
    begin
      ShowMessage('您的权限不够！');
      Exit;
    end;
    
    if qry_main.FieldByName('status').AsInteger=1 then
    begin
     ShowMessage('已审核不能编辑!');
    exit;
    end;
     try
     frmedit := Tfrmedit.create(nil);
     frmedit.pflag:=2;
      frmedit.showmodal;
      lbl_count.caption:=IntToStr(qry_main.recordcount);
    finally
    frmedit.free;
    end;
   end;

   3:
   begin
    try
    frmedit :=Tfrmedit.create(nil);
    frmedit.pflag:=3;
    frmedit.ShowModal;  

    finally
    frmedit.free;
    end;

   end;

   end;




end;

procedure TFrmMain.btn_OutportClick(Sender: TObject);
begin
  if qry_main.IsEmpty then exit;
 common.Export_dbGridEH_to_Excel(dgh_main,'超时加班申请');
end;

procedure TFrmMain.btn_refreshClick(Sender: TObject);
begin
 try
   dm.OpenQry(qry_main,mysql+ymsql+statussql) ;
  // showmessage(mysql+ymsql+statussql);

     lbl_Count.Caption := inttostr(qry_main.recordcount);


 except on e:exception do
 begin
 ShowMessage('错误：'+e.Message);
 exit;
 end;
 end;

end;

procedure TFrmMain.btn_importClick(Sender: TObject);
begin
//
 if (StrToInt(vprev) <> 2) and (StrToInt(vprev) <> 4) then
    begin
      ShowMessage('您的权限不够！');
      Exit;
    end;

 try
    FrmImport:=TFrmImport.create(nil);
    FrmImport.showmodal;
    btn_refreshClick(sender);

 finally
   FrmImport.free;
 end;
end;

procedure TFrmMain.btn_quitClick(Sender: TObject);
begin
close;
end;

procedure TFrmMain.btn_qryClick(Sender: TObject);
var
Qrystr: string;
i:Integer;
begin
//
qrystr:='';
  try
   frmQry:=TFrmQry.create(nil);
   if FrmQry.ShowModal=mrok then
   begin
     for i:=0  to FrmQry.sg1.RowCount-2 do
     begin
      qrystr:=qrystr+ frmqry.sg1.Cells[2,i]
     end;
     qry_main.SQL.Text:= mysql+qrystr;
     try

      dm.OpenQry(qry_main,qry_main.SQL.Text);
      except on e: exception do
      begin
      ShowMessage('错误：' +e.Message);
      exit;
      end;
     end;
    end;
  finally
   frmqry.free;
  end;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
 
//vprev:='4';

  if not App_init_2(DM.con1) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
    exit;
  end;

   self.Caption:=application.Title;

end;

procedure TFrmMain.N1Click(Sender: TObject);
begin
      dgh_main.Selection.SelectAll;
end;

procedure TFrmMain.pm_MainPopup(Sender: TObject);
begin
  if qry_main.FieldByName('status2').asstring='已审核'  then
   begin
    self.N_Add.Enabled:=true;
    self.N_edit.Enabled:=false;
    self.n_view.enabled:=true;
    self.n_del.Enabled:=false;
    self.N1.Enabled:=true;
    self.N_audit.Enabled:=false;
    self.N_Noaudit.Enabled:=true;
   end
   else
    begin
    self.N_Add.Enabled:=true;
    self.N_edit.Enabled:=true;
    self.n_view.enabled:=true;
    self.n_del.Enabled:=true;
    self.N1.Enabled:=true;
    self.N_audit.Enabled:=true;
    self.N_Noaudit.Enabled:=false;
   end;



end;

end.

