unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Menus,
  DBGridEh,Excel2000,ComObj,math,DB;

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
    Splitter1: TSplitter;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    Splitter2: TSplitter;
    PopupMenu2: TPopupMenu;
    PopupMenu3: TPopupMenu;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    DBGridEh3: TDBGridEh;
    PopupMenu4: TPopupMenu;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure PopupMenu3Popup(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    _FN,_SQL:string;
    procedure item_click(sender:TObject);
    function checkchar(const pstr:string;const pkey:char):boolean;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses uXSZJ, uDM, uKFKH, uSKJH, uCondition,dateutils,common;

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
 if not app_init(dm.Conn) then
  begin
   showmsg('程序起动失败,请联系管理员!',1);
   application.Terminate;
  end;
  self.Caption:=application.Title;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
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
   PopupMenu4.Items.Add(item);
  end;

 dm.ADS714.Open ;
 dm.ADS713.Open ;
 dm.AQery5.Close;
 dm.AQery5.Parameters.ParamValues['rky']:=user_ptr;
 dm.AQery5.Open;
 if dm.AQery5.FieldValues['popedom']=0 then
  begin
   messagedlg('你的职位不够？',mtinformation,[mbOK],0);
   close;  //职位'无' 不处理
  end;
 
 _SQL:=dm.AQery712.SQL.Text;
 dm.AQery712.Close;
 dm.AQery712.Parameters.ParamValues['rkey05']:=dm.AQery5RKEY.Value;
 dm.AQery712.Parameters.ParamValues['b_year']:=yearof(date());
 dm.AQery712.Parameters.ParamValues['e_year']:=yearof(date());
 dm.AQery712.Parameters.ParamValues['b_month']:=monthof(date());
 dm.AQery712.Parameters.ParamValues['e_month']:=monthof(date());
 dm.AQery712.Open;

  end;
end;

procedure TfrmMain.FormActivate(Sender: TObject);
begin
 _FN:='ZJND';
 DBGridEh1TitleClick(DBGridEh1.Columns[0])
end;
//新增
procedure TfrmMain.N1Click(Sender: TObject);
begin
  dm.AQery5.Close ;
  dm.AQery5.Parameters.ParamValues['rky']:=user_ptr;
  dm.AQery5.Open;
  Application.CreateForm(TfrmXSZJ, frmXSZJ);
  frmXSZJ.ShowModal();
  frmXSZJ.Free;
end;
//编辑
procedure TfrmMain.N2Click(Sender: TObject);
begin
  if dm.AQery712.RecordCount=0 then exit;
  Application.CreateForm(TfrmXSZJ, frmXSZJ);
  frmXSZJ._isedit:=true;
  frmXSZJ.ShowModal();
  frmXSZJ.Free;
end;
//删除
procedure TfrmMain.N3Click(Sender: TObject);
var
 vRkey:integer;
begin

 try
  if dm.AQery712.RecordCount=0 then exit;
  if messagedlg('确定要删除吗？',mtinformation,[mbYes,mbno],0)=mrNo then exit;
  dm.AQery.Close ;
  dm.AQery.SQL.Text:='DELETE FROM data0712 where rkey='+dm.AQery712RKEY.AsString;
  if dm.AQery712.RecordCount>2 then
   begin
    dm.AQery712.Prior;
    vRkey:=dm.AQery712RKEY.Value;
   end
  else
   vRkey:=0;
  dm.Conn.BeginTrans ;
  dm.AQery.ExecSQL ;
  dm.Conn.CommitTrans;
  dm.AQery712.Close;
  dm.AQery712.Open;
  dm.AQery712.Locate('rkey',vRkey,[]);
 except
   on E: Exception do
     begin
      dm.Conn.RollbackTrans;
      messagedlg(E.Message,mtinformation,[mbok],0);
     end;
 end;
end;
//查看
procedure TfrmMain.N4Click(Sender: TObject);
begin
  if dm.AQery712.RecordCount=0 then exit;
  Application.CreateForm(TfrmXSZJ, frmXSZJ);
  frmXSZJ.SpeedButton1.Enabled:=false;
  frmXSZJ._isedit:=true;
  frmXSZJ.ShowModal();
  frmXSZJ.Free;
end;
//评审
procedure TfrmMain.N6Click(Sender: TObject);
var
 vrkey:integer;
begin

  try
    dm.AQery.Close ;
    dm.AQery.SQL.Text:='UPDATE data0712'+#13
                      +' SET '+#13
                      +' STATUS =1,'+#13
                      +' SHPTR ='+user_ptr+',';

    if (sender as TMenuItem).Caption='优秀' then
     dm.AQery.SQL.Text:=dm.AQery.SQL.Text+' SSPJ=0';
    if (sender as TMenuItem).Caption='合格' then
     dm.AQery.SQL.Text:=dm.AQery.SQL.Text+' SSPJ=1';
    if (sender as TMenuItem).Caption='不合格' then
     dm.AQery.SQL.Text:=dm.AQery.SQL.Text+' SSPJ=2';

    dm.AQery.SQL.Text:=dm.AQery.SQL.Text +' WHERE (RKEY ='+dm.AQery712.FieldByName('rkey').AsString+')';
    dm.Conn.BeginTrans ;
    dm.AQery.ExecSQL;
    dm.Conn.CommitTrans;
    messagedlg('审核成功！！！',mtinformation,[mbok],0);
    vrkey:=dm.AQery712.FieldValues['rkey'];
    dm.AQery712.Close;
    dm.AQery712.Open ;
    dm.AQery712.Locate('rkey',vrkey,[]);
  except
   on E: Exception do
     begin
      dm.Conn.RollbackTrans;
      messagedlg(E.Message,mtinformation,[mbok],0);
     end;
  end;
end;

procedure TfrmMain.N9Click(Sender: TObject);
var
 vrkey:integer;
begin

  try
    dm.AQery.Close ;
    dm.AQery.SQL.Text:='UPDATE data0712'+#13
                      +' SET '+#13
                      +' STATUS =0,'+#13
                      +' SHPTR =0,'+#13
                      +' SSPJ =NULL'+#13
                      +' WHERE (RKEY ='+dm.AQery712.FieldByName('rkey').AsString+')';
    dm.Conn.BeginTrans ;
    dm.AQery.ExecSQL;
    dm.Conn.CommitTrans;
    messagedlg('审核成功！！！',mtinformation,[mbok],0);
    vrkey:=dm.AQery712.FieldValues['rkey'];
    dm.AQery712.Close;
    dm.AQery712.Open ;
    dm.AQery712.Locate('rkey',vrkey,[]);
  except
   on E: Exception do
     begin
      dm.Conn.RollbackTrans;
      messagedlg(E.Message,mtinformation,[mbok],0);
     end;
  end;
end;
//新增客户
procedure TfrmMain.N10Click(Sender: TObject);
begin
 if dm.AQery712.RecordCount=0 then
  begin
   messagedlg('先选择总结！！！',mtinformation,[mbok],0);
   exit;
  end;
  Application.CreateForm(TfrmKFKH, frmKFKH);
  frmKFKH.ShowModal();
  frmKFKH.Free;
end;
//编辑客户
procedure TfrmMain.N11Click(Sender: TObject);
begin
  if dm.ADS714.RecordCount=0 then exit;
  Application.CreateForm(TfrmKFKH, frmKFKH);
  frmKFKH._isedit:=true;
  frmKFKH.ShowModal();
  frmKFKH.Free;
end;
//删除客户
procedure TfrmMain.N12Click(Sender: TObject);
var
 vRkey:integer;
begin
 try
  if dm.ADS714.RecordCount=0 then exit;
  if messagedlg('确定要删除吗？',mtinformation,[mbYes,mbno],0)=mrNo then exit;

  dm.AQery.Close ;
  dm.AQery.SQL.Text:='DELETE FROM data0714 where rkey='+dm.ADS714RKEY.AsString;
  if dm.ADS714.RecordCount>2 then
   begin
    dm.ADS714.Prior;
    vRkey:=dm.ADS714RKEY.Value;
   end
  else
   vRkey:=0;
  dm.Conn.BeginTrans ;
  dm.AQery.ExecSQL ;
  dm.Conn.CommitTrans;
  dm.ADS714.Close;
  dm.ADS714.Open;
  dm.ADS714.Locate('rkey',vRkey,[]);
 except
   on E: Exception do
     begin
      dm.Conn.RollbackTrans;
      messagedlg(E.Message,mtinformation,[mbok],0);
     end;
 end;
end;
//查看客户
procedure TfrmMain.N13Click(Sender: TObject);
begin
  if dm.ADS714.RecordCount=0 then exit;
  Application.CreateForm(TfrmKFKH, frmKFKH);
  frmKFKH.SpeedButton1.Enabled:=false;
  frmKFKH._isedit:=true;
  frmKFKH.ShowModal();
  frmKFKH.Free;
end;
//新增
procedure TfrmMain.N14Click(Sender: TObject);
begin
  if dm.AQery712.RecordCount=0 then
  begin
   messagedlg('先选择总结！！！',mtinformation,[mbok],0);
   exit;
  end;
  Application.CreateForm(TfrmSKJH, frmSKJH);
  frmSKJH.ShowModal();
  frmSKJH.Free;
end;
//编辑
procedure TfrmMain.N15Click(Sender: TObject);
begin
  if dm.ADS713.RecordCount=0 then exit;
  Application.CreateForm(TfrmSKJH, frmSKJH);
  frmSKJH._isedit:=true;
  frmSKJH.ShowModal();
  frmSKJH.Free;
end;
//删除
procedure TfrmMain.N16Click(Sender: TObject);
var
 vRkey:integer;
begin
 try
  if dm.ADS713.RecordCount=0 then exit;
  if messagedlg('确定要删除吗？',mtinformation,[mbYes,mbno],0)=mrNo then exit;

  dm.AQery.Close ;
  dm.AQery.SQL.Text:='DELETE FROM data0713 where rkey='+dm.ADS713RKEY.AsString;
  if dm.ADS713.RecordCount>1 then
   begin
    dm.ADS713.Prior;
    vRkey:=dm.ADS713RKEY.Value;
   end
  else
   vRkey:=0;
  dm.Conn.BeginTrans ;
  dm.AQery.ExecSQL ;
  dm.Conn.CommitTrans;
  dm.ADS713.Close;
  dm.ADS713.Open;
  dm.ADS713.Locate('rkey',vRkey,[]);
 except
   on E: Exception do
     begin
      dm.Conn.RollbackTrans;
      messagedlg(E.Message,mtinformation,[mbok],0);
     end;
 end;
end;
//查看
procedure TfrmMain.N17Click(Sender: TObject);
begin
  if dm.ADS713.RecordCount=0 then exit;
  Application.CreateForm(TfrmSKJH, frmSKJH);
  frmSKJH.SpeedButton1.Enabled:=false;
  frmSKJH._isedit:=true;
  frmSKJH.ShowModal();
  frmSKJH.Free;
end;
//导出EXCEL
procedure TfrmMain.BitBtn2Click(Sender: TObject);
begin
 if dm.AQery712.Active=false then exit;
 if dm.AQery712.RecordCount=0 then exit;

 ExPortExcel([dbgrideh2,dbgrideh3,dbgrideh1],['联系客户名单及详细情况','收款清单','销售总结']);

end;
//增删除字段
procedure TfrmMain.BitBtn3Click(Sender: TObject);
begin
 popupmenu4.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;
//查找
procedure TfrmMain.BitBtn4Click(Sender: TObject);
begin
frmCondition.YJH.Value:=dm.AQery712.Parameters.ParamValues['b_year'];
frmCondition.SpinEdit1.Value:= dm.AQery712.Parameters.ParamValues['e_year'];
frmCondition.MJH.Value:= dm.AQery712.Parameters.ParamValues['b_month'];
frmCondition.SpinEdit2.Value:= dm.AQery712.Parameters.ParamValues['e_month'];

 if frmCondition.ShowModal=mrok then
 begin
 dm.AQery712.Close;
 dm.AQery712.Parameters.ParamValues['b_year']:=frmCondition.YJH.Value;
 dm.AQery712.Parameters.ParamValues['e_year']:=frmCondition.SpinEdit1.Value;
 dm.AQery712.Parameters.ParamValues['b_month']:=frmCondition.MJH.Value;
 dm.AQery712.Parameters.ParamValues['e_month']:=frmCondition.SpinEdit2.Value;
 dm.AQery712.Open;
 end;

end;
//过滤
procedure TfrmMain.DBGridEh1TitleClick(Column: TColumnEh);
begin
 if (Column.FieldName='CStatus') OR
  (Column.FieldName='CQJStatus') OR
  (Column.FieldName='CSSPJ') OR
  (Column.FieldName='CZYStatus') then exit;

 if column.Title.SortMarker =smDownEh then
   column.Title.SortMarker:=smUpEh
 else
   column.Title.SortMarker:=smDownEh;
 if column.Title.SortMarker =smDownEh then
   dm.AQery712.Sort:=Column.FieldName
 else
   dm.AQery712.Sort:=Column.FieldName+' DESC';
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

procedure TfrmMain.BitBtn1Click(Sender: TObject);
begin
 close;
end;
{1查看,2修改,查看,3审核反审查看，4所有权限}
procedure TfrmMain.PopupMenu1Popup(Sender: TObject);
begin

 if dm.AQery712.RecordCount>0 then
  if dm.AQery712.FieldValues['STATUS']=1 then
   begin
    N2.Enabled:=false;           //编辑
    N3.Enabled:=false;           //删除
    exit;
   end;
   
 N2.Enabled:=true;           //编辑
 N3.Enabled:=true;           //删除

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

 if (vprev='4') then    //审核,反审核
  begin
   N5.Enabled:=true;
   N9.Enabled:=true;
  end
 else
  begin
   N5.Enabled:=false;
   N9.Enabled:=false;
  end;
 if not dm.AQery712.IsEmpty  then
  if dm.AQery712.Fieldbyname('USEPTR').AsString=user_ptr then
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
{1查看,2修改,查看,3审核反审查看，4所有权限}
procedure TfrmMain.PopupMenu2Popup(Sender: TObject);
begin
 if dm.AQery712.RecordCount>0 then
  if dm.AQery712.FieldValues['STATUS']=1 then
   begin
    N10.Enabled:=false;           //新增
    N11.Enabled:=false;           //编辑
    N12.Enabled:=false;           //删除
    exit;
   end;
 N10.Enabled:=true;           //新增
 N11.Enabled:=true;           //编辑
 N12.Enabled:=true;           //删除
 {if _prev='4' then
  begin
   N10.Enabled:=true;           //新增
   N11.Enabled:=true;           //编辑
   N12.Enabled:=true;           //删除
  end;}
 if (vprev='2') then
  begin
    N10.Enabled:=true;           //新增
    N11.Enabled:=true;           //编辑
    N12.Enabled:=true;           //删除
  end
 else
  begin
    N10.Enabled:=false;
    N11.Enabled:=false;
    N12.Enabled:=false;
  end;
 if (vprev='1') then    //查看
   N13.Enabled:=true;
 if dm.AQery712.IsEmpty =false then
  if dm.AQery712.Fieldbyname('USEPTR').AsString=user_ptr then
    begin
      N10.Enabled:=true;           //新增
      N11.Enabled:=true;           //编辑
      N12.Enabled:=true;           //删除
    end
  else
    begin
      N10.Enabled:=false;           //新增
      N11.Enabled:=false;           //编辑
      N12.Enabled:=false;           //删除
    end;
end;
{1查看,2修改,查看,3审核反审查看，4所有权限}
procedure TfrmMain.PopupMenu3Popup(Sender: TObject);
begin
 if dm.AQery712.RecordCount>0 then
  if dm.AQery712.FieldValues['STATUS']=1 then
   begin
    N14.Enabled:=false;           //新增
    N15.Enabled:=false;           //编辑
    N16.Enabled:=false;           //删除
    exit;
   end;
 N14.Enabled:=true;           //新增
 N15.Enabled:=true;           //编辑
 N16.Enabled:=true;           //删除
 //if _prev='4' then exit;
 if (vprev='2') then
  begin
    N14.Enabled:=true;           //新增
    N15.Enabled:=true;           //编辑
    N16.Enabled:=true;           //删除
  end
 else
  begin
    N14.Enabled:=false;
    N15.Enabled:=false;
    N16.Enabled:=false;
  end;
 if (vprev='1') then    //查看
   N17.Enabled:=true;
 if dm.AQery712.IsEmpty =false then
  if dm.AQery712.Fieldbyname('USEPTR').AsString=user_ptr then
    begin
      N14.Enabled:=true;           //新增
      N15.Enabled:=true;           //编辑
      N16.Enabled:=true;           //删除
    end
  else
    begin
      N14.Enabled:=false;           //新增
      N15.Enabled:=false;           //编辑
      N16.Enabled:=false;           //删除
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

procedure TfrmMain.Edit1Change(Sender: TObject);
begin
  if trim(Edit1.text)<>'' then
    dm.AQery712.Filter :=_FN+' like ''%'+trim(Edit1.text)+'%'''
  else
    dm.AQery712.Filter :='';
end;

procedure TfrmMain.Edit2Change(Sender: TObject);
begin
 if trim(edit2.text)<>'' then
    dm.AQery712.Filter :=_FN+' >='+trim(edit2.text)
  else
    dm.AQery712.Filter :='';
end;

procedure TfrmMain.DateTimePicker1Change(Sender: TObject);
var
 vstr:string;
begin
  vstr:=_FN+' >= '+datetostr(DateTimePicker1.Date);
  vstr:=vstr+' and '+_FN+' <='+datetostr(DateTimePicker2.Date);
  dm.AQery712.Filter :=vstr;
end;

procedure TfrmMain.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(dm.AQery712.SQL.Text)
end;

end.
