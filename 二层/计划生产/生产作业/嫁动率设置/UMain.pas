unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ADODB, Grids, DBGridEh, StdCtrls, Buttons, Menus,
  ComCtrls;

type
  TFrmMain = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    ds1: TDataSource;
    qry_Main: TADOQuery;
    btn_quit: TBitBtn;
    btn_refresh: TBitBtn;
    lbl_field: TLabel;
    edt_value: TEdit;
    atncfld_Mainrkey: TAutoIncField;
    strngfld_MainCName: TStringField;
    intgrfld_MainTTime: TIntegerField;
    pm_Main: TPopupMenu;
    N_Add: TMenuItem;
    N_edit: TMenuItem;
    n_del: TMenuItem;
    pgc1: TPageControl;
    ts1: TTabSheet;
    dbgrdh1: TDBGridEh;
    ts2: TTabSheet;
    dbgrdh2: TDBGridEh;
    ts3: TTabSheet;
    dbgrdh3: TDBGridEh;
    pm_Process: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem3: TMenuItem;
    pm_machine: TPopupMenu;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    qry_process: TADOQuery;
    ds2: TDataSource;
    ds3: TDataSource;
    qry_machine: TADOQuery;
    intgrfldqry1_processCID: TIntegerField;
    intgrfldqry1_processPID: TIntegerField;
    intgrfld_machineCID: TIntegerField;
    strngfld_machineMName: TStringField;
    strngfldqry1_processdept_name: TStringField;
    strngfldqry1_processdept_code: TStringField;
    fltfld_MainWARate: TFloatField;
    procedure dbgrdh1TitleClick(Column: TColumnEh);
    procedure edt_valueChange(Sender: TObject);
    procedure N_AddClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_quitClick(Sender: TObject);
    procedure btn_refreshClick(Sender: TObject);
    procedure N_editClick(Sender: TObject);
    procedure n_delClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgrdh2TitleClick(Column: TColumnEh);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure qry_MainAfterScroll(DataSet: TDataSet);
    procedure dbgrdh3TitleClick(Column: TColumnEh);
  private
    { Private declarations }
     field_name,field_name2,field_name3  :  string;
    PreColumn,PreColumn2,PreColumn3: TColumnEh;
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation
         uses udm, common, UDetail, UMachineDetail, UPDetail;
{$R *.dfm}

procedure TFrmMain.dbgrdh1TitleClick(Column: TColumnEh);
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


  if   pgc1.ActivePageIndex=0 then
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
  end
  else if   pgc1.ActivePageIndex=1 then
  begin
    qry_process.Filtered:=false;
  if qry_process.FieldByName(field_name2).FieldKind = fkCalculated then  exit;
  if qry_process.FieldByName(field_name2).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(edt_value.text) <> '' then
    begin
      if qry_process.FieldByName(field_name2).DataType in  [ftString, ftWideString]  then
        qry_process.Filter:=field_name2 + ' like ''%' + trim(edt_value.text) + '%'' ' //+ statussql
      else if qry_process.FieldByName(field_name2).DataType in  [ftSmallint, ftInteger]  then
        qry_process.Filter:=  field_name2+' >= ' + inttostr(strtointdef(edt_value.text,0));//+ statussql;
    end else
       qry_process.Filter:='';
  end;
  qry_process.Filtered:=true;
  end
  else if   pgc1.ActivePageIndex=2 then
  begin
    qry_machine.Filtered:=false;
  if qry_machine.FieldByName(field_name3).FieldKind = fkCalculated then  exit;
  if qry_machine.FieldByName(field_name3).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(edt_value.text) <> '' then
    begin
      if qry_machine.FieldByName(field_name3).DataType in  [ftString, ftWideString]  then
        qry_machine.Filter:=field_name3 + ' like ''%' + trim(edt_value.text) + '%'' ' //+ statussql
      else if qry_machine.FieldByName(field_name3).DataType in  [ftSmallint, ftInteger]  then
        qry_machine.Filter:=  field_name3+' >= ' + inttostr(strtointdef(edt_value.text,0));//+ statussql;
    end else
       qry_machine.Filter:='';
  end;
  qry_machine.Filtered:=true;
  end;

end;

procedure TFrmMain.N_AddClick(Sender: TObject);
begin
    if (StrToInt(vprev) <> 2) and (StrToInt(vprev) <> 4) then
    begin
      ShowMessage('您的权限不够！');
      Exit;
    end;
    dm.EditOrAdd:=1;

    try
    FrmDetail := TFrmDetail.create(nil);

    FrmDetail.ShowModal;

  
    finally
    begin
     qry_Main.Requery;

    FrmDetail.free;
    end;
    end;
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin

  pgc1.ActivePageIndex:=0;


 if not qry_main.Active then qry_Main.Open;


PreColumn:=dbgrdh1.columns[0];
PreColumn2:=dbgrdh2.columns[0];
PreColumn3:=dbgrdh3.columns[0];


field_name:= dbgrdh1.columns[0].fieldname;
field_name2:= dbgrdh2.columns[0].fieldname;
field_name3:= dbgrdh3.columns[0].fieldname;


dbgrdh1.columns[0].title.Color:=clRed;
dbgrdh2.columns[0].title.Color:=clRed;
dbgrdh3.columns[0].title.Color:=clRed;

dbgrdh1.columns[0].Title.SortMarker:=smUpEh;
dbgrdh2.columns[0].Title.SortMarker:=smUpEh;
dbgrdh3.columns[0].Title.SortMarker:=smUpEh;

qry_main.Sort:=field_name;
qry_process.Sort:=field_name2;
qry_machine.Sort:=field_name3;




end;

procedure TFrmMain.btn_quitClick(Sender: TObject);
begin
close;
end;

procedure TFrmMain.btn_refreshClick(Sender: TObject);
begin
qry_Main.requery;

end;

procedure TFrmMain.N_editClick(Sender: TObject);
begin
  if (StrToInt(vprev) <> 2) and (StrToInt(vprev) <> 4) then
    begin
      ShowMessage('您的权限不够！');
      Exit;
    end;


    dm.EditOrAdd:=2;
    dm.Mrkey:=qry_main.fieldbyname('rkey').asinteger;
    try
    FrmDetail := TFrmDetail.create(nil);
    FrmDetail.ShowModal;

  
    finally
    begin
    qry_Main.Requery;
    FrmDetail.free;
    end;
    end;
end;

procedure TFrmMain.n_delClick(Sender: TObject);
var  ssql: string;
begin

  try
    ssql:='delete from data0578 where  rkey='+inttostr(qry_main.fieldbyname('rkey').asinteger)+' ';
    dm.execsql(dm.qry_temp,ssql);
   except   on e:exception do
   begin
      showmessage('错误：'+e.message);
   end;
   end;
   qry_main.requery;

   
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
// vprev:='4';

    if not App_init_2(DM.con1) then
    begin
      ShowMsg('程序起动失败请联系管理员',1);
      application.Terminate;
      exit;
    end;

   self.Caption:=application.Title;

   


end;

procedure TFrmMain.dbgrdh2TitleClick(Column: TColumnEh);
begin
if qry_process.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    qry_process.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    qry_process.Sort:=Column.FieldName+' DESC';
  end;

  if qry_process.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;

  if (field_name <> column.FieldName) then
  begin
    lbl_field.Caption := column.Title.Caption ;
    field_name2 := column.FieldName ;
    edt_value.SetFocus;
    PreColumn2.Title.Color := clBtnFace;
    Column.Title.Color := clred ;
    PreColumn2 := column ;
  end else
    edt_value.SetFocus;
end;

procedure TFrmMain.MenuItem4Click(Sender: TObject);
begin

  if qry_Main.IsEmpty then  exit;

   if (StrToInt(vprev) <> 2) and (StrToInt(vprev) <> 4) then
    begin
      ShowMessage('您的权限不够！');
      Exit;
    end;
    dm.EditOrAdd:=1;

    try
    FrmMachineDetail := TFrmMachineDetail.create(nil);

    FrmMachineDetail.ShowModal;


    finally
    begin
     qry_machine.Requery;

    FrmMachineDetail.free;
    end;
    end;
end;

procedure TFrmMain.MenuItem5Click(Sender: TObject);
begin

  if qry_machine.IsEmpty then exit;

 if (StrToInt(vprev) <> 2) and (StrToInt(vprev) <> 4) then
    begin
      ShowMessage('您的权限不够！');
      Exit;
    end;

    dm.EditOrAdd:=2;
    dm.Mrkey:=qry_main.fieldbyname('rkey').asinteger;
    try
    FrmMachineDetail := TFrmMachineDetail.create(nil);
     FrmMachineDetail.edt_Name.Text:=qry_machine.fieldbyname('mname').asstring;
    FrmMachineDetail.ShowModal;



    finally
    begin
    qry_machine.Requery;
    FrmMachineDetail.free;
    end;
    end;
end;

procedure TFrmMain.MenuItem6Click(Sender: TObject);
var  ssql: string;
begin

  if qry_machine.IsEmpty then exit;
  
  try
    ssql:='delete from data0580 where  cid='+inttostr(qry_main.fieldbyname('rkey').asinteger)+' and MName= '''+qry_machine.fieldbyname('MName').asstring+''' ';
    dm.execsql(dm.qry_temp,ssql);
   except   on e:exception do
   begin
      showmessage('错误：'+e.message);
   end;
   end;
   qry_machine.requery;

end;

procedure TFrmMain.MenuItem1Click(Sender: TObject);
begin
  
   if qry_Main.IsEmpty then  exit;

   if (StrToInt(vprev) <> 2) and (StrToInt(vprev) <> 4) then
    begin
      ShowMessage('您的权限不够！');
      Exit;
    end;
    dm.EditOrAdd:=1;

    try
    FrmPDetail := TFrmPDetail.create(nil);

    FrmPDetail.ShowModal;


    finally
    begin
     qry_process.Requery;

    FrmPDetail.free;
    end;
    end;
    
end;

procedure TFrmMain.MenuItem2Click(Sender: TObject);
begin

  if qry_process.IsEmpty then exit;

 if (StrToInt(vprev) <> 2) and (StrToInt(vprev) <> 4) then
    begin
      ShowMessage('您的权限不够！');
      Exit;
    end;

    dm.EditOrAdd:=2;
    dm.Mrkey:=qry_main.fieldbyname('rkey').asinteger;
    try
    FrmPDetail := TFrmPDetail.create(nil);
    FrmPDetail.ShowModal;


    finally
    begin
    qry_process.Requery;
    FrmPDetail.free;
    end;
    end;
end;

procedure TFrmMain.MenuItem3Click(Sender: TObject);
var  ssql: string;
begin

  if qry_process.IsEmpty then exit;
  
  try
    ssql:='delete from data0579 where  cid='+inttostr(qry_main.fieldbyname('rkey').asinteger)+' and pid= '+inttostr(qry_process.fieldbyname('PID').asinteger)+'';
    dm.execsql(dm.qry_temp,ssql);
   except   on e:exception do
   begin
      showmessage('错误：'+e.message);
   end;
   end;
   qry_process.requery;

end;

procedure TFrmMain.qry_MainAfterScroll(DataSet: TDataSet);
begin
 with qry_process do
   begin
   close;
   Parameters[0].Value:=qry_main.fieldbyname('rkey').asinteger;
   open;
   end;

  with qry_machine do
   begin
   close;
   Parameters.ParamByName('CID').Value:=qry_main.fieldbyname('rkey').asinteger;
   open;
   end;
end;

procedure TFrmMain.dbgrdh3TitleClick(Column: TColumnEh);
begin
 if qry_machine.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    qry_machine.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    qry_machine.Sort:=Column.FieldName+' DESC';
  end;

  if qry_machine.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;

  if (field_name <> column.FieldName) then
  begin
    lbl_field.Caption := column.Title.Caption ;
    field_name2 := column.FieldName ;
    edt_value.SetFocus;
    PreColumn2.Title.Color := clBtnFace;
    Column.Title.Color := clred ;
    PreColumn2 := column ;
  end else
    edt_value.SetFocus;
end;

end.
