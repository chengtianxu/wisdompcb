unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Menus, ComCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Splitter1: TSplitter;
    DBGrid2: TDBGrid;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    dtpk1: TDateTimePicker;
    DTPk2: TDateTimePicker;
    Label2: TLabel;
    N5: TMenuItem;
    csi_ptr: TLabel;
    vprev: TLabel;
    db_ptr: TLabel;
    N6: TMenuItem;
    N7: TMenuItem;
    BitBtn3: TBitBtn;
    Timer1: TTimer;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    PO1: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure dtpk1Exit(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormResize(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure PO1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
  private
    { Private declarations }
   hMapFile: THandle;
   MapFilePointer: Pointer;
   dbgrid2_coltotal:integer;
   v_colwidth,v_colwidth1: array of integer;
   field_name:string;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);   
  public
    { Public declarations }
   sys_longdate,sys_shortdate:tdatetime;
   empl_ptr:integer;
   stock_flag:string;
  end;

var
  Form1: TForm1;

implementation

uses data_module, aded_rece, received_search, po_search, direct_ware,
  invtin_report, mul_report;

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

procedure TForm1.N10Click(Sender: TObject); //连续列印
var
 i:integer;
begin
 form_mulreport:=tform_mulreport.Create(application);
 if form_mulreport.ShowModal=mrok then
  begin
   form_report:=tform_report.Create(application);
   form_report.ppReport1.DeviceType:='Printer';
   form_report.ppReport1.ShowPrintDialog:=false;
   for i:=1 to form_mulreport.StG2.RowCount-2 do
    begin
     form_report.Aqwz456.close;
     form_report.Aqwz456.Parameters[0].Value:=strtoint(form_mulreport.StG2.Cells[2,i]);
     form_report.Aqwz456.open;
     form_report.ppReport1.Print;
     dm.ADO456.Close;
     dm.ADO456.Parameters[0].Value := strtoint(form_mulreport.StG2.Cells[2,i]);
     dm.ADO456.Open;
     dm.ADO456.Edit;
     dm.ADO456PRINTED.Value:='Y';
     dm.ADO456.Post;
    end;
   form_report.free;
  end;
 form_mulreport.free;
 bitbtn3click(sender);
end;

procedure TForm1.N9Click(Sender: TObject); //单个列印
begin
 form_report:=tform_report.Create(application);
 form_report.Aqwz456.close;
 form_report.Aqwz456.Parameters[0].Value:=dm.Aqwz456rkey.Value;
 form_report.Aqwz456.open;
 form_report.ppReport1.Print;
 dm.Aqwz456.Edit;
 dm.Aqwz456PRINTED.Value:='Y';
 dm.Aqwz456.post;
 form_report.free;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 application.Terminate;
end;

procedure TForm1.FormShow(Sender: TObject);
var
 i:byte;
begin

if not dm.ADOConnection1.Connected then
 begin
   if trim(vprev.Caption)='' then  application.Terminate;
   dm.adoconnection1.ConnectionString := db_ptr.Caption;
   dm.Adoconnection1.Connected := true;


setlength(v_colwidth,8);
setlength(v_colwidth1,7);
dbgrid2_coltotal:=0;
for i:=0 to high(v_colwidth) do v_colwidth[i]:=dbgrid1.Columns[i].Width;
for i:=0 to high(v_colwidth1) do
 begin
  v_colwidth1[i] := dbgrid2.Columns[i].Width;
  dbgrid2_coltotal := dbgrid2_coltotal+v_colwidth1[i];
 end;

  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select EMPLOYEE_PTR from data0073');
    sql.Add('where rkey='+csi_ptr.Caption);
    open;
    empl_ptr := fieldvalues['EMPLOYEE_PTR'];
   end;
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select stock_in_flag from data0192');
    open;
    self.stock_flag := fieldvalues['stock_in_flag'];
   end;
  with dm.ADOQuery1 do
   begin
    active:=false;
    sql.Clear;
    sql.Add('select getdate() as v_dt');
    active:=true;
    sys_longdate := fieldvalues['v_dt']; //长格式
    sys_shortdate:=strtodate(datetostr(sys_longdate));
   end;

  dtpk2.Date := sys_shortdate;
  dtpk1.Date := dtpk2.Date - 5;

  dm.aqwz456.Close;
  dm.aqwz456.Parameters[6].Value := dtpk1.Date;
  dm.aqwz456.Parameters[7].Value := dtpk2.Date+1;
  dm.aqwz456.Open;
  dm.Aqwz22.Open;
  self.Timer1Timer(sender);

end;
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin
if (column.ReadOnly) and (field_name<>column.FieldName) then
 begin
  label1.Caption:=column.Title.Caption;
  self.field_name:=column.FieldName;
  edit1.SetFocus;
  for i:=0 to dbgrid1.FieldCount-1 do
   if dbgrid1.Columns[i].Title.Color= clred then
    dbgrid1.Columns[i].Title.Color:= clbtnface;
  column.Title.Color:=clred;  
 end
else
 edit1.SetFocus;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
if trim(edit1.Text)<>'' then
  dm.aqwz456.Filter:=self.field_name+' like ''%'+trim(edit1.Text)+'%'''
 else
  dm.aqwz456.Filter:=''; 
end;

procedure TForm1.FormCreate(Sender: TObject);
var
 ZAppName: array[0..127] of char;
 s,title_name:string;
 Found: HWND;
 vprog:pchar;
begin
  hMapFile := CreateFileMapping ($FFFFFFFF, // 特殊内存映射句柄
    nil, page_ReadWrite, 0,10000, 'coimasp20'); // 文件名
  MapFilePointer := MapViewOfFile (hMapFile,File_Map_All_Access, 0, 0, 0); // 访问整个映象文件
  S := PChar (MapFilePointer);//从共享内存读出内容
  csi_ptr.Caption := trim(copy(S,1,pos(' ',s)));
  vprev.Caption := trim(copy(S,pos(' ',s)+1,pos(',',s)-pos(' ',s)-1)); //权限
  db_ptr.Caption := trim(copy(S,pos(',',s)+1,length(s)-pos(',',s))); //那一个数据库

  title_name:=application.Title;
  application.Title:='OnlyOne'+ IntToStr(HInstance);
  vprog:=pchar(title_name);
  strpcopy(ZAppName,vprog);
  Found := FindWindow(nil,ZAppName);

  if Found <> 0 then
   begin
    ShowWindow(Found, SW_SHOWMINIMIZED);
    ShowWindow(Found, SW_SHOWNORMAL);
    application.Terminate;
   end;

  application.Title := title_name;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
 field_name:='GRN_NUMBER';
 
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin

 dm.aqwz456.Close;
if not checkbox1.Checked then
 dm.aqwz456.Parameters[0].Value:=1
else
 dm.aqwz456.Parameters[0].Value:=0;
if not checkbox2.Checked then
 dm.aqwz456.Parameters[1].Value:=2
else
 dm.aqwz456.Parameters[1].Value:=0;
if not checkbox3.Checked then
 dm.aqwz456.Parameters[2].Value:=3
else
 dm.aqwz456.Parameters[2].Value:=0;
if not checkbox4.Checked then
 dm.aqwz456.Parameters[3].Value:=4
else
 dm.aqwz456.Parameters[3].Value:=0;
if not checkbox5.Checked then
 dm.aqwz456.Parameters[4].Value:=5
else
 dm.aqwz456.Parameters[4].Value:=0;
if not checkbox6.Checked then
 dm.aqwz456.Parameters[5].Value:=6
else
 dm.aqwz456.Parameters[5].Value:=0;

 DM.aqwz456.open;

end;

procedure TForm1.dtpk1Exit(Sender: TObject);
begin
 dm.aqwz456.Close;
 dm.aqwz456.Parameters[6].Value := dtpk1.Date;
 dm.aqwz456.Parameters[7].Value := dtpk2.Date+1;
 dm.aqwz456.Open;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
if dm.Aqwz456TTYPE.Value =1 then
try
form2:=tform2.Create(application);
form2.aded_flag:=3;     //编辑
if form2.ShowModal=mrok then
 begin
  dm.aqwz456.Close;
  dm.aqwz456.Open;
  dm.aqwz456.Locate('rkey',dm.ado456rkey.Value,[]);
  dm.ADO456.Close;
 end;
finally
form2.Free;
end
else
if dm.Aqwz456TTYPE.Value =3 then
try
 form4:=tform4.Create(application);
 form4.aded_flag:=2;
 if form4.ShowModal=mrok then
  begin
   dm.aqwz456.Close;
   dm.aqwz456.Open;
   dm.aqwz456.Locate('rkey',dm.ado456rkey.Value,[]);
   dm.ADO456.Close;
  end;
finally
 form4.Free;
end;

end;

procedure TForm1.N3Click(Sender: TObject);
begin
if dm.Aqwz456TTYPE.Value =1 then
begin
form2:=tform2.Create(application);
form2.aded_flag:=4;
form2.BitBtn1.Enabled:=false;
form2.BitBtn4.Enabled:=false;

form2.StrGrid1.Options:=form2.StrGrid1.Options-[goEditing];
form2.Edit1.Enabled:=false;
form2.Edit5.Enabled:=false;
form2.Edit6.Enabled:=false;
form2.edit11.Enabled:=false;
form2.edit7.Enabled:=false;
form2.combobox1.enabled:=false;
form2.CheckBox1.Enabled:=false;
if form2.ShowModal=mrok then
 begin

 end;
form2.Free;
end
else
if dm.Aqwz456TTYPE.Value = 3 then
try
 form4:=tform4.Create(application);
 form4.aded_flag:=3;
 form4.edit1.enabled:=false;
 form4.edit2.enabled:=false;
 form4.edit5.enabled:=false;
 form4.edit6.enabled:=false;
 form4.edit11.enabled:=false;
 form4.bitbtn1.enabled:=false;
 form4.bitbtn2.enabled:=false;
 form4.bitbtn4.enabled:=false;
 form4.bitbtn5.enabled:=false;
 form4.strgrid1.popupmenu:=form4.popupmenu2;
 if form4.ShowModal=mrok then
  begin
   dm.aqwz456.Close;
   dm.aqwz456.Open;
   dm.aqwz456.Locate('rkey',dm.ado456rkey.Value,[]);
   dm.ADO456.Close;
  end;
finally
 form4.Free;
end;

end;

procedure TForm1.N4Click(Sender: TObject);
begin
if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
if messagedlg('你确定要删除这条记录吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
 begin
  dm.ADOConnection1.BeginTrans;
  try
   if dm.Aqwz456TTYPE.Value =1 then
   begin
    with dm.ADOQuery1 do         //更新71已收货数量 无转换率
    begin
    close;
    sql.Clear;
    sql.Add('update data0071');
    sql.Add('set QUAN_RECD=QUAN_RECD-data0022.quantity');
    sql.Add('from data0022 inner join data0071');
    sql.Add('on data0022.SOURCE_PTR=data0071.rkey');
    sql.Add('where data0071.CONVERSION_FACTOR=0');
    sql.Add('and data0022.GRN_PTR='+dm.aqwz456RKEY.AsString);
    ExecSQL;
    end;

    with dm.ADOQuery2 do         //更新71已收货数量 有转换率
    begin
    close;
    sql.Clear;
    sql.Add('update data0071');
    sql.Add('set QUAN_RECD=QUAN_RECD-data0022.quantity/data0071.CONVERSION_FACTOR');
    sql.Add('from data0022 inner join data0071');
    sql.Add('on data0022.SOURCE_PTR=data0071.rkey');
    sql.Add('where data0071.CONVERSION_FACTOR>0');
    sql.Add('and data0022.GRN_PTR='+dm.aqwz456RKEY.AsString);
    ExecSQL;
    end;
   end;

   if dm.aqwz456PO_PTR.value>0 then
    with dm.adoquery2 do     //更新70状态
     begin
      close;
      sql.clear;
      sql.Add('update data0070');
      sql.Add('set status=5');
      sql.Add('where rkey='+dm.aqwz456PO_PTR.AsString);
      execsql;
     end;

   dm.ADO456.Close;
   dm.ADO456.Parameters[0].Value := dm.aqwz456RKEY.Value;
   dm.ADO456.Open;
   dm.ADO456.Delete;



   dm.ADOConnection1.CommitTrans;
   dm.aqwz456.Close;
   dm.aqwz456.Open;
   dm.ADO456.Close;
  except
   dm.ADOConnection1.RollbackTrans;
   messagedlg('数据删除不成功!请与管理员联系',mtwarning,[mbcancel],0);
  end;
 end;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
 begin
  dm.aqwz456.Edit;
  dm.aqwz456STATUS.Value:=2;
  dm.aqwz456.Post;
 end;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
 if (strtoint(vprev.Caption)<>4) then
  messagedlg('对不起!您没有该程序的取消权限',mtinformation,[mbok],0)
 else
  if messagedlg('你确定要将该申请取消提交，重新提交吗？',mtconfirmation,[mbyes,mbno],0)=mryes then
   begin
    dm.ADO456.Close;
    dm.ADO456.Parameters[0].Value := dm.aqwz456RKEY.Value;
    dm.ADO456.Open;
    if dm.ADO456STATUS.Value=dm.aqwz456STATUS.Value then
     begin
      dm.ADO456.Edit;
      dm.ADO456status.Value := 1;
      dm.ADO456.Post;
      dm.aqwz456.close;
      dm.aqwz456.open;
      dm.aqwz456.Locate('rkey',dm.ADO456rkey.value,[]);
      dm.ADO456.Close;
     end
    else
     begin
      dm.aqwz456.close;
      dm.aqwz456.open;
      dm.aqwz456.Locate('rkey',dm.ADO456rkey.value,[]);
      dm.ADO456.Close;
      showmessage('取消操作不成功，可能已被成功审核了');
     end;
   end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
if dm.aqwz456.IsEmpty then
 begin
  n2.Enabled := false;
  n3.Enabled := false;
  n4.Enabled := false;
  n5.Enabled := false;
  n6.Enabled := false;
  n9.Enabled := false;
  n10.Enabled := false;
 end
else
 begin
  n2.Enabled := true;
  n3.Enabled := true;
  n4.Enabled := true;
  n5.Enabled := true;
  n6.Enabled := true;
  if dm.Aqwz456PRINTED.value='N' then
   n9.Enabled := true
  else
   n9.Enabled := false;
  n10.Enabled := true;
  case dm.aqwz456STATUS.Value of
  1:
   begin
    n6.Enabled:=false;
   end;
  2:
   begin
    n2.Enabled:=false;
    n4.Enabled:=false;
    n5.Enabled:=false;
   end;
  3:
   begin
    n2.Enabled:=false;
    n4.Enabled:=false;
    n5.Enabled:=false;
    n6.Enabled:=false;
   end;
  4:
   begin
    n2.Enabled:=false;
    n4.Enabled:=false;
    n5.Enabled:=false;
    n6.Enabled:=false;
   end;
  5:
   begin
    n2.Enabled:=false;
    n4.Enabled:=false;
    n5.Enabled:=false;
    n6.Enabled:=false;
   end;
  6:
   begin
    n5.Enabled:=false;
    n6.Enabled:=false;
   end;
  end;
 end;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var
 v_rkey68: integer;
begin
v_rkey68 := 0;
if not dm.aqwz456.IsEmpty then  v_rkey68 := dm.aqwz456rkey.Value;
 dm.aqwz456.Close;
 dm.aqwz456.Open;
if v_rkey68 > 0 then  dm.aqwz456.Locate('rkey',v_rkey68,[]);
self.Timer1Timer(sender);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select rkey from data0456 where status=6');
    open;
    if dm.ADOQuery1.IsEmpty then
     label2.Visible:=false
    else
     label2.Visible:=true;
   end;
end;

procedure TForm1.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
 if dm.aqwz456status.value=6 then
  DBGrid1.Canvas.Font.Color := clRed
 else
  if dm.aqwz456status.value=1 then
   DBGrid1.Canvas.Font.Color := cllime;
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm1.FormResize(Sender: TObject);
var
 i:byte;
begin
 for i:=low(v_colwidth) to high(v_colwidth) do
  dbgrid1.Columns[i].Width:=v_colwidth[i]+round((dbgrid1.Width-712)*v_colwidth[i]/670);
 for i:=low(v_colwidth1) to high(v_colwidth1) do
  dbgrid2.Columns[i].Width:=v_colwidth1[i]+round((dbgrid1.Width-712)*v_colwidth1[i]/dbgrid2_coltotal);
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
form3:=tform3.create(application);
form3.showmodal;
form3.free;
end;

procedure TForm1.PO1Click(Sender: TObject);
var
 i:word;
begin
if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
try
 Form_posearch:=tForm_posearch.Create(application);
  if Form_posearch.ShowModal=mrok then
   begin

   form2:=tform2.Create(application);
   with form2 do
   begin
    aded_flag:=1;
    edit2.Text:=Form_posearch.AQ70PO_NUMBER.Value;
    edit3.Text:=Form_posearch.AQ70CURR_CODE.Value;
    label13.Caption:=Form_posearch.AQ70CURR_NAME.Value;
    edit4.Text:=Form_posearch.AQ70DEPT_NAME.Value;
    edit8.Text:=Form_posearch.AQ70WAREHOUSE_CODE.Value;
    label10.Caption :=Form_posearch.AQ70WAREHOUSE_NAME.Value;
    edit9.Text:=Form_posearch.AQ70CODE.Value;
    label11.Caption:=Form_posearch.AQ70SUPPLIER_NAME.Value;

    warehouse_ptr := Form_posearch.AQ70WAREHOUSE_POINTER.Value; //工厂15.rkey
    po_ptr := Form_posearch.AQ70RKEY.Value;     //采购70.rkey
    supp_ptr := Form_posearch.AQ70SUPPLIER_POINTER.value; //供应商23.rkey
    curr_ptr := Form_posearch.AQ70CURRENCY_PTR.Value;  //货币01.rkey
    edit10.Text := Form_posearch.AQ70EXCHANGE_RATE.AsString; //汇率

    if Form_posearch.aq70po_type.value='S' then
    begin
    ttype:=1;        //按PO生产物料入仓
    strgrid1.RowCount:=Form_posearch.ADO0071.RecordCount+1;
    strgrid2.RowCount:=Form_posearch.ADO0071.RecordCount+1;
    Form_posearch.ADO0071.First;
    for i:=1 to Form_posearch.ADO0071.RecordCount do
     begin
      strgrid1.Cells[0,i] := form_posearch.ado0071inv_part_number.value;
      strgrid1.Cells[1,i] := Form_posearch.ADO0071INV_NAME.Value;
      strgrid1.Cells[2,i] := Form_posearch.ADO0071INV_DESCRIPTION.Value;
      strgrid1.Cells[3,i] := Form_posearch.ADO0071QUAN_ORD.AsString;
      strgrid1.Cells[4,i] := Form_posearch.ADO0071CONVERSION_FACTOR.AsString;
      strgrid1.Cells[5,i] := Form_posearch.ADO0071QUAN_RECD.AsString;
      if Form_posearch.ADO0071CONVERSION_FACTOR.Value>0 then
       begin
        strgrid1.Cells[6,i] := form_posearch.ADO0071pr_unitname.Value;
        strgrid2.Cells[2,i] := form_posearch.ADO0071WO_PTR.AsString;
        strgrid2.Cells[3,i] :=formatfloat('0.000',
        form_posearch.ADO0071PRICE.value/Form_posearch.ADO0071CONVERSION_FACTOR.Value
                                          );
       end
      else
       begin
        strgrid1.Cells[6,i] := form_posearch.ADO0071UNIT_NAME.Value;
        strgrid2.Cells[2,i] := form_posearch.ADO0071PURCHASE_UNIT_PTR.AsString;
        strgrid2.Cells[3,i] := form_posearch.ADO0071PRICE.AsString;
       end;

      strgrid1.Cells[7,i] := '0';  //当前接收
      strgrid1.Cells[8,i] := '';   //位置
      strgrid1.Cells[9,i] := '';   //备注

      strgrid2.Cells[0,i] := form_posearch.ADO0071rkey.AsString;
      strgrid2.Cells[1,i] := form_posearch.ADO0071INVT_PTR.AsString;
      strgrid2.Cells[4,i] := form_posearch.ADO0071TAX_2.AsString;
      strgrid2.Cells[6,i] := form_posearch.ado0071SHELF_LIFE.asstring;
      Form_posearch.ADO0071.Next;
     end;
    end
    else  //非生产物料
     begin
     
     end;
   end;

   if form2.ShowModal=mrok then
   begin
    dm.aqwz456.Close;
    dm.aqwz456.Open;
    dm.aqwz456.Locate('rkey',dm.ADO456RKEY.Value,[]);
    dm.ADO456.Close;
   end;

   form2.Free;
 end;

finally
 Form_posearch.Free;
end;

end;


procedure TForm1.BitBtn4Click(Sender: TObject);
begin

Form_posearch:=tForm_posearch.Create(application);
Form_posearch.button1.caption:='结束收货';
if Form_posearch.showmodal=mrok then
 with dm.adoquery2 do
  begin
   close;
   sql.clear;
   sql.Add('update data0070');
   sql.Add('set status=6');
   sql.Add('where rkey='+Form_posearch.aq70rkey.AsString);
   execsql;
  end;
Form_posearch.free;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
if (strtoint(vprev.Caption)<>4) then
 messagedlg('对不起!您没有该程序的直接入仓权限',mtinformation,[mbok],0)
else
try
form4:=tform4.create(application);
form4.aded_flag:=1;
if form4.showmodal=mrok then
 begin
  dm.aqwz456.Close;
  dm.aqwz456.Open;
  dm.aqwz456.Locate('rkey',dm.ADO456RKEY.Value,[]);
  dm.ADO456.Close;
 end;
 finally
  form4.free;
 end;
end;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(dm.aqwz456.SQL.Text);
end;
end.
