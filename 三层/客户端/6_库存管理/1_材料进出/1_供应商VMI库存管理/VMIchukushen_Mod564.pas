unit VMIchukushen_Mod564;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,ubasemainfrm,ucommfunc, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Vcl.Menus, Vcl.ExtCtrls, Data.DB,
  Vcl.XPMan, Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh,Editchukushu, PasshuReport_Mod564;


type
  TfrmVMIchukushen_Mod564 = class(TfrmBaseMain)
    Splitter1: TSplitter;
    DBGridEh1: TDBGridEh;
    N1: TMenuItem;
    N2: TMenuItem;
    cdsDetail: TClientDataSet;
    dsDetail: TDataSource;
    PopupMenu2: TPopupMenu;
    N3: TMenuItem;
    cds724: TClientDataSet;
    PopupMenu1: TPopupMenu;
    N4: TMenuItem;
    procedure btnQryClick(Sender: TObject);
    procedure cdsMainAfterScroll(DataSet: TDataSet);
    procedure N1Click(Sender: TObject);
    procedure ehMainDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure pmMainPopup(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure btnDYClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData();override;
  end;

//var
//  frmVMIchukushen_Mod564: TfrmVMIchukushen_Mod564;

implementation

{$R *.dfm}

procedure TfrmVMIchukushen_Mod564.btnDYClick(Sender: TObject);
begin
  inherited;
  PopupMenu1.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TfrmVMIchukushen_Mod564.btnQryClick(Sender: TObject);
begin
  FMainWhereID:=2;
  if cdsMainWhereInit.IsEmpty then
  begin
    cdsMainWhereInit.Append;
    cdsMainWhereInit.FieldByName('FieldName').AsString := 'data0724.create_date';
    cdsMainWhereInit.FieldByName('Oper').AsString := '区间';
    cdsMainWhereInit.FieldByName('FieldValue').AsString := FormatDateTime('YYYY-MM-DD',gFunc.GetSvrDateTime-3) +
                                  ' AND ' + FormatDateTime('YYYY-MM-DD',gFunc.GetSvrDateTime+1);
    cdsMainWhereInit.FieldByName('SeqNo').AsString := '0';
    cdsMainWhereInit.Post;
  end;
  inherited;
end;

procedure TfrmVMIchukushen_Mod564.cdsMainAfterScroll(DataSet: TDataSet);
var
  lsql:string;
begin
  inherited;
  lsql:='select data0149.rkey,data0149.quantity,data0149.rtn_quantity,data0149.tax_price,data0149.tax_2,data0134.quantity as quantity134,'
       +'  data0149.d0134_ptr,data0017.inv_part_number,data0017.inv_name,data0017.INV_DESCRIPTION,data0134.quan_on_hand'
       +'   from data0149 inner join'
       +'   data0017 on data0149.inventory_ptr=data0017.rkey inner join'
       +'   data0134 on data0149.d0134_ptr=data0134.rkey'
       +'   where data0149.gon_ptr='+Dataset.FieldByName('RKEY').AsString;
  gSvrintf.IntfGetDataBySql(lsql,cdsDetail)
end;

procedure TfrmVMIchukushen_Mod564.ehMainDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  inherited;
 if cdsMain.FieldByName('status').value=0 then
  ehMain.Canvas.Font.Color := clRed
 else
  if cdsMain.FieldByName('status').value=1 then
   ehMain.Canvas.Font.Color := cllime;
  ehMain.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmVMIchukushen_Mod564.getdata;
begin
  FMainFrmSql := cdsMain.CommandText;

  if FMainWhere.Trim = '' then
    FMainWhere := ' and data0724.create_date BETWEEN ' + QuotedStr(FormatDateTime('YYYY-MM-DD',gFunc.GetSvrDateTime-3)) + ' AND ' + QuotedStr(FormatDateTime('YYYY-MM-DD',gFunc.GetSvrDateTime+1));

  FWhere2 := '';

  FOrderby := ' order by data0724.rkey desc ';
  inherited;
end;


procedure TfrmVMIchukushen_Mod564.N1Click(Sender: TObject);
var
  LSq724: string;
begin
  inherited;
  if not gFunc.CheckUserAuth(10,564) then Exit;
  LSq724 := 'select * from data0724 where rkey = ' + cdsMain.FieldByName('rkey').AsString;
  gSvrIntf.IntfGetDataBySql(LSq724,cds724);
  if not cds724.IsEmpty then
  begin
    cds724.Edit;
    cds724.FieldByName('status').Value:=1;//通过审核
    cds724.Post;
  end;
  gSvrIntf.IntfPostDataByTable('data0724',cds724.delta);
  btnRefreshClick(nil);
end;

procedure TfrmVMIchukushen_Mod564.N2Click(Sender: TObject);
var
  LFrm:TfrmshuReport_Mod564;
  LFileName:string;
begin
  inherited;
  if not gFunc.CheckUserAuth(11,564) then Exit;
  LFrm:=TfrmshuReport_Mod564.Create(Self);
  try
    LFrm.GetData(cdsMain.FieldByName('rkey').AsString);
    LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),
      'ERP_3_TIER\', 'ERP_3_TIER\REPORTS\库存管理_材料进出\', [rfReplaceAll]) +
      '供应商退货出仓报表.fr3';
    LFrm.frxReport1.LoadFromFile(LFileName, true);
    LFrm.frxReport1.ShowReport;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmVMIchukushen_Mod564.N3Click(Sender: TObject);
begin
  inherited;
  if not gFunc.CheckUserAuth(12,564) then Exit;
  frmEditchukushu := TfrmEditchukushu.Create(Self);
  try
    frmEditchukushu.Edit1.Text:=cdsDetail.FieldByName('quantity134').AsString;
    frmEditchukushu.Edit1.Tag:=cdsDetail.FieldByName('Rkey').AsInteger;//149rkey
    frmEditchukushu.Edit2.Text:=cdsDetail.FieldByName('quantity').AsString;
    frmEditchukushu.Edit2.Tag:=cdsDetail.FieldByName('d0134_ptr').AsInteger;//134Rkey
    frmEditchukushu.Edit3.Text:=cdsDetail.FieldByName('rtn_quantity').AsString;
    frmEditchukushu.Label6.Caption:=cdsDetail.FieldByName('rtn_quantity').Value;
    frmEditchukushu.Label6.Tag:=cdsMain.FieldByName('ttype').AsInteger;
    frmEditchukushu.Edit4.Text:=cdsDetail.FieldByName('tax_price').AsString;
    frmEditchukushu.Edit5.Text:=cdsDetail.FieldByName('quan_on_hand').AsString;
    if frmEditchukushu.ShowModal = mrOk then
    begin
      btnRefreshClick(nil);
    end;
  finally
    frmEditchukushu.Free;
  end;
end;

procedure TfrmVMIchukushen_Mod564.N4Click(Sender: TObject);
var
  LFrm:TfrmshuReport_Mod564;
  LFileName:string;
begin
  inherited;
  LFrm:=TfrmshuReport_Mod564.Create(Self);
  try
    LFrm.GetData(cdsMain.FieldByName('rkey').AsString);
    LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),
      'ERP_3_TIER\', 'ERP_3_TIER\REPORTS\库存管理_材料进出\', [rfReplaceAll]) +
      '供应商退货出仓报表.fr3';
    LFrm.frxReport1.LoadFromFile(LFileName, true);
    LFrm.frxReport1.DesignReport;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmVMIchukushen_Mod564.pmMainPopup(Sender: TObject);
begin
  inherited;
  if cdsDetail.IsEmpty then
    n1.enabled:=false //审核
  else
    n1.Enabled:=(cdsMain.FieldByName('status').Value=0) and (cdsMain.FieldByName('ttype').Value=0);
end;

procedure TfrmVMIchukushen_Mod564.PopupMenu2Popup(Sender: TObject);
begin
  inherited;
  if cdsDetail.IsEmpty then
    n3.Enabled:=false //修改数量
  else
    n3.Enabled:=(cdsMain.FieldByName('status').Value=0);
end;

end.
