unit cancelcutno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, DBGrids, Grids, DBGridEh,
  ComCtrls, Menus;

type
  TForm_cancelcutno = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    Splitter1: TSplitter;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DBGrid1: TDBGrid;
    ads492: TADODataSet;
    ads06: TADODataSet;
    ads492rkey: TIntegerField;
    ads492CUT_NO: TStringField;
    ads492SO_NO: TStringField;
    ads492MANU_PART_NUMBER: TStringField;
    ads492MANU_PART_DESC: TStringField;
    ads492ISSUED_QTY: TIntegerField;
    ads492ISSUE_DATE: TDateTimeField;
    ads492EMPLOYEE_NAME: TStringField;
    ads492PANEL_1_QTY: TIntegerField;
    ads492PANEL_2_QTY: TIntegerField;
    ads492UPANEL1: TIntegerField;
    ads492UPANEL2: TIntegerField;
    Label1: TLabel;
    Edit1: TEdit;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    ads06WORK_ORDER_NUMBER: TStringField;
    ads06BEGIN_STEP_NO: TSmallintField;
    ads06QUAN_SCH: TFloatField;
    ads06PANELS: TIntegerField;
    ads06PARTS_PER_PANEL: TFloatField;
    ads06SCH_COMPL_DATE: TDateTimeField;
    ads06pnl_size: TStringField;
    ads06WIPMAT_STATUS: TSmallintField;
    ads06PROD_STATUS: TSmallintField;
    ads06CUT_NO: TStringField;
    ads06_status: TStringField;
    ads492ct_type: TStringField;
    ads492status: TStringField;
    ads492tstatus: TWordField;
    ads492PLANNED_QTY: TIntegerField;
    ads492ORD_REQ_QTY: TIntegerField;
    ads492ttype: TWordField;
    ads492BOM_PTR: TIntegerField;
    ads492mrb_ptr: TIntegerField;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    ads06REMARK_PNLS: TFloatField;
    ads492ct_rate: TCurrencyField;
    ads06RKEY: TAutoIncField;
    ads06PANEL_A_B: TIntegerField;
    ads492WIP_QTY: TIntegerField;
    ads492waitfor_release: TIntegerField;
    BitBtn3: TBitBtn;
    ads492CREATED_BY_PTR: TIntegerField;
    procedure FormActivate(Sender: TObject);
    procedure dtpk1CloseUp(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure BitBtn1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure ads492CalcFields(DataSet: TDataSet);
    procedure N1Click(Sender: TObject);
    procedure ads492AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
   PreColumn: TColumnEh;
   function guoshu(cut_no:string;_type,rkey06:integer):boolean;
   function baofei(cut_no:string;_type,rkey06:integer):boolean;
   function fenpei(cut_no: string;_type,rkey06:integer): boolean;

  public
    { Public declarations }
   cancel_type:byte; 
  end;

var
  Form_cancelcutno: TForm_cancelcutno;

implementation

uses damo,common;

{$R *.dfm}
function TForm_cancelcutno.guoshu(cut_no: string;_type,rkey06:integer): boolean;
var
 sql_str:string;
begin
if _type=0 then
 sql_str:='SELECT     dbo.Data0048.RKEY '+
          'FROM  dbo.Data0048 INNER JOIN '+
          'dbo.Data0006 ON dbo.Data0048.WO_PTR = dbo.Data0006.RKEY '+
          'where data0006.cut_no='+quotedstr(cut_no)
else
 sql_str:='SELECT     dbo.Data0048.RKEY '+
          'FROM  dbo.Data0048 INNER JOIN '+
          'dbo.Data0006 ON dbo.Data0048.WO_PTR = dbo.Data0006.RKEY '+
          'where data0006.rkey='+inttostr(rkey06);
openquery(dm.ADOQuery1,sql_str);
if dm.ADOQuery1.IsEmpty then
 result:=false
else
 result:=true;
end;

function TForm_cancelcutno.baofei(cut_no: string;_type,rkey06:integer): boolean;
var
 sql_str:string;
begin
if _type=0 then
 sql_str:='SELECT     dbo.Data0058.RKEY '+
          'FROM  dbo.Data0058 INNER JOIN '+
          'dbo.Data0006 ON dbo.Data0058.WO_PTR = dbo.Data0006.RKEY '+
          'where data0006.cut_no='+quotedstr(cut_no)
else
 sql_str:='SELECT     dbo.Data0058.RKEY '+
          'FROM  dbo.Data0058 INNER JOIN '+
          'dbo.Data0006 ON dbo.Data0058.WO_PTR = dbo.Data0006.RKEY '+
          'where data0006.rkey='+inttostr(rkey06);
openquery(dm.ADOQuery1,sql_str);
if dm.ADOQuery1.IsEmpty then
 result:=false
else
 result:=true;
end;

function TForm_cancelcutno.fenpei(cut_no: string;_type,rkey06:integer): boolean;
var
 sql_str:string;
begin
if _type=0 then
 sql_str:='SELECT  dbo.Data0489.RKEY '+
          'FROM  dbo.Data0489 INNER JOIN '+
          'dbo.Data0006 ON dbo.Data0489.WO_PTR = dbo.Data0006.RKEY '+
          'where data0006.cut_no='+quotedstr(cut_no)
else
 sql_str:='SELECT  dbo.Data0489.RKEY '+
          'FROM  dbo.Data0489 INNER JOIN '+
          'dbo.Data0006 ON dbo.Data0489.WO_PTR = dbo.Data0006.RKEY '+
          'where data0006.cut_no='+inttostr(rkey06);
openquery(dm.ADOQuery1,sql_str);
if dm.ADOQuery1.IsEmpty then
 result:=false
else
 result:=true;
end;

procedure TForm_cancelcutno.FormActivate(Sender: TObject);
begin
 dtpk1.Date:=getsystem_date(dm.ADOQuery1,1);
 dtpk2.Date:=dtpk1.Date;
 dtpk1.OnCloseUp(sender);
 PreColumn := DBGridEH1.Columns[0];
 if self.cancel_type=1 then
  begin
   bitbtn1.Visible:=false;
   bitbtn2.Visible:=false;
   bitbtn3.Visible:=true;
  end
 else
  dbgrid1.PopupMenu:=nil; 
end;

procedure TForm_cancelcutno.dtpk1CloseUp(Sender: TObject);
begin
self.ads492.Close;
self.ads492.Parameters[0].Value:=dtpk1.Date;
self.ads492.Parameters[1].Value:=dtpk2.Date+1;
self.ads492.Open;

end;

procedure TForm_cancelcutno.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(self.ads492.CommandText);
end;

procedure TForm_cancelcutno.DBGridEh1TitleClick(Column: TColumnEh);
begin
 if column.Title.SortMarker =smDownEh then
  begin
   column.Title.SortMarker:=smUpEh;
   self.ads492.IndexFieldNames:=Column.FieldName;
  end
 else
  begin
   column.Title.SortMarker:=smDownEh;
   self.ads492.IndexFieldNames:=Column.FieldName+' DESC';
  end;

if (column.ReadOnly) and (PreColumn.FieldName<>column.FieldName) then
 begin
  label1.Caption:=column.Title.Caption;
  edit1.SetFocus;
  PreColumn.Title.Color := clBtnFace;
  Column.Title.Color := clred;
  PreColumn := column;
 end
else
 edit1.SetFocus;

end;

procedure TForm_cancelcutno.Edit1Change(Sender: TObject);
begin
if (trim(edit1.Text)<> '')  then
 self.ads492.Filter:=PreColumn.FieldName+' like ''%'+trim(edit1.Text)+'%'''
else
 ads492.Filter:='';
end;

procedure TForm_cancelcutno.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
if ads492.IsEmpty then
 bitbtn1.Enabled := false
else
 bitbtn1.Enabled := true;
end;


procedure TForm_cancelcutno.BitBtn1Click(Sender: TObject);
var
 sql_str,cut_no:string;
begin
sql_str:=dm.find_wip_code;
 if sql_str<>'' then
 begin
  showmsg('在制品正在盘点不允许取消,盘点代码:'+sql_str,1);
  exit;
 end;
 sql_str:='SELECT data0492.tstatus '+
 'FROM data0492 '+
 'where data0492.rkey='+self.ads492rkey.AsString;
 openquery(dm.ADOQuery1,sql_str);
if dm.ADOQuery1.FieldByName('tstatus').AsInteger<>self.ads492tstatus.Value then
 begin
  showmsg('配料单状态发生变化,操作不能进行!',1);
  exit;
 end;


if messagedlg(self.Caption+
'操作是不可逆操作是您确定吗?',mtconfirmation,[mbok,mbcancel],0)=mrCancel then
 EXIT;

if self.cancel_type=0 then
begin
 if self.guoshu(self.ads492CUT_NO.Value,0,0) then
  begin
   showmsg('投产作业已产生过数记录无法取消',1);
   exit;
  end;
 if self.baofei(self.ads492CUT_NO.Value,0,0) then
  begin
   showmsg('投产作业已产生报废记录无法取消',1);
   exit;
  end;
 if self.fenpei(self.ads492CUT_NO.Value,0,0) then
  begin
   showmsg('投产作业已产生内层分配记录无法取消',1);
   exit;
  end;
end;

{if messagedlg(self.Caption+
'操作是不可逆操作是您确定吗?',mtconfirmation,[mbok,mbcancel],0)=mrok then
begin
}
if self.cancel_type=0 then
 begin
 try
  dm.ADOConnection1.BeginTrans;
  cut_no:=self.ads492CUT_NO.Value;
  self.ads492.Edit;
  self.ads492tstatus.Value:=3;
  self.ads492CREATED_BY_PTR.Value:=strtoint(user_ptr);
  self.ads492.Post;

  sql_str:='update data0006 '+
           'set PROD_STATUS=202 '+
           'where data0006.cut_no='+quotedstr(cut_no);
  ExecSql(dm.ADOQuery1,sql_str);

  sql_str:='delete data0056 '+
           'FROM  dbo.Data0056 INNER JOIN '+
           'dbo.Data0006 ON dbo.Data0056.WO_PTR = dbo.Data0006.RKEY '+
           'where data0006.cut_no='+quotedstr(cut_no);
  ExecSql(dm.ADOQuery1,sql_str);

  sql_str:='delete data0491 '+
           'FROM  dbo.Data0491 '+
           'where MO_PTR='+SELF.ads492rkey.AsString;
  ExecSql(dm.ADOQuery1,sql_str);

  if (self.ads492ttype.Value=0) or (self.ads492ttype.Value=1) then
   with dm.ADOQuery1 do      //订单投产,补料投产
   begin
    close;
    sql.Text:='select prod_rel,to_be_planned,qty_plannned,issued_qty'+#13+
               'from data0060 where sales_order='+quotedstr(self.ads492SO_NO.Value)+#13+
               'and CUST_PART_PTR='+self.ads492BOM_PTR.AsString;
    open;
    if not IsEmpty then
    begin
     edit;
     fieldbyname('qty_plannned').AsInteger:=fieldbyname('qty_plannned').AsInteger-
                                           self.ads492PLANNED_QTY.Value;
     fieldbyname('issued_qty').AsInteger:=fieldbyname('issued_qty').AsInteger-
                                           self.ads492ISSUED_QTY.Value;
     if self.ads492ttype.Value=0 then         //订单投产可能合并的
     begin
      sql_str:='select * from  data0535 '+
      'where DATA0535.CUT_NO='+quotedstr(cut_no);
      common.OpenQuery(dm.ADOQuery2,sql_str);

      if dm.ADOQuery2.IsEmpty then
       begin
        fieldbyname('to_be_planned').AsInteger:=
                   fieldbyname('to_be_planned').AsInteger+
                   self.ads492ORD_REQ_QTY.Value;
        fieldbyname('prod_rel').AsString:='2';
       end
      else
       begin
        sql_str:='Update data0060 '+
        'set TO_BE_PLANNED=TO_BE_PLANNED+DATA0535.QTY_PLANNED,prod_rel=''2'' '+
        'FROM  dbo.DATA0535 INNER JOIN '+
        'dbo.Data0060 ON dbo.DATA0535.SALES_ORDER = dbo.Data0060.SALES_ORDER '+
        'where DATA0535.CUT_NO='+quotedstr(cut_no);
        common.ExecSql(dm.ADOQuery2,sql_str);

        sql_str:='delete data0535 '+
        'where DATA0535.CUT_NO='+quotedstr(cut_no);
        common.ExecSql(dm.ADOQuery2,sql_str);
       end;
     end;
     post;
    end;
   end
  else
  if (self.ads492ttype.Value=2) or (self.ads492ttype.Value=3) then
    with dm.ADOQuery1 do
     begin
      close;
      sql.Text:='select data0414.qty_to_be_reworked,data0414.qty_reworked,'+#13+
                'data0414.qty_to_be_remaked,data0414.qty_remaked,data0414.status'+#13+
                'from data0414 inner join data0415'+#13+
                'on data0414.d415_ptr=data0415.rkey'+#13+
                'where data0414.rkey='+ads492mrb_ptr.AsString+#13+
                'and data0415.custpart_ptr='+self.ads492BOM_PTR.AsString;
      open;
      if not IsEmpty then
      begin
       edit;
       if (self.ads492ttype.Value=2) then
        fieldbyname('qty_remaked').AsInteger:=fieldbyname('qty_remaked').AsInteger-
                                               self.ads492ORD_REQ_QTY.Value
       else
        fieldbyname('qty_reworked').AsInteger:=fieldbyname('qty_reworked').AsInteger-
                                             self.ads492ORD_REQ_QTY.Value;
        fieldbyname('status').AsInteger:=2;
       post;
      end;
     end;

  dm.ADOConnection1.CommitTrans;
  self.ModalResult:=mrok;
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

 end;

end;



procedure TForm_cancelcutno.PopupMenu1Popup(Sender: TObject);
begin
if not self.ads492.IsEmpty then
 if (self.ads492ttype.Value=3) then //返修投产不可以修改数量
  n1.Enabled:=false
 else
  if (self.ads06PROD_STATUS.Value=2) or
   (self.ads06PROD_STATUS.Value=3) then
   n1.Enabled:=true
  else
   n1.Enabled:=false
else
 n1.Enabled:=false;
end;

procedure TForm_cancelcutno.ads492CalcFields(DataSet: TDataSet);
begin
if self.ads492ORD_REQ_QTY.Value>0 then
 self.ads492ct_rate.Value:=
 (self.ads492ISSUED_QTY.Value-self.ads492ORD_REQ_QTY.Value)/
  self.ads492ORD_REQ_QTY.Value*100;
end;

procedure TForm_cancelcutno.N1Click(Sender: TObject);
var
 sql_str,new_pnl:string;

begin
sql_str:=dm.find_wip_code;
 if sql_str<>'' then
 begin
  showmsg('在制品正在盘点不允许取消,盘点代码:'+sql_str,1);
  exit;
 end;
new_pnl:=self.ads06PANELS.AsString;
if InputQuery('信息输入', '请输入工单PNL数量:', new_pnl)then
 begin
  try
   strtoint(new_pnl);
  except
   showmsg('PNL数量输入格式错误,只能输入整数!',1);
   exit;
  end;

  if strtoint(new_pnl)>self.ads06REMARK_PNLS.AsInteger then
   begin
    showmsg('投产数量只能在原基础上改少!',1);
    exit;
   end;
  if strtoint(new_pnl) < 0  then
   begin
    showmsg('投产PNL数量不能为负数!',1);
    exit;
   end;

   sql_str:='SELECT data0492.tstatus '+
   'FROM data0492 '+
   'where data0492.rkey='+self.ads492rkey.AsString;
   openquery(dm.ADOQuery1,sql_str);
   if dm.ADOQuery1.FieldByName('tstatus').AsInteger<>self.ads492tstatus.Value then
   begin
    showmsg('配料单状态发生变化,操作不能进行!',1);
    exit;
   end;

  if self.guoshu('',1,self.ads06RKEY.Value) then
   begin
    showmsg('作业单已产生过数记录无法修改',1);
    exit;
   end;
  if self.baofei('',1,self.ads06RKEY.Value) then
   begin
    showmsg('作业单已产生报废记录无法修改',1);
    exit;
   end;
  if self.fenpei('',1,self.ads06RKEY.Value) then
   begin
    showmsg('作业单已产生内层分配记录无法修改',1);
    exit;
   end;

  try
  dm.ADOConnection1.BeginTrans;
  self.ads492.Edit;
  if self.ads06PANEL_A_B.Value=0 then
   self.ads492PANEL_1_QTY.Value:=self.ads492PANEL_1_QTY.Value-
                                 self.ads06PANELS.Value+strtoint(new_pnl)
  else
   self.ads492PANEL_2_QTY.Value:=self.ads492PANEL_2_QTY.Value-
                                 self.ads06PANELS.Value+strtoint(new_pnl);
  self.ads492ISSUED_QTY.Value:=self.ads492ISSUED_QTY.Value-
                               self.ads06QUAN_SCH.AsInteger+
                               strtoint(new_pnl)*self.ads06PARTS_PER_PANEL.AsInteger;

  if self.ads06PROD_STATUS.Value=2 then
   self.ads492waitfor_release.Value:=self.ads492waitfor_release.Value-
                                self.ads06QUAN_SCH.AsInteger+
                                strtoint(new_pnl)*self.ads06PARTS_PER_PANEL.AsInteger
  else
   self.ads492WIP_QTY.Value:=self.ads492WIP_QTY.Value-
                                self.ads06QUAN_SCH.AsInteger+
                                strtoint(new_pnl)*self.ads06PARTS_PER_PANEL.AsInteger;
  self.ads492.Post;

  sql_str:='SELECT data0491.APP_QUAN '+    //修改491
   'FROM data0491 '+
   'where data0491.MO_PTR='+self.ads492rkey.AsString;
   openquery(dm.ADOQuery1,sql_str);
  if not dm.ADOQuery1.IsEmpty then
   begin
    dm.ADOQuery1.Edit;
    dm.ADOQuery1.FieldByName('APP_QUAN').AsInteger:=
             self.ads492ISSUED_QTY.Value-self.ads492ORD_REQ_QTY.Value;
    dm.ADOQuery1.Post;
   end;

  with dm.ADOQuery1 do //修改60，内层作业单修改不需要修改订单投产数量
   begin
    close;
    sql.Text:='select issued_qty'+#13+
               'from data0060 where sales_order='+quotedstr(self.ads492SO_NO.Value)+#13+
               'and data0060.CUST_PART_PTR='+self.ads492BOM_PTR.AsString;

    open;
    if not isempty then
     begin
      edit;
      fieldbyname('issued_qty').AsInteger:=fieldbyname('issued_qty').AsInteger-
                                  self.ads06QUAN_SCH.AsInteger+
                                  strtoint(new_pnl)*self.ads06PARTS_PER_PANEL.AsInteger;
      post;
     end;
   end;

 //增加日志记录data0117
  with dm.ADOQuery1 do
  begin
   close;
   sql.Text:='INSERT INTO Data0117 (SOURCE_PTR,SOURCE_TYPE,EMPL_PTR,TDATE,ACTION,remark) '+
             'values('+self.ads06RKEY.AsString+','+'2,'+user_ptr+','+
             quotedstr(FormatDateTime('YYYY-MM-DD HH:NN:SS',getsystem_date(dm.ADOQuery3,0)))+','+
             '8,'+quotedstr('作业单数量修改原PNL:'+ads06PANELS.AsString+'新PNL:'+new_pnl)+')';
   ExecSQL;
  end;

  self.ads06.Edit;
  self.ads06PANELS.Value:=strtoint(new_pnl);
  self.ads06QUAN_SCH.AsInteger:=strtoint(new_pnl)*self.ads06PARTS_PER_PANEL.AsInteger;
  if strtoint(new_pnl)=0 then
   self.ads06PROD_STATUS.Value:=202;    //取消
  self.ads06.Post;

  if self.ads06PROD_STATUS.Value=3 then
  with dm.ADOQuery1 do                 //修改56在线作业单
   begin
    close;
    sql.Text:='SELECT QTY_BACKLOG, PANELS '+
              'FROM  dbo.Data0056 where WO_PTR='+self.ads06RKEY.AsString;
    open;
    if not isempty then
    begin
     edit;
     fieldbyname('PANELS').AsInteger:=self.ads06PANELS.Value;
     fieldbyname('QTY_BACKLOG').AsInteger:=self.ads06QUAN_SCH.AsInteger;
     post;
    end;
   end
  else
  if self.ads06PROD_STATUS.Value=202 then
  with dm.ADOQuery1 do                 //删除56在线作业单
   begin
    close;
    sql.Text:='delete data0056 '+
              'where WO_PTR='+self.ads06RKEY.AsString;
    ExecSQL;
   end;


  dm.ADOConnection1.CommitTrans;
  showmsg('修改操作成功!',1);
  except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;
 end;


end;

procedure TForm_cancelcutno.ads492AfterScroll(DataSet: TDataSet);
begin
self.ads06.close;
self.ads06.Parameters[0].Value:=self.ads492CUT_NO.Value;
self.ads06.Open;
end;

end.
