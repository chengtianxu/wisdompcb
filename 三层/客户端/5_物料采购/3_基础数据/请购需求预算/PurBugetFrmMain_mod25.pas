unit PurBugetFrmMain_mod25;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseMainFrm, uCommFunc,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB,
  Vcl.XPMan, Vcl.Menus, Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls, Data.Win.ADODB,system.DateUtils;

type
  TfrmMainPurBuget_Mod25 = class(TfrmBaseMain)
    pnlDetail: TPanel;
    eh363: TDBGridEh;
    ds363: TDataSource;
    cds363: TClientDataSet;
    qrytemp: TADOQuery;
    qrytempUSER_FULL_NAME: TStringField;
    qrytempUSER_LOGIN_NAME: TStringField;
    qrytempACTIVE_FLAG: TStringField;
    mniAdd: TMenuItem;
    mniEdit: TMenuItem;
    mniCopy: TMenuItem;
    mniDel: TMenuItem;
    mniDelOEmp: TMenuItem;
    cdsTemp: TClientDataSet;
    btn1: TButton;
    procedure cdsMainAfterScroll(DataSet: TDataSet);
    procedure btnQryClick(Sender: TObject);
    procedure mniAddClick(Sender: TObject);
    procedure mniDelClick(Sender: TObject);
    procedure mniCopyClick(Sender: TObject);
    procedure mniDelOEmpClick(Sender: TObject);
    procedure mniEditClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pmMainPopup(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     procedure GetData(); override;
  end;

var
  frmMainPurBuget_Mod25: TfrmMainPurBuget_Mod25;

implementation
    uses EditFrm_mod25;
{$R *.dfm}

{ TfrmMainPurBuget_Mod25 }

procedure TfrmMainPurBuget_Mod25.btn1Click(Sender: TObject);
var
Lsql:string;

begin
  inherited;

    Lsql:='select * from data0362 where rkey=2';

   gSvrIntf.IntfGetDataBySql(Lsql,cdsTemp);

   showmessage(inttostr(cdstemp.recordcount));


end;

procedure TfrmMainPurBuget_Mod25.btnQryClick(Sender: TObject);
begin
    FMainWhereID:=0;
//  if cdsMainWhereInit.IsEmpty then
//  begin
//    cdsMainWhereInit.Append;
//    cdsMainWhereInit.FieldByName('FieldName').AsString := 'data0268.date';
//    cdsMainWhereInit.FieldByName('Oper').AsString := 'Çø¼ä';
//    cdsMainWhereInit.FieldByName('FieldValue').AsString := FormatDateTime('YYYY-MM-DD',gFunc.GetSvrDateTime-1) +
//                                  ' AND ' + FormatDateTime('YYYY-MM-DD',gFunc.GetSvrDateTime+1);
//    cdsMainWhereInit.FieldByName('SeqNo').AsString := '7';
//    cdsMainWhereInit.Post;
//  end;
  inherited;

end;

procedure TfrmMainPurBuget_Mod25.cdsMainAfterScroll(DataSet: TDataSet);
begin
  inherited;
    if cdsMain.FieldByName('rkey').AsString = '' then
  begin
    gSvrintf.IntfGetDataBySql(cds363.CommandText +
      ' and dbo.data0363.BUDGET_PTR=-1', cds363);
    exit;
  end;
  gSvrintf.IntfGetDataBySql(cds363.CommandText + ' and dbo.data0363.BUDGET_PTR=' +
    cdsMain.FieldByName('rkey').AsString, cds363);
end;

procedure TfrmMainPurBuget_Mod25.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   frmMainPurBuget_Mod25:=nil;
end;

procedure TfrmMainPurBuget_Mod25.GetData;
var
Lsql262,Lsql263:string;
begin
  try
  try
    FMainFrmSql :=
      ' select rkey ,CODE,DESCRIPTION,bud_year, '+
      ' BUDGET_PERIOD_1, BUDGET_PERIOD_2,'+
      ' BUDGET_PERIOD_3, BUDGET_PERIOD_4,'+
      ' BUDGET_PERIOD_5, BUDGET_PERIOD_6,'+
      ' BUDGET_PERIOD_7, BUDGET_PERIOD_8,'+
      ' BUDGET_PERIOD_9, BUDGET_PERIOD_10,'+
      ' BUDGET_PERIOD_11, BUDGET_PERIOD_12,'+
      ' USED_PERIOD_1, USED_PERIOD_2, USED_PERIOD_3,'+
      ' USED_PERIOD_4, USED_PERIOD_5, USED_PERIOD_6,'+
      ' USED_PERIOD_7, USED_PERIOD_8, USED_PERIOD_9,'+
      ' USED_PERIOD_10, USED_PERIOD_11, USED_PERIOD_12'+
      ' from data0362 '+
      ' where 1= 1 ';

     if trim(FMainWhere) = '' then
     FMainWhere := ' and bud_year= '+inttostr(yearof(gFunc.GetSvrDateTime)) ;

     FOrderby := '  order by rkey  ';
    // showmessage(FMainFrmSql+FMainWhere+FOrderby);
    inherited;
    if cdsMain.FieldByName('rkey').AsString = '' then
    begin
      gSvrintf.IntfGetDataBySql(cds363.CommandText +
        ' and dbo.data0363.BUDGET_PTR=-1', cds363);
      exit;
    end;

  finally
    cdsTemp.Free;
  end;
  except on e:Exception do
  begin
  ShowMessage('´íÎó£º'+e.Message);
  exit;
  end;

  end;
end;

procedure TfrmMainPurBuget_Mod25.mniAddClick(Sender: TObject);
var
 i:integer;
 Lfrm:TfrmEdit_mod25;
begin
  inherited;
   if not gfunc.CheckUserAuth(2, 25) then exit;


  //if Lfrm=nil then
   Lfrm:=TfrmEdit_mod25.Create(self);
   try

   Lfrm.GetData('-1');
   Lfrm.FEditType:=1;
     for i:=1 to 12 do
      begin
       Lfrm.sg362.Cells[1,i] := '0.00';
       Lfrm.sg362.Cells[2,i] := '0.00';
      end ;

    lfrm.pnl3.Enabled:=True;
    Lfrm.eh363.Enabled:=True;
    Lfrm.sg362.Enabled:=true;
    Lfrm.btnSave.Enabled:=True;
    Lfrm.btnClose.Enabled:=true;

   if  Lfrm.Showmodal=mrok then
   begin
   btnRefreshClick(Sender);
   cdsmain.last;
   end;
  finally
   Lfrm.Free;
  end;

end;

procedure TfrmMainPurBuget_Mod25.mniEditClick(Sender: TObject);
var
 i,Lrkey:integer;
 Lfrm:  TfrmEdit_mod25;
begin
  inherited;
   if not gfunc.CheckUserAuth(2, 25) then exit;

   Lrkey:=cdsMain.FieldByName('rkey').AsInteger;
   Lfrm:=TfrmEdit_mod25.Create(self);
   try
   Lfrm.GetData(cdsMain.FieldByName('rkey').AsString);
   Lfrm.FEditType:=2;
//    frmEdit_mod25.edt_BCode.Text := frmEdit_mod25.cds362.FieldByName('code').asstring;
//    frmEdit_mod25.edt_BName.Text := frmEdit_mod25.cds362.FieldByName('DESCRIPTION').asstring;
    Lfrm.se_BYear.Value :=Lfrm.cds362.FieldByName('bud_year').value;
    for i := 1 to 12 do
    begin
       Lfrm.sg362.Cells[1,i] := FormatFloat('0.00',Lfrm.cds362.FieldByName('BUDGET_PERIOD_'+inttostr(i)).AsFloat);
       Lfrm.sg362.Cells[2,i] := FormatFloat('0.00',Lfrm.cds362.FieldByName('USED_PERIOD_'+inttostr(i)).AsFloat);
    end;

     lfrm.pnl3.Enabled:=True;
    Lfrm.eh363.Enabled:=True;
    Lfrm.sg362.Enabled:=true;
    Lfrm.btnSave.Enabled:=True;
    Lfrm.btnClose.Enabled:=true;

   if  Lfrm.Showmodal=mrok then
   begin
    btnRefreshClick(Sender);
    cdsMain.Locate('rkey',Lrkey,[]);
   end;
  finally
   Lfrm.Free;
  end;

end;
procedure TfrmMainPurBuget_Mod25.pmMainPopup(Sender: TObject);
begin
  inherited;

   mniEdit.Enabled:=(not cdsMain.IsEmpty);
   mniDel.Enabled:=   mniEdit.Enabled;
   mniDelOEmp.Enabled:= mniEdit.Enabled ;
   mniCopy.Enabled:= mniEdit.Enabled;


end;

procedure TfrmMainPurBuget_Mod25.mniCopyClick(Sender: TObject);
var
 i,Lrkey:integer;
 Lfrm:TfrmEdit_mod25;
begin
  inherited;
   if not gfunc.CheckUserAuth(2, 25) then exit;

   Lrkey:= cdsMain.FieldByName('rkey').AsInteger;

   Lfrm:=TfrmEdit_mod25.Create(self);


  try

   Lfrm.GetData(cdsMain.FieldByName('rkey').AsString);
   Lfrm.FEditType:=3;

   Lfrm.edt_BCode.Text :='';
   // frmEdit_mod25.edt_BName.Text := frmEdit_mod25.cds362.FieldByName('DESCRIPTION').asstring;
    Lfrm.se_BYear.Value :=Lfrm.cds362.FieldByName('bud_year').value;
    for i := 1 to 12 do
    begin
       Lfrm.sg362.Cells[1,i] := '0.00';
       Lfrm.sg362.Cells[2,i] := '0.00';
    end;

   if  Lfrm.Showmodal=mrok then
   begin
    btnRefreshClick(Sender);
    cdsMain.Locate('rkey',Lrkey,[]);
   end;

   if  Lfrm.Showmodal=mrok then
   begin
   btnRefreshClick(Sender);
   cdsmain.last;
   end;
  finally
   Lfrm.Free;
  end;


end;

procedure TfrmMainPurBuget_Mod25.mniDelClick(Sender: TObject);
var
Lsql:string;

begin
  inherited;
   if not gfunc.CheckUserAuth(2, 25) then exit;

   if cdsMain.IsEmpty then   exit;
    Lsql:='select * from data0362 where rkey='+cdsMain.FieldByName('rkey').AsString;

   gSvrIntf.IntfGetDataBySql(Lsql,cdsTemp);

  if not cdsTemp.IsEmpty then
    cdsTemp.Delete;

  if not gSvrintf.IntfPostDataByTable('data0362', cdsTemp.Delta) then
    exit;

  btnRefreshClick(Sender);
end;

procedure TfrmMainPurBuget_Mod25.mniDelOEmpClick(Sender: TObject);
var
 Lsql:string;
begin
  inherited;
 if not gfunc.CheckUserAuth(2, 25) then exit;
 Lsql:='select  * from data0363  '+
       ' where  data0363.BUDGET_PTR='+cdsMain.FieldByName('rkey').AsString+
       ' and exists(select RKEY from Data0073 d73 where d73.RKEY=Data0363.user_ptr and active_flag=1 ) ';

   gSvrIntf.IntfGetDataBySql(Lsql,cdsTemp);

  if not cdstemp.isempty  then
  begin
  cdsTemp.first;
  while  not cdsTemp.eof do
  cdsTemp.Delete;
  if not gSvrintf.IntfPostDataByTable('data0363', cdstemp.Delta) then  exit;
  btnRefreshClick(Sender);
  end;
end;


end.
