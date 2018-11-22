unit update_stdcost;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, DB, ADODB, Grids, DBGrids;

type
  TForm5 = class(TForm)
    RadioGroup1: TRadioGroup;
    Edit1: TEdit;
    Label1: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    DTpk1: TDateTimePicker;
    DTpk2: TDateTimePicker;
    Label3: TLabel;
    Bevel1: TBevel;
    Label5: TLabel;
    Label6: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ProgressBar1: TProgressBar;
    Label7: TLabel;
    Bevel2: TBevel;
    Label8: TLabel;
    Label9: TLabel;
    ado17: TADOQuery;
    ado22: TADOQuery;
    ado17rkey: TAutoIncField;
    ado17STD_COST: TFloatField;
    ado22INVENTORY_PTR: TIntegerField;
    adoavl22: TADOQuery;
    adoavl22INVENTORY_PTR: TIntegerField;
    adoavl22AVG01: TFloatField;
    ado22Expr1: TStringField;
    ComboBox1: TComboBox;
    Label10: TLabel;
    ado207: TADOQuery;
    ADOavl207: TADOQuery;
    ado207INVENTORY_PTR: TIntegerField;
    ado207Expr1: TStringField;
    ADOavl207INVENTORY_PTR: TIntegerField;
    ADOavl207AVG01: TBCDField;
    ado17STOCK_UNIT_PTR: TIntegerField;
    ado22LOCATION_PTR_FROM: TIntegerField;
    adoavl22LOCATION_PTR_FROM: TIntegerField;
    ado207LOCATION_PTR_FROM: TIntegerField;
    ADOavl207LOCATION_PTR_FROM: TIntegerField;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses damo,inv_serach ;

{$R *.dfm}

procedure TForm5.FormActivate(Sender: TObject);
begin
 dtpk2.Date:=date();
 dtpk1.Date:=date()-60;
end;

procedure TForm5.BitBtn1Click(Sender: TObject);
begin
 try
  form_inv := tform_inv.Create(application);
  form_inv.ADOQuery1.Open;
  if form_inv.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找到符合条件的记录',mtinformation,[mbok],0);
    edit2.SetFocus;
   end
  else
   if form_inv.ShowModal=mrok then
    begin
     edit2.Text := form_inv.adoquery1inv_part_number.value;
     label8.Caption := form_inv.ADOQuery1INV_name.Value;
    end
   else
    edit2.SetFocus;
 finally
  form_inv.free;
 end;
end;

procedure TForm5.BitBtn2Click(Sender: TObject);
begin
 try
  form_inv := tform_inv.Create(application);
  form_inv.ADOQuery1.Open;
  if form_inv.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找到符合条件的记录',mtinformation,[mbok],0);
    edit3.SetFocus;
   end
  else
   if form_inv.ShowModal=mrok then
    begin
     edit3.Text := form_inv.adoquery1inv_part_number.value;
     label9.Caption := form_inv.ADOQuery1INV_name.Value;
    end
   else
    edit3.SetFocus;
 finally
  form_inv.free;
 end;
end;

procedure TForm5.Button1Click(Sender: TObject);
var
 s,price,exch:string;
begin
 if dtpk2.Date<dtpk1.Date then
  begin
   messagedlg('日期范围设置不正确!',mtinformation,[mbok],0);
   dtpk2.SetFocus;
   exit;
  end;
 if (trim(edit2.Text)='') or (trim(edit3.Text)='') then
  begin
   messagedlg('原材料范围不能为空!',mtinformation,[mbok],0);
   edit2.SetFocus;
   exit;
  end;
 if edit3.Text<edit2.Text then
  begin
   messagedlg('结束原材料不能小于开始原材料!',mtinformation,[mbok],0);
   edit3.SetFocus;
   exit;
  end;

 Screen.Cursor := crHourGlass;
 ado17.Close;
 ado17.Parameters[0].Value:=edit2.Text;
 ado17.Parameters[1].Value:=edit3.Text;
 ado17.Open;

 dm.ADOConnection1.BeginTrans; //开始事物处理
if combobox1.ItemIndex=0 then    //入库价格
case radiogroup1.ItemIndex of
 0:
  begin
   ado22.Close;
   ado22.Parameters[0].Value:=dtpk1.Date;
   ado22.Parameters[1].Value:=dtpk2.Date;
   ado22.Open;
   while not ado22.Eof do
    begin
     s := ado22Expr1.Value;
     price := trim(copy(s,pos(' ',s)+1,pos(',',s)-pos(' ',s)-1)); //价格
     exch := trim(copy(s,pos(',',s)+1,length(s)-pos(',',s)));     //汇率
     if ado17.Locate('rkey;STOCK_UNIT_PTR',
       vararrayof([ado22inventory_ptr.Value,ado22LOCATION_PTR_FROM.Value]),[]) then
      begin //查找17
         ado17.Edit;
         ado17std_cost.AsString:=formatfloat('0.000000',strtofloat(price)*strtofloat(exch));
         ado17.Post;
      end;
      if progressbar1.Position<100 then
       if ado22.RecNo<>ado22.RecordCount then
        progressbar1.Position:=progressbar1.Position+1
       else
        progressbar1.Position:=100;
     ado22.Next;
    end;
  end;
 1:
  begin
   adoavl22.Close;
   adoavl22.Parameters[0].Value:=dtpk1.Date;
   adoavl22.Parameters[1].Value:=dtpk2.Date;
   adoavl22.Open;

   while not adoavl22.Eof do
    begin
    if ado17.Locate('rkey;STOCK_UNIT_PTR',
       vararrayof([adoavl22INVENTORY_PTR.Value,adoavl22LOCATION_PTR_FROM.Value]),[]) then
      begin //查找17

         ado17.Edit;
         ado17std_cost.AsString:=formatfloat('0.000000',adoavl22AVG01.Value);
         ado17.Post;

      end;

      if progressbar1.Position<100 then
       if adoavl22.RecNo<>adoavl22.RecordCount then
        progressbar1.Position:=progressbar1.Position+1
       else
        progressbar1.Position:=100;

     adoavl22.Next;
    end;
  end;
end
else              //发料价格
case radiogroup1.ItemIndex of
0:
begin
   ado207.Close;
   ado207.Parameters[0].Value:=dtpk1.Date;
   ado207.Parameters[1].Value:=dtpk2.Date;
   ado207.Open;
   while not ado207.Eof do
    begin
     s := ado207Expr1.Value;
     price := trim(copy(s,pos(' ',s)+1,pos(',',s)-pos(' ',s)-1)); //价格
     exch := trim(copy(s,pos(',',s)+1,length(s)-pos(',',s)));     //汇率
     if ado17.Locate('rkey;STOCK_UNIT_PTR',
      vararrayof([ado207INVENTORY_PTR.Value,ado207LOCATION_PTR_FROM.Value]),[]) then
      begin //查找17

         ado17.Edit;
         ado17std_cost.AsString:=formatfloat('0.000000',strtofloat(price)*strtofloat(exch));
         ado17.Post;

      end;
      if progressbar1.Position<100 then
       if ado207.RecNo<>ado207.RecordCount then
        progressbar1.Position:=progressbar1.Position+1
       else
        progressbar1.Position:=100;
     ado207.Next;
    end;
end;
1:
begin
   adoavl207.Close;
   adoavl207.Parameters[0].Value:=dtpk1.Date;
   adoavl207.Parameters[1].Value:=dtpk2.Date;
   adoavl207.Open;

   while not adoavl207.Eof do
    begin
     if ado17.Locate('rkey;STOCK_UNIT_PTR',
      vararrayof([ADOavl207INVENTORY_PTR.Value,ADOavl207LOCATION_PTR_FROM.Value]),[]) then
      begin //查找17

         ado17.Edit;
         ado17std_cost.AsString:=formatfloat('0.000000',ADOavl207AVG01.Value);
         ado17.Post;

      end;

      if progressbar1.Position<100 then
       if ADOavl207.RecNo<>ADOavl207.RecordCount then
        progressbar1.Position:=progressbar1.Position+1
       else
        progressbar1.Position:=100;

     ADOavl207.Next;
    end;
end;

end;

 try
  ado17.UpdateBatch();
  dm.ADOConnection1.CommitTrans;
  Screen.Cursor := crDefault;
  messagedlg('数据成功更新!',mtinformation,[mbok],0);
 except
  dm.ADOConnection1.RollbackTrans;
  Screen.Cursor := crDefault;
  messagedlg('数据更新失败!',mtinformation,[mbcancel],0);
  exit;
 end;

 //close;
end;

end.
