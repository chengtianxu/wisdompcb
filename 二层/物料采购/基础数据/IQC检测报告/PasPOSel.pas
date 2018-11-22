unit PasPOSel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons,DB, Grids, DBGridEh;

type
  TfrmPOSel = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnCommit: TBitBtn;
    btnCancel: TBitBtn;
    dbPO: TDBGridEh;
    lbFilter: TLabel;
    edtFilter: TEdit;
    procedure dbPOTitleClick(Column: TColumnEh);
    procedure edtFilterChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbPODblClick(Sender: TObject);
    procedure dbPOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    preColumn:TColumnEh;
    { Private declarations }
  public
    rkey71:Integer;
    { Public declarations }
  end;

var
  frmPOSel: TfrmPOSel;

implementation

uses DAMO;

{$R *.dfm}

procedure TfrmPOSel.dbPOTitleClick(Column: TColumnEh);
begin
  if (Column.Title.Caption<>preColumn.Title.Caption) and
     (Column.Field.DataType in [ftString,ftWideString]) then
  begin
    lbFilter.Caption:=Column.Title.Caption;
    Column.Title.Color:=clRed;
    preColumn.Title.Color:=clBtnFace;
    edtFilter.SetFocus;
    preColumn:=Column;
  end;

  if Column.Title.SortMarker= smUpEh then
  begin
    Column.Title.SortMarker:=smDownEh;
    DM.adoPO.Sort:=Column.FieldName + ' DESC';
  end
  else
  begin
    Column.Title.SortMarker:=smUpEh;
    DM.adoPO.Sort:=Column.FieldName;
  end;
end;

procedure TfrmPOSel.edtFilterChange(Sender: TObject);
begin
  if Trim(edtFilter.Text)<>'' then
  begin
    DM.adoPO.Filtered:=False;
    DM.adoPO.Filter:=preColumn.FieldName + ' like ''%' + Trim(edtFilter.Text)+ '%''';
    DM.adoPO.Filtered:=True;
  end
  else
  begin
    DM.adoPO.Filter:='';
  end;
end;

procedure TfrmPOSel.FormShow(Sender: TObject);
begin
  preColumn:=dbPO.Columns[0];
  lbFilter.Caption:=preColumn.Title.Caption;
  DM.adoPO.Close;
  DM.adoPO.Open;
  DM.adoPO.Sort:='PO_NUMBER';
  DM.adoPO.Filter:='';
  if rkey71 > 0 then DM.adoPO.Locate('rkey',rkey71,[])
end;

procedure TfrmPOSel.dbPODblClick(Sender: TObject);
begin
  ModalResult:=mrYes;
end;

procedure TfrmPOSel.dbPOKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Char(Key)='V') and (ssAlt in Shift) then
  begin
    ShowMessage(DM.adoPO.CommandText);
  end;
end;

procedure TfrmPOSel.FormCreate(Sender: TObject);
begin
  rkey71:=0;
end;

end.
