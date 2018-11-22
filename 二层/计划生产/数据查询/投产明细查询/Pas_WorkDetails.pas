unit Pas_WorkDetails;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, DB, ADODB,MainUNIT1,
  Menus,OleServer, Excel2000, ComObj;

type
  TFrm_WorkDetails = class(TForm)
    DataSource1: TDataSource;
    PanelTOP: TPanel;
    PanelClient: TPanel;
    DBGridEh1: TDBGridEh;
    BitBtn1: TBitBtn;
    labCutNo: TLabel;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    PopupMenu1: TPopupMenu;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure item_click(sender:TObject);
  public
    { Public declarations }
    procedure Export_dbGridEH_to_Excel(dbGrid: TDBGridEh; title_caption: string);
  end;

var
  Frm_WorkDetails: TFrm_WorkDetails;

implementation
uses DmUnit1,common;
{$R *.dfm}

procedure TFrm_WorkDetails.Export_dbGridEH_to_Excel(dbGrid: TDBGridEh; title_caption: string); 
var
  iCount, jCount, v_cloumn: Integer;
  XLApp: Variant;
  Sheet: Variant;
begin
  if not dbgrid.DataSource.DataSet.Active then exit;
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
  XLApp.WorkBooks.Add;
  XLApp.SheetsInNewWorkbook := 1;

  XLApp.WorkBooks[1].WorkSheets[1].Name := title_caption;
  Sheet := XLApp.Workbooks[1].WorkSheets[title_caption];
  dbgrid.DataSource.DataSet.DisableControls;
  dbgrid.DataSource.DataSet.first;

  v_cloumn := 0;
  for iCount := 0 to dbgrid.Columns.Count - 1 do
    if dbgrid.Columns.Items[iCount].Visible = true then
      Sheet.Cells[1, iCount + 1 - v_cloumn] :=
        dbgrid.Columns[iCount].Title.Caption
    else
      inc(v_cloumn);

  jCount := 1;
  while not dbgrid.DataSource.DataSet.Eof do
  begin
    v_cloumn := 0;
    for iCount := 0 to dbgrid.Columns.Count - 1 do
      if dbgrid.Columns[iCount].Visible = true then
       begin
        if dbgrid.Columns[iCount].Field.DataType in [ftString,ftWideString] then
          Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn].NumberFormatLocal:='@';       
        Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] :=
          dbgrid.Columns[iCount].Field.AsString;
       end
      else
        inc(v_cloumn);
    Inc(jCount);
    dbgrid.DataSource.DataSet.Next;
  end;

  XlApp.Visible := True;
  Screen.Cursor := crDefault;
  dbgrid.DataSource.DataSet.First;
  dbgrid.DataSource.DataSet.EnableControls;
end;

procedure TFrm_WorkDetails.item_click(sender: TObject);
var
  i:byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
      begin
          for i := 0 to DBGrideh1.FieldCount-1 do
              if DBGrideh1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
                  begin
                      DBGrideh1.Columns[i].Visible:=true;
                      break;
                  end;
      end
  else
      begin
          for i := 0 to DBGrideh1.FieldCount-1 do
              if DBGrideh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
                  begin
                      DBGrideh1.Columns[i].Visible := false;
                      break;
                  end;
      end;
end;

procedure TFrm_WorkDetails.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrm_WorkDetails.FormShow(Sender: TObject);
var
  i:integer;
  item:TMenuItem;
begin
  for i:=1 to DBGrideh1.Columns.Count do
  begin
    item := TmenuItem.Create(self) ;
    item.Caption := dbgrideh1.Columns[i-1].Title.Caption ;
    if dbgrideh1.Columns[i-1].Visible then
        item.Checked := true ;
    item.OnClick := item_click ;
    self.PopupMenu1.Items.Add(item) ;
  end;
  labCutNo.Caption:=strLab;
  dm.AdoWDetails.Close;
  dm.AdoWDetails.Parameters.ParamByName('CUT_NO').Value:=copy(labCutNo.Caption,1,10);
  dm.AdoWDetails.Prepared;
  dm.AdoWDetails.Open;
end;

procedure TFrm_WorkDetails.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if not (gdFixed in State) then
   if DBGridEh1.DataSource.DataSet.Active then
    begin
     if  DBGridEh1.DataSource.DataSet.RecNo  mod 2=0 then
     begin
      DBGridEh1.Canvas.Brush.Color:=clinfobk;
      DBGridEh1.Canvas.FillRect(rect);
      DBGridEh1.Canvas.font.color:=clblack;
     end
     else
     begin
      DBGridEh1.Canvas.Brush.Color:=clwhite;
      DBGridEh1.Canvas.FillRect(rect);
      DBGridEh1.Canvas.font.color:=clblack;
     end;

     if ((State = [gdSelected]) or (State=[gdSelected,gdFocused])) then
      begin
       DBGridEh1.Canvas.Brush.Color:=RGB(0,224,224);
       DBGridEh1.Canvas.FillRect(rect);
       DBGridEh1.Canvas.font.color:=clblack;
      end;

     if dm.ADOQuery1qty_reject.Value > (dm.ADOQuery1ISSUED_QTY.Value-
                                       dm.ADOQuery1ORD_REQ_QTY.Value)*0.5 then
      DBGridEh1.Canvas.Font.Color := clred;

    DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFrm_WorkDetails.BitBtn2Click(Sender: TObject);
begin
  IF DBGrideh1.DataSource.DataSet.Active THEN
      IF DBGrideh1.DataSource.DataSet.RecordCount > 0 THEN
      Export_dbGrideh_to_Excel(DBGrideh1,'查看作业单明细') ;
end;

procedure TFrm_WorkDetails.BitBtn5Click(Sender: TObject);
begin
  popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TFrm_WorkDetails.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key) = 'V') and (ssalt in shift) then
      showmessage((DBGridEh1.DataSource.DataSet as TADOQuery).SQL.Text);
end;

end.
