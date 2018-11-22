unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons,mxcommon,dateutils;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    DTPk1: TDateTimePicker;
    DTPk2: TDateTimePicker;
    Bevel1: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    RGp2: TRadioGroup;
    RadioGroup1: TRadioGroup;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label5: TLabel;
    ComboBox2: TComboBox;
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
   rkey15:array of integer;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses damo, collect, sales_customer,common;

{$R *.dfm}

procedure TForm1.Button2Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TForm1.FormActivate(Sender: TObject);
var
 i:integer;
begin
if  dm.ADOConnection1.Connected then
 begin
  dtpk2.Date:=getsystem_date(dm.ADOQuery1,1);
  dtpk1.Date:=dtpk2.Date-dayof(dtpk2.Date)+1;

  with dm.ADOQuery1 do
   begin
    close;
    sql.Text:='select rkey,abbr_name from data0015 order by warehouse_code';
    open;
    i:=0;
    setlength(rkey15,RecordCount);
    while not eof do
     begin
      self.ComboBox2.Items.Add(fieldbyname('abbr_name').AsString);
      rkey15[i]:=fieldbyname('rkey').AsInteger;
      inc(i);
      next;
     end;
    self.ComboBox2.Items.Add('全部');
    combobox2.ItemIndex:=combobox2.Items.Count-1;
    close;
   end;
 end;

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
if self.RadioGroup1.ItemIndex=0 then
try
 form2:=tform2.Create(application);
 if  combobox1.ItemIndex=0 then
 try
 form2.DecisionGrid1.DecisionSource:=form2.DecisionSource2;
 form2.DecisionPivot1.DecisionSource:=form2.DecisionSource2;
 with form2.ADO102 do
  begin
   Close;
   Parameters[0].Value:=dtpk1.Date;
   Parameters[1].Value:=dtpk2.Date+1;
   case rgp2.ItemIndex of
    0: sql.Insert(SQL.Count-4,'AND (Data0025.TTYPE = 0)');
    1: sql.Insert(SQL.Count-4,'AND (Data0025.TTYPE = 1)');
   end;
   if combobox2.ItemIndex<>combobox2.Items.Count-1 then
   sql.Insert(sql.Count-4,'and (data0060.SHIP_REG_TAX_ID='+inttostr(rkey15[combobox2.ItemIndex])+')');
   Open;
  end;
 except
  messagedlg('没有数据,找不到符合条件的记录',mtinformation,[mbok],0);
  exit;
 end
 else
 try
 form2.DecisionGrid1.DecisionSource:=form2.DecisionSource1;
 form2.DecisionPivot1.DecisionSource:=form2.DecisionSource1;
 with form2.ADO64_102 do
  begin
   Close;
   Parameters[0].Value:=dtpk1.Date;
   Parameters[1].Value:=dtpk2.Date+1;
   case rgp2.ItemIndex of
    0:sql.Insert(SQL.Count-4,'AND (Data0025.TTYPE = 0)');
    1:sql.Insert(SQL.Count-4,'AND (Data0025.TTYPE = 1)');
   end;
   if combobox2.ItemIndex<>combobox2.Items.Count-1 then
   sql.Insert(sql.Count-4, 'and (data0060.SHIP_REG_TAX_ID='+inttostr(rkey15[combobox2.ItemIndex])+')');
   Open;
  end;
 except
  messagedlg('没有数据,找不到符合条件的记录',mtinformation,[mbok],0);
  exit;
 end;

 if combobox1.ItemIndex=0 then
  begin
  form2.DataSource1.DataSet:=form2.ADO60;
  with form2.ADO60 do
  begin
   close;
   Parameters[0].Value:=dtpk1.Date;
   Parameters[1].Value:=dtpk2.Date+1;
     case rgp2.ItemIndex of
      0:sql.Insert(SQL.Count-1,'AND (Data0025.TTYPE = 0)');
      1:sql.Insert(SQL.Count-1,'AND (Data0025.TTYPE = 1)');
     end;
   if combobox2.ItemIndex<>combobox2.Items.Count-1 then
   sql.Insert(sql.Count-1 ,'and (data0060.SHIP_REG_TAX_ID='+inttostr(rkey15[combobox2.ItemIndex])+')');
   open;
  end;
  end
 else
  begin
  form2.DataSource1.DataSet:=form2.ADO64_60;
  with form2.ADO64_60 do
  begin
   close;
   Parameters[0].Value:=dtpk1.Date;
   Parameters[1].Value:=dtpk2.Date+1;
     case rgp2.ItemIndex of
      0:sql.Insert(SQL.Count-1,'AND (Data0025.TTYPE = 0)');
      1:sql.Insert(SQL.Count-1,'AND (Data0025.TTYPE = 1)');
     end;
   if combobox2.ItemIndex<>combobox2.Items.Count-1 then
   sql.Insert(sql.Count-1, 'and (data0060.SHIP_REG_TAX_ID='+inttostr(rkey15[combobox2.ItemIndex])+')');
   open;
  end;
  end;
if combobox1.ItemIndex=0 then
 with form2.adoquery1 do
  begin
   close;
   Parameters[0].Value:=dtpk1.Date;
   Parameters[1].Value:=dtpk2.Date+1;
     case rgp2.ItemIndex of
      0:sql.Insert(SQL.Count-3,'AND (Data0025.TTYPE = 0)');
      1:sql.Insert(SQL.Count-3,'AND (Data0025.TTYPE = 1)');
     end;
   if combobox2.ItemIndex<>combobox2.Items.Count-1 then
   sql.Insert(sql.Count-3, 'and (data0060.SHIP_REG_TAX_ID='+inttostr(rkey15[combobox2.ItemIndex])+')');
   open;
  end
else
 with form2.adoquery2 do
  begin
   close;
   Parameters[0].Value:=dtpk1.Date;
   Parameters[1].Value:=dtpk2.Date+1;
     case rgp2.ItemIndex of
      0:sql.Insert(SQL.Count-3,'AND (Data0025.TTYPE = 0)');
      1:sql.Insert(SQL.Count-3,'AND (Data0025.TTYPE = 1)');
     end;
   if combobox2.ItemIndex<>combobox2.Items.Count-1 then
   sql.Insert(sql.Count-3, 'and (data0060.SHIP_REG_TAX_ID='+inttostr(rkey15[combobox2.ItemIndex])+')');
   open;
  end;

 form2.ShowModal;
finally
  form2.Free;
end
else
try
 form3:=tform3.Create(application);
if combobox1.ItemIndex=0 then
 with form3.adoquery1 do
  begin
   close;
   Parameters[0].Value:=dtpk1.Date;
   Parameters[1].Value:=dtpk2.Date+1;
     case rgp2.ItemIndex of
      0: sql.Insert(SQL.Count-5,'AND (Data0025.TTYPE = 0)');
      1: sql.Insert(SQL.Count-5,'AND (Data0025.TTYPE = 1)');
     end;
   if combobox2.ItemIndex<>combobox2.Items.Count-1 then
   sql.Insert(sql.Count-5,'and (data0060.SHIP_REG_TAX_ID='+inttostr(rkey15[combobox2.ItemIndex])+')');
   open;
   form3.DataSource1.DataSet:=form3.ADOQuery1;
  end
else
 with form3.adoquery3 do
  begin
   close;
   Parameters[0].Value:=dtpk1.Date;
   Parameters[1].Value:=dtpk2.Date+1;
     case rgp2.ItemIndex of
      0: sql.Insert(SQL.Count-5,'AND (Data0025.TTYPE = 0)');
      1: sql.Insert(SQL.Count-5,'AND (Data0025.TTYPE = 1)');
     end;
   if combobox2.ItemIndex<>combobox2.Items.Count-1 then
   sql.Insert(sql.Count-5,'and (data0060.SHIP_REG_TAX_ID='+inttostr(rkey15[combobox2.ItemIndex])+')');
   open;
   form3.DataSource1.DataSet:=form3.ADOQuery3;
  end;

if combobox1.ItemIndex=0 then
 with form3.adoquery2 do
  begin
   close;
   Parameters[0].Value:=dtpk1.Date;
   Parameters[1].Value:=dtpk2.Date+1;
   case rgp2.ItemIndex of
    0: sql.Insert(SQL.Count-3,'AND (Data0025.TTYPE = 0)');
    1: sql.Insert(SQL.Count-3,'AND (Data0025.TTYPE = 1)');
   end;
   if combobox2.ItemIndex<>combobox2.Items.Count-1 then
   sql.Insert(sql.Count-3,'and (data0060.SHIP_REG_TAX_ID='+inttostr(rkey15[combobox2.ItemIndex])+')');
   open;
   form3.DataSource2.DataSet:=form3.ADOQuery2;
  end
else
 with form3.adoquery4 do
  begin
   close;
   Parameters[0].Value:=dtpk1.Date;
   Parameters[1].Value:=dtpk2.Date+1;
   case rgp2.ItemIndex of
    0: sql.Insert(SQL.Count-3,'AND (Data0025.TTYPE = 0)');
    1: sql.Insert(SQL.Count-3,'AND (Data0025.TTYPE = 1)');
   end;
   if combobox2.ItemIndex<>combobox2.Items.Count-1 then
   sql.Insert(sql.Count-3,'and (data0060.SHIP_REG_TAX_ID='+inttostr(rkey15[combobox2.ItemIndex])+')');
   open;
   form3.DataSource2.DataSet:=form3.ADOQuery4;   
  end;
  form3.ShowModal;
finally
 form3.Free;
end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 if not app_init_2(dm.ADOConnection1) then
  begin
   showmsg('程序起动失败,请联系管理员!',1);
   application.Terminate;
  end;
  self.Caption:=application.Title;
 
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
end;

end.
