unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons, Menus, DB,ComObj, Excel97,
  ADODB, ppDB, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppEndUsr,
  ppProd, ppReport, ppComm, ppRelatv, ppDBPipe, ppModule, raCodMod,
  ppStrtch, ppMemo, ppSubRpt, ComCtrls, DBCtrls, Mask, DBCtrlsEh, DBGrids;
type
  TForm_Main = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BtClose: TBitBtn;
    BtBrush: TBitBtn;
    Edit1: TEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Grd1: TDBGridEh;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtn6: TBitBtn;
    out_report: TPopupMenu;
    Z1: TMenuItem;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N7: TMenuItem;
    N6: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N3: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBMemo1: TDBMemo;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBMemo2: TDBMemo;
    Label13: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit10: TDBEdit;
    MaskEdit1: TMaskEdit;
    BtQry: TBitBtn;
    procedure BtCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BtBrushClick(Sender: TObject);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure Grd1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure Grd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Z1Click(Sender: TObject);
    procedure BtQryClick(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name:string;
    sSql :string;
    FCondition:string;
    FisWrite,FisAudit,FisAudit_self:boolean;
    procedure init;
  public
    { Public declarations }
  end;

var
  Form_Main: TForm_Main;
 

implementation

uses demo, detail,common, audit, report_data, Condition;

{$R *.dfm}

procedure TForm_Main.BtCloseClick(Sender: TObject);
begin
application.Terminate;
end;

procedure TForm_Main.FormCreate(Sender: TObject);
begin
  if not App_Init_2(dm.ADOConnection1 ) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
    exit;
  end;

  //dm.ADOConnection1.Open;
  //rkey73:='1587';
  //vprev := '4';
  dm.ADO723.Close;
  dm.ADO723.Open;
  ShortTimeFormat:='HH:mm:ss';   //24小时制
  LongTimeFormat:='HH:mm:ss';
  DateSeparator := '-';
  shortDateFormat := 'yyyy-mm-dd';
  init;
end;

procedure TForm_Main.init;
begin
  field_name := Grd1.Columns[0].FieldName;
  PreColumn := Grd1.Columns[0];
  Grd1.Columns[0].Title.Color := clred ;
  dm.adotemp.Close;
  dm.adotemp.SQL.Text:='select * from data0720 where rkey73='+rkey73 ;//
  dm.adotemp.Open;
  FisAudit:=dm.adotemp.Locate('ttype',0,[]);    //可审
  FisWrite:=dm.adotemp.Locate('ttype',1,[]);    //可写
  dm.adotemp.Close;
  dm.adotemp.SQL.Text:='select d720_0.GrpName,d720_0.rkey73 from data0720 d720_0 inner join data0720 d720_1 on d720_0.GrpName=d720_1.GrpName '+
                   'and d720_0.ttype<>d720_1.ttype and d720_0.rkey73=d720_1.rkey73 '+
                   'where d720_1.rkey73='+rkey73+
                   'group by d720_0.GrpName,d720_0.rkey73 having count(*)>1';
  dm.adotemp.Open;
  FisAudit_self:=not dm.adotemp.IsEmpty;    //可审自己
  dm.adotemp.Close;
  if (vprev='1') or ((vprev='2')) then                                      //1.只能看自己,2.编辑自己的
    FCondition:='and(data0723.salesID='+rkey73+')'
  else if vprev='3' then                                                    //3.可看所有的,不能编辑、不能审核
    FCondition:=' and (1=1)'
  else                                                                      //4.审核权限定义的,编辑自己

    FCondition:='and (data0723.salesID='+rkey73+' or '+
                '(data0723.salesID in (select rkey73 from data0720 where ttype=1 and grpName in (select distinct grpname from data0720 where rkey73='+rkey73+' and ttype=0)))) ';
  sSql:=dm.ADO723.SQL.Text+FCondition ;
  dm.ADO723.SQL.Text:=sSql+'order by data0723.LogNo';
  dm.ADO723.Parameters[0].Value:=common.getsystem_date(dm.ADOtemp,1)-15;
  dm.ADO723.Parameters[1].Value:=common.getsystem_date(dm.ADOtemp,1)+1;
  dm.ADO723.Close;
  dm.ADO723.Open;
end;

procedure TForm_Main.Edit1Change(Sender: TObject);
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

procedure TForm_Main.BtBrushClick(Sender: TObject);
var
  ikey:string;
begin
  if dm.ADO723.IsEmpty then exit;
  ikey :=dm.ADO723LogNo.Value;
  DM.ADO723.Close;
  DM.ADO723.Open;
  DM.ADO723.Locate('LogNo',ikey,[]);
end;
procedure TForm_Main.Grd1TitleClick(Column: TColumnEh);
begin
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.ADO723.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.ADO723.Sort:=Column.FieldName+' DESC';
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
procedure TForm_Main.Grd1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  if dm.ADO723status.Value = 3 then
     Grd1.Canvas.Font.Color := clred
  else if dm.ADO723status.Value = 1 then
     Grd1.Canvas.Font.Color := clTeal
  else if dm.ADO723status.Value = 2 then
     Grd1.Canvas.Font.Color := clGreen;
  Grd1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;


procedure TForm_Main.Grd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.ADO723.SQL.Text);
end;


procedure TForm_Main.N1Click(Sender: TObject);
begin
  case Tmenuitem(Sender).Tag of
  0,1: with TForm_detail.Create(nil) do//新增和编辑
       try
         Ftag:=Tmenuitem(Sender).Tag;
         initd;
         if showmodal=mrok then
         begin
           dm.ADO723.Close;
           dm.ADO723.Open;
           dm.ADO723.Locate('LogNo',Fno723,[]);
         end;
       finally
         free;
         DM.ADO723_1.Close;
       end;
  2: begin  //删除
        if MessageBox(Handle,'确定删除此外出记录吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
          dm.ADOtemp.Close;
          dm.ADOtemp.SQL.Text:='delete from data0723 where LogNo=:Lno and status in (0,3)' ;
          dm.ADOtemp.Parameters[0].Value:=dm.ADO723LogNo.Value;
          if dm.ADOtemp.ExecSQL<>1 then
            showmessage('删除记录失败,此记录的状态不能进行此操作!');
          BtBrushClick(nil);
      end;
  3: begin   //提交审批
        dm.ADOtemp.Close;
        dm.ADOtemp.SQL.Text:='update data0723 set status=1 where LogNo=:LogNo and status in(0,3)' ;
        dm.ADOtemp.Parameters[0].Value:=dm.ADO723LogNo.Value;
        if dm.ADOtemp.ExecSQL=0 then
          showmessage('提交失败,此记录的状态不能进行此操作!');
        BtBrushClick(nil);
     end;

 

  4: begin //取消提交
        if MessageBox(Handle,'确定取消提交吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
          dm.ADOtemp.Close;
          dm.ADOtemp.SQL.Text:='update data0723 set status=0 where LogNo=:lno and status=1' ;
          dm.ADOtemp.Parameters[0].Value:=dm.ADO723LogNo.Value;
          if dm.ADOtemp.ExecSQL<>1 then
            showmessage('取消提交此外出记录失败,此记录的状态不能进行此操作!');
          BtBrushClick(nil);
      end;

  5: with TForm_Audit.Create(nil) do //审核
      try
        if showmodal=mrok then
        begin
          dm.ADOtemp.Close;
          dm.ADOtemp.SQL.Text:='update data0723 set status=2,Audit_date=getdate()'+
                           ',AuditID='+rkey73+
                           ',AuditRemark='''+Memo1.Text+'''  where logno=:lno and status=1' ;
          dm.ADOtemp.Parameters[0].Value:=dm.ADO723LogNo.Value;
          if dm.ADOtemp.ExecSQL<>1 then
            showmessage('审核外出记录失败,此记录的状态不能进行此操作!');
          BtBrushClick(nil);
        end;
      finally
        free
      end;
   6: //退回
        begin
        if MessageBox(Handle,'确定要退回吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
          dm.ADOtemp.Close;
          dm.ADOtemp.SQL.Text:='update data0723 set status=3 where LogNo=:no and status=1' ;
          dm.ADOtemp.Parameters[0].Value:=dm.ADO723LogNo.Value;
          if dm.ADOtemp.ExecSQL<>1 then
            showmessage('退回外出记录失败,此记录的状态不能进行此操作!');
          BtBrushClick(nil);
      end;
   7://反审核
          begin
          if MessageBox(Handle,'确定取消审核吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
          dm.ADOtemp.Close;
          dm.ADOtemp.SQL.Text:='update data0723 set status=1 where LogNo=:no and status=2' ;
          dm.ADOtemp.Parameters[0].Value:=dm.ADO723LogNo.Value;
          if dm.ADOtemp.ExecSQL<>1 then
            showmessage('反审核失败,此记录的状态不能进行此操作!');
          BtBrushClick(nil);
      end;
   8://打印
   begin
     dm.ADO73.Close;
     dm.ADO73.Parameters[0].Value:=dm.ADO723salesID.Value;
     dm.ADO73.Open;
      with TForm_report.Create(nil) do
      try
        ppReport1.Print;
      finally
        free;
      end;
     end;
   end;
  end;


procedure TForm_Main.PageControl1Change(Sender: TObject);
begin
  if (PageControl1.ActivePageIndex=1) and (DM.ADO723LogNo.AsString<>MaskEdit1.Text) then
  begin
  MaskEdit1.Text:=DM.ADO723.Fieldbyname('LogNo').AsString;
  end;
end;

procedure TForm_Main.FormShow(Sender: TObject);
begin
 Grd1TitleClick(PreColumn);
end;

procedure TForm_Main.PopupMenu1Popup(Sender: TObject);
begin
  n1.Enabled:=(vprev='2') or ((vprev='4') and FisWrite) ;

  if DM.ADO723.IsEmpty then
  begin
    n2.Enabled:=false;    //编辑
    n3.Enabled:=false;    //提交审批
    n4.Enabled:=false;    //删除
    n5.Enabled:=false;    //取消提交
    n10.Enabled:=false;    //审核
    n12.Enabled:=false;   //退回
    n6.Enabled:=false;    //反审核
    n9.Enabled:=false;    //打印
  end
  else
  begin
    n1.Enabled:=((vprev='2') or ((vprev='4') and FisWrite));
    n2.Enabled:=((vprev='2') or ((vprev='4') and FisWrite)) and ((dm.ADO723status.Value=0)or(dm.ADO723status.Value=3)) and (rkey73=dm.ADO723salesID.AsString);
    n3.Enabled:=n2.Enabled;
    n4.Enabled :=n2.Enabled;
    n5.Enabled:=((vprev='2') or ((vprev='4') and FisWrite)) and (dm.ADO723status.Value=1) and (rkey73=DM.ADO723salesID.AsString) ;
    n10.Enabled:=((vprev='4') and (dm.ADO723status.Value=1) and ((((rkey73=DM.ADO723salesID.AsString) and FisAudit_self)) or (rkey73<>DM.ADO723salesID.AsString))) ;
    n12.Enabled:=n10.Enabled;
    n6.Enabled:=((vprev='4') and (dm.ADO723status.Value=2) and ((((rkey73=DM.ADO723salesID.AsString) and FisAudit_self)) or (rkey73<>DM.ADO723salesID.AsString)));
    n9.Enabled:=(dm.ADO723status.Value=2);
  end;
end;

procedure TForm_Main.BitBtn6Click(Sender: TObject);
begin
   out_report.Popup(mouse.CursorPos.X,mouse.CursorPos.Y);
end;

procedure TForm_Main.Z1Click(Sender: TObject);
begin
form_report:=tform_report.Create(application);
form_report.ppReport1.Reset;
form_report.ppReport1.Template.FileName:=stringReplace(uppercase(getcurrentdir),'EXEC','NIERP\Report\',[rfReplaceAll])+'wzpr723.rtm';
form_report.ppReport1.Template.LoadFromFile;
form_report.ppReport1.SaveAsTemplate:=true;
form_report.ppDesigner1.ShowModal;
form_report.Free;
end;

procedure TForm_Main.BtQryClick(Sender: TObject);
var i:integer;
    Sqlstr:string;
begin
  if Form_Condition=nil then  Form_Condition:=TForm_Condition.Create(Application);
  if Form_Condition.ShowModal=mrok then
  begin
    dm.ADO723.Parameters[0].Value:=formatdatetime('YYYY/MM/DD',form_condition.DateTimePicker1.Date);
    dm.ADO723.Parameters[1].Value:=form_condition.DateTimePicker2.Date+1;
    for i:=1 to Form_Condition.sgrid1.RowCount-2 do
      if Form_Condition.sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+Form_Condition.sgrid1.Cells[2,i];
    {dm.ADO723.SQL.Text:=sSql+' and data0723.ent_date>='''+formatdatetime('YYYY/MM/DD',Form_Condition.DateTimePicker1.Date)+
                           ''' and data0723.ent_date-1<='''+formatdatetime('YYYY/MM/DD',Form_Condition.DateTimePicker2.Date)+''' '+Sqlstr+
                           ' order by data0723.LogNo';}
    dm.ADO723.SQL.Text:=sSql+Sqlstr+'order by data0723.LogNo';
    dm.ADO723.Close;
    dm.ADO723.Open;
    Grd1.DataSource:=nil;
    Grd1.DataSource:=dm.DataSource1;
  end;
end;

end.
