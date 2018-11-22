unit unconfirmation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm4 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label2: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses so_search,damo, main,common;

{$R *.dfm}

procedure TForm4.BitBtn2Click(Sender: TObject);
begin
 close;
end;

procedure TForm4.BitBtn3Click(Sender: TObject);
begin
 try
  form5:=Tform5.Create(application);
  if (strtoint(vprev) = 2) then    //按系统用户绑定客户代码确认
   with form5.ADOQuery1 do
    begin
    close;
    sql.Clear;
    sql.Add('SELECT TOP 100 PERCENT Data0060.RKEY,Data0060.SALES_ORDER,');
    sql.Add('Data0010.ABBR_NAME,Data0097.PO_NUMBER,');
    sql.Add('Data0025.MANU_PART_NUMBER,Data0025.MANU_PART_DESC,');
    sql.Add('Data0060.STATUS, ''有效的'' AS spwang,Data0060.PROD_REL,data0060.PARTS_ORDERED,');
    SQL.Add('data0060.ORIG_SCHED_SHIP_DATE,data0060.SCH_DATE');
    sql.Add('FROM  Data0060 INNER JOIN Data0010 ON');
    sql.Add('Data0060.CUSTOMER_PTR = Data0010.RKEY INNER JOIN');
    sql.Add('Data0097 ON Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY INNER JOIN');
    sql.Add('Data0025 ON Data0060.CUST_PART_PTR = Data0025.RKEY INNER JOIN');
    sql.Add('Data0100 ON Data0010.RKEY = Data0100.CUSTOMER_PTR');
    sql.Add('WHERE (Data0060.STATUS = 1) AND (dbo.Data0060.PROD_REL = ''2'')');   //有效订单,已确认
    sql.Add('and (dbo.Data0060.ISSUED_QTY = 0)');                                 //未投产
    sql.Add('and Data0100.CSI_PTR='+common.rkey73);
    sql.Add('ORDER BY Data0060.SALES_ORDER');
    end;
  form5.ADOQuery1.Open;
  form5.Edit1.Text:=trim(edit1.Text);
  if form5.ADOQuery1.IsEmpty then
   begin
    messagedlg('输入的定单不正确,该定单未被确认或者已投产',mterror,[mbcancel],0);
    edit1.SetFocus;
   end
  else
  if form5.ShowModal=mrok then
   begin
    edit1.Text:=form5.ADOQuery1.fieldbyname('sales_order').AsString;
    edit1.Font.Color:=clwindowtext;
    label2.Caption:=form5.ADOQuery1.fieldbyname('rkey').AsString;
   end
  else
   edit1.SetFocus; 
 finally
  form5.free;
 end;
end;

procedure TForm4.Edit1Click(Sender: TObject);
begin
if edit1.Font.Color=clwindowtext then
 begin
  edit1.SelectAll;
  edit1.Font.Color:=clblue;
 end;
end;

procedure TForm4.Edit1Exit(Sender: TObject);
begin
 try
  form5:=Tform5.Create(application);
  if (strtoint(vprev) = 2) then    //按系统用户绑定客户代码确认
   with form5.ADOQuery1 do
    begin
    close;
    sql.Clear;
    sql.Add('SELECT TOP 100 PERCENT Data0060.RKEY,Data0060.SALES_ORDER,');
    sql.Add('Data0010.ABBR_NAME,Data0097.PO_NUMBER,');
    sql.Add('Data0025.MANU_PART_NUMBER,Data0025.MANU_PART_DESC,');
    sql.Add('Data0060.STATUS, ''有效的'' AS spwang,Data0060.PROD_REL,data0060.PARTS_ORDERED,');
    SQL.Add('data0060.ORIG_SCHED_SHIP_DATE,data0060.SCH_DATE');
    sql.Add('FROM Data0060 INNER JOIN Data0010 ON');
    sql.Add('Data0060.CUSTOMER_PTR = Data0010.RKEY INNER JOIN');
    sql.Add('Data0097 ON Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY INNER JOIN');
    sql.Add('Data0025 ON Data0060.CUST_PART_PTR = Data0025.RKEY INNER JOIN');
    sql.Add('Data0100 ON Data0010.RKEY = Data0100.CUSTOMER_PTR');
    sql.Add('WHERE (Data0060.STATUS = 1) AND (dbo.Data0060.PROD_REL = ''2'' OR');
    sql.Add('Data0060.PROD_REL = ''3'')');
    sql.Add('and Data0100.CSI_PTR='+common.rkey73);
    sql.Add('ORDER BY Data0060.SALES_ORDER');
    end;
  form5.ADOQuery1.Open;  
  form5.Edit1.Text:=trim(edit1.Text);
 if Comparetext(trim(edit1.Text),trim(form5.ADOQuery1.Fieldbyname('sales_order').AsString))=0 then
   begin
    edit1.Font.Color:=clwindowtext;
    label2.Caption:=form5.ADOQuery1.fieldbyname('rkey').AsString;
   end;
 finally
  form5.free;
 end;
end;

procedure TForm4.BitBtn1Click(Sender: TObject);
begin
if edit1.Font.Color=clblue then
 begin
  messagedlg('输入的定单不正确,该定单未被确认或者已投产',mterror,[mbcancel],0);
  edit1.SetFocus;
 end
else
 with dm.ADOQuery2 do
  begin
   if active=true then active:=false;
   sql.Clear;
   sql.Add('select conf_by_empl_ptr,prod_rel,conf_date,to_be_confirmed,');
   sql.Add('parts_ordered');
   sql.Add('from data0060');
   sql.Add('WHERE data0060.rkey='+label2.Caption);
   active:=true;
   edit;
   fieldvalues['conf_date'] := null;
   fieldvalues['prod_rel'] := '1';  //使成为未确认
   fieldvalues['conf_by_empl_ptr'] := null;
   fieldvalues['to_be_confirmed'] :=fieldvalues['parts_ordered'];
   post;
   form4.Close;
  end;
end;

end.
