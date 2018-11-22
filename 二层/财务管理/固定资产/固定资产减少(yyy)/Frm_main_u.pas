unit Frm_main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, StdCtrls, Buttons, ExtCtrls, Menus,DB,
  DBGridEh,Excel2000,ComObj,math;

type
  TFrm_main = class(TForm)
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Panel1: TPanel;
    empl_name: TLabel;
    curr_code: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    Label1: TLabel;
    DBGrid1: TDBGridEh;
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure dtpk1Exit(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure BitBtn2Click(Sender: TObject);
  private
    field_name:string;
    Fvprev:string;
    function getStatus:boolean;
    procedure init;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_main: TFrm_main;

implementation
 uses DM_u,common,Frm_dec_u;
{$R *.dfm}

procedure TFrm_main.FormCreate(Sender: TObject);
begin
 if not App_Init(DM.ADOCon) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;
  self.Caption :=Application.Title;
  Fvprev:=vprev;

  //DM.ADOCon.Open;
 // user_ptr:='5';
 // Fvprev:='11';

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  init;
  dtpk1.Date:=sysdate-30;
  dtpk2.Date:=sysdate;
  DM.ADO525.Parameters[0].Value:=dtpk1.Date;
  DM.ADO525.Parameters[1].Value:=dtpk2.Date;
  DM.ADO525.Open;
  field_name:='dimi_DATE';
end;

procedure TFrm_main.DBGrid1TitleClick(Column: TColumn);
  var
 i:byte;
begin
 if column.FieldName<>dm.ado525.IndexFieldNames then  dm.ADO525.IndexFieldNames:=column.FieldName;
 if (column.ReadOnly) and (field_name<>column.FieldName) then
 begin
   label1.Caption:=column.Title.Caption;
   self.field_name:=column.FieldName;
   for i:=0 to dbgrid1.FieldCount-1 do
     if dbgrid1.Columns[i].Title.Color= clred then dbgrid1.Columns[i].Title.Color:= clbtnface;
   column.Title.Color:=clred;
   edit1.Enabled:=dm.ADO525.FieldByName(field_name).DataType=ftString;
   if edit1.Enabled then edit1.SetFocus;
 end;
end;

procedure TFrm_main.dtpk1Exit(Sender: TObject);
begin
  DM.ADO525.Close;
  DM.ADO525.Parameters[0].Value:=dtpk1.Date;
  DM.ADO525.Parameters[1].Value:=dtpk2.Date;
  DM.ADO525.Open;
end;

procedure TFrm_main.N1Click(Sender: TObject);
begin
  if (strtoint(Fvprev)=1) or (strtoint(Fvprev)=3) then
  begin   messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0); exit;end;
  DM.Tmp1.Close;
  DM.Tmp1.SQL.Text:='select top 1 rkey from data0528 where Fyear='+FY+' and period='+FM;
  DM.Tmp1.Open;
  if DM.Tmp1.IsEmpty then
  begin
    showmessage('当前会计期间还未提取固定资产折旧,'+#13+'请做提取折旧操作后再做固定资产减少!');
    exit;
  end;

   TFrm_dec.dec_op(0,DM.ADO525);
end;

procedure TFrm_main.N2Click(Sender: TObject);
begin
  if DM.ADO525.RecordCount=0 then exit;
  if not getStatus then
  begin
    showmessage('凭证已审核,不能再修改');
    abort;
  end;
  if (strtoint(Fvprev)=1) or (strtoint(Fvprev)=3) then
  begin
   messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
   exit;
  end;
  TFrm_dec.dec_op(1,DM.ADO525);
end;

procedure TFrm_main.N3Click(Sender: TObject);
begin
  if DM.ADO525.RecordCount=0 then exit;
  TFrm_dec.dec_op(2,DM.ADO525);
end;

procedure TFrm_main.N4Click(Sender: TObject);
begin
  if DM.ADO525.RecordCount=0 then exit;
  if not getStatus then
  begin
    showmessage('凭证已审核,不能再删除');
    abort;
  end;
  if (strtoint(Fvprev)=1) or (strtoint(Fvprev)=3) then
     messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else if messagedlg('你确定要取消这条记录吗?该操作将不可逆!',mtConfirmation,[mbyes,mbno],0)=mryes then
  try
    DM.ADOCon.BeginTrans;
    if DM.ADO525.fieldbyname('voucher_ptr').AsString<>'' then
    begin
      DM.Tmp1.Close;
      DM.Tmp1.SQL.Text:='update data0105 set status=5 where rkey='+DM.ADO525.fieldbyname('voucher_ptr').AsString;
      DM.Tmp1.ExecSQL;
    end;
    
    DM.Tmp1.Close;
    DM.Tmp1.SQL.Text:='delete from  data0525 where fasset_ptr='+DM.ADO525.fieldbyname('rkey').AsString;
    DM.Tmp1.ExecSQL;

    DM.Tmp1.Close;
    DM.Tmp1.SQL.Text:='update data0517 set active_flag=1 where rkey='+DM.ADO525.fieldbyname('rkey').AsString;
    DM.Tmp1.ExecSQL;

    DM.Tmp1.SQL.Text:='update data0528 set summed_depre=b.summed_depre from '+
                      'data0528 a,data0517 b where a.d0517_ptr='+DM.ADO525.fieldbyname('rkey').AsString+
                      ' and a.Fyear='+FY+' and a.period='+FM+' and a.d0517_ptr=b.rkey';

    DM.Tmp1.ExecSQL;

    DM.ADOCon.CommitTrans;
    DM.ADO525.close;
    DM.ADO525.open;
  except
    Dm.ADOCon.RollbackTrans;
    showmessage('删除记录失败');
  end;
end;

procedure TFrm_main.Edit1Change(Sender: TObject);
begin
  if trim(edit1.Text)<>'' then
  begin
  if dm.ADO525.FieldByName(field_name).DataType=ftString then
    dm.ADO525.Filter:=self.field_name+' like ''%'+trim(edit1.Text)+'%''' ;
 // else if dm.ADO525.FieldByName(field_name).DataType=ftDateTime then
   // dm.ADO525.Filter:=self.field_name+'>='''+edit1.Text+'''';
 end else
  dm.ADO525.Filter:='';
end;

function TFrm_main.getStatus: boolean;
begin
  if DM.ADO525.fieldbyname('voucher_ptr').AsString='' then
    result:=true
  else begin
    DM.Tmp1.Close;
    DM.Tmp1.SQL.Text:='select status from data0105 where rkey='+DM.ADO525.fieldbyname('voucher_ptr').AsString;
    DM.Tmp1.Open;
    result:=DM.Tmp1.IsEmpty or (DM.Tmp1.Fields[0].AsInteger=0) or (DM.Tmp1.Fields[0].AsInteger=5) ;
  end;
end;

procedure TFrm_main.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TFrm_main.BitBtn3Click(Sender: TObject);
begin
  DM.ADO525.close;
  DM.ADO525.open;
end;

procedure TFrm_main.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
   if  DBGrid1.DataSource.DataSet.RecNo  mod 2=0 then
   begin
      DBGrid1.Canvas.Brush.Color:=clinfobk;
      DBGrid1.Canvas.FillRect(rect);
      DBGrid1.Canvas.font.color:=clblack;
   end else  begin
      DBGrid1.Canvas.Brush.Color:=clwhite;
      DBGrid1.Canvas.FillRect(rect);
      DBGrid1.Canvas.font.color:=clblack;
   end;
   if ((State = [gdSelected]) or (State=[gdSelected,gdFocused])) then
   begin
      DBGrid1.Canvas.Brush.Color:=RGB(0,224,224);
      DBGrid1.Canvas.FillRect(rect);
      DBGrid1.Canvas.font.color:=clblack;
   end;
   DBGrid1.DefaultDrawColumnCell(rect,datacol,column,state);
end;

procedure TFrm_main.DBGridEh1TitleClick(Column: TColumnEh);
  var
 i:byte;
begin
  if column.Title.SortMarker =smDownEh then
  begin
   column.Title.SortMarker:=smUpEh;
   dm.ado525.IndexFieldNames:=Column.FieldName;
  end
 else
  begin
   column.Title.SortMarker:=smDownEh;
   dm.ado525.IndexFieldNames:=Column.FieldName+' DESC';
  end;

 if (column.ReadOnly) and (field_name<>column.FieldName) then
 begin
   label1.Caption:=column.Title.Caption;
   self.field_name:=column.FieldName;
   for i:=0 to dbgrid1.FieldCount-1 do
     if dbgrid1.Columns[i].Title.Color= clred then
        dbgrid1.Columns[i].Title.Color:= clbtnface;
   column.Title.Color:=clred;
   edit1.Enabled:=dm.ADO525.FieldByName(field_name).DataType=ftString;
   if edit1.Enabled then edit1.SetFocus;
 end;

end;

procedure TFrm_main.BitBtn2Click(Sender: TObject);
var
 iCount, jCount, v_cloumn: Integer;
 XLApp: Variant;
 Sheet: Variant;
begin
  Screen.Cursor := crHourGlass;
   if not VarIsEmpty(XLApp) then
   begin
    XLApp.DisplayAlerts := False;
    XLApp.Quit;
    VarClear(XLApp);
   end;
   try
     XLApp := CreateOleObject('Excel.Application');
   except
     Screen.Cursor := crDefault;
     Exit;
   end;
   XLApp.WorkBooks.Add;
   XLApp.SheetsInNewWorkbook := 1;
   XLApp.WorkBooks[1].WorkSheets[1].Name := self.Caption;
   Sheet := XLApp.Workbooks[1].WorkSheets[self.Caption];
   if not TDBGrideh(self.DBGrid1).DataSource.DataSet.Active then
   begin
    Screen.Cursor := crDefault;
    Exit;
   end;
   TDBGrideh(DBGrid1).DataSource.DataSet.DisableControls;
   TDBGrideh(DBGrid1).DataSource.DataSet.first;
   v_cloumn:=TDBGrideh(DBGrid1).Columns.Count;
   v_cloumn:=Floor(v_cloumn/2);

   Sheet.Cells[1, v_cloumn] :='固定资产一览表';

   Sheet.Cells[1, v_cloumn].Font.bold := True;
   Sheet.Cells[1, v_cloumn].Font.Size := 16;
                                      
   Sheet.Cells[2, v_cloumn+1] :='导出时间:'+DateTimeToStr(Now);
   Sheet.Cells[2, v_cloumn+1].Font.bold := True;
   v_cloumn:=0;
   //列头
   for iCount := 0 to TDBGrideh(DBGrid1).Columns.Count - 1 do
   if TDBGrideh(DBGrid1).Columns.Items[iCount].Visible=true then
     begin
      Sheet.Cells[3, iCount + 1 - v_cloumn] :=
       TDBGrideh(DBGrid1).Columns.Items[iCount].Title.Caption;
      Sheet.Cells[3, iCount + 1 - v_cloumn].Font.bold := True;
     end
   else
    inc(v_cloumn);
   jCount := 4;
   //行
   while not TDBGrideh(DBGrid1).DataSource.DataSet.Eof do
   begin
    v_cloumn:=0;
    for iCount := 0 to TDBGrideh(DBGrid1).Columns.Count - 1 do
     if TDBGrideh(DBGrid1).Columns.Items[iCount].Visible=true then
       begin
        Sheet.Cells[jCount, iCount + 1 - v_cloumn] :=
          TDBGrideh(DBGrid1).Columns.Items[iCount].Field.AsString;
       end
     else
      inc(v_cloumn);
    Inc(jCount);
    TDBGrideh(DBGrid1).DataSource.DataSet.Next;
   end;
   XlApp.Visible := True;
   TDBGrideh(DBGrid1).DataSource.DataSet.EnableControls;
 Screen.Cursor := crDefault;
end;

procedure TFrm_main.init;
begin
  with DM.Tmp1 do
  begin
    Close;
    SQL.Text:='select curr_FYEAR,curr_period,getdate() from data0508';
    Open;
    if not IsEmpty  then
    begin
      FY:=Fields[0].AsString;
      FM:=Fields[1].AsString;
      sysDate:=Fields[2].AsDateTime;
    end;
    Close;
    SQL.Text:='select employee_name from data0005 where rkey='+user_ptr;
    Open;
    FLoginName:=Fields[0].AsString;
    Close;
    SQL.Text:='select top 1 * from data0001';
    Open;
    sRkeyCuur:=Fieldbyname('rkey').AsString;
    sCuur_code:=Fieldbyname('curr_code').AsString;
    Close;
  end;
end;

end.
