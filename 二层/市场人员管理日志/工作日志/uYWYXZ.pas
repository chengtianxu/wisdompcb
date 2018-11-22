unit uYWYXZ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, ComCtrls;

type
  TfrmYWYXZ = class(TForm)
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    TXDH: TEdit;
    TXDZ: TEdit;
    TXRXM: TEdit;
    TXRZC: TEdit;
    TXSJ: TDateTimePicker;
    HDRR: TMemo;
    HZYX: TRadioGroup;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    KHMC: TEdit;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
  private
    _CostPTR:integer;
    function New711():boolean;
    function Edit711():boolean;
    procedure Get711();
    function find_partnumber(part_number: string): boolean;
  public
    _isedit:boolean;
  end;

var
  frmYWYXZ: TfrmYWYXZ;

implementation

uses uCostomer, uDM,common;

{$R *.dfm}
//新增
function TfrmYWYXZ.New711():boolean;
var
 vrkey:integer;
 sys_date:tdatetime;
begin
  sys_date:=getsystem_date(dm.AQery,0);
  dm.AQery.Close ;
  dm.AQery.SQL.Text:='SELECT * FROM data0711 WHERE (RKEY IS NULL)';
  dm.AQery.Open ;
  try

    dm.AQery.Append ;
    dm.AQery.FieldValues['PTR708']:=dm.AQery708RKEY.Value;    //708表指针
    dm.AQery.FieldValues['PTR10']:=_CostPTR;                  //客户指针
    dm.AQery.FieldValues['KHMC']:=khmc.Text;            //客户名称
    dm.AQery.FieldValues['TXDZ']:=TXDZ.Text;                  //联系地址
    dm.AQery.FieldValues['TXDH']:=TXDH.text;                  //联系电话
    dm.AQery.FieldValues['TXRXM']:=TXRXM.Text;                //联系人
    dm.AQery.FieldValues['TXRZC']:=TXRZC.Text;                //联系人职位
    dm.AQery.FieldValues['TXSJ']:=TXSJ.Date ;                 //见面/电话时间
    dm.AQery.FieldValues['enter_date']:=sys_date;             //系统日期不可修改    
    dm.AQery.FieldValues['HDRR']:=HDRR.Lines.Text;            //面谈/电话内容
    dm.AQery.FieldValues['HZYX']:=HZYX.ItemIndex;             //合作意向(0有意合作,1不明确,2不可能合作)
    dm.AQery.Post;
    messagedlg('保存成功！！！',mtinformation,[mbok],0);
    vrkey:=dm.AQery.FieldValues['rkey'];
    dm.ADS711.Close;
    dm.ADS711.Open ;
    dm.ADS711.Locate('rkey',vrkey,[]);
    result:=true;
  except
   on E: Exception do
     begin
      messagedlg(E.Message,mtinformation,[mbok],0);
      result:=false;
     end;
  end;

end;
function TfrmYWYXZ.Edit711():boolean;
var
 vrkey:integer;
begin
  dm.AQery.Close ;
  dm.AQery.SQL.Text:='SELECT * FROM data0711 WHERE (RKEY ='+dm.ADS711.FieldByName('rkey').AsString+')';
  dm.AQery.Open ;
  try
    dm.AQery.Edit;

    dm.AQery.FieldValues['PTR10']:=_CostPTR;                  //客户指针
    dm.AQery.FieldValues['KHMC']:=khmc.Text;            //客户名称
    dm.AQery.FieldValues['TXDZ']:=TXDZ.Text;                  //联系地址
    dm.AQery.FieldValues['TXDH']:=TXDH.text;                  //联系电话
    dm.AQery.FieldValues['TXRXM']:=TXRXM.Text;                //联系人
    dm.AQery.FieldValues['TXRZC']:=TXRZC.Text;                //联系人职位
    dm.AQery.FieldValues['TXSJ']:=TXSJ.Date ;                 //见面/电话时间
    dm.AQery.FieldValues['HDRR']:=HDRR.Lines.Text;            //面谈/电话内容
    dm.AQery.FieldValues['HZYX']:=HZYX.ItemIndex;             //合作意向(0有意合作,1不明确,2不可能合作)
    dm.AQery.Post;
    messagedlg('保存成功！！！',mtinformation,[mbok],0);
    vrkey:=dm.ADS711.FieldValues['rkey'];
    dm.ADS711.Close;
    dm.ADS711.Open ;
    dm.ADS711.Locate('rkey',vrkey,[]);
    result:=true;
  except
   on E: Exception do
     begin
      messagedlg(E.Message,mtinformation,[mbok],0);
      result:=false;
     end;
  end;
end;
procedure TfrmYWYXZ.Get711();
var
 i,j:integer;
begin
 for i:=0 to ControlCount-1 do
  begin
   if Controls[i].ClassName ='TEdit' then
    for j:=0 to dm.ADS711.FieldCount-1 do
     if Controls[i].Name =dm.ADS711.Fields[j].FieldName then
      (Controls[i] as TEdit).Text:=dm.ADS711.Fields[j].Value;
   if Controls[i].ClassName ='TMemo' then
    for j:=0 to dm.ADS711.FieldCount-1 do
     if Controls[i].Name =dm.ADS711.Fields[j].FieldName then
      (Controls[i] as TMemo).Lines.Text:=dm.ADS711.Fields[j].Value;
   if Controls[i].ClassName ='TDateTimePicker' then
    for j:=0 to dm.ADS711.FieldCount-1 do
     if Controls[i].Name =dm.ADS711.Fields[j].FieldName then
      (Controls[i] as TDateTimePicker).Date :=dm.ADS711.Fields[j].Value;
   if Controls[i].ClassName ='TRadioGroup' then
    for j:=0 to dm.ADS711.FieldCount-1 do
     if Controls[i].Name =dm.ADS711.Fields[j].FieldName then
      (Controls[i] as TRadioGroup).ItemIndex :=dm.ADS711.Fields[j].Value;
  end; //end for
 //客户
 dm.AQery.Close ;
 dm.AQery.SQL.Text:='select *  from data0010 where rkey='+dm.ADS711.FieldByName('PTR10').AsString;
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
procedure TfrmYWYXZ.FormShow(Sender: TObject);
begin
 if _isedit then
  Get711()
 else
  txsj.Date:=date(); 
end;
//客户
procedure TfrmYWYXZ.BitBtn1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCostomer, frmCostomer);
  frmCostomer.AQery10.Open ;
  if trim(edit1.Text)<>'' then
   frmCostomer.Edit1.Text:=trim(edit1.Text);
  if frmCostomer.ShowModal=mrOk then
  begin
   edit1.Text:=frmCostomer.AQery10CUST_CODE.Value;
   Label2.Caption:=frmCostomer.AQery10CUSTOMER_NAME.Value ;
   khmc.Text:=frmCostomer.AQery10CUSTOMER_NAME.Value;
   _CostPTR:=frmCostomer.AQery10Rkey.Value;
  end;

  frmCostomer.Free();
end;
//保存
procedure TfrmYWYXZ.SpeedButton1Click(Sender: TObject);
begin

 try
  if not _isedit then
   begin
    if New711() =false then exit;
   end
  else
   begin
    if Edit711()=false then exit;
   end;
  close; 
 except
   on E: Exception do
     begin
      messagedlg(E.Message,mtinformation,[mbok],0);
     end;
 end;
end;

procedure TfrmYWYXZ.SpeedButton2Click(Sender: TObject);
begin
 close;
end;

function TfrmYWYXZ.find_partnumber(part_number: string): boolean;
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


procedure TfrmYWYXZ.Edit1Exit(Sender: TObject);
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
