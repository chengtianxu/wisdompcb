unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGridEh, DB, ADODB,common,DateUtils,
  Menus, ppBands, ppCache, ppClass, ppComm, ppRelatv, ppProd, ppReport,
  ppStrtch, ppMemo, ppCtrls, ppBarCod, ppPrnabl;

type
  TfrmMain = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    btn_close: TBitBtn;
    btn_resfresh: TBitBtn;
    btn_Qry: TBitBtn;
    btn_setRpt: TBitBtn;
    lbl_field: TLabel;
    edt_value: TEdit;
    eh268: TDBGridEh;
    eh468: TDBGridEh;
    ds268: TDataSource;
    ds468: TDataSource;
    qry268: TADOQuery;
    qry468: TADOQuery;
    pm1: TPopupMenu;
    mni_add: TMenuItem;
    mni_edit: TMenuItem;
    mni_submit: TMenuItem;
    mni_cancelSubmit: TMenuItem;
    mni_rePrt: TMenuItem;
    mni_auditInfo: TMenuItem;
    mni_dataAnalyse: TMenuItem;
    mni_Del: TMenuItem;
    mni_check: TMenuItem;
    btn_export: TBitBtn;
    mni_prt: TMenuItem;
    btnreqDetail2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure qry268AfterScroll(DataSet: TDataSet);
    procedure eh268KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eh468KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eh268TitleClick(Column: TColumnEh);
    procedure edt_valueChange(Sender: TObject);
    procedure btn_closeClick(Sender: TObject);
    procedure btn_resfreshClick(Sender: TObject);
    procedure btn_exportClick(Sender: TObject);
    procedure btn_setRptClick(Sender: TObject);
    procedure mni_addClick(Sender: TObject);
    procedure mni_prtClick(Sender: TObject);
    procedure mni_editClick(Sender: TObject);
    procedure mni_checkClick(Sender: TObject);
    procedure mni_DelClick(Sender: TObject);
    procedure mni_rePrtClick(Sender: TObject);
    procedure mni_auditInfoClick(Sender: TObject);
    procedure mni_submitClick(Sender: TObject);
    procedure mni_cancelSubmitClick(Sender: TObject);
    procedure mni_dataAnalyseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_QryClick(Sender: TObject);
    procedure pm1Popup(Sender: TObject);
    procedure eh268DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure btnreqDetail2Click(Sender: TObject);
      
  private
    { Private declarations }
    FMsql,FQryStr,FName:string;
    FPreColumn:TColumnEh;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation
 uses UDm, Ureport,uedit,UAuthInfo,USelMaterial,uqry,UReqDetail,UReqDetail2;
{$R *.dfm}

procedure TfrmMain.FormShow(Sender: TObject);
var
  Lsql:string;
begin
  //eh468.DataSource:=ds468;
  FMsql:=qry268.SQL.Text;
  Lsql:=FMsql+ 'and DATA0268.DATE>='''+formatdatetime('yyyy-mm-dd',incmonth(common.getsystem_date(dm.qrytemp,0),-1))+''' ' +
                    'and DATA0268.DATE<='''+formatdatetime('yyyy-mm-dd',incDay(common.getsystem_date(dm.qrytemp,0),1))+'''   order by data0268.date ';
  dm.OpenQry(qry268,Lsql);
  FName:=eh268.Columns[1].FieldName;
  FPreColumn:=eh268.Columns[1];
  eh268.Columns[1].Title.color:=clRed;
end;

procedure TfrmMain.qry268AfterScroll(DataSet: TDataSet);
begin
 //if qry268.FieldByName('rkey').asinteger=0 then Exit;
 if qry268.IsEmpty then
 begin
 qry468.Active:=false;
 exit;
 end;
 qry468.Close;
 qry468.Parameters[0].Value:=qry268.FieldByName('rkey').asinteger;
 qry468.Open;
end;

procedure TfrmMain.eh268KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (ssAlt in Shift)  and  (Key=86) then
   showmessage(FMSql+FQryStr);
end;

procedure TfrmMain.eh468KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

 if (ssAlt in Shift)  and  (Key=86) then
   showmessage(qry468.SQL.Text);
end;

procedure TfrmMain.eh268TitleClick(Column: TColumnEh);
begin
  if eh268.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;

  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    qry268.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    qry268.Sort:=Column.FieldName+' DESC';
  end;

  if eh268.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (fname <> column.FieldName) then
  begin
    lbl_field.Caption := column.Title.Caption ;
    fname := column.FieldName ;
    edt_value.SetFocus;
    FPreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    FPreColumn := column ;
    edt_valueChange(edt_value);
  end else
    edt_value.SetFocus;
end;

procedure TfrmMain.edt_valueChange(Sender: TObject);
begin
  //eh468.DataSource:=ds468;
  if eh268.DataSource.DataSet.FieldByName(fname).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
     eh268.DataSource.DataSet.Filtered:=false; 
    if trim(edt_value.text) <> '' then
    begin
      if eh268.DataSource.DataSet.FieldByName(fname).DataType in  [ftString, ftWideString]  then
        eh268.DataSource.DataSet.Filter:=' (' +  fname + ' like ''%' + trim(edt_value.text) + '%'')'
      else if eh268.DataSource.DataSet.FieldByName(fname).DataType in  [ftSmallint, ftInteger]  then
        eh268.DataSource.DataSet.Filter:=' (' + fname+' >= ' + inttostr(strtointdef(edt_value.text,0))+')';
    end else
      eh268.DataSource.DataSet.Filter:='';
     eh268.DataSource.DataSet.Filtered:=true; 
  end;
end;

procedure TfrmMain.btn_closeClick(Sender: TObject);
begin
close;
end;

procedure TfrmMain.btn_resfreshClick(Sender: TObject);
var
  Lsql:String;
   Lrkey:integer;
begin
  //eh468.DataSource:=ds468;
   if not qry268.IsEmpty then
    Lrkey:=qry268.fieldbyname('rkey').asinteger;

  Lsql:=FMsql+ 'and DATA0268.DATE>='''+formatdatetime('yyyy-mm-dd',incmonth(common.getsystem_date(dm.qrytemp,0),-1))+''' ' +
                    'and DATA0268.DATE<='''+formatdatetime('yyyy-mm-dd',incDay(common.getsystem_date(dm.qrytemp,0),1))+'''  order by data0268.date';
  dm.OpenQry(qry268,Lsql);
  if Lrkey>0  then
  if not  qry268.Locate('rkey',Lrkey,[]) then  exit;
end;

procedure TfrmMain.btn_exportClick(Sender: TObject);
begin
if  qry268.IsEmpty  then Exit;
    Export_dbGridEH_to_Excel(eh268,'领料明细');
end;

procedure TfrmMain.btn_setRptClick(Sender: TObject);
var
  LFrm:TfrmReport;
begin
 if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    exit;
  end;

     SetCurrentDir(extractfilepath(paramstr(0)));

     LFrm:= TfrmReport.Create(self);
  try
    LFrm.ppReport1.Reset;
    LFrm.ppReport1.Template.FileName :=
     stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+'Rep268_1.rtm';
    LFrm.ppReport1.Template.LoadFromFile;
    LFrm.ppReport1.SaveAsTemplate:=true;
    LFrm.ppDesigner1.ShowModal;
  finally
    LFrm.ADS468.Close;
    LFrm.ADS268.Close;
    LFrm.Free;
  end;
end;

procedure TfrmMain.mni_addClick(Sender: TObject);
var
  Lfrm:Tfrmedit;
  // Lrkey:integer;
begin
 if  ((strtoint(vprev) = 1) or (strtoint(vprev) = 3)) then
  begin
  messagedlg('对不起!您没有该程序的可写权限', mtinformation, [mbok], 0);
  exit;
  end;
 //Lrkey:=qry268.fieldbyname('rkey').asinteger;
  LFrm:=TfrmEdit.Create(self);
  try
   LFrm.FEditType:=0;
   LFrm.Getdata('-1');
   if LFrm.ShowModal=mrok then
   begin
    btn_resfreshClick(btn_resfresh);
   qry268.last;
   end;
  finally
   Lfrm.free;
  end;
end;

procedure TfrmMain.mni_prtClick(Sender: TObject);
var
  LFrm:TfrmReport;
begin
  btn_resfreshClick(nil);
  if qry268.FieldByName('Prted').AsBoolean and (vprev<>'3') then    
  begin
    showmessage('此申请单已经打印,您无权重复打印...');
    exit;
  end;

     SetCurrentDir(extractfilepath(paramstr(0)));

      LFrm:= TfrmReport.Create(self);
      try
        Lfrm.Frkey:=qry268.fieldbyname('rkey').asstring;
        LFrm.ADS268.Close;
        LFrm.ADS268.Parameters[0].Value:=qry268.fieldbyname('rkey').Value;
        LFrm.ADS268.Open;
        LFrm.ppReport1.Reset;
        LFrm.ppReport1.Template.FileName :=
              stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+'Rep268_1.rtm';
        LFrm.ppReport1.Template.LoadFromFile;
        LFrm.ppReport1.SaveAsTemplate:=False;
        LFrm.ppReport1.Print;
        finally
        LFrm.ADS468.Close;
        LFrm.ADS268.Close;
        LFrm.Free;
        btn_resfreshClick(nil);
        end;
end;


procedure TfrmMain.mni_editClick(Sender: TObject);
var
  Lfrm:Tfrmedit;
begin
  if qry268.IsEmpty then Exit;
 if  ((strtoint(vprev) = 1) or (strtoint(vprev) = 3)) then
  begin
  messagedlg('对不起!您没有该程序的可写权限', mtinformation, [mbok], 0);
  exit;
  end;

  LFrm:=TfrmEdit.Create(self);
  try
   LFrm.FEditType:=1;
   LFrm.Getdata(qry268.fieldbyname('rkey').asstring);
   if LFrm.ShowModal=mrok then
   begin
    btn_resfreshClick(btn_resfresh);
    //qry268.last;
   end;
  finally
   Lfrm.free;
  end;
end;

procedure TfrmMain.mni_checkClick(Sender: TObject);
var
  Lfrm:Tfrmedit;
begin
  LFrm:=TfrmEdit.Create(self);
  try
   LFrm.FEditType:=2;
   LFrm.Getdata(qry268.fieldbyname('rkey').asstring);
   if LFrm.ShowModal=mrok then
   begin
    btn_resfreshClick(btn_resfresh);
    //qry268.last;
   end;
  finally
   Lfrm.free;
  end;
end;

procedure TfrmMain.mni_DelClick(Sender: TObject);
var
  Lsql:string;
begin
  if  ((strtoint(vprev) = 1) or (strtoint(vprev) = 3)) then
  begin
  messagedlg('对不起!您没有该程序的可写权限', mtinformation, [mbok], 0);
  exit;
  end;

  if qry268.IsEmpty  then exit;
  if qry268.FieldByName('status').asinteger>0  then
  begin
  ShowMessage('已提交不能审核');
  exit;
  end;
 if Application.Messagebox('确认要删除吗！', '提示',mb_Iconinformation+MB_OKCANCEL) = mrCancel then exit;
  Lsql:='delete from data0268  where rkey='+qry268.fieldbyname('rkey').asstring;
  dm.execsql(dm.qrytemp,Lsql);
  btn_resfreshClick(btn_resfresh);
end;

procedure TfrmMain.mni_rePrtClick(Sender: TObject);
begin
   if strtoint(vprev)<>4 then
  begin
    messagedlg('对不起!您没有允许重印的权限',mtinformation,[mbok],0);
    exit;
  end;
          //Prted
  if qry268.FieldByName('Prted').AsBoolean then
  begin
  qry268.Edit;
  qry268.FieldByName('Prted').Value:=false;
  qry268.Post;
  end;
  btn_resfreshClick(btn_resfresh);
end;

procedure TfrmMain.mni_auditInfoClick(Sender: TObject);
var
 LFrm:TfrmAuthInfo;
begin
     try     //审核inf
     LFrm:=TfrmAuthInfo.Create(nil);
     LFrm.Getdata(qry268.fieldbyname('rkey').asstring);
     LFrm.ShowModal;
   finally
     LFrm.Free;
   end;
end;

procedure TfrmMain.mni_submitClick(Sender: TObject);
var
  Lsql:string;
  iRank:integer;
begin
  if not (strtoint(vprev)in [2,3,4]) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    Exit;
  end;
  try
      dm.con1.BeginTrans;

      Lsql:='DELETE FROM DATA0368  WHERE APPLY_PTR='+qry268.fieldbyname('RKEY').AsString;
      DM.execsql(dm.qrytemp,Lsql);

      Lsql:='SELECT * FROM DATA0275 WHERE auth_group_ptr='+qry268.fieldbyname('Auth_PTR').AsString+' ORDER BY RKEY';
      dm.OpenQry(dm.qrytemp,Lsql);

      iRank:=1;
      WHILE NOT dm.qrytemp.Eof DO
      BEGIN

        IF IrANK=1 THEN
         Lsql:='INSERT INTO DATA0368(APPLY_PTR,USER_PTR,RANKING,AUTH_FLAG) '+
                             'VALUES('+qry268.fieldbyname('rkey').AsString+','+dm.qrytemp.FieldByName('USER_PTR').AsString+','+
                             INTTOSTR(IrANK)+',''y'')'
        ELSE
         Lsql:='INSERT INTO DATA0368(APPLY_PTR,USER_PTR,RANKING,AUTH_FLAG) '+
                             'VALUES('+qry268.fieldbyname('rkey').AsString+','+dm.qrytemp.FieldByName('USER_PTR').AsString+','+
                             INTTOSTR(IrANK)+',''n'')';
       dm.execsql(dm.qrytemp2,Lsql);
        INC(IrANK);
        dm.qrytemp.Next;
      END;
      qry268.Edit;
      qry268.fieldbyname('status').Value:=1;
      qry268.Post;
     dm.con1.CommitTrans;
     btn_resfreshClick(btn_resfresh);
     showmessage('提交成功！');
  except
    dm.con1.RollbackTrans;
    showmessage('数据提交出现错误,请与管理员联系!!!');
  end;
end;

procedure TfrmMain.mni_cancelSubmitClick(Sender: TObject);
var
  Lsql:string;
begin
  if not (strtoint(vprev)in [2,3,4]) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    Exit;
  end;

  if messagebox(Self.Handle,'你确定要取消提交吗？','提示',MB_YesNo+MB_iconquestion)=idno then exit;
 
    try
      dm.con1.BeginTrans;

      qry268.Edit;
      qry268.fieldbyname('status').value:=0;
      qry268.FieldByName('Auth_emplptr').Value:=null;
      qry268.FieldByName('Auth_date').Value:=null ;
      qry268.Post;

     Lsql:='delete from data0368  where apply_ptr='+qry268.fieldbyname('rkey').AsString;
     DM.execsql(dm.qrytemp,Lsql);

      dm.con1.CommitTrans;
      btn_resfreshClick(btn_resfresh);
      showmessage('取消成功！');
    except
      on e:Exception do
      begin
        dm.con1.RollbackTrans;
        ShowMessage('取消提交失败！'+#13#10+e.Message);
      end;
    end;
end;

procedure TfrmMain.mni_dataAnalyseClick(Sender: TObject);
var
 LFrm:TfrmReqDetail;
begin
     try      
     LFrm:=TfrmReqDetail.Create(nil);
     LFrm.Getdata;
     LFrm.ShowModal;
   finally
     LFrm.Free;
   end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin

//  rkey73:= '3202';
//  user_ptr := '3301';
//  vprev := '4';

  if not App_Init_2(dm.con1 ) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
    exit;
  end;

  Caption := application.Title;
end;

procedure TfrmMain.btn_QryClick(Sender: TObject);
var
Qrystr: string;
i:Integer;
Lfrm: Tfrmqry;
begin
qrystr:='';
 Lfrm:=TFrmQry.create(self);
  try
  if Lfrm.showmodal=mrok then
   begin
     for i:=0  to Lfrm.sg1.RowCount-2 do
     begin
      qrystr:=qrystr+ Lfrm.sg1.Cells[2,i]
     end;
     qrystr:=qrystr+' and data0268.date>='''+formatdatetime('yyyy-MM-dd',Lfrm.dtp3.date)+''' and  data0268.date<= '''+formatdatetime('yyyy-MM-dd',Lfrm.dtp4.date)+''' order by data0268.date' ;
     FQryStr:=qrystr;
    // qry_trainrecord.SQL.Text:= FMSql5+qrystr;
    // showmessage(FMSql5+qrystr);
     try
     // eh468.DataSource:=ds468;
      dm.OpenQry(qry268,FMSql+FQryStr);
      except on e: exception do
      begin
      ShowMessage('错误：' +e.Message);
      exit;
      end;
     end;
    end;
  finally
   Lfrm.free;
  end;
end;

procedure TfrmMain.pm1Popup(Sender: TObject);
begin
 mni_edit.Enabled:=(qry268.FieldByName('status').AsInteger=0);
 mni_Del.Enabled:=mni_edit.Enabled;
 mni_submit.Enabled:=(qry268.FieldByName('status').AsInteger=0);
 mni_cancelSubmit.Enabled:=((not mni_submit.Enabled) and (qry268.FieldByName('status').AsInteger<2) );
 mni_prt.Enabled:=(qry268.FieldByName('status').AsInteger=2) and (qry268.FieldByName('Prted').Value=false);
 mni_rePrt.Enabled:=(qry268.FieldByName('prted').AsBoolean);
 mni_auditInfo.Enabled:=(qry268.FieldByName('status').AsInteger>0);

end;

procedure TfrmMain.eh268DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  if qry268.FieldByName('status').Value = 3 then
     eh268.Canvas.Font.Color := clred
  else if qry268.FieldByName('status').Value = 2 then
     eh268.Canvas.Font.Color := clTeal //cllime
  else if qry268.FieldByName('status').Value = 1 then
     eh268.Canvas.Font.Color := clfuchsia
  else if qry268.FieldByName('status').Value = 4 then
     eh268.Canvas.Font.Color := clGreen;
  eh268.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmMain.btnreqDetail2Click(Sender: TObject);
var
  LFrm: TfrmReqDetail2;
begin
  Lfrm:=TfrmReqDetail2.Create(nil);
 try
    LFrm.qry1.Close;
    LFrm.qry1.Parameters.ParamValues['dtpk1']:= LFrm.dtpk1.Date;
    LFrm.qry1.Parameters.ParamValues['dtpk2']:=LFrm.dtpk2.Date+1;
    LFrm.qry1.Open;
    Lfrm.ShowModal;
 finally
  Lfrm.Free;
 end;
end;

end.
