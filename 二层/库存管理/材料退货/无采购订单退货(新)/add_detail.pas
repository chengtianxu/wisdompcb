unit add_detail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  Tfm_add = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    BitBtn4: TBitBtn;
    Label5: TLabel;
    Edit4: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
  private
    { Private declarations }
    rkey76:integer;
  public
    { Public declarations }
    function check_stock():boolean;  //检查是否有盘点进行中
  end;

var
  fm_add: Tfm_add;

implementation

uses damo,common,constvar,pick_item_single;

{$R *.dfm}

function Tfm_add.check_stock():boolean;
begin
 result:=false;
 with dm.aqtmp do
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

procedure Tfm_add.BitBtn1Click(Sender: TObject);
begin
 if check_stock then exit;  //盘点状态不允许操作库存
 if strtofloat(edit2.Text)=0 then
 begin
  messagedlg('退货数量不允许为零！',mtinformation,[mbok],0);
  edit2.SetFocus;
  exit;
 end;
 if trim(edit3.Text)='' then
 begin
  messagedlg('拒收代码不允许为空！',mtinformation,[mbok],0);
  edit3.SetFocus;
  exit;
 end;
 with dm.aqtmp do
 begin
  close;
  sql.Text:='select * from data0017 where rkey='+dm.AQ22inventory_ptr.AsString;
  open;
  if fieldvalues['quan_on_hand']<strtofloat(Edit2.text) then
  begin
   showmessage('新增退货失败！材料总库存数已不够本次退货。');
   exit;
  end;
 end;
//==============================================================================
 dm.ADOConnection1.BeginTrans;
 try
  with dm.aqtmp do
  begin
   close;   //新增材料退货记录表96
   sql.Text:='select * from data0096 where rkey is null';
   open;
   append;
   fieldvalues['rej_ptr']:= rkey76;
   fieldvalues['invt_ptr'] := dm.AQ22inventory_ptr.Value;
   fieldvalues['inv_tran_ptr'] := dm.AQ22rkey.Value;
   fieldbyname('empl_ptr').AsString := user_ptr;
   fieldvalues['tdate']:=getsystem_date(dm.aqtmp1,0);
   fieldbyname('quan_rejd').AsString := trim(edit2.Text);
   fieldvalues['flag'] := '2';//代表是退货给供应商
   fieldvalues['reference_number']:=trim(edit4.Text);
   post;
  end;

  dm.AQ22.Edit;  //更新入库明细
  dm.AQ22quan_to_be_shipped.Value:=dm.AQ22quan_to_be_shipped.Value+strtofloat(Edit2.text);
  dm.AQ22quan_on_hand.Value := dm.AQ22quan_on_hand.Value-strtocurr(Edit2.text);
  dm.AQ22.Post;
  
  with dm.aqtmp do //更新材料主表
  begin
   close;
   sql.Text:='update data0017 set quan_on_hand=quan_on_hand-'+Edit2.text+' where rkey='+dm.AQ22inventory_ptr.AsString;
   execsql;
  end;
  
 except
  on e:exception do
  begin
   dm.ADOConnection1.RollbackTrans;
   showmessage('错误：'+e.Message);
  // showmessage('更新不成功！可能多用户同时操作，数据已发生变化。');
   exit;
  end;
 end;
 self.ModalResult:=mrok;
 dm.ADOConnection1.CommitTrans;
 dm.AQ96.Close;
 dm.AQ96.Open;
 dm.AQ96.Last;
end;

procedure Tfm_add.BitBtn3Click(Sender: TObject);
begin
 close;
end;

procedure Tfm_add.BitBtn4Click(Sender: TObject);
var inputvar: PDlgInput; //搜索
begin
 frmpick_item_single:=Tfrmpick_item_single.Create(application);
 try
  inputvar.Fields:='code/拒收代码/130,reject_description/拒收原因/240';
  inputvar.Sqlstr:='select rkey,code,reject_description from data0076 order by code';
  inputvar.KeyField:='code';
  inputvar.InPut_value:=edit3.Text;
  inputvar.AdoConn:=dm.ADOConnection1;
  frmpick_item_single.InitForm_New(inputvar);
  if (frmpick_item_single.ShowModal=mrok) and (not frmpick_item_single.adsPick.IsEmpty) then
  begin
   edit3.Text:=trim(frmpick_item_single.adsPick.FieldValues['code']);
   label4.Caption:=trim(frmpick_item_single.adsPick.FieldValues['reject_description']);
   rkey76:=frmpick_item_single.adsPick.FieldValues['rkey'];
  end;
 finally
  frmpick_item_single.adsPick.Close;
  frmpick_item_single.Free;
 end;
end;

procedure Tfm_add.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
 if (key = chr(46)) then
 if pos('.',edit2.Text)>0 then abort;     //小数点不能重复
 if not (key in ['0'..'9','.',#8]) then abort;//判断是否输入数字
end;

procedure Tfm_add.Edit2Exit(Sender: TObject);
begin
 if trim(edit2.Text) = '' then  edit2.Text := '0';
 if strtofloat(edit2.Text) > strtofloat(edit1.Text) then
 begin
  messagedlg('退货数量不能大于当前可用数量!',mterror,[mbcancel],0);
  edit2.SetFocus;
 end
 else edit2.Text := formatfloat('0.000',strtofloat(edit2.Text));
end;

procedure Tfm_add.Edit3Exit(Sender: TObject);
begin
 if (trim(edit3.Text)<>'') then
  with dm.aqtmp do
  begin
   Close;
   SQL.Text:='select rkey,code,reject_description from data0076 '+
     'where code='+quotedstr(edit3.Text);
   Open;
   if not IsEmpty then
   begin
    label4.Caption:=FieldValues['reject_description'];
    rkey76:=FieldValues['rkey'];
   end
   else begin
    showmessage('您输入的拒收代码不存在，请重新输入！');
    label4.Caption:='';
    edit3.SetFocus;
   end;
  end
 else label4.Caption:='';
end;

end.
