unit PasPublic;

interface
uses
  System.SysUtils,IdHashMessageDigest,IdGlobal, IdHash, Vcl.Dialogs, uSvrIntf, Datasnap.DBClient,
  Vcl.Forms,System.Generics.Collections,RzTabs,DBGridEh, Winapi.ActiveX, System.Win.ComObj,
  Vcl.StdCtrls, Vcl.Controls,System.ZLib,System.Classes, Data.SqlExpr,System.Variants,Vcl.DBGrids;

    procedure Export_dbGridEH_to_Excel(AEh: TDBGridEh);
    procedure Export_dbGrid_to_Excel(AEh: TDBGrid);
implementation

procedure Export_dbGridEH_to_Excel(AEh: TDBGridEh);
var
  iCount, jCount, v_cloumn: Integer;
  XLApp: Variant;
  Sheet: Variant;
begin
  if not AEh.DataSource.DataSet.Active then exit;
  Screen.Cursor := crHourGlass;
  if not VarIsEmpty(XLApp) then
  begin
    XLApp.DisplayAlerts := False;
    XLApp.Quit;
    VarClear(XLApp);
  end;
  try
    XLApp := CreateOleObject('Excel.Application');
  except
    Screen.Cursor := crDefault;
    Exit;
  end;
  try
  XLApp.WorkBooks.Add;
  XLApp.SheetsInNewWorkbook := 1;

  XLApp.WorkBooks[1].WorkSheets[1].Name := 'sheet1';
  Sheet := XLApp.Workbooks[1].WorkSheets['sheet1'];
  AEh.DataSource.DataSet.DisableControls;
  AEh.DataSource.DataSet.first;

  v_cloumn := 0;
  for iCount := 0 to AEh.Columns.Count - 1 do
    if (AEh.Columns.Items[iCount].Visible = true) and (AEh.Columns.Items[iCount].FieldName <> '') then
      Sheet.Cells[1, iCount + 1 - v_cloumn] :=
        AEh.Columns[iCount].Title.Caption
    else
      inc(v_cloumn);

  jCount := 1;
  while not AEh.DataSource.DataSet.Eof do
  begin
    v_cloumn := 0;
    for iCount := 0 to AEh.Columns.Count - 1 do
      if (AEh.Columns[iCount].Visible = true)and (AEh.Columns.Items[iCount].FieldName <> '') then
        Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] :=
          AEh.Columns[iCount].Field.AsString
      else
        inc(v_cloumn);
    Inc(jCount);
    AEh.DataSource.DataSet.Next;
  end;

  XlApp.Visible := True;
  Screen.Cursor := crDefault;
  AEh.DataSource.DataSet.First;
  AEh.DataSource.DataSet.EnableControls;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure Export_dbGrid_to_Excel(AEh: TDBGrid);
var
  iCount, jCount, v_cloumn: Integer;
  XLApp: Variant;
  Sheet: Variant;
begin
  if not AEh.DataSource.DataSet.Active then exit;
  Screen.Cursor := crHourGlass;
  if not VarIsEmpty(XLApp) then
  begin
    XLApp.DisplayAlerts := False;
    XLApp.Quit;
    VarClear(XLApp);
  end;
  try
    XLApp := CreateOleObject('Excel.Application');
  except
    Screen.Cursor := crDefault;
    Exit;
  end;
  try
  XLApp.WorkBooks.Add;
  XLApp.SheetsInNewWorkbook := 1;

  XLApp.WorkBooks[1].WorkSheets[1].Name := 'sheet1';
  Sheet := XLApp.Workbooks[1].WorkSheets['sheet1'];
  AEh.DataSource.DataSet.DisableControls;
  AEh.DataSource.DataSet.first;

  v_cloumn := 0;
  for iCount := 0 to AEh.Columns.Count - 1 do
    if (AEh.Columns.Items[iCount].Visible = true) and (AEh.Columns.Items[iCount].FieldName <> '') then
      Sheet.Cells[1, iCount + 1 - v_cloumn] :=
        AEh.Columns[iCount].Title.Caption
    else
      inc(v_cloumn);

  jCount := 1;
  while not AEh.DataSource.DataSet.Eof do
  begin
    v_cloumn := 0;
    for iCount := 0 to AEh.Columns.Count - 1 do
      if (AEh.Columns[iCount].Visible = true)and (AEh.Columns.Items[iCount].FieldName <> '') then
        Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] :=
          AEh.Columns[iCount].Field.AsString
      else
        inc(v_cloumn);
    Inc(jCount);
    AEh.DataSource.DataSet.Next;
  end;

  XlApp.Visible := True;
  Screen.Cursor := crDefault;
  AEh.DataSource.DataSet.First;
  AEh.DataSource.DataSet.EnableControls;
  finally
    Screen.Cursor := crDefault;
  end;
end;

end.
