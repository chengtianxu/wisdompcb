unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh,
  Menus,Excel2000,ComObj,math,DB;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    Edit2: TEdit;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    BitBtn4: TBitBtn;
    DBGridEh1: TDBGridEh;
    Splitter1: TSplitter;
    DBGridEh2: TDBGridEh;
    Splitter2: TSplitter;
    DBGridEh3: TDBGridEh;
    Splitter3: TSplitter;
    DBGridEh4: TDBGridEh;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    PopupMenu3: TPopupMenu;
    PopupMenu4: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    PopupMenu5: TPopupMenu;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure PopupMenu3Popup(Sender: TObject);
    procedure PopupMenu4Popup(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    _FN,_SQL:string;
    OldGridWnd : TWndMethod;
    procedure NewGridWnd(var Message: TMessage);
    procedure item_click(sender:TObject);
    function checkchar(const pstr:string;const pkey:char):boolean;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses uDM, uGZRZ, uDDJF, uKHTS, uYWYXZ, uCondition, DateUtils,common;

{$R *.dfm}
function TFrmMain.checkchar(const pstr:string;const pkey:char):boolean;
var
 i,iLast:integer;
begin
     result:=true;
 if not (pkey in ['0'..'9','.',#8]) then  //判断是否输入数字
  result:=false
 else
   if pkey='.' then
     begin
      iLast:=0;
      for i:=0 to Length(pstr) do
       if pstr[i]='.' then
        begin
         iLast:=iLast+1;
         if iLast=1 then
          begin
           result:=false;
           break;
          end;
       end;
     end
    else
     result:=true;
end;

procedure TFrmMain.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGridEh1.DataSource.DataSet.MoveBy(1)
   else
     DBGridEh1.DataSource.DataSet.MoveBy(-1)
 end
 else
   OldGridWnd(Message);
end;
//增删字段
procedure TFrmMain.item_click(sender:TObject);
var
 i:byte;
begin
(sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
if (sender as tmenuItem).Checked then
 begin
  for i:=0 to DBGridEh1.Columns.Count-1  do
  if DBGridEh1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    DBGridEh1.Columns[i].Visible:=true;
    break;
   end;
 end
else
 begin
  for i:=0 to DBGridEh1.Columns.Count-1 do
  if DBGridEh1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    DBGridEh1.Columns[i].Visible:=false;
    break;
   end;
 end;
end;
//导出
procedure ExPortExcel(const pStrgrids:array of TdbGrideh;pCap:array of string);
var
 iCount, jCount, v_cloumn,j: Integer;
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


 XLApp.SheetsInNewWorkbook :=High(pStrgrids)+1;
 XLApp.WorkBooks.Add;
 for j:=Low(pStrgrids) to High(pStrgrids) do
 begin

   XLApp.WorkBooks[1].WorkSheets[j+1].Name := pCap[j];

   Sheet := XLApp.Workbooks[1].WorkSheets[j+1];

   v_cloumn:=math.Floor(pStrgrids[j].Columns.Count/2);

   Sheet.Cells[1, v_cloumn] :=pCap[j];

   Sheet.Cells[1, v_cloumn].Font.bold := True;
   Sheet.Cells[1, v_cloumn].Font.Size := 16;

   Sheet.Cells[2, v_cloumn+1].Font.bold := True;
   v_cloumn:=0;
   //列头
   for iCount := 0 to pStrgrids[j].Columns.Count - 1 do
    if pStrgrids[j].Columns[iCount].Visible=true then
     begin
       Sheet.Cells[3, iCount + 1 - v_cloumn] :=pStrgrids[j].Columns[iCount].Title.Caption;
       Sheet.Cells[3, iCount + 1 - v_cloumn].Font.bold := True;
     end
    else
     inc(v_cloumn);

   jCount:= 4;
   //行

  pStrgrids[j].DataSource.DataSet.DisableControls;
  if pStrgrids[j].DataSource.DataSet.Active=true then
   begin
    pStrgrids[j].DataSource.DataSet.First;
     while not pStrgrids[j].DataSource.DataSet.eof do
     begin
       v_cloumn:=0;
       for iCount := 0 to pStrgrids[j].Columns.Count - 1 do
        if pStrgrids[j].Columns[iCount].Visible=true then
         begin
           Sheet.Cells[jCount, iCount + 1 - v_cloumn] :=pStrgrids[j].DataSource.DataSet.FieldValues[pStrgrids[j].Columns[iCount].FieldName];
         end
        else
         inc(v_cloumn);

       Inc(jCount);
       pStrgrids[j].DataSource.DataSet.Next ;
     end;//end while
   end;//end if
  pStrgrids[j].DataSource.DataSet.EnableControls;
 end;
 XlApp.Visible := True;
 Screen.Cursor := crDefault;
end;
procedure TfrmMain.FormCreate(Sender: TObject);

begin

{ _pass := copy(S,1,2);
 _userptr := trim(copy(S,3,pos(' ',s)-3));
 _prev :=trim(copy(S,pos(' ',s)+1,pos(',',s)-pos(' ',s)-1));
 _ConnSTR:= trim(copy(S,pos(',',s)+1,length(s)-pos(',',s)));
 }
 if not app_init(dm.Conn) then
  begin
   showmsg('程序起动失败,请联系管理员!',1);
   application.Terminate;
  end;
  self.Caption:=application.Title;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

 OldGridWnd := DBGridEh1.WindowProc;
 DBGridEh1.WindowProc := NewGridWnd;
end;

procedure TfrmMain.FormActivate(Sender: TObject);
begin
 _FN:='YJH';
 DBGridEh1TitleClick(DBGridEh1.Columns[0])
end;

procedure TfrmMain.FormShow(Sender: TObject);
var
 i:integer;
 item:TmenuItem;
begin

 if  dm.Conn.Connected then
  begin

 for i:=0 to DBGridEh1.Columns.Count-1 do
  begin
   item:=TmenuItem.Create(self);
   item.Caption:=DBGridEh1.Columns[i].Title.Caption;
   if DBGridEh1.Columns[i].Visible then
    item.Checked:=true;
   item.OnClick:=item_click;
   PopupMenu5.Items.Add(item);
  end;

 dm.ADS709.Open ;
 dm.ADS710.Open ;
 dm.ADS711.Open ;
 dm.AQery5.Close;
 dm.AQery5.Parameters.ParamValues['rky']:=user_ptr;
 dm.AQery5.Open;
 if dm.AQery5.FieldValues['popedom']=0 then
  begin
   messagedlg('你的职位不够？',mtinformation,[mbOK],0);
   close;  //职位'无' 不处理
  end; 

 _SQL:=dm.AQery708.SQL.Text;

 dm.AQery708.Close;
 dm.AQery708.Parameters.ParamValues['rkey05']:=dm.AQery5RKEY.Value;
 dm.AQery708.Parameters.ParamValues['b_year']:=yearof(date());
 dm.AQery708.Parameters.ParamValues['e_year']:=yearof(date());
 dm.AQery708.Parameters.ParamValues['b_month']:=monthof(date());
 dm.AQery708.Parameters.ParamValues['e_month']:=monthof(date());
 dm.AQery708.Open;

  end;

end;
//新增日志
procedure TfrmMain.N1Click(Sender: TObject);
begin
  dm.AQery5.Close ;
  dm.AQery5.Parameters.ParamValues['rky']:=user_ptr;
  dm.AQery5.Open ;
  Application.CreateForm(TfrmGZRZ, frmGZRZ);
  frmGZRZ.ShowModal();
  frmGZRZ.Free;
end;
//编辑日志
procedure TfrmMain.N2Click(Sender: TObject);
begin
  if dm.AQery708.RecordCount=0 then exit;
  Application.CreateForm(TfrmGZRZ, frmGZRZ);
  frmGZRZ.Edit1.Text:=dm.AQery708MJHJE.AsString ;
  frmGZRZ._isedit:=true;
  frmGZRZ.ShowModal();
  frmGZRZ.Free;
end;
//删除日志
procedure TfrmMain.N3Click(Sender: TObject);
var
 vRkey:integer;
begin
 try
  if dm.AQery708.RecordCount=0 then exit;
  if messagedlg('确定要删除吗？',mtinformation,[mbYes,mbno],0)=mrNo then exit;
  dm.AQery.Close ;
  dm.AQery.SQL.Text:='DELETE FROM data0708 where rkey='+dm.AQery708RKEY.AsString;
  if dm.AQery708.RecordCount>1 then
    begin
     dm.AQery708.Prior;
     vRkey:=dm.AQery708RKEY.Value;
    end;
  dm.Conn.BeginTrans ;
  dm.AQery.ExecSQL ;
  dm.Conn.CommitTrans;
  dm.AQery708.Close;
  dm.AQery708.Open;
  dm.AQery708.Locate('rkey',vRkey,[]);
 except
   on E: Exception do
     begin
      dm.Conn.RollbackTrans;
      messagedlg(E.Message,mtinformation,[mbok],0);
     end;
 end;
end;
//审核
procedure TfrmMain.N4Click(Sender: TObject);
var
 vrkey:integer;
begin

  try
    dm.AQery.Close ;
    dm.AQery.SQL.Text:='UPDATE data0708'+#13
                      +'set STATUS =1,'+#13
                      +' SHPTR ='+user_ptr+#13
                      +' WHERE (RKEY ='+dm.AQery708.FieldByName('rkey').AsString+')';
    dm.Conn.BeginTrans ;
    dm.AQery.ExecSQL;
    dm.Conn.CommitTrans;
    messagedlg('审核成功！！！',mtinformation,[mbok],0);
    vrkey:=dm.AQery708.FieldValues['rkey'];
    dm.AQery708.Close;
    dm.AQery708.Open ;
    dm.AQery708.Locate('rkey',vrkey,[]);
  except
   on E: Exception do
     begin
      dm.Conn.RollbackTrans;
      messagedlg(E.Message,mtinformation,[mbok],0);
     end;
  end;
end;
//反审核
procedure TfrmMain.N5Click(Sender: TObject);
var
 vrkey:integer;
begin

  try
    dm.AQery.Close ;
    dm.AQery.SQL.Text:='UPDATE data0708'+#13
                      +' SET '+#13
                      +' STATUS =0,'+#13
                      +' SHPTR =0'+#13
                      +' WHERE (RKEY ='+dm.AQery708.FieldByName('rkey').AsString+')';
    dm.Conn.BeginTrans ;
    dm.AQery.ExecSQL;
    dm.Conn.CommitTrans;
    messagedlg('审核成功！！！',mtinformation,[mbok],0);
    vrkey:=dm.AQery708.FieldValues['rkey'];
    dm.AQery708.Close;
    dm.AQery708.Open ;
    dm.AQery708.Locate('rkey',vrkey,[]);
  except
   on E: Exception do
     begin
      dm.Conn.RollbackTrans;
      messagedlg(E.Message,mtinformation,[mbok],0);
     end;
  end;

end;
//查看日志
procedure TfrmMain.N6Click(Sender: TObject);
begin
  if dm.AQery708.RecordCount=0 then exit;
  Application.CreateForm(TfrmGZRZ, frmGZRZ);
  frmGZRZ.Edit1.Text:=dm.AQery708MJHJE.AsString ;
  frmGZRZ.SpeedButton1.Enabled:=false;
  frmGZRZ._isedit:=true;
  frmGZRZ.ShowModal();
  frmGZRZ.Free;
end;
//新增订单交付
procedure TfrmMain.N7Click(Sender: TObject);
begin
  Application.CreateForm(TfrmDDJF, frmDDJF);
  frmDDJF.ShowModal();
  frmDDJF.Free;
end;
//编辑订单交付
procedure TfrmMain.N8Click(Sender: TObject);
begin

  if dm.ADS709.RecordCount=0 then exit;
  Application.CreateForm(TfrmDDJF, frmDDJF);
  frmDDJF._isedit:=true;
  frmDDJF.ShowModal();
  frmDDJF.Free;
end;

procedure TfrmMain.N9Click(Sender: TObject);   //删除订单交付
var
 vRkey:integer;
begin
 try
  if dm.ADS709.RecordCount=0 then exit;
  if messagedlg('确定要删除吗？',mtinformation,[mbYes,mbno],0)=mrNo then exit;
  dm.AQery.Close ;
  dm.AQery.SQL.Text:='DELETE FROM data0709 where rkey='+dm.ADS709RKEY.AsString;
  if dm.ADS709.RecordCount>1 then
    begin
     dm.ADS709.Prior;
     vRkey:=dm.ADS709RKEY.Value;
    end;
  dm.Conn.BeginTrans ;
  dm.AQery.ExecSQL ;
  dm.Conn.CommitTrans;
  dm.ADS709.Close;
  dm.ADS709.Open;
  dm.ADS709.Locate('rkey',vRkey,[]);
 except
   on E: Exception do
     begin
      dm.Conn.RollbackTrans;
      messagedlg(E.Message,mtinformation,[mbok],0);
     end;
 end;
end;
//查看订单交付
procedure TfrmMain.N10Click(Sender: TObject);
begin

  if dm.ADS709.RecordCount=0 then exit;
  Application.CreateForm(TfrmDDJF, frmDDJF);
  frmDDJF.SpeedButton1.Enabled:=false;
  frmDDJF._isedit:=true;
  frmDDJF.ShowModal();
  frmDDJF.Free;

end;
//新增客诉
procedure TfrmMain.N11Click(Sender: TObject);
begin
  Application.CreateForm(TfrmKHTS, frmKHTS);
  frmKHTS.ShowModal();
  frmKHTS.Free;
end;
//编辑客诉
procedure TfrmMain.N12Click(Sender: TObject);
begin

  if dm.ADS710.RecordCount=0 then exit;
  Application.CreateForm(TfrmKHTS, frmKHTS);
  frmKHTS._isedit:=true;
  frmKHTS.ShowModal();
  frmKHTS.Free;
end;
//删除客诉
procedure TfrmMain.N13Click(Sender: TObject);
var
 vRkey:integer;
begin
 try
  if dm.ADS710.RecordCount=0 then exit;
  if messagedlg('确定要删除吗？',mtinformation,[mbYes,mbno],0)=mrNo then exit;
  dm.AQery.Close ;
  dm.AQery.SQL.Text:='DELETE FROM data0710 where rkey='+dm.ADS710RKEY.AsString;
  if dm.ADS710.RecordCount>1 then
    begin
     dm.ADS710.Prior;
     vRkey:=dm.ADS710RKEY.Value;
    end;
  dm.Conn.BeginTrans ;
  dm.AQery.ExecSQL ;
  dm.Conn.CommitTrans;
  dm.ADS710.Close;
  dm.ADS710.Open;
  dm.ADS710.Locate('rkey',vRkey,[]);
 except
   on E: Exception do
     begin
      dm.Conn.RollbackTrans;
      messagedlg(E.Message,mtinformation,[mbok],0);
     end;
 end;
end;
//查看客诉
procedure TfrmMain.N14Click(Sender: TObject);
begin
  if dm.ADS710.RecordCount=0 then exit;
  Application.CreateForm(TfrmKHTS, frmKHTS);
  frmKHTS.SpeedButton1.Enabled:=false;
  frmKHTS._isedit:=true;
  frmKHTS.ShowModal();
  frmKHTS.Free;
end;
//新增业务员行踪
procedure TfrmMain.N15Click(Sender: TObject);
begin

  Application.CreateForm(TfrmYWYXZ, frmYWYXZ);
  frmYWYXZ.ShowModal();
  frmYWYXZ.Free;
end;
//编辑业务员行踪
procedure TfrmMain.N16Click(Sender: TObject);
begin
  if dm.ADS711.RecordCount=0 then exit;
  Application.CreateForm(TfrmYWYXZ, frmYWYXZ);
  frmYWYXZ._isedit:=true;
  frmYWYXZ.ShowModal();
  frmYWYXZ.Free;
end;
//删除业务员行踪
procedure TfrmMain.N17Click(Sender: TObject);
var
 vRkey:integer;
begin
 try
  if dm.ADS711.RecordCount=0 then exit;
  if messagedlg('确定要删除吗？',mtinformation,[mbYes,mbno],0)=mrNo then exit;
  dm.AQery.Close ;
  dm.AQery.SQL.Text:='DELETE FROM data0711 where rkey='+dm.ADS711RKEY.AsString;
  if dm.ADS711.RecordCount>1 then
    begin
     dm.ADS711.Prior;
     vRkey:=dm.ADS711RKEY.Value;
    end;
  dm.Conn.BeginTrans ;
  dm.AQery.ExecSQL ;
  dm.Conn.CommitTrans;
  dm.ADS711.Close;
  dm.ADS711.Open;
  dm.ADS711.Locate('rkey',vRkey,[]);
 except
   on E: Exception do
     begin
      dm.Conn.RollbackTrans;
      messagedlg(E.Message,mtinformation,[mbok],0);
     end;
 end;
end;
//查看业务员行踪
procedure TfrmMain.N18Click(Sender: TObject);
begin
  if dm.ADS711.RecordCount=0 then exit;
  Application.CreateForm(TfrmYWYXZ, frmYWYXZ);
  frmYWYXZ.SpeedButton1.Enabled:=false;
  frmYWYXZ._isedit:=true;
  frmYWYXZ.ShowModal();
  frmYWYXZ.Free;
end;
//导出
procedure TfrmMain.BitBtn2Click(Sender: TObject);
begin
 if dm.AQery708.Active=false then exit;
 if dm.AQery708.RecordCount=0 then exit;

 ExPortExcel([dbgrideh2,dbgrideh3,dbgrideh4,dbgrideh1],['订单交付','客户投诉,退货情况','业务员行踪','工作日志']);

end;
//增减字段
procedure TfrmMain.BitBtn3Click(Sender: TObject);
begin
 popupmenu5.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;
//查找
procedure TfrmMain.BitBtn4Click(Sender: TObject);
begin
frmCondition.YJH.Value:=dm.AQery708.Parameters.ParamValues['b_year'];
frmCondition.SpinEdit1.Value:= dm.AQery708.Parameters.ParamValues['e_year'];
frmCondition.MJH.Value:= dm.AQery708.Parameters.ParamValues['b_month'];
frmCondition.SpinEdit2.Value:= dm.AQery708.Parameters.ParamValues['e_month'];

 if frmCondition.ShowModal=mrok then
 begin
 dm.AQery708.Close;
 dm.AQery708.Parameters.ParamValues['b_year']:=frmCondition.YJH.Value;
 dm.AQery708.Parameters.ParamValues['e_year']:=frmCondition.SpinEdit1.Value;
 dm.AQery708.Parameters.ParamValues['b_month']:=frmCondition.MJH.Value;
 dm.AQery708.Parameters.ParamValues['e_month']:=frmCondition.SpinEdit2.Value;
 dm.AQery708.Open;
 end;

end;
//过滤条件
procedure TfrmMain.DBGridEh1TitleClick(Column: TColumnEh);
begin
 if (Column.FieldName='CSTATUS') OR
    (Column.FieldName='CTJSTATUS') OR
    (Column.FieldName='CYSSTATUS') OR
    (Column.FieldName='CZYStatus') then exit;

 if column.Title.SortMarker =smDownEh then
   column.Title.SortMarker:=smUpEh
 else
   column.Title.SortMarker:=smDownEh;
 if column.Title.SortMarker =smDownEh then
   dm.AQery708.Sort:=Column.FieldName
 else
   dm.AQery708.Sort:=Column.FieldName+' DESC';
 //查找
 case Column.Field.DataType  of
  ftautoinc,ftInteger,ftBCD	,ftword,ftFloat:
   begin
    edit2.Visible:=true;
    DateTimePicker1.Visible :=not edit2.Visible;
    DateTimePicker2.Visible :=not edit2.Visible;
    edit1.Visible:=not edit2.Visible;

   end;
  ftDateTime:
   begin
    DateTimePicker1.Visible :=true;
    DateTimePicker2.Visible :=true;
    edit1.Visible :=not DateTimePicker1.Visible;
    edit2.Visible:=not DateTimePicker1.Visible;
   end;
 ftString:
  begin
   edit1.Visible :=true;
   edit2.Visible :=not edit1.Visible;
   DateTimePicker1.Visible:=not edit1.Visible;
   DateTimePicker2.Visible :=not edit1.Visible;

  end;

 end;
 DateTimePicker1.Left :=edit1.Left;
 DateTimePicker1.Top:=edit1.Top;
 DateTimePicker2.Top:=edit1.Top;
 edit2.Top:=edit1.Top;
 edit2.Left :=edit1.Left ;
 edit1.Text:='';
 edit2.Text:='';
 _FN:=Column.FieldName;
 label1.Caption:=column.Title.Caption+'：';
end;

procedure TfrmMain.BitBtn1Click(Sender: TObject);
begin
 frmCondition.Free ;
 close;
end;

procedure TfrmMain.Edit1Change(Sender: TObject);
begin
  if trim(edit1.text)<>'' then
    dm.AQery708.Filter :=_FN+' like ''%'+trim(edit1.text)+'%'''
  else
    dm.AQery708.Filter :='';
end;

procedure TfrmMain.Edit2Change(Sender: TObject);
begin
 if trim(edit2.text)<>'' then
    dm.AQery708.Filter :=_FN+' >='+trim(edit2.text)
  else
    dm.AQery708.Filter :='';
end;

procedure TfrmMain.DateTimePicker1Change(Sender: TObject);
var
 vstr:string;
begin
  vstr:=_FN+' >= '+datetostr(DateTimePicker1.Date);
  vstr:=vstr+' and '+_FN+' <='+datetostr(DateTimePicker2.Date);
  dm.AQery708.Filter :=vstr;
end;
{1查看,2修改,查看,3审核反审查看，4所有权限}
procedure TfrmMain.PopupMenu1Popup(Sender: TObject);
begin
 if dm.AQery708.RecordCount>0 then
  if dm.AQery708.FieldValues['STATUS']=1 then
   begin
    N2.Enabled:=false;           //编辑
    N3.Enabled:=false;           //删除
    exit;
   end;
  N2.Enabled:=true;           //编辑
  N3.Enabled:=true;           //删除
 if vprev='4' then
  begin
    N2.Enabled:=true;           //编辑
    N3.Enabled:=true;           //删除
  end;
 if (vprev='2') then
  begin
    N2.Enabled:=true;           //编辑
    N3.Enabled:=true;           //删除
  end
 else
  begin
    N2.Enabled:=false;
    N3.Enabled:=false;
  end;
 if (vprev='1') then    //查看
   N6.Enabled:=true;

 if (vprev='4') then    //审核,反审核
  begin
   N6.Enabled:=true;
   N4.Enabled:=true;
   N5.Enabled:=true;
  end
 else
  begin
   N4.Enabled:=false;
   N5.Enabled:=false;
  end;
 if not dm.AQery708.IsEmpty  then
  if dm.AQery708.Fieldbyname('USEPTR').AsString=user_ptr then
    begin
      N2.Enabled:=true;           //编辑
      N3.Enabled:=true;           //删除
    end
  else
    begin
     N2.Enabled:=false;           //编辑
     N3.Enabled:=false;           //删除
    end;

end;

procedure TfrmMain.PopupMenu2Popup(Sender: TObject);
begin
 if dm.AQery708.RecordCount>0 then
  if dm.AQery708.FieldValues['STATUS']=1 then
   begin
    N7.Enabled:=false;           //新增
    N8.Enabled:=false;           //编辑
    N9.Enabled:=false;           //删除
    exit;
   end;
 N7.Enabled:=true;           //新增
 N8.Enabled:=true;           //编辑
 N9.Enabled:=true;           //删除
 if vprev='4' then
  begin
   N7.Enabled:=true;           //新增
   N8.Enabled:=true;           //编辑
   N9.Enabled:=true;           //删除
  end;
 if (vprev='2') then
  begin
    N7.Enabled:=true;           //新增
    N8.Enabled:=true;           //编辑
    N9.Enabled:=true;           //删除
  end
 else
  begin
    N7.Enabled:=false;
    N8.Enabled:=false;
    N9.Enabled:=false;
  end;
 if (vprev='1') then    //查看
   N10.Enabled:=true;
 if dm.AQery708.IsEmpty =false then
  if dm.AQery708.Fieldbyname('USEPTR').AsString=user_ptr then
    begin
     N7.Enabled:=true;           //新增
     N8.Enabled:=true;           //编辑
     N9.Enabled:=true;           //删除
    end
  else
    begin
      N7.Enabled:=false;
      N8.Enabled:=false;
      N9.Enabled:=false;
    end;

end;

procedure TfrmMain.PopupMenu3Popup(Sender: TObject);
begin
 if dm.AQery708.RecordCount>0 then
  if dm.AQery708.FieldValues['STATUS']=1 then
   begin
    N11.Enabled:=false;           //新增
    N12.Enabled:=false;           //编辑
    N13.Enabled:=false;           //删除
    exit;
   end;
 N11.Enabled:=true;           //新增
 N12.Enabled:=true;           //编辑
 N13.Enabled:=true;           //删除
 if vprev='4' then
  begin
   N11.Enabled:=true;           //新增
   N12.Enabled:=true;           //编辑
   N13.Enabled:=true;           //删除
  end;
 if (vprev='2') then
  begin
    N11.Enabled:=true;           //新增
    N12.Enabled:=true;           //编辑
    N13.Enabled:=true;           //删除
  end
 else
  begin
    N11.Enabled:=false;
    N12.Enabled:=false;
    N13.Enabled:=false;
  end;
 if (vprev='1') then    //查看
   N14.Enabled:=true;
 if dm.AQery708.IsEmpty =false then
  if dm.AQery708.Fieldbyname('USEPTR').AsString=user_ptr then
    begin
     N11.Enabled:=true;           //新增
     N12.Enabled:=true;           //编辑
     N13.Enabled:=true;           //删除
    end
  else
    begin
      N11.Enabled:=false;
      N12.Enabled:=false;
      N13.Enabled:=false;
    end;

end;

procedure TfrmMain.PopupMenu4Popup(Sender: TObject);
begin
 if dm.AQery708.RecordCount>0 then
  if dm.AQery708.FieldValues['STATUS']=1 then
   begin
    N15.Enabled:=false;           //新增
    N16.Enabled:=false;           //编辑
    N17.Enabled:=false;           //删除
    exit;
   end;
 N15.Enabled:=true;           //新增
 N16.Enabled:=true;           //编辑
 N17.Enabled:=true;           //删除
 
 if vprev='4' then
  begin
   N15.Enabled:=true;           //新增
   N16.Enabled:=true;           //编辑
   N17.Enabled:=true;           //删除
  end;
 if (vprev='2') then
  begin
    N15.Enabled:=true;           //新增
    N16.Enabled:=true;           //编辑
    N17.Enabled:=true;           //删除
  end
 else
  begin
    N15.Enabled:=false;
    N16.Enabled:=false;
    N17.Enabled:=false;
  end;
 if (vprev='1') then    //查看
   N18.Enabled:=true;
 if dm.AQery708.IsEmpty =false then
  if dm.AQery708.Fieldbyname('USEPTR').AsString=user_ptr then
    begin
     N15.Enabled:=true;           //新增
     N16.Enabled:=true;           //编辑
     N17.Enabled:=true;           //删除
    end
  else
    begin
      N15.Enabled:=false;
      N16.Enabled:=false;
      N17.Enabled:=false;
    end;

end;

procedure TfrmMain.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then exit;
 if checkchar(TEdit(Sender).Text, key)=false then
    begin
      showmessage('输入数数字！！！');
      abort;
    end;
end;

procedure TfrmMain.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(dm.AQery708.SQL.Text)
end;

end.
