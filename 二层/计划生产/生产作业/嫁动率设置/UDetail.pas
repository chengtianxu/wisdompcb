unit UDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TFrmDetail = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    btn_save: TBitBtn;
    btn_close: TBitBtn;
    lbl1: TLabel;
    lbl2: TLabel;
    edt_Name: TEdit;
    edt_Time: TEdit;
    lbl3: TLabel;
    edt_OEE: TEdit;
    lbl4: TLabel;
    procedure btn_closeClick(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDetail: TFrmDetail;

implementation
        uses udm, UMain;
{$R *.dfm}

procedure TFrmDetail.btn_closeClick(Sender: TObject);
begin
close;
end;

procedure TFrmDetail.btn_saveClick(Sender: TObject);
var
  ssql: string;
begin
   if dm.editoradd=1 then
   begin
    if (trim(edt_name.text)='') or (trim(edt_time.text)='') then
      begin
      showmessage('请将名称和时间录入完整！');
      Exit;
      end;
     try
     ssql:='insert into data0578(cname,ttime,WARate)values('''+trim(edt_name.text)+''','+trim(edt_time.text)+',WARate='+trim(edt_oee.text)+'   )';
     //ShowMessage(ssql);
     dm.execsql(dm.qry_temp,ssql);
     close;
     except   on e:exception do
     begin
        showmessage('错误：'+e.message);
     end;
     end;
   end
   else if dm.EditOrAdd=2 then
   begin
//    if (trim(edt_name.text)='') or (trim(edt_time.text)='') then
//      begin
//      showmessage('请将名称和时间录入完整！');
//      Exit;
//      end;
     try
     ssql:='update data0578 set cname='''+trim(edt_name.text)+''',ttime='+trim(edt_time.text)+' ,WARate='+trim(edt_oee.text)+'  where rkey ='+inttostr(dm.mrkey)+' ';
      //ShowMessage(ssql);
     dm.execsql(dm.qry_temp,ssql);
     close;
     except   on e:exception do
     begin
        showmessage('错误：'+e.message);
     end;
     end;
   end



end;

procedure TFrmDetail.FormCreate(Sender: TObject);
begin
  if DM.EditOrAdd=2  then
  begin
   edt_Name.Text:=frmMain.qry_main.fieldbyname('cname').asstring;
   edt_time.Text:=frmMain.qry_main.fieldbyname('ttime').asstring;
   edt_OEE.Text:=FloatToStr(frmMain.qry_main.fieldbyname('WARate').asfloat);

  end;
end;

end.
