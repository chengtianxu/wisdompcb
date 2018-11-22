unit QryWorkList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGridEh, ComCtrls;

type
  TfrmWork = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    eh06: TDBGridEh;
    btnCommit: TBitBtn;
    btnCancel: TBitBtn;
    lbl1: TLabel;
    edt1: TEdit;
    lbl2: TLabel;
    lbl3: TLabel;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    procedure eh06TitleClick(Column: TColumnEh);
    procedure eh06KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure edt1Change(Sender: TObject);
    procedure eh06DblClick(Sender: TObject);
  private

    { Private declarations }
  public
    preColumn:TColumnEh;
    { Public declarations }
  end;

var
  frmWork: TfrmWork;

implementation

uses DM,DB;

{$R *.dfm}

procedure TfrmWork.eh06TitleClick(Column: TColumnEh);
begin
  if (Column.Title.Caption<>preColumn.Title.Caption) and (Column.Field.DataType in [ftString,ftWideString]) then
  begin
    lbl1.Caption:=Column.Title.Caption;
    Column.Title.Color:=clRed;
    preColumn.Title.Color:=clBtnFace;
    edt1.SetFocus;
    preColumn:=Column;
    edt1.Text:= '';
  end;

  if Column.Title.SortMarker= smUpEh then
  begin
    Column.Title.SortMarker:=smDownEh;
    DM1.ads1.IndexFieldNames:=Column.FieldName + ' DESC';
  end
  else
  begin
    Column.Title.SortMarker:=smUpEh;
    DM1.ads1.IndexFieldNames:=Column.FieldName;
  end;
end;

procedure TfrmWork.eh06KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Char(Key)='V') and (ssAlt in Shift) then
  begin
    ShowMessage(DM1.ads1.CommandText);
  end;
end;

procedure TfrmWork.FormCreate(Sender: TObject);
begin
  preColumn:=eh06.Columns[0];
  lbl1.Caption:=preColumn.Title.Caption;
end;

procedure TfrmWork.edt1Change(Sender: TObject);
begin
  if Trim(edt1.Text)<>'' then
  begin
    dm1.ads1.Filtered:=False;
    dm1.ads1.Filter:=preColumn.FieldName + ' like ''%' + Trim(edt1.Text)+ '%''';
    dm1.ads1.Filtered:=True;
  end
  else
  begin
    dm1.ads1.Filter:='';
  end;
end;

procedure TfrmWork.eh06DblClick(Sender: TObject);
begin
  ModalResult:= mrOk;
end;

end.
