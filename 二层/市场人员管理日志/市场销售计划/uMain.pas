unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, DBGridEh, DB, Menus, Buttons,
  ComCtrls,Excel2000,ComObj,math;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    Edit1: TEdit;
    Label1: TLabel;
    DBGridEh1: TDBGridEh;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
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
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    Edit2: TEdit;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    PopupMenu5: TPopupMenu;
    BitBtn4: TBitBtn;
    GroupBox1: TGroupBox;
    DBGridEh4: TDBGridEh;
    GroupBox2: TGroupBox;
    DBGridEh3: TDBGridEh;
    GroupBox3: TGroupBox;
    DBGridEh2: TDBGridEh;
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
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure FormActivate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
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

  end;

var
  frmMain: TfrmMain;

implementation

uses uDM, uXSMB, uZGKH, uKFKH, uSKJH, uCondition,dateutils,common;

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
     pStrgrids[j].DataSource.DataSet.First ;
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
   end;// end if
  pStrgrids[j].DataSource.DataSet.EnableControls;
 end;
 XlApp.Visible := True;
 Screen.Cursor := crDefault;
end;

procedure TfrmMain.FormCreate(Sender: TObject);

begin
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

procedure TfrmMain.FormShow(Sender: TObject);
var
 i:integer;
 item:TmenuItem;
begin

 if dm.Conn.Connected then
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

 dm.ADS705.Open ;
 dm.ADS706.Open ;
 dm.ADS707.Open ;
 dm.AQery5.Close;
 dm.AQery5.Parameters.ParamValues['rky']:=user_ptr;
 dm.AQery5.Open;
 if dm.AQery5.FieldValues['popedom']=0 then
  begin
   messagedlg('你的职位不够？',mtinformation,[mbOK],0);
   close;  //职位'无' 不处理
  end;

 dm.AQery704.Close;
 dm.AQery704.Parameters.ParamValues['rkey05']:=dm.AQery5RKEY.Value;
 dm.AQery704.Parameters.ParamValues['b_year']:=yearof(date());
 dm.AQery704.Parameters.ParamValues['e_year']:=yearof(date());
 dm.AQery704.Parameters.ParamValues['b_month']:=monthof(date());
 dm.AQery704.Parameters.ParamValues['e_month']:=monthof(date());
 dm.AQery704.Open;

 _SQL:=dm.AQery704.SQL.Text;

  end;

end;
//新增销售目标
procedure TfrmMain.N1Click(Sender: TObject);
begin
  dm.AQery5.Close ;
  dm.AQery5.Parameters.ParamValues['rky']:=user_ptr;
  dm.AQery5.Open ;
  Application.CreateForm(TfrmXSMB, frmXSMB);
  frmXSMB.ShowModal();
  frmXSMB.Free;
end;
//编辑销售目标
procedure TfrmMain.N2Click(Sender: TObject);
begin
  Application.CreateForm(TfrmXSMB, frmXSMB);
  frmXSMB._isedit:=true;
  frmXSMB.ShowModal();
  frmXSMB.Free;

end;
//删除销售目标
procedure TfrmMain.N3Click(Sender: TObject);
var
 vRkey:integer;
begin
 try
  if messagedlg('确定要删除吗？',mtinformation,[mbYes,mbno],0)=mrNo then exit;
  dm.AQery.Close ;
  dm.AQery.SQL.Text:='DELETE FROM data0704 where rkey='+dm.AQery704RKEY.AsString;
  if dm.AQery704.RecordCount>1 then
    begin
     dm.AQery704.Prior;
     vRkey:=dm.AQery704RKEY.Value;
    end
  else
    vRkey:=0;
  dm.Conn.BeginTrans ;
  dm.AQery.ExecSQL ;
  dm.Conn.CommitTrans;
  dm.AQery704.Close;
  dm.AQery704.Open;
  dm.AQery704.Locate('rkey',vRkey,[]);
 except
   on E: Exception do
     begin
      dm.Conn.RollbackTrans;
      messagedlg(E.Message,mtinformation,[mbok],0);
     end;
 end;
end;
//查看销售目标
procedure TfrmMain.N4Click(Sender: TObject);
begin
  if dm.AQery704.RecordCount=0 then exit;
  Application.CreateForm(TfrmXSMB, frmXSMB);
  frmXSMB.SpeedButton1.Enabled:=false;
  frmXSMB._isedit:=true;
  frmXSMB.ShowModal();
  frmXSMB.Free;

end;
//新增主管客户
procedure TfrmMain.N5Click(Sender: TObject);
begin
 if dm.AQery704.RecordCount=0 then
  begin
   messagedlg('没有销售目标！！！',mtinformation,[mbok],0);
   exit;
  end;
  Application.CreateForm(TfrmZGKH, frmZGKH);
  frmZGKH.ShowModal();
  frmZGKH.Free;
end;
//编辑主管客户
procedure TfrmMain.N6Click(Sender: TObject);
begin
  if dm.ADS705.RecordCount=0 then exit;
  Application.CreateForm(TfrmZGKH, frmZGKH);
  frmZGKH._isedit:=true;
  frmZGKH.ShowModal();
  frmZGKH.Free;
end;
//删除主管客户

procedure TfrmMain.N7Click(Sender: TObject);
var
 vRkey:integer;
begin
 try
  if dm.ADS705.RecordCount=0 then exit;
  if messagedlg('确定要删除吗？',mtinformation,[mbYes,mbno],0)=mrNo then exit;

  dm.AQery.Close ;
  dm.AQery.SQL.Text:='DELETE FROM data0705 where rkey='+dm.ADS705RKEY.AsString;
  if dm.ADS705.RecordCount>1 then
    begin
     dm.ADS705.Prior;
     vRkey:=dm.ADS705RKEY.Value;
    end
   else
   vRkey:=0;
  dm.Conn.BeginTrans ;
  dm.AQery.ExecSQL ;
  dm.Conn.CommitTrans;
  dm.ADS705.Close;
  dm.ADS705.Open;
  dm.ADS705.Locate('rkey',vRkey,[]);
 except
   on E: Exception do
     begin
      dm.Conn.RollbackTrans;
      messagedlg(E.Message,mtinformation,[mbok],0);
     end;
 end;
end;
//查看主管客户
procedure TfrmMain.N8Click(Sender: TObject);
begin
  if dm.ADS705.RecordCount=0 then exit;
  Application.CreateForm(TfrmZGKH, frmZGKH);
  frmZGKH.SpeedButton1.Enabled:=false;
  frmZGKH._isedit:=true;
  frmZGKH.ShowModal();
  frmZGKH.Free;
end;
//新增开发客户
procedure TfrmMain.N9Click(Sender: TObject);
begin
 if dm.AQery704.RecordCount=0 then
  begin
   messagedlg('没有销售目标！！！',mtinformation,[mbok],0);
   exit;
  end;
  Application.CreateForm(TfrmKFKH, frmKFKH);
  frmKFKH.ShowModal();
  frmKFKH.Free;
end;
//编辑开发客户
procedure TfrmMain.N10Click(Sender: TObject);
begin
  if dm.ADS706.RecordCount=0 then exit;
  Application.CreateForm(TfrmKFKH, frmKFKH);
  frmKFKH._isedit:=true;
  frmKFKH.ShowModal();
  frmKFKH.Free;
end;
//删除开发客户
procedure TfrmMain.N11Click(Sender: TObject);
var
 vRkey:integer;
begin
 try
  if dm.ADS706.RecordCount=0 then exit;
  if messagedlg('确定要删除吗？',mtinformation,[mbYes,mbno],0)=mrNo then exit;

  dm.AQery.Close ;
  dm.AQery.SQL.Text:='DELETE FROM data0706 where rkey='+dm.ADS706RKEY.AsString;
  if dm.ADS706.RecordCount>1 then
    begin
     dm.ADS706.Prior;
     vRkey:=dm.ADS706RKEY.Value;
    end
   else
    vRkey:=0; 
  dm.Conn.BeginTrans ;
  dm.AQery.ExecSQL ;
  dm.Conn.CommitTrans;
  dm.ADS706.Close;
  dm.ADS706.Open;
  dm.ADS706.Locate('rkey',vRkey,[]);
 except
   on E: Exception do
     begin
      dm.Conn.RollbackTrans;
      messagedlg(E.Message,mtinformation,[mbok],0);
     end;
 end;
end;
//查看开发客户
procedure TfrmMain.N12Click(Sender: TObject);
begin
  if dm.ADS706.RecordCount=0 then exit;
  Application.CreateForm(TfrmKFKH, frmKFKH);
  frmKFKH.SpeedButton1.Enabled:=false;
  frmKFKH._isedit:=true;
  frmKFKH.ShowModal();
  frmKFKH.Free;
end;
//新增收款计划
procedure TfrmMain.N13Click(Sender: TObject);
begin
 if dm.AQery704.RecordCount=0 then
  begin
   messagedlg('没有销售目标！！！',mtinformation,[mbok],0);
   exit;
  end;
  Application.CreateForm(TfrmSKJH, frmSKJH);
  frmSKJH.ShowModal();
  frmSKJH.Free;
end;
//编辑收款计划
procedure TfrmMain.N14Click(Sender: TObject);
begin
  if dm.ADS707.RecordCount=0 then exit;
  Application.CreateForm(TfrmSKJH, frmSKJH);
  frmSKJH._isedit:=true;
  frmSKJH.ShowModal();
  frmSKJH.Free;
end;
//删除收款计划
procedure TfrmMain.N15Click(Sender: TObject);
var
 vRkey:integer;
begin
 try
  if dm.ADS707.RecordCount=0 then exit;
  if messagedlg('确定要删除吗？',mtinformation,[mbYes,mbno],0)=mrNo then exit;

  dm.AQery.Close ;
  dm.AQery.SQL.Text:='DELETE FROM data0707 where rkey='+dm.ADS707RKEY.AsString;
  if dm.ADS707.RecordCount>1 then
    begin
     dm.ADS707.Prior;
     vRkey:=dm.ADS707RKEY.Value;
    end
   else
   vRkey:=0; 
  dm.Conn.BeginTrans ;
  dm.AQery.ExecSQL ;
  dm.Conn.CommitTrans;
  dm.ADS707.Close;
  dm.ADS707.Open;
  dm.ADS707.Locate('rkey',vRkey,[]);
 except
   on E: Exception do
     begin
      dm.Conn.RollbackTrans;
      messagedlg(E.Message,mtinformation,[mbok],0);
     end;
 end;
end;
//查看收款计划
procedure TfrmMain.N16Click(Sender: TObject);
begin
  if dm.ADS707.RecordCount=0 then exit;
  Application.CreateForm(TfrmSKJH, frmSKJH);
  frmSKJH.SpeedButton1.Enabled:=false;
  frmSKJH._isedit:=true;
  frmSKJH.ShowModal();
  frmSKJH.Free;
end;
//过滤条件
procedure TfrmMain.DBGridEh1TitleClick(Column: TColumnEh);
begin
 if (Column.FieldName='CStatus') or
    (Column.FieldName='CZYStatus') then exit;

 if column.Title.SortMarker =smDownEh then
   column.Title.SortMarker:=smUpEh
 else
   column.Title.SortMarker:=smDownEh;
 if column.Title.SortMarker =smDownEh then
   dm.AQery704.Sort:=Column.FieldName
 else
   dm.AQery704.Sort:=Column.FieldName+' DESC';
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
 //label1.Left:=edit1.Left- label1.Width-3;
 label1.Caption:=column.Title.Caption+'：';
end;

procedure TfrmMain.FormActivate(Sender: TObject);
begin
 _FN:='YJH';

 DBGridEh1TitleClick(DBGridEh1.Columns[0])
end;

procedure TfrmMain.Edit1Change(Sender: TObject);
begin
  if trim(edit1.text)<>'' then
    dm.AQery704.Filter :=_FN+' like ''%'+trim(edit1.text)+'%'''
  else
    dm.AQery704.Filter :='';
end;

procedure TfrmMain.Edit2Change(Sender: TObject);
begin
 if trim(edit2.text)<>'' then
    dm.AQery704.Filter :=_FN+' >='+trim(edit2.text)
  else
    dm.AQery704.Filter :='';
end;
//日期过滤
procedure TfrmMain.DateTimePicker1Change(Sender: TObject);
var
 vstr:string;
begin
  vstr:=_FN+' >= '+datetostr(DateTimePicker1.Date);
  vstr:=vstr+' and '+_FN+' <='+datetostr(DateTimePicker2.Date);
  dm.AQery704.Filter :=vstr;
end;
//导出EXCEL
procedure TfrmMain.BitBtn2Click(Sender: TObject);
begin
 if dm.AQery704.Active=false then exit;
 if dm.AQery704.RecordCount=0 then exit;

 ExPortExcel([dbgrideh2,dbgrideh3,dbgrideh4,dbgrideh1],['主管客户','计划开发客户','计划收款','销售计划']);

end;
//退出
procedure TfrmMain.BitBtn1Click(Sender: TObject);
begin
 frmCondition.Free ;
 close;
end;
//字段增删菜单
procedure TfrmMain.BitBtn3Click(Sender: TObject);
begin
 popupmenu5.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;
//输入查找条件范围
procedure TfrmMain.BitBtn4Click(Sender: TObject);
begin
frmCondition.YJH.Value:=dm.AQery704.Parameters.ParamValues['b_year'];
frmCondition.SpinEdit1.Value:= dm.AQery704.Parameters.ParamValues['e_year'];
frmCondition.MJH.Value:= dm.AQery704.Parameters.ParamValues['b_month'];
frmCondition.SpinEdit2.Value:= dm.AQery704.Parameters.ParamValues['e_month'];

 if frmCondition.ShowModal=mrok then
 begin
 dm.AQery704.Close;
 dm.AQery704.Parameters.ParamValues['b_year']:=frmCondition.YJH.Value;
 dm.AQery704.Parameters.ParamValues['e_year']:=frmCondition.SpinEdit1.Value;
 dm.AQery704.Parameters.ParamValues['b_month']:=frmCondition.MJH.Value;
 dm.AQery704.Parameters.ParamValues['e_month']:=frmCondition.SpinEdit2.Value;
 dm.AQery704.Open;
 end;
end;

procedure TfrmMain.PopupMenu1Popup(Sender: TObject);
begin

 if vprev='4' then
  begin
    N2.Enabled:=true;           //编辑
    N3.Enabled:=true;           //删除;
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
   N4.Enabled:=true;
 if not dm.AQery704.IsEmpty  then
  if dm.AQery704.Fieldbyname('CJRPTR').AsString=user_ptr then
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
 if vprev='4' then
  begin
    N5.Enabled:=true;           //新增
    N6.Enabled:=true;           //编辑
    N7.Enabled:=true;           //删除
  end;
 if (vprev='2') then
  begin
    N5.Enabled:=true;           //新增
    N6.Enabled:=true;           //编辑
    N7.Enabled:=true;           //删除
  end
 else
  begin
    N5.Enabled:=false;
    N6.Enabled:=false;
    N7.Enabled:=false;
  end;
 if (vprev='1') then    //查看
   N8.Enabled:=true;
 if not dm.AQery704.IsEmpty then
  if dm.AQery704CJRPTR.AsString=user_ptr then
   begin
    N5.Enabled:=true;           //新增
    N6.Enabled:=true;           //编辑
    N7.Enabled:=true;           //删除
   end
  else
   begin
    N5.Enabled:=false;           //新增
    N6.Enabled:=false;           //编辑
    N7.Enabled:=false;           //删除
   end;
end;

procedure TfrmMain.PopupMenu3Popup(Sender: TObject);
begin
 if vprev='4' then
  begin
    N9.Enabled:=true;           //新增
    N10.Enabled:=true;           //编辑
    N11.Enabled:=true;           //删除
  end;
 if (vprev='2') then
  begin
    N9.Enabled:=true;            //新增
    N10.Enabled:=true;           //编辑
    N11.Enabled:=true;           //删除
  end
 else
  begin
    N9.Enabled:=false;
    N10.Enabled:=false;
    N11.Enabled:=false;
  end;
 if (vprev='1') then    //查看
   N12.Enabled:=true;
 if dm.AQery704.IsEmpty =false then
  if dm.AQery704.Fieldbyname('CJRPTR').AsString=user_ptr then
    begin
      N9.Enabled:=true;            //新增
      N10.Enabled:=true;           //编辑
      N11.Enabled:=true;           //删除
    end
  else
    begin
     N9.Enabled:=false;
     N10.Enabled:=false;
     N11.Enabled:=false;
    end;
end;

procedure TfrmMain.PopupMenu4Popup(Sender: TObject);
begin
 if vprev='4' then
  begin
    N13.Enabled:=true;           //新增
    N14.Enabled:=true;           //编辑
    N15.Enabled:=true;           //删除
  end;
 if (vprev='2') then
  begin
    N13.Enabled:=true;           //新增
    N14.Enabled:=true;           //编辑
    N15.Enabled:=true;           //删除
  end
 else
  begin
    N13.Enabled:=false;
    N14.Enabled:=false;
    N15.Enabled:=false;
  end;
 if (vprev='1') then    //查看
   N16.Enabled:=true;
 if dm.AQery704.IsEmpty =false then
  if dm.AQery704.Fieldbyname('CJRPTR').AsString=user_ptr then
    begin
     N13.Enabled:=true;           //新增
     N14.Enabled:=true;           //编辑
     N15.Enabled:=true;           //删除
    end
  else
    begin
     N13.Enabled:=false;
     N14.Enabled:=false;
     N15.Enabled:=false;
    end;
end;
//
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
  showmessage(dm.AQery704.SQL.Text)
end;

end.
