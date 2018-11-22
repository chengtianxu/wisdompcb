unit UQryCount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGridEh, ExtCtrls, StdCtrls, Buttons;

type
  TFrmQryCount = class(TForm)
    pnl1: TPanel;
    qry1: TADOQuery;
    ds1: TDataSource;
    wdstrngfldqry1DSDesigner: TWideStringField;
    intgrfldqry1DSDesigner2: TIntegerField;
    intgrfldqry1DSDesigner3: TIntegerField;
    intgrfldqry1DSDesigner4: TIntegerField;
    intgrfldqry1DSDesigner5: TIntegerField;
    intgrfldqry1DSDesigner6: TIntegerField;
    intgrfldqry1DSDesigner7: TIntegerField;
    Panel1: TPanel;
    dbgrdh1: TDBGridEh;
    btnExport: TBitBtn;
    lblFilter: TLabel;
    edtFilter: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure dbgrdh1TitleClick(Column: TColumnEh);
    procedure edtFilterChange(Sender: TObject);
  private
    { Private declarations }
    preColumn:TColumnEh;
  public
    { Public declarations }
  end;

var
  FrmQryCount: TFrmQryCount;

implementation
        uses PasDM,common;
{$R *.dfm}

procedure TFrmQryCount.FormShow(Sender: TObject);
begin
 IF  NOT qry1.Active  then qry1.Open;
 preColumn:= dbgrdh1.Columns[1];
end;

procedure TFrmQryCount.btnExportClick(Sender: TObject);
begin
  if not qry1.IsEmpty then
Export_dbGridEH_to_Excel(self.dbgrdh1,self.Caption);
end;

procedure TFrmQryCount.dbgrdh1TitleClick(Column: TColumnEh);
begin
   if (Column.FieldName <> preColumn.FieldName) and (Column.Field.DataType in [ftString,ftWideString]) then
  begin
    lblFilter.Caption:=Column.Title.Caption;
    Column.Title.Color:=clRed;
    preColumn.Title.Color:=clBtnFace;
    edtFilter.SetFocus;
    preColumn:=Column;
  end;

  edtFilter.SetFocus;

  if Column.Title.SortMarker= smUpEh then
  begin
    Column.Title.SortMarker:=smDownEh;
    qry1.Sort:= Column.FieldName + ' DESC ';
  end
  else
  begin
    Column.Title.SortMarker:=smUpEh;
    qry1.Sort:=Column.FieldName ;
  end;
end;

procedure TFrmQryCount.edtFilterChange(Sender: TObject);
begin
   qry1.Filtered:=True;
  if Trim(edtFilter.Text)='' then
    qry1.Filter:=''
  else
    qry1.Filter:= preColumn.FieldName + ' like %' + Trim(edtFilter.Text) + '%';
end;

end.
