unit uDDJF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls;

type
  TfrmDDJF = class(TForm)
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Edit1: TEdit;
    Edit2: TEdit;
    DDSL: TEdit;
    JHSL: TEdit;
    QHSL: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    _CostPTR,_CPPTR:integer;
    function New709():boolean;
    function Edit709():boolean;
    procedure Get709();
  public
    _isedit:boolean;
  end;

var
  frmDDJF: TfrmDDJF;

implementation

uses  uDM;

{$R *.dfm}
function TfrmDDJF.New709():boolean;
var
 vrkey:integer;
begin
  dm.AQery.Close ;
  dm.AQery.SQL.Text:='SELECT * FROM data0709 WHERE (RKEY IS NULL)';
  dm.AQery.Open ;
  try

    dm.AQery.Append ;
    dm.AQery.FieldValues['PTR708']:=dm.AQery708RKEY.Value;    //708表指针
    dm.AQery.FieldValues['PTR10']:=_CostPTR;                  //客户指针
    dm.AQery.FieldValues['PTR50']:=_CPPTR;                    //产品指针
    dm.AQery.FieldValues['DDSL']:=strtofloat(DDSL.Text);      //订单数量
    dm.AQery.FieldValues['JHSL']:=strtofloat(JHSL.Text);      //交货数量
    dm.AQery.FieldValues['QHSL']:=strtofloat(QHSL.Text);      //欠货数量

    dm.AQery.Post;
    messagedlg('保存成功！！！',mtinformation,[mbok],0);
    vrkey:=dm.AQery.FieldValues['rkey'];
    dm.ADS709.Close;
    dm.ADS709.Open ;
    dm.ADS709.Locate('rkey',vrkey,[]);
    result:=true;
  except
   on E: Exception do
     begin
      messagedlg(E.Message,mtinformation,[mbok],0);
      result:=false;
     end;
  end;

end;
function TfrmDDJF.Edit709():boolean;
var
 vrkey:integer;
begin
  dm.AQery.Close ;
  dm.AQery.SQL.Text:='SELECT * FROM data0709 WHERE (RKEY ='+dm.ADS709.FieldByName('rkey').AsString+')';
  dm.AQery.Open ;
  try
    dm.AQery.Edit;

    dm.AQery.FieldValues['PTR708']:=dm.AQery708RKEY.Value;    //708表指针
    dm.AQery.FieldValues['PTR10']:=_CostPTR;                  //客户指针
    dm.AQery.FieldValues['PTR50']:=_CPPTR;                    //产品指针
    dm.AQery.FieldValues['DDSL']:=strtofloat(DDSL.Text);      //订单数量
    dm.AQery.FieldValues['JHSL']:=strtofloat(JHSL.Text);      //交货数量
    dm.AQery.FieldValues['QHSL']:=strtofloat(QHSL.Text);      //欠货数量
    dm.AQery.Post;
    messagedlg('保存成功！！！',mtinformation,[mbok],0);
    vrkey:=dm.ADS709.FieldValues['rkey'];
    dm.ADS709.Close;
    dm.ADS709.Open ;
    dm.ADS709.Locate('rkey',vrkey,[]);
    result:=true;
  except
   on E: Exception do
     begin
      messagedlg(E.Message,mtinformation,[mbok],0);
      result:=false;
     end;
  end;
end;
procedure TfrmDDJF.Get709();
var
 i,j:integer;
begin
 for i:=0 to ControlCount-1 do
  begin
   if Controls[i].ClassName ='TEdit' then
    for j:=0 to dm.ADS709.FieldCount-1 do
     if Controls[i].Name =dm.ADS709.Fields[j].FieldName then
      (Controls[i] as TEdit).Text:=dm.ADS709.Fields[j].Value;
  end; //end for
 //客户
 dm.AQery.Close ;
 dm.AQery.SQL.Text:='select *  from data0010 where rkey='+dm.ADS709.FieldByName('PTR10').AsString;
 dm.AQery.Open ;
 if dm.AQery.RecordCount<>0 then
  begin
   edit1.Text :=dm.AQery.FieldValues['CUST_CODE'];
   Label2.Caption:=dm.AQery.FieldValues['CUSTOMER_NAME'];
   _CostPTR:=dm.AQery.FieldValues['rkey'];
  end;
 //产品
 dm.AQery.Close ;
 dm.AQery.SQL.Text:='select RKEY, MANU_PART_NUMBER, MANU_PART_DESC  from data0025 where rkey='+dm.ADS709.FieldByName('PTR50').AsString;
 dm.AQery.Open ;
 if dm.AQery.RecordCount<>0 then
  begin
   edit2.Text :=dm.AQery.FieldValues['MANU_PART_NUMBER'];
   Label4.Caption:=dm.AQery.FieldValues['MANU_PART_DESC'];
   _CPPTR:=dm.AQery.FieldValues['rkey'];
  end;
end;
procedure TfrmDDJF.FormShow(Sender: TObject);
begin
  Get709();
end;

//保存
procedure TfrmDDJF.SpeedButton1Click(Sender: TObject);
begin
 if _CostPTR=0 then
  begin
   messagedlg('客户不能为空！！！',mtinformation,[mbok],0);
   exit;
  end;
 if _CPPTR=0 then
  begin
   messagedlg('产品不能为空！！！',mtinformation,[mbok],0);
   exit;
  end;
 try
  strtofloat(DDSL.Text);
  strtofloat(JHSL.Text);
  strtofloat(QHSL.Text);
 if not _isedit then
   begin
    if New709() =false then exit;
   end
  else
   begin
    if Edit709()=false then exit;
   end;
  close; 
 except
   on E: Exception do
     begin
      messagedlg(E.Message,mtinformation,[mbok],0);
     end;
 end;
end;

procedure TfrmDDJF.SpeedButton2Click(Sender: TObject);
begin
 close;
end;

end.
