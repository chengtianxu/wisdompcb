unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, Mask, DBCtrls,
  ComCtrls, Menus, DB, ADODB,StrUtils, DBGridEh;

type
  TForm1 = class(TForm)
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn5: TBitBtn;
    DBGridEh1: TDBGridEh;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N1Click(Sender: TObject);
//    procedure N2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
    PreColumn: TColumnEh;
    field_name:string;
    cloumn_no:byte;
    rkey15:array of integer;
    strSQLTxt:string;
    StartDate,EndDate:TDatetime;
  public
    { Public declarations }
   employee_rkey,dept_rkey:integer;
   server_date,long_server_date:tdatetime;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
  end;

var
  Form1: TForm1;

implementation

uses damo, cust_search, pact_matter, cancel_so,common,DateUtils, PasQuery;

{$R *.dfm}

procedure TForm1.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
// if Message.Msg = WM_MOUSEWHEEL then
//  begin
//   IsNeg := Short(Message.WParamHi) < 0;
//   if IsNeg then
//     DBGrid1.DataSource.DataSet.MoveBy(1)
//   else
//     DBGrid1.DataSource.DataSet.MoveBy(-1)
//  end
// else
//   OldGridWnd(Message);
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 application.Terminate;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  if not app_init_2(dm.ADOConnection1) then
  begin
   ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
   application.Terminate;
  end;

//  user_ptr:='1752';
//  rkey73:='1593';
//  vprev:='4';
//  dm.ADOConnection1.Open;

  self.Caption:=application.Title;
end;                                                               

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(dm.ado97.SQL.Text);
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
if dm.ADO97.IsEmpty then
 begin
  n1.Enabled:=false;
 end
else
 begin
  if dm.ADO97auth_flag.Value='已评审' then // 如果已审批
   n1.Enabled:=false
  else
   n1.Enabled:=true;   //订单审批可用

 end;
end;

procedure TForm1.N1Click(Sender: TObject);  //评审
var
 bar_text,str:string;
 due:Boolean;
 send_msg:tstringlist;
 rkey14,rk73:Integer;
begin

   try
    form2 := tform2.Create(application);

    with DM.TIMEqry1 do             //---更新日期变量
    begin
        close;
        sql.Text:='select getdate() as sys_date';
        open;
        server_date:=DateOf(fieldvalues['sys_date']);
        long_server_date:= fieldvalues['sys_date'];
    end;

    dm.ado89.Open;      //打开参数
    dm.ADO90.Open;      //打评审信息表
    dm.ADO62.Open;      //工具费用表
    dm.ADO38.Open;      //流程


    dm.ADO360.Close;               //计划完工
    dm.ADO360.Parameters[0].Value:=dm.ADO97rkey60.Value;
    dm.ADO360.Open;


      try
      if not dm.aq_total360.Active  then        //计划完工图表
       begin
        dm.aq_total360.Close;
        dm.aq_total360.Parameters[0].Value:=server_date;
        dm.aq_total360.Parameters[1].Value:=server_date;
        dm.aq_total360.Open;
       end;
     except
     end;

      dm.ADOQuery2.Open;

      if strtoint(vprev)<=2 then  form2.DBGrid2.Visible:=false;
      dm.ADO6090.Close;
      dm.ADO6090.Parameters.ParamByName('rkey34').Value := self.dept_rkey;
      dm.ADO6090.Parameters.ParamByName('rkey50').Value := dm.ADO97cust_part_ptr.Value;
      dm.ADO6090.Parameters.ParamByName('rkey97').Value := dm.ADO97rkey97.Value;
      dm.ADO6090.Open;    //查找同一客户订单同一板号的so
//      bar_text := bar1.SimpleText;

      if dm.ADO97if_puthdate.Value=1 then  //如果部门有权评审交期
       begin
        form2.DateTimePicker2.Date := dm.ADO97ORIG_SCHED_SHIP_DATE.Value;
        form2.DateTimePicker2.Visible := true;
        form2.Label3.Visible := true;
        if dm.ADO97CONSUME_FORECASTS.Value=1 then
         form2.CheckBox1.Visible:=true;
       end;

      if form2.ShowModal=mrok then
      begin
//        if dm.ADO6090.RecordCount = 1 then
//        begin
//          dm.Aq6090.Close;             //查找出订单还未评审的部门
//          dm.Aq6090.Parameters[0].Value := dm.ADO97rkey60.Value;
//          dm.Aq6090.Open;
//          dm.ADO97.Edit;
//          dm.ADO97user_ptr.Value := employee_rkey;      //评审员工 90
//          dm.ADO97auth_date.Value := long_server_date;  //评审日期 90
//          if dm.ADO97if_puthdate.Value=1 then
//           dm.ADO97sch_date.Value := strtodate(datetostr(form2.DateTimePicker2.Date));//60
//          if dm.Aq6090.RecordCount=1 then dm.ADO97quote_price.Value := 1;
//          dm.ADO97.Post;
//        end
//        else
//        if messagedlg('板号'+trim(dm.ADO97MANU_PART_NUMBER.Value)+
//          '在同一客户订单'+trim(dm.ADO97PO_NUMBER.Value)+
//          '有多个交货期的销售订单，是否同时通评审？',mtconfirmation,[mbYes,mbNo],0)=mryes then
//          begin
//           while not dm.ADO6090.Eof do
//            begin
//             dm.Aq6090.Close;    //查找出订单还未评审的部门
//             dm.Aq6090.Parameters[0].Value := dm.ADO6090rkey60.Value;
//             dm.Aq6090.Open;
//             dm.ADO6090.Edit;
//             dm.ADO6090user_ptr.Value := employee_rkey;//90
//             dm.ADO6090auth_date.Value := long_server_date;//90
//             if dm.ADO97if_puthdate.Value=1 then
//              begin
//              due:=true;
//              while due do
//               begin
//                str:=dm.ADO6090ORIG_SCHED_SHIP_DATE.AsString;
//                if inputquery('回复客户交货期','请输入订单'+trim(dm.ADO6090sales_order.Value)+'交货期:',str) then
//                try
//                 dm.ADO6090sch_date.Value:=strtodate(str);
//                 due:=false;
//                except
//                 showmessage('日期格式不正确请重新输入');
//                end;
//               end;
//              end;
//             if dm.aq6090.RecordCount = 1 then //如果该订单的未评审部门只有最后一个了
//              dm.ADO6090QUOTE_PRICE.Value := 1;
//             dm.ADO6090.Post;
//             dm.ADO6090.Next;
//            end;
//            dm.ADO97.Close;
//            dm.ADO97.Open;
//          end
//        else
//          begin
           dm.Aq6090.Close;             //查找出订单还未评审的部门
           dm.Aq6090.Parameters[0].Value := dm.ADO97rkey60.Value;
           dm.Aq6090.Open;
           dm.ADO97.Edit;
           dm.ADO97user_ptr.Value := employee_rkey;      //评审员工 90
           dm.ADO97auth_date.Value := long_server_date;  //评审日期 90
           if dm.ADO97if_puthdate.Value=1 then
            dm.ADO97sch_date.Value := strtodate(datetostr(form2.DateTimePicker2.Date));//60
           if dm.Aq6090.RecordCount=1 then dm.ADO97quote_price.Value := 1;
           dm.ADO97.Post;
//          end;
       end;
//20160905tang添加只要订单评审状态=1已评审将发送一条ERP信息给订单创建者-----
       if DM.ADO97quote_price.Value=1 then
       begin
          send_msg:=tstringlist.Create;
          send_msg.Text:='';
          send_msg.Add('本厂编号【'+DM.ADO97MANU_PART_NUMBER.AsString+'】客户型号【'+DM.ADO97MANU_PART_DESC.AsString
          +'】客户订单号【'+DM.ADO97PO_NUMBER.AsString+'】销售单号【'+DM.ADO97SALES_ORDER.AsString+'】已评审通过！');
          with dm.tmp do
          begin
            close;
            sql.Clear;
            sql.Add('select * from data0014 where rkey is null');
            open;
            append;
            fieldvalues['MESSAGE'] := send_msg.Text;
            fieldvalues['whosend']:= rkey73;
            post;
            rkey14:=fieldvalues['rkey'];
          end;
          DM.tmp.Close;
          dm.tmp.SQL.Clear;
          dm.tmp.SQL.Text:='select data0073.Rkey from data0005 inner join data0073 on data0005.Rkey=data0073.EMPLOYEE_PTR where data0005.Rkey='+dm.ado97ENTERED_BY_EMPL_PTR.AsString;
          dm.tmp.Open;
          rk73:=dm.tmp.FieldBYName('Rkey').AsInteger;
          with dm.tmp do
          begin
            dm.tmp.close;
            dm.tmp.SQL.Clear;
            dm.tmp.sql.Text:='insert into data0314 (emp_ptr,d14_ptr) Values(:emp_ptr,:d14_ptr)';
            dm.tmp.Parameters.ParamByName('emp_ptr').Value:=rk73;
            dm.tmp.Parameters.ParamByName('d14_ptr').Value:=rkey14;
            dm.tmp.ExecSQL;
          end;
       end;
//end 20160905--------------------------------------------------------------
       dm.ado89.close;      //关闭参数
       dm.ADO90.close;      //关闭评审信息表
       dm.ADO62.Close;      //关闭工具费用
       dm.ADOQuery2.Close;   //关闭订单用量
       dm.ADO38.Close;       //关闭工艺流程
       dm.ADO360.Close;
       dm.aq_total360.Close;
//       bar1.SimpleText := bar_text+' ';
//       bar1.SimpleText := trim(bar1.SimpleText);
     finally
      form2.Free;
     end;

end;

procedure TForm1.FormShow(Sender: TObject);
var
 i:integer;
begin
 if dm.Adoconnection1.Connected then
  begin
  strSQLTxt:=dm.ADO97.SQL.Text;
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select data0073.employee_ptr,data0005.employee_id,data0034.dept_name');
   sql.Add('from data0073 inner join data0005');
   sql.Add('on data0073.employee_ptr=data0005.rkey,data0034');
   sql.Add('where data0005.employee_id=data0034.rkey');
   sql.Add('and data0073.rkey='+rkey73);
   open;
   employee_rkey:=fieldvalues['employee_ptr']; //员工指针
   dept_rkey:=fieldvalues['employee_id'];      //部门指针
   self.Caption:=fieldvalues['dept_name']+self.Caption;
  end;
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select getdate() as v_date');
   open;
   server_date:=strtodate(datetostr(fieldvalues['v_date']));//短格式
   long_server_date:=fieldvalues['v_date'];               //长格式
  end;
 dm.ADO97.Close;
 dm.ADO97.Parameters.ParamByName('dtpk1').Value:=server_date;
 dm.ADO97.Parameters.ParamByName('dtpk2').Value:=server_date+1;
 dm.ADO97.Parameters.ParamByName('rkey34_1').Value:=dept_rkey;
 dm.ADO97.Open;

 if strtoint(vprev)<=2 then
  begin
   DBGridEh1.Columns[6].Visible:=false;
   form1.Width:=form1.Width-66;
  end;

  field_name := DBGridEh1.Columns[0].FieldName;
  PreColumn := DBGridEh1.Columns[0] ;
  PreColumn.Title.Color := clred ;
 end;
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
//var
// searchoption:tlocateoptions;
begin
// searchoption:=[lopartialkey];
//if Key = Chr(vk_Back) then       //如果按下了backspace
// begin
//  if length(bar1.SimpleText)>5 then
//   bar1.SimpleText:=copy(bar1.SimpleText,1,length(bar1.SimpleText)-1);
//  if length(bar1.SimpleText)>5 then
//   begin
//    case self.cloumn_no of
//    0:dm.ADO97.Locate('sales_order',copy(bar1.SimpleText,6,length(bar1.SimpleText)),searchoption);
//    1:dm.ADO97.Locate('customer_part_number',copy(bar1.SimpleText,6,length(bar1.SimpleText)),searchoption);
//    2:dm.ADO97.Locate('po_number',copy(bar1.SimpleText,6,length(bar1.SimpleText)),searchoption);
//    end;
//   end
//  else
//   dm.ADO97.First
// end
//else
//  begin
//   bar1.SimpleText := bar1.SimpleText+key;
//    case self.cloumn_no of
//    0:dm.ADO97.Locate('sales_order',copy(bar1.SimpleText,6,length(bar1.SimpleText)),searchoption);
//    1:dm.ADO97.Locate('customer_part_number',copy(bar1.SimpleText,6,length(bar1.SimpleText)),searchoption);
//    2:dm.ADO97.Locate('po_number',copy(bar1.SimpleText,6,length(bar1.SimpleText)),searchoption);
//    end;
//  end;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var
 rkey60:integer;
begin
 rkey60:=dm.ADO97rkey60.Value;
dm.ado97.Close;
dm.ADO97.Open;
if rkey60 > 0 then
dm.ADO97.Locate('rkey60',rkey60,[]);
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
begin
if column.FieldName='SALES_ORDER' then
 begin
  cloumn_no:=0;
   with dm.ADO97 do
    begin
     close;
     sql.Delete(sql.Count-1);
     sql.add('ORDER BY Data0060.SALES_ORDER');
     open;
    end;
 end
else
 if column.FieldName='CUSTOMER_PART_NUMBER' then
  begin
   cloumn_no:=1;
   with dm.ADO97 do
    begin
     close;
     sql.Delete(sql.Count-1);
     sql.add('ORDER BY Data0050.CUSTOMER_PART_NUMBER');
     open;
    end;
  end
 else
 if column.FieldName='PO_NUMBER' then
  begin
   cloumn_no:=2;
   with dm.ADO97 do
    begin
     close;
     sql.Delete(sql.Count-1);
     sql.add('ORDER BY Data0097.PO_NUMBER');
     open;
    end;
  end;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
dm.ado60_cancel.Close;
dm.ado60_cancel.Parameters[0].Value := self.dept_rkey;
dm.ado60_cancel.Open;

if not dm.ado60_cancel.IsEmpty then
 begin
  form3:=tform3.Create(application);
  form3.ShowModal;
  dm.ado60_cancel.Close;
  dm.ado97.Close;
  dm.ADO97.Open;
  form3.Free;
 end
else
 begin
  showmessage('对不起，没有找到已评审未投产的订单');
 end;
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
begin
if Msg_Dlg_Ask('确认导出 ? ','提示',1) then
try
  Export_dbGridEH_to_Excel(DBGridEh1,self.Caption) ;
except
end;
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
var i:Integer;
    Sqlstr:string;
begin
  if FrmQuery=nil then  FrmQuery:=TFrmQuery.Create(Application);
  if StartDate > 100 then
    FrmQuery.DateTimePicker1.Date:= StartDate
  else
    FrmQuery.DateTimePicker1.Date:=StartOfTheMonth(now);
  if EndDate > 100 then
    FrmQuery.DateTimePicker2.Date:= EndDate
  else
    FrmQuery.DateTimePicker2.Date:=EndOfTheMonth(Now);
  FrmQuery.ListBox3.ItemIndex := FrmQuery.iItem;
  if FrmQuery.ShowModal=mrok then
  begin
    screen.Cursor:=crHourGlass;
    for i:=1 to FrmQuery.SGrid1.RowCount-2 do
    if FrmQuery.sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+FrmQuery.sgrid1.Cells[2,i];
    try
      DM.ADO97.DisableControls;
      DM.ADO97.Close;
      DM.ADO97.SQL.Clear;
      DM.ADO97.SQL.Text:=strSQLTxt+Sqlstr+' ORDER BY Data0060.SALES_ORDER';
      dm.ADO97.Parameters.ParamByName('dtpk1').Value:=FrmQuery.DateTimePicker1.Date;
      dm.ADO97.Parameters.ParamByName('dtpk2').Value:=FrmQuery.DateTimePicker2.Date+1;
      dm.ADO97.Parameters.ParamByName('rkey34_1').Value:=dept_rkey;
      StartDate:=FrmQuery.DateTimePicker1.Date;
      EndDate:=FrmQuery.DateTimePicker2.Date;
      DM.ADO97.Prepared;
      DM.ADO97.Open;
    finally
      DM.ADO97.EnableControls;
    end;
    screen.Cursor:=crDefault;
  end;
end;

procedure TForm1.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
 if (Trim(dm.ADO97so_oldnew.AsString)='新单') then
 begin
  DBGridEh1.Canvas.Font.Color := clred;
 end;
  DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm1.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(dm.ado97.SQL.Text);
end;

procedure TForm1.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    dm.ado97.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    dm.ado97.Sort:=Column.FieldName+' DESC';
  end;
  if (PreColumn.FieldName<>column.FieldName)  and
     (column.Field.DataType in [ftString,ftWideString])
      then
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
  if Trim(Edit1.Text)<>'' then
    DM.ado97.Filter:=preColumn.FieldName+' like ''%'+ Trim(Edit1.Text)+'%'''
  else
    DM.ado97.Filter:='';
end;

end.
