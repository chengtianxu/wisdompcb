unit lining_cost;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, DB, ADODB, ExtCtrls, StdCtrls, Buttons,
  Excel2000,ClipBrd,ComObj;

type
  TForm_lining = class(TForm)
    AD489: TADODataSet;
    DataSource1: TDataSource;
    DBGridEh1: TDBGridEh;
    AD489MANU_PART_NUMBER: TStringField;
    AD489MANU_PART_DESC: TStringField;
    AD489WORK_ORDER_NUMBER: TStringField;
    AD489putout_qty: TIntegerField;
    AD489matl_pcs: TFloatField;
    AD489ovhd_pcs: TFloatField;
    AD489DEPT_CODE: TStringField;
    AD489DEPT_NAME: TStringField;
    AD489STEP: TIntegerField;
    AD489total_matl: TFloatField;
    AD489total_ovhd: TFloatField;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    AD489bring_matl_pcs: TFloatField;
    AD489bring_ovhd_pcs: TFloatField;
    AD489ovhd1_pcs: TFloatField;
    AD489outsource_pcs: TFloatField;
    AD489bring_ovhd1_pcs: TFloatField;
    AD489bring_outsource_pcs: TFloatField;
    AD489total_ovhd1: TFloatField;
    AD489total_boutsource: TFloatField;
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    procedure CopyDbDataToExcel(Args:array of const;title_caption:string);
  public
    { Public declarations }
  end;

var
  Form_lining: TForm_lining;

implementation

USES
  damo;
{$R *.dfm}

procedure TForm_lining.CopyDbDataToExcel(Args:array of const;title_caption:string);
var
 iCount, jCount, v_cloumn: Integer;
 XLApp: Variant;
 Sheet: Variant;
 I: Integer;
begin
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
 XLApp.SheetsInNewWorkbook := High(Args) + 1;

 for I := Low(Args) to High(Args) do
 begin
   XLApp.WorkBooks[1].WorkSheets[I+1].Name := title_caption;
   Sheet := XLApp.Workbooks[1].WorkSheets[title_caption];
   if not TDBGrideh(Args[I].VObject).DataSource.DataSet.Active then
    begin
     Screen.Cursor := crDefault;
     Exit;
    end;
   TDBGrideh(Args[I].VObject).DataSource.DataSet.DisableControls;
   TDBGrideh(Args[I].VObject).DataSource.DataSet.first;

   v_cloumn:=0;
   for iCount := 0 to TDBGrideh(Args[I].VObject).Columns.Count - 1 do
    if TDBGrideh(Args[I].VObject).Columns.Items[iCount].Visible=true then
     Sheet.Cells[1, iCount + 1 - v_cloumn] :=
     TDBGrideh(Args[I].VObject).Columns.Items[iCount].Title.Caption
    else
     inc(v_cloumn);

   jCount := 1;
   while not TDBGrideh(Args[I].VObject).DataSource.DataSet.Eof do
   begin
     v_cloumn:=0;
     for iCount := 0 to TDBGrideh(Args[I].VObject).Columns.Count - 1 do
      if TDBGrideh(Args[I].VObject).Columns.Items[iCount].Visible=true then
       Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] :=
       TDBGrideh(Args[I].VObject).Columns.Items[iCount].Field.AsString
      else
       inc(v_cloumn);
     Inc(jCount);
     TDBGrideh(Args[I].VObject).DataSource.DataSet.Next;
   end;

   XlApp.Visible := True;
   TDBGrideh(Args[I].VObject).DataSource.DataSet.EnableControls;
 end;
 Screen.Cursor := crDefault;
end;

procedure TForm_lining.BitBtn2Click(Sender: TObject);
begin
self.CopyDbDataToExcel([dbgrideh1],self.Caption);
end;

end.
