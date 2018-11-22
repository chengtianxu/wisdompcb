unit UMachineDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TFrmMachineDetail = class(TForm)
    pnlFrmMachineDetail: TPanel;
    pnl2: TPanel;
    btn_save: TBitBtn;
    btn_close: TBitBtn;
    pnl3: TPanel;
    lbl1: TLabel;
    edt_Name: TEdit;
    procedure btn_saveClick(Sender: TObject);
    procedure btn_closeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMachineDetail: TFrmMachineDetail;

implementation

uses UDM, UMain;

{$R *.dfm}

procedure TFrmMachineDetail.btn_saveClick(Sender: TObject);
var
  ssql: string;
begin

 try
   if dm.editoradd=1 then
   begin
    if (trim(edt_name.text)='')   then
      begin
      showmessage('请录入机台名称！');
      Exit;
      end;

     ssql:='insert into data0580(CID,Mname)values('+inttostr(FrmMain.qry_main.fieldbyname('rkey').asinteger)+','''+trim(edt_name.text)+''' )';
     //ShowMessage(ssql);
     dm.execsql(dm.qry_temp,ssql);
     close;

   end
   else if dm.EditOrAdd=2 then
   begin

     ssql:='update data0580 set Mname='''+trim(edt_name.text)+''' where  cid='+inttostr(FrmMain.qry_main.fieldbyname('rkey').asinteger)+' and MName= '''+FrmMain.qry_machine.fieldbyname('MName').asstring+'''   ';
      //ShowMessage(ssql);
     dm.execsql(dm.qry_temp,ssql);
     close;

   end
   except   on e:exception do
   begin
      showmessage('错误：'+e.message);
   end;
   end;
end;

procedure TFrmMachineDetail.btn_closeClick(Sender: TObject);
begin
close;
end;

end.
