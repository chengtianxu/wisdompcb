unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Menus, Grids, DBGridEh, DB, ADODB;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Edit1: TEdit;
    PopupMenu1: TPopupMenu;
    DBGridEh1: TDBGridEh;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    RadioGroup1: TRadioGroup;
    qry14: TADOQuery;
    qry314: TADOQuery;
    qrytemp: TADOQuery;
    btnW: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure btnWClick(Sender: TObject);
  private
    { Private declarations }
    PreColumn: TColumnEh;
    sql_text:string;

    procedure item_click(sender:TObject);
    function cutno_change(cutno:string;status:byte):boolean;
   function guoshu(cut_no:string;_type,rkey06:integer):boolean;
   function baofei(cut_no:string;_type,rkey06:integer):boolean;
   function fenpei(cut_no: string;_type,rkey06:integer): boolean;

   function  GetNextRanking:Integer;

   procedure update(cut_no:string;changtype:Integer);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses damo,common, condition, PasWeiXin,UAuditDetail;

{$R *.dfm}
function tform1.guoshu(cut_no: string;_type,rkey06:integer): boolean;
var
 sql_str:string;
begin
if _type=0 then
 sql_str:='SELECT     dbo.Data0048.RKEY '+
          'FROM  dbo.Data0048 INNER JOIN '+
          'dbo.Data0006 ON dbo.Data0048.WO_PTR = dbo.Data0006.RKEY '+
          'where data0006.cut_no='+quotedstr(cut_no)
else
 sql_str:='SELECT     dbo.Data0048.RKEY '+
          'FROM  dbo.Data0048 INNER JOIN '+
          'dbo.Data0006 ON dbo.Data0048.WO_PTR = dbo.Data0006.RKEY '+
          'where data0006.rkey='+inttostr(rkey06);
openquery(dm.ADOQuery1,sql_str);
if dm.ADOQuery1.IsEmpty then
 result:=false
else
 result:=true;
end;

function tform1.baofei(cut_no: string;_type,rkey06:integer): boolean;
var
 sql_str:string;
begin
if _type=0 then
 sql_str:='SELECT     dbo.Data0058.RKEY '+
          'FROM  dbo.Data0058 INNER JOIN '+
          'dbo.Data0006 ON dbo.Data0058.WO_PTR = dbo.Data0006.RKEY '+
          'where data0006.cut_no='+quotedstr(cut_no)
else
 sql_str:='SELECT     dbo.Data0058.RKEY '+
          'FROM  dbo.Data0058 INNER JOIN '+
          'dbo.Data0006 ON dbo.Data0058.WO_PTR = dbo.Data0006.RKEY '+
          'where data0006.rkey='+inttostr(rkey06);
openquery(dm.ADOQuery1,sql_str);
if dm.ADOQuery1.IsEmpty then
 result:=false
else
 result:=true;
end;

function tform1.fenpei(cut_no: string;_type,rkey06:integer): boolean;
var
 sql_str:string;
begin
if _type=0 then
 sql_str:='SELECT  dbo.Data0489.RKEY '+
          'FROM  dbo.Data0489 INNER JOIN '+
          'dbo.Data0006 ON dbo.Data0489.WO_PTR = dbo.Data0006.RKEY '+
          'where data0006.cut_no='+quotedstr(cut_no)
else
 sql_str:='SELECT  dbo.Data0489.RKEY '+
          'FROM  dbo.Data0489 INNER JOIN '+
          'dbo.Data0006 ON dbo.Data0489.WO_PTR = dbo.Data0006.RKEY '+
          'where data0006.cut_no='+inttostr(rkey06);
openquery(dm.ADOQuery1,sql_str);
if dm.ADOQuery1.IsEmpty then
 result:=false
else
 result:=true;
end;

procedure tform1.item_click(sender:TObject);
var
 i:byte;
begin
(sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
if (sender as tmenuItem).Checked then
 begin
  for i:=0 to DBGridEh1.FieldCount-1 do
  if DBGridEh1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    DBGridEh1.Columns[i].Visible:=true;
    break;
   end;
 end
else
 begin
  for i:=0 to DBGridEh1.FieldCount-1 do
  if DBGridEh1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    DBGridEh1.Columns[i].Visible:=false;
    break;
   end;
 end;
end;

function TForm1.cutno_change(cutno: string; status: byte): boolean;
begin
result:=false;
with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='select tstatus from data0492 where cut_no='+quotedstr(cutno);
  open;
  if not isempty then
   if fieldbyname('tstatus').AsInteger<> status then
   result:=true;
 end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 //close;
 application.Terminate;
end;

procedure TForm1.FormShow(Sender: TObject);
var
  i:integer;
  item:TMenuItem;
begin
   if dm.ADOConnection1.Connected then
   begin
       dm.ads491.Close;
       dm.ads491.Parameters.ParamByName('dtpk1').Value:=getsystem_date(dm.ADOQuery1,1)-2;
       dm.ads491.Parameters.ParamByName('dtpk2').Value:=getsystem_date(dm.ADOQuery1,1)+1;
      // dm.ads491.Parameters.ParamByName('P3').Value:=StrToInt(common.rkey73);
       sql_text := dm.ads491.CommandText;
      dm.ads491.CommandText:= dm.ads491.CommandText+ ' and  Data0491.auth_flag=1 and csi_ptr='+common.rkey73 ;
     // showmessage(sql_text);
     // showmessage(dm.ads491.CommandText);

      dm.ads491.Open;


       PreColumn := DBGridEH1.Columns[0];
       for i:=1 to DBGrideh1.Columns.Count do
        begin
              item := TmenuItem.Create(self) ;
              item.Caption := dbgrideh1.Columns[i-1].Title.Caption ;
              if dbgrideh1.Columns[i-1].Visible then
                item.Checked := true ;
              item.OnClick := item_click ;
              self.PopupMenu1.Items.Add(item) ;
        end;
        RadioGroup1Click(nil);
   end;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
if not DBGridEh1.DataSource.DataSet.IsEmpty then
Export_dbGridEH_to_Excel(self.DBGridEh1,self.Caption);
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
begin
  popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm1.DBGridEh1TitleClick(Column: TColumnEh);
begin
if column.FieldName<>'app_status' then
 if column.Title.SortMarker =smDownEh then
  begin
   column.Title.SortMarker:=smUpEh;
   dm.ads491.IndexFieldNames:=Column.FieldName;
  end
 else
  begin
   column.Title.SortMarker:=smDownEh;
   dm.ads491.IndexFieldNames:=Column.FieldName+' DESC';
  end;

if (column.ReadOnly) and (PreColumn.FieldName<>column.FieldName) then
 begin
  label1.Caption:=column.Title.Caption;
  edit1.SetFocus;
  PreColumn.Title.Color := clBtnFace;
  Column.Title.Color := clred;
  PreColumn := column;
 end
else
 edit1.SetFocus;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
if (trim(edit1.Text)<> '')  then
 dm.ads491.Filter:=PreColumn.FieldName+' like ''%'+trim(edit1.Text)+'%'''
else
 dm.ads491.Filter:='';
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var
 rkey:string;
begin
 rkey:=dm.ads491CUT_NO.Value;
 dm.ads491.Close;
 dm.ads491.Open;
 if rkey<>'' then dm.ads491.Locate('cut_no',rkey,[]);
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
var
 i:byte;
begin
 with  form_condition do
 begin

      dtpk1.Date:= strtodate(formatdatetime('yyyy-mm-dd',
                             dm.ads491.Parameters.ParamValues['dtpk1']));

      dtpk2.Date:= strtodate(formatdatetime('yyyy-mm-dd',
                             dm.ads491.Parameters.ParamValues['dtpk2']-1));

     if ShowModal=mrok then
      begin
       with dm.ads491 do
        begin
         close;
         CommandText:=self.sql_text;
         for i:=1 to form_condition.SGrid1.RowCount-2 do
          dm.ads491.CommandText:=dm.ads491.CommandText+form_condition.SGrid1.Cells[2,i]+#13;
         Parameters.ParamValues['dtpk1']:=strtodate(
            formatdatetime('yyyy-mm-dd ',dtpk1.Date));
         Parameters.ParamValues['dtpk2']:=strtodate(
            formatdatetime('yyyy-mm-dd ',dtpk2.Date+1));
         open;
        end;
  end;
 end;
end;

procedure TForm1.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(dm.ads491.CommandText);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

//  vprev:='4';
//  common.rkey73:='3023';
//  user_ptr:='3301';
//   dm.ADOConnection1.Open;

 if not App_init_2(dm.ADOConnection1) then
 begin
  showmsg('程序起动失败,请联系管理员!',1);
  application.Terminate;
 end;

  self.caption:=application.Title;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  LongDateFormat:='YYYY-MM-DD HH:NN:SS'
end;

procedure TForm1.N1Click(Sender: TObject);
var
  Lsql,Lmsg:String;
  Nranking:integer;
begin
if (vprev = '1') or (vprev = '3') then
 begin
  showmsg('你只有检查权限不能做投产操作',1);
  Exit;
 end ;

 if self.cutno_change(dm.ads491CUT_NO.Value,dm.ads491TSTATUS.Value) then
  begin
   showmsg('审批状态发生变化,操作失败!',1);
   bitbtn3click(sender);
  end;
      //csi_ptr

  if common.rkey73<>dm.ads491.FieldByName('csi_ptr').AsString then
  begin
  ShowMessage('你不是当前审核人！');
  Exit;
  end;

 try
   dm.ADOConnection1.BeginTrans;

   dm.ads491.Edit;
   dm.ads491APP_BY_PTR.Value:=strtoint(user_ptr);
   dm.ads491APP_DATE.Value:=getsystem_date(dm.ADOQuery1,0);
   dm.ads491auth_flag.value:=false;
   dm.ads491.Post;


  Nranking:=Self.getnextranking;

   if Nranking=0 then  //是最后审核人
   begin
//   dm.ads491.Edit;
//   dm.ads491TSTATUS.Value:=0;
//   dm.ads491.Post;

    update(dm.ads491CUT_NO.asstring,0);

   end
   else
   begin
    Nranking:=dm.qrytemp.fieldbyname('NRanking').asinteger;
    Lsql:='update d491 set auth_flag=1'+
      ' from data0491 d491'+
      ' inner join   data0492 d492  on d491.MO_PTR=d492.rkey'+
      ' where d492.CUT_NO='''+dm.ads491CUT_NO.asstring+''' and d491.ranking='+inttostr(Nranking)+' ';
     dm.execsql(dm.qrytemp,Lsql);

    Lsql:='select d491.csi_ptr,d492.CUT_NO'+
      ' from data0491 d491'+
      ' inner join   data0492 d492  on d491.MO_PTR=d492.rkey'+
      ' where d492.CUT_NO='''+dm.ads491CUT_NO.asstring+''' and d491.ranking='+inttostr(Nranking)+' ';
     dm.openqry(qrytemp,Lsql);

   //通知下一审核要审核：
    Lmsg:='配料单号【'+ dm.ads491CUT_NO.AsString + '】超投，需要您审批。';
    if not qry14.Active  then qry14.Open;
    if not qry314.Active  then qry314.Open;
   qry14.Append;
   qry14.FieldByName('MESSAGE').value:=Lmsg;
   qry14.FieldByName('senddate').value:= common.getsystem_date(dm.qrytemp,0);
   qry14.FieldByName('whosend').value:=1;
   qry14.Post;

    qry314.Append;
    qry314.FieldByName('emp_ptr').value:= qrytemp.fieldByName('csi_ptr').asinteger;
    qry314.FieldByName('d14_ptr').value:= qry14.FieldByName('rkey').asinteger;
    qry314.FieldByName('hread').value:='F';
    qry314.FieldByName('deleted').value:= 'N';
    qry314.FieldByName('if_note').value:=True;
    qry314.post;
   end;


   dm.ADOConnection1.CommitTrans; 
   showmsg('审核成功!',1);
   BitBtn3Click(Sender);

   except on e:Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     ShowMessage('取消出错：'+e.Message);
     end;
  end;


end;

procedure TForm1.PopupMenu2Popup(Sender: TObject);
begin
 if dm.ads491.IsEmpty then
 begin
  n1.Enabled:=false;
  n2.Enabled:=false;
 // n3.Enabled:=false;
 end
 else
 begin
  if dm.ads491TSTATUS.Value=0 then
   begin
    n1.Enabled:=false;
    n2.Enabled:=True;
    //n3.Enabled:=true;
   end
  else
   begin
    if (dm.ads491auth_flag.asboolean=True) and (StrToInt(common.rkey73)=dm.intgrfldads491csi_ptr.AsInteger) then
    begin
    n1.Enabled:=true;
    n2.Enabled:=false;
    //n3.Enabled:=false;
    end
    else
    begin
    n1.Enabled:=false;
    if (dm.ads491APP_BY_PTR.asinteger>0) and (StrToInt(common.rkey73)=dm.intgrfldads491csi_ptr.AsInteger)   then
    n2.Enabled:=true
    else
    n2.Enabled:=false;
//    if (dm.ads491APP_BY_PTR.asinteger>0) then
//    n3.Enabled:=true
//    else
//    n3.Enabled:=false
    end
   end;
 end;
end;

procedure TForm1.N2Click(Sender: TObject);
var
  Lsql:string;
  NRanking: integer;
begin
  if (vprev = '1') or (vprev = '3') then
   showmsg('你只有检查权限不能做投产操作',1)
  else
   if self.cutno_change(dm.ads491CUT_NO.Value,dm.ads491TSTATUS.Value) then
    begin
     showmsg('审批状态发生变化,操作失败!',1);
     bitbtn3click(sender);
    end
   else
   if dm.ads491Con_Flag.Value=2 then
    showmsg('配料单已确认,操作失败!',1);

   if self.guoshu(dm.ads491CUT_NO.Value,0,0) then
    begin
     showmsg('投产作业已产生过数记录无法取消审核',1);
     exit;
    end;
   if self.baofei(dm.ads491CUT_NO.Value,0,0) then
    begin
     showmsg('投产作业已产生报废记录无法取消审核',1);
     exit;
    end;
   if self.fenpei(dm.ads491CUT_NO.Value,0,0) then
    begin
     showmsg('投产作业已产生内层分配记录无法取消审核',1);
     exit;
    end;

     if StrToInt(common.rkey73)<>dm.intgrfldads491csi_ptr.AsInteger  then
     begin
     showmessage('您不是当前审核人，不能反审别人的单据！');
     exit;
     end;

    try

      dm.ADOConnection1.BeginTrans;
      NRanking:= GetNextRanking;
      if NRanking>0  then //不是最后审核人
      begin
        Lsql:='select d491.APP_BY_PTR'+
        ' from data0491 d491'+
        ' inner join   data0492 d492  on d491.MO_PTR=d492.rkey'+
        ' where d492.CUT_NO='''+dm.ads491CUT_NO.asstring+''' and d491.ranking='+inttostr(NRanking)+' ';
        dm.OpenQry(dm.qrytemp,Lsql);
        if  dm.qrytemp.Fields[0].AsInteger>0  then
        begin
        ShowMessage('下一审核人已经审核， 您不能反审核！');
        exit;
        end
        else
        begin
         dm.ads491.edit;
         dm.ads491auth_flag.AsBoolean:=True;
         dm.ads491APP_BY_PTR.AsVariant:=null;
         dm.ads491APP_DATE.AsVariant:=null;
         dm.ads491.post;
          Lsql:='update d491 set auth_flag=0'+
        ' from data0491 d491'+
        ' inner join   data0492 d492  on d491.MO_PTR=d492.rkey'+
        ' where d492.CUT_NO='''+dm.ads491CUT_NO.asstring+''' and d491.ranking='+inttostr(Nranking)+' ';
       dm.execsql(dm.qrytemp,Lsql);
        end;
      end
      else
      begin
        update(dm.ads491CUT_NO.asstring,1);

       dm.ads491.Edit;
       dm.ads491auth_flag.AsBoolean:=True;
       dm.ads491APP_BY_PTR.AsVariant:=null;
       dm.ads491APP_DATE.AsVariant:=null;
       dm.ads491.Post;
      end;
    dm.ADOConnection1.CommitTrans;

     showmsg('取消审核成功!',1);
     BitBtn3Click(Sender);

    except on e:Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     ShowMessage('取消出错：'+e.Message);
    end;
   end;

end;


procedure TForm1.N3Click(Sender: TObject);
var
  Lfrm:TfrmAuditDetail;
begin
//  showmsg(dm.strngfldads491USER_FULL_NAME.AsString+
//         '于日期:'+dm.ads491APP_DATE.AsString+'审核',1);

 Lfrm:=TfrmAuditDetail.Create(nil);
 try
  LFrm.qry1.Close;
  LFrm.qry1.Parameters[0].Value:=dm.ads491.fieldbyname('rkey492').AsInteger;
  LFrm.qry1.open;
  LFrm.ShowModal;
 finally
  Lfrm.Free;
 end;
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
var
  i:Integer;
begin
//  ShowMessage(IntToStr(DBGridEh1.FieldCount)+','+IntToStr(DBGridEh1.Columns.Count));
  if RadioGroup1.ItemIndex= 1 then
  for i:=0 to DBGridEh1.Columns.Count-1 do
  begin
   if DBGridEh1.Columns[i].FieldName='area3_1' then
    DBGridEh1.Columns[i].FieldName:='area3';
   if DBGridEh1.Columns[i].FieldName='area2_1' then
    DBGridEh1.Columns[i].FieldName:='area2';
   if DBGridEh1.Columns[i].FieldName='area1_1' then
    DBGridEh1.Columns[i].FieldName:='area1';
   if DBGridEh1.Columns[i].FieldName='unit_sq_1' then
    DBGridEh1.Columns[i].FieldName:='unit_sq';
  end
  else
    for i:=0 to DBGridEh1.Columns.Count-1 do
    begin
     if DBGridEh1.Columns[i].FieldName='area3' then
      DBGridEh1.Columns[i].FieldName:='area3_1';
     if DBGridEh1.Columns[i].FieldName='area2' then
      DBGridEh1.Columns[i].FieldName:='area2_1';
     if DBGridEh1.Columns[i].FieldName='area1' then
      DBGridEh1.Columns[i].FieldName:='area1_1';
     if DBGridEh1.Columns[i].FieldName='unit_sq' then
      DBGridEh1.Columns[i].FieldName:='unit_sq_1';
    end ;  {}
end;

function TForm1.GetNextRanking:Integer;
var
  Lsql:string;
begin
   Result:=0;
   Lsql:= ' select  d491.ranking as NRanking ' +
     '  from data0491 d491'+
     '  inner join   data0492 d492  on d491.MO_PTR=d492.rkey'+
    '  where d492.CUT_NO='''+dm.ads491CUT_NO.asstring+''' and d491.ranking='+inttostr(dm.wrdfldads491ranking.asinteger+1)+' ';

     dm.OpenQry(dm.qrytemp,Lsql);
     if not dm.qrytemp.isempty then
     result:=dm.qrytemp.Fields[0].Value;     

end;

procedure TForm1.btnWClick(Sender: TObject);
var
    LFrm: TfrmWeiXin;
begin
  LFrm:= TfrmWeiXin.Create(nil);
  try
    LFrm.ShowModal;
  finally
    LFrm.Free;
  end;
end;

procedure TForm1.update(cut_no: string;changtype:Integer);
var
  new_no,rkeys:string;
  LQry,LQry2:TADOQuery;
  i:Integer;
begin
  rkeys :='';
  new_no:= Copy(cut_no,1,Pos('-',cut_no));
  LQry:= TADOQuery.Create(nil);
  LQry2:= TADOQuery.Create(nil);
  try
    LQry.Connection:= DM.ADOConnection1;
    LQry2.Connection:= DM.ADOConnection1;
    LQry.close;
    LQry.sql.Text:='SELECT rkey FROM DATA0492 WHERE CUT_NO like ''%' + new_no + '%''';
//    ShowMessage(LQry.SQL.Text);
    LQry.Open;
    if not LQry.IsEmpty then
    begin
      while not LQry.Eof do
      begin
        rkeys:= LQry.FieldByName('rkey').AsString   + ',' + rkeys;
        LQry.next;
      end;
      LQry2.close;
      if changtype = 0 then
        LQry2.sql.Text:='update data0492 set tstatus = 0 where rkey in ('+ Copy(rkeys,1,Length(rkeys)-1) +')'
      else 
        LQry2.sql.Text:='update data0492 set tstatus = 1 where rkey in ('+ Copy(rkeys,1,Length(rkeys)-1) +')';
//      ShowMessage(LQry2.SQL.Text);
      LQry2.ExecSQL;
    end;
  finally
    LQry.free;
    LQry2.free;
  end;
end;

end.
