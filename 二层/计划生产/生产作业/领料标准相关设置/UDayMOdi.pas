unit UDayMOdi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls,DateUtils;

type
  TFrmDayModi = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    btn_quit: TBitBtn;
    btn_save: TBitBtn;
    lbl7: TLabel;
    lbl8: TLabel;
    edt_Process: TEdit;
    btn_selProcess: TBitBtn;
    lbl4: TLabel;
    dtp_Date: TDateTimePicker;
    lbl1: TLabel;
    edt_Days: TEdit;
    lbl2: TLabel;
    edt_remark: TEdit;
    edt_fac: TEdit;
    btn_selfac: TBitBtn;
    procedure btn_quitClick(Sender: TObject);
    procedure btn_selfacClick(Sender: TObject);
    procedure btn_selProcessClick(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDayModi: TFrmDayModi;

implementation
      uses  udm,common, Pick_Item_Single,ConstVar , UMain;
{$R *.dfm}

procedure TFrmDayModi.btn_quitClick(Sender: TObject);
begin
close;
end;

procedure TFrmDayModi.btn_selfacClick(Sender: TObject);
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

procedure TFrmDayModi.btn_selProcessClick(Sender: TObject);
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

procedure TFrmDayModi.btn_saveClick(Sender: TObject);
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

   if Trim(edt_days.text)=''  then
    begin
    ShowMessage('请录入天数');
    edt_days.Focused;
    exit;
    end;
   try
   if dm.Mflag=1 then  //新增
   begin
    ssql:='insert into data0590(fac_ptr,cost_ptr,ReqDate,freedays,remark)'+
     'values('+inttostr(edt_fac.tag)+','+inttostr(edt_Process.tag)+','''+formatdatetime('yyyy-MM-dd',dtp_date.date)+''' ,'+edT_days.text+','''+trim(edt_remark.text)+''' )';
    dm.execsql(dm.qry_temp,ssql);


   end
   else
   begin
    ssql:= 'update data0590 set fac_ptr='+inttostr(edt_fac.tag)+' ,cost_ptr='+inttostr(edt_Process.tag)+', ReqDate='''+formatdatetime('yyyy-MM-dd',dtp_date.date)+''', freedays='+edT_days.text+','+
    ' remark='''+trim(edt_remark.text)+'''   where  rkey = '+FrmMain.qry_day.fieldbyname('rkey').asstring+' ';
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

procedure TFrmDayModi.FormShow(Sender: TObject);
begin
   if dm.MFlag=1   then
   begin
   dtp_Date.Date:=Now;

   end
   else
   begin
   dtp_Date.Date:=FrmMain.qry_day.fieldbyname('ReqDate').asdatetime;
   edt_Process.Text:= FrmMain.qry_day.fieldbyname('dept_name').asstring;
   edt_Process.tag:= FrmMain.qry_day.fieldbyname('cost_ptr').asinteger;
   edt_fac.text:=FrmMain.qry_day.fieldbyname('abbr_name').asstring;
   edt_fac.tag:= FrmMain.qry_day.fieldbyname('fac_ptr').asinteger;
   edt_Days.text:= FrmMain.qry_day.fieldbyname('freedays').asstring;
   edt_remark.Text:=  FrmMain.qry_day.fieldbyname('remark').asstring;
   
   end;

end;

end.
