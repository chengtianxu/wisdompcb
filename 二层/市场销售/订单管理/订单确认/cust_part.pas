unit cust_part;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm7 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

uses cust_search, part_search,damo, confirmation, display, cust_po, main;

{$R *.dfm}

procedure TForm7.BitBtn1Click(Sender: TObject);
begin

 try
  frmcustsearch:=Tfrmcustsearch.Create(application);
  frmcustsearch.MaskEdit1.Text := trim(edit1.Text);
  if frmcustsearch.ADOQuery1.IsEmpty then
   begin
     application.MessageBox('没有找到相关的记录!','程序确认',mb_OK+
     mb_iconstop+mb_systemmodal);
    edit1.SetFocus;
    exit;
   end;
  if frmcustsearch.ShowModal=mrok then
   begin
    EDIT1.Text := trim(frmcustsearch.ADOQuery1.FieldValues['cust_code']);
    edit1.Font.Color := clwindowtext;
    edit2.SetFocus;
    label5.Caption := frmcustsearch.ADOQuery1.FieldValues['customer_name'];
    label6.Caption := frmcustsearch.ADOQuery1.fieldbyname('rkey').AsString;
   end;
 finally
  frmcustsearch.free;
 end;

end;

procedure TForm7.BitBtn2Click(Sender: TObject);
begin
  try
  frmcustpart:=Tfrmcustpart.Create(application);
  if label6.Caption<>'' then
   with frmcustpart.ADOQuery1 do
    begin
    active:=false;
    sql.Clear;
    sql.Add(' select rkey,manu_part_number,manu_part_desc,ANALYSIS_CODE_2,customer_ptr');
    sql.Add('from data0025');
    sql.Add('where customer_ptr='+label6.Caption);
    sql.add('order by manu_part_number');
    active:=true;
    end;
  frmcustpart.Edit1.Text := trim(edit2.Text);
  if frmcustpart.ADOQuery1.IsEmpty then
   begin
     application.MessageBox('没有找到相关的记录!','程序确认',mb_OK+
     mb_iconstop+mb_systemmodal);
    edit2.SetFocus;
    exit;
   end;
  if frmcustpart.ShowModal=mrok then
   begin
    EDIT2.Text := trim(frmcustpart.ADOQuery1.FieldValues['manu_part_number']);
    edit2.Font.Color := clwindowtext;
    label4.Caption := frmcustpart.ADOQuery1.FieldValues['manu_part_desc'];
    edit3.Text := frmcustpart.ADOQuery1.Fieldbyname('ANALYSIS_CODE_2').AsString;
    label7.Caption := frmcustpart.ADOQuery1.Fieldbyname('rkey').AsString;
     if label6.Caption='' then
     with dm.ADOQuery2 do
     begin
      if active=true then active:=false;
      sql.Clear;
      sql.Add('select rkey,cust_code,customer_name from data0010');
      sql.Add('where rkey='+frmcustpart.ADOQuery1.fieldbyname('customer_ptr').AsString);
      active:=true;
      EDIT1.Text := trim(FieldValues['cust_code']);
      edit1.Font.Color := clwindowtext;
      label5.Caption := FieldValues['customer_name'];
      label6.Caption := fieldbyname('rkey').AsString;
     end;
    button1.SetFocus;
   end;
 finally
  frmcustpart.free;
 end;

end;

procedure TForm7.Edit1Click(Sender: TObject);
begin
 if edit1.Font.Color=clwindowtext then
  begin
   edit1.SelectAll;
   edit1.Font.Color:=clblue;
  end;
end;

procedure TForm7.Edit2Click(Sender: TObject);
begin
 if edit2.Font.Color=clwindowtext then
  begin
   edit2.SelectAll;
   edit2.Font.Color:=clblue;
  end;
end;

procedure TForm7.Edit1Exit(Sender: TObject);
begin

 try
  frmcustsearch:=Tfrmcustsearch.Create(application);
  frmcustsearch.MaskEdit1.Text := trim(edit1.Text);
 if Comparetext(trim(edit1.Text),trim(frmcustsearch.ADOQuery1.Fieldbyname('cust_code').AsString))=0 then
   begin
    edit1.Font.Color := clwindowtext;
    label5.Caption := frmcustsearch.ADOQuery1.fieldbyname('customer_name').AsString;
    label6.Caption := frmcustsearch.ADOQuery1.fieldbyname('rkey').AsString;
   end
 else
  begin
    label5.Caption := '';
    label6.Caption := '';
  end;
 finally
  frmcustsearch.free;
 end;

end;

procedure TForm7.Edit2Exit(Sender: TObject);
begin
  try
  frmcustpart:=Tfrmcustpart.Create(application);
  if label6.Caption<>'' then
   with frmcustpart.ADOQuery1 do
    begin
    active:=false;
    sql.Clear;
    sql.Add(' select rkey,manu_part_number,manu_part_desc,ANALYSIS_CODE_2,customer_ptr');
    sql.Add('from data0025');
    sql.Add('where customer_ptr='+label6.Caption);
    sql.add('order by manu_part_number');
    active:=true;
    end;
  frmcustpart.Edit1.Text := trim(edit2.Text);
  if Comparetext(trim(edit2.Text),trim(frmcustpart.ADOQuery1.Fieldbyname('manu_part_number').AsString))=0 then
   begin
    edit2.Font.Color := clwindowtext;
    label4.Caption := frmcustpart.ADOQuery1.fieldbyname('manu_part_desc').AsString;
    edit3.Text := frmcustpart.ADOQuery1.fieldbyname('ANALYSIS_CODE_2').AsString;
    label7.Caption := frmcustpart.ADOQuery1.Fieldbyname('rkey').AsString;
    if label6.Caption='' then
     with dm.ADOQuery2 do
     begin
      if active=true then active:=false;
      sql.Clear;
      sql.Add('select rkey,cust_code,customer_name from data0010');
      sql.Add('where rkey='+frmcustpart.ADOQuery1.fieldbyname('customer_ptr').AsString);
      active:=true;
      EDIT1.Text := trim(FieldValues['cust_code']);
      edit1.Font.Color := clwindowtext;
      label5.Caption := FieldValues['customer_name'];
      label6.Caption := fieldbyname('rkey').AsString;
     end;
   end;
 finally
  frmcustpart.free;
 end;
end;

procedure TForm7.Button1Click(Sender: TObject);
begin
 IF trim(edit2.Text)='' then
  begin
   messagedlg('请输入正确的客户部品',mtError,[mbcancel],0);
   edit2.SetFocus;
   exit;
  end;
 try
  form2:=tform2.create(Application);
   with dm.ADOQuery1 do
    begin
    if active=true then active:=false;
    sql.Clear;

      sql.Add('select data0060.rkey,data0060.sales_order,data0060.sch_date,');
      sql.Add('data0097.po_number,data0010.abbr_name as cust_code,data0010.cust_code as cust_code1,');
      sql.Add('data0025.manu_part_number,ORIG_SCHED_SHIP_DATE,');
      SQL.Add('data0060.ORIG_REQUEST_DATE,data0060.DUE_DATE,');
      sql.Add('data0060.ENT_DATE,DATA0060.PARTS_ORDERED,DATA0025.manu_PART_DESC,data0025.ORIG_CUSTOMER,data0015.ABBR_NAME');
      sql.Add('from data0060,data0010,data0097,data0025,data0015');
      sql.Add('where data0060.customer_ptr=data0010.rkey');
      sql.add('and data0060.purchase_order_ptr=data0097.rkey');
      sql.add('and data0060.cust_part_ptr=data0025.rkey');
      sql.add('and data0060.SHIP_REG_TAX_ID=data0015.rkey');
      sql.add('and data0060.prod_rel=''1'' and data0060.status=1 and');
      sql.Add('(data0060.quote_price<>0) and (data0060.quote_price<>2)');
      Sql.Add('and data0060.cust_part_ptr='+label7.Caption);

     case form3.RdG2.ItemIndex of
       0:sql.Add('order by data0010.cust_code');
       1:sql.Add('order by data0025.manu_part_number');
       2:sql.Add('order by data0060.sch_date');
       3:sql.Add('order by data0060.sales_order');
     end;
    active:=true;
    end;
  form2.ShowModal;
 finally
  form2.free;
  form7.Close;
 end;
end;

END.
