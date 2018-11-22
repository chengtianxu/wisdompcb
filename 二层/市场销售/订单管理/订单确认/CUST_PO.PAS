unit cust_po;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB;

type
  TForm6 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit3Click(Sender: TObject);
    procedure Edit4Click(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

uses cust_search, confirmation, po_search, damo, display, main;

{$R *.dfm}

procedure TForm6.Button2Click(Sender: TObject);
begin
 close;
end;

procedure TForm6.BitBtn1Click(Sender: TObject);
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
    label5.Caption := frmcustsearch.ADOQuery1.FieldValues['customer_name'];
   end;
 finally
  frmcustsearch.free;
 end;
end;

procedure TForm6.BitBtn2Click(Sender: TObject);
begin
 try
  frmcustsearch:=Tfrmcustsearch.Create(application);
  frmcustsearch.MaskEdit1.Text := trim(edit2.Text);
  if frmcustsearch.ADOQuery1.IsEmpty then
   begin
     application.MessageBox('没有找到相关的记录!','程序确认',mb_OK+
     mb_iconstop+mb_systemmodal);
     edit2.SetFocus;
   end
  else
  if frmcustsearch.ShowModal=mrok then
   begin
    EDIT2.Text := trim(frmcustsearch.ADOQuery1.FieldValues['cust_code']);
    edit2.Font.Color := clwindowtext;
    label6.Caption := frmcustsearch.ADOQuery1.FieldValues['customer_name'];
   end;
 finally
  frmcustsearch.free;
 end;
end;

procedure TForm6.FormShow(Sender: TObject);
begin

 try
  frmcustsearch:=Tfrmcustsearch.Create(application);
  EDIT1.Text := trim(frmcustsearch.ADOQuery1.FieldValues['cust_code']);
  edit1.Font.Color := clwindowtext;
  label5.Caption := frmcustsearch.ADOQuery1.FieldValues['customer_name'];
  frmcustsearch.ADOQuery1.Last;
  EDIT2.Text := trim(frmcustsearch.ADOQuery1.FieldValues['cust_code']);
  edit2.Font.Color := clwindowtext;
  Label7.Caption := edit2.Text;
  label6.Caption := frmcustsearch.ADOQuery1.FieldValues['customer_name'];
 finally
  frmcustsearch.free;
 end;

 try
  form_po:=Tform_po.Create(application);
  form_po.ADOQuery1.Last;
  edit4.Text := trim(form_po.ADOQuery1.FieldValues['po_number']);
  edit4.Font.Color := clwindowtext;
 finally
  form_po.free;
 end;


end;

procedure TForm6.Edit1Click(Sender: TObject);
begin
 if edit1.Font.Color=clwindowtext then
  begin
   edit1.SelectAll;
   edit1.Font.Color:=clblue;
  end;
end;

procedure TForm6.Edit2Click(Sender: TObject);
begin
 if edit2.Font.Color=clwindowtext then
  begin
   edit2.SelectAll;
   edit2.Font.Color:=clblue;
  end;
end;

procedure TForm6.Edit1Exit(Sender: TObject);
begin
 try
  frmcustsearch:=Tfrmcustsearch.Create(application);
  frmcustsearch.MaskEdit1.Text := trim(edit1.Text);
  if Comparetext(trim(edit1.Text),trim(frmcustsearch.ADOQuery1.Fieldbyname('cust_code').AsString))=0 then
   begin
    edit1.Font.Color := clwindowtext;
    label5.Caption := frmcustsearch.ADOQuery1.FieldValues['customer_name'];
   end
  else
   label5.Caption := '';
 finally
  frmcustsearch.free;
 end;
end;

procedure TForm6.Edit2Exit(Sender: TObject);
begin
 try
  frmcustsearch:=Tfrmcustsearch.Create(application);
  frmcustsearch.MaskEdit1.Text := trim(edit2.Text);
  if Comparetext(trim(edit2.Text),trim(frmcustsearch.ADOQuery1.Fieldbyname('cust_code').AsString))=0 then
   begin
    edit2.Font.Color := clwindowtext;
    label6.Caption := frmcustsearch.ADOQuery1.FieldValues['customer_name'];
   end
  else
   label6.Caption := '';
 finally
  frmcustsearch.free;
 end;
end;

procedure TForm6.Button1Click(Sender: TObject);
begin
 try
  form2:=tform2.create(Application);
   with dm.ADOQuery1 do
    begin
    if active=true then active:=false;
    sql.Clear;


      sql.Add('select data0060.rkey,data0060.sales_order,data0060.sch_date,');
      sql.Add('data0097.po_number,data0010.abbr_name as cust_code,data0010.cust_code as cust_code1,');
      sql.Add('data0025.manu_part_number,ORIG_SCHED_SHIP_DATE,');
      sql.Add('data0060.ORIG_REQUEST_DATE,data0060.DUE_DATE,');
      sql.Add('data0060.ENT_DATE,DATA0060.PARTS_ORDERED,DATA0025.manu_PART_DESC,data0025.ORIG_CUSTOMER,data0015.ABBR_NAME');
      sql.Add('from data0060,data0010,data0097,data0025,data0015');
      sql.Add('where data0060.customer_ptr=data0010.rkey');
      sql.add('and data0060.purchase_order_ptr=data0097.rkey');
      sql.add('and data0060.cust_part_ptr=data0025.rkey');
      sql.add('and data0060.SHIP_REG_TAX_ID=data0015.rkey');
      sql.add('and data0060.prod_rel=''1'' and data0060.status=1 and');
      sql.Add('(data0060.quote_price<>0) and (data0060.quote_price<>2)');
      sql.Add('and cust_code>=:cust1');
      sql.Add('and cust_code<=:cust2');
      sql.Add('and po_number>=:po1');
      sql.Add('and po_number<=:po2');

     case form3.RdG2.ItemIndex of
       0:sql.Add('order by data0010.cust_code');
       1:sql.Add('order by data0025.manu_part_number');
       2:sql.Add('order by data0060.sch_date');
       3:sql.Add('order by data0060.sales_order');
     end;
     Parameters.ParamValues['cust1']:=trim(edit1.Text);
     if trim(edit2.Text)<>'' then
      Parameters.ParamValues['cust2']:=trim(edit2.Text)
     else
      Parameters.ParamValues['cust2']:=label7.Caption;
     Parameters.ParamValues['po1']:=trim(edit3.Text);
     Parameters.ParamValues['po2']:=trim(edit4.Text);
     active:=true;
    end;
  form2.ShowModal;
 finally
  form2.free;
  form6.Close;
 end;
end;

procedure TForm6.BitBtn3Click(Sender: TObject);
begin

 try
  form_po:=Tform_po.Create(application);
  form_po.Edit1.Text := trim(edit3.Text);
  if form_po.ADOQuery1.IsEmpty then
   begin
     messagedlg('没有找到相关记录!',mtError,[mbcancel],0);
     edit3.SetFocus;
     exit;
   end;
  if form_po.ShowModal=mrok then
   begin
    edit3.Text := trim(form_po.ADOQuery1.FieldValues['po_number']);
    edit3.Font.Color := clwindowtext;
   end;
 finally
  form_po.free;
 end;

end;

procedure TForm6.BitBtn4Click(Sender: TObject);
begin

 try
  form_po:=Tform_po.Create(application);
  form_po.Edit1.Text := trim(edit4.Text);
  if form_po.ADOQuery1.IsEmpty then
   begin
     messagedlg('没有找到相关记录!',mtError,[mbcancel],0);
     edit4.SetFocus;
     exit;
   end;

  if form_po.ShowModal=mrok then
   begin
    edit4.Text := trim(form_po.ADOQuery1.FieldValues['po_number']);
    edit4.Font.Color := clwindowtext;
   end;
 finally
  form_po.free;
 end;


end;

procedure TForm6.Edit3Click(Sender: TObject);
begin
 if edit3.Font.Color=clwindowtext then
  begin
   edit3.SelectAll;
   edit3.Font.Color:=clblue;
  end;
end;

procedure TForm6.Edit4Click(Sender: TObject);
begin
 if edit4.Font.Color=clwindowtext then
  begin
   edit4.SelectAll;
   edit4.Font.Color:=clblue;
  end;
end;

procedure TForm6.Edit3Exit(Sender: TObject);
begin

 try
  form_po:=Tform_po.Create(application);
  form_po.Edit1.Text := trim(edit3.Text);
  if Comparetext(trim(edit3.Text),trim(form_po.ADOQuery1.Fieldbyname('po_number').AsString))=0 then
    edit3.Font.Color := clwindowtext;
 finally
  form_po.free;
 end;

end;

procedure TForm6.Edit4Exit(Sender: TObject);
begin
 try
  form_po:=Tform_po.Create(application);
  form_po.Edit1.Text := trim(edit4.Text);
  if Comparetext(trim(edit4.Text),trim(form_po.ADOQuery1.Fieldbyname('po_number').AsString))=0 then
    edit4.Font.Color := clwindowtext;
 finally
  form_po.free;
 end;

end;

end.
