unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Menus, ComCtrls,ADODB;

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
    Panel2: TPanel;
    DBGrid3: TDBGrid;
    PopupMenu2: TPopupMenu;
    N11: TMenuItem;
    Label3: TLabel;
    ComboBox1: TComboBox;
    BitBtn5: TBitBtn;
    PopupMenu3: TPopupMenu;
    N12: TMenuItem;
    N13: TMenuItem;
    VMI1: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    BitBtn6: TBitBtn;
    N18: TMenuItem;
    N19: TMenuItem;
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
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
  //  procedure N111Click(Sender: TObject);
    procedure VMI1Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
  private
   v_colwidth: array of integer;
   dbgrid2_coltotal:integer;
   field_name:string;
   FsSQL:string;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
   function cheak_datetime(create_date:TDateTime):boolean;
   function Check_FaFang(ttype:Integer):Boolean;
  public
    { Public declarations }
 //  sys_longdate,sys_shortdate:tdatetime;
   stock_flag:string;
   function find_quanhang_error(ttype,rkey456:integer):boolean;
  end;

var
  Form1: TForm1;

implementation

uses data_module, aded_rece, received_search, po_search, direct_ware,
  invtin_report, mul_report, misc_report,common,Frm_remark_u, DB,
   vmidein, Add176, BzReport, direct_zxlist, Pas_report_zxcard;//vmi_list,vmi_detail;

{$R *.dfm}
procedure TForm1.FormCreate(Sender: TObject);
begin
  if not app_init_2(dm.ADOConnection1) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;

//dm.ADOConnection1.Open;
//  rkey73 :='1593';
//  vprev :='4';
//  user_ptr :='1752';

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-MM-dd';
  LongDateFormat := 'yyyy-mm-dd HH:mm:ss';
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
 field_name:='GRN_NUMBER';
 dbgrid2_coltotal:=dbgrid1.Width;
end;

function TForm1.find_quanhang_error(ttype, rkey456: integer): boolean;
begin
result:=false;
if ttype<>2 then
with dm.adoquery1 do
 begin
  close;
  sql.Text:='select rkey from data0022'+#13+
            'where quantity<>quan_on_hand'+#13+
            'and grn_ptr='+inttostr(rkey456);
  open;
  if not IsEmpty then result:=true;
 end
else
with dm.adoquery1 do
 begin
  close;
  sql.Text:='select rkey from data0235'+#13+
            'where quan_recd<>quan_on_hand'+#13+
            'and grn_ptr='+inttostr(rkey456);
  open;
  if not IsEmpty then result:=true;
 end
end;


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
   for i:=1 to form_mulreport.StG2.RowCount-2 do
    begin
   {  dm.ADO456.Close;
     dm.ADO456.Parameters[0].Value := strtoint(form_mulreport.StG2.Cells[2,i]);
     dm.ADO456.Open;
    }
     if (dm.ADO456TTYPE.Value<>2) and (dm.ADO456TTYPE.Value<>6) then
     begin
      form_report:=tform_report.Create(application);
      form_report.ppReport1.DeviceType := 'Printer';
      form_report.ppReport1.ShowPrintDialog := false;
      form_report.Aqwz456.close;
      form_report.Aqwz456.Parameters[0].Value:=strtoint(form_mulreport.StG2.Cells[2,i]);
      form_report.Aqwz456.open;
      form_report.Aqwz22.Open;
      form_report.Aq493.Open;

      Form_report.ppReport1.Reset;
      Form_report.ppReport1.Template.FileName :=
        StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
          'invt_entrance_stand.rtm';
      Form_report.ppReport1.Template.LoadFromFile;

      form_report.ppReport1.SaveAsTemplate:=false;
      form_report.ppReport1.Print;
{      dm.ADO456.Edit;
      dm.ADO456PRINTED.Value:='Y';
      dm.ADO456.Post;  }
      form_report.free;
     end
     else
     begin
      Form_miscreport:=TForm_miscreport.Create(application);
      Form_miscreport.ppReport1.DeviceType := 'Printer';
      Form_miscreport.ppReport1.ShowPrintDialog := false;
      Form_miscreport.Aqwz456.close;
      Form_miscreport.Aqwz456.Parameters[0].Value:=strtoint(form_mulreport.StG2.Cells[2,i]);
      Form_miscreport.Aqwz456.open;
      Form_miscreport.Aqwz235.Open;
      Form_miscreport.Aq493.Open;

      Form_miscreport.ppReport1.Reset;
      Form_miscreport.ppReport1.Template.FileName:=
        StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
          'misc_entrance.rtm';
      Form_miscreport.ppReport1.Template.LoadFromFile;

      Form_miscreport.ppReport1.SaveAsTemplate:=false;
      Form_miscreport.ppReport1.Print;
     { dm.ADO456.Edit;
      dm.ADO456PRINTED.Value:='Y';
      dm.ADO456.Post;}
      Form_miscreport.Free;
     end;
    end;
  end;
 form_mulreport.free;
 bitbtn3click(sender);
end;

procedure TForm1.N9Click(Sender: TObject); //单个列印
begin
if (dm.Aqwz456TTYPE.Value<>2) and (dm.Aqwz456TTYPE.Value<>6)then
begin
 form_report:=tform_report.Create(application);
 form_report.Aqwz456.close;
 form_report.Aqwz456.Parameters[0].Value:=dm.Aqwz456rkey.Value;
 form_report.Aqwz456.open;

 form_report.Ado0005.close;
 form_report.Ado0005.Parameters[0].Value:=StrToInt(user_ptr);
 form_report.Ado0005.open;


  Form_report.ppReport1.Reset;
  Form_report.ppReport1.Template.FileName :=
     StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
         'invt_entrance_stand.rtm';
  Form_report.ppReport1.Template.LoadFromFile;
 form_report.ppReport1.SaveAsTemplate:=false;
 form_report.ppReport1.Print;

 bitbtn3click(sender);
 form_report.free;
end
else      //杂项入仓
begin
 Form_miscreport:=TForm_miscreport.Create(application);
 Form_miscreport.Aqwz456.close;
 Form_miscreport.Aqwz456.Parameters[0].Value:=dm.Aqwz456rkey.Value;
 Form_miscreport.Aqwz456.open;
 Form_miscreport.Aqwz235.Open;
 Form_miscreport.Aq493.Open;

 Form_miscreport.Ado0005.close;
 Form_miscreport.Ado0005.Parameters[0].Value:=StrToInt(user_ptr);
 Form_miscreport.Ado0005.open;



    Form_miscreport.ppReport1.Reset;
    Form_miscreport.ppReport1.Template.FileName:=
       StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
         'misc_entrance.rtm';
    Form_miscreport.ppReport1.Template.LoadFromFile;

 Form_miscreport.ppReport1.SaveAsTemplate:=false;
 Form_miscreport.ppReport1.Print;

{ if messagedlg('单张打印完成了吗?按YES后将不能重印!',mtconfirmation,[mbyes,mbno],0)=mryes then
 begin
  dm.ADO456.Close;
  dm.ADO456.Parameters[0].Value := dm.Aqwz456RKEY.Value;
  dm.ADO456.Open;
  dm.ADO456.Edit;
  dm.ADO456PRINTED.Value:='Y';
  dm.ADO456.Post;
  bitbtn3click(sender);
 end;
 }
  bitbtn3click(sender);
 Form_miscreport.Free;
end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 application.Terminate;
end;

procedure TForm1.FormShow(Sender: TObject);
var
 i:byte;
begin

if dm.ADOConnection1.Connected then
 begin

  dm.ADOQuery1.Close;
  dm.ADOQuery1.SQL.Text:='select rkey,abbr_name from data0015' ;
  dm.ADOQuery1.Open;
  while not dm.ADOQuery1.Eof do
  begin
   ComboBox1.Items.Append(dm.ADOQuery1.Fields[1].asstring);
   dm.ADOQuery1.Next;
  end;
  FsSQL:=dm.Aqwz456.CommandText;

   with dm.ADOQuery1 do
   begin
    close;
    sql.Text:='SELECT dbo.Data0092.PHY_COUNT_NO, dbo.Data0092.TDATE,'+#13+
        'dbo.Data0005.EMPLOYEE_NAME'+#13+
        'FROM dbo.Data0005 INNER JOIN'+#13+
        'dbo.Data0092 ON dbo.Data0005.RKEY = dbo.Data0092.EMPLOYEE_PTR'+#13+
        'WHERE (dbo.Data0092.STATUS = ''0'')';
    open;
    if not isempty then
    begin
     messagedlg('仓库正在进行材料盘点暂时不能操作该程序,盘点代码:'+
     fieldvalues['PHY_COUNT_NO']+'盘点人员:'+fieldvalues['EMPLOYEE_NAME'],
     mtinformation,[mbcancel],0);
     application.Terminate;
    end;
   end;


  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select stock_in_flag from data0192');
    open;
    self.stock_flag := fieldvalues['stock_in_flag'];
   end;

  dtpk2.Date := common.getsystem_date(dm.ADOQuery1,1);
  dtpk1.Date := dtpk2.Date - 5;
  self.Timer1Timer(sender);

  dm.aqwz456.Close;
  dm.aqwz456.Parameters[6].Value := dtpk1.Date;
  dm.aqwz456.Parameters[7].Value := dtpk2.Date+1;
  dm.Aqwz456.Prepared;
  dm.aqwz456.Open;
  dm.Aqwz22.Open;
  dm.Aqwz235.Open;

  setlength(v_colwidth,dbgrid1.FieldCount);
 // setlength(v_colwidth1,dbgrid2.FieldCount);
 // setlength(v_colwidth2,dbgrid3.FieldCount);
  for i:=0 to high(v_colwidth) do v_colwidth[i] := dbgrid1.Columns[i].Width;
 // for i:=0 to high(v_colwidth1) do v_colwidth1[i] := dbgrid2.Columns[i].Width;
 // for i:=0 to high(v_colwidth2) do v_colwidth2[i] := dbgrid3.Columns[i].Width;
 end;
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin

if (dm.Aqwz456.IndexFieldNames<>column.FieldName) and
   (column.FieldName<>'v_status') then
   dm.Aqwz456.IndexFieldNames:=column.FieldName;

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
 dm.Aqwz456.Prepared;
 dm.aqwz456.Open;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
 if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
   messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
 else
   if (dm.Aqwz456TTYPE.Value <> 3) and (dm.Aqwz456TTYPE.Value<>5) and (dm.Aqwz456TTYPE.Value<>6)then
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
   else if dm.Aqwz456TTYPE.Value=3 then //直接入仓
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
     end
   else if dm.Aqwz456TTYPE.Value=6 then //杂项直入
     try
       form10:=tform10.Create(application);
       form10.aded_flag:=2;
       if form10.ShowModal=mrok then
        begin
         dm.aqwz456.Close;
         dm.aqwz456.Open;
         dm.aqwz456.Locate('rkey',dm.ado456rkey.Value,[]);
         dm.ADO456.Close;
        end;
     finally
       form10.Free;
     end
   else //VMI入仓
   begin
   if not self.cheak_datetime(dm.Aqwz456create_date.Value) then
    begin
     exit;
    end
   else
    begin
     try
       form6:=tform6.Create(application);
       form6.aded_flag:=2;
       if form6.ShowModal=mrok then
       begin
         dm.aqwz456.Close;
         dm.aqwz456.Open;
         dm.aqwz456.Locate('rkey',dm.ado456rkey.Value,[]);
         dm.ADO456.Close;
       end;
     finally
       form6.Free;
     end;
    end;
   end;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
  if (dm.Aqwz456TTYPE.Value <>3) and (dm.Aqwz456TTYPE.Value<>5) and (dm.Aqwz456TTYPE.Value<>6)then    //非直接入仓
  begin
    form2:=tform2.Create(application);
    form2.aded_flag:=4;   //检查
    form2.BitBtn1.Enabled:=false;
    form2.BitBtn4.Enabled:=false;

    form2.StrGrid1.Options:=form2.StrGrid1.Options-[goEditing];
    form2.StrGrid3.Options:=form2.StrGrid3.Options-[goEditing];

    form2.Edit1.Enabled:=false;
    form2.Edit5.Enabled:=false;
    form2.Edit6.Enabled:=false;
    form2.edit11.Enabled:=false;
    form2.edit7.Enabled:=false;
    form2.combobox1.enabled:=false;
    form2.combobox2.enabled:=false;
    form2.combobox3.enabled:=false;
    form2.dtpk1.enabled:=false;
    if form2.ShowModal=mrok then
    begin

    end;
    form2.Free;
  end
  else if dm.Aqwz456TTYPE.Value=3 then             //直接入仓
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
    form4.strgrid1.popupmenu:=nil;
    if form4.ShowModal=mrok then
    begin
    dm.aqwz456.Close;
    dm.aqwz456.Open;
    dm.aqwz456.Locate('rkey',dm.ado456rkey.Value,[]);
    dm.ADO456.Close;
    end;
  finally
    form4.Free;
  end
  else if dm.Aqwz456TTYPE.Value=6 then  //杂项直入
  try
    form10:=tform10.Create(application);
    form10.aded_flag:=3;
    form10.edit1.enabled:=false;
    form10.edit2.enabled:=false;
    form10.edit5.enabled:=false;
    form10.edit6.enabled:=false;
    form10.edit11.enabled:=false;
    form10.bitbtn1.enabled:=false;
    form10.bitbtn2.enabled:=false;
    form10.bitbtn4.enabled:=false;
    form10.bitbtn5.enabled:=false;
    form10.strgrid1.popupmenu:=nil;
    if form10.ShowModal=mrok then
    begin
    dm.aqwz456.Close;
    dm.aqwz456.Open;
    dm.aqwz456.Locate('rkey',dm.ado456rkey.Value,[]);
    dm.ADO456.Close;
    end;
  finally
    form10.Free;
  end
  else //VMI入仓
  try
  form6:=tform6.Create(application);
  form6.aded_flag:=3;
  form6.BtnSave.Enabled:=false;
  form6.SGrid1.Options:=form6.SGrid1.Options-[goEditing];
  form6.Edit1.Enabled:=false;
  form6.Edit4.Enabled:=false;
  form6.Edit9.Enabled:=false;
  form6.edit10.Enabled:=false;
  form6.edit7.Enabled:=false;
  form6.combobox1.enabled:=false;
  form6.combobox3.enabled:=false;
  if form6.ShowModal=mrok then
  begin
  dm.aqwz456.Close;
  dm.aqwz456.Open;
  dm.aqwz456.Locate('rkey',dm.ado456rkey.Value,[]);
  dm.ADO456.Close;
  end;
  finally
  form6.Free;
  end;

end;

procedure TForm1.N4Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else
  if messagedlg('你确定要删除这条记录吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
  begin
    dm.ADO456.Close;
    dm.ADO456.Parameters[0].Value := dm.aqwz456RKEY.Value;
    dm.ADO456.Open;
    if (dm.ADO456STATUS.Value=dm.aqwz456STATUS.Value) and (not find_quanhang_error(dm.ADO456TTYPE.Value,dm.ADO456RKEY.Value)) then
    begin
      if dm.Aqwz456TTYPE.Value<>5 then
      begin
        if dm.Aqwz456create_date.Value<dm.find_maxdate then
        begin
        messagedlg('送货日期必须大于财务库存截数最大日期!',mterror,[mbok],0);
        exit;
        end;
      end
      else if dm.Aqwz456TTYPE.Value=5 then
      begin
        with dm.ADOQuery2 do
        begin
        close;
        sql.Clear;
        sql.Text:='select * from data0171 where status=0';
        open;
        end;
        if not dm.ADOQuery2.IsEmpty then
        begin
          MessageDlg('VMI仓库正在截数,不能操作,请联系财务部!',mtInformation,[mbok],0);
          exit;
        end
        else if not self.cheak_datetime(dm.Aqwz456create_date.Value) then
        begin
          exit;
        end
      end;
      dm.ADOConnection1.BeginTrans;

      try
        if  (dm.Aqwz456TTYPE.Value =2) and (dm.Aqwz456TTYPE.Value=6)then
        begin
          with dm.ADOQuery2 do  //修改208的235指针为NULL
          begin
            Close;
            SQL.Clear;
            sql.Text:=' update data0208 set SOURCE_PTR = null   '+#13+
                      ' from data0208  '+#13+
                      ' inner join data0235 on data0208.SOURCE_PTR = data0235.rkey  '+#13+
                      ' where data0235.GRN_PTR= ' + dm.Aqwz456RKEY.AsString ;
            ExecSQL;
          end;
        end
        else
        begin
          with dm.ADOQuery2 do  //修改207的22指针为NULL
          begin
            Close;
            SQL.Clear;
            sql.Text:=' update data0207 set D0022_PTR = null    '+#13+
                      ' from data0207  '+#13+
                      ' inner join data0022 on data0207.D0022_ptr = data0022.rkey  '+#13+
                      ' where data0022.GRN_PTR = ' + dm.Aqwz456RKEY.AsString;
            ExecSQL;
          end;
        end;
        if (dm.Aqwz456TTYPE.Value <> 2) and (dm.Aqwz456TTYPE.Value<>5) and (dm.Aqwz456TTYPE.Value<>3) and (dm.Aqwz456TTYPE.Value<>6) then
        begin
          with dm.ADOQuery2 do         //更新71已收货数量
          begin
            close;
            sql.Clear;
            sql.Add('update data0071');
            sql.Add('set QUAN_RECD=QUAN_RECD-data0022.quantity/data0071.CONVERSION_FACTOR');
            sql.Add('from data0022 inner join data0071');
            sql.Add('on data0022.SOURCE_PTR=data0071.rkey');
            sql.Add('where  data0022.GRN_PTR='+dm.aqwz456RKEY.AsString);
            ExecSQL;
          end;
          with dm.adoquery2 do     //更新70状态
          begin
            close;
            sql.clear;
            sql.Add('update data0070');
            sql.Add('set status=5');
            sql.Add('where rkey='+dm.aqwz456PO_PTR.AsString);
            execsql;
          end;
          with dm.ADOQuery2 do         //更新17当前库存总数据
          begin
            close;
            sql.Clear;
            sql.Add('update data0017');
            sql.Add('set data0017.QUAN_ON_HAND=data0017.QUAN_ON_HAND-d1.qty');
            sql.Add('from data0017 inner join');
            sql.Add('(select inventory_ptr,sum(quan_on_hand) as qty');
            sql.Add('from data0022');
            sql.Add('where data0022.GRN_PTR='+dm.Aqwz456RKEY.AsString);
            sql.Add('group by inventory_ptr) d1');
            sql.Add('on data0017.rkey=d1.INVENTORY_PTR');
            ExecSQL;
          end;

          //2017-6-12tang删除的同时修改回22的391状态未使用
          dm.Aqwz22.First;
          while not dm.Aqwz22.Eof do
          begin
            if (Trim(dm.Aqwz22rkey391.AsString)<>'') then
            begin
              dm.ADOQuery2.Close;
              dm.ADOQuery2.SQL.Text:='update data0391 set stock_over=0 where Rkey='+dm.Aqwz22rkey391.AsString;
              dm.ADOQuery2.ExecSQL;
            end;
            dm.Aqwz22.Next;
          end;
          //end 2017-6-12------
        end
        else if dm.Aqwz456TTYPE.Value=2 then //杂项入仓
        begin
          with dm.ADOQuery2 do         //更新72已收货数量
          begin
            close;
            sql.Clear;
            sql.Add('update data0072');
            sql.Add('set QUANTITY_RECEIVED=QUANTITY_RECEIVED-data0235.QUAN_RECD');
            sql.Add('from data0235 inner join data0072');
            sql.Add('on data0235.D0072_PTR=data0072.rkey');
            sql.Add('where data0235.GRN_PTR='+dm.aqwz456RKEY.AsString);
            ExecSQL;
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
        end
        else if dm.Aqwz456TTYPE.Value=5 then  //VMI入仓
        begin

          with dm.ADOQuery2 do//更改456出库指针为空,脱离关联关系
          begin
            Close;
            SQL.Clear;
            sql.Text:='update data0456 set vmiout_ptr=null where rkey='+dm.Aqwz456RKEY.AsString;
            ExecSQL;
          end;

          with dm.ADOQuery2 do         //更新17当前库存总数据
          begin
            close;
            sql.Clear;
            sql.Add('update data0017');
            sql.Add('set data0017.QUAN_ON_HAND=data0017.QUAN_ON_HAND-d1.qty');
            sql.Add('from data0017 inner join');
            sql.Add('(select inventory_ptr,sum(quan_on_hand) as qty');
            sql.Add('from data0022');
            sql.Add('where data0022.GRN_PTR='+dm.Aqwz456RKEY.AsString);
            sql.Add('group by inventory_ptr) d1');
            sql.Add('on data0017.rkey=d1.INVENTORY_PTR');
            ExecSQL;
          end;
          with dm.ADOQuery2 do  //删除VMI出库记录
          begin
            close;
            sql.Clear;
            sql.Text:='delete from data0022 where GRN_PTR=' + dm.Aqwz456RKEY.AsString;
            execsql;
          end;
          dm.Aqwz149.Close;
          dm.Aqwz149.Parameters[0].Value:=dm.Aqwz456rkey148.Value;
          dm.Aqwz149.Open;
          dm.Aqwz149.First;
          while not dm.Aqwz149.Eof do
          begin
            dm.aq134.Close; //更新134VMI库存数
            dm.aq134.Parameters[0].Value:=dm.Aqwz149rkey.Value;
            dm.aq134.Open;
            dm.aq134.Edit;
            dm.aq134QUAN_ON_HAND.Value:=dm.aq134QUAN_ON_HAND.Value+dm.Aqwz149quantity.Value;
            dm.aq134.Post;
            dm.Aqwz149.Next;
          end;
          with dm.ADOQuery2 do  //删除VMI出库记录
          begin
            close;
            sql.Clear;
            sql.Text:='delete from data0724 where rkey=:rkey148';
            parameters[0].Value:=dm.Aqwz456rkey148.Value;
            execsql;
          end;
          //2017-6-12tang删除的同时修改回22的391状态未使用
//          dm.Aqwz22.First;
//          while not dm.Aqwz22.Eof do
//          begin
//            if (Trim(dm.Aqwz22rkey391.AsString)<>'') then
//            begin
//              dm.ADOQuery2.Close;
//              dm.ADOQuery2.SQL.Text:='update data0391 set stock_over=0 where Rkey='+dm.Aqwz22rkey391.AsString;
//              dm.ADOQuery2.ExecSQL;
//            end;
//            dm.Aqwz22.Next;
//          end;
          //end 2017-6-12------
        end
        else if dm.Aqwz456TTYPE.Value=3 then  //直接入仓生产物料
        begin
          with dm.ADOQuery2 do         //更新17当前库存总数据
          begin
            close;
            sql.Clear;
            sql.Add('update data0017');
            sql.Add('set data0017.QUAN_ON_HAND=data0017.QUAN_ON_HAND-d1.qty');
            sql.Add('from data0017 inner join');
            sql.Add('(select inventory_ptr,sum(quan_on_hand) as qty');
            sql.Add('from data0022');
            sql.Add('where data0022.GRN_PTR='+dm.Aqwz456RKEY.AsString);
            sql.Add('group by inventory_ptr) d1');
            sql.Add('on data0017.rkey=d1.INVENTORY_PTR');
            ExecSQL;
          end;
        end;
        dm.ADO456.Delete;

        dm.ADOConnection1.CommitTrans;
        messagedlg('数据删除成功!',mtinformation,[mbcancel],0);
        dm.aqwz456.Close;
        dm.aqwz456.Open;
        dm.ADO456.Close;
      except
       on E: Exception do
        begin
         dm.ADOConnection1.RollbackTrans;
         messagedlg(E.Message,mterror,[mbcancel],0);
        end;
      end;
    end
    else
      messagedlg('数据删除不成功!入库单状态已发生更改或者已发放',mtwarning,[mbcancel],0);
  end;
end;


procedure TForm1.N5Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
 begin
   if (dm.Aqwz456TTYPE.Value= 1) or (dm.Aqwz456TTYPE.Value= 5) then
    with dm.Aqwz22 do
    begin
      First;
      while not Eof do
      begin
        if not ( FieldByName('status391').IsNull or (FieldByName('status391').Value = 2)) then
        begin
          ShowMessage('明细中存在没有经过IQC审核材料，请审核后再提交！！');
          exit;
        end;
        Next;
      end;
    end;


    dm.ADO456.Close;
    dm.ADO456.Parameters[0].Value := dm.aqwz456RKEY.Value;
    dm.ADO456.Open;
    if dm.ADO456STATUS.Value=dm.aqwz456STATUS.Value then
    begin
    dm.ADO456.Edit;
    dm.ADO456status.Value:=2;
    dm.ADO456AUDITED_BY.Value:=StrToInt(user_ptr);
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
       showmessage('提交操作不成功，可能未刷新前已被成功提交了');
    end;
 end;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
 if (strtoint(vprev)<>4) then
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
      dm.ADO456AUDITED_BY.Value:=0;   
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
//var
// i:byte;
begin
 {
for i:=low(v_colwidth) to high(v_colwidth) do
 dbgrid1.Columns[i].Width:=v_colwidth[i]+
  round((dbgrid1.Width-dbgrid2_coltotal)*v_colwidth[i]/(dbgrid2_coltotal-28)); }
{
for i:=low(v_colwidth1) to high(v_colwidth1) do
 dbgrid2.Columns[i].Width:=v_colwidth1[i]+
  round((dbgrid2.Width-dbgrid2_coltotal)*v_colwidth1[i]/(dbgrid2_coltotal-28));
for i:=low(v_colwidth2) to high(v_colwidth2) do
 dbgrid3.Columns[i].Width:=v_colwidth2[i]+
  round((dbgrid3.Width-dbgrid2_coltotal)*v_colwidth2[i]/(dbgrid2_coltotal-28));
}
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
 append_flag:boolean;
begin
  append_flag:=true;
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else
  try
    Form_posearch:=tForm_posearch.Create(application);
    repeat
      if Form_posearch.ShowModal=mrok then
      begin
        form2:=tform2.Create(application);
        with form2 do
        begin
          edit2.Text:=Form_posearch.AQ70PO_NUMBER.Value;
          edit3.Text:=Form_posearch.AQ70CURR_CODE.Value;
          label13.Caption:=Form_posearch.AQ70CURR_NAME.Value;
          edit4.Text:=Form_posearch.AQ70DEPT_NAME.Value;
          edit8.Text:=Form_posearch.AQ70WAREHOUSE_CODE.Value;
          label10.Caption :=Form_posearch.AQ70WAREHOUSE_NAME.Value;
          edit9.Text:=Form_posearch.AQ70CODE.Value;
          label11.Caption:=Form_posearch.AQ70SUPPLIER_NAME.Value;
          po_type:=Form_posearch.AQ70PURCHASE_TYPE.Value;
          warehouse_ptr := Form_posearch.AQ70WAREHOUSE_POINTER.Value; //工厂15.rkey
          po_ptr := Form_posearch.AQ70RKEY.Value;                  //采购70.rkey
          supp_ptr := Form_posearch.AQ70SUPPLIER_POINTER.value;    //供应商23.rkey
          curr_ptr := Form_posearch.AQ70CURRENCY_PTR.Value;        //货币01.rkey
          edit10.Text := Form_posearch.AQ70EXCHANGE_RATE.AsString; //汇率 从01表中读取实时汇率

          if Form_posearch.aq70po_type.value='S' then
          begin
            ttype:=1;        //按PO生产物料入仓
            aded_flag:=1;
            strgrid3.Visible:=false;
            strgrid1.Visible:=true;
            combobox1.Visible:=true;
            combobox2.Visible:=false;
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
              strgrid1.Cells[6,i] := form_posearch.ADO0071pr_unitname.Value;
              strgrid2.Cells[2,i] := form_posearch.ADO0071WO_PTR.AsString;
              strgrid2.Cells[3,i] :=formatfloat('0.0000',
                                    form_posearch.ADO0071tax_PRICE.value/
                                    Form_posearch.ADO0071CONVERSION_FACTOR.Value);
              strgrid1.Cells[7,i] := '0';  //当前接收
              strgrid1.Cells[8,i] := '';   //仓库位置
              strgrid1.Cells[9,i] := '';   //原制造商 或生产批号
              strgrid1.Cells[10,i] := '';   //详细位置
              strgrid1.Cells[11,i] := form_posearch.ADO0071extra_req.Value;   //备注特别要求
              strgrid1.Cells[12,i] := form_posearch.ADO0071avl_flag.Value;

              strgrid1.Cells[13,i] :=          //制造日期
                  datetostr(common.getsystem_date(dm.ADOQuery1,1));
              strgrid1.Cells[14,i] := form_posearch.ADO0071rohs.Value;   //环保标识
              with dm.ADOQuery1 do
              begin
                Close;
                sql.Clear;
                sql.Add('select data0028.qte_price2 from data0028');
                sql.Add('where SUPPLIER_PTR='+Form_posearch.AQ70SUPPLIER_POINTER.AsString);
                SQL.Add('and INVENTORY_PTR='+Form_posearch.ADO0071INVT_PTR.AsString);
                Open;
              end;
              if not dm.ADOQuery1.IsEmpty then  //材料有效期天数
              begin
               StrGrid1.Cells[15,i]:=dm.ADOQuery1.Fieldbyname('qte_price2').AsString;
              end
              else
              with dm.ADOQuery1 do
               begin
                 Close;
                 SQL.Clear;
                 sql.Add('select SHELF_LIFE from data0017');
                 SQL.Add('where data0017.rkey='+Form_posearch.ADO0071INVT_PTR.AsString);
                 Open;
                  StrGrid1.Cells[15,i]:=dm.ADOQuery1.Fieldbyname('shelf_life').AsString;
               end;
              StrGrid1.Cells[16,i]:=form_posearch.ADO0071if_caf.Value;  //耐CAF
              StrGrid1.Cells[17,i]:=form_posearch.ADO0071QUAN_IN_INSP.AsString;  //IQC已检验数量
              StrGrid1.Cells[20,i]:=Form_posearch.ADO0071ORIG_ABBRNAME.AsString;  //品牌供应商

              strgrid2.Cells[0,i] := form_posearch.ADO0071rkey.AsString;
              strgrid2.Cells[1,i] := form_posearch.ADO0071INVT_PTR.AsString;
              strgrid2.Cells[4,i] := form_posearch.ADO0071TAX_2.AsString;
              strgrid2.Cells[6,i] := form_posearch.ado0071SHELF_LIFE.asstring;
              strgrid2.Cells[7,i] := form_posearch.ADO0071STOCK_BASE.AsString;
              Form_posearch.ADO0071.Next;
            end;
          end
          else  //非生产物料
          begin
            ttype:=2;        //按PO生产物料入仓
            aded_flag:=2;
            strgrid3.Visible:=true;
            strgrid1.Visible:=false;
            combobox1.Visible:=false;
            combobox2.Visible:=true;
            combobox3.Visible:=false;
            dtpk1.Visible:=false;
            strgrid3.RowCount:=Form_posearch.aq0072.RecordCount+1;
            strgrid2.RowCount:=Form_posearch.aq0072.RecordCount+1;
            Form_posearch.aq0072.First;
            for i:=1 to Form_posearch.aq0072.RecordCount do
            begin
              strgrid3.Cells[0,i] := form_posearch.aq0072DESCRIPTION.value;
              strgrid3.Cells[1,i] := Form_posearch.aq0072GUI_GE.Value;
              strgrid3.Cells[2,i] := Form_posearch.aq0072DESCRIPTION2.Value;
              strgrid3.Cells[3,i] := Form_posearch.aq0072QUAN_ORD.AsString;
              strgrid3.Cells[4,i] := Form_posearch.aq0072QUANTITY_RECEIVED.AsString;
              strgrid3.Cells[5,i] := Form_posearch.aq0072UNIT_NAME.AsString;
              strgrid3.Cells[6,i] := '0'; //当前接收
              strgrid3.Cells[7,i] := '';  //位置
              strgrid3.Cells[8,i] := form_posearch.aq0072rohs.Value;   //环保标识
              strgrid3.Cells[9,i] := '';   //备注
              StrGrid3.Cells[10,i]:=Form_posearch.aq0072avl_flag.AsString;//是否IQC

              strgrid2.Cells[0,i] := form_posearch.aq0072rkey.AsString;
              strgrid2.Cells[2,i] := form_posearch.aq0072UNIT_PTR.AsString;
              strgrid2.Cells[3,i] := form_posearch.aq0072tax_price.AsString;
              strgrid2.Cells[4,i] := form_posearch.aq0072STATE_TAX.AsString;

              Form_posearch.aq0072.Next;
            end;
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
      end
      else
        append_flag:=false;
    until not append_flag
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

   Close;
   SQL.Text:= 'INSERT INTO DATA0339(po_ptr, EDITED_BY_PTR, TRAN_TYPE, TRAN_DESCRIPTION  '+#13+
         ' , TRAN_FROM, TRAN_TO)' +#13+
         ' Values(' + Form_posearch.aq70rkey.AsString + ',' + user_ptr +
         ',5,''采购定单状态已更改'',''状态已审核5'',''采购订单已被标识已收货6'')';
   ExecSQL;
  end;
Form_posearch.free;
end;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(dm.aqwz456.CommandText);
end;


procedure TForm1.PopupMenu2Popup(Sender: TObject);
begin

//    if dm.Aqwz456.FieldByName('ttype').AsInteger<>2 then
//    N15.Enabled:=True
//    else
//    N15.Enabled:=False;

//    if dm.Aqwz456.FieldByName('ttype').AsInteger<>2 then
//      N11.Enabled:=(DBGrid2.DataSource.DataSet.RecordCount>0)
//    else
//      N11.Enabled:=(DBGrid3.DataSource.DataSet.RecordCount>0)

end;

procedure TForm1.N11Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
   messagedlg('对不起!您没有该程序修改权限',mtinformation,[mbok],0)
  else
  if dm.Aqwz456.FieldByName('ttype').AsInteger<>2  then
  begin
    dm.Aqwz22.Edit;
    with TFrm_remark.Create(nil) do
    try
      if ShowModal=mrok then
        dm.Aqwz22.Post
      else
        dm.Aqwz22.Cancel;
    finally
       free;
    end;
  end else begin
    dm.Aqwz235.Edit;
    with TFrm_remark.Create(nil) do
    try
      DBMemo1.DataField:='';
      DBEdit1.DataSource:=nil;
      DBEdit1.Visible:=false;
      DBEdit4.Visible:=false;
      DBEdit5.Visible:=false;
      Label1.Visible:=false;
      Label5.Visible:=false;
      Label6.Visible:=false;
      DBEdit3.DataSource:=dm.DataSource3;
      DBEdit2.DataSource:=dm.DataSource3;
      DBMemo1.DataSource:=dm.DataSource3;
      DBMemo1.DataField:='REF_NUMBER';

      if ShowModal=mrok then
        dm.Aqwz235.Post
      else
        dm.Aqwz235.Cancel;
    finally
       free;
    end;
  end;

end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  dm.Aqwz456.Close;
 if ComboBox1.ItemIndex=0 then
   dm.Aqwz456.CommandText:=FsSQL
  else
   dm.Aqwz456.CommandText:=FsSQL+' and data0015.abbr_name='''+ComboBox1.Text+'''';
 dm.Aqwz456.Open;
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
begin
  PopupMenu3.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TForm1.N12Click(Sender: TObject);
begin
 try
  Form_report:=TForm_report.Create(Application);
  Form_report.ppReport1.Reset;
  Form_report.ppReport1.Template.FileName :=
     StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
         'invt_entrance_stand.rtm';
  Form_report.ppReport1.Template.LoadFromFile;
  Form_report.ppReport1.SaveAsTemplate:=True;
  Form_report.ppDesigner1.ShowModal;
 finally
   Form_report.Free;
 end;
end;

procedure TForm1.N13Click(Sender: TObject);
begin
  try
    Form_miscreport:=TForm_miscreport.Create(Application);
    Form_miscreport.ppReport1.Reset;
    Form_miscreport.ppReport1.Template.FileName:=
       StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
         'misc_entrance.rtm';
    Form_miscreport.ppReport1.Template.LoadFromFile;
    Form_miscreport.ppReport1.SaveAsTemplate:=True;
    Form_miscreport.ppDesigner1.ShowModal;
  finally
    Form_miscreport.Free;
  end;
end;

procedure TForm1.VMI1Click(Sender: TObject);
begin
if (strtoint(vprev)<>4) and (strtoint(vprev)<>2) then
 messagedlg('对不起!您没有该程序的VMI入仓权限',mtinformation,[mbok],0)
else
 try
  with dm.ADOQuery1 do
  begin
  close;
  sql.Text:='select * from data0171 where status=0 ';
  open;
  end;
  if not dm.ADOQuery1.IsEmpty then
  begin
  MessageDlg('对不起,VMI有材料截数还未完成,不能进行入库,请联系财务部!',mtInformation,[mbok],0);
  exit;
  end;
  form6:=tform6.create(application);
  form6.aded_flag:=1;
  if form6.showmodal=mrOK then
   begin
    dm.aqwz456.Close;
    dm.aqwz456.Open;
    dm.aqwz456.Locate('rkey',dm.ADO456RKEY.Value,[]);
    dm.ADO456.Close;
   end;
 finally
  form6.free;
 end;
end;

function TForm1.cheak_datetime(create_date:TDateTime):boolean;
begin
result:=true;
with dm.ADOQuery2 do
 begin
 close;
 sql.Clear;
 sql.Text:='select Max(cut_date) as max_cut_date from data0171';
 open;
 end;
 if dm.ADOQuery2.FieldByName('max_cut_date').AsVariant=null then
 begin
 result:=true;
 end
 else if dm.ADOQuery2.FieldByName('max_cut_date').AsVariant<>null then
 begin
 if dm.ADOQuery2.FieldByName('max_cut_date').Value>create_date then
   begin
   result:=false;
   MessageDlg('创建时间小于财务截数时间,不能再做任何修改',mtInformation,[mbok],0);
   end
   else
   begin
   result:=true;
   end;
 end;
end;

procedure TForm1.N14Click(Sender: TObject);
begin
  with TfrmAdd176.Create(Application) do
  try
    dm.at176.Close;
    dm.at176.Open;
    ShowModal;
  finally
    frmAdd176.Free;
  end;
end;



procedure TForm1.N16Click(Sender: TObject);
begin
 try
  Form_bzreport:=TForm_bzreport.Create(Application);
  Form_bzreport.ppReport1.Reset;
  Form_bzreport.ppReport1.Template.FileName :=
     StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
         'Wlbzreport.rtm';
  Form_bzreport.ppReport1.Template.LoadFromFile;
  Form_bzreport.ppReport1.SaveAsTemplate:=True;
  Form_bzreport.ppDesigner1.ShowModal;
 finally
   Form_bzreport.Free;
 end;
end;

procedure TForm1.N15Click(Sender: TObject);
var
  LFrm:Tfrm_report_zx;
begin

  if (dm.Aqwz456TTYPE.Value = 2) or (dm.Aqwz456TTYPE.Value = 6) then
  begin
    LFrm := Tfrm_report_zx.Create(nil);
    try
      LFrm.ADO493.Close;
      LFrm.ADO493.Open;

      LFrm.qry235.close;
      LFrm.qry235.Parameters[0].Value := dm.Aqwz235rkey.Value;
      LFrm.qry235.open;

      LFrm.ppReport1.Reset;
      LFrm.ppReport1.Template.FileName := StringReplace(GetCurrentDir, 'EXEC', 'NIERP\REPORT\', [rfReplaceAll])
      + 'Wlbzreport_zx.rtm';
      LFrm.ppReport1.Template.LoadFromFile;
      LFrm.ppReport1.SaveAsTemplate := false;
      LFrm.ppReport1.Print;
    finally
      LFrm.Free
    end;
  end
  else
  begin
    form_bzreport := tform_bzreport.Create(application);
    form_bzreport.ADO493.Close;
    form_bzreport.ADO493.Open;
    form_bzreport.ado22.close;
    form_bzreport.ado22.Parameters[0].Value := dm.Aqwz22rkey.Value;
    form_bzreport.ado22.open;

    Form_bzreport.ppReport1.Reset;
    Form_bzreport.ppReport1.Template.FileName := StringReplace(GetCurrentDir, 'EXEC', 'NIERP\REPORT\', [rfReplaceAll]) + 'Wlbzreport.rtm';
    Form_bzreport.ppReport1.Template.LoadFromFile;
    form_bzreport.ppReport1.SaveAsTemplate := false;
    form_bzreport.ppReport1.Print;
    form_bzreport.free;
  end;
end;

procedure TForm1.N17Click(Sender: TObject);
begin
  if (strtoint(vprev)<>4) then
    messagedlg('对不起!您没有该程序的直接入仓权限',mtinformation,[mbok],0)
  else
  try
    form10:=tform10.create(application);
    form10.aded_flag:=1;
    if form10.showmodal=mrok then
    begin
      dm.aqwz456.Close;
      dm.aqwz456.Open;
      dm.aqwz456.Locate('rkey',dm.ADO456RKEY.Value,[]);
      dm.ADO456.Close;
    end;
  finally
    form10.free;
  end;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
  if (strtoint(vprev)<>4) then
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

procedure TForm1.BitBtn6Click(Sender: TObject);
begin
Export_dbGrid_to_Excel(dbgrid1,self.Caption);
end;

procedure TForm1.N18Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else
  if messagedlg('你确定要退仓吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
  begin
    dm.ADO456.Close;
    dm.ADO456.Parameters[0].Value := dm.aqwz456RKEY.Value;
    dm.ADO456.Open;
    if (dm.ADO456STATUS.Value=dm.aqwz456STATUS.Value) and (not Check_FaFang(dm.ADO456TTYPE.Value)) then
    begin
      if dm.Aqwz456TTYPE.Value<>5 then
      begin
        if dm.Aqwz456create_date.Value<dm.find_maxdate then
        begin
          messagedlg('送货日期必须大于财务库存截数最大日期!',mterror,[mbok],0);
          exit;
        end;
      end
      else if dm.Aqwz456TTYPE.Value=5 then
      begin
        with dm.ADOQuery2 do
        begin
          close;
          sql.Clear;
          sql.Text:='select 1 from data0171 where status=0';
          open;
        end;
        if not dm.ADOQuery2.IsEmpty then
        begin
          MessageDlg('VMI仓库正在截数,不能操作,请联系财务部!',mtInformation,[mbok],0);
          exit;
        end
        else if not self.cheak_datetime(dm.Aqwz456create_date.Value) then
        begin
          exit;
        end
      end;

      if (((dm.Aqwz456TTYPE.Value = 2) or (dm.Aqwz456TTYPE.Value=6)) and (dm.Aqwz235.RecordCount = 1))
        or (dm.Aqwz22.RecordCount = 1) then
      begin
        ShowMessage('入库明细只有一条，请直接删除入库！！');
        exit;
      end;

      dm.ADOConnection1.BeginTrans;
      try
        if  (dm.Aqwz456TTYPE.Value =2) and (dm.Aqwz456TTYPE.Value=6)then
        begin
          with dm.ADOQuery2 do  //修改208的235指针为NULL
          begin
            Close;
            SQL.Clear;
            sql.Text:=' update data0208 set SOURCE_PTR = null   '+#13+
                      ' from data0208  '+#13+
                      ' inner join data0235 on data0208.SOURCE_PTR = data0235.rkey  '+#13+
                      ' where data0235.rkey= ' + dm.Aqwz235rkey.AsString ;
            ExecSQL;
          end;
        end
        else
        begin
          with dm.ADOQuery2 do  //修改207的22指针为NULL
          begin
            Close;
            SQL.Clear;
            sql.Text:=' update data0207 set D0022_PTR = null    '+#13+
                      ' from data0207  '+#13+
                      ' inner join data0022 on data0207.D0022_ptr = data0022.rkey  '+#13+
                      ' where data0022.rkey = ' + dm.Aqwz22rkey.AsString;
            ExecSQL;
          end;
        end;
        if (dm.Aqwz456TTYPE.Value <> 2) and (dm.Aqwz456TTYPE.Value<>5) and (dm.Aqwz456TTYPE.Value<>3) and (dm.Aqwz456TTYPE.Value<>6) then
        begin
          with dm.ADOQuery2 do         //更新71已收货数量
          begin
            close;
            sql.Clear;
            sql.Add('update data0071');
            sql.Add('set QUAN_RECD=QUAN_RECD-data0022.quantity/data0071.CONVERSION_FACTOR');
            sql.Add('from data0022 inner join data0071');
            sql.Add('on data0022.SOURCE_PTR=data0071.rkey');
            sql.Add('where  data0022.rkey='+ dm.Aqwz22rkey.AsString);
            ExecSQL;
          end;
          with dm.adoquery2 do     //更新70状态
          begin
            close;
            sql.clear;
            sql.Add('update data0070');
            sql.Add('set status=5');
            sql.Add('where rkey='+dm.aqwz456PO_PTR.AsString);
            execsql;
          end;
          with dm.ADOQuery2 do         //更新17当前库存总数据
          begin
            close;
            sql.Clear;
            sql.Add('update data0017');
            sql.Add('set data0017.QUAN_ON_HAND=data0017.QUAN_ON_HAND-d1.qty');
            sql.Add('from data0017 inner join');
            sql.Add('(select inventory_ptr,quan_on_hand as qty');
            sql.Add('from data0022');
            sql.Add('where data0022.rkey ='+ dm.Aqwz22rkey.AsString);
            sql.Add(' ) d1');
            sql.Add('on data0017.rkey=d1.INVENTORY_PTR');
            ExecSQL;
          end;

          if dm.Aqwz22rkey391.AsString <> '' then
          begin
            dm.ADOQuery2.Close;
            dm.ADOQuery2.SQL.Text:='update data0391 set stock_over=0 where Rkey='+ dm.Aqwz22rkey391.AsString ;
            dm.ADOQuery2.ExecSQL;
          end;

          with dm.ADOQuery2 do  //删除22入库记录
          begin
            close;
            sql.Clear;
            sql.Text:='delete from data0022 where rkey=' + dm.Aqwz22rkey.AsString;
            execsql;
          end;
        end
        else if dm.Aqwz456TTYPE.Value=2 then //杂项入仓
        begin
          with dm.ADOQuery2 do         //更新72已收货数量
          begin
            close;
            sql.Clear;
            sql.Add('update data0072');
            sql.Add('set QUANTITY_RECEIVED=QUANTITY_RECEIVED-data0235.QUAN_RECD');
            sql.Add('from data0235 inner join data0072');
            sql.Add('on data0235.D0072_PTR=data0072.rkey');
            sql.Add('where data0235.rkey ='+ dm.Aqwz235rkey.AsString);
            ExecSQL;
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
          with dm.ADOQuery2 do  //删除22入库记录
          begin
            close;
            sql.Clear;
            sql.Text:='delete from data0235 where rkey=' + dm.Aqwz235rkey.AsString;
            execsql;
          end;
        end
        else if dm.Aqwz456TTYPE.Value=5 then  //VMI入仓
        begin
          with dm.ADOQuery2 do         //更新17当前库存总数据
          begin
            close;
            sql.Clear;
            sql.Add('update data0017');
            sql.Add('set data0017.QUAN_ON_HAND=data0017.QUAN_ON_HAND-d1.quan_on_hand');
            sql.Add('from data0017 inner join');
            sql.Add('(select inventory_ptr,quan_on_hand');
            sql.Add('from data0022');
            sql.Add('where data0022.rkey='+ dm.Aqwz22rkey.AsString);
            sql.Add(' ) d1');
            sql.Add('on data0017.rkey=d1.INVENTORY_PTR');
            ExecSQL;
          end;
          with dm.ADOQuery2 do  //删除22入库记录
          begin
            close;
            sql.Clear;
            sql.Text:='delete from data0022 where rkey=' + dm.Aqwz22rkey.AsString;
            execsql;
          end;
          dm.Aqwz149.Close;
          dm.Aqwz149.Parameters[0].Value:=dm.Aqwz456rkey148.Value;
          dm.Aqwz149.Open;
          if dm.Aqwz149.Locate('D0134_PTR',dm.Aqwz22d0134_ptr.Value,[]) then
          begin
            dm.aq134.Close; //更新134VMI库存数
            dm.aq134.Parameters[0].Value:=dm.Aqwz149rkey.Value;
            dm.aq134.Open;
            dm.aq134.Edit;
            dm.aq134QUAN_ON_HAND.Value:=dm.aq134QUAN_ON_HAND.Value+dm.Aqwz149quantity.Value;
            dm.aq134.Post;
          end
          else
          begin
            ShowMessage('查找VMI出仓数据出错，请联系管理员！');
            exit;
          end;
        end
        else if dm.Aqwz456TTYPE.Value=3 then  //直接入仓生产物料
        begin
          with dm.ADOQuery2 do         //更新17当前库存总数据
          begin
            close;
            sql.Clear;
            sql.Add('update data0017');
            sql.Add('set data0017.QUAN_ON_HAND=data0017.QUAN_ON_HAND-d1.qty');
            sql.Add('from data0017 inner join');
            sql.Add('(select inventory_ptr,quan_on_hand as qty');
            sql.Add('from data0022');
            sql.Add('where data0022.rkey =' + dm.Aqwz22rkey.AsString);
            sql.Add(' ) d1');
            sql.Add('on data0017.rkey=d1.INVENTORY_PTR');
            ExecSQL;
          end;
          with dm.ADOQuery2 do  //删除22入库记录
          begin
            close;
            sql.Clear;
            sql.Text:='delete from data0022 where rkey=' + dm.Aqwz22rkey.AsString;
            execsql;
          end;
        end;

        dm.ADOConnection1.CommitTrans;
        messagedlg('退回成功!',mtinformation,[mbcancel],0);
        dm.aqwz456.Close;
        dm.aqwz456.Open;
        dm.ADO456.Close;
      except
       on E: Exception do
        begin
         dm.ADOConnection1.RollbackTrans;
         messagedlg(E.Message,mterror,[mbcancel],0);
        end;
      end;

    end
    else
    begin
      ShowMessage('状态或数量发生改变，退回失败！');
    end;
  end;
end;

function TForm1.Check_FaFang(ttype: Integer): Boolean;
begin
  result:=false;
  if ttype<>2 then
    with dm.adoquery1 do
     begin
      close;
      sql.Text:='select rkey from data0022'+#13+
                'where quantity<>quan_on_hand'+#13+
                'and rkey='+dm.Aqwz22rkey.AsString;
      open;
      if not IsEmpty then result:=true;
     end
  else
  with dm.adoquery1 do
   begin
    close;
    sql.Text:='select rkey from data0235'+#13+
              'where quan_recd<>quan_on_hand'+#13+
              'and rkey='+ dm.Aqwz235rkey.AsString;
    open;
    if not IsEmpty then result:=true;
   end
end;

procedure TForm1.N19Click(Sender: TObject);
var
  LFrm: Tfrm_report_zx;
begin
  LFrm:= Tfrm_report_zx.Create(nil);
 try
  LFrm.ppReport1.Reset;
  LFrm.ppReport1.Template.FileName :=
     StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
         'Wlbzreport_zx.rtm';
  LFrm.ppReport1.Template.LoadFromFile;
  LFrm.ppReport1.SaveAsTemplate:=True;
  LFrm.ppDesigner1.ShowModal;
 finally
   LFrm.Free;
 end;
end;

end.
