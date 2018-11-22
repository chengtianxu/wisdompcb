unit Frm_main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons, Menus, DB,ComObj,
  ADODB;

type
  TFrm_main = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BtClose: TBitBtn;
    BtBrush: TBitBtn;
    BtQry: TBitBtn;
    Edit1: TEdit;
    Panel3: TPanel;
    Grd1: TDBGridEh;
    Splitter1: TSplitter;
    Grd2: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N8: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    Grd3: TDBGridEh;
    RadioGroup1: TRadioGroup;
    PopupMenu2: TPopupMenu;
    N4: TMenuItem;
    N7: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure BtCloseClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BtBrushClick(Sender: TObject);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure Grd1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure N6Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BtQryClick(Sender: TObject);
    procedure Grd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RadioGroup1Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure Grd2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure Grd2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    PreColumn: TColumnEh;
    field_name:string;
    sSql :string;
    FactGrd:TObject;
    Fsfilter,Fsfilter1:string ;
    function  curr_auth(app: integer):boolean;

    procedure init;
    procedure PrcMsg(var Message: TMessage); message 5678 ;
  public

  end;

var
  Frm_main: TFrm_main;

implementation
 uses common,DM_u,Frm_detail_u,Frm_QrySet_u,Frm_authInfo_u,Frm_note_u,
 michistory_price,stdhistory_price,supplier_info,UToWeiXin;
{$R *.dfm}

procedure TFrm_main.FormCreate(Sender: TObject);
begin
  if not App_Init_2(dm.ADOCon ) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
    exit;
  end;
  Caption := application.Title;
   

 // dm.ADOCon.Open;
//  rkey73:='851';
//  rkey73:='1';
//  vprev := '4';

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  init;
end;

procedure TFrm_main.init;
//var rpl_pr:integer;
begin
  with dm.tmp do
  begin
    close;
    sql.Text:='SELECT  Data0073_1.USER_FULL_NAME, dbo.Data0073.rpl_pr_ptr '+
             'FROM   dbo.Data0073 INNER JOIN '+
             'dbo.Data0073 AS Data0073_1 ON dbo.Data0073.rpl_pr_ptr = Data0073_1.RKEY '+
             'where data0073.rkey='+common.rkey73;
    open;
   if FieldByName('rpl_pr_ptr').AsInteger<>strtoint(rkey73) then
   begin
    messagedlg('您已经将请购单审批授权给用户：'+fieldvalues['user_full_name']+' 请首先取消授权',mtinformation,[mbok],0);
    application.Terminate;
    exit;
   end;
  end;

  H_mainFrm:=self.Handle;
  field_name := Grd1.Columns[0].FieldName;
  PreColumn := Grd1.Columns[0];
  Grd1.Columns[0].Title.Color := clred ;
  with dm.tmp do
  begin
    close;
    sSql := dm.AQ68.SQL.Text ;
    dm.AQ68.Close;
    DM.AQ68.SQL.Text:=sSql+
    'order by data0068.po_req_number,data0276.ranking';
    dm.AQ68.Parameters[0].Value:=common.rkey73;
    dm.AQ68.Open;
    RadioGroup1Click(nil);
  end;
end;

procedure TFrm_main.BtCloseClick(Sender: TObject);
begin
  Frm_QrySet.Free;
  close;
end;

procedure TFrm_main.Edit1Change(Sender: TObject);
begin
  if Grd1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edit1.text) <> '' then
    begin
      if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        Fsfilter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
      else
      if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        Fsfilter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
    end else
      Fsfilter:='';
    RadioGroup1Click(nil);
  end;
end;

procedure TFrm_main.BtBrushClick(Sender: TObject);
var
  i:integer;
begin
  if DM.AQ68.IsEmpty then
   i:=0
  else
   i := DM.AQ68rkey.AsInteger ;
  DM.AQ68.Close;
  DM.AQ68.Open;
  if DM.AQ68.IsEmpty then exit;
  DM.AQ68.Locate('rkey',i,[]);
end;

procedure TFrm_main.Grd1TitleClick(Column: TColumnEh);
begin
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    dm.AQ68.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    dm.AQ68.Sort:=Column.FieldName+' DESC';
  end;
  DM.AQ68AfterScroll(DM.AQ68);
  
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    label1.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    Edit1Change(Edit1);
  end
   else
    edit1.SetFocus;
end;

procedure TFrm_main.Grd1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  if dm.AQ68status.Value=4 then Grd1.Canvas.Font.Color := clBlue;
  Grd1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrm_main.N6Click(Sender: TObject);
var irkey68,i:integer;
    sErqNo:string;
    Lfrm: TfrmToWeiXin;
 function auth:boolean;
 begin
   result:=false;
   if DM.AQ68auth_flag.Value='Y' then
    begin
     DM.tmp.Close;
     DM.tmp.SQL.Text:='update data0276 set auth_flag=''N'',auth_date=getdate() where rkey='+DM.AQ68rkey276.AsString;
     DM.tmp.ExecSQL;

     DM.tmp.Close;
     DM.tmp.SQL.Text:='update data0068 set edited_date=getdate() where rkey='+DM.AQ68rkey.AsString+' and status=1';
     result:=DM.tmp.ExecSQL=0;
     if result then exit;
     DM.tmp.Close;      //将下一用户设为待审
     DM.tmp.SQL.Text:='update data0276 set auth_flag=''Y'',auth_date=null where rkey=('+
                      'select top 1 rkey from data0276 where purchase_ptr='+DM.AQ68rkey.AsString+
                                      ' and ranking>'+DM.AQ68ranking.AsString+' order by ranking asc)';
     if DM.tmp.ExecSQL=0 then  //为最后一个审核
     begin
       DM.tmp.SQL.Text:='update data0068 set status=3 where rkey='+DM.AQ68rkey.AsString;
       DM.tmp.ExecSQL;
     end;
    end
   else
    sErqNo:=sErqNo+','+DM.AQ68po_req_number.AsString;
 end;

begin
  case Tmenuitem(Sender).Tag of
   0: try
      Lfrm:=TfrmToWeiXin.create(self);
      try
      Lfrm.btn_OK.Caption:='审批';
       if Lfrm.showmodal=mrok then
       begin
         DM.ADOCon.BeginTrans;
         if auth then
         begin
           DM.ADOCon.RollbackTrans;
           showmessage(DM.AQ68po_req_number.Value+'请购单状态发生改变导致审核失败!');
           BtBrushClick(nil);
           exit;
         end;
         DM.ADOCon.CommitTrans;
         showmessage('审核成功...');
         BtBrushClick(nil);
       end;
       finally
       Lfrm.free;
       end;
     except
       DM.ADOCon.RollbackTrans;
       showmessage('审核发生错误而失败...');
     end;

     
   1:
    try
      Lfrm:=TfrmToWeiXin.create(self);
    try
      Lfrm.btn_OK.Caption:='取消审批';
     if Lfrm.showmodal=mrok then
     begin
      if Grd1.SelectedRows.Count>1 then
         begin
         showmessage('对不起,取消审批不能一次取消多条记录,只能单条记录取消');
         
         end
      else
      begin

         DM.tmp.Close;
         DM.tmp.SQL.Text:='select rkey from data0276 where purchase_ptr='+DM.AQ68rkey.AsString+
                          ' and auth_flag=''N'' and  ranking>'+DM.AQ68ranking.AsString;
         DM.tmp.Open;
         if not DM.tmp.IsEmpty then
         begin
           showmessage('此单的下一用户已经审核通过,您不能再取消审核!');
           BtBrushClick(nil);
           exit;
         end;

         DM.ADOCon.BeginTrans;
         DM.tmp.Close;
         DM.tmp.SQL.Text:='update data0068 set status=1 where rkey='+DM.AQ68rkey.AsString+' and status in (1,3)';
         if DM.tmp.ExecSQL=0 then
         begin
           DM.ADOCon.RollbackTrans;
           showmessage('请购单状态发生改变而未能成功取消!');
           BtBrushClick(nil);
           exit;
         end;

         DM.tmp.SQL.Text:='update data0276 set auth_flag=''N'',auth_date=null where purchase_ptr='+DM.AQ68rkey.AsString;
         DM.tmp.ExecSQL;

         DM.tmp.SQL.Text:='update data0276 set auth_flag=''Y'' where rkey=('+
                          'select top 1 rkey from data0276 where purchase_ptr='+DM.AQ68rkey.AsString+
                                        ' order by ranking asc)';
         DM.tmp.ExecSQL;
         DM.ADOCon.CommitTrans;
         BtBrushClick(nil);
      end;
     end;
     finally
     Lfrm.free;
     end;
   except
       DM.ADOCon.RollbackTrans;
       showmessage('取消审核发生错误而失败...');
   end;

   2:
   try
    Lfrm:=TfrmToWeiXin.create(self);
    try
      Lfrm.btn_OK.Caption:='退回请购者';
      if Lfrm.showmodal=mrok then
      begin
         if Grd1.SelectedRows.Count>1 then
           showmessage('对不起,退回不能一次退多条记录...')
         else
         begin        //退采
           with TFrm_note.Create(nil) do
           try
              DM.ADO11.close;
              DM.ADO11.SQL.Text:='select rkey,file_pointer,source_type,note_pad_line_1  from data0011 '+
                                 'where source_type=1068 and file_pointer='+DM.AQ68rkey.AsString;
              DM.ADO11.Open;
              if DM.ADO11.IsEmpty then
              begin
                DM.ADO11.Append;
                DM.ADO11.FieldByName('file_pointer').AsInteger:=DM.AQ68rkey.AsInteger;
                DM.ADO11.FieldByName('source_type').AsInteger:=1068;
              end;
              if showmodal=mrok then
              begin
                if DM.ADO11.State in [dsEdit, dsInsert] then DM.ADO11.Post ;
              end else begin
                DM.ADO11.close;
                exit;
              end;
           finally
              free;
           end;
           DM.ADOCon.BeginTrans;
           DM.ADO11.UpdateBatch(arAll);
           DM.tmp.Close;
           DM.tmp.SQL.Text:='update data0068 set status=4 where rkey='+DM.AQ68rkey.AsString+' and status=1';
           if DM.tmp.ExecSQL=0 then
           begin
             DM.ADOCon.RollbackTrans;
             showmessage(DM.AQ68po_req_number.Value+'请购单状态发生改变导致退回失败!');
             BtBrushClick(nil);
             exit;
           end;

           DM.ADOCon.CommitTrans;
           BtBrushClick(nil);
         end;
      end;
     finally
     Lfrm.Free;
     end;
    except
       DM.ADOCon.RollbackTrans;
       messagedlg('退回操作发生错误!',mtinformation,[mbok],0);
    end;

   
   3:
   begin
     Frm_detail:=TFrm_detail.Create(self);
     try
       Frm_detail.Ftag:=Tmenuitem(Sender).Tag;
       Frm_detail.init;
       if Frm_detail.ShowModal=mrok then BtBrushClick(nil);
     finally
       Frm_detail.Free;
     end;
   end;

   4:try     //审核inf
       Frm_authInfo:=TFrm_authInfo.Create(nil);
       DM.tmp.Close;
       DM.tmp.SQL.Text:='SELECT Data0073.user_login_name USER_ID,Data0073.USER_FULL_NAME,data0276.user_ptr,data0276.auth_flag,'+
                        'data0276.auth_date,data0276.ranking FROM dbo.Data0073 INNER JOIN dbo.data0276 '+
                        'ON dbo.Data0073.RKEY = dbo.data0276.user_ptr '+
                        'WHERE dbo.data0276.purchase_ptr='+dm.AQ68rkey.asstring+
                        ' order by ranking';
       DM.tmp.Open;
       Frm_authInfo.DataSource1.DataSet:=DM.tmp;
       if dm.AQ68data275_ptr.AsString<>'' then
       begin
         DM.tmp1.Close;
         DM.tmp1.SQL.Text:='select employee_name from data0005 where rkey='+dm.AQ68data275_ptr.AsString;
         DM.tmp1.Open;
         Frm_authInfo.Edit1.Text:=DM.tmp1.Fields[0].AsString;
       end;       
       Frm_authInfo.ShowModal;
     finally
       Frm_authInfo.Free;
     end;
     
  end;
end;

procedure TFrm_main.PrcMsg(var Message: TMessage);
begin
  Grd2.Visible:=Message.WParam=0;
  Grd3.Visible:=not Grd2.Visible;
end;

procedure TFrm_main.PopupMenu1Popup(Sender: TObject);
begin
  if dm.AQ68.IsEmpty then
   begin
    n1.Enabled := false;   //批准
    n2.Enabled := false;   //取消审批
    n3.Enabled := false;   //退回请购者
    n5.Enabled := false;   //检查/审批
    n6.Enabled := false;   //审批信息
   end
  else
   begin
    n1.Enabled :=DM.AQ68auth_flag.Value='Y';
    n2.Enabled :=dm.AQ68authdate276.AsVariant <> null;
    n3.Enabled :=dm.AQ68status.Value=1;
    n5.Enabled:=true;
    n6.Enabled :=true;
   end;
end;

procedure TFrm_main.BtQryClick(Sender: TObject);
var i:integer;
    Sqlstr:string;
begin
  if Frm_QrySet=nil then
   Frm_QrySet:=TFrm_QrySet.Create(Application);
  if Frm_QrySet.ShowModal=mrok then
  begin
    for i:=1 to Frm_QrySet.sgrid1.RowCount-2 do
     if Frm_QrySet.sgrid1.Cells[2,i]<> '' then
      Sqlstr:=sqlstr+Frm_QrySet.sgrid1.Cells[2,i];

    dm.AQ68.SQL.Text:=sSql+' and data0068.req_date>='''+formatdatetime('YYYY/MM/DD',Frm_QrySet.DateTimePicker1.Date)+
                           ''' and data0068.req_date<='''+formatdatetime('YYYY/MM/DD',Frm_QrySet.DateTimePicker2.Date)+
                           ''' '+Sqlstr+
                           ' order by data0068.po_req_number,data0276.ranking';
    dm.AQ68.Close;
    dm.AQ68.Parameters[0].Value:=common.rkey73;
    dm.AQ68.Open;
  end;

end;

procedure TFrm_main.Grd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.AQ68.SQL.Text);
end;

function TFrm_main.curr_auth(app: integer): boolean;
begin
  curr_auth:=false;
  with dm.tmp do
  begin
    close;
    sql.Clear;
    sql.Add('select rkey from data0073');
    sql.Add('where rpl_pr_ptr ='+rkey73);
    open;
  end;

  while not dm.tmp.Eof do
  begin
    if dm.tmp.FieldValues['rkey']=app then
    begin
      curr_auth:=true;
      break;
    end;
    dm.tmp.Next;
  end;
end;

procedure TFrm_main.RadioGroup1Click(Sender: TObject);
begin
 if Fsfilter='' then
  begin
    if RadioGroup1.ItemIndex=0 then
     Fsfilter1:='auth_flag=''Y'''
    else
     Fsfilter1:='';
  end
 else
  begin
    if RadioGroup1.ItemIndex=0 then
     Fsfilter1:='and auth_flag=''Y'''
    else
     Fsfilter1:='';
  end;
  DM.AQ68.Filter:=Fsfilter+Fsfilter1;
end;

procedure TFrm_main.PopupMenu2Popup(Sender: TObject);
begin
  N4.Enabled:=not DM.AQ68.IsEmpty;
  N7.Enabled:=not DM.AQ68.IsEmpty and (DM.AQ68flag.Value='S');
end;

procedure TFrm_main.N4Click(Sender: TObject);
begin
 if DM.AQ68flag.Value='S' then
   with TForm_stdprice.Create(nil) do
   begin
     showmodal;
     free;
   end
 else
   with TForm_micprice.Create(nil) do
   begin
     showmodal;
     free;
   end
end;

procedure TFrm_main.N7Click(Sender: TObject);
begin
   with TForm4.Create(nil) do
   begin
     showmodal;
     free;
   end
end;

procedure TFrm_main.Grd2DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
 if dm.AQ69CRITICAL_MATL.Value='是' then
  Grd2.Canvas.Font.Color := clRed;

  Grd2.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrm_main.Grd2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then       //Alt+V
  with   (Sender as TDBGridEh).DataSource do
  begin
    if   DataSet is TADOQuery then
      showmessage((DataSet as  TADOQuery).SQL.Text)
    else
    if  DataSet is TADODataSet then
       showmessage((DataSet as  TADODataSet).CommandText)   ;
  end;
end;

end.
