unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ComCtrls, ExtCtrls, StdCtrls, DBCtrls, Grids, DBGrids, Mask,
  Menus, ADODB, Buttons,DateUtils;

type
  TFrmMain = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    N2: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label2: TLabel;
    DateTimePicker2: TDateTimePicker;
    N3: TMenuItem;
    Label4: TLabel;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    DBGrid2: TDBGrid;
    DataSource2: TDataSource;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Splitter1: TSplitter;
    N1: TMenuItem;
    N4: TMenuItem;
    CheckBox5: TCheckBox;
    N5: TMenuItem;
    BitBtn1: TBitBtn;
    procedure N14Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure DateTimePicker1Exit(Sender: TObject);
    procedure DateTimePicker1CloseUp(Sender: TObject);
    procedure DateTimePicker2CloseUp(Sender: TObject);
    procedure DateTimePicker2Exit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    function get_vouchernumber(inv_date: tdatetime): string;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure N1Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BitBtn1Click(Sender: TObject);
  private

    { Private declarations }
   PreColumn: TColumn;
   OldGridWnd : TWndMethod;
   v_colwidth,v_colwidth1: array of integer;
   field_name:string;
   procedure NewGridWnd (var Message : TMessage);
  public
    { Public declarations }
    _isEdit:boolean;
    sys_sortdate:tdatetime;
    function MtoSt(const pdt:Tdate):string;
    //获取员工
    function getEmp(pRkey:string):string;
  end;

var
  FrmMain: TFrmMain;

implementation

uses Datamodule, AcctNote,common;

{$R *.dfm}
procedure TFrmMain.FormCreate(Sender: TObject);
begin
 if not App_Init(dm.ADOConnection1) then
  begin
   ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
   application.Terminate;
  end;
  self.Caption :=Application.Title;

{ user_ptr:='3';
  vprev:='4';
 }
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
 PreColumn:=DBGrid1.Columns[0]; 
end;

function TFrmMain.get_vouchernumber(inv_date: tdatetime): string;
var
 voucher:string;
 pr_req:integer;
begin
 voucher:='TA'+copy(inttostr(yearof(inv_date)),3,2);  //年度
 if length(inttostr(monthof(inv_date))) < 2 then
  voucher := voucher+'0'+inttostr(monthof(inv_date))
 else
  voucher := voucher+inttostr(monthof(inv_date));      //月份
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select top 1 VOUCHER from data0105');
   sql.Add('where VOUCHER like '''+voucher+'%''');
   sql.Add('order by voucher desc');
   open;
  end;
 if dm.ADOQuery1.IsEmpty then
  begin
   voucher:= voucher+'00001';
  end
 else
  begin
   pr_req := strtoint(copy(dm.ADOQuery1.fieldvalues['VOUCHER'],
   length(trim(voucher))+1,5));
   pr_req := 100000+pr_req+1;
   voucher := voucher+copy(inttostr(pr_req),2,5);
  end;
 result:=voucher;
end;

function TFrmMain.getEmp(pRkey:string):string;
var
  msql:string;
begin
  DM.ADOQ.Close ;
  dm.ADOQ.SQL.Clear ;
  msql:='select EMPLOYEE_NAME from data0005';
  msql:=msql+' where rkey='+prkey;
  dm.ADOQ.SQL.Text :=msql;
  DM.ADOQ.OPEN;
  if dm.ADOQ.RecordCount >0 then
    result:= dm.ADOQ.Fieldbyname('EMPLOYEE_NAME').AsString
  else
    result:= '';
end;

procedure TFrmMain.NewGridWnd(var Message: TMessage);
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

function TFrmMain.MtoSt(const pdt:Tdate):string;//月转成字符
var
  mst:string;
begin
  mst:=inttostr(monthOf(pdt));
  if Length(mst)<2 then
  mst:='0'+mst;
  result:=mst;
end;

procedure TFrmMain.N14Click(Sender: TObject);
begin
  close;
end;

procedure TFrmMain.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TFrmMain.N2Click(Sender: TObject);   //新增
VAR
  mDh:string;
  mdt:Tdate;
begin
 if (trim(vprev)='1') or (trim(vprev)='3') then
  begin
   messagedlg('对不起您只有只读权限!',mtinformation,[mbok],0);
   exit;
  end;

  _isEdit:=false;

  Application.CreateForm(TFrmAcctNote, FrmAcctNote);

  mdt:=sys_sortdate;
  FrmAcctNote.Datetimepicker1.Date:=mdt;
  FrmAcctNote.datetimepicker1.Enabled :=true;
  FrmAcctNote.Edit15.Text :=getEmp(trim(user_ptr));//制单人
  FrmAcctNote.edit6.Text := self.get_vouchernumber(mdt);  //凭证编号
  mDh:=TRIM(FrmAcctNote.edit6.text);//保存单号
  dm.ADOData0508.Close ;
  dm.ADOData0508.Open ;
  FrmAcctNote.edit1.text:=inttostr(yearof(mdt)) ; //会计年度
  FrmAcctNote.edit4.text:=inttostr(monthof(mdt)); //会计月份

  FrmAcctNote.SpeedButton7.Enabled :=false; //打印锁定
  FrmAcctNote.SpeedButton10.Enabled:=false;
  FrmAcctNote.SpeedButton11.Enabled:=false;
  frmacctnote.DBEdit1.Visible:=false;
  frmacctnote.Label10.Visible:=false;

//  if dm.ADOData0103.Active =false then dm.ADOData0103.Open ;

  FrmAcctNote.showmodal;
  FrmAcctNote.free;

end;

procedure TFrmMain.DateTimePicker1Exit(Sender: TObject);
begin
  DateTimePicker2.SetFocus;
end;

procedure TFrmMain.DateTimePicker1CloseUp(Sender: TObject);
begin
  DateTimePicker2.SetFocus;
end;

procedure TFrmMain.DateTimePicker2CloseUp(Sender: TObject);
begin
  dbgrid1.SetFocus ;
end;

procedure TFrmMain.DateTimePicker2Exit(Sender: TObject);
begin
  WITH DM.Ado105 do
  begin
    close;
    parameters.ParamByName('vdate1').Value :=datetimepicker1.DateTime ;
    parameters.ParamByName('vdate2').Value :=datetimepicker2.DateTime ;
    Prepared;
    open;
  end;
end;

procedure TFrmMain.FormActivate(Sender: TObject);
var
 i:integer;
begin
  self.sys_sortdate:= getsystem_date(dm.ADOQ,1);

  datetimepicker1.DateTime :=sys_sortdate-dayof(sys_sortdate)+1;
  datetimepicker2.DateTime :=sys_sortdate;

  CheckBox1Click(Sender);

  DM.AdoQ0106.Close ;
  DM.AdoQ0106.Open ;

setlength(v_colwidth,dbgrid1.FieldCount);
setlength(v_colwidth1,dbgrid2.FieldCount);

for i:=0 to high(v_colwidth) do v_colwidth[i]:=dbgrid1.Columns[i].Width;
for i:=0 to high(v_colwidth1) do v_colwidth1[i]:=dbgrid2.Columns[i].Width;
end;


procedure TFrmMain.N9Click(Sender: TObject);
begin       //检查
  Application.CreateForm(TFrmAcctNote, FrmAcctNote);
  FrmAcctNote.Edit6.text:=DM.Ado105.FieldByName('voucher').asstring;
  FrmAcctNote.datetimepicker1.Date :=DM.Ado105entered_dt.Value;
  FrmAcctNote.datetimepicker1.Enabled :=false;
  FrmAcctNote.edit5.Text :=DM.Ado105.fieldbyname('attached').asstring;  //付件张数
  FrmAcctNote.edit1.Text :=DM.ado105.fieldbyname('FYEAR').asstring;      //会计年度
  FrmAcctNote.edit4.Text :=DM.ado105.fieldbyname('PERIOD').asstring;     //会计期间
  FrmAcctNote.Edit15.Text :=dm.Ado105employee_name.Value;//制单人
  frmacctnote.Edit7.Text := dm.Ado105BATCH_NUMBER.Value;
  if dm.Ado105.RecordCount = 1 then
  begin
   FrmAcctNote.SpeedButton10.Enabled:=false;
   FrmAcctNote.SpeedButton11.Enabled:=false;
  end;

  DM.AdoQ0106.First ;

  while not DM.AdoQ0106.eof do
   begin
    FrmAcctNote.sgrid1.RowCount:=FrmAcctNote.sgrid1.RowCount+1;
    FrmAcctNote.sgrid1.Cells[0,FrmAcctNote.sgrid1.RowCount-2]:=DM.AdoQ0106.Fieldbyname('description').asstring;

    if length(trim(dm.ADOQ0106GL_ACC_NUMBER.Value)+'-'+ dm.ADOQ0106description_2.Value)>24 then
      FrmAcctNote.sgrid1.DefaultRowHeight:=34;
    FrmAcctNote.sgrid1.Cells[1,FrmAcctNote.sgrid1.RowCount-2]:=trim(dm.ADOQ0106GL_ACC_NUMBER.Value)+'-'+ dm.ADOQ0106description_2.Value;
        //币种
    FrmAcctNote.sgrid1.Cells[2,FrmAcctNote.sgrid1.RowCount-2]:=dm.ADOQ0106curr_code.Value;

    if dm.ADOQ0106EXCH_RATE.Value>0 then
     FrmAcctNote.sgrid1.Cells[3,FrmAcctNote.sgrid1.RowCount-2]:=
      formatfloat('0.00000000',1/dm.ADOQ0106EXCH_RATE.Value)
    else
     FrmAcctNote.sgrid1.Cells[3,FrmAcctNote.sgrid1.RowCount-2] := '0';
                     
    FrmAcctNote.sgrid1.Cells[4,FrmAcctNote.sgrid1.RowCount-2]:=     //原币
    formatfloat('0.00',dm.ADOQ0106PRICE.Value);

    if DM.AdoQ0106.Fieldbyname('d_c').asstring='D' then
      FrmAcctNote.sgrid1.Cells[5,FrmAcctNote.sgrid1.RowCount-2]:=DM.AdoQ0106.Fieldbyname('AMOUNT').asstring
    else
      FrmAcctNote.sgrid1.Cells[6,FrmAcctNote.sgrid1.RowCount-2]:=DM.AdoQ0106.Fieldbyname('AMOUNT').asstring;
    DM.AdoQ0106.next;
   end;

  FrmAcctNote.ttype.Caption :='2';     //检查
  FrmAcctNote.SpeedButton9.Enabled :=false;
  FrmAcctNote.SpeedButton1.Enabled :=false;
  FrmAcctNote.SpeedButton2.Enabled :=false;
  FrmAcctNote.SpeedButton3.Enabled :=false;
  FrmAcctNote.SpeedButton4.Enabled :=false;
  FrmAcctNote.SpeedButton5.Enabled :=false;
  FrmAcctNote.SpeedButton6.Enabled :=false;
  frmacctnote.Edit5.Enabled := false;
  frmacctnote.Edit7.Enabled := false;
  FrmAcctNote.sgrid1.Options :=FrmAcctNote.sgrid1.Options+[goRowselect];
  FrmAcctNote.PopupMenu1.Free;
  FrmAcctNote.showmodal;
  FrmAcctNote.free;
end;

procedure TFrmMain.N10Click(Sender: TObject);//删除凭证
var
  vsql:string;
  rkey:integer;
begin
 if (trim(vprev)='1') or (trim(vprev)='3') then
  begin
   messagedlg('对不起您只有只读权限!',mtinformation,[mbok],0);
   exit;
  end;

 if strtoint(user_ptr)<>dm.Ado105ENTERED_BY_EMPL_PTR.Value then
  begin
   messagedlg('对不起取消凭证操作必须输入人员才可以进行!',mtinformation,[mbok],0);
   exit;
  end;
  
 if dm.Ado105SPECIAL_POSTING.Value<>'N' then
  begin
   messagedlg('特殊自动结转凭证不能作废!',mtinformation,[mbok],0);
   exit;
  end;

 if messagedlg('是否确认要取消该项业务！',mtconfirmation,[mbYes,mbNo],0)=mrYes then
  try
    dm.ADOConnection1.BeginTrans ;
    dm.ADOQ.close;
    dm.ADOQ.sql.Clear;
    vsql:='update data0105'+#13+
          'set status=5'+#13+
          'where rkey='+dm.Ado105rkey.AsString ;

    dm.ADOQ.sql.Text :=vsql;
    dm.ADOQ.ExecSQL;

    dm.ADOConnection1.CommitTrans ;
    messagedlg('取消操作成功!',mtinformation,[mbok],0);
    rkey:=dm.Ado105rkey.Value;
    DM.Ado105.Close ;
    DM.Ado105.Open ;
    dm.Ado105.Locate('rkey',rkey,[]);
  except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mtinformation,[mbok],0);
    end;
  end;

end;

procedure TFrmMain.N3Click(Sender: TObject);

begin
  if (trim(vprev)='1') or
    (trim(vprev)='3') then
   begin
    messagedlg('对不起您只有只读权限!',mtinformation,[mbok],0);
    exit;
   end;
  _isEdit:=true;

  Application.CreateForm(TFrmAcctNote, FrmAcctNote);

  FrmAcctNote.Edit6.text:=DM.ado105.FieldByName('voucher').asstring;     //凭证号
  FrmAcctNote.datetimepicker1.Date :=DM.ado105.fieldbyname('entered_dt').asdatetime;
  FrmAcctNote.edit5.Text :=DM.ado105.fieldbyname('attached').asstring;   //附件
  FrmAcctNote.edit1.Text :=DM.ado105.fieldbyname('FYEAR').asstring;      //会计年度
  FrmAcctNote.edit4.Text :=DM.ado105.fieldbyname('PERIOD').asstring;     //会计期间
  FrmAcctNote.Edit15.Text :=dm.Ado105employee_name.Value;                //制单人
  frmacctnote.Edit7.Text := dm.Ado105BATCH_NUMBER.Value;
  if dm.Ado105.RecordCount = 1 then
  begin
   FrmAcctNote.SpeedButton10.Enabled:=false;
   FrmAcctNote.SpeedButton11.Enabled:=false;
  end;

  DM.AdoQ0106.First ;

  while not DM.AdoQ0106.eof do
  begin
    FrmAcctNote.sgrid1.RowCount:=FrmAcctNote.sgrid1.RowCount+1;
    FrmAcctNote.sgrid2.RowCount:=FrmAcctNote.sgrid2.RowCount+1;

    FrmAcctNote.sgrid1.Cells[0,FrmAcctNote.sgrid1.RowCount-2]:=
      DM.AdoQ0106.Fieldbyname('description').asstring;

    if length(trim(dm.ADOQ0106GL_ACC_NUMBER.Value)+'-'+ dm.ADOQ0106description_2.Value)>24 then
      FrmAcctNote.sgrid1.DefaultRowHeight:=34;

    FrmAcctNote.sgrid1.Cells[1,FrmAcctNote.sgrid1.RowCount-2]:=trim(dm.ADOQ0106GL_ACC_NUMBER.Value)+'-'+ dm.ADOQ0106description_2.Value;

    FrmAcctNote.sgrid1.Cells[2,FrmAcctNote.sgrid1.RowCount-2]:=
        dm.ADOQ0106curr_code.Value;

        
    if dm.ADOQ0106EXCH_RATE.Value > 0 then
     FrmAcctNote.sgrid1.Cells[3,FrmAcctNote.sgrid1.RowCount-2]:=
      formatfloat('0.00000000',1/dm.ADOQ0106EXCH_RATE.Value)
    else
     FrmAcctNote.sgrid1.Cells[3,FrmAcctNote.sgrid1.RowCount-2] := '0';

    FrmAcctNote.sgrid2.Cells[0,FrmAcctNote.sgrid1.RowCount-2]:=DM.AdoQ0106.Fieldbyname('RKEY').asstring;
    FrmAcctNote.sgrid2.Cells[1,FrmAcctNote.sgrid1.RowCount-2]:=trim(DM.AdoQ0106.Fieldbyname('GL_ACCT_NO_PTR').asstring);
    FrmAcctNote.sgrid2.Cells[2,FrmAcctNote.sgrid1.RowCount-2]:=dm.ADOQ0106CURR_PTR.AsString;     //保存货币指针
                           
    FrmAcctNote.sgrid1.Cells[4,FrmAcctNote.sgrid1.RowCount-2]:=   //原币
      formatfloat('0.00',dm.ADOQ0106PRICE.Value);

    if DM.AdoQ0106.Fieldbyname('d_c').asstring='D' then
      FrmAcctNote.sgrid1.Cells[5,FrmAcctNote.sgrid1.RowCount-2]:=DM.AdoQ0106.Fieldbyname('AMOUNT').asstring
    else
      FrmAcctNote.sgrid1.Cells[6,FrmAcctNote.sgrid1.RowCount-2]:=DM.AdoQ0106.Fieldbyname('AMOUNT').asstring;
    DM.AdoQ0106.next;
  end;
  dm.ADOQ0106.First;

   FrmAcctNote.speedbutton2.Enabled:=true;
   FrmAcctNote.speedbutton3.Enabled:=true;
   FrmAcctNote.speedbutton4.Enabled:=true;
   FrmAcctNote.speedbutton5.Enabled:=true;
   FrmAcctNote.speedbutton6.Enabled:=true;
   FrmAcctNote.ttype.Caption :='1';      //标识编辑

  FrmAcctNote.showmodal;
  FrmAcctNote.free;
    
end;

procedure TFrmMain.FormShow(Sender: TObject);

begin
if  dm.ADOConnection1.Connected then
 begin

  dm.ADOData0508.Open ;

 END;
end;

procedure TFrmMain.CheckBox1Click(Sender: TObject);
begin
 dm.Ado105.Close;
 dm.Ado105.parameters.ParamByName('vdate1').Value :=datetimepicker1.DateTime ;
 dm.Ado105.parameters.ParamByName('vdate2').Value :=datetimepicker2.DateTime ;
if checkbox1.Checked then
 dm.Ado105.Parameters[2].Value:=9
else
 dm.Ado105.Parameters[2].Value:=0;

if checkbox2.Checked then
 dm.Ado105.Parameters[3].Value:=9
else
 dm.Ado105.Parameters[3].Value:=1;

if checkbox3.Checked then
 dm.Ado105.Parameters[4].Value:=9
else
 dm.Ado105.Parameters[4].Value:=2;

if checkbox4.Checked then
 dm.Ado105.Parameters[5].Value:=9
else
 dm.Ado105.Parameters[5].Value:=3;

if checkbox5.Checked then
 dm.Ado105.Parameters[6].Value:=9
else
 dm.Ado105.Parameters[6].Value:=5;
 dm.Ado105.Prepared;
 DM.Ado105.open;
end;

procedure TFrmMain.Edit1Change(Sender: TObject);//凭证号查询
begin
  if trim(edit1.text)<>'' then
    dm.Ado105.Filter :=PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
  else
    dm.Ado105.Filter :='';
end;

procedure TFrmMain.FormResize(Sender: TObject);
var
 i:byte;
begin
{for i:=low(v_colwidth) to high(v_colwidth) do
  dbgrid1.Columns[i].Width:=v_colwidth[i]+round((dbgrid1.Width-744)*v_colwidth[i]/720);
for i:=low(v_colwidth1) to high(v_colwidth1) do
  dbgrid2.Columns[i].Width:=v_colwidth1[i]+round((dbgrid2.Width-744)*v_colwidth1[i]/700);}
end;

procedure TFrmMain.PopupMenu1Popup(Sender: TObject);
begin
  if dm.Ado105.IsEmpty then
   begin
    n3.Enabled := false;
    n10.Enabled := false;
    n9.Enabled := false;
    n1.Enabled := false;
    n5.Enabled := false;
   end
  else
   begin
    if dm.Ado105status.Value =0 then
      begin
       n3.Enabled :=true;
       n10.Enabled :=true;
       n1.Enabled :=false;
      end
     else
      begin
       n3.Enabled :=false;
       n10.Enabled :=false;
       if dm.Ado105status.Value=5 then
        n1.Enabled:=true
       else
        n1.Enabled:=false;
      end;
    n9.Enabled :=true;
    n5.Enabled :=true;
   end;
end;

procedure TFrmMain.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
 if dm.ADO105status.value=5 then
  DBGrid1.Canvas.Font.Color := clRed;
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrmMain.N1Click(Sender: TObject);
var
  vsql:string;
  rkey:integer;
begin
 if (trim(vprev)='1') or (trim(vprev)='3') then
  begin
   messagedlg('对不起您只有只读权限!',mtinformation,[mbok],0);
   exit;
  end;

 if strtoint(user_ptr)<>dm.Ado105ENTERED_BY_EMPL_PTR.Value then
  begin
   messagedlg('对不起重启凭证操作必须输入人员才可以进行!',mtinformation,[mbok],0);
   exit;
  end;

 if dm.Ado105SPECIAL_POSTING.Value<>'N' then
  begin
   messagedlg('特殊自动结转凭证不能重启!',mtinformation,[mbok],0);
   exit;
  end;

 if messagedlg('是否确认要重启该项业务！',mtconfirmation,[mbYes,mbNo],0)=mrYes then
  try
    dm.ADOConnection1.BeginTrans ;
    dm.ADOQ.close;
    dm.ADOQ.sql.Clear;
    vsql:='update data0105'+#13+
          'set status=0'+#13+
          'where rkey='+dm.Ado105rkey.AsString ;

    dm.ADOQ.sql.Text :=vsql;
    dm.ADOQ.ExecSQL;
     
    dm.ADOConnection1.CommitTrans ;
    messagedlg('重启操作成功!',mtinformation,[mbok],0);
    rkey:=dm.Ado105rkey.Value;
    DM.Ado105.Close ;
    DM.Ado105.Open ;
    dm.Ado105.Locate('rkey',rkey,[]);
  except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mtinformation,[mbok],0);
    end;
  end;

end;


procedure TFrmMain.N5Click(Sender: TObject); //复制新增
VAR
  mDh:string;
  mdt:Tdate;
begin
 if (trim(vprev)='1') or (trim(vprev)='3') then
  begin
   messagedlg('对不起您只有只读权限!',mtinformation,[mbok],0);
   exit;
  end;

  _isEdit:=false;

  Application.CreateForm(TFrmAcctNote, FrmAcctNote);

  mdt:=sys_sortdate;
  FrmAcctNote.Datetimepicker1.Date:=mdt;
  FrmAcctNote.datetimepicker1.Enabled :=true;
  FrmAcctNote.Edit15.Text :=getEmp(trim(user_ptr));//制单人
  FrmAcctNote.edit6.Text := self.get_vouchernumber(mdt);  //凭证编号
  mDh:=TRIM(FrmAcctNote.edit6.text);//保存单号
  dm.ADOData0508.Close ;
  dm.ADOData0508.Open ;
  FrmAcctNote.edit1.text:=inttostr(yearof(mdt)) ; //会计年度
  FrmAcctNote.edit4.text:=inttostr(monthof(mdt)); //会计月份

  FrmAcctNote.SpeedButton7.Enabled :=false; //打印锁定
  FrmAcctNote.SpeedButton10.Enabled:=false;
  FrmAcctNote.SpeedButton11.Enabled:=false;
  frmacctnote.DBEdit1.Visible:=false;
  frmacctnote.Label10.Visible:=false;
                                                              //
  DM.AdoQ0106.First ;

  while not DM.AdoQ0106.eof do
  begin
    FrmAcctNote.sgrid1.RowCount:=FrmAcctNote.sgrid1.RowCount+1;
    FrmAcctNote.sgrid2.RowCount:=FrmAcctNote.sgrid2.RowCount+1;

    FrmAcctNote.sgrid1.Cells[0,FrmAcctNote.sgrid1.RowCount-2]:=
      DM.AdoQ0106.Fieldbyname('description').asstring;

    if length(trim(dm.ADOQ0106GL_ACC_NUMBER.Value)+'-'+ dm.ADOQ0106description_2.Value)>24 then
      FrmAcctNote.sgrid1.DefaultRowHeight:=34;

    FrmAcctNote.sgrid1.Cells[1,FrmAcctNote.sgrid1.RowCount-2]:= trim(dm.ADOQ0106GL_ACC_NUMBER.Value)+'-'+ dm.ADOQ0106description_2.Value;

    FrmAcctNote.sgrid1.Cells[2,FrmAcctNote.sgrid1.RowCount-2]:=
        dm.ADOQ0106curr_code.Value;

    if dm.ADOQ0106EXCH_RATE.Value > 0 then
     FrmAcctNote.sgrid1.Cells[3,FrmAcctNote.sgrid1.RowCount-2]:=
      formatfloat('0.0000',1/dm.ADOQ0106EXCH_RATE.Value)
    else
     FrmAcctNote.sgrid1.Cells[3,FrmAcctNote.sgrid1.RowCount-2] := '0';

    FrmAcctNote.sgrid2.Cells[0,FrmAcctNote.sgrid1.RowCount-2]:=DM.AdoQ0106.Fieldbyname('RKEY').asstring;
    FrmAcctNote.sgrid2.Cells[1,FrmAcctNote.sgrid1.RowCount-2]:=trim(DM.AdoQ0106.Fieldbyname('GL_ACCT_NO_PTR').asstring);
    FrmAcctNote.sgrid2.Cells[2,FrmAcctNote.sgrid1.RowCount-2]:=dm.ADOQ0106CURR_PTR.AsString;     //保存货币指针
                            
    FrmAcctNote.sgrid1.Cells[4,FrmAcctNote.sgrid1.RowCount-2]:=   //原币
      formatfloat('0.00',dm.ADOQ0106PRICE.Value);

    if DM.AdoQ0106.Fieldbyname('d_c').asstring='D' then
      FrmAcctNote.sgrid1.Cells[5,FrmAcctNote.sgrid1.RowCount-2]:=DM.AdoQ0106.Fieldbyname('AMOUNT').asstring
    else
      FrmAcctNote.sgrid1.Cells[6,FrmAcctNote.sgrid1.RowCount-2]:=DM.AdoQ0106.Fieldbyname('AMOUNT').asstring;
    DM.AdoQ0106.next;
  end;
  dm.ADOQ0106.First;

   FrmAcctNote.speedbutton2.Enabled:=true;
   FrmAcctNote.speedbutton3.Enabled:=true;
   FrmAcctNote.speedbutton4.Enabled:=true;
   FrmAcctNote.speedbutton5.Enabled:=true;
   FrmAcctNote.speedbutton6.Enabled:=true;
     
  FrmAcctNote.showmodal;
  FrmAcctNote.free;

end;

procedure TFrmMain.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(dm.ADO105.SQL.Text);
end;

procedure TFrmMain.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(dm.ADOQ0106.CommandText);
end;

procedure TFrmMain.DBGrid1TitleClick(Column: TColumn);
begin
  if column.Field.FieldKind =fkCalculated then exit;
  if (column.FieldName<>PreColumn.FieldName) then
    DM.Ado105.Sort:=column.FieldName;

 if (column.ReadOnly) and (PreColumn.FieldName<>column.FieldName) then
 begin
  label4.Caption:=column.Title.Caption;
//  self.field_name:=column.FieldName;
  edit1.SetFocus;
  PreColumn.Title.Color := clBtnFace;
  Column.Title.Color := clred;
  PreColumn := column;
 end
else
 edit1.SetFocus;
end;

procedure TFrmMain.BitBtn1Click(Sender: TObject);
begin
  Export_dbGrid_to_Excel(dbgrid1,self.Caption)
end;

end.
