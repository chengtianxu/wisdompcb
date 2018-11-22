unit uKFKH;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls;

type
  TfrmKFKH = class(TForm)
    Edit1: TEdit;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    GMRS: TEdit;
    ZYCP: TEdit;
    PCBYL: TEdit;
    TXDZ: TEdit;
    TXDH: TEdit;
    TXRXM: TEdit;
    HZYX: TRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    BitBtn1: TBitBtn;
    KHMC: TEdit;
    Label9: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure GMRSKeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Exit(Sender: TObject);
  private
    _CostPTR:integer;
    function New706():boolean;
    function Edit706():boolean;
    procedure Get706();
    function find_partnumber(part_number: string): boolean;
  public
    _isedit:boolean;
  end;

var
  frmKFKH: TfrmKFKH;

implementation

uses uCostomer, uDM;

{$R *.dfm}
function checkchar(const pstr:string;const pkey:char):boolean;
var
 i,iLast:integer;
begin
  result:=true;
 if not (pkey in ['0'..'9','.',#8]) then  //判断是否输入数字
  result:=false
 else
   if pkey='.' then
     begin
      iLast:=0;
      for i:=0 to Length(pstr) do
       if pstr[i]='.' then
        begin
         iLast:=iLast+1;
         if iLast=1 then
          begin
           result:=false;
           break;
          end;
       end;
     end
    else
     result:=true;
end;
//新增
function TfrmKFKH.New706():boolean;
var
 vrkey:integer;
begin
  dm.AQery.Close ;
  dm.AQery.SQL.Text:='SELECT * FROM data0706 WHERE (RKEY IS NULL)';
  dm.AQery.Open ;
  try

    dm.AQery.Append ;
    dm.AQery.FieldValues['PTR704']:=dm.AQery704RKEY.Value;    //704表指针
    dm.AQery.FieldValues['PTR10']:=_CostPTR;                  //客户10指针
    dm.AQery.FieldValues['KHMC']:=khmc.Text;                  //客户名称
    dm.AQery.FieldValues['GMRS']:=strtofloat(GMRS.Text);      //规格人数
    dm.AQery.FieldValues['ZYCP']:=trim(ZYCP.Text);            //主要产品
    dm.AQery.FieldValues['PCBYL']:=strtofloat(PCBYL.Text);    //PCB月用量
    dm.AQery.FieldValues['TXDZ']:=trim(TXDZ.Text);            //地址
    dm.AQery.FieldValues['TXDH']:=trim(TXDH.Text);            //联系电话
    dm.AQery.FieldValues['TXRXM']:=trim(TXRXM.Text);          //联系人
    dm.AQery.FieldValues['HZYX']:=HZYX.ItemIndex;   //合作意向(0非常可能,1有可能,2暂时无意合作)
    dm.AQery.Post;
    messagedlg('保存成功！！！',mtinformation,[mbok],0);
    vrkey:=dm.AQery.FieldValues['rkey'];
    dm.ADS706.Close;
    dm.ADS706.Open ;
    dm.ADS706.Locate('rkey',vrkey,[]);
    result:=true;
  except
   on E: Exception do
     begin
      messagedlg(E.Message,mtinformation,[mbok],0);
      result:=false;
     end;
  end;
end;
//编辑
function TfrmKFKH.Edit706():boolean;
var
 vrkey:integer;
begin
  dm.AQery.Close ;
  dm.AQery.SQL.Text:='SELECT * FROM data0706 WHERE (RKEY ='+dm.ADS706.FieldByName('rkey').AsString+')';
  dm.AQery.Open ;
  try
    dm.AQery.Edit;
    dm.AQery.FieldValues['PTR10']:=_CostPTR;                        //客户10指针
    dm.AQery.FieldValues['KHMC']:=khmc.Text;                   //客户名称
    dm.AQery.FieldValues['GMRS']:=strtofloat(GMRS.Text);            //规格人数
    dm.AQery.FieldValues['ZYCP']:=trim(ZYCP.Text);                  //主要产品
    dm.AQery.FieldValues['PCBYL']:=strtofloat(PCBYL.Text);          //PCB月用量
    dm.AQery.FieldValues['TXDZ']:=trim(TXDZ.Text);                  //地址
    dm.AQery.FieldValues['TXDH']:=trim(TXDH.Text);                  //联系电话
    dm.AQery.FieldValues['TXRXM']:=trim(TXRXM.Text);                //联系人
    dm.AQery.FieldValues['HZYX']:=HZYX.ItemIndex;         //合作意向(0非常可能,1有可能,2暂时无意合作)
    dm.AQery.Post;
    messagedlg('保存成功！！！',mtinformation,[mbok],0);
    vrkey:=dm.ADS706.FieldValues['rkey'];
    dm.ADS706.Close;
    dm.ADS706.Open ;
    dm.ADS706.Locate('rkey',vrkey,[]);
    result:=true;
  except
   on E: Exception do
     begin
      messagedlg(E.Message,mtinformation,[mbok],0);
      result:=false;
     end;
  end;
end;
procedure TfrmKFKH.Get706();
var
 i,j:integer;
begin
 for i:=0 to ControlCount-1 do
  begin
   if Controls[i].ClassName ='TEdit' then
    for j:=0 to dm.ADS706.FieldCount-1 do
     if Controls[i].Name =dm.ADS706.Fields[j].FieldName then
      (Controls[i] as TEdit).Text:=dm.ADS706.Fields[j].Value;
   if Controls[i].ClassName ='TRadioGroup' then
    for j:=0 to dm.ADS706.FieldCount-1 do
     if Controls[i].Name =dm.ADS706.Fields[j].FieldName then
      (Controls[i] as TRadioGroup).ItemIndex:=dm.ADS706.Fields[j].Value;
  end; //end for
 //客户
 dm.AQery.Close ;
 dm.AQery.SQL.Text:='select *  from data0010 where rkey='+dm.ADS706.FieldByName('PTR10').AsString;
 dm.AQery.Open ;
 if dm.AQery.RecordCount<>0 then
  begin
   edit1.Text :=dm.AQery.FieldValues['CUST_CODE'];
   Label2.Caption:=dm.AQery.FieldValues['CUSTOMER_NAME'];
   _CostPTR:=dm.AQery.FieldValues['rkey'];
  end
 else
  begin
   _CostPTR:=0;
  end;

end;
procedure TfrmKFKH.FormShow(Sender: TObject);
begin
 if _isedit then
  Get706();
end;
//客户
procedure TfrmKFKH.BitBtn1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCostomer, frmCostomer);
  frmCostomer.AQery10.Open ;
  if trim(edit1.Text)<>'' then
   frmCostomer.Edit1.Text:=trim(edit1.Text);
  if frmCostomer.ShowModal=mrOk then
  begin
   edit1.Text:=frmCostomer.AQery10CUST_CODE.Value;
   Label2.Caption:=frmCostomer.AQery10CUSTOMER_NAME.Value;
   khmc.Text:=frmCostomer.AQery10CUSTOMER_NAME.Value;
   _CostPTR:=frmCostomer.AQery10Rkey.Value;
  end;

  frmCostomer.Free();
end;
//保存
procedure TfrmKFKH.SpeedButton1Click(Sender: TObject);

begin
if trim(khmc.Text)='' then
begin
 messagedlg('客户名称不能为空!',mterror,[mbcancel],0);
 khmc.SetFocus;
 exit;
end;

 try

  strtofloat(GMRS.Text);
  strtofloat(PCBYL.Text);
  if not _isedit then
   begin
    if New706() =false then exit;
   end
  else
   begin
    if Edit706()=false then exit;
   end;
  close;
 except
   on E: Exception do
     begin
      messagedlg(E.Message,mtinformation,[mbok],0);
     end;
 end;
end;
//退出
procedure TfrmKFKH.SpeedButton2Click(Sender: TObject);
begin
 close;
end;

procedure TfrmKFKH.GMRSKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then exit;
 if checkchar(TEdit(Sender).Text, key)=false then
    begin
      showmessage('输入数数字！！！');
      abort;
    end;
end;

function TfrmKFKH.find_partnumber(part_number: string): boolean;
begin
with dm.aqery do
begin
 close;
 sql.Text:=
'SELECT data0010.rkey,cust_code,customer_name'+#13+
'FROM Data0010'+#13+
'where data0010.cust_code ='''+part_number+'''';
 open;
 if isempty then
  result:=false
 else
  result:=true;
end;
end;


procedure TfrmKFKH.Edit1Exit(Sender: TObject);
begin
if (trim(edit1.Text)<>'') and (activecontrol.Name<>'BitBtn1') then
 begin
  if self.find_partnumber(trim(edit1.Text)) then
  begin
   Label2.Caption:=dm.AQery.fieldbyname('CUSTOMER_NAME').AsString;
   khmc.Text:=label2.Caption;
   _CostPTR:=dm.AQery.fieldbyname('Rkey').Value;
  end
  else
  begin
   messagedlg('客户代码输入错误!',mtinformation,[mbcancel],0);
   edit1.SetFocus;
  end;
 end
else
if (trim(edit1.Text)='') and (activecontrol.Name<>'BitBtn1') then
 begin
  label2.caption:='';
  _CostPTR:=0;
 end;
end;

end.
