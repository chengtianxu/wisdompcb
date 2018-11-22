unit frm_edit_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, ComCtrls;

type
    TFrm_Edit = class(TForm) 
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    SpeedButton3: TSpeedButton;
    Label4: TLabel;
    Label5: TLabel;
    Edit4: TEdit;
    SpeedButton4: TSpeedButton;
    Label_submitperson: TLabel;
    Label_submitdet: TLabel;
    RichEdit1: TRichEdit;
    RichEdit2: TRichEdit;
    Label16: TLabel;
    Edit9: TEdit;
    pnl1: TPanel;
    pnl2: TPanel;
    Label_691rkey: TLabel;
    Label_692deptstr: TLabel;
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure update_04(v_seed:string);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Edit: TFrm_Edit;
function Power(x, y : extended) : extended;


implementation
 uses common,demo,Pick_Item_Single,ConstVar;
{$R *.dfm}

procedure TFrm_Edit.SpeedButton3Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;

  try
    if TComponent(Sender).Tag=0 then
    begin
      //frmPick_Item_Single.Width :=800;
      //frmPick_Item_Single.Height :=600;
      InputVar.Fields := 'cust_code/客户代码/120,customer_name/客户名称/250';
      InputVar.Sqlstr :='select * from data0010 order by 2';
    end
    else
     if TComponent(Sender).Tag>=1 then begin
   frmPick_Item_Single.Width :=800;
   frmPick_Item_Single.Height :=600;
         // InputVar.InPut_value:=EdtDept.text;
      InputVar.Fields := 'type_code/审批代码/80,name/审批流程名称/100,dept_name/审批流程/650';
      //d691_ptr,type_code,[name],dept_name
      InputVar.Sqlstr :=dm.Queryofbp.SQL.Text;
     end; 
    InputVar.AdoConn := dm.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar) ;
    
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      if TComponent(Sender).Tag=0 then
      begin
        edit3.Text := frmPick_Item_Single.adsPick.FieldValues['customer_name'];
        Label4.Caption:=frmPick_Item_Single.adsPick.FieldValues['rkey'];
      end
     else if TComponent(Sender).Tag=1 then begin
        edit4.Text := frmPick_Item_Single.adsPick.FieldValues['name'];
        Label_691rkey.Caption:=frmPick_Item_Single.adsPick.FieldValues['d691_ptr'];
        Label_692deptstr.Caption :=frmPick_Item_Single.adsPick.FieldValues['dept_name'];
      end;{
      else begin
        edit3.Text := frmPick_Item_Single.adsPick.FieldValues['customer_name'];
        Label4.Caption:=frmPick_Item_Single.adsPick.FieldValues['rkey'];
      end;}
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;


end;

procedure TFrm_Edit.SpeedButton1Click(Sender: TObject);
//var Qty:real;
begin
   label_submitperson.Caption:=inttostr(demo.op_people);
   label_submitdet.Caption:=inttostr(demo.people_department);
  if  Edit1.Text='' then
  begin
    showmessage('合同编码不能为空...');
    Edit1.SetFocus;
    exit;
  end;
  if Edit2.Text='' then
  begin
    showmessage('合同名称不能为空...');
    Edit2.SetFocus;
    exit;
  end;
  if Edit3.Text='' then
  begin
    showmessage('客户名称不能为空...');
    Edit3.SetFocus;
    exit;
  end;
    if Label_691rkey.Caption='' then
  begin
    showmessage('审批流程不能为空...');
    Edit3.SetFocus;
    exit;
  end;

  if dm.ADOConnection1.Connected then
  begin
      dm.ADOTMP1.Close;
      dm.ADOTMP1.SQL.Clear;
      dm.ADOTMP1.SQL.Text:='select contract_number from data0696 where contract_number= '''+Edit1.Text+'''';
      dm.ADOTMP1.Open;
      if not DM.ADOTMP1.IsEmpty then
      begin
        showmessage('已存在您输入的合同编码，系统再次分配合同编号');
   dm.ADOD04.Close;
   dm.ADOD04.Open;
   Frm_Edit.edit1.Text:=dm.ADOD04.FieldValues['seed_value'];
   Edit1.SetFocus;
   abort;
      end;
       //----------------客户编码
      dm.ADOTMP1.SQL.Clear;
      if     label4.Caption<>'null' then
      dm.ADOTMP1.SQL.Text:='select  CUSTOMER_NAME from data0010 where rkey= '''+label4.Caption+''''
      else
      dm.ADOTMP1.SQL.Text:='select  CUSTOMER_NAME from data0010 where rkey=4 ';
      dm.ADOTMP1.Open;

      if not DM.ADOTMP1.IsEmpty then
      begin
       if dm.ADOTMP1.FieldValues['CUSTOMER_NAME']<>edit3.Text
       then label4.Caption:='null';
      end;
      //--------------------
  end;

dm.ADOTMP1.Close;
dm.ADOTMP1.SQL.Clear;
dm.ADOTMP1.SQL.Text:=' '+
' insert into data0696  '+
' (contract_number,contract_name,Party_A,part_A_name_ch,part_A_name_en,submit_date, '+
' submit_person,submit_department,submit_suggestion,  '+
' check_status,circle,check_type,remark) '+
' select '+quotedstr(edit1.Text)+','+quotedstr(edit2.Text)+','+label4.Caption+
', '+quotedstr(edit3.Text)+','+quotedstr(edit9.Text)+
',getdate(), '+
' '+label_submitperson.Caption+','+label_submitdet.Caption+','+#39+richedit1.Text+#39+','+'0,'+
' 1,'+label_691rkey.Caption+','+#39+richedit2.Text+#39;
try
dm.ADOTMP1.ExecSQL;
dm.ADOD04.Close;
dm.ADOD04.Open;
if dm.ADOD04SEED_FLAG.Value<>1 then
self.update_04(trim(dm.ADOD04SEED_VALUE.Value));

modalresult:=mrok;
except
    on E: Exception do
begin
      showmessage('数据保存发生错误:'+E.Message);
end;


end;

end;



procedure TFrm_Edit.Button1Click(Sender: TObject);
begin
dm.ADOTMP1.Close;
dm.ADOTMP1.SQL.Clear;
dm.ADOTMP1.SQL.Text:='' ;

end;

procedure TFrm_Edit.SpeedButton2Click(Sender: TObject);
begin
close;
end;

procedure TFrm_Edit.update_04(v_seed: string);
var
 i,v_length:integer;
 v_last,new_seed:string;
begin
 v_length := length(v_seed);
 for i := v_length downto 1 do
  if not (v_seed[i] in ['0'..'9']) then   //如果不是数字
   begin
    v_last := floattostr(power(10,v_length-1)+strtofloat(copy(v_seed,i+1,v_length-i))+1); //后缀加1
    new_seed := copy(v_seed,1,i)+copy(v_last,i+1,v_length-i);
    dm.adod04.Edit; //使前缀不变后缀加1
    dm.adod04SEED_VALUE.Value := new_seed;
    dm.adod04.Post;
    break;
   end
  else
   if i=1 then //如果第一位仍然是数字
    begin
     v_last := floattostr(power(10,v_length)+strtofloat(v_seed)+1);
     new_seed := copy(v_last,2,v_length);
     dm.adod04.Edit;
     dm.adod04SEED_VALUE.Value := new_seed;
     dm.adod04.Post;
    end;
end;

function Power(x, y : extended) : extended;
begin
result := exp(y*ln(x));
end;


procedure TFrm_Edit.btn1Click(Sender: TObject);
begin
if Edit4.Text='' then
  begin
    showmessage('审核流程不能为空...');
    Edit4.SetFocus;
    exit;
  end;
 
  try
   dm.ADOTMP1.SQL.Clear;
   dm.ADOTMP1.SQL.Text:=      ' ' ;
    dm.ADOTMP1.ExecSQL;
    ShowMessage('保存成功');
   except
     ShowMessage('流程定义失败');
   end;
end;

end.

