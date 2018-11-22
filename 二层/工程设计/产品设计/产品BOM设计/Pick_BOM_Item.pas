unit Pick_BOM_Item;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, ComCtrls, Dm, DB, ADODB, StdCtrls;

type
  TfrmPickBomItem1 = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    tv1: TTreeView;
    dbgrdh1: TDBGridEh;
    qry1: TADOQuery;
    ds1: TDataSource;
    edt1: TEdit;
    lbl1: TLabel;
    pnl4: TPanel;
    btn1: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tv1Change(Sender: TObject; Node: TTreeNode);
    procedure dbgrdh1TitleClick(Column: TColumnEh);
    procedure edt1Change(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure dbgrdh1DblClick(Sender: TObject);
  private
    { Private declarations }
    FLS: TStringList;
    field_name:string;
    PreColumn: TColumnEh;
    procedure LoadTree;
    procedure ShowAll;
    procedure ShowD17WithD19(ARkey19: Integer);
    procedure ShowD17WithD496(ARkey496:Integer);
    function SQLOpen(AQry: TADOQuery; ALS: TStringList): Boolean;
  public
    { Public declarations }
  end;

//      edtPartNo.Text := frmPick_Item_Single.adsPick.Fieldbyname('inv_part_number').AsString;
//      edtPartNo.Tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
//      labelUnit.Caption := frmPick_Item_Single.adsPick.Fieldbyname('Unit_Code').AsString;
//      labelPartName.Caption := frmPick_Item_Single.adsPick.Fieldbyname('Inv_Part_Description').AsString;
//      edtQty.SetFocus;
  function ShowPIckBomItem(AOwner: TComponent;out outinv_part_number: string;
                          out outRkey: Integer; out outUnit_Code, outInv_Part_Description: string): Integer;
implementation

{$R *.dfm}


function ShowPIckBomItem(AOwner: TComponent;out outinv_part_number: string;
                        out outRkey: Integer; out outUnit_Code, outInv_Part_Description: string): Integer;
var
  frm: TfrmPickBomItem1;
begin
  frm := TfrmPickBomItem1.Create(AOwner);
  try
    if (frm.ShowModal = mrok) and (not frm.qry1.isEmpty) then
      Result := mrOk else Result := mrCancel;
    if Result = mrOK then
    begin
      outinv_part_number := frm.qry1.FieldByName('inv_part_number').AsString;
      outRkey := frm.qry1.FieldByName('rkey').AsInteger;
      outUnit_Code := frm.qry1.FieldByName('Unit_Code').AsString;
      outInv_Part_Description := frm.qry1.FieldByName('Inv_Part_Description').AsString;
    end;
  finally
    FreeAndNil(frm);
  end;
end;

procedure TfrmPickBomItem1.FormShow(Sender: TObject);
begin
  LoadTree;
  ShowAll;
end;

procedure TfrmPickBomItem1.FormCreate(Sender: TObject);
begin
  FLS := TStringList.Create;
  field_name := dbgrdh1.Columns[0].FieldName;
  PreColumn := dbgrdh1.Columns[0];
end;

procedure TfrmPickBomItem1.FormDestroy(Sender: TObject);
begin
  FLS.Free;
end;

procedure TfrmPickBomItem1.ShowAll;
begin
  FLS.Clear;
  FLS.Add(' SELECT Data0017.*, data0002.unit_code FROM Data0017,Data0002 WHERE');
  FLS.Add(' data0017.stock_unit_ptr=data0002.rkey');  
  SQLOpen(qry1,FLS);
end;

procedure TfrmPickBomItem1.LoadTree;
  function LoadTop1: Boolean;
  var
    LNOde: TTreeNode;
    LChildNode: TTreeNode;
  begin
    FLS.Clear;
    FLS.Add(' SELECT inv_group_desc, Rkey FROM Data0019 ');
    Result := SQLOpen(qry1,FLS);
    if Result then
    begin
      qry1.First;
      Lnode := tv1.Items[0];
      while not qry1.Eof do
      begin
        LChildNode := tv1.Items.AddChild(LNOde,qry1.FieldByName('inv_group_desc').AsString);
        LChildNode.Data := Pointer(qry1.FieldByName('rkey').AsInteger);
        qry1.Next;
      end;
    end;
  end;
  function LoadTOp2: Boolean;
  var
    LNode: TTreeNode;
    LChildNode: TTreeNode;
    i: Integer;
  begin
    for I := 0 to tv1.Items[0].Count - 1 do
    begin
      LNode := tv1.Items[0].Item[I];
      FLS.Clear;
      FLS.Add(' SELECT GROUP_DESC, Rkey FROM Data0496 WHERE GROUP_PTR = ');
      FLS.Add(IntToStr(Integer(LNode.Data)));
      Result := SQLOpen(qry1,FLS);
      if Result then
      begin
        qry1.First;
        while not qry1.Eof do
        begin
          LChildNode := tv1.Items.AddChild(LNOde,qry1.FieldByName('GROUP_DESC').AsString);
          LChildNode.Data := Pointer(qry1.FieldByName('Rkey').AsInteger);
          qry1.Next;
        end;
      end;
    end;
  end;
begin
  if not LoadTop1 then exit;
  if not LoadTOp2 then Exit;
end;


function TfrmPickBomItem1.SQLOpen(AQry: TADOQuery;
  ALS: TStringList): Boolean;
begin
  Result := dmcon.SQLOpen(AQry,ALS);
  if not Result then ShowMessage('¶ÁÈ¡²ÄÁÏ³ö´í!');
end;

procedure TfrmPickBomItem1.tv1Change(Sender: TObject; Node: TTreeNode);
begin
  if Node = tv1.Items[0] then
    ShowAll
  else
  if Node.Parent = tv1.Items[0] then
    ShowD17WithD19(Integer(Node.Data))
  else
  if Node.Parent.Parent = tv1.Items[0] then
    ShowD17WithD496(Integer(Node.Data));
end;

procedure TfrmPickBomItem1.ShowD17WithD19(ARkey19: Integer);
begin
  FLS.Clear;
  FLS.Add(' SELECT Data0017.*, data0002.unit_code FROM Data0017 ');
  FLS.Add(' LEFT JOIN Data0496 ON Data0496.Rkey = Data0017.GROUP_PTR ');
  FLS.Add(' LEFT JOIN Data0019 ON Data0496.GROUP_PTR = Data0019.RKey ');
  FLS.Add(' INNER JOIN Data0002 ON Data0002.RKey = Data0017.stock_unit_ptr ');
  FLS.Add(' WHERE Data0019.RKey = ' + IntToStr(ARkey19));
  SQLOpen(qry1,FLS);
end;

procedure TfrmPickBomItem1.ShowD17WithD496(ARkey496: Integer);
begin
  FLS.Clear;
  FLS.Add(' SELECT Data0017.*, data0002.unit_code FROM Data0017 ');
  FLS.Add(' LEFT JOIN Data0496 ON Data0496.RKey = Data0017.GROUP_PTR ');
  FLS.Add(' INNER JOIN Data0002 ON Data0002.RKey = Data0017.stock_unit_ptr ');  
  FLS.Add(' WHERE Data0496.RKey = ' + IntToStr(ARkey496));
  SQLOpen(qry1,FLS);
end;

procedure TfrmPickBomItem1.dbgrdh1TitleClick(Column: TColumnEh);
begin
  if dbgrdh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    qry1.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    qry1.Sort:=Column.FieldName+' DESC';
  end;
  if dbgrdh1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    lbl1.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edt1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    edt1Change(edt1);
  end else
    edt1.SetFocus;
end;

procedure TfrmPickBomItem1.edt1Change(Sender: TObject);
begin
  if dbgrdh1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if dbgrdh1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(edt1.text) <> '' then
    begin
      if dbgrdh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        dbgrdh1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edt1.text) + '%'')'
      else if dbgrdh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        dbgrdh1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edt1.text,0))+')';
    end else
      dbgrdh1.DataSource.DataSet.Filter:='';
  end;
end;

procedure TfrmPickBomItem1.btn1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmPickBomItem1.dbgrdh1DblClick(Sender: TObject);
begin
  if not qry1.IsEmpty then ModalResult := mrOk;
end;

end.
