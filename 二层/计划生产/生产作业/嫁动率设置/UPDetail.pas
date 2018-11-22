unit UPDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, Menus, DB, ADODB;


type
  TFrmPDetail = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    btn_save: TBitBtn;
    btn_close: TBitBtn;
    pnl3: TPanel;
    dbgrdh1: TDBGridEh;
    pm1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    qry_CP: TADOQuery;
    ds1: TDataSource;
    intgrfld_CPrkey: TIntegerField;
    strngfld_CPdept_code: TStringField;
    strngfld_CPDept_name: TStringField;
    procedure N1Click(Sender: TObject);
    procedure btn_closeClick(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPDetail: TFrmPDetail;

implementation
      uses udm,USelProcess, UMain;
{$R *.dfm}

procedure TFrmPDetail.N1Click(Sender: TObject);
var
  str: string;
begin

   frmSelProcess:=TfrmSelProcess.create(self);

    frmSelProcess.showmodal;
   if frmSelProcess.ModalResult=mrok then
   begin
     with  frmSelProcess do
     begin
     dm.qry1.Filtered:=False;
     dm.qry1.Filter:=' ISselected =1 ';
     dm.qry1.Filtered:=true;

     if  dm.qry1.RecordCount<1 then exit;


      dm.qry1.first;
      while not dm.qry1.eof do
      begin
      qry_CP.Append;
      qry_CP.FieldByName('rkey').Value:=  dm.qry1.FieldByName('rkey').asinteger;
      qry_CP.FieldByName('Dept_code').Value:= dm.qry1.FieldByName('Dept_code').asstring;
      qry_CP.FieldByName('Dept_name').Value:= dm.qry1.FieldByName('Dept_name').asstring;
      qry_CP.post;
       dm.qry1.next;
      end;
     str:='';
     if qry_CP.IsEmpty   then exit;
     qry_CP.First;
     while not qry_CP.Eof do
     begin
      str:=str+'dept_code <> '''+qry_cp.fieldbyname('dept_code').AsString+''' and ';
      qry_CP.Next;
     end;
     str:= Copy(str,0,Length(str)-4);
     dm.qry1.Filtered:=false;
     dm.qry1 .filter:=str;
     dm.qry1.Filtered:=true;
     
     end;
   end;
end;

procedure TFrmPDetail.btn_closeClick(Sender: TObject);
begin
 dm.qry1.Filtered:=false;
close;
end;

procedure TFrmPDetail.btn_saveClick(Sender: TObject);
var ssql: string;
begin
 if qry_CP.IsEmpty then
 begin
 showmessage('«Îœ»—°‘Òπ§–Ú£°');
 exit;
 end;
 qry_CP.First;
 try
 while not qry_CP.Eof do
 begin
   ssql:=' insert into data0579(cid,pid)values('+inttostr(FrmMain.qry_main.fieldbyname('rkey').asinteger)+','+inttostr(qry_cp.FieldByName('rkey').asinteger)+')';
   dm.execsql(dm.qry_temp,ssql);
   qry_CP.next;
 end;
  frmmain.qry_process.requery;
   dm.qry1.Filtered:=false;
  close;

 except on e: exception do
  showmessage('¥ÌŒÛ: '+e.message);
 end;

end;

procedure TFrmPDetail.FormShow(Sender: TObject);
begin
if not qry_cp.Active then qry_cp.open;
end;

procedure TFrmPDetail.N2Click(Sender: TObject);
begin
  if qry_CP.IsEmpty then exit;

    qry_CP.Delete;
end;

end.
