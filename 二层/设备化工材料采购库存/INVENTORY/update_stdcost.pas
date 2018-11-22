unit update_stdcost;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, DB, ADODB, Grids, DBGrids;

type
  TForm5 = class(TForm)
    RadioGroup1: TRadioGroup;
    CheckBox1: TCheckBox;
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
    Button1: TButton;
    Button2: TButton;
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

uses inv_serach, damo;

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
 ado17.Close;
 ado17.Parameters[0].Value:=edit2.Text;
 ado17.Parameters[1].Value:=edit3.Text;
 ado17.Open;

 dm.ADOConnection1.BeginTrans; //开始事物处理
case radiogroup1.ItemIndex of
 0:
  begin
   ado22.Close;
   ado22.Parameters[0].Value:=dtpk1.Date;
   ado22.Parameters[1].Value:=dtpk2.Date;
   ado22.Parameters[2].Value:=edit2.Text;
   ado22.Parameters[3].Value:=edit3.Text;
   ado22.Open;
   while not ado22.Eof do
    begin
     s := ado22Expr1.Value;
     price := trim(copy(s,pos(' ',s)+1,pos(',',s)-pos(' ',s)-1)); //价格
     exch := trim(copy(s,pos(',',s)+1,length(s)-pos(',',s)));     //汇率
     if ado17.Locate('rkey',ado22inventory_ptr.Value,[]) then
      begin //查找17
       if not checkbox1.Checked then
        begin
         ado17.Edit;
         ado17std_cost.AsString:=formatfloat('0.000000',strtofloat(price)*strtofloat(exch));
         ado17.Post;
        end
       else //不更新为零的标准成本
        if ado17std_cost.Value<>0 then
         begin
          ado17.Edit;
          ado17std_cost.AsString:=formatfloat('0.000000',strtofloat(price)*strtofloat(exch));
          ado17.Post;
         end;
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
   while not ado17.Eof do         //用零更新标准成本
    begin
     ado17.Edit;
     if not checkbox1.Checked then
      ado17std_cost.Value:=0
     else //不更新为零的标准成本
      if ado17std_cost.Value<>0 then
       ado17std_cost.Value:=0;
     ado17.Post;
     ado17.Next;
    end;
  end;
 2:
  begin
   adoavl22.Close;
   adoavl22.Parameters[0].Value:=dtpk1.Date;
   adoavl22.Parameters[1].Value:=dtpk2.Date;
   adoavl22.Parameters[2].Value:=edit2.Text;
   adoavl22.Parameters[3].Value:=edit3.Text;
   adoavl22.Open;

   while not adoavl22.Eof do
    begin

     if ado17.Locate('rkey',adoavl22.fieldbyname('inventory_ptr').AsInteger,[]) then
      begin //查找17
       if not checkbox1.Checked then
        begin
         ado17.Edit;
         ado17std_cost.AsString:=formatfloat('0.000000',adoavl22AVG01.Value);
         ado17.Post;
        end
       else //不更新为零的标准成本
        if ado17std_cost.Value<>0 then
         begin
          ado17.Edit;
          ado17std_cost.AsString:=formatfloat('0.000000',adoavl22AVG01.Value);
          ado17.Post;
         end;
      end;

      if progressbar1.Position<100 then
       if adoavl22.RecNo<>adoavl22.RecordCount then
        progressbar1.Position:=progressbar1.Position+1
       else
        progressbar1.Position:=100;

     adoavl22.Next;
    end;

  end;
end;
 try
  ado17.UpdateBatch();
  dm.ADOConnection1.CommitTrans;
 except
  dm.ADOConnection1.RollbackTrans;
  messagedlg('数据更新失败!',mtinformation,[mbcancel],0);
  exit;
 end;
 messagedlg('数据成功更新!',mtinformation,[mbcancel],0);
 //close;
end;

end.
