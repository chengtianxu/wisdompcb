unit select_calculate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    BitBtn1: TBitBtn;
    edit1: TEdit;
    edit2: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
   function find_wip_invt(pcb_date:string):boolean;
   function find_error(rm_date,end_date: string): boolean;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses damo, select_period;

{$R *.dfm}

function TForm2.find_error(rm_date,end_date: string): boolean;
begin
with dm.ADOQuery1 do
begin
 close;
 sql.Text:='select rkey from data0451'+#13+
 'where fm_date='''+rm_date+''''+#13+
 'and end_date='''+end_date+'''';
 open;
 if not IsEmpty then
  result:=true
 else
  result:=false;
end;
end;

function TForm2.find_wip_invt(pcb_date: string): boolean;
begin
with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='select MATL_CST_IN_DEPT_CLOSED from data0444'+#13+
            'where CUT_DATE='''+pcb_date+'''';
  open;
  if fieldvalues['MATL_CST_IN_DEPT_CLOSED']<=0 then
   result:=true
  else
   result:=false; 
 end;
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
with dm.ADOQuery1 do
begin
 close;
 sql.Text:=
 'SELECT MAX(CONVERT(char(10), CUT_DATE, 120) + '','' + CONVERT(varchar, TDATE, 120))'+#13+
   'AS cut_date'+#13+
   'FROM dbo.Data0444'+#13+
 'WHERE (CLOSED = ''Y'')';  //查找最后一次核算的日期
 open;
end;
if dm.ADOQuery1.Fieldbyname('cut_date').AsString<>'' then      //已有核算记录
 begin
  edit1.Text:=copy(dm.ADOQuery1.FieldValues['cut_date'],1,10);
  label2.Caption:=copy(dm.ADOQuery1.FieldValues['cut_date'],12,
                 length(dm.ADOQuery1.FieldValues['cut_date'])-11);
 end
else                               //未有核算记录
 begin
  with dm.ADOQuery1 do
  begin
   close;
   sql.Text:='SELECT top 2 rkey,CUT_DATE,TDATE FROM dbo.Data0444'+#13+
             'order by rkey desc'; 
   open;
   Next;
  end;
  if not dm.ADOQuery1.Eof then
  begin
   edit1.Text:= formatdatetime('YYYY-MM-DD',dm.ADOQuery1.Fieldbyname('cut_date').AsDateTime);
   label2.Caption:=formatdatetime('YYYY-MM-DD hh:nn:ss',dm.ADOQuery1.Fieldbyname('TDATE').AsDateTime);
  end;
 end;
 
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
if (trim(edit2.Text)= '') or (trim(edit1.Text)= '')  then
 messagedlg('核算开始,结束日期不能为空!',mterror,[mbcancel],0)
else
if (find_wip_invt(edit1.Text)) and
 (messagedlg('开始日期:'+edit1.text+'没有在线材料盘点数据,是否继续?',
   mtconfirmation,[mbyes,mbNo],0)=mrNo) then
else
 if (find_wip_invt(edit2.Text)) and
   (messagedlg('结束日期:'+edit2.text+'没有在线材料盘点数据,是否继续?',
   mtconfirmation,[mbyes,mbNo],0)=mrNo) then
 else
  if self.find_error(edit1.text,edit2.text) then
   messagedlg('该期间已被核算过了!',mterror,[mbcancel],0)
  else
   ModalResult:=mrok;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
if edit1.Text<>'' then
try
 form_period:=Tform_period.Create(application);
 form_period.aqd444.Close;
 form_period.aqd444.Parameters.ParamValues['fm_date']:=strtodate(edit1.Text);
 form_period.aqd444.Open;
 if not form_period.aqd444.IsEmpty then
 if form_period.ShowModal=mrok then
  begin
   edit2.Text:=form_period.aqd444CUT_DATE.AsString;
   label4.Caption:=
   formatdatetime('yyyy-mm-dd HH:mm:ss',form_period.aqd444TDATE.Value);
  end
 else
 else
  messagedlg('没有找到可以核算的截数!',mterror,[mbcancel],0);
finally
 form_period.Free;
end
else
 messagedlg('无开始的截数日期,核算不能进行!',mterror,[mbcancel],0);
end;




end.
