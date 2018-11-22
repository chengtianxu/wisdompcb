unit UPROD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TProd_Form = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Edit1: TEdit;
    Edit3: TEdit;
    BitBtn3: TBitBtn;
    Edit4: TEdit;
    Edit7: TEdit;
    Button1: TButton;
    Button2: TButton;
    Edit8: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure Button1Enter(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    function find_soerror(pro_code:string):boolean;

  private

     { Private declarations }
  public
    { Public declarations }
  end;

var
  Prod_Form: TProd_Form;

implementation

uses UPRODS, UENC;

{$R *.dfm}

procedure TProd_Form.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',edit4.Text)>0  then abort;
end;

procedure TProd_Form.Edit4ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
handled:=true;
end;

procedure TProd_Form.BitBtn3Click(Sender: TObject);
begin
ProdS_Form:=tProdS_Form.Create(application);
if ProdS_Form.ADOQuery1.IsEmpty then
 messagedlg('没有找到可用的产品库存请先入仓!!!',mterror,[mbcancel],0)
else
if ProdS_Form.ShowModal=mrok then
 begin
  edit1.Text:=ProdS_Form.ADOQuery1PROD_CODE.Value;
  label2.Caption:=ProdS_Form.ADOQuery1PRODUCT_NAME.Value;
  edit3.Text:=ProdS_Form.ADOQuery1LOCATION.Value;
  edit8.Text:=ProdS_Form.ADOQuery1qty_on_hand.AsString;
  edit2.Text:=ProdS_Form.ADOQuery1code.Value;
  edit4.SetFocus;
 end;
ProdS_Form.Free;
end;



procedure TProd_Form.Edit4Exit(Sender: TObject);
begin
if trim((sender as tedit).Text)='' then
(sender as tedit).Text:='0';
(sender as tedit).Text:=formatfloat('0.00', strtofloat((sender as tedit).Text));
end;

procedure TProd_Form.Button1Enter(Sender: TObject);
begin
if trim(edit1.Text)='' then
 begin
  messagedlg('库存产品不能为空!',mterror,[mbcancel],0);
  bitbtn3.SetFocus;
  exit;
 end;
if strtocurr(edit4.Text)=0 then
 begin
  messagedlg('销售数量必须大于零!',mterror,[mbcancel],0);
  edit4.SetFocus;
  exit;
 end;
if strtocurr(edit4.Text)>strtocurr(edit8.Text) then
 begin
  messagedlg('出仓数量不能大于当前库存数量!',mterror,[mbcancel],0);
  edit4.SetFocus;
  exit;
 end;
end;

procedure TProd_Form.Button1Click(Sender: TObject);
begin
if find_soerror(trim(edit1.Text)) then
   messagedlg('同一仓库产品不能重复在同一销售单中!',mterror,[mbcancel],0)
else
  begin
    if (strtocurr(edit8.Text) - strtocurr(edit4.Text))< 0 then
    showmessage('已没有足够库存，请重新操作')
    else
    begin
    self.ModalResult:=mrok;
    end;
  end;
end;

function TProd_Form.find_soerror(pro_code: string): boolean;
var
 i:word;
begin
      result:=false;
      for i:=1 to NEC_Form.SGrid1.RowCount-2 do
      if (pro_code=trim(NEC_Form.SGrid1.Cells[0,i]))then
        begin
          result:=true;
          break;
        end;
end;

end.
