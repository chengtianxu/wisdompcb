unit UCostPeriod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGridEh, StdCtrls, ExtCtrls;

type
  TfrmCostPeriod = class(TForm)
    qry1: TADOQuery;
    ds1: TDataSource;
    atncfldqry1rkey: TAutoIncField;
    dtmfldqry1FM_DATE: TDateTimeField;
    dtmfldqry1END_DATE: TDateTimeField;
    dtmfldqry1CLOSED_DATE: TDateTimeField;
    strngfldqry1EMPLOYEE_NAME: TStringField;
    blnfldqry1sel: TBooleanField;
    pnl1: TPanel;
    pnl2: TPanel;
    dbgrdh1: TDBGridEh;
    btn_Ok: TButton;
    btn_cancel: TButton;
    btn_SelAll: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
    procedure btn_OkClick(Sender: TObject);
    procedure btn_SelAllClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCostPeriod: TfrmCostPeriod;

implementation
uses  UDm;

{$R *.dfm}

procedure TfrmCostPeriod.FormCreate(Sender: TObject);
begin
 //if not qry1.Active then qry1.Open;
 btn_SelAll.Caption:='全选';
end;

procedure TfrmCostPeriod.btn_cancelClick(Sender: TObject);
begin
close;

end;

procedure TfrmCostPeriod.btn_OkClick(Sender: TObject);
var
  SFlag: integer;
begin

 if qry1.IsEmpty then exit;
 SFlag:=0;
 qry1.First;
 while not qry1.Eof do
 begin

  if qry1.FieldByName('sel').asboolean then
    begin
    SFlag:=1 ;
    Break;
    end;
  qry1.next;

 end;
  if SFlag=0 then
  begin
  ShowMessage('请先选择期间！');
  exit;
  end;

  self.ModalResult:=mrok;
end;

procedure TfrmCostPeriod.btn_SelAllClick(Sender: TObject);
begin
  if qry1.IsEmpty then exit;

  qry1.First;
  if   btn_SelAll.Caption='全选' then
  begin
  while not qry1.eof do
  begin
   qry1.edit;
   qry1.FieldByName('sel').Value:=true;
  qry1.next;
  end;
   btn_SelAll.Caption:='全不选' ;
  end
  else
  begin
  while not qry1.eof do
  begin
    qry1.edit;
  qry1.FieldByName('sel').Value:=false;
  qry1.next;
  end;
   btn_SelAll.Caption:='全选' ;
  end;

end;

end.
