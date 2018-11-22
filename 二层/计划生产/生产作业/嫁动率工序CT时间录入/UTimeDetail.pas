unit UTimeDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls,
  DB, ADODB;

type
  TFrmTimeDetail = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    lbl_field: TLabel;
    lbl5: TLabel;
    btn1: TBitBtn;
    btn_refresh: TBitBtn;
    btn3: TBitBtn;
    edt_value: TEdit;
    btn4: TBitBtn;
    pm_main: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    btn_import: TBitBtn;
    lbl7: TLabel;
    cbb_craft: TComboBox;
    pnl3: TPanel;
    pnl4: TPanel;
    dbgrdh1: TDBGridEh;
    qry_main: TADOQuery;
    ds_main: TDataSource;
    atncfld_mainrkey: TAutoIncField;
    intgrfld_mainCID: TIntegerField;
    intgrfld_mainProdNo: TIntegerField;
    strngfld_mainlayer: TStringField;
    strngfld_mainMachine: TStringField;
    intgrfld_mainPID: TIntegerField;
    intgrfld_mainStackNum: TIntegerField;
    intgrfld_mainAMan: TIntegerField;
    dtmfld_mainAdate: TDateTimeField;
    strngfld_mainmanu_part_number: TStringField;
    strngfld_maindept_name: TStringField;
    strngfld_mainuser_full_name: TStringField;
    strngfld_maindept_code: TStringField;
    strngfld_mainCname: TStringField;
    CT2: TMenuItem;
    SCT2: TMenuItem;
    CCT2: TMenuItem;
    lbl1: TLabel;
    btn2: TButton;
    qry_value: TADOQuery;
    qry_temp: TADOQuery;
    lbl2: TLabel;
    intgrfld_mainTCTTIme1: TIntegerField;
    fltfld_mainCTTime1: TFloatField;
    fltfld_mainCTTime2: TFloatField;
    procedure btn1Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn_refreshClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn_importClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure CT1Click(Sender: TObject);
    procedure SCT1Click(Sender: TObject);
    procedure CCT1Click(Sender: TObject);
    procedure dbgrdh1TitleClick(Column: TColumnEh);
    procedure edt_valueChange(Sender: TObject);
    procedure cbb_craftChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CT2Click(Sender: TObject);
    procedure SCT2Click(Sender: TObject);
    procedure CCT2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
     field_name,psql  :  string;
    PreColumn: TColumnEh;
  public
    { Public declarations }
  end;

var
  FrmTimeDetail: TFrmTimeDetail;

implementation
    uses udm, UQry, UAdd,common, UImport;

{$R *.dfm}

procedure TFrmTimeDetail.btn1Click(Sender: TObject);
begin
close;
end;

procedure TFrmTimeDetail.btn5Click(Sender: TObject);
begin
ShowMessage('该功能持续增加');
end;

procedure TFrmTimeDetail.btn_refreshClick(Sender: TObject);
begin
 qry_main.filtered:=false;
// qry_main.Close;
// qry_main.Open;
  with qry_main do
  begin
   close;
   sql.Clear;
   sql.Add(psql);
   Open;
  end;

end;

procedure TFrmTimeDetail.FormShow(Sender: TObject);
var
ssql : string;
begin

  psql:=qry_main.sql.text;

//if not qry_main.Active then qry_main.Open;

   PreColumn:=dbgrdh1.columns[3];
field_name:= dbgrdh1.columns[3].fieldname;
dbgrdh1.columns[3].title.Color:=clRed;
 dbgrdh1.columns[3].Title.SortMarker:=smUpEh;
//qry_main.Sort:=field_name;

  ssql:='select rkey,cname from data0578 order by rkey';
 dm.openqry(dm.qry_temp,ssql);
 if not dm.qry_temp.isempty then
 begin
    with dm.qry_temp do
    begin
     First;
     cbb_craft.Items.Clear;
     while not eof do
     begin
     cbb_craft.Items.AddObject(fieldbyname('cname').AsString,TObject(fieldbyname('rkey').AsInteger));
     Next;
     end;
    end;

 end;




end;

procedure TFrmTimeDetail.btn3Click(Sender: TObject);
begin
if  not qry_main.IsEmpty then
    if MessageDlg('你确定要导出数据吗？',mtInformation, [mbYes,mbNo],0)= mryes then
       Export_dbGridEH_to_Excel(dbgrdh1,'产品CT时间明细');
end;

procedure TFrmTimeDetail.btn4Click(Sender: TObject);
var
 i:integer;
 ssql :string;
begin
  try
 frmQry:=TfrmQry.create(nil);

   try
    if frmQry.ShowModal=mrok then
   begin

    for i:=1 to frmQry.sgrid1.RowCount-2 do
     ssql:=ssql+ frmQry.SGrid1.Cells[2,i]+#13;

     ssql:=psql+ssql;
     //ShowMessage(ssql);
     with qry_main do
     begin
     Close;
     sql.Clear;
     sql.Add(ssql);
     open;
     end;
    end;

   except on e:exception do
   begin
   ShowMessage('错误：'+e.Message);
   exit;
   end;
   end;


 finally
   frmQry.free;
 end;
 
 end;
procedure TFrmTimeDetail.btn_importClick(Sender: TObject);
begin
//ShowMessage('该功能持续增加');
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

procedure TFrmTimeDetail.N2Click(Sender: TObject);
var
  ssql : string;
begin

     if (StrToInt(vprev) <> 2) and (StrToInt(vprev) <> 4) then
    begin
      ShowMessage('您的权限不够！');
      Exit;
    end;


  try
  if qry_main.IsEmpty then     exit;
  ssql:='delete from data0581  where rkey ='+inttostr(qry_main.FieldValues['rkey'])+'  ';
  dm.execsql(dm.qry_temp,ssql);
  qry_main.Requery;
   except on e:exception do
 begin
 ShowMessage('错误：'+e.Message);
 exit;
 end;
 end;

end;

procedure TFrmTimeDetail.N1Click(Sender: TObject);
begin
   if (StrToInt(vprev) <> 2) and (StrToInt(vprev) <> 4) then
    begin
      ShowMessage('您的权限不够！');
      Exit;
    end;


 try
 frmadd :=Tfrmadd.create(nil);
   frmadd.showmodal;
 if frmadd.modalresult=mrok then
    qry_main.requery;
 finally
   frmadd.free;
 end;
 end;

procedure TFrmTimeDetail.CT1Click(Sender: TObject);
var
ssql,str: string;
bk:  TBookmark;
begin
   if qry_main.IsEmpty then exit;
  bk:=qry_main.GetBookmark;
  str:=InputBox('请输入修改后的理论CT时间：','','0');
  ssql:='update data0581 set TCTTIme1='+str+' where rkey='+inttostr(qry_main.FieldValues['rkey'])+'  ';
   qry_main.Requery;
   qry_main.GotoBookmark(bk);
end;

procedure TFrmTimeDetail.SCT1Click(Sender: TObject);
var
ssql,str: string;
bk:  TBookmark;
begin
   if qry_main.IsEmpty then exit;
  bk:=qry_main.GetBookmark;
  str:=InputBox('请输入修改后的实际CT时间：','','0');
  ssql:='update data0581 set CTTime1='+str+' where rkey='+inttostr(qry_main.FieldValues['rkey'])+'  ';
   qry_main.Requery;
   qry_main.GotoBookmark(bk); 
end;

procedure TFrmTimeDetail.CCT1Click(Sender: TObject);
var
ssql,str: string;
bk:  TBookmark;
begin

  if qry_main.IsEmpty then exit;
  bk:=qry_main.GetBookmark;
  str:=InputBox('请输入修改后的实际C面CT时间：','','0');
  ssql:='update data0581 set CTTime2='+str+' where rkey='+inttostr(qry_main.FieldValues['rkey'])+'  ';
   qry_main.Requery;
   qry_main.GotoBookmark(bk);
end;

procedure TFrmTimeDetail.dbgrdh1TitleClick(Column: TColumnEh);
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

procedure TFrmTimeDetail.edt_valueChange(Sender: TObject);
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
end;

procedure TFrmTimeDetail.cbb_craftChange(Sender: TObject);
begin

 // qry_main.Filtered:=false;
  qry_main.Filter:=' cid='+inttostr(integer(cbb_craft.Items.Objects[cbb_craft.ItemIndex]))+'';

  qry_main.Filtered:=true;

end;

procedure TFrmTimeDetail.FormCreate(Sender: TObject);
begin
    vprev:='4';
     rkey73:='3023';

  if not App_init_2(DM.con1) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
    exit;
  end;

   self.Caption:=application.Title;
end;

procedure TFrmTimeDetail.CT2Click(Sender: TObject);
var
ssql,str: string;
bk:  TBookmark;
begin
     if (StrToInt(vprev) <> 2) and (StrToInt(vprev) <> 4) then
    begin
      ShowMessage('您的权限不够！');
      Exit;
    end;

   if qry_main.IsEmpty then exit;
   if qry_main.FieldByName('cname').AsString<>'锣房嫁动率'  then
    begin
    showmessage(' '+qry_main.FieldByName('cname').AsString+'没有理论CT时间!');
    exit;
    end;

   try
  bk:=qry_main.GetBookmark;
  str:=InputBox('请输入修改后的理论CT时间:','理论CT时间','-1');
    if str<>'-1' then 
  ssql:='update data0581 set TCTTIme1='+str+' , aman='+rkey73+' , adate= getdate() where rkey='+inttostr(qry_main.FieldValues['rkey'])+'  ';
   dm.execsql(dm.qry_temp,ssql);
   qry_main.Requery;
   qry_main.GotoBookmark(bk);
    except on e:exception do
   begin
   ShowMessage('错误：'+e.Message);
   exit;
   end;
 end;
end;

procedure TFrmTimeDetail.SCT2Click(Sender: TObject);
var
ssql,str: string;
bk:  TBookmark;
begin
    if (StrToInt(vprev) <> 2) and (StrToInt(vprev) <> 4) then
    begin
      ShowMessage('您的权限不够！');
      Exit;
    end;



  try

   if qry_main.IsEmpty then exit;
  bk:=qry_main.GetBookmark;
  str:=InputBox('请输入修改后的实际CT时间:','实际CT时间','-1');
    if str<>'-1' then
  ssql:='update data0581 set CTTime1='+str+' , aman='+rkey73+' , adate= getdate() where rkey='+inttostr(qry_main.FieldValues['rkey'])+'  ';
   dm.execsql(dm.qry_temp,ssql);
   qry_main.Requery;
   qry_main.GotoBookmark(bk);
    except on e:exception do
 begin
 ShowMessage('错误：'+e.Message);
 exit;
 end;
 end;
end;

procedure TFrmTimeDetail.CCT2Click(Sender: TObject);
var
ssql,str: string;
bk:  TBookmark;
begin
    if (StrToInt(vprev) <> 2) and (StrToInt(vprev) <> 4) then
    begin
      ShowMessage('您的权限不够！');
      Exit;
    end;


   if qry_main.FieldByName('cname').AsString<>'镭射嫁动率'  then
   begin
    showmessage(' '+qry_main.FieldByName('cname').AsString+'没有C面CT时间!');
    exit;
    end;
   try
  if qry_main.IsEmpty then exit;
  bk:=qry_main.GetBookmark;
  str:=InputBox('请输入修改后的实际C面CT时间:','','-1');
  if str<>'-1' then 
  ssql:='update data0581 set CTTime2='+str+' , aman='+rkey73+' , adate= getdate()  where rkey='+inttostr(qry_main.FieldValues['rkey'])+'  ';
   dm.execsql(dm.qry_temp,ssql);
   qry_main.Requery;
   qry_main.GotoBookmark(bk);
    except on e:exception do
 begin
 ShowMessage('错误：'+e.Message);
 exit;
 end;
 end;
end;

procedure TFrmTimeDetail.N3Click(Sender: TObject);
//var
//ssql,str: string;
//bk:  TBookmark;
begin
//   if qry_main.IsEmpty then exit;
//   if qry_main.FieldByName('cname').AsString<>'锣房嫁动率'  then
//    begin
//    showmessage(' '+qry_main.FieldByName('cname').AsString+'没有理论CT时间!');
//    exit;
//    end;
//
//   try
//  bk:=qry_main.GetBookmark;
//  str:=InputBox('请输入修改后的:','理论CT时间','-1');
//    if str<>'-1' then 
//  ssql:='update data0581 set stacknum='+str+' where rkey='+inttostr(qry_main.FieldValues['rkey'])+'  ';
//   dm.execsql(dm.qry_temp,ssql);
//   qry_main.Requery;
//   qry_main.GotoBookmark(bk);
//    except on e:exception do
//   begin
//   ShowMessage('错误：'+e.Message);
//   exit;
//   end;
// end;

end;

procedure TFrmTimeDetail.btn2Click(Sender: TObject);
var ssql: string;
begin

    if (StrToInt(vprev) <> 2) and (StrToInt(vprev) <> 4) then
    begin
      ShowMessage('您的权限不够！');
      Exit;
    end;


     if  trim(cbb_craft.Text)='' then
     begin
      ShowMessage('请先选择工艺！');
     exit;
     end;

     if  trim(cbb_craft.Text)='镭射嫁动率' then
     begin
      ShowMessage('镭射工艺没有叠板数！');
     exit;
     end;
     
 try
   dm.con1.BeginTrans;
   screen.cursor:=crhourglass;
   if qry_main.IsEmpty  then exit;
     qry_main.DisableControls;
      qry_main.First;
   while not  qry_main.Eof do
   begin
       if   qry_main.fieldbyname('stacknum').asinteger >0 then
        begin
         qry_main.Next;
         Continue;
         end;
         //更新 叠板数
         with  qry_value do
         begin
           Close;
           parameters.parambyname('rkey').value:= qry_main.fieldbyname('prodno').asinteger;
           parameters.parambyname('rkey2').value:=  qry_main.fieldbyname('pid').asinteger;
           if   trim(cbb_craft.Text)='钻孔嫁动率' then
           parameters.parambyname('pName').value:='钻孔叠板数'
           else if  trim(cbb_craft.Text)='锣房嫁动率' then
           parameters.parambyname('pName').value:='锣板叠板数'
           else
            parameters[2].value:='';
           open;
         end;  
           if  (not qry_value.IsEmpty)  and  (qry_value.FieldByName('parameter_value').value<>'') then
           begin
           ssql:='update data0581 set stacknum='+IntToStr(qry_value.FieldByName('parameter_value').asinteger)+' '+
                 ' where cid='+inttostr(integer(cbb_craft.Items.Objects[cbb_craft.ItemIndex]))+'  and prodno='+inttostr(qry_main.fieldbyname('prodno').asinteger)+' '+
                 ' and pid='+inttostr(qry_main.fieldbyname('pid').asinteger)+' ';
           dm.ExecSql(dm.qry_temp,ssql);
          end;
         if   qry_main.fieldbyname('TCTTime1').asinteger >0 then
          begin
          qry_main.Next;
          Continue;
          end;
        //  更新锣板理论CT时间
        if   trim(cbb_craft.Text)='锣房嫁动率' then
        begin
         with  qry_value do
          begin
           Close;                                             //   qry_main.fieldbyname('manu_part_number').asstring;
           parameters.parambyname('rkey').value:= qry_main.fieldbyname('prodno').asinteger;
           parameters.parambyname('rkey2').value:=  qry_main.fieldbyname('pid').asinteger;

           parameters.parambyname('pName').value:='锣板理论CT时间';
           open;

           if  (not qry_value.IsEmpty) and  (qry_value.FieldByName('parameter_value').value<>'') then
         
           ssql:='update data0581 set TCTTime1='+IntToStr(qry_value.FieldByName('parameter_value').asinteger)+' '+
                 ' where cid='+inttostr(integer(cbb_craft.Items.Objects[cbb_craft.ItemIndex]))+'  and prodno='+inttostr(qry_main.fieldbyname('prodno').asinteger)+' '+
                 ' and pid='+inttostr(qry_main.fieldbyname('pid').asinteger)+' ';
           dm.ExecSql(dm.qry_temp,ssql);

          end;

        end;


     qry_main.Next;     

  end;

 dm.con1.committrans;
 screen.cursor:=crdefault;
 qry_main.Requery;
 showmessage('更新成功!');
 except on e:exception do
 begin
 ShowMessage('错误：'+e.Message +'---: '+ qry_main.fieldbyname('manu_part_number').asstring);
  dm.con1.rollbacktrans;
  qry_main.enablecontrols;
   screen.cursor:=crdefault;
 exit;
 end;
 end;


end;

end.
