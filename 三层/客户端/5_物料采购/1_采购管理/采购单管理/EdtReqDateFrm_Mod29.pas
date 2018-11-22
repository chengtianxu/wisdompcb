unit EdtReqDateFrm_Mod29;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh, Data.DB, Datasnap.DBClient, Vcl.Menus,uBaseFrm;

type
  TAfterUpdate_Mod29 = procedure (ACds:TClientDataSet) of object;

  TfrmEdtReqDate_Mod29 = class(TfrmBase)
    pnl1: TPanel;
    pnl2: TPanel;
    btnSave: TBitBtn;
    btnClose: TBitBtn;
    eh71: TDBGridEh;
    eh72: TDBGridEh;
    cds71: TClientDataSet;
    ds71: TDataSource;
    cdsLookUp17: TClientDataSet;
    pm1: TPopupMenu;
    cds72: TClientDataSet;
    ds72: TDataSource;
    mniDate: TMenuItem;
    cds339: TClientDataSet;
    procedure cds71CalcFields(DataSet: TDataSet);
    procedure cds72CalcFields(DataSet: TDataSet);
    procedure mniDateClick(Sender: TObject);
    procedure pm1Popup(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
    InvtType,Rkey70:string;
    procedure Append339(APoPtr,AUserPtr,AType:Integer;ADesc,AFrom,ATo,A71Ptr,A72Ptr:Variant);
  public
    { Public declarations }
    FAfterUpdate:TAfterUpdate_Mod29;
    procedure GetData(ARkey,AType:string);
    procedure InitField71();
    procedure InitField72();
  end;

var
  frmEdtReqDate_Mod29: TfrmEdtReqDate_Mod29;

implementation

uses uCommFunc,System.StrUtils, DateFrm_Mod29;

{$R *.dfm}

{ TfrmEdtReqDate_Mod29 }

procedure TfrmEdtReqDate_Mod29.Append339(APoPtr, AUserPtr, AType: Integer;
  ADesc, AFrom, ATo, A71Ptr, A72Ptr: Variant);
begin
  if not cds339.Locate('data0071_ptr',A71Ptr,[]) or cds339.Locate('data0072_ptr',A72Ptr,[]) then cds339.Append
  else cds339.Edit;
  cds339.FieldByName('po_ptr').Value:= APoPtr;
  cds339.FieldByName('EDITED_BY_PTR').Value:= AUserPtr;
  cds339.FieldByName('tran_type').Value:= AType;
  cds339.FieldByName('TRAN_DESCRIPTION').Value:= ADesc;
  cds339.FieldByName('tran_from').Value:= AFrom;
  cds339.FieldByName('tran_to').Value:= ATo;
  cds339.FieldByName('data0071_ptr').AsVariant:= A71Ptr;
  cds339.FieldByName('data0072_ptr').AsVariant:= A72Ptr;
  cds339.Post;
end;

procedure TfrmEdtReqDate_Mod29.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmEdtReqDate_Mod29.btnSaveClick(Sender: TObject);
var
  LData:OleVariant;
begin
  LData:= VarArrayCreate([0,1],varVariant);
  if InvtType = 'S' then
  begin
    if cds71.ChangeCount > 0 then
    begin
      LData[0]:= cds71.Delta;
      LData[1]:= cds339.Delta;
      if gSvrIntf.IntfPostDataBySqlArr(VarArrayOf(['Data0071','Data0339']),LData) then
      begin
        cds71.MergeChangeLog;
        cds339.MergeChangeLog;
        ShowMessage('更改交货日期成功！');
        if Assigned(FAfterUpdate)  then FAfterUpdate(nil);
      end
      else
      begin
        ShowMessage('更改失败！');
        Exit;
      end;
    end;
  end
  else
  begin
    if cds72.ChangeCount > 0 then
    begin
      LData[0]:= cds72.Delta;
      LData[1]:= cds339.Delta;
      if gSvrIntf.IntfPostDataBySqlArr(VarArrayOf(['Data0072','Data0339']),LData) then
      begin
        cds72.MergeChangeLog;
        cds339.MergeChangeLog;
        ShowMessage('更改交货日期成功！');
        if Assigned(FAfterUpdate)  then FAfterUpdate(nil);
      end
      else
      begin
        ShowMessage('更改失败！');
        Exit;
      end;
    end;
  end;
  Close;
end;

procedure TfrmEdtReqDate_Mod29.cds71CalcFields(DataSet: TDataSet);
begin
  inherited;
  if cds71.FieldByName('tax_price').IsNull or cds71.FieldByName('QUAN_ORD').IsNull
      or cds71.FieldByName('PRICE').IsNull  then  Exit;

  cds71.FieldByName('Price_Total_C').Value:= StrToFloat(FormatFloat('0.00',
    StrToFloat(Ifthen(cds71.FieldByName('tax_price').IsNull,'0',cds71.FieldByName('tax_price').AsString)) *
      StrToFloat(Ifthen(cds71.FieldByName('QUAN_ORD').IsNull,'0',cds71.FieldByName('QUAN_ORD').AsString))));    //含税总价

  cds71.FieldByName('TAX_C').Value:= StrToFloat(FormatFloat('0.00',cds71.FieldByName('Price_Total_C').Value -
        StrToFloat(Ifthen(cds71.FieldByName('PRICE').IsNull,'0',cds71.FieldByName('PRICE').AsString)) *
      StrToFloat(Ifthen(cds71.FieldByName('QUAN_ORD').IsNull,'0',cds71.FieldByName('QUAN_ORD').AsString))));
end;

procedure TfrmEdtReqDate_Mod29.cds72CalcFields(DataSet: TDataSet);
begin
  inherited;
  if cds72.FieldByName('tax_price').IsNull or cds72.FieldByName('QUAN_ORD').IsNull
      or cds72.FieldByName('UNIT_PRICE').IsNull  then  Exit;

  cds72.FieldByName('Price_Total_C').Value:= StrToFloat(FormatFloat('0.00',
    StrToFloat(Ifthen(cds72.FieldByName('tax_price').IsNull,'0',cds72.FieldByName('tax_price').AsString)) *
      StrToFloat(Ifthen(cds72.FieldByName('QUAN_ORD').IsNull,'0',cds72.FieldByName('QUAN_ORD').AsString))));    //含税总价

  cds72.FieldByName('TAX_C').Value:= StrToFloat(FormatFloat('0.00',cds72.FieldByName('Price_Total_C').Value -
        StrToFloat(Ifthen(cds72.FieldByName('UNIT_PRICE').IsNull,'0',cds72.FieldByName('UNIT_PRICE').AsString)) *
      StrToFloat(Ifthen(cds72.FieldByName('QUAN_ORD').IsNull,'0',cds72.FieldByName('QUAN_ORD').AsString))));
end;

procedure TfrmEdtReqDate_Mod29.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= caFree;
  frmEdtReqDate_Mod29:=nil;
end;

procedure TfrmEdtReqDate_Mod29.GetData(ARkey, AType: string);
var
  LSql,LSql17,LSql339:string;
begin
  Self.InvtType:= AType;
  Self.Rkey70:= ARkey;
  if AType = 'S' then
  begin
    LSql17:=' SELECT DATA0017.rkey,DATA0017.INV_PART_NUMBER,DATA0017.INV_NAME,DATA0017.INV_PART_DESCRIPTION  '+ #13+
            '  FROM DATA0017 INNER JOIN    '+ #13+
            '        DATA0071 ON DATA0071.INVT_PTR = DATA0017.RKEY     '+ #13+
            '  WHERE DATA0071.PO_PTR = ' + ARkey;
    LSql:= ' SELECT * FROM DATA0071 WHERE PO_PTR = ' + ARkey;
    LSql339:= ' SELECT * FROM DATA0339 WHERE 1=0 ';
    if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql17,LSql,LSql339]),[cdsLookUp17,cds71,cds339]) then Exit;
  end
  else
  begin
    LSql:= ' SELECT * FROM DATA0072 WHERE POPTR = ' + ARkey;
    LSql339:= ' SELECT * FROM DATA0339 WHERE 1=0 ';
    if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql,LSql339]),[cds72,cds339]) then Exit;
  end;
end;

procedure TfrmEdtReqDate_Mod29.InitField71;
var
  i:Integer;
  LField:TField;
begin
  if not gSvrIntf.IntfGetDataBySql('SELECT * FROM DATA0071 WHERE 1=0',cds71) then Exit;
  cds71.Close;
  cds71.FieldDefs.Update;
  try
    for i := 0 to cds71.FieldDefList.Count-1 do
      cds71.FieldDefList.FieldDefs[i].CreateField(Self);

    LField:= TStringField.Create(cds71);
    LField.FieldKind:= fkLookup;
    LField.FieldName:= 'INV_PART_NUMBER';
    LField.KeyFields:= 'INVT_PTR';
    LField.LookupDataSet:= cdsLookUp17;
    LField.LookupKeyFields:= 'rkey';
    LField.LookupResultField:= 'INV_PART_NUMBER';
    LField.DataSet:= cds71;

    LField:= TStringField.Create(cds71);
    LField.FieldKind:= fkLookup;
    LField.FieldName:= 'INV_Name';
    LField.KeyFields:= 'INVT_PTR';
    LField.LookupDataSet:= cdsLookUp17;
    LField.LookupKeyFields:= 'rkey';
    LField.LookupResultField:= 'INV_Name';
    LField.DataSet:= cds71;

    LField:= TStringField.Create(cds71);
    LField.FieldKind:= fkLookup;
    LField.FieldName:= 'INV_PART_DESCRIPTION';
    LField.KeyFields:= 'INVT_PTR';
    LField.LookupDataSet:= cdsLookUp17;
    LField.LookupKeyFields:= 'rkey';
    LField.LookupResultField:= 'INV_PART_DESCRIPTION';
    LField.DataSet:= cds71;

    LField:= TStringField.Create(cds71);
    LField.FieldKind:= fkCalculated;
    LField.FieldName:= 'Price_Total_C';
    LField.DataSet:= cds71;

    LField:= TStringField.Create(cds71);
    LField.FieldKind:= fkCalculated;
    LField.FieldName:= 'TAX_C';
    LField.DataSet:= cds71;

  finally
    cds71.FieldDefs.EndUpdate;
  end;
end;

procedure TfrmEdtReqDate_Mod29.InitField72;
var
  i:Integer;
  LField:TField;
begin
  if not gSvrIntf.IntfGetDataBySql('SELECT * FROM DATA0072 WHERE 1=0',cds72) then Exit;
  cds72.Close;
  cds72.FieldDefs.Update;
  try
    for i := 0 to cds72.FieldDefList.Count-1 do
      cds72.FieldDefList.FieldDefs[i].CreateField(Self);

    LField:= TStringField.Create(cds72);
    LField.FieldKind:= fkCalculated;
    LField.FieldName:= 'Price_Total_C';
    LField.DataSet:= cds72;

    LField:= TStringField.Create(cds72);
    LField.FieldKind:= fkCalculated;
    LField.FieldName:= 'TAX_C';
    LField.DataSet:= cds72;

  finally
    cds72.FieldDefs.EndUpdate;
  end;
end;

procedure TfrmEdtReqDate_Mod29.mniDateClick(Sender: TObject);
var
  LFrm:TfrmDate_Mod29;
begin
  LFrm:= TfrmDate_Mod29.Create(Self);
  try
    if InvtType = 'S' then
    begin
      LFrm.edtDate.Text:= cds71.FieldByName('REQ_DATE').AsString;
      if LFrm.ShowModal = mrOk then
      begin
        Append339(StrToInt(Rkey70),StrToInt(gVar.rkey05),1
          ,'采购项目要求到货日期已改',cds71.FieldByName('REQ_DATE').AsString
          ,gFunc.StrToDateTime(Trim(LFrm.edtDate.Text)),cds71.FieldByName('rkey').AsString,null);
        cds71.Edit;
        cds71.FieldByName('REQ_DATE').Value:= gFunc.StrToDateTime(Trim(LFrm.edtDate.Text));
        cds71.Post;
      end;
    end
    else
    begin
      LFrm.edtDate.Text:= cds72.FieldByName('DEL_DATE').AsString;
      if LFrm.ShowModal = mrOk then
      begin
        Append339(StrToInt(Rkey70),StrToInt(gVar.rkey05),1
          ,'杂项采购条目要求到货日期已改',cds72.FieldByName('DEL_DATE').AsString
          ,gFunc.StrToDateTime(Trim(LFrm.edtDate.Text)),null,cds72.FieldByName('rkey').AsString);
        cds72.Edit;
        cds72.FieldByName('DEL_DATE').Value:= gFunc.StrToDateTime(Trim(LFrm.edtDate.Text));
        cds72.Post;
      end;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmEdtReqDate_Mod29.pm1Popup(Sender: TObject);
begin
  if InvtType = 'S' then  mniDate.Enabled:= not cds71.IsEmpty
  else mniDate.Enabled:= not cds72.IsEmpty;
end;

end.
