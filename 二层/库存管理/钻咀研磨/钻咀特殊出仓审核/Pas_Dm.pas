unit Pas_Dm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids;

type
  TDm = class(TForm)
    ADOConn: TADOConnection;
    dsado220: TADODataSet;
  private
    { Private declarations }
  public
    { Public declarations }
      //把ADOQuery的数据显示在StringGrid上.
    procedure ShowADOQueryDataOnStringGrid(ADOQuery: TADOQuery; SG: TStringGrid);
    //设置stringGrid
    procedure SetHeightAndWidthOnStringGrid(sg:TStringGrid;Height:integer=30;width:Integer=80);
    procedure ClearStringGrid(SG:TStringGrid);
  end;

var
  Dm: TDm;

implementation

{$R *.dfm}

{ TDm }

procedure TDm.ClearStringGrid(SG: TStringGrid);
begin
  SG.ColCount:=2;
  SG.RowCount:=2;
  SG.Rows[1].Clear;
end;

procedure TDm.SetHeightAndWidthOnStringGrid(sg: TStringGrid; Height,
  width: Integer);
var i,j:Integer;
begin
  for i := 0 to SG.RowCount-1 do
  begin
    sg.RowHeights[i]:=Height;
  end;
  for j:=0 to SG.ColCount-1 do
  begin
    sg.ColWidths[j]:=width;
  end;

end;

procedure TDm.ShowADOQueryDataOnStringGrid(ADOQuery: TADOQuery;SG: TStringGrid);
var //把ADOQuery的数据显示在StringGrid上.
  iCount, iCell, iRecordCount, iFieldCount: Integer;
begin
  SG.RowCount := 1;
  for iCount := 1 to SG.ColCount - 1 do
    SG.Cells[iCount, 1] := '';
  SG.Update;
  iRecordCount := ADOQuery.RecordCount;
  iFieldCount := ADOQuery.FieldCount;
  SG.RowCount := iRecordCount + 1;
  SG.ColCount := iFieldCount + 1;
  if iRecordCount = 0 then
  begin
    SG.RowCount := 2; SG.FixedRows := 1;
  end
  else
    SG.FixedRows := 1;
  if iFieldCount = 0 then
  begin
    SG.ColCount := 2; SG.FixedCols := 1;
  end
  else
    SG.FixedCols := 1;
  for iCount := 1 to iFieldCount do //显示字段名
//         SG.Cells[iCount,0]:=GetFieldDisplayName(ADOQuery.Fields[iCount-1].DisplayName,'');
    SG.Cells[0, 0] := '序号'; //显示序号名称
  for iCount := 1 to iRecordCount do //显示记录序号
    SG.Cells[0, iCount] := IntToStr(iCount);
  if iRecordCount > 0 then //显示库表数据
  begin
    ADOQuery.First;
    for iCount := 1 to iRecordCount do
    begin
      for iCell := 1 to iFieldCount do
        SG.Cells[iCell, iCount] := Trim(ADOQuery.Fields[iCell - 1].AsString);
      ADOQuery.Next;
    end;
  end;
  SG.Update;
end;

end.
