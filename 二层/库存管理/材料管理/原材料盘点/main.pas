unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, DBGrids, ComCtrls, StdCtrls,ComObj,Excel2000,ClipBrd,
  Buttons, ExtCtrls,DateUtils;

type
  TForm1 = class(TForm)
    PopupMenu1: TPopupMenu;
    DBGrid1: TDBGrid;
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
    N16: TMenuItem;
    N19: TMenuItem;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    N1: TMenuItem;
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure find_partloc();
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure dtpk1Exit(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
    v_colwidth: array[0..6] of integer;

   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses damo,about_box,aded_count,location_search,phy_counts,dev_report,
  report1,common;
{$R *.dfm}
procedure TForm1.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGrid1.DataSource.DataSet.MoveBy(1)
   else
     DBGrid1.DataSource.DataSet.MoveBy(-1)
 end
 else
   OldGridWnd(Message);
end;

procedure TForm1.find_partloc();
begin
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select code,location from data0016');
   sql.Add('where rkey='+dm.ADO92BEG_LOC_PTR.AsString);
   open;
   form2.Edit2.Text:=fieldvalues['code'];
   form2.Label6.Caption:=fieldvalues['location'];
  end;
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select code,location from data0016');
   sql.Add('where rkey='+dm.ADO92END_LOC_PTR.AsString);
   open;
   form2.Edit3.Text:=fieldvalues['code'];
   form2.Label7.Caption:=fieldvalues['location'];
  end;
 if dm.ADO92BEG_invt_PTR.Value>0 then //按原材料
  begin
   with dm.ADOQuery1 do
    begin
     close;
     sql.Clear;
     sql.Add('select inv_part_number,INV_PART_DESCRIPTION,');
     sql.Add('group_name,group_desc from data0017 inner join data0496');
     sql.Add('on data0017.GROUP_PTR=data0496.rkey');
     sql.Add('where data0017.rkey='+dm.ADO92BEG_invt_PTR.AsString);
     open;
     form2.Edit4.Text:=fieldvalues['group_name'];
     form2.Edit5.Text:=fieldvalues['group_desc'];
     form2.Edit6.Text:=fieldvalues['inv_part_number'];
     form2.Edit7.Text:=fieldvalues['inv_part_description'];
    end;
   with dm.ADOQuery1 do
    begin
     close;
     sql.Clear;
     sql.Add('select inv_part_number,INV_PART_DESCRIPTION,');
     sql.Add('group_name,group_desc from data0017 inner join data0496');
     sql.Add('on data0017.GROUP_PTR=data0496.rkey');
     sql.Add('where data0017.rkey='+dm.ADO92end_invt_PTR.AsString);
     open;
     form2.Edit9.Text:=fieldvalues['group_name'];
     form2.Edit10.Text:=fieldvalues['group_desc'];
     form2.Edit11.Text:=fieldvalues['inv_part_number'];
     form2.Edit12.Text:=fieldvalues['inv_part_description'];
    end;
  end
 else                                //按材料类别分类出来的盘点清单
  begin
   with dm.ADOQuery1 do
    begin
     close;
     sql.Clear;
     sql.Add('select group_name,group_desc from data0496');
     sql.Add('where data0496.rkey='+dm.ADO92BEG_CYCLE_ptr.AsString);
     open;
     form2.Edit4.Text:=fieldvalues['group_name'];
     form2.Edit5.Text:=fieldvalues['group_desc'];
    end;

    with dm.ADOQuery1 do
     begin
      close;
      sql.Clear;
      sql.Add('select group_name,group_desc from data0496');
      sql.Add('where data0496.rkey='+dm.ADO92end_cycle_ptr.AsString);
      open;
      form2.Edit9.Text:=fieldvalues['group_name'];
      form2.Edit10.Text:=fieldvalues['group_desc'];
     end;
   end;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起,您只有本程序的只读权限!',mtinformation,[mbok],0)
else
try
 form2:=tform2.Create(application);


 if form2.ShowModal=mrok then
  begin
   dm.ADO92.Close;
   dm.ADO92.Open;
   dm.ADO93.Close;
   dm.AQ22.Close;
  end;
finally
 form2.free;
end;

end;

procedure TForm1.N6Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起,您只有本程序的只读权限!',mtinformation,[mbok],0)
else
try
 form2:=tform2.Create(application);
 form2.Edit14.Text:=dm.ADO92PHY_COUNT_NO.Value;
 form2.Edit14.Enabled:=false;
 form2.rkey15.Caption:=dm.ADO92WHOUSE_PTR.AsString;
 form2.Edit1.Text:=dm.ADO92warehouse_code.Value;
 form2.Edit1.Font.Color:=clwindowtext;
 form2.Label3.Caption:=dm.ADO92abbr_name.Value;
 form2.rkey16_1.Caption:=dm.ADO92BEG_LOC_PTR.AsString;
 form2.rkey16_2.Caption:=dm.ADO92END_LOC_PTR.AsString;
 form2.rkey496_1.Caption:=dm.ADO92BEG_CYCLE_ptr.AsString;
 form2.rkey496_2.Caption:=dm.ADO92END_CYCLE_ptr.AsString;
 form2.rkey17_1.Caption:=dm.ADO92BEG_INVT_PTR.AsString;
 form2.rkey17_2.Caption:=dm.ADO92END_INVT_PTR.AsString;
 find_partloc();
 if form2.ShowModal=mrok then
  begin
   dm.ADO92.Close;
   dm.ADO92.Open;
   dm.ADO93.Close;
   dm.AQ22.Close;
  end;
finally
 form2.Free;
end;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
 try
  form2:=tform2.Create(application);
  form2.Edit14.Text:=dm.ADO92PHY_COUNT_NO.Value;
  form2.Edit14.Enabled:=false;
  form2.BitBtn1.Visible:=false;
  form2.BitBtn2.Left:=10;
  form2.Button1.Visible:=false;
  form2.Edit1.Text:=dm.ADO92warehouse_code.Value;
  form2.Edit1.Font.Color:=clwindowtext;
  form2.Label3.Caption:=dm.ADO92warehouse_name.Value;
  form2.Edit1.Enabled:=false;
  form2.Edit2.Enabled:=false;
  form2.Edit3.Enabled:=false;
  form2.BitBtn3.Enabled:=false;
  form2.BitBtn4.Enabled:=false;
  form2.BitBtn5.Enabled:=false;
  find_partloc();
  form2.ShowModal;
 finally
  form2.free;
 end;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起,您只有本程序的只读权限!',mtinformation,[mbok],0)
else 
 if messagedlg('你确认要删除此盘点清单吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
  begin
   with dm.ADOQuery1 do
    begin
     close;
     sql.Clear;
     sql.Add('select * from data0092 where rkey='+dm.ADO92RKEY.AsString);
     open;
     delete;
     dm.ADO92.Close;
     dm.ADO92.Open;
    end;
  end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
if dm.ADO92.IsEmpty then
 begin
  n6.Enabled:=false;
  n7.Enabled:=false;
  n8.Enabled:=false;
  n10.Enabled:=false;
  n11.Enabled:=false;
  n13.Enabled:=false;
  n14.Enabled:=false;
  n16.Enabled:=false;
  n19.Enabled := false;
  n1.Enabled:=false;
 end
else
 begin
  if dm.ADO92STATUS.Value='0' then
  begin
   n6.Enabled:=true;
   n8.Enabled:=true;
   n10.Enabled:=true;
   n11.Enabled:=true;
   n13.Enabled:=true;
  end
  else
   begin
    n6.Enabled:=false;
    n8.Enabled:=false;
    n10.Enabled:=false;
    n11.Enabled:=false;
    n13.Enabled:=false;
   end;
  n16.Enabled:=true;
  n1.Enabled:=true;
  n7.Enabled:=true;
  n14.Enabled:=true;
  n19.Enabled:=true;
 end;
end;

procedure TForm1.N10Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起,您只有本程序的只读权限!',mtinformation,[mbok],0)
else 
 try
  form4:=tform4.Create(application);
  dm.ADO93.Close;
  dm.ADO93.Parameters[0].Value:=dm.ADO92RKEY.Value;//可以更新
  dm.ADO93.Prepared;
  dm.ADO93.Open;
  dm.AQ93.Close;
  dm.AQ93.Parameters[0].Value:=dm.ADO92RKEY.Value; //作显示数据,不可更新
  dm.AQ93.Prepared;
  dm.AQ93.Open;
  form4.ShowModal;
  dm.ADO93.Close;
  dm.AQ93.Close;
 finally
  form4.free;
 end;
end;

procedure TForm1.N11Click(Sender: TObject);
var
  sys_datetime:TDateTime;
begin
if (strtoint(vprev)<>4)  then
 begin
  messagedlg('对不起,您没有更新系统数据的权限!',mtinformation,[mbok],0);
  exit;
 end;
if messagedlg('你确认要用输入的数量替换系统原库存数量吗??',mtconfirmation,[mbyes,mbno],0)=mryes then
 begin
  try
    dm.ADOConnection1.BeginTrans;
    dm.ado95.Open;        //打开记录表
    dm.ADOupdate.Close;   //打开差异更新表
    dm.ADOupdate.Parameters[0].Value := dm.ADO92RKEY.Value;
    dm.ADOupdate.Open;
    dm.ADOdivport.Close;    //打开差异报表
    dm.ADOdivport.Parameters[0].Value:=dm.ADO92RKEY.Value;
    dm.ADOdivport.Open;
    dm.ADO493.Open;
    sys_datetime:=common.getsystem_date(DM.ADOQuery1,0);
   while not dm.ADOupdate.Eof do
   begin
    dm.ADOupdate.Edit;
    if dm.ADOupdatedivergent.Value <>0 then
     begin
      dm.ADOupdateQUAN_ON_HAND.Value := dm.ADOupdateQUANTITY.Value;//更新库存data0022
      dm.ado95.Append;
      dm.ado95TRAN_TP.Value:=23; //更新95记录因盘点而产生的差异
      dm.ado95INVT_PTR.Value:=dm.ADOupdateINVENTORY_PTR.Value;  //17.rkey
      dm.ado95SRCE_PTR.Value:=dm.ADOupdateINV_TRAN_PTR.Value; //22.rkey
      dm.ado95TRAN_BY.Value:=dm.ADOupdateENTERED_BY_EMPL_PTR.Value;
      dm.ado95USER_PTR.Value:=dm.ADOupdateUSER_PTR.Value;    //73.rkey
      dm.ado95REC_BY.Value:=dm.ADOupdateCOUNTED_BY_EMPL_PTR.Value; {清点员工}
      dm.ado95REFERENCE_NUMBER.Value:=dm.ADO92PHY_COUNT_NO.Value;
      dm.ado95QUANTITY.Value:=dm.ADOupdatedivergent.Value;{记录差异数据+or-}
      dm.ado95TRAN_DATE.Value := sys_datetime;    //负数代表盘亏,正数代表盘赢
      dm.ado95.Post;
      with dm.ADOQuery1 do        //更新17库存数量
      begin
       close;
       sql.Text:='update data0017'+#13+
                 'set QUAN_ON_HAND=QUAN_ON_HAND + :hand'+#13+
                 'where rkey='+dm.ado95INVT_PTR.AsString;
       Parameters[0].Value:=dm.ado95QUANTITY.Value;
       execsql;
      end;
     end;
    dm.ADOupdatestatus.Value:=2;  //标识为已更新
    dm.ADOupdate.Post;  //(没有更新data0017中的qty_on_hand)
    dm.ADOupdate.Next;
   end;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select rkey from data0093');
    sql.Add('where status=0');
    sql.Add('and PHY_LIST_PTR='+dm.ADO92RKEY.AsString);
    open;
   end;
  if dm.ADOQuery1.IsEmpty then
   begin
    dm.ADO92.Edit;
    dm.ADO92STATUS.Value:='1';//标识为已完成
    dm.ADO92OVER_DATE.Value:=sys_datetime;//更新完成时间
    dm.ADO92.Post;
   end;
  dm.ADOConnection1.CommitTrans;
  dm.ado95.Close;
  dm.ADOupdate.Close;
  form_report:=tform_report.Create(application);

   form_report.ppReport1.Reset;
   form_report.ppReport1.Template.FileName :=
    stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
      'invptycount_divgent.rtm'; //R:\NIERP\Report\invptycount_divgent.rtm
   form_report.ppReport1.Template.LoadFromFile;

  form_report.ppReport1.PrintReport;
  form_report.free;
  dm.ADOdivport.Close;
  messagedlg('该次盘点所有数据更新系统成功!!!',mtinformation,[mbok],0);
  except
   dm.ADOConnection1.RollbackTrans;
   messagedlg('该次盘点数据更新系统产生了错误!!!',mtError,[mbcancel],0);
   exit;
  end;
 end;
end;

procedure TForm1.N14Click(Sender: TObject);
begin
try
 form_report:=tform_report.Create(application);
 form_report.ppReport1.Reset;
 form_report.ppReport1.Template.FileName :=
  stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
    'invptycount_divgent.rtm'; //R:\NIERP\Report\invptycount_divgent.rtm
 form_report.ppReport1.Template.LoadFromFile;
  
 dm.ADOdivport.Close;
 dm.ADOdivport.Parameters[0].Value:=dm.ADO92RKEY.Value;
 dm.ADOdivport.Prepared;
 dm.ADOdivport.Open;

 form_report.ppReport1.PrintReport;
finally
 form_report.free;
 dm.ADOdivport.Close;
end;
end;

procedure TForm1.N13Click(Sender: TObject);
begin
try
 form_report1:=tform_report1.Create(application);

  form_report1.ppReport1.Reset;
  Form_report1.ppReport1.Template.FileName :=
    stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
      'invptycout_list.rtm';
  form_report1.ppReport1.Template.LoadFromFile;

 dm.aq93.Close;
 dm.aq93.Parameters[0].Value:=dm.ADO92RKEY.Value;
 dm.AQ93.Prepared;
 dm.aq93.Open;

 form_report1.ppReport1.PrintReport;
finally
 form_report1.free;
 dm.aq93.Close;
end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
if  dm.Adoconnection1.Connected then
 begin

 with dm.ADOQuery1 do
  begin                  //查找系统用户的员工指针
   active:=false;
   sql.Clear;
   sql.Add('select getdate() as sys_date');
   active:=true;
   dtpk2.Date:= dateof(fieldvalues['sys_date']);
   dtpk1.Date:= dtpk2.Date-dayof(dtpk2.Date)+1;
  end;
  dtpk1Exit(sender);
 end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i:integer;
begin
 if not app_init_2(dm.ADOConnection1) then
 begin
  showmsg('程序启动失败,请与管理员联系!',1);
  application.Terminate;
 end;
 self.Caption:=application.Title;

 DateSeparator := '-';
 ShortDateFormat := 'yyyy-mm-dd';
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;

 for i:= Low(v_colwidth) to High(v_colwidth) do
  self.v_colwidth[i]:=DBGrid1.Columns[i].Width;

end;

procedure TForm1.FormResize(Sender: TObject);
var
 i:byte;
begin
for i:=0 to 6 do
 dbgrid1.Columns[i].Width:=v_colwidth[i]+round((dbgrid1.Width-715)*v_colwidth[i]/686);
end;

procedure TForm1.N16Click(Sender: TObject);
var
 iCount, jCount: Integer;
 XLApp: Variant;
 Sheet: Variant;
begin
   dm.aqdc93.Close;
   dm.aqdc93.Prepared;
   dm.aqdc93.Open;
   if dm.aqdc93.IsEmpty then exit;
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

   XLApp.WorkBooks[1].WorkSheets[1].Name := '盘点清单明细表_'+dm.ADO92PHY_COUNT_NO.Value;
   Sheet := XLApp.Workbooks[1].WorkSheets[XLApp.WorkBooks[1].WorkSheets[1].Name];


   for iCount := 0 to dm.aqdc93.FieldCount-2 do
    Sheet.Cells[1, iCount + 1 ] :=dm.aqdc93.Fields[icount].DisplayLabel;

   for jcount :=1 to dm.aqdc93.RecordCount do
    begin
     for iCount := 0 to dm.aqdc93.FieldCount-2 do
      Sheet.Cells[jCount + 1, iCount + 1] := dm.aqdc93.Fields[icount].AsString;
     dm.aqdc93.Next;
    end;
   XlApp.Visible := True;
   Screen.Cursor := crDefault;
   dm.aqdc93.Close;
end;

procedure TForm1.N19Click(Sender: TObject);
var
 iCount, jCount: Integer;
 XLApp: Variant;
 Sheet: Variant;

begin
  dm.ADOdivport.Close;
  dm.ADOdivport.Parameters[0].Value:=dm.ADO92RKEY.Value;
  dm.ADOdivport.Prepared;
  dm.ADOdivport.Open;
  if dm.ADOdivport.IsEmpty then exit;

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

 XLApp.WorkBooks[1].WorkSheets[1].Name := '盘点差异'+dm.ADO92PHY_COUNT_NO.Value;
 Sheet := XLApp.Workbooks[1].WorkSheets[XLApp.WorkBooks[1].WorkSheets[1].Name];

 for iCount := 0 to dm.ADOdivport.FieldCount-1 do
  Sheet.Cells[1, iCount + 1 ] :=dm.ADOdivport.Fields[icount].DisplayLabel;
 for jcount :=1 to dm.ADOdivport.RecordCount do
  begin
    for iCount := 0 to dm.ADOdivport.FieldCount-1 do
     Sheet.Cells[jCount + 1, iCount + 1] := dm.ADOdivport.Fields[icount].AsString;
    dm.ADOdivport.Next;
  end;
   XlApp.Visible := True;
   Screen.Cursor := crDefault;
  dm.ADOdivport.Close;
 end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 application.Terminate;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
try
 form_report1:=tform_report1.Create(application);

form_report1.ppReport1.Reset;
form_report1.ppReport1.Template.FileName :=
  stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
    'invptycout_list.rtm'; //R:\NIERP\Report\invptycout_list.rtm
form_report1.ppReport1.Template.LoadFromFile;
form_report1.ppReport1.SaveAsTemplate:=true;

 form_report1.ppDesigner1.ShowModal;
finally
 form_report1.free;
 dm.aq93.Close;
end;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
try
 form_report:=tform_report.Create(application);
 form_report.ppReport1.Reset;
 form_report.ppReport1.Template.FileName :=
  stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
    'invptycount_divgent.rtm'; //R:\NIERP\Report\invptycount_divgent.rtm
 form_report.ppReport1.Template.LoadFromFile;
 form_report.ppReport1.SaveAsTemplate:=true;

 form_report.ppDesigner1.ShowModal;
finally
 form_report.free;
end;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
try
 aboutbox:=taboutbox.Create(application);
 aboutbox.ShowModal;
finally
 aboutbox.free;
end;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
dm.ADO92.Close;
if checkbox1.Checked then
 dm.ADO92.Parameters.ParamValues['v1']:=9
else
 dm.ADO92.Parameters.ParamValues['v1']:=0;
if checkbox2.Checked then
 dm.ADO92.Parameters.ParamValues['v2']:=9
else
 dm.ADO92.Parameters.ParamValues['v2']:=1;
dm.ADO92.Open;
end;

procedure TForm1.dtpk1Exit(Sender: TObject);
begin
 dm.ADO92.Close;
 dm.ADO92.Parameters.ParamValues['dtpk1']:=dtpk1.Date;
 dm.ADO92.Parameters.ParamValues['dtpk2']:=dtpk2.Date+1;
 dm.ADO92.Open;
end;

procedure TForm1.N1Click(Sender: TObject);
var
 iCount, jCount: Integer;
 XLApp: Variant;
 Sheet: Variant;
begin
 dm.ADOQuery1.Close;
 dm.ADOQuery1.SQL.Text:=
 'SELECT  TOP (100) PERCENT dbo.Data0017.INV_PART_NUMBER AS 材料编码,'+#13+
 'dbo.Data0017.INV_PART_DESCRIPTION AS 名称规格,'+#13+
  'dbo.Data0496.GROUP_NAME AS 材料类别,'+#13+
  'dbo.Data0002.UNIT_CODE AS 存货单位,'+#13+
  'dbo.Data0017.STD_COST AS 标准成本,'+#13+
  'SUM(dbo.Data0093.OLD_QUANTITY) AS 系统数量,'+#13+
  'SUM(dbo.Data0093.QUANTITY) AS 盘点数量'+#13+
 'FROM         dbo.Data0093 INNER JOIN'+#13+
 '       dbo.Data0017 ON dbo.Data0093.INVENTORY_PTR = dbo.Data0017.RKEY INNER JOIN'+#13+
 '       dbo.Data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496.RKEY INNER JOIN'+#13+
 '       dbo.Data0002 ON dbo.Data0017.STOCK_UNIT_PTR = dbo.Data0002.RKEY'+#13+
 'WHERE     (dbo.Data0093.PHY_LIST_PTR = '+dm.ADO92RKEY.AsString+')'+#13+
 'GROUP BY dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_PART_DESCRIPTION,'+#13+
 'dbo.Data0496.GROUP_NAME, dbo.Data0002.UNIT_CODE,dbo.Data0017.STD_COST'+#13+
 'ORDER BY 材料编码';
 dm.ADOQuery1.Prepared;
 dm.ADOQuery1.Open;
 if dm.ADOQuery1.IsEmpty then exit;

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

 XLApp.WorkBooks[1].WorkSheets[1].Name := '盘点清单汇总表_'+dm.ADO92PHY_COUNT_NO.Value;
 Sheet := XLApp.Workbooks[1].WorkSheets[XLApp.WorkBooks[1].WorkSheets[1].Name];

 for iCount := 0 to dm.ADOQuery1.FieldCount-1 do
  Sheet.Cells[1, iCount + 1 ] :=dm.ADOQuery1.Fields[icount].DisplayLabel;
 for jcount :=1 to dm.ADOQuery1.RecordCount do
  begin
    for iCount := 0 to dm.ADOQuery1.FieldCount-1 do
     Sheet.Cells[jCount + 1, iCount + 1] := dm.ADOQuery1.Fields[icount].AsString;
    dm.ADOQuery1.Next;
  end;
   XlApp.Visible := True;
   Screen.Cursor := crDefault;
  dm.ADOQuery1.Close;
 
end;

end.
