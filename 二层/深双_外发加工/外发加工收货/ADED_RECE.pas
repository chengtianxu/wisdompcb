unit ADED_RECE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ComCtrls;

type
  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    StrGrid1: TStringGrid;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label5: TLabel;
    Edit5: TEdit;
    Label6: TLabel;
    Memo1: TMemo;
    Label7: TLabel;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    CheckBox1: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    function received_over(rkey300:string):boolean;
    procedure StrGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure StrGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Enter(Sender: TObject);
    function location_over():boolean;
  private
    { Private declarations }
   epi_ptr,curr_ptr,supp_ptr:integer;
   tax_cate,pay_metod:string;
   exch_rate:double; 
  public
    { Public declarations }
   aded_flag:byte;//1新增，2编辑，3检查 
  end;

var
  Form2: TForm2;

implementation

uses data_module, main, eip_search;

{$R *.dfm}

procedure TForm2.FormShow(Sender: TObject);
begin
strgrid1.Cells[0,0]:='本厂编号';
strgrid1.Cells[1,0]:='客户型号';
strgrid1.Cells[2,0]:='规格';
strgrid1.Cells[3,0]:='单位';
strgrid1.Cells[4,0]:='要求日期';
strgrid1.Cells[5,0]:='外发数量';
strgrid1.Cells[6,0]:='已接收';
strgrid1.Cells[7,0]:='当前接收';
strgrid1.Cells[8,0]:='本次退货';
strgrid1.Cells[9,0]:='本次报废';
strgrid1.Cells[10,0]:='备注';
strgrid1.Cells[11,0]:='rkey301';
strgrid1.ColWidths[11]:=0;
end;

procedure TForm2.FormActivate(Sender: TObject);
var
 i:word;
begin
if self.aded_flag=1 then //新增
 begin
  self.DateTimePicker1.Date:=form1.sys_shortdate;
  form_episearch:=tform_episearch.Create(application);
  if form_episearch.ShowModal=mrok then
   begin
    strgrid1.Enabled:=true;
    edit2.Text:=form_episearch.Aqwz300epiboly_number.Value;
    self.epi_ptr:=form_episearch.Aqwz300rkey.Value;
    edit3.Text:=form_episearch.Aqwz300SUPPLIER_NAME.Value;
    edit4.Text:=form_episearch.Aqwz300DEPT_NAME.Value;
    self.curr_ptr:=form_episearch.Aqwz300currency_ptr.Value;
    self.exch_rate:=form_episearch.Aqwz300exch_rate.Value;
    self.tax_cate:=form_episearch.Aqwz300TAX_cate.Value;
    self.pay_metod:=form_episearch.Aqwz300pay_method.Value;
    self.supp_ptr:=form_episearch.Aqwz300supp_ptr.Value;
    Self.Memo1.Lines.Text := form_episearch.Aqwz300remark.value;
    strgrid1.RowCount:=form_episearch.Aqwz301.RecordCount+1;
    form_episearch.Aqwz301.First;
    for i:=1 to form_episearch.Aqwz301.RecordCount do
     begin
      strgrid1.Cells[0,i]:=form_episearch.Aqwz301MANU_PART_NUMBER.Value;
      strgrid1.Cells[1,i]:=form_episearch.Aqwz301MANU_PART_DESC.Value;
      strgrid1.Cells[2,i]:=form_episearch.Aqwz301STANDARD.Value;
      strgrid1.Cells[3,i]:=form_episearch.Aqwz301UNIT_NAME.Value;
      strgrid1.Cells[4,i]:=form_episearch.Aqwz301REQ_DATE.AsString;
      strgrid1.Cells[5,i]:=form_episearch.Aqwz301QUANTITY.AsString;
      strgrid1.Cells[6,i]:=form_episearch.Aqwz301RECE_QTY.AsString;
      strgrid1.Cells[7,i]:='0';
      strgrid1.Cells[8,i]:='0';
      strgrid1.Cells[9,i]:='0';
      strgrid1.Cells[11,i]:=form_episearch.Aqwz301RKEY.AsString;
      form_episearch.Aqwz301.Next;
     end;
   end
  else
   strgrid1.Enabled:=false;
  form_episearch.Free;
 end
else
 begin
  edit1.Text:=dm.Aqwz303DELIVER_NUMBER.Value;
  edit2.Text:=dm.Aqwz303epiboly_number.Value;
  edit5.Text:=dm.Aqwz303SHIP_NAME.Value;
  DateTimePicker1.Date:=dm.Aqwz303SHIP_DATE.Value;
  edit3.Text:=dm.Aqwz303SUPPLIER_NAME.Value;
  edit4.Text:=dm.Aqwz303DEPT_NAME.Value;
  memo1.Text:=dm.Aqwz303REMARK.Value;
  dm.Aq304.Open;
  strgrid1.RowCount:=dm.Aq304.RecordCount+1;
  for i:=1 to dm.Aq304.RecordCount do
   begin
    strgrid1.Cells[0,i]:=dm.Aq304MANU_PART_NUMBER.Value;
    strgrid1.Cells[1,i]:=dm.Aq304MANU_PART_DESC.Value;
    strgrid1.Cells[2,i]:=dm.Aq304STANDARD.Value;
    strgrid1.Cells[3,i]:=dm.Aq304UNIT_NAME.Value;
    strgrid1.Cells[4,i]:=dm.Aq304REQ_DATE.AsString;
    strgrid1.Cells[5,i]:=dm.Aq304QUANTITY.AsString;
    strgrid1.Cells[6,i]:=inttostr(dm.Aq304rece_qty.Value);
    strgrid1.Cells[7,i]:=inttostr(dm.Aq304rece_quantity.Value);
    strgrid1.Cells[8,i]:=inttostr(dm.Aq304RETURN_QTY.Value);
    strgrid1.Cells[9,i]:=inttostr(dm.Aq304reject_qty.Value);
    strgrid1.Cells[10,i]:=dm.Aq304REMARK.Value;
    strgrid1.Cells[11,i]:=dm.Aq304RKEY.AsString;
    dm.Aq304.Next;
   end;
  dm.Aq304.Close;
 end;
end;

function TForm2.received_over(rkey300:string): boolean;
begin
 with dm.ADOQuery2 do
  begin
   close;
   sql.Clear;
   sql.Add('select rkey from wzdata301');
   sql.Add('where QUANTITY<>RECEVIED_QTY+RETURN_QTY+reject_QTY');
   sql.Add('and EPIBOLY_PTR='+rkey300);
   open;
  end;
 if dm.ADOQuery2.IsEmpty then
  received_over:=true
 else
  received_over:=false;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
var
 i:word;
begin
if self.aded_flag=1 then //新增
 begin
  dm.ADOConnection1.BeginTrans;
  try
  dm.ADOwz303.Close;
  dm.ADOwz303.Parameters[0].Value:=null;
  dm.ADOwz303.Open;
  dm.ADOwz303.Append;
  dm.ADOwz303DELIVER_NUMBER.Value:=edit1.Text;
  dm.ADOwz303EPIBOLY_PTR.Value:=self.epi_ptr;
  dm.ADOwz303SHIP_NAME.Value:=edit5.Text;
  dm.ADOwz303SHIP_DATE.Value:=self.DateTimePicker1.Date;
  dm.tmp.close;
  dm.tmp.SQL.Text:='select getdate()' ;
  dm.tmp.Open;
  dm.ADOwz303ENT_DATE.Value:=dm.tmp.Fields[0].Value;
  dm.tmp.close;
  dm.ADOwz303REMARK.Value:=memo1.Text;
  dm.ADOwz303STATUS.Value:=1;
  dm.ADOwz303EMPL_PTR.Value:=form1.empl_ptr;
  dm.ADOwz303currency_ptr.Value:=self.curr_ptr;
  dm.ADOwz303exch_rate.Value:=self.exch_rate;
  dm.ADOwz303pay_method.Value:=self.pay_metod;
  dm.ADOwz303TAX_cate.Value:=self.tax_cate;
  dm.ADOwz303SUPP_PTR.Value:=self.supp_ptr;
  dm.ADOwz303.Post;
  dm.ADOwz304.Close;
  dm.ADOwz304.Parameters[0].Value:=dm.ADOwz303rkey.Value;
  dm.ADOwz304.Open;
  for i:=1 to strgrid1.RowCount-1 do
   if (strtoint(strgrid1.Cells[7,i])>0) or
      (strtoint(strgrid1.Cells[8,i])>0) or
      (strtoint(strgrid1.Cells[9,i])>0) then
    begin
     dm.ADOwz304.Append;
     dm.ADOwz304DELIVER_PTR.Value:=dm.ADOwz303rkey.Value;
     dm.ADOwz304EPILIST_PTR.Value:=strtoint(strgrid1.Cells[11,i]);
     dm.ADOwz304rece_quantity.Value:=strtoint(strgrid1.Cells[7,i]);
     dm.ADOwz304RETURN_QTY.Value:=strtoint(strgrid1.Cells[8,i]);
     dm.ADOwz304reject_qty.Value:=strtoint(strgrid1.Cells[9,i]);
     dm.ADOwz304REMARK.Value:=strgrid1.Cells[10,i];
     dm.ADOwz304.Post;
    end;

  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('update wzdata301');
    sql.Add('set RECEVIED_QTY=RECEVIED_QTY+wzdata304.rece_quantity,');
    sql.Add('wzdata301.RETURN_QTY=wzdata301.RETURN_QTY+wzdata304.RETURN_QTY,');
    sql.Add('wzdata301.reject_QTY=wzdata301.reject_QTY+wzdata304.reject_QTY');
    sql.Add('from wzdata304 inner join wzdata301');
    sql.Add('on wzdata304.EPILIST_PTR=wzdata301.rkey');
    sql.Add('where wzdata304.DELIVER_PTR='+dm.ADOwz303RKEY.AsString);
    ExecSQL;
   end;

  if (checkbox1.Checked) or (received_over(dm.ADOwz303EPIBOLY_PTR.AsString)) then
   with dm.adoquery2 do
    begin
     close;
     sql.clear;
     sql.Add('update wzdata300');
     sql.Add('set status=4');
     sql.Add('where rkey='+dm.ADOwz303EPIBOLY_PTR.AsString);
     execsql;
    end;
//  try
   dm.ADOConnection1.CommitTrans;
   self.ModalResult:=mrok;
  except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
     edit1.SetFocus;
    end;
  end;
 end
else         //编辑
 begin
  dm.ADOConnection1.BeginTrans;
  try
  dm.ADOwz303.Close;
  dm.ADOwz303.Parameters[0].Value:=dm.Aqwz303RKEY.Value;
  dm.ADOwz303.Open;
  dm.ADOwz303.Edit;
  dm.ADOwz303STATUS.Value:=1;
  dm.ADOwz303DELIVER_NUMBER.Value:=edit1.Text;
  dm.ADOwz303SHIP_NAME.Value:=edit5.Text;
  dm.ADOwz303SHIP_DATE.Value:=self.DateTimePicker1.Date;
  dm.ADOwz303REMARK.Value:=memo1.Text;
  dm.ADOwz303.Post;
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('update wzdata301');
    sql.Add('set RECEVIED_QTY = RECEVIED_QTY-wzdata304.rece_quantity,');
    sql.Add('wzdata301.RETURN_QTY=wzdata301.RETURN_QTY-wzdata304.RETURN_QTY,');
    sql.Add('wzdata301.reject_QTY=wzdata301.reject_QTY-wzdata304.reject_QTY');
    sql.Add('from wzdata304 inner join wzdata301');
    sql.Add('on wzdata304.EPILIST_PTR = wzdata301.rkey');
    sql.Add('where wzdata304.DELIVER_PTR = '+dm.Adowz303RKEY.AsString);
    ExecSQL;
   end;

   with dm.ADOQuery2 do
    begin
     close;
     sql.Clear;
     sql.Add('delete from wzdata304');
     sql.Add('where wzdata304.DELIVER_PTR='+dm.Adowz303RKEY.AsString);
     execsql;
    end;

  dm.ADOwz304.Close;
  dm.ADOwz304.Parameters[0].Value:=dm.ADOwz303rkey.Value;
  dm.ADOwz304.Open;
  for i:=1 to strgrid1.RowCount-1 do
   if (strtoint(strgrid1.Cells[7,i])>0) or
      (strtoint(strgrid1.Cells[8,i])>0) or
      (strtoint(strgrid1.Cells[9,i])>0)  then
    begin

     dm.ADOwz304.AppendRecord([dm.ADOwz303RKEY.Value,
                               strtoint(strgrid1.Cells[11,i]),
                               strtoint(strgrid1.Cells[7,i]),
                               strtoint(strgrid1.Cells[8,i]),
                               strtoint(strgrid1.Cells[9,i]),
                               strgrid1.Cells[10,i]
                               ]);
    end;

  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('update wzdata301');
    sql.Add('set RECEVIED_QTY=RECEVIED_QTY+wzdata304.rece_quantity,');
    sql.Add('wzdata301.RETURN_QTY=wzdata301.RETURN_QTY+wzdata304.RETURN_QTY,');
    sql.Add('wzdata301.reject_QTY=wzdata301.reject_QTY+wzdata304.reject_QTY');
    sql.Add('from wzdata304 inner join wzdata301');
    sql.Add('on wzdata304.EPILIST_PTR=wzdata301.rkey');
    sql.Add('where wzdata304.DELIVER_PTR='+dm.ADOwz303RKEY.AsString);
    ExecSQL;
   end;

  if (checkbox1.Checked) or (received_over(dm.aqwz303EPIBOLY_PTR.AsString)) then
    with dm.adoquery2 do
     begin
      close;
      sql.clear;
      sql.Add('update wzdata300');
      sql.Add('set status=4');
      sql.Add('where rkey='+dm.ADOwz303EPIBOLY_PTR.AsString);
      execsql;
     end
  else
   if (not checkbox1.Checked) and (not received_over(dm.aqwz303EPIBOLY_PTR.AsString)) then
    with dm.adoquery2 do
     begin
      close;
      sql.clear;
      sql.Add('update wzdata300');
      sql.Add('set status=3');
      sql.Add('where rkey='+dm.ADOwz303EPIBOLY_PTR.AsString);
      execsql;
     end;
//  try
  dm.ADOConnection1.CommitTrans;
  self.ModalResult:=mrok;
  except
   dm.ADOConnection1.RollbackTrans;
   showmessage('数据保存遇到错误请速与管理员联系!');
   edit1.SetFocus;
  end;
 end;
end;

procedure TForm2.BitBtn4Click(Sender: TObject);
var
 i:word;
begin
if trim(edit2.Text)<>'' then
 begin
 for i:=1 to strgrid1.RowCount-1 do
  strgrid1.Cells[7,i]:=inttostr(strtoint(strgrid1.Cells[5,i])-
                                strtoint(strgrid1.Cells[6,i])-
                                strtoint(strgrid1.Cells[8,i])-
                                strtoint(strgrid1.Cells[9,i])
                                );
  checkbox1.Checked:=true;
 end;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
var
 i:word;
begin
  form_episearch:=tform_episearch.Create(application);
  if (form_episearch.ShowModal=mrok) and
     (epi_ptr<>form_episearch.Aqwz300rkey.Value) then
   begin
    strgrid1.Enabled:=true;
    edit2.Text := form_episearch.Aqwz300epiboly_number.Value;
    self.epi_ptr := form_episearch.Aqwz300rkey.Value;
    edit3.Text := form_episearch.Aqwz300SUPPLIER_NAME.Value;
    edit4.Text:=form_episearch.Aqwz300DEPT_NAME.Value;
    self.curr_ptr:=form_episearch.Aqwz300currency_ptr.Value;
    self.exch_rate:=form_episearch.Aqwz300exch_rate.Value;
    self.tax_cate:=form_episearch.Aqwz300TAX_cate.Value;
    self.pay_metod:=form_episearch.Aqwz300pay_method.Value;
    self.supp_ptr:=form_episearch.Aqwz300supp_ptr.Value;
    Self.Memo1.Lines.Text := form_episearch.Aqwz300remark.value;
    strgrid1.RowCount:=form_episearch.Aqwz301.RecordCount+1;
    form_episearch.Aqwz301.First;
    for i:=1 to form_episearch.Aqwz301.RecordCount do
     begin
      strgrid1.Cells[0,i]:=form_episearch.Aqwz301manu_PART_NUMBER.Value;
      strgrid1.Cells[1,i]:=form_episearch.Aqwz301MANU_PART_DESC.Value;
      strgrid1.Cells[2,i]:=form_episearch.Aqwz301STANDARD.Value;
      strgrid1.Cells[3,i]:=form_episearch.Aqwz301UNIT_NAME.Value;
      strgrid1.Cells[4,i]:=form_episearch.Aqwz301REQ_DATE.AsString;
      strgrid1.Cells[5,i]:=form_episearch.Aqwz301QUANTITY.AsString;
      strgrid1.Cells[6,i]:=form_episearch.Aqwz301RECEVIED_QTY.AsString;
      strgrid1.Cells[7,i]:='0';
      strgrid1.Cells[8,i]:='0';
      strgrid1.Cells[9,i]:='0';
      strgrid1.Cells[11,i]:=form_episearch.Aqwz301RKEY.AsString;
      form_episearch.Aqwz301.Next;
     end;
    bitbtn4.SetFocus;
   end;
  form_episearch.Free;
end;

procedure TForm2.StrGrid1KeyPress(Sender: TObject; var Key: Char);
begin
 if (strgrid1.Col=7) or (strgrid1.Col=8) or (strgrid1.Col=9) then
 if not (key in ['0'..'9',#8,#13]) then  //判断是否输入数字
  abort;
end;

procedure TForm2.StrGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if strgrid1.Col=7 then
 begin
  if strgrid1.Cells[7,strgrid1.Row]='' then strgrid1.Cells[7,strgrid1.Row]:='0';
  if strtoint(strgrid1.Cells[7,strgrid1.Row])>
     strtoint(strgrid1.Cells[5,strgrid1.Row])-
     strtoint(strgrid1.Cells[6,strgrid1.Row])-
     strtoint(strgrid1.Cells[8,strgrid1.Row])-
     strtoint(strgrid1.Cells[9,strgrid1.Row]) then
     
   strgrid1.Cells[7,strgrid1.Row]:=inttostr(strtoint(strgrid1.Cells[5,strgrid1.Row])-
                                            strtoint(strgrid1.Cells[6,strgrid1.Row])-
                                            strtoint(strgrid1.Cells[8,strgrid1.Row])-
                                            strtoint(strgrid1.Cells[9,strgrid1.Row])
                                            )
 end;
if strgrid1.Col=8 then
 begin
  if strgrid1.Cells[8,strgrid1.Row]='' then strgrid1.Cells[8,strgrid1.Row]:='0';
  if strtoint(strgrid1.Cells[8,strgrid1.Row])>
     strtoint(strgrid1.Cells[5,strgrid1.Row])-
     strtoint(strgrid1.Cells[6,strgrid1.Row])-
     strtoint(strgrid1.Cells[7,strgrid1.Row])-
     strtoint(strgrid1.Cells[9,strgrid1.Row]) then

   strgrid1.Cells[8,strgrid1.Row]:=inttostr(strtoint(strgrid1.Cells[5,strgrid1.Row])-
                                            strtoint(strgrid1.Cells[6,strgrid1.Row])-
                                            strtoint(strgrid1.Cells[7,strgrid1.Row])-
                                            strtoint(strgrid1.Cells[9,strgrid1.Row])
                                            )
 end; //5为外发数量，6为已接收数量,7为当前接收数量,8为当前退货数量 9为报废数量

if strgrid1.Col=9 then
 begin
  if strgrid1.Cells[9,strgrid1.Row]='' then strgrid1.Cells[9,strgrid1.Row]:='0';
  if strtoint(strgrid1.Cells[9,strgrid1.Row])>
     strtoint(strgrid1.Cells[5,strgrid1.Row])-
     strtoint(strgrid1.Cells[6,strgrid1.Row])-
     strtoint(strgrid1.Cells[7,strgrid1.Row])-
     strtoint(strgrid1.Cells[8,strgrid1.Row]) then

   strgrid1.Cells[9,strgrid1.Row]:=inttostr(strtoint(strgrid1.Cells[5,strgrid1.Row])-
                                            strtoint(strgrid1.Cells[6,strgrid1.Row])-
                                            strtoint(strgrid1.Cells[7,strgrid1.Row])-
                                            strtoint(strgrid1.Cells[8,strgrid1.Row])
                                            )
 end; //5为外发数量，6为已接收数量,7为当前接收数量,8为当前退货数量 9为报废数量
end;

function TForm2.location_over: boolean;
var
 i:word;
begin
 location_over:=false;
 for i:=1 to strgrid1.RowCount-1 do
  if (strtoint(strgrid1.Cells[7,i])>0) or (strtoint(strgrid1.Cells[8,i])>0)
     or (strtoint(strgrid1.Cells[9,i])>0) then
   begin                    //必需有一个入仓数量
    break;
   end
  else
   if (i=strgrid1.RowCount-1) then
    location_over:=true;
end;

procedure TForm2.BitBtn1Enter(Sender: TObject);
begin
if trim(edit1.Text)='' then
 begin
  showmessage('送货单号不允许为空!');
  edit1.SetFocus;
  exit;
 end;
if trim(edit2.Text)='' then
 begin
  showmessage('请选择一个本厂外发编号!');
  bitbtn2.SetFocus;
  exit;
 end;
if self.location_over then
 begin
  messagedlg('至少需要一项接收记录或者退货记录!',mtconfirmation,[mbok],0);
  strgrid1.SetFocus;
  strgrid1.Col:=7;
  exit;
 end;

end;

end.
