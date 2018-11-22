unit Frm_main_u;

interface

uses
  Windows, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons, Menus, DB,
  ADODB, ppEndUsr,Messages,ComCtrls,OleServer, Excel2000,
  ComObj,DBGrids, DBClient;

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
    N4: TMenuItem;
    N12: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    BitBtn6: TBitBtn;
    N7: TMenuItem;
    N8: TMenuItem;
    N10: TMenuItem;
    N9: TMenuItem;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BtCloseClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BtBrushClick(Sender: TObject);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure Grd1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BtQryClick(Sender: TObject);
    procedure Grd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ppReport1PrintingComplete(Sender: TObject);
    procedure Grd2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name:string;          
    sSql :string;
  public

  end;

var
  Frm_main: TFrm_main;

implementation
 uses common,DM_u,Frm_QrySet_u,Frm_detail_u,Frm_authInfo_u, URep, VMIForm;
{$R *.dfm}

procedure TFrm_main.FormCreate(Sender: TObject);
begin
  {}if not App_Init_2(dm.ADOCon ) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
    exit;
  end;
  Caption := application.Title;  

  {
   rkey73:= '62';
  user_ptr := '35';
  vprev := '4'; }

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

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
        Grd1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
      else if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        Grd1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
    end else
      Grd1.DataSource.DataSet.Filter:='';
  end;
end;

procedure TFrm_main.BtBrushClick(Sender: TObject);
var
  i:integer;
begin
  if DM.ADO268.IsEmpty then exit;
  i := DM.ADO268rkey.AsInteger ;
  DM.ADO268.Close;
  DM.ADO268.Open;
  DM.ADO268.Locate('rkey',i,[]);
end;

procedure TFrm_main.Grd1TitleClick(Column: TColumnEh);
begin
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.ADO268.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.ADO268.Sort:=Column.FieldName+' DESC';
  end;
  DM.ADO268AfterScroll(DM.ADO268);
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
  end else
    edit1.SetFocus;
end;

procedure TFrm_main.Grd1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  if dm.ADO268status.Value = 3 then
     Grd1.Canvas.Font.Color := clred
  else if dm.ADO268status.Value = 2 then
     Grd1.Canvas.Font.Color := clTeal //cllime
  else if dm.ADO268status.Value = 1 then
     Grd1.Canvas.Font.Color := clfuchsia
  else if dm.ADO268status.Value = 4 then
     Grd1.Canvas.Font.Color := clGreen;
  Grd1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;


procedure TFrm_main.PopupMenu1Popup(Sender: TObject);
begin
  if DM.ADO268.IsEmpty then
  begin
    n2.Enabled:=false;    //编辑
    n3.Enabled:=false;    //检查
    n4.Enabled:=false;    //提交审批
    n5.Enabled:=false;    //删除
    n6.Enabled:=false;    //prt
    n8.Enabled:=false;    //aut
    n10.Enabled:=false;    //copy
    n9.Enabled:=false;    //cancel
  end
  else
  begin
    n2.Enabled:=(dm.ADO268status.AsInteger in [0,3])  and (Dm.ADO268EMPL_PTR.AsString=rkey05);
    n3.Enabled := true;
    n4.Enabled := dm.ADO268status.AsInteger=0;
    n5.Enabled:=(dm.ADO268status.AsInteger in [0,3]) and (Dm.ADO268EMPL_PTR.AsString=rkey05);
    n6.Enabled := (dm.ADO268status.AsInteger in [2,4]) and ((vprev='3') or not DM.ADO268Prted.AsBoolean);
    n8.Enabled:=true;                            //申请人员只能打印一次,仓库人员可多次打印
    n10.Enabled:=true;
    n9.Enabled:=dm.ADO268status.AsInteger in [1];
  end;
end;

procedure TFrm_main.BtQryClick(Sender: TObject);
var i:integer;
    Sqlstr:string;
begin
  if Frm_QrySet=nil then  Frm_QrySet:=TFrm_QrySet.Create(Application);
  if Frm_QrySet.ShowModal=mrok then
  begin
    for i:=1 to Frm_QrySet.sgrid1.RowCount-2 do
      if Frm_QrySet.sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+Frm_QrySet.sgrid1.Cells[2,i];
    DM.ADO268.SQL.Text:=sSql+' where data0268.date>='''+formatdatetime('YYYY/MM/DD',Frm_QrySet.DateTimePicker1.Date)+
                           ''' and data0268.date-1<='''+formatdatetime('YYYY/MM/DD',Frm_QrySet.DateTimePicker2.Date)+''' '+Sqlstr+
                           ' order by data0268.number';
    DM.ADO268.Close;
    DM.ADO268.Open;
  end;
end;



procedure TFrm_main.Grd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.ADO268.SQL.Text);
end;

procedure TFrm_main.N1Click(Sender: TObject);
var iRank:integer;
begin
  if (Tmenuitem(Sender).Tag in [0,1,3,4,10,11]) and ((strtoint(vprev)=1) or (strtoint(vprev)=3)) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;

  case Tmenuitem(Sender).Tag of
  0,1,2,10: with TFrm_detail.Create(nil) do     //新建，编辑，检查
       try
         Ftag:=Tmenuitem(Sender).Tag;
         FGrd:=Grd2;
         initd;
         if ShowModal=mrok then
         begin
           DM.ADO268.Close;
           DM.ADO268.Open;
           DM.ADO268.Locate('rkey',Frkey268,[]);
         end;
       finally
         free;
         DM.ADO268_1.Close;
         DM.ADO268_1.Close;
       end;
   3:try    //提交审批
       DM.ADOCon.BeginTrans;
       DM.tmp.Close;
       DM.tmp.SQL.Text:='update data0268 set status=1,auth_emplptr=null,auth_date=null where rkey='+DM.ADO268rkey.AsString+' and status=0' ;
       if DM.tmp.ExecSQL=0 then
       begin
         DM.ADOCon.RollbackTrans;
         showmessage('申请单状态发生改变而未能成功提交!');
         BtBrushClick(nil);
         exit;
       end;

       DM.tmp.Close;
       DM.tmp.SQL.Text:='delete from data0368  where apply_ptr='+DM.ADO268rkey.AsString;
       DM.tmp.ExecSQL;

       DM.tmp1.Close;
       DM.tmp1.SQL.Text:='select * from data0275 where AUTH_GROUP_PTR='+DM.ADO268AUTH_ptr.AsString+' order by rkey';
       DM.tmp1.Open;
       iRank:=1;
       while not DM.tmp1.Eof do
       begin
         DM.tmp.Close;
         if iRank=1 then
           DM.tmp.SQL.Text:='insert into data0368(apply_ptr,user_ptr,ranking,auth_flag) '+
                               'values('+DM.ADO268rkey.AsString+','+DM.tmp1.fieldbyname('user_ptr').AsString+','+
                               inttostr(iRank)+',''Y'')'
         else
           DM.tmp.SQL.Text:='insert into data0368(apply_ptr,user_ptr,ranking,auth_flag) '+
                               'values('+DM.ADO268rkey.AsString+','+DM.tmp1.fieldbyname('user_ptr').AsString+','+
                               inttostr(iRank)+',''N'')';
         DM.tmp.ExecSQL;
         inc(iRank);
         DM.tmp1.Next;
       end;
       DM.ADOCon.CommitTrans;
       BtBrushClick(nil);
     except
       DM.ADOCon.RollbackTrans;
       showmessage('数据提交出现错误,请与管理员联系!!!');
     end;

   4: begin
        if MessageBox(Handle,'确定删除此申请单吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
        DM.ADOCon.BeginTrans;
        try
          DM.tmp.Close;
          DM.tmp.SQL.Text:='delete from data0468  where flow_no='+DM.ADO268rkey.AsString+' and quan_issued=0';
          if DM.tmp.ExecSQL<>DM.ADO468.RecordCount then
          begin
            DM.ADOCon.RollbackTrans;
            showmessage('删除数据失败,数据状态已发生变化...');
          end else begin
            DM.tmp.SQL.Text:='delete from data0368  where apply_ptr='+DM.ADO268rkey.AsString;
            DM.tmp.ExecSQL;
            DM.tmp.SQL.Text:='delete from data0268 where rkey='+DM.ADO268Rkey.AsString+' and status in (0,3)' ;
            if DM.tmp.ExecSQL=0 then
            begin
              DM.ADOCon.RollbackTrans;
              showmessage('删除数据失败,数据状态已发生变化...');
            end else
              DM.ADOCon.CommitTrans;
          end;
          BtBrushClick(nil);
       except
         DM.ADOCon.RollbackTrans;
         showmessage('删除数据失败...');
       end;
      end;
   11: begin
        if MessageBox(Handle,'确定取消提交此申请单吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
        DM.ADOCon.BeginTrans;
        try
          DM.tmp.Close;
          DM.tmp.SQL.Text:='update data0268 set status=0,auth_emplptr=null,auth_date=null where rkey='+
                           DM.ADO268rkey.AsString+' and status=1';
                           //not exists(select rkey from data0468 where flow_no='+DM.ADO268rkey.AsString+
                         //  ' and QUAN_ISSUED>0)';
          if DM.tmp.ExecSQL<>1 then
          begin
            DM.ADOCon.RollbackTrans;
            showmessage('取消提交此申请单失败,数据状态已发生变化...');
          end else begin
            DM.tmp.SQL.Text:='delete from data0368  where apply_ptr='+DM.ADO268rkey.AsString;
            DM.tmp.ExecSQL;
            DM.ADOCon.CommitTrans;
          end;
          BtBrushClick(nil);
       except
         DM.ADOCon.RollbackTrans;
         showmessage('取消提交此申请单失败...');
       end;
      end;
  end;
end;

procedure TFrm_main.N6Click(Sender: TObject);
begin

  if DM.ADO268Prted.AsBoolean and (vprev<>'3') then
  begin
    showmessage('此申请单已经打印,您无权重复打印...');
    exit;
  end;
        try
                Report_Frm:= TReport_Frm.Create(application);
                Report_Frm.ADS268.Close;
                Report_Frm.ADS268.Parameters[0].Value:=DM.ADO268rkey.Value;
                Report_Frm.ADS268.Open;
                Report_Frm.ADS468.Close;
                Report_Frm.ADS468.Parameters[0].Value:=DM.ADO268rkey.Value;
                Report_Frm.ADS468.Open;
                Report_Frm.ppReport1.Reset;
                Report_Frm.ppReport1.Template.FileName :=
                  stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
                    '\Rep268.rtm';
                Report_Frm.ppReport1.Template.LoadFromFile;

                Report_Frm.ppReport1.SaveAsTemplate:=false;
                Report_Frm.ppReport1.Print;
//                ShowMessage(Report_Frm.ADS268.CommandText);
        finally
                Report_Frm.ADS468.Close;
                Report_Frm.ADS268.Close;
                Report_Frm.Free;
        end;
  BtBrushClick(nil);
end;

procedure TFrm_main.BitBtn6Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    exit;
  end;
        try
              Report_Frm:= TReport_Frm.Create(application);
              Report_Frm.ppReport1.Reset;
              Report_Frm.ppReport1.Template.FileName :=
                stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
                  '\Rep268.rtm';
              Report_Frm.ppReport1.Template.LoadFromFile;
              Report_Frm.ppReport1.SaveAsTemplate:=true;
              Report_Frm.ppdesigner1.ShowModal;
        finally
              Report_Frm.ADS468.Close;
              Report_Frm.ADS268.Close;
              Report_Frm.Free;
        end;
end;

procedure TFrm_main.N8Click(Sender: TObject);
begin
   try     //审核inf
     Frm_authInfo:=TFrm_authInfo.Create(nil);
     DM.tmp.Close;
     DM.tmp.SQL.Text:='SELECT Data0073.user_login_name USER_ID,Data0073.USER_FULL_NAME,data0368.user_ptr,'+
                      'data0368.auth_date,data0368.ranking,data0368.auth_flag FROM dbo.Data0073 INNER JOIN dbo.data0368 '+
                      'ON dbo.Data0073.RKEY = dbo.data0368.user_ptr '+
                      'WHERE dbo.data0368.apply_ptr='+dm.ADO268rkey.asstring+
                      ' order by dbo.data0368.ranking';
     DM.tmp.Open;
     Frm_authInfo.DataSource1.DataSet:=DM.tmp;
     Frm_authInfo.ShowModal;
   finally
     Frm_authInfo.Free;
     DM.tmp.Close;
   end;
end;

procedure TFrm_main.FormShow(Sender: TObject);
begin
  
  field_name := Grd1.Columns[0].FieldName;
  PreColumn := Grd1.Columns[0];
  Grd1.Columns[0].Title.Color := clred ; 
  
  with dm.tmp do
  begin
    close;
    SQL.Clear;
    sql.text:='SELECT Data0034.DEPT_CODE,Data0034.dept_name,Data0005.RKEY rkey05,Data0034.rkey,data0034.ttype,data0034.is_cost_dept '+
              'FROM Data0005 INNER JOIN '+
              'Data0034 ON Data0005.EMPLOYEE_ID = Data0034.RKEY INNER JOIN '+
              'Data0073 ON Data0005.RKEY = Data0073.EMPLOYEE_PTR '+
              'where data0073.rkey='+rkey73;
    open;
    if (fieldbyname('ttype').AsInteger=4) or (fieldbyname('ttype').AsInteger=5) or (fieldbyname('is_cost_dept').AsInteger=1) then
    begin
      dept_rkey := fieldvalues['rkey'];
      dept_code := fieldvalues['dept_code'];        //人员部门
      dept_name := fieldvalues['dept_name'];
    end;                                                          
    rkey05 := fieldvalues['rkey05'];                //人员id
  end;           

  sSql:=DM.ADO268.SQL.Text;
  DM.ADO268.SQL.Text:=DM.ADO268.SQL.Text+' where data0268.date>getdate()-1 order by number';
  DM.ADO268.Open;
  Grd1TitleClick(PreColumn);
end;

procedure TFrm_main.ppReport1PrintingComplete(Sender: TObject);
begin
  DM.ADO268.Edit;
  DM.ADO268Prted.AsBoolean:=true;
  DM.ADO268.Post;
end;

procedure TFrm_main.Grd2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      if (ssAlt in Shift)  and  (Key=86) then
      showmessage(DM.ADO468.SQL.Text);
end;

procedure TFrm_main.BitBtn1Click(Sender: TObject);
begin
   with TUVMIForm.Create(nil) do
     try
       ShowModal;
     finally
       Free;
     end;

end;

end.
