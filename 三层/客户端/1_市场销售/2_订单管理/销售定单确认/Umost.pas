unit Umost;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseEditFrm, Vcl.StdCtrls, Vcl.Grids,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Datasnap.DBClient;

type
  Tcost_mod73 = class(TfrmBaseEdit)
  StringGrid1: TStringGrid;
  Button1: TButton;
  ads61: TClientDataSet;
  ClientDataSet1: TClientDataSet;
  procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
  procedure GetData;
  procedure getdata61(rkey:Integer);
    { Public declarations }
  end;

var
  cost_mod73: Tcost_mod73;

implementation

{$R *.dfm}
uses uCommFunc;

procedure Tcost_mod73.FormCreate(Sender: TObject);
begin
 stringgrid1.Cells[0,0]:='工具费用类别';
 stringgrid1.Cells[1,0]:='金额';
 stringgrid1.Cells[2,0]:='挂账金额';
 stringgrid1.Cells[3,0]:='征税';

end;

procedure Tcost_mod73.GetData;
var ads61sql:string;
var i : Byte;
begin
 ads61sql:=ads61.CommandText;
 gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([ads61sql]),[ads61]);
 WITH ads61 DO
 begin
 stringgrid1.RowCount:=recordcount+2;
  for i:=1 to RecordCount do
  begin
   stringgrid1.Cells[0,i]:=fieldbyname('category').AsString;
   stringgrid1.Cells[4,i]:=fieldbyname('rkey').AsString;
   StringGrid1.Cells[1,i]:='0.000';
   StringGrid1.Cells[2,i]:='0.000';
   StringGrid1.Cells[3,i]:=fieldbyname('tax_flag').AsString;
   next;
  end;
 end;
end;



procedure Tcost_mod73.getdata61(rkey: Integer);
var clisql:string; i:byte;
begin
 clisql:=ClientDataSet1.CommandText+'where so_ptr= '+IntToStr(rkey);
 gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([clisql]),[ClientDataSet1]);
 with ClientDataSet1 do
 begin
   while not Eof do   //查找工具费用
   begin
    for i:=1 to StringGrid1.RowCount-2 do
    if trim(stringgrid1.Cells[4,i])=trim(fieldbyname('addl_cat_ptr').asstring) then
    begin
     stringgrid1.Cells[1,i]:=formatfloat('0.000',fieldValues['amount']);
     stringgrid1.Cells[2,i]:=formatfloat('0.000',fieldValues['free_amount']);
     stringgrid1.Cells[3,i]:=fieldbyname('tax_flag').asstring;
     break;
    end;
    Next;
   end;
 end;
end;

end.
