unit CheckRecordReport_705;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan, Vcl.Menus,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask, RzEdit, System.DateUtils,
  RzBtnEdt, uRKeyBtnEdit;

type
  TFrmCheckRecordReport_705 = class(TfrmBaseMain)
    lbl1: TLabel;
    dtp1: TDateTimePicker;
    lbl2: TLabel;
    dtp2: TDateTimePicker;
    lbl3: TLabel;
    edt_CustNO: TRKeyRzBtnEdit;
    rg_RType: TRadioGroup;
    Label5: TLabel;
    cbb_ClassNo: TComboBox;
    Label1: TLabel;
    edt_ProdNO: TEdit;
    procedure btnQryClick(Sender: TObject);
    procedure edt_CustNOButtonClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    FModelID:Integer;
    FTypeName:string;
  end;

var
  FrmCheckRecordReport_705: TFrmCheckRecordReport_705;

implementation
    uses uCommFunc, uBaseSinglePickListFrm;
{$R *.dfm}

procedure TFrmCheckRecordReport_705.btnExitClick(Sender: TObject);
begin
  //inherited;
  close;
end;

procedure TFrmCheckRecordReport_705.btnQryClick(Sender: TObject);
var
Lsql:string;
i:Integer;
Lstr:string;
begin
//inherited;
//  if (rg_RType.ItemIndex=0) and (dtp1.Date<>dtp2.date) then
//  begin
//  ShowMessage('单天报表需要两个日期一样！');
//  Exit;
//  end;

  Lstr:=' and a.QCDate>='''''+formatDatetime('yyyy-MM-dd',dtp1.date)+''''' and  a.QCDate<='''''+formatDatetime('yyyy-MM-dd',dtp2.date)+'''''    ';

  if Trim(edt_CustNO.Text)<>''  then
     Lstr:=Lstr+' and D10.Cust_Code='''''+trim(edt_CustNo.text)+'''''  ';

  if Trim(cbb_ClassNo.Text)<>''  then
     Lstr:=Lstr+' and a.ClassNO='''''+trim(cbb_ClassNo.text)+'''''  ';

  if Trim(edt_ProdNO.Text)<>''  then
     Lstr:=Lstr+' and d25.MANU_PART_NUMBER like '''''+trim(edt_ProdNO.text)+'%''''  ';



  if   FModelID in [1,2,3,4] then
  begin
    if (rg_RType.ItemIndex=0)  then
    Lsql:='exec sp_CheckRecordDayGather '+inttostr(FModelID)+','''+Lstr+''' '
    else
    Lsql:='exec sp_CheckRecordAllDayGather '+inttostr(FModelID)+','''+Lstr+''' ';

  end
  else   if   FModelID =5  then
    Lsql:='exec sp_CheckRecordDayGather_AOI_i1 '+inttostr(FModelID)+','''+Lstr+''' '  //1厂内层
  else   if   FModelID =6  then
    Lsql:='exec sp_CheckRecordDayGather_AOI_O1 '+inttostr(FModelID)+','''+Lstr+''' '   //1厂外层
  else
    Lsql:='exec sp_CheckRecordDayGather_AOI_2 '+inttostr(FModelID)+','''+Lstr+''' ' ;  //2厂AOI所有

    if (FTypeName='志浩内层AOI') or (FTypeName='志浩外层AOI') or (FTypeName='志浩次外层AOI') then
    Lsql:='exec sp_CheckRecordDayGather_AOI_2 '+inttostr(FModelID)+','''+Lstr+''' ' ;

    // ShowMessage(Lsql);

   gSvrIntf.IntfGetDataBySql(Lsql, cdsMain);

   if (rg_RType.ItemIndex=0) then
   begin
    ehMain.Columns[0].Width:=80;
    ehMain.Columns[1].Width:=80;
    ehMain.Columns[2].Width:=80;
    ehMain.Columns[3].Width:=30;
    ehMain.Columns[4].Width:=50;
    ehMain.Columns[5].Width:=50;
    ehMain.Columns[6].Width:=50;
    ehMain.Columns[7].Width:=50;
    ehMain.Columns[8].Width:=50;

   for i:=9 to ehMain.Columns.Count-1 do
    ehMain.Columns[i].Width:=60;
   end
   else
   begin
    ehMain.Columns[0].Width:=70;
    ehMain.Columns[1].Width:=70;
    ehMain.Columns[2].Width:=70;
    ehMain.Columns[3].Width:=70;
    ehMain.Columns[4].Width:=70;
    ehMain.Columns[5].Width:=70;

   for i:=6 to ehMain.Columns.Count-1 do
    ehMain.Columns[i].Width:=80;
   end;

   for i:=0 to ehMain.Columns.Count-1 do
   begin
    Lstr:=ehMain.Columns[i].Title.Caption;
    if  copy(Lstr,Length(Lstr)-1,2)='_1' then
     ehMain.Columns[i].Visible:=false;
   end;



end;

procedure TFrmCheckRecordReport_705.edt_CustNOButtonClick(Sender: TObject);
var
  LFrm: TfrmSinglePickList;
begin
 inherited;
  LFrm := TfrmSinglePickList.Create(self);
  try
    LFrm.InitWithPickID(705, 3);
    if LFrm.showmodal = mrok then
        edt_CustNO.Text:=  LFrm.cdsPick.FieldByName('cust_code').Value;
  finally
    LFrm.Free;
  end;

end;

procedure TFrmCheckRecordReport_705.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //inherited;
  Action := caFree;
  FrmCheckRecordReport_705 := nil;
end;

procedure TFrmCheckRecordReport_705.FormCreate(Sender: TObject);
begin
  //inherited;
   dtp1.DateTime := gFunc.GetSvrDateTime(dtdate);
   dtp2.DateTime := gFunc.GetSvrDateTime(dtdate);
end;

end.
