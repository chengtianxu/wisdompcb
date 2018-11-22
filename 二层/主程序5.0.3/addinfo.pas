unit addinfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzEdit, Buttons, RzLabel, ExtCtrls, Grids, Menus;

type
  TForm_addinfo = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    StringGrid1: TStringGrid;
    Panel1: TPanel;
    Memo1: TMemo;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    BitBtn3: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_addinfo: TForm_addinfo;

implementation

uses damo, selectuser,common;

{$R *.dfm}

procedure TForm_addinfo.FormActivate(Sender: TObject);
begin
 stringgrid1.Cells[0,0]:='用户代码';
 stringgrid1.Cells[1,0]:='用户名称';
 stringgrid1.ColWidths[2]:=0;
end;

procedure TForm_addinfo.BitBtn3Click(Sender: TObject);
var
 i:integer;
begin
with TForm_selectuser.Create(application)do
 try
  stringgrid1.RowCount:=self.StringGrid1.RowCount;
  for i:=1 to self.StringGrid1.RowCount-2 do
   stringgrid1.Rows[i]:=self.StringGrid1.Rows[i];
  if showmodal=mrok then
   begin
    self.stringgrid1.RowCount:=StringGrid1.RowCount;
    for i:=1 to StringGrid1.RowCount-2 do
     self.stringgrid1.Rows[i]:=StringGrid1.Rows[i];
   end;
 finally
  free;
 end;
end;

procedure TForm_addinfo.N1Click(Sender: TObject);
var
 i:integer;
begin
   for i:=stringgrid1.row to stringgrid1.RowCount-2 do
    stringgrid1.Rows[i].Text:=stringgrid1.Rows[i+1].Text;
    stringgrid1.RowCount:=stringgrid1.RowCount-1;
end;

procedure TForm_addinfo.PopupMenu1Popup(Sender: TObject);
begin
 if stringgrid1.Row=stringgrid1.RowCount-1 then
  n1.Enabled:=false
 else
  n1.Enabled:=true;
end;

procedure TForm_addinfo.BitBtn1Click(Sender: TObject);
var
 i,rkey14:integer;
begin
if stringgrid1.RowCount<=2 then
 ShowMsg('请确认接收人员',1)
else
 if trim(memo1.Text) <> '' then
  begin
    with dm.adsMenuList do
    begin
     close;
     CommandText:='select * from data0014 where rkey is null';
     open;
     append;
     fieldvalues['MESSAGE'] := memo1.text;
     fieldvalues['whosend']:= dm.ADOData0073RKEY.Value;
     post;
     rkey14:=fieldvalues['rkey'];
    end;
    with dm.adsTmp do
    begin
     close;
     sql.Text:='select emp_ptr,d14_ptr from data0314 where rkey is null';
     open;
    end;
   for i:=1 to stringgrid1.RowCount-2 do
   dm.adsTmp.AppendRecord([strtoint(stringgrid1.Cells[2,i]),
                           rkey14]);
   memo1.Text:='';
   ShowMsg('发送成功!!!',1);
   memo1.SetFocus;
  end
 else
  ShowMsg('不能发送空信息',1);
end;

procedure TForm_addinfo.StringGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  column,row:integer;
begin
if button=mbright then
 begin
  (sender as tstringgrid).MouseToCell(x,y,column,row);
   if row<>0 then
  (sender as tstringgrid).Row:=row;
 end;
end;

end.
