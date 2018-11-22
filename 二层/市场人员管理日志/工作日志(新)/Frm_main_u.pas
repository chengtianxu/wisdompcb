unit Frm_main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons, Menus, DB,ComObj, Excel97,
  ADODB, ppDB, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppEndUsr,
  ppProd, ppReport, ppComm, ppRelatv, ppDBPipe, ppModule, raCodMod,
  ppStrtch, ppMemo, ppSubRpt, ComCtrls, DBCtrls, Mask, DBCtrlsEh, DBGrids;

type
  TFrm_main = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BtClose: TBitBtn;
    BtBrush: TBitBtn;
    BtQry: TBitBtn;
    Edit1: TEdit;
    Panel3: TPanel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N7: TMenuItem;
    N5: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Grd1: TDBGridEh;
    N6: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    MaskEdit1: TMaskEdit;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Panel4: TPanel;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    SGrd2: TStringGrid;
    PageControl3: TPageControl;
    TabSheet4: TTabSheet;
    sGrd1: TStringGrid;
    DBCheckBoxEh1: TDBCheckBoxEh;
    PageControl4: TPageControl;
    TabSheet5: TTabSheet;
    DBMemo1: TDBMemo;
    Panel5: TPanel;
    Panel6: TPanel;
    PageControl6: TPageControl;
    TabSheet6: TTabSheet;
    DBMemo4: TDBMemo;
    PageControl8: TPageControl;
    TabSheet8: TTabSheet;
    DBMemo6: TDBMemo;
    PageControl5: TPageControl;
    TabSheet7: TTabSheet;
    DBMemo2: TDBMemo;
    Panel7: TPanel;
    PageControl7: TPageControl;
    TabSheet9: TTabSheet;
    DBMemo5: TDBMemo;
    PageControl9: TPageControl;
    TabSheet10: TTabSheet;
    DBMemo3: TDBMemo;
    PageControl10: TPageControl;
    TabSheet11: TTabSheet;
    DBMemo7: TDBMemo;
    DBDateTimeEditEh2: TDBDateTimeEditEh;
    PageControl11: TPageControl;
    TabSheet12: TTabSheet;
    DBMemo8: TDBMemo;
    Label4: TLabel;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    DBDateTimeEditEh3: TDBDateTimeEditEh;
    BitExcel: TBitBtn;
    BitBtn1: TBitBtn;
    N10: TMenuItem;
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
    procedure FormShow(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure BitExcelClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Grd1CellClick(Column: TColumnEh);
    procedure Grd1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    PreColumn: TColumnEh;
    field_name:string;
    sSql :string;
    FCondition:string;
    FisWrite,FisAudit,FisAudit_self:boolean;
    procedure init;
  public

  end;

var
  Frm_main: TFrm_main;

implementation
 uses common,DM_u,Frm_QrySet_u,Frm_detail_u,Frm_YS_u,report_data,
  PasVisitQry;
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
//  rkey73:='2525';//851';// '785';
//  vprev := '4';

  ShortTimeFormat:='HH:mm:ss';   //24小时制
  LongTimeFormat:='HH:mm:ss';
  DateSeparator := '-';
  shortDateFormat := 'yyyy-mm-dd';
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
  if DM.ADO721.IsEmpty then exit;
  i := DM.ADO721rkey.AsInteger ;
  DM.ADO721.Close;
  DM.ADO721.Open;
  DM.ADO721.Locate('rkey',i,[]);
end;

procedure TFrm_main.Grd1TitleClick(Column: TColumnEh);
begin
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.ADO721.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.ADO721.Sort:=Column.FieldName+' DESC';
  end;

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

procedure TFrm_main.init;
begin
  field_name := Grd1.Columns[0].FieldName;
  PreColumn := Grd1.Columns[0];
  Grd1.Columns[0].Title.Color := clred ;

  DM.tmp.Close;
  DM.tmp.SQL.Text:='select * from data0720 where rkey73='+rkey73 ;
  DM.tmp.Open;
  FisAudit:=DM.tmp.Locate('ttype',0,[]);    //可审
  FisWrite:=DM.tmp.Locate('ttype',1,[]);    //可写

  DM.tmp.Close;
  DM.tmp.SQL.Text:='select d720_0.GrpName,d720_0.rkey73 from data0720 d720_0 inner join data0720 d720_1 on d720_0.GrpName=d720_1.GrpName '+
                   'and d720_0.ttype<>d720_1.ttype and d720_0.rkey73=d720_1.rkey73 '+
                   'where d720_1.rkey73='+rkey73 +
                   'group by d720_0.GrpName,d720_0.rkey73 having count(*)>1';
  DM.tmp.Open;
  FisAudit_self:=not DM.tmp.IsEmpty;    //可审自己
  DM.tmp.Close;
  if (vprev='1') or ((vprev='2')) then                                      //1.只能看自己,2.编辑自己的
    FCondition:=' where (data0721.salesID='+rkey73+')'
  else if vprev='3' then                                                    //3.可看所有的,不能编辑、不能审核
    FCondition:=' where (1=1)'
  else
                                                                            //4.审核权限定义的,编辑自己
    FCondition:=' where data0721.salesID='+rkey73+' or '+
                '(data0721.salesID in (select rkey73 from data0720 where ttype=1 and grpName in (select distinct grpname from data0720 where rkey73='+rkey73+' and ttype=0))) ';


  sSql:=DM.ADO721.SQL.Text+FCondition ;
  DM.ADO721.SQL.Text:=sSql+' and (data0721.vistdate>getdate()-15 or data0721.status<>2) order by data0721.LogNo';
  DM.ADO721.Open;

  SGrd1.Cells[0,0]:='姓名';
  SGrd1.Cells[1,0]:='部门';
  SGrd1.Cells[2,0]:='职务';
  SGrd2.Cells[0,0]:='姓名';
  SGrd2.Cells[1,0]:='部门';
  SGrd2.Cells[2,0]:='职务';
  SGrd2.Cells[3,0]:='手机';
end;

procedure TFrm_main.Grd1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  if dm.ADO721status.Value = 3 then
     Grd1.Canvas.Font.Color := clred
  else if dm.ADO721status.Value = 1 then
     Grd1.Canvas.Font.Color := clTeal
  else if dm.ADO721status.Value = 2 then
     Grd1.Canvas.Font.Color := clGreen;
  Grd1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;


procedure TFrm_main.PopupMenu1Popup(Sender: TObject);
begin
  n1.Enabled:=(vprev='2') or ((vprev='4') and FisWrite) ; //and FisWrite;

  if DM.ADO721.IsEmpty then
  begin
    n2.Enabled:=false;    //编辑
    n3.Enabled:=false;    //提交审批
    n4.Enabled:=false;    //删除
    n5.Enabled:=false;    //cancel
    n6.Enabled:=false;    //审核
    n9.Enabled:=false;   //prt
    n10.Enabled:=false;   //prt
  end
  else       //FisWrite,FisAudit
  begin
    n2.Enabled:=((vprev='2') or  ((vprev='4') and FisWrite)) and (dm.ADO721status.Value=0) and (rkey73=DM.ADO721salesID.AsString) or (dm.ADO721status.Value=3) ;
    n3.Enabled:=n2.Enabled and (dm.ADO721status.Value=0) ;
    n4.Enabled :=n2.Enabled and (dm.ADO721status.Value=0);
    n5.Enabled:=((vprev='2') or ((vprev='4') and FisWrite)) and (dm.ADO721status.Value=1) and (rkey73=DM.ADO721salesID.AsString) ;
    n6.Enabled:=((vprev='4') and (dm.ADO721status.Value=1) and ((((rkey73=DM.ADO721salesID.AsString) and FisAudit_self)) or (rkey73<>DM.ADO721salesID.AsString))) ; //4.审核权限定义的,编辑自己
    n9.Enabled:=vprev<>'1';
    N10.Enabled:=dm.ADO721status.Value=2;
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
    DM.ADO721.SQL.Text:=sSql+' and data0721.ent_date>='''+formatdatetime('YYYY/MM/DD',Frm_QrySet.DateTimePicker1.Date)+
                           ''' and data0721.ent_date-1<='''+formatdatetime('YYYY/MM/DD',Frm_QrySet.DateTimePicker2.Date)+''' '+Sqlstr+
                           ' order by data0721.LogNo';
    DM.ADO721.Close;
    DM.ADO721.Open;
  end;
end;

procedure TFrm_main.Grd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.ADO721.SQL.Text);
end;

procedure TFrm_main.N1Click(Sender: TObject);
var j:Integer;
    sVit:string;
begin
  case Tmenuitem(Sender).Tag of
  0,1: with TFrm_detail.Create(nil) do
       try
         Ftag:=Tmenuitem(Sender).Tag;
         initd;
         if showmodal=mrok then
         begin
           DM.ADO721.Close;
           DM.ADO721.Open;
           DM.ADO721.Locate('rkey',Frkey721,[]);
           Grd1CellClick(nil);
         end;
       finally
         free;
         DM.ADO721_1.Close;
         DM.ADO721_1.Close;
       end;

   2: begin   //提交审批
        DM.tmp.Close;
        DM.tmp.SQL.Text:='update data0721 set status=1 where rkey='+DM.ADO721rkey.AsString+' and status=0' ;
        if DM.tmp.ExecSQL=0 then
          showmessage('此日志状态发生改变而未能成功提交!');
        BtBrushClick(nil);
     end;

   3: begin
        if MessageBox(Handle,'确定删除此日志吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
          DM.tmp.Close;
          DM.tmp.SQL.Text:='delete from data0721 where rkey='+DM.ADO721rkey.AsString+' and status=0' ;
          if DM.tmp.ExecSQL<>1 then
            showmessage('删除数据失败,数据状态已发生变化...');
          BtBrushClick(nil);
      end;

   4: begin
        if MessageBox(Handle,'确定取消提交吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
          DM.tmp.Close;
          DM.tmp.SQL.Text:='update data0721 set status=0 where rkey='+DM.ADO721rkey.AsString+' and status=1' ;
          if DM.tmp.ExecSQL<>1 then
            showmessage('取消提交此日志失败,数据状态已发生变化...');
          BtBrushClick(nil);
      end;
      
   5: with TFrm_YS.Create(nil) do
      try
        if showmodal=mrok then
        begin
          DM.tmp.Close;
          DM.tmp.SQL.Text:='update data0721 set status=2,Auditdate=getdate()'+
                           ',AuditID='+rkey73+
                           ',AuditRemark='''+Memo1.Text+'''  where rkey='+DM.ADO721rkey.AsString+' and status=1' ;
          if DM.tmp.ExecSQL<>1 then
            showmessage('审核拜访此日志失败,数据状态已发生变化...');
          BtBrushClick(nil);
        end;
      finally
        free
      end;
   7:begin
        DM.tmp.Close;
        DM.tmp.SQL.Text:='update data0721 set status=3,Auditdate=getdate(),AuditID='+rkey73+',AuditRemark='''' where rkey='+DM.ADO721rkey.AsString+' and status=2' ;
        if DM.tmp.ExecSQL<>1 then
          showmessage('取消审核失败,数据状态已发生变化...');
        BtBrushClick(nil);
     end;
   6:
      with TForm_report.Create(nil) do
      try
        ppReport1.Reset;
        ppReport1.Template.FileName :=
          stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
          'sale_Log.rtm';
        ppReport1.Template.LoadFromFile;
        ppLabel24.Caption:=sGrd1.Cells[0,1];
        ppLabel25.Caption:=sGrd1.Cells[1,1];
        ppLabel26.Caption:=sGrd1.Cells[2,1];
        ppLabel27.Caption:=sGrd1.Cells[0,2];
        ppLabel28.Caption:=sGrd1.Cells[1,2];
        ppLabel29.Caption:=sGrd1.Cells[2,2];
        ppLabel30.Caption:=sGrd1.Cells[0,3];
        ppLabel31.Caption:=sGrd1.Cells[1,3];
        ppLabel32.Caption:=sGrd1.Cells[2,3];
        ppLabel33.Caption:=sGrd1.Cells[0,4];
        ppLabel34.Caption:=sGrd1.Cells[1,4];
        ppLabel35.Caption:=sGrd1.Cells[2,4];

        ppLabel36.Caption:=sGrd2.Cells[0,1];
        ppLabel37.Caption:=sGrd2.Cells[1,1];
        ppLabel38.Caption:=sGrd2.Cells[2,1];
        ppLabel50.Caption:=sGrd2.Cells[3,1];
        ppLabel39.Caption:=sGrd2.Cells[0,2];
        ppLabel40.Caption:=sGrd2.Cells[1,2];
        ppLabel41.Caption:=sGrd2.Cells[2,2];
        ppLabel51.Caption:=sGrd2.Cells[3,2];
        ppLabel42.Caption:=sGrd2.Cells[0,3];
        ppLabel43.Caption:=sGrd2.Cells[1,3];
        ppLabel44.Caption:=sGrd2.Cells[2,3];
        ppLabel52.Caption:=sGrd2.Cells[3,3];
        ppLabel45.Caption:=sGrd2.Cells[0,4];
        ppLabel46.Caption:=sGrd2.Cells[1,4];
        ppLabel47.Caption:=sGrd2.Cells[2,4];
        ppLabel53.Caption:=sGrd2.Cells[3,4];
        ppreport1.SaveAsTemplate:=false;
        ppReport1.Print;
      finally
        free;
      end;
  end;
end;


procedure TFrm_main.FormShow(Sender: TObject);
begin
  init;
  Grd1TitleClick(PreColumn);
  PageControl1.ActivePage:=TabSheet1;
end;

procedure TFrm_main.PageControl1Change(Sender: TObject);
var sVit:string;
begin
  if (PageControl1.ActivePageIndex=1) and (DM.ADO721LogNo.AsString<>MaskEdit1.Text) then
  begin
    sVit:=DM.ADO721.FieldByName('visitors').AsString;
    split(sVit, SGrd1);
    sVit:=DM.ADO721.FieldByName('visitedMan').AsString;
    if SGrd2.ColCount=4 then
    split2(sVit, SGrd2)
    else
    split(sVit, SGrd2);
    MaskEdit1.Text:=DM.ADO721.Fieldbyname('LogNo').AsString;
  end;
end;

procedure TFrm_main.BitExcelClick(Sender: TObject);
begin
 export_dbgrideh_to_excel(grd1,self.Caption);
end;

procedure TFrm_main.BitBtn1Click(Sender: TObject);
begin
  frmVisitQry:=TfrmVisitQry.Create(application);
  frmVisitQry.ShowModal;
  frmVisitQry.Free;
end;

procedure TFrm_main.Grd1CellClick(Column: TColumnEh);
var sVit:string;
begin
  sVit:=DM.ADO721.FieldByName('visitors').AsString;
  split(sVit,sGrd1);
  sVit:=DM.ADO721.FieldByName('visitedMan').AsString;
  if (SGrd2.ColCount=4) then
  split2(sVit, SGrd2)
  else
  split(sVit, SGrd2);
end;

procedure TFrm_main.Grd1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbRight then
  begin
    Grd1.SelectedRows.Clear;
    Grd1.SelectedRows.CurrentRowSelected:=True;
    Grd1CellClick(nil);
  end;
end;

end.
