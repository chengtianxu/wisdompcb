unit USel235Materialfrm_Mod38;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseSinglePickListFrm,uCommFunc,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB,
  Datasnap.DBClient, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TfrmSel235Material_Mod38  = class;
  TFrmCallBack_Mod38 = procedure(AFrm: TfrmSel235Material_Mod38 ) of object;


  TfrmSel235Material_Mod38 = class(TfrmSinglePickList)
    cbbWH: TComboBox;
    lbl1: TLabel;
    cdstemp: TClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure cbbWHChange(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure edtFilterChange(Sender: TObject);
  private
    { Private declarations }
    whouse_ptr:Tstringlist;
  public
    { Public declarations }
    FParentCallBack :TFrmCallBack_Mod38;
    Fqty:double;
  end;

var
  frmSel235Material_Mod38: TfrmSel235Material_Mod38;

implementation
         uses UPutOutfrm_mod38;
{$R *.dfm}

procedure TfrmSel235Material_Mod38.btnOKClick(Sender: TObject);
var
  LFrm: TfrmPutOut_mod38;
begin
  if cdspick.IsEmpty then  exit;
  LFrm := TfrmPutOut_mod38.Create(Self);
  try
    LFrm.edtQtyOnHnad.text:= cdspick.FieldByName('QUAN_ON_HAND').value;
    LFrm.edtUnitName.text:= cdspick.FieldByName('unit_name').value;
    Lfrm.edtThisQty.Text:=  cdspick.FieldByName('QUAN_ON_HAND').value;
    if LFrm.showmodal=mrok then
    begin
     Fqty:=StrToFloat(LFrm.edtThisQty.Text);

      if Assigned(FParentCallBack) then
       FParentCallBack(Self);
      cdsPick.ReadOnly:=false;
      cdsPick.Delete;
      cdspick.ReadOnly:=true;
    end;
  finally
   LFrm.free;
  end;
end;

procedure TfrmSel235Material_Mod38.cbbWHChange(Sender: TObject);
begin
  inherited;
cdsPick.FILTER:='warehouse_ptr='+whouse_ptr.Strings[cbbwh.itemindex];
 cdsPick.filtered:=true;
end;

procedure TfrmSel235Material_Mod38.edtFilterChange(Sender: TObject);
var
  fDate: Tdatetime;
begin

  if (FHotColumn.Field.DataType in [ftDate, ftDateTime]) and (trim(edtFilter.text)<>'') then
    if not TryStrToDate(trim(edtFilter.text), fDate) then
    begin
      Showmessage(trim(edtFilter.text) + '不是日期格式！');
      exit;
    end;
  inherited;
end;

procedure TfrmSel235Material_Mod38.FormCreate(Sender: TObject);
var
cdstemp:TClientDataSet;
Lsql:string;
begin
  inherited;
  cdstemp:=TClientDataSet.Create(nil);
  whouse_ptr:=tstringlist.Create;

   Lsql:='select rkey,ABBR_NAME from data0015 order by rkey';
   gSvrIntf.IntfGetDataBySql(Lsql,cdstemp);
   if not cdstemp.IsEmpty then
   begin
   cdstemp.First;
   while not cdstemp.eof do
    begin
     cbbWH.Items.Add(cdstemp.fieldbyname('ABBR_NAME').AsString);
     whouse_ptr.Add(cdstemp.fieldbyname('rkey').AsString);
     cdstemp.next;
    end;
   end;
end;

end.
