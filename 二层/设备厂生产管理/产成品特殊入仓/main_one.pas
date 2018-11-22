unit main_one;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Grids, DBGrids, Menus,ComObj, Excel2000,ClipBrd,
  DB, ADODB;

type
  TF_main = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Edit1: TEdit;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    Button2: TButton;
    db_ptr: TLabel;
    vprev: TLabel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    CheckBox1: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    Button3: TButton;
    Button4: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure dtpk1Exit(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure append_416(v_type:integer);
    procedure N2Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
    v_colwidth: array[0..6] of integer;
    field_name: string;

    OldGridWnd : TWndMethod;
    procedure NewGridWnd(var Message: TMessage);
  public
    { Public declarations }
   long_datetime:tdatetime;
   empl_ptr:integer;
   function ExistInventory(HD:THandle;Qry:TADOQuery):Boolean;
   function check0116(number: string):Boolean;
   function notAllowChange(rkey: Integer; tmpQuery: TADOQuery): Boolean;
  end;

var
  F_main: TF_main;

implementation

uses damo, main, report_comein,common, DateUtils;

{$R *.dfm}

procedure TF_main.FormCreate(Sender: TObject);
begin {  }
if not app_init_2(dm.ADOConnection1) then
 begin
  showmsg('程序起动失败,请联系管理员!',1);
  application.Terminate;
  exit;
 end;

  
  vprev.Caption:=common.vprev;
  {
  DM.ADOConnection1.Connected:=True;
  common.rkey73:='135';
  vprev.Caption:='2';   }

  self.Caption:=application.Title;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  OldGridWnd := DBGrid1.WindowProc;
  DBGrid1.WindowProc := NewGridWnd;

end;

procedure TF_main.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
  begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
    dbgrid1.DataSource.DataSet.MoveBy(1)
   else
    dbgrid1.DataSource.DataSet.MoveBy(-1)
  end
 else
  begin
   OldGridWnd(Message);
  end;
end;

procedure TF_main.append_416(v_type: integer);
begin
if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
 messagedlg('对不起,您只有本程序的只读权限!',mtinformation,[mbok],0)
else
begin
form1:=tform1.Create(application);
form1.Edit5.Text := DateTimeToStr(common.getsystem_date(dm.ADOQuery1,0));

dm.ADO416.Close;
dm.ADO416.Parameters[0].Value:=null;
dm.ADO416.Open;
dm.ado416.append;
dm.ADO416type.Value:=v_type;
dm.ADO416empl_ptr.Value:=self.empl_ptr;


if v_type=4 then
 with form1 do
  begin
   label1.Visible:=true;
   edit1.Visible:=true;
   bitbtn2.Visible:=true;
   caption:='销售退货入仓';
   BitBtn5.Visible := False;
   Label5.Left := BitBtn5.Left;
   Label10.Caption := '退货总数:';
  end
else
 form1.Caption:='直接入仓';

if form1.ShowModal=mrok then
 begin
  edit1.Text:='';
  dm.AQ416.Close;
  dm.AQ416.Open;
  dm.AQ416.Locate('rkey',dm.ADO416rkey.Value,[]);
 end
else
 dm.ADO416.Cancel;
form1.Free;
end;
end;

procedure TF_main.FormShow(Sender: TObject);
var
 i:byte;
begin
if  dm.ADOConnection1.Connected then
 begin

  with dm.adoquery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select EMPLOYEE_PTR from data0073');
    sql.Add(' where rkey ='+common.rkey73);

    open;
    self.empl_ptr:=fieldvalues['employee_ptr'];
   end;
  with dm.adoquery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select getdate() as tdate');
    open;
    self.long_datetime := fieldvalues['tdate'];
    dtpk2.Date:=strtodate(datetostr(self.long_datetime));
    dtpk1.Date:=dtpk2.Date-30;
   end;
 for i:=low(v_colwidth) to high(v_colwidth) do
  v_colwidth[i]:=dbgrid1.Columns[i].Width;
  self.field_name:='number';   
  self.dtpk1Exit(sender);
 end;
end;

procedure TF_main.Button1Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TF_main.dtpk1Exit(Sender: TObject);
begin
dm.AQ416.Close;
dm.AQ416.Parameters.ParamByName('dtpk1').Value:=dtpk1.Date;
dm.AQ416.Parameters.ParamByName('dtpk2').Value:=dtpk2.Date+1;
dm.AQ416.Open;
end;

procedure TF_main.FormResize(Sender: TObject);
var
 i:byte;
begin
{for i:=low(v_colwidth) to high (v_colwidth) do
  dbgrid1.Columns[i].Width:=v_colwidth[i]+round((dbgrid1.Width-649)*v_colwidth[i]/620);
}
end;

procedure TF_main.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin
if (column.ReadOnly=true) and (column.FieldName<>self.field_name) then
 begin
  if column.FieldName<>'sys_date' then
   begin
    field_name:=column.FieldName;
    label1.Caption := column.Title.Caption;
    for i:=0 to dbgrid1.FieldCount-1 do
    if dbgrid1.Columns[i].Title.Color= clred then
    dbgrid1.Columns[i].Title.Color:= clbtnface;
    column.Title.Color:=clred;
   end;

  edit1.SetFocus;
  with dm.AQ416 do
   begin
    close;
    sql.Delete(sql.Count-1);
    sql.Add('order by '+column.FieldName);
    open;
   end;
 end;
end;

procedure TF_main.Edit1Change(Sender: TObject);
begin
if (trim(edit1.Text)<>'')  then
 dm.AQ416.Filter:=field_name+' like ''%'+trim(edit1.Text)+'%'''
else
 dm.AQ416.Filter:='';
end;

procedure TF_main.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then showmessage(dm.AQ416.SQL.Text);
end;

procedure TF_main.CheckBox1Click(Sender: TObject);
begin
dm.AQ416.Close;
if checkbox1.Checked then
begin
 dm.AQ416.Parameters[2].Value:=0;
 //DBGrid1.Columns[2].Visible := False;
end
else
 dm.AQ416.Parameters[2].Value:=1;

if checkbox5.Checked then
begin
 dm.AQ416.Parameters[4].Value:=0;
  //DBGrid1.Columns[2].Visible := False;
end
else
 dm.AQ416.Parameters[4].Value:=2;

if checkbox4.Checked then
 begin
  dm.AQ416.Parameters[3].Value:=0;
  //DBGrid1.Columns[2].Visible := True;
 end
else
 dm.AQ416.Parameters[3].Value:=4;
 
dm.AQ416.Open;
end;

procedure TF_main.Button2Click(Sender: TObject);
var
 rkey416:integer;
begin
 rkey416:=dm.AQ416rkey.Value;
 dm.AQ416.Close;
 dm.AQ416.Open;
 if rkey416>0 then dm.AQ416.Locate('rkey',rkey416,[]);
end;

procedure TF_main.N5Click(Sender: TObject);
begin
  if   ExistInventory(Self.Handle,DM.ADOQuery1) then
    Exit;

 append_416(1);
end;

procedure TF_main.N2Click(Sender: TObject);
begin
  if notAllowChange(dm.AQ416rkey.Value,DM.ADOQuery1) then Exit; //yefeng与盘点时间对比后判断是否允许操作
  if   ExistInventory(Self.Handle,DM.ADOQuery1) then
    Exit;

  if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
    messagedlg('对不起,您只有本程序的只读权限!',mtinformation,[mbok],0)
  else
  begin
    form1:=Tform1.Create(application);
    form1.edit2.Text:=dm.AQ416WAREHOUSE_CODE.Value;
    form1.Label3.Caption:=dm.AQ416WAREHOUSE_NAME.Value;
    form1.edit3.Text:=dm.AQ416dept_code.Value;
    form1.Label5.Caption:=dm.AQ416dept_name.Value;
    form1.BitBtn3.Enabled:=false;
    form1.BitBtn5.Enabled:=false;

    dm.ADO416.Close;
    dm.ADO416.Parameters[0].Value:=dm.AQ416rkey.Value;
    dm.ADO416.Open;
    if DM.ADO416type.Value = 4 then
    begin
      form1.Label1.Visible := True;
      form1.Edit1.Visible := True;
      form1.BitBtn2.Visible := True;
      form1.BitBtn5.Visible := False;
      form1.Edit1.Text := DM.AQ416.FieldValues['rma_number'];
    end;
    dm.ADO416.Edit;

    if form1.ShowModal=mrok then
      begin
      dm.AQ416.Close;
      dm.AQ416.Open;
      dm.AQ416.Locate('rkey',dm.ADO416rkey.Value,[]);
      end
    else
    dm.ADO416.Cancel;

    form1.Free;
  end;
end;

procedure TF_main.N7Click(Sender: TObject);
begin
  if   ExistInventory(Self.Handle,DM.ADOQuery1) then
    Exit;

 append_416(4);
end;

procedure TF_main.PopupMenu1Popup(Sender: TObject);
begin
if dm.AQ416.IsEmpty then
 begin
  n2.Enabled:=false;
  n3.Enabled:=false;
  n4.Enabled:=false;
  n8.Enabled:=false;
 end
else
 begin
  if (dm.AQ416type.Value<>2) then
   begin
    n2.Enabled:=true;
    n4.Enabled:=true;
   end
  else
   begin
    n2.Enabled:=false;
    n4.Enabled:=false;
   end;
  n3.Enabled:=true;
  n8.Enabled:=true;
 end;
end;

procedure TF_main.N3Click(Sender: TObject);
begin
form1:=Tform1.Create(application);
dm.ADO416.Close;
dm.ADO416.Parameters[0].Value:=dm.AQ416rkey.Value;
dm.ADO416.Open;
form1.edit2.Text:=dm.AQ416WAREHOUSE_CODE.Value;
form1.Label3.Caption:=dm.AQ416WAREHOUSE_NAME.Value;
form1.edit3.Text:=dm.AQ416dept_code.Value;
form1.Label5.Caption:=dm.AQ416dept_name.Value;

form1.BitBtn1.Enabled:=false;
form1.BitBtn3.Enabled:=false;
form1.BitBtn5.Enabled:=false;
form1.Edit4.ReadOnly:=true;
form1.Edit6.ReadOnly:=true;

form1.DBGrid1.PopupMenu:=form1.PopupMenu2;
if dm.ADO416type.Value=4 then
 with form1 do
 begin
  label1.Visible:=true;
  edit1.Visible:=true;
  label3.Visible:=true;
  edit1.Text:=dm.AQ416SALES_ORDER.Value;
  bitbtn2.Visible:=true;
  bitbtn2.Enabled:=false;
 end;
if DM.ADO416type.Value = 4 then
begin
  form1.Label1.Visible := True;
  form1.Edit1.Visible := True;
  form1.BitBtn2.Visible := True;
  form1.BitBtn5.Visible := False;
  form1.Edit1.Text := DM.AQ416.FieldValues['rma_number'];
end;
if form1.ShowModal=mrok then
 begin
 end;
form1.Free;
end;

function TF_main.ExistInventory(HD:THandle;Qry:TADOQuery):Boolean;
begin                          //用于检查是否存在未结的成品盘点记录。彭华于20121101
  Result:=False;
  with Qry do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select rkey from data0214 where STATUS=0';
    Open;
    if IsEmpty=False then
    begin
      MessageBox(HD,'现存在未结的成品盘点记录，请先处理！','错误',MB_ok+MB_iconStop);
      Result:=True;
    end;
    Close;
  end;
end;


procedure TF_main.N4Click(Sender: TObject);
begin
  if notAllowChange(dm.AQ416rkey.Value,DM.ADOQuery1) then Exit; //yefeng与盘点时间对比后判断是否允许操作

  if   ExistInventory(Self.Handle,DM.ADOQuery1) then
    Exit;

  if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
    messagedlg('对不起,您只有本程序的只读权限!',mtinformation,[mbok],0)
  else if check0116(dm.AQ416number.AsString) then
    Abort
  else
  if (messagedlg('您确定要删除该条入仓记录吗?',mtconfirmation,[mbyes,mbno],0)=mryes) then
  begin
    with dm.qrydata0053  do        //打开所有的待删除记录明细
    begin
    close;
    sql.Clear;
    SQL.Text:='select * from Data0053 where NPAD_PTR='+dm.AQ416rkey.AsString;
    Open;
    end;
    try
     dm.ADOConnection1.BeginTrans;
      with DM do    ///////////////////////////彭华添加于2012-8-16，在删除前确定删除数量是否小于和等于当前库存数量，避免出现负库存 。
      while not qrydata0053.eof do
      begin
        qrywzcp0001.Close;
        qrywzcp0001.SQL.Clear;
        qrywzcp0001.SQL.Text:='select * from WZCP0001 where proc_ptr='+ qrydata0053.FieldByName('CUST_PART_PTR').AsString
             +' and location_ptr='+qrydata0053.FieldByName('LOC_PTR').AsString;
        qrywzcp0001.Open;

        if  qrywzcp0001.FieldByName('qty_on_hand').Value < qrydata0053.FieldByName('QUANTITY').Value then   //如果当前库存数量小于删除的记录的入库数量。
        begin
          ADOConnection1.RollbackTrans;
          with ADOQuery1 do
          begin
            Close;
            SQL.Clear;
            SQL.Text:='select PROD_CODE,PRODUCT_NAME,LOCATION,* from Data0053  join Data0008 on Data0053.CUST_PART_PTR=Data0008.RKEY '
              +'join data0016 on data0016.rkey=Data0053.LOC_PTR where Data0053.rkey='+qrydata0053.fieldByName('rkey').AsString;
            Open;
            messagedlg('产品编号：'+FieldByName('PROD_CODE').Value +' 仓库名称：'+FieldByName('LOCATION').Value
             +#10#13+'当前库存数量小于删除记录的入库数量，不允许删除！！！',mtinformation,[mbok],0);
          end;
          Exit;
        end;
        qrywzcp0001.Edit;
        qrywzcp0001.FieldByName('qty_on_hand').Value:=
               qrywzcp0001.FieldByName('qty_on_hand').Value-qrydata0053.FieldByName('QUANTITY').Value;
        qrywzcp0001.Post;
        qrydata0008.Close;
        qrydata0008.SQL.Clear;
        qrydata0008.SQL.Text:='select * from Data0008 where rkey='+ qrydata0053.FieldByName('CUST_PART_PTR').AsString;
        qrydata0008.Open;
        qrydata0008.Edit;
        qrydata0008.FieldByName('qty_onhand').Value:=
          qrydata0008.FieldByName('qty_onhand').Value-qrydata0053.FieldByName('QUANTITY').Value;
        qrydata0008.Post;
        qrydata0053.Next;
      end;
      dm.ADO416.Close;
      dm.ADO416.Parameters[0].Value:=dm.AQ416rkey.Value;
      dm.ADO416.Open;
      if dm.ADO416type.Value=4 then
      begin
        with dm.ADOQuery1  do
        begin

          Close;
          SQL.Clear;
          SQL.Text := 'update data0098 set QTY_RECD = QTY_RECD - '
            + FloatToStr(dm.AQ416quantity.value) + ', RMA_STATUS=2 where rkey = ' + IntToStr(dm.AQ416rkey98.Value);
          ExecSQL;

          //更改wzcp0071表 退货数量returen_qty
          Close;
          SQL.Clear;
          SQL.Text := 'update wzcp0071 set wzcp0071.returen_qty = ' + FloatToStr(dm.AQ416quantity.value) + ' from wzcp0071 , wzcp0063 '
          + 'where wzcp0071.rkey=wzcp0063.cp71_ptr and wzcp0063.rkey = ' + IntToStr(dm.AQ416SO_SHIP_PTR.Value);
          ExecSQL;
          // 更改订单状态  wzcp0070表 订单状态 status : 1未提交, 2待确认, 3已确认, 4已投产, 5已完成, 6被退回
          Close;
          SQL.Clear;
          SQL.Text := 'select (wzcp0071.PARTS_SHIPPED - wzcp0071.returen_qty) as ''欠货数量'' from wzcp0071 inner join wzcp0063 '
          + 'on wzcp0071.rkey=wzcp0063.cp71_ptr where wzcp0063.rkey = ' + IntToStr(dm.AQ416SO_SHIP_PTR.Value);
          Open;
          if FieldByName('欠货数量').AsFloat <= 0 then
          begin
            Close;
            SQL.Clear;
            SQL.Text := 'update wzcp0070 set status=5 where rkey = ' + IntToStr(dm.AQ416rkey70.Value);
            ExecSQL;
          end;
        end;
      end;      
      dm.ADO416.Delete;    //data0053入库明细表是定义的级联删除，当data0416表主记录删除的时候，明细记录也删除了。

      dm.ADOConnection1.CommitTrans;
      messagedlg('删除操作成功',mtinformation,[mbok],0);
      dm.AQ416.Close;
      dm.AQ416.Open;
    except
      on e:Exception do
      begin
        dm.ADOConnection1.RollbackTrans;
        messagedlg('删除操作不成功，原因是：'+e.Message,mtinformation,[mbok],0);
      end;
    end;
  end;
end;


procedure TF_main.N8Click(Sender: TObject);
begin
 try
   f_partin_report:=tf_partin_report.Create(application);
   F_partin_report.ppReport1.Reset;
   F_partin_report.ppReport1.Template.FileName :=
      stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
        'wzcppart_comein.rtm';
   F_partin_report.ppReport1.Template.LoadFromFile;
   F_partin_report.ppReport1.SaveAsTemplate:=False;
   f_partin_report.ppReport1.Print;
 finally
   f_partin_report.Free;
 end;
end;

procedure TF_main.Button3Click(Sender: TObject);
 var
   bm: TBookmark;
   col, row: Integer;
   sline: String;
   mem: TStringList;
   ExcelApp: Variant;
 begin
    Screen.Cursor := crHourglass;
    DBGrid1.DataSource.DataSet.DisableControls;
    bm := DBGrid1.DataSource.DataSet.GetBookmark;
    DBGrid1.DataSource.DataSet.First;

    // create the Excel object
     ExcelApp := CreateOleObject('Excel.Application');
     ExcelApp.WorkBooks.Add(xlWBatWorkSheet);
     ExcelApp.WorkBooks[1].WorkSheets[1].Name := Caption;

    // First we send the data to a memo
    // works faster than doing it directly to Excel
    mem := TStringList.Create;
    sline := '';

    // add the info for the column names
    for col := 0 to DBGrid1.FieldCount-1 do
     sline := sline + DBGrid1.Fields[col].DisplayLabel + #9;
    mem.Add(sline);

    // get the data into the memo
    for row := 0 to DBGrid1.DataSource.DataSet.RecordCount-1 do
     begin
      sline := '';
      for col := 0 to DBGrid1.FieldCount-1 do
       sline := sline + DBGrid1.Fields[col].AsString + #9;
      mem.Add(sline);
      DBGrid1.DataSource.DataSet.Next;
     end;

    // we copy the data to the clipboard
    clipboard.Clear;
    Clipboard.AsText:=mem.Text;
    // if needed, send it to Excel
    // if not, we already have it in the clipboard
    ExcelApp.Workbooks[1].WorkSheets[Caption].Paste;
    ExcelApp.Visible := true;
    mem.Free;
    clipboard.Clear;
  //  FreeAndNil(ExcelApp);
    DBGrid1.DataSource.DataSet.GotoBookmark(bm);
    DBGrid1.DataSource.DataSet.FreeBookmark(bm);
    DBGrid1.DataSource.DataSet.EnableControls;
    Screen.Cursor := crDefault;
 end;

procedure TF_main.Button4Click(Sender: TObject);
begin
 try
   f_partin_report:=tf_partin_report.Create(application);
   F_partin_report.ppReport1.Reset;
   F_partin_report.ppReport1.Template.FileName :=
      stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
        'wzcppart_comein.rtm';
   F_partin_report.ppReport1.Template.LoadFromFile;
   F_partin_report.ppReport1.SaveAsTemplate:=true;
   F_partin_report.ppdesigner1.ShowModal;
 finally
   f_partin_report.Free;
 end;
end;

function TF_main.check0116(number: string): Boolean;
begin
  Result:= False;
  with DM.ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select MEMO_NUMBER = Isnull(t116.MEMO_NUMBER,'''') from data0416 t416 inner join ');
    SQL.Add('data0098 t98 on t416.rma_ptr = t98.RKEY inner join ');
    SQL.Add('data0116 t116 on t98.srce_ptr = t116.RKEY ');
    SQL.Add('Where t416.number = '''+number+''' ');
    SQL.Add('And t416.type = 4 ');  //退货入库
    SQL.Add('And t116.memo_status <> 3');  //未取消
    Open;
    if RecordCount <> 0 then
    begin
      ShowMessage('不允许删除，存在有效的退货备忘记录：'+FieldByName('MEMO_NUMBER').AsString);
      Result:= True;
    end;
  end;
end;

function TF_main.notAllowChange(rkey: Integer; tmpQuery: TADOQuery): Boolean;
var
  res:string;
begin
  Result:=True;
  with tmpQuery do
  begin
    SQL.Clear;
//    sql.Add('SELECT TOP (1) dbo.Data0214.FG_COUNT_CODE AS name, dbo.Data0214.DATE_CREATED AS cmp1, dbo.Data0214.STATUS, '+ #13#10+
//      'dbo.Data0005.EMPLOYEE_NAME AS uname, dbo.data0416.sys_date AS cmp2'+ #13#10+
//      'FROM dbo.Data0214 INNER JOIN'+ #13#10+
//      'dbo.Data0005 ON dbo.Data0214.EMPLOYEE_PTR = dbo.Data0005.RKEY INNER JOIN' + #13#10 +
//      'dbo.Data0215 ON dbo.Data0214.RKEY = dbo.Data0215.FG_LIST_PTR INNER JOIN'  + #13#10 +
//      'dbo.data0416 ON dbo.Data0215.wzcp0001_ptr = dbo.data0416.warehouse_ptr'+ #13#10 +

    SQL.Add('SELECT  TOP (1)   dbo.Data0214.FG_COUNT_CODE AS name, dbo.Data0214.DATE_CREATED AS cmp1, dbo.Data0214.STATUS, '
      + #13#10 +
      '                      dbo.Data0005.EMPLOYEE_NAME AS uname, dbo.data0416.sys_date as cmp2, dbo.data0416.rkey'
      + #13#10 + 'FROM         dbo.Data0214 INNER JOIN' + #13#10 +
      '                      dbo.Data0005 ON dbo.Data0214.EMPLOYEE_PTR = dbo.Data0005.RKEY CROSS JOIN'
      + #13#10 + '                      dbo.data0416'+ #13#10 +


      'WHERE (dbo.data0416.rkey = '+IntToStr(rkey)+')' + #13#10 +
      'ORDER BY dbo.Data0214.RKEY DESC');
    Open;
    if Recordset.RecordCount>0 then
    begin
      First;
      //cmp2 416操作时间  cmp1 214盘点时间  1表示新建时间盘点后的     0,-1是等于和小于 都不允许
      if CompareDateTime(FieldByName('cmp2').AsDateTime,
                         FieldByName('cmp1').AsDateTime) < 1 then
      begin
        case (FieldByName('STATUS').AsInteger) of
        1:res:='已经被盘点记录无法修改';
        0:res:='存在正在进行的盘点代码 '+FieldByName('name').AsString+
               ' 的盘点，如需修改请联系'+ FieldByName('uname').AsString;
        else
          res:='存在状态无法识别的盘点代码 '+FieldByName('name').AsString+
               ' 的盘点，如需修改请联系'+ FieldByName('uname').AsString;
        end;
        ShowMessage(res);
      end
      else
      Result:=False;
      //ShowMessage(' 214: '+FormatDateTime('YYYYMMDDHHNNSS',FieldByName('cmp1').AsDateTime)+' 416:'+FormatDateTime('YYYYMMDDHHNNSS',FieldByName('cmp2').AsDateTime));
    end
    else
      Result:=False;  //无盘点代码 或 未包含进盘点范围内
    Close;

    SQL.Clear;
  end;
end;

end.
