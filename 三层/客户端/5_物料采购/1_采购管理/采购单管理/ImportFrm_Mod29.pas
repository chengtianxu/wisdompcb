unit ImportFrm_Mod29;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Vcl.StdCtrls,
  Vcl.Buttons, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, Data.Win.ADODB,uBaseFrm;

type
  TfrmImport_Mod29 = class(TfrmBase)
    pnl1: TPanel;
    pnl2: TPanel;
    pgc1: TPageControl;
    ts68: TTabSheet;
    ts69: TTabSheet;
    eh69: TDBGridEh;
    pnl3: TPanel;
    pnl4: TPanel;
    eh6869: TDBGridEh;
    eh68: TDBGridEh;
    btnS: TBitBtn;
    btnC: TBitBtn;
    edtFilter: TEdit;
    pnl5: TPanel;
    cbxAll: TCheckBox;
    cds69: TClientDataSet;
    ds69: TDataSource;
    cds68: TClientDataSet;
    ds68: TDataSource;
    cds6869: TClientDataSet;
    ds6869: TDataSource;
    cds204: TClientDataSet;
    cds68204: TClientDataSet;
    ds68204: TDataSource;
    eh68204: TDBGridEh;
    lbFilter: TLabel;
    procedure cds68AfterScroll(DataSet: TDataSet);
    procedure btnSClick(Sender: TObject);
    procedure edtFilterChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure pgc1Change(Sender: TObject);
    procedure eh69TitleClick(Column: TColumnEh);
    procedure eh68TitleClick(Column: TColumnEh);
    procedure cbxAllClick(Sender: TObject);
    procedure eh68DblClick(Sender: TObject);
  private
    { Private declarations }
    preColumn:TColumnEh;
    procedure Changtitle(AEh: TDBGridEh; AColumn: TColumnEh;ACds:TClientDataSet;AType:Integer);
  public
    { Public declarations }
    procedure GetData();
    procedure InitField();
  end;

type
  Rec = record
    Supplier:Integer;
    Currency_ptr:Integer;
    InvType:string;
    Rule:Integer;
    Wh:Integer;

  end;

var
  frmImport_Mod29: TfrmImport_Mod29;

implementation

uses
    uCommFunc;

{$R *.dfm}

{ TfrmImport_Mod29 }

procedure TfrmImport_Mod29.btnSClick(Sender: TObject);
var
  LRec:Rec;
  LFilter:string;
begin
  if pgc1.ActivePageIndex = 1 then
  begin
    LFilter:= cds69.Filter;
    cds69.DisableControls;
    cds69.Filtered:=False;
    cds69.Filter:= 'IsSelected = 1';    //过滤会导致
    cds69.Filtered:=True;
    if cds69.IsEmpty then
    begin
      ShowMessage('请先勾选请购明细！！');
      cds69.Filtered:=False;
      cds69.Filter:= LFilter;
      cds69.Filtered:= True;
      cds69.EnableControls;
      Exit;
    end;
    cds69.First;
    LRec.Supplier:= cds69.FieldByName('SUPP_PTR').AsInteger;
    LRec.Currency_ptr:=cds69.FieldByName('PO_LINK_PTR').AsInteger;
    LRec.InvType:= cds69.FieldByName('FLAG').AsString;
    LRec.Rule:= cds69.FieldByName('o_i_flag').AsInteger;
    LRec.Wh:= cds69.FieldByName('WHSE_PTR').AsInteger;
    cds69.Next;
    while not cds69.Eof do
    begin
      if not ((LRec.Supplier = cds69.FieldByName('SUPP_PTR').AsInteger)
         and (LRec.Currency_ptr =cds69.FieldByName('PO_LINK_PTR').AsInteger)
         and (LRec.InvType = cds69.FieldByName('FLAG').AsString)
         and (LRec.Rule = cds69.FieldByName('o_i_flag').AsInteger)
         and (LRec.Wh = cds69.FieldByName('WHSE_PTR').AsInteger)) then
      begin
        ShowMessage('选择错误！必须同一供应商，同一货币，同一类型，同一格式，同一工厂');
        cds69.Filter:= LFilter;
        Self.changtitle(eh69,eh69.Columns[5],cds69,1);
        cds69.EnableControls;
        Exit;
      end;
      cds69.Next;
    end;
    ModalResult:= mrOk;
    cds69.EnableControls;
  end
  else
  begin
    ModalResult:= mrOk;
  end;
end;

procedure TfrmImport_Mod29.cbxAllClick(Sender: TObject);
var
  LIsSelect:Boolean;
begin
  LIsSelect:= cbxAll.Checked;
  cds69.DisableControls;
  cds69.First;
  while not cds69.Eof do
  begin
    cds69.Edit;
    cds69.FieldByName('IsSelected').Value:= LIsSelect;
    cds69.Post;
    cds69.Next;
  end;
  cds69.First;
  cds69.EnableControls;
end;

procedure TfrmImport_Mod29.cds68AfterScroll(DataSet: TDataSet);
var
  LSql:string;
begin
  if cds68.FieldByName('FLAG').AsString = 'S' then
  begin
    eh6869.BringToFront;
    LSql:= cds6869.CommandText + ' WHERE  data0069.status=0 and purch_req_ptr= '
              + IntToStr(cds68.FieldByName('rkey').AsInteger);
    if not gSvrIntf.IntfGetDataBySql(LSql,cds6869) then  Exit;
  end else
  begin
    eh68204.BringToFront;
    LSql:= cds68204.CommandText + ' WHERE  data0204.status=0 and purchase_req_ptr= '
              + IntToStr(cds68.FieldByName('rkey').AsInteger);
    if not gSvrIntf.IntfGetDataBySql(LSql,cds68204) then  Exit;
  end;
end;

procedure TfrmImport_Mod29.edtFilterChange(Sender: TObject);
begin
  if  preColumn.Field.DataType in [ftString, ftWideString, ftMemo] then
  begin
    if Trim(edtFilter.Text)<>''  then
    begin
      if pgc1.ActivePageIndex=0 then
      begin
        cds68.Filtered:=False;
        cds68.Filter:=preColumn.FieldName + ' like ''%' + Trim(edtFilter.Text)+ '%''';
        cds68.Filtered:=True;
      end
      else
      begin
        cds69.Filtered:=False;
        cds69.Filter:=preColumn.FieldName + ' like ''%' + Trim(edtFilter.Text)+ '%''';
        cds69.Filtered:=True;
      end;
    end
    else
    begin
      if pgc1.ActivePageIndex=0 then
      begin
        cds68.Filter:='';
        cds68.Filtered:= False;
      end
      else
      begin
        cds69.Filter:='';
        cds69.Filtered:= False;
      end;
    end;
  end;
end;

procedure TfrmImport_Mod29.eh68DblClick(Sender: TObject);
begin
  inherited;
  ModalResult:= mrOk;
end;

procedure TfrmImport_Mod29.eh68TitleClick(Column: TColumnEh);
begin
  changtitle(eh68,Column,cds68,0);
end;

procedure TfrmImport_Mod29.eh69TitleClick(Column: TColumnEh);
begin
  Self.changtitle(eh69,Column,cds69,0);
end;

procedure TfrmImport_Mod29.FormActivate(Sender: TObject);
begin
  preColumn:= eh68.Columns[0];
end;

procedure TfrmImport_Mod29.GetData;
var
  LSql68,LSql69:string;
begin
  LSql68:= cds68.CommandText + ' WHERE  (Data0068.STATUS = 2) and ((Data0068.BUYER_PTR = ' + gVar.rkey05 +
        ') or (data0068.buyer_ptr is null)) ORDER BY  Data0068.PO_REQ_NUMBER ';
  LSql69:= cds69.CommandText + ' WHERE     (dbo.Data0069.status = 0) AND (dbo.Data0068.STATUS = 2)  ' + #13+
        '  and ((Data0068.BUYER_PTR = ' + gVar.rkey05 + ' ) or (data0068.buyer_ptr is null)) ' + #13 +
        ' UNION ' + #13+
          cds204.CommandText +  ' WHERE (dbo.Data0068.STATUS = 2) AND (dbo.Data0204.status = 0) ' + #13+
        '  and ((Data0068.BUYER_PTR = ' + gVar.rkey05 + ' ) or (data0068.buyer_ptr is null)) ';
  if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql68,LSql69]),[cds68,cds69]) then Exit;
end;

procedure TfrmImport_Mod29.InitField;
var
  i:Integer;
  LField:TField;
begin
  if not gSvrIntf.IntfGetDataBySql(cds69.CommandText + ' WHERE data0069.rkey = -1',cds69) then Exit;
  cds69.Close;
  cds69.FieldDefs.Update;
  try
    for i := 0 to cds69.FieldDefList.Count-1 do
      cds69.FieldDefList.FieldDefs[i].CreateField(Self);

    LField:= TBooleanField.Create(cds69);
    LField.FieldKind:= fkInternalCalc;
    LField.FieldName:= 'IsSelected';
    LField.DataSet:= cds69;
    LField.Index:= 0;
  finally
    cds69.FieldDefs.EndUpdate;
  end;
end;

procedure TfrmImport_Mod29.pgc1Change(Sender: TObject);
begin
  if pgc1.ActivePageIndex=0 then eh68TitleClick(eh68.Columns[0])
  else eh69TitleClick(eh69.Columns[5]);
  lbFilter.Caption:='请购编号';
end;

procedure TfrmImport_Mod29.Changtitle(AEh: TDBGridEh; AColumn: TColumnEh;ACds:TClientDataSet;AType:Integer);
var
  Lop:TIndexOptions;
begin
  if AType = 0 then
  begin
    if AColumn.Title.SortMarker =smDownEh then
    begin
     AColumn.Title.SortMarker:=smUpEh;
     lop:=[ixDescending];
    end
    else
    begin
     AColumn.Title.SortMarker:=smDownEh;
     LOP := [];
    end;
  end
  else lop:=[];
  ACds.IndexDefs.Update;
  try
    if ACds.IndexDefs.IndexOf('index1') >= 0 then
    ACds.DeleteIndex('index1');
    ACds.AddIndex('index1', AColumn.FieldName, LOP, '');
    ACds.IndexName := 'index1';

    if (AColumn.Title.Caption<>preColumn.Title.Caption)
            and (AColumn.Field.DataType in [ftString,ftWideString]) then
    begin
      lbFilter.Caption:=AColumn.Title.Caption;
      AColumn.Title.Color:=clRed;
      preColumn.Title.Color:=clBtnFace;
      edtFilter.SetFocus;
      preColumn:=AColumn;
    end;
  finally
    ACds.IndexDefs.EndUpdate;
  end;
end;

end.
