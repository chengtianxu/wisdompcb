unit surcharge;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids;

type
  TForm9 = class(TForm)
    StringGrid1: TStringGrid;
    Button1: TButton;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation
uses damo, detail;
{$R *.dfm}

procedure TForm9.FormActivate(Sender: TObject);
begin
 stringgrid1.Cells[0,0]:='工具费用类别';
 stringgrid1.Cells[1,0]:='金额';
 stringgrid1.Cells[2,0]:='免收金额';
end;

procedure TForm9.FormCreate(Sender: TObject);
var
 i:byte;
begin
 WITH dm.ADOQuery2 DO
  begin
   active:=false;
   sql.Clear;            //查找工具费用类别
   sql.Add('select rkey,category from data0061 order by rkey');
   active:=true;
   stringgrid1.RowCount:=recordcount+2;
   for i:=1 to RecordCount do
   begin
    stringgrid1.Cells[0,i]:=fieldbyname('category').AsString;
    stringgrid1.Cells[3,i]:=fieldbyname('rkey').AsString;
    StringGrid1.Cells[1,i]:='0.000';
    StringGrid1.Cells[2,i]:='0.000';
    next;
   end;
  end;
 with dm.ADOQuery2 do
  begin
   active:=false;
   sql.Clear;
   sql.Add('select * from data0062 where');
   sql.Add('so_ptr='+dm.ADO60rkey.AsString);
   active := true;
  while not Eof do   //查找工具费用
   begin
    for i:=1 to StringGrid1.RowCount-2 do
     if strtoint(stringgrid1.Cells[3,i])=fieldvalues['addl_cat_ptr'] then
      begin
       stringgrid1.Cells[1,i]:=formatfloat('0.000',fieldValues['amount']);
       stringgrid1.Cells[2,i]:=formatfloat('0.000',fieldValues['free_amount']);
       break;
      end;
    Next;
   end;
 end;
end;

procedure TForm9.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 dm.ADOQuery2.Close;
end;

end.
