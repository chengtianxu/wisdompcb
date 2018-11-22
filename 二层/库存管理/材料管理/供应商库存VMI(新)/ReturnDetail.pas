unit ReturnDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, Menus, Grids, DBGridEh,
  DBCtrls;

type
  TForm_ReturnDetail = class(TForm)
    Label6: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    Label4: TLabel;
    MaskEdit1: TMaskEdit;
    Panel1: TPanel;
    BitBtn9: TBitBtn;
    BtnSave: TBitBtn;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    Label13: TLabel;
    Label11: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit5: TEdit;
    SpeedButton2: TSpeedButton;
    Label12: TLabel;
    Edit3: TEdit;
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure DBEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FCurrDate:tdatetime;
    empl_ptr:integer;
  public
    { Public declarations }
function check_stock():boolean;  //检查是否有盘点进行中
  end;

var
  Form_ReturnDetail: TForm_ReturnDetail;

implementation

uses ReturnOut, demo,common, Main, User, PoInWh;

{$R *.dfm}

procedure TForm_ReturnDetail.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
 if (key = chr(46)) then
 if pos('.',edit2.Text)>0 then abort;     //小数点不能重复
 if not (key in ['0'..'9','.',#8]) then abort;//判断是否输入数字
end;

procedure TForm_ReturnDetail.Edit2Exit(Sender: TObject);
begin
 if trim(edit2.Text) = '' then  edit2.Text := '0';
 if strtofloat(edit2.Text) > strtofloat(dbedit10.Text) then
 begin
  messagedlg('退货数量不能大于当前库存数量!',mterror,[mbcancel],0);
  edit2.SetFocus;
 end
 else edit2.Text := formatfloat('0.000',strtofloat(edit2.Text));
end;
procedure TForm_ReturnDetail.FormCreate(Sender: TObject);
begin
dm.ado04.Parameters[0].Value:='data0724';
dm.ado04.Open;
if dm.ado04SEED_FLAG.Value<>1 then
maskedit1.Text:=dm.ado04SEED_VALUE.Value;
if dm.ado04SEED_FLAG.Value=4 then
maskedit1.ReadOnly:=true;
dm.ado04.Close;
edit3.Text:=form_returnout.ADS134tax_price.AsString;
dm.tmpt.Close;
dm.tmpt.SQL.Text:='select getdate()';
dm.tmpt.Open;
FCurrDate:=DM.tmpt.Fields[0].AsDateTime;
end;

function Tform_returndetail.check_stock():boolean;//盘点锁在此无用!
begin
 result:=false;
 with dm.tmpt do
 begin
  close;
  sql.Text:='SELECT D92.PHY_COUNT_NO,D92.TDATE,D05.EMPLOYEE_NAME '+
    'FROM Data0005 D05 INNER JOIN Data0092 D92 ON D05.RKEY=D92.EMPLOYEE_PTR '+
    'WHERE (D92.STATUS=''0'')';
  open;
  if not isempty then
  begin
   messagedlg('不能进行退货操作！仓库正在进行材料盘点，盘点代码:'+
     fieldvalues['PHY_COUNT_NO'],mtinformation,[mbcancel],0);
   result:=true;
  end;
 end;
end;

procedure TForm_ReturnDetail.BtnSaveClick(Sender: TObject);
var rkey148:integer;
begin
 if strtofloat(edit2.Text)=0 then
 begin
  messagedlg('退货数量为零!',mtinformation,[mbok],0);
  edit2.SetFocus;
  exit;
 end;
 if trim(edit5.Text)='' then
 begin
 messagedlg('请先选择领料人员!',mtinformation,[mbok],0);
 exit;
 end;
 dm.ADOConnection1.BeginTrans;
 try
  if form_poin.find_soerror(trim(maskedit1.Text)) then
  if messagedlg('入仓编号重复,可能有多台计算机同时新增,是否自动更新编号?',
     mtConfirmation,[mbYes,mbNo],0)=mrYes  then
   begin
    dm.ado04.Close;
    dm.ado04.Parameters[0].Value:='data0724';
    dm.ado04.Open;
    maskedit1.Text:=dm.ado04SEED_VALUE.Value;
   end
  else
   begin
    maskedit1.SetFocus;
    exit;
   end;
  with form_returnout.ado148 do
  begin
   close;  //新增材料退货出库记录DATA0148主表
   open;
   append;
   form_returnout.ado148GON_NUMBER.Value:=maskedit1.Text;
   form_returnout.ado148warehouse_ptr.Value:=form_returnout.ADS134warehouse_ptr.Value;
   form_returnout.ado148TTYPE.Value:=0;
   form_returnout.ado148CREATE_BY.Value:=form_main.rkey05;
   form_returnout.ado148CREATE_DATE.Value:=self.FCurrDate;;
   form_returnout.ado148REF_NUMBER.Value:=edit1.Text;
   form_returnout.ado148RECD_BY.Value:=self.empl_ptr;
   form_returnout.ado148supplier_ptr.Value:=form_returnout.ADS134SUPP_PTR.Value;
   form_returnout.ado148status.Value:=0;
   post; //增加主表记录
   dm.update04('data0724');             //更新控制码
   rkey148:=form_returnout.ado148RKEY.Value;
  end;
  with form_returnout.ADO149 do
  begin
  close;
  open;
  append;
  form_returnout.ADO149GON_PTR.Value:=rkey148;
  form_returnout.ADO149D0134_PTR.Value:=form_returnout.ADS134rkey_1.Value;
  form_returnout.ADO149INVENTORY_PTR.Value:=form_returnout.ADS134inventory_ptr.Value;
  form_returnout.ADO149RTN_QUANTITY.Value:=strtofloat(edit2.Text);
  form_returnout.ADO149tax_price.Value:=strtofloat(edit3.Text);
  form_returnout.ADO149TAX_2.Value:=form_returnout.ADS134tax_2.Value;
  post;//增加从表记录
  end;
  form_returnout.ADS134.Edit;
  //form_returnout.ADS134QUAN_RETURNED.Value:=form_returnout.ADS134QUAN_RETURNED.Value+strtofloat(Edit2.text);
  form_returnout.ADS134quan_on_hand.Value :=form_returnout.ADS134quan_on_hand.Value-strtofloat(Edit2.text);
  form_returnout.ADS134.Post;//修改库存明细
  except
  dm.ADOConnection1.RollbackTrans;
  showmessage('更新失败!');
  exit;
 end;
 dm.ADOConnection1.CommitTrans;
 showmessage('退货操作成功!');
 form_returnout.ADS134.Close;
 form_returnout.ADS134.Open;
 close;
end;

procedure TForm_ReturnDetail.DBEdit2KeyPress(Sender: TObject;
  var Key: Char);
begin
 if (key = chr(46)) then
 if pos('.',edit2.Text)>0 then abort;     //小数点不能重复
 if not (key in ['0'..'9','.',#8]) then abort;//判断是否输入数字
end;

procedure TForm_ReturnDetail.BitBtn9Click(Sender: TObject);
begin
if messagedlg('你确定不保存此次退货就退出吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
 close;
end;
procedure TForm_ReturnDetail.SpeedButton2Click(Sender: TObject);
begin
try
 form_user:=Tform_user.Create(application);
 form_user.MaskEdit1.Text:=edit5.Text;
 if form_user.ShowModal=mrok then
  begin
   edit5.Text:=form_user.ADOQuery1EMPL_CODE.Value;
   self.empl_ptr:=form_user.ADOQuery1RKEY.Value;
  end;
finally
 form_user.Free;
end;
end;

procedure TForm_ReturnDetail.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
 if (key = chr(46)) then
 if pos('.',edit2.Text)>0 then abort;     //小数点不能重复
 if not (key in ['0'..'9','.',#8]) then abort;//判断是否输入数字
end;

end.
