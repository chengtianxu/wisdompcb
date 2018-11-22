unit USel468MtlFrm_mod38;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseSinglePickListFrm, uCommFunc,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Vcl.StdCtrls,
  Data.DB, Datasnap.DBClient, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.ExtCtrls;

type

  TfrmSel468Mtl_mod38 = class;
  TFrmCallBack_Mod38 = procedure(AFrm: TfrmSel468Mtl_mod38) of object;

  TfrmSel468Mtl_mod38 = class(TfrmSinglePickList)
    lbl1: TLabel;
    cbbWH: TComboBox;
    cdstemp: TClientDataSet;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure cbbWHChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelPickClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FType: Integer; // 0配料单，1领料单

    invent_ptr: string;
    FParentCallBack: TFrmCallBack_Mod38;

    Fqty: double;
    QUAN_BOM: string;
    QUAN_ISSUED: string;
  end;

var
  frmSel468Mtl_mod38: TfrmSel468Mtl_mod38;

implementation

uses UPutOutfrm_mod38;
{$R *.dfm}

procedure TfrmSel468Mtl_mod38.btnCancelClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmSel468Mtl_mod38.btnCancelPickClick(Sender: TObject);
begin
  inherited;
close;
end;

procedure TfrmSel468Mtl_mod38.btnOKClick(Sender: TObject);
var
  // Lsql: string;
  Lfrm: TfrmPutOut_mod38;
begin
  // inherited;
  if cdspick.IsEmpty then
    exit;
  Lfrm := TfrmPutOut_mod38.Create(self);
  try
    cdstemp.close;
    cdstemp.Data := cdspick.Data;
    cdstemp.Filter := cdspick.Filter;
    cdstemp.Filtered := True;
    cdstemp.First;
    while not cdstemp.Eof do
    begin // 如果在复制的数据中有有效期小于 csdpick的记录 ，给予提示
      if (cdstemp.FieldByName('EXPIRE_DATE').AsDateTime <
        cdspick.FieldByName('EXPIRE_DATE').AsDateTime) and (cdspick.FieldByName('EXPIRE_DATE').AsDateTime>0)then
      begin
        if messagedlg('还有比当前有效期更早的库存记录，你确定要继续吗?', mtconfirmation, [mbyes, mbno],
          1) = mrNO then
        begin
          exit;
        end
        else
          Break;
      end;
      cdstemp.Next;
    end;
    cdstemp.close;

    if (cdspick.FieldByName('EXPIRE_DATE').value < gfunc.GetSvrDateTime) and  (cdspick.FieldByName('EXPIRE_DATE').AsDateTime>0) then
    begin
      showmessage('对不起,该批物料有效期已过,请发料到来料检查后重新确定有效期!');
      exit;
    end;

    Lfrm.edtBOMQty.visible := True;
    Lfrm.edtIssuedQty.visible := True;
    Lfrm.lbl4.visible := True;
    Lfrm.lbl5.visible := True;

    Lfrm.edtBOMQty.Text := self.QUAN_BOM;
    Lfrm.edtIssuedQty.Text := self.QUAN_ISSUED;
    Lfrm.edtQtyOnHnad.Text := cdspick.FieldByName('QUAN_ON_HAND').value;
    Lfrm.edtUnitName.Text := cdspick.FieldByName('unit_name').value;

    if self.FType = 0 then // 按配额发
    begin
      Lfrm.Tag := 1;
      if StrToCurr(QUAN_BOM) - StrToCurr(QUAN_ISSUED) > 0 then
        if StrToCurr(QUAN_BOM) - StrToCurr(QUAN_ISSUED) <
          cdspick.FieldByName('QUAN_ON_HAND').value then
          Lfrm.edtThisQty.Text := formatfloat('0.00',
            StrToCurr(QUAN_BOM) - StrToCurr(QUAN_ISSUED))
        else
          Lfrm.edtThisQty.Text := cdspick.FieldByName('QUAN_ON_HAND').value
      else
        Lfrm.edtThisQty.Text := '0';
    end
    else // 按领料单发
    begin
      Lfrm.Tag := 2;
      if StrToCurr(QUAN_BOM) - StrToCurr(QUAN_ISSUED) > 0 then
        if StrToCurr(QUAN_BOM) - StrToCurr(QUAN_ISSUED) <
          cdspick.FieldByName('QUAN_ON_HAND').value then
          Lfrm.edtThisQty.Text := formatfloat('0.00',
            StrToCurr(QUAN_BOM) - StrToCurr(QUAN_ISSUED))
        else
          Lfrm.edtThisQty.Text := cdspick.FieldByName('QUAN_ON_HAND').value
      else
        Lfrm.edtThisQty.Text := '0';
    end;

    if Lfrm.showmodal = mrok then
    begin
      Fqty := StrToCurr(Lfrm.edtThisQty.Text);

      if Assigned(FParentCallBack) then
        FParentCallBack(self);

      // 更新22qty
      cdspick.ReadOnly := false;
      cdspick.Edit;
      cdspick.FieldByName('QUAN_ON_HAND').value :=
        cdspick.FieldByName('QUAN_ON_HAND').value -
        StrToCurr(Lfrm.edtThisQty.Text);
      cdspick.Post;
      cdspick.ReadOnly := True;
      close;
    end;
  finally
    Lfrm.Free;
  end
end;

procedure TfrmSel468Mtl_mod38.cbbWHChange(Sender: TObject);
begin
  inherited;
  cdspick.Filter := 'warehouse_ptr=' +
    inttostr(Integer(cbbWH.Items.Objects[cbbWH.ItemIndex])) +
    ' and INVENTORY_PTR = ' + invent_ptr;
  cdspick.filtered:=true;
end;

procedure TfrmSel468Mtl_mod38.FormCreate(Sender: TObject);
var
  Lsql: string;
begin
  inherited;
  Lsql := 'select rkey,ABBR_NAME from data0015 order by rkey';
  gSvrIntf.IntfGetDataBySql(Lsql, cdstemp);
  cdstemp.First;
  while not cdstemp.Eof do
  begin
    cbbWH.Items.AddObject(cdstemp.FieldByName('ABBR_NAME').AsString,
      TObject(cdstemp.FieldByName('rkey').asinteger));
    cdstemp.Next;
  end;
end;

end.
