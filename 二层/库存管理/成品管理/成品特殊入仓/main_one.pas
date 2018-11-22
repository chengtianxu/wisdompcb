unit main_one;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Grids, DBGrids, Menus,ComObj, Excel2000,ClipBrd,
  DB, ADODB, Buttons;

type
  TF_main = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
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
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    Label4: TLabel;
    Timer1: TTimer;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure dtpk1Exit(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure append_416(v_type:integer);
    procedure N2Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
    v_colwidth: array[0..7] of integer;
    field_name: string;
    OldGridWnd : TWndMethod;
    procedure NewGridWnd(var Message: TMessage);
    function find_rmaerror(rkey98:integer):boolean;
    function account_maxdate():Tdatetime;
    //function submit_error(rkey,qty:integer):boolean;
  public
    { Public declarations }
   long_datetime:tdatetime;
//   empl_ptr:integer;
  end;

var
  F_main: TF_main;

implementation

uses damo, main, report_comein,common,MyClass;

{$R *.dfm}
procedure TF_main.FormCreate(Sender: TObject);
begin

 if not app_init_2(dm.ADOConnection1) then
 begin
  showmsg('程序启动失败,请与管理员联系!',1);
  application.Terminate;
 end;
  self.Caption:=application.Title;

 {
  rkey73 := '3';
  vprev := '4';
  dm.ADOConnection1.Open;
 }
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  OldGridWnd := DBGrid1.WindowProc;
  DBGrid1.WindowProc := NewGridWnd;
  MyDataClass:=TMyDataClass.Create(dm.ADOConnection1);
end;

function TF_main.account_maxdate:Tdatetime;
begin
 with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='select max(fg_date) as maxdate from data0444 ';
  open;
  if not fieldbyname('maxdate').IsNull then
   result:=fieldvalues['maxdate']
  else
   result:=date()-3650;
 end;
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

function TF_main.find_rmaerror(rkey98: integer): boolean;
begin
result:=false;
 with dm.adoquery1 do
 begin
  close;
  sql.Text:='select rma_status from data0098 where rkey='+inttostr(rkey98);
  open;
  if fieldvalues['rma_status']=4 then  //不等于3代表退货已被扣款
  result:=true;
 end;
end;

procedure TF_main.append_416(v_type: integer); //3委外加工4退货入库
begin
if IS_FG_counting then
  messagedlg('产成品正在进行盘点,不能进行操作!',mtinformation,[mbOk],0)
else
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起,您只有本程序的只读权限!',mtinformation,[mbok],0)
else
begin
 form1:=tform1.Create(application);
 dm.ADO416.Close;
 dm.ADO416.Parameters[0].Value:=null;
 dm.ADO416.Open;
 dm.ado416.append;
 dm.ADO416type.Value:=v_type;
 dm.ADO416empl_ptr.Value:=StrToInt(common.user_ptr);
 dm.ADO416sys_date.Value:=getsystem_date(dm.ADOQuery1,0);
 form1.Edit5.Text := dm.ADO416sys_date.AsString;
 if v_type=4 then      //退货入仓
 with form1 do
  begin
   label1.Visible:=true;
   edit1.Visible:=true;
   bitbtn2.Visible:=true;
   label3.Visible:=true;
   label4.Visible:=true;

   edit3.Visible:=true;
   label6.Visible:=true;
   edit9.Visible:=true;
   edit9.ReadOnly:=true;   //退货入库不能分多次入库,只能一次入库

   edit8.Visible:=true;
   label11.Visible:=true;
   Label_so.Visible:=true;
  end
else
if v_type=3 then
 with form1 do
  begin
   label2.Visible:=true;
   edit2.Visible:=true;
   bitbtn3.Visible:=true;
   edit8.Visible:=true;
   label3.Visible:=true;
   label4.Visible:=true;
   label11.Visible:=true;
   edit3.Visible:=true;
   edit10.Visible:=true;
   label12.Visible:=true;
   edit12.Visible:=true;
   label15.Visible:=true;
   checkbox1.Visible:=true;
  end;

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
if dm.ADOConnection1.Connected then
 begin
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
  self.dtpk1Exit(sender);
  self.field_name:='number';
  for i:=low(v_colwidth) to high(v_colwidth) do
   v_colwidth[i]:=dbgrid1.Columns[i].Width;
 end;
 Timer1Timer(Sender);
end;

procedure TF_main.Button1Click(Sender: TObject);
begin
ShowMessage(DM.ADOQuery3.SQL.Text);
end;

procedure TF_main.dtpk1Exit(Sender: TObject);
begin
dm.AQ416.Close;
dm.AQ416.Parameters.ParamByName('dtpk1').Value:=dtpk1.Date;
dm.AQ416.Parameters.ParamByName('dtpk2').Value:=dtpk2.Date+1;
dm.AQ416.Prepared;
dm.AQ416.Open;
end;

procedure TF_main.DBGrid1TitleClick(Column: TColumn);
begin
 if (column.ReadOnly=true) and (column.FieldName<>self.field_name) then
 begin
  if column.FieldName<>'sys_date' then
  begin
  field_name:=column.FieldName;
  label1.Caption := column.Title.Caption;
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
 dm.AQ416.Parameters[2].Value:=0
else
 dm.AQ416.Parameters[2].Value:=1;

if checkbox2.Checked then
 dm.AQ416.Parameters[3].Value:=0
else
 dm.AQ416.Parameters[3].Value:=2;

if checkbox3.Checked then
 dm.AQ416.Parameters[4].Value:=0
else
 dm.AQ416.Parameters[4].Value:=3;

if checkbox4.Checked then
 dm.AQ416.Parameters[5].Value:=0
else
 dm.AQ416.Parameters[5].Value:=4;

if checkbox5.Checked then
 dm.AQ416.Parameters[6].Value:=0
else
 dm.AQ416.Parameters[6].Value:=5;

if checkbox6.Checked then
 dm.AQ416.Parameters[7].Value:=0
else
 dm.AQ416.Parameters[7].Value:=6;

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

procedure TF_main.N6Click(Sender: TObject);
begin
 append_416(3);
end;

procedure TF_main.N7Click(Sender: TObject);
begin
 append_416(4);
end;

procedure TF_main.N2Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起,您只有本程序的只读权限!',mtinformation,[mbok],0)
else
begin
 if  dm.AQ416sys_date.Value < account_maxdate  then
  begin
   ShowMsg('入仓日期已小于成本核算日期,不能编辑!',1);
   exit;
  end;

 if dm.AQ416type.Value=4 then
 if self.find_rmaerror(dm.AQ416rma_ptr.Value) then
 begin
  messagedlg('不允许编辑,财务已经将退货做扣款处理!',mterror,[mbok],0);
  exit;
 end;

 if dm.find_qtyerror(dm.AQ416rkey.Value) then //库存发生变化
 begin
  showmsg('该入仓单不能编辑...',1);
  exit;
 end;

form1:=Tform1.Create(application);
dm.ADO416.Close;
dm.ADO416.Parameters[0].Value:=dm.AQ416rkey.Value;
dm.ADO416.Open;
dm.ADO416.Edit;
if dm.ADO416type.Value=4 then //  4:self.AQ416C_type.Value:='退货入仓';
 with form1 do
 begin
  label1.Visible:=true;
  edit1.Visible:=true;
  label3.Visible:=true;
  label4.Visible:=true;
  edit3.Visible:=true;
  label6.Visible:=true;
  edit9.Visible:=true;
  edit9.Enabled:=false;
  bitbtn2.Enabled:=false;
  edit8.Visible:=true;
  label11.Visible:=true;
  Label_so.Visible:=true;
 end
else
if dm.ADO416type.Value=3 then   // 3:self.AQ416C_type.Value:='委外入仓';
 with form1 do
 begin
  label2.Visible := true;
  edit2.Visible := true;
  label3.Visible := true;
  label4.Visible := true;
  edit3.Visible:=true;
  edit8.Visible := true;
  label11.Visible := true;
   edit10.Visible:=true;
   label12.Visible:=true;
  edit12.Visible:=true;
  label15.Visible:=true;   
 end;

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



procedure TF_main.PopupMenu1Popup(Sender: TObject);
begin
if dm.AQ416.IsEmpty then
 begin
  n2.Enabled:=false;
  n3.Enabled:=false;
  n4.Enabled:=false;
  n8.Enabled:=false;
  n10.Enabled:=false;
  n11.Enabled:=false;
  n12.Enabled:=false;
 end
else
 begin
      if (dm.AQ416type.Value<>2) and   //过数入仓
         (dm.AQ416type.Value<>5) and   //转换入仓
         (dm.AQ416type.Value<>6) and   //盘点入仓
         (dm.AQ416type.Value<>1) then  //直接入仓
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

      if (dm.AQ416type.Value = 1) then
      case  DM.AQ416status.AsInteger  of
            0:  begin n10.Enabled:=false;  n11.Enabled:=False; n12.Enabled:=false; end;
            1:  begin n10.Enabled:=true;  n11.Enabled:=False; n12.Enabled:=True; end;
            2:  begin n10.Enabled:=False;  n11.Enabled:=True; n12.Enabled:=False; end;
            3:  begin n2.Enabled:=False;  n4.Enabled:=false; n10.Enabled:=False; n11.Enabled:=False;n12.Enabled:=False;end;
      end else begin
            n10.Enabled:=false;  n11.Enabled:=False; n12.Enabled:=false;
      end;


 end;
end;

procedure TF_main.N3Click(Sender: TObject);
begin
form1:=Tform1.Create(application);
dm.ADO416.Close;
dm.ADO416.Parameters[0].Value:=dm.AQ416rkey.Value;
dm.ADO416.Open;
form1.BitBtn1.Enabled:=false;
form1.Edit4.ReadOnly:=true;
form1.Edit6.ReadOnly:=true;
form1.DBGrid1.PopupMenu:=form1.PopupMenu2;
if dm.ADO416type.Value=4 then
 with form1 do
 begin
  label1.Visible:=true;
  edit1.Visible:=true;
  label3.Visible:=true;
  label4.Visible:=true;

  edit3.Visible:=true;
  edit8.Visible:=true;
  label11.Visible:=true;
  Label_so.Visible:=true;
 end
else
if dm.ADO416type.Value=3 then
 with form1 do
 begin
  label2.Visible:=true;
  edit2.Visible:=true;
  edit8.Visible:=true;
  label3.Visible:=true;
  label4.Visible:=true;
  label11.Visible:=true;
  edit3.Visible:=true;
  edit10.Visible:=true;
  label12.Visible:=true;
  edit12.Visible:=true;
  label15.Visible:=true;
 end;
if form1.ShowModal=mrok then
 begin
 end;
form1.Free;
end;

procedure TF_main.N4Click(Sender: TObject);
begin
if common.IS_FG_counting then
  messagedlg('产成品正在进行盘点,不能进行操作!',mtinformation,[mbOk],0)
else
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起,您只有本程序的只读权限!',mtinformation,[mbok],0)
else
if (messagedlg('您确定要删除该条入仓记录吗?',mtconfirmation,[mbyes,mbno],0)=mryes) then
 begin
  if  dm.AQ416sys_date.Value < account_maxdate  then
   begin
    ShowMsg('入仓日期已小于成本核算日期,不能删除!',1);
    exit;
   end;

  if dm.AQ416type.Value=4 then
   if self.find_rmaerror(dm.AQ416rma_ptr.Value) then
   begin
    messagedlg('对不起删除操作不成,财务已经将退货做扣款处理!',mterror,[mbok],0);
    exit;
   end;
   if dm.AQ416so_ptr.AsVariant<>null then //订单指针不为空 add by hcc 2018-07-04
   begin
    //如果退货数量-退货指派的数量小于删除数量，则不能删除
    DM.ADOQuery1.Close;
    DM.ADOQuery1.SQL.Clear;
    DM.ADOQuery1.SQL.Add('select STATUS,PARTS_returned,PARTS_ORDERED,parts_shipped,RETURNED_SHIP from data0060 ');
    DM.ADOQuery1.SQL.Add( 'where rkey='+dm.AQ416so_ptr.AsString);
    DM.ADOQuery1.Open;
    if DM.ADOQuery1.FieldByName('PARTS_returned').AsInteger - DM.ADOQuery1.FieldByName('RETURNED_SHIP').AsInteger <  dm.AQ416qty_ship.AsInteger then
    begin
     ShowMessage('退货数量 - 退货指派的数量 < 要删除数量，则不能删除');
     Exit;
    end;
   end;
  if not (dm.find_qtyerror(dm.AQ416rkey.Value))  then //库存没有发生变化
       try
        dm.ADOConnection1.BeginTrans;
        if dm.AQ416type.Value=4 then   //退货入库
         begin
          with dm.ADOQuery1 do
           begin
            close;
            sql.Clear;
            sql.Add('update data0098');
            sql.Add('set rma_status=2,');
            sql.Add('qty_recd=0,Putaway_date=null');
            sql.Add('where rkey='+dm.AQ416rma_ptr.AsString);
            ExecSQL;
           end;

          if dm.AQ416so_ptr.AsVariant<>null then
           WITH dm.ADOQuery1 do        //更新data0060 退货数量及状态
           begin
            active:=false;
            sql.Clear;
            sql.Add('select STATUS,PARTS_returned,PARTS_ORDERED,parts_shipped,RETURNED_SHIP from data0060');
            sql.Add('where rkey='+dm.AQ416so_ptr.AsString);
            active:=true;
            edit;
            fieldvalues['parts_returned'] := fieldvalues['parts_returned']-dm.AQ416qty_ship.Value;//修改退货数量
            if FieldValues['parts_ordered']+fieldvalues['parts_returned']<=
               fieldvalues['parts_shipped']+fieldvalues['RETURNED_SHIP'] then
            if FieldValues['status']=1 then FieldValues['status']:=4;
            post;
           end;
         end
        else
         if dm.AQ416type.Value=3 then   //委外加工入库
         begin
         with dm.ADOQuery1 do     //减少60中的入库数量
         begin
          close;
          sql.Text:='update data0060'+#13+
          'set REPUT_APPR_BY=isnull(REPUT_APPR_BY,0)-'+dm.AQ416quantity.AsString+#13+
          'where rkey='+dm.AQ416so_ptr.AsString;
          execsql;
         end;
         end;


         dm.ADO416.Close;
         dm.ADO416.Parameters[0].Value:=dm.AQ416rkey.Value;
         dm.ADO416.Open;

         with dm.ADOQuery1 do     //减小25中的库数量
         begin
            close;
            sql.Text:='update data0025'+#13+
            'set Data0025.QTY_ON_HAND=Data0025.QTY_ON_HAND-d1.total_QUANTITY'+#13+
            'from data0025 inner join (select CUST_PART_PTR,sum(QTY_ON_HAND) as total_QUANTITY'+#13+
            'from data0053' +#13+
            'where data0053.NPAD_PTR='+dm.ADO416rkey.AsString +#13+
            'group by CUST_PART_PTR ) as d1 on' +#13+
            'data0025.rkey=d1.CUST_PART_PTR';
            execsql;
         end;

         dm.ADO416.Delete;

          dm.ADOConnection1.CommitTrans;
          showmessage('删除操作成功');
          dm.AQ416.Close;
          dm.AQ416.Open;
       except
           on E: Exception do
            begin
             dm.ADOConnection1.RollbackTrans;
             messagedlg(E.Message,mterror,[mbcancel],0);
            end;
       end
  else
   showmessage('该入仓单不能删除...');
 end;
end;

procedure TF_main.N8Click(Sender: TObject);
begin
f_partin_report:=tf_partin_report.Create(application);

  f_partin_report.ppReport1.Reset;
  f_partin_report.ppReport1.Template.FileName :=
    stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
      'part_comein.rtm';        //R:\NIERP\Report\part_comein.rtm
  f_partin_report.ppReport1.Template.LoadFromFile;

f_partin_report.ppReport1.Print;
f_partin_report.Free;
end;

procedure TF_main.Button3Click(Sender: TObject);
begin
 Export_dbGrid_to_Excel(dbgrid1,self.Caption);
end;



procedure TF_main.FormDestroy(Sender: TObject);
begin
MyDataClass.Free;
end;

procedure TF_main.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    if not (gdFixed in State) then
     begin
      if DBGrid1.DataSource.DataSet.Active then //只有在打开的时候才画
      begin
          case DM.AQ416status.AsInteger of
          1:
            begin
                DBGrid1.Canvas.Font.color:=clOlive;
                DBGrid1.DefaultDrawColumnCell   (Rect,   DataCol,   Column,   State);

            end;
          {2:
              begin
                  DBGrid1.Canvas.Font.color:=clWindowText;
                  DBGrid1.defaultdrawing:= True;
                  DBGrid1.DefaultDrawColumnCell   (Rect,   DataCol,   Column,   State);
              end; }
          3:
              begin
                  DBGrid1.Canvas.Font.color:=clRed;
                  DBGrid1.defaultdrawing:= True;
                  DBGrid1.DefaultDrawColumnCell   (Rect,   DataCol,   Column,   State);

              end;
          end;
     end;
  end;
end;

procedure TF_main.N10Click(Sender: TObject);
begin
  if IS_FG_counting then
      ShowMsg('产成品正在盘点,操作不能进行',1)
  else
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起,您只有本程序的只读权限!',mtinformation,[mbok],0)
  else  begin
          DM.qrytmp.Close;
          DM.qrytmp.SQL.Text:=
          'select rkey from data0416 where (rkey='+DM.AQ416rkey.AsString +') AND (status = ' +DM.AQ416status.AsString + ')';
          dm.qrytmp.Open;
          if not DM.qrytmp.IsEmpty then //状态是否发生变化
          begin
                dm.ADOConnection1.BeginTrans;
                try
                    dm.ADO416.Close;
                    dm.ADO416.Parameters[0].Value:=dm.AQ416rkey.Value;
                    dm.ADO416.Open;
                    DM.AQ416.Edit;
                    DM.AQ416status.AsInteger := 2;
                    DM.AQ416.Post;

                     with dm.ADOQuery1 do     //交换53中的库数量
                     begin
                          close;
                          sql.Text:='declare @temp float update data0053'+#13+
                          'set  @temp = Data0053.QTY_ON_HAND,  '+#13+
                          ' Data0053.QTY_ON_HAND = Data0053.QTY_ALLOC,Data0053.QTY_ALLOC = @temp' +#13+
                          'from data0053' +#13+
                          'where data0053.NPAD_PTR= ' +dm.AQ416rkey.AsString;
                          execsql;
                      end;

                     with dm.ADOQuery1 do     //增加25中的库数量
                     begin
                        close;
                        sql.Text:='update data0025'+#13+
                        'set Data0025.QTY_ON_HAND=Data0025.QTY_ON_HAND+d1.total_QUANTITY'+#13+
                        'from data0025 inner join (select CUST_PART_PTR,sum(QTY_ON_HAND) as total_QUANTITY'+#13+
                        'from data0053' +#13+
                        'where data0053.NPAD_PTR='+dm.ADO416rkey.AsString +#13+
                        'group by CUST_PART_PTR ) as d1 on' +#13+
                        'data0025.rkey = d1.CUST_PART_PTR';
                        execsql;
                     end;
                 dm.ADOConnection1.CommitTrans;
                 BitBtn3Click(sender);
                 except
                       on E: Exception do
                        begin
                         dm.ADOConnection1.RollbackTrans;
                         messagedlg(E.Message,mterror,[mbcancel],0);
                        end;
                 end;

          end else showmessage('该入仓单不能审核,可能存在多人同时操作...');
        end;

end;



procedure TF_main.N11Click(Sender: TObject);
begin
  if IS_FG_counting then
     ShowMsg('产成品正在盘点,操作不能进行',1)
  else
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起,您只有本程序的只读权限!',mtinformation,[mbok],0)
  else
   begin
    if not dm.find_qtyerror(dm.AQ416rkey.Value) then //库存没有发生变化
    begin

     if account_maxdate > dm.AQ416sys_date.Value then
      begin
       ShowMsg('入仓日期已小于成本核算日期,不能取消!',1);
       exit;
      end;

        dm.ADOConnection1.BeginTrans;
        try
              dm.ADO416.Close;
              dm.ADO416.Parameters[0].Value:=dm.AQ416rkey.Value;
              dm.ADO416.Open;
              DM.AQ416.Edit;
              DM.AQ416status.AsInteger := 1;
              DM.AQ416.Post;

              with dm.ADOQuery1 do     //减小25中的库数量
              begin
                close;
                sql.Text:='update data0025'+#13+
                'set Data0025.QTY_ON_HAND=Data0025.QTY_ON_HAND-d1.total_QUANTITY'+#13+
                'from data0025 inner join (select CUST_PART_PTR,sum(QTY_ON_HAND) as total_QUANTITY'+#13+
                'from data0053' +#13+
                'where data0053.NPAD_PTR='+dm.ADO416rkey.AsString +#13+
                'group by CUST_PART_PTR ) as d1 on' +#13+
                'data0025.rkey=d1.CUST_PART_PTR';
                execsql;
              end;

              with dm.ADOQuery1 do     //交换53中的库数量
              begin
                close;
                sql.Text:='declare @temp float update data0053'+#13+
                'set  @temp = Data0053.QTY_ALLOC,'+#13+
                'Data0053.QTY_ALLOC = Data0053.QTY_ON_HAND,Data0053.QTY_ON_HAND = @temp' +#13+
                'from data0053' +#13+
                'where data0053.NPAD_PTR= ' +dm.AQ416rkey.AsString;
                execsql;
              end;


        dm.ADOConnection1.CommitTrans;
        BitBtn3Click(sender);
       except
         on E: Exception do
          begin
           dm.ADOConnection1.RollbackTrans;
           messagedlg(E.Message,mterror,[mbcancel],0);
          end;
       end;
    end else showmessage('该入仓单不能取消审核,入仓记录有变化...');
   end;

end;

procedure TF_main.N12Click(Sender: TObject);  //退回
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起,您只有本程序的只读权限!',mtinformation,[mbok],0)
  else
  begin
    DM.qrytmp.Close;
    DM.qrytmp.SQL.Text:='select rkey,status from data0416 where (rkey='+DM.AQ416rkey.AsString +') AND (status = ' +DM.AQ416status.AsString + ')';
    DM.qrytmp.Open;
    if not DM.qrytmp.IsEmpty then //状态是否发生变化
     begin
      DM.AQ416.Edit;
      DM.AQ416status.AsInteger := 3;
      DM.AQ416.Post;
      Button2Click(sender);
     end
    else
     showmessage('该入仓单不能审核,可能存在多人同时操作...');
    BitBtn3Click(sender);
  end;

end;

procedure TF_main.Timer1Timer(Sender: TObject);
begin
  with dm.ADOQuery2 do
  begin
    close;
    sql.Clear;
    sql.Add('select rkey from data0416 where status=3');
    open;
    label4.Visible:=not dm.ADOQuery1.IsEmpty ;
  end;
end;

procedure TF_main.BitBtn1Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TF_main.BitBtn3Click(Sender: TObject);
var
 rkey416:integer;
begin
 rkey416:=dm.AQ416rkey.Value;
 dm.AQ416.Close;
 dm.AQ416.Prepared;
 dm.AQ416.Open;
 if rkey416>0 then dm.AQ416.Locate('rkey',rkey416,[]);
end;

procedure TF_main.BitBtn2Click(Sender: TObject);
begin
 Export_dbGrid_to_Excel(dbgrid1,self.Caption);
end;

procedure TF_main.BitBtn5Click(Sender: TObject);
begin
f_partin_report:=tf_partin_report.Create(application);

  f_partin_report.ppReport1.Reset;
  f_partin_report.ppReport1.Template.FileName :=
    stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
      'part_comein.rtm';        //R:\NIERP\Report\part_comein.rtm
  f_partin_report.ppReport1.Template.LoadFromFile;
  f_partin_report.ppReport1.SaveAsTemplate:=true;
  f_partin_report.ppdesigner1.ShowModal;

f_partin_report.Free;
end;

end.
