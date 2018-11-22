unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ExtCtrls, StdCtrls, Buttons, Menus, ComCtrls,DB;

type
  TFrm_main = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    Popup1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    Panel3: TPanel;
    BitBtn3: TBitBtn;
    N4: TMenuItem;
    N5: TMenuItem;
    BitBtn6: TBitBtn;
    PopupMenu2: TPopupMenu;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure dtpk1Change(Sender: TObject);
    procedure dtpk2Change(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name:string;
    procedure item_click(sender: TObject);
    { Private declarations }
  public
    { Public declarations }
    v_date:string;
    iGrid,iLocate,i60Locate:Integer;
  end;

var
  Frm_main: TFrm_main;

implementation

uses dmo,common, Delivery;

{$R *.dfm}
procedure TFrm_main.item_click(Sender: TObject);
var
  i:byte;
begin
  (Sender as TmenuItem).Checked := not ((Sender as TmenuItem).Checked);
  if (Sender as TmenuItem).Checked then
  begin
    for i := 0 to DBGridEh1.FieldCount - 1 do
    if DBGridEh1.Columns[i].Title.Caption = (Sender as TmenuItem).Caption then
    begin
      DBGridEh1.Columns[i].Visible := True ;
      Break;
    end ;
  end
  else
  begin
    for i := 0 to DBGridEh1.FieldCount - 1 do
    if DBGridEh1.Columns[i].Title.Caption = (Sender as TmenuItem).Caption then
    begin
      DBGridEh1.Columns[i].Visible := False ;
      Break;
    end ;
  end ;
end;

procedure TFrm_main.FormCreate(Sender: TObject);
begin
  if not app_init_2(dm.ADOConnection1) then
  begin
    showmsg('程序起动失败,请联系管理员!',1);
    application.Terminate;
  end;

//  DM.ADOConnection1.Open;
//  vprev:='4';
//  rkey73:='3';
//  user_ptr:='3';

  self.Caption:=application.Title;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
end;

procedure TFrm_main.FormShow(Sender: TObject);
var
 i:integer;
 item:TMenuItem;
begin
  if dm.ADOConnection1.Connected then
  begin
    with dm.adoquery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select getdate() as v_date');
      open;                                 //全局变量
      v_date:=datetostr(fieldvalues['v_date']);//短日期格式
      dtpk1.Date:=StrToDate(FormatDateTime('yyyy-mm-dd',StrToDate(v_date)-15));
      dtpk2.Date:=StrToDate(FormatDateTime('yyyy-mm-dd',StrToDate(v_date)));
    end;
//    with dm.adoquery1 do
//    begin
//      close;
//      sql.Clear;
//      sql.Add('select EMPLOYEE_PTR from data0073');
//      sql.Add('where rkey='+rkey73);
//      open;
//      user_ptr:=fieldbyname('employee_ptr').asstring;
//    end;
    DM.ADO60.Close;
    DM.ADO60.Parameters[0].Value:=StrToDate(FormatDateTime('yyyy-mm-dd',dtpk1.Date));
    DM.ADO60.Parameters[1].Value:=StrToDate(FormatDateTime('yyyy-mm-dd',dtpk2.Date+1));
    DM.ADO60.Open;
    DM.ADO174.Open;
    DM.ADO175.Open;
    field_name := DBGridEh1.Columns[0].FieldName;
    PreColumn := DBGridEh1.Columns[0];
    DBGridEh1.Columns[0].Title.Color := clred ;
    Label1.Caption:=preColumn.Title.Caption;
    iGrid:=0;
    iLocate:=0;
    for i:=0 to DBGridEh1.Columns.Count-1 do
    begin
      DBGridEh1.Columns[i].Tag:=i;
      item := TmenuItem.Create(self) ;
      item.Tag:=i;
      item.Caption := DBGridEh1.Columns[i].Title.Caption;
      item.Checked :=DBGridEh1.Columns[i].Visible ;
      item.OnClick := item_click ;
      self.PopupMenu2.Items.Add(item) ;
    end;
  end;
end;

procedure TFrm_main.DBGridEh1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
//  iLocate:=DM.ADO60RKEY.Value;
//  i60Locate:=dm.ADO60.RecNo;
//  if (iGrid=0) then
//  begin
//    if (DBGridEh1.DataSource.DataSet.FieldByName('status').AsString='已审核')  then
//    begin
//      DBGridEh2.DataSource:=dm.DataSource2;
//      DM.ADO360.Close;
//      DM.ADO360.Parameters[0].Value:=DM.ADO60RKEY.Value;
//      DM.ADO360.Open;
//    end else
//    if (DBGridEh1.DataSource.DataSet.FieldByName('status').AsString='待审核') then
//    begin
//      with dm.adoquery1 do
//      begin
//        close;
//        sql.Clear;
//        sql.Add('select * from dbo.data0174 where so_ptr='''+IntTostr(DM.ADO60RKEY.Value)+''' order by Rkey');
//        open;
//      end;
//      DBGridEh2.DataSource:=dm.DataSource3;
//      DM.ADO175.Close;
//      DM.ADO175.Parameters[0].Value:=DM.ADOQuery1.FieldByName('Rkey').Value;
//      DM.ADO175.Open;
//    end;
//  end else
//  if (iGrid=1) then
//  begin
//    if (DBGridEh1.DataSource.DataSet.FieldByName('status').AsString='已审核')  then
//    begin
//      DBGridEh2.DataSource:=dm.DataSource2;
//      DM.ADO360.Close;
//      DM.ADO360.Parameters[0].Value:=DM.ADO60RKEY.Value;
//      DM.ADO360.Open;
//    end else
//    if (DBGridEh1.DataSource.DataSet.FieldByName('status').AsString='待审核') then
//    begin
//      with dm.adoquery1 do
//      begin
//        close;
//        sql.Clear;
//        sql.Add('select * from dbo.data0174 where so_ptr='''+IntTostr(DM.ADO60RKEY.Value)+''' order by Rkey');
//        open;
//      end;
//      DM.ADO175.Close;
//      DM.ADO175.Parameters[0].Value:=DM.ADOQuery1.FieldByName('Rkey').Value;
//      DM.ADO175.Open;
//      DBGridEh2.DataSource:=dm.DataSource3;
//    end;
//  end;
end;

procedure TFrm_main.BitBtn1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrm_main.BitBtn2Click(Sender: TObject);
begin
  DM.ADO60.Close;
  DM.ADO60.Parameters[0].Value:=StrToDate(FormatDateTime('yyyy-mm-dd',dtpk1.Date));
  DM.ADO60.Parameters[1].Value:=StrToDate(FormatDateTime('yyyy-mm-dd',dtpk2.Date+1));
  DM.ADO60.Open;
//  if not dm.ADO60.IsEmpty then
//  begin
//    if (iGrid=0) and (iLocate=0) then
//    begin
//      DBGridEh2.DataSource:=dm.DataSource2;
//      DM.ADO360.Close;
//      DM.ADO360.Parameters[0].Value:=DM.ADO60RKEY.Value;
//      DM.ADO360.Open;
//    end else
//    if (iGrid=0) and (iLocate<>0) then
//    begin
//      dm.ADO60.RecNo:=i60Locate;
//      DM.ADO360.Close;
//      DM.ADO360.Parameters[0].Value:=iLocate;
//      DM.ADO360.Open;
//      if (DBGridEh1.DataSource.DataSet.FieldByName('status').AsString='已审核')  then
//      begin
//        DBGridEh2.DataSource:=dm.DataSource2;
//        DM.ADO360.Close;
//        DM.ADO360.Parameters[0].Value:=iLocate;
//        DM.ADO360.Open;
//        dm.ADO60.RecNo:=i60Locate;
//      end else
//      if (DBGridEh1.DataSource.DataSet.FieldByName('status').AsString='待审核') then
//      begin
//        with dm.adoquery1 do
//        begin
//          close;
//          sql.Clear;
//          sql.Add('select * from dbo.data0174 where so_ptr='''+IntTostr(iLocate)+''' order by Rkey');
//          open;
//        end;
//        DBGridEh2.DataSource:=dm.DataSource3;
//        DM.ADO175.Close;
//        DM.ADO175.Parameters[0].Value:=DM.ADOQuery1.FieldByName('Rkey').Value;
//        DM.ADO175.Open;
//        dm.ADO60.RecNo:=i60Locate;
//      end;
//    end else
//    if (iGrid=1) and (iLocate=0) then
//    begin
//      DM.ADO175.Close;
//      DM.ADO175.Parameters[0].Value:=IntTostr(DM.ADO174rkey.Value);
//      DM.ADO175.Open;
//      DBGridEh2.DataSource:=dm.DataSource3;
//      iLocate:=0;
//      DM.ADO60.RecNo:=DM.ADO60.RecordCount;
//    end else
//    if (iGrid=1) and (iLocate<>0) then
//    begin
//      with dm.adoquery1 do
//      begin
//        close;
//        sql.Clear;
//        sql.Add('select * from dbo.data0174 where so_ptr='''+IntTostr(iLocate)+''' order by Rkey');
//        open;
//      end;
//      DM.ADO175.Close;
//      DM.ADO175.Parameters[0].Value:=DM.ADOQuery1.FieldByName('Rkey').Value;
//      DM.ADO175.Open;
//      DBGridEh2.DataSource:=dm.DataSource3;
//      dm.ADO60.RecNo:=i60Locate;
//      iGrid:=0;
//    end;
//  end
//  else
//  begin
//    dm.ADO60.Close;
//    DM.ADO360.Close;
//  end;
end;

procedure TFrm_main.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if column.Title.SortMarker =smUpEh then
  begin
    DM.ADO60.IndexFieldNames:=Column.FieldName+' DESC';
    Column.Title.SortMarker:=smDownEh;
  end
  else
  begin
    DM.ADO60.IndexFieldNames:=Column.FieldName;
    Column.Title.SortMarker:=smUpEh;
  end;
  if Column.Tag<>1 then
  begin
  if (PreColumn.FieldName<>column.FieldName)  and
     (column.Field.DataType in [ftString,ftWideString]) then
    begin
      Label1.Caption:=Column.Title.Caption;
      Column.Title.Color:=clRed;
      preColumn.Title.Color:=clBtnFace;
      preColumn:=Column;
      Edit1Change(Edit1);
      Edit1.SetFocus;
    end;
  end;
end;
procedure TFrm_main.Edit1Change(Sender: TObject);
begin
  if Trim(Edit1.Text)<>'' then
    DM.ADO60.Filter:=preColumn.FieldName+' like ''%'+ Trim(Edit1.Text)+'%'''
  else
    DM.ADO60.Filter:='';
end;

procedure TFrm_main.dtpk1Change(Sender: TObject);
begin
  iLocate:=0;
  BitBtn2Click(nil);
end;

procedure TFrm_main.dtpk2Change(Sender: TObject);
begin
  iLocate:=0;
  BitBtn2Click(nil); 
end;

procedure TFrm_main.N1Click(Sender: TObject);
begin
  if (strtoint(vprev)<>2) and (strtoint(vprev)<>4)  then
  begin
    messagedlg('对不起,您的权限不够',mtinformation,[mbok],0);
    Exit;
  end;
  Frm_Delivery:=TFrm_Delivery.Create(Application);
  Frm_Delivery.Edit1.Enabled:=True;
  Frm_Delivery.dtpk1.Date:=StrToDate(v_date);
  dm.ADO174.Append;
  with dm.ADO360 do
  begin
    Close;
    Parameters[0].Value:=null;
    Open;
  end;
  Frm_Delivery.DBGridEh1.DataSource:=dm.DataSource2;
  if Frm_Delivery.ShowModal=mrok then
  begin
    try
      dm.ADOConnection1.BeginTrans;
      DM.ADO174so_ptr.Value:=Frm_Delivery.Edit1.Tag;
      dm.ADO174proposer.Value:=StrToInt(user_ptr);
      DM.ADO174proposer_Date.Value:=StrToDate(v_date);
      DM.ADO174oldReply_Date.Value:=StrToDate(FormatDateTime('yyyy-mm-dd',StrToDate(Frm_Delivery.Edit4.Text)));
      dm.ADO174newReply_Date.Value:=StrToDate(FormatDateTime('yyyy-mm-dd',Frm_Delivery.dtpk1.Date));
      dm.ADO174remark.Value:=Frm_Delivery.Memo1.Lines.Text;
      if (Frm_Delivery.CheckBox1.Checked) then
      DM.ADO174planned_FLAG.Value:='Y';
      dm.ADO174.Post;
      dm.ADO360.First;
      while not DM.ADO360.Eof do
      begin
        dm.ADO175.Append;
        DM.ADO175rkey174.Value:=dm.ADO174rkey.Value;
        dm.ADO175sch_date.Value:=dm.ADO360sch_date.Value;
        dm.ADO175quantity.Value:=dm.ADO360quantity.Value;
        dm.ado175.Post;
        dm.ADO175.UpdateBatch();
        dm.ADO360.Next;
      end;
      iGrid:=1;//175
      iLocate:=0;
      dm.ADOConnection1.CommitTrans;
      BitBtn2Click(nil);
      dm.ADO60.RecNo:=DM.ADO60.RecordCount;
//      DM.ADO360.Close;
//      DM.ADO360.Parameters[0].Value:=DM.ADO60RKEY.Value;
//      DM.ADO360.Open;
    except
      on E: Exception do
      begin
        dm.ADOConnection1.RollbackTrans;
        messagedlg(E.Message,mterror,[mbcancel],0);
      end;
    end;
  end;
end;

procedure TFrm_main.N2Click(Sender: TObject);
var
  i:Integer;
begin
  if (strtoint(vprev)<>2) and (strtoint(vprev)<>4)  then
  begin
    messagedlg('对不起,您的权限不够',mtinformation,[mbok],0);
    Exit;
  end;
  if DM.ADO60status.Value='已审核' then
  begin
    messagedlg('对不起,已审核的申请不能编辑',mtinformation,[mbok],0);
    Exit;
  end;
  Frm_Delivery:=TFrm_Delivery.Create(Application);
  with dm.ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select RKEY,SALES_ORDER,PARTS_ORDERED,set_ordered,ORIG_REQUEST_DATE,ORIG_SCHED_SHIP_DATE,SCH_DATE from data0060 where SALES_ORDER='''+dm.ADO60SALES_ORDER.Value+'''');
    Open;
    Frm_Delivery.Edit1.Tag:= Fieldbyname('RKEY').AsInteger;
    Frm_Delivery.Edit1.Text:= Fieldbyname('SALES_ORDER').AsString;
    Frm_Delivery.Edit2.Text:= FieldValues['set_ordered'];
    Frm_Delivery.Edit5.Text:= FieldValues['PARTS_ORDERED'];
    Frm_Delivery.Edit3.Text:= Fieldbyname('ORIG_REQUEST_DATE').AsString;
    Frm_Delivery.Edit6.Text:= Fieldbyname('ORIG_SCHED_SHIP_DATE').AsString;
    Frm_Delivery.Edit4.Text:= Fieldbyname('SCH_DATE').AsString;
    dm.ADO360.Close;
    DM.ado360.Parameters[0].Value:= Fieldbyname('RKEY').AsInteger;
    dm.ADO360.Open;
  end;

  Frm_Delivery.dtpk1.Date:=DM.ADO60newReply_Date.Value;
  Frm_Delivery.Memo1.Lines.Text:=dm.ADO60remark.Value;
  Frm_Delivery.DBGridEh1.DataSource:=dm.DataSource3;
  DM.ADO175.Close;
  DM.ADO175.Parameters[0].Value:=DM.ADO60rkey174.Value;
  dm.ADO175.Open;
  i:=dm.ADO60.RecNo;
  dm.ADO174.Close;
  dm.ADO174.Parameters[0].Value:=DM.ADO60rkey174.Value;
  dm.ADO174.Open;
//20170619tang---
  if (DM.ADO174planned_FLAG.AsString='Y') then
  Frm_Delivery.CheckBox1.Checked:=True
  else
  Frm_Delivery.CheckBox1.Checked:=False;
  Frm_Delivery.Edit1.Enabled:=False;
  if Frm_Delivery.ShowModal=mrok then
  begin
    dm.ado174.Refresh;
    if DM.ADO174status.Value =1 then
    begin
      ShowMessage('此申请已被审核，不能保存！');
      dm.ADO174.Cancel;
      BitBtn2Click(nil);
      DM.ADO60.Open;
      if dm.ADO60.RecordCount>0 then
        dm.ADO60.RecNo:=i;
      DM.ADO360.Close;
      DM.ADO360.Parameters[0].Value:=DM.ADO60RKEY.Value;
      DM.ADO360.Open;
      Exit;
    end;
    dm.ADOConnection1.BeginTrans;
    dm.ADO174.Edit;
    try
      DM.ADO174so_ptr.Value:=DM.ADO60RKEY.Value;
      dm.ADO174proposer.Value:=StrToInt(user_ptr);
      DM.ADO174proposer_Date.Value:=StrToDate(v_date);
      dm.ADO174newReply_Date.Value:=StrToDate(FormatDateTime('yyyy-mm-dd',Frm_Delivery.dtpk1.Date));
      dm.ADO174remark.Value:=Frm_Delivery.Memo1.Lines.Text;
      if (Frm_Delivery.CheckBox1.Checked) then
      DM.ADO174planned_FLAG.Value:='Y'
      else
      DM.ADO174planned_FLAG.Value:='N';
      dm.ADO174.Post;
      dm.ADO174.Refresh;
      dm.ADO175.UpdateBatch();
      dm.ADOConnection1.CommitTrans;
      iGrid:=1;//175
      iLocate:=0;
      BitBtn2Click(nil);
      DM.ADO60.Open;
      if dm.ADO60.RecordCount>0 then
        dm.ADO60.RecNo:=i;
      DM.ADO360.Close;
      DM.ADO360.Parameters[0].Value:=DM.ADO60RKEY.Value;
      DM.ADO360.Open;
    except
      on E: Exception do
      begin
        dm.ADOConnection1.RollbackTrans;
        messagedlg(E.Message,mterror,[mbcancel],0);
      end;
    end;
  end
  else
    DM.ADO174.Cancel;
end;

procedure TFrm_main.N3Click(Sender: TObject);
var
  i:Integer;
  SCH_COMPL_DATE:tdatetime;
begin
  if not DM.ADO60.Eof then
  begin
    if (strtoint(vprev)<>4)  then
    begin
      messagedlg('对不起,您的权限不够',mtinformation,[mbok],0);
      Exit;
    end;
    if DM.ADO60status.Value='已审核' then
    begin
      messagedlg('对不起,该申请已审核',mtinformation,[mbok],0);
      Exit;
    end;
    if messagedlg('是否确定审核此申请?',mtConfirmation,[mbyes,mbno],0)=mryes then
    begin
      i:=DM.ADO60.RecNo;
//      dm.ADOConnection1.BeginTrans;
      try
//        with DM.ADOQuery1 do
//        begin
//          Close;
//          SQL.Clear;
//          SQL.Add('update data0174 set approval='+user_ptr+',approval_date='''+v_date+''',status=1 where rkey='+dm.ADO60rkey174.Text);
//          ExecSQL;
//        end;
//        with dm.ADOQuery1 do
//        begin
//          Close;
//          SQL.Clear;
//          SQL.Add('update data0060 set SCH_DATE='''+FormatDateTime('yyyy-mm-dd',dm.ADO60newReply_Date.Value)+''' where rkey='+dm.ADO60RKEY.Text);
//          ExecSQL;
//        end;
//        if dm.ADO60complete_date.Value<>null then//同步修改计划达成率和客户准交率
//        begin
//         with DM.ADOQuery1 do
//         begin
//          Close;
//          sql.Clear;
//          SQL.Add('update data0060');
////          SQL.Add('set CONSUME_FORECASTS=case when complete_date<= Data0060.ORIG_REQUEST_DATE then 1 ELSE 0 end,');
//          SQL.Add('set reg_tax_fixed_unused =case WHEN complete_date<= Data0060.SCH_DATE THEN 1 ELSE 0 end');
//          SQL.Add('FROM  dbo.Data0060 ');
//          SQL.Add('WHERE rkey='+dm.ADO60RKEY.AsString);
//          ExecSQL;
//         end;
//        end;
//        with dm.ADOQuery1 do      //记录销售订单回复交期更改情况(日志文件)
//        begin
//          close;
//          sql.Clear;
//          sql.Add('insert into data0318 (SALES_ORDER_PTR,TRANS_TYPE,TRANS_DESCRIPTION,');
//          sql.Add('FROM_string,TO_string,USER_PTR,TRANS_DATE,PROGRAM_SOURCE,file_number)');
//          sql.Add('values ('+dm.ADO60rkey.AsString+',4,''更改销售订单回复交期'',');
//          sql.Add(''''+dm.ADO60oldReply_Date.AsString+''','''+FormatDateTime('yyyy-mm-dd',dm.ADO60newReply_Date.AsDateTime)+''','+rkey73+',');
//          sql.add(''''+v_date+''',109,'''+dm.ADO60remark.AsString+''')');
//          ExecSQL;
//        end;
//        with dm.ADOQuery1 do
//        begin
//          close;
//          sql.Clear;
//          sql.Text:= 'SELECT data0006.SCH_COMPL_DATE'+#13+
//                     'FROM dbo.Data0006 INNER JOIN'+#13+
//                     'dbo.data0492 ON dbo.Data0006.CUT_NO = dbo.data0492.CUT_NO INNER JOIN'+#13+
//                     'dbo.Data0025 ON dbo.Data0006.BOM_PTR = dbo.Data0025.RKEY'+#13+
//                     'WHERE (data0492.so_no='+QuotedStr(dm.ADO60SALES_ORDER.Value)+')';
//          open;
//        end;
//        if not dm.ADOQuery1.IsEmpty then
////20170619tang修改
////        if messagedlg('是否同步修改作业单计划完工日期?',mtConfirmation,[mbyes,mbno],0)=mryes then
//        if (DM.ADO60planned_FLAG.AsString='Y') then
//        begin
//          with dm.ADOQuery2 do
//          begin
//            SCH_COMPL_DATE:=dm.ADO60newReply_Date.Value-dm.ADO60MFG_LEAD_TIME.Value-dm.ADO60DAYS_EARLY_SCHEDULE.Value;
//            close;
//            sql.Clear;
//            sql.Text:='update data0006 set data0006.SCH_COMPL_DATE='+QuotedStr(datetostr(SCH_COMPL_DATE))+#13+
//                      'FROM dbo.Data0006 INNER JOIN'+#13+
//                      'dbo.data0492 ON dbo.Data0006.CUT_NO = dbo.data0492.CUT_NO INNER JOIN'+#13+
//                      'dbo.Data0025 ON dbo.Data0006.BOM_PTR = dbo.Data0025.RKEY'+#13+
//                      'WHERE (data0492.so_no='+QuotedStr(dm.ADO60SALES_ORDER.Value)+')';
//            ExecSQL;
//          end;
//          with dm.ADOQuery1 do
//          begin
//            close;
//            SQL.Clear;
//            SQL.Text:='update data0492 set data0492.SCH_COMPL_DATE='+QuotedStr(datetostr(SCH_COMPL_DATE))+#13
//                      +' from dbo.data0492 inner join dbo.data0060 on dbo.data0492.SO_NO=dbo.Data0060.SALES_ORDER'+#13
//                      +'where (data0492.so_no='+QuotedStr(dm.ADO60SALES_ORDER.Value)+')';
//            ExecSQL;
//          end;
//        end;
        with dm.ADOQuery1 do
        begin
          Close;
          SQL.Text:= 'EXEC PROC175 ' + DM.ADO60rkey174.AsString +','+ rkey73;
          ExecSQL;
        end;
//          with dm.ADOQuery1 do
//          begin
//            Close;
//            SQL.Clear;
//            sql.Add('delete data0360 where so_ptr='+dm.ADO60RKEY.Text);
//            ExecSQL;
//          end;
//          with dm.ADOQuery1 do
//          begin
//            Close;
//            SQL.Clear;
//            sql.Add('insert into data0360(so_ptr,sch_date,quantity) ');
//            SQL.Add('select so_ptr,finish_date as sch_date,finish_quantity as quantity from data0174 inner join data0175 on data0175.rkey174=data0174.rkey ');
//            SQL.Add('where data0175.rkey174='+dm.ADO60rkey174.Text);
//            ExecSQL;
//          end;
//          with dm.ADOQuery1 do
//          begin
//            Close;
//            SQL.Clear;
//            sql.Add('update data0360 set planned_qty=1 where so_ptr='+dm.ADO60RKEY.Text);
//            ExecSQL;
//          end;
//         dm.ADOConnection1.CommitTrans;
//        iGrid:=0;//360
        ShowMessage('审核成功！');
        BitBtn2Click(nil);
        dm.ADO60.RecNo:=i;
//        DM.ADO360.Close;
//        DM.ADO360.Parameters[0].Value:=DM.ADO60RKEY.Value;
//        DM.ADO360.Open;
      except
        on E: Exception do
        begin
//          dm.ADOConnection1.RollbackTrans;
          messagedlg(E.Message,mterror,[mbcancel],0);
        end;
      end;
    end;
  end;
end;

procedure TFrm_main.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='S') and (ssalt in shift) then
    showmessage(dm.ADO60.CommandText);
end;
procedure TFrm_main.BitBtn3Click(Sender: TObject);
begin
  if not dm.ADO60.IsEmpty then
    Export_dbGridEH_to_Excel(self.DBGridEh1,self.Caption);
end;

procedure TFrm_main.N5Click(Sender: TObject);
begin
  if not DM.ADO60.Eof then
  begin
    if (strtoint(vprev)<>2) and (strtoint(vprev)<>4)  then
    begin
      messagedlg('对不起,您的权限不够',mtinformation,[mbok],0);
      Exit;
    end;
    if DM.ADO60status.Value='已审核' then
    begin
      messagedlg('对不起,已审核的申请不能删除',mtinformation,[mbok],0);
      Exit;
    end;

    with dm.ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='delete data0175 where Rkey174='+dm.ADO60rkey174.AsString;
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Text:='delete data0174 where rkey='+dm.ADO60rkey174.AsString;
      ExecSQL;
      ShowMessage('删除成功！');
    end;
    iGrid:=0;//360
    BitBtn2Click(nil);
    if (not DM.ADO60.IsEmpty) then
    dm.ADO60.RecNo:=dm.ADO60.RecordCount;
    DM.ADO360.Close;
    DM.ADO360.Parameters[0].Value:=DM.ADO60RKEY.Value;
    DM.ADO360.Open;
  end;
end;

procedure TFrm_main.BitBtn6Click(Sender: TObject);
begin
  popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

end.
