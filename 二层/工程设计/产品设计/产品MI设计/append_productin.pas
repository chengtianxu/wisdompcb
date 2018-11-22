unit append_productin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm_append = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label12: TLabel;
    Label3: TLabel;
    Label9: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label8: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Label34: TLabel;
    Edit11: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label5: TLabel;
    Label11: TLabel;
    Button1: TButton;
    Button2: TButton;
    rkey08: TLabel;
    rkey504: TLabel;
    Edit12: TEdit;
    Label13: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit11Exit(Sender: TObject);
    procedure Edit3KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    function invo_number_error(number: string; rkey:integer): boolean;
    procedure Button1Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_append: TForm_append;

implementation

uses damo, prod_search, iesmodel_search, DB, main,common;

{$R *.dfm}
function TForm_append.invo_number_error(number: string; rkey:integer): boolean;
begin
with dm.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Add('select rkey from data0025');
  sql.Add('where MANU_PART_NUMBER='''+number+'''');
  sql.Add('and PARENT_PTR='+inttostr(rkey));
  open;
  if not IsEmpty then
   result:=true
  else
   result:=false;
 end;
end;

procedure TForm_append.FormActivate(Sender: TObject);

begin
 with dm.ADOQuery1 do
  begin
   close;
   sql.Text:='select PROD_CODE,PRODUCT_NAME from data0008'+#13+
             'where rkey='+dm.AQY0025PROD_CODE_PTR.AsString;
   open;
   edit5.Text:=fieldbyname('PROD_CODE').AsString;
   label5.Caption:=fieldbyname('PRODUCT_NAME').AsString;
   rkey08.Caption:=dm.AQY0025PROD_CODE_PTR.AsString;
  end;

if dm.AQY0025ENG_ROUTE_PTR.Value>0 then
 with dm.ADOQuery1 do
  begin
   close;
   sql.Text:='select ENG_FLOW_NAME,ENG_FLOW_DESC from data0504'+#13+
             'where rkey='+dm.AQY0025ENG_ROUTE_PTR.AsString;
   open;
   edit11.Text:=fieldbyname('ENG_FLOW_NAME').AsString;
   label11.Caption:=fieldbyname('ENG_FLOW_DESC').AsString;
   rkey504.Caption:=dm.AQY0025ENG_ROUTE_PTR.AsString;
  end;
  
edit2.Text:=dm.AQY0025MANU_PART_DESC.Value;
edit4.Text:=dm.AQY0025ANALYSIS_CODE_3.Value;
edit6.Text:='0';     //内层报废率为零
edit7.Text:=dm.AQY0025SHELF_LIFE.AsString;
edit8.Text:=dm.AQY0025MFG_LEAD_TIME.AsString;
edit9.Text:=dm.AQY0025REVIEW_DAYS.AsString;
edit10.text:=dm.AQY0025OPT_LOT_SIZE.AsString;
edit12.Text:=dm.AQY0025MANU_PART_NUMBER.Value;
edit1.Text:=edit12.Text+'.';

edit1.SelStart:=edit1.GetTextLen; //length(edit1.Text);

end;

procedure TForm_append.BitBtn1Click(Sender: TObject);
begin
  Form_prodcode:=tForm_prodcode.Create(application);
  if Form_prodcode.ShowModal=mrok then
  begin
   edit5.Text:=Form_prodcode.ADOQuery1prod_code.Value;
   label5.Caption:=Form_prodcode.adoquery1PRODUCT_NAME.Value;
   rkey08.Caption:=Form_prodcode.adoquery1RKEY.AsString;
   edit6.Text := '0';   //内层报废率为零
   edit7.Text:=Form_prodcode.adoquery1LEAD_TIME.AsString;
   edit8.Text:=Form_prodcode.adoquery1MAX_DAYS_EARLY_BUILD.AsString;
   edit10.Text:=Form_prodcode.adoquery1OPT_LOT_SIZE.AsString;
   if Form_prodcode.adoquery1IESMODEL_PTR.Value>0 then
   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='select ENG_FLOW_NAME,ENG_FLOW_DESC from data0504'+#13+
               'where rkey='+Form_prodcode.adoquery1IESMODEL_PTR.AsString;
     open;
     edit11.Text:=fieldbyname('ENG_FLOW_NAME').AsString;
     label11.Caption:=fieldbyname('ENG_FLOW_DESC').AsString;
     rkey504.Caption:=Form_prodcode.adoquery1IESMODEL_PTR.AsString;
    end;

  end;
  Form_prodcode.Free;
end;

procedure TForm_append.BitBtn2Click(Sender: TObject);
begin
try
 form_iesmodel := Tform_iesmodel.Create(Application);
 form_iesmodel.ADOQuery1.Open;
 if form_iesmodel.ADOQuery1.IsEmpty then
  messagedlg('请先建立智能流程模型库!',mtinformation,[mbok],0)
 else
 if form_iesmodel.showmodal=mrok then
 begin
  rkey504.Caption:=form_iesmodel.ADOQuery1RKEY.AsString;
  edit11.Text:=form_iesmodel.ADOQuery1ENG_FLOW_NAME.Value;
  label11.Caption:=form_iesmodel.ADOQuery1ENG_FLOW_DESC.Value;
 end;
finally
  form_iesmodel.Free;     //释放资源
end;
end;

procedure TForm_append.Button1Click(Sender: TObject);
var
 i:word;
begin
if self.invo_number_error(trim(edit1.Text),dm.AQY0025RKEY.Value) then
 begin
  messagedlg('内层编号重复!请手工重新输入',mterror,[mbok],0);
  edit1.SetFocus;
  exit;
 end
else
try
 dm.ADOConnection1.BeginTrans;
 with dm.ADOQuery1 do
  begin
  close;
  sql.Text:='select * from data0025 where rkey='+dm.AQY0025RKEY.AsString;
  open;
  end;
 dm.AQY0025.Close;
 dm.AQY0025.Parameters[0].Value:=0;
 dm.AQY0025.Open;
 dm.AQY0025.Append;
 for i:=1 to dm.AQY0025.FieldCount-1 do
  dm.AQY0025.Fields[i].Value:=dm.ADOQuery1.FieldValues[dm.AQY0025.Fields[i].FieldName];
 dm.AQY0025MANU_PART_NUMBER.Value := edit1.Text;
 dm.AQY0025MANU_PART_DESC.Value:=edit2.Text;
 dm.AQY0025LAYERS.AsString:=edit3.Text;
 dm.AQY0025PROD_CODE_PTR.AsString:=rkey08.Caption;
 if strtoint(rkey504.Caption)>0 then
 dm.AQY0025ENG_ROUTE_PTR.AsString:=rkey504.Caption;

 dm.AQY0025ANALYSIS_CODE_3.Value:=edit4.Text;
 dm.AQY0025EST_SCRAP.AsString:= edit6.Text;
 dm.AQY0025SHELF_LIFE.AsString:=edit7.Text;
 dm.AQY0025MFG_LEAD_TIME.AsString:=edit8.Text;
 dm.AQY0025REVIEW_DAYS.AsString:=edit9.Text;
 dm.AQY0025OPT_LOT_SIZE.AsString:=edit10.text;

 dm.AQY0025PARENT_PTR.Value:=dm.ADOQuery1.FieldValues['rkey'];
 dm.AQY0025CREATED_BY_EMPL_PTR.Value:=strtoint(user_ptr);
 dm.AQY0025CUSTPART_ENT_DATE.Value:=getsystem_date(dm.adoquery1,1);
 dm.AQY0025LAST_MODIFIED_DATE.Value:=getsystem_date(dm.adoquery1,1);
 dm.AQY0025LAST_MODIFIED_BY_PTR.Value:=strtoint(user_ptr);
 DM.AQY0025QTY_ON_HAND.VALUE:=0;
 dm.AQY0025.Post;
 dm.ADOConnection1.CommitTrans;
 self.ModalResult:=mrok;
except
 on E: Exception do
  begin
   dm.ADOConnection1.RollbackTrans;
   screen.Cursor:=crdefault;
   messagedlg(E.Message,mterror,[mbcancel],0);
  end;
end;
end;

procedure TForm_append.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#8,#13]) then  //判断是否输入数字
  abort;
end;

procedure TForm_append.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
else
 if (key = chr(46)) then  //如果是小数点
 if pos('.',(sender as TEdit).Text)>0 then  //小数点不能重复
   abort;
end;

procedure TForm_append.Edit11Exit(Sender: TObject);
begin
if trim(edit11.Text)='' then
 begin
  label11.Caption:='';
  rkey504.Caption:='0';
 end
else
 if (activecontrol.Name<>'BitBtn2') and (activecontrol.Name<>'Button2') then
 begin
  with dm.adoquery2 do
  begin
   close;
   sql.Text:='select rkey,ENG_FLOW_NAME,ENG_FLOW_DESC from data0504'+#13+
              'where ENG_FLOW_NAME='''+trim(edit11.Text)+'''';
   open;
   if isempty then
    begin
     messagedlg('智能模型代码输入错误!',mterror,[mbcancel],0);
     edit11.SetFocus;
    end
   else
    begin
     rkey504.Caption:=fieldbyname('RKEY').AsString;
     label11.Caption:=fieldbyname('ENG_FLOW_DESC').AsString;
    end;
  end;
 end;
end;

procedure TForm_append.Edit3KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim(edit3.Text)='' then edit3.Text:='1';
end;

procedure TForm_append.Button1Enter(Sender: TObject);
begin
if trim(edit1.Text)='' then
 begin
  messagedlg('内层编号不能为空!',mtinformation,[mbcancel],0);
  edit1.SetFocus;
  exit;
 end;
end;

end.
