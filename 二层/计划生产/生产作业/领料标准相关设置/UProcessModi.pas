unit UProcessModi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TfrmProcessModi = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    btn_quit: TBitBtn;
    btn_save: TBitBtn;
    pnl3: TPanel;
    lbl7: TLabel;
    lbl8: TLabel;
    edt_Process: TEdit;
    edt_fac: TEdit;
    btn_selfac: TBitBtn;
    btn_selProcess: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure btn_selfacClick(Sender: TObject);
    procedure btn_selProcessClick(Sender: TObject);
    procedure btn_quitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProcessModi: TfrmProcessModi;

implementation
     uses UDM, UMain, Pick_Item_Single,ConstVar;
{$R *.dfm}

procedure TfrmProcessModi.FormShow(Sender: TObject);
begin
  if dm.PFlag=1   then
   begin

   end
   else
   begin

   edt_Process.Text:= FrmMain.qry_process.fieldbyname('dept_name').asstring;
   edt_Process.tag:= FrmMain.qry_process.fieldbyname('cost_ptr').asinteger;
   edt_fac.text:=FrmMain.qry_process.fieldbyname('abbr_name').asstring;
   edt_fac.tag:= FrmMain.qry_process.fieldbyname('fac_ptr').asinteger;
    

   end;
end;

procedure TfrmProcessModi.btn_saveClick(Sender: TObject);
var
  ssql: string;
begin
   if Trim(edt_fac.text)=''  then
    begin
    ShowMessage('工厂不允许为空');
    edt_fac.Focused;
    exit;
    end;

     if Trim(edt_process.text)=''  then
    begin
    ShowMessage('工序不允许为空');
    edt_process.Focused;
    exit;
    end;

   try
   if dm.Pflag=1 then  //新增
   begin
    ssql:='insert into data0589(fac_ptr,cost_ptr )'+
     'values('+inttostr(edt_fac.tag)+','+inttostr(edt_Process.tag)+' )';
    dm.execsql(dm.qry_temp,ssql);


   end
   else
   begin
    ssql:= 'update data0589 set fac_ptr='+inttostr(edt_fac.tag)+' ,cost_ptr='+inttostr(edt_Process.tag)+'  where  rkey = '+FrmMain.qry_process.fieldbyname('rkey').asstring+' ';
     dm.execsql(dm.qry_temp,ssql);

   end;

   edt_Process.Text:='';
   edt_fac.Text:='';
   
   FrmMain.btn_refreshClick(sender);

   except on e:exception do
   begin
   ShowMessage('错误：'+e.Message);
   exit;
   end;
  end;


end;

procedure TfrmProcessModi.btn_selfacClick(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  try
      frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;

      InputVar.Fields := 'warehouse_code/工厂代码/100,abbr_name/工厂简称/200,rkey/ID/50';
       InputVar.Sqlstr := ' select warehouse_code , abbr_name,rkey from data0015 ';
        InputVar.AdoConn :=dm.con1;
        frmPick_Item_Single.InitForm_New(InputVar) ;
           if frmPick_Item_Single.ShowModal=mrok then
           begin
          edt_fac.text:= frmPick_Item_Single.adsPick.fieldbyname('abbr_name').asstring;
          edt_fac.tag:=  frmPick_Item_Single.adsPick.fieldbyname('rkey').asinteger;
          end;
    finally
    frmPick_Item_Single.Free ;
  end;
end;

procedure TfrmProcessModi.btn_selProcessClick(Sender: TObject);
var
  InputVar: PDlgInput ;
  ssql: string;
begin
  try
      frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;

      InputVar.Fields := 'dept_code/工序编号/100,dept_name/名称/120,rkey/ID/50';
       InputVar.Sqlstr := ' select  dept_code, dept_name,rkey from data0034 where rkey=cost_dept_ptr ';
        InputVar.AdoConn :=dm.con1;
        frmPick_Item_Single.InitForm_New(InputVar) ;
           if frmPick_Item_Single.ShowModal=mrok then
           begin
          edt_Process.text:= frmPick_Item_Single.adsPick.fieldbyname('dept_name').asstring;
          edt_process.tag:=  frmPick_Item_Single.adsPick.fieldbyname('rkey').asinteger;
          end;

  finally
  frmPick_Item_Single.Free ;
  end;

end;

procedure TfrmProcessModi.btn_quitClick(Sender: TObject);
begin
close;
end;

end.
