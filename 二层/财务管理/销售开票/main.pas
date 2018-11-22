unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBGrids, Grids, DBGridEh, StdCtrls, Menus, Buttons,
  ComCtrls,DateUtils, DB, ADODB;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Panel2: TPanel;
    CheckBox0: TCheckBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox4: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    PopupMenu2: TPopupMenu;
    Edit1: TEdit;
    Label3: TLabel;
    DBGridEh1: TDBGridEh;
    Splitter1: TSplitter;
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    BitBtn3: TBitBtn;
    PopupMenu3: TPopupMenu;
    N5: TMenuItem;
    N6: TMenuItem;
    BitBtn4: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure CheckBox0Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
    PreColumn: TColumnEh;
    procedure item_click(sender: TObject);
  //  function return_cutdate(rkey105:Integer):string;
    function find_lastjieshudate(rkey162:Integer):Boolean;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses damo,common, ysdetail, cutdate, Modify;

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var
 rkey105:integer;
begin
rkey105:=dm.ADS105RKEY.Value;
dm.ADS105.Close;
dm.ADS105.Prepared;
dm.ADS105.Open;
if rkey105>0 then dm.ADS105.Locate('rkey',rkey105,[]);
end;

procedure TForm1.item_click(sender: TObject);
var
  i:byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
  begin
    for i := 0 to dbgrideh1.FieldCount - 1 do
    if dbgrideh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
    begin
      dbgrideh1.Columns[i].Visible := true;
      break;
    end;
  end else begin
    for i := 0 to dbgrideh1.FieldCount - 1 do
    if dbgrideh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
    begin
      dbgrideh1.Columns[i].Visible := false;
      break;
    end;
  end;
end;

function TForm1.find_lastjieshudate(rkey162: Integer): Boolean;

begin
  Result:=false;

 with DM.ADOQuery1 do
  begin
    close;
    sql.Text:=
     'SELECT data0163.rkey '+
     'FROM    dbo.DATA0163 INNER JOIN '+
     'dbo.Data0112 ON dbo.DATA0163.INVOICE_PTR = dbo.Data0112.RKEY AND '+
     'dbo.DATA0163.RUSH_CHARGE > dbo.Data0112.INVOICE_TOTAL - dbo.Data0112.RUSH_CHARGE_AMOUNT '+
     'where DATA0163.HEADER_PTR='+inttostr(rkey162);
    open;
    if not IsEmpty then
    begin
     Result:=True;
     exit;
    end;
  end;

 with DM.ADOQuery1 do
  begin
    close;
    sql.Text:=
     'SELECT data0163.rkey '+
     'FROM   dbo.DATA0163 INNER JOIN '+
     'dbo.Data0116 ON dbo.DATA0163.DEBIT_PTR = dbo.Data0116.RKEY AND '+
     'dbo.DATA0163.RUSH_CHARGE < dbo.Data0116.RUSH_CHARGE - dbo.Data0116.AMOUNT '+
     'where DATA0163.HEADER_PTR='+inttostr(rkey162);
    open;
    if not IsEmpty then
    begin
     Result:=True;
     exit;
    end;
  end;

 with DM.ADOQuery1 do
  begin
    close;
    sql.Text:=
     'SELECT data0163.rkey '+
     'FROM   dbo.DATA0163 INNER JOIN '+
     'dbo.Data0064 ON dbo.DATA0163.SO_SHP_PTR = dbo.Data0064.RKEY AND '+
     'dbo.DATA0163.QUANTITY > Data0064.QUAN_SHIPPED - Data0064.ovsh_qty '+
     'where DATA0163.HEADER_PTR='+inttostr(rkey162);
    open;
    if not IsEmpty then
    begin
     Result:=True;
     exit;
    end;
  end;

 with DM.ADOQuery1 do
  begin
    close;
    sql.Text:=
     'SELECT data0163.rkey '+
     'FROM   dbo.DATA0163 INNER JOIN '+
     'dbo.Data0098 ON dbo.DATA0163.RMA_PTR = dbo.Data0098.RKEY AND '+
     'dbo.DATA0163.QUANTITY < dbo.Data0098.QTY_CRED - dbo.Data0098.QTY_RECD '+
     'where DATA0163.HEADER_PTR='+inttostr(rkey162);
    open;
    if not IsEmpty then
    begin
     Result:=True;
     exit;
    end;
  end;

end;

procedure TForm1.FormShow(Sender: TObject);
var
  i:byte;
  item:TMenuItem;
begin
  DateTimePicker2.Date:=getsystem_date(dm.adoquery1,1);
  DateTimePicker1.Date:=DateTimePicker2.Date-dayof(DateTimePicker2.Date)+1;
  self.DateTimePicker1Change(nil);
  
  PreColumn := DBGridEh1.Columns[0];
  for i:=1 to DBGrideh1.Columns.Count do
   begin
    item := TmenuItem.Create(self) ;
    item.Caption := DBGrideh1.Columns[i-1].Title.Caption ;
    item.Checked := DBGrideh1.Columns[i-1].Visible ;
    item.OnClick := item_click ;
    self.PopupMenu2.Items.Add(item) ;
   end;
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
begin
popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm1.DateTimePicker1Change(Sender: TObject);
begin
  WITH DM.ADS105 do
  begin
    close;
    parameters.ParamByName('vdate1').Value :=datetimepicker1.Date ;
    parameters.ParamByName('vdate2').Value :=datetimepicker2.Date ;
    Prepared;
    open;
  end;
  dm.ads106.Open;
end;

procedure TForm1.CheckBox0Click(Sender: TObject);
begin
 dm.ads105.Close;

if checkbox0.Checked then
 dm.ads105.Parameters[2].Value:=9
else
 dm.ads105.Parameters[2].Value:=0;

if checkbox1.Checked then
 dm.ads105.Parameters[3].Value:=9
else
 dm.ads105.Parameters[3].Value:=1;

if checkbox2.Checked then
 dm.ads105.Parameters[4].Value:=9
else
 dm.ads105.Parameters[4].Value:=2;

if checkbox3.Checked then
 dm.ads105.Parameters[5].Value:=9
else
 dm.ads105.Parameters[5].Value:=3;

if checkbox4.Checked then
 dm.ads105.Parameters[6].Value:=9
else
 dm.ads105.Parameters[6].Value:=4;

if checkbox5.Checked then
 dm.ads105.Parameters[7].Value:=9
else
 dm.ads105.Parameters[7].Value:=5;

 dm.ads105.Prepared;
 DM.ads105.open;
end;

procedure TForm1.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if column.Title.SortMarker =smDownEh then
  begin
   column.Title.SortMarker:=smUpEh;
   dm.ADS105.IndexFieldNames:=Column.FieldName;
  end
  else begin
   column.Title.SortMarker:=smDownEh;
   dm.ADS105.IndexFieldNames:=Column.FieldName+' DESC';
  end;

  if (PreColumn.FieldName<>column.FieldName)  and
     (column.Field.DataType in [ftString,ftWideString]) then
  begin
    label3.Caption:=column.Title.Caption;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else edit1.SetFocus;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
   dbgrideh1.DataSource.DataSet.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
 else
   dbgrideh1.DataSource.DataSet.Filter:='';
end;

procedure TForm1.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(dm.ADS105.CommandText);
end;

procedure TForm1.N1Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 begin
  messagedlg('对不起!您只有本程序的只读权限!',mtinformation,[mbok],0);
  exit;
 end;
try
 form_ysdetail:=Tform_ysdetail.Create(application);
 form_ysdetail.State:=1;  //标识新增
 if form_ysdetail.ShowModal=mrok then
  begin
    dm.ADS105.Close;
    dm.ADS105.Prepared;
    dm.ADS105.Open;
    dm.ADS105.Locate('rkey',dm.ADO105RKEY.Value,[]);
    dm.ADO105.Close;
    dm.ADO106.Close;
  end;
finally
 form_ysdetail.Free;
end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
if not app_init(dm.ADOConnection1) then
 begin
  showmsg('程序起动失败,请与管理员联系!',1);
  application.Terminate;
 end;

 self.Caption:= application.Title;

 DateSeparator := '-';
 ShortDateFormat := 'yyyy-mm-dd';

// dm.ADOConnection1.Close;
// dm.ADOConnection1.Open;
// user_ptr:='3';
// vprev:='2';
end;

procedure TForm1.N2Click(Sender: TObject);

begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 begin
  messagedlg('对不起!您只有本程序的只读权限!',mtinformation,[mbok],0);
  exit;
 end;

 dm.ado105.Close;
 dm.ado105.Parameters[0].Value:=dm.ADS105RKEY.Value;
 dm.ado105.Open;
 if dm.ado105STATUS.Value > 0 then
  begin
   messagedlg('会计凭证状态发生变化,无法编辑!',mtinformation,[mbcancel],0);
   dm.ADO105.Close;
   exit;
  end;

 if dm.ADO105ENTERED_DT.Value<= common.getmaxnokp_date(dm.ADOQuery1) then
 begin
  messagedlg('凭证日期在静态截数日期之前,无法编辑:',mtinformation,[mbok],0);
  dm.ado105.Close;
  exit;
 end;

try
 form_ysdetail:=Tform_ysdetail.Create(application);
 form_ysdetail.State:=2; //编辑
 if form_ysdetail.ShowModal=mrok then
  begin
    dm.ADS105.Close;
    dm.ADS105.Prepared;
    dm.ADS105.Open;
    dm.ADS105.Locate('rkey',dm.ADO105RKEY.Value,[]);
    dm.ADO105.Close;
    dm.ADO106.Close;
  end;
finally
 form_ysdetail.Free;
end;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
try
 form_ysdetail:=Tform_ysdetail.Create(application);
 form_ysdetail.State:=3;  //检查
 if form_ysdetail.ShowModal=mrok then
  begin

  end;
finally
 form_ysdetail.Free;
end;
end;

procedure TForm1.N4Click(Sender: TObject);

begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 begin
  messagedlg('对不起!您只有本程序的只读权限!',mtinformation,[mbok],0);
  exit;
 end;

if strtoint(user_ptr)<>dm.ADS105ENTERED_BY_EMPL_PTR.Value then
 begin
  messagedlg('对不起取消操作必须由创建人自己完成!',mtinformation,[mbok],0);
  exit;
 end;

 dm.ado105.Close;
 dm.ado105.Parameters[0].Value:=dm.ADS105RKEY.Value;
 dm.ado105.Open;
 if dm.ado105STATUS.Value > 0 then
  begin
   messagedlg('会计凭证状态发生变化,无法作废!',mtinformation,[mbok],0);
   dm.ADO105.Close;
   exit;
  end;

 if dm.ADO105ENTERED_DT.Value<= common.getmaxnokp_date(dm.ADOQuery1) then
 begin
  messagedlg('凭证日期在静态截数日期之前,无法作废:',mtinformation,[mbok],0);
  dm.ado105.Close;
  exit;
 end;

 if messagedlg('您确定要作废该凭证吗??'+dm.ADS105VOUCHER.Value,mtconfirmation,[mbyes,mbno],0)=mryes then
  begin
   try
    dm.ADOConnection1.BeginTrans;
    if not dm.ado105.IsEmpty then  
    begin
     dm.ADO105.Edit;
     dm.ADO105STATUS.Value:=5;    //被作废
     dm.ado105.Post;
    end;

//==============================================================================
   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0112'+#13+
              'set RUSH_CHARGE_AMOUNT=data0112.RUSH_CHARGE_AMOUNT-DATA0131.RUSH_CHARGE,'+#13+
              'glptr_status=0'+#13+
              'FROM DATA0131 INNER JOIN' +#13+
              'data0112 ON DATA0131.INVOICE_PTR = Data0112.RKEY'+#13+
              'where  DATA0131.GL_HEADER_PTR='+dm.ADO105RKEY.AsString;
     ExecSQL;             //去掉112开票金额
    end;
   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0116'+#13+
              'set RUSH_CHARGE=data0116.RUSH_CHARGE-DATA0131.RUSH_CHARGE,'+#13+
              'glptr_status=0'+#13+
              'FROM DATA0131 INNER JOIN' +#13+
              'data0116 ON DATA0131.DEBIT_PTR = Data0116.RKEY'+#13+
              'where  DATA0131.GL_HEADER_PTR='+dm.ADO105RKEY.AsString;
     ExecSQL;             //去掉116开票金额
    end;
//=============================================================================

   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0064'+#13+
              'set ovsh_qty=ovsh_qty-DATA0131.QUANTITY,'+#13+
              'GLPTR_STATUS=0'+#13+
              'FROM dbo.DATA0131 INNER JOIN' +#13+
              'dbo.Data0064 ON dbo.DATA0131.SO_SHP_PTR = dbo.Data0064.RKEY'+#13+
              'where  DATA0131.GL_HEADER_PTR='+dm.ADO105RKEY.AsString;
     ExecSQL;             //去掉64开票数量
    end;

   with dm.ADOQuery1 do             //更新应收帐龄为未开票
    begin
     close;
     sql.Text:=
     'update data0112'+#13+
     'set glptr_status=0'+#13+     
     'where rkey in (SELECT data0439.invoice_ptr'+#13+
     'FROM    dbo.Data0064 INNER JOIN'+#13+
     '        dbo.data0439 ON dbo.Data0064.packing_list_ptr = dbo.data0439.rkey'+#13+
     ' inner join data0131 on DATA0131.SO_SHP_PTR = dbo.Data0064.RKEY' +#13+
     'WHERE     (dbo.DATA0131.GL_HEADER_PTR = '+dm.ADO105RKEY.AsString+')'+#13+
     'GROUP BY data0439.invoice_ptr)';
     ExecSQL;
    end;
//=============================================================================
    with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0098'+#13+
              'set QTY_CRED=QTY_CRED-DATA0131.QUANTITY,'+#13+
              'GLPTR_STATUS=0'+#13+
              'FROM dbo.DATA0131 INNER JOIN' +#13+
              'dbo.Data0098 ON dbo.DATA0131.RMA_PTR = dbo.Data0098.RKEY'+#13+
              'where  DATA0131.GL_HEADER_PTR='+dm.ADO105RKEY.AsString;
     ExecSQL;
    end;

   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:=
     'update data0116'+#13+
     'set glptr_status=0'+#13+      //更新退货备忘为已开票
     'where rkey in (SELECT data0098.srce_ptr'+#13+
     'FROM  data0131 INNER JOIN'+#13+
           'Data0098 on DATA0131.RMA_PTR = dbo.Data0098.RKEY' +#13+
     'WHERE (DATA0131.GL_HEADER_PTR = '+dm.ADO105RKEY.AsString+')'+#13+
     'GROUP BY dbo.data0098.srce_ptr)';
     ExecSQL;
    end;                                 //去掉98开票数量
//=============================================================================
   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='delete data0131 '+
               'where GL_HEADER_PTR ='+dm.ADO105RKEY.AsString;
     ExecSQL;
    end;
//=============================================================================
     dm.ADOConnection1.CommitTrans;
     BitBtn2Click(nil);
     showmsg('作废操作成功!',1);
    except
     on E: Exception do
      begin
       dm.ADOConnection1.RollbackTrans;
       messagedlg(E.Message,mterror,[mbcancel],0);
      end;
    end;

   end;
end;

procedure TForm1.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
 if dm.ADS105STATUS.value=5 then
  DBGrideh1.Canvas.Font.Color := clRed;
  DBGrideh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
if dm.ADS105.IsEmpty then
 begin
  n2.Enabled := false;
  n3.Enabled := false;
  n4.Enabled := false;
 end
else
 begin
  n3.Enabled:=true;
  if dm.Ads105status.Value =0 then
    begin
     n2.Enabled :=true;
     n4.Enabled :=true;
    end
   else
    begin
     n2.Enabled :=false;
     n4.Enabled :=false;
    end;
 end;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
popupmenu3.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm1.N5Click(Sender: TObject);
begin
 Form_cutdate:=TForm_cutdate.Create(Application);
 Form_cutdate.ShowModal;
 Form_cutdate.Free;
end;

procedure TForm1.N6Click(Sender: TObject);
var
  rkey:Integer;
  cut_date:string;
begin
 with dm.ADOQuery1 do
  begin
   close;
   sql.Text:=
    'select top 1 data0162.rkey,data0162.cut_date,data0162.user_ptr,data0005.employee_name '+
    'from data0162 inner join data0005 '+
    'on data0162.user_ptr=data0005.rkey '+
    'order by cut_date desc';
   Open;
  end;
 if dm.ADOQuery1.IsEmpty  then
  ShowMsg('截数记录为空!没有可以删除的记录!',1)
 else
 if dm.ADOQuery1.FieldByName('user_ptr').AsInteger=StrToInt(user_ptr) then
  begin
   cut_date := dm.ADOQuery1.FieldByName('cut_date').AsString;
   rkey:=dm.ADOQuery1.FieldByName('rkey').AsInteger;
   if find_lastjieshudate(rkey) then
    ShowMsg('删除操作失败,未开票截数明细记录已被后来新增开票!',1)
   else
   if Msg_Dlg_Ask('你确定要删除截数记录:'
      +cut_date+'吗?删除为不可逆操作!','删除确认',1) then
    begin
      with dm.ADOQuery1 do
       begin
         close;
         sql.Text:=
          'delete data0162 where rkey='+inttostr(rkey);
        if ExecSQL>0 then
         ShowMsg('删除操作成功',1)
        else
         ShowMsg('删除操作失败请与管理员联系',1);
       end;
    end;
  end
 else
  ShowMsg('可删除的记录是由:'+dm.ADOQuery1.FieldByName('employee_name').AsString+'创建,你不能删除!',1);

end;




procedure TForm1.BitBtn4Click(Sender: TObject);
begin
  if (vprev='1') or (vprev='3') then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    Exit;
  end;
   with TForm_modify.Create(application) do
     try
       dm.ADOQuery3.Close;
       dm.ADOQuery3.Open;
       showmodal ;
     finally
       free;
     end;
end;

end.
