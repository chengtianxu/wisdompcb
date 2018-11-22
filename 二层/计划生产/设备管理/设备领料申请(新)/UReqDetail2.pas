unit UReqDetail2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, DBGridEh, ComCtrls, StdCtrls, Buttons, ExtCtrls,
  DB, ADODB,common;

type
  TfrmReqDetail2 = class(TForm)
    pnl1: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    BtClose: TBitBtn;
    BtBrush: TBitBtn;
    Edit1: TEdit;
    BitBtn4: TBitBtn;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    DTPK1: TDateTimePicker;
    DTPk2: TDateTimePicker;
    BitBtn6: TBitBtn;
    Grd1: TDBGridEh;
    PopupMenu1: TPopupMenu;
    ds1: TDataSource;
    qry1: TADOQuery;
    procedure BtCloseClick(Sender: TObject);
    procedure BtBrushClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Grd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DTPK1Click(Sender: TObject);
    procedure DTPK1Exit(Sender: TObject);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
     PreColumn: TColumnEh;
    field_name:string;
  public
    { Public declarations }
  end;

var
  frmReqDetail2: TfrmReqDetail2;

implementation
  uses UDM;
{$R *.dfm}

procedure TfrmReqDetail2.BtCloseClick(Sender: TObject);
begin
close;
end;

procedure TfrmReqDetail2.BtBrushClick(Sender: TObject);
var
  i:integer;
begin
  if qry1.IsEmpty then exit;
  i := qry1.fieldbyname('rkey').AsInteger ;
  qry1.Close;
  qry1.Open;
  qry1.Locate('rkey',i,[]);
end;

procedure TfrmReqDetail2.BitBtn4Click(Sender: TObject);
begin
if Grd1.DataSource.DataSet.Active then
              if Grd1.DataSource.DataSet.RecordCount > 0 then
                  Export_dbGridEH_to_Excel(Grd1,'¡Ï¡œ√˜œ∏') ;
end;

procedure TfrmReqDetail2.BitBtn6Click(Sender: TObject);
begin
popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TfrmReqDetail2.Edit1Change(Sender: TObject);
begin
if Grd1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    Grd1.DataSource.DataSet.Filtered := True;
    if trim(Edit1.text) <> '' then
    begin
      if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        Grd1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
      else if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        Grd1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
    end else
      Grd1.DataSource.DataSet.Filter:='';
  end;
end;

procedure TfrmReqDetail2.Grd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(qry1.SQL.Text);
end;

procedure TfrmReqDetail2.DTPK1Click(Sender: TObject);
var
  lDate: TDateTime;
  datetmp:string;

begin
        qry1.Close;
        qry1.Parameters.ParamValues['dtpk1']:= dtpk1.Date;
        qry1.Parameters.ParamValues['dtpk2']:=dtpk2.Date+1;
        qry1.Open;
end;

procedure TfrmReqDetail2.DTPK1Exit(Sender: TObject);
var
  lDate: TDateTime;
  datetmp:string;

begin
  qry1.Close;
  qry1.Parameters.ParamValues['dtpk1']:= dtpk1.Date;
  qry1.Parameters.ParamValues['dtpk2']:=dtpk2.Date+1;
  qry1.Open;
end;

procedure TfrmReqDetail2.Grd1TitleClick(Column: TColumnEh);
begin
 if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
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

  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    label1.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    Edit1Change(Edit1);
  end else
    edit1.SetFocus;
end;

procedure TfrmReqDetail2.FormCreate(Sender: TObject);
begin
        dtpk2.Date:=common.getsystem_date(dm.qrytemp,1);
        dtpk1.Date:=dtpk2.Date-7;
        field_name:= Grd1.Columns[0].FieldName;
        PreColumn:=Grd1.Columns[0]
end;

end.
