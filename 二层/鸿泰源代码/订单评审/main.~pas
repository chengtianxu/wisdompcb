unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, Mask, DBCtrls,
  ComCtrls, Menus, DB, ADODB;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    bar1: TStatusBar;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    dtpk1: TDateTimePicker;
    DTPk2: TDateTimePicker;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    ComboBox1: TComboBox;
    BitBtn6: TBitBtn;
    N2: TMenuItem;
    btn1: TBitBtn;
    lbl1: TLabel;
    edt1: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dtpk1CloseUp(Sender: TObject);
    procedure dtpk1Exit(Sender: TObject);
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
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure edt1Change(Sender: TObject);
  private
    { Private declarations }
    cloumn_no:byte;
    rkey15:array of integer;
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

uses damo, cust_search, pact_matter, cancel_so,common,DateUtils,so_report,
  Unit4;

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

procedure TForm1.FormActivate(Sender: TObject);
begin
 if trim(bar1.SimpleText)='' then bar1.SimpleText:='搜索:'
 else
  begin
   bar1.SimpleText:=bar1.SimpleText+' ';
   bar1.SimpleText:=trim(bar1.SimpleText);
  end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 application.Terminate;
end;

procedure TForm1.Edit1Click(Sender: TObject);
begin
if edit1.Font.Color=clwindowtext then
 begin
  edit1.SelectAll;
  edit1.Font.Color:=clblue;
 end;
end;

procedure TForm1.Edit1Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn1') and (activecontrol.Name<>'BitBtn2') and (trim(edit1.Text)<>'') then
try
 frm_cust:=tfrm_cust.Create(application);
 frm_cust.adoquery1.close;
 frm_cust.ADOQuery1.Parameters[1].Value:=trim(edit1.Text);
 frm_cust.adoquery1.Open;
 if frm_cust.ADOQuery1.IsEmpty then
  begin
   messagedlg('请输入正确的客户代码!',mtinformation,[mbok],0);
   edit1.SetFocus;
  end
 else
 if comparetext(trim(edit1.text),trim(frm_cust.ADOQuery1.Fieldbyname('cust_code').AsString))=0 then
  begin
   edit1.Text:=frm_cust.ADOQuery1.fieldbyname('cust_code').AsString;
   edit1.Font.Color := clwindowtext;
   label4.Caption := frm_cust.ADOQuery1.fieldbyname('customer_name').AsString;
   with dm.ADO97 do
    begin
     close;
     sql.Delete(sql.Count-3);
     sql.Insert(sql.Count-2,'and Data0060.CUSTOMER_PTR='+frm_cust.ADOQuery1.fieldbyname('rkey').AsString);
     open;
    end;
  end
 else
  begin
   messagedlg('请输入正确的客户代码!',mtinformation,[mbok],0);
   edit1.SetFocus;
  end;
finally
 frm_cust.free;
end
else
 if (activecontrol.Name<>'BitBtn1') and (activecontrol.Name<>'BitBtn2') and (trim(edit1.Text)='') then
  begin
   label4.Caption:='';
   with dm.ADO97 do
    begin
     close;
     sql.Delete(sql.Count-3);
     sql.Insert(sql.Count-2,'');
     open;
    end;
  end;

end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
try
 frm_cust:=tfrm_cust.Create(application);
 frm_cust.adoquery1.close;
 frm_cust.ADOQuery1.Parameters[1].Value:=trim(edit1.Text);
 frm_cust.adoquery1.Open;
 if frm_cust.ADOQuery1.IsEmpty then
  begin
   messagedlg('请输入正确的客户代码!',mtinformation,[mbok],0);
   edit1.SetFocus;
  end
 else
 if frm_cust.ShowModal=mrok then
  begin
   edit1.Text:=frm_cust.ADOQuery1.fieldbyname('cust_code').AsString;
   edit1.Font.Color := clwindowtext;
   label4.Caption := frm_cust.ADOQuery1.fieldbyname('customer_name').AsString;
   with dm.ADO97 do
    begin
     close;
     sql.Delete(sql.Count-3);
     sql.Insert(sql.Count-2,'and Data0060.CUSTOMER_PTR='+frm_cust.ADOQuery1.fieldbyname('rkey').AsString);
     open;
    end;
   dbgrid1.SetFocus;
  end
 else
  edit1.SetFocus;
finally
 frm_cust.free;
end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  if not app_init_2(dm.ADOConnection1) then
  begin
   ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
   application.Terminate;
  end;

  {user_ptr:='416';
  rkey73:='583';
  vprev:='4';
  dm.ADOConnection1.Open;}

  self.Caption:=application.Title;
end;                                                               

procedure TForm1.dtpk1CloseUp(Sender: TObject);
begin
 dbgrid1.SetFocus;
end;

procedure TForm1.dtpk1Exit(Sender: TObject);
begin
 dm.ADO97.Close;
 dm.ADO97.Parameters.ParamByName('dtpk1').Value:=dtpk1.Date;
 dm.ADO97.Parameters.ParamByName('dtpk2').Value:=dtpk2.Date+1;
 dm.ADO97.Open;
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

      if strtoint(vprev)<=2 then
      begin
         form2.DBGrid2.Visible:=false;
         form2.lbl1.Visible:=False;
         form2.lbl2.Visible:=False;
         form2.lbl3.Visible:=False;
           form2.lbl7.Visible:=False;
         form2.lbl5.Visible:=False;
         form2.price1.Visible:=False;
         form2.price2.Visible:=False;
         form2.price3.Visible:=False;
         form2.price5.Visible:=False;
         form2.price4.Visible:=False;
      end;
      dm.ADO6090.Close;
      dm.ADO6090.Parameters.ParamByName('rkey34').Value := self.dept_rkey;
      dm.ADO6090.Parameters.ParamByName('rkey50').Value := dm.ADO97cust_part_ptr.Value;
      dm.ADO6090.Parameters.ParamByName('rkey97').Value := dm.ADO97rkey97.Value;
      dm.ADO6090.Open;    //查找同一客户订单同一板号的so
      bar_text := bar1.SimpleText;

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
        if dm.ADO6090.RecordCount = 1 then
         begin
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
         end
        else
         if messagedlg('板号'+trim(dm.ADO97MANU_PART_NUMBER.Value)+
          '在同一客户订单'+trim(dm.ADO97PO_NUMBER.Value)+
          '有多个交货期的销售订单，是否同时通评审？',mtconfirmation,[mbYes,mbNo],0)=mryes then
          begin
           while not dm.ADO6090.Eof do
            begin
             dm.Aq6090.Close;    //查找出订单还未评审的部门
             dm.Aq6090.Parameters[0].Value := dm.ADO6090rkey60.Value;
             dm.Aq6090.Open;
             dm.ADO6090.Edit;
             dm.ADO6090user_ptr.Value := employee_rkey;//90
             dm.ADO6090auth_date.Value := long_server_date;//90
             if dm.ADO97if_puthdate.Value=1 then
              begin
              due:=true;
              while due do
               begin
                str:=dm.ADO6090ORIG_SCHED_SHIP_DATE.AsString;
                if inputquery('回复客户交货期','请输入订单'+trim(dm.ADO6090sales_order.Value)+'交货期:',str) then
                try
                 dm.ADO6090sch_date.Value:=strtodate(str);
                 due:=false;
                except
                 showmessage('日期格式不正确请重新输入');
                end;
               end;
              end;
             if dm.aq6090.RecordCount = 1 then //如果该订单的未评审部门只有最后一个了
              dm.ADO6090QUOTE_PRICE.Value := 1;
             dm.ADO6090.Post;
             dm.ADO6090.Next;
            end;
            dm.ADO97.Close;
            dm.ADO97.Open;
          end
         else
          begin
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
          end;
       end;
      dm.ADO97.Close;
      dm.ADO97.Open;
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
       bar1.SimpleText := bar_text+' ';
       bar1.SimpleText := trim(bar1.SimpleText);
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
   dtpk2.Date:=server_date;
   dtpk1.Date:=server_date-30;
  end;
  with dm.ADOQuery1 do
   begin
    close;
    sql.Text:='select rkey,abbr_name from data0015 order by warehouse_code';
    open;
    i:=0;
    setlength(rkey15,RecordCount);
    while not eof do
     begin
      self.ComboBox1.Items.Add(fieldbyname('abbr_name').AsString);
      rkey15[i]:=fieldbyname('rkey').AsInteger;
      inc(i);
      next;
     end;
    self.ComboBox1.Items.Add('全部');
    combobox1.ItemIndex:=combobox1.Items.Count-1;
   end;

 dm.ADO97.Close;
 dm.ADO97.Parameters.ParamByName('dtpk1').Value:=dtpk1.Date;
 dm.ADO97.Parameters.ParamByName('dtpk2').Value:=dtpk2.Date+1;
 dm.ADO97.Parameters.ParamByName('rkey34_1').Value:=dept_rkey;
 dm.ADO97.Open;

 {if strtoint(vprev)<=2 then
  begin
   dbgrid1.Columns[6].Visible:=false;
   form1.Width:=form1.Width-66;
  end;}
 end;
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
var
 searchoption:tlocateoptions;
begin
 searchoption:=[lopartialkey];
if Key = Chr(vk_Back) then       //如果按下了backspace
 begin
  if length(bar1.SimpleText)>5 then
   bar1.SimpleText:=copy(bar1.SimpleText,1,length(bar1.SimpleText)-1);
  if length(bar1.SimpleText)>5 then
   begin
    case self.cloumn_no of
    0:dm.ADO97.Locate('sales_order',copy(bar1.SimpleText,6,length(bar1.SimpleText)),searchoption);
    1:dm.ADO97.Locate('customer_part_number',copy(bar1.SimpleText,6,length(bar1.SimpleText)),searchoption);
    2:dm.ADO97.Locate('po_number',copy(bar1.SimpleText,6,length(bar1.SimpleText)),searchoption);
    end;
   end
  else
   dm.ADO97.First
 end
else
  begin
   bar1.SimpleText := bar1.SimpleText+key;
    case self.cloumn_no of
    0:dm.ADO97.Locate('sales_order',copy(bar1.SimpleText,6,length(bar1.SimpleText)),searchoption);
    1:dm.ADO97.Locate('customer_part_number',copy(bar1.SimpleText,6,length(bar1.SimpleText)),searchoption);
    2:dm.ADO97.Locate('po_number',copy(bar1.SimpleText,6,length(bar1.SimpleText)),searchoption);
    end;
  end;
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

procedure TForm1.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
 if dm.ADO97so_oldnew.Value='新单' then
  DBGrid1.Canvas.Font.Color := clred;
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
if combobox1.ItemIndex<>combobox1.Items.Count-1 then
 with dm.ADO97 do
  begin
   close;
   sql.Delete(sql.Count-2);
   sql.Insert(sql.Count-1,'and Data0060.SHIP_REG_TAX_ID='+inttostr(rkey15[combobox1.ItemIndex]));
   open;
  end
else
 with dm.ADO97 do
  begin
   close;
   sql.Delete(sql.Count-2);
   sql.Insert(sql.Count-1,'');
   open;
  end
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
begin
if Msg_Dlg_Ask('确认导出 ? ','提示',1) then
try
export_dbgrid_to_excel(dbgrid1,self.Caption);
except
end;
end;

procedure TForm1.N2Click(Sender: TObject);
var
 i:word;
 s:string;
begin
  dm.AQ0493.Open;
  Form4:= tform4.Create(application);
  DM.AQ0493.Close;
 DM.AQ0493.Open;
 DM.qry1.Close;
 DM.qry1.Parameters[0].Value :=  dm.ADO97cust_part_ptr.Value;
 DM.qry1.Open;
  DM.qry2.Close;
 DM.qry2.Parameters[0].Value :=  dm.ADO97RKEY60.Value;
 DM.qry2.Open;
    form4.ppReport1.SaveAsTemplate:=false;
      form4.ppReport1.Reset;
       form4.ppReport1.Template.FileName:= stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+ 'sales_order.rtm';
   form4.ppReport1.Template.LoadFromFile;
   form4.ppReport1.SaveAsTemplate:= False;

  form4.ppReport1.Print;
  DM.AQ0493.Close;
   form4.Free;

{   form_report:= tform_report.Create(application);
  dm.AQ0493.Open;
 DM.ado0278.Close;
 // dm.spado278.Parameters[1].Value := dm.ADO97cust_part_ptr.Value;
   DM.ado0278.Open;
 dm.sp1.close;
 dm.sp1.Parameters[1].Value := dm.ADO97cust_part_ptr.Value;
 dm.sp1.Open;

 dm.sp2.Close;
 dm.sp2.Parameters.ParamByName('@purchase_order_ptr').Value:=dm.ado97PURCHASE_ORDER_PTR.Value;
 dm.sp2.Parameters.ParamByName('@cust_part_ptr').Value:=dm.ADO97cust_part_ptr.Value;
 dm.sp2.Open;

 dm.Aqinfor90.Close;//评审部门子表
 dm.Aqinfor90.Parameters.ParamByName('@d60rkey').Value:=dm.ADO97RKEY60.Value;
 dm.Aqinfor90.Open;


  form_report.ppReport1.Reset;
 form_report.ppReport1.Template.FileName :=
    stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
      'sales_order.rtm';
  form_report.ppReport1.Template.LoadFromFile;


 s:='                     ';

 for i:=1 to dm.sp1.RecordCount do
  begin
   if odd(dm.sp1.RecordCount) then
   //   if odd(i) then
   if i<=(dm.sp1.RecordCount+1)/2 then
    begin
     form_report.ppMemo1.Lines.Add(' '+trim(dm.sp1parameter_desc.Value)+
     copy(s,1,21-length(trim(dm.sp1parameter_desc.Value)))+
     trim(dm.sp1tvalue.Value)+
     copy(s,1,20-length(trim(dm.sp1tvalue.Value)))+
      dm.sp1unit_name.Value);
    end
   else
    begin
     form_report.ppMemo2.Lines.Add(trim(dm.sp1parameter_desc.Value)+
     copy(s,1,21-length(trim(dm.sp1parameter_desc.Value)))+
     trim(dm.sp1tvalue.Value)+
     copy(s,1,20-length(trim(dm.sp1tvalue.Value)))+
     dm.sp1unit_name.Value);
    end
  else
   if i<=(dm.sp1.RecordCount)/2 then
    begin
     form_report.ppMemo1.Lines.Add(' '+trim(dm.sp1parameter_desc.Value)+
     copy(s,1,21-length(trim(dm.sp1parameter_desc.Value)))+
     trim(dm.sp1tvalue.Value)+
     copy(s,1,20-length(trim(dm.sp1tvalue.Value)))+
      dm.sp1unit_name.Value);
    end
   else
    begin
     form_report.ppMemo2.Lines.Add(trim(dm.sp1parameter_desc.Value)+
     copy(s,1,21-length(trim(dm.sp1parameter_desc.Value)))+
     trim(dm.sp1tvalue.Value)+
     copy(s,1,20-length(trim(dm.sp1tvalue.Value)))+
     dm.sp1unit_name.Value);
    end;
   dm.sp1.Next;
  end;

  form_report.ppReport1.SaveAsTemplate:=false;
  form_report.ppReport1.Print;

 dm.sp1.Close;
 dm.sp2.Close;
  dm.AQ0493.Close;
 dm.Aqinfor90.Close;
 form4.Free;  }

end;

procedure TForm1.btn1Click(Sender: TObject);
begin
  try
 form_report:= Tform_report.Create(application);
 DM.AQ0493.Close;
 DM.AQ0493.Open;
 DM.qry1.Close;
 DM.qry1.Parameters[0].Value :=  dm.ADO97cust_part_ptr.Value;
 DM.qry1.Open;
  DM.qry2.Close;
 DM.qry2.Parameters[0].Value :=  dm.ADO97RKEY60.Value;
 DM.qry2.Open;

 form_report.ppReport1.Reset;
 form_report.ppReport1.Template.FileName :=
  stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
    'sales_order.rtm';
  form_report.ppReport1.Template.LoadFromFile;
  form_report.ppReport1.SaveAsTemplate:=true;
  form_report.ppdesigner1.ShowModal;
finally
 form_report.Free;
end;
end;

procedure TForm1.edt1Change(Sender: TObject);
begin
    dm.ADO97.filter:='';
     dm.ADO97.filtered:=False;
     if edt1.text<>'' then
     begin
         dm.ADO97.filter:='MANU_PART_NUMBER like ''%'+edt1.text+'%''';
        dm.ADO97.filtered:=True;
     end;

end;

end.
