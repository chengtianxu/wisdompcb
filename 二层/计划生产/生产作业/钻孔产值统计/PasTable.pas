unit PasTable;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,common, ExtCtrls, Grids;

type
  TfrmTable = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnCancel: TBitBtn;
    sgTable: TStringGrid;
    btnExport: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
  private
    { Private declarations }
  public
    rkey25:string;
    { Public declarations }
  end;

var
  frmTable: TfrmTable;

implementation

uses DAMO;

{$R *.dfm}

procedure TfrmTable.FormShow(Sender: TObject);
var
  i:Integer;
begin
  sgTable.Cells[0,0]:='刀具';
  sgTable.Cells[1,0]:='符号';
  sgTable.Cells[2,0]:='成品孔径';
  sgTable.Cells[3,0]:='PHT';
  sgTable.Cells[4,0]:='公差';
  sgTable.Cells[5,0]:='钻咀';
  sgTable.Cells[6,0]:='PCS孔数';
  sgTable.Cells[7,0]:='SET孔数';
  sgTable.Cells[8,0]:='A板孔数';
  sgTable.Cells[9,0]:='B板孔数';
  sgTable.Cells[10,0]:='备注';

  with DM.adoTmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select SEQ_NR,MARK,HOLES_DIA,PTH,TOLERANCE,DRILL_DIA,UNIT,SET_UNMBER,PANEL_A,PANEL_B,REMARK FROM DATA0029 '+
              ' WHERE SOURCE_PTR= '+ rkey25 + ' order by rkey';
    Open;
    if not IsEmpty then
    begin
      i:=1;
      First;
      while not (UpperCase(FieldByName('UNIT').AsString)='TOTAL:') do
      begin
        sgTable.Cells[0,i]:=FieldByName('SEQ_NR').AsString;
        sgTable.Cells[1,i]:=FieldByName('MARK').AsString;
        sgTable.Cells[2,i]:=FieldByName('HOLES_DIA').AsString;
        sgTable.Cells[3,i]:=FieldByName('PTH').AsString;
        sgTable.Cells[4,i]:=FieldByName('TOLERANCE').AsString;
        sgTable.Cells[5,i]:=FieldByName('DRILL_DIA').AsString;
        sgTable.Cells[6,i]:=FieldByName('UNIT').AsString;
        sgTable.Cells[7,i]:=FieldByName('SET_UNMBER').AsString;
        sgTable.Cells[8,i]:=FieldByName('PANEL_A').AsString;
        sgTable.Cells[9,i]:=FieldByName('PANEL_B').AsString;
        sgTable.Cells[10,i]:=FieldByName('REMARK').AsString;
        i:=i+1;
        sgTable.RowCount:=sgTable.RowCount+1;
        Next;
      end;
      sgTable.Cells[6,i]:=FieldByName('UNIT').AsString;
      sgTable.Cells[8,i]:=FieldByName('PANEL_A').AsString;
    end;
  end;
end;

procedure TfrmTable.btnExportClick(Sender: TObject);
begin
  if  sgTable.RowCount>2 then
    if MessageDlg('你确定要导出数据吗？',mtInformation, [mbYes,mbNo],0)= mryes then
       Export_Grid_to_Excel(sgTable,frmTable.Caption);
end;

end.
