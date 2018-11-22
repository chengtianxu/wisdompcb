unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Menus, ComCtrls;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    F1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    O1: TMenuItem;
    N5: TMenuItem;
    H1: TMenuItem;
    N6: TMenuItem;
    BitBtn1: TBitBtn;
    StatusBar1: TStatusBar;
    N7: TMenuItem;
    procedure N4Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure active_adoquery1();
    procedure N6Click(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    employee_ptr,SALES_REP_PTR:integer;
  end;

var
  Form1: TForm1;

implementation

uses confirmation, display, unconfirmation, cust_po,
     damo, cust_part, returen_so, note,common;

{$R *.dfm}

procedure TForm1.active_adoquery1();
begin
  with dm.ADOQuery1 do
   begin
    active:=false;
    sql.Clear;
   if (strtoint(vprev) = 2) then    //按系统用户绑定客户代码确认
    begin
     sql.Add('SELECT Data0060.RKEY,Data0060.SALES_ORDER,Data0060.sch_DATE,');
     sql.Add('Data0010.abbr_name as CUST_CODE,data0010.cust_code as cust_code1,Data0097.PO_NUMBER,');
     sql.Add('Data0025.MANU_PART_NUMBER,ORIG_SCHED_SHIP_DATE,');
     sql.Add('data0060.quote_price,data0060.PURCHASE_ORDER_PTR,');
     sql.Add('data0060.ENT_DATE,DATA0060.PARTS_ORDERED,DATA0025.MANU_PART_DESC,');
     SQL.Add('data0060.ORIG_REQUEST_DATE,data0060.DUE_DATE,data0060.ORIG_CUSTOMER,data0015.ABBR_NAME,');
     sql.Add('case data0060.so_tp when 0 then ''自制'' when 1 then ''外发'' when 2 then ''半制程'' end as sotp');
     sql.Add('FROM Data0060 INNER JOIN Data0010 ON');
     sql.Add('Data0060.CUSTOMER_PTR = Data0010.RKEY INNER JOIN');
     sql.Add('Data0097 ON Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY INNER JOIN');
     sql.Add('Data0025 ON Data0060.CUST_PART_PTR = Data0025.RKEY  LEFT JOIN');
     sql.Add('Data0015 ON Data0060.SHIP_REG_TAX_ID = Data0015.RKEY inner join ');
     sql.Add('data0100 on data0010.rkey=data0100.CUSTOMER_PTR');
     sql.Add('WHERE (Data0060.PROD_REL = ''1'') AND (Data0060.STATUS = 1)');  //未确认，订单状态为：有效
     sql.Add('and (Data0060.QUOTE_PRICE in(1,3))');                     //订单已评审或者不需要详审的订单
     sql.Add('and Data0100.CSI_PTR ='+common.rkey73);
    end
   else                   //不按业务员确认订单
    begin
     sql.Add('select data0060.rkey,data0060.sales_order,data0060.sch_date,');
     sql.Add('Data0097.po_number,Data0025.manu_part_number,');
     sql.Add('data0010.abbr_name as cust_code,data0010.cust_code as cust_code1,data0060.quote_price,');
     sql.Add('data0060.PURCHASE_ORDER_PTR,ORIG_SCHED_SHIP_DATE,');
     sql.Add('data0060.ENT_DATE,DATA0060.PARTS_ORDERED,DATA0025.MANU_PART_DESC,');
     SQL.Add('data0060.ORIG_REQUEST_DATE,data0060.DUE_DATE,data0060.ORIG_CUSTOMER,data0015.ABBR_NAME,');
     sql.Add('case data0060.so_tp when 0 then ''自制'' when 1 then ''外发'' when 2 then ''半制程'' end as sotp');
     sql.Add('from data0060,data0010,data0097,data0025,data0015');
     sql.Add('where (data0060.customer_ptr=data0010.rkey) and');
     sql.add('(data0060.purchase_order_ptr=data0097.rkey) and');
     sql.add('(data0060.cust_part_ptr=data0025.rkey) and');
     sql.add('(data0060.SHIP_REG_TAX_ID=data0015.rkey) and');
     sql.add('(data0060.prod_rel=''1'') and (data0060.status=1)');
     sql.Add('and (data0060.quote_price in(1,3))')
    end;
    case form3.RdG2.ItemIndex of
     0:sql.Add('order by data0010.cust_code');
     1:sql.Add('order by data0025.manu_part_number');
     2:sql.Add('order by data0060.sch_date');
     3:sql.Add('order by data0060.sales_order');
    end;
    active:=true;
   end;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
 Application.Terminate;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
if (strtoint(vprev) = 2) or (strtoint(vprev) = 4) then
case form3.RdG1.ItemIndex of
 0:           //全部
  try
   form2:=tform2.create(Application);
   self.active_adoquery1();
   form2.ShowModal;
  finally
    form2.free;
  end;
 1:       //按客户
  try
   form6:=tform6.create(Application);
   form6.ShowModal;
  finally
    form6.free;
  end;
 2:      //按产品
  try
   form7:=tform7.create(Application);
   form7.ShowModal;
  finally
   form7.free;
  end;
end
else
 showmessage('对不起您没有确认的权限,只有反确认的权限!');

end;

procedure TForm1.N5Click(Sender: TObject);
var
 filter_field,sort_field:byte;
begin
 filter_field := form3.RdG1.ItemIndex;
 sort_field := form3.RdG2.ItemIndex;
 if form3.ShowModal=mrok then
  else
   begin
    form3.RdG1.ItemIndex:=filter_field;
    form3.RdG2.ItemIndex:=sort_field;
   end;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
//if strtoint(vprev)<>1 then
if (strtoint(vprev) = 2) or (strtoint(vprev) = 4) then
 try
  form4:=Tform4.Create(application);
  form4.ShowModal;
 finally
  form4.free;
 end
else
 showmessage('对不起您没有反确认的权限,只有确认的权限!');
end;

procedure TForm1.FormCreate(Sender: TObject);

begin
 if not app_init_2(dm.ADOConnection1) then
  begin
   showmsg('程序起动失败,请联系管理员!',1);
   application.Terminate;
  end;

//   rkey73:= '1502';
//  user_ptr := '1838';
//  vprev := '4';
// dm.ADOConnection1.Open;

  self.Caption:=application.Title;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  employee_ptr:=StrToInt(common.user_ptr);

end;

procedure TForm1.FormShow(Sender: TObject);
begin
if DM.Adoconnection1.Connected then
 begin

   SALES_REP_PTR :=StrToInt(common.user_ptr);//销售代表

 end;
  
end;

procedure TForm1.N7Click(Sender: TObject);
begin
if (strtoint(vprev) = 2) or (strtoint(vprev) = 4) then
try
 form10 := tform10.Create(application);
 self.active_adoquery1();
  if dm.ADOQuery1.IsEmpty then
   showmessage('对不起没有找到可以退回应期的销售订单!')
  else
  if (form10.ShowModal = mrok) then
   begin
   edit_note:=Tedit_note.Create(application);
   edit_note.Caption:='销售订单应期退回原因记事本,订单号'+dm.ADOQuery1.FieldValues['sales_order'];
    with dm.AQ1060 do
    begin
     if active=true then active:=false;
     sql.Clear;
     //20170425tang 添
      sql.Add('select RemarkAudit from data0060 where  Rkey='+dm.ADOQuery1.fieldbyname('rkey').AsString);
      active:=true;
      if not isempty then edit_note.Memo1.Text := fieldvalues['RemarkAudit'];
     //20170425tang 注
//     sql.Add('select * from data0011 where source_type=1060'); //评审记事本
//     sql.Add('and file_pointer='+dm.ADOQuery1.fieldbyname('rkey').AsString);//+dm.ADOQuery1.fieldbyname('PURCHASE_ORDER_PTR').AsString);
//     active:=true;
//     if not isempty then
//     begin
//        edit_note.Memo1.Text:=fieldvalues['memo_text'];
//        i:=Length(edit_note.memo1.Text);
//        edit_note.memo1.SelStart:=i;
//        edit_note.memo1.SelLength:=10;
//     end;
    end;
     if edit_note.ShowModal=mrok then
     begin
      if (not dm.AQ1060.IsEmpty) and (trim(edit_note.Memo1.Text)<>'') then
       begin
          dm.AQ1060.Edit;
          dm.AQ1060.FieldValues['RemarkAudit']:=edit_note.Memo1.Text;
          dm.AQ1060.Post;
     //20170425tang 注
//         if (not dm.AQ1060.IsEmpty) then
//          begin
//           dm.AQ1060.Edit;
//           dm.AQ1060.fieldbyname('memo_text').asstring := edit_note.Memo1.Text;
//           dm.AQ1060.Post;
//          end
//         else
//          begin
//           dm.AQ1060.Append;
//           dm.AQ1060.FieldValues['file_pointer']:=dm.ADOQuery1.fieldbyname('rkey').AsString;//dm.ADOQuery1.FieldValues['PURCHASE_ORDER_PTR'];
//           dm.AQ1060.Fieldvalues['source_type']:=1060;
//           dm.AQ1060.fieldbyname('memo_text').asstring:=edit_note.Memo1.Lines.Text;
//           dm.AQ1060.post;
//          end;
        dm.ADOQuery1.Edit;
        dm.ADOQuery1.FieldValues['quote_price']:=0;  //重新应期
        dm.ADOQuery1.Post;
        with dm.ADOQuery2 do
         begin
          close;
          sql.Clear;
          sql.Add('update data0090');
          sql.Add('set user_ptr=null,');
          sql.Add('auth_date=null');
          sql.Add('where pact_ptr='+dm.ADOQuery1.fieldbyname('rkey').AsString+' and IF_PUTHDATE=1');
          ExecSQL;
         end;
        showmessage('应期退回操作成功，请通知评审部门重新应期!');
       end
      else
       showmessage('退回原因为空退回操作不成功!');
     end;
     edit_note.free;
   end;
finally
 form10.Free;
end
else
  showmsg('对不起您没有应期退回的权限,请与管理员联系!',1);
end;



procedure TForm1.N6Click(Sender: TObject);
begin
ShowMessage('权限可写2,允许对绑定的客户进行确认及返确认退回,'+#13+
            '权限写银4,允许对所有客户进行确认及返确认退回,'+#13+
            '权限只读1,读银3,不允许任何操作');
end;

end.
