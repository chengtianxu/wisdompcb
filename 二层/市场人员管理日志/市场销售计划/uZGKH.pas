unit uZGKH;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmZGKH = class(TForm)
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Edit2: TEdit;
    BQJHDD: TEdit;
    BQJHYP: TEdit;
    CPStatus: TRadioGroup;
    BQJHJE: TEdit;
    ZYCL: TEdit;
    CPSL: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    BitBtn2: TBitBtn;
    Label8: TLabel;
    Label9: TLabel;
    XYSTATUS: TRadioGroup;
    Label22: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BQJHDDKeyPress(Sender: TObject; var Key: Char);
  private
    _EMPPTR:integer;
    _CostPTR:integer;
    function New705():boolean;
    function Edit705():boolean;
    procedure Get705();
  public
    _isedit:boolean;
  end;

var
  frmZGKH: TfrmZGKH;

implementation

uses uCostomer, uEMPInfo, uDM;

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
//保存
function TfrmZGKH.New705():boolean;
var
 vrkey:integer;
begin
  dm.AQery.Close ;
  dm.AQery.SQL.Text:='SELECT * FROM data0705 WHERE (RKEY IS NULL)';
  dm.AQery.Open ;
  try

    dm.AQery.Append ;
    dm.AQery.FieldValues['PTR704']:=dm.AQery704.FieldValues['rkey'];//704表指针
    dm.AQery.FieldValues['PTR10']:=_CostPTR;                      //客户10指针
    dm.AQery.FieldValues['PTR5']:=_EMPPTR;                        //主管业务员指针
    dm.AQery.FieldValues['BQJHDD']:=strtofloat(BQJHDD.Text);      //本期计划订单
    dm.AQery.FieldValues['BQJHYP']:=strtofloat(BQJHYP.Text);      //本期计划样品
    dm.AQery.FieldValues['CPStatus']:=CPStatus.ItemIndex;      //产品类型(0单面板,1双面板,2多层板)
    dm.AQery.FieldValues['BQJHJE']:=strtofloat(BQJHJE.Text);      //产品金额
    dm.AQery.FieldValues['ZYCL']:=trim(ZYCL.Text);                //主要材料
    dm.AQery.FieldValues['CPSL']:=strtofloat(CPSL.Text);          //产品数量
    dm.AQery.FieldValues['XYSTATUS']:=XYSTATUS.ItemIndex;      //信誉状况(0优,1良,2一般,3差)
    dm.AQery.Post;
    messagedlg('保存成功！！！',mtinformation,[mbok],0);
    vrkey:=dm.AQery.FieldValues['rkey'];
    dm.ADS705.Close;
    dm.ADS705.Open ;
    dm.ADS705.Locate('rkey',vrkey,[]);
    result:=true;
  except
   on E: Exception do
     begin
      messagedlg(E.Message,mtinformation,[mbok],0);
      result:=false;
     end;
  end;
end;
function TfrmZGKH.Edit705():boolean;
var
 vrkey:integer;
begin
  dm.AQery.Close ;
  dm.AQery.SQL.Text:='SELECT * FROM data0705 WHERE (RKEY ='+dm.ADS705.FieldByName('rkey').AsString+')';
  dm.AQery.Open ;
  try
    dm.AQery.Edit;
    dm.AQery.FieldValues['PTR10']:=_CostPTR;                      //客户10指针
    dm.AQery.FieldValues['PTR5']:=_EMPPTR;                        //主管业务员指针
    dm.AQery.FieldValues['BQJHDD']:=strtofloat(BQJHDD.Text);      //本期计划订单
    dm.AQery.FieldValues['BQJHYP']:=strtofloat(BQJHYP.Text);      //本期计划样品
    dm.AQery.FieldValues['CPStatus']:=CPStatus.ItemIndex;         //产品类型(0单面板,1双面板,2多层板)
    dm.AQery.FieldValues['BQJHJE']:=strtofloat(BQJHJE.Text);      //产品金额
    dm.AQery.FieldValues['ZYCL']:=trim(ZYCL.Text);                //主要材料
    dm.AQery.FieldValues['CPSL']:=strtofloat(CPSL.Text);          //产品数量
    dm.AQery.FieldValues['XYSTATUS']:=XYSTATUS.ItemIndex;         //信誉状况(0优,1良,2一般,3差)
    dm.AQery.Post;
    messagedlg('保存成功！！！',mtinformation,[mbok],0);
    vrkey:=dm.ADS705.FieldValues['rkey'];
    dm.ADS705.Close;
    dm.ADS705.Open ;
    dm.ADS705.Locate('rkey',vrkey,[]);
    result:=true;
  except
   on E: Exception do
     begin
      messagedlg(E.Message,mtinformation,[mbok],0);
      result:=false;
     end;
  end;
end;
procedure TfrmZGKH.Get705();
var
 i,j:integer;
begin
 for i:=0 to ControlCount-1 do
  begin
   if Controls[i].ClassName ='TEdit' then
    for j:=0 to dm.ADS705.FieldCount-1 do
     if Controls[i].Name =dm.ADS705.Fields[j].FieldName then
      (Controls[i] as TEdit).Text:=dm.ADS705.Fields[j].Value;
   if Controls[i].ClassName ='TRadioGroup' then
    for j:=0 to dm.ADS705.FieldCount-1 do
     if Controls[i].Name =dm.ADS705.Fields[j].FieldName then
      (Controls[i] as TRadioGroup).ItemIndex:=dm.ADS705.Fields[j].Value;
  end; //end for
 //客户
 dm.AQery.Close ;
 dm.AQery.SQL.Text:='select rkey,CUST_CODE,CUSTOMER_NAME  from data0010 where rkey='+dm.ADS705.FieldByName('PTR10').AsString;
 dm.AQery.Open ;
 edit1.Text :=dm.AQery.FieldValues['CUST_CODE'];
 Label8.Caption:=dm.AQery.FieldValues['CUSTOMER_NAME'];
 _CostPTR:=dm.AQery.FieldValues['rkey'];
 //业务员
 dm.AQery.Close ;
 dm.AQery.SQL.Text:='select rkey,REP_CODE,SALES_REP_NAME  from data0009 where rkey='+dm.ADS705.FieldByName('PTR5').AsString;
 dm.AQery.Open ;
 edit2.Text :=dm.AQery.FieldValues['REP_CODE'];
 Label9.Caption:=dm.AQery.FieldValues['SALES_REP_NAME'];
 _EMPPTR:=dm.AQery.FieldValues['rkey'];


end;
procedure TfrmZGKH.FormShow(Sender: TObject);
begin
 if _isedit then
  Get705();
end;
//客户
procedure TfrmZGKH.BitBtn1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCostomer, frmCostomer);
  frmCostomer.AQery10.Open ;
  if trim(edit1.Text)<>'' then
   frmCostomer.Edit1.Text:=trim(edit1.Text);
  if frmCostomer.ShowModal=mrOk then
  begin
   edit1.Text:=frmCostomer.AQery10CUST_CODE.Value;
   Label8.Caption:=frmCostomer.AQery10CUSTOMER_NAME.Value ;
   _CostPTR:=frmCostomer.AQery10Rkey.Value;
   edit2.Text:=  frmCostomer.AQery10REP_CODE.Value;
   label9.Caption:=frmCostomer.AQery10SALES_REP_NAME.Value;
   _EMPPTR:=frmCostomer.AQery10SALES_REP_PTR.Value;
  end;

  frmCostomer.Free();
end;
//业务员
procedure TfrmZGKH.BitBtn2Click(Sender: TObject);
begin
  Application.CreateForm(TfrmEMPINFO, frmEMPINFO);
  frmEMPINFO.AQery5.Open ;

  if frmEMPINFO.ShowModal=mrOk then
  begin
   edit2.Text:=frmEMPINFO.AQery5REP_CODE.Value;
   Label9.Caption:=frmEMPINFO.AQery5SALES_REP_NAME.Value;
   _EMPPTR:=frmEMPINFO.AQery5RKEY.Value;
  end;

  frmEMPINFO.Free();
end;
//保存
procedure TfrmZGKH.SpeedButton1Click(Sender: TObject);
var
 i:integer;
begin
 if _CostPTR=0 then
  begin
   messagedlg('客户不能为空！！！',mtinformation,[mbok],0);
   exit;
  end;
 if _EMPPTR=0 then
  begin
   messagedlg('主管业务员不能为空！！！',mtinformation,[mbok],0);
   exit;
  end;
 try
  for i:=0 to ControlCount-1 do
    if Controls[i].ClassName  ='TEdit' then
     if (Controls[i].Name <>'Edit1') and (Controls[i].Name <>'Edit2')
      and (Controls[i].Name <>'ZYCL') then
      strtofloat(TEdit(Controls[i]).Text);
  if not _isedit then
   begin
    if New705() =false then exit;
   end
  else
   begin
    if Edit705()=false then exit;
   end;
  close;
 except
   on E: Exception do
     begin
      messagedlg(E.Message,mtinformation,[mbok],0);
     end;
 end;     
end;
procedure TfrmZGKH.SpeedButton2Click(Sender: TObject);
begin
 close;
end;

procedure TfrmZGKH.BQJHDDKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then exit;
 if checkchar(TEdit(Sender).Text, key)=false then
    begin
      showmessage('输入数数字！！！');
      abort;
    end;
end;

end.
